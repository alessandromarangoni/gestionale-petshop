<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="it.betacom.dao.implement.*"%>
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
<title>clientes</title>
</head>
<%
String userIdString = session.getAttribute("currentUser").toString();
int userIdInt = Integer.parseInt(userIdString);
int clienteIdInt = Integer.parseInt(userIdString);
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
				<a href="./Home.jsp" class="btn fw-bold text-white"> <i
					class="fa-solid fa-home text-white me-2"></i>Home
				</a>
			</div>
			<div class="pt-2">
				<form action="./ButtonLogicForUpdate" method="post">
				<input type="hidden" value="<%=userIdInt%>" name="UserId"> 
				    <button class="btn border border-primary" type="submit"><i class="fa-solid fa-pen text-white"></i><span class="ps-1 fw-bold text-white">Aggiorna i tuoi dati</span></button>
				</form>
			</div>
			<%
			if (session.getAttribute("ruolo").equals("M")) {
			%>
			<div class="pt-2">
				<form action="./AggungiAnimale.jsp" method="post">
					<button class="btn border border-primary" type="submit">
						<i class="fa-solid fa-plus text-white"></i><span
							class="ps-1 fw-bold text-white">Aggiungi un animale</span>
					</button>
				</form>
			</div>
			<%}%>
			<div class="pt-2">
				<form action="./AllCustomers.jsp" method="post">
					<button class="btn border border-primary" type="submit">
						<i class="fa-solid fa-users text-white"></i><span
							class="ps-1 fw-bold text-white">Lista Clienti</span>
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
				<div class="d-flex flex-wrap justify-content-evenly table-scrollable mt-5 p-5">
					<%
					AnimaliDaoImpl ad = new AnimaliDaoImpl();
					List<Animale> animali = ad.getAllSellableAnimali();
					for(Animale animale : animali){
					%>
					<div class="card w-25 mt-5">
					  <img src="https://fastly.picsum.photos/id/237/536/354.jpg?hmac=i0yVXW1ORpyCZpQ-CknuyV-jbtU7_x9EBQVhvT5aRr0" class="card-img-top" alt="...">
					  <div class="card-body">
					    <h5 class="card-title"><%= animale.getNomeAnimale() %></h5>
					    <div class="d-flex justify-content-between pb-2">
					    <span class="fw-semibold"><%=animale.getTipoAnimale() %></span>
					    <span><%=animale.getPrezzo() + "&euro;"%></span>
					    
					    <div class="d-flex justify-content-between">
					    	<form action="./EditAnimal" method="post">
					    		<input type="hidden" name="matricola" value="<%=animale.getMatricola()%>">
					    		<button type="submit" class="btn btn-primary rounded-5">edit</button>
					    	</form>
					    	<form action="./EditAnimal" method="POST">
					    		<input type="hidden" name="delete" value="1">
					    		<input type="hidden" name="matricola" value="<%=animale.getMatricola()%>">
					    		<button type="submit" class="btn btn-danger ms-2 rounded-5">delete</button>
					    	</form>
					    </div>
					    </div>
					  </div>
					</div>
					<%} %>
				</div>
			</div>
		</div>
</body>
</html>