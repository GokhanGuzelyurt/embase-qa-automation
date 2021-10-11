package embase.tests.StepDefs;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import enums.RecordActions;
import org.assertj.core.api.Assertions;
import org.jruby.RubyProcess;
import org.openqa.selenium.Keys;
import org.yecht.Data;
import po.ResultsPage;

public class ResultsPageStepDef {
    ResultsPage resultsPage;


    @Then("^the result set is not empty$")
    public void iVerifyResultsNotEmpty() {
        Assertions.assertThat(resultsPage.resultList.getResultsCount()).describedAs("Result is empty").isGreaterThan(0);
        System.out.println("Count is" + resultsPage.resultList.getResultsCount());
    }

    @When("^user opens Results page$")
    public void openMedicalDevice() {
        resultsPage.open();
        resultsPage.waitFor(resultsPage.searchField);
    }

    @Given("^user enters query (.*) on Results Page and performs a search$")
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
    public void checkRecordContent(int recordID, String source){
        resultsPage.resultList.checkRecordContent(recordID,source);
        Assertions.assertThat(resultsPage.resultList.checkRecordContent(recordID,source)).describedAs("Preprints source is not present").isEqualToIgnoringCase(source);

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
    public void prePrintsCheckBoxState(){
Assertions.assertThat(resultsPage.emailAlertPreprintSelected()).describedAs("Preprints checkbox is not selected").isTrue();
    }
}