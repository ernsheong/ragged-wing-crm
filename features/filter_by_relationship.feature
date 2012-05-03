Feature: Ability to filter contacts based on relationship
 
  As an admin
  I want to filter contacts by relationship
  So that I can view a specific subset of contacts

Background: contacts have been added to database

  Given the following people exist:
  | first_name     | last_name | relationships |
  | Winston        | Chow      | Volunteer    |
  | Jonathan       | Lin       | Employee     |
  | Kevin          | Tham      | Donor        |
  | Peter          | Hu        | Volunteer    |

  And I visit "/people"
  
Scenario: no relationships selected
  When I filter
  Then I should see: Winston Chow, Jonathan Lin, Kevin Tham, Peter Hu
  
Scenario: restrict contacts to ones with a "Volunteer" relationship
  When I select "Volunteer" from "filter"
  And I filter
  Then I should see: Winston Chow, Peter Hu
  And I should not see: Jonathan Lin, Kevin Tham
  
Scenario: restrict contacts to ones with a "Employee" relationship
  When I select "Employee" from "filter"
  And I filter
  Then I should see: Jonathan Lin
  And I should not see: Winston Chow, Kevin Tham, Peter Hu
  

  