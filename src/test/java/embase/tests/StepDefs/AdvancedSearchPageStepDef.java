package embase.tests.StepDefs;

import cucumber.api.java.en.Then;
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

    @Then("^user is on Advanced Search Page$")
    public void verifyAdvancedSearchPage(){
        advancedSearchPage.shouldBeDisplayed();
        resultsPage.searchField.isDisplayed();
    }
}
