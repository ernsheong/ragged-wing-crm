Feature: Record notes for a person

  As a CRM admin
  I want to be able to associate notes with a person 
  So that I can keep track on that person's information

Background: contacts have been added to database

  Given the following people exist:
  | first_name        | last_name  |
  | Jon               | Lin        |
  | Kevin             | Tham       |
  And I am logged in
  
Scenario: Add a note
  When I view person "Kevin Tham"
  And I add a new note "hi kevin"
  Then I should see "hi kevin"

Scenario: Only see notes for the correct person
  Given I added a note "hi kevin" to "Kevin Tham"
  When I view person "Jon Lin"
  Then I should not see "hi kevin"
