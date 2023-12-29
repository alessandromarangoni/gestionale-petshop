package it.betacom.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.betacom.dao.implement.UserDaoImpl;
import it.betacom.model.Psutenti;

/**
 * Servlet implementation class UpdateStato
 */
@WebServlet("/UpdateStato")
public class UpdateStato extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStato() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("userId");
		String status = request.getParameter("newState");
		UserDaoImpl ud = new UserDaoImpl();
		int idToInt = Integer.parseInt(id);
		Psutenti user = ud.readUserById(idToInt);
		System.out.println(status);
		user.setStato(status);
		if(status.equals("A")) {
			user.setTentativiAccesso(0);
		}else {
			user.setTentativiAccesso(3);
		}
		ud.updateUser(user);
		response.sendRedirect("./Home.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
