@emtree_2022 @gmdn
Feature: Emtree GMDN terms 2022.01

  Background: Home page
    Given user opens Embase application
    Then Quick search page is opened
    And user opens Emtree page

  @C506770
  Scenario Outline: Verify that GMDN terms have expected definition: <term>
    When user enters Emtree query <term> in Emtree page
    And user clicks the Find Term button in Emtree page
    Then verify that the list of Emtree term results has exact match for term <term>
    When user clicks on the first element of the Emtree results list
    Then verify that the additional Emtree information contains the GMDN code <GmdnCode>
    Examples:
      | term                                | GmdnCode |
      | Mycobacterium tuberculosis test kit | 61517    |
      | sphygmomanometer                    | CT1677   |