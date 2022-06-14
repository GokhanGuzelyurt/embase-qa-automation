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
    public WebElement medicalDeviceLabel;

    @FindBy(css = ".medical-device-name-section")
    public WebElement AddMedicalDeviceSection;

    @FindBy(id = "page-modal-label")
    public WebElement modalTitle;

    @FindBy(id = "device-name-input")
    public WebElement deviceNameSearchText;

    @FindBy(css = ".ModalContent-module_root__2Z_73 .PageModal_content___RVzo ModalContent-module_margin-md__2gac2")
    public WebElement deviceNamePopUp;

    @FindBy(css = ".modal-content adverse-reaction-modal")
    public WebElement adverseEffectPopUp;

    @FindBy(css = ".modal-content specific-device-adverse-modal")
    public WebElement specificDeviceEffectsPopUp;

    @FindBy(css = "[data-testid='selected-device-name']")
    public WebElement deviceTagName;

    @FindBy(className = "Tag-module_content__3E4R-")
    public WebElement tagNameGroup;

    @FindBy(css = ".specific-adverse-tag-wrapper")
    public WebElement deviceSpecificEffectsTagName;

    @FindBy(css = ".synonym-tag")
    public WebElement synonymTagName;

    @FindBy(id = "checkbox-adverse device effect")
    public WebElement adverseDeviceEffectCheckBox;

    @FindBy(id = "checkbox-clinical trial")
    public WebElement clinicalTrialCheckBox;

    @FindBy(id = "checkbox-device comparison")
    public WebElement deviceComparisonCheckBox;

    @FindBy(id = "checkbox-device economics")
    public WebElement deviceEconomicsCheckBox;

    @FindBy(xpath = "//span[contains(@class ,'icon-text')]")
    public WebElement addSynonymsLink;

    @FindBy(css = "#page-modal button span")
    public WebElement addSynonymsModalBtn;

    @FindBy(css = ".els-autocomplete__suggestions-container")
    public List<WebElement> deviceSuggestionsList;

    @FindBy(id = "react-autowhatever-1")
    public WebElement deviceSuggestionsTermsList;

    @FindBy(className = "els-emtree")
    public WebElement deviceEmtreeNodesList;

    @FindBy(css = ".els-emtree .els-emtree-list .term-holder")
    public WebElement emtreeTermList;

    @FindBy(css = ".els-emtree .els-emtree-list-item-content .child")
    public WebElement addToQueryIcon;

    @FindBy(id = "option-group")
    public WebElement specificDeviceAdverseEffectsList;

    @FindBy(css = ".Tag-module_content__3E4R- .LinkButton-module_root__2jLpv")
    public WebElement editDeviceIcon;

    @FindBy(xpath = "//button[contains(@title,'Close')]")
    public WebElement removeDeviceIcon;

    @FindBy(className = "PanelButton_content__3tpqy")
    public WebElementFacade synonymsBox;

    @FindBy(id = "study-limit-dropdown")
    public WebElement limitsDropdown;

    @FindBy(id = "study-limit-dropdown-options-Humans")
    public WebElement humanOption;

    @FindBy(xpath = "//span[text()='Records added to Embase (including end date) :']")
    public WebElement recordsAddedToEmbaseChkBox;

    @FindBy(name = "daterangepicker_start")
    public WebElement startDate;

    @FindBy(name = "daterangepicker_end")
    public WebElement endDate;

    @FindBy(className = "date-range-picker")
    public WebElement dateRangePicker;

    @FindBy(css = ".range_inputs")
    public WebElement dateRangePickerDlgBox;

    @FindBy(xpath = "//span[text()='Apply']")
    public WebElement applyBtn;

    @FindBy(css = "[data-testid='selected-specific-effects'] span")
    public WebElement specificAdverseEffectsText;

    @FindBy(css = "[data-testid='page-modal-confirm']")
    public WebElement btnTextValue;

    @FindBy(css = ".PanelButton_root__1JTb7 .btn-open-synonyms-modal")
    public WebElement addSynonymsIcon;

    @FindBy(css = "[data-testid='show-results-button']")
    public WebElement showResultsBtn;

    @FindBy(className = "Checkbox-module_root__1DisM")
    public WebElement checkBoxGroup;

    @FindBy(css = "[class*='PanelButton_root']")
    public WebElement iconGroup;

    @FindBy(id = "publication-year-from")
    public WebElement pubYearFrom;

    @FindBy(id="publication-year-to-selected-value")
    public WebElement pubYearTo;

    @FindBy(id = "publication-year-from-options")
    public WebElement pubYearFromOptions;

    @FindBy(id = "publication-year-to-options")
    public WebElement pubYearToOptions;

    @FindBy(id = "synonyms-operator")
    public WebElement synonymOperator;

    @FindBy(css = ".tippy-content")
    public WebElement synonymOperatorList;

    @FindBy(id="generic-adverse-effects-query-modal-label")
    public WebElement addAdverseEffectsLabel;


    public boolean medicalDeviceLabelDisplayed() {
        logger.info("Verify Medical device form label is displayed");
        return medicalDeviceLabel.isDisplayed();
    }

    public void clickIcon(String iconName) {
        logger.info("Click on icon" + iconName);
        WebElement icon = iconGroup.findElement(By.xpath("//*[contains(text(),'" + iconName + "')]"));
        icon.click();
    }

    public void verifyIconLabelIsDisplayed(String iconLabel) {
        logger.info("Verify the label of the icon");
        WebElement ele = iconGroup.findElement(By.xpath("//*[contains(text(),'" + iconLabel + "')]"));
        ele.click();
    }

    public void clickChckBoxByText(String text) {
        logger.info("Click on checkbox" + text);
        WebElement chkboxTest = checkBoxGroup.findElement(By.xpath("//span[contains(@class,'Checkbox-module_content__1T7Il')and contains(text(),'" + text + "')]"));
        chkboxTest.click();
    }

    public String verifyModalTitleName() {
        logger.info("Verify the title name");
        return modalTitle.getText();
    }


    public void enterDeviceName(String deviceName) {
        logger.info("Enter the device name");
        deviceNameSearchText.click();
        deviceNameSearchText.sendKeys(Keys.CONTROL + "a");
        deviceNameSearchText.sendKeys(Keys.DELETE);
        deviceNameSearchText.sendKeys(deviceName);
    }

    public boolean AddDeviceNamePopupDisplayed() {
        return deviceNamePopUp.isDisplayed();
    }


    public boolean AddAdverseEffectsPopupDisplayed() {
        return adverseEffectPopUp.isDisplayed();
    }


    public boolean AddSpecificDEviceAdverseEffectsPopupDisplayed() {
        return specificDeviceEffectsPopUp.isDisplayed();
    }


    public void clickAutoSuggestDeviceTerm(String term) {

        List<WebElement> options = getDriver().findElements(By.xpath("//div[@class='col']"));
        for (WebElement option : options) {
            if (option.getText().equals(term)) {
                option.click(); // click the desired option
                break;
            }
        }


    }

    public void clickOnEmtreeNode(String nodeName) {
        logger.info("Click on Emtree node " + nodeName);
        List<WebElement> emtreeNodeList = deviceEmtreeNodesList.findElements(By.className("term"));
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
        WebElement nodeGrp = deviceEmtreeNodesList.findElement(By.xpath("//*[text()[contains(.,'" + nodeTerm + "')]]"));
        logger.info("Medical device child " + nodeGrp.getText());
        nodeGrp.click();

    }


    public void clickEmtreeDeviceChildTerm(String childTerm) {
        logger.info("Click on Emtree term  " + childTerm);
        List<WebElement> items = deviceEmtreeNodesList.findElements(By.cssSelector(".child .term-holder"));
        for (WebElement emtreeNode : items) {
            if (emtreeNode.getText().equalsIgnoreCase(childTerm)) {
                emtreeNode.click();
                emtreeNode.findElement(By.cssSelector(".actions .Icon-module_root__3r_4i")).click();// click the plus option
            }
        }
    }

    @Step
    public void clickEditDeviceIcon() {
        editDeviceIcon.click();
    }

    @Step
    public void clickRemoveDevice() {
        removeDeviceIcon.click();
    }

    @Step
    public void waitForSynonymsToLoad() {
        if (synonymsBox.getText().contains("synonyms")) {
            synonymsBox.isEnabled();
        }
    }

    @Step
    public void selectHumanFromLimitsDropDown() {
        if (limitsDropdown.isEnabled()) {
            limitsDropdown.click();
            humanOption.click();
        }
    }

    @Step
    public void selectDateRange(String startDate, String endDate) {

        dateRangePicker.click();
        if (dateRangePickerDlgBox.isDisplayed()) {
            this.startDate.sendKeys(Keys.CONTROL + "a");
            this.startDate.sendKeys(Keys.DELETE);
            this.startDate.sendKeys(startDate);
            this.endDate.sendKeys(endDate);
            applyBtn.click();
        }
    }

    @Step
    public void clickByBtnText(String text) {
        if (btnTextValue.isEnabled()) {
            btnTextValue.click();
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
            waitForJStoLoad();
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
