package BibliotekiIJary.AssertJ;
import java.util.ArrayList;
import java.util.*;
public class StudentManager {

    public StudentManager() {
    }

    private final List<Student> students = new ArrayList<>();
    public void addStudent(Student student){
        students.add(student);
    }

    public List<Student> getStudents(){
        return students;
    }

    public int countStudents(){
        return students.size();
    }

    public Student getStudent(int index){
        return students.get(index);
    }

    public void removeStudent(int index){
        students.remove(index);
    }

    public Student findStudentByLastName(String lastName){
        for(Student student : students){
            if(student.getLastName().equals(lastName))
                return student;
        }
        return null;
    }

    public double getAverageGrade(){
        double sum = 0;
        for(Student student : students){
            sum += student.getGrade();
        }
        return sum / students.size();
    }

    public Student getBestStudent(){
        Student bestOne = students.get(0);
        for (Student student : students){
            if (student.getGrade() > bestOne.getGrade())
                bestOne = student;
                return bestOne;
        }
        return null;
    }
}
