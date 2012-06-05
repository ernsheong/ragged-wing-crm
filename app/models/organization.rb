class Organization < ActiveRecord::Base
	has_many :members, :dependent => :destroy
	has_many :people, :through => :members
	has_many :donations
	belongs_to :address
	belongs_to :person
	before_validation :smart_add_url_protocol
	validates :website, :format => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix
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

	protected
	
	def smart_add_url_protocol
	  unless self.website.blank? or self.website[/^(http|https):\/\//]
	    self.website = 'http://' + self.website
	  end
	end

end
