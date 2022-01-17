package po;

import net.thucydides.core.annotations.DefaultUrl;
import org.assertj.core.api.Assertions;
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

    @FindBy(id = "numberOfResults")
    public WebElement buttonHits;

    @FindBy(css = ".fragmentBox.searchFragmentBox input")
    public List textFieldsList;

    @FindBy(css = ".trashButton")
    public List trashIconsList;

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

    @FindBy(className="fragmentSuggestions")
    public WebElement autosuggestList;


    public void at() {
        Assertions.assertThat(showResultsButton.isDisplayed()).describedAs("Show Results button is not displayed").isTrue();
    }
}
