require 'spec_helper'

describe "lists/new" do
  before(:each) do
    assign(:list, stub_model(List).as_new_record)
  end

  it "renders new list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lists_path, :method => "post" do
    end
  end
end
