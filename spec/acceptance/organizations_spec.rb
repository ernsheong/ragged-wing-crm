require 'spec_helper'

feature "Organization" do
  background do
    FactoryGirl.create( :organization, name: "Org A", org_type: "Foundation" )
    FactoryGirl.create( :organization, name: "Org B", org_type: "Arts Organization" )
    FactoryGirl.create( :organization, name: "Org C", org_type: "Corporation" )
    FactoryGirl.create( :organization, name: "Org D", org_type: "Public Entity" )
    FactoryGirl.create( :organization, name: "Org E", org_type: "Foundation" )
  end

  it "should view all organizations" do
    visit '/organizations'
    within_table "table" do 	
  	  page.should have_content "Org A"
  	  page.should have_content "Org B"
  	  page.should have_content "Org C"
  	  page.should have_content "Org D"
  	  page.should have_content "Org E"
  	end
  end

  it "should filter organizations by type" do 
  	visit '/organizations'
  	page.select 'Foundation', :from => 'filter'
  	click_on "Update Listing"
  	within_table "table" do 
  		page.should have_content "Org A"
  		page.should have_content "Org E"
  		page.should_not have_content "Org B"
  		page.should_not have_content "Org C"
  		page.should_not have_content "Org D"
  	end
  end

  context "should validate organization URL" do 
    it "appends http://" do 
      visit '/organizations'
      click_on "Org A"
      click_on "Edit Details"
      fill_in "Website", :with => "berkeley.edu"
      click_on "Update Organization"
      page.should have_link "http://berkeley.edu"
    end

    it "handles www" do
      visit '/organizations'
      click_on "Org A"
      click_on "Edit Details"
      fill_in "Website", :with => "www.berkeley.edu"
      click_on "Update Organization"
      page.should have_link "http://www.berkeley.edu"
    end

    it "does fine with http://" do 
      visit '/organizations'
      click_on "Org A"
      click_on "Edit Details"
      fill_in "Website", :with => "http://www.berkeley.edu"
      click_on "Update Organization"
      page.should have_link "http://www.berkeley.edu"
    end

  end

end