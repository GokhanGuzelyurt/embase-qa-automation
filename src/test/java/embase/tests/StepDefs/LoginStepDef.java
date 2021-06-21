package embase.tests.StepDefs;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Step;
import org.assertj.core.api.Assertions;
import po.LoginPage;

public class LoginStepDef {

    LoginPage loginPage;

    @Step
    @Given("user opens Embase application")
    public void openEmbase() {
        loginPage.open();
    }

    @Then("Sign in button is displayed")
    public void signInBtnDisplayed() {
        loginPage.signInButton.waitUntilVisible().then().click();
    }

    @Given("^user enters email id as (.*) and click Continue$")
    public void enterEmail(String emailID) {
        loginPage.email.sendKeys(emailID);
        loginPage.primaryButton.click();
    }

    @When("^user tries to login with password (.*)$")
    public void userTriesLogin(String userPass) {
        loginPage.enterPassword(userPass);
    }

    @Then("^an error message (.*) is displayed$")
    public void checkPasswordError(String errorText) {
        Assertions.assertThat(loginPage.pwdErrorMsg.getText()).describedAs("Password Error message is incorrect").isEqualToIgnoringCase(errorText);
    }

    @Then("^user verifies that email text box is disabled$")
    public void verifyDisabledEmailBox() {
        Assertions.assertThat(loginPage.disabledEmail.isEnabled()).describedAs("Email text box is not disabled").isFalse();
    }

    @And("^user clicks on Forgotten Password link$")
    public void clickForgottenPasswordLink() {
        loginPage.forgottenPasswordLink.click();
    }

    @And("^user verifies Forgotten password link UI elements$")
    public void verifyForgottenPwdUI() {
        Assertions.assertThat(loginPage.forgottenPwdText1.getText()).describedAs("Text 1 is not equal to expected").isEqualToIgnoringCase("Forgotten your password?");
        Assertions.assertThat(loginPage.forgottenPwdText2.getText()).describedAs("Text 1 is not equal to expected").isEqualToIgnoringCase("Get a link to reset your password");
        Assertions.assertThat(loginPage.primaryButton.getText()).describedAs("Send me a link button is not displayed").isEqualToIgnoringCase("Send me a link");
        Assertions.assertThat(loginPage.secondaryButton.getText()).describedAs("Send me a link button is not displayed").isEqualToIgnoringCase("Go back to sign in");
    }

    @Then("^Login page UI elements are displayed$")
    public void iVerifyLoginPageUI() {
        loginPage.verifyPage();
    }

    @And("^user click on Go back to sign in button$")
    public void clickgoToSignInBtn() {
        loginPage.secondaryButton.click();
    }

    @And("^user enters password as (.*) and click SignIn$")
    public void enterPassword(String pwd) {
        loginPage.password.sendKeys(pwd);
        loginPage.primaryButton.click();
    }

    @And("^user click on Sign in with a different account button$")
    public void signInDiffAcct() {
        loginPage.secondaryButton.click();
    }

    @Then("^verify that user email field is displayed$")
    public void userEmailFieldDisplayed() {
        Assertions.assertThat(loginPage.email.isDisplayed()).describedAs("Email Field isnort displayed").isTrue();
    }

    @And("^the disabled email value on login page is (.*)$")
    public void verifyDisabledEmailValue(String email) {
        Assertions.assertThat(loginPage.disabledEmail.getText()).describedAs("Email value is not equal to expected").isEqualToIgnoringCase(email);
    }
}

