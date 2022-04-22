@quicksearch
Feature: Quick Search tests

  Background: Home page
    Given user opens Embase application
    And Quick search page is opened
    And user opens Results page
    And user opens Quick Search page
    Then Quick search page is opened

  @C506417
  Scenario: Validate author first name is not present in search by field list
    When user clicks on Add field button on Quick Search Page
    Then Add field popup is opened on Quick Search Page
    Then Author first name is not a part of fields list on Quick Search Page
    And Author name is a part of fields list on Quick Search Page

  @C506446
  Scenario: Validate that the default search is broad search
    When user types query heart attack on quick search page
    And user clicks on Show results button on quick search
    Then user is on Results Page
    And search query is 'heart attack'/exp OR 'heart attack' OR (('heart'/exp OR heart) AND attack)

  @C506447
  Scenario Outline: Validate that user can edit default field selection from frequent fields list and run query on that field
    When user clicks on Change field button on quick search page
    Then Change field popup is opened on quick search page
    And user selects <field> from frequent field list on change field popup
    And user types query <query> on quick search page
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
    And user types query <query> on quick search page
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
    And user types query heart on quick search page
    And user clicks on Add field button on Quick Search Page
    And user selects Title from frequent field list on add field popup
    And user enters second line query heart on quick search page
    And user clicks on Show results button on quick search
    Then user is on Results Page
    And search query is heart:ab OR heart:ti

  @C506782
  Scenario Outline: Validate operators on Quick Search page
    When user types query 'heart infarction' on quick search page
    And user clicks on Add field button on Quick Search Page
    And user selects Title from frequent field list on add field popup
    And user enters second line query heart on quick search page
    And user selects <operator_Name> operator for second line query
    And user clicks on Show results button on quick search
    Then user is on Results Page
    And search query is <results_Query>
    Examples:
      | operator_Name | results_Query                                               |
      | AND           | ('heart infarction'/exp OR 'heart infarction') AND heart:ti |
      | NOT           | ('heart infarction'/exp OR 'heart infarction') NOT heart:ti |
      | OR            | 'heart infarction'/exp OR 'heart infarction' OR heart:ti    |

  @C506783
  Scenario: Validate footer text and links
    Then validate that footer elements are present:
      | footerElement    | text                                                                                                                           | link                                                                                            |
      | elsevierLogo     | n/a                                                                                                                            | https://www.elsevier.com/                                                                       |
      | relxLogo         | n/a                                                                                                                            | https://www.relx.com/                                                                           |
      | linkListAbout    | About Embase                                                                                                                   | https://www.elsevier.com/solutions/embase-biomedical-research                                   |
      | linkListLSS      | LSS                                                                                                                            | https://www.elsevier.com/rd-solutions/pharma-and-life-sciences-solutions                        |
      | linkListNews     | News                                                                                                                           | https://service.elsevier.com/app/answers/detail/a_id/29534/p/10882/supporthub/embase/related/1/ |
      | linkListHelp     | Help                                                                                                                           | https://service.elsevier.com/app/home/supporthub/embase                                         |
      | linkListWebinars | Webinars                                                                                                                       | https://service.elsevier.com/app/answers/detail/a_id/29878/supporthub/embase/kw/webinar/        |
      | linkListContact  | Contact support team                                                                                                           | https://service.elsevier.com/app/contact/supporthub/embase/                                     |
      | linkListTerms    | Terms and conditions                                                                                                           | https://www.elsevier.com/legal/elsevier-website-terms-and-conditions                            |
      | linkListPrivacy  | Privacy policy                                                                                                                 | https://www.elsevier.com/legal/privacy-policy                                                   |
      | cookieText       | We use cookies to help provide and enhance our service and tailor content. By continuing you agree to the use of cookies.      |                                                                                                 |
      | copyrightText    | Copyright © 2022 Elsevier Limited except certain content provided by third parties. Embase is a trademark of Elsevier Limited. |                                                                                                 |
      | linkUseOfCookies | use of cookies                                                                                                                 | https://www.elsevier.com/solutions/embase-biomedical-research/learn-and-support/cookies         |

  @C506490
  Scenario: Validate that the search page contain Search tips
    Then user verifies that text is displayed: Search tips

  @C506491
  Scenario: Validate that the Search tips goes to Q&A page
    When user clicks on Search tips element by text
    And user switches to 2nd window
    Then user verifies that text is displayed: Elsevier Support Center
    And user verifies that text is displayed: How do I search in Embase?
    And user verifies that text is displayed: Quick search

  @C507036
  Scenario: Text validation in "Limit to" section
    When user clicks Limit to button
    Then user verifies that text is displayed: Publication years
    And user verifies that text is displayed: Records added to Embase
    And user verifies that text is displayed: Evidence Based Medicine
    And user verifies that text is displayed: Cochrane Review
    And user verifies that text is displayed: Controlled Clinical Trial
    And user verifies that text is displayed: Systematic Review
    And user verifies that text is displayed: Randomized Controlled Trial
    And user verifies that text is displayed: Meta Analysis

  @C507037
  Scenario: Has all individual limits disabled if search terms are empty
    When user clicks Limit to button
    Then user verifies that checkbox Publication years is not clickable
    And user verifies that checkbox Records added to Embase is not clickable
    And user verifies that checkbox Cochrane Review is not clickable
    And user verifies that checkbox Controlled Clinical Trial is not clickable
    And user verifies that checkbox Systematic Review is not clickable
    And user verifies that checkbox Randomized Controlled Trial is not clickable
    And user verifies that checkbox Meta Analysis is not clickable

  @C507038
  Scenario: Search limit is only enabled and effective when corresponding checkbox is turned on and enabled
    When user types query heart attack on quick search page
    And user clicks Limit to button
    And user select Publication years checkbox
    And user select Records added to Embase checkbox
    Then user verifies that options From is enabled
    And user verifies that options To is enabled
    And user verifies that select Select date is enabled

  @C507039
  Scenario Outline: Max available year (MAX_YEAR) in <option> is always limited to the next year
    When user types query heart attack on quick search page
    And user clicks Limit to button
    And user select Publication years checkbox
    And user clicks <option> option
    Then user verifies that <option> drop-down is limited to the next year
    Examples:
      | option |
      | From   |
      | To     |

  @C507040
  Scenario: The option From contains Min year "< 1966"
    When user types query heart attack on quick search page
    And user clicks Limit to button
    And user select Publication years checkbox
    And user clicks From option
    Then user verifies that From drop-down contains < 1966

  @C507041
  Scenario: Default pre-selected years range: [MAX_YEAR - 10, MAX_YEAR].
    When user types query heart attack on quick search page
    And user waits 1 seconds
    And user clicks somewhere
    And user clicks on Limit to
    And user select Publication years checkbox
    Then user verifies that From default pre-selected years MAX_YEAR - 10
    And user verifies that To default pre-selected years MAX_YEAR

  @C507042
  Scenario: Min year of "To" is limited to current value of "From" select.
    When user types query heart attack on quick search page
    And user waits 1 seconds
    And user clicks somewhere
    And user clicks on Limit to
    And user select Publication years checkbox
    And user sets From option to 2020
    And user clicks To option
    Then user verifies that To min year is 2020

  @C507043
  Scenario: "From" value is bigger than "To" value then "To" value is automatically set to "From" value
    When user types query heart attack on quick search page
    And user clicks Limit to button
    And user select Publication years checkbox
    And user sets From option to 2010
    And user sets To option to 2012
    And user sets From option to 2020
    Then user verifies that To option selected 2020

  @C507045
  Scenario: Validate that the search page contain "Reset form" button
    Then user verifies that text is displayed: Reset form

  @C507046
  Scenario: Validate that the "Reset form" button is disabled
    Then user verifies the Reset form button is disabled

  @C507047
  Scenario: "Reset form" button is enabled when Limit section is expanded
    When user clicks Limit to button
    Then user verifies the Reset form button is enabled

  @C507048
  Scenario: "Reset form" button is enabled when New field is added
    When user clicks Add field button
    And user selects Title from frequent field list on add field popup
    Then user verifies the Reset form button is enabled

  @C507049
  Scenario: "Reset form" button is enabled when entering query
    When user types query heart attack on quick search page
    Then user verifies the Reset form button is enabled

  @C507050
  Scenario: "Reset form" button is enabled when Field type is changed from "Broad search" to "All fields"
    When user clicks on Change field button on quick search page
    And user selects All fields from frequent field list on change field popup
    Then user verifies the Reset form button is enabled

  @C507051
  Scenario: Returns the form to the default state
    When user clicks on Change field button on quick search page
    And user selects All fields from frequent field list on change field popup
    And user clicks Add field button
    And user selects Title from frequent field list on add field popup
    And user clicks Limit to button
    And user clicks Reset form button
    Then user verifies the Reset form button is disabled
    And user verifies that text is displayed: Broad search
    And user verifies that text is not displayed: Title
    And user verifies that text is not displayed: Publication years
    And user verifies that text is not displayed: Evidence Based Medicine

  @C507076
  Scenario Outline: Verify query building syntax
    When user clicks on Change field button on quick search page
    And user selects <field_name> from frequent field list on change field popup
    And user types query <query> on quick search page
    And user clicks on Show results button on quick search
    Then search query is <results_query>
    Examples:
      | query                          | field_name             | results_query                                 |
      | red blood                      | Title                  | 'red blood':ti                                |
      | red blood next/25 dna          | Title or Abstract      | ('red blood' NEXT/25 dna):ab,ti               |
      | vascular disease or dna        | Emtree term - exploded | 'vascular disease'/exp OR 'dna'/exp           |
      | 'heart attack'                 | All fields             | 'heart attack'                                |
      | blood and DNA                  | Broad search           | ('blood'/exp OR blood) AND ('dna'/exp OR dna) |
      | "young adults" AND "teenagers" | Author keywords        | 'young adults':kw AND 'teenagers':kw          |

  @C507139
  Scenario: Add a "Copy" button on the window after clicking on "Display Full Query"
    When user types query heart on quick search page
    And user clicks on Display Full Query button on quick search page
    Then Copy query popup button is present on Quick Search Page

  @C507692
  Scenario:Fields with autosuggest
    When user types query heart OR DNA on quick search page
    Then user verifies that all suggestion rows contains dna
    When user clears search
    And user types query DNA OR heart on quick search page
    Then user verifies that all suggestion rows contains heart
    And user verifies 2 suggestion row count is not empty
    When user clicks on heart disease element by text
    And user clicks on Show results button on quick search
    And search query is 'dna'/exp OR dna OR 'heart disease'/exp OR 'heart disease'
