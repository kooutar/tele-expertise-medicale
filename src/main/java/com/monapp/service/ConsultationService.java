package com.monapp.service;

import com.monapp.dao.ConsultationDAO;
import com.monapp.model.Consultation;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

public class ConsultationService {

   private ConsultationDAO consultationDAO= new ConsultationDAO();

   public List<Consultation> afficheConsultationCurrante() {


       List<Consultation> consultations = consultationDAO.getConsultationEnAttente()
               .stream()
               .sorted(Comparator.comparing(Consultation::getDateConsultation))
               .collect(Collectors.toList());

       // Affichage dans la console
       consultations.forEach(c -> {
           System.out.println("Consultation ID : " + c.getId());
           System.out.println("Patient : " + (c.getPatient() != null ? c.getPatient().getNom() : "N/A"));
           System.out.println("Généraliste : " + (c.getGeneraliste() != null ? c.getGeneraliste().getNom() : "N/A"));
           System.out.println("Spécialiste : " + (c.getSpecialiste() != null ? c.getSpecialiste().getNom() : "N/A"));
           System.out.println("Montant : " + c.getMountant());
           System.out.println("Statut : " + c.getStatus());
           System.out.println("Date : " + c.getDateConsultation());
           System.out.println("-------------");
       });

       return consultations;
   }

}
