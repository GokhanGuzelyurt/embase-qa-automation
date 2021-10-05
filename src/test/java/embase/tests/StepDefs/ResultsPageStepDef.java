package embase.tests.StepDefs;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import enums.RecordActions;
import org.assertj.core.api.Assertions;
import org.jruby.RubyProcess;
import org.openqa.selenium.Keys;
import po.ResultsPage;

public class ResultsPageStepDef {
    ResultsPage resultsPage;


    @Then("^the result set is not empty$")
    public void iVerifyResultsNotEmpty() {
        Assertions.assertThat(resultsPage.resultList.getResultsCount()).describedAs("Result is empty").isGreaterThan(0);
        System.out.println("Count is" +resultsPage.resultList.getResultsCount());
    }

    @When("^user opens Results page$")
    public void openMedicalDevice() {
        resultsPage.open();
    }

    @Given("^user enters query (.*) on Results Page$")
    public void enterSearchQuery(String query){
        resultsPage.searchField.clear();
        resultsPage.searchField.sendKeys(query);
        resultsPage.searchField.sendKeys(Keys.ENTER);
    }

    @When("^user performs (.*) for record #(.*) on results page$")
    public void runActionOnRecordResultsPage(RecordActions action, int recordID) {
        resultsPage.resultList.runActionOnRecord(recordID, action);
    }

}
