package embase.tests.StepDefs;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import po.QuickSearchPage;

public class QuickSearchPageStepDef {

    QuickSearchPage quickSearchPage;

    @Then("Quick search page is opened")
    public void verifyQuickSearchPage() {
        quickSearchPage.at();
    }

    @When("user opens Quick Search page")
    public void openQuickSearchPage() {
        quickSearchPage.open();
    }
}
