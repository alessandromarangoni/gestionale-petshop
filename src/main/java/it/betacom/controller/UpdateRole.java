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
 * Servlet implementation class UpdateRole
 */
@WebServlet("/UpdateRole")
public class UpdateRole extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateRole() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String role = request.getParameter("newRole");
		
		int userIdConverted = Integer.parseInt(userId);
		
		UserDaoImpl ud = new UserDaoImpl();
		Psutenti user = ud.readUserById(userIdConverted);
		user.setRuolo(role);
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
