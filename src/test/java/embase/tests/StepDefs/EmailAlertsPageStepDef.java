package embase.tests.StepDefs;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.assertj.core.api.Assertions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import po.EmailAlertsPage;
import utils.StringHelper;

import java.lang.invoke.MethodHandles;

public class EmailAlertsPageStepDef {
    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());

    EmailAlertsPage emailAlertsPage;

    @When("^user opens Email Alerts page$")
    public void openEmailAlertsPage() {
        emailAlertsPage.open();
        emailAlertsPage.waitForJStoLoad();
    }

    @When("^user highlights Email Alert with name (.*)$")
    public void highlightEmailAlertByName(String name) {
        String emailAlertName = StringHelper.resolveVariable(name);
        emailAlertsPage.getEmailAlertRowByName(emailAlertName).click();
        logger.info("Highlighted Email Alert ID is: " + emailAlertsPage.getEmailAlertRowByName(emailAlertName).getAttribute("data-id"));
        CommonSteps.setTestCaseVariable("highlightedEmailAlertId", emailAlertsPage.getEmailAlertRowByName(emailAlertName).getAttribute("data-id"));
        emailAlertsPage.waitForJStoLoad();
    }


    @Then("^email alert details shows Preprints status (.*)$")
    public void checkEmailAlertDetailsPreprintsStatus(String expectedStatus) {
        Assertions.assertThat(emailAlertsPage.alertDetailsPreprintsStatus.getText()).isEqualTo(expectedStatus).describedAs("Preprint status is not " + expectedStatus);
    }

    @When("^user clicks on ReRun action for the highlighted Email Alert$")
    public void clickOnEmailAlertAction() {
        emailAlertsPage.getReRunButtonForHighlightedEmailAlert().click();
        emailAlertsPage.waitForJStoLoad();
    }
}