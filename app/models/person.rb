class Person < ActiveRecord::Base
	belongs_to :address1, :class_name => 'Address', :foreign_key => "address_id_1"
	belongs_to :address2, :class_name => 'Address', :foreign_key => "address_id_2"
	has_many :organizations, :through => :members
	has_many :relationships

	# q is a hash of length 1, with key -> category, value -> search term
	def self.search(q)
		query = q.values[0]
		case q.keys[0]
		when 'full_name'
			Person.find_all_by_full_name(query)
		when 'first_name'
			Person.find_all_by_first_name(query) # AR method
		when 'last_name'
			Person.find_all_by_last_name(query) #AR method
		else 
			nil
		end
	end

	def self.find_all_by_full_name(value)
		name = value.split(/\s+/)
		Person.where(:first_name => name[0], :last_name => name[1])
	end
end
