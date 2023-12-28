package it.betacom.dao.implement;

import java.sql.ResultSet;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import it.betacom.dao.UserDao;
import it.betacom.entitymanagercall.EntityManagerCall;
import it.betacom.model.Psutenti;

public class UserDaoImpl implements UserDao {
	
	@Override
	public List<Psutenti> getAllUser() {
		EntityManager em = EntityManagerCall.getEntityManager();
		try {
			return em.createQuery("select u from Psutenti u", Psutenti.class).getResultList();
		}finally {
			em.close();
		}
	}

	@Override
	public void createUser(Psutenti user) {
		EntityManager em = EntityManagerCall.getEntityManager();
		try {
            em.getTransaction().begin();
            em.persist(user);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            System.out.println("inpossibile creare utente");
        } finally {
            em.close();
        }
	}

	@Override
	public Psutenti readUserById(int id) {
		EntityManager em = EntityManagerCall.getEntityManager();
		try {
			return em.find(Psutenti.class, id);
		}finally {
			em.close();
		}
		
	}
	
	public int readUserByUsername(String username) {
	    EntityManager em = EntityManagerCall.getEntityManager();
	    try {
	    	TypedQuery<Psutenti> query = em.createQuery("SELECT u FROM Psutenti u WHERE u.username LIKE :p", Psutenti.class);
		    query.setParameter("p", username + "%");
		    List<Psutenti> lista = query.getResultList();
		    
		    if(lista.size() > 0) {
		        return lista.size();
		    } else {
		        return 0;
		    }
	    }finally {
	    	em.close();
	    }
	}
	
	@Override
	public void updateUser(Psutenti user) {
		EntityManager em = EntityManagerCall.getEntityManager();
		try {
            em.getTransaction().begin();
            em.merge(user);
            em.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
        } finally {
            em.close();
        }
	}

	@Override
	public void deleteUser(Psutenti user) {
		EntityManager em = EntityManagerCall.getEntityManager();
        try {
            em.getTransaction().begin();
            Psutenti userFromDB = em.find(Psutenti.class, user.getId());
            if (userFromDB != null) {
                em.remove(userFromDB);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
        } finally {
            em.close();
        }
	}

}
