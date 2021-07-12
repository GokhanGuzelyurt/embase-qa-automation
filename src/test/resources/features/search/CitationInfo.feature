@citationinfo
Feature: ID+ login tests

  Background: Home page
    Given user opens Embase application
    Then Quick search page is opened

  Scenario: Verify search query for Article search: All fields
    When user opens Citation Information search page
    And user enters Citation Information
      | articleTitle | authorName | journalTitle    | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN     | CODEN | DOI                                   | volume | issue | firstPage | pubYears | fromYear | toYear |
      | heart        | katakami n | atherosclerosis | true              | atherosclerosis  | true                  | 18791484 | athsb | 10.1016/j.atherosclerosis.2014.05.936 | 235    | 2     | 408       | true     | 2005     | 2018   |
    Then search query is ''heart':ti AND 'katakami n':au AND 'atherosclerosis'/jt AND 'atherosclerosis'/ta AND '18791484':is AND 'athsb':cd AND '10.1016/j.atherosclerosis.2014.05.936':do AND '235':vi AND '2':ip AND '408':sp AND [2005-2018]/py'

#  @C253960
  Scenario: Verify search query for Article search: Article title
    Given user opens Citation Information search page
    When user enters Citation Information
      | articleTitle | authorName | journalTitle | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN | CODEN | DOI | volume | issue | firstPage | pubYears | fromYear | toYear |
      | heart        |            |              |                   |                  |                       |      |       |     |        |       |           |          |          |        |
    Then search query is 'heart':ti

  @C253962
  Scenario: Verify search query for Article search: Journal title (+exact)
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

  @C253963
  Scenario: Verify search query for Article search: Abbreviated Journal Title (+exact)
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

  @C253964
  Scenario: Verify search query for Article search: ISSN
    Given user opens Citation Information search page
    When user enters Citation Information
      | articleTitle | authorName | journalTitle | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN     | CODEN | DOI | volume | issue | firstPage | pubYears | fromYear | toYear |
      |              |            |              |                   |                  |                       | 18791484 |       |     |        |       |           |          |          |        |
    Then search query is '18791484':is

  @C253965
  Scenario: Verify search query for Article search: CODEN
    Given user opens Citation Information search page
    When user enters Citation Information
      | articleTitle | authorName | journalTitle | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN | CODEN | DOI | volume | issue | firstPage | pubYears | fromYear | toYear |
      |              |            |              |                   |                  |                       |      | athsb |     |        |       |           |          |          |        |
    Then search query is 'athsb':cd

  @C253966
  Scenario: Verify search query for Article search: DOI
    Given user opens Citation Information search page
    When user enters Citation Information
      | articleTitle | authorName | journalTitle | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN | CODEN | DOI                                   | volume | issue | firstPage | pubYears | fromYear | toYear |
      |              |            |              |                   |                  |                       |      |       | 10.1016/j.atherosclerosis.2014.05.936 |        |       |           |          |          |        |
    Then search query is '10.1016/j.atherosclerosis.2014.05.936':do

  @C253967
  Scenario: Verify search query for Article search: Volume
    Given user opens Citation Information search page
    When user enters Citation Information
      | articleTitle | authorName | journalTitle | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN | CODEN | DOI | volume | issue | firstPage | pubYears | fromYear | toYear |
      |              |            |              |                   |                  |                       |      |       |     | 235    |       |           |          |          |        |
    Then search query is '235':vi


  @C253968
  Scenario: Verify search query for Article search: Issue
    Given user opens Citation Information search page
    When user enters Citation Information
      | articleTitle | authorName | journalTitle | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN | CODEN | DOI | volume | issue | firstPage | pubYears | fromYear | toYear |
      |              |            |              |                   |                  |                       |      |       |     |        | 2     |           |          |          |        |
    Then search query is '2':ip

  @C253969
  Scenario: Verify search query for Article search: First Page
    Given user opens Citation Information search page
    When user enters Citation Information
      | articleTitle | authorName | journalTitle | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN | CODEN | DOI | volume | issue | firstPage | pubYears | fromYear | toYear |
      |              |            |              |                   |                  |                       |      |       |     |        |       | 408       |          |          |        |
    Then search query is '408':sp

  @C253970
  Scenario: Verify that default date limits are applied at Results page (query from Article search)
    Given user opens Citation Information search page
    When user enters Citation Information
      | articleTitle | authorName | journalTitle | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN | CODEN | DOI | volume | issue | firstPage | pubYears | fromYear | toYear |
      | heart        |            |              |                   |                  |                       |      |       |     |        |       |           | true     |          |        |
    Then search query is 'heart':ti AND [2011-2021]/py


