package embase.tests.StepDefs;

import cucumber.api.java.Before;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.restassured.RestAssured;
import io.restassured.config.HttpClientConfig;
import io.restassured.config.RestAssuredConfig;
import io.restassured.http.Cookie;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import org.apache.http.client.params.ClientPNames;
import org.apache.http.client.params.CookiePolicy;
import org.apache.http.params.CoreConnectionPNames;
import org.assertj.core.api.Assertions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import po.common.FileHelper;
import po.common.StringHelper;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;
import java.io.StringReader;
import java.lang.invoke.MethodHandles;

import static embase.tests.StepDefs.CommonSteps.*;


public class HttpRequestResponseStepDef {

    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());
    private Response response = null;
    private RequestSpecification request;
    private boolean printRequestToConsole = true;
    private boolean printResponseToConsole = false;
    private int timeoutSeconds = 300;
    private String concatenatedBody;
    private String concatenatedUrl;
    private RestAssuredConfig config;
    private Cookie cookie;
    String apikey;


    @Before(order = 5)
    public void setupTest() {
        if (CommonSteps.IS_BE_SCENARIO) {
//            .info("Before BE test");
            // Setting timeout limits - TODO - Needs to be tested


            config = RestAssured.config()
                    .httpClient(HttpClientConfig.httpClientConfig()
                            .setParam(CoreConnectionPNames.CONNECTION_TIMEOUT, timeoutSeconds * 1000)
                            .setParam(CoreConnectionPNames.SO_TIMEOUT, timeoutSeconds * 1000)
                            .setParam(ClientPNames.COOKIE_POLICY, CookiePolicy.BROWSER_COMPATIBILITY));

            RestAssured.baseURI = BASE_URL;

            logger.info("Setting RestAssured baseURI to: " + BASE_URL);

            concatenatedBody = "";
            concatenatedUrl = "";
        }

    }

    @Given("^I set the endpoint for the http request to (.*)$")
    public void setRequestEndpoint(String endpoint) {
        request = RestAssured.given().config(config);
        request.basePath(endpoint);
    }

    @Given("^I concatenate the value (.*)to the URL$")
    public void setConcatenatedRequestUrl(String value) {
        concatenatedUrl += value;
    }


    @Given("^I set the queryParam (.*) with value (.*)$")
    public void setRequestParam(String param, String value) {
        request.queryParam(param, value);

    }

    @Given("^I set the Public API endpoint for the http request to (.*)$")
    public void setPublicApiRequestEndpoint(String endpoint) {
        RestAssured.baseURI = PUBLIC_API_DOMAIN;
        System.out.println(PUBLIC_API_DOMAIN);
        request = RestAssured.given().config(config);
        request.basePath(endpoint);


    }

    //    @Given("I set the queryParam '{str}' with encoded value '{str}'")
//    public void setRequestWithEncodedParam(String param, String value) {
//        request.queryParam(param, StringHelper.urlEncode(value));
//    }
//
//
    @Given("^I set the API KEY with value from properties file$")
    public void setRequestParamFromProperties() {
        request.queryParam(apikey, API_KEY);
    }

    @Given("^I set the request header (.*) with value (.*)$")
    public void setRequestHeader(String header, String value) {
        request.given().header(header, value);
    }

    @Given("^I set the request body with value (.*)$")
    public void setRequestBody(String body) {
        concatenatedBody += body;
        request.given().body(body);
    }

    @Given("^I concatenate the request body with value (.*)$")
    public void setConcatenatedRequestBody(String body) {
        concatenatedBody += body;
        request.given().body(concatenatedBody);
    }

//    @Given("I concatenate the request body with content from file '{str}'")
//    public void setConcatenatedRequestBodyFromFile(String fileName) {
//        String body = FileHelper.readFile(fileName);
//        setConcatenatedRequestBody(body);
//    }

    @Given("^I concatenate the request body with URL encoded content from file (.*)$")
    public void setConcatenatedRequestBodyFromFileUrlEncoded(String fileName) {
        String body = FileHelper.readFile(fileName);
        setConcatenatedRequestBody(StringHelper.urlEncode(body));


    }

