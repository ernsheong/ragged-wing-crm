require 'spec_helper'

describe "donations/show" do
  before(:each) do
    @donation = assign(:donation, stub_model(Donation))
    @donation.stub(:date).and_return(Date.parse('2012-02-02'))
    @person = mock_model(Person)
    @person.stub(:id).and_return("1")
    @person.stub(:first_name).and_return("Bob")
    @person.stub(:last_name).and_return("Hu")
    @donation.stub(:donor).and_return(@person)
  end

  it "renders attributes in <p>" do
    render
  end
end
