class Address < ActiveRecord::Base
	has_many :organizations
	has_many :people
end
