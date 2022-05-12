@regression @recorddetails
Feature: Record Details tests

  Background: Home page
    Given user opens Embase application
    And Quick search page is opened
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

  @C488691
  Scenario: Validating when original title and translated title are available
    Given user enters query L2011118590 and performs a search
    Then the result set is not empty
    And user opens record #1 by clicking on title
    Then user is on Record Details page
    Then show original title link is displayed
    And user clicks on Show original link to verify:
      | originalTitle                                                                                                                      | translatedTitle                                                                                                     |
      | Exposição de pacientes da emergência pediátrica a exames de imagem, na atualidade e em tempos de COVID-19: Uma revisão integrativa | Exposure of pediatric emergency patients to imaging exams, nowadays and in times of covid-19: An integrative review |

  @C488692
  Scenario: Validate the title when no title is available
    Given user enters query L281557567 and performs a search
    Then the result set is not empty
    And user opens record #1 by clicking on title
    Then user is on Record Details page
    And the title on the Record details page is displayed as [No title available]

  @C488693
  Scenario: Validate the abstract when no abstract is available
    Given user enters query L2002408824 and performs a search
    Then the result set is not empty
    And user opens record #1 by clicking on title
    Then user is on Record Details page
    And the abstract on the Record details page is displayed as [No abstract available]

  @C488694
  Scenario: Validate when both original and translated abstract both are present
    Given user enters query L2010501392 and performs a search
    Then the result set is not empty
    And user opens record #1 by clicking on title
    Then user is on Record Details page
    Then show original abstract link is displayed
    And user clicks on Show original abstract link
    Then original abstract is:
      | originalAbstract                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
      | Introduction: La théorie et thérapie des états du moi (TEM) ont été développées par Watkins et Watkins, basées sur les travaux de Federn qui fut le premier à proposer le concept d’état du moi. Selon les Watkins la TEM est basée sur trois piliers : la psychanalyse, l'hypnose et le concept de dissociation de Janet. La TEM est une théorie et thérapie essentielle pour le traitement de la traumatisation complexe, en particulier des troubles dissociatifs. C'est aussi une thérapie utile pour d'autres types de difficultés et pathologies. Objectif: Cet article souhaite clarifier les fondements théoriques de la TEM ainsi que les contributions récentes de thérapeutes TEM, et comment de nouveaux concepts sur le trauma et la dissociation ont influencé et mis au défi la TEM. Méthodeetrésultats: Par une analyse de la littérature nous présentons les concepts principaux de la TEM, leurs forces et cohérence, ainsi que le manque de cohérence de certains de ces concepts. Le développement de la TEM s’étend sur plusieurs décennies et témoigne de la richesse de cette thérapie intégrative et du développement stimulant de la compréhension du trauma et de ses séquelles. Conclusion: Bien que les fondements théoriques de la TEM soient imparfaits, la TEM a développé un modèle intégratif de psychothérapie pour les personnes traumatisées qui est toujours valable de nos jours. La TEM devrait être honorée pour sa grande influence sur la psychotraumatologie moderne et sur le traitement du trouble dissociatif de l'identité. |
    And translated abstract is:
      | translatedAbstract                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
      | Introduction: Ego state theory (EST) and therapy was developed by Watkins and Watkins, based on Federn who first proposed the concept of ego state. The Watkins state that EST is based on three pillars: psychoanalysis, hypnosis and Janet's concept of dissociation. EST has been a major theory and therapy for the treatment of complex traumatization, in particular dissociative disorders, and is also a therapy helpful for other types of difficulties and pathologies. Objective: This paper aims at clarifying the theoretical background of EST, as well as recent inputs from EST therapists, and how new concepts on trauma and dissociation challenged and influenced modern EST. Method and results: After a thorough analysis of the literature, we provide with a detailed presentation of the main concepts of EST, their strengths and coherence, as well as the lack of coherence of some of these concepts. The development of EST stretches over several decades and attests to the richness of this integrative therapy and to the challenging development of the understanding of trauma and its sequalae. Conclusion: Even if the theoretical foundation of EST is imperfect, EST has developed an integrative model of psychotherapy for traumatized individuals that is still valuable today. EST should be acknowledged for its great influence on modern psychotraumatology and on the treatment of dissociative identity disorder. |

  @C488698
  Scenario: Validate pagination when user selects multiple records and clicks on View
    Given user enters query dna and performs a search
    Then the result set is not empty
    And user selects records 1,2,3,4 from the records list on Results page and click on view
    Then user is on Record Details page
    And pagination label contains value 1 of 4 selected
    And the pagination options have the following state:
      | paginationOption | state |
      | Previous         | false |
      | Next             | true  |
    When user clicks on Next button on Record Details page
    Then pagination label contains value 2 of 4 selected
    And the pagination options have the following state:
      | paginationOption | state |
      | Previous         | true  |
      | Next             | true  |
    When user clicks on Previous button on Record Details page
    Then pagination label contains value 1 of 4 selected
    When user clicks on Back to Results link
    Then user is on Results Page

  @C488699
  Scenario: Validate pagination when user selects records from record selection and clicks on View
    Given user enters query dna and performs a search
    Then the result set is not empty
    And user selects records 1,2,3,4,5,6,7 from the records list on Results page and click on view
    Then user is on Record Details page
    Then pagination label contains value 1 of 7 selected
    And the pagination options have the following state:
      | paginationOption | state |
      | Previous         | false |
      | Next             | true  |
    When user clicks on Next button on Record Details page
    Then pagination label contains value 2 of 7 selected
    When user clicks on Previous button on Record Details page
    Then pagination label contains value 1 of 7 selected
    When user clicks on Back to Results link
    Then user is on Results Page

  @C489215
  Scenario: Validate Back to Clipboard is shown when user opens a record from clipboard
    Given user enters query dna and performs a search
    Then the result set is not empty
    And user selects records 1,2,3,4 from the records list on Results page and click on AddtoClipboard
    And user opens Clipboard page
    Then user is on Clipboard page
    When user opens record #1 by clicking on title on Clipboard page
    Then user is on Record Details page
    And the link Back to Clipboard is visible on the page
    When user clicks on Back to Clipboard link
    Then user is on Clipboard page

  @C489216
  Scenario: Verify the functionality of Send results UI on Record Details Page
    Given user logs in as Default User
    Then Quick search page is opened
    And user opens Results page
    And user enters query heart and performs a search
    Then the result set is not empty
    And user selects records 1,2 from the records list on Results page and click on view
    Then user is on Record Details page
    When user click on Send button on Record Details page
    Then user verifies the UI of Send Results modal
    When user enters the subject as test_send_option on Send Results modal
    And clicks on Send button on Send Results Modal
    Then user is on Record Details page

  @C489217
  Scenario: Verify that subject is mandatory on Send Results Page
    Given user logs in as Default User
    Then Quick search page is opened
    And user opens Results page
    And user enters query heart and performs a search
    Then the result set is not empty
    And user selects records 1,2 from the records list on Results page and click on view
    Then user is on Record Details page
    When user click on Send button on Record Details page
    And clicks on Send button on Send Results Modal
    Then a subject error message This field is required is displayed on Send Results Modal

  @C489218
  Scenario: Verify that send modal window will not open if user is not signed in
    Given user enters query corona and performs a search
    Then the result set is not empty
    And user selects records 1,2 from the records list on Results page and click on view
    Then user is on Record Details page
    When user click on Send button on Record Details page
    Then a message box on Record Details is displayed with the message To use this feature you must be a registered user of Embase.
    When user clicks on Cancel on message box on Record Details page
    Then user is on Record Details page

  @C489219
  Scenario: Verify that user can sign in from the sign in message box and open the Send Modal window
    Given user enters query corona and performs a search
    Then the result set is not empty
    And user selects records 1,2 from the records list on Results page and click on view
    Then user is on Record Details page
    When user click on Send button on Record Details page
    Then a message box on Record Details is displayed with the message To use this feature you must be a registered user of Embase.
    When user clicks on Sign in on message box on Record Details page
    Then user enters email id as embase_limited@elsevier.com and click Continue
    Then Login page UI elements are displayed
    And the disabled email value on login page is embase_limited@elsevier.com
    And user enters password as embase_limited@elsevier.com1 and click SignIn
    Then user is on Record Details page
    When user click on Send button on Record Details page
    Then user verifies the UI of Send Results modal

  @C489277
  Scenario: Validate the full text link on Record Details page
    Given user enters query L2007119290 and performs a search
    Then the result set is not empty
    When user opens record #1 by clicking on title
    Then user is on Record Details page
    And full text link on Record Details page is displayed

  @C489278
  Scenario: Validate the add to clipboard link on Record Details page
    Given user enters query L2007119290 and performs a search
    Then the result set is not empty
    When user opens record #1 by clicking on title
    Then user is on Record Details page
    And the title on the Record details page is displayed as Circulating tumor DNA in the saliva of patients with head and neck cancer: A pilot report
    And Add to Clipboard link is present on Record Details page
    When user clicks on Add to Clipboard link on Record Details page
    Then Add to Clipboard link is disabled
    When user opens Clipboard page
    Then the title for record #1 on Clipboard page is Circulating tumor DNA in the saliva of patients with head and neck cancer: A pilot report

  @C489279
  Scenario: Verify the functionality of similar records feature
    Given user enters query L2005607816 and performs a search
    Then the result set is not empty
    When user opens record #1 by clicking on title
    Then user is on Record Details page
    When user clicks on Similar records link on Record Details Page
    Then user is on Results Page
    And search query is L2005607816/sim
    And the result set is not empty

  @C489280
  Scenario: Verify search by author functionality
    Given user enters query L2005607816 and performs a search
    Then the result set is not empty
    When user opens record #1 by clicking on title
    Then user is on Record Details page
    When user clicks on Search by author link on Record Details Page
    Then Search by authors modal is displayed
    When user selects author Kuny C.V. and click on Search
    Then user is on Results Page
    And search query is 'kuny c.v.'/au

  @C489281
  Scenario: Validate the organization link on Record Details page
    Given user enters query L2007119290 and performs a search
    Then the result set is not empty
    When user opens record #1 by clicking on title
    Then user is on Record Details page
    And organization link on Record Details page is displayed

  @C498906
  Scenario: Print action button can be clicked in Record details page
    Given user enters query L2007119290 and performs a search
    Then the result set is not empty
    When user opens record #1 by clicking on title
    Then user is on Record Details page
    When user click on Print button on Record Details page

  @C499403
  Scenario: Collapsible section state is preserved in Record details page
    Given user enters query dna and performs a search
    Then the result set is not empty
    When user opens record #1 by clicking on title
    Then user is on Record Details page
    And collapsible section Abstract is expanded in the Record details page
    When user clicks on collapsible section title Abstract of the Record details page
    Then collapsible section Abstract is collapsed in the Record details page
    When user clicks on Back to Results link
    Then user is on Results Page
    And user opens record #2 by clicking on title
    Then user is on Record Details page
    And collapsible section Abstract is collapsed in the Record details page
    When user clicks on collapsible section title Abstract of the Record details page
    Then collapsible section Abstract is expanded in the Record details page

  @C506718
  Scenario Outline: Record details page does not crash on specific query <query>
    Given user enters query <query> and performs a search
    Then the result set is not empty
    And user opens record #1 by clicking on title
    Then user is on Record Details page
    And Back to results link is displayed and enabled
    And pagination links are disabled on Record details page
    And pagination label contains value 1 of 1
    And title field is not empty on record details page
    And view author address button is present on Record details page
    Examples:
      | query      |
      | L372446238 |
      | L14033922  |
      | L6007386   |
      | L18010735  |
      | L280905581 |
      | L19179790  |
      | L18121875  |
      | L5074324   |
      | L18112053  |
      | L5006289   |
      | L19047480  |

  @C532728
  Scenario: Validate the full text link on Record Details page for documents without DOI in Embase but resolved on SD
    Given user enters query L40295626 and performs a search
    Then the result set is not empty
    When user opens record #1 by clicking on title
    Then user is on Record Details page
    And full text link on Record Details page is displayed

  @C544693
  Scenario: Validating that Clinical trial numbers is displayed on record details page
    When user enters query eudra*:cn and performs a search
    And user opens record #1 by clicking on title
    And user is on Record Details page
    Then user verifies that text is displayed: Clinical trial numbers
    And user verifies that text is displayed: ClinicalTrials.gov

  @C544694
  Scenario: Validating that Clinical trial numbers contains NCT
    When user enters query eudra*:cn and performs a search
    And user opens record #1 by clicking on title
    And user is on Record Details page
    Then user verifies that Clinical trial numbers contains NCT

