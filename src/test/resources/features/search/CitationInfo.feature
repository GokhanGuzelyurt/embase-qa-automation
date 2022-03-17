@citationinfo
Feature: Citation Information tests

  Background: Home page
    Given user opens Embase application
    Then Quick search page is opened

  @C477708
  Scenario: Verify search query for Citation search: All fields
    When user opens Citation Information search page
    And user enters Citation Information
      | articleTitle | authorName | journalTitle    | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN     | CODEN | DOI                                   | volume | issue | firstPage | pubYears | fromYear | toYear |
      | heart        | katakami n | atherosclerosis | true              | atherosclerosis  | true                  | 18791484 | athsb | 10.1016/j.atherosclerosis.2014.05.936 | 235    | 2     | 408       | true     | 2005     | 2018   |
    Then search query is 'heart':ti AND 'katakami n':au AND 'atherosclerosis'/jt AND 'atherosclerosis'/ta AND '10.1016/j.atherosclerosis.2014.05.936':do AND 'athsb':cd AND '18791484':is AND '235':vi AND '2':ip AND '408':sp AND [2005-2018]/py

  @C477709
  Scenario: Verify search query for Citation search: Article title
    Given user opens Citation Information search page
    When user enters Citation Information
      | articleTitle | authorName | journalTitle | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN | CODEN | DOI | volume | issue | firstPage | pubYears | fromYear | toYear |
      | heart        |            |              |                   |                  |                       |      |       |     |        |       |           |          |          |        |
    Then search query is 'heart':ti

  @C477710
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

  @C477711
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

  @C477712
  Scenario: Verify search query for Citation search: ISSN
    Given user opens Citation Information search page
    When user enters Citation Information
      | articleTitle | authorName | journalTitle | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN     | CODEN | DOI | volume | issue | firstPage | pubYears | fromYear | toYear |
      |              |            |              |                   |                  |                       | 18791484 |       |     |        |       |           |          |          |        |
    Then search query is '18791484':is

  @C477713
  Scenario: Verify search query for Citation search: CODEN
    Given user opens Citation Information search page
    When user enters Citation Information
      | articleTitle | authorName | journalTitle | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN | CODEN | DOI | volume | issue | firstPage | pubYears | fromYear | toYear |
      |              |            |              |                   |                  |                       |      | athsb |     |        |       |           |          |          |        |
    Then search query is 'athsb':cd

  @C477714
  Scenario: Verify search query for Citation search: DOI
    Given user opens Citation Information search page
    When user enters Citation Information
      | articleTitle | authorName | journalTitle | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN | CODEN | DOI                                   | volume | issue | firstPage | pubYears | fromYear | toYear |
      |              |            |              |                   |                  |                       |      |       | 10.1016/j.atherosclerosis.2014.05.936 |        |       |           |          |          |        |
    Then search query is '10.1016/j.atherosclerosis.2014.05.936':do

  @C477715
  Scenario: Verify search query for Citation search: Volume
    Given user opens Citation Information search page
    When user enters Citation Information
      | articleTitle | authorName | journalTitle | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN | CODEN | DOI | volume | issue | firstPage | pubYears | fromYear | toYear |
      |              |            |              |                   |                  |                       |      |       |     | 235    |       |           |          |          |        |
    Then search query is '235':vi


  @C477716
  Scenario: Verify search query for Citation search: Issue
    Given user opens Citation Information search page
    When user enters Citation Information
      | articleTitle | authorName | journalTitle | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN | CODEN | DOI | volume | issue | firstPage | pubYears | fromYear | toYear |
      |              |            |              |                   |                  |                       |      |       |     |        | 2     |           |          |          |        |
    Then search query is '2':ip

  @C477717
  Scenario: Verify search query for Citation search: First Page
    Given user opens Citation Information search page
    When user enters Citation Information
      | articleTitle | authorName | journalTitle | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN | CODEN | DOI | volume | issue | firstPage | pubYears | fromYear | toYear |
      |              |            |              |                   |                  |                       |      |       |     |        |       | 408       |          |          |        |
    Then search query is '408':sp

  @C477718
  Scenario: Verify that default date limits are applied at Results page (query from Citation search)
    Given user opens Citation Information search page
    When user enters Citation Information
      | articleTitle | authorName | journalTitle | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN | CODEN | DOI | volume | issue | firstPage | pubYears | fromYear | toYear |
      | heart        |            |              |                   |                  |                       |      |       |     |        |       |           | true     |          |        |
    Then search query is 'heart':ti AND [2012-2022]/py

  @C477719
  Scenario: Verify that Citation search form returns results on the second search round
    Given user opens Citation Information search page
    When user enters Citation Information
      | articleTitle | authorName | authorNameExact | journalTitle    | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN     | CODEN | DOI                                   | volume | issue | firstPage | pubYears | fromYear | toYear |
      | heart        | katakami n | true            | atherosclerosis | true              | atherosclerosis  | true                  | 18791484 | athsb | 10.1016/j.atherosclerosis.2014.05.936 | 235    | 2     | 408       | true     | 2003     | 2017   |
    Then search query is 'heart':ti AND 'katakami n':au AND 'atherosclerosis'/jt AND 'atherosclerosis'/ta AND '10.1016/j.atherosclerosis.2014.05.936':do AND 'athsb':cd AND '18791484':is AND '235':vi AND '2':ip AND '408':sp AND [2003-2017]/py
    When user opens Citation Information search page
    And user clicks Article search button
    Then search query is 'heart':ti AND 'katakami n':au AND 'atherosclerosis'/jt AND 'atherosclerosis'/ta AND '10.1016/j.atherosclerosis.2014.05.936':do AND 'athsb':cd AND '18791484':is AND '235':vi AND '2':ip AND '408':sp AND [2003-2017]/py

  @C477720
  Scenario: Verify that Citation search with date limits is executed successfully
    Given user opens Citation Information search page
    When user enters Citation Information
      | articleTitle | authorName | journalTitle | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN | CODEN | DOI | volume | issue | firstPage | pubYears | fromYear | toYear |
      | heart        |            |              |                   |                  |                       |      |       |     |        |       |           | true     | 2005     | 2010   |
    Then search query is 'heart':ti AND [2005-2010]/py

  @C477721
  Scenario: Verify the author name variants dialog box on Citation information page
    Given user opens Citation Information search page
    And user clicks on author name variants link
    Then Specify name variants dialog box is displayed
    And user enters authors information
      | authorLastName | authorFirstName | firstNameInitials | Affiliation | ORCID |
      | Smith          | John            | J.                | Chicago     |       |
    And user selects all authors from the citation info authors list
    And user clicks on Add to Search button
    And user clicks Article search button
    Then search query is 'smith,john'/an

