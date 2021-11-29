package embase.tests.StepDefs;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import groovyjarjarantlr4.v4.analysis.LeftRecursiveRuleAnalyzer;
import io.cucumber.datatable.DataTable;
import org.assertj.core.api.Assertions;
import po.RecordDetailsPage;

import java.util.List;
import java.util.Map;

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
        Assertions.assertThat(recordDetailsPage.isORCIDHighlightingEnabled()).describedAs("ORCID is not highlighted").isTrue();
    }

    @When("^user clicks on the highlighted ORCID 0000-0001-6084-166X$")
    public void clickORCID() {
        recordDetailsPage.orcIDTitle.click();
    }

    @And("^Back to results link is displayed and enabled$")
    public void backToResultsLinkDisplayed() {
        Assertions.assertThat(recordDetailsPage.backToResultsLink.isDisplayed()).describedAs("Back to results link is not displayed").isTrue();
        Assertions.assertThat(recordDetailsPage.backToResultsLink.isEnabled()).describedAs("Back to results link is not enabled").isTrue();
    }

    @And("^pagination links are disabled on Record details page$")
    public void paginationLinksDisabled() {
        Assertions.assertThat(recordDetailsPage.isPaginationLinksNavigationStateEnabled()).describedAs("Pagination links are not disabled").isFalse();
    }

    @And("^pagination label contains value (.*)$")
    public void paginationLabelText(String labelText) {
        Assertions.assertThat(recordDetailsPage.getPaginationLabelText()).describedAs("Pagination text is not equal to expected").isEqualToIgnoringCase(labelText);
    }

    @And("^source values on Record details page are displayed:$")
    public void sourceValues(DataTable table) {
        List<Map<String, String>> rows = table.asMaps(String.class, String.class);
        Map<String, String> data = rows.get(0);

        Assertions.assertThat(recordDetailsPage.getSourceMagazineText()).describedAs("Source Magazine text is not equal to expected").isEqualToIgnoringCase(data.get("sourceMagazine"));
        Assertions.assertThat(recordDetailsPage.getSourceVolumeText()).describedAs("Source Volume text is not equal to expected text").isEqualToIgnoringCase(data.get("sourceVolume"));
    }

    @And("^view author address button is present on Record details page$")
    public void viewAuthorAddressBtn() {
        Assertions.assertThat(recordDetailsPage.viewAuthorAddresses.isDisplayed()).describedAs("Viewauthor address is not displayed").isTrue();
    }

    @And("^title field is not empty on record details page$")
    public void verifyTitleIsNotEmpty() {
        Assertions.assertThat(recordDetailsPage.title.getText().isEmpty()).describedAs("Title field is empty").isFalse();
    }

    @And("^authors text in Record Details page contain (.*)$")
    public void verifyAuthorsContainText(String expectedText) {
        Assertions.assertThat(recordDetailsPage.authors.getText()).describedAs("Record Details authors do not contain expected text").contains(expectedText);
    }

    @Then("^show original title link is displayed$")
    public void verifyShowOriginalTitleLink() {
        Assertions.assertThat(recordDetailsPage.showOriginalTitleLink.isDisplayed()).describedAs("Show original title link is not displayed").isTrue();
    }

    @And("^user clicks on Show original link to verify:$")
    public void verifyOriginalAndTranslatedTitle(DataTable table) {
        List<Map<String, String>> rows = table.asMaps(String.class, String.class);
        Map<String, String> data = rows.get(0);
        recordDetailsPage.showOriginalTitleLink.click();

        Assertions.assertThat(recordDetailsPage.originalTitle.getText()).describedAs("Original title is not equal to expected").isEqualToIgnoringCase(data.get("originalTitle"));
        Assertions.assertThat(recordDetailsPage.translatedTitle.getText()).describedAs("Original title is not equal to expected").isEqualToIgnoringCase(data.get("translatedTitle"));
    }

    @And("^the title on the Record details page is displayed as (.*)$")
    public void verifyTitleTextAvailable(String title){
        Assertions.assertThat(recordDetailsPage.originalTitle.getText()).describedAs("No title available is not displayed as a text").isEqualToIgnoringCase(title);
    }

    @And("^the abstract on the Record details page is displayed as (.*)$")
    public void verifyAbstractTextAvailable(String abstractText){
      Assertions.assertThat(recordDetailsPage.abstractText.getText()).describedAs("Abstract is not equal to expected").isEqualToIgnoringCase(abstractText);
    }

    @Then("^show original abstract link is displayed$")
    public void verifyShowOriginalAbstractLink() {
        Assertions.assertThat(recordDetailsPage.showOriginalAbstractLink.isDisplayed()).describedAs("Show original abstract link is not displayed").isTrue();
    }

    @And("^user clicks on Show original abstract link$")
    public void clickShowOriginalAbstractLink(){
        recordDetailsPage.showOriginalAbstractLink.click();
    }

    @And("^original abstract is:$")
    public void verifyOriginalAbstract(DataTable table){
        List<Map<String, String>> rows = table.asMaps(String.class, String.class);
        Map<String, String> data = rows.get(0);
        Assertions.assertThat(recordDetailsPage.originalAbstract.getText()).describedAs("Original abstract is not equal to expected").isEqualToIgnoringCase(data.get("originalAbstract"));
    }

    @And("^translated abstract is:$")
    public void verifyTranslatedAbstract(DataTable table){
        List<Map<String, String>> rows = table.asMaps(String.class, String.class);
        Map<String, String> data = rows.get(0);
        Assertions.assertThat(recordDetailsPage.translatedAbstract.getText()).describedAs("Translated abstract is not equal to expected").isEqualToIgnoringCase(data.get("translatedAbstract"));
    }
}
