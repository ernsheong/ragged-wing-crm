require 'spec_helper'

describe "donations/index" do
  before(:each) do
    assign(:donations, [
      stub_model(Donation),
      stub_model(Donation)
    ])
  end

  it "renders a list of donations" do
    render
  end
end
