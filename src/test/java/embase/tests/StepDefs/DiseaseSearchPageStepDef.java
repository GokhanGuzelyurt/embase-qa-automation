package embase.tests.StepDefs;

import cucumber.api.java.en.When;
import po.DiseaseSearchPage;

public class DiseaseSearchPageStepDef {
    DiseaseSearchPage diseaseSearchPage;

    @When("^user opens Disease Search page$")
    public void openDrugSearch() {
        diseaseSearchPage.open();
    }
}
