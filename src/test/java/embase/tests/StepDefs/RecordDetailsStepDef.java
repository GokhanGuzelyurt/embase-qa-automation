package embase.tests.StepDefs;

import cucumber.api.java.en.When;
import po.RecordDetailsPage;

public class RecordDetailsStepDef {
    RecordDetailsPage recordDetailsPage;

    @When("^user opens Record Details page$")
    public void openMedicalDevice() {
        recordDetailsPage.open();
    }

}
