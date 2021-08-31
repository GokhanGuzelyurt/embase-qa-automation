@citationinfo
Feature: Citation Information tests

  Background: Home page
    Given user opens Embase application
    Then Quick search page is opened

  @C461620
  Scenario: Verify search query for Citation search: All fields
    When user opens Citation Information search page
    And user enters Citation Information
      | articleTitle | authorName | journalTitle    | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN     | CODEN | DOI                                   | volume | issue | firstPage | pubYears | fromYear | toYear |
      | heart        | katakami n | atherosclerosis | true              | atherosclerosis  | true                  | 18791484 | athsb | 10.1016/j.atherosclerosis.2014.05.936 | 235    | 2     | 408       | true     | 2005     | 2018   |
    Then search query is 'heart':ti AND 'katakami n':au AND 'atherosclerosis'/jt AND 'atherosclerosis'/ta AND '10.1016/j.atherosclerosis.2014.05.936':do AND 'athsb':cd AND '18791484':is AND '235':vi AND '2':ip AND '408':sp AND [2005-2018]/py

  @C461621
  Scenario: Verify search query for Citation search: Article title
    Given user opens Citation Information search page
    When user enters Citation Information
      | articleTitle | authorName | journalTitle | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN | CODEN | DOI | volume | issue | firstPage | pubYears | fromYear | toYear |
      | heart        |            |              |                   |                  |                       |      |       |     |        |       |           |          |          |        |
    Then search query is 'heart':ti

  @C461622
  Scenario: Verify search query for Citation search: Journal title (+exact)
    Given user opens Citation Information search page
    When user enters Citation Information
      | articleTitle | authorName | journalTitle    | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN | CODEN | DOI | volume | issue | firstPage | pubYears | fromYear | toYear |
      |              |            | atherosclerosis | true              |                  |                       |      |       |     |        |       |           |          |          |        |
    Then search query is 'atherosclerosis'/jt
    And user opens Citation Information search page
    When user enters Citation Information
      | articleTitle | authorName | journalTitle    | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN | CODEN | DOI | volume | issue | firstPage | pubYears | fromYear | toYear |
      |              |            | atherosclerosis | false             |                  |                       |      |       |     |        |       |           |          |          |        |
    Then search query is 'atherosclerosis':jt

  @C461623
  Scenario: Verify search query for Citation search: Abbreviated Journal Title (+exact)
    Given user opens Citation Information search page
    When user enters Citation Information
      | articleTitle | authorName | journalTitle | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN | CODEN | DOI | volume | issue | firstPage | pubYears | fromYear | toYear |
      |              |            |              |                   | atherosclerosis  | true                  |      |       |     |        |       |           |          |          |        |
    Then search query is 'atherosclerosis'/ta
    And user opens Citation Information search page
    When user enters Citation Information
      | articleTitle | authorName | journalTitle | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN | CODEN | DOI | volume | issue | firstPage | pubYears | fromYear | toYear |
      |              |            |              |                   | atherosclerosis  | false                 |      |       |     |        |       |           |          |          |        |
    Then search query is 'atherosclerosis':ta

  @C461624
  Scenario: Verify search query for Citation search: ISSN
    Given user opens Citation Information search page
    When user enters Citation Information
      | articleTitle | authorName | journalTitle | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN     | CODEN | DOI | volume | issue | firstPage | pubYears | fromYear | toYear |
      |              |            |              |                   |                  |                       | 18791484 |       |     |        |       |           |          |          |        |
    Then search query is '18791484':is

  @C461625
  Scenario: Verify search query for Citation search: CODEN
    Given user opens Citation Information search page
    When user enters Citation Information
      | articleTitle | authorName | journalTitle | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN | CODEN | DOI | volume | issue | firstPage | pubYears | fromYear | toYear |
      |              |            |              |                   |                  |                       |      | athsb |     |        |       |           |          |          |        |
    Then search query is 'athsb':cd

  @C461626
  Scenario: Verify search query for Citation search: DOI
    Given user opens Citation Information search page
    When user enters Citation Information
      | articleTitle | authorName | journalTitle | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN | CODEN | DOI                                   | volume | issue | firstPage | pubYears | fromYear | toYear |
      |              |            |              |                   |                  |                       |      |       | 10.1016/j.atherosclerosis.2014.05.936 |        |       |           |          |          |        |
    Then search query is '10.1016/j.atherosclerosis.2014.05.936':do

  @C461627
  Scenario: Verify search query for Citation search: Volume
    Given user opens Citation Information search page
    When user enters Citation Information
      | articleTitle | authorName | journalTitle | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN | CODEN | DOI | volume | issue | firstPage | pubYears | fromYear | toYear |
      |              |            |              |                   |                  |                       |      |       |     | 235    |       |           |          |          |        |
    Then search query is '235':vi


  @C461628
  Scenario: Verify search query for Citation search: Issue
    Given user opens Citation Information search page
    When user enters Citation Information
      | articleTitle | authorName | journalTitle | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN | CODEN | DOI | volume | issue | firstPage | pubYears | fromYear | toYear |
      |              |            |              |                   |                  |                       |      |       |     |        | 2     |           |          |          |        |
    Then search query is '2':ip

  @C461629
  Scenario: Verify search query for Citation search: First Page
    Given user opens Citation Information search page
    When user enters Citation Information
      | articleTitle | authorName | journalTitle | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN | CODEN | DOI | volume | issue | firstPage | pubYears | fromYear | toYear |
      |              |            |              |                   |                  |                       |      |       |     |        |       | 408       |          |          |        |
    Then search query is '408':sp

  @C461630
  Scenario: Verify that default date limits are applied at Results page (query from Citation search)
    Given user opens Citation Information search page
    When user enters Citation Information
      | articleTitle | authorName | journalTitle | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN | CODEN | DOI | volume | issue | firstPage | pubYears | fromYear | toYear |
      | heart        |            |              |                   |                  |                       |      |       |     |        |       |           | true     |          |        |
    Then search query is 'heart':ti AND [2011-2021]/py

  @C461631
  Scenario: Verify that Citation search form returns results on the second search round
    Given user opens Citation Information search page
    When user enters Citation Information
      | articleTitle | authorName | authorNameExact | journalTitle    | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN     | CODEN | DOI                                   | volume | issue | firstPage | pubYears | fromYear | toYear |
      | heart        | katakami n | true            | atherosclerosis | true              | atherosclerosis  | true                  | 18791484 | athsb | 10.1016/j.atherosclerosis.2014.05.936 | 235    | 2     | 408       | true     | 2003     | 2017   |
    Then search query is 'heart':ti AND 'katakami n':au AND 'atherosclerosis'/jt AND 'atherosclerosis'/ta AND '10.1016/j.atherosclerosis.2014.05.936':do AND 'athsb':cd AND '18791484':is AND '235':vi AND '2':ip AND '408':sp AND [2003-2017]/py
    When user opens Citation Information search page
    And user clicks Article search button
    Then search query is 'heart':ti AND 'katakami n':au AND 'atherosclerosis'/jt AND 'atherosclerosis'/ta AND '10.1016/j.atherosclerosis.2014.05.936':do AND 'athsb':cd AND '18791484':is AND '235':vi AND '2':ip AND '408':sp AND [2003-2017]/py

  @C461632
  Scenario: Verify that Citation search with date limits is executed successfully
    Given user opens Citation Information search page
    When user enters Citation Information
      | articleTitle | authorName | journalTitle | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN | CODEN | DOI | volume | issue | firstPage | pubYears | fromYear | toYear |
      | heart        |            |              |                   |                  |                       |      |       |     |        |       |           | true     | 2005     | 2010   |
    Then search query is 'heart':ti AND [2005-2010]/py

  @C461633
  Scenario: Verify the author name variants dialog box on Citation information page
    Given user opens Citation Information search page
    And user clicks on author name variants link
    Then Specify name variants dialog box is displayed
    And user enters authors information
      | authorLastName | authorFirstName | firstNameInitials | Affiliation | ORCID |
      | Smith          | John            | J.                | Chicago     |       |
    And user selects first result from the list
    And user clicks on Add to Search button
    And user clicks Article search button
    Then search query is 'smith,john'/an

