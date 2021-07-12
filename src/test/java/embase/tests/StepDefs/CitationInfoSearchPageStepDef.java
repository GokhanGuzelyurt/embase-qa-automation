package embase.tests.StepDefs;

import cucumber.api.DataTable;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import gherkin.lexer.Da;
import po.CitationInfoSearchPage;
import po.ResultsPage;
import po.common.SearchPage;

import java.util.HashMap;
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
        citationInfoSearchPage.executeArticleSearch(data.get("articleTitle"), data.get("authorName"), data.get("journalTitle"), data.get("journalTitleExact"), data.get("ABBRJournalTitle"), data.get("ABBRJournalTitleExact"), data.get("ISSN"), data.get("CODEN"), data.get("DOI"), data.get("volume"), data.get("issue"), data.get("firstPage"), data.get("pubYears"), data.get("fromYear"), data.get("toYear"));
    }

    @Then("^search query is (.*)$")
    public void verifySearchQuery(String query) {
        resultsPage.verifySearchQuery(query);
    }

    @And("^user is on Results Page$")
    public void resultsPageIsOpened(){
       resultsPage.open();
    }
}
