<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="it.betacom.dao.implement.UserDaoImpl"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="it.betacom.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<title>Users</title>
</head>
<%session.removeAttribute("tentativiRimasti"); %>
<body>

	<nav class="position-fixed fixed-top w-100 bg-warning">
		<div class="d-flex justifuy-content-between p-4">
			<div>
				<%String nome = (String) session.getAttribute("nome");
				if (nome != null && !nome.isEmpty()) {
			        nome = nome.substring(0, 1).toUpperCase() + nome.substring(1);
			    }
				%>
				<h4>
					Welcome
					<%=nome %>
				</h4>
			</div>
			<div></div>
		</div>
	</nav>

	<div class="d-flex justify-content-between">
		<div class="vh-100 bg-primary w-25 d-md-flex d-none pt-5 mt-5">g</div>
		<div class="bg-secondary w-100">
			<div class="d-flex justify-content-center mt-5 p-5">
				<table class="table text-center w-md-75">
					<thead class="rounded-top-4">
						<tr class="bg-white">
							<th scope="col">Id</th>
							<th scope="col">Username</th>
							<th scope="col" class="d-none d-md-table-cell">Email</th>
							<th scope="col">Ruolo</th>
							<th scope="col">Stato</th>
						</tr>
					</thead>
					<%
    UserDaoImpl ud = new UserDaoImpl();
    List<Psutenti> allUsers = ud.getAllUser();
    int index = 0; // Aggiungi un contatore per creare ID univoci
    for (Psutenti user : allUsers) {
        String accordionId = "accordion" + index; // ID unico per ogni accordion
        String headingId = "heading" + index; // ID unico per ogni header dell'accordion
				%>
					<tbody>
						<tr class="">
							<td><%= user.getId() %></td>
							<td><%= user.getUsername() %></td>
							<td class="d-none d-md-table-cell"><%= user.getEmail() %></td>
							<td>
								<div class="<%=  session.getAttribute("ruolo").equals("G") ? "d-none" : "accordion accordion-flush "  %>" id="<%= accordionId %>">
									<div class="accordion-item">
										<h4 class="accordion-header" id="<%= headingId %>">
											<button class="accordion-button collapsed" type="button"
												data-bs-toggle="collapse"
												data-bs-target="#panelsStayOpen-collapse<%= index %>"
												aria-expanded="false"
												aria-controls="panelsStayOpen-collapse<%= index %>">
												<%= user.getRuolo() %>
											</button>
										</h4>
										<div id="panelsStayOpen-collapse<%= index %>"
											class="accordion-collapse collapse"
											aria-labelledby="<%= headingId %>"
											data-bs-parent="#<%= accordionId %>">
											<div class="accordion-body d-flex align-items-center">
											    <span class="fw-semibold pe-2">Vuoi cambiare il ruolo?</span>
											    <form action="./UpdateRole" method="post">
											        <input type="hidden" name="userId" value="<%= user.getId() %>" />
											        <input type="hidden" name="newRole" value="<%= user.getRuolo().equals("G") ? "M" : "G" %>" />
											        <button type="submit" class="btn btn-light text-white fw-bold bg-success">Y</button>
											    </form>
											    <button class="btn btn-light text-white fw-bold bg-danger">N</button>
											</div>
										</div> 
									</div>
								</div>
								
								<div class="<%=  session.getAttribute("ruolo").equals("M") ? "d-none" : " "  %>">
									<span><%=user.getRuolo()%></span>
								</div>
							</td>
							<td class="<%= user.getStato().equals("A") ? "text-success" : "text-danger" %>">
							    <div class="<%=  session.getAttribute("ruolo").equals("G") ? "d-none" : " "  %>">
							        <form action="./UpdateStato" method="post">
							            <input type="hidden" name="userId" value="<%= user.getId() %>" />
							            <input type="hidden" name="newState" value="<%= user.getStato().equals("A") ? "D" : "A" %>" />
							            <button type="submit" class="btn btn-light rounded-5 <%= user.getStato().equals("A") ? "text-danger border border-danger" : "btn-success text-success border border-success" %>"><%= user.getStato().equals("A") ? "Blocca" : "Attiva" %></button>
							        </form>
							    </div>
							    
							</td>

						</tr>
						<%
				   index++; // Incrementa il contatore dopo ogni iterazione
				   }
				%>
					</tbody>

				</table>
			</div>
		</div>
	</div>
</body>
</html>