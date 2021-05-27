package org.springframework.samples.petclinic.model;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class BaseEntityTest {

    BaseEntity base;

    public BaseEntityTest() {
        base = new BaseEntity();
    }

    @Test
    void testsetId() {
        int id = 101; // Test code
        int expected = 101; // Test code
        base.setId(id);
        int actual = base.getId(); //cut
        Assertions.assertEquals(expected, actual); // Assertion
    }

    @Test
    void testgetId() {
        int id = 111; // Test code
        int expected = 111; // Test code
        base.setId(id);
        int actual = base.getId(); //cut
        Assertions.assertEquals(expected, actual); // Assertion
    }

    @Test
    void testisNew() {
        int id = 100;
        boolean expected = false;
        base.setId(id);
        boolean actual = base.isNew();
        Assertions.assertEquals(expected, actual); // Assertion

    }
}










