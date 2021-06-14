package StepDefs;

import com.thoughtworks.xstream.core.util.WeakCache;
import cucumber.api.java.en.Given;
import org.openqa.selenium.WebDriver;

public class QuickSearchPageStepDef {

    WebDriver driver;

@Given("I open google home page")
    public void openGoogle() {

    driver.get("https://www.google.com");
}
}


