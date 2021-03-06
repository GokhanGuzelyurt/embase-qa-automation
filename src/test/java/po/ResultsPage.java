package po;

import embase.tests.StepDefs.CommonSteps;
import net.serenitybdd.core.pages.WebElementFacade;
import net.thucydides.core.annotations.DefaultUrl;
import net.thucydides.core.annotations.Step;
import org.assertj.core.api.Assertions;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import po.common.BasePage;
import po.common.SearchPage;
import po.sections.results.PageIndex;
import po.sections.results.ResultList;
import po.sections.search.SearchHistory;

import java.lang.invoke.MethodHandles;
import java.util.Arrays;
import java.util.List;

import static embase.tests.StepDefs.CommonSteps.setTestCaseVariable;
import static embase.tests.StepDefs.CommonSteps.testCaseVariables;

@DefaultUrl("page:results.page")
public class ResultsPage extends BasePage {
    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());
    SearchPage searchPage;

    @FindBy(css = ".empty:not(#search_row_empty) p")
    public WebElementFacade recordSecWarnZero;

    @FindBy(id = "ResultList")
    public ResultList resultList;

    @FindBy(css = ".pageIndex")
    public PageIndex pageIndex;

    @FindBy(id = "sessionsearches")
    public SearchHistory searchHistory;

    @FindBy(id = "searchField")
    public WebElementFacade searchField;

    @FindBy(id = "submit_search")
    public WebElement searchButton;

    @FindBy(className = "queryContent")
    public WebElementFacade querySection;

    @FindBy(id = "processSearchDialog") // parent id: a2bxw
    public WebElementFacade pleaseWaitPanel;

    @FindBy(id = "sourcesTab")
    public WebElement sourceTab;

    @FindBy(id = "sourcesTab_search_records_4_container")
    public WebElement prePrintsChkBox;

    @FindBy(id = "alertform")
    public WebElement emailAlertForm;

    @FindBy(id = "SOURCES")
    public WebElement sourcesFilter;

    @FindBy(id = "preprintsCircle")
    public WebElement preprintsSourceBubble;

    @FindBy(css = ".filterActions .pushButton")
    public WebElementFacade applyBtn;

    @FindBy(id = "viewSubmitAction")
    public WebElementFacade viewActionLink;

    @FindBy(css = ".exportSubmit")
    public WebElementFacade exportActionLink;

    @FindBy(css = ".emailSubmit")
    public WebElementFacade emailActionLink;

    @FindBy(id = "orderSubmitAction")
    public WebElementFacade orderActionLink;

    @FindBy(id = "addToClipboardAction")
    public WebElementFacade addToClipboardActionLink;

    @FindBy(css = ".search-hitcounts")
    public WebElementFacade searchHitCounts;

    @FindBy(id = "pager")
    public WebElement pageField;

    @FindBy(id = "go")
    public WebElement goButton;

    @FindBy(css = "[data-action='feedbackMessage']")
    public WebElement feedbackMessage;

    @FindBy(css = ".embsDropdownLabel")
    public WebElementFacade embsDropdownLabel;

    @FindBy(id = "modalContent")
    public WebElementFacade modalContent;

    @FindBy(id = "modalControl")
    public WebElementFacade modalControl;

    @FindBy(id = "recordsFound")
    public WebElement recordsFoundList;

    public void waitForRecordSectionIsLoaded() {
        logger.info("Wait for please wait to vanish");
        logger.info("Wait if 0 results page is not displayed");
        querySection.waitUntilVisible();

        // TODO: this code has to be modified for current framework

//            recordSectionFilled.isDisplayed();
//            Assertions.assertThat(resultList.searchHitCounts.getText()).isNotBlank();
//            int hitCount = Integer.parseInt(resultList.searchHitCounts.getText().split(" results")[0].replaceAll(",", ""));
//            int lastHit = Integer.parseInt(resultList.hitStart.getText()) + Integer.parseInt(pageIndex.pageSizeSelector.isSelected()) - 1;
//            lastHit = Math.min(lastHit, hitCount);
//            String lastHitStr = String.valueOf(lastHit);
//
//            resultList.hitEnd.waitFor().text(lastHitStr);

//            Assertions.assertThat(resultList.hitEnd.getText()).describedAs("resultList last hit is not equal to the no of results per page").isEqualTo(lastHitStr);
//            scrollToTop();
//        } else {
//            logger.info("Zero results page is loaded");
//        }
    }

    @Step
    public void verifySearchQuery(String expectedQuery) {
        searchField.waitUntilVisible();
        waitForJStoLoad();
        Assertions.assertThat(searchField.getValue()).describedAs("Search field is not equal to expected").isEqualToIgnoringCase(expectedQuery);
    }

    public void setEmailAlert() {
        logger.info("Set email alert dialog for current search result");
        resultList.setEmailAlertLink.click();
        waitABit(3);
    }

    public boolean isLabelPresentInEmailAlertForm(String labelName) {
        boolean flag1 = false;
        List<WebElement> labels = emailAlertForm.findElements(By.xpath("//*[@class='field-wrapper']//label"));
        for (WebElement label : labels) {
            if (label.getText().equalsIgnoreCase(labelName)) {
                flag1 = true;
                break;
            } else {
                logger.info("Label name" + "\t" + labelName + "\t" + " is not equal to" + "\t" + label.getText());
            }
        }
        return flag1;
    }

    public boolean isEmailAlertPreprintSelected() {
        WebElement element = emailAlertForm.findElement(By.xpath("//*[@class='field']//input[@name='includePreprints']"));
        return element.isSelected();
    }

    public boolean isHighlightedTermEqualTo(String term) {
        String highlightedTerm = resultList.recordsFoundList.findElement(By.cssSelector(".hit")).getText();
        return highlightedTerm.equalsIgnoreCase(term);
    }

    @Step
    public void clickOnActionLink(String actionLinkName) {
        switch (actionLinkName.toLowerCase().replace(" ", "")) {
            case "view":
                viewActionLink.click();
                break;
            case "export":
                exportActionLink.click();
                break;
            case "email":
                emailActionLink.click();
                break;
            case "order":
                orderActionLink.click();
                break;
            case "addtoclipboard":
                addToClipboardActionLink.click();
                break;
        }
    }

    private String getNumberOfSearchResults() {
        logger.info("get number of search result");
        List<String> numberOfSearchResults = Arrays.asList(searchHitCounts.getText().split(" "));
        return numberOfSearchResults.get(0);
    }

    public void getTheNumberOfSearchResultsForDateFormat(String variableName) {
        CommonSteps.setTestCaseVariable(variableName, getNumberOfSearchResults());
    }

    public void verifyTheSameNumberOfBothSearchResults(String variableNameFirst, String variableNameSecond) {
        String first = CommonSteps.testCaseVariables.get(variableNameFirst);
        String second = CommonSteps.testCaseVariables.get(variableNameSecond);
        logger.info("assert that the number of search results is the same for both date format");
        Assert.assertEquals("The search result after change date format " + second
                        + " should be equal search result for original date format " + first,
                first, second);
    }

    public void goToSpecPage(String pageNumber){
        pageField.clear();
        pageField.sendKeys(pageNumber);
        if (goButton.isDisplayed()) {
            goButton.click();
        }
    }
    public boolean isFeedbackMsg() {
       boolean isEmpty= getDriver().findElements(By.xpath("//span[text()='Unexpected exception during search. Please try again later.']")).isEmpty();
       if (isEmpty){ // text is not present
           return  true;
       }
       else return false; // text is present
    }

    public void userSelectsFormatInExportWindow(String format) {
        embsDropdownLabel.click();
        WebElement elementFormat = embsDropdownLabel.findElement(By.xpath("//*[@id='modalContent']//ul/li/span[contains(text(), '"+format+"')]"));
        elementFormat.click();
    }

    public void userSelectsCheckboxFieldNameInExportWindow(String label) {
        if (!label.contains("skip"))
            checkByScript(modalContent.findElement(By.xpath("//label/span[contains(text(), '"+label+"')]")));
    }

    public void userClicksOnButtonInModalWindow(String button) {
        modalControl.findElement(By.xpath("//*[contains(text(), '"+button+"')]/parent::a")).click();
    }

    public void savesTitleFromRecordsToVar(String recordNum, String varName) {
        WebElement recordsTitles = recordsFoundList.findElements(By.cssSelector(".resultInfo a")).get(Integer.parseInt(recordNum) - 1);
        String extractedTitles = recordsTitles.getText();
        setTestCaseVariable(varName, extractedTitles);
    }

    public void selectsRecordsFromTheRecordsListInResultPage(int recordsNum) {
        for (int i = 0; i < recordsNum; i++) {
            checkByScript(recordsFoundList.findElements(By.className("emb-checkbox-result")).get(i));
        }
    }

    public void clicksSelectForSectionTitleInExportModalWindow(String linkName, String sectionTitle) {
        WebElement elementFormat = modalContent.findElement(By.xpath("//*[contains(text(), '"+sectionTitle+"')]//*[contains(text(), '"+linkName+"')]"));
        elementFormat.click();
    }
}