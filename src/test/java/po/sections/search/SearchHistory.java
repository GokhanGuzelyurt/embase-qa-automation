package po.sections.search;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.lang.invoke.MethodHandles;
import java.util.List;

public class SearchHistory {
    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());

    @FindBy(css = ".search-number.table-row-rownumber")
    public List<WebElement> rowNumbers;

    public int getFirstRowNumber() {
        logger.info("Get first row number from Search History");
        return Integer.valueOf(rowNumbers.get(0).getText().split("#")[1]);

    }

}
