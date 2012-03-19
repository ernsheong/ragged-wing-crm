Given /the following people exist/ do |people_table|
	people_table.hashes.each do |person|
		new_person = {:first_name => person['first_name'], :last_name => person['last_name']}
		Person.create!(new_person)
	end
end

When /^I visit the (?:root|home) page$/ do
  visit('/')
end

When /^I enter "([^"]*)" in the searchbox$/ do |name|
  fill_in 'q', :with => name
end

When /^I press "([^"]*)"$/ do |arg1|
  click_button arg1
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  page.should have_content(text)    
end

Then /^(?:|I )should not see "([^"]*)"$/ do |text|
  page.should have_no_content(text)
end
