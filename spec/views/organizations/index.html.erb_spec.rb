require 'spec_helper'

describe "organizations/index" do
  before(:each) do
    # OrganizationsController.any_instance.stub(:sort_column).and_return(false)
    # OrganizationsController.any_instance.stub(:sort_direction).and_return(false)
    # assign(:organizations, [
    #   stub_model(Organization,
    #     :name => "Name",
    #     :person => 1,
    #     :address => 2,
    #     :website => "Website",
    #     :org_type => "Org Type"
    #   ),
    #   stub_model(Organization,
    #     :name => "Name",
    #     :person => 1,
    #     :address => 2,
    #     :website => "Website",
    #     :org_type => "Org Type"
    #   )
    # ])
  end

  it "renders a list of organizations" do
    # render
    # # Run the generator again with the --webrat flag if you want to use webrat matchers
    # assert_select "tr>td", :text => "Name".to_s, :count => 2
    # assert_select "tr>td", :text => 1.to_s, :count => 2
    # assert_select "tr>td", :text => 2.to_s, :count => 2
    # assert_select "tr>td", :text => "Website".to_s, :count => 2
    # assert_select "tr>td", :text => "Org Type".to_s, :count => 2
  end
end
