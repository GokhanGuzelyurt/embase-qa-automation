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
import io.restassured.http.Cookies;
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
import utils.FileHelper;
import utils.StringHelper;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;
import java.io.StringReader;
import java.lang.invoke.MethodHandles;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import static embase.tests.StepDefs.CommonSteps.*;
import static net.serenitybdd.core.Serenity.getDriver;


public class HttpRequestResponseStepDef {

    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());
    private Response response = null;
    private RequestSpecification request;
    private boolean printRequestToConsole = true;
    private boolean printResponseToConsole = true;
    private int timeoutSeconds = 300;
    private String concatenatedBody;
    private String concatenatedUrl;
    private RestAssuredConfig config;
    public Cookie sessionCookie;
    public org.openqa.selenium.Cookie sessionUICookie;
    public org.openqa.selenium.Cookie jsessionUICookie;
    private List restAssuredCookies = new ArrayList();
    private String prefTermId;


    @Before(order = 5)
    public void setupBeTest() {
        if (CommonSteps.IS_BE_SCENARIO) {
            logger.info("Before BE test");

            // Setting timeout limits - TODO - Needs to be tested
            config = RestAssured.config()
                    .httpClient(HttpClientConfig.httpClientConfig()
                            .setParam(CoreConnectionPNames.CONNECTION_TIMEOUT, timeoutSeconds * 1000)
                            .setParam(CoreConnectionPNames.SO_TIMEOUT, timeoutSeconds * 1000)
                            .setParam(ClientPNames.COOKIE_POLICY, CookiePolicy.BROWSER_COMPATIBILITY));

            RestAssured.baseURI = BASE_URL;
            logger.info("Setting RestAssured baseURI to: " + PUBLIC_API_DOMAIN);

            concatenatedBody = "";
            concatenatedUrl = "";
        }
    }


    @And("I extract the prefTermId")
    public void extractPrefTermId() {
        prefTermId = response.then().extract().path("prefTermId[0]").toString();
        logger.info("prefTermId value is: " + prefTermId);
    }

    @Given("^I set the endpoint for the http request to (.*)$")
    public void setRequestEndpoint(String endpoint) {
        request = RestAssured.given().config(config);
        request.basePath(endpoint);
    }

    @Given("^I concatenate the value (.*) to the URL$")
    public void setConcatenatedRequestUrl(String value) {
        concatenatedUrl += value;
    }

    @And("^I concatenate the extracted prefTermId to the URL$")
    public void concatenatePrefTerm() {
        concatenatedUrl += prefTermId;
    }

    @Given("^I set the queryParam (.*) with value (.*)$")
    public void setRequestParam(String param, String value) {
        request.queryParam(param, value);
    }

    @Given("^I set the Public API endpoint for the http request to (.*)$")
    public void setPublicApiRequestEndpoint(String endpoint) {
        RestAssured.baseURI = PUBLIC_API_DOMAIN;
        logger.info(PUBLIC_API_DOMAIN);
        request = RestAssured.given().config(config);
        request.basePath(endpoint);
    }

    @Deprecated
    @Given("^I set the queryParam (.*) with encoded value (.*)$")
    public void setRequestWithEncodedParam(String param, String value) {
        request.queryParam(param, StringHelper.urlEncode(value));
    }

    @Given("^I set the API KEY with value from properties file$")
    public void setRequestParamFromProperties() {
        setRequestParam("apikey", API_KEY);
    }

    @Given("^I set the request header (.*) with value (.*)$")
    public void setRequestHeader(String header, String value) {
        request.given().header(header, value);
    }

    @Given("^I set the request body with value (.*)$")
    public void setRequestBody(String body) {
        concatenatedBody = body;
        request.given().body(body);
    }

    @Given("^I concatenate the request body with value (.*)$")
    public void setConcatenatedRequestBody(String body) {
        concatenatedBody = body;
        request.given().body(concatenatedBody);
    }

    @Given("^I set the request body with content from file (.*)$")
    public void setConcatenatedRequestBodyFromFile(String fileName) {
        String body = FileHelper.readFile(fileName);
        setRequestBody(body);
    }

    @Given("^I concatenate the request body with URL encoded content from file (.*)$")
    public void setConcatenatedRequestBodyFromFileUrlEncoded(String fileName) {
        String body = FileHelper.readFile(fileName);
        setRequestBody(StringHelper.urlEncode(body));
    }

    @When("^I execute the http request with method (.*)$")
    public void executeHttpGetRequest(String method) {
        logger.info("Executing HTTP request with method: " + method);

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

    @And("^I capture cookies from the authentication method$")
    public void captureCookies() {
        sessionCookie = response.getDetailedCookie("SESSION");
    }

    @Given("I set a valid SESSION cookie")
    public void setSessionCookie() {
        setCookie();
    }

    @And("I set the cookies captured in the request body")
    public void setCookie() {
        request.given().cookie(String.valueOf(sessionCookie));
    }

    @And("I set the session UI cookies captured in the request body")
    public void setSessionUICookie() {
        request.given().cookie(String.valueOf(sessionUICookie));
        request.given().cookie(String.valueOf(jsessionUICookie));
    }

    @Then("^the response body contains element (.*) with value (.*)$")
    public void verifyResponseBodyElementValue(String element, String value) {
        logger.info(response.then().extract().body().xmlPath().toString());
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
        logger.info("The JSON response is " + elementValueFromResponse);
        Assertions.assertThat(elementValueFromResponse).describedAs("Element in response body does not match expected value").isGreaterThan(value);
    }

    // TODO refactor - does not compile
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

    @And("^the JSON response body contains element (.*) with value (.*)$")
    public void validateJSONresponse(String element, String value) {

        // getting Json path as a string
        // List<String> jsonResponse=response.jsonPath().getList("$");
        String values = response.jsonPath().getString("" + element + "");
        logger.info("the values returned are " + values);
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

    @Then("the first suggested term is (.*)$")
    public void verifyResponseBodyElementValue(String term) {
        // this step checks if the main suggested term of a call to
        // autosuggest matches the expected
        try {
            String elementValueFromResponse = response.then().extract().path("useTerm[0]");
            logger.info("Extracted value: " + elementValueFromResponse);
            if (elementValueFromResponse == null)
                elementValueFromResponse = "null";

            String status = "PASS";
            if (!elementValueFromResponse.equals(term))
                status = "FAIL";

            // Saving results to a local csv file
            // Columns are: expected, actual, status
            FileHelper.addTextToFile("EmtreeResults.csv", "\n" + term + "," + elementValueFromResponse + "," + status);


            Assertions.assertThat(elementValueFromResponse).describedAs("Element in response body does not match expected value").isEqualTo(term);
        } catch (ClassCastException e) {
            Assertions.fail("Could not parse response to find element: " + term);
            // In case of error add a line to the local csv file
            FileHelper.addTextToFile("EmtreeResults.csv", "\n" + term + "," + "ERROR" + "," + "ERROR");
        }
    }

    @Then("the response body contains synonym (.*)$")
    public void verifyResponseBodySynonym(String term) {
        // this step is intended to check the content of a response from an emtree item
        // and find is a synonym word is present in the list of synonyms

        try {
            int listSize = response.then().extract().jsonPath().getList("synonyms").size();
            logger.info("LIST SIZE: " + listSize);

            String elementValueFromResponse = "NULL";
            String status = "FAIL";
            for (int i = 0; i < listSize; i++) {
                elementValueFromResponse = response.then().extract().path("synonyms[" + i + "]");
                logger.info("Evaluating: " + elementValueFromResponse);
                if (elementValueFromResponse.equals(term)) {
                    status = "PASS";
                    break;
                } else {
                    elementValueFromResponse = "NULL";
                }
            }
            // Saving results to a local csv file
            // expected, actual, status
            FileHelper.addTextToFile("EmtreeResults.csv", "," + term + "," + elementValueFromResponse + "," + status);


            Assertions.assertThat(elementValueFromResponse).describedAs("Element in response body does not match expected value").isEqualTo(term);
        } catch (ClassCastException e) {
            Assertions.fail("Could not parse response to find element with synonym: " + term);
            // In case of error add a line to the local csv file
            FileHelper.addTextToFile("EmtreeResults.csv", "," + term + "," + "ERROR" + "," + "ERROR");
        }
    }

    @And("user captures session UI cookies")
    public void captureSessionUICookies() {
        sessionUICookie = getDriver().manage().getCookieNamed("SESSION");
        jsessionUICookie = getDriver().manage().getCookieNamed("JSESSIONID");
    }
}
