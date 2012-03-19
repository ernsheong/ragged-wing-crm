class Organization < ActiveRecord::Base
	has_many :people, :through => :members
	belongs_to :address
	belongs_to :person
end
