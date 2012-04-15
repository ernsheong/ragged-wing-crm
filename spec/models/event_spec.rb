require 'spec_helper'

describe Event do
	before(:each) do 
		@event = Event.create!(:name => "Fundraiser", :date => Date.parse("2012-01-01"), 
  		:start_time => Time.now, :end_time => Time.now + 1.hour)
  	@event1 = Event.create!(:name => "Class", :date => Date.parse("2011-01-01"), 
  		:start_time => Time.now, :end_time => Time.now + 1.hour)
  	@event2 = Event.create!(:name => "Performance", :date => Date.parse("2010-01-01"), 
  		:start_time => Time.now, :end_time => Time.now + 1.hour)
  end

  describe ".filter" do 
  	it "should filter events according to year" do 
  		Event.filter('2012').should eq([@event])
  		Event.filter('2011').should eq([@event1])
  		Event.filter('2010').should eq([@event2])
  	end
  end

end
