package po;

import net.thucydides.core.annotations.DefaultUrl;
import net.thucydides.core.annotations.Step;
import org.assertj.core.api.Assertions;
import org.openqa.selenium.*;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.Point;
import org.openqa.selenium.Rectangle;
import org.openqa.selenium.support.FindBy;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import po.common.BasePage;

import java.awt.*;
import java.lang.invoke.MethodHandles;
import java.util.List;


@DefaultUrl("page:medicalDevice.page")
public class MedicalDeviceSearchPage extends BasePage {
    WebDriver driver;
    ResultsPage resultsPage;
    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());

    @FindBy(linkText = "Search tips")
    public WebElement searchTips;

    @FindBy(className = "wizard-title")
    public WebElement MedicalDeviceLabel;

    @FindBy(css = ".medical-device-name-section")
    public WebElement AddMedicalDeviceSection;

    @FindBy(xpath = "//div[@class='PageModal_contentFrame__1wMuV']/h3")
    public WebElement ModalTitle;

    @FindBy(id = "device-name-input")
    public WebElement DeviceNameSearchText;

//    @FindBy(id = "add-device-button")
//    public WebElement AddDeviceBtn;

    @FindBy(css = ".modal-content device-modal")
    public WebElement DeviceNamePopUp;

    @FindBy(css = ".modal-content adverse-reaction-modal")
    public WebElement AdverseEffectPopUp;

    @FindBy(css = ".modal-content specific-device-adverse-modal")
    public WebElement SpecificDeviceEffectsPopUp;

    @FindBy(css = ".device-name-tag")
    public WebElement DeviceTagName;

    @FindBy(css = ".general-adverse-tag-wrapper")
    public WebElement AdverseEffectsTagName;

    @FindBy(css = ".specific-adverse-tag-wrapper")
    public WebElement DeviceSpecificEffectsTagName;

    @FindBy(css = ".synonym-tag")
    public WebElement SynonymTagName;

    @FindBy(id = "checkbox-adverse device effect")
    public WebElement AdverseDeviceEffectCheckBox;

    @FindBy(id = "checkbox-clinical trial")
    public WebElement ClinicalTrialCheckBox;

    @FindBy(id = "checkbox-device comparison")
    public WebElement DeviceComparisonCheckBox;

    @FindBy(id = "checkbox-device economics")
    public WebElement DeviceEconomicsCheckBox;

    @FindBy(id = "show-result-button")
    public WebElement ShowResultsBtn;

    @FindBy(xpath = "//span[contains(@class ,'icon-text')]")
    public WebElement AddSynonymsLink;

    @FindBy(id = "add-synonym-button")
    public WebElement AddSynonymsBtn;

    @FindBy(css = ".els-autocomplete__suggestions-container")
    public List<WebElement> DeviceSuggestionsList;

    @FindBy(id = "react-autowhatever-1")
    public WebElement DeviceSuggestionsTermsList;

    @FindBy(css = ".els-emtree .els-emtree-list-item-content")
    public WebElement DeviceEmtreeNodesList;

    @FindBy(css = ".els-emtree .els-emtree-list .term-holder")
    public WebElement EmtreeTermList;

    @FindBy(css = ".els-emtree .els-emtree-list-item-content .child")
    public WebElement AddToQueryIcon;

    @FindBy(id = "synonym-switchers")
    public WebElement SpecificDeviceAdverseEffectsList;

    @FindBy(css = ".device-name-tag .icon-container .icon-pencil")
    public WebElement EditDeviceIcon;

    @FindBy(css = ".device-name-tag .icon-container .icon-cross")
    public WebElement RemoveDeviceIcon;

    @FindBy(css = "span.button-text")
    public WebElement BtnTextValue;

    @FindBy(css = ".els-panel-button .btn-open-synonyms-modal")
    public WebElement SynonymsBox;

    @FindBy(id = "study-limit-dropdown")
    public WebElement LimitsDropdown;

    @FindBy(id = "options-list")
    public List<String> LimitsDropDownList;

    @FindBy(xpath = "//span[text()='Records added to Embase (including end date) :']")
    public WebElement RecordsAddedToEmbaseChkBox;

    @FindBy(name = "daterangepicker_start")
    public WebElement StartDate;

    @FindBy(name = "daterangepicker_end")
    public WebElement EndDate;

    @FindBy(id = "include-date-date-rage-picker-overlay")
    public WebElement DateRangePicker;

    @FindBy(css = ".range_inputs")
    public WebElement DateRangePickerDlgBox;

    @FindBy(xpath = "//span[text()='Apply']")
    public WebElement ApplyBtn;

    @FindBy(xpath = "//*[@id=\"root\"]/div[1]/div[3]/div/div/div/div[1]/div/div[2]/div/div[2]/div/div/div/div[1]/div/span")
    public WebElement AddDeviceNameButton;



    public boolean medicalDeviceLabelDisplayed() {
        logger.info("Verify Medical device form label is displayed");

        return MedicalDeviceLabel.isDisplayed();
    }

    public void clickIcon(String iconName) {
//        logger.info("Click on icon" + iconName);
//        WebElement ele = driver.findElement(By.xpath("//span[contains(@class ,'PanelButton_content__3tpqy') and contains(text(),'" + iconName + "')]"));
//        ele.click();
        AddDeviceNameButton.click();
    }




    public void verifyIconLabelIsDisplayed(String iconLabel) {
        logger.info("Verify the label of the icon");
        WebElement ele= driver.findElement(By.xpath("//span[contains(@class ,'icon-text') and contains(text(),'" + iconLabel + "')]"));
        ele.click();
    }


    public void clickChckBoxByText(String text) {
        logger.info("Click on checkbox" + text);
        WebElement ele= driver.findElement(By.xpath("//span[contains(@class ,'checkbox-label-value') and contains(text(),'" + text + "')]"));
            ele.click();
    }


    public String verifyModalTitleName() {
        logger.info("Verify the title name");
        return ModalTitle.getText();
    }


    public void enterDeviceName(String deviceName) {
        logger.info("Enter the device name");
        DeviceNameSearchText.click();
        DeviceNameSearchText.sendKeys(Keys.CONTROL + "a");
        DeviceNameSearchText.sendKeys(Keys.DELETE);
        DeviceNameSearchText.sendKeys(deviceName);
    }


    public void clickAddSynonymsBtn() {
        AddSynonymsBtn.click();
    }


    public boolean AddDeviceNamePopupDisplayed() {
        return DeviceNamePopUp.isDisplayed();
    }


    public boolean AddAdverseEffectsPopupDisplayed() {
        return AdverseEffectPopUp.isDisplayed();
    }


    public boolean AddSpecificDEviceAdverseEffectsPopupDisplayed() {
        return SpecificDeviceEffectsPopUp.isDisplayed();
    }

    public void deviceSuggestionTermsDisplayed() {
//        Assertions.assertThat(DeviceSuggestionsList.isDisplayed()).describedAs("Suggestions terms list is not displayed").isTrue();
    }


    public void clickAutoSuggestDeviceTerm(String term) {

        List<WebElement> options= DeviceSuggestionsTermsList.findElements(By.className("suggestion-term"));
        for (WebElement option : options)
        {
            if (option.getText().equals(term))
            {
                option.click(); // click the desired option
                break;
            }
        }


    }

    public void clickOnEmtreeNode(String nodeName) {
        logger.info("Click on Emtree node " + nodeName);
//        DeviceEmtreeNodesList.get(nodeName).click();
    }


    public void clickEmtreeDeviceTerm(String nodeTerm) {
        logger.info("Click on Emtree term  " + nodeTerm);
//        UIElement item = DeviceEmtreeNodesList.get(nodeTerm);
////        item.click();
////        item.find(By.cssSelector(".icon-plus")).click();
////
}

    public void clickShowResultsBtn() {

        ShowResultsBtn.click();
    }

    @Step
    public void clickEditDeviceIcon() {
        EditDeviceIcon.click();

    }

    @Step
    public void clickRemoveDevice() {
        RemoveDeviceIcon.click();
    }


    @Step
    public void waitForSynonymsToLoad() {
        if (SynonymsBox.isDisplayed()) {

            SynonymsBox.isEnabled();
        }
    }

    @Step
    public void selectFromLimitsDropDown(String dropDowntext)
    {
        if (LimitsDropdown.isEnabled()) {
            LimitsDropdown.click();
//            LimitsDropDownList.select(dropDowntext);
        }
    }

    @Step
    public void selectDateRange(String startDate, String endDate) {
        RecordsAddedToEmbaseChkBox.click();

        DateRangePicker.click();
        if (DateRangePickerDlgBox.isDisplayed()) {
            StartDate.sendKeys(Keys.CONTROL + "a");
            StartDate.sendKeys(Keys.DELETE);
            StartDate.sendKeys(startDate);
            EndDate.sendKeys(endDate);
            ApplyBtn.click();
        }

    }




}
