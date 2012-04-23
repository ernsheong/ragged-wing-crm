Feature: Record donations made by a person

  As a CRM admin
  I want to add a person's donation into the database
  So that I can keep it for the company's accounting records
  And help me be compliant as a tax

Background: contacts have been added to database

  Given the following people exist:
  | first_name        | last_name  |
  | Jon               | Lin        |
  | Kevin             | Tham       |

  And I am logged in
  
Scenario: Add a donation
  When I view person "Kevin Tham"
  When I add a new donation of "100.1" on "04/08/2012"
  Then I should see "100.1"
