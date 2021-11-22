package embase.tests.StepDefs;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.apache.commons.lang3.StringUtils;
import po.QuickSearchPage;
import org.assertj.core.api.Assertions;


public class QuickSearchPageStepDef {

    QuickSearchPage quickSearchPage;

    @Then("Quick search page is opened")
    public void verifyQuickSearchPage() {
        quickSearchPage.at();
    }

    @When("user opens Quick Search page")
    public void openQuickSearchPage() {
        quickSearchPage.open();
    }

    @Given("^user enters query (.*) on quick search page$")
    public void enterQueryQuickSearch(String query) {
        quickSearchPage.firstLine.click();
        quickSearchPage.firstLine.sendKeys(query);
    }

    @Then("^the autosuggested term contains count greater than (\\d*)$")
    public void verifyAutosuggestedCounts(Integer count) {
        Integer val;
        String text = quickSearchPage.autosuggestList.getText();
        String substring = StringUtils.substringAfterLast(text, "\n");
        substring = substring.replaceAll("//s+", "").replaceAll(",", "");
        val = Integer.parseInt(substring);
        Assertions.assertThat(val).describedAs("Value is not greater than " + count).isGreaterThan(count);
    }
}
