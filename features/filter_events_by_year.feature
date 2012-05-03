Feature: Ability to filter events by year

	As an admin
  So that I can view events that happened in a specified year
  I want to filter events by year

Background: contacts have been added to database

  Given the following events exist:
  | name      	| date 					|
  | Event1      | 2012-03-03    |
  | Event2      | 2005-03-03    |
  | Event3      | 2006-03-03    |
  | Event4      | 2007-03-03    |
  | Event5      | 2007-04-03    |
  And I visit "/events"
  
Scenario: no year selected
  When I filter 
  Then I should see: Event1, Event2, Event3, Event4
  
Scenario: select a year
  When I select "2007" from "filter_year"
  And I filter 
  Then I should see: Event4, Event5
  And I should not see: Event1, Event2, Event3