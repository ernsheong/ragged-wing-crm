Feature: search for people by name

  As an admin
  So that I can find people to follow up with
  I want to be able to find people by their name

Background: Given people in database
  | first_name     | last_name |
  | Winston        | Chow      | 
  | Jonathan       | Lin       | 
  | Kevin          | Tham      | 
  | Peter          | Hu        |
  

Scenario: Find existing person
  When I enter "Kevin" in the searchbox
  And  I press "Search"
  Then I should see "Kevin"

Scenario: Find non-existing person
  When I enter "Ivan" in the searchbox
  And  I press "Search"
  Then I should not see "Ivan"