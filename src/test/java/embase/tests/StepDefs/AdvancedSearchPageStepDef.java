package embase.tests.StepDefs;

import cucumber.api.java.en.When;
import po.AdvancedSearchPage;
import po.ResultsPage;
import po.common.SearchPage;

public class AdvancedSearchPageStepDef {
    AdvancedSearchPage advancedSearchPage;
    SearchPage searchPage;
    ResultsPage resultsPage;

    @When("^user opens Advanced Search page$")
    public void openAdvancedSearch() {
        advancedSearchPage.open();
    }

}
