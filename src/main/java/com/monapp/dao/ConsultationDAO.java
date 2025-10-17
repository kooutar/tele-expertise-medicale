package com.monapp.dao;

import com.monapp.config.JpaUtil;
import com.monapp.enums.StatusConsultation;
import com.monapp.model.Consultation;
import jakarta.persistence.EntityManager;

import java.util.Arrays;
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

   public void save(Consultation c){
       try {
           if(c.getId()!=null){
               em.getTransaction().begin();
               em.merge(c);
               em.getTransaction().commit();
           }else {
              em.getTransaction().begin();
              em.persist(c);
              em.getTransaction().commit();
           }

       }catch (Exception e){
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
   public Consultation  getConsulationById(Long id){
       Consultation c=null;
       try {
          c= em.createQuery("select c from Consultation c where c.id= :id",Consultation.class).setParameter("id",id).getSingleResult();
       } catch (Exception e) {
           throw new RuntimeException(e);
       }
       return  c;
   }

    public List<Consultation> getConsultationSpecailiste(Long specialiste_id) {
   return em.createQuery("select c From Consultation c where c.specialiste.id= :Specialiste_id",Consultation.class).setParameter("Specialiste_id",specialiste_id).getResultList();
    }
}
