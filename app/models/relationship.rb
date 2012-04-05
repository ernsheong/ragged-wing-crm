class Relationship < ActiveRecord::Base
	belongs_to :person

	attr_accessible :person_id, :name

	def self.internal
		['Core Artist', 'Contributing Artist', 'Volunteer', 'Donor', 'Audience', 'Partner', 'Employee']
	end

	def self.external
		['Collaborator', 'Business Partner', 'Contract Worker', 'Consultant', 'Other']
	end

	def self.list
		list = self.external + self.internal
		list.sort
	end
end
