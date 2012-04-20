# encoding: utf-8

Given /^the following organizations exist:$/ do |table|
  table.hashes.each do |org|
  	new_address = { street: org['street'], city: org['city'], 
  		state: org['state'], zip: org['zipcode'], country: org['country']}
  	a = Address.create!(new_address)
  	new_org = { name: org['name'], website: org['website'], 
  		org_type: org['org_type'], address: a.id }
  	o = Organization.create!(new_org)
  end
end