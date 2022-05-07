package po;

import net.serenitybdd.core.SerenityReports;
import net.serenitybdd.core.annotations.findby.By;
import net.thucydides.core.annotations.DefaultUrl;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import po.common.BasePage;

import java.util.ArrayList;
import java.util.List;

@DefaultUrl("page:picoSearch.page")
public class PicoSearchPage extends BasePage {

    @FindBy(id = "fragments[0].value")
    public WebElement populationTextBox;

    @FindBy(id = "fragments[1].value")
    public WebElement interventionTextBox;

    @FindBy(id = "fragments[3].value")
    public WebElement outcomeTextBox;

    @FindBy(id = "react-autowhatever-1")
    public WebElement autoSuggestionsBox;

    @FindBy(css = "[title='Change modifier']")
    public WebElement changeModifier;

    @FindBy(css = "[data-testid='show-results-button']")
    public WebElement showResultsBtnPico;

    @FindBy(css = "[data-testid='synonyms-modifier']")
    public WebElement synonymsModifier;

    @FindBy(id = "emtree-term-input")
    public WebElement emtreeTermInput;

    @FindBy(css = "[data-testid='emtree-root']")
    public WebElement emtreeRoot;

    @FindBy(id = "synonyms-editor")
    public WebElement synonymsEditor;

    @FindBy(xpath = "//*[@data-testid='fragments[intervention]']//*[@title='Remove field']")
    public WebElement interventionDeleteIcon;

    @FindBy(xpath = "//*[@data-testid='fragments[comparison]']//*[@title='Remove field']")
    public WebElement comparisonDeleteIcon;

    @FindBy(css = "div[data-testid='emtree-item'].selected")
    public WebElement highlightedNode;

    @FindBy(className = "Form_sidePane__1GMJk")
    public WebElement sidePanelPico;

    @FindBy(xpath = "//*[contains(@class,'CheckBoxSwitcher_checkAll__1CEeS')]//input")
    public WebElement synonymsEditorCheckAllCheckBox;

    @FindBy(xpath = "//*[@id='page-modal']//*[contains(@class,'PageModalContent_scroll__-5XOu')]")
    public WebElement displayFullQueryTextBox;

    @FindBy(css = "[data-testid='default-search-strategy-toggle']")
    public WebElement strategyDropdown;

    @FindBy(className = "tippy-content")
    public WebElement strategyPopover;

    public boolean isAutoSuggestDeviceTerm(String term) {
        boolean flag = false;
        List<WebElement> options = autoSuggestionsBox.findElements(By.cssSelector("ul[role=listbox] li div[class*=row]>div[class=col]>span:nth-child(1)"));
        for (WebElement option : options) {
            if (option.getText().contains(term)) {
                flag = true;
            }
        }
        return flag;
    }

    public void selectAutoSuggestionTermByText(String text) {
        List<WebElement> options = autoSuggestionsBox.findElements(By.xpath("//div[@class='col']"));
        for (WebElement option : options) {
            if (option.getText().contains(text)) {
                option.click();
                break;
            }
        }
    }

    public void selectStrategyByText(String text) {
        List<WebElement> options = strategyPopover.findElements(By.xpath("//span[contains(text(),'" + text + "')]"));
        for (WebElement option : options) {
            if (option.getText().contains(text)) {
                option.click();
                break;
            }
        }
    }


    public List<String> validateAutosuggestionsTerms() {
        List<WebElement> options = autoSuggestionsBox.findElements(By.xpath("//div[@class='col']"));
        List<String> strings = new ArrayList<String>();
        for (WebElement option : options) {
            strings.add(option.getText());

        }
        return strings;
    }

    public List<String> validateSynonymOptions() {
        List<WebElement> options = getDriver().findElements(By.xpath("//li[@class='SelectPopover_option__1oxjc']"));
        List<String> strings = new ArrayList<String>();
        for (WebElement option : options) {
            strings.add(option.getText());

        }
        return strings;
    }

    public String validateTagName(String tagName) {
        WebElement btntext = getDriver().findElement(By.xpath("//*[@data-testid='tag-section']//*[contains(text(),'" + tagName + "')]"));
        return btntext.getText();
    }

    public void clickAddToQueryInEmtreeByText(String text) {
        WebElement ele = emtreeRoot.findElement(By.xpath("//*[contains(text(),'" + text + "')]/parent::*/parent::*//*[@class='actions']//*"));
        System.out.println("Clicked element is" + ele);
        ele.click();
    }

    public boolean isSynonymsCheckBoxesUnselected() {
        boolean flag = false;
        List<WebElement> options = synonymsEditor.findElements(By.xpath("//*[@class='Checkbox-module_input__8n1sr']"));
        for (WebElement option : options) {
            if (option.isSelected()) {
                flag = true;
            }
        }
        return flag;
    }

    public void clickCheckAllSynonymsCheckBox() {
        waitForJStoLoad(10);
        if (synonymsEditor.isDisplayed()) {
//            WebElement ele = synonymsEditor.findElement(By.xpath("//*[@data-testid='synonyms-editor-check-all']"));
            WebElement ele = getDriver().findElement(By.xpath("//span[contains(text(),'Select all synonyms')]"));
            System.out.println("Text is " + ele.getText());
            scrollIntoView();
            ele.click();
        }
    }

    public List<String> validateLabels() {
        waitSomeSeconds(20);
        List<WebElement> labels = getDriver().findElements(By.xpath("//label[contains(@class,'InputBase-module_label__2hdal')]"));
        List<String> labelTexts = new ArrayList<>();
        for (WebElement label : labels) {
            String[] labelValues = label.getText().split("e.g.");
            String labelValue = labelValues[0];
            System.out.println("label value is" + labelValue);
            labelTexts.add(labelValue);
        }
        return labelTexts;

    }

    public String getConcatenatedTagTexts() {
        List<WebElement> tags = getDriver().findElements(By.xpath("//*[@data-testid='fragments[population]']//*[@data-testid='tag-section']"));
        String tagTexts = null;
        for (WebElement tag : tags) {
            tagTexts.concat(tag.getText());
        }
        return tagTexts;
    }

    public void clickEmtreeNodePICO(String text) {
        List<WebElement> items = getDriver().findElements(By.xpath("//*[@class='els-emtree']//*[@data-testid='emtree-term-holder']"));
        for (WebElement emtreeNode : items) {
            if (emtreeNode.getText().equalsIgnoreCase(text)) {
                emtreeNode.click();
                break;
            }
        }

    }

    public void clickAddToQueryPICO(String childTerm) {
        List<WebElement> items = getDriver().findElements(By.xpath("//*[@class='els-emtree']//*[@data-testid='emtree-term-holder']"));
        for (WebElement emtreeNode : items) {
            if (emtreeNode.getText().equalsIgnoreCase(childTerm)) {
                emtreeNode.click();
                System.out.println("click on +");
                emtreeNode.findElement(By.cssSelector(".actions .Icon-module_root__3r_4i")).click();// click the plus option
                break;
            }
        }
    }

    public String getHighlightedNodeValue() {
        String highlightedNode = getDriver().findElement(By.cssSelector("div[data-testid='emtree-item'].selected")).getText();
        return highlightedNode;

    }
}







