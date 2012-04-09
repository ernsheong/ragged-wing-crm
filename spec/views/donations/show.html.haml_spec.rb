require 'spec_helper'

describe "donations/show" do
  before(:each) do
    @donation = assign(:donation, stub_model(Donation))
    @person = mock_model(Person)
    @person.stub(:id).and_return("1")
    @person.stub(:first_name).and_return("Bob")
    @person.stub(:last_name).and_return("Hu")
  end

  it "renders attributes in <p>" do
    render
  end
end
