package embase.tests.StepDefs;

import cucumber.api.java.en.And;
import cucumber.api.java.en.When;
import groovyjarjarantlr4.v4.analysis.LeftRecursiveRuleAnalyzer;
import org.assertj.core.api.Assertions;
import po.ClipboardPage;

public class ClipboardPageStepDef {
    ClipboardPage clipboardPage;

    @When("^user opens Clipboard page$")
    public void openClipboardPage() {
        clipboardPage.open();
    }

    @When("^user is on Clipboard page$")
    public void clipboardPageDisplayed() {
        clipboardPage.shouldBeDisplayed();
        clipboardPage.waitForJStoLoad();
        Assertions.assertThat(clipboardPage.clipboardPageTitle.getText()).describedAs("Clipboard page is not displayed").isEqualToIgnoringCase("Clipboard");
    }

    @And("^user opens record #(\\d*) by clicking on title on Clipboard page$")
    public void openRecordByTitle(int recordId) {
        clipboardPage.clickRecordByTitleOnClipboard(recordId);
    }

}
