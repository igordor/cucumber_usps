@login
Feature: Scenarios for login functionality

  Scenario: Verify Login error messages
    Given I open browser and navigate to "http://usps.com"
    When I press on Signin button on home page
    Then I type my login "invalid-login"
    And I type my password "cool_password"
    Then I press on Signin button on login page
    Then I will see invalid login or password error message

  Scenario: Verify that password is required
    Given I open browser and navigate to "http://usps.com"
    When I press on Signin button on home page
    Then I type my login "invalid-login"
    Then I press on Signin button on login page
    Then I will see password required error message

  Scenario: Verify that login should be more than 5 characters
    Given I open browser and navigate to "http://usps.com"
    When I press on Signin button on home page
    Then I type my login "12345"
    And I type my password "cool_password"
    Then I press on Signin button on login page
    Then I will see login length error message

  Scenario: Verify that password should be more than 9 characters
    Given I open browser and navigate to "http://usps.com"
    When I press on Signin button on home page
    Then I type my login "invalid-login"
    And I type my password "123"
    Then I press on Signin button on login page
    Then I will see password length error message
