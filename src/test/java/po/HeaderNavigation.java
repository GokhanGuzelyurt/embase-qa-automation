package po;

import net.serenitybdd.core.pages.WebElementFacade;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import po.common.BasePage;

public class HeaderNavigation extends BasePage {

    @FindBy(id = "header-holder")
    public WebElement headerHolder;

    @FindBy(id = "header-btn-sign-in")
    public WebElementFacade signInButton;

    public void clickSignInButton() {
        signInButton.waitUntilVisible();
        signInButton.click();
    }
}
