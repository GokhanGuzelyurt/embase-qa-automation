package po;

import net.serenitybdd.core.pages.PageObject;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;
import org.junit.Assert;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class DownloadPage extends PageObject {
    @FindBy(css = "[class*='basebutton']")
    public WebElement baseButton;

    public void userClicksOnDownloadButtonOnExportPage() {
        baseButton.click();
    }

    public void checksDownloadedDocumentContains(String fileName, String value) {
//        String fileData = FileHelper.readFile(fileName);
//        System.out.println(fileData);
//        Assert.assertTrue("File "+fileName+" does not contain value "+value, fileData.contains(value));
        String fileData = null;
        try {
            fileData = readXLS(fileName);
        } catch (IOException e) {
            e.printStackTrace();
        }
        assert fileData != null;
        Assert.assertTrue("File "+fileName+" does not contain value "+value, fileData.contains(value));
    }

    public static String readXLS(String fileName) throws IOException {
        FileInputStream fis=new FileInputStream("src/test/resources/" + fileName);
        HSSFWorkbook wb=new HSSFWorkbook(fis);
        HSSFSheet sheet=wb.getSheetAt(0);

        List fileData = new ArrayList<>();
        FormulaEvaluator formulaEvaluator=wb.getCreationHelper().createFormulaEvaluator();
        for(Row row: sheet) {
            for(Cell cell: row) {
                switch (formulaEvaluator.evaluateInCell(cell).getCellType()) {
                    case NUMERIC:
                        fileData.add(cell.getNumericCellValue());
                        break;
                    case STRING:
                        fileData.add(cell.getStringCellValue());
                        break;
                }
            }
        }
        return String.valueOf(fileData);
    }
}
