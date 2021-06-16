Feature: ID+ login tests

  Background: Home page
  Given user opens Embase application
    Then Sign in button is displayed

  Scenario: Verify Login page contents
    Given user enters email id as  embase_limited@elsevier.com  and click Continue
    And user enters password as embase_limited@elsevier.com1 and click SignIn
    Then Quick search page is displayed
