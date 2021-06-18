package embase.tests.StepDefs;

import cucumber.api.java.After;
import cucumber.api.java.Before;
import cucumber.api.java.en.Given;
import net.serenitybdd.core.environment.EnvironmentSpecificConfiguration;
import net.thucydides.core.annotations.Managed;
import net.thucydides.core.util.EnvironmentVariables;
import org.openqa.selenium.WebDriver;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import po.ConfigPage;
import po.common.BasePage;

import java.lang.invoke.MethodHandles;

public class CommonSteps {

    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());
    private EnvironmentVariables environmentVariables;
    public static String EMB_BUILD_NUMBER;
    public static String USER_EMAIL;
    public static String USER_PASSWORD;


    @Managed
    WebDriver driver;

    BasePage basePage;
    ConfigPage configPage;

    @Before
    public void setUp() {
        logger.info("-- BEFORE --");
        getBuildNumber();
        logger.info("Build number EMB_BUILD_NUMBER: " + EMB_BUILD_NUMBER);

        // reading values from the conf file
        USER_EMAIL = getProperty("user.email");
        USER_PASSWORD = getProperty("user.password");

    }


    @After
    public void tearDown() {
        logger.info("-- AFTER --");
        logger.info("Closing driver");
        driver.close();
        driver.quit();
        System.gc();
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
