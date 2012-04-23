class Note < ActiveRecord::Base
	belongs_to :person
	attr_accessible :body, :person_id
end
