package po;

import net.serenitybdd.core.pages.WebElementFacade;
import net.thucydides.core.annotations.DefaultUrl;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.Color;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import po.common.BasePage;
import po.common.SearchPage;

import java.lang.invoke.MethodHandles;
import java.util.concurrent.TimeUnit;

@DefaultUrl("page:recordDetails.page")
public class RecordDetailsPage extends BasePage {

    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());
    SearchPage searchPage;

    @FindBy(className = "es-color-white")
    public WebElementFacade recordTitle;

    @FindBy(xpath = "//*[@id='additional-information-section-collapsible-content']")
    public WebElement additionalInfoSection;

    @FindBy(xpath = "//button[@title='Search by 0000-0001-6084-166X']")
    public WebElement orcIDTitle;

    @FindBy(xpath = "//span[text()='Full text']")
    public WebElement fullTextLink;

    @FindBy(xpath = "*[@id='column2']/h2")
    public WebElement fullTextPageTitle;

    @FindBy(xpath = "//*[@data-testid='back-to']")
    public WebElement backToResultsLink;

    @FindBy(xpath = "//*[@data-testid='pagination']")
    public WebElement paginationLinks;

    @FindBy(xpath = "//*[@data-testid='pagination']//span[text() = 'Previous']/..")
    public WebElement previous;

    @FindBy(xpath = "//*[@data-testid='pagination']//span[text() = 'Next']/..")
    public WebElement next;

    @FindBy(xpath = "//*[@data-testid='pagination']//div[text() = ' of ']")
    public WebElementFacade paginationLabel;

    @FindBy(xpath = "//*[@data-testid='source']/span[1]")
    public WebElement sourceMagazine;

    @FindBy(xpath = "//*[@data-testid='source']/span[3]")
    public WebElement sourceVolume;

    @FindBy(xpath = "//*[@data-testid='view-author-addresses']")
    public WebElement viewAuthorAddresses;

    @FindBy(xpath = "//*[@data-testid='title']")
    public WebElement title;

    @FindBy(css = "[data-testid='authors']")
    public WebElement authors;

    @FindBy(css = "[data-testid='show-hide-original']")
    public WebElement showOriginalTitleLink;

    @FindBy(css = "[data-testid='original']")
    public WebElement originalTitle;

    @FindBy(css = "[data-testid='translated']")
    public WebElement translatedTitle;

    @FindBy(css = "[data-testid='collapsible-block-content']")
    public WebElement abstractText;

    @FindBy(css = "[data-testid='show-hide-original']")
    public WebElement showOriginalAbstractLink;

    @FindBy(xpath = "//*[@data-testid='abstract']//*[@data-testid='original']")
    public WebElement originalAbstract;

    @FindBy(xpath="//*[@data-testid='abstract']//*[@data-testid='translated']")
    public WebElement translatedAbstract;

    public boolean isORCIDHighlightingEnabled() {
        boolean flag = false;
        WebElement orcID = orcIDTitle.findElement(By.xpath("//mark[1]"));
        String color = orcID.getCssValue("background-color");
        String hex = Color.fromString(color).asHex();
        if (hex.equalsIgnoreCase("#ffec84")) {
            flag = true;
        }
        return flag;
    }

    public boolean isPaginationLinksNavigationStateEnabled() {
        if (previous.isEnabled() && next.isEnabled()) {
            return true;
        } else return false;
    }

    public String getPaginationLabelText() {
        waitFor(paginationLabel);
        String text = paginationLabel.getText();
        return text;
    }

    public String getSourceMagazineText() {
        String sourceMagazineText = sourceMagazine.getText();
        return sourceMagazineText;
    }

    public String getSourceVolumeText() {
        String sourceVolumeText = sourceVolume.getText();
        return sourceVolumeText;
    }
}

