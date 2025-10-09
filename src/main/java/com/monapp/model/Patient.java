package com.monapp.model;

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
     public  Patient(){};

    // 🔹 Getters & Setters
    public List<SignesVitaux> getSignesVitaux() {
        return signesVitauxes;
    }

    public void setSignesVitaux(List<SignesVitaux> signesVitaux) {
        this.signesVitauxes = signesVitaux;
    }

    // Méthode utilitaire pour ajouter un signe vital au patient
    public void addSigneVitaux(SignesVitaux signe) {
        signesVitauxes.add(signe);
        signe.setPatient(this);
    }

    // Méthode utilitaire pour supprimer un signe vital
    public void removeSigneVitaux(SignesVitaux signe) {
        signesVitauxes.remove(signe);
        signe.setPatient(null);
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
