package embase.tests.StepDefs;

import cucumber.api.java.en.And;
import po.DownloadPage;

public class DownloadStepDefs {
    DownloadPage downloadPage = new DownloadPage();

    @And("user clicks on download button on Export page")
    public void userClicksOnDownloadButtonOnExportPage() {
        downloadPage.userClicksOnDownloadButtonOnExportPage();
    }
}
