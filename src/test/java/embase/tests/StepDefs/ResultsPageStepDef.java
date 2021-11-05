package embase.tests.StepDefs;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.assertj.core.api.Assertions;
import org.openqa.selenium.Keys;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import po.ResultsPage;

import java.lang.invoke.MethodHandles;

public class ResultsPageStepDef {
    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());
    ResultsPage resultsPage;

    @Then("^the result set is not empty$")
    public void iVerifyResultsNotEmpty() {
        Assertions.assertThat(resultsPage.resultList.getResultsCount()).describedAs("Result is empty").isGreaterThan(0);
        logger.info("Count is " + resultsPage.resultList.getResultsCount());
    }

    @When("^user opens Results page$")
    public void openResultsPage() {
        resultsPage.open();
        resultsPage.waitFor(resultsPage.searchField);
    }

    @Given("^user enters query (.*) and performs a search$")
    public void enterSearchQuery(String query) {
        resultsPage.searchField.clear();
        resultsPage.searchField.sendKeys(query);
        resultsPage.searchField.sendKeys(Keys.ENTER);
        resultsPage.waitForRecordSectionIsLoaded();
    }

    @And("^user opens record #(.*) by clicking on title$")
    public void openRecordByTitle(int recordId) {
        resultsPage.resultList.clickRecordByTitle(recordId);
    }

    @And("^record #(.*) contains source as (.*)$")
    public void checkRecordContent(int recordID, String source) {
        resultsPage.resultList.checkRecordContent(recordID, source);
        Assertions.assertThat(resultsPage.resultList.checkRecordContent(recordID, source)).describedAs("Preprints source is not present").isEqualToIgnoringCase(source);

    }

    @And("^user opens Source tab on Results page$")
    public void openSourceTabResultsPage() {
        resultsPage.sourceTab.click();
    }

    @Then("^source checkbox Preprints should be displayed$")
    public void verifyPreprintsSource() {
        Assertions.assertThat(resultsPage.prePrintsChkBox.getText()).describedAs("Preprints checkbox is not displayed").isEqualToIgnoringCase("Preprints");
    }

    @And("^user selects the preprints checkbox and clicks on Search$")
    public void selectPreprintsChkBox() {
        resultsPage.prePrintsChkBox.click();
        resultsPage.searchButton.click();
    }

    @And("^user clicks on EmailAlert link$")
    public void clickEmailAlert() {
        resultsPage.setEmailAlert();
    }

    @And("^(.*) labelname is displayed on Email Alerts$")
    public void prePrintsLabelEmailAlerts(String labelName) {
        Assertions.assertThat(resultsPage.emailAlertLabelNames(labelName)).describedAs("Flag shouldbe true").isTrue();
    }

    @And("^Preprints checkbox is selected by default$")
    public void prePrintsCheckBoxState() {
        Assertions.assertThat(resultsPage.emailAlertPreprintSelected()).describedAs("Preprints checkbox is not selected").isTrue();
    }

    @Then("^search query is (.*)$")
    public void verifySearchQuery(String query) {
        resultsPage.verifySearchQuery(query);
    }

    @And("^user is on Results Page$")
    public void resultsPageIsOpened() {
        resultsPage.searchField.waitUntilEnabled();
    }

    @And("^user opens Sources filter$")
    public void openSourceFilter() {
        resultsPage.sourcesFilter.click();
    }

    @And("^user selects Preprints source bubble$")
    public void selectPreprintsBubble() {
        resultsPage.preprintsSourceBubble.click();
    }

    @And("^user click on Apply button$")
    public void clickApply() {
        resultsPage.applyBtn.click();
    }


}