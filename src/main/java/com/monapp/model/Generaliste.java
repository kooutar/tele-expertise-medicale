package com.monapp.model;

import com.monapp.enums.Role;
import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
public class Generaliste extends  Person {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  long id;
    @OneToMany(mappedBy = "generaliste" , cascade = CascadeType.ALL)
    List<Consultation> consultations;

    public Generaliste(String fullName, String email, String password, Role role) {
        super(fullName,email,password,role);
    }
    public  Generaliste(){

    }



    @Override
    public Long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public List<Consultation> getConsultations() {
        return consultations;
    }

    public void setConsultations(List<Consultation> consultations) {
        this.consultations = consultations;
    }

    public  void addConsultation(Consultation consultation){
        consultations.add(consultation);
    }
}
