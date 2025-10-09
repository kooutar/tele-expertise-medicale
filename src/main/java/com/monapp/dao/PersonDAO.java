package com.monapp.dao;

import com.monapp.config.JpaUtil;
import com.monapp.model.Person;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.NoResultException;
import jakarta.persistence.Persistence;

import java.util.Optional;


public class PersonDAO {


    public void save(Person person) {
        EntityManager em = JpaUtil.getEntityManager();
        em.getTransaction().begin();

        try {
            if (person.getId() == null) {
                // Nouvelle entité → persist
                em.persist(person);

            } else {
                // Entité existante ou détachée → merge
                em.merge(person);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    public Person FinByEmail(String email){
        System.out.println("email recherche "+ email);
        EntityManager emf = JpaUtil.getEntityManager();
        try {
        Person person=  emf.createQuery("select p from Person  p where p.email = :email ",Person.class)
                  .setParameter("email",email)
                  .getSingleResult();
           return person;
        }catch (NoResultException e){
         return   null;
        }

    }


}
