package org.springframework.samples.petclinic.model;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
public class TestPerson {
    Person person;
    public TestPerson() {person = new Person ();}

    @Test
    void testsetFirstName() {
        String firstName = "Manish"; // Test code
        String expected = "Manish"; // Test code
        person.setFirstName(firstName);
        String actual = person.getFirstName(); //cut
        Assertions.assertEquals(expected,actual); // Assertion
    }
    @Test
    void testgetFirstName() {
        String firstName = "Shourya"; // Test code
        String expected = "Shourya"; // Test code
        person.setFirstName(firstName);
        String actual = person.getFirstName(); //cut
        Assertions.assertEquals(expected,actual); // Assertion
    }
    @Test
    void testsetLastName() {
        String lastName = "Rajpal"; // Test code
        String expected = "Rajpal"; // Test code
        person.setLastName(lastName);
        String actual = person.getLastName(); //cut
        Assertions.assertEquals(expected,actual); // Assertion
    }
    @Test
    void testgetLastName() {
        String lastName = "Bondre"; // Test code
        String expected = "Bondre"; // Test code
        person.setLastName(lastName);
        String actual = person.getLastName(); //cut
        Assertions.assertEquals(expected,actual); // Assertion
    }
}
