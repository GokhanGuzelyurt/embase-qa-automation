package po.sections.results;

import enums.RecordActions;
import net.thucydides.core.webelements.Checkbox;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import po.common.BasePage;

import java.awt.*;
import java.lang.invoke.MethodHandles;
import java.nio.channels.Selector;
import java.util.List;

public class ResultList extends BasePage {

    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());

    @FindBy(css = "#searchHitsText .search-hitcounts")
    public WebElement searchHitCounts;

    @FindBy(id = "setEmailAlertForLatest")
    public WebElement setEmailAlertLink;

    @FindBy(id = "setRSSFeedForLatest")
    public WebElement setRSSFeedLink;

    @FindBy(css = ".toggleSearchDetails")
    public WebElement toggleSearchDetailsLink;

    @FindBy(css = ".toggleTermSelector")
    public WebElement toggleIndexMinerLink;

    @FindBy(css = ".resultList .empty")
    public WebElement emptyList;

//    @FindBy(css = "#recordsFound>li")
//    public List<ResultPreviewItem> resultPreviewItems;

    @FindBy(id = "resultsLoadingBar")
    public WebElement resultsLoadingBar;

    @FindBy(css = ".no-result")
    public WebElement recordSecWarn;

    //edged container
    @FindBy(css = ".checkAllbox #selectAllOnPage")
    public List checkAllCheckboxes;

    @FindBy(css = ".resultHeader .textButton")
    public WebElement recordActionsList;

    @FindBy(css = ".extraNav previous")
    public WebElement previousButton;

    @FindBy(css = ".hitStart")
    public WebElement hitStart;

    @FindBy(css = ".hitEnd")
    public WebElement hitEnd;

    @FindBy(css = ".extraNav next")
    public WebElement nextButton;

    @FindBy(css = ".emb-checkbox.emb-checkbox-result")
    public WebElement recordListLabels;

    @FindBy(id = "recordsFound")
    public WebElement recordListChecks;

//    @FindBy(css = ".pageIndex")
//    public PageIndex pageIndex;

    @FindBy(css = ".hitEnd")
    public WebElement maxRec;

    @FindBy(css = ".article-in-press")
    public WebElement inProcessLabels;

    @FindBy(css = ".resultInfo>a")
    public WebElement titleLinks;

    @FindBy(id = "selectionAmount")
    public WebElement recordSelector;

    @FindBy(css = "option[disabled='disabled']")
    public WebElement disabledOpts;

    @FindBy(css = "#selectionAmount option")
    public WebElement allOptions;

    @FindBy(css = ".selectable.cur-d")
    public List recordsList;

    @FindBy(css = ".hitsHighlighted .hit")
    public List highlights;

    @FindBy(id = "getSelectedNumber")
    public WebElement selectedRecordsLabel;

    @FindBy(css = "#clearSelection")
    public WebElement clearLink;

    @FindBy(css = ".showAllAbstracts")
    public WebElement showAllAbstractsLink;

    @FindBy(css = ".showAllAbstracts.hideThem")
    public WebElement hideAllAbstractsLink;

    @FindBy(css = "[value='relevance']")
    public Checkbox relevanceRadio;

    @FindBy(css = "[value='date']")
    public Checkbox publicationDateRadio;

    @FindBy(css = "[value='loaddate']")
    public Checkbox entryDateRadio;

    @FindBy(id = "selectionAmount")
    public Selector numberOfItemsDropdown;

    @FindBy(css = ".emailSubmit:first-of-type")
    public WebElement emailResultsButton;


    public int getResultsCount() {

        return Integer.valueOf(searchHitCounts.getText().split(" ")[0].replace(",", ""));
}

    public void runActionOnRecord(int recordID, RecordActions action) {
        logger.info("Selects a Record and Runs the action from the Records action menu");
        checkRecord(recordID);
//        clickActionLinkOnRecord(action);
    }
    public void checkRecord(int recordNumber) {
        logger.info("Select the record #" + recordNumber);

//        recordListChecks.findElement(By.cssSelector(".result-number")[1]);
        List<WebElement> s= recordListChecks.findElements(By.cssSelector(".resultPreviewInner"));
       s.get(2).findElement(By.xpath("//a[contains(@class,'hitsHighlighted')]")).click();

//        By.XPath(".//input[following-sibling::label[contains(., '" + appDto.StatePicker_SpecificCheckbox + "')]]").Click();


//        List<WebElement> s= recordListChecks.findElements(By.cssSelector(".resultPreviewItem .selectable .checkbox"));
//        List<WebElement> elements=recordListChecks.findElements(By.xpath(".//*[contains(@class,'emb-checkbox-result')]"));
//        int numberOfElements=elements.size();
//            elements.get(recordNumber-1).click();
//        List<WebElement> recordIds= recordListChecks.findElements(By.cssSelector(".selectable .emb-checkbox-result"));
//        recordIds.get(1).click();
       // recordListChecks.findElement(By.xpath("//*[contains(@class,'emb-checkbox-result,')][contains(text(),'"+recordNumber+"')]")).click();
    }

    public void clickActionLinkOnRecord(RecordActions action) {
        logger.info("Perform action with the selected record: '" + action.getName() + "'.");
//        recordActionsList.findElement().click();

//        if (action == RecordActions.View) {
//            recordDetailsPage.at();
        }

}
