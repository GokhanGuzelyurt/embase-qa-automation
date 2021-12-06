package po;

import net.thucydides.core.annotations.DefaultUrl;
import net.thucydides.core.annotations.Step;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import po.common.BasePage;

import java.lang.invoke.MethodHandles;
import java.security.PublicKey;
import java.util.List;

@DefaultUrl("page:clipboard.page")
public class ClipboardPage extends BasePage {
    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());

    @FindBy(id = "page-title")
    public WebElement clipboardPageTitle;

    @FindBy(id = "clipboard-results")
    public WebElement clipboardResults;

    @FindBy(css = ".saveClipboards")
    public WebElement saveClipboardLink;

    public void clickRecordByTitleOnClipboard(int recordNumber) {
        logger.info("Select the record onc clipboard #" + recordNumber);
        List<WebElement> list = clipboardResults.findElements(By.cssSelector(".resultPreviewInner"));
        list.get(recordNumber - 1).findElement(By.xpath("//a[contains(@class,'hitsHighlighted')]")).click();
    }

    @Step
    public void clickOnActionLinkClipboardPage(String actionLinkName) {
        switch (actionLinkName.toLowerCase().replace(" ", "")) {
            case "Save":
                saveClipboardLink.click();
                break;

        }
    }
}

