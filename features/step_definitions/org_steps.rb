Given /^the following organizations exist:$/ do |table|
  table.hashes.each do |org|
  	new_add = {:street => org["street"], :city => org["city"], :state => org["state"], :zip => org["zip"]}
  	@address = Address.create!(new_add)
    new_organization = {name: org['name'], website: org['website'], org_type: org['org_type'], 
      address_id: @address.id}
    @organization = Organization.create!(new_organization)
  end
end

When /^I create "([^"]*)" as "([^"]*)" with website "([^"]*)"$/ do |arg1, arg2, arg3|
  fill_in("Name", :with => arg1)
  select(arg2, :from => "Organization Type")
  fill_in("Website", :with => arg3)
  click_on("Create Organization")
end

When /^I edit organization "([^"]*)"$/ do |arg1|
  click_link(arg1)
  click_on("edit_org")
end

When /^I update "([^"]*)" to "([^"]*)"$/ do |arg1, arg2|
  fill_in(arg1, :with => arg2)
  click_on("Update Organization")
end
