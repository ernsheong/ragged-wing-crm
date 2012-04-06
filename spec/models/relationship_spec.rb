require 'spec_helper'

describe Relationship do
  describe ".internal" do 
  	it "should return a sorted Array of internal relationships" do 
  		Relationship.internal.should eq(["Audience", "Contributing Artist", "Core Artist", "Donor", "Employee", "Partner", "Volunteer"])
  	end
  end

  describe ".external" do
  	it "should return a sorted Array of external relationships" do 
  		Relationship.external.should eq(["Business Partner", "Collaborator", "Consultant", "Contract Worker", "Other"])
  	end
  end

  describe ".list" do 
  	it "should return a sorted Array of all the relationships" do
  		Relationship.list.should eq(["Audience", "Business Partner", "Collaborator", "Consultant", "Contract Worker", 
  			"Contributing Artist", "Core Artist", "Donor", "Employee", "Other", "Partner", "Volunteer"])
  	end
  end
end
