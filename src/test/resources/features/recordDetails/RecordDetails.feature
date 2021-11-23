@regression @recorddetails
Feature: Record Details tests

  Background: Home page
    Given user opens Embase application
    Then Quick search page is opened
    And user opens Results page

  @C483739
  Scenario: Validating that ORCID is displayed on record details page and is clickable
    Given user enters query 0000-0001-6084-166X and performs a search
    Then the result set is not empty
    And user opens record #1 by clicking on title
    Then user is on Record Details page
    And author ORCID 0000-0001-6084-166X is displayed on record details page
    And the author ORCID 0000-0001-6084-166X is highlighted
    When user clicks on the highlighted ORCID 0000-0001-6084-166X
    Then user is on Results Page
    And search query is '0000-0001-6084-166x'/oc

  @C488649
  Scenario: Verify the UI of the Record details Page
    Given user enters query L2004679122 and performs a search
    Then the result set is not empty
    And user opens record #1 by clicking on title
    Then user is on Record Details page
    And Back to results link is displayed and enabled
    And pagination links are disabled on Record details page
    And pagination label contains value 1 of 1
    And source values on Record details page are displayed:
      | sourceMagazine       | sourceVolume |
      | Nutrition and Cancer | 73:3        |
    And title field is not empty on record details page
    And view author address button is present on Record details page



