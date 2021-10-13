package po;

import net.thucydides.core.annotations.DefaultUrl;
import org.assertj.core.api.Assertions;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import po.common.BasePage;
import po.sections.search.Ribbon;

import java.lang.invoke.MethodHandles;
import java.util.List;

@DefaultUrl("page:advancedSearch.page")
public class AdvancedSearchPage extends BasePage {
    WebDriver driver;
    ResultsPage resultsPage;
    Ribbon ribbon;

    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());

    public void selectTab(String tabName) {
        logger.info("Open specified tab " + tabName);
        List<WebElement> tabs= ribbon.ribbonBlock.findElements(By.cssSelector(".buttonBar .barbutton"));
        for(WebElement tab:tabs){
            if(tab.getText().equalsIgnoreCase(tabName)){
                tab.click();
                break;
            }
        }


//        Assertions.assertThat(ribbon.barButtonSelected.getText()).isEqualTo(tabName);

    }

    public boolean isTabSelected(String tabName) {
        logger.info("Check if certain ribbon tab is selected " + tabName);
        WebElement tab = ribbon.tabs.findElement(By.linkText(tabName));
        return tab.getAttribute("class").contains("barbuttonSelected");
    }

}
