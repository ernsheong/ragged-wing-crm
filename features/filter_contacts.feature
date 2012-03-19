Feature: Ability to feature contacts based on relationship
 
  As an admin
  I want to filter contacts by relationship
  So that I can view a specific subset of contacts

Background: contacts have been added to database

  Given the following contacts exist:
  | first_name     | last_name | Relationship | ...
  | Winston        | Chow      | Volunteer    |
  | Jonathan       | Lin       | Director     |
  | Kevin          | Tham      | Donor        |
  | Peter          | Hu        | Volunteer    |
  
Scenario: no relationships selected
  When I am on the home page
  And I select none of the ratings
  When I press "Submit"
  Then I should see all of the contacts
  
Scenario: restrict contacts to ones with a "Volunteer" relationship
  When I select the "Volunteer" relationship
  Then I press "Submit"
  Then I should see the following contacts: Winston Chow, Peter Hu
  And I should not see the following contacts: Jonathan Lin, Kevin Tham
  
Scenario: restrict contacts to ones with a "Director" relationship
  When I select the "Director" relationship
  Then I press "Submit"
  Then I should see the following contacts: Jonathan Lin
  And I should not see the following contacts: Winston Chow, Kevin Tham, Peter Hu
  

  