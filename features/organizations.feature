Feature: Add organizations to the database

	As an Admin
	So that I can keep track of the organizations that my organization is related to
	I want to be able to add and edit organization details to the database

Background: 

	Given the following organizations exist:

	| name 		| org_type		|	website		| street		| city		| zip	| state	|
	| Berkeley	| Public Entity	| berkeley.edu	| 101 Durant	| Berkeley 	| 94720	| CA 	|
	| Stanford	| Private Entity| stanford.edu	| 100 Palo		| Alto 		| 12345	| CA 	|

	And I visit "/organizations"

Scenario: I can view organizations
	
	Then I should see: Berkeley, Stanford
	And I should not see: MIT
	And I should see "101 Durant, Berkeley, CA 94720"

Scenario: I can add an organization
	When I visit "/organizations"
	And I click "new_organization"
	And I create "MIT" as "Private Entity" with website "mit.edu"
	And I visit "/organizations"
	Then I should see "MIT"

Scenario: I can update an organization
	When I visit "/organizations"
	And I edit organization "Stanford"
	And I update "Name" to "Stanford University"
	Then I should see "Stanford University"