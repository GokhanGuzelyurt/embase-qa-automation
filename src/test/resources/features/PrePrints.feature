@regression @search @preprints
Feature: Pre Prints tests

  Background: Home page
    Given user opens Embase application
    And user logs in as Default User
    And Quick search page is opened
    Then user opens Results page

  @C477852
  Scenario: Verify that a new Preprints limit is introduced
    Given user enters query [preprint]/lim on Results Page and performs a search
    Then the result set is not empty

  @C477853
  Scenario: Verify the results Source filters for preprints checkbox
    Given user enters query ? on Results Page and performs a search
    Then the result set is not empty
    When user opens Source tab on Results page
    Then source checkbox Preprints should be displayed
    And user selects the preprints checkbox and clicks on Search
    Then search query is ? AND [preprint]/lim
    And the result set is not empty

  @C477854
  Scenario: Verify Preprints checkbox is present on Email alerts dialog box
    And user enters query dna on Results Page and performs a search
    Then the result set is not empty
    And user clicks on EmailAlert link
    And Preprints labelname is displayed on Email Alerts
    And Preprints checkbox is selected by default

  @C477859
  Scenario: Verify Source is shown as PREPRINT on Results page for a preprint record
    Given user enters query [preprint]/lim on Results Page and performs a search
    Then the result set is not empty
    And record #1 contains source as PREPRINT





