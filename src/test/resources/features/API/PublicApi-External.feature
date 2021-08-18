@regression @api @BE @PublicApiExternal @skip
Feature: Public API-External

      # can't make it work in CERT with existing credentials
    # TODO needs investigation to run in all environments
  #TODO Create new test cases in test rail after the Test rail integration

  @C349582
  Scenario: Search GET request to Public API with JSON response
    Given I set the Public API endpoint for the http request to /content/embase/article
    And I set the queryParam httpaccept with value application/json
    And I set the queryParam count with value 5
    And I set the queryParam sort with value relevance
    And I set the queryParam query with value cancer
    And I set the queryParam apikey with value 6196bbd774a02f6bcaf5b6f2f9e9c3a3
    And I set the queryParam insttoken with value 12f6d639ad436c2288a67e900477930b
    When I execute the http request with method GET
    Then the status code of the response is 200
    And the response body contains element header.query with value cancer
    And the response body contains element header.hits with numeric value greater than 4000000


  @C349583
  Scenario: Search GET request to Public API with XML response
    Given I set the Public API endpoint for the http request to /content/embase/article
    And I set the queryParam apikey with value 6196bbd774a02f6bcaf5b6f2f9e9c3a3
    And I set the queryParam insttoken with value 12f6d639ad436c2288a67e900477930b
    And I set the queryParam httpaccept with value application/xml
    And I set the queryParam start with value 1
    And I set the queryParam count with value 5
    And I set the queryParam sort with value relevance
    And I set the queryParam query with value cancer
    When I execute the http request with method GET
    Then the status code of the response is 200
    And the response body contains xml element with xpath /xml/header/query and value cancer
    And the response body contains element xml.header.hits with numeric value greater than 4000000

  @C349584
  Scenario: Search GET request to Public API without apikey
    Given I set the Public API endpoint for the http request to /content/embase/article
    And I set the queryParam insttoken with value 12f6d639ad436c2288a67e900477930b
    And I set the queryParam httpaccept with value application/json
    And I set the queryParam start with value 1
    And I set the queryParam count with value 5
    And I set the queryParam sort with value relevance
    And I set the queryParam query with value cancer
    When I execute the http request with method GET
    Then the status code of the response is 401
    And the response body contains element service-error.status.statusCode with value AUTHENTICATION_ERROR
    And the response body contains element service-error.status.statusText with value Invalid API Key

  @C357023
  Scenario: Search GET request to Public API with empty apikey param
    Given I set the Public API endpoint for the http request to /content/embase/article
    And I set the queryParam 'apikey' with value ''
    And I set the queryParam insttoken with value 12f6d639ad436c2288a67e900477930b
    And I set the queryParam 'httpaccept' with value 'application/json'
    And I set the queryParam httpaccept with value application/json
    And I set the queryParam start with value 1
    And I set the queryParam count with value 5
    And I set the queryParam sort with value relevance
    And I set the queryParam query with value cancer
    When I execute the http request with method GET
    Then the status code of the response is 401
    And the response body contains element service-error.status.statusCode with value AUTHENTICATION_ERROR
    And the response body contains element service-error.status.statusText with value Invalid API Key

  @C349585
  Scenario: Search GET request to Public API without insttoken
    Given I set the Public API endpoint for the http request to /content/embase/article
    And I set the queryParam apikey with value 6196bbd774a02f6bcaf5b6f2f9e9c3a3
    And I set the queryParam httpaccept with value application/json
    And I set the queryParam start with value 1
    And I set the queryParam count with value 5
    And I set the queryParam sort with value relevance
    And I set the queryParam query with value cancer
    When I execute the http request with method GET
    Then the status code of the response is 401
    And the response body contains element service-error.status.statusCode with value AUTHENTICATION_ERROR
    And the response body contains element service-error.status.statusText with value Invalid API Key: valid apikey credentials required.

  @known
