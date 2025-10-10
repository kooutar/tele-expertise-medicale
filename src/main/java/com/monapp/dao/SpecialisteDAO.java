package com.monapp.dao;

import com.monapp.config.JpaUtil;
import com.monapp.model.Specialiste;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.util.ArrayList;

public class SpecialisteDAO {
    private EntityManager em = JpaUtil.getEntityManager();
    public  void save(Specialiste specialiste){

        em.getTransaction().begin();
        try {
            if(specialiste.getId()==null){
                em.persist(specialiste);
            }else {
                em.merge(specialiste);
            }
            em.getTransaction().commit();
        }catch (Exception e){
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public  void delete(Specialiste specialiste){

        try {
            em.getTransaction().begin();
            em.remove(specialiste);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
        }

    }

    public ArrayList<Specialiste> getAllSpecialiste(){
        TypedQuery<Specialiste> specialistes=em.createQuery("select p from Specialiste ",Specialiste.class);
        return (ArrayList<Specialiste>) specialistes;
    }

    public Specialiste getSpecialisteByEmaild(String email){
        return  em.find(Specialiste.class,email);
    }
}
