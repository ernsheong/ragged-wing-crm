require 'spec_helper'

describe "contacts/show" do
  before(:each) do
    @contact = assign(:contact, stub_model(Contact))
  end

  it "renders attributes in <p>" do
    render
  end
end
