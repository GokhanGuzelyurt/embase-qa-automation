package po;

import net.serenitybdd.core.pages.WebElementFacade;
import net.thucydides.core.annotations.DefaultUrl;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import po.common.BasePage;

import java.lang.invoke.MethodHandles;

@DefaultUrl("page:emtree.page")
public class EmtreePage extends BasePage {
    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());

    @FindBy(id = "findTermInput")
    public WebElement termInputTextField;

    @FindBy(id = "findTermBtn")
    public WebElement findTermButton;

    @FindBy(css = ".findTermResults")
    public WebElementFacade findTermResults;

    @FindBy(css = "#emtreeWidget .emtree_content .additional")
    public WebElement additionalEmtreeInformation;

    public void refreshEmtree(){
        getDriver().navigate().refresh();
    }

}

