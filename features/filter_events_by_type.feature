Feature: Ability to filter events by type

	As an admin
  So that I can view events that happened in a specified year
  I want to filter events by year

Background: contacts have been added to database

  Given the following events exist:
  | name      | event_type      		        | date        |
  | Event 1   | Donor Event                 | 2012-02-01  |
  | Event 2   | Donor Event                 | 2012-02-01  |
  | Event 3   | Fundraiser                  | 2012-02-01  |
  | Event 4   | Fundraiser                  | 2012-02-01  |
  | Event 5   | Workshop Youth              | 2012-02-01  |
  | Event 6   | Workshop Adult              | 2012-02-01  |
  | Event 7   | Class Youth                 | 2012-02-01  |
  | Event 8   | Class Adult                 | 2012-02-01  |
  | Event 9   | Performance Youth Ensemble  | 2012-02-01  |
  | Event 10  | Performance Main Stage      | 2012-02-01  |
  | Event 11  | Performance One Acts        | 2012-02-01  |
  | Event 12  | Performance Festival        | 2012-02-01  |
  | Event 13  | Performance Traveling       | 2012-02-01  |
  | Event 14  | Other                       | 2012-02-01  |
  And I am logged in
  And I visit "/events"

@none
Scenario: no event filter selected
  When I filter
  Then I should see all events

@donor
Scenario: Donor Event selected
  When I select "Donor Events" from "filter_event"
  When I filter
  Then I should see: Event 1, Event 2

Scenario: Fundraiser selected
  When I select "Fundraisers" from "filter_event"
  And I filter
  Then I should see: Event 3, Event 4

Scenario: Workshop selected
  When I select "Workshops" from "filter_event"
  And I filter
  Then I should see: Event 5, Event 6

Scenario: Class selected
  When I select "Classes" from "filter_event"
  And I filter
  Then I should see: Event 7, Event 8

@performance
Scenario: Performance selected
  When I select "Performances" from "filter_event"
  And I filter
  Then I should see: Event 9, Event 10, Event 11, Event 12, Event 13

Scenario: Other selected
  When I select "Other" from "filter_event"
  And I filter
  Then I should see "Event 14"


