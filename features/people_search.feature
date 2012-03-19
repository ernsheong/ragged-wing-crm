Feature: search for people by name

  As an admin
  So that I can find people to follow up with
  I want to be able to find people by their name

Background: 

  Given the following people exist:
  | first_name     | last_name | 
  | Winston        | Chow      | 
  | Jonathan       | Lin       | 
  | Kevin          | Tham      | 
  | Peter          | Hu        |
  

Scenario: Find existing person
  When I visit the home page
  When I enter "Kevin" in the searchbox
  And  I press "Go"
  Then I should see "Kevin"

Scenario: Find non-existing person
  When I visit the home page
  When I enter "Ivan" in the searchbox
  And  I press "Go"
  Then I should not see "Ivan"