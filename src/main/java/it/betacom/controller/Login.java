package it.betacom.controller;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.betacom.dao.implement.UserDaoImpl;
import it.betacom.entitymanagercall.EntityManagerCall;
import it.betacom.model.Psutenti;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		UserDaoImpl ud = new UserDaoImpl();
		
		EntityManager em = EntityManagerCall.getEntityManager();
		TypedQuery<Psutenti> query = em.createQuery(
			    "SELECT u FROM Psutenti u WHERE u.username = :username AND u.password = :password", 
			    Psutenti.class
			);
			query.setParameter("username", username);
			query.setParameter("password", password);
			
			List<Psutenti> users = query.getResultList();
			if (!users.isEmpty()) {
			    Psutenti user = users.get(0);
			    response.sendRedirect("AllUser.jsp");
			    System.out.println("Utente trovato: " + user.getUsername());
			} else {
			    System.out.println("Nessun utente corrispondente trovato");
			}

			em.close();

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
