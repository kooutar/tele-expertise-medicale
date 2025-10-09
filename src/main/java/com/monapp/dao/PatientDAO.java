package com.monapp.dao;

import com.monapp.config.JpaUtil;
import com.monapp.model.Patient;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityManager;

public class PatientDAO {
    public  void save(Patient patient){
        EntityManager em= JpaUtil.getEntityManager();
        em.getTransaction().begin();
        try {
           if(patient.getId()==null){
               em.persist(patient);
           }else {
               em.merge(patient);
           }
           em.getTransaction().commit();
        }catch (Exception e){
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }
}
