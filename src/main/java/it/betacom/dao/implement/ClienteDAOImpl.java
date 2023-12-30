package it.betacom.dao.implement;

import javax.persistence.EntityManager;
import java.util.List;

import it.betacom.dao.ClienteDao;
import it.betacom.entitymanagercall.EntityManagerCall;
import it.betacom.model.Cliente;

public class ClienteDAOImpl implements ClienteDao{

    public List<Cliente> getAllClienti() {
        EntityManager em = EntityManagerCall.getEntityManager();
        try {
            return em.createQuery("SELECT c FROM Cliente c", Cliente.class).getResultList();
        } finally {
            em.close();
        }
    }

    public void createCliente(Cliente cliente) {
        EntityManager em = EntityManagerCall.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(cliente);
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

    public Cliente readClienteById(int id) {
        EntityManager em = EntityManagerCall.getEntityManager();
        try {
            return em.find(Cliente.class, id);
        } finally {
            em.close();
        }
    }

    public void updateCliente(Cliente cliente) {
        EntityManager em = EntityManagerCall.getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(cliente);
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

    public void deleteCliente(Cliente cliente) {
        EntityManager em = EntityManagerCall.getEntityManager();
        try {
            em.getTransaction().begin();
            Cliente clienteFromDB = em.find(Cliente.class, cliente.getIdCliente());
            if (clienteFromDB != null) {
                em.remove(clienteFromDB);
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
