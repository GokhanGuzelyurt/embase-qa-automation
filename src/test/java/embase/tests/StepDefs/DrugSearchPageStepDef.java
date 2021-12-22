package embase.tests.StepDefs;

import cucumber.api.java.en.When;
import po.DrugSearchPage;

public class DrugSearchPageStepDef {
    DrugSearchPage drugSearchPage;

    @When("^user opens Drug Search page$")
    public void openDrugSearch() {
        drugSearchPage.open();
    }
}
