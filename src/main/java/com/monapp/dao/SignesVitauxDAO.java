package com.monapp.dao;

import com.monapp.config.JpaUtil;
import com.monapp.model.Patient;
import com.monapp.model.SignesVitaux;
import com.monapp.model.Specialiste;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.util.ArrayList;

public class SignesVitauxDAO {
    private EntityManager em = JpaUtil.getEntityManager();
    public  void save(SignesVitaux signesVitaux){

        em.getTransaction().begin();
        try {
            if(signesVitaux.getId()==null){
                em.persist(signesVitaux);
            }else {
                em.merge(signesVitaux);
            }
            em.getTransaction().commit();
        }catch (Exception e){
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public  void delete(SignesVitaux signesVitaux){

        try {
            em.getTransaction().begin();
            em.remove(signesVitaux);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
        }

    }




}
