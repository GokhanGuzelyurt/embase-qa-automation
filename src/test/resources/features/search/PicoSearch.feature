@regression @search @picosearch
Feature: Pico Search tests

  Background: Home page
    Given user opens Embase application
    Then Quick search page is opened
    And user opens Pico search page

  @C526020
  Scenario Outline: It is possible to find term on PICO using quotes, comma, parenthesis and square brackets
    Given user enters <query> in population text box
    Then autosuggestion on PICO contains term <term>
    Examples:
      | query                                                                                           | term                                                                                            |
      | 5 (2 bromovinyl) 2' deoxyuridine                                                                | 5 (2 bromovinyl) 2' deoxyuridine                                                                |
      | ammonium trichloro(dioxyethylene o,o')tellurate                                                 | ammonium trichloro(dioxyethylene o,o')tellurate                                                 |
      | 2'' deoxy 2'' (dimethylamino)etoposide                                                          | 2'' deoxy 2'' (dimethylamino)etoposide                                                          |
      | 5 [2 (2,6 dimethylmorpholino) 4 morpholinopyrido[2,3 d]pyrimidin 7 yl] 2 methoxybenzenemethanol | 5 [2 (2,6 dimethylmorpholino) 4 morpholinopyrido[2,3 d]pyrimidin 7 yl] 2 methoxybenzenemethanol |

  @C531897
  Scenario: Term is prefilled when free-text modifier is opened for editing
    When user enters diabetes in population text box
    And user selects Use diabetes as a free term from autosuggestions list
    Then tag diabetes :all is displayed in PICO text box
    When user clicks on down arrow of the free term
    When user clicks Edit free term text button
    Then text diabetes is displayed in population text box
    And autosuggestions list is displayed on PICO

  @C531898
  Scenario Outline: Verify that find best term works properly
    When user enters <term> in population text box
    Then autosuggestions list is displayed on PICO
    And the autosuggestions list on PICO contains <options>
    Examples:
      | term  | options                                                                                                                                                                                                                                                                                            |
      | hear  | heart disease,heart deficiencyuse: heart disease,heart function,heart deformityuse: heart disease,heart diseasesuse: heart disease,heart disorderuse: heart disease,heart dysfunctionuse: heart disease,heart muscle functionuse: heart function,heart                                             |
      | orang | orange (fruit),orange juice,orange fruit juiceuse: orange juice,oranges juiceuse: orange juice,orangutan,orang utanuse: orangutan,orange jasmineuse: Murraya exotica,Orang Asli,Orang Aslisuse: Orang Asli,orang-utan (major species)use: Pongo abelii,orang-utan (major species)use: Pongo abelii |

  @C531901
  Scenario: Free term text with wildcard is not ignored on the second round of search from PICO
    When user enters heart* in intervention text box
    Then autosuggestions list is displayed on PICO
    And user selects Use heart* as a free term from autosuggestions list
    And user clicks on Show results button on PICO search
    Then user is on Results Page
    When user opens Pico search page
    Then Show results button is enabled on PICO

  @C531902
  Scenario Outline: tn,dn options is added to synonyms
    When user enters heart in outcome text box
    And user selects heart from autosuggestions list
    And user clicks Add 4 synonyms button
    And user clicks on down arrow of the synonym term
    Then synonym options on PICO contains <options>
    Examples:
      | options                                                                                                                                                                                                                                   |
      | Drug trade name or Device trade name:tn,dn;Drug trade name:tn;Device trade name:dn;Title:ti;Abstract:ab;Author keywords:kw;Title or Abstract:ti,ab;Title, Abstract or Author keywords:ti,ab,kw;Title, Abstract or Trade names:ti,ab,tn,dn |

  @C532721
  Scenario: focus removed from PICO token when other Emtree node is selected
    Given user enters congenital cancer in emtree search input
    And autosuggestions list is displayed on PICO
    And user selects congenital cancer from autosuggestions list
    And congenital cancer is highlighted in emtree on PICO
    When user clicks on Emtree node congenital tumor on PICO
    When user clicks on Emtree node fetal tumor on PICO
    And add to query for Emtree node fetal tumor is selected
    Then fetal tumor is highlighted in emtree on PICO
    And congenital tumor is not highlighted in emtree on PICO
    When user clicks on Show results button on PICO search
    Then user is on Results Page
    And the result set is not empty
    And search query is 'congenital cancer'/exp OR 'fetal tumor'/exp

  @C531903
  Scenario: switch ON/OFF synonyms
    When user enters heart in outcome text box
    And user selects heart from autosuggestions list
    And user clicks Add 4 synonyms button
    Then synonyms popover is displayed
    And user verifies that text is displayed: Select all synonyms
    And user clicks on down arrow of the synonym term
    And user clicks Remove synonyms button
    And user verifies that text is not displayed: Select all synonyms
    When user clicks on down arrow of the free term
    And user clicks Add synonyms button
    And user clicks 4 synonyms :all button
    Then synonyms popover is displayed
    When user unselects Select all synonyms checkbox in the right panel
    Then user verifies that text is displayed: Add 4 synonyms
    And all the checkboxes are unselected in the synonyms right panel

  @C531904
  Scenario Outline: PICO lines are restored in the initial order after reset
    Then following <fields> are available on PICO page
    Then user verifies the Reset form button is disabled
    When user clicks Remove field of Intervention field
    When user clicks Remove field of Comparison field
    Then following <fields1> are not available on PICO page
    And user verifies the Reset form button is enabled
    When user clicks Reset form button
    Then following <fields> are available on PICO page
    Then user verifies the Reset form button is disabled
    Examples:
      | fields                                                  | fields1                 |
      | Population,Intervention,Comparison,Outcome,Study design | Intervention,Comparison |

  @C526408
  Scenario: It is possible to add synonyms for terms containing quotes, commas, paranthesis, square brackets
    Given user enters 5 (2 bromovinyl) 2' deoxyuridine in emtree search input
    And user selects 5 (2 bromovinyl) 2' deoxyuridine from autosuggestions list
    And user clicks on Emtree node pyrimidine nucleoside on PICO
    And user clicks on Emtree node 3' o benzyltrifluridine on PICO
    And add to query for Emtree node 3' o benzyltrifluridine is selected
    And user clicks on Display Full Query button on PICO search page
    Then query '5 (2 bromovinyl) 2` deoxyuridine'/exp OR '3` o benzyltrifluridine'/exp is displayed when display full query link is clicked

  @C544502
  Scenario: Term added from the Emtree pane should respect active input cursor position
    When user enters diabetes in population text box
    And user selects Use diabetes as a free term from autosuggestions list
    And tag diabetes :all is displayed in PICO text box
    When user enters congenital cancer in emtree search input
    And user selects congenital cancer from autosuggestions list
    And tag OR is displayed in PICO text box
    And tag congenital cancer /exp is displayed in PICO text box
    And user clicks on Show results button on PICO search
    Then search query is diabetes OR 'congenital cancer'/exp

  @C544507
  Scenario: PICO allows to group terms with parentheses
    When user enters diabetes and (human OR animal) in population text box
    And user clicks somewhere
    And tag diabetes and (human or animal) :all is displayed in PICO text box
    And user clicks on Show results button on PICO search
    Then search query is 'diabetes and (human or animal)'

  @C544508
  Scenario: Verify on PICO default strategy selector can be changed
     Given user enters diabetes in population text box
     And user selects diabetes from autosuggestions list
     And tag diabetes mellitus /exp is displayed in PICO text box
     When user clicks on default strategy change dropdown
     And user selects Major focus from strategy drop down
     And user enters insulin in population text box
     And user selects insulin from autosuggestions list
     And tag insulin /mj is displayed in PICO text box
     And user clicks Add 30 synonyms button
     When user clicks on Show results button on PICO search
     Then user is on Results Page
     And search query is 'diabetes mellitus'/exp OR 'insulin'/mj OR 'actrapid insulin' OR 'actrapid mc' OR 'cross linked insulin' OR 'destripeptide insulin' OR 'fish insulin' OR 'humilin' OR 'iletin ii' OR 'immunoinsulin' OR 'in 105' OR 'in105' OR 'initard' OR 'insulin' OR 'insulin (animal source)' OR 'insulin actrapid' OR 'insulin hnc' OR 'insulin novo actrapid' OR 'insulin snc' OR 'insulina pronta lilly' OR 'insuline' OR 'insulinum' OR 'iodinated insulin' OR 'iszilin' OR 'maxirapid' OR 'monotard human' OR 'monotard insulin' OR 'neusulin' OR 'novolin' OR 'oralin' OR 'oro insulin' OR 'teleost insulin'
     

     
