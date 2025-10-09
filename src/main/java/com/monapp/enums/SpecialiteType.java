package com.monapp.enums;

public enum SpecialiteType {
    CARDIOLOGIE("Cardiologie"),
    PNEUMOLOGIE("Pneumologie"),
    NEUROLOGIE("Neurologie"),
    GASTRO_ENTEROLOGIE("Gastro-entérologie"),
    ENDOCRINOLOGIE("Endocrinologie"),
    DERMATOLOGIE("Dermatologie"),
    RHUMATOLOGIE("Rhumatologie"),
    PSYCHIATRIE("Psychiatrie"),
    NEPHROLOGIE("Néphrologie"),
    ORTHOPEDIE("Orthopédie");

    private String libelle;

    // Constructeur privé
    private SpecialiteType(String libelle) {
        this.libelle = libelle;
    }

    // Getter pour récupérer le libellé
    public String getLibelle() {
        return libelle;
    }
}
