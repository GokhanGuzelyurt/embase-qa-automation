@regression @recorddetails
Feature: Record Details tests

  Background: Home page
    Given user opens Embase application
    Then Quick search page is opened
    And user opens Results page

  Scenario: Validating that ORCID is displayed on record details page and is clickable
    Given user enters query 0000-0001-6084-166X and performs a search
    Then the result set is not empty
    And user opens record #1 by clicking on title
    Then user is on Record Details page
    And author ORCID is displayed on record details page
    And the author ORCID is highlighted
    When user clicks on the highlighted ORCID
    Then user is on Results Page
    And search query is '0000-0001-6084-166x'/oc
     