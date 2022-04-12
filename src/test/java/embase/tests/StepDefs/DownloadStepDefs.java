package embase.tests.StepDefs;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import po.DownloadPage;

public class DownloadStepDefs {
    DownloadPage downloadPage = new DownloadPage();

    @And("user clicks on download button on Export page")
    public void userClicksOnDownloadButtonOnExportPage() {
        downloadPage.userClicksOnDownloadButtonOnExportPage();
    }

    @Then("^user checks downloaded (.*) document contains (.*)$")
    public void checksDownloadedDocumentContains(String fileName,String value) {
        downloadPage.checksDownloadedDocumentContains(fileName, value);
    }
}