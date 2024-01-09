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
 * Servlet implementation class UpdateAnimal
 */
@WebServlet("/UpdateAnimal")
public class UpdateAnimal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAnimal() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AnimaliDaoImpl ad = new AnimaliDaoImpl();
		
		String nomeAnimale = request.getParameter("nome-animale");
		String tipoAnimale = request.getParameter("tipo-animale");
		String prezzoStringa = request.getParameter("prezzo");
		String matricolaString = request.getParameter("matricola");
		
		int matricola = Integer.parseInt(matricolaString);
		
		double prezzo = Double.parseDouble(prezzoStringa);
		
		Animale animale = ad.readAnimaleByMatricola(matricola);
		
		animale.setTipoAnimale(tipoAnimale);
		animale.setPrezzo(prezzo);
		animale.setNomeAnimale(nomeAnimale);
		
		ad.updateAnimale(animale);
		
		response.sendRedirect("./AnimalList.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
