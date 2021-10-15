package embase.tests.StepDefs;

import cucumber.api.java.en.When;
import po.DeviceSearchPage;

public class DeviceSearchPageStepDef {
    DeviceSearchPage deviceSearchPage;

    @When("^user opens Device Search page$")
    public void openDeviceSearch() {
        deviceSearchPage.open();
    }
}
