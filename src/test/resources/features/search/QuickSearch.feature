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

  @C506446
  Scenario: Validate that the default search is broad search
    When user enters query heart attack on quick search page
    And user clicks on Show results button on quick search
    Then user is on Results Page
    And search query is 'heart attack'/exp OR 'heart attack' OR (('heart'/exp OR heart) AND attack)

  @C506447
  Scenario Outline: Validate that user can edit default field selection from frequent fields list and run query on that field
    When user clicks on Change field button on quick search page
    Then Change field popup is opened on quick search page
    And user selects <field> from frequent field list on change field popup
    And user enters query <query> on quick search page
    And user clicks on Show results button on quick search
    Then user is on Results Page
    And search query is <results_query>
    Examples:
      | field                            | query | results_query  |
      | All fields                       | heart | heart          |
      | Title                            | heart | heart:ti       |
      | Title or Abstract                | heart | heart:ab,ti    |
      | Title, Abstract, Author keywords | heart | heart:ti,ab,kw |
      | Author keywords                  | heart | heart:kw       |
      | Emtree term - exploded           | heart | 'heart'/exp    |

  @C506448
  Scenario Outline: Validate that user can edit default field selection from other fields list and run query on that field
    When user clicks on Change field button on quick search page
    Then Change field popup is opened on quick search page
    And user selects <field> from other field list on change field popup
    And user enters query <query> on quick search page
    And user clicks on Show results button on quick search
    Then user is on Results Page
    And search query is <results_query>
    Examples:
      | field                           | query                          | results_query                       |
      | Abstract                        | corona                         | corona:ab                           |
      | Affiliation                     | university of philadelphia     | 'university of philadelphia':ff     |
      | Device manufacturer name        | philips                        | philips:df                          |
      | Digital Object Identifier (DOI) | 10.23736/S0022-4707.21.11850-X | '10.23736/s0022-4707.21.11850-x':do |
      | ORCID                           | 0000 0001 6084 166x            | '0000 0001 6084 166x':oc            |
      | Publication type                | Article                        | article:it                          |
      | Embase accession number         | 2008579230                     | 2008579230:an                       |

  @C506449
  Scenario: Validate that user can add multiple search criteria on Quick Search page
    When user clicks on Change field button on quick search page
    Then Change field popup is opened on quick search page
    And user selects Abstract from other field list on change field popup
    And user enters query heart on quick search page
    And user clicks on Add field button on Quick Search Page
    And user selects Title from frequent field list on add field popup
    And user enters second line query heart on quick search page
    And user clicks on Show results button on quick search
    Then user is on Results Page
    And search query is heart:ab OR heart:ti


  Scenario: Text validation in "Limit to" section
    When user clicks on button Limit to
    Then user verifies that text is displayed: Publication years
    And user verifies that text is displayed: Records added to Embase
    And user verifies that text is displayed: Evidence Based Medicine
    And user verifies that text is displayed: Cochrane Review
    And user verifies that text is displayed: Controlled Clinical Trial
    And user verifies that text is displayed: Systematic Review
    And user verifies that text is displayed: Randomized Controlled Trial
    And user verifies that text is displayed: Meta Analysis

  Scenario: Has all individual limits disabled if search terms are empty
    When user clicks on button Limit to
