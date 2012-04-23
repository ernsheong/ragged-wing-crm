# encoding: utf-8

Given /^the following donations exist:$/ do |table|
	new_person = {:first_name => "Jonathan", :last_name => "Lin"}
  p = Person.create!(new_person)
  table.hashes.each do |donation|
  	new_donation = {:amount => donation['amount'], :date => Date.parse(donation['date']), :person_id => p.id}
  	d = Donation.create!(new_donation)
  end
end

When /^I add a new donation of "([^"]*)" on "([^"]*)"$/ do |amt, date|
  click_link('new_donation') 
  fill_in('Amount', :with => amt)
  fill_in('Date', :with => date)
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
  #fill_in('start', :with => Date.strptime(arg1, '%Y-%m-%d'))
end

When /^I fill in "([^"]*)" for start date and "([^"]*)" for end date$/ do |arg1, arg2|
  fill_in('start', :with => arg1)
  fill_in('end', :with => arg2)
  #fill_in('start', :with => Date.strptime(arg1, '%Y-%m-%d'))
  #fill_in('end', :with => Date.strptime(arg2, '%Y-%m-%d'))
end
