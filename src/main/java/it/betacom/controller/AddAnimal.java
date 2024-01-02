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
 * Servlet implementation class AddAnimal
 */
@WebServlet(description = "used from gesionalePetshop/AggiungiAnimale.jsp to add an Animal to the sellable list", urlPatterns = { "/AddAnimal" })
public class AddAnimal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAnimal() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tipoAnimale = request.getParameter("tipo-animale");
		String prezzoAnimale = request.getParameter("prezzo");
		String nomeAnimale = request.getParameter("nome-animale");
		
		double prezzoToDouble = Double.parseDouble(prezzoAnimale);
		
		AnimaliDaoImpl ad = new AnimaliDaoImpl();
		
		Animale animale = new Animale(nomeAnimale,prezzoToDouble,tipoAnimale);
		
		ad.createAnimale(animale);
		
		System.out.println("animale creato con successo");
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
