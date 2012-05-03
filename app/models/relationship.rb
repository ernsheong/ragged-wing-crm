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

	  # returns a hash of { Relationship Name : Count } 
  def self.count_relationships
    result = {}
    Relationship.list.each do |rel|
    	result[rel] = Relationship.where(:name => rel).count
    end
    result
  end
end
