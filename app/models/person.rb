class Person < ActiveRecord::Base
	belongs_to :address1, :class_name => 'Address', :foreign_key => "address_id_1"
	belongs_to :address2, :class_name => 'Address', :foreign_key => "address_id_2"
	has_many :organizations, :through => :members
	has_many :relationships
end
