package embase.tests.StepDefs;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.assertj.core.api.Assertions;
import org.openqa.selenium.By;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import po.EmtreePage;

import java.lang.invoke.MethodHandles;

public class EmtreePageStepDef {
    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());
    EmtreePage emtreePage;

    @When("^user opens Emtree page$")
    public void openEmtreePage() {
        emtreePage.open();
        emtreePage.refreshEmtree();
        emtreePage.waitFor(emtreePage.termInputTextField);
    }

    @When("^user enters Emtree query (.*) in Emtree page$")
    public void enterEmtreeTerm(String query) {
        logger.info("Entering term " + query + " in Emtree page");
        emtreePage.termInputTextField.sendKeys(query);
    }

    @When("^user clicks the Find Term button in Emtree page$")
    public void clickFindTerm() {
        logger.info("Click Find Term");
        emtreePage.waitForJStoLoad();
        emtreePage.findTermButton.click();
    }

    @When("^user clicks on the first element of the Emtree results list$")
    public void clickFirstElementOfEmtreeResults() {
        logger.info("Click First element in Emtree Results list");
        emtreePage.waitFor(emtreePage.findTermResults);
        emtreePage.findTermResults.findElement(By.cssSelector("a")).click();
    }

    @Then("^verify that the list of Emtree term results has exact match for term (.*)$")
    public void verifyTermPresentInResultsList(String term) {
        logger.info("Verify term present in list: " + term);
        emtreePage.waitFor(emtreePage.findTermResults);
        // getting the first element in the results that will open the tree
        Assertions.assertThat(emtreePage.findTermResults.findElement(By.cssSelector(".openTree")).getText()).describedAs("Emtree term does not match results").isEqualTo(term);
    }

    @Then("^verify that the additional Emtree information contains the GMDN code (.*)$")
    public void verifyCodePresentInAdditionalInfo(String code) {
        // code is always between parenthesis, this makes the assertion more strict
        code = "(" + code + ")";
        logger.info("Verify code present additional Emtree info: " + code);
        Assertions.assertThat(emtreePage.additionalEmtreeInformation.getText()).describedAs("GMDN code is not present in additional info").contains(code);
    }

    @Then("^verify that the additional Emtree information contains the GMDN term (.*)$")
    public void verifyGMDNPresentInAdditionalInfo(String gmdnTerm) {
        // code is always between parenthesis, this makes the assertion more strict
        logger.info("Verify code present additional Emtree info: " + gmdnTerm);
        Assertions.assertThat(emtreePage.additionalEmtreeInformation.getText()).describedAs("GMDN code is not present in additional info").contains(gmdnTerm);
    }


}