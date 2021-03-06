package po;

import net.serenitybdd.core.pages.WebElementFacade;
import net.thucydides.core.annotations.DefaultUrl;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.Select;
import po.common.BasePage;

import java.awt.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@DefaultUrl("page:quickSearch.page")
public class QuickSearchPage extends BasePage {

    @FindBy(css = "[data-testid='show-results-button']")
    public WebElement showResultsButton;

    @FindBy(css = "[data-testid='add-field']")
    public WebElement addFieldBtn;

    @FindBy(css = "[data-testid='show-full-query']")
    public WebElement displayFullQueryBtn;

    @FindBy(css = "[data-testid='fragments[0].change']")
    public WebElement changeFieldBtn;

    @FindBy(id = "field-selector-header")
    public WebElement fieldSelectorLabel;

    @FindBy(css = "[data-testid='frequent-fields']")
    public WebElement frequentFieldsList;

    @FindBy(css = "[data-testid='other-fields']")
    public WebElement otherFieldsList;

    @FindBy(id = "fragments[0].value")
    public WebElement firstLine;

    @FindBy(id = "fragments[1].value")
    public WebElement secondLine;

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

    @FindBy(css = "[data-suggestion-index='0'] div.es-color-grey6")
    public WebElement dataSuggestionIndex;

    @FindBy(id = "fragments[1].operator")
    public WebElement operatorDropdown;

    @FindBy(css = "[class*=SelectOptions-module_label]")
    public List<WebElement> selectOptions;

    @FindBy(css = "ul[role=listbox]")
    public WebElement suggestionList;

    @FindBy(css = "button[data-testid='page-modal-alternative'] span")
    public WebElement copyQueryModalBtn;

    @FindBy(xpath = "//button[@title=\"Clear\"]")
    public WebElement buttonClear;

    @FindBy(css = "[data-testid='limits-toggle']")
    public WebElement limitsToggle;

    public void at() {
        shouldBeDisplayed();
    }

