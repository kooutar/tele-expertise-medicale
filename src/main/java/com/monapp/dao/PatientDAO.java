package com.monapp.dao;

import com.monapp.config.JpaUtil;
import com.monapp.model.Patient;
import com.monapp.model.Specialiste;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.util.ArrayList;

public class PatientDAO {
    private  EntityManager em =JpaUtil.getEntityManager();
    public  void save(Patient patient){

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

    public  void delete(Patient patient){

        try {
            em.getTransaction().begin();
            em.remove(patient);
            em.getTransaction().commit();
        } catch (Exception e) {
           em.getTransaction().rollback();
        }

    }

    public ArrayList<Patient> getAllPatients(){
        TypedQuery<Patient> specialistes=em.createQuery("select p from Patient ", Patient.class);
        return (ArrayList<Patient>) specialistes;
    }

    public Specialiste getPatientByEmail(String email){
        return  em.find(Specialiste.class,email);
    }
}
