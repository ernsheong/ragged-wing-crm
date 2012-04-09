require 'spec_helper'

describe "donations/index" do
  before(:each) do
    assign(:donations, [
      stub_model(Donation),
      stub_model(Donation)
    ])
    @person = mock_model(Person)
    @donation = mock_model(Donation)
    Donation.stub(:find).and_return(@donation)
    @donation.stub(:donor).and_return(@person)
    @person.stub(:id).and_return("1")
    @person.stub(:first_name).and_return("Bob")
    @person.stub(:last_name).and_return("Hu")
  end

  it "renders a list of donations" do
    render
  end
end
