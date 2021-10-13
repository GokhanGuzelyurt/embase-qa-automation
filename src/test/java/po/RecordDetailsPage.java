package po;

import net.serenitybdd.core.pages.WebElementFacade;
import net.thucydides.core.annotations.DefaultUrl;
import org.openqa.selenium.support.FindBy;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import po.common.BasePage;
import po.common.SearchPage;

import java.lang.invoke.MethodHandles;

@DefaultUrl("page:recordDetails.page")
public class RecordDetailsPage extends BasePage {

    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());
    SearchPage searchPage;

    @FindBy(className = "es-color-white")
    public WebElementFacade recordTitle;

}
