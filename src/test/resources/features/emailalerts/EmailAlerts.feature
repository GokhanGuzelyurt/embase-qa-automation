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
   And user opens Email Alerts page
  # And user goes checks the email alert and has preprints enabled
  # And user clicks rerun
  # And search query is [same as in prev step]

  Scenario: Verify Email alert can be set excluding Preprints
#    Given user opens Results page
#    And user enters query dna and performs a search
#    Then the result set is not empty
#    And user clicks on EmailAlert link
#    And Preprints labelname is displayed on Email Alerts
#    And Preprints checkbox is selected by default
#    And user enters unique email alert name ''
#  #  And user creates email alert excluding preprints
#    And  user goes to email alerts
#    And user goes checks the email alert and has preprints enables
#    And user clicks rerun
#    And search query is [same as in prev step]/not preprints


  Scenario: Verify email alert can be edited to exclude preprints


  Scenario: Verify bulk email alert can be edited to exclude preprints

  Scenario: Verify bulk email alert can be edited to include preprints