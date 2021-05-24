package org.springframework.samples.petclinic.model;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.util.HashSet;
import java.util.Set;

public class TestVet {
    Vet vet;
    Specialty spec_1,spec_2,spec_3;
    Set<Specialty> setSpc;

    @BeforeEach
    void setUp(){
        vet=new Vet();
        spec_1=new Specialty();
        spec_2=new Specialty();
        spec_3=new Specialty();
        setSpc= new HashSet<>();
        setSpc.add(spec_1);
        setSpc.add(spec_2);
    }

    @AfterEach
    void tearDown(){
        vet.clearSpecialties();
    }

    @Test
    @DisplayName("Test if HashSet can be created by given a null")
    void getEmptySpecialitiesInternal(){
        vet.setSpecialtiesInternal(null);
        assertEquals(0,vet.getNrOfSpecialties());
    }

    @Test
    @DisplayName("Test if the Set of specialities contains elements")
    void getSpecialitiesInternal(){
        vet.setSpecialtiesInternal(setSpc);
        assertEquals(2, vet.getNrOfSpecialties());
    }

    @Test
    @DisplayName("Test if specialities instances can be added into Set")
    void getSpecialities(){
        vet.addSpecialty(spec_1);
        assertEquals(1,vet.getNrOfSpecialties());
        vet.addSpecialty(spec_2);
        assertEquals(2,vet.getNrOfSpecialties());
        vet.addSpecialty(spec_3);
        assertEquals(3,vet.getNrOfSpecialties());
        Specialty spec_4=new Specialty();
        vet.addSpecialty(spec_4);
        assertEquals(4,vet.getNrOfSpecialties());
    }

    @Test
    @DisplayName("Test if the list containing Set can be created and the elements are sorted")
    void getListOfSpec(){
        spec_3.setName("Dentist");
        spec_2.setName("Health Care");
        spec_1.setName("Surgery");

        vet.addSpecialty(spec_1);
        vet.getSpecialties();
        assertEquals("Surgery",vet.getSpecialties().get(0).toString());

        vet.addSpecialty(spec_2);
        vet.addSpecialty(spec_3);
        vet.getSpecialties();

        // test if elements are auto-sorted
        assertEquals("Dentist",vet.getSpecialties().get(0).toString());
        assertEquals("Health Care",vet.getSpecialties().get(1).toString());
        assertEquals("Surgery",vet.getSpecialties().get(2).toString());
        assertEquals(3,vet.getSpecialties().size());
    }

    @Test
    @DisplayName("Test if the set and the list can be cleaned")
    void cleanSetAndList(){
        spec_1.setName("Dentist");
        spec_2.setName("Health Care");
        spec_3.setName("Surgery");

        vet.addSpecialty(spec_1);
        vet.getSpecialties();
        assertEquals("Dentist",vet.getSpecialties().get(0).toString());

        vet.addSpecialty(spec_2);
        vet.addSpecialty(spec_3);
        vet.getSpecialties();
        assertEquals("Health Care",vet.getSpecialties().get(1).toString());
        assertEquals("Surgery",vet.getSpecialties().get(2).toString());
        assertEquals(3,vet.getSpecialties().size());

        //test Set is cleaned
        vet.clearSpecialties();
        assertEquals(0,vet.getNrOfSpecialties());
        //test List is cleaned
        vet.getSpecialties();
        assertEquals(0,vet.getSpecialties().size());
    }
}
