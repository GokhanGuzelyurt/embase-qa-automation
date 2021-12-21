package embase.tests.StepDefs;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.cucumber.datatable.DataTable;
import org.assertj.core.api.Assertions;
import po.RecordDetailsPage;
import po.ResultsPage;

import java.util.List;
import java.util.Map;

public class RecordDetailsStepDef {
    RecordDetailsPage recordDetailsPage;
    ResultsPage resultsPage;

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
    public void verifyTitleTextAvailable(String title) {
        Assertions.assertThat(recordDetailsPage.originalTitle.getText()).describedAs("No title available is not displayed as a text").isEqualToIgnoringCase(title);
    }

    @And("^the abstract on the Record details page is displayed as (.*)$")
    public void verifyAbstractTextAvailable(String abstractText) {
        Assertions.assertThat(recordDetailsPage.abstractText.getText()).describedAs("Abstract is not equal to expected").isEqualToIgnoringCase(abstractText);
    }

    @Then("^show original abstract link is displayed$")
    public void verifyShowOriginalAbstractLink() {
        Assertions.assertThat(recordDetailsPage.showOriginalAbstractLink.isDisplayed()).describedAs("Show original abstract link is not displayed").isTrue();
    }

    @And("^user clicks on Show original abstract link$")
    public void clickShowOriginalAbstractLink() {
        recordDetailsPage.showOriginalAbstractLink.click();
    }

    @And("^original abstract is:$")
    public void verifyOriginalAbstract(DataTable table) {
        List<Map<String, String>> rows = table.asMaps(String.class, String.class);
        Map<String, String> data = rows.get(0);
        Assertions.assertThat(recordDetailsPage.originalAbstract.getText()).describedAs("Original abstract is not equal to expected").isEqualToIgnoringCase(data.get("originalAbstract"));
    }

    @And("^translated abstract is:$")
    public void verifyTranslatedAbstract(DataTable table) {
        List<Map<String, String>> rows = table.asMaps(String.class, String.class);
        Map<String, String> data = rows.get(0);
        Assertions.assertThat(recordDetailsPage.translatedAbstract.getText()).describedAs("Translated abstract is not equal to expected").isEqualToIgnoringCase(data.get("translatedAbstract"));
    }

    @And("^the pagination options have the following state:$")
    public void verifyPaginationOptionsState(DataTable table) {
        List<List<String>> data = table.asLists(String.class);
        if (data.get(1).get(0).equalsIgnoreCase("Previous")) {
            Assertions.assertThat(String.valueOf(recordDetailsPage.previous.isEnabled())).describedAs("Pagination state is not equal to expected").isEqualTo(data.get(1).get(1));
        } else if (data.get(1).get(0).equalsIgnoreCase("Next")) {
            Assertions.assertThat(String.valueOf(recordDetailsPage.next.isEnabled())).describedAs("Pagination state is not equal to expected").isEqualTo(data.get(1).get(1));
        } else if (data.get(2).get(0).equalsIgnoreCase("Previous")) {
            Assertions.assertThat(String.valueOf(recordDetailsPage.previous.isEnabled())).describedAs("Pagination state is not equal to expected").isEqualTo(data.get(2).get(1));
        } else if (data.get(2).get(0).equalsIgnoreCase("Next")) {
            Assertions.assertThat(String.valueOf(recordDetailsPage.next.isEnabled())).describedAs("Pagination state is not equal to expected").isEqualTo(data.get(2).get(1));
        }
    }

    @And("^user clicks on Next button on Record Details page$")
    public void clickNextPaginationLink() {
        recordDetailsPage.next.click();
    }

    @And("^user clicks on Previous button on Record Details page$")
    public void clickPreviousPaginationLink() {
        recordDetailsPage.previous.click();
    }

    @And("^user clicks on Back to Results link$")
    public void clickBackToResultsLink() {
        recordDetailsPage.backToResultsLink.click();
    }

    @And("^user selects 100 records from record selection$")
    public void select100RecordsFromSelection() {
        resultsPage.resultList.recordSelector.click();
        resultsPage.resultList.rec100.click();
    }

    @And("^the link (.*) is visible on the page$")
    public void verifyLinkIsVisible(String linkText) {
        Assertions.assertThat(recordDetailsPage.backToResultsLink.getText()).describedAs("Text is not equal to expected").isEqualToIgnoringCase(linkText);
    }

    @When("^user clicks on Back to Clipboard link$")
    public void clickLink() {
        recordDetailsPage.backToResultsLink.click();
    }

    @When("^user click on (.*) button on Record Details page$")
    public void clickSendBtn(String actionName) {
        recordDetailsPage.clickOnAction(actionName);
    }

