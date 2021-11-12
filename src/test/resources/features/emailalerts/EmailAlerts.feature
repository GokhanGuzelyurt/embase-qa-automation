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
    And set variable $emailTitle to unique string Preprint alert
    And user saves Email Alert:
      | alertName   | emailAddress      | isIncludeArticles | isIncludePreprints | comment | format  | content | freqPeriod | frequency |
      | $emailTitle | changeme@test.com | true              | true               |         | default | default | default    | default   |
    When user opens Email Alerts page
    And user highlights Email Alert with name $emailTitle
    Then email alert details shows Preprints status Included
    When user clicks on ReRun action for the highlighted Email Alert
    Then search query is dna

  Scenario: Verify Email alert can be set excluding Preprints
    Given user opens Results page
    And user enters query dna and performs a search
    Then the result set is not empty
    When user clicks on EmailAlert link
    And Preprints labelname is displayed on Email Alerts
    And Preprints checkbox is selected by default
    And set variable $emailTitle to unique string Preprint alert
    And user saves Email Alert:
      | alertName   | emailAddress      | isIncludeArticles | isIncludePreprints | comment | format  | content | freqPeriod | frequency |
      | $emailTitle | changeme@test.com | true              | false              |         | default | default | default    | default   |
    When user opens Email Alerts page
    And user highlights Email Alert with name $emailTitle
    Then email alert details shows Preprints status Excluded
    When user clicks on ReRun action for the highlighted Email Alert
    Then search query is dna NOT [preprint]/lim



  Scenario: Verify single email alert can be edited to exclude preprints


  Scenario: Verify bulk email alert can be edited to exclude preprints

  Scenario: Verify bulk email alert can be edited to include preprints