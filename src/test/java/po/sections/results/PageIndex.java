package po.sections.results;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class PageIndex {

    @FindBy(id = "pageSizeSelector")
    public WebElement pageSizeSelector;

    @FindBy(id = "pager")
    public WebElement pagerField;

    @FindBy(id = "pageAmount")
    public WebElement pageAmount;

    @FindBy(id = "go")
    public WebElement goButton;

    @FindBy(id = "goNext")
    public WebElement goNextButton;

    @FindBy(id = "goPrevious")
    public WebElement goPreviousButton;
}
