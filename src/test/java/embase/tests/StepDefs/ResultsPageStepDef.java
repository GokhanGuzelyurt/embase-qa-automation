package embase.tests.StepDefs;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.cucumber.datatable.DataTable;
import org.assertj.core.api.Assertions;
import org.openqa.selenium.Keys;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import po.ResultsPage;
import po.sections.results.EmailAlertDialog;
import utils.StringHelper;

import java.lang.invoke.MethodHandles;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class ResultsPageStepDef {
    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());
    ResultsPage resultsPage;
    EmailAlertDialog emailAlertDialog;

    @Then("^the result set is not empty$")
    public void iVerifyResultsNotEmpty() {
        resultsPage.waitForJStoLoad();
        logger.info("Count is " + resultsPage.resultList.getResultsCount());
        Assertions.assertThat(resultsPage.resultList.getResultsCount()).describedAs("Result is empty").isGreaterThan(0);
    }

    @Then("^the result set is empty$")
    public void iVerifyResultIsEmpty() {
        resultsPage.waitForJStoLoad();
        logger.info("Count is " + resultsPage.resultList.getResultsCount());
        Assertions.assertThat(resultsPage.resultList.getResultsCount()).describedAs("Result is not empty").isEqualTo(0);
    }

    @Then("^record #(\\d*) of the results list contains (.*) in authors$")
    public void verifyResultListAuthors(int recordNumber, String expectedText) {
        Assertions.assertThat(resultsPage.resultList.getResultListAuthorsTextForRecord(recordNumber)).describedAs("Results list element does not contain expected text").contains(expectedText);
    }

    @When("^user selects record #(\\d*) from the records list in Result Page$")
    public void selectRecordFromResultsList(int recordNumber) {
        resultsPage.resultList.selectResultListCheckboxForRecord(recordNumber);
    }

    @And("^user selects records (.*) from the records list on Results page and click on (.*)$")
    public void selectRecords(String recordIds, String actionName) {
        resultsPage.resultList.selectResultListCheckboxForMultipleRecords(Arrays.stream(recordIds.split(",")).mapToInt(Integer::parseInt).toArray());
        resultsPage.clickOnActionLink(actionName);
    }

    @When("^user opens Results page$")
    public void openResultsPage() {
        resultsPage.open();
        resultsPage.waitFor(resultsPage.searchField);
    }

    @Given("^user enters query (.*) and performs a search$")
    public void enterSearchQuery(String query) {
        resultsPage.waitForJStoLoad();
        resultsPage.searchField.clear();
        resultsPage.searchField.sendKeys(query);
        resultsPage.searchField.sendKeys(Keys.ENTER);
        resultsPage.waitForRecordSectionIsLoaded();
    }

    @And("^user opens record #(\\d*) by clicking on title$")
    public void openRecordByTitle(int recordId) {
        resultsPage.resultList.clickRecordByTitle(recordId);
    }

    @And("^record #(.*) contains source as (.*)$")
    public void checkRecordContent(int recordID, String source) {
        resultsPage.resultList.checkRecordContent(recordID, source);
        Assertions.assertThat(resultsPage.resultList.checkRecordContent(recordID, source)).describedAs("Preprints source is not present").isEqualToIgnoringCase(source);
    }

    @And("^user opens Source tab on Results page$")
    public void openSourceTabResultsPage() {
        resultsPage.sourceTab.click();
    }

    @Then("^source checkbox Preprints should be displayed$")
    public void verifyPreprintsSource() {
        Assertions.assertThat(resultsPage.prePrintsChkBox.getText()).describedAs("Preprints checkbox is not displayed").isEqualToIgnoringCase("Preprints");
    }

    @And("^user selects the preprints checkbox and clicks on Search$")
    public void selectPreprintsChkBox() {
        resultsPage.prePrintsChkBox.click();
        resultsPage.searchButton.click();
    }

    @And("^user clicks on set EmailAlert link$")
    public void clickEmailAlert() {
        resultsPage.setEmailAlert();
    }

    @And("^(.*) labelname is displayed on Email Alerts$")
    public void prePrintsLabelEmailAlerts(String labelName) {
        Assertions.assertThat(resultsPage.isLabelPresentInEmailAlertForm(labelName)).describedAs("Flag shouldbe true").isTrue();
    }

    @And("^Preprints checkbox is selected by default$")
    public void prePrintsCheckBoxState() {
        Assertions.assertThat(resultsPage.isEmailAlertPreprintSelected()).describedAs("Preprints checkbox is not selected").isTrue();
    }

    @Then("^search query is (.*)$")
    public void verifySearchQuery(String query) {
        resultsPage.verifySearchQuery(query);
    }

    @And("^user is on Results Page$")
    public void resultsPageIsOpened() {
        resultsPage.searchField.waitUntilEnabled();
        resultsPage.waitForJStoLoad();
    }

    @And("^user clicks on (.*) action link of Result Page$")
    public void clickOnActionLink(String actionLinkName) {
        resultsPage.clickOnActionLink(actionLinkName);
    }

    @And("^user opens Sources filter$")
    public void openSourceFilter() {
        resultsPage.sourcesFilter.click();
    }

    @And("^user selects Preprints source bubble$")
    public void selectPreprintsBubble() {
        resultsPage.preprintsSourceBubble.click();
    }

    @And("^user click on Apply button$")
    public void clickApply() {
        resultsPage.applyBtn.click();
    }

    // TODO move to different file
    @When("user saves Email Alert:")
    public void iSaveEmailAlert(DataTable table) {
        List<Map<String, String>> rows = table.asMaps(String.class, String.class);
        Map<String, String> data = rows.get(0);

        String emailTitle = StringHelper.resolveVariable(data.get("alertName"));

        emailAlertDialog.saveEmailAlert(
                emailTitle,
                data.get("emailAddress"),
                Boolean.parseBoolean(data.get("isIncludeArticles")),
                Boolean.parseBoolean(data.get("isIncludePreprints")));

    }

    @And("^the term (.*) is highlighted in the title on Results page$")
    public void verigyHighlightedTermResultsPage(String highlightedTerm) {
        Assertions.assertThat(resultsPage.isHighlightedTermEqualTo(highlightedTerm)).describedAs("Highlighted term is not equal to expected").isTrue();

    }

    @When("^get the number of search results for (.*) date format$")
    public void getTheNumberOfSearchResultsForChangedDateFormat(String variableName) {
        resultsPage.waitForJStoLoad();
        resultsPage.getTheNumberOfSearchResultsForDateFormat(variableName);
    }

    @Then("^the same number of search results for (.*) date and (.*) date$")
    public void verifyTheSameNumberOfBothSearchResults(String variableNameFirst, String variableNameSecond) {
        resultsPage.verifyTheSameNumberOfBothSearchResults(variableNameFirst, variableNameSecond);
    }
    @When("^user goes to (.*) page$")
    public void goToPage(String pageNumber) {
        resultsPage.goToSpecPage(pageNumber);
    }
    @Then("^no warning message is displayed$")
    public void verifyFeedbackMsg(){
        Assertions.assertThat(resultsPage.isFeedbackMsg()).describedAs("Feed back message is displayed").isTrue();
    }

    @And("^user selects Format (.*) in export window$")
    public void userSelectsFormatInExportWindow(String format) {
        resultsPage.userSelectsFormatInExportWindow(format);
    }

    @And("^user selects checkbox (.*) in export window$")
    public void userSelectsCheckboxFieldNameInExportWindow(String checkbox) {
        resultsPage.userSelectsCheckboxFieldNameInExportWindow(checkbox);
    }

    @And("^user clicks on (.*) button in modal window$")
    public void userClicksOnButtonInModalWindow(String button) {
        resultsPage.userClicksOnButtonInModalWindow(button);
    }

    @And("^user saves title from records (.*) to variable (.*)")
    public void savesTitleFromRecordsToVar(String recordNum, String varName) {
        resultsPage.savesTitleFromRecordsToVar(recordNum, varName);
    }

    @And("user selects {int} records from the records list in Result Page")
    public void selectsRecordsFromTheRecordsListInResultPage(int recordsNum) {
        resultsPage.selectsRecordsFromTheRecordsListInResultPage(recordsNum);
    }

    @And("^user clicks (.*) for (.*) in Export modal window$")
    public void clicksSelectForSectionTitleInExportModalWindow(String linkName, String sectionTitle) {
        resultsPage.clicksSelectForSectionTitleInExportModalWindow(linkName, sectionTitle);
    }
}