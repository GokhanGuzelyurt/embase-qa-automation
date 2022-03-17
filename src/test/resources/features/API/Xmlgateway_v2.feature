@api @BE @XmlGateway_version2 @regression @skip
Feature: XmlGateway version 2 test cases

  @C477702
  Scenario: Running xmlgateway version 2 default case
    Given I set the endpoint for the http request to /xmlgateway/v2
    And I set the queryParam search_query with value dna
    And I set the queryParam maxResults with value 2
    And I set the request header Client-Authorization with value ZW1iYXNlX2xpbWl0ZWRAZWxzZXZpZXIuY29tOmVtYmFzZV9saW1pdGVkQGVsc2V2aWVyLmNvbTE
    And I set the request header Client-Institution with value EM_TST_ACC1, EM_TST_DEP0
    When I execute the http request with method GET
    Then the status code of the response is 200
    And the response body contains element embaseidlist.query with value dna

  @C477703
  Scenario: Validate xmlgateway version 2 with hitstart parameter as 0
    Given I set the endpoint for the http request to /xmlgateway/v2
    And I set the queryParam hitstart with value 0
    And I set the queryParam search_query with value cancer
    And I set the queryParam maxResults with value 2
    And I set the request header Client-Authorization with value ZW1iYXNlX2xpbWl0ZWRAZWxzZXZpZXIuY29tOmVtYmFzZV9saW1pdGVkQGVsc2V2aWVyLmNvbTE
    And I set the request header Client-Institution with value EM_TST_ACC1, EM_TST_DEP0
    When I execute the http request with method GET
    Then the status code of the response is 200
    And the response body contains element embaseidlist.query with value cancer
    And the response body contains element embaseidlist.hitstart with value 0

  @C477704
  Scenario: Verify that French local collection is returned when user searches for french collection for xmlgateway version 2
    Given I set the endpoint for the http request to /xmlgateway/v2
    And I set the queryParam search_query with value [french local collection]/lim
    And I set the request header Client-Authorization with value ZW1iYXNlX2xpbWl0ZWRAZWxzZXZpZXIuY29tOmVtYmFzZV9saW1pdGVkQGVsc2V2aWVyLmNvbTE
    And I set the request header Client-Institution with value EM_TST_ACC1, EM_TST_DEP0
    When I execute the http request with method GET
    Then the status code of the response is 200
    And the response body contains element embasexmllist.query with value [french local collection]/lim

  @C477705
  Scenario: Verify a long query works well in xmlgateway version 2
    Given I set the endpoint for the http request to /xmlgateway/v2
    And I set the queryParam search_query with value ('ANASTROZOLE'/exp/dd_ae,dd_to,dd_ct,dd_it) OR ( ('ANASTROZOLE'/exp) AND ('abuse potential':ti,ab OR 'accidental ingestion':ti,ab OR 'accidental exposure' OR adrs:ti,ab OR 'adverse drug reaction'/exp OR (adverse NEAR/2 (effect* OR reaction* OR event* OR outcome*)):ti,ab OR angioedema:ti,ab OR 'angioneurotic edema'/exp OR autoantibody:ti,ab OR 'autoantibody'/exp OR 'autoimmune disease'/exp/dm_si OR 'carcinogenicity'/exp OR carcinogenic*:ti,ab OR 'cardiovascular inflammation'/exp/dm_si OR 'case report'/exp OR (report NEAR/2 case):ti,ab OR 'childbirth'/exp OR 'chronic use':ti,ab OR 'chronic usage':ti,ab OR 'compassionate use'/exp OR 'complication'/exp OR 'cross reacting antibody'/exp OR 'death'/exp OR difficulty:ti,ab OR (diminished NEAR/2 effect):ti,ab OR 'dispensing error*':ti,ab OR 'drug abuse'/exp OR 'discontinuation rate*' OR 'drug discontinuation' OR 'drug dependence'/exp OR 'drug hypersensitivity'/exp OR 'drug interaction'/exp OR 'drug overdose'/exp OR 'drug resistance'/exp OR 'drug safety'/exp OR 'drug tolerability'/exp OR 'drug tolerance'/exp OR 'drug toxicity and intoxication'/exp OR 'treatment failure'/exp OR 'drug withdrawal'/exp OR genotoxic*:ti,ab OR 'hypersensitivity'/exp/dm_co,dm_si OR ineffective*:ti,ab OR 'immune mediated adverse' OR 'immune related adverse' OR 'immunocompromised patient'/exp OR IRAE*:ti,ab OR 'infertility'/exp/dm_co,dm_si OR 'infusion reaction':ti,ab OR 'injection site reaction':ti,ab OR 'intentional misuse':ti,ab OR interact*:ti,ab OR 'intentional overdose':ti,ab OR 'kidney disease'/exp OR (lack NEAR/2 effect*):ti,ab OR (lack NEAR/2 efficacy):ti,ab OR 'lactation'/exp OR lethal*:ti,ab OR 'liver disease'/exp OR 'long term exposure'/exp OR 'long term use':ti,ab OR 'long term usage':ti,ab OR 'medication error'/exp OR 'medication error*':ti,ab OR 'mutagenesis'/exp OR 'mutagenic activity'/exp OR mutagenic*:ti,ab OR (named NEXT/1 patient*):ti,ab OR 'neutralizing antibody'/exp OR 'occupational exposure'/exp OR 'off label drug use'/exp OR 'off label':ti,ab OR 'organ injury'/exp OR poisoning:ti,ab OR 'pregnancy'/exp OR 'pregnancy disorder'/exp OR 'pregnancy outcome'/exp OR 'prenatal development'/exp OR 'prenatal disorder'/exp OR 'prenatal drug exposure'/exp OR 'puerperium'/exp OR 'rebound'/exp OR rebound:ti,ab OR 'recreational use':ti,ab OR (reduced NEAR/2 effect):ti,ab OR (reduced NEAR/2 efficacy):ti,ab OR risk:ti,ab OR 'near miss*' OR 'potential error*' OR 'intercepted error*' OR 'inadvertent administration' OR safe:ti,ab OR safety:ti,ab OR 'serum sickness':ti,ab OR 'serum sickness'/exp OR 'side effect'/exp OR 'side effect':ti,ab OR 'side effects':ti,ab OR 'suicid*':ti,ab OR 'suicidal behavior'/exp OR 'tachyphylaxis'/exp OR TEAE*:ti,ab OR 'teratogenesis'/exp OR teratogen*:ti,ab OR 'congenital disorder'/exp OR tolerab*:ti,ab OR toxic*:ti,ab OR 'toxicity'/exp OR 'counterfeit drug'/exp OR 'falsif*':ti,ab OR 'product safety'/exp OR 'product recall'/exp OR 'drug impurity'/exp OR 'infectious agent'/exp OR 'pregnancy termination'/exp OR 'opportunistic infection'/exp OR 'paternal exposure'/exp OR 'maternal exposure'/exp OR 'treatment emergent':ti,ab OR 'treatment related':ti,ab OR 'therapy related':ti,ab OR (treatment NEAR/2 fail*) OR 'undesirable effect*':ti,ab OR 'unintended consequence':ti,ab OR 'unintended effect':ti,ab OR 'unlicensed drug' OR 'untoward effect*':ti,ab OR (vaccin* NEAR/2 fail*) OR (immuni?ation NEAR/2 fail*) OR 'human anti human':ti,ab OR 'human anti chimeric':ti,ab OR ('airway'/exp AND 'intubation'/exp) OR 'respiratory tract intubation'/exp OR [embryo]/lim OR [fetus]/lim OR [newborn]/lim OR [infant]/lim OR [child]/lim OR [adolescent]/lim OR [aged]/lim OR [very elderly]/lim)) AND (([humans]/lim OR 'clinical study':ti,ab OR 'clinical trial':ti,ab OR 'clinical report':ti,ab OR patient*:de,ab,ti OR (case NEXT/1 report) OR participant*:ab,ti OR volunteer*:ab,ti OR inpatient*:ab,ti OR outpatient*:ab,ti OR 'phase 1':ab,ti OR 'phase 2':ab,ti OR 'phase 3':ab,ti OR 'phase 4':ab,ti OR 'phase i':ab,ti OR 'phase ii':ab,ti OR 'phase iii':ab,ti OR 'phase iv':ab,ti OR 'placebo controlled':ab,ti OR 'multicenter study':ab,ti OR 'randomized controlled':ab,ti OR cases:ab,ti OR 'clinical study'/exp OR 'crossover study' OR 'cross over study' OR 'crossover trial' OR 'meta analysis'))
    And I set the request header Client-Authorization with value ZW1iYXNlX2xpbWl0ZWRAZWxzZXZpZXIuY29tOmVtYmFzZV9saW1pdGVkQGVsc2V2aWVyLmNvbTE
    And I set the request header Client-Institution with value EM_TST_ACC1, EM_TST_DEP0
    When I execute the http request with method GET
    Then the status code of the response is 200

  @C477855
  Scenario: Running xmlgateway v2 for preprints limit
    Given I set the endpoint for the http request to /xmlgateway/v2
    And I set the queryParam search_query with value [preprint]/lim
    And I set the queryParam maxResults with value 2
    And I set the request header Client-Authorization with value ZW1iYXNlX2xpbWl0ZWRAZWxzZXZpZXIuY29tOmVtYmFzZV9saW1pdGVkQGVsc2V2aWVyLmNvbTE
    And I set the request header Client-Institution with value EM_TST_ACC1, EM_TST_DEP0
    When I execute the http request with method GET
    Then the status code of the response is 200
    And the response body contains element embaseidlist.query with value [preprint]/lim
    And the response body contains element embaseidlist.hitstart with value 1

  @C477856
  Scenario: Running xmlgateway v2 by preprints pub type query
    Given I set the endpoint for the http request to /xmlgateway/v2
    And I set the queryParam search_query with value 'preprint'/it
    And I set the queryParam maxResults with value 2
    And I set the request header Client-Authorization with value ZW1iYXNlX2xpbWl0ZWRAZWxzZXZpZXIuY29tOmVtYmFzZV9saW1pdGVkQGVsc2V2aWVyLmNvbTE
    And I set the request header Client-Institution with value EM_TST_ACC1, EM_TST_DEP0
    When I execute the http request with method GET
    Then the status code of the response is 200
    And the response body contains element embaseidlist.query with value 'preprint'/it
    And the response body contains element embaseidlist.hitstart with value 1
