class Donation < ActiveRecord::Base
	belongs_to :donor, :class_name => 'Person', :foreign_key => "person_id"
	belongs_to :point_of_contact, :class_name => 'Person', :foreign_key => "point_of_contact_id"
	belongs_to :organization

	def self.search_by_specific_amount(amount)
		Donation.where("amount = ?", amount).all
	end

	def self.search_by_range_amount(min, max)
		Donation.where("amount between ? and ?", min, max).all
	end

	def self.total_amount(donations)
		donations.inject do |sum, elt|
      sum + elt.amount
    end
  end

end
