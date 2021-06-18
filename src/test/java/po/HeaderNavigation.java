package po;

import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.core.pages.WebElementFacade;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class HeaderNavigation extends PageObject {

    @FindBy(id = "header-holder")
    public WebElement headerHolder;


    @FindBy(id = "header-btn-sign-in")
    public WebElementFacade signInButton;

}