#BUG: EMBASE-12088
  @C349586
  Scenario: Search GET request to Public API with empty query param
    Given I set the Public API endpoint for the http request to /content/embase/article
    And I set the queryParam apikey with value 6196bbd774a02f6bcaf5b6f2f9e9c3a3
    And I set the queryParam insttoken with value 12f6d639ad436c2288a67e900477930b
    And I set the queryParam httpaccept with value application/json
    And I set the queryParam start with value 1
    And I set the queryParam count with value 5
    And I set the queryParam sort with value relevance
    And I set the queryParam query with value ''
    When I execute the http request with method GET
    Then the status code of the response is 400
    And the response body contains element message with value Query parameter is required!


  @known
    #BUG: EMBASE-12144
  @C349587
  Scenario: Search GET request to Public API without query param
    Given I set the Public API endpoint for the http request to /content/embase/article
    And I set the queryParam apikey with value 6196bbd774a02f6bcaf5b6f2f9e9c3a3
    And I set the queryParam insttoken with value 12f6d639ad436c2288a67e900477930b
    And I set the queryParam httpaccept with value application/json
    And I set the queryParam start with value 1
    And I set the queryParam count with value 5
    And I set the queryParam sort with value relevance
    When I execute the http request with method GET
    Then the status code of the response is 404
    And the response body contains element service-error.status.statusCode with value RESOURCE_NOT_FOUND
    And the response body contains element service-error.status.statusText with value The resource specified cannot be found.

  @C349588
  Scenario: Search GET request to Public API without optional parameters
    Given I set the Public API endpoint for the http request to /content/embase/article
    And I set the queryParam apikey with value 6196bbd774a02f6bcaf5b6f2f9e9c3a3
    And I set the queryParam insttoken with value 12f6d639ad436c2288a67e900477930b
    And I set the queryParam query with value cancer
    When I execute the http request with method GET
    Then the status code of the response is 200
    And the response body contains element header.query with value cancer
    And the response body contains element header.hits with numeric value greater than 4000000


  @C349591
  Scenario: Search POST request to Public API with JSON response
    Given I set the Public API endpoint for the http request to /content/embase/article
    And I set the queryParam start with value 1
    And I set the queryParam count with value 5
    And I set the queryParam apikey with value 6196bbd774a02f6bcaf5b6f2f9e9c3a3
    And I set the queryParam insttoken with value 12f6d639ad436c2288a67e900477930b
    And I set the request header Content-Type with value application/x-www-form-urlencoded
    And I set the queryParam query with value cancer
    When I execute the http request with method POST
    Then the status code of the response is 200
    And the response body contains element header.query with value cancer
    And the response body contains element header.hits with numeric value greater than 4000000

  @known
      # BUG EMBASE-12145
  @C360470
  Scenario: Search POST request to Public API with unencoded plus sign in query
    Given I set the Public API endpoint for the http request to /content/embase/article
    And I set the queryParam start with value 1
    And I set the queryParam count with value 5
    And I set the request header Content-Type with value application/x-www-form-urlencoded
    And I concatenate the request body with value apiKey=
    And I concatenate the request body with value 6196bbd774a02f6bcaf5b6f2f9e9c3a3
    And I concatenate the request body with value &insttoken=
    And I concatenate the request body with value 12f6d639ad436c2288a67e900477930b
    And I concatenate the request body with value &query=hiv+ blood
    When I execute the http request with method POST
    Then the status code of the response is 200
    And the response body contains element header.query with value hiv+ blood
    And the response body contains element header.hits with numeric value greater than 70000


  @C357024
  Scenario: Search POST request to Public API with long query
    Given I set the Public API endpoint for the http request to /content/embase/article
    And I set the queryParam start with value 1
    And I set the queryParam count with value 5
    And I set the request header Content-Type with value application/x-www-form-urlencoded
    And I concatenate the request body with value apiKey=
    And I concatenate the request body with value 6196bbd774a02f6bcaf5b6f2f9e9c3a3
    And I concatenate the request body with value &insttoken=
    And I concatenate the request body with value 12f6d639ad436c2288a67e900477930b
    And I concatenate the request body with value &query=
    And I concatenate the request body with URL encoded content from file datafiles/longQueries/200k_long_query_transformed.txt
    When I execute the http request with method POST
    Then the status code of the response is 200
    And the response body contains element header.query with content matching case insensitive text from file datafiles/longQueries/200k_long_query_transformed.txt
    And the response body contains element header.hits with numeric value greater than 1400

  @C357025
  Scenario: Retrieval LUI GET request to Public API with JSON response
    Given I set the Public API endpoint for the http request to /content/embase/article/lui
    And I concatenate the value /L623931948 to the URL
    And I set the queryParam apikey with value 6196bbd774a02f6bcaf5b6f2f9e9c3a3
    And I set the queryParam insttoken with value 12f6d639ad436c2288a67e900477930b
    And I set the queryParam httpaccept with value application/json
    When I execute the http request with method GET
    Then the status code of the response is 200
    And the response body contains element header.query with value l623931948:id
    And the response body contains element header.hits with numeric value equal to 1
    And the response body contains element results[0].itemInfo.itemIdList.lui with value L623931948

  @C357026
  Scenario: Retrieval PII GET request to Public API with JSON response
    Given I set the Public API endpoint for the http request to /content/embase/article/pii
    And I concatenate the value /S1877782117301236 to the URL
    And I set the queryParam apikey with value 6196bbd774a02f6bcaf5b6f2f9e9c3a3
    And I set the queryParam insttoken with value 12f6d639ad436c2288a67e900477930b
    And I set the queryParam httpaccept with value application/json
    When I execute the http request with method GET
    Then the status code of the response is 200
    And the response body contains element header.query with value s1877782117301236:ii
    And the response body contains element header.hits with numeric value equal to 1
    And the response body contains element results[0].itemInfo.itemIdList.pii with value S1877782117301236

  @C357027
  Scenario: Retrieval DOI GET request to Public API with JSON response
    Given I set the Public API endpoint for the http request to /content/embase/article/doi
    And I concatenate the value /10.3322/caac.21492 to the URL
    And I set the queryParam apikey with value 6196bbd774a02f6bcaf5b6f2f9e9c3a3
    And I set the queryParam insttoken with value 12f6d639ad436c2288a67e900477930b
    And I set the queryParam httpaccept with value application/json
    When I execute the http request with method GET
    Then the status code of the response is 200
    And the response body contains element header.query with value '10.3322/caac.21492':do
    And the response body contains element header.hits with numeric value equal to 1
    And the response body contains element results[0].itemInfo.itemIdList.doi with value 10.3322/caac.21492

  @C357028
  Scenario: Retrieval EMBASE ID GET request to Public API with JSON response
    Given I set the Public API endpoint for the http request to /content/embase/article/embase
    And I concatenate the value /2013715327to the URL
    And I set the queryParam apikey with value 6196bbd774a02f6bcaf5b6f2f9e9c3a3
    And I set the queryParam insttoken with value 12f6d639ad436c2288a67e900477930b
    And I set the queryParam httpaccept with value application/json
    When I execute the http request with method GET
    Then the status code of the response is 200
    And the response body contains element header.query with value 2013715327:an
    And the response body contains element header.hits with numeric value equal to 1
    And the response body contains element results[0].itemInfo.itemIdList.embase with value 2013715327

  @C357029
  Scenario: Retrieval PUBMED ID GET request to Public API with JSON response
    Given I set the Public API endpoint for the http request to /content/embase/article/pubmed_id
    And I concatenate the value /31910170to the URL
    And I set the queryParam apikey with value 6196bbd774a02f6bcaf5b6f2f9e9c3a3
    And I set the queryParam insttoken with value 12f6d639ad436c2288a67e900477930b
    And I set the queryParam httpaccept with value application/json
    When I execute the http request with method GET
    Then the status code of the response is 200
    And the response body contains element header.query with value 31910170:ui
    And the response body contains element header.hits with numeric value equal to 1
    And the response body contains element results[0].itemInfo.itemIdList.medl with value 31910170

  @C357030
  Scenario: Retrieval MEDLINE ID GET request to Public API with JSON response
    Given I set the Public API endpoint for the http request to /content/embase/article/medline
    And I concatenate the value /31910170 to the URL
    And I set the queryParam apikey with value 6196bbd774a02f6bcaf5b6f2f9e9c3a3
    And I set the queryParam insttoken with value 12f6d639ad436c2288a67e900477930b
    And I set the queryParam httpaccept with value application/json
    When I execute the http request with method GET
    Then the status code of the response is 200
    And the response body contains element header.query with value 31910170:ui
    And the response body contains element header.hits with numeric value equal to 1
    And the response body contains element results[0].itemInfo.itemIdList.medl with value 31910170

  @known
    # BUG EMBASE-12088
  @C357031
  Scenario: Search GET request to Public API invalid sort value
    Given I set the Public API endpoint for the http request to '/content/embase/article'
    And I set the queryParam 'apikey' with value from properties file
    And I set the queryParam 'insttoken' with value from properties file
    And I set the queryParam 'httpaccept' with value 'application/json'
    And I set the queryParam 'start' with value '1'
    And I set the queryParam 'count' with value '5'
    And I set the queryParam 'sort' with value 'invalid_value'
    And I set the queryParam 'query' with value 'cancer'
    When I execute the http request with method 'GET'
    Then the status code of the response is 400
    And the response body contains element 'service-error.status.statusCode' with value 'INVALID_INPUT'

  @known
    # BUG EMBASE-12144
  @C357032
  Scenario: Retrieval LUI GET request to Public API resource not found
    Given I set the Public API endpoint for the http request to '/content/embase/article/lui'
    And I concatenate the value '/L62-non-existing'to the URL
    And I set the queryParam 'apikey' with value from properties file
    And I set the queryParam 'insttoken' with value from properties file
    And I set the queryParam 'httpaccept' with value 'application/json'
    When I execute the http request with method 'GET'
    Then the status code of the response is 404
    And the response body contains element 'service-error.status.statusCode' with value 'RESOURCE_NOT_FOUND'
    And the response body contains element 'service-error.status.statusText' with value 'The resource specified cannot be found.'

  @C357033
  Scenario: Search GET request to Public API invalid http method
    Given I set the Public API endpoint for the http request to /content/embase/article
    And I set the queryParam apikey with value 6196bbd774a02f6bcaf5b6f2f9e9c3a3
    And I set the queryParam insttoken with value 12f6d639ad436c2288a67e900477930b
    And I set the queryParam 'httpaccept' with value 'application/json'
    And I set the queryParam start with value 1
    And I set the queryParam count with value 5
    And I set the queryParam sort with value relevance
    And I set the queryParam query with value cancer
    When I execute the http request with method DELETE
    Then the status code of the response is 405
    And the response body contains element service-error.status.statusCode with value INVALID_INPUT
    And the response body contains element service-error.status.statusText with value HTTP Method DELETE is not valid for this service


  @known
    # BUG - EMBASE-12146
  @C357034
  Scenario: Search GET request to Public API invalid MIME type
    Given I set the Public API endpoint for the http request to '/content/embase/article'
    And I set the queryParam 'apikey' with value from properties file
    And I set the queryParam 'insttoken' with value from properties file
    And I set the queryParam 'httpaccept' with value 'image/jpeg'
    And I set the queryParam 'start' with value '1'
    And I set the queryParam 'count' with value '5'
    And I set the queryParam 'sort' with value 'relevance'
    And I set the queryParam 'query' with value 'cancer'
    When I execute the http request with method 'GET'
    Then the status code of the response is 406
    And the response body contains element 'service-error.status.statusCode' with value 'INVALID_INPUT'
    And the response body contains element 'service-error.status.statusText' with value 'Accept header value 'image/jpeg' is not valid for this resource'


