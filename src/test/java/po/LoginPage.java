package po;

import embase.tests.StepDefs.CommonSteps;
import net.serenitybdd.core.pages.WebElementFacade;
import net.thucydides.core.annotations.DefaultUrl;
import org.assertj.core.api.SoftAssertions;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import po.common.BasePage;

import java.nio.channels.Selector;


public class LoginPage extends BasePage {

    HeaderNavigation headerNavigation;

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
    public WebElementFacade disabledEmail;

    @FindBy(id = "rememberMe")
    public WebElement loginRememberCheckBox;

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

    @FindBy(css = ".els-signin-form .els-h2-txt")
    public WebElementFacade loginTitle;

    @FindBy(css = ".els-signin-form .els-h1-txt")
    public WebElement signInTitle;

    public void enterPassword(String userPass) {
        password.sendKeys(userPass);
        primaryButton.click();
    }

    public void loginDefaultUser() {
        headerNavigation.clickSignInButton();
        email.sendKeys(CommonSteps.USER_EMAIL);
        primaryButton.click();
        password.sendKeys(CommonSteps.USER_PASSWORD);
        primaryButton.click();
    }

    public void verifyPage() {
        loginTitle.waitUntilVisible().isDisplayed();
//        logger.info("Verify the page 'Login' is displayed.");
        SoftAssertions.assertSoftly(softly -> {
            softly.assertThat(signInTitle.getText()).describedAs("Sign in title is wrong").isEqualTo("Sign in");
            softly.assertThat(loginTitle.getText()).describedAs("Login page title is wrong").isEqualTo("Enter your password to sign in to Embase");
            softly.assertThat(disabledEmail.isDisplayed()).describedAs("Username field is not displayed").isTrue();
            softly.assertThat(password.isDisplayed()).describedAs("Password field is not displayed").isTrue();
            softly.assertThat(primaryButton.isDisplayed()).describedAs("Sign In button is not displayed").isTrue();
            softly.assertThat(loginRememberCheckBox.isDisplayed()).describedAs("Remember me checkbox is not displayed").isTrue();
            softly.assertThat(forgottenPasswordLink.isDisplayed()).describedAs("Forgotten Password link is not displayed").isTrue();
            softly.assertThat(secondaryButton.isDisplayed()).describedAs("Sign in with a different account button is not displayed").isTrue();
        });
    }
}
