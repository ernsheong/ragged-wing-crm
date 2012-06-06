require 'spec_helper'

feature "Donations" do 

	background do 
		@person = FactoryGirl.create(:person)
	end

	context "when adding a donation" do
		it "adds the donor relationship to the person if relationship not present" do 
			visit '/people'
			click_on "John Doe"
			fill_in "Amount", with: "1.0"
			fill_in "datepicker", with: "2012-01-01"
			click_on "Create Donation"
			visit '/people'
			within_table "table" do
				page.should have_content "Donor"
			end
		end
	end

end
