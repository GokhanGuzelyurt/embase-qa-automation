package po.sections.search;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import po.common.BasePage;

import java.lang.invoke.MethodHandles;

public class Ribbon extends BasePage {
    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());

    @FindBy(css = ".buttonBar .barbutton")
    public WebElement tabs;

    @FindBy(css = ".tabSheetLabel")
    public WebElement tabSheetLabel;

    @FindBy(id = "advancedTab_sheet")
    public WebElement mappingTab;

    @FindBy(id = "basicsTab_sheet")
    public WebElement dateTab;

    @FindBy(id = "basicsTab_sheet")
    public WebElement sourceTab;

    @FindBy(id = "search_drug_sheet")
    public WebElement drugSubhTab;

    @FindBy(id = "search_drugroute_sheet")
    public WebElement routesTab;

    @FindBy(id = "search_disease_sheet")
    public WebElement diseaseTab;

    @FindBy(id = "search_device_sheet")
    public WebElement deviceTab;

    @FindBy(id = "fieldLabelsTab_sheet")
    public WebElement fieldsTab;

    @FindBy(id = "fieldLabelsDrugTab_sheet")
    public WebElement drugFieldsTab;

    @FindBy(id = "fieldLabelsDeviceTab_sheet")
    public WebElement deviceFieldsTab;

    @FindBy(id = "quickLimits_sheet")
    public WebElement quickLimitsTab;

    @FindBy(id = "search_ebm_sheet")
    public WebElement ebmTab;

    @FindBy(id = "search_articletype_sheet")
    public WebElement pubTypeTab;

    @FindBy(id = "search_language_sheet")
    public WebElement languagesTab;

    @FindBy(id = "search_gender_sheet")
    public WebElement genderTab;

    @FindBy(id = "search_agetype_sheet")
    public WebElement ageTab;

    @FindBy(id = "search_animaltype_sheet")
    public WebElement animalTab;

    @FindBy(id = "searchTipsWrapper")
    public WebElement searchTipsTab;

    @FindBy(css = ".clearselection")
    public WebElement clearSelectionLink;

    @FindBy(css = ".collapse")
    public WebElement collapseLink;

    @FindBy(css = ".barbuttonSelected")
    public WebElement barButtonSelected;

    @FindBy(id = "extendedSearchBLock")
    public WebElement ribbonBlock;

}
