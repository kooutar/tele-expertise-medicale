package com.monapp.model;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Date;
import java.util.List;

@Entity
public class Creneaux {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(nullable = false)
    private LocalDate date;
    @Column(nullable = false)
    private LocalTime heure;
    @Column
    private  boolean status=false;

    @OneToMany(mappedBy = "creneau")
    private List<Consultation> consultations;

    public Creneaux(Long id, LocalDate date, LocalTime heure, boolean status) {
        this.id = id;
        this.date = date;
        this.heure = heure;
        this.status = status;
    }

    public Creneaux() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public LocalTime getHeure() {
        return heure;
    }

    public void setHeure(LocalTime heure) {
        this.heure = heure;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Creneaux{" +
                "id=" + id +
                ", date=" + date +
                ", heure=" + heure +
                ", status=" + status +
                '}';
    }
}
