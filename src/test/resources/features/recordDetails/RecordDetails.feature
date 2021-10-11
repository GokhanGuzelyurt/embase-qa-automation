@regression @recorddetails
Feature: Record Details tests

  Background: Home page
    Given user opens Embase application
    Then Quick search page is opened
    And user opens Results page

  Scenario: Opening record details page
    Given user enters query dna on Results Page and performs a search
    Then the result set is not empty
    And user opens record #1 by clicking on title
    Then user is on Record Details page