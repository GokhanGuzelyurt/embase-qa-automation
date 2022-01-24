@regression @elasticsearch
Feature: Elastic search queries

  Background: Home page
    Given user opens Embase application
    And Quick search page is opened

  @C488585
  Scenario Outline: Run queries on Elastic Search
    Given user opens Results page
    And user enters query <queries> and performs a search
    Then the result set is not empty
    Examples:
      | queries                                                                                                                                                                                                                                                                                                                                                                                               |
      | dinutuximab OR ch14.18 OR unituxin OR 'chimeric monoclonal antibody 14.18' OR '7sqy4zud30' OR '1363687-32-4' OR 'hu14.18' OR 'humanized antibody 14.18' OR treprostinil OR remodulin OR tyvaso OR orenitram OR 'rum6k67esg' OR 'h1fkg90039' OR '830354-48-8' OR '289480-64-4' OR '81846-19-7' OR '830354-48' OR 'ralinepag' OR 'apd811' OR '1187856-49-0' OR 'treprostinilo ferrer efg' OR 'treprost' |
      | ('brain hemorrhage' OR "intracerebral haemorrhage" OR “cerebral hemorrhage” OR ((cerebral OR brain OR intracerebral) AND (hemorrhage OR bleeding))) AND (“computed tomography” OR 'x-ray computed tomography' OR (computed AND tomography)) AND (expansion OR outcome)                                                                                                                                |

  @C488587
  Scenario: Validate that autosuggestions on Quick Search page works fine
    Given user enters query heart arrhythmia on quick search page
    Then the autosuggested term contains count greater than 100000

  @C488630
  Scenario: Validate that cytochrome c' is identified by the ES
    Given user opens Results page
    And user enters query 'cytochrome c`' AND l634537462 and performs a search
    Then the result set is not empty
    And the term cytochrome c' is highlighted in the title on Results page
    And user enters query 'cytochrome c' AND L2010517837 and performs a search
    Then the result set is not empty
    And the term cytochrome c is highlighted in the title on Results page

  @C488651
  Scenario Outline: Date fields validation
    Given user opens Results page
    And user enters query <queries> and performs a search
    Then the result set is not empty
    Examples:
      | queries                    |
      | [23-11-2020]/sd            |
      | [2020-11-23]/sd            |
      | [2021-04-14]/aip           |
      | [14-04-2021]/aip           |
      | test AND '2020-10-30':ld   |
      | cancer AND '2020-10-01':ld |
      | public AND '2020-11-04':ld |
      | metformin AND '2020-10':ld |
      | cell AND '2020':ld         |
      | test AND '30-10-2020':ld   |
      | cancer AND '01-10-2020':ld |
      | public AND '04-11-2020':ld |
      | metformin AND '10-2020':ld |
      | cell AND '2020':ld         |
      | '2020-01-31':pd            |
      | '2020-10':pd               |
      | '31-10-2020':pd            |
      | '10-2020':pd               |
      | '2020':pd                  |
      | '2019-09-19':dc            |
      | '2019-09':dc               |
      | '19-09-2019':dc            |
      | '09-2019':dc               |
      | '2019':dc                  |

  @C506453
  Scenario Outline: Date fields validation. Both date formats bring same number of results
    Given user opens Results page
    And user enters query <originalDateFormatQueries> and performs a search
    When get the number of search results for original date format
    And user enters query <changedDateFormatQueries> and performs a search
    And get the number of search results for changed date format
    Then the same number of both search results
    Examples:
      | originalDateFormatQueries  | changedDateFormatQueries   |
      | [23-11-2020]/sd            | [2020-11-23]/sd            |
      | [2021-11-23]/aip           | [23-11-2021]/aip           |
      | test AND '2020-10-30':ld   | test AND '30-10-2020':ld   |
      | cancer AND '2020-10-01':ld | cancer AND '01-10-2020':ld |
      | public AND '2020-11-04':ld | public AND '04-11-2020':ld |
      | '2020-01-31':pd            | '31-01-2020':pd            |
      | '2020-10':pd               | '10-2020':pd               |
      | '2019-09-19':dc            | '19-09-2019':dc            |
      | '2019-09':dc               | '09-2019':dc               |