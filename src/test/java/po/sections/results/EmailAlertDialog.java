package po.sections.results;

import net.serenitybdd.core.pages.WebElementFacade;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.webelements.Checkbox;
import org.assertj.core.api.Assertions;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import po.common.BasePage;

import java.lang.invoke.MethodHandles;

public class EmailAlertDialog extends BasePage {

    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());

    @FindBy(id = "email_title")
    public WebElementFacade emailTitle;

    @FindBy(id = "email_address")
    public WebElementFacade emailAddress;

    @FindBy(css = "[for='includeAip']")
    public WebElement includeAipCheckbox;

    @FindBy(css = "[for='includePreprints']")
    public WebElement includePreprintsCheckbox;

    @FindBy(id = "modalConfirmControl")
    public WebElement confirmSetEmailAlertButton;

    @FindBy(css = "[data-action='feedbackMessage']")
    public WebElementFacade feedbackMessage;

    // TODO change emailFormat , EmailContent, freqPeriod , dayOfWeek  to Enum
    @Step
    public void saveEmailAlert(String emailTitle, String emailAddress, boolean isIncludeArticles, boolean isIncludePreprints) {
        logger.info("Set email alert with specified values");

        logger.info("Enter email title: " + emailTitle);
        this.emailTitle.clear();
        this.emailTitle.sendKeys(emailTitle);

        logger.info("Enter email address: " + emailAddress);
        this.emailAddress.clear();
        this.emailAddress.sendKeys(emailAddress);

        logger.info("Set checkbox Articles In Press: " + isIncludeArticles);
        if(!isIncludeArticles)
            includeAipCheckbox.click();

        logger.info("Set checkbox Preprints: " + isIncludePreprints);
        if(!isIncludePreprints)
            includePreprintsCheckbox.click();

        confirmSetEmailAlertButton.click();

        logger.info("Verify if the alert is set");
        feedbackMessage.waitUntilVisible();
        Assertions.assertThat(feedbackMessage.getText()).describedAs("ERROR").isEqualTo("Your search is set as email alert.");
    }
}
