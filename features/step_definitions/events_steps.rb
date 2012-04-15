Given /^the following events exist:$/ do |table|
  table.hashes.each do |event|
  	new_event = {:name => event['name'], :date => Date.parse(event['date']), 
  		:start_time => Time.now, :end_time => Time.now + 1.hour}
  	e = Event.create!(new_event)
  end
end
