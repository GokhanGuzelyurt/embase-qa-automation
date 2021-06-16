package embase.tests.StepDefs;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import net.thucydides.core.annotations.Step;
import po.HomePage;

public class LoginStepDef extends BaseSteps {

    HomePage homePage;

    @Step
    @Given("user opens Embase application")
    public void openEmbase() {
        homePage.open();

    }

    @Then("Sign in button is displayed")
    public void signInBtnDisplayed() {
        homePage.signInButton.waitUntilVisible().then().click();
    }

    @Given("^user enters email id as (.*)  and click Continue$")
    public void enterEmail(String emailID) {

        homePage.email.sendKeys(emailID);
        homePage.primaryButton.click();
    }

    @And("^user enters password as (.*) and click SignIn$")
    public void enterPassword(String pwd) {
        homePage.password.sendKeys(pwd);
        homePage.primaryButton.click();
    }

    @Then("Quick search page is displayed")
    public void quickSearchpageisOpened() {
        homePage.firstLine.waitUntilVisible().shouldBeEnabled();
    }
}
