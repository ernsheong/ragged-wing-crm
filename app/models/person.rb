class Person < ActiveRecord::Base
	belongs_to :address1, :class_name => 'Address', :foreign_key => "address_id_1"
	belongs_to :address2, :class_name => 'Address', :foreign_key => "address_id_2"
	has_many :organizations, :through => :members
	has_many :relationships, :dependent => :destroy #delete relationship in Relationship table if person deleted
	has_many :donations

	def self.search(q)
		q = q.downcase
		results = Person.where("lower(first_name) = ? or lower(last_name) = ?", q, q)
		results << Person.find_all_by_full_name(q)
		results.flatten
	end

	def self.find_all_by_full_name(value)
		name = value.split(/\s+/)
		first_name = name[0]
		last_name = name[1]
		Person.where("lower(first_name) = ? AND lower(last_name) = ?", first_name, last_name).all
	end
end
