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
    Then text diabetes :all is displayed in PICO text box
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





