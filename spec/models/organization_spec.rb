require 'spec_helper'

describe Organization do

	before :each do 
		@org1 = Organization.create!( name: "Org A", org_type: "Foundation" )
    Organization.create!( name: "Org B", org_type: "Arts Organization" )
    Organization.create!( name: "Org C", org_type: "Corporation" )
	end

  describe "organization.filter" do 
  	
  	it "should filter the selected type of organization" do 
  		Organization.filter("Foundation").should == [@org1]
  	end

  end
end
