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
    When user clicks on set EmailAlert link
    And Preprints labelname is displayed on Email Alerts
    And Preprints checkbox is selected by default
    And set variable $emailTitle to unique string Preprint alert
    And user saves Email Alert:
      | alertName   | emailAddress      | isIncludeArticles | isIncludePreprints | comment | format  | content | freqPeriod | frequency |
      | $emailTitle | changeme@test.com | true              | true               |         | default | default | default    | default   |
    When user opens Email Alerts page
    And user highlights Email Alert with name $emailTitle
    Then email alert details shows Preprints status Included
    When user clicks on ReRun action for Email Alert with name $emailTitle
    Then search query is dna

  Scenario: Verify Email alert can be set excluding Preprints
    Given user opens Results page
    And user enters query dna and performs a search
    Then the result set is not empty
    When user clicks on set EmailAlert link
    And Preprints labelname is displayed on Email Alerts
    And Preprints checkbox is selected by default
    And set variable $emailTitle to unique string Preprint alert
    And user saves Email Alert:
      | alertName   | emailAddress      | isIncludeArticles | isIncludePreprints | comment | format  | content | freqPeriod | frequency |
      | $emailTitle | changeme@test.com | true              | false              |         | default | default | default    | default   |
    When user opens Email Alerts page
    And user highlights Email Alert with name $emailTitle
    Then email alert details shows Preprints status Excluded
    When user clicks on ReRun action for Email Alert with name $emailTitle
    Then search query is dna NOT [preprint]/lim


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


  Scenario: Verify multiple email alert can be bulk edited with Preprint settings to exclude preprints
    Given user opens Results page
    And user enters query dna and performs a search
    Then the result set is not empty
    When user clicks on set EmailAlert link
    And set variable $emailTitle to unique string Preprint alert
    And user saves Email Alert:
      | alertName   | emailAddress      | isIncludeArticles | isIncludePreprints | comment | format  | content | freqPeriod | frequency |
      | $emailTitle | changeme@test.com | true              | true               |         | default | default | default    | default   |
    When user clicks on set EmailAlert link
    And set variable $emailTitle2 to unique string Preprint alert
    And user saves Email Alert:
      | alertName    | emailAddress      | isIncludeArticles | isIncludePreprints | comment | format  | content | freqPeriod | frequency |
      | $emailTitle2 | changeme@test.com | true              | true               |         | default | default | default    | default   |
    When user clicks on set EmailAlert link
    And set variable $emailTitle3 to unique string Preprint alert
    And user saves Email Alert:
      | alertName    | emailAddress      | isIncludeArticles | isIncludePreprints | comment | format  | content | freqPeriod | frequency |
      | $emailTitle3 | changeme@test.com | true              | true               |         | default | default | default    | default   |
    When user opens Email Alerts page
    And user highlights Email Alert with name $emailTitle
    Then email alert details shows Preprints status Included
    And user highlights Email Alert with name $emailTitle2
    Then email alert details shows Preprints status Included
    And user highlights Email Alert with name $emailTitle3
    Then email alert details shows Preprints status Included
    When user selects checkbox for Email Alert with name $emailTitle
    When user selects checkbox for Email Alert with name $emailTitle2
    When user selects checkbox for Email Alert with name $emailTitle3
    And user uses the bulk Edit Preprint Settings to Exclude preprints
    And user highlights Email Alert with name $emailTitle
    Then email alert details shows Preprints status Excluded
    And user highlights Email Alert with name $emailTitle2
    Then email alert details shows Preprints status Excluded
    And user highlights Email Alert with name $emailTitle3
    Then email alert details shows Preprints status Excluded

  Scenario: Verify multiple email alert can be bulk edited with Preprint settings to include preprints
    Given user opens Results page
    And user enters query dna and performs a search
    Then the result set is not empty
    When user clicks on set EmailAlert link
    And set variable $emailTitle to unique string Preprint alert
    And user saves Email Alert:
      | alertName   | emailAddress      | isIncludeArticles | isIncludePreprints | comment | format  | content | freqPeriod | frequency |
      | $emailTitle | changeme@test.com | true              | false              |         | default | default | default    | default   |
    When user clicks on set EmailAlert link
    And set variable $emailTitle2 to unique string Preprint alert
    And user saves Email Alert:
      | alertName    | emailAddress      | isIncludeArticles | isIncludePreprints | comment | format  | content | freqPeriod | frequency |
      | $emailTitle2 | changeme@test.com | true              | false              |         | default | default | default    | default   |
    When user clicks on set EmailAlert link
    And set variable $emailTitle3 to unique string Preprint alert
    And user saves Email Alert:
      | alertName    | emailAddress      | isIncludeArticles | isIncludePreprints | comment | format  | content | freqPeriod | frequency |
      | $emailTitle3 | changeme@test.com | true              | false              |         | default | default | default    | default   |
    When user opens Email Alerts page
    And user highlights Email Alert with name $emailTitle
    Then email alert details shows Preprints status Excluded
    And user highlights Email Alert with name $emailTitle2
    Then email alert details shows Preprints status Excluded
    And user highlights Email Alert with name $emailTitle3
    Then email alert details shows Preprints status Excluded
    When user selects checkbox for Email Alert with name $emailTitle
    When user selects checkbox for Email Alert with name $emailTitle2
    When user selects checkbox for Email Alert with name $emailTitle3
    And user uses the bulk Edit Preprint Settings to Include preprints
    And user highlights Email Alert with name $emailTitle
    Then email alert details shows Preprints status Included
    And user highlights Email Alert with name $emailTitle2
    Then email alert details shows Preprints status Included
    And user highlights Email Alert with name $emailTitle3
    Then email alert details shows Preprints status Included