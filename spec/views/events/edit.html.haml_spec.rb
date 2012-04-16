require 'spec_helper'

describe "events/edit" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :name => "MyString",
      :event_type => "",
      :description => "Description",
      :date => Date.parse("2012-01-01"), 
      :start_time => Time.now, 
      :end_time => Time.now + 1.hour
    ))
  end

  it "renders the edit event form" do
    @events = Event.event_list
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    #assert_select "form", :action => events_path(@event), :method => "post" do
    #  assert_select "input#event_name", :name => "event[name]"
    #  assert_select "input#event_type", :name => "event[type]"
    #  assert_select "input#event_description", :name => "event[description]"
    #end
  end
end
