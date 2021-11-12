package embase.tests.StepDefs;

import cucumber.api.java.en.When;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import po.EmailAlertsPage;

import java.lang.invoke.MethodHandles;

public class EmailAlertsPageStepDef {
    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());

    EmailAlertsPage emailAlertsPage;

    @When("^user opens Email Alerts page$")
    public void openEmailAlertsPage() {
        emailAlertsPage.open();
        emailAlertsPage.waitForJStoLoad();
    }

}