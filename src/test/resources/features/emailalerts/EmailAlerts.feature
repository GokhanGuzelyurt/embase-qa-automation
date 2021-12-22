@regression @emailalerts
Feature: Email Alerts

  Background: Home page
    Given user opens Embase application
    And user logs in as Default User
    And Quick search page is opened

  @C488503
  Scenario Outline: Verify Email alert can be created with desired Preprints initial setting
    Given user opens Results page
    And user enters query <initialSearchQuery> and performs a search
    Then the result set is not empty
    When user clicks on set EmailAlert link
    And Preprints labelname is displayed on Email Alerts
    And Preprints checkbox is selected by default
    And set variable $emailTitle to unique string Preprint alert
    And user saves Email Alert:
      | alertName   | emailAddress      | isIncludeArticles | isIncludePreprints | comment | format  | content | freqPeriod | frequency |
      | $emailTitle | changeme@test.com | true              | <includePreprints> |         | default | default | default    | default   |
    When user opens Email Alerts page
    And user highlights Email Alert with name $emailTitle
    Then email alert details shows Preprints status <expectedInitialStatus>
    When user clicks on ReRun action for Email Alert with name $emailTitle
    Then search query is <expectedSearchQuery>
    Examples:
      | includePreprints | expectedInitialStatus | initialSearchQuery | expectedSearchQuery    |
      | true             | Included              | dna                | dna                    |
      | false            | Excluded              | dna                | dna NOT [preprint]/lim |


  @C488505
  Scenario: Verify single email alert can be bulk edited with Preprint settings to exclude preprints
    Given user opens Results page
    And user enters query dna and performs a search
    Then the result set is not empty
    When user clicks on set EmailAlert link
    And set variable $emailTitle to unique string Preprint alert
    And user saves Email Alert:
      | alertName   | emailAddress      | isIncludeArticles | isIncludePreprints | comment | format  | content | freqPeriod | frequency |
      | $emailTitle | changeme@test.com | true              | true               |         | default | default | default    | default   |
    When user opens Email Alerts page
    And user highlights Email Alert with name $emailTitle
    Then email alert details shows Preprints status Included
    When user selects checkbox for Email Alert with name $emailTitle
    And user uses the bulk Edit Preprint Settings to Exclude preprints
    And user highlights Email Alert with name $emailTitle
    Then email alert details shows Preprints status Excluded

  @C488507
  Scenario Outline: Verify multiple email alert can be bulk edited with Preprint settings
    Given user opens Results page
    And user enters query dna and performs a search
    Then the result set is not empty
    When user clicks on set EmailAlert link
    And set variable $emailTitle to unique string Preprint alert
    And user saves Email Alert:
      | alertName   | emailAddress      | isIncludeArticles | isIncludePreprints | comment | format  | content | freqPeriod | frequency |
      | $emailTitle | changeme@test.com | true              | <includePreprints> |         | default | default | default    | default   |
    When user clicks on set EmailAlert link
    And set variable $emailTitle2 to unique string Preprint alert
    And user saves Email Alert:
      | alertName    | emailAddress      | isIncludeArticles | isIncludePreprints | comment | format  | content | freqPeriod | frequency |
      | $emailTitle2 | changeme@test.com | true              | <includePreprints> |         | default | default | default    | default   |
    When user clicks on set EmailAlert link
    And set variable $emailTitle3 to unique string Preprint alert
    And user saves Email Alert:
      | alertName    | emailAddress      | isIncludeArticles | isIncludePreprints | comment | format  | content | freqPeriod | frequency |
      | $emailTitle3 | changeme@test.com | true              | <includePreprints> |         | default | default | default    | default   |
    When user opens Email Alerts page
    And user highlights Email Alert with name $emailTitle
    Then email alert details shows Preprints status <expectedInitialStatus>
    And user highlights Email Alert with name $emailTitle2
    Then email alert details shows Preprints status <expectedInitialStatus>
    And user highlights Email Alert with name $emailTitle3
    Then email alert details shows Preprints status <expectedInitialStatus>
    When user selects checkbox for Email Alert with name $emailTitle
    When user selects checkbox for Email Alert with name $emailTitle2
    When user selects checkbox for Email Alert with name $emailTitle3
    And user uses the bulk Edit Preprint Settings to <actionPreprintSettings> preprints
    And user highlights Email Alert with name $emailTitle
    Then email alert details shows Preprints status <expectedStatusAfterEdit>
    And user highlights Email Alert with name $emailTitle2
    Then email alert details shows Preprints status <expectedStatusAfterEdit>
    And user highlights Email Alert with name $emailTitle3
    Then email alert details shows Preprints status <expectedStatusAfterEdit>
    Examples:
      | includePreprints | expectedInitialStatus | actionPreprintSettings | expectedStatusAfterEdit |
      | true             | Included              | Exclude                | Excluded                |
      | false            | Excluded              | Include                | Included                |
