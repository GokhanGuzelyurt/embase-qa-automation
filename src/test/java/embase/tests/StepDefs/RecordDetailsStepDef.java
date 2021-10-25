package embase.tests.StepDefs;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
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

    @And("^author ORCID 0000-0001-6084-166X is displayed on record details page$")
    public void orcIDDisplayed() {
        Assertions.assertThat(recordDetailsPage.orcIDTitle.isDisplayed()).describedAs("ORCID is not displayed").isTrue();
    }

    @And("^the author ORCID 0000-0001-6084-166X is highlighted$")
    public void orcIDHighlighted() {
        Assertions.assertThat(recordDetailsPage.verifyORCIDHighlighting()).describedAs("ORCID is not highlighted").isTrue();
    }

    @When("^user clicks on the highlighted ORCID 0000-0001-6084-166X$")
    public void clickORCID() {
        recordDetailsPage.orcIDTitle.click();
    }

}
