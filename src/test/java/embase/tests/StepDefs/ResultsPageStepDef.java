package embase.tests.StepDefs;

import cucumber.api.java.en.Then;
import org.assertj.core.api.Assertions;
import org.jruby.RubyProcess;
import po.ResultsPage;

public class ResultsPageStepDef {
    ResultsPage resultsPage;


    @Then("^the result set is not empty$")
    public void iVerifyResultsNotEmpty() {
        Assertions.assertThat(resultsPage.resultList.getResultsCount()).describedAs("Result is empty").isGreaterThan(0);
        System.out.println("Count is" +resultsPage.resultList.getResultsCount());
    }



}
