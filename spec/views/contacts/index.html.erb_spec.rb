require 'spec_helper'

describe "contacts/index" do
  before(:each) do
    assign(:contacts, [
      stub_model(Contact),
      stub_model(Contact)
    ])
  end

  it "renders a list of contacts" do
    render
  end
end
