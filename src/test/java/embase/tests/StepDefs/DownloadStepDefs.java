package embase.tests.StepDefs;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import po.DownloadPage;

import java.util.Arrays;
import java.util.List;

public class DownloadStepDefs {
    DownloadPage downloadPage = new DownloadPage();

    @And("user clicks on download button on Export page")
    public void userClicksOnDownloadButtonOnExportPage() {
        downloadPage.userClicksOnDownloadButtonOnExportPage();
    }

    @Then("^user checks downloaded (.*) document contains (.*)$")
    public void checksDownloadedDocumentContains(String fileName, String value) {
        List<String> values = Arrays.asList(value.split(","));
        values.forEach(val -> downloadPage.checksDownloadedDocumentContains(fileName, val));
    }
}