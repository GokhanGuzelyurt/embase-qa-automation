@export @BE
Feature: Export queries

  Background: Home page
    Given user opens Embase application
    And Quick search page is opened

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

  @C533342
  Scenario: Create export records REST. The job ID should be changed
    When user opens Results page
    And user enters query [23-11-2020]/sd and performs a search
    And user selects records 1 from the records list on Results page and click on export
    And user selects Format MS Word in export window
    And user selects checkbox Title in export window
    And user clicks on Export button in modal window
    And I set the endpoint for the http request to /rest/spring/export/records
    And user captures session UI cookies
    And I set the session UI cookies captured in the request body
    And user switches to Embase - Download tab
    And user saves download url job id to variable job_id
    And I set the request body with content from file \jsonFiles\MS_WORD_RECORDS.json
    And I set the request header Content-Type with value application/json
    And I execute the http request with method POST
    And user reloads page
    And user saves download url job id to variable job_id_changed
    Then user checks that job_id and job_id_changed values do not match

  @C543360
  Scenario Outline: Create export records. It should provide you with the document according to your UI selection.
    When user opens Results page
    And user enters query [23-11-2020]/sd and performs a search
    And user selects records 1 from the records list on Results page and click on export
    And user saves title from records 1 to variable titleText
    And user selects Format <Format> in export window
    And user selects checkbox <checkbox> in export window
    And user clicks on Export button in modal window
    And user waits 2 seconds
    And user switches to Embase - Download tab
    And user verifies that text is displayed: Download
    And user clicks on download button on Export page
    And user waits 2 seconds
    Then user checks downloaded <FilePath> document contains <Text>
    Examples:
      | Format     | FilePath                 | checkbox | Text                                                                |
      | MS Excel   | \downloads\records.xlsx  | Title    | TITLE,titleText                                                     |
      | MS Word    | \downloads\records.docx  | Title    | TITLE,titleText                                                     |
      | PDF        | \downloads\records.pdf   | Title    | TITLE,titleText                                                     |
      | XML        | \downloads\records.xml   | skip     | titleText                                                           |
      | Plain Text | \downloads\records.txt   | Title    | TITLE,titleText                                                     |
      | CSV        | \downloads\records.csv   | Title    | TITLE,titleText                                                     |
      | RIS format | \downloads\records.ris   | skip     | titleText                                                           |

  @C543361
  Scenario Outline: Create export records. It should provide the document according to REST data.
    When user opens Results page
    And user enters query [23-11-2020]/sd and performs a search
    And user selects records 1 from the records list on Results page and click on export
    And user selects Format <Format> in export window
    And user selects checkbox <checkbox> in export window
    And user clicks on Export button in modal window
    And user waits 1 seconds
    And I set the endpoint for the http request to /rest/spring/export/records
    And user captures session UI cookies
    And I set the session UI cookies captured in the request body
    And user switches to Embase - Download tab
    And I set the request body with content from file \jsonFiles\<bodyFormatValue>.json
    And I set the request header Content-Type with value application/json
    And I execute the http request with method POST
    And user reloads page
    And user clicks on download button on Export page
    And user waits 2 seconds
    Then user checks downloaded <FilePath> document contains <Text>
    Examples:
      | Format     | bodyFormatValue     | FilePath                 | checkbox | Text |
      | MS Excel   | EXCEL_ROW_RECORDS   | \downloads\records.xlsx  | Title    | SOURCE,Current Issues in Molecular Biology |
      | MS Word    | MS_WORD_RECORDS     | \downloads\records.docx  | Title    | SOURCE,Current Issues in Molecular Biology |
      | PDF        | PDF_RECORDS         | \downloads\records.pdf   | Title    | SOURCE,Current Issues in Molecular Biology |
      | XML        | XML_RECORDS         | \downloads\records.xml   | skip     | Current Issues in Molecular Biology        |
      | Plain Text | TEXT_RECORDS        | \downloads\records.txt   | Title    | SOURCE,Current Issues in Molecular Biology |
      | CSV        | CSV_ROW_RECORDS     | \downloads\records.csv   | Title    | SOURCE,Current Issues in Molecular Biology |
      | RIS format | RIS_RECORDS         | \downloads\records.ris   | skip     | Current Issues in Molecular Biology        |