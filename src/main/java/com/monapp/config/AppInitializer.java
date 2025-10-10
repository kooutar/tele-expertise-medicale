package com.monapp.config;

import com.monapp.model.Generaliste;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

public class AppInitializer implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        EntityManager em = JpaUtil.getEntityManager();
        Generaliste generaliste = em.createQuery("SELECT g FROM Generaliste g", Generaliste.class)
                .setMaxResults(1)
                .getSingleResult();
        sce.getServletContext().setAttribute("generaliste", generaliste);
    }
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
