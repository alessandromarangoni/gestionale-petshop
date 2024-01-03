<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="it.betacom.dao.implement.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.stream.Collectors"%>
<%@ page import="java.util.Comparator"%>
<%@ page import="java.util.Date"%>
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
<title>clientes</title>
</head>
<%
String userIdString = session.getAttribute("currentUser").toString();
int clienteIdInt = Integer.parseInt(userIdString);
%>

<body>

	<nav
		class="position-fixed fixed-top w-100 bg-primary border-bottom border-white border-2">
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
				<a href="./Home.jsp" class="btn fw-bold text-white"> <i
					class="fa-solid fa-home text-white me-2"></i>Home
				</a>
			</div>
			<div class="pt-2">
				<form action="./ButtonLogicForUpdate" method="get">
					<button class="btn border border-primary" type="submit">
						<i class="fa-solid fa-pen text-white"></i><span
							class="ps-1 fw-bold text-white">Aggiorna i tuoi dati</span>
					</button>
				</form>
			</div>
			<%
			if (session.getAttribute("ruolo").equals("M")) {
			%>
			<div class="pt-2">
				<form action="./AggungiAnimale.jsp" method="get">
					<button class="btn border border-primary" type="submit">
						<i class="fa-solid fa-plus text-white"></i><span
							class="ps-1 fw-bold text-white">Aggiungi un animale</span>
					</button>
				</form>
			</div>
			<%
			}
			%>
			<div class="pt-2">
				<form action="./AnimalList.jsp" method="get">
					<button class="btn border border-primary" type="submit">
						<i class="fa-solid fa-paw text-white"></i><span
							class="ps-1 fw-bold text-white">Lista Animali</span>
					</button>
				</form>
			</div>
			<div class="pt-2">
				<a href="./Logout" class="btn fw-bold text-white"> <i
					class="fa-solid fa-arrow-right-from-bracket text-white me-2"></i>Logout
				</a>
			</div>
		</div>
		<div class="w-100">
			<div class="d-flex justify-content-center table-scrollable mt-5 p-5">
				<table class="table text-center w-md-75 mt-5 ">
					<thead class="rounded-top-4">
						<tr class="bg-white">
							<th scope="col">Id</th>
							<th scope="col">nome</th>
							<th scope="col" class="d-none d-md-table-cell">cognome</th>
							<th scope="col">telefono</th>
							<th scope="col">Indirizzo</th>
							<%
							if (session.getAttribute("ruolo").equals("M")) {
							%>
							<th scope="col">Acquisti</th>
							<%
							}
							%>
						</tr>
					</thead>
					<%
					ClienteDAOImpl cd = new ClienteDAOImpl();
					List<Cliente> allCustomer = cd.getAllClienti();
					int index = 0; 
					for (Cliente cliente : allCustomer) {
						 String accordionId = "accordion" + index;
						    String headingId = "heading" + index;
						    String collapseId = "collapse" + index;
					%>
					<tbody>
						<tr>
							<td>
								<div class="pt-3">
									<span><%=cliente.getIdCliente()%></span>
								</div>
							</td>
							<td><div class="pt-3 ">
									<span><%=cliente.getNome()%></span>
								</div></td>
							<td class="d-none d-md-table-cell "><div class="pt-3">
									<span><%=cliente.getCognome()%></span>
								</div></td>
							<td class="text-center">
								<div class="pt-3">
									<span><%=cliente.getTelefono()%></span>
								</div>
							</td>
							<td class="text-center">
								<div class="pt-3">
									<span><%=cliente.getIndirizzo()%></span>
								</div>
							</td>
							<td class="">
								<%
            if (session.getAttribute("ruolo").equals("M")) {
            %>
								<div
									class="pt-2 <%=cliente.getIdCliente() == clienteIdInt ? "d-none" : ""%>">
									<div class="accordion" id="<%=accordionId%>">
										<div class="accordion-item">
											<h2 class="accordion-header" id="<%=headingId%>">
												<button class="accordion-button collapsed" type="button"
													data-bs-toggle="collapse" data-bs-target="#<%=collapseId%>"
													aria-expanded="false" aria-controls="<%=collapseId%>">
													Lista</button>
											</h2>
											<div id="<%=collapseId%>" class="accordion-collapse collapse"
												aria-labelledby="<%=headingId%>"
												data-bs-parent="#<%=accordionId%>">
												<div class="accordion-body">
													<% Set<Animale> acquisti = cliente.getAnimali();
                                for (Animale acquisto : acquisti) { %>
													<div>
														<span><%=acquisto.getNomeAnimale() %></span>
														<span><%=acquisto.getPrezzo() %></span>
														<span><%=acquisto.getDataAcquisto() %></span>
													</div>
													<% } %>
												</div>
											</div>
										</div>
									</div>
								</div> <%
            } else {
                // ...
            }
            %>
							</td>
						</tr>
						<%
						index++; 
						}
						%>
					</tbody>

				</table>
			</div>
		</div>
	</div>
</body>
</html>