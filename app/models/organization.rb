class Organization < ActiveRecord::Base
	has_many :people, :through => :members
	has_many :donations
	belongs_to :address
	belongs_to :person

	def self.org_types
		["Foundation", "Arts Organization", "Corporation", 
			"Public Entity", "Private Entity"]
	end

end
