package embase.tests.StepDefs;

import net.serenitybdd.core.environment.EnvironmentSpecificConfiguration;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.util.EnvironmentVariables;

public class CommonSteps {

    private EnvironmentVariables environmentVariables;
    public static String baseURL;

    @Step
    public void getEnvironmentVariables() {
        baseURL = EnvironmentSpecificConfiguration.from(environmentVariables)
                .getProperty("webdriver.base.url");
    }

}
