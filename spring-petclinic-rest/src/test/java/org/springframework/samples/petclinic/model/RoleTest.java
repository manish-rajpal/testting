package org.springframework.samples.petclinic.model;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class RoleTest {

    Role  role;

    public RoleTest() { role = new Role();}


    @Test
    void testgetUser() {
        User user = new User();
        user.setUsername("ITHSDistance");
        user.setPassword("admin");
        role.setUser(user);
        User expected = role.getUser();
        User actual = user;
        Assertions.assertEquals(expected,actual);

    }

    @Test
    void testsetUser() {
        User user = new User();
        user.setUsername("ITHSDistance");
        user.setPassword("admin");
        role.setUser(user);
        User expected = role.getUser();
        User actual = user;
        Assertions.assertEquals(expected,actual);

    }

    @Test
    void getName() {
        String name = "pass";
        String expected = "pass";
        role.setName(name);
        String actual = role.getName();
        Assertions.assertEquals(expected, actual);
    }

    @Test
    void setName() {
        String name = "role";
        String expected = "role";
        role.setName(name);
        String actual = role.getName();
        Assertions.assertEquals(expected, actual);

    }
}
