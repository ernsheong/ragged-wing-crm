# encoding: utf-8

Given /^the following donations exist:$/ do |table|
	new_person = {:first_name => "Jonathan", :last_name => "Lin"}
  p = Person.create!(new_person)
  table.hashes.each do |donation|
    new_donation = donation
  	new_donation[:person_id] = p.id
  	d = Donation.create!(new_donation)
  end
end

When /^I add donation of "([^"]*)" on "([^"]*)"$/ do |amt, date|
  fill_in('donation_amount', :with => amt)
  fill_in('datepicker', :with => date)
  click_button('Create Donation')
end

When /^I fill in "([^"]*)" for min and "([^"]*)" for max$/ do |arg1, arg2|
  fill_in('min', :with => arg1)
  fill_in('max', :with => arg2)
end

When /^I fill in "([^"]*)" for min$/ do |arg1|
  fill_in('min', :with => arg1)
end

When /^I fill in "([^"]*)" for start date$/ do |arg1|
  fill_in('start', :with => arg1)
end

When /^I fill in "([^"]*)" for start date and "([^"]*)" for end date$/ do |arg1, arg2|
  fill_in('start', :with => arg1)
  fill_in('end', :with => arg2)
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  e1 = e1.gsub(/(?<spec>[\$\.])/, '$' => '\$', '.' => '\.')
  e2 = e2.gsub(/(?<spec>[\$\.])/, '$' => '\$', '.' => '\.')
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  #match_pattern = /(.)*#{e1}(.*)#{e2}(.*)/m
  #assert match_pattern.match(page.body).class==MatchData
  assert page.body.match(/#{e1}.*/m).to_s.match(e2)
end