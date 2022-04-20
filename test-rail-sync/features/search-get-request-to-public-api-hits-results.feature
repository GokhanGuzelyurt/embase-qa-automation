Feature: PublicApi-External.feature
  @tcid:533330
  @untested
  Scenario Outline: Search GET request to Public API hits results
    Given I set the endpoint for the http request to /content/embase/article
    And I set the queryParam count with value 200
    And I set the queryParam start with value
    And I set the queryParam sort with value entrydate
    And I set the queryParam apikey with value 6196bbd774a02f6bcaf5b6f2f9e9c3a3
    And I set the queryParam insttoken with value 12f6d639ad436c2288a67e900477930b
    And I set the queryParam query with value 'blood AND cancer AND 2004:py'
    And I set the queryParam 'httpaccept' with value 'application/json'
    When I execute the http request with method GET
    Then The status code of the response is 200
    And The response body contains element 'itemInfo'  with value equal to <itemInfo>

    Examples:
    | Start                   | "itemInfo"  |
    | 1                       | 200         |
    | 201                     | 200         |
    | 401                     | 200         |
    | 601                     | 200         |
    | 801                     | 200         |
    | 1001                    | 200         |