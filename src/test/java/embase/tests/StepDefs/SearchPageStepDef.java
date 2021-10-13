package embase.tests.StepDefs;

import cucumber.api.java.en.And;
import cucumber.api.java.en.When;
import po.AdvancedSearchPage;
import po.ResultsPage;
import po.common.SearchPage;
import po.sections.search.Ribbon;

public class SearchPageStepDef {
    ResultsPage resultsPage;
    AdvancedSearchPage advancedSearchPage;
    Ribbon ribbon;

    @When("^user opens (.*) on search page$")
    public void openTab(String tabName) {
        advancedSearchPage.selectTab(tabName);
    }

    @And("^user enters search criteria as (.*)$")
    public void enterSearchCriteria(String searchQuery){
        resultsPage.searchField.sendKeys(searchQuery);
    }
}
