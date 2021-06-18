package embase.tests.StepDefs;

import cucumber.api.java.After;
import cucumber.api.java.Before;
import cucumber.api.java.en.Given;
import net.thucydides.core.annotations.Managed;
import org.openqa.selenium.WebDriver;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import po.ConfigPage;
import po.common.BasePage;

import java.lang.invoke.MethodHandles;

public class CommonSteps {

    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());
    public static String EMB_BUILD_NUMBER;

    @Managed
    WebDriver driver;

    BasePage basePage;
    ConfigPage configPage;

    @Before
    public void setUp() {
        logger.info("-- BEFORE --");
        getBuildNumber();
        logger.info("Build number EMB_BUILD_NUMBER: " + EMB_BUILD_NUMBER);
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

}
