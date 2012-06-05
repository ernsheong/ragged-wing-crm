class Organization < ActiveRecord::Base
	has_many :members, :dependent => :destroy
	has_many :people, :through => :members
	has_many :donations
	belongs_to :address
	belongs_to :person
	validates_presence_of :name

	def self.org_types
		["Foundation", "Arts Organization", "Corporation", 
			"Public Entity", "Private Entity"]
	end

	def self.filter(option)
    if option.blank?
      return Organization.all
    end 
    Organization.all( :conditions => {:org_type => option} )
	end

end
