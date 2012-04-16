# encoding: utf-8

Given /^the following donations exist:$/ do |table|
  table.hashes.each do |donation|
  	new_donation = {:amount => donation['amount'], :date => Date.parse(donation['date'])}
  	d = Donation.create!(new_donation)
  end
end

When /^I add a new donation of "([^"]*)" on "([^"]*)"$/ do |amt, date|
  click_link('new_donation') 
  fill_in('Amount', :with => amt)
  fill_in('Date', :with => date)
  click_button('Create Donation')
end