package po;

import net.serenitybdd.core.pages.WebElementFacade;
import net.thucydides.core.annotations.DefaultUrl;
import net.thucydides.core.annotations.Step;
import org.assertj.core.api.Assertions;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.Color;
import org.openqa.selenium.support.FindBy;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import po.common.BasePage;
import po.common.SearchPage;

import java.lang.invoke.MethodHandles;
import java.util.List;

@DefaultUrl("page:recordDetails.page")
public class RecordDetailsPage extends BasePage {

    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());
    SearchPage searchPage;

    public static String EMAIL_TEXT_LABEL = "The email will be sent from no_reply@embase.com";

    @FindBy(css = "[data-testid='title']")
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

    @FindBy(xpath = "//*[@data-testid='abstract']//*[@data-testid='translated']")
    public WebElement translatedAbstract;

    @FindBy(css = "[data-testid='right-pane'] [data-testid='send']")
    public WebElement sendAction;

    @FindBy(css = "label[for='sendTo']")
    public WebElement sendToLabelText;

    @FindBy(css = "label[for='cc']")
    public WebElement ccLabelText;

    @FindBy(css = "label[for='subject']")
    public WebElement subjectLabelText;

    @FindBy(css = "label[for='comments']")
    public WebElement commentsLabelText;

    @FindBy(css = "label[for='content-selected-value']")
    public WebElement contentLabelText;

    @FindBy(css = "[data-testid='email-from-notice']")
    public WebElement emailNotificationText;

    @FindBy(css = "[data-testid='tag-section'] span span span")
    public WebElement sendToInputField;

    @FindBy(css = "[id='subject']")
    public WebElement subjectInputField;

    @FindBy(css = "#send-via-email-modal [data-testid='submit']")
    public WebElement sendEmailBtn;

    @FindBy(xpath = "//span[text()='HTML']/..")
    public WebElement htmlFormatRadioBtn;

    @FindBy(xpath = "//span[text()='Text']/..")
    public WebElement textFormatRadioBtn;

    @FindBy(id = "subject-description")
    public WebElement subjectAlertText;

    @FindBy(css = "[id='message-box']")
    public WebElement messageBoxSignIn;

    @FindBy(xpath = "//*[@data-testid='right-pane']//*[@data-testid='full-text-link']")
    public WebElement fullTextLinkRightPane;

    @FindBy(xpath = "//*[@data-testid='right-pane']//*[@data-testid='organization-specific-link']")
    public WebElement organizationSpecificLinkRightPane;

    @FindBy(xpath = "//*[@data-testid='right-pane']//*[@data-testid='add-to-clipboard']")
    public WebElement addToClipboardRightPane;

    @FindBy(xpath = "//*[@data-testid='right-pane']//*[@data-testid='similar-records']")
    public WebElement similarRecordsRightPane;

    @FindBy(xpath = "//*[@data-testid='right-pane']//*[@data-testid='search-by-author']")
    public WebElement searchAuthorsRightPane;

    @FindBy(id = "search-by-author-modal")
    public WebElement searchByAuthorModal;

    @FindBy(id = "search-by-author-modal-label")
    public WebElement searchByAuthorLabel;

    @FindBy(css = "#search-by-author-modal [data-testid='submit']")
    public WebElement searchAuthorBtn;

    @FindBy(css = "[data-testid='right-pane'] [data-testid='print']")
    public WebElementFacade printAction;

    @FindBy(css = "[data-testid='field-value-clinicalTrialNumbers'] > div:nth-child(1) > span > span:nth-child(1)")
    public List<WebElement> clinicalTrialNumbers;

    @FindBy(css = "[data-testid='field-value-clinicalTrialNumbers']")
    public WebElementFacade clinicalTrial;

    @FindBy(css = "[title='Next record']")
    public WebElementFacade recordPageNext;

    @FindBy(css = "[role='progressbar']")
    public WebElementFacade progressbar;

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

    @Step
    public void clickBySpanText(String spanText) {
        WebElement element = getDriver().findElement(By.xpath("//*[@id='message-box']//span[text()='" + spanText + "']"));
        element.click();
    }

    @Step
    public void selectAuthorByText(String authorName) {
        getDriver().findElement(By.xpath("//span[contains(@class,'Checkbox-module_content')][text()='" + authorName + "']")).click();
    }

    @Step
    public void clickOnAction(String actionName) {
        switch (actionName.toLowerCase().replace(" ", "")) {
            case "send":
                sendAction.click();
                break;
            case "print":
                printAction.click();
                break;
        }
    }

    @Step
    public void clickCollapsibleSectionTitle(String sectionName) {
        getDriver().findElement(By.xpath("//*[@data-testid='collapsible']//*[text() = '" + sectionName + "']")).click();
    }

    /**
     * @param sectionName is the visible text title for the collapsible section
     *                    possible values are 'Abstract, Drug terms, Disease terms, Other terms,
     *                    Author keywords, Additional information, Copyright'.
     * @return "collapse" when section is collapsed and "collapse show" when expanded
     */
    public String getCollapsibleSectionClassValue(String sectionName) {
        WebElement collapsibleContent = getDriver().findElement(By.xpath("//*[@data-testid='collapsible']//*[text() = '" + sectionName + "']/../../following-sibling::div"));
        // wait for collapsing animation to complete
        long waitStartTime = System.currentTimeMillis();
        while (collapsibleContent.getAttribute("class").equalsIgnoreCase("collapsing")) {
            if (System.currentTimeMillis() > waitStartTime + 5000)
                Assertions.fail("Stuck in 'collapsing' state for more than 5 seconds");
        }
        return collapsibleContent.getAttribute("class");
    }


    public void verifiesThatClinicalTrialNumbersContains(String value) {
        clinicalTrialNumbers.forEach(num -> Assert.assertTrue("The Clinical Trial Numbers does not contain '" + value + "'", num.getText().contains(value)));
    }

    public void verifiesThatClinicalTrialNumbersDoesNotContainInvalidSymbols() {
        clinicalTrialNumbers.forEach(num -> Assert.assertFalse("The Clinical Trial Numbers " + num.getText() + " contain invalid symbols '[a-z!@#$%^&*()_+]", num.getText().matches(".*[a-z!@#$%^&*()_+].*")));
    }


    private void waitUntilLoadingPage() {
        progressbar.shouldNotBeVisible();
    }

    public void userIsLookingForInClinicalSection(String value) {
        int i = 0;
        waitUntilLoadingPage();
        while (!clinicalTrial.getText().contains(value)) {
            i++;
            recordPageNext.click();
            recordPageNext.waitUntilEnabled();
            if (i == 10) {
                break;
            }
        }
    }
}

