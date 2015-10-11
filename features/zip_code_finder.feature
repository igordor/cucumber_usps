Feature: Zip code finder

  Scenario: happy path for looking up zip code
    Given I open browser and navigate to "http://usps.com"
    When I navigate to USPS Look UP Zip Code page
    Then I type "1600 Pennsylvania Avenue Northwest" to street address
    Then I type "Washington" to city field
    Then I select "DC - District of Columbia" from states dropdown list
    And I click Find Zip code button
    Then I see results on Look up a zip code page

  @zip_codes
  Scenario Outline: search for zip code in different locations
    Given I open browser and navigate to "http://usps.com"
    When I navigate to USPS Look UP Zip Code page
    Then I type "<address>" to street address
    Then I type "<city>" to city field
    Then I select "<state>" from states dropdown list
    And I click Find Zip code button
    Then I see results on Look up a zip code page

    Examples: addresses

    |                 address           |city         |state                    |
    |1600 Pennsylvania Avenue Northwest |Washington   |DC - District of Columbia|
    | 1801 23rd Ave                     |San Francisco|CA - California          |