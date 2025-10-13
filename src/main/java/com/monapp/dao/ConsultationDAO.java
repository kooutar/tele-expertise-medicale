package com.monapp.dao;

import com.monapp.config.JpaUtil;
import com.monapp.enums.StatusConsultation;
import com.monapp.model.Consultation;
import jakarta.persistence.EntityManager;

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
       List<Consultation> consultations = em.createQuery(
                       "SELECT c FROM Consultation c WHERE c.status = :status", Consultation.class)
               .setParameter("status", StatusConsultation.ENATTENTE)
               .getResultList();
       return consultations;
   }

   public void AddAvisGenaraliste(StatusConsultation avisGeneraliste, Long idConsulation){

       try {
          em.getTransaction().begin();
          Consultation consultation= em.find(Consultation.class,idConsulation);
          consultation.setStatus(avisGeneraliste);
          em.getTransaction().commit();
       }catch (Exception e){
          em.getTransaction().rollback();
       }



   }


}
