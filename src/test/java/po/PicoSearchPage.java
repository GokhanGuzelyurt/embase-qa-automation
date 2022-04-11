package po;

import net.serenitybdd.core.annotations.findby.By;
import net.thucydides.core.annotations.DefaultUrl;
import org.jruby.RubyProcess;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.yecht.Data;
import po.common.BasePage;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@DefaultUrl("page:picoSearch.page")
public class PicoSearchPage extends BasePage {

    @FindBy(id = "fragments[0].value")
    public WebElement populationTextBox;

    @FindBy(id = "react-autowhatever-1")
    public WebElement autoSuggestionsBox;

    @FindBy(css = "[title='Change modifier']")
    public WebElement changeModifier;


    public boolean isAutoSuggestDeviceTerm(String term) {
        boolean flag = false;
        List<WebElement> options = autoSuggestionsBox.findElements(By.cssSelector("ul[role=listbox] li div[class*=row]>div[class=col]>span:nth-child(1)"));
        for (WebElement option : options) {
            System.out.println("Options are " + option.getText());
            if (option.getText().contains(term)) {
                flag = true;
            }

        }
        return flag;
    }

    public void selectAutoSuggestionTermByText(String text) {
        System.out.println("The text is" + text);
        List<WebElement> options = autoSuggestionsBox.findElements(By.xpath("//div[@class='col']"));
        for (WebElement option : options) {
            if (text.contains(option.getText())) {
                option.click();
            }
//        WebElement lastElement= options.get(options.size()-1);
//        System.out.println("The element is" +lastElement.getText());
//        if(text.contains(lastElement.getText())){
//            lastElement.click();
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

    public String validateTagName(String tagName) {
        WebElement btntext = getDriver().findElement(By.xpath("//span[contains(@class,'Tag-module_text__3dcY0')and contains(text(),'" + tagName + "')]"));
        return btntext.getText();
    }
}
