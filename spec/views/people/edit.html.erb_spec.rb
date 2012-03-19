require 'spec_helper'

describe "people/edit" do
  before(:each) do
    @person = assign(:person, stub_model(Person))
  end

  it "renders the edit person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => people_path(@person), :method => "post" do
    end
  end
end
