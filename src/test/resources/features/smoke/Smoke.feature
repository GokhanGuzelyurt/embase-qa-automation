@regression @smoke
Feature: Smoke tests

  Background: Home page
    Given user opens Embase application
    Then Quick search page is opened

  @C506741
  Scenario: Verify Search by wildcard and orcid returns results
    When user opens Results page
    And user enters query ?:oc and performs a search
    Then the result set is not empty

  @C507044
  Scenario Outline: Verify search by ISSN works fine
    When user opens Results page
    And user enters query <ISSN_query> and performs a search
    Then the result set is not empty
    Examples:
      | ISSN_query     |
      | '10292659':is  |
      | '1029 2659':is |
      | '1029-2659':is |


