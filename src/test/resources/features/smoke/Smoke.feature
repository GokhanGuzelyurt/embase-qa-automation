@regression @smoke @skip
Feature: Smoke tests

  Background: Home page
    Then Quick search page is opened
    When user closes survey
    And user closes message banner

  @C225343
  Scenario: Verify that all UI elements are present - Authors search pages
    Given user opens Authors search tab
    Then Authors page UI elements are displayed
    When user enters 'Smith' as the author last name
    And user clicks on Find Author button
    And I wait for author results
    Then 'Smith' is still present in lastName field
    Then Find articles button is displayed
    Then amount of author names is greater than 0

  @C225361
  Scenario: Verify that UI of Email Alert page is updated according to romeo
    Given set variable 'uniqueAlertName' to unique string 'C447_'
    When user logs in as Default User
    And user creates default Email Alert:
      | query | alertName        |
      | heart | $uniqueAlertName |
    And user opens Email Alerts page
    And user selects the email alert '$uniqueAlertName'
    Then email alert details are as follows:
      | query | alertName        | comments | emailAddresses           | emailFormat | contentSelection | frequency               | alertSent            | articles | lastResults | lastSent     |
      | heart | $uniqueAlertName |          | cmittesters@elsevier.com | HTML        | Citations only   | Every week on Wednesday | Alert is always sent | Included | n/a         | not sent yet |


  @C225364
  Scenario Outline: Verify data in cluster '<cluster>'
    Given user enters query 'hiv' and run Quick Search
    Then filter cluster <cluster> is displayed
    When user opens filter cluster <cluster>
    Examples:
      | cluster             |
      | Drug                |
      | Disease             |
      | StudyType           |
      | JournalTitle        |
      | PublicationType     |
      | PublicationYear     |
      | Authors             |
      | MedicalDevice       |
      | Subheading          |
      | Conference          |
      | Age                 |
      | Sources             |
      | Gender              |
      | DeviceTradeNames    |
      | DeviceManufacturers |
      | DrugTradeNames      |
      | DrugManufacturers   |

  # precond: user2 has a private folder for Saved Searched called SeleniumPrivateTestFolder
  @C225371
  Scenario: Verify that saved search 'save' box is rendered according to UCD template (Saved Searches page)
    Given set variable 'searchName' to unique string 'USER2_C445_'
    And user logs in as Default User
    When user performs quick search with parameters:
      | virus |
    And user saves the search number #1 and verify:
      | searchName  | folderTitle               | folderAccess   |
      | $searchName | SeleniumPrivateTestFolder | PRIVATE_FOLDER |
    And user selects folder on Saved Searches page:
      | folderName                | folderAccess   |
      | SeleniumPrivateTestFolder | PRIVATE_FOLDER |
    And user checks query name '$searchName' sub query #0
    Then Search Options - one item selected
    And the query '$searchName' sub query #0 contains X search results number
    When set variable 'savedSearchRow' to saved search query '$searchName' sub query #0
    And user edit saved search row '$savedSearchRow' query to 'virus OR heart'
    And user tests saved search row '$savedSearchRow' query
    Then saved search row '$savedSearchRow' tested query text is 'virus OR heart'
    When user clicks cancel saved search row '$savedSearchRow' query editing
    Then saved search row '$savedSearchRow' query text is 'virus'
    When user edit saved search row '$savedSearchRow' query to 'virus OR heart'
    And user tests saved search row '$savedSearchRow' query
    Then saved search row '$savedSearchRow' tested query text is 'virus OR heart'
    When user clicks 'edit' button for tested query at saved search row '$savedSearchRow'
    And user edit saved search row '$savedSearchRow' query to 'virus OR dna'
    And user tests saved search row '$savedSearchRow' query
    Then saved search row '$savedSearchRow' tested query text is 'virus OR dna'
    When user clicks 'save' button for tested query at saved search row '$savedSearchRow'
    Then the query '$searchName' sub query #0 text is 'virus OR dna'


  @C225375
  Scenario: Verify Quick search page UI
    Given user opens Quick Search page
    Then Quick Search page UI elements are displayed
    And publication years working correctly at Quick Search page
    When user adds new search line at Quick search page
    Then Quick Search new line #5 is displayed correctly

  @C225376
  Scenario: Verify Emtree query builder doesn't remove value on 2nd round
    Given user opens Emtree page
    When user runs query 'heart' on Emtree Search page
    And user selects suggested term 'heart'
    And user clicks Add to Query Builder button
    Then Emtree resultant query in Query Builder is ''heart'/exp'
    When user opens Emtree tab 'BY_FACET'
    And user clicks on Emtree node 'anatomical concepts'
    And user clicks Add to Query Builder button
    Then Emtree resultant query in Query Builder is ''heart'/exp OR 'anatomical concepts'/exp'


  @C225379
  Scenario: Verify queries are sent in email notifications
    Given user logs in as Default User
    And user opens Quick Search page
    When user performs quick search with parameters:
      | hiv |
    And user opens email records dialog for search #1 from history
    And user emails search results:
      | emailTo                  | emailCc | emailSubject              | emailComments | emailFormat | emailContent |
      | cmittesters@elsevier.com |         | C79173 Email queries test |               | HTML        |              |
    Then warning message is 'Your email has been sent.'

  @C225384
  Scenario Outline: Verify that correct number of records is displayed according to RPP selector
    Given user opens Quick Search page
    When user enters query 'heart' and run Quick Search
    And user selects <rpp> records per page
    And user goes to next page
    Then Correct number of records is displayed for page size <rpp>
    Examples:
      | rpp    |
      | rpp50  |
      | rpp100 |
      | rpp200 |

  @C225387
  Scenario: Verify that Hits,Synonyms labels are present in autoComplete on Results page
    Given user opens Results page
    When user enters search query as 'he'
    Then Autocomplete dropdown is not displayed
    When user enters search query as 'hea'
    Then Autocomplete dropdown is displayed


  @C225389
  Scenario Outline: Verify highlighting for abstracts is present
    Given user opens Quick Search page
    When user enters query '<query>' and run Quick Search
    And set variable 'rndRecID' to random record id with max size 25
    And user expands abstract tab for record id #$rndRecID
    Then Highlighting is displayed
    Examples:
      | query                                                  |
      | 'human':ab                                             |
      | 'human':ab and 'cancer':ab                             |
      | 'human':ab and 'cancer':ab or 'heart':ab               |
      | 'human':ab and 'cancer':ab or 'heart':ab not 'head':ab |


  @C225391
  Scenario Outline: Verify Result query after it is taken from Emtree
    Given user opens Emtree page
    When user runs query '<query>' on Emtree Search page
    And user selects suggested term '<suggestion>'
    And user switches Emtree checkboxes explode to 'false' and major to 'false'
    And user clicks on button Take this query
    Then Advanced Search page query is ''<suggestion>'/de'
    When user opens Emtree page
    And user switches Emtree checkboxes explode to 'true' and major to 'false'
    And user clicks on button Take this query
    Then Advanced Search page query is ''<suggestion>'/exp'
    When user opens Emtree page
    And user switches Emtree checkboxes explode to 'false' and major to 'true'
    And user clicks on button Take this query
    Then Advanced Search page query is ''<suggestion>'/mj'
    When user opens Emtree page
    And user switches Emtree checkboxes explode to 'true' and major to 'true'
    And user clicks on button Take this query
    Then Advanced Search page query is ''<suggestion>'/exp/mj'
    Examples:
      | query          | suggestion     |
      | heart          | heart          |
      | lometrexol     | lometrexol     |
      | animal disease | animal disease |
      | dental device  | dental device  |

  @C225392
  Scenario Outline: Verify that check-boxes on Mapping ribbon tab are unchecked if search is taken from Emtree
    Given user opens Emtree page
    When user runs query '<query>' on Emtree Search page
    And user selects suggested term '<suggestion>'
    And user clicks on button Take this query
    Then Advanced Search Page UI elements are taken from Emtree
    Examples:
      | query          | suggestion     |
      | heart          | heart          |
      | lometrexol     | lometrexol     |
      | animal disease | animal disease |
      | dental device  | dental device  |


  @C225394
  Scenario: Verify that all Results page elements are displayed when 'Back to results' clicked
    Given set variable 'rndRecID' to random record id with max size 25
    When user enters query 'heart' and run Quick Search
    And user performs View for record #$rndRecID on results page
    And user goes back to Results Page
    Then Results page UI elements are displayed
    When user performs View for records 1,2 on results page
    And user goes back to Results Page
    Then Results page UI elements are displayed
    When user clicks at record #$rndRecID title
    And user goes back to Results Page
    Then Results page UI elements are displayed

  @C360776
  Scenario Outline: Verify that document details are accessible for all items in results list
    When user enters query '<query>' and run Quick Search
    And user selects rpp200 records per page
    And user selects all records on Results page
    And user performs action View on results page
    Then total showing record numbers is 200
    Examples:
      | query |
      | heart |
      | dna   |
      | blood |

  @C225397
  Scenario: Verify that records list is not displayed when all queries are deleted
    Given user opens Quick Search page
    When user enters query 'heart' and run Quick Search
    And user deletes all searches from history
    When user enters search criteria 'rna' and perform a search
    When user enters search criteria 'dna' and perform a search
    And user deletes all searches from history

  @C225398
  Scenario: Verify Registration page UI
    Given user clicks on Sign In button
    And set variable 'email' to unique valid email
    And user enters email id as $email and click Continue
    Then Register page UI elements are displayed

  @C225399
  Scenario: Verify Emtree page UI
    Given user opens Emtree page
    Then Emtree search page UI elements are displayed

  @C225342
  Scenario: Verify that all UI elements are present - Article search pages
    Given user opens Article search tab
    Then Article page UI elements are displayed

  @C225365
  Scenario Outline: Verify that applied/removed filter items <cluster> are displayed in the Search Query
    Given user enters query 'heart' and run Quick Search
    Then results query is ''heart'/exp OR heart'
    When user applies filter cluster <cluster> with option '<filterValue>'
    Then results query for search number #2 is '#1 AND '<filterValue>'<ending>'
    And filter option '<filterValue>' for cluster <cluster> is active
    When user removes filter cluster <cluster> with option '<filterValue>'
    Then filter option '<filterValue>' for cluster <cluster> is inactive
    And results query for search number #3 is '#1'

    Examples:
      | cluster         | filterValue                                   | ending |
      | Drug            | unclassified drug                             | /dd    |
      | Disease         | heart infarction                              | /dm    |
      | StudyType       | human                                         | /de    |
      | JournalTitle    | Journal of the American College of Cardiology | /jt    |
      | PublicationType | Article                                       | /it    |

  @C225378
  Scenario: Verify email records sent
    Given user logs in as Default User
    And user opens Quick Search page
    When user performs quick search with parameters:
      | hiv |
    And user opens email records dialog for search #1 from history
    And user emails search results:
      | emailTo                  | emailCc | emailSubject              | emailComments | emailFormat | emailContent |
      | cmittesters@elsevier.com |         | C79173 Email queries test |               | HTML        |              |
    Then warning message is 'Your email has been sent.'

  @C225385
  Scenario: Verify that Hits,Synonyms labels are present in autoComplete on Quick Search page
    Given user opens Quick Search page
    When user enters Quick search query as 'he'
    Then Emtree Autosuggest dropdown is not displayed
    When user enters Quick search query as 'hea'
    Then Emtree Autosuggest dropdown is displayed

  @C225380
  Scenario Outline: Verify that it is possible to view the specific record if more than 25 records are displayed per page
    Given user opens Quick Search page
    When user enters query 'heart' and run Quick Search
    And user selects <rpp> records per page
    And user goes to next page
    Then the specific record is displayed correctly for page size <rpp>
    Examples:
      | rpp    |
      | rpp50  |
      | rpp100 |
