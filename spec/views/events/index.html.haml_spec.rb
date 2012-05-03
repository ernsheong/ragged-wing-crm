require 'spec_helper'

describe "events/index" do
  before(:each) do
    EventsController.any_instance.stub(:sort_column).and_return(false)
    EventsController.any_instance.stub(:sort_direction).and_return(false)
    assign(:events, [
      stub_model(Event,
        :name => "Name",
        :event_type => "Type",
        :description => "Description",
        :date => Date.parse("2012-01-01"), 
        :start_time => Time.now, 
        :end_time => Time.now + 1.hour
      ),
      stub_model(Event,
        :name => "Name",
        :event_type => "Type",
        :description => "Description",
        :date => Date.parse("2012-01-01"), 
        :start_time => Time.now, 
        :end_time => Time.now + 1.hour
      )
    ])
  end

  it "renders a list of events" do
    # @events = Event.all
    # @years = (2005..Time.now.year).entries
    # render
    # # Run the generator again with the --webrat flag if you want to use webrat matchers
    # assert_select "tr>td", :text => "Name".to_s, :count => 2
    # assert_select "tr>td", :text => "Type".to_s, :count => 2
    # assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
