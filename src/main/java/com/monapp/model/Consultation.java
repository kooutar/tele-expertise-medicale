package com.monapp.model;

import com.monapp.enums.StatusConsultation;
import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "consultation")
public class Consultation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  Long id;
    @ManyToOne
    @JoinColumn(name="Generaliste_id",nullable = false)
    Generaliste generaliste;
    @ManyToOne
    @JoinColumn(name="patient_id",nullable = false)
    Patient patient;
    @ManyToOne
    @JoinColumn(name = "Specialiste_id",nullable = true)
    Specialiste specialiste;
    @Column(nullable = false)
    String avisGeneraliste;
    @Column(nullable = true)
    String avisSpecialiste;
    @Column(nullable = false)
    double Mountant;
    @Enumerated(EnumType.STRING)
    StatusConsultation status = StatusConsultation.ENATTENTE;
    @Column(nullable = false)
    LocalDateTime dateConsultation;
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "creneau_id")
    private Creneaux creneau;

    public Consultation(Long id, Generaliste generaliste, Patient patient, Specialiste specialiste, String avisGeneraliste, String avisSpecialiste, double mountant, StatusConsultation status, LocalDateTime  dateConsultation) {
        this.id = id;
        this.generaliste = generaliste;
        this.patient = patient;
        this.specialiste = specialiste;
        this.avisGeneraliste = avisGeneraliste;
        this.avisSpecialiste = avisSpecialiste;
        Mountant = mountant;
        this.status = status;
        this.dateConsultation = dateConsultation;
    }

    public Consultation(Generaliste generaliste, Patient patient, String avisGeneraliste, double mountant, StatusConsultation status, LocalDateTime  dateConsultation) {
        this.generaliste = generaliste;
        this.patient = patient;
        this.avisGeneraliste = avisGeneraliste;
        Mountant = mountant;
        this.status = status;
        this.dateConsultation = dateConsultation;
    }

    public Creneaux getCreneau() {
        return creneau;
    }

    public Consultation(Long id, Creneaux creneau, LocalDateTime dateConsultation, StatusConsultation status, double mountant, String avisSpecialiste, String avisGeneraliste, Specialiste specialiste, Patient patient, Generaliste generaliste) {
        this.id = id;
        this.creneau = creneau;
        this.dateConsultation = dateConsultation;
        this.status = status;
        Mountant = mountant;
        this.avisSpecialiste = avisSpecialiste;
        this.avisGeneraliste = avisGeneraliste;
        this.specialiste = specialiste;
        this.patient = patient;
        this.generaliste = generaliste;
    }

    public void setCreneau(Creneaux creneau) {
        this.creneau = creneau;
    }

    public  Consultation(){

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Generaliste getGeneraliste() {
        return generaliste;
    }

    public void setGeneraliste(Generaliste generaliste) {
        this.generaliste = generaliste;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public Specialiste getSpecialiste() {
        return specialiste;
    }

    public void setSpecialiste(Specialiste specialiste) {
        this.specialiste = specialiste;
    }

    public String getAvisGeneraliste() {
        return avisGeneraliste;
    }

    public void setAvisGeneraliste(String avisGeneraliste) {
        this.avisGeneraliste = avisGeneraliste;
    }

    public String getAvisSpecialiste() {
        return avisSpecialiste;
    }

    public void setAvisSpecialiste(String avisSpecialiste) {
        this.avisSpecialiste = avisSpecialiste;
    }

    public double getMountant() {
        return Mountant;
    }

    public void setMountant(double mountant) {
        Mountant = mountant;
    }

    public StatusConsultation getStatus() {
        return status;
    }

    public void setStatus(StatusConsultation status) {
        this.status = status;
    }

    public LocalDateTime  getDateConsultation() {
        return dateConsultation;
    }

    public void setDateConsultation(LocalDateTime  dateConsultation) {
        this.dateConsultation = dateConsultation;
    }
}
