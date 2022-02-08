package po.sections;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import po.common.BasePage;

import java.lang.invoke.MethodHandles;
import java.util.List;

public class Footer extends BasePage {
    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());

    @FindBy(id = "footer-nonsolus")
    public WebElement elsevierLogo;

    @FindBy(id = "footer-relx")
    public WebElement relxLogo;

    @FindBy(css = "#footer-links ul li")
    public List<WebElement> listOfLinks;

    @FindBy(id = "footer-cookies")
    public WebElement cookiesInfo;

    @FindBy(id = "footer-copyright")
    public WebElement copyrightInfo;

}
