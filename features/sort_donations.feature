Feature: display list of donations sorted by different criteria
 
  As an admin
  So that I can quickly browse donations based on different criteria
  I want to see donations sorted by various fields

Background: donations have been added to database
  
  Given the following donations exist:
  | date         | amount | payment_method | campaign | solicitation_method |
  | 1992-11-25   | 1      | Credit Card    | 4        | E-mail              |
  | 1984-10-26   | 10     | Credit Card    | 1        | E-mail              |
  | 1989-07-21   | 100    | Credit Card    | 2        | E-mail              |
  | 2011-08-10   | 1000   | Credit Card    | 2        | E-mail              |
  | 2001-01-05   | 10000  | Check          | 2        | E-mail              |
  | 2001-04-25   | 100000 | Check          | 2        | Internet            |
  | 1968-04-06   | 100000 | Check          | 2        | Internet            |
  | 2004-11-05   | 100000 | Check          | 1        | Internet            |
  | 1981-06-12   | 100000 | Check          | 3        | Internet            |
  | 2000-06-21   | 100000 | Credit Card    | 1        | Internet            |

  And I am logged in
  And I visit "/donations"

Scenario: sort donations by amount
  When I click "Amount"
  Then I should see "$1.00" before "$10.00"
  And I should see "$10.00" before "$100.00"
  And I should see "$100.00" before "$1,000.00"
  And I should see "$1,000.00" before "$10,000.00"
  And I should see "$10,000.00" before "$100,000.00"
  When I click "Amount"
  Then I should see "$100,000.00" before "$10,000.00"
  And I should see "$10,000.00" before "$1,000.00"
  And I should see "$1,000.00" before "$100.00"
  And I should see "$100.00" before "$10.00"
  And I should see "$10.00" before "$1.00"

Scenario: sort donations by campaign
  When I click "Campaign"
  Then I should see "1" before "2"
  And I should see "2" before "3"
  And I should see "3" before "4"

Scenario: sort donations by date
  When I click "Date"
  Then I should see "6 April 1968" before "12 June 1981"
