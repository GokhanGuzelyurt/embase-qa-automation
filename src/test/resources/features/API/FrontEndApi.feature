@api @mocklogin @BE
Feature: Mock login

  Background:
    Given I set the endpoint for the http request to /mock/login
    And I concatenate the request body with content from file \features\jsonFiles\mock-sguserdetails.json
    And I set the request header Content-Type with value application/json
    When I execute the http request with method POST
    And I capture cookies from the authentication method

  @C477857
    Scenario: Validating autocomplete query
    And I set the endpoint for the http request to rest/searchquery/term/autocomplete
    And I set the queryParam term with value dna
    And I set the queryParam limit with value 10
    And I set the cookies captured in the request body
    And I execute the http request with method GET
    Then the status code of the response is 200
    And the JSON response body contains element useTerm with value DNA
    And the JSON response body contains element prefTermId with value 27828

    @C477858
    #bug (needs to be confirmed with Valentino) EMBASE-13617
  Scenario: Validating pub type for preprints
    And I set the endpoint for the http request to content/facet/filter/items/pubtype
    And I set the cookies captured in the request body
    And I set the queryParam apikey with value 6196bbd774a02f6bcaf5b6f2f9e9c3a3
    And I set the queryParam insttoken with value 12f6d639ad436c2288a67e900477930b
    And I set the request body with value [preprint]/lim
    And I execute the http request with method POST
    Then the status code of the response is 200
    And the JSON response body contains element label with value Preprint

    @C483775
  Scenario: Validating the migration of clipboard API to REST
    And I set the endpoint for the http request to /rest/tools/clipboard/add
    And I set the cookies captured in the request body
    And I concatenate the request body with content from file \features\jsonFiles\clipboard.json
    And I set the request header Content-Type with value application/json
    And I execute the http request with method POST
    Then the status code of the response is 200
    And the JSON response body contains element count with value 1

  Scenario: Validating the preprints source is present in the sources bubbles
    And I set the endpoint for the http request to content/facet/filter/items/SOURCES
    And I set the cookies captured in the request body
    And I set the request body with value L2010334450
    And I execute the http request with method POST
    Then the status code of the response is 200
    And the JSON response body contains element label with value Preprints
    And the JSON response body contains element count with value 1