require "spec_helper"

feature "Campaigns" do 

	background do 
		FactoryGirl.create(:person, first_name: "jon", last_name: "lin", id: 1)
		FactoryGirl.create(:person, first_name: "jeremy", last_name: "lin", id: 2)
		FactoryGirl.create(:donation, person_id: 1, amount: 5.0, date: "2012-01-01")
		FactoryGirl.create(:donation, person_id: 2, amount: 10.0, date: "2011-01-01")
		FactoryGirl.create(:campaign, name: "Campaign Name", id: 1)
	end

	context "when targeting a group of People from Donations" do 

		def add_people
			select "Campaign Name", from: "campaign_id"
			click_on "Add People"
		end

		it "adds the searched People into a Campaign" do 
			visit "/donations"
			add_people
			within_table "targets" do
				page.should have_content "jon lin"
				page.should have_content "jeremy lin"
			end
		end

		it "adds only certain people into campaign" do 
			visit "/donations"
			fill_in "min", with: 9
			fill_in "max", with: 11
			click_on "Update Listing"
			add_people
			within_table "targets" do
				page.should_not have_content "jon lin"
				page.should have_content "jeremy lin"
			end
		end
	end
end
