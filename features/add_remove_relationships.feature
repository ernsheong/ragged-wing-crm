Feature: Ability to add relationships to person
 
  As an admin
  I want to add relationships to the person
  So that I can view all the relationships that the person has with RWE

Background: these contacts have been added to database

  Given the following people exist:
  | first_name     	| last_name | relationships |
  | Winston        	| Chow      | Volunteer, Employee |
  | Jonathan       	| Lin       | Donor, Volunteer    |
  | Kevin 			| Tham		|					|
  And I am logged in

@see
Scenario: see relationships
  When I visit "/people"
  And I click "Jonathan Lin"
  Then I should see "Donor, Volunteer"

@add
Scenario: add relationships
	When I visit "/people"
	And I edit "Kevin Tham"
	And I check: Employee, Consultant
	And I press "Update Person"
	Then I should see "Consultant, Employee"

@update
Scenario: update relationships
	When I edit "Winston Chow"
	Then the following should be checked: Employee, Volunteer
	And I check: Collaborator
	And I uncheck: Volunteer
	And I press "Update Person"
	Then I should see "Collaborator, Employee"

@no-duplicates
Scenario: ensure that there are no duplicates
	When I edit "Winston Chow"
	And I press "Update Person"
	Then I should not see "Employee, Employee, Volunteer, Volunteer"

  