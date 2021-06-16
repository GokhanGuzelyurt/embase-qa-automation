package embase.tests.StepDefs;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import net.thucydides.core.annotations.Step;
import po.LoginPage;

public class LoginStepDef extends CommonSteps {

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

    @Given("^user enters email id as (.*)  and click Continue$")
    public void enterEmail(String emailID) {
        loginPage.email.sendKeys(emailID);
        loginPage.primaryButton.click();
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
