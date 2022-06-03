package embase.tests.StepDefs;


import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.java.Before;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.serenitybdd.core.environment.EnvironmentSpecificConfiguration;
import net.thucydides.core.annotations.Managed;
import net.thucydides.core.util.EnvironmentVariables;
import org.apache.commons.lang3.reflect.FieldUtils;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import po.ConfigPage;
import po.LoginPage;
import po.common.BasePage;
import utils.StringHelper;
import utils.TestRailIntegration;
import utils.testrail.entities.Result;
import utils.testrail.entities.Screenshot;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.lang.invoke.MethodHandles;
import java.lang.reflect.Field;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.*;

public class CommonSteps {

    static final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());
    private EnvironmentVariables environmentVariables;
    public static String EMB_BUILD_NUMBER;
    public static String BASE_URL;
    public static String USER_EMAIL;
    public static String USER_PASSWORD;
    public static boolean IS_BE_SCENARIO = false;
    public static String PUBLIC_API_DOMAIN;
    public static String API_KEY;
    public static String INST_TOKEN;
    public static String JENKINS_BUILD_URL = System.getenv("BUILD_URL");
    public static String SCREENSHOTS_FOLDER;
    private Screenshot screenshot;
    private static long START_TIMESTAMP;
    public static Map<String, String> testCaseVariables = new HashMap();

    @Managed
    WebDriver driver;

    BasePage basePage;
    ConfigPage configPage;
    LoginPage loginPage;

    @Before(order = 1)
    public void setUp(Scenario scenario) {
        START_TIMESTAMP = System.currentTimeMillis();
        logger.info("-- BEFORE --");
        logger.info("Scenario Cucumber ID: " + scenario.getId());
        logger.info("Scenario Name: " + scenario.getName());
        logger.info("Scenario lines: " + scenario.getLines().toString());
        logger.info("Scenario Location: " + scenario.getUri());
        logger.info("Scenario tags: " + scenario.getSourceTagNames());

        for (String tag : scenario.getSourceTagNames()) {
            if (tag.equals("@BE")) {
                IS_BE_SCENARIO = true;
                logger.info("This is a BE Scenario. WebDriver instance not needed.");
                break;
            }
        }

        if (!IS_BE_SCENARIO) {
            // reading values from the conf file for FE scenarios
            USER_EMAIL = getProperty("user.email");
            USER_PASSWORD = getProperty("user.password");
            SCREENSHOTS_FOLDER = getProperty("screenshotsFolderName");

            // getting Build number for FE scenarios
            logger.info("FRONTEND SCENARIO, getting Build number from /config");
            getBuildNumber();
            logger.info("Build number EMB_BUILD_NUMBER: " + EMB_BUILD_NUMBER);
        } else {
            // for BE scenarios
            PUBLIC_API_DOMAIN = getProperty("publicApiDomain");
            API_KEY = getProperty("apikey");
            INST_TOKEN = getProperty("insttoken");
        }
        BASE_URL = getProperty("webdriver.base.url");
    }


    @After(order = 3)
    public void tearDown() {
        logger.info("-- AFTER --");
        logger.info("Closing driver");
        driver.close();
        driver.quit();
        System.gc();
    }

    @After(order = 2)
    public void sendResults(Scenario scenario) {
        if (TestRailIntegration.SEND_RESULTS_TESTRAIL) {
            logger.info("Sending results to TestRail.");

            // create Result object
            Result result = new Result();
            // TODO parametrize browser value
            String comment = "Build: " + EMB_BUILD_NUMBER + " - Browser: " + "chrome" +
                    " - Env: " + BASE_URL + " - Jenkins Build URL: " + JENKINS_BUILD_URL + " ";

            // get result status from scenario
            if (scenario.isFailed()) {
                // when scenario failed
                // get errors list from Cucumber scenario
                String errors = "";
                Field field = FieldUtils.getField(scenario.getClass(), "stepResults", true);
                field.setAccessible(true);
                try {
                    ArrayList<cucumber.api.Result> results = (ArrayList<cucumber.api.Result>) field.get(scenario);
                    for (cucumber.api.Result res : results) {
                        if (res.getError() != null)
                            errors += res.getError();
                    }
                } catch (Exception ignored) {
                }

                // add screenshot object to result
                if (screenshot != null) {
                    // Put the screenshot in result
                    result.setScreenshot(screenshot);
                } else {
                    comment += "[ERROR] - No screenshot available. ";
                    logger.error("Error trying to get screenshot");
                }
                if (scenario.getSourceTagNames().contains("@known")) {
                    // result is Known Issue (6)
                    result.setStatusId(6);
                    result.setComment(comment + ":\n" + TestRailIntegration.getScenarioDetails(scenario) + "\n - Known Issue:\n" + errors);
                } else {
                    // statusId 4 = retest / 5= failed
                    result.setStatusId(5);
                    result.setComment(comment + ":\n" + TestRailIntegration.getScenarioDetails(scenario) + " - Failed:\n" + errors);
                }
            } else {
                result.setStatusId(1);
                result.setComment(comment + ":\n" + TestRailIntegration.getScenarioDetails(scenario) + "\n" + " - Passed");
            }
            logger.info("Scenario result comment:\n" + result.getComment());

            // add elapsed time to result
            result.setElapsed(StringHelper.millisToTimespan(System.currentTimeMillis() - START_TIMESTAMP));

            // get caseId from scenario
            result.setCaseId(TestRailIntegration.getCaseIdFromScenarioTags(scenario.getSourceTagNames()));

            // update result in test run
            TestRailIntegration.sendResult(result);
        }
    }

    @After(order = 1)
    public void takeScreenshot(Scenario scenario) {
        if (!IS_BE_SCENARIO) {
            logger.info("takeScreenshot - After test");
            if (scenario.isFailed()) try {
                logger.info("Failed scenario: Trying to take screenshot");
                byte[] screenshotBytes = ((TakesScreenshot) driver).getScreenshotAs(OutputType.BYTES);
                scenario.embed(screenshotBytes, "image/png");

                // put byte array into screenshot object
                ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(screenshotBytes);
                BufferedImage bufferedImage = ImageIO.read(byteArrayInputStream);

                // file name
                String testCaseId = StringHelper.getRegex(scenario.getSourceTagNames().toString(), "@C\\d+").replaceAll("[^0-9]", "");
                String timeStamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());
                String fileName = "screenshot-" + testCaseId + "-" + timeStamp + ".png";

                // creating local directory for screenshots
                String directoryName = SCREENSHOTS_FOLDER;
                Files.createDirectories(Paths.get(directoryName));

                // write screenshot to file
                ImageIO.write(bufferedImage, "png", new File(directoryName + fileName));
                screenshot = new Screenshot(bufferedImage, directoryName + fileName);

            } catch (ClassCastException | IOException cce) {
                logger.error("Exception while taking browser screenshot");
            }
        }
    }

    @Given("user opens Embase application")
    public void openEmbase() {
        basePage.open();
        // TODO - waiting for resolution of EMBASE-13758
        // basePage.closePendoBanner();
    }

    private void getBuildNumber() {
        if (EMB_BUILD_NUMBER == null && TestRailIntegration.SEND_RESULTS_TESTRAIL) {
            logger.info("setUp - go to /config page");
            loginPage.open();
            loginPage.loginDefaultUser();
            configPage.open();
            logger.info("setUp - get the build number");
            if (!configPage.find(By.xpath("//html/body")).getText().contains("Webapp")) {
                EMB_BUILD_NUMBER = configPage.legacyBuildNumber.getText().split("build ")[1];
            } else {
                EMB_BUILD_NUMBER = "Webapp: " + configPage.webappBuildNumber.getText().split(": ")[2].split("\n")[0];
                EMB_BUILD_NUMBER += ", SG: " + configPage.securityGatewayBuildNumber.getText().split(": ")[2].split("\n")[0];
                EMB_BUILD_NUMBER += ", FE: " + configPage.reactBuildNumber.getText().split(": ")[2].split("\n")[0];
            }
            tearDown();
        } else {
            logger.info("build number already known");
        }
    }

    private String getProperty(String propertyName) {
        return EnvironmentSpecificConfiguration.from(environmentVariables)
                .getProperty(propertyName);
    }

    @Given("^set variable (.*) to unique string (.*)$")
    public void iSetUniqueStringVariable(String variableName, String variableValue) {
        setTestCaseVariable(variableName, variableValue + " " + System.currentTimeMillis());
    }

    public static void setTestCaseVariable(String variableName, String variableValue) {
        logger.info("Storing variable: " + variableName + " - with value: " + variableValue);
        if (testCaseVariables.containsKey(variableName)) {
            testCaseVariables.replace(variableName, variableValue);
        } else {
            testCaseVariables.put(variableName, variableValue);
        }
    }

    @Then("^user verifies that text is displayed: (.*)$")
    public void verifyTextDisplayed(String text) {
        basePage.verifyTextDisplayed(text);
    }

    @And("^user switches to (.*) tab$")
    public void userSwitchesToSecondWindow(String title) {
        String currentWindow = driver.getWindowHandle();
        for (String winHandle : driver.getWindowHandles()) {
            if (driver.switchTo().window(winHandle).getTitle().equals(title)) {
                break;
            } else {
                driver.switchTo().window(currentWindow);
            }
        }
    }

    @And("^user verifies that url contains (.*)$")
    public void userVerifiesThatUrlContains(String uri) {
        String currentUrl = driver.getCurrentUrl();
        Assert.assertTrue("The Url " + currentUrl + " does not contain '" + uri + "'", currentUrl.contains(uri));
    }

    // This method is creating ambiguity
