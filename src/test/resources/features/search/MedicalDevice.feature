@regression @search @medicaldevices
Feature: Medical Device tests

  Background: Home page
    Given user opens Embase application
    Then Quick search page is opened
    And user opens Medical Device search page

  @C467180
  Scenario: Adding a new device
    When user clicks on Add device name icon
    Then the title on the popup is Add device name
    When user enters the device name as medical thermometer
    And user clicks on Add device name button at medical device page
    Then the Add device name popup is closed
    And the device name medical thermometer is displayed on the form

  @C467181
  Scenario: Adding synonyms for the medical device
    When user clicks on Add device name icon
    Then the title on the popup is Add device name
    When user enters the device name as medical th
    And user selects medical thermometer as the autosuggested device name from the list
    And user clicks on Add device name button at medical device page
    Then the Add device name popup is closed
    And the device name medical thermometer is displayed on the form
    And user waits for synonyms to load
    When user clicks on Add Synonym icon
    Then the title on the popup is Add device name synonyms
    When user clicks on synonyms button at medical device page
    Then Medical device search page is opened
    When user clicks on results button at medical device page
    Then user is on Results Page
    And the result set is not empty

  @C467182
  Scenario: Validating that adverse device effect checkbox is selected by default
    When user clicks on Add device name icon
    Then the title on the popup is Add device name
    When user enters the device name as medical thermometer
    And user clicks on Add device name button at medical device page
    Then the Add device name popup is closed
    And that Adverse device effect checkbox is selected by default
    When user clicks on results button at medical device page
    Then user is on Results Page
    And search query is 'medical thermometer'/exp OR 'medical thermometer':ti,ab OR 'medical thermometer'/exp/'adverse device effect'

  @C467183
  Scenario: Selecting the device name from Emtree
    When user clicks on Add device name icon
    Then the title on the popup is Add device name
    When Emtree node medical device is selected
    And Emtree term implant is selected
    And Emtree child node bipolar implant is selected
    And user clicks on Add device name button at medical device page
    Then the Add device name popup is closed
    Then the device name bipolar implant is displayed on the form
    When user clicks on results button at medical device page
    Then the result set is not empty
    And search query is 'bipolar implant'/exp OR 'bipolar implant':ti,ab OR 'bipolar implant'/exp/'adverse device effect'

  @C467184
  Scenario: Selecting the device name and subheadings checkboxes in the medical device
    When user clicks on Add device name icon
    Then the title on the popup is Add device name
    When user enters the device name as medical thermometer
    And user clicks on Add device name button at medical device page
    Then the Add device name popup is closed
    When check box Clinical trial is selected
    And check box Device comparison is selected
    When user clicks on results button at medical device page
    Then the result set is not empty
    And search query is 'medical thermometer'/exp OR 'medical thermometer':ti,ab OR 'medical thermometer'/exp/'adverse device effect','clinical trial','device comparison'

  @C467185
  Scenario: Editing the device name on medical device search form
    When user clicks on Add device name icon
    Then the title on the popup is Add device name
    When user enters the device name as medical thermometer
    And user clicks on Add device name button at medical device page
    Then the Add device name popup is closed
    When user edits the device name
    Then the title on the popup is Add device name
    When user enters the device name as cardiac rhythm management device
    And user clicks on Add device name button at medical device page
    Then the Add device name popup is closed
    And the device name cardiac rhythm management device is displayed on the form

  @C467186
  Scenario: Removing the device name on medical device search form
    When user clicks on Add device name icon
    Then the title on the popup is Add device name
    When Emtree node medical device is selected
    And Emtree term implant is selected
    And Emtree child node bipolar implant is selected
    And user clicks on Add device name button at medical device page
    Then the Add device name popup is closed
    When user clicks on close icon to remove the device name
    And Show results button is disabled

  @C467187
  Scenario:Adding general adverse reactions on medical devices
    When user clicks on Add device name icon
    When user enters the device name as medical thermometer
    And user clicks on Add device name button at medical device page
    Then the Add device name popup is closed
    And the device name medical thermometer is displayed on the form
    When user clicks on Add/Edit default adverse effects syntax icon
    Then the title on the popup is Add adverse effects
    When user clicks on Add query snippet button at medical device page
    Then the general adverse effects popup is closed
    And the label General device adverse effect syntax is displayed for general adverse effects
    When user clicks on Show Results
    Then user is on Results Page
    And the result set is not empty

  @C467188
  Scenario: Adding device specific adverse  effects to medical devices
    When user clicks on Add device name icon
    When user enters the device name as medical thermometer
    And user clicks on Add device name button at medical device page
    Then the Add device name popup is closed
    And the device name medical thermometer is displayed on the form
    And user waits for synonyms to load
    When user clicks on device specific adverse effect terms icon
    Then the title on the popup is Add device specific adverse effects
    Then validate that a list of specific device adverse effects are present
    When user clicks on device specific adverse effect terms button at medical device page
    Then the specific device adverse effects popup is closed
    And the label device specific adverse effect terms is displayed for device specific adverse effects
    When user clicks on Show Results
    Then user is on Results Page
    And the result set is not empty

  @C467189
  Scenario: Adding limit options on the medical device page
    When user clicks on Add device name icon
    And user enters the device name as medical thermometer
    Then user clicks on Add device name button at medical device page
    And the device name medical thermometer is displayed on the form
    When user selects the value Humans from the limits dropdown
    And user clicks on Show Results
    Then user is on Results Page
    And search query is ('medical thermometer'/exp OR 'medical thermometer':ti,ab OR 'medical thermometer'/exp/'adverse device effect') AND [humans]/lim

  @C467190
  Scenario:  Searching for medical devices articles in a selected publication years range
    When user clicks on Add device name icon
    And user enters the device name as bandages and dressings
    Then user clicks on Add device name button at medical device page
    And the device name bandages and dressings is displayed on the form
    And check box Publication years is selected
    When user selects publication years range from 1990 to 2005
    And user clicks on Show Results
    Then user is on Results Page
    And search query is ('bandages and dressings'/exp OR 'bandages and dressings':ti,ab OR 'bandages and dressings'/exp/'adverse device effect') AND [1990-2005]/py

  @C467191
  Scenario: Selecting date range by date Picker
    When user clicks on Add device name icon
    And user enters the device name as bandages and dressings
    Then user clicks on Add device name button at medical device page
    And the device name bandages and dressings is displayed on the form
    When check box Records added to Embase (including end date): is selected
    And user clicks on DateRange picker and selects range from 01-01-2000 to 01-05-2010
    Then user clicks on Show Results
    Then user is on Results Page
    And search query is ('bandages and dressings'/exp OR 'bandages and dressings':ti,ab OR 'bandages and dressings'/exp/'adverse device effect') AND [1-1-2000]/sd NOT [02-05-2010]/sd

