package po;

import net.serenitybdd.core.pages.WebElementFacade;
import net.thucydides.core.annotations.DefaultUrl;
import org.assertj.core.api.Assertions;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import po.common.BasePage;
import po.common.SearchPage;
import po.sections.results.PageIndex;
import po.sections.results.ResultList;
import po.sections.results.SearchHistory;

import java.lang.invoke.MethodHandles;

import static org.assertj.core.api.Assertions.assertThat;

@DefaultUrl("page:results.page")
public class ResultsPage extends BasePage {
    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());
    SearchPage searchPage;

    @FindBy(css = ".empty:not(#search_row_empty) p")
    public WebElement recordSecWarnZero;

    @FindBy(id = "recordsFound")
    public WebElement recordSectionFilled;

    @FindBy(id = "ResultList")
    public ResultList resultList;

    @FindBy(css = ".pageIndex")
    public PageIndex pageIndex;

    @FindBy(id = "sessionsearches")
    public SearchHistory searchHistory;

    @FindBy(id = "searchField")
    public WebElementFacade searchField;


    public void at() {
//        searchField.isDisplayed();
    }

    public void waitForRecordSectionIsLoaded() {
        logger.info("Wait for please wait to vanish");
        logger.info("Wait if 0 results page is not displayed");
        if (!recordSecWarnZero.isDisplayed()) {

            recordSectionFilled.isDisplayed();
            Assertions.assertThat(resultList.searchHitCounts.getText()).isNotBlank();
            int hitCount = Integer.parseInt(resultList.searchHitCounts.getText().split(" results")[0].replaceAll(",", ""));
//            int lastHit = Integer.parseInt(resultList.hitStart.getText()) + Integer.parseInt(pageIndex.pageSizeSelector.isSelected()) - 1;
//            lastHit = Math.min(lastHit, hitCount);
//            String lastHitStr = String.valueOf(lastHit);
//
//            resultList.hitEnd.waitFor().text(lastHitStr);

//            Assertions.assertThat(resultList.hitEnd.getText()).describedAs("resultList last hit is not equal to the no of results per page").isEqualTo(lastHitStr);
//            scrollToTop();
        } else {
            logger.info("Zero results page is loaded");
        }
    }

    public void verifySearchQuery(String expectedQuery) {
        searchField.waitUntilVisible();
        Assertions.assertThat(searchField.getValue()).describedAs(String.format("Query expected: <%s> but was: <%s>",expectedQuery,searchField.getValue())).isEqualToIgnoringCase(expectedQuery);
    }
}
