class Relationship < ActiveRecord::Base
	belongs_to :person

	attr_accessible :person_id, :name

	def self.internal
		["Audience", "Contributing Artist", "Core Artist", "Donor", "Employee", "Partner", "Volunteer"]
	end

	def self.external
		["Business Partner", "Collaborator", "Consultant", "Contract Worker", "Other"] 
	end

	def self.list
		list = self.external + self.internal
		list.sort
	end
end
