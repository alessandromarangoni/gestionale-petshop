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
		String accountBloccato = "false";
		int tentativiRimasti = 0;
		String passwordSbagliata = "false";
		UserDaoImpl ud = new UserDaoImpl();

		EntityManager em = EntityManagerCall.getEntityManager();
		TypedQuery<Psutenti> query = em.createQuery(
		    "SELECT u FROM Psutenti u WHERE u.username = :username", 
		    Psutenti.class
		);
		query.setParameter("username", username);

		List<Psutenti> users = query.getResultList();
		if (!users.isEmpty()) {
		    Psutenti user = users.get(0);
		    int userId = user.getId();
		    if (user.getPassword().equals(password)) {
		        // Password corretta
		        if (user.getTentativiAccesso() < 3) {
		            response.sendRedirect("Home.jsp");
		            System.out.println("Utente trovato: " + user.getUsername() + user.getNome());
		            
		            request.getSession().setAttribute("nome", user.getNome());
		            request.getSession().setAttribute("ruolo", user.getRuolo());
		            
		            request.getSession().setAttribute("passwordSbagliata", "false");
		            request.getSession().setAttribute("accountBloccato", "false");
		            request.getSession().setAttribute("currentUser",userId);
		            request.getSession().removeAttribute("tentativiRimasti");
		            user.setTentativiAccesso(0);
		            ud.updateUser(user);
		        } else {
		            // Gestisci l'utente bloccato
		        	accountBloccato = "true";
		        	request.getSession().setAttribute("accountBloccato", accountBloccato);
		            user.setStato("D");
		            ud.updateUser(user);
		            // Invia una risposta appropriata
		            response.sendRedirect("index.jsp");
		        }
		    } else {
		        // Password sbagliata
		        if (user.getTentativiAccesso() < 2) {
		            user.setTentativiAccesso(user.getTentativiAccesso() + 1);
		            ud.updateUser(user);
		            // Invia un messaggio di errore sulla password sbagliata
		            passwordSbagliata = "true";
		            tentativiRimasti = user.getTentativiAccesso();
		            request.getSession().setAttribute("passwordSbagliata", "true");
		            request.getSession().setAttribute("tentativiRimasti", 3 - user.getTentativiAccesso());
		            response.sendRedirect("index.jsp");
		        } else {
		            // Terzo tentativo fallito, blocca l'utente
		            user.setStato("D");
		            user.setTentativiAccesso(user.getTentativiAccesso() + 1);
		            ud.updateUser(user);
		            // Invia un messaggio che l'utente è stato bloccato
		            response.sendRedirect("index.jsp");
		            accountBloccato = "true";
		        	request.getSession().setAttribute("accountBloccato", accountBloccato);
		        }
		    }
		} else {
		    // Utente non trovato
		    // Invia un messaggio di errore sull'username sbagliato
			System.out.println("nessun user trovato");
			response.sendRedirect("index.jsp");
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
