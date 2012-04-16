require 'spec_helper'

describe "events/show" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :name => "Name",
      :type => "Type",
      :description => "Description",
      :date => Date.parse("2012-01-01"), 
      :start_time => Time.now, 
      :end_time => Time.now + 1.hour
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Type/)
    rendered.should match(/Description/)
  end
end
