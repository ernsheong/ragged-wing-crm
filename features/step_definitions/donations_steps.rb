# encoding: utf-8

When /^I add a new donation of "([^"]*)" on "([^"]*)"$/ do |amt, date|
  click_link('new_donation') 
  fill_in('Amount', :with => amt)
  fill_in('Date', :with => date)
  click_button('Create Donation')
end