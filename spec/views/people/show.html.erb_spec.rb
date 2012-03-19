require 'spec_helper'

describe "people/show" do
  before(:each) do
    @person = assign(:person, stub_model(Person))
  end

  it "renders attributes in <p>" do
    render
  end
end
