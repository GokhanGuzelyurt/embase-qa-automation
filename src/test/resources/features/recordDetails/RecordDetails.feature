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
      | Nutrition and Cancer | 73:3         |
    And title field is not empty on record details page
    And view author address button is present on Record details page

  @C488656
  Scenario: Validate that ORCID is displayed on record details page via view action
    Given user enters query '0000 0001 6084 166x':oc and performs a search
    Then the result set is not empty
    And user selects record #1 from the records list in Result Page
    And user clicks on View action link of Result Page
    Then user is on Record Details page
    And author ORCID 0000-0001-6084-166X is displayed on record details page

  @C488660
  Scenario: validating et al presents in authors
    Given user enters query L21814599 and performs a search
    Then the result set is not empty
    And record #1 of the results list contains et al. in authors
    And user opens record #1 by clicking on title
    Then user is on Record Details page
    And authors text in Record Details page contain et al.
