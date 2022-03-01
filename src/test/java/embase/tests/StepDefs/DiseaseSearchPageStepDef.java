package embase.tests.StepDefs;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import po.DiseaseSearchPage;
import po.ResultsPage;

public class DiseaseSearchPageStepDef {
    DiseaseSearchPage diseaseSearchPage;
    ResultsPage resultsPage;

    @When("^user opens Disease Search page$")
    public void openDrugSearch() {
        diseaseSearchPage.open();
    }

    @Then("^user is on Disease Search Page$")
    public void verifyDiseaseSearchPage(){
        diseaseSearchPage.shouldBeDisplayed();
        resultsPage.searchField.isDisplayed();

    }
}
