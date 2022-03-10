@disease
Feature: Disease Search tests

  Background: Home page
    Given user opens Embase application
    Then Quick search page is opened

  Scenario: Verify Disease Search page is opened
    When user opens Disease Search page
    Then user is on Disease Search Page