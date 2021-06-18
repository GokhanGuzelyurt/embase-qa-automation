package embase.tests.StepDefs;

import cucumber.api.java.en.Then;
import po.QuickSearchPage;

public class QuickSearchPageStepDef {

    QuickSearchPage quickSearchPage;

    @Then("Quick search page is opened")
    public void verifyQuickSearchPage() {
        quickSearchPage.at();
    }

}
