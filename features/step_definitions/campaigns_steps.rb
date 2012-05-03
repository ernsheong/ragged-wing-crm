Given /^the following campaigns exist:$/ do |table|
  table.hashes.each do |campaign|
  	e = Campaign.create!(campaign)
  end
end
