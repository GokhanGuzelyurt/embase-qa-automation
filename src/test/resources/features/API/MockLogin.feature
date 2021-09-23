@api @mocklogin @BE
Feature: Mock login

  Background:
    Given I set the endpoint for the http request to /mock/login
    And I concatenate the request body with content from file msguserDetails.json
    And I set the request header Content-Type with value application/json
    When I execute the http request with method POST
    And I capture cookies from the authentication method

  @mock
  Scenario: Creating mock login scenario
    And I set the endpoint for the http request to rest/searchquery/term/autocomplete
    And I set the queryParam term with value dna
    And I set the queryParam limit with value 10
    And I set the cookies captured in the request body
    And I execute the http request with method GET
    Then the status code of the response is 200
    And the JSON response body contains element useTerm with value gene amplification
    And the JSON response body contains element prefTermId with value 37156




