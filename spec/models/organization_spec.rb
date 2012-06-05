require 'spec_helper'

describe Organization do

	before :each do 
		@org1 = FactoryGirl.create( :organization, name: "Org A", org_type: "Foundation" )
    FactoryGirl.create( :organization, name: "Org B", org_type: "Arts Organization" )
    FactoryGirl.create( :organization, name: "Org C", org_type: "Corporation" )
	end

  describe "organization.filter" do 
  	
  	it "should filter the selected type of organization" do 
  		Organization.filter("Foundation").should == [@org1]
  	end

  end
end