    @Then("^user verifies the UI of Send Results modal$")
    public void verifySendResultsModal() {
        Assertions.assertThat(recordDetailsPage.sendToLabelText.getText()).describedAs("Send to label text is not equal to expected").isEqualToIgnoringCase("Send to");
        Assertions.assertThat(recordDetailsPage.sendToInputField.getAttribute("value")).describedAs("Input text does not have default value").isEqualToIgnoringCase(CommonSteps.USER_EMAIL);
        Assertions.assertThat(recordDetailsPage.ccLabelText.getText()).describedAs("cc label text is not equal to expected").isEqualToIgnoringCase("CC");
        Assertions.assertThat(recordDetailsPage.subjectLabelText.getText()).describedAs("subject label text is not equal to expected").isEqualToIgnoringCase("Subject");
        Assertions.assertThat(recordDetailsPage.commentsLabelText.getText()).describedAs("comment label text is not equal to expected").isEqualToIgnoringCase("Comments");
        Assertions.assertThat(recordDetailsPage.htmlFormatRadioBtn.isDisplayed()).describedAs("HTML radio button is not displayed").isTrue();
        Assertions.assertThat(recordDetailsPage.textFormatRadioBtn.isDisplayed()).describedAs("Text radio button is not displayed").isTrue();
        Assertions.assertThat(recordDetailsPage.emailNotificationText.getText()).describedAs("Email text is not equal to expected").isEqualToIgnoringCase(recordDetailsPage.EMAIL_TEXT_LABEL);
        Assertions.assertThat(recordDetailsPage.sendEmailBtn.isEnabled()).describedAs("SendEmail button isnot displayed").isTrue();

    }

    @When("^user enters the subject as (.*) on Send Results modal$")
    public void enterSubjectSendResultsModal(String subject) {
        recordDetailsPage.subjectInputField.sendKeys(subject);
    }

    @And("^clicks on Send button on Send Results Modal$")
    public void clickSendResults() {
        recordDetailsPage.sendEmailBtn.click();
    }

    @And("^a subject error message (.*) is displayed on Send Results Modal$")
    public void subjectErrorMessageValidation(String subjectError) {
        Assertions.assertThat(recordDetailsPage.subjectAlertText.getText()).describedAs("Error message is not equal to expected").isEqualToIgnoringCase(subjectError);
    }

    @Then("^a message box on Record Details is displayed with the message (.*)$")
    public void verifySignInMessage(String message) {
        Assertions.assertThat(recordDetailsPage.messageBoxSignIn.getText()).describedAs("Text message is not equal to expected").contains(message);
    }

    @When("^user clicks on (.*) on message box on Record Details page$")
    public void clickBySpanText(String spanText) {
        recordDetailsPage.clickBySpanText(spanText);
    }

    @And("^full text link on Record Details page is displayed$")
    public void verifyFullTextLink() {
        Assertions.assertThat(recordDetailsPage.fullTextLinkRightPane.isDisplayed()).describedAs("Full text link is not displayed").isTrue();
    }

    @And("^Add to Clipboard link is present on Record Details page$")
    public void addToClipBoardLink() {
        Assertions.assertThat(recordDetailsPage.addToClipboardRightPane.isDisplayed()).describedAs("Add to Clipboard link is not present").isTrue();
    }

    @When("^user clicks on Add to Clipboard link on Record Details page$")
    public void clickAddToCLipboard() {
        recordDetailsPage.addToClipboardRightPane.click();
    }

    @Then("^Add to Clipboard link is disabled$")
    public void verifyAddToClipboardDisabled() {
        Assertions.assertThat(recordDetailsPage.addToClipboardRightPane.isEnabled()).describedAs("Add to clipboard is still enabled").isFalse();
    }

    @When("^user clicks on Similar records link on Record Details Page$")
    public void clickSimilarRecordsLink() {
        recordDetailsPage.similarRecordsRightPane.click();
    }

    @When("^user clicks on Search by author link on Record Details Page$")
    public void clickSearchByAuthorLink() {
        recordDetailsPage.searchAuthorsRightPane.click();
    }

    @And("^Search by authors modal is displayed$")
    public void verifySearchByAuthorModal() {
        Assertions.assertThat(recordDetailsPage.searchByAuthorModal.isDisplayed()).describedAs("Search by author modal is not displayed").isTrue();
        Assertions.assertThat(recordDetailsPage.searchByAuthorLabel.getText()).describedAs("The label is not equal to expected").isEqualToIgnoringCase("Search by author(s)");
    }

    @When("^user selects author (.*) and click on Search$")
    public void selectAuthorRecordDetailsPage(String authorName) {
        recordDetailsPage.selectAuthorByText(authorName);
        recordDetailsPage.searchAuthorBtn.click();
    }

    @And("^organization link on Record Details page is displayed$")
    public void verifyOrganizationLink() {
        Assertions.assertThat(recordDetailsPage.organizationSpecificLinkRightPane.isDisplayed()).describedAs("Full text link is not displayed").isTrue();
    }

    @When("^user clicks on collapsible section title (.*) of the Record details page")
    public void clickCollapsibleSectionTitle(String sectionName) {
        recordDetailsPage.clickCollapsibleSectionTitle(sectionName);
    }

}

