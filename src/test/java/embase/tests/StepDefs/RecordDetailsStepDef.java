package embase.tests.StepDefs;

import cucumber.api.java.en.When;
import org.assertj.core.api.Assertions;
import po.RecordDetailsPage;

public class RecordDetailsStepDef {
    RecordDetailsPage recordDetailsPage;

    @When("^user is on Record Details page$")
    public void recordDetailsPageDisplayed() {
        recordDetailsPage.shouldBeDisplayed();
        recordDetailsPage.recordTitle.waitUntilEnabled();
        Assertions.assertThat(recordDetailsPage.recordTitle.getText()).describedAs("Record Details title is not displayed").isEqualToIgnoringCase("Record details");
    }




}
