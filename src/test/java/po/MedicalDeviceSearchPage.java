package po;

import net.serenitybdd.core.annotations.findby.By;
import net.serenitybdd.core.pages.WebElementFacade;
import net.thucydides.core.annotations.DefaultUrl;
import net.thucydides.core.annotations.Step;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import po.common.BasePage;

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

    @FindBy(id = "page-modal-label")
    public WebElement ModalTitle;

    @FindBy(id = "device-name-input")
    public WebElement DeviceNameSearchText;

    @FindBy(css = ".ModalContent-module_root__2Z_73 .PageModal_content___RVzo ModalContent-module_margin-md__2gac2")
    public WebElement DeviceNamePopUp;

    @FindBy(css = ".modal-content adverse-reaction-modal")
    public WebElement AdverseEffectPopUp;

    @FindBy(css = ".modal-content specific-device-adverse-modal")
    public WebElement SpecificDeviceEffectsPopUp;

    @FindBy(className = "Tag-module_text__3dcY0")
    public WebElement DeviceTagName;

    @FindBy(className = "Tag-module_content__3E4R-")
    public WebElement tagNameGroup;

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

    @FindBy(xpath = "//span[contains(@class ,'icon-text')]")
    public WebElement AddSynonymsLink;

    @FindBy(css = "#page-modal button span")
    public WebElement addSynonymsModalBtn;

    @FindBy(css = ".els-autocomplete__suggestions-container")
    public List<WebElement> DeviceSuggestionsList;

    @FindBy(id = "react-autowhatever-1")
    public WebElement DeviceSuggestionsTermsList;

    @FindBy(className = "els-emtree")
    public WebElement DeviceEmtreeNodesList;

    @FindBy(css = ".els-emtree .els-emtree-list .term-holder")
    public WebElement EmtreeTermList;

    @FindBy(css = ".els-emtree .els-emtree-list-item-content .child")
    public WebElement AddToQueryIcon;

    @FindBy(id = "synonym-switchers")
    public WebElement SpecificDeviceAdverseEffectsList;

    @FindBy(css = ".Tag-module_content__3E4R- .LinkButton-module_root__2jLpv")
    public WebElement EditDeviceIcon;

    @FindBy(xpath = "//button[contains(@title,'Close')]")
    public WebElement RemoveDeviceIcon;

    @FindBy(css = "span.button-text")
    public WebElement BtnTextValue;

    @FindBy(className = "PanelButton_content__3tpqy")
    public WebElementFacade SynonymsBox;

    @FindBy(id = "study-limit-dropdown")
    public WebElement LimitsDropdown;

    @FindBy(id = "study-limit-dropdown-options-Humans")
    public WebElement humanOption;

    @FindBy(xpath = "//span[text()='Records added to Embase (including end date) :']")
    public WebElement RecordsAddedToEmbaseChkBox;

    @FindBy(name = "daterangepicker_start")
    public WebElement StartDate;

    @FindBy(name = "daterangepicker_end")
    public WebElement EndDate;

    @FindBy(className = "date-range-picker")
    public WebElement DateRangePicker;

    @FindBy(css = ".range_inputs")
    public WebElement DateRangePickerDlgBox;

    @FindBy(xpath = "//span[text()='Apply']")
    public WebElement ApplyBtn;

    @FindBy(xpath = "//*[@id=\"root\"]/div[1]/div[3]/div/div/div/div[2]/div[2]/div/div/div[2]/div[2]/div[2]/div/span/span")
    public WebElement specificAdverseEffectsText;

    @FindBy(className = "Button-module_root__32E30")
    public WebElement btnTextValue;

    @FindBy(css = ".PanelButton_root__1JTb7 .btn-open-synonyms-modal")
    public WebElement addSynonymsIcon;

    @FindBy(id = "show-results-button")
    public WebElement showResultsBtn;

    @FindBy(className = "Checkbox-module_root__1DisM")
    public WebElement checkBoxGroup;

    @FindBy(className = "PanelButton_root__1JTb7")
    public WebElement iconGroup;

    @FindBy(id = "publication-year-from")
    public WebElement pubYearFrom;

    @FindBy(id = "publication-year-to")
    public WebElement pubYearTo;

    @FindBy(id = "publication-year-from-options")
    public WebElement pubYearFromOptions;

    @FindBy(id = "publication-year-to-options")
    public WebElement pubYearToOptions;

    @FindBy(id = "synonym-operator")
    public WebElement synonymOperator;

    @FindBy(id = "tippy-6")
    public WebElementFacade synonymOperatorList;


    public boolean medicalDeviceLabelDisplayed() {
        logger.info("Verify Medical device form label is displayed");
        return MedicalDeviceLabel.isDisplayed();
    }

    public void clickIcon(String iconName) {
        logger.info("Click on icon" + iconName);
        WebElement icon = iconGroup.findElement(By.xpath("//span[contains(@class,'PanelButton_content__3tpqy')and contains(text(),'" + iconName + "')]"));
        icon.click();
    }


    public void verifyIconLabelIsDisplayed(String iconLabel) {
        logger.info("Verify the label of the icon");
        WebElement ele = iconGroup.findElement(By.xpath("//span[contains(@class ,'PanelButton_content__3tpqy') and contains(text(),'" + iconLabel + "')]"));
        ele.click();
    }


    public void clickChckBoxByText(String text) {
        logger.info("Click on checkbox" + text);
        WebElement chkboxTest = checkBoxGroup.findElement(By.xpath("//span[contains(@class,'Checkbox-module_content__1T7Il')and contains(text(),'" + text + "')]"));
        chkboxTest.click();
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

    public boolean AddDeviceNamePopupDisplayed() {
        return DeviceNamePopUp.isDisplayed();
    }


    public boolean AddAdverseEffectsPopupDisplayed() {
        return AdverseEffectPopUp.isDisplayed();
    }


    public boolean AddSpecificDEviceAdverseEffectsPopupDisplayed() {
        return SpecificDeviceEffectsPopUp.isDisplayed();
    }


    public void clickAutoSuggestDeviceTerm(String term) {

        List<WebElement> options = DeviceSuggestionsTermsList.findElements(By.className("suggestion-term"));
        for (WebElement option : options) {
            if (option.getText().equals(term)) {
                option.click(); // click the desired option
                break;
            }
        }


    }

    public void clickOnEmtreeNode(String nodeName) {
        logger.info("Click on Emtree node " + nodeName);
        List<WebElement> emtreeNodeList = DeviceEmtreeNodesList.findElements(By.className("term"));
        for (WebElement emtreeNode : emtreeNodeList) {
            logger.info("Items are " + emtreeNode.getText());
            if (emtreeNode.getText().equals(nodeName)) {
                emtreeNode.click(); // click the desired option
                break;
            }
        }
    }


    public void clickEmtreeDeviceTerm(String nodeTerm) {
        logger.info("Click on Emtree term  " + nodeTerm);
        WebElement nodeGrp = DeviceEmtreeNodesList.findElement(By.xpath("//*[text()[contains(.,'" + nodeTerm + "')]]"));
        logger.info("Medical device child " + nodeGrp.getText());
        nodeGrp.click();

    }


    public void clickEmtreeDeviceChildTerm(String childTerm) {
        logger.info("Click on Emtree term  " + childTerm);
        List<WebElement> items = DeviceEmtreeNodesList.findElements(By.cssSelector(".child .term-holder"));
        for (WebElement emtreeNode : items) {
            if (emtreeNode.getText().equalsIgnoreCase(childTerm)) {
                emtreeNode.click();
                emtreeNode.findElement(By.cssSelector(".actions .Icon-module_root__3r_4i")).click();// click the plus option
            }
        }
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
        if (SynonymsBox.getText().contains("synonyms")) {
            SynonymsBox.isEnabled();
        }
    }

    @Step
    public void selectHumanFromLimitsDropDown() {
        if (LimitsDropdown.isEnabled()) {
            LimitsDropdown.click();
            humanOption.click();
        }
    }

    @Step
    public void selectDateRange(String startDate, String endDate) {

        DateRangePicker.click();
        if (DateRangePickerDlgBox.isDisplayed()) {
            StartDate.sendKeys(Keys.CONTROL + "a");
            StartDate.sendKeys(Keys.DELETE);
            StartDate.sendKeys(startDate);
            EndDate.sendKeys(endDate);
            ApplyBtn.click();
        }
    }

    @Step
    public void clickByBtnText(String text) {
        WebElement btntext = btnTextValue.findElement(By.xpath("//span[contains(@class,'Button-module_content__7QNNH')and contains(text(),'" + text + "')]"));
        if (btntext.isEnabled()) {
            btntext.click();
        }
    }

    public String checkTagName(String text) {
        WebElement tagName = tagNameGroup.findElement(By.xpath("//span[contains(@class,'Tag-module_text__3dcY0')and contains(text(),'" + text + "')]"));
        return tagName.getText();
    }


    public void clickAddSynonymIcon() {
        addSynonymsIcon.click();
    }

    public void fillPublicationYears(String fromYear, String toYear) {
        if (!fromYear.isEmpty()) {
            pubYearFrom.click();
            pubYearFromOptions.findElement(By.buttonText(fromYear)).click();
        }

        if (!toYear.isEmpty()) {
            pubYearTo.click();
            pubYearToOptions.findElement(By.buttonText(toYear)).click();
        }
    }

    public boolean adverseDeviceEffectsChkBoxSelected() {
        WebElement element = getDriver().findElement(By.xpath("//*[@id='checkbox-adverse device effect']"));
        element.isEnabled();
        return element.isEnabled();
    }

}