# FIXME unstable | rpp200 |

  @C225377
  Scenario: Verify that click on Back to Results button moves user to respective page
    Given user opens Quick Search page
    When user enters query ''brain surgery':ti' and run Quick Search
    And user gets middle page as variable 'midPage' on Results page
    And user goes to page #$midPage
    And user clicks at random record title from page #$midPage
    And user goes back to Results Page
    Then page #$midPage is opened
    When user gets last page as variable 'lastPage' on Results page
    And user goes to page #$lastPage
    And user clicks at random record title from page #$lastPage
    And user goes back to Results Page
    Then page #$lastPage is opened

  @C225368
  Scenario: Verify the UI of the Saved clipboard page
    Given user logs in as Default User
    When user deletes all saved clipboards
    And user enters query 'dna' and run Quick Search
    And user saves the records '1' on clipboard page with name 'autoclipboard1' and verify saved clipboard
    And user saves the records '1,2' on clipboard page with name 'autoclipboard2' and verify saved clipboard
    And user opens Saved Clipboard page
    Then Saved clipboards page contain 2 records
    And dropdown and highlighting are displayed at saved clipboard

  @C225340
  Scenario: Verify Register ID redemption page UI
    Given user opens bulk ID registration page
    Then bulk ID registration page UI elements are displayed

