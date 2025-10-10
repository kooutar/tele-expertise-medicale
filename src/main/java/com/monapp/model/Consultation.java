package com.monapp.model;

import com.monapp.enums.StatusConsultation;
import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "consultation")
public class Consultation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  long id;
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

    public Consultation(long id, Generaliste generaliste, Patient patient, Specialiste specialiste, String avisGeneraliste, String avisSpecialiste, double mountant, StatusConsultation status, LocalDateTime  dateConsultation) {
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

    public  Consultation(){

    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
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
