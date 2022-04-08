package po;

import net.serenitybdd.core.pages.PageObject;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class DownloadPage extends PageObject {
    @FindBy(css = "[class*='basebutton']")
    public WebElement baseButton;

    public void userClicksOnDownloadButtonOnExportPage() {
        baseButton.click();
    }
}
