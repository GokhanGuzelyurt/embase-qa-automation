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

  @C506719
  Scenario Outline: Results can be 0 when searching for <query>
    Given user opens Results page
    And user enters query <query> and performs a search
    Then the result set is empty
    Examples:
      | query              |
      | l610882955 AND bsc |

  @C506452
  Scenario: Verify fields on export dialog box for Word format
    When user opens Results page
    And user enters query [23-11-2020]/sd and performs a search
    And user selects records 1 from the records list on Results page and click on export
    And user selects Format MS Word in export window
    And user selects checkbox Title in export window
    And user selects checkbox Author names in export window
    And user selects checkbox Author address in export window
    And user selects checkbox Editors in export window
    And user selects checkbox Source title in export window
    And user clicks on Export button in modal window
    And user waits 1 seconds
    And user switches to Embase - Download tab
    Then user verifies that text is displayed: Export ready for download
    And user verifies that text is displayed: Download
    And user verifies that url contains /search/download

  @C506453
  Scenario Outline: Date fields validation. Both date formats bring same number of results
    Given user opens Results page
    And user enters query <originalDateFormatQueries> and performs a search
    When get the number of search results for original date format
    And user enters query <changedDateFormatQueries> and performs a search
    And get the number of search results for changed date format
    Then the same number of search results for original date and changed date
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


  @C531895
  Scenario: Verify paginating records over 10k does not cause error on results page
    Given user opens Results page
    And user enters query dna and performs a search
    When user goes to 402 page
    Then no warning message is displayed
    When user goes to 900 page
    Then no warning message is displayed

  @C531984
  Scenario Outline: Verify the publication date range
    Given user opens Results page
    And user enters query <pubDate> and performs a search
    When get the number of search results for original date format
    And user enters query <changedFormatPubDate> and performs a search
    And get the number of search results for changed date format
    Then the same number of search results for original date and changed date
    Examples:
      | pubDate                       | changedFormatPubDate          |
      | [01-03-2020 to 31-08-2020]/pd | [2020-03-01 to 2020-08-31]/pd |
      | [2019-01 to 2020-01]/pd       | [01-2019 to 01-2020]/pd       |

  @BE
  Scenario: Create export records REST. The job ID should be changed
    When user opens Results page
    And user enters query [23-11-2020]/sd and performs a search
    And user selects records 1 from the records list on Results page and click on export
    And user selects Format MS Word in export window
    And user selects checkbox Title in export window
    And user selects checkbox Author names in export window
    And user selects checkbox Author address in export window
    And user selects checkbox Editors in export window
    And user selects checkbox Source title in export window
    And user clicks on Export button in modal window
    And I capture UI cookies
    And I set the UI cookies captured in the request body
    And user waits 1 seconds
    And user switches to Embase - Download tab
    And user clicks on download button on Export page
    And user set variable job_id from url
    And I set the Public API endpoint for the http request to /rest/spring/export/records
    And I set the queryParam apikey with value 6196bbd774a02f6bcaf5b6f2f9e9c3a3
    And I set the queryParam insttoken with value 12f6d639ad436c2288a67e900477930b
    When I execute the http request with method POST
    And user waits 1 seconds
    And user reloads page
    And user waits 5 seconds
    And user set variable job_id_chaged from url
#    And user waits 5 seconds