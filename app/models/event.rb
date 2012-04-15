class Event < ActiveRecord::Base

  validates_presence_of :name, :message => "must have a name!"

  def self.event_list
    [ 'Donor Event', 'Fundraiser', 'Workshop Youth', 'Workshop Adult', 'Class Youth', 'Class Adult', 
      'Performance Youth Ensemble', 'Performance Main Stage', 'Performance One Acts', 'Performance Festival', 
      'Performance Traveling', 'Other']
  end

  def self.filter(year)
  	if year.blank?
      return Event.all
    end
    Event.find(:all, :conditions => ["strftime('%Y', date) = ?", year])
  end
end
