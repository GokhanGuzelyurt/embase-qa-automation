@citationinfo
Feature: ID+ login tests

  Background: Home page
    Given user opens Embase application
    Then Quick search page is opened

  Scenario: Verify search query for Article search: All fields
    Given user opens Citation Information search page
    When user runs Article Search:
      | articleTitle | authorName | authorNameExact | journalTitle    | journalTitleExact | ABBRJournalTitle | ABBRJournalTitleExact | ISSN     | CODEN | DOI                                   | volume | issue | firstPage | pubYears | fromYear | toYear |
      | heart        | katakami n | false           | atherosclerosis | true              | atherosclerosis  | true                  | 18791484 | athsb | 10.1016/j.atherosclerosis.2014.05.936 | 235    | 2     | 408       | true     | 2005     | 2018   |
    Then search query is ''heart':ti AND 'katakami n':au AND 'atherosclerosis'/jt AND 'atherosclerosis'/ta AND '18791484':is AND 'athsb':cd AND '10.1016/j.atherosclerosis.2014.05.936':do AND '235':vi AND '2':ip AND '408':sp AND [2005-2018]/py'