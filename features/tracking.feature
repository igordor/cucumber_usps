@tracking
Feature: scenarios for tracking functionality

  Scenario: Search by tracking number
    Given I open browser and navigate to "http://usps.com"
    Then I type "1234567890" to tracking search field
    Then I press on search arrow
    Then I should see Multiple items found message

  Scenario: Search by tracking number
    Given I open browser and navigate to "http://usps.com"
    Then I type "1234567890" to global search field
    Then I press on Global search
    Then I should see Multiple items found message
