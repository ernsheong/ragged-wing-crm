require 'google_chart'
require 'csv'

class Person < ActiveRecord::Base
  belongs_to :address1, :class_name => 'Address', :foreign_key => "address_id_1"
  belongs_to :address2, :class_name => 'Address', :foreign_key => "address_id_2"
  has_many :organizations, :through => :members
  has_many :relationships, :dependent => :destroy, :autosave => true  # delete relationship in Relationship table if person deleted
  has_many :donations
  has_many :notes, :dependent => :destroy
  validates_presence_of :first_name, :message => "must have a first name!"
  validates_presence_of :last_name, :message => "must have a last name!"

  def self.search(q)
    if q
      q = q.downcase
      results = Person.where("lower(first_name) LIKE ? OR lower(last_name) LIKE ?", "%#{q}%", "%#{q}%")
      results << Person.find_all_by_full_name(q)
      results.flatten.uniq
    else 
      Person.all
    end
  end

  # searches for all persons with the full name in small case
  def self.find_all_by_full_name(value)
    name = value.split(/\s+/)
    first_name = name[0]
    last_name = name[1]
    Person.where("lower(first_name) LIKE ? AND lower(last_name) LIKE ?", "%#{first_name}%", "%#{last_name}%")
  end

  def fullname
    [first_name, last_name].join(" ")
  end

  def has_relationship?(name)
    self.relationships.each do |rel|
        if rel.name == name
            return true
        end
    end
    false
  end


  def relationship_list
    list = []
    self.relationships.each do |rel|
      list << rel.name
    end
    list.sort
  end


  def save_relationships(update)
    if update.nil?
      self.relationships.each do |elt|
        Relationship.destroy(elt.id)
      end
      return
    end

    # add relationships if no relationships

    # remove relationships not in update
    # - run through all existing relationships
    # - if relationship does not exist in update, delete

    if self.relationships(true).nil?
      update.each do |elt|
        Relationship.create!(:person_id => self.id, :name => elt)
      end
      return 
    else
      self.relationships.each do |elt|
        unless update.include?(elt.name)
          Relationship.destroy(elt.id)
        end
      end
    end

    # reload cache
    self.relationships(true)

    # add relationships in update that are not already existing
    # - run through relationships in update
    # - if it is not already in DB create new relationships
    update.each do |elt|
      unless self.relationship_list.include? elt
        Relationship.create!(:person_id => self.id, :name => elt)
      end
    end

    # reload cache
    self.relationships(true)
  end


  # prints relationships in alphabetical order
  def print_relationships
    result = []
    self.relationships.each do |elt|
      result << elt.name
    end
    result.sort.join(', ')
  end

  def create_note(update)
    if update.nil?
      Note.create!(:person_id => self.id, :body => "")
      return
    end

    Note.create!(:person_id => self.id, :body => update[:body])
  end

  def print_notes
    self.notes.first.body
  end

  def self.filter(relationship)
    if relationship.blank?
      return Person.all
    end 
    Person.all(:joins => :relationships, :conditions => {:relationships => { :name => relationship }})
  end

  def get_donations_between_dates(start_date, end_date)
    self.donations.find_all do |elt|
      elt.date > start_date && elt.date < end_date
    end
  end
  
  def graph_donations_by_year(person)
    @donations = Donation.where(:person_id => person)
    if not @donations.empty?
      @donations_by_date = @donations.order("date")              
      earliest_date = @donations_by_date.first.date.year
      latest_date = @donations_by_date.last.date.year
      data = Hash.new(0)            
      @donations_by_date.each do |donation|
        data[donation.date.year] += donation.amount                
      end                 
      (earliest_date..latest_date).each do |year|
        if data[year] == 0
          data[year] = 0
        end
      end
      data = Hash[data.sort]
      max_donation = data.values.max
      bc = GoogleChart::BarChart.new('600x350', "", :vertical, false)      
      bc.data "donations", data.values, '0000ff'      
      bc.axis :x, :range => [earliest_date, latest_date], :color => '00ffff', :font_size => 16         
      bc.axis :y, :range => [0,max_donation], :color => 'ff00ff', :font_size => 16          
      bc.width_spacing_options(:bar_width => 40, :bar_spacing => 100)      
      bc.show_legend = false;               
      @graph = bc.to_url
    end
  end
  
  def donation_freq_by_year(person)
    @donations = Donation.where(:person_id => person)
    if not @donations.empty?
      @donations_by_date = @donations.order("date")              
      earliest_date = @donations_by_date.first.date.year
      latest_date = @donations_by_date.last.date.year
      data = Hash.new(0)            
      @donations_by_date.each do |donation|
        data[donation.date.year] += 1                
      end                 
      (earliest_date..latest_date).each do |year|
        if data[year] == 0
          data[year] = 0
        end
      end      
      data = Hash[data.sort]      
      max_freq = data.values.max
      bc = GoogleChart::BarChart.new('600x350', "", :vertical, false)      
      bc.data "donations", data.values, '0000ff'      
      bc.axis :x, :range => [earliest_date, latest_date], :color => '00ffff', :font_size => 16         
      bc.axis :y, :range => [0,max_freq], :color => 'ff00ff', :font_size => 16
      bc.width_spacing_options(:bar_width => 40, :bar_spacing => 100)            
      bc.show_legend = false;               
      @graph = bc.to_url
    end
  end
  
  def self.generate_people_csv
    CSV.open("public/people.csv", "wb") do |csv|
      csv << ["Name", "Title", "Role", "Email1", "Email2", "Cell Phone", "Home Phone", "Work Phone", 
        "Address1", "Address2", "Website1", "Website2", "Company"]
      Person.find(:all).each do |p|
        csv << [p.first_name + " " + p.last_name, p.title, p.role, p.email1, p.email2, p.phone_cell,
          p.phone_home, p.phone_office, p.address1, p.address2, p.website1, p.website2, p.company]
      end
    end
  end
end
