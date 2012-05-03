require 'csv'

class Donation < ActiveRecord::Base
	belongs_to :donor, :class_name => 'Person', :foreign_key => "person_id"
	belongs_to :point_of_contact, :class_name => 'Person', :foreign_key => "point_of_contact_id"
	belongs_to :organization
  belongs_to :campaign
  validates_presence_of :amount, :date

	def self.search_by_specific_amount(amount)
		Donation.where("amount = ?", amount).all
	end

	def self.search_by_range_amount(min, max)
    min = 0 if min.blank?
    max = Donation.maximum('amount') if max.blank?
		Donation.where("amount between ? and ?", min, max).all
	end

	def self.total_amount(donations)
		donations.inject(0) do |sum, elt|
      sum + elt.amount
    end
  end

  def self.get_donations_between_dates(start_date, end_date)
    start_date = Donation.minimum('date') if start_date.blank?
    end_date = Donation.maximum('date') if end_date.blank?
    Donation.where("date between ? and ?", start_date, end_date).all
  end

  # returns an array of person_ids 
  def self.search_people_by_range_amount(min,max)
    donations = Donation.search_by_range_amount(min, max)
    result = []
    donations.each do |don|
      result << don.person_id
    end
    result.uniq.sort
  end

  def self.filter_donations(min, max, start_date, end_date)       
    min = 0 if min.blank?
    max = Donation.maximum('amount') if max.blank?
    
    if start_date.blank?
      start_date = Donation.minimum('date') 
    else
      start_date = Date.strptime(start_date, '%Y-%m-%d')
    end
    if end_date.blank?
      end_date = Donation.maximum('date') 
    else
      end_date = Date.strptime(end_date, '%Y-%m-%d')
    end
    Donation.where("amount between ? and ? AND date between ? and ?", min, max, start_date, end_date).all
  end   
  
  def self.generate_donation_csv
    CSV.open("public/donations.csv", "wb") do |csv|
      csv << ["Donor", "Donor Email", "Amount", "Date", "Payment Method", "Solicitation Method", 
        "Campaign Name", "Campaign Description", "Point of Contact (within RWE)"]
      Donation.find(:all).each do |d|
        if d.donor        
          name = d.donor.first_name + " " + d.donor.last_name
          point_of_contact = Person.where(:id => d.point_of_contact_id)
          if not point_of_contact.empty?
            point_of_contact = point_of_contact.first
            point_of_contact = point_of_contact.first_name + " " + point_of_contact.last_name
          else
            point_of_contact = ""
          end
          campaign_name = d.campaign.name unless d.campaign == nil
          campaign_description = d.campaign.description unless d.campaign == nil 
          csv << [name, d.donor.email1, d.amount, d.date, d.payment_method, d.solicitation_method, campaign_name, 
            campaign_description, point_of_contact]
        elsif d.organization
          point_of_contact = Person.where(:id => d.organization.person_id)
          point_of_contact = point_of_contact.empty? ? "" : point_of_contact.email1
          csv << [d.organization.name, point_of_contact, d.amount, d.date, d.payment_method, d.solicitation_method, d.campaign]
        end        
      end
    end    
  end
  
  # Returns array with first element "Person" or "Organization" and second element the ID
  # ["Person", 1]
  def self.parse_for_donor(name, email) 
    o = Organization.where(:name => name)
    if not o.empty?
      ["Organization", o.first.id]            
    else      
      name = name.split(" ")      
      d = Person.where(:first_name => name[0], :last_name => name[1], :email1 => email)
      if not d.empty?
        ["Person", d.first.id]      
      else
        ["Donor not found"]
      end
    end
  end  
  
  def self.parse_for_campaign(name, description)
    c = Campaign.where(:name => name, :description => description)
    if not c.empty?
      c.first.id
    else
      0       
    end
  end
  
  def self.parse_for_point_of_contact(name)    
    if name
      name = name.split(" ")
      contact = Person.where(:first_name => name[0], :last_name => name[1])
      if not contact.empty?
        return contact.first.id
      end              
    end
    0
  end
  
  def self.import_donations(file)
    if file == nil
      return "Please provide a file and try again."
    end
    begin 
      message = ""
      File.open("public/donationtemp.csv", "wb") { |f| f.write(file.read) }
      csv_text = File.read("public/donationtemp.csv")
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        row = row.to_hash.with_indifferent_access
        params = Hash.new                
        donor = parse_for_donor(row["Donor"], row["Donor Email"])        
        if donor[0] == "Person"          
          params["person_id"] = donor[1] 
        elsif donor[1] == "Organization"
          params["organization_id"] = donor[1]
        else
          message << row["Donor"] + " was not found in list of People or Organizations.\n"
        end
        params["date"] = Date.strptime(row["Date"], "%Y-%m-%d")
        params["amount"] = row["Amount"]
        params["payment_method"] = row["Payment Method"]
        params["solicitation_method"] = row["Solicitation Method"]
        params["payment_method"] = row["Payment Method"]
        params["campaign_id"] = parse_for_campaign(row["Campaign Name"], row["Campaign Description"])
        params["point_of_contact_id"] = parse_for_point_of_contact(row["Point of Contact (within RWE)"])        
        Donation.create!(params.symbolize_keys)            
      end
      File.delete("public/donationtemp.csv")
      return message = file.original_filename + "'s contents were imported successfully."      
    rescue ActiveRecord::UnknownAttributeError      
      return message = "Please double check the headers in your CSV file and try again."           
    #rescue ActiveRecord::
    end         
    "Import Failed."
  end

end
