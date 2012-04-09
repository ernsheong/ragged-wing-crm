# encoding: utf-8

When /^I add a new note "([^"]*)"$/ do |body|
  click_link('new_note') 
  fill_in('note_body', :with => body)
  click_button('Create Note')
end

Given /^I added a note "([^"]*)" to "([^"]*)"$/ do |body, person|
  step 'I view person "Kevin Tham"'
  step 'I add a new note "hi kevin"'
end
