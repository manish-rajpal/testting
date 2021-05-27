package org.springframework.samples.petclinic.model;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class NamedEntityTest {
    NamedEntity namedEntity;

    public NamedEntityTest() {
        namedEntity = new NamedEntity();
    }

    @Test
    void getName() {
        String name = "Avanish"; // Test code
        String expected = "Avanish"; // Test code
        namedEntity.setName(name);
        String actual = namedEntity.getName(); //cut
        Assertions.assertEquals(expected, actual); // Assertion
    }


    @Test
    void setName() {
        String name = "Shlok"; // Test code
        String expected ="Shlok"; // Test code
        namedEntity.setName(name);
        String actual = namedEntity.getName(); //cut
        Assertions.assertEquals(expected, actual); // Assertion
    }


    @Test
    void testToString() {
        String name = "Avanish"; // Test code
        String expected = "Avanish"; // Test code
        namedEntity.setName(name);
        String actual = namedEntity.toString();
        Assertions.assertEquals(expected, actual); // Assertion

    }
}
