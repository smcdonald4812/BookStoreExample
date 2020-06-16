<%@page import="com.mcdonald.cls.Cart"%>
<%@page import="com.mcdonald.cls.Users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
</head>
<body>
	<%!boolean flag = true;
	String name = ""; Cart cart;%>
	<%
		if(session.getAttribute("cart")!=null) {
			cart=(Cart)session.getAttribute("cart");
		}
		if (request.getCookies() != null) {
			Cookie[] co = request.getCookies();
			for (Cookie c : co) {
				if (c.getName().equals("user")) {
					name = c.getValue();
				}
				if (c.getName().equals("loggedStatus")) {
					if (c.getValue().equals("true")) {
						flag=false;
					} else {
						flag=true;
					}
					
				}
			}
		}
	%>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="store.jsp"><img class="img-fluid"
				src="imgs/abcLogo.png" alt="ABC logo"> ABC Books</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link text-secondary" href="store.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link text-secondary" href="about.jsp">About</a></li>
					<li class="nav-item"><a class="nav-link text-secondary" href="contact.jsp">Contact</a></li>
					<li class="nav-item"><a class="nav-link text-secondary" href="sellers.jsp">Sellers</a></li>
					<%
						if(flag) {
					%>
					<li class="nav-item"><a class="nav-link text-secondary" href="login.jsp">Login</a></li>
					<li class="nav-item"><a class="nav-link text-secondary" href="signup.jsp">Sign Up</a></li>
					<%
						} else {
					%>
					<li class="nav-item"><a class="nav-link text-secondary" href="account.jsp"><%=name%></a></li>
					<li class="nav-item"><form method="post" action="./LoginServe">
					<button class="btn btn-dark text-secondary" type="submit" name="logOut">LogOut</button></form></li>
					<%
						}
					%>
					<li class="nav-item"><a class="nav-link" href="cart.jsp"><img
							src="imgs/cart.png" alt="shopping cart"></a></li>
					<% if(session.getAttribute("cart")!=null) { %>
						<li class="nav-item"><p class="badge badge-info badge-pill"><%=cart.getBookCount()%></p></li>
					<% } %>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>