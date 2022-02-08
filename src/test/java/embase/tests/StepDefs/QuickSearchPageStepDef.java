package embase.tests.StepDefs;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.cucumber.datatable.DataTable;
import org.apache.commons.lang3.StringUtils;
import org.assertj.core.api.Assertions;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import po.QuickSearchPage;
import po.sections.Footer;

import java.lang.invoke.MethodHandles;
import java.util.List;
import java.util.Map;


public class QuickSearchPageStepDef {
    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());
    QuickSearchPage quickSearchPage;
    Footer footer;


    @Then("Quick search page is opened")
    public void verifyQuickSearchPage() {
        quickSearchPage.waitForJStoLoad();
        quickSearchPage.at();
    }

    @When("user opens Quick Search page")
    public void openQuickSearchPage() {
        quickSearchPage.open();
    }

    @Given("^user enters query (.*) on quick search page$")
    public void enterQueryQuickSearch(String query) {
        quickSearchPage.firstLine.click();
        quickSearchPage.firstLine.clear();
        quickSearchPage.firstLine.sendKeys(query);
    }

    @Given("^user enters second line query (.*) on quick search page$")
    public void enterSecondLineQuery(String query) {
        quickSearchPage.secondLine.click();
        quickSearchPage.secondLine.clear();
        quickSearchPage.secondLine.sendKeys(query);
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

    @When("^user clicks on Add field button on Quick Search Page$")
    public void clickAddFieldBtn() {
        quickSearchPage.addFieldBtn.click();
    }

    @When("^user clicks on Change field button on quick search page$")
    public void clickChangeFieldBtn() {
        quickSearchPage.changeFieldBtn.click();
    }

    @Then("^Add field popup is opened on Quick Search Page$")
    public void verifyAddFieldPopup() {
        Assertions.assertThat(quickSearchPage.fieldSelectorLabel.isDisplayed()).describedAs("Add field popup is not displayed").isTrue();
    }

    @Then("^Change field popup is opened on quick search page$")
    public void verifyChangeFieldPopup() {
        Assertions.assertThat(quickSearchPage.fieldSelectorLabel.isDisplayed()).describedAs("Change field popup is not displayed").isTrue();
        Assertions.assertThat(quickSearchPage.fieldSelectorLabel.getText()).describedAs("Change field popup text is not equal to expected").contains("Change field");
    }

    @Then("^(.*) is not a part of fields list on Quick Search Page$")
    public void verifyFieldNameIsNotPresent(String fieldName) {
        Assertions.assertThat(quickSearchPage.isFieldNamePresent(fieldName)).describedAs("'" + fieldName + "'is present").isFalse();
    }

    @Then("^(.*) is a part of fields list on Quick Search Page$")
    public void verifyFieldNameIsPresent(String fieldName) {
        Assertions.assertThat(quickSearchPage.isFieldNamePresent(fieldName)).describedAs("'" + fieldName + "'is present").isTrue();
    }

    @And("^user clicks on Show results button on quick search$")
    public void clickShowResultsQuickSearch() {
        quickSearchPage.showResultsButton.click();
    }

    @And("^user selects (.*) from frequent field list on change field popup$")
    public void editDefaultField(String fieldName) {
        quickSearchPage.selectFrequentFieldNameByText(fieldName);
    }

    @And("^user selects (.*) from other field list on change field popup$")
    public void editFromOtherFieldList(String fieldName) {
        quickSearchPage.selectOtherFieldNameByText(fieldName);
    }

    @And("^user selects (.*) from frequent field list on add field popup$")
    public void addNewField(String fieldName) {
        quickSearchPage.selectFrequentFieldNameByText(fieldName);
    }

    // this step is custom made to work only on the footer elements
    @Then("validate that footer elements are present:")
    public void validateFooter(DataTable table) {
        quickSearchPage.waitForJStoLoad();
        List<Map<String, String>> rows = table.asMaps(String.class, String.class);

        for (Map<String, String> data : rows) {
            switch (data.get("footerElement")) {
                case "elsevierLogo":
                    Assertions.assertThat(footer.elsevierLogo.isPresent()).describedAs("elsevierLogo is not present").isTrue();
                    Assertions.assertThat(footer.elsevierLogo.getAttribute("href")).describedAs("Link does not match").isEqualTo(data.get("link"));
                    break;
                case "relxLogo":
                    Assertions.assertThat(footer.relxLogo.isPresent()).describedAs("relxLogo is not present").isTrue();
                    Assertions.assertThat(footer.relxLogo.getAttribute("href")).describedAs("Link does not match").isEqualTo(data.get("link"));
                    break;
                case "cookieText":
                    Assertions.assertThat(footer.cookiesInfo.getText()).describedAs("Text does not match").isEqualTo(data.get("text"));
                    break;
                case "copyrightText":
                    Assertions.assertThat(footer.copyrightInfo.getText()).describedAs("Text does not match").isEqualTo(data.get("text"));
                    break;
                case "linkUseOfCookies":
                    Assertions.assertThat(footer.cookiesLink.getText()).describedAs("Text does not match").isEqualTo(data.get("text"));
                    Assertions.assertThat(footer.cookiesLink.getAttribute("href")).describedAs("Link does not match").isEqualTo(data.get("link"));
                    break;
            }
            // this will check all items inside the link list, identified with linkList prefix in the feature file
            if (data.get("footerElement").contains("linkList")) {
                boolean foundInListOfElements = false;
                for (WebElement e : footer.listOfLinks) {
                    if (data.get("text").equals(e.getText())) {
                        Assertions.assertThat(e.findElement(By.cssSelector("a")).getAttribute("href")).describedAs("Link does not match").isEqualTo(data.get("link"));
                        foundInListOfElements = true;
                        break;
                    }
                }
                if (!foundInListOfElements) {
                    Assertions.fail("Element not found in list of elements: " + data.get("footerElement"));
                }
            }
        }


    }
}
