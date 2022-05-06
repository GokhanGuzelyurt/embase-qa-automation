package embase.tests.StepDefs;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.cucumber.datatable.DataTable;
import org.assertj.core.api.Assertions;
import po.CitationInfoSearchPage;
import po.ResultsPage;
import po.common.SearchPage;

import java.util.List;
import java.util.Map;

public class CitationInfoSearchPageStepDef {
    CitationInfoSearchPage citationInfoSearchPage;
    SearchPage searchPage;
    ResultsPage resultsPage;

    @When("^user opens Citation Information search page$")
    public void openCitationInfo() {
        citationInfoSearchPage.open();
    }

    @When("^user enters Citation Information$")
    public void runCitationSearch(DataTable table) {
        List<Map<String, String>> rows = table.asMaps(String.class, String.class);
        Map<String, String> data = rows.get(0);
        citationInfoSearchPage.executeArticleSearch(
                data.get("articleTitle"),
                data.get("authorName"),
                data.get("journalTitle"),
                data.get("journalTitleExact"),
                data.get("ABBRJournalTitle"),
                data.get("ABBRJournalTitleExact"),
                data.get("ISSN"),
                data.get("CODEN"),
                data.get("DOI"),
                data.get("volume"),
                data.get("issue"),
                data.get("firstPage"),
                data.get("pubYears"),
                data.get("fromYear"),
                data.get("toYear"));
    }

    @And("^user clicks on Show results button on citation search$")
    public void clickShowResultsQuickSearch() {
        citationInfoSearchPage.showResultButton.click();

    }

    @And("^user clicks on author name variants link$")
    public void clickAuthorVariantsLink() {
        citationInfoSearchPage.authorNameVariantsLink.click();
    }

    @Then("^Specify name variants dialog box is displayed$")
    public void displayAuthorVariantsDialogBox() {
        Assertions.assertThat(citationInfoSearchPage.authorVariationsLabel.isDisplayed()).describedAs("Author name variants dialog is not displayed").isTrue();
    }

    //|authorLastName|authorFirstName|firstNameInitials|Affiliation|ORCID|
    @And("^user enters authors information$")
    public void enterAuthorInfo(DataTable table) {
        List<Map<String, String>> rows = table.asMaps(String.class, String.class);
        Map<String, String> data = rows.get(0);
        citationInfoSearchPage.enterAuthorSearchInfo(data.get("authorLastName"), data.get("authorFirstName"), data.get("firstNameInitials"), data.get("Affiliation"), data.get("ORCID"));

    }

    @And("^user selects all authors from the citation info authors list$")
    public void selectFirstResult() {
        citationInfoSearchPage.clickSelectAll();
    }


}
