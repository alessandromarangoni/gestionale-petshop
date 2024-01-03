package it.betacom.dao.implement;

import java.util.List;

import javax.persistence.EntityManager;

import it.betacom.dao.AnimaliDao;
import it.betacom.entitymanagercall.EntityManagerCall;
import it.betacom.model.Animale;

public class AnimaliDaoImpl implements AnimaliDao {

	public List<Animale> getAllAnimali() {
        EntityManager em = EntityManagerCall.getEntityManager();
        try {
            return em.createQuery("SELECT a FROM Animale a", Animale.class).getResultList();
        } finally {
            em.close();
        }
    }
	
	public List<Animale> getAllSellableAnimali() {
        EntityManager em = EntityManagerCall.getEntityManager();
        try {
            return em.createQuery("SELECT a FROM Animale a LEFT JOIN a.cliente c WHERE c.idCliente IS NULL", Animale.class).getResultList();
        } finally {
            em.close();
        }
    }

    public void createAnimale(Animale animale) {
        EntityManager em = EntityManagerCall.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(animale);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    public Animale readAnimaleByMatricola(int matricola) {
        EntityManager em = EntityManagerCall.getEntityManager();
        try {
            return em.find(Animale.class, matricola);
        } finally {
            em.close();
        }
    }

    public void updateAnimale(Animale animale) {
        EntityManager em = EntityManagerCall.getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(animale);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    public void deleteAnimale(Animale animale) {
        EntityManager em = EntityManagerCall.getEntityManager();
        try {
            em.getTransaction().begin();
            Animale animaleFromDB = em.find(Animale.class, animale.getMatricola());
            if (animaleFromDB != null) {
                em.remove(animaleFromDB);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

}
