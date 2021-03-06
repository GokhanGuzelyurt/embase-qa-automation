package po;

import net.serenitybdd.core.annotations.findby.By;
import net.serenitybdd.core.pages.WebElementFacade;
import net.thucydides.core.annotations.DefaultUrl;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import po.common.BasePage;

import java.lang.invoke.MethodHandles;

@DefaultUrl("page:emailAlerts.page")
public class EmailAlertsPage extends BasePage {
    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());


    @FindBy(id = "emailAlertListUL")
    public WebElement emailAlertList;

    @FindBy(css = ".emailAlertsDetailsInfo-content :nth-child(1) p")
    public WebElement alertDetailsName;

    @FindBy(css = ".emailAlertsDetailsInfo-content :nth-child(2) p")
    public WebElement alertDetailsQuery;

    @FindBy(css = ".summary :nth-child(5) :nth-child(2)")
    public WebElement alertDetailsArticleInPressStatus;

    @FindBy(xpath = "//*[contains(text(), 'Preprints')]/following-sibling::*")
    public WebElement alertDetailsPreprintsStatus;

    @FindBy(css = ".editPreprints:first-of-type")
    public WebElement editPreprintSettingsLink;

    @FindBy(xpath = "//span[contains(text(),'Include preprints')]")
    public WebElementFacade editPreprintSettingsModalIncludeButton;

    @FindBy(xpath = "//span[contains(text(),'Exclude preprints')]")
    public WebElementFacade editPreprintSettingsModalExcludeButton;


    public WebElement getEmailAlertRowByName(String name) {
        return getDriver().findElement(By.xpath("//*[contains(text(), '" + name + "')]"));
    }

    public WebElement getReRunButtonForEmailAlertByName(String name) {
        return getDriver().findElement(By.cssSelector(".rerun[data-querynum='" + getEmailAlertRowByName(name).getAttribute("data-id") + "']"));
    }

    public WebElement getEmailAlertCheckboxByName(String name) {
        return getDriver().findElement(By.xpath("//*[contains(text(), '" + name + "')]//ancestor::*[contains(@class,'emailAlertRow')]//label"));
    }
}

