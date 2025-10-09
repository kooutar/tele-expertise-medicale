package com.monapp.config;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JpaUtil {
    private  static  EntityManagerFactory emf;

    static {
        try{
          emf= Persistence.createEntityManagerFactory("monappPU");
        }catch (Exception e){
            throw new ExceptionInInitializerError("Erreur de création EntityManagerFactory : " + e);
        }
    }

    public static EntityManager getEntityManager(){
        return emf.createEntityManager();
    }
}
