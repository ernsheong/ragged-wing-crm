require 'spec_helper'

describe "lists/edit" do
  before(:each) do
    @list = assign(:list, stub_model(List))
  end

  it "renders the edit list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lists_path(@list), :method => "post" do
    end
  end
end
