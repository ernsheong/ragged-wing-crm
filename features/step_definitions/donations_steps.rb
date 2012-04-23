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