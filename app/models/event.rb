class Event < ActiveRecord::Base

  def self.event_list
    [ 'Donor Event', 'Fundraiser', 'Workshop Youth', 'Workshop Adult', 'Class Youth', 'Class Adult', 
      'Performance Youth Ensemble', 'Performance Main Stage', 'Performance One Acts', 'Performance Festival', 
      'Performance Traveling', 'Other']
  end
end
