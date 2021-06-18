package po;

import net.serenitybdd.core.pages.WebElementFacade;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import po.common.BasePage;

import java.nio.channels.Selector;


public class LoginPage extends BasePage {

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

    @FindBy(id = "bdd-disabledEmail")
    public WebElement disabledEmail;

    @FindBy(id = "rememberMe")
    public Selector loginRememberCheckBox;

    @FindBy(id = "bdd-els-close")
    public WebElement cancel;

    @FindBy(id = "bdd-forgotPassword")
    public WebElement forgottenPasswordLink;

    @FindBy(id = "bdd-elsSecondaryBtn")
    public WebElement secondaryButton;

    @FindBy(id = "passworderror")
    public WebElement pwdErrorMsg;

    @FindBy(css = ".sec-B .els-h2-txt")
    public WebElement forgottenPwdText2;

    @FindBy(css = ".sec-B .els-h1-txt")
    public WebElement forgottenPwdText1;

    public void enterPassword(String userPass) {
        password.sendKeys(userPass);
        primaryButton.click();
    }
}
