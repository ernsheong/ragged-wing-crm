require 'spec_helper'

describe "donations/index" do
  before(:each) do
    @person = mock_model(Person)
    @donation = mock_model(Donation)
    Donation.stub(:find).and_return(@donation)
    @donation.stub(:donor).and_return(@person)
    @donation.stub(:date).and_return(Date.parse('2012-02-02'))
    @person.stub(:id).and_return("1")
    @person.stub(:first_name).and_return("Bob")
    @person.stub(:last_name).and_return("Hu")
    assign(:donations, [
      @donation,
      @donation
    ])
  end

  it "renders a list of donations" do
    render
  end
end
