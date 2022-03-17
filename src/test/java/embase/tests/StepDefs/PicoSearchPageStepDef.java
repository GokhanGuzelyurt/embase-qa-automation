package embase.tests.StepDefs;

import cucumber.api.java.en.When;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import po.PicoSearchPage;
import po.QuickSearchPage;

import java.lang.invoke.MethodHandles;

public class PicoSearchPageStepDef {

    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());
    PicoSearchPage picoSearchPage;

    @When("^user opens Pico search page$")
    public void openPicoSearchPage() {
        picoSearchPage.open();
    }
}
