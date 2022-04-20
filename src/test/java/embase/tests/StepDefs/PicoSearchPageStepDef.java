package embase.tests.StepDefs;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.assertj.core.api.Assertions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import po.PicoSearchPage;
import po.QuickSearchPage;
import java.lang.invoke.MethodHandles;

public class PicoSearchPageStepDef {

    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());
    PicoSearchPage picoSearchPage;
    QuickSearchPage quickSearchPage;

    @When("^user opens Pico search page$")
    public void openPicoSearchPage() {
        picoSearchPage.open();
    }

    @Given("^user enters (.*) in population text box$")
    public void enterPopulationText(String query) {
        picoSearchPage.populationTextBox.clear();
        picoSearchPage.populationTextBox.sendKeys(query);
    }

    @Given("^user enters (.*) in outcome text box$")
    public void enterOutcomeText(String query) {
        picoSearchPage.outcomeTextBox.clear();
        picoSearchPage.outcomeTextBox.sendKeys(query);
    }

    @Given("^user enters (.*) in emtree search input$")
    public void enterEmtreeInputText(String query) {
        picoSearchPage.emtreeTermInput.clear();
        picoSearchPage.emtreeTermInput.sendKeys(query);
    }


    @Given("^user enters (.*) in intervention text box$")
    public void enterInterventionText(String query) {
        picoSearchPage.interventionTextBox.clear();
        picoSearchPage.interventionTextBox.sendKeys(query);
    }

    @Then("^autosuggestion on PICO contains term (.*)$")
    public void autosuggestionsPopulationBox(String term) {
        Assertions.assertThat(picoSearchPage.isAutoSuggestDeviceTerm(term)).describedAs("Text is not equal to expected").isTrue();
    }

    @When("^user selects (.*) from autosuggestions list$")
    public void selectAutosuggestionTermByText(String text) {
        picoSearchPage.selectAutoSuggestionTermByText(text);
    }

    @Then("^tag (.*) is displayed in PICO text box$")
    public void validateTextPICO(String text) {
        Assertions.assertThat(picoSearchPage.validateTagName(text)).describedAs("Tag name is not equal to expected").contains(text);

    }

    @When("^user clicks on down arrow of the free term$")
    public void clickDownArrow() {
        picoSearchPage.changeModifier.click();
    }

    @When("^user clicks on down arrow of the synonym term$")
    public void clickDownArrowSynonyms() {
        picoSearchPage.synonymsModifier.click();
    }

    @And("^autosuggestions list is displayed on PICO$")
    public void autosuggestionsPICODisplayed() {
        Assertions.assertThat(picoSearchPage.autoSuggestionsBox.isDisplayed()).describedAs("Autosuggestions list is not displayed").isTrue();
    }

    @Then("^text (.*) is displayed in population text box$")
    public void validateTextPopulationTextBox(String text) {
        Assertions.assertThat(picoSearchPage.populationTextBox.getAttribute("value")).describedAs("Text is not equal to expected").isEqualToIgnoringCase(text);
    }

    @And("^the autosuggestions list on PICO contains (.*)$")
    public void validateAutosuggestionsListItems(String options) {
        Assertions.assertThat(picoSearchPage.validateAutosuggestionsTerms()).describedAs("Not equal to expected").contains(options.split(","));

    }

    @And("^user clicks on Show results button on PICO search$")
    public void clickShowResultsQuickSearch() {
        picoSearchPage.showResultsBtnPico.click();

    }

    @Then("^Show results button is enabled on PICO$")
    public void validateShowResultsEnabled() {
        Assertions.assertThat(picoSearchPage.showResultsBtnPico.isEnabled()).describedAs("Show results button is enabled").isTrue();
    }

    @Then("^synonym options on PICO contains (.*)$")
    public void synonymOptions(String options) {
        Assertions.assertThat(picoSearchPage.validateSynonymOptions()).describedAs("Not equal to expected").contains(options.split(";"));

    }

    @Then("^text (.*) is created as a tag in the PICO search form$")
    public void validateTagText(String text) {

    }

    @And("^synonyms popover is displayed$")
    public void validateSynonymsPopover() {
        Assertions.assertThat(picoSearchPage.synonymsEditor.isDisplayed()).describedAs("Synonyms popover is not displayed").isTrue();
    }

    @And("^synonyms popover is closed$")
    public void synonymsPopverClosed() {
        Assertions.assertThat(picoSearchPage.synonymsEditor.isDisplayed()).describedAs("Synonyms popover is not displayed").isFalse();
    }

    @When("^user unselects Select all synonyms checkbox in the right panel$")
    public void clickCheckBoxSelectAllSynonyms() {
        picoSearchPage.clickCheckAllSynonymsCheckBox();
    }

    @And("^all the checkboxes are unselected in the synonyms right panel$")
    public void validateCheckboxesUnselected() {
        Assertions.assertThat(picoSearchPage.isSynonymsCheckBoxesUnselected()).describedAs("Synonyms check box is selected").isFalse();
    }

    @Then("^following (.*) are available on PICO page$")
    public void validateFieldLabels(String fields) {
        Assertions.assertThat(picoSearchPage.validateLabels()).describedAs("Not equal to expected").contains(fields.split(","));

    }

    @When("^user clicks Remove field of Intervention field$")
    public void removeInterventionField() {
        picoSearchPage.interventionDeleteIcon.click();
    }

    @When("^user clicks Remove field of Comparison field$")
    public void removeComparisonField() {
        picoSearchPage.comparisonDeleteIcon.click();
    }

    @Then("^following (.*) are not available on PICO page$")
    public void validateLabelsNotPresent(String fields) {
        Assertions.assertThat(picoSearchPage.validateLabels()).describedAs("Labels are not equal to expected").doesNotContain(
                fields.split(","));

    }

    @Then("^query (.*) is displayed when display full query link is clicked$")
    public void validateDisplayQuery(String query) {
        Assertions.assertThat(picoSearchPage.displayFullQueryTextBox.getText()).describedAs("query is not equal to expected").isEqualToIgnoringCase(query);

    }

    @And("^user clicks on Display Full Query button on PICO search page$")
    public void clickDisplayFullQueryBtn() {
        quickSearchPage.displayFullQueryBtn.click();
    }

    @And("^user clicks on Emtree node (.*) on PICO$")
    public void clickEmtreeNode(String text) {
        picoSearchPage.clickEmtreeNodePICO(text);
    }

    @And("^add to query for Emtree node (.*) is selected$")
    public void addToQuery(String text) {
        picoSearchPage.clickAddToQueryPICO(text);
    }

    @And("^(.*) is highlighted in emtree on PICO$")
    public void verifyHighlightedNode(String nodeName) {
        Assertions.assertThat(picoSearchPage.getHighlightedNodeValue()).describedAs("Highlighted node is not equal to expected").isEqualToIgnoringCase(nodeName);
    }

    @And("^(.*) is not highlighted in emtree on PICO$")
    public void verifyNodeIsNotHighlighted(String nodeName) {
        Assertions.assertThat(picoSearchPage.getHighlightedNodeValue()).describedAs("node name is getting highlighted").doesNotContain(nodeName);
    }
}

