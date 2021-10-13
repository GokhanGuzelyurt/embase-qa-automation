package po;

import net.thucydides.core.annotations.DefaultUrl;
import org.openqa.selenium.WebDriver;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import po.common.BasePage;

import java.lang.invoke.MethodHandles;

@DefaultUrl("page:advancedSearch.page")
public class AdvancedSearchPage extends BasePage {
    WebDriver driver;
    ResultsPage resultsPage;
    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());



}
