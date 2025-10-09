package com.monapp.model;

import com.monapp.enums.Role;
import com.monapp.enums.SpecialiteType;
import jakarta.persistence.*;

@Entity
@Table(name="specialiste")
public class Specialiste extends  Person {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  Long id;
    @Column(nullable = false)
    private double  tarif;
    @Enumerated(EnumType.STRING)
    private SpecialiteType specialiteType;
    public Specialiste(String nom, String email, String password, Role role, double tarif, SpecialiteType specialiteType) {
        super(nom, email, password, role);
        this.tarif=tarif;
        this.specialiteType = specialiteType;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public SpecialiteType getSpecialite() {
        return specialiteType;
    }

    public void setSpecialite(SpecialiteType specialiteType) {
        this.specialiteType = specialiteType;
    }

    public Specialiste() {

    }

    @Override
    public Long getId() {
        return id;
    }



    public double getTarif() {
        return tarif;
    }

    public void setTarif(double tarif) {
        this.tarif = tarif;
    }


}
