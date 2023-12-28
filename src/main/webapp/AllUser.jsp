<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="it.betacom.dao.implement.UserDaoImpl"%>
   <%@ page import="java.util.ArrayList" %>
      <%@ page import="java.util.List" %>
   <%@ page import="it.betacom.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<title>Users</title>
</head>
<body>
	<h1 class="text-center pt-5">welcome</h1>
	<div class="d-flex justify-content-center mt-5">
		<table class="table w-50 text-center  border border-1 border-black">
			<thead class="rounded-top-4">
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Username</th>
					<th scope="col">Email</th>
					<th scope="col">Ruolo</th>
					<th scope="col">Stato</th>
				</tr>
			</thead>
			<%
			UserDaoImpl ud = new UserDaoImpl();
			List<Psutenti> allUsers = ud.getAllUser();
			for (Psutenti user : allUsers) {
			%>
			<tbody>
				<tr>
					<td>
						<%
						out.print(user.getId());
						%>
					</td>
					<td>
						<%
						out.print(user.getUsername());
						%>
					</td>
					<td>
						<%
						out.print(user.getEmail());
						%>
					</td>
					<td>
						<%
						out.print(user.getRuolo());
						%>
					</td>
					<td class='<%= user.getStato().equals("A") ? "bg-success text-white" : "bg-danger text-white" %>'>
					    <%= user.getStato().equals("A") ? "attivo" : "bloccato" %>
					</td>
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
</body>
</html>