//    @When("^user clicks on (.*) link$")
//    public void clickOnLink(String link) {
//        basePage.clickOnLink(link);
//    }

    @When("^user clicks (.*) button$")
    public void clickOnButton(String button) {
        basePage.clickOnButton(button);
    }

    @And("^user clicks on (.*) element by text$")
    public void clicksOnElementByText(String text) {
        basePage.clicksOnElementByText(text);
    }

    @And("^user verifies that text is not displayed: (.*)$")
    public void verifyTextIsNotDisplayed(String text) {
        basePage.verifyTextIsNotDisplayed(text);
    }

    @When("^user waits (\\d*) seconds$")
    public void waitSomeSeconds(Integer secs) throws InterruptedException {
        Thread.sleep(secs * 1000);
    }

    @And("user presses Tab key")
    public void pressesTabKey() {
        basePage.pressesTabKey();
    }

    @And("^user saves download url job id to variable (.*)$")
    public void userSetVarJobIdFromDownloadUrl(String varName) {
        basePage.userSetVarJobIdFromDownloadUrl(varName);
    }

    @And("^user reloads page$")
    public void userReloadsPage() {
        basePage.userReloadsPage();
    }

    @Then("^user checks that (.*) and (.*) values do not match$")
    public void checksThatValuesDoNotMatch(String var1, String var2) {
        basePage.checksThatValuesDoNotMatch(var1, var2);
    }
}
