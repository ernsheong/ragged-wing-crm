require 'spec_helper'

feature "Organization" do

  background do
    Organization.create!( name: "Org A", org_type: "Foundation" )
    Organization.create!( name: "Org B", org_type: "Arts Organization" )
    Organization.create!( name: "Org C", org_type: "Corporation" )
    Organization.create!( name: "Org D", org_type: "Public Entity" )
    Organization.create!( name: "Org E", org_type: "Foundation" )
  end

  scenario "view all organizations" do
    visit '/organizations'
    within_table "table" do 	
  	  page.should have_content "Org A"
  	  page.should have_content "Org B"
  	  page.should have_content "Org C"
  	  page.should have_content "Org D"
  	  page.should have_content "Org E"
  	end
  end

  scenario "filter organizations by type" do 
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

end