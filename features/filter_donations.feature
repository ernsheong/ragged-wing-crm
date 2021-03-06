Feature: Ability to filter donations by amount and date
 
  As an admin
  I want to filter donations by amount and date
  So that I can view specific trends about donation behavior

Background: donations have been added to database

  Given the following donations exist:
  | amount     | date            |
  | 1          | 2012-03-03      |
  | 10         | 2005-03-03      |
  | 100        | 2006-03-03      |
  | 1000       | 2007-03-03      |
  And I visit "/donations"
  
Scenario: no year selected
  When I filter 
  Then I should see: 3 March 2012, 3 March 2005, 3 March 2006, 3 March 2007
  
Scenario: min and max entered
  When I fill in "0" for min and "10" for max
  And I filter
  Then I should see: 3 March 2012, 3 March 2005
  When I fill in "2000" for min
  And I filter
  Then I should not see: 3 March 2012, 3 March 2005, 3 March 2006, 3 March 2007

Scenario: start and end date entered
  When I fill in "2012-03-03" for start date
  And I filter
  Then I should see: 3 March 2012
  When I fill in "2005-03-03" for start date and "2007-04-03" for end date
  And I filter
  Then I should see: 3 March 2005, 3 March 2006, 3 March 2007

Scenario: min, max, start, end all entered
  When I fill in "0" for min and "10" for max
  And I fill in "2006-03-03" for start date and "2007-04-03" for end date
  And I filter
  Then I should not see: 3 March 2012, 3 March 2005, 3 March 2006, 3 March 2007
  When I fill in "1000" for min
  And I fill in "2006-03-03" for start date and "2007-04-03" for end date
  And I filter
  Then I should see: 3 March 2007
