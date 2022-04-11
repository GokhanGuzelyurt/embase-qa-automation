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
import java.util.List;
import java.util.Map;

public class PicoSearchPageStepDef {

    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());
    PicoSearchPage picoSearchPage;

    @When("^user opens Pico search page$")
    public void openPicoSearchPage() {
        picoSearchPage.open();
    }

    @Given("^user enters (.*) in population text box$")
    public void enterPopulationText(String query) {
        picoSearchPage.populationTextBox.clear();
        picoSearchPage.populationTextBox.sendKeys(query);
    }

    @Then("^autosuggestion on PICO contains term (.*)$")
    public void autosuggestionsPopulationBox(String term) {
        Assertions.assertThat(picoSearchPage.isAutoSuggestDeviceTerm(term)).describedAs("Text is not equal to expected").isTrue();
    }

    @When("^user selects(.*) from autosuggestions list$")
    public void selectAutosuggestionTermByText(String text){
    picoSearchPage.selectAutoSuggestionTermByText(text);
    }

    @Then("^text (.*) is displayed in PICO text box$")
    public void validateTextPICO(String text){
Assertions.assertThat(picoSearchPage.validateTagName(text)).describedAs("Tag name is not equal to expected").contains(text);

    }
    @When("^user clicks on down arrow of the free term$")
    public void clickDownArrow(){
            picoSearchPage.changeModifier.click();
    }

    @And("^autosuggestions list is displayed on PICO$")
    public void autosuggestionsPICODisplayed(){
        Assertions.assertThat(picoSearchPage.autoSuggestionsBox.isDisplayed()).describedAs("Autosuggestions list is not displayed").isTrue();
    }
    @Then("^text (.*) is displayed in population text box$")
    public void validateTextPopulationTextBox(String text){
        Assertions.assertThat(picoSearchPage.populationTextBox.getAttribute("value")).describedAs("Text is not equal to expected").isEqualToIgnoringCase(text);
    }

   @And("^the autosuggestions list on PICO contains (.*)$")
    public void validateAutosuggestionsListItems(String options){
       Assertions.assertThat(picoSearchPage.validateAutosuggestionsTerms()).describedAs("Not equal to expected").contains(options.split(","));

   }
}
