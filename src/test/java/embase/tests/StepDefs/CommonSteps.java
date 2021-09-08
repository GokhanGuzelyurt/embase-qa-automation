package embase.tests.StepDefs;


import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.java.Before;
import cucumber.api.java.en.Given;
import net.serenitybdd.core.environment.EnvironmentSpecificConfiguration;
import net.thucydides.core.annotations.Managed;
import net.thucydides.core.util.EnvironmentVariables;
import org.apache.commons.lang3.reflect.FieldUtils;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import po.ConfigPage;
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
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

public class CommonSteps {

    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());
    private EnvironmentVariables environmentVariables;
    public static String EMB_BUILD_NUMBER;
    public static String BASE_URL;
    public static String USER_EMAIL;
    public static String USER_PASSWORD;
    public static boolean IS_BE_SCENARIO = false;
    public static String PUBLIC_API_DOMAIN;
    public static String API_KEY;
    public static String INST_TOKEN;
    public static String JENKINS_URL = System.getenv("JENKINS_URL");
    public static String SCREENSHOTS_FOLDER;
    private Screenshot screenshot;

    @Managed
    WebDriver driver;

    BasePage basePage;
    ConfigPage configPage;

    @Before(order = 1)
    public void setUp(Scenario scenario) {
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
            getBuildNumber();
            logger.info("Build number EMB_BUILD_NUMBER: " + EMB_BUILD_NUMBER);

            // reading values from the conf file
            USER_EMAIL = getProperty("user.email");
            USER_PASSWORD = getProperty("user.password");
        } else {
            // getting base url to be used in BE scenarios
            BASE_URL = getProperty("webdriver.base.url");
            PUBLIC_API_DOMAIN = getProperty("publicApiDomain");
            API_KEY = getProperty("apikey");
            INST_TOKEN = getProperty("insttoken");
            SCREENSHOTS_FOLDER = getProperty("screenshotsFolderName");
        }
    }


    @After(order = 1)
    public void tearDown() {
        logger.info("-- AFTER --");
        logger.info("Closing driver");
        driver.close();
        driver.quit();
        System.gc();
    }

    @After(order = 2)
    private void sendResults(Scenario scenario) {
        if (TestRailIntegration.SEND_RESULTS_TESTRAIL.equals("true")) {
            logger.info("Sending results to TestRail.");


            // get result from scenario


            // update result in test run


            // add screenshot to result in test run




            Field field = FieldUtils.getField(scenario.getClass(), "stepResults", true);
            field.setAccessible(true);
            List<Result> errors = Collections.emptyList();
            try {
                //ArrayList<Result> results = (ArrayList<cucumber.api.Result>) field.get(scenario);
               // errors = results.stream().filter(e -> e.getErrorMessage() != null).collect(Collectors.toList());
            } catch (Exception ignored) {
            }
            List<String> tags = (List<String>) scenario.getSourceTagNames();
            List<String> caseIds = tags.stream().filter(t -> t.matches("@C\\d+")).collect(Collectors.toList());

            // TODO parametrize browser
            String comment = "Build: " + EMB_BUILD_NUMBER + " - Browser: " + "chrome" +
                    " - Env: " + BASE_URL + " - Jenkins Job URL: " + JENKINS_URL + " ";

            // send Result based on case id
            Result result = new Result();




            // get LatestResultID

            // send Screenshot to LatestResult


        }
    }

    @After(order = 3)
    private void takeScreenshot(Scenario scenario) {
        if (!IS_BE_SCENARIO) {
            logger.info("InitTests - takesScreenshot - After");
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
    }

    private void getBuildNumber() {
        if (EMB_BUILD_NUMBER == null) {
            logger.info("setUp - go to /config page");
            configPage.open();
            logger.info("setUp - get the build number");
            EMB_BUILD_NUMBER = configPage.buildNumber.getText().split("build ")[1];
            tearDown();
        } else {
            logger.info("build number already known");
        }
    }

    private String getProperty(String propertyName) {
        return EnvironmentSpecificConfiguration.from(environmentVariables)
                .getProperty(propertyName);
    }

}
