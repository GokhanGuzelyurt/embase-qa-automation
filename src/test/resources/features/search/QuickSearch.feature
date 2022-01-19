@quicksearch
Feature: Quick Search tests

  Background: Home page
    Given user opens Embase application
    Then Quick search page is opened

  @C506417
  Scenario: Validate author first name is not present in search by field list
    When user clicks on Add field button on Quick Search Page
    Then Add field popup is opened on Quick Search Page
    Then Author first name is not a part of fields list on Quick Search Page
    And Author name is a part of fields list on Quick Search Page

  Scenario: Validate that the default search is broad search
    When user enters query heart attack on quick search page
    And user clicks on Show results button on quick search