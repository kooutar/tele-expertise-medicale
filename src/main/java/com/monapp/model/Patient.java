package com.monapp.model;

import com.monapp.enums.Role;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

import java.util.List;

@Entity
@Table(name="patient")
public class Patient extends  Person{
    @OneToMany(mappedBy = "patient" , cascade = CascadeType.ALL)
     private List<SignesVitaux> signesVitauxes ;
    @OneToMany(mappedBy = "patient" , cascade = CascadeType.ALL)
    private  List<Consultation> Consultations;
     public  Patient(){};

    public Patient(String fullName, String email, Role role) {
        super(fullName,email,role);
    }

    // 🔹 Getters & Setters
    public List<SignesVitaux> getSignesVitaux() {
        return signesVitauxes;
    }

    public void setSignesVitaux(List<SignesVitaux> signesVitaux) {
        this.signesVitauxes = signesVitaux;
    }


    public void addSigneVitaux(SignesVitaux signe) {
        signesVitauxes.add(signe);
        signe.setPatient(this);
    }

    // Méthode utilitaire pour supprimer un signe vital
    public void removeSigneVitaux(SignesVitaux signe) {
        signesVitauxes.remove(signe);
        signe.setPatient(null);
    }

    public List<SignesVitaux> getSignesVitauxes() {
        return signesVitauxes;
    }

    public void setSignesVitauxes(List<SignesVitaux> signesVitauxes) {
        this.signesVitauxes = signesVitauxes;
    }

    public List<Consultation> getConsultations() {
        return Consultations;
    }

    public void setConsultations(List<Consultation> consultations) {
        Consultations = consultations;
    }

    @Override
    public String toString() {
        return "Patien{" +
                "id=" + getId() +
                ", nom='" + getNom() + '\'' +
                ", email='" + getEmail() + '\'' +
                ", signesVitaux=" + signesVitauxes.size() +
                '}';
    }

}
