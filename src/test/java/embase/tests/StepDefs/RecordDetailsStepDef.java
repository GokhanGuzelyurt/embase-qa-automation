package embase.tests.StepDefs;

import cucumber.api.java.en.When;
import po.RecordDetailsPage;

public class RecordDetailsStepDef {
    RecordDetailsPage recordDetailsPage;

    @When("^user is on Record Details page$")
    public void recordDetailsPageDisplayed() {
        recordDetailsPage.shouldBeDisplayed();
    }




}
