Feature: show a specific contact's profile page
 
  As an admin
  So that I can view more information about a specific contact
  I want be able to see a contact's profile page

Background: contacts have been added to database

  Given the following people exist:
  | name                   | relationship | phone       | address |
  | Jon Lin                | scrumaster   | 1333333333  | addr_1  |
  | Kevin Tham             | donor        | 1111111111  | addr_2  |
  
  And the following donations exist:
  | donor                  | amount       | date        |
  | Kevin Tham             | 10.0         | 10-10-10    |

  And I am on the contacts page
  
Scenario: view a contact's profile page
  Given I am on the contacts page
  When I follow "Jon Lin"
  Then I should be on "Details about Jon Lin"

Scenario: see donor info on a contact's profile page
  Given I am on the contacts page
  When I follow "Kevin Tham"
  Then I should be on "Details about Kevin Tham"
  And I should see "Donation History"
  And I should see "October 10, 2010"
