package embase.tests.StepDefs;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.assertj.core.api.Assertions;
import po.ResultsPage;
import po.common.SearchPage;
import po.MedicalDeviceSearchPage;

public class MedicalDeviceStepDef {

    MedicalDeviceSearchPage medicalDeviceSearchPage;
    SearchPage searchPage;
    ResultsPage resultsPage;

//    @When("^user clicks on Add device name icon$")
//    public void clickIcon() {
//        medicalDeviceSearchPage.clickAddDeviceIcon();
//
//    }

//    @When("^user clicks on Add device name button$")
//    public void clickAddDeviceBtn() {
//        medicalDeviceSearchPage.AddDeviceNameIcon.click();
//    }

    @And("^user clicks on Add Synonym icon$")
    public void clickAddSynonymIcon() {
        medicalDeviceSearchPage.SynonymsBox.click();
    }

    @Then("^the title on the popup is (.*)$")
    public void checkModalTitle(String titleName) {
        Assertions.assertThat(medicalDeviceSearchPage.verifyModalTitleName()).describedAs("The name of the title on the popup is not correct").contains(titleName);
    }

    @When("^user enters the device name as (.*)$")
    public void enterDeviceName(String deviceName) {
        medicalDeviceSearchPage.enterDeviceName(deviceName);
    }

    @Then("^the Add device name popup is closed$")
    public void addDeviceModalClosed() {
        Assertions.assertThat(medicalDeviceSearchPage.DeviceTagName.isDisplayed()).describedAs("The popup is still visible").isTrue();
    }

    @And("^user waits for synonyms to load$")
    public void synonymsAreLoaded() {
        medicalDeviceSearchPage.waitForSynonymsToLoad();
    }


    @Then("^the general adverse effects popup is closed$")
    public void verifyGeneralEffectsModalClosed() {
        Assertions.assertThat(medicalDeviceSearchPage.DeviceTagName.isDisplayed()).describedAs("The popup is still visible").isTrue();

    }

    @Then("^the device name (.*) is displayed on the form$")
    public void verifyDeviceNameDisplayedOnForm(String deviceName) {
        Assertions.assertThat(medicalDeviceSearchPage.DeviceTagName.getText()).describedAs("The device name displayed is not the same as device name selected").isEqualTo(deviceName);
    }


    @Then("^Medical device search page is opened$")
    public void medicalDevicePageOpened() {
        medicalDeviceSearchPage.shouldBeDisplayed();
    }

    @Then("^the device autosuggestions list is displayed$")
    public void deviceAutosuggestionsListDisplayed() {
        medicalDeviceSearchPage.deviceSuggestionTermsDisplayed();

    }

    @When("^user selects (.*) as the autosuggested device name from the list$")
    public void selectAutosuggestedTerm(String term) {
        medicalDeviceSearchPage.clickAutoSuggestDeviceTerm(term);
    }

    @And("^that Adverse device effect checkbox is selected by default$")
    public void verifyAdverseDeviceEffectChkboxEnabled() {
//        Assertions.assertThat(medicalDeviceSearchPage.AdverseDeviceEffectCheckBox.isChecked()).describedAs("The Adverse DeviceEffect checkbox is not enabled").isTrue();
    }

    @When("^Emtree node (.*) is selected$")
    public void selectEmtreeNode(String nodeTerm) {
        medicalDeviceSearchPage.clickOnEmtreeNode(nodeTerm);

    }

    @And("^Emtree term (.*) is selected$")
    public void selectEmtreeTerm(String emtreeTerm) {
        medicalDeviceSearchPage.clickEmtreeDeviceTerm(emtreeTerm);
    }

    @And("^Emtree child node (.*) is selected$")
    public void selectChildNode(String childNode) {
        medicalDeviceSearchPage.clickEmtreeDeviceChildTerm(childNode);
    }


    @When("^check box (.*) is selected$")
    public void selectClinicalTrial(String text) {
        medicalDeviceSearchPage.clickChckBoxByText(text);
    }

    @When("^user edits the device name$")
    public void clickEditDevice() {
        medicalDeviceSearchPage.clickEditDeviceIcon();
    }

    @When("^user clicks on close icon to remove the device name$")
    public void removeDevice() {
        medicalDeviceSearchPage.clickRemoveDevice();
    }


    @And("^the label (.*) is displayed$")
    public void verifyIconLabelDisplayed(String iconText) {
        medicalDeviceSearchPage.verifyIconLabelIsDisplayed(iconText);
    }

    @Then("^the label (.*) is displayed for general adverse effects$")
    public void verifyGeneralAdverseEffectsLabel(String generalAdverseEffectsLabelName) {
        Assertions.assertThat(medicalDeviceSearchPage.checkTagName(generalAdverseEffectsLabelName)).describedAs("The tag label of adverse effects is not equal to expected").isEqualTo(generalAdverseEffectsLabelName);
    }

    @And("^user clicks on (.*) button at medical device page$")
    public void clickByBtnTxt(String btnText) {
        medicalDeviceSearchPage.clickByBtnText(btnText);
    }

    @And("^synonyms are added successfully$")
    public void validateSynonymsAreAdded() {

        Assertions.assertThat(medicalDeviceSearchPage.SynonymTagName.isDisplayed()).describedAs("Synonyms are not displayed").isTrue();
    }

    @Then("^validate that a list of specific device adverse effects are present$")
    public void verifySpecifAdverseEffectsTagList() {
        Assertions.assertThat(medicalDeviceSearchPage.SpecificDeviceAdverseEffectsList.isDisplayed()).describedAs("DEvice Specific Adverse Effects Not Displayed").isTrue();
    }

    @Then("^the specific device adverse effects popup is closed$")
    public void verifySpecificDeviceTermPopupClosed() {
        Assertions.assertThat(medicalDeviceSearchPage.DeviceTagName.isDisplayed()).describedAs("The popup is still visible").isTrue();

    }

    @Then("^the label (.*) is displayed for device specific adverse effects$")
    public void verifySpecificAdverseEffectsTagName(String specifAdverseEffectsTagName) {
        Assertions.assertThat(medicalDeviceSearchPage.specificAdverseEffectsText.getText()).describedAs("The tag label of adverse effects is not equal to expected").contains(specifAdverseEffectsTagName);
    }


    @When("^user selects the value Humans from the limits dropdown$")
    public void selectValue() {
        medicalDeviceSearchPage.selectHumanFromLimitsDropDown();
    }

    @When("^user selects publication years range from (.*) to (.*)$")
    public void selectPubYearsRange(String startYear, String endYear) {

        medicalDeviceSearchPage.fillPublicationYears(startYear, endYear);
    }

    @When("^user clicks on DateRange picker and selects range from (.*) to (.*)$")
    public void selectDateRange(String startDate, String endDate) {
        medicalDeviceSearchPage.selectDateRange(startDate, endDate);
    }

    @When("^user opens Medical Device search page$")
    public void openMedicalDevice() {
        medicalDeviceSearchPage.open();
    }

    @And("^Show results button is disabled$")
    public void verifyShowResultsDisabled() {
        Assertions.assertThat(medicalDeviceSearchPage.showResultsBtn.isEnabled()).describedAs("ShowResults Button is enabled").isFalse();
    }

    @When("^user clicks on Show Results$")
    public void clickShowResults() {

        medicalDeviceSearchPage.showResultsBtn.click();
    }


    @When("^user clicks on (.*) icon$")
    public void clickIcon(String iconName) {
        medicalDeviceSearchPage.clickIcon(iconName);

    }
}
