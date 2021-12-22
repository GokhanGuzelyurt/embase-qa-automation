package po;

import net.serenitybdd.core.pages.WebElementFacade;
import net.thucydides.core.annotations.DefaultUrl;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import po.common.BasePage;

@DefaultUrl("page:config.page")
public class ConfigPage extends BasePage {

    @FindBy(xpath = "//p[contains(text(),'Version')]")
    public WebElementFacade legacyBuildNumber;

    @FindBy(xpath = "//pre[1]")
    public WebElementFacade webappBuildNumber;

    @FindBy(id = "sg")
    public WebElementFacade securityGatewayBuildNumber;

    @FindBy(id = "fe")
    public WebElementFacade reactBuildNumber;
}
