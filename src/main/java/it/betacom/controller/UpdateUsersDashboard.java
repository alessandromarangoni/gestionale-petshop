package it.betacom.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.betacom.dao.implement.UserDaoImpl;
import it.betacom.model.Psutenti;

/**
 * Servlet implementation class UpdateUsersDashboard
 */
@WebServlet("/UpdateUsersDashboard")
public class UpdateUsersDashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUsersDashboard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDaoImpl ud = new UserDaoImpl();
		String idString = request.getParameter("UserMId");
		int id = Integer.parseInt(idString);
		Psutenti user = ud.readUserById(id);
		
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		String mail = request.getParameter("mail");
		String dataNascita = request.getParameter("data-nascita");
		String cellulare = request.getParameter("cellulare");
		String username = request.getParameter("username");
		
		user.setNome(nome);
		user.setCognome(cognome);
		user.setEmail(mail);
		user.setCellulare(cellulare);
		user.setUsername(username);
		
		SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
		Date dataParsata = new Date();
		LocalDate dataLocale = null;
			try {
				dataParsata = formato.parse(dataNascita);
				ud.updateUser(user);
				
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
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
