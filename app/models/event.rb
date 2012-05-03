class Event < ActiveRecord::Base

  validates_presence_of :name, :message => "must have a name!"
  validates_presence_of :date

  def self.event_list
    [ 'Donor Event', 'Fundraiser', 'Workshop Youth', 'Workshop Adult', 'Class Youth', 'Class Adult', 
      'Performance Youth Ensemble', 'Performance Main Stage', 'Performance One Acts', 'Performance Festival', 
      'Performance Traveling', 'Other']
  end

  def self.filter(year, event)
  	if year.blank? && event.blank?
      return Event.all
    elsif year && event.blank?
      return Event.find(:all, :conditions => ["strftime('%Y', date) = ?", year])
    elsif year.blank? && event
      return Event.find(:all, :conditions => ["event_type like ?", "#{event}%"])
    else
      return Event.find(:all, :conditions => ["strftime('%Y', date) = ? AND event_type like ?", year, "#{event}%"])
    end
  end

  def self.event_types
    [ 'Donor Events', 'Fundraisers', 'Workshops', 'Classes', 'Performances', 'Other' ]
  end
end
