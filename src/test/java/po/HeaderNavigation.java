package po;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class HeaderNavigation {

    @FindBy(id = "header-holder")
    public static HeaderNavigation headerNavigation;

    @FindBy(id = "header-btn-sign-in")
    public WebElement signInButton;

}
