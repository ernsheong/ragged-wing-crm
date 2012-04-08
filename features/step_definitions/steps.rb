Given /the following people exist/ do |people_table|
	people_table.hashes.each do |person|
		new_person = {:first_name => person['first_name'], :last_name => person['last_name']}
		p = Person.create!(new_person)
		unless person['relationships'].nil?
			person['relationships'].split(/,\s*/).each do |elt|
				Relationship.create!(:person_id => p.id, :name => elt)
			end
		end
    unless person['address1'].nil?
      person.address1 = Address.create!(:street => person['address1'])
    end
    unless person['address2'].nil?
      person.address2 = Address.create!(:street => person['address2'])
    end
	end
end

Given /^I am on the profile page for "([^"]*)"$/ do |arg1|
  visit('/people')
  click_link arg1
end

Given /^I am on the edit page for "([^"]*)"$/ do |arg1|
  visit('/people')
  click_link arg1
  click_link 'Edit'
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^I visit the (?:root|home) page$/ do
  visit('/')
end

When /^I visit "([^"]*)"$/ do |arg1|
  visit arg1
end

When /^I click "([^"]*)"$/ do |arg1|
  click_link arg1
end

When /^I edit "([^"]*)"$/ do |arg1|
  visit('/people')
  click_link arg1
  click_link 'edit'
end

When /^I check: (.*)$/ do |selection|
  selection.split(/,\s*/).each do |item|
    check(item)
  end
end

When /^I uncheck: (.*)$/ do |selection|
  selection.split(/,\s*/).each do |item|
    uncheck(item)
  end
end


When /^I enter "([^"]*)" in the searchbox$/ do |name|
  fill_in 'q', :with => name
end

When /^I press "([^"]*)"$/ do |arg1|
  page.click_button arg1
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  page.should have_content(text)    
end

Then /^(?:|I )should see: (.*)$/ do |selection|
  selection.split(/,\s*/).each do |text|
    page.should have_content(text)
  end
end

Then /^(?:|I )should not see "([^"]*)"$/ do |text|
  page.should have_no_content(text)
end

Then /^(?:|I )should not see: (.*)$/ do |selection|
  selection.split(/,\s*/).each do |text|
    page.should_not have_content(text)
  end
end

Then /^the following should be checked: (.*)$/ do |selection|
  selection.split(/,\s*/).each do |text|
    page.should have_checked_field(text)
  end
end

When /^I select "([^"]*)"$/ do |arg1|
  select arg1, :from => "filter"
end

When /^I filter$/ do 
  click_button "filter"
end






