package po;

import net.serenitybdd.core.pages.WebElementFacade;
import net.thucydides.core.annotations.DefaultUrl;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

@DefaultUrl("page:config.page")
public class ConfigPage extends BasePage {

    @FindBy(xpath = "//p[contains(text(),'Version')]")
    public WebElement buildNumber;

}
