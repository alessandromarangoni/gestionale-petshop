package it.betacom.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.betacom.dao.implement.UserDaoImpl;
import it.betacom.model.Psutenti;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserDaoImpl ud = new UserDaoImpl();
		
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		String mail = request.getParameter("mail");
		String dataNascita = request.getParameter("data-nascita");
		String cellulare = request.getParameter("cellulare");
		String password = request.getParameter("password");
		
		String nomeCutted = nome.substring(0,2);
		String cognomeCutted = cognome.substring(0,2);
		
		SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
		Date dataParsata = new Date();
		LocalDate dataLocale = null;
		int anno = 0;
			try {
				dataParsata = formato.parse(dataNascita);
				dataLocale = dataParsata.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
			    anno = dataLocale.getYear();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		String username = nomeCutted + cognomeCutted + anno;
		
		if(ud.readUserByUsername(username) > 0) {
			username = username + "_" + (ud.readUserByUsername(username)+1);
		}
		
		Psutenti user = new Psutenti(cellulare,cognome,dataParsata,mail,nome,password,username);
		ud.createUser(user);
		
		request.getSession().setAttribute("registrato", "true");
		response.sendRedirect("index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
