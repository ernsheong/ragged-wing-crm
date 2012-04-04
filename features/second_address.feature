Feature: second line for address, and second address in form

  As an admin
  So that I can store an alternate address for contacts
  I want to see a second address when viewing a contact , and have the fields to enter another address

Background: 

  Given the following people exist:
  | first_name     | last_name | Address1 | Address2 |
  | Jonathan       | Lin       | addr1    | addr2    |
  
  And I am on the people page

Scenario: Two addresses visible when viewing a contact
  Given I am on the profile page for "Jonathan Lin"
  Then I should see "Address 1"
  And I should see "addr1"
  And I should see "Address 2"
  And I should see "addr2"

Scenario: Fields for entering 2 addresses when creating a new contact
  When I press "Add New Person"
  Then I should see "Address 1"
  And I should see "Address 2"
  When I fill in "address1_street" with "street1"
  And I fill in "address2_street" with "street2"
  And I press "Create Person"
  Then I should see "Address and Contact Information"
  And I should see "street1"
  And I should see "street2"
  
Scenario: Fields for entering 2 addresses when editing an existing contact
  Given I am on the edit page for "Jonathan Lin"
  Then I should see "Address 1"
  And I should see "Address 2"
  And I should see "addr1"
  And I should see "addr2"
  