package po;

import net.thucydides.core.annotations.DefaultUrl;
import org.assertj.core.api.Assertions;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.Select;
import po.common.BasePage;

import java.awt.*;
import java.util.List;

@DefaultUrl("page:quickSearch.page")
public class QuickSearchPage extends BasePage {

    @FindBy(id = "showResults")
    public WebElement showResultsButton;

    @FindBy(css = "[data-testid='add-field']")
    public WebElement addFieldBtn;

    @FindBy(id = "field-selector-header")
    public WebElement fieldSelectorLabel;

    @FindBy(css = "[data-testid='frequent-fields']")
    public WebElement frequentFieldsList;

    @FindBy(css = "[data-testid='other-fields']")
    public WebElement otherFieldsList;

    @FindBy(id = "numberOfResults")
    public WebElement buttonHits;

    @FindBy(id = "fragmentInput-0")
    public WebElement firstLine;

    @FindBy(id = "usePublicationRange")
    public Checkbox usePublicationRangeCheckBox;

    @FindBy(id = "publicationYearFrom-button")
    public WebElement startYearDrop;

    @FindBy(id = "publicationYearTo-button")
    public WebElement endYearDrop;

    @FindBy(id = "publicationYearFrom-button")
    public Select startYearDropList;

    @FindBy(id = "publicationYearTo-button")
    public Select endYearDropList;

    @FindBy(id = "addFragment")
    public WebElement addSearchFieldBtn;

    @FindBy(id = "resetForm")
    public WebElement resetFormBtn;

    @FindBy(css = ".tipsTitleLink")
    public WebElement searchTipsLink;

    @FindBy(css = ".searchTips")
    public WebElement searchTipsArea;

    @FindBy(css = ".searchTipsContent")
    public WebElement searchTipsContent;

    @FindBy(css = ".circle")
    public WebElement searchTipsCloseButton;

    @FindBy(className = "fragmentSuggestions")
    public WebElement autosuggestList;


    public void at() {
        shouldBeDisplayed();
    }

    public boolean verifyFieldName(String fieldName) {
        boolean flag = false;
        List<WebElement> frequentList = frequentFieldsList.findElements(By.xpath("*//span[@class='LinkButton-module_content__2F1Lc']"));
        List<WebElement> otherFields = otherFieldsList.findElements(By.xpath("*//span[@class='LinkButton-module_content__2F1Lc']"));
        for (WebElement fieldValue : frequentList) {
            if ((fieldName).contains(fieldValue.getText())) {
                flag = true;
                break;
            } else flag = false;
        }
        for (WebElement fieldValue : otherFields) {
            if ((fieldName).contains(fieldValue.getText())) {
                flag = true;
                break;
            } else flag = false;
        }
        return flag;
    }
}
