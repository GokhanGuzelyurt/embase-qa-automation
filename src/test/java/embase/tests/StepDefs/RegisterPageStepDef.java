package embase.tests.StepDefs;

import cucumber.api.java.en.Given;
import po.HeaderNavigation;


public class RegisterPageStepDef {

    HeaderNavigation headerNavigation;

    @Given("user clicks on Sign In button")
    public void clickSignInButton() {
        headerNavigation.signInButton.waitUntilVisible();
        headerNavigation.signInButton.click();

    }
}
