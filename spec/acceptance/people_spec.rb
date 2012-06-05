require 'spec_helper'

feature "People" do
  background do
    FactoryGirl.create(:person)
  end

  context "when entering websites" do 
    it "should append http://" do 
      visit '/people'
      click_on "John Doe"
      click_on "Edit Person"
      fill_in "person_website1", :with => "something1.com"
      fill_in "person_website2", :with => "something2.com"
      fill_in "person_website3", :with => "something3.com"
      fill_in "person_website4", :with => "something4.com"
      click_on "Update Person"
      page.should have_link "something1.com", href: "http://something1.com"
      page.should have_link "something2.com", href: "http://something2.com"
      page.should have_link "something3.com", href: "http://something3.com"
      page.should have_link "something4.com", href: "http://something4.com"
    end
    
    it "should handle www" do
      visit '/people'
      click_on "John Doe"
      click_on "Edit Person"
      fill_in "person_website1", :with => "www.berkeley.edu"
      click_on "Update Person"
      page.should have_link "www.berkeley.edu", href: "http://www.berkeley.edu"
    end

    it "should handle http://" do 
      visit '/people'
      click_on "John Doe"
      click_on "Edit Person"
      fill_in "person_website1", :with => "http://www.berkeley.edu"
      click_on "Update Person"
      page.should have_link "www.berkeley.edu", href: "http://www.berkeley.edu"
    end
  end

end