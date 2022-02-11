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
    When user clicks on Search tips link
    And user switches to 2nd window
    Then user verifies that text is displayed: Elsevier Support Center
    And user verifies that text is displayed: How do I search in Embase?
    And user verifies that text is displayed: Quick search


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

  Scenario: Has all individual limits disabled if search terms are empty
    When user clicks Limit to button
    Then user verifies that checkbox Publication years is not clickable
    And user verifies that checkbox Records added to Embase is not clickable
    And user verifies that checkbox Cochrane Review is not clickable
    And user verifies that checkbox Controlled Clinical Trial is not clickable
    And user verifies that checkbox Systematic Review is not clickable
    And user verifies that checkbox Randomized Controlled Trial is not clickable
    And user verifies that checkbox Meta Analysis is not clickable

  Scenario: Search limit is only enabled and effective when corresponding checkbox is turned on and enabled
    When user enters query heart attack on quick search page
    And user clicks Limit to button
    And user select Publication years checkbox
    And user select Records added to Embase checkbox
    Then user verifies that options From is enabled
    And user verifies that options To is enabled
    And user verifies that select Select date is enabled

  Scenario Outline: Max available year (MAX_YEAR) in <option> is always limited to the next year
    When user enters query heart attack on quick search page
    And user clicks Limit to button
    And user select Publication years checkbox
    And user clicks <option> option
    Then user verifies that <option> drop-down is limited to the next year
    Examples:
    | option |
    | From   |
    | To     |

  Scenario: The option From contains Min year "< 1966"
    When user enters query heart attack on quick search page
    And user clicks Limit to button
    And user select Publication years checkbox
    And user clicks From option
    Then user verifies that From drop-down contains < 1966

  Scenario: Default pre-selected years range: [MAX_YEAR - 10, MAX_YEAR].
    When user enters query heart attack on quick search page
    And user clicks Limit to button
    And user select Publication years checkbox
    Then user verifies that From default pre-selected years MAX_YEAR - 10
    And user verifies that To default pre-selected years MAX_YEAR

  Scenario: Min year of "To" is limited to current value of "From" select.
    When user enters query heart attack on quick search page
    And user clicks Limit to button
    And user select Publication years checkbox
    And user sets From option to 2020
    And user clicks To option
    Then user verifies that To min year is 2020

  Scenario: "From" value is bigger than "To" value then "To" value is automatically set to "From" value
    When user enters query heart attack on quick search page
    And user clicks Limit to button
    And user select Publication years checkbox
    And user sets From option to 2010
    And user sets To option to 2012
    And user sets From option to 2020
    Then user verifies that To option selected 2020