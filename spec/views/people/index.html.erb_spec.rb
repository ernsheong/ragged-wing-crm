require 'spec_helper'

describe "people/index" do
  before(:each) do
  	PeopleController.any_instance.stub(:sort_column).and_return(false)
  	PeopleController.any_instance.stub(:sort_direction).and_return(false)
    assign(:people, [
      stub_model(Person),
      stub_model(Person)
    ])
  end

  it "renders a list of people" do
    # render
  end
end
