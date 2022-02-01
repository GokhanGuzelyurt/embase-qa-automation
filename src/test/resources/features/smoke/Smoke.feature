@regression @smoke @skip
Feature: Smoke tests

  Background: Home page
    Given user opens Embase application
    Then Quick search page is opened

  Scenario: Verify Search by wildcard and orcid returns results
    When user opens Results page
    And user enters query ?:oc and performs a search
    Then the result set is not empty


