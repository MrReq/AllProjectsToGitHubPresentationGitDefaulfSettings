package BibliotekiIJary.AssertJ;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.AssertionsForClassTypes.within;

public class StudentManagerTest {

    private StudentManager manager;

    @BeforeEach
    void setUp() {

        manager = new StudentManager();

        manager.addStudent(new Student("Jan", "Kowalski", 21, 4.5));
        manager.addStudent(new Student("Anna", "Nowak", 20, 5.0));
        manager.addStudent(new Student("Piotr", "Wiśniewski", 22, 3.5));
    }

    @Test
    void shouldAddThreeStudents() {

        assertThat(manager.countStudents())
                .isEqualTo(3);
    }

    @Test
    void shouldReturnFirstStudent(){
        Student student = manager.getStudent(0);
        assertThat(student.getFirstName()).isEqualTo("Jan");
    }

    @Test
    void shouldContainsStudentNames(){
        assertThat(manager.getStudents())
                .extracting(Student::getFirstName)
                .containsExactly(
                        "Jan","Anna","Piotr"
                );
    }

    @Test
    void shouldRemoveStudent(){
        manager.removeStudent(1);
        assertThat(manager.countStudents()).isEqualTo(2);

        assertThat(manager.getStudents())
                .extracting(Student::getFirstName)
                .containsExactly(
                        "Jan","Piotr"
                );
    }

    @Test
    void shouldFindStudentByLastName() {

        Student student = manager.findStudentByLastName("Nowak");

        assertThat(student)
                .isNotNull();

        assertThat(student.getFirstName())
                .isEqualTo("Anna");

    }

    @Test
    void shouldCalculateAverageGrade(){
        assertThat(manager.getAverageGrade())
                .isCloseTo(4.3333,
                within(0.01));
    }


}