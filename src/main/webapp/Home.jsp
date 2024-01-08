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
<link rel="stylesheet" href="style.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<title>Users</title>
</head>
<%
session.removeAttribute("tentativiRimasti");
String userIdString = session.getAttribute("currentUser").toString();
int userIdInt = Integer.parseInt(userIdString);

%>

<body>

	<nav class="position-fixed fixed-top w-100 bg-primary border-bottom border-white border-2">
		<div
			class="d-flex justify-content-between align-items-center w-100 p-4">
			<div class="w-50 d-flex justify-content-between align-items-center">
				<%
				String nome = (String) session.getAttribute("nome");
				if (nome != null && !nome.isEmpty()) {
					nome = nome.substring(0, 1).toUpperCase() + nome.substring(1);
				}
				%>
				<h4 class="text-white">
					<i class="fa-regular fa-circle-user fs-2 mt-1"></i>
					<%=nome%>
				</h4>
			</div>
			<div>
				<a href="./Logout"
					class="btn border-white border-3 rounded-5 py-0 fw-bold text-white"><i
					class="fa-solid fa-arrow-right-from-bracket text-white me-2"></i>Logout</a>
			</div>
		</div>
	</nav>

	<div class="d-flex justify-content-between">
		<div class="vh-100 bg-primary w-25 d-md-flex flex-column d-none">
			<div class="pt-5 mt-5">
				<a href="./Logout" class="btn fw-bold text-white"> <i
					class="fa-solid fa-arrow-right-from-bracket text-white me-2"></i>Logout
				</a>
			</div>
			<div class="pt-2">
				<form action="./ButtonLogicForUpdate" method="get">
					<input type="hidden" value="<%=userIdInt%>" name="UserId"> 
				    <button class="btn border border-primary" type="submit">
				    <i class="fa-solid fa-pen text-white"></i>
				    <span class="ps-1 fw-bold text-white">Aggiorna i tuoi dati</span>
				    </button>
				</form>
			</div>
			<%
			if (session.getAttribute("ruolo").equals("M")) {
			%>
			<div class="pt-2">
				<form action="./AggungiAnimale.jsp" method="get">
						<input type="hidden" value="<%=userIdInt%>" name="UserId"> 
					<button class="btn border border-primary" type="submit">
						<i class="fa-solid fa-plus text-white"></i><span
							class="ps-1 fw-bold text-white">Aggiungi un animale</span>
					</button>
				</form>
			</div>
			<%}%>
			<div class="pt-2">
				<form action="./AllCustomers.jsp" method="get">
						<input type="hidden" value="<%=userIdInt%>" name="UserId"> 
					<button class="btn border border-primary" type="submit">
						<i class="fa-solid fa-users text-white"></i><span
							class="ps-1 fw-bold text-white">Lista Clienti</span>
					</button>
				</form>
			</div>
			<div class="pt-2">
				<form action="./AnimalList.jsp" method="get">
					<button class="btn border border-primary" type="submit">
						<i class="fa-solid fa-paw text-white"></i><span
							class="ps-1 fw-bold text-white">Lista Animali</span>
					</button>
				</form>
			</div>
		</div>
		<div class="w-100">
			<div class="d-flex justify-content-center table-scrollable mt-5 p-5">
				<table class="table text-center w-md-75 mt-5 ">
					<thead class="rounded-top-4">
						<tr class="bg-white">
							<th scope="col">Id</th>
							<th scope="col">Username</th>
							<th scope="col" class="d-none d-md-table-cell">Email</th>
							<th scope="col">Ruolo</th>
							<th scope="col">Stato</th>
							<%if(session.getAttribute("ruolo").equals("M")){%>
							<th scope="col">Gestisci</th>
							<%} %>
						</tr>
					</thead>
					<%
					UserDaoImpl ud = new UserDaoImpl();
					List<Psutenti> allUsers = ud.getAllUser();
					int index = 0; // Aggiungi un contatore per creare ID univoci
					for (Psutenti user : allUsers) {
						String accordionId = "accordion" + index;
						String headingId = "heading" + index;
					%>
					<tbody>
						<tr
							class="<%=user.getId() == userIdInt ? "userCorrente" : ""%>">
							<td><div
									class="pt-3 <%=user.getId() == userIdInt ? "userCorrente" : ""%>">
									<span><%=user.getId()%></span>
								</div></td>
							<td><div
									class="pt-3 <%=user.getId() == userIdInt ? "userCorrente" : ""%>">
									<span><%=user.getUsername()%></span>
								</div></td>
							<td class="d-none d-md-table-cell "><div
									class="pt-3 <%=user.getId() == userIdInt ? "userCorrente" : ""%>">
									<span><%=user.getEmail()%></span>
								</div></td>
							<td class="text-center ">
								<%
								if (session.getAttribute("ruolo").equals("M")) {
								%>
								
								<div
									class="accordion accordion-flush d-flex justify-content-center align-items-center <%=user.getId() == userIdInt ? "d-none" : ""%>"
									id="<%=accordionId%>">
									<div class="accordion-item">
										<h4 class="accordion-header" id="<%=headingId%>">
											<button
												class="accordion-button collapsed px-2 border rounded-5"
												type="button" data-bs-toggle="collapse"
												data-bs-target="#panelsStayOpen-collapse<%=index%>"
												aria-expanded="false"
												aria-controls="panelsStayOpen-collapse<%=index%>">
												<span class="pe-2"><%=user.getRuolo()%></span>
											</button>
										</h4>
										<div id="panelsStayOpen-collapse<%=index%>"
											class="accordion-collapse collapse"
											aria-labelledby="<%=headingId%>"
											data-bs-parent="#<%=accordionId%>">
											<div class="accordion-body d-flex align-items-center">
												<span class="fw-semibold pe-2">Vuoi cambiare il
													ruolo?</span>
												<form action="./UpdateRole" method="post">
													<input type="hidden" name="userId"
														value="<%=user.getId()%>" /> <input type="hidden"
														name="newRole"
														value="<%=user.getRuolo().equals("G") ? "M" : "G"%>" />
													<button type="submit"
														class="btn btn-light text-white fw-bold bg-success">Y</button>
												</form>
												<button class="btn btn-light text-white fw-bold bg-danger">N</button>
											</div>
										</div>
									</div>
								</div> <%
 }
 %>
								<div
									class="<%=session.getAttribute("ruolo").equals("M") ? "d-none" : " "%>">
									<span><%=user.getRuolo()%></span>
								</div>
							</td>
							<td
								class="<%=user.getStato().equals("A") ? "text-success" : "text-danger"%> ">
								<%
								if (session.getAttribute("ruolo").equals("M")) {
								%>
								<div class="pt-2 <%=user.getId() == userIdInt ? "d-none" : ""%>">
									<form action="./UpdateStato" method="post">
										<input type="hidden" name="userId" value="<%=user.getId()%>" />
										<input type="hidden" name="newState"
											value="<%=user.getStato().equals("A") ? "D" : "A"%>" />
										<button type="submit"
											class="btn btn-light rounded-5 <%=user.getStato().equals("A") ? "text-danger border border-danger" : "btn-success text-success border border-success"%>"><%=user.getStato().equals("A") ? "Blocca" : "Attiva"%></button>
									</form>
								</div> <%
 								} else {
 								%>
								<div
									class="<%=user.getStato().equals("A") ? "text-success" : "text-danger"%>">
									<span><%=user.getStato().equals("A") ? "Attivo" : "Bloccato"%></span>
								</div> <%
 								}
 								%>
							</td>
							<%if(session.getAttribute("ruolo").equals("M")){%>
							<td><div class="pt-3">
									<form action="./ButtonLogicForUpdate" method="get">
									    <input type="hidden" value="<%=user.getId()%>" name="UserId">
									    <button class="btn border border-primary" type="submit"><i class="fa-solid fa-pen text-primary"></i></button>
									</form>
								</div>
							</td>
							<% }%>
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