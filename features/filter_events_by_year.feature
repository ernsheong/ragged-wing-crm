Feature: Ability to filter events by year

	As an admin
  So that I can view events that happened in a specified year
  I want to filter events by year

Background: contacts have been added to database

  Given the following events exist:
  | name      				| date 					|
  | Fundraiser       	| 2012-03-03    |
  | Gala Dinner       | 2005-03-03    |
  | Concert          	| 2006-03-03    |
  | Performance       | 2007-03-03    |
  And I visit "/events"
  
Scenario: no year selected
  When I filter 
  Then I should see: Fundraiser, Gala Dinner, Concert, Performance
  
Scenario: select a year
  When I select "2007"
  And I filter 
  Then I should see "Performance"
  And I should not see: Concert, Gala Dinner, Fundraiser