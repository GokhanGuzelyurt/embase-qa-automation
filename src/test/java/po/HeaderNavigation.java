package po;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import po.common.BasePage;

public class HeaderNavigation extends BasePage {

    @FindBy(id = "header-holder")
    public static HeaderNavigation headerNavigation;

    @FindBy(id = "header-btn-sign-in")
    public WebElement signInButton;

}
