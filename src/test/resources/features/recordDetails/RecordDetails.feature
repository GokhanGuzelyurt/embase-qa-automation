@regression @recorddetails
Feature: Record Details tests

  Background: Home page
    Given user opens Embase application
    Then Quick search page is opened
    And user opens Results page

  @C483739
  Scenario: Validating that ORCID is displayed on record details page and is clickable
    Given user enters query 0000-0001-6084-166X and performs a search
    Then the result set is not empty
    And user opens record #1 by clicking on title
    Then user is on Record Details page
    And author ORCID 0000-0001-6084-166X is displayed on record details page
    And the author ORCID 0000-0001-6084-166X is highlighted
    When user clicks on the highlighted ORCID 0000-0001-6084-166X
    Then user is on Results Page
    And search query is '0000-0001-6084-166x'/oc

  @C488649
  Scenario: Verify the UI of the Record details Page
    Given user enters query L2004679122 and performs a search
    Then the result set is not empty
    And user opens record #1 by clicking on title
    Then user is on Record Details page
    And Back to results link is displayed and enabled
    And pagination links are disabled on Record details page
    And pagination label contains value 1 of 1
    And source values on Record details page are displayed:
      | sourceMagazine       | sourceVolume |
      | Nutrition and Cancer | 73:3         |
    And title field is not empty on record details page
    And view author address button is present on Record details page

  @C488656
  Scenario: Validate that ORCID is displayed on record details page via view action
    Given user enters query '0000 0001 6084 166x':oc and performs a search
    Then the result set is not empty
    And user selects record #1 from the records list in Result Page
    And user clicks on View action link of Result Page
    Then user is on Record Details page
    And author ORCID 0000-0001-6084-166X is displayed on record details page

  @C488660
  Scenario: validating et al presents in authors
    Given user enters query L21814599 and performs a search
    Then the result set is not empty
    And record #1 of the results list contains et al. in authors
    And user opens record #1 by clicking on title
    Then user is on Record Details page
    And authors text in Record Details page contain et al.

  Scenario: Validating when original title and translated title are available
    Given user enters query L2011118590 and performs a search
    Then the result set is not empty
    And user opens record #1 by clicking on title
    Then user is on Record Details page
    Then show original title link is displayed
    And user clicks on Show original link to verify:
      | originalTitle                                                                                                                      | translatedTitle                                                                                                     |
      | Exposição de pacientes da emergência pediátrica a exames de imagem, na atualidade e em tempos de COVID-19: Uma revisão integrativa | Exposure of pediatric emergency patients to imaging exams, nowadays and in times of covid-19: An integrative review |

  Scenario: Validate the title when no title is available
    Given user enters query L281557567 and performs a search
    Then the result set is not empty
    And user opens record #1 by clicking on title
    Then user is on Record Details page
    And the title on the Record details page is displayed as [No title available]

  Scenario: Validate the abstract when no abstract is available
    Given user enters query L2002408824 and performs a search
    Then the result set is not empty
    And user opens record #1 by clicking on title
    Then user is on Record Details page
    And the abstract on the Record details page is displayed as [No abstract available]

  Scenario: Validate when both original and translated abstract both are present
    Given user enters query L2010501392 and performs a search
    Then the result set is not empty
    And user opens record #1 by clicking on title
    Then user is on Record Details page
    Then show original abstract link is displayed
    And user clicks on Show original abstract link
    Then original abstract is:
      | originalAbstract                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | Introduction: La promotion de la santé mentale est encore assez peu connue des psychologues et insuffisamment portée par ceux-ci, notamment parce qu'elle s'appuie sur des concepts et des données issues de la Santé Publique. De plus, elle est portée par une approche dite « positive » de la santé — qui se distingue des modèles de déficits — dont le type d'intervention consiste à mobiliser le potentiel humain en amont afin d’éviter l'apparition d'un éventuel trouble psychiatrique. Discussion: L'enjeu actuel en matière de santé mentale implique ainsi un changement de paradigme chez les psychologues permettant de passer d'une action majoritairement curative à une action orientée vers les potentialités individuelles et collectives, les objectifs de ces deux champs étant complémentaires. Cet article présente une synthèse de déterminants de la santé mentale et de politiques publiques nationales et internationales ayant pour objet de favoriser la promotion de la santé. Conclusion: L'article conclut sur la manière dont les psychologues pourraient devenir des acteurs essentiels de ce champ jusqu’à présent sous-investi par la profession. |
    And translated abstract is:
      | translatedAbstract                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | Literature findings: Mental health promotion is still insufficiently known by psychologists and few of them work in this field, in part because it is based on public health concepts and data. Furthermore, its approach is focused on positive health – as opposed to deficit models – which proposes interventions consisting in developing human competencies and strengths as a means of preventing potential future mental illnesses. Discussion: The present stake, in the field of mental health, thus requires a paradigmatic change in psychologists which would enable to move from mainly curative interventions to actions oriented towards individual and collectives’ potentialities. This article presents a synthesis of mental health determinants as well as national and international public policies aiming at developing health promotion. Conclusion: It concludes on how psychologist could become major actors in this field. |

