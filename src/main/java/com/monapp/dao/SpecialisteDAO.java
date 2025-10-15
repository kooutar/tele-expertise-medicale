package com.monapp.dao;

import com.monapp.config.JpaUtil;
import com.monapp.model.Specialiste;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.util.ArrayList;
import java.util.List;

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

    public List<Specialiste> getAllSpecialiste(){
        List specialistes=em.createQuery("select s from Specialiste s ",Specialiste.class).getResultList();
        return  specialistes;
    }

    public Specialiste getSpecialisteByEmaild(String email){
        return  em.find(Specialiste.class,email);
    }

    public  Specialiste getSpecialisteById(Long id){
       return em.find(Specialiste.class,id);
    }
}
