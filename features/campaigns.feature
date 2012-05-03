Feature: Ability to create campaigns

	As an admin
  So that I can organize our campaigns
  I want to be able to view and update campaigns

Background: campaigns have been added to database

  Given the following campaigns exist:
  | name      				| start_date 		| end_date      |
  | Fundraiser       	| 2012-02-03    | 2012-03-03    |
  | Gala Dinner       | 2005-02-03    | 2005-03-03    |
  | Concert          	| 2006-02-03    | 2006-03-03    |
  | Performance       | 2007-02-03    | 2007-03-03    |
  And I visit "/campaigns"
  
Scenario: see campaigns
  Then I should see: Concert, Gala Dinner, Fundraiser, Performance
  
Scenario: update campaigns
  When I click "Fundraiser"
  And I click "Edit Information"
  And I fill in "campaign_description" with "This is a desc"
  And I press "Update Campaign"
  Then I should see "This is a desc"
