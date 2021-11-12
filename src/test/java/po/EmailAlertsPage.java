package po;

import net.serenitybdd.core.annotations.findby.By;
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

    @FindBy(css = ".summary :nth-child(6) :nth-child(2)")
    public WebElement alertDetailsPreprintsStatus;

    public WebElement getEmailAlertRowByName(String name) {
        return getDriver().findElement(By.xpath("//ul[@id='emailAlertListUL']//div[contains(text(), '" + name + "')]"));
    }

    public WebElement getReRunButtonForEmailAlertByName(String name) {
        return getDriver().findElement(By.cssSelector(".rerun[data-querynum='" + getEmailAlertRowByName(name).getAttribute("data-id") + "']"));
    }

    public WebElement getEmailAlertCheckboxByName(String name) {
        return getDriver().findElement(By.cssSelector(".checkbox[id='" + getEmailAlertRowByName(name).getAttribute("data-id") + "']"));
    }

}

