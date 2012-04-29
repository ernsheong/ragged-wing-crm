require 'csv'

class Donation < ActiveRecord::Base
	belongs_to :donor, :class_name => 'Person', :foreign_key => "person_id"
	belongs_to :point_of_contact, :class_name => 'Person', :foreign_key => "point_of_contact_id"
	belongs_to :organization
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
      csv << ["Donor", "Amount", "Date", "Payment Method", "Campaign", "Solicitation Method"]
      Donation.find(:all).each do |d|
        if d.donor        
          csv << [d.donor.first_name + " " + d.donor.last_name, d.amount, d.date, d.payment_method, d.campaign, d.solicitation_method]
        elsif d.organization
          csv << [d.organization.named.amount, d.date, d.payment_method, d.campaign, d.solicitation_method]
        end        
      end
    end    
  end    
end
