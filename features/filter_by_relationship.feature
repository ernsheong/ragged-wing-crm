Feature: Ability to feature contacts based on relationship
 
  As an admin
  I want to filter contacts by relationship
  So that I can view a specific subset of contacts

Background: contacts have been added to database

  Given the following contacts exist:
  | first_name     | last_name | relationship |
  | Winston        | Chow      | Volunteer    |
  | Jonathan       | Lin       | Director     |
  | Kevin          | Tham      | Donor        |
  | Peter          | Hu        | Volunteer    |
  
Scenario: no relationships selected
  When I am on the home page
  And I press "Filter"
  Then I should see the following contacts: Winston Chow, Jonathan Lin, Kevin Tham, Peter Hu
  
Scenario: restrict contacts to ones with a "Volunteer" relationship
  When I select the "Volunteer" relationship
  Then I press "Filter"
  Then I should see the following contacts: Winston Chow, Peter Hu
  And I should not see the following contacts: Jonathan Lin, Kevin Tham
  
Scenario: restrict contacts to ones with a "Employee" relationship
  When I select the "Employee" relationship
  Then I press "Filter"
  Then I should see the following contacts: Jonathan Lin
  And I should not see the following contacts: Winston Chow, Kevin Tham, Peter Hu
  

  