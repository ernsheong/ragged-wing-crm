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
    q = q.downcase
    results = Person.where("lower(first_name) LIKE ? OR lower(last_name) LIKE ?", "%#{q}%", "%#{q}%").all
    results << Person.find_all_by_full_name(q)
    results.flatten.uniq
  end

  # searches for all persons with the full name in small case
  def self.find_all_by_full_name(value)
    name = value.split(/\s+/)
    first_name = name[0]
    last_name = name[1]
    Person.where("lower(first_name) LIKE ? AND lower(last_name) LIKE ?", "%#{first_name}%", "%#{last_name}%").all
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
  
end
