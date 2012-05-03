Given /^the following events exist:$/ do |table|
  table.hashes.each do |event|
  	new_event = {:name => event['name'], :date => Date.parse(event['date']), 
  		:start_time => Time.now, :end_time => Time.now + 1.hour, :event_type => event['event_type']}
  	e = Event.create!(new_event)
  end
end

Then /^I should see all events$/ do
  Event.all.each do |event|
    page.should have_content(event.name)
  end
end