package embase.tests.StepDefs;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.runtime.junit.Assertions;
import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.core.pages.WebElementFacade;
import org.assertj.core.api.Assert;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.yecht.Data;

import static net.thucydides.core.webdriver.ThucydidesWebDriverSupport.getDriver;
import static org.assertj.core.api.Assertions.assertThat;

public class LoginStepDef extends PageObject {


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

    @Given("user opens Embase application")
    public void openEmbase(){
        getDriver().navigate().to("https://dev.embase-np.cm-elsevier.com");

    }
@Then("Sign in button is displayed")
    public void signInBtnDisplayed(){
      signInButton.waitUntilVisible().then().click();
}

@Given("^user enters email id as (.*)  and click Continue$")
    public void enterEmail(String emailID){

        email.sendKeys(emailID);
        primaryButton.click();
}
@And("^user enters password as (.*) and click SignIn$")
    public void enterPassword(String pwd){
password.sendKeys(pwd);
primaryButton.click();
}

@Then("Quick search page is displayed")
    public void quickSearchpageisOpened(){
        firstLine.waitUntilVisible().shouldBeEnabled();
}
}
