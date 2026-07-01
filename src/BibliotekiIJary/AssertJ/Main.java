package BibliotekiIJary.AssertJ;
import static org.assertj.core.api.Assertions.*;
public class Main {
    public static void main(String[] args) {
        StudentManager studentManager = new StudentManager();
        studentManager.addStudent(new Student ("Bartosz", "Dobry", 21,4.5));
        studentManager.addStudent(new Student ("Anna", "Kowalska", 20,5.0));
        studentManager.addStudent(new Student ("Piotr", "Miły", 22,3.0));
        try {
            System.out.println("Test na zliczenie liczby studentów");
            assertThat(studentManager.countStudents()).isEqualTo(3);
            System.out.println("Test liczebności studentów przeszedł.");
        }catch (Exception e){
            System.out.println("Błąd");
        }
        {
            System.out.println("Test na dodawanie");
            int result = 2 + 3;
            assertThat(result)
                    .isEqualTo(5);
            System.out.println("Test dodawania przeszedł pomyślnie");
        }
        {
            System.out.println("Test na sprawdzenie imienia studenta");
            assertThat(studentManager.getStudent(0).getFirstName())
                    .isEqualTo("Jan");
        }
        {
            System.out.println("Test na wiek studenta o danym indeksie");
            assertThat(studentManager.getStudent(0).getAge()).isBetween(10, 50).isPositive();
        }
        {
            System.out.println("Test na zawartośc listy studentów");
            assertThat(studentManager.getStudents()).hasSize(3).isNotEmpty();
        }
        {
            System.out.println("Sprawdzenie zgodności listy");
            assertThat(studentManager.getStudents()).contains(studentManager.getStudent(0));
        }
        {
            studentManager.removeStudent(1);
            assertThat(studentManager.countStudents()).isEqualTo(2);
        }
    }
}
