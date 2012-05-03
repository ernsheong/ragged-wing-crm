class Member < ActiveRecord::Base
  belongs_to :person
  belongs_to :organization
  validates_uniqueness_of :person_id, :scope => [:organization_id]
end