//
//    @Given("I concatenate the request body with value from property '{str}'")
//    public void setConcatenatedRequestBodyFromProperty(String property) {
//        String propertyValue = PropertyReader.getProperty(property);
//        setConcatenatedRequestBody(propertyValue);
//    }

    @When("^I execute the http request with method (.*)$")
    public void executeHttpGetRequest(String method) {
//        commonSteps.logger.info("Executing HTTP request with method: " + method);

        if (printRequestToConsole)
            request.log().all();

        method = method.toUpperCase();
        switch (method) {
            case "GET":
                response = request.get(concatenatedUrl);
                break;
            case "POST":
                response = request.post(concatenatedUrl);
                break;
            case "PUT":
                response = request.put(concatenatedUrl);
                break;
            case "DELETE":
                response = request.delete(concatenatedUrl);
                break;
            case "OPTIONS":
                response = request.options(concatenatedUrl);
                break;
            case "HEAD":
                response = request.head(concatenatedUrl);
                break;
            case "PATCH":
                response = request.patch(concatenatedUrl);
                break;
            default:
                logger.error("ERROR: unsupported HTTP METHOD");
        }
        if (printResponseToConsole)
            response.then().log().all();
    }


    @Then("^the status code of the response is (.*)$")
    public void verifyStatusCode(int statusCode) {
        Assertions.assertThat(response.getStatusCode()).describedAs("Status code is not equal to 200").isEqualTo(statusCode);
    }

    @And("I capture cookies from the authentication method")
    public void captureCookies() {
        cookie = response.getDetailedCookie("SESSION");


    }

    @And("I set the cookies captured in the request body")
    public void setCookie() {
        request.given().cookie(cookie);
    }

    @Then("^the response body contains element (.*) with value (.*)$")
    public void verifyResponseBodyElementValue(String element, String value) {
        System.out.println(response.then().extract().body().xmlPath());
        try {
            String elementValueFromResponse = response.then().extract().path(element);
            Assertions.assertThat(elementValueFromResponse).describedAs("Element in response body does not match expected value").isEqualTo(value);
        } catch (ClassCastException e) {
            Assertions.fail("Could not parse response to find element: " + element);
        }
    }

    @Then("^the response body contains element (.*) with content matching case insensitive text from file (.*)$")
    public void verifyResponseBodyElementValueFromFile(String element, String fileName) {
        String value = FileHelper.readFile(fileName);
        verifyResponseBodyElementValue(element.toLowerCase(), value.toLowerCase());
    }


    @Then("^the response body contains element (.*) with numeric value equal to (.*)$")
    public void verifyResponseBodyElementNumericValueEqual(String element, int value) {
        int elementValueFromResponse = Integer.parseInt(response.then().extract().path(element).toString());
        Assertions.assertThat(elementValueFromResponse).describedAs("Element in response body does not match expected value").isEqualTo(value);
    }

    @Then("^the response body contains element (.*) with numeric value greater than (.*)$")
    public void verifyResponseBodyElementNumericValueGreater(String element, int value) {
        int elementValueFromResponse = Integer.parseInt(response.then().extract().path(element).toString());
        System.out.println("The JSON response is" + elementValueFromResponse);
        Assertions.assertThat(elementValueFromResponse).describedAs("Element in response body does not match expected value").isGreaterThan(value);
    }

//    @Then("I save the value from element '{str}' in variable '{str}'")
//    public void saveNumberOfHitsCountInMap(String element, String nameOfVariable) {
//        valuesMap.put(nameOfVariable, response.then().extract().path(element).toString());
//    }


    @Then("the response body contains element (.*) with numeric value less than (.*)$")
    public void verifyResponseBodyElementNumericValueLess(String element, int value) {
        int elementValueFromResponse = Integer.parseInt(response.then().extract().path(element).toString());
        Assertions.assertThat(elementValueFromResponse).describedAs("Element in response body does not match expected value").isLessThan(value);
    }

    @Then("the response body contains xml element with xpath (.*) and value (.*)")
    public void verifyResponseBodyXmlXpathContainsValue(String xpath, String value) {
        String responseBodyAsString = response.then().extract().body().asString();
        Document xmlDocument = stringToXmlDocument(responseBodyAsString);
        NodeList nodesAfterXpathEvaluation = parseXmlAndGetAllMatches(xmlDocument, xpath);
        boolean valueFoundInXpath = false;
        for (int i = 0; i < nodesAfterXpathEvaluation.getLength(); i++) {
            if (nodesAfterXpathEvaluation.item(i).getTextContent().equals(value)) {
                valueFoundInXpath = true;
                break;
            }
        }
        Assertions.assertThat(valueFoundInXpath).describedAs("Value:'" + value + "' not found in xpath: '" + xpath + "'").isTrue();
    }


    @Then("^the response body contains element with xpath (.*)$")
    public void verifyResponseBodyXmlXpath(String xpath) {
        String responseBodyAsString = response.then().extract().body().asString();
        Document xmlDocument = stringToXmlDocument(responseBodyAsString);
        NodeList nodesAfterXpathEvaluation = parseXmlAndGetAllMatches(xmlDocument, xpath);
        Assertions.assertThat(nodesAfterXpathEvaluation.getLength()).describedAs("No nodes found for xpath: " + xpath).isGreaterThan(0);
    }


//    @And("^the response body contains (.*)$")
//    public void verifyResponseBody(String responseQuery) {
//        Assertions.assertThat(response.getBody().asString()).describedAs("Body does not contain").contains(responseQuery);
//    }

    @And("^the JSON response body contains element (.*) with value (.*)$")
    public void validateJSONresponse(String element, String value) {

        // getting Json path as a string
        // List<String> jsonResponse=response.jsonPath().getList("$");
        String values = response.jsonPath().getString("" + element + "");
        System.out.println(values);
        logger.info("the values returned are" + values);
        Assertions.assertThat(values).describedAs("Element value is not equal to expected").contains(value);

    }

    public static Document stringToXmlDocument(String xmlString) {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder;
        try {
            builder = factory.newDocumentBuilder();
            Document document = builder.parse(new InputSource(new StringReader(xmlString)));
            return document;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static NodeList parseXmlAndGetAllMatches(Document xmlDocument, String xPathExpression) {
        //Get XPath
        XPathFactory xpf = XPathFactory.newInstance();
        XPath xpath = xpf.newXPath();

        //Get all matches
        NodeList nodes = null;
        try {
            nodes = (NodeList) xpath.evaluate(xPathExpression, xmlDocument, XPathConstants.NODESET);
        } catch (XPathExpressionException e) {
            e.printStackTrace();
        }
        return nodes;
    }


}
