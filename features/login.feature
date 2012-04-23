Feature: login ability for admin

  As an admin
  So that only I can modify the data in the CRM
  I want the app to be able to authenticate me through a login system

Background: 

  Given the following users exist:
  | email                       | identifier_url | 
  | admin@raggedwing.com        |                | 
  
  And I am on the home page

Scenario: Successfully login
  When I login as "admin@raggedwing.com"
  Then I should see "logged in as admin@raggedwing.com"

Scenario: Only admin can login
  When I login as "guest@raggedwing.com"
  Then I should not see "logged in as guest@raggedwing.com"

Scenario: Admin can logout
  Given I am logged in
  When I logout
  Then I should not see "logged in as admin@raggedwing.com"
  And I should see "log in"

Scenario Outline: Cannot view data when not logged in
  When I visit the <input> page
  Then I should be on the home page

  Examples:
    | input     |
    | people    |
    | donations |
    | events    |

Scenario Outline: Admin can see everything
  Given I am logged in
  When I visit the <input> page
  Then I should be on the <input> page

  Examples:
    | input     |
    | people    |
    | donations |
    | events    |
