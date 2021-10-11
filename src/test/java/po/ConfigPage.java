package po;

import net.thucydides.core.annotations.DefaultUrl;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import po.common.BasePage;

@DefaultUrl("page:config.page")
public class ConfigPage extends BasePage {

    @FindBy(xpath = "//p[contains(text(),'Version')]")
    public WebElement legacyBuildNumber;

    @FindBy(xpath = "//pre[1]")
    public WebElement webappBuildNumber;

    @FindBy(id = "sg")
    public WebElement scurityGatewayBuildNumber;

    @FindBy(id = "fe")
    public WebElement reactBuildNumber;
}
