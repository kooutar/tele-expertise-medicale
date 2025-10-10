package com.monapp.dao;

import com.monapp.config.JpaUtil;
import com.monapp.enums.StatusConsultation;
import com.monapp.model.Consultation;
import jakarta.persistence.EntityManager;

import java.util.ArrayList;
import java.util.List;

public class ConsultationDAO {
   private EntityManager em = JpaUtil.getEntityManager();

   public  void delete(Consultation c){
     try {
         em.getTransaction().begin();
         em.remove(c);
         em.getTransaction().commit();
     } catch (Exception e) {
         em.getTransaction().rollback();
     }
   }

   public List<Consultation> getConsultationEnAttente(){
       System.out.println("EntityManager is null? " + (em == null));

       if(em == null) {
           System.out.println("ERREUR: EntityManager est null!");
           return new ArrayList<>();
       }

       List<Consultation> consultations = em.createQuery("SELECT c FROM Consultation c", Consultation.class).getResultList();
       System.out.println("Total consultations: " + consultations.size());
       return consultations;
   }


}
