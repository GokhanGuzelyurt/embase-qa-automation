package po.common;

import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.core.pages.WebElementFacade;
import net.thucydides.core.annotations.Step;
import org.junit.Assert;
import org.openqa.selenium.*;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.lang.invoke.MethodHandles;

import static embase.tests.StepDefs.CommonSteps.setTestCaseVariable;
import static embase.tests.StepDefs.CommonSteps.testCaseVariables;

public class BasePage extends PageObject {
    final static Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());
    WebDriver driver;
    String extractedID;

    @FindBy(css = "._pendo-close-guide")
    public WebElementFacade pendoBannerClose;

    @FindBy(css = "body")
    public WebElement body;

    @FindBy(css = "a.basebutton")
    public WebElement baseButton;

    @Step
    public void closePendoBanner() {
        waitForJStoLoad();
        if (pendoBannerClose.isPresent() && pendoBannerClose.isClickable())
            pendoBannerClose.click();
    }

    public void checkByScript(WebElement element) {
        if (!element.isSelected()) {
            JavascriptExecutor js = (JavascriptExecutor) getDriver();
            js.executeScript("arguments[0].click();", element);
        }
    }

    public void uncheckByScript(WebElement element) {
        if (element.isSelected()) {
            JavascriptExecutor js = (JavascriptExecutor) getDriver();
            js.executeScript("arguments[0].click();", element);
        }
    }

    // TODO this method does not seem to have visible impact - taken from JDI project, we may not keep it
    public void scrollIntoView() {
        ((JavascriptExecutor) getDriver()).executeScript("document.body.scrollIntoView()");
    }

    public boolean waitForJStoLoad() {
        return waitForJStoLoad(30);
    }

    public void waitSomeSeconds(Integer secs) {
        waitABit(secs);
    }

    public boolean waitForJStoLoad(int timeoutSeconds) {
        WebDriverWait wait = new WebDriverWait(getDriver(), timeoutSeconds);
        // wait for jQuery to load
        ExpectedCondition<Boolean> jQueryLoad = driver -> {
            try {
                return ((Long) ((JavascriptExecutor) driver).executeScript("return jQuery.active") == 0);
            } catch (Exception e) {
                return true;
            }
        };
        // wait for Javascript to load
        ExpectedCondition<Boolean> jsLoad = driver -> ((JavascriptExecutor) driver).executeScript("return document.readyState").toString().equals("complete");
        return wait.until(jQueryLoad) && wait.until(jsLoad);
    }

    public void verifyTextDisplayed(String text) {
        waitForJStoLoad();
        Assert.assertTrue("The page does not contain text '" + text + "'", body.getText().contains(text));
    }

    public void clickOnLink(String link) {
        body.findElement(By.xpath("//*[contains(text(), '" + link + "')]/parent::a")).click();
    }

    public void clickOnButton(String button) {
        body.findElement(By.xpath("//*[contains(text(), '" + button + "')]/ancestor::button")).click();
    }

    public void clicksOnElementByText(String text) {
        body.findElement(By.xpath("//*[contains(text(), '" + text + "')]")).click();
    }

    public void verifyTextIsNotDisplayed(String text) {
        waitForJStoLoad();
        Assert.assertFalse("The page should not contain text '" + text + "'", body.getText().contains(text));
    }

    public void pressesTabKey() {
        body.sendKeys(Keys.TAB);
    }

    public void userSetVarJobIdFromDownloadUrl(String varName) {
        String urlHref = baseButton.getAttribute("href");
        String[] splitUrl = urlHref.split("=", 4);
        String[] extract = splitUrl[1].split("&", 2);
        extractedID = extract[0];
        setTestCaseVariable(varName, extractedID);
    }

    public void userReloadsPage() {
        logger.info("User reloads the page");
        getDriver().navigate().refresh();
    }

    public void checksThatValuesDoNotMatch(String var1, String var2) {
        String variable1 = testCaseVariables.get(var1);
        String variable2 = testCaseVariables.get(var2);
        Assert.assertNotEquals("The "+variable1+" should not be equal "+variable2+" ;", variable1, variable2);
    }
}