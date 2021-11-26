package po;

import net.serenitybdd.core.pages.WebElementFacade;
import net.thucydides.core.annotations.DefaultUrl;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.Color;
import org.openqa.selenium.support.FindBy;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import po.common.BasePage;
import po.common.SearchPage;

import java.lang.invoke.MethodHandles;

import static org.apache.commons.lang3.BooleanUtils.and;

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

    //    @FindBy(xpath="//ul[@class='Pagination-module_items__1jifO']/li[1]/button")
    @FindBy(xpath = "//*[@data-testid='pagination']//span[text() = 'Previous']/..")
    public WebElement previous;

    // @FindBy(xpath="//ul[@class='Pagination-module_items__1jifO']/li[3]/button")
    @FindBy(xpath = "//*[@data-testid='pagination']//span[text() = 'Next']/..")
    public WebElement next;

//    @FindBy(xpath = "//span[@class='Pagination-module_label__34GAB']")
    @FindBy(xpath="//*[@data-testid='pagination']//div[text() = ' of ']")
    public WebElement paginationLabel;

    @FindBy(xpath = "//*[@data-testid='source']/span[1]")
    public WebElement sourceMagazine;

    @FindBy(xpath = "//*[@data-testid='source']/span[3]")
    public WebElement sourceVolume;

    @FindBy(xpath = "//*[@data-testid='view-author-addresses']")
    public WebElement viewAuthorAddresses;

    @FindBy(xpath = "//*[@data-testid='title']")
    public WebElement title;

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

