package embase.tests.StepDefs;

import cucumber.api.java.After;
import cucumber.api.java.Before;
import cucumber.api.java.en.Given;
import net.thucydides.core.annotations.Managed;
import org.openqa.selenium.WebDriver;
import po.BasePage;

public class CommonSteps {

    public static String EMB_BUILD_NUMBER;

    @Managed
    WebDriver driver;

    BasePage basePage;

    @Before
    public void setUp() {
        System.out.println("BEFORE");
        getBuildNumber();

    }

    private void getBuildNumber() {
//        if (EMB_BUILD_NUMBER == null) {
//            logger.info("setUp - go to /config page");
//            configPage.openUrl();
//            logger.info("setUp - get the build number");
//            configPage.getBuildNumber();
//            // killing driver to keep the /config flow separate
//            tearDown();
//        } else {
//            logger.info("build number already known: " + EMB_BUILD_NUMBER + " - skipping call to /config page");
//        }
    }

    @After
    public void tearDown() {
        driver.close();
        driver.quit();
        System.gc();
    }


    @Given("user opens Embase application")
    public void openEmbase() {
        basePage.open();
        System.out.println("OPEN PAGE");
    }


}
