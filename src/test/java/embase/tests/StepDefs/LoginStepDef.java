package embase.tests.StepDefs;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import po.LoginPage;

public class LoginStepDef {

    LoginPage loginPage;


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



    @And("^user enters password as (.*) and click SignIn$")
    public void enterPassword(String pwd) {
        loginPage.password.sendKeys(pwd);
        loginPage.primaryButton.click();
    }

    @Then("Quick search page is displayed")
    public void quickSearchpageisOpened() {
        loginPage.firstLine.waitUntilVisible().shouldBeEnabled();
    }
}
