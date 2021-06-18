package embase.tests.StepDefs;

import cucumber.api.java.Before;
import cucumber.api.java.en.Given;
import po.LoginPage;

public class CommonSteps {


    LoginPage loginPage;

    @Before
    public void setUp() {
        System.out.println("BEFORE");

    }


    @Given("user opens Embase application")
    public void openEmbase() {
        loginPage.open();
        System.out.println("OPEN PAGE");
    }



}