    public boolean isFieldNamePresent(String fieldName) {
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

    public void selectFrequentFieldNameByText(String fieldName) {
        List<WebElement> frequentList = frequentFieldsList.findElements(By.xpath("*//span[@class='LinkButton-module_content__2F1Lc']"));
        for (WebElement fieldValue : frequentList) {
            if (fieldValue.getText().equalsIgnoreCase(fieldName)) {
                fieldValue.click();
                break;
            }
        }
    }

    public void selectOtherFieldNameByText(String fieldName) {
        List<WebElement> otherFields = otherFieldsList.findElements(By.xpath("*//span[@class='LinkButton-module_content__2F1Lc']"));
        for (WebElement fieldValue : otherFields) {
            if (fieldValue.getText().equalsIgnoreCase(fieldName)) {
                fieldValue.click();
                break;
            }
        }
    }

    public void selectOperatorByText(String text) {
        operatorDropdown.click();
        WebElement operatorText = operatorDropdown.findElement(By.xpath("//span[contains(@class,'els-select-popover__option__label')and contains(text(),'" + text + "')]"));
        operatorText.click();

    }

    public void verifyTheButtonIsDisabled(String buttonName) {
        String disabled = body.findElement(By.xpath("//*[contains(text(), '"+buttonName+"')]/parent::button")).getAttribute("disabled");
        Assert.assertTrue("The button " + buttonName + " should be not enabled", Boolean.parseBoolean(disabled));
    }

    public void verifyTheButtonIsEnabled(String buttonName) {
        String disabled = body.findElement(By.xpath("//*[contains(text(), '"+buttonName+"')]/parent::button")).getAttribute("disabled");
        Assert.assertFalse("The button " + buttonName + " should be not disabled", Boolean.parseBoolean(disabled));
    }

    public void verifyThatCheckboxIsNotClickable(String checkbox) {
        String disabled = body.findElement(By.xpath("//*[contains(text(), '"+checkbox+"')]/ancestor::label/input")).getAttribute("disabled");
        Assert.assertTrue("The checkbox " + checkbox + " should be not clickable", Boolean.parseBoolean(disabled));
    }

    public void selectCheckbox(String checkbox) {
        body.findElement(By.xpath("//*[contains(text(), '"+checkbox+"')]/ancestor::label")).click();
    }

    public void verifyThatOptionsIsEnabled(String optionsLabel) {
        String disabled = body.findElement(By.xpath("//label[contains(text(), '"+optionsLabel+"')]/following-sibling::button")).getAttribute("disabled");
        Assert.assertFalse("The options " + optionsLabel + " should be not enabled", Boolean.parseBoolean(disabled));
    }

    public void verifyThatSelectIsEnabled(String selectLabel) {
        String disabled = body.findElement(By.xpath("//label[contains(text(), '"+selectLabel+"')]/preceding-sibling::input")).getAttribute("disabled");
        Assert.assertFalse("The select " + selectLabel + " should be not enabled", Boolean.parseBoolean(disabled));
    }

    public void clickOnOption(String option) {
        body.findElement(By.xpath("//label[contains(text(), '"+option+"')]/following-sibling::button")).click();
    }

    public void verifyThatDropDownIsLimitedToTheNextYear(String optionLabel) {
        String option = selectOptions.get(0).getText();
        int nextYear = getNextYear();
        Assert.assertEquals("The "+optionLabel+" drop-down should limited to the next year" , String.valueOf(nextYear), option);
    }

    private int getNextYear() {
        LocalDate now = LocalDate.now();
        LocalDate nextYear = now.plusYears(1);
        return nextYear.getYear();
    }

    private int getCurrentYear() {
        LocalDate now = LocalDate.now();
        return now.getYear();
    }

    public void verifyThatDropDownContains(String optionLabel, String value) {
        List<String> listOfOptions = new ArrayList<>();
        for(WebElement selectOption : selectOptions) {
            listOfOptions.add(selectOption.getText());
        }
        boolean equal = listOfOptions.contains(value);
        Assert.assertTrue("The "+optionLabel+" drop-down should contain " +value, equal);
    }

    public void verifyThatDefaultPreSelectedYearsMaxMinus(String optionLabel, int value) {
        int currentYear = getCurrentYear();
        int expected = currentYear - value;
        String option = body.findElement(By.xpath("//label[contains(text(), '"+optionLabel+"')]/following-sibling::button")).getText();
        Assert.assertEquals("The "+optionLabel+" should default pre-selected " +expected, String.valueOf(expected), option);
    }

    public void verifyThatDefaultPreSelectedYearsMax(String optionLabel) {
        int currentYear = getCurrentYear();
        String option = body.findElement(By.xpath("//label[contains(text(), '"+optionLabel+"')]/following-sibling::button")).getText();
        Assert.assertEquals("The "+optionLabel+" should default pre-selected " +currentYear, String.valueOf(currentYear), option);
    }

    public void verifyThatMinYearIs(String optionLabel, int expected) {
        String option = selectOptions.get(selectOptions.size()-1).getText();
        Assert.assertEquals("The "+optionLabel+" should default pre-selected " +expected, String.valueOf(expected), option);
    }

    public void setsOptionTo(String optionLabel, String value) {
        clickOnOption(optionLabel);
        clicksOnElementByText(value);
    }

    public void verifyThatOptionSelected(String optionLabel, int value) {
        String option = body.findElement(By.xpath("//label[contains(text(), '"+optionLabel+"')]/following-sibling::button")).getText();
        Assert.assertEquals("The "+optionLabel+" should selected " +value, String.valueOf(value), option);
    }

    public void clickShowResultsBtn(){
        showResultsButton.click();
    }

    public void verifyAllSuggestionRowsContains(String text) {
        for (WebElement suggestionRow : suggestionList.findElements(
                By.cssSelector("ul[role=listbox] li div[class*=row]>div[class=col]>span:nth-child(1)"))) {
            Assert.assertTrue(suggestionRow.getText().toLowerCase().contains(text));
        }
    }

    public void veritySuggestionIsNotEmpty(Integer index) {
        Assert.assertFalse(suggestionList.findElements(
                By.cssSelector("ul[role=listbox] li>div[class*=row] div[class*=row]>div[class*='col-auto']"))
                .get(index).getText().isEmpty());
    }

    public void selectSuggestionRow(Integer rowIndex) {
        suggestionList.findElements(By.cssSelector("ul[role=listbox] li div[class*=row]")).get(rowIndex).click();
    }

    public void clickOnLimitsToButton() {
        limitsToggle.click();
    }

    public void userClicksSomewhere() {
        body.click();
    }
}
