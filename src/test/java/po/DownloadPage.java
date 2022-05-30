package po;

import net.serenitybdd.core.pages.PageObject;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.junit.Assert;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.w3c.dom.Document;
import utils.FileHelper;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import static embase.tests.StepDefs.CommonSteps.testCaseVariables;

public class DownloadPage extends PageObject {
    private static String BASE_RESOURCES_PATH = "/src/test/resources/";

    @FindBy(css = "[class*='basebutton']")
    public WebElement baseButton;

    public void userClicksOnDownloadButtonOnExportPage() {
        baseButton.click();
    }

    public void checksDownloadedDocumentContains(String fileName, String text) {
        List fileDataList = new ArrayList<>();
        if (fileName.contains("docx")) {
            fileDataList.add(readDocxFile(fileName));
        }
        if (fileName.contains("xlsx")) {
            fileDataList.add(readXLS(fileName));
        }
        if (fileName.contains("pdf")) {
            fileDataList.add(readPDFFile(fileName));
        }
        if (fileName.contains("xml")) {
            fileDataList.add(readXMLFile(fileName));
        }
        if (fileName.contains("txt") || fileName.contains("csv") || fileName.contains("ris")) {
            fileDataList.add(FileHelper.readFile(fileName));
        }

        String value = text;
        if (testCaseVariables.get(text) != null) {
            value = testCaseVariables.get(text);
        }
        String fileData = fileDataList.toString().replace("\n", " ").replace("\r", " ").replace("  ", " ");
        Assert.assertTrue("File "+fileName+" does not contain value "+value, fileData.contains(value));
    }

    public static List readXLS(String fileName) {
        List fileDataList = new ArrayList<>();
        try {
            FileInputStream fis = new FileInputStream(BASE_RESOURCES_PATH + fileName);
            XSSFWorkbook wb = new XSSFWorkbook(fis);
            XSSFSheet sheet = wb.getSheetAt(0);

            FormulaEvaluator formulaEvaluator = wb.getCreationHelper().createFormulaEvaluator();
            for (Row row : sheet) {
                for (Cell cell : row) {
                    switch (formulaEvaluator.evaluateInCell(cell).getCellType()) {
                        case NUMERIC:
                            fileDataList.add(cell.getNumericCellValue());
                            break;
                        case STRING:
                            fileDataList.add(cell.getStringCellValue());
                            break;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return fileDataList;
    }

    public static List readDocxFile(String fileName) {
        List fileDataList = new ArrayList<>();
        try {
            FileInputStream fis = new FileInputStream(BASE_RESOURCES_PATH + fileName);
            XWPFDocument document = new XWPFDocument(fis);
            List<XWPFParagraph> paragraphs = document.getParagraphs();

            for (XWPFParagraph para : paragraphs) {
                fileDataList.add(para.getText());
            }
            fis.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return fileDataList;
    }

    private String readPDFFile(String fileName) {
        String fileData = "";
        try {
            PDDocument document = PDDocument.load(new File(BASE_RESOURCES_PATH + fileName));
            if (!document.isEncrypted()) {
                PDFTextStripper stripper = new PDFTextStripper();
                fileData = stripper.getText(document);
            }
            document.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return fileData;
    }

    private String readXMLFile(String fileName) {
        String fileDataList = "";
        try {
            File file = new File(BASE_RESOURCES_PATH + fileName);
            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
            DocumentBuilder db = dbf.newDocumentBuilder();
            Document doc = db.parse(file);
            fileDataList = doc.getDocumentElement().getTextContent();
            return fileDataList;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return fileDataList;
    }
}
