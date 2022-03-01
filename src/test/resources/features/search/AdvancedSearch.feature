@advanced
Feature: Advanced Search tests

  Background: Home page
    Given user opens Embase application
    Then Quick search page is opened

  Scenario: Verify Advanced Search page is opened
    When user opens Advanced Search page
    Then user is on Advanced Search Page