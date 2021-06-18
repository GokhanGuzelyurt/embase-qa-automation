package po;

import net.serenitybdd.core.pages.PageObject;
import net.thucydides.core.annotations.DefaultUrl;
import org.assertj.core.api.Assertions;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.Select;

import java.awt.*;
import java.util.List;

@DefaultUrl("#search")
public class QuickSearchPage extends PageObject {

    @FindBy(id = "showResults")
    public WebElement showResultsButton;

    @FindBy(id = "numberOfResults")
    public WebElement buttonHits;

//    @FindBy(css = ".fragmentView")
//    public UIList<FragmentView, EmbUIElement> searchInputList;
//
//    @FindBy(css = ".fragmentBox.fragmentFields")
//    public UIList<FragmentView, EmbUIElement> fieldCodesList;

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


    public void at(){
        Assertions.assertThat(showResultsButton.isDisplayed()).describedAs("Show Results button is not displayed").isTrue();

    }
}
