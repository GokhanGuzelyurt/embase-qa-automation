@api @BE @XmlGateway_version2 @regression @skip
Feature: XmlGateway version 2 test cases

  @C434636
  Scenario: Running xmlgateway version 2 default case
    Given I set the endpoint for the http request to /xmlgateway/v2
    And I set the queryParam search_query with value dna
    And I set the queryParam maxResults with value 2
    And I set the request header Client-Authorization with value cy51cGFkaHlheUBlbHNldmllci5jb206U2Frc2hpMDIh
    And I set the request header Client-Institution with value EM_TST_ACC1, EM_TST_DEP12
    When I execute the http request with method GET
    Then the status code of the response is 200
    And the response body contains element embaseidlist.query with value dna