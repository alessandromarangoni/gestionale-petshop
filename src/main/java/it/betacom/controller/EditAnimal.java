package it.betacom.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.betacom.dao.implement.AnimaliDaoImpl;
import it.betacom.model.Animale;

/**
 * Servlet implementation class EditAnimal
 */
@WebServlet("/EditAnimal")
public class EditAnimal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditAnimal() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AnimaliDaoImpl ad = new AnimaliDaoImpl();
		
		if(request.getParameter("delete") != null && request.getParameter("delete").equalsIgnoreCase("1")) {
			
			int matricolaInt = Integer.parseInt(request.getParameter("matricola"));
			
			Animale animale = ad.readAnimaleByMatricola(matricolaInt);
			ad.deleteAnimale(animale);
			response.sendRedirect("./AnimalList.jsp");
		}else if(request.getParameter("delete") == null){
			int matricolaInt = Integer.parseInt(request.getParameter("matricola"));
			Animale animale = ad.readAnimaleByMatricola(matricolaInt);
			request.getSession().setAttribute("animale", animale);
			response.sendRedirect("./UpdateAnimali.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
