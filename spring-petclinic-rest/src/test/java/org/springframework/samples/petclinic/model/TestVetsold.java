package org.springframework.samples.petclinic.model;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;


public class TestVets {
    Vets vets_inst;
    Vet vet_1,vet_2,vet_3;


    @BeforeEach
    void setUp(){
        vets_inst=new Vets();
    }

    @AfterEach
    void tearDown(){
        vets_inst=null;
        vet_1=null;
        vet_2=null;
        vet_3=null;
    }

    @Test
    @DisplayName("Test if new empty list can be created")
    void emptyList(){
        assertNotNull(vets_inst.getVetList());
        assertEquals(0,vets_inst.getVetList().size());
    }

    @Test
    @DisplayName("Test if vets instances can be added into the Vet List")
    void addVetList(){
        vet_1=new Vet();
        vet_2=new Vet();
        vet_3=new Vet();
        vets_inst.getVetList().add(vet_1);
        vets_inst.getVetList().add(vet_2);
        assertEquals(2,vets_inst.getVetList().size());
        assertNotEquals(3,vets_inst.getVetList().size());
        assertEquals(vet_1, vets_inst.getVetList().get(0));

        vets_inst.getVetList().add(vet_3);
        assertEquals(3,vets_inst.getVetList().size());
        assertEquals(vet_3, vets_inst.getVetList().get(2));
    }
}
