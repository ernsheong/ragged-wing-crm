require 'spec_helper'

describe "people/index" do
  before(:each) do
    assign(:people, [
      stub_model(Person),
      stub_model(Person)
    ])
  end

  it "renders a list of people" do
    render
  end
end
