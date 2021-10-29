@regression @emailalerts
Feature: Email Alerts

  Background: Home page
    Given user opens Embase application
    And user logs in as Default User
    And Quick search page is opened

  Scenario: Verify Email alert can be set including Preprints
    Given user opens Results page
    And user enters query dna and performs a search
    Then the result set is not empty
    When user clicks on EmailAlert link
    And Preprints labelname is displayed on Email Alerts
    And Preprints checkbox is selected by default


  Scenario: Verify Email alert can be set excluding Preprints