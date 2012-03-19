require 'spec_helper'

describe "donations/show" do
  before(:each) do
    @donation = assign(:donation, stub_model(Donation))
  end

  it "renders attributes in <p>" do
    render
  end
end
