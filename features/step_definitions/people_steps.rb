When /^I edit "([^"]*)"$/ do |arg1|
  visit('/people')
  click_link arg1
  click_on 'edit_person'
end