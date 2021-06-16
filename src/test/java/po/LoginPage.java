package po;

import embase.tests.StepDefs.CommonSteps;
import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.core.pages.WebElementFacade;
import net.thucydides.core.annotations.DefaultUrl;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;


public class LoginPage extends PageObject {

    @FindBy(id = "header-btn-sign-in")
    public WebElementFacade signInButton;

    @FindBy(id = "bdd-email")
    public WebElement email;

    @FindBy(id = "bdd-elsPrimaryBtn")
    public WebElement primaryButton;

    @FindBy(id = "bdd-password")
    public WebElement password;

    @FindBy(id = "fragmentInput-0")
    public WebElementFacade firstLine;
}
