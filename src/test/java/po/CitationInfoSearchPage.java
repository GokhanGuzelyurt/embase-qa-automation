package po;

import net.serenitybdd.core.annotations.findby.By;
import net.serenitybdd.core.pages.WebElementFacade;
import net.thucydides.core.annotations.DefaultUrl;
import net.thucydides.core.pages.components.Dropdown;
import net.thucydides.core.webelements.Checkbox;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.Select;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import po.common.BasePage;
import po.sections.results.SearchHistory;

import java.lang.invoke.MethodHandles;
import java.nio.channels.Selector;
import java.util.List;


@DefaultUrl("page:citationInfo.page")
public class CitationInfoSearchPage extends BasePage {
    WebDriver driver;
    ResultsPage resultsPage;
    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());

    @FindBy(id = "article-title")
    public WebElement articleTitleField;

    @FindBy(id = "author-name")
    public WebElement authorNameField;

    @FindBy(id = "journal-title")
    public WebElementFacade journalTitleField;

    @FindBy(id = "abbr-journal-title")
    public WebElementFacade abbrJournalTitleField;

    @FindBy(id = "abbr-journal-title-exact")
    public WebElement abbrJournalTitleExactCheckBox;

    @FindBy(id = "issn")
    public WebElement ISSNField;

    @FindBy(id = "coden")
    public WebElement CODENField;

    @FindBy(id = "doi")
    public WebElement DOIField;

    @FindBy(id = "volume")
    public WebElement volumeField;

    @FindBy(id = "issue")
    public WebElement issueField;

    @FindBy(id = "first-page")
    public WebElement firstPageField;

    @FindBy(id = "is-publication-year")
    public WebElement publicationYearsCheckBox;

    @FindBy(id = "show-results-button")
    public WebElement showResultButton;

    @FindBy(xpath = "//span[contains(@class,'LinkButton-module_content__2F1Lc')][contains(text(),'More citation fields')]")
    public WebElement moreCitationFieldsLink;

    @FindBy(xpath = "//span[contains(@class,'LinkButton-module_content__2F1Lc')][contains(text(),'Specify name variants')]")
    public WebElement authorNameVariantsLink;

    @FindBy(xpath = "/html/body/div[9]/div/div[2]/div/div[2]/div/button/span")
    public WebElement selectAllLink;

    @FindBy(id = "publication-year-from")
    public WebElement fromYearSelect;

    @FindBy(xpath = "//span[contains(@class,'Button-module_content__7QNNH')][contains(text(),'Add to search')]")
    public WebElement AddToSearch;

    @FindBy(id = "publication-year-from-options")
    public WebElement fromYearListOptions;

    @FindBy(id = "publication-year-to")
    public WebElement toYearSelect;

    @FindBy(id = "publication-year-to-options")
    public WebElement toYearListOptions;

    @FindBy(id = "author-variations-modal-label")
    public WebElement authorVariationsLabel;

    @FindBy(id = "lastName")
    public WebElement authorLastName;

    @FindBy(id = "firstName")
    public WebElement authorFirstName;

    @FindBy(id = "initial")
    public WebElement authorInitials;

    @FindBy(id = "orcid")
    public WebElement ORCID;

    @FindBy(id = "affiliation")
    public WebElement authorAffiliation;

    @FindBy(className = "AuthorVariationsModal_authors__z-T7w row")
    public WebElement authorVariantsResults;

    @FindBy(className = "Checkbox-module_root__1DisM")
    public WebElement authorVariantsCheckboxOptions;



    public void executeArticleSearch(String articleTitle, String authorName, String journalTitle, String journalTitleExact, String ABBRJournalTitle, String ABBRJournalTitleExact,
                                     String ISSN, String CODEN, String DOI, String volume, String issue, String firstPage, String pubYears, String fromYear, String toYear) {
        logger.info("Fills in the search query, clicks the Search button");
        enterArticleSearchQuery(articleTitle, authorName, journalTitle, journalTitleExact, ABBRJournalTitle,
                ABBRJournalTitleExact, ISSN, CODEN, DOI, volume, issue, firstPage, pubYears, fromYear, toYear);
        clickArticleSearchButton();
        resultsPage.waitForRecordSectionIsLoaded();
//        return resultsPage.searchHistory.getFirstRowNumber();
    }


    public void enterArticleSearchQuery(String articleTitle, String authorName, String journalTitle, String journalTitleExact, String ABBRJournalTitle, String ABBRJournalTitleExact,
                                        String ISSN, String CODEN, String DOI, String volume, String issue, String firstPage, String pubYears, String fromYear, String toYear) {
        logger.info("Enter search query");

        boolean booljournalTitleChk = Boolean.parseBoolean(journalTitleExact);
        boolean boolABBRChk = Boolean.parseBoolean(ABBRJournalTitleExact);
        boolean boolpubYears = Boolean.parseBoolean(pubYears);
        WebElement journalTitleExactCheckBox = getDriver().findElement(By.xpath("//*[contains(@id,'journal-title-exact')]"));
        WebElement abbrJournalTitleExactCheckBox = getDriver().findElement(By.xpath("//*[contains(@id,'abbr-journal-title-exact')]"));
        WebElement publicationYearsCheckBox = getDriver().findElement(By.xpath("//*[contains(@id,'is-publication-year')]"));

        moreCitationFieldsLink.click();


        if (!articleTitle.isEmpty()) {
            articleTitleField.clear();
            articleTitleField.sendKeys(articleTitle);
        }
        if (!authorName.isEmpty()) {
            authorNameField.clear();
            authorNameField.sendKeys(authorName);
        }
        if (!journalTitle.isEmpty()) {
            journalTitleField.waitUntilEnabled();
            journalTitleField.clear();
            journalTitleField.sendKeys(journalTitle);
        }
        if (booljournalTitleChk) {
//
            checkByScript(journalTitleExactCheckBox);
        } else {
            uncheckByScript(journalTitleExactCheckBox);
        }

        if (!ABBRJournalTitle.isEmpty()) {
            abbrJournalTitleField.waitUntilEnabled();
            abbrJournalTitleField.clear();
            abbrJournalTitleField.sendKeys(ABBRJournalTitle);
        }
        if (boolABBRChk) {
            checkByScript(abbrJournalTitleExactCheckBox);
        } else {
            uncheckByScript(abbrJournalTitleExactCheckBox);
        }
        if (!ISSN.isEmpty()) {
            ISSNField.clear();
            ISSNField.sendKeys(ISSN);
        }
        if (!CODEN.isEmpty()) {

            CODENField.clear();
            CODENField.sendKeys(CODEN);
        }
        if (!DOI.isEmpty()) {

            DOIField.clear();
            DOIField.sendKeys(DOI);
        }
        if (!volume.isEmpty()) {

            volumeField.clear();
            volumeField.sendKeys(volume);
        }
        if (!issue.isEmpty()) {

            issueField.clear();
            issueField.sendKeys(issue);
        }
        if (!firstPage.isEmpty()) {
            firstPageField.clear();
            firstPageField.sendKeys(firstPage);
        }
        if (boolpubYears) {
            checkByScript(publicationYearsCheckBox);
        } else {
            uncheckByScript(publicationYearsCheckBox);
        }

        if (!fromYear.isEmpty()) {
            fromYearSelect.click();
            fromYearListOptions.findElement(By.buttonText(fromYear)).click();
        }

        if (!toYear.isEmpty()) {
            toYearSelect.click();
            toYearListOptions.findElement(By.buttonText(toYear)).click();
        }
    }

    public void clickArticleSearchButton() {
        logger.info("Clicks Search button");
        showResultButton.click();
    }

    public void enterAuthorSearchInfo(String lastName, String firstName, String nameInitials, String affiliationUni, String orcid) {
        logger.info("Enter author information");

        if (!lastName.isEmpty()) {
            authorLastName.sendKeys(lastName);

        }
        if (!firstName.isEmpty()) {
            authorFirstName.sendKeys(firstName);
        }

        if (!nameInitials.isEmpty()) {
            authorInitials.sendKeys(nameInitials);
        }

        if (!affiliationUni.isEmpty()) {
            authorAffiliation.sendKeys(affiliationUni);
        }

        if (!orcid.isEmpty()) {
            ORCID.sendKeys(orcid);
        }
    }

    public void clickSelectAll() {
        selectAllLink.click();
    }

}