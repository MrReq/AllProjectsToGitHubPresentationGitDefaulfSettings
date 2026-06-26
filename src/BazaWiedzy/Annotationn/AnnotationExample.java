//package BazaWiedzy.Annotationn;
//import com.mysql.cj.x.protobuf.MysqlxCrud;
//import lombok.*;
//import org.junit.jupiter.api.BeforeAll;
//import org.junit.jupiter.api.BeforeEach;
//import org.junit.jupiter.api.Test;
//
//import java.beans.Transient;
//import java.io.*;
//import java.lang.annotation.*;
//import java.util.*;
//import java.time.*;
//import java.nio.*;
//import java.awt.*;
//import java.util.List;
//
//public @interface AnnotationExample {
//}
//class Animal {
//    public void makeSound() {
//        System.out.println("...");
//    }
//}
//
//class Dog extends Animal {
//
//    @Override
//    public void makeSound() {
//        System.out.println("Woof!");
//    }
//}
//
// class Calculator {
//
//    @Deprecated
//    public void oldMethod() {
//        System.out.println("Old method");
//    }
//
//    public void newMethod() {
//        System.out.println("New method");
//    }
//}
//
//@SuppressWarnings("unchecked")
// class Example {
//
//    public void test() {
//
//        ArrayList list = new ArrayList();
//
//    }
//
//}
//@FunctionalInterface
//interface Calculator2 {
//
//    int add(int a, int b);
//
//}
//
//public @interface Author {
//}
//
//@Author
// class Person {
//}
//
//public @interface Author2 {
//
//    String name();
//
//}
//
//public @interface Project {
//
//    String author();
//
//    int version();
//
//}
//
//@Project(
//        author = "Marcin",
//        version = 3
//)
// class App {
//}
//
//public @interface Author3 {
//
//    String name() default "Unknown";
//
//}
//
//@Target(ElementType.METHOD)
//public @interface MyMethodAnnotation {
//}
//
//@Retention(RetentionPolicy.RUNTIME)
//public @interface Author4 {
//}
//
//@Documented
//public @interface Author5 {
//}
//
//@Inherited
//public @interface Entity {
//}
//
//@Component
// class UserService {
//
//}
//
//@Service
// class ProductService {
//
//}
//
//@Controller
// class HomeController {
//
//}
//
//@RestController
// class ApiController {
//
//}
//
//@Service
// class UserService {
//
//}
//
//@RestController
// class UserController {
//
//    @Autowired
//    private UserService service;
//
//}
//
//@Value("${server.port}")
//private int port;
//
//
//@Entity
// class Person {
//
//}
//
//@Entity
//@Table(name = "PERSONS")
// class Person {
//
//}
//
//
//@Id
//private Long id;
//
//@Id
//@GeneratedValue
//private Long id;
//
//@Column(name = "FIRST_NAME")
//private String firstName;
//
//@Transient
//private int age;
//
//
//@OneToMany
//private List<Order> orders;
//
//@ManyToOne
//private Customer customer;
//
//@OneToOne
//private Passport passport;
//
//@ManyToMany
//private List<Student> students;
//
//@Getter
// class Person {
//
//    private String name;
//
//}
//
//
//@Setter
// class Person {
//
//    private String name;
//
//}
//
//@Data
// class Person {
//
//    private String name;
//    private int age;
//
//}
//
//@Builder
// class Person {
//
//    private String name;
//    private int age;
//
//}
//@NoArgsConstructor
// class Person {
//
//}
//
//@AllArgsConstructor
//class Person {
//
//    private String name;
//    private int age;
//
//}
//
//@RequiredArgsConstructor
// class Person {
//
//    private final String name;
//    private final int age;
//
//}
//@Test
//void shouldAddNumbers() {
//
//    assertEquals(5, 2 + 3);
//
//}
//
//@BeforeEach
//void init() {
//
//    System.out.println("Before test");
//
//}
//@AfterEach
//void clean() {
//
//    System.out.println("After test");
//
//}
//@BeforeAll
//static void start() {
//
//    System.out.println("Start tests");
//
//}
//@AfterAll
//static void finish() {
//
//    System.out.println("Finish tests");
//
//}