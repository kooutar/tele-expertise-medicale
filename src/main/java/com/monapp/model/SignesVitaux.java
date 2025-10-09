package com.monapp.model;

import jakarta.persistence.*;

@Entity
public class SignesVitaux {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  Long id;
    @Column(nullable = false)
    private  String TensionArterielle;
    @Column(nullable = false)
    private int FrequenceCardiaque;
    @Column(nullable = false)
    private  double TemperatureCorporelle;
    @Column(nullable = false)
    private  int FrequenceRespiratoire;
    @Column
    private double Poids ;
    @Column
    private  double taille ;
    @ManyToOne
    @JoinColumn(name="pastien_id")
    private Patient patient;
    public SignesVitaux(String tensionArterielle, double taille, double poids, int frequenceRespiratoire, double temperatureCorporelle, int frequenceCardiaque,Patient patient) {
        TensionArterielle = tensionArterielle;
        this.taille = taille;
        Poids = poids;
        FrequenceRespiratoire = frequenceRespiratoire;
        TemperatureCorporelle = temperatureCorporelle;
        FrequenceCardiaque = frequenceCardiaque;
        this.patient=patient;
    }

    public SignesVitaux(String tensionArterielle, int frequenceCardiaque, double temperatureCorporelle, int frequenceRespiratoire) {
        TensionArterielle = tensionArterielle;
        FrequenceCardiaque = frequenceCardiaque;
        TemperatureCorporelle = temperatureCorporelle;
        FrequenceRespiratoire = frequenceRespiratoire;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTensionArterielle() {
        return TensionArterielle;
    }

    public void setTensionArterielle(String tensionArterielle) {
        TensionArterielle = tensionArterielle;
    }

    public double getTemperatureCorporelle() {
        return TemperatureCorporelle;
    }

    public void setTemperatureCorporelle(double temperatureCorporelle) {
        TemperatureCorporelle = temperatureCorporelle;
    }

    public int getFrequenceCardiaque() {
        return FrequenceCardiaque;
    }

    public void setFrequenceCardiaque(int frequenceCardiaque) {
        FrequenceCardiaque = frequenceCardiaque;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public double getTaille() {
        return taille;
    }

    public void setTaille(double taille) {
        this.taille = taille;
    }

    public double getPoids() {
        return Poids;
    }

    public void setPoids(double poids) {
        Poids = poids;
    }

    public int getFrequenceRespiratoire() {
        return FrequenceRespiratoire;
    }

    public void setFrequenceRespiratoire(int frequenceRespiratoire) {
        FrequenceRespiratoire = frequenceRespiratoire;
    }
    @Override
    public String toString() {
        return "SigneVitaux{" +
                "id=" + id +
                ", temperature=" + TemperatureCorporelle +
                ", Poids=" + Poids +
                ", tension='" + TensionArterielle + '\'' +
                ", frequenceRespiratoire=" + FrequenceRespiratoire +
                ", taille=" + taille +
                ", patient=" + (patient != null ? patient.getId() : null) +
                '}';
    }
}
