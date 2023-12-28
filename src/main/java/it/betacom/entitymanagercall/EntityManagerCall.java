package it.betacom.entitymanagercall;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class EntityManagerCall {

    private static final EntityManagerFactory emFactory;
    
    static {
        emFactory = Persistence.createEntityManagerFactory("gestionalePetshop");
    }
    
    public static javax.persistence.EntityManager getEntityManager() {
        return (javax.persistence.EntityManager) emFactory.createEntityManager();
    }

    public static void close() {
        if (emFactory != null && emFactory.isOpen()) {
            emFactory.close();
        }
    }
}
