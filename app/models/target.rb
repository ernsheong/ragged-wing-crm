class Target < ActiveRecord::Base
  belongs_to :person
  belongs_to :campaign
  validates_uniqueness_of :person_id, :scope => [:campaign_id]
end
