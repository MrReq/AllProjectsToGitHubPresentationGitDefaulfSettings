package BibliotekiIJary.ApachePOI;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        List<Student> students = new ArrayList<>();
        students.add(new Student("Jan", "Kowalski", 4.5));
        students.add(new Student("Anna", "Nowak", 5.0));
        students.add(new Student("Piotr", "Wiśniewski", 3.5));

        Workbook workbook = new XSSFWorkbook();
        workbook.createSheet("sheet number2");
        workbook.cloneSheet(0);
        System.out.println(workbook.getActiveSheetIndex());
        System.out.println(workbook.getFontAt(0).getBold());
        Sheet sheet = workbook.createSheet();
        Row header = sheet.createRow(0);
        header.createCell(0).setCellValue("Imię");
        System.out.println(header.getHeight());
        header.createCell(1).setCellValue("Nazwisko");
        header.createCell(2).setCellValue("Ocena");

        int rowIndex = 1;

        for (Student s : students){
                Row row = sheet.createRow(rowIndex++);
                row.createCell(0).setCellValue(s.getFirstName());
                row.createCell(1).setCellValue(s.getLastName());
                row.createCell(2).setCellValue(s.getGrade());

        }

        FileOutputStream fos = null;
        try {
            Path path = Paths.get("C:\\Users\\HolvePC\\Desktop\\BackUp\\AllProjectsTOGitHubPresentation\\src\\BibliotekiIJary\\ApachePOI\\studenci.xlsx");
            fos = new FileOutputStream(path.toFile());
            workbook.write(fos);
            fos.close();
            workbook.close();
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
