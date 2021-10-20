package embase.tests.StepDefs;

import cucumber.api.java.en.And;
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

    @And("^author ORCID is displayed on record details page$")
    public void orcIDDisplayed() {
        Assertions.assertThat(recordDetailsPage.orcIDTitle.isDisplayed()).describedAs("ORCID is not displayed").isTrue();
    }

    @And("^the author ORCID is highlighted$")
    public void orcIDHighlighted() {
        Assertions.assertThat(recordDetailsPage.verifyORCIDHighlighting()).describedAs("ORCID is not highlighted").isTrue();
    }

    @When("^user clicks on the highlighted ORCID$")
    public void clickORCID() {
        recordDetailsPage.orcIDTitle.click();
    }
}
