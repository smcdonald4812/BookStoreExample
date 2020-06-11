<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.mcdonald.cls.Users"%>
<%@page import="com.mcdonald.conns.Connect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account</title>
</head>
<%!Connect con;
	Users u;%>
<body class="bg-white">
	<%
	session.setAttribute("isValid",null);
		u = null;
	con = new Connect();
	Cookie[] co = request.getCookies();
	for (Cookie c : co) {
		if (c.getName().equals("user")) {
			u = con.getUser(c.getValue());
		}
	}
	if (u == null) {
		response.sendRedirect("login.jsp");
	} else {
	%>
	<jsp:include page="navbar.jsp" flush="true" />
	<div class="mx-auto" style="margin-top: 75px">
		<h1 class="text-center">Account</h1>
	</div>
	<div class="row" style="padding-top: 50px">
		<div class="col">
			<div class="container shadow-lg bg-light mx-auto"
				>
				<h1 class="text-uppercase font-weight-bolder text-center"
					style="padding-top:15px; min-height: 50px"><%=u.getUsername()%></h1>
				<table class="table table-bordered">
					<tr>
						<td>First Name</td>
						<td><%=u.getNfirst()%></td>
					</tr>
					<tr>
						<td>Last Name</td>
						<td><%=u.getNlast()%></td>
					</tr>
					<tr>
						<td>Address</td>
						<td><%=u.getAddress()%></td>
					</tr>
					<tr>
						<td>Mobile</td>
						<td><%=u.getMobile()%></td>
					</tr>
					<tr>
						<td>Email</td>
						<td><%=u.getEmail()%></td>
					</tr>
				</table>
				<h1 style="padding-top:15px; min-height: 50px"></h1>
			</div>
		</div>
		<div class="col">
			<div class="float-right">
				<img src="imgs/bookA.png" alt="profile pic">
			</div>
		</div>
		<div class="col">
			<div class="container shadow-lg bg-dark float-right"
				style="max-width: 150px;">
				<div class="btn-group-vertical mx-auto">
					<a href="edit.jsp"><button class="btn btn-dark">Edit
							Account</button></a> <a href="#"><button class="btn btn-dark">Blank
							Button</button></a> <a href="#"><button class="btn btn-dark">Blank
							Button</button></a> <a href="#"><button class="btn btn-dark">Blank
							Button</button></a> <a href="#"><button class="btn btn-dark">Blank
							Button</button></a> <a href="#"><button class="btn btn-dark">Blank
							Button</button></a>
				</div>
			</div>
		</div>
	</div>
	<% } %>
</body>
</html>