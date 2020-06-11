<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mcdonald.conns.Connect"%>
<%@page import="com.mcdonald.cls.Books"%>
<%@page import="com.mcdonald.cls.Cart"%>
<%@page import="com.mcdonald.cls.Users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%!Users user;
	Cart cart;
	Connect con;%>
<%
	Cookie[] cooks = request.getCookies();
if (user == null) {
	for (Cookie c : cooks) {
		if (c.getName().equals("user")) {
	con = new Connect();
	user = con.getUser(c.getValue());
		}
	}
}
if (session.getAttribute("cart") != null) {
	cart = (Cart) session.getAttribute("cart");
} else {
	cart = new Cart();
	session.setAttribute("cart", cart);
}
if (user == null) {
	response.sendRedirect("login.jsp");
} else {
%>
<title><%=user.getUsername()%>'s Cart</title>
</head>
<body>
	<jsp:include page="navbar.jsp" flush="true" />
	<div class="mx-auto" style="margin-top: 75px">
		<h1 class="text-center">Cart</h1>
	</div>
	<div class="container mx-auto" style="padding-top: 50px">
		<table class="table table-borderless mx-auto">
			<thead>
				<tr>
					<th>Image</th>
					<th>Author</th>
					<th>Publisher</th>
					<th>ISBN</th>
					<th>Cost</th>
				</tr>
			</thead>
			<%
				float total = 0.0f;
			int i = 0;
			for (Books b : cart.getCartList()) {
				total += b.getCost();
			%>
			<tr>
				<td><img src="imgs/abcLogo.png"
					alt="Logo image in place of a book image that would be here."></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPublisher()%></td>
				<td><%=b.getIsbn()%></td>
				<td><%=b.getCost()%></td>
				<td><form method="post" action="./CartServe">
						<input type="hidden" name="remove" value="<%=i++%>">
						<button type="submit" class="btn btn-info">Remove</button>
					</form></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td>Total:</td>
				<td></td>
				<td></td>
				<td></td>
				<td><%=total%></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td><form method="post" action="pay.jsp">
						<%
							if (total > 0) {
						%>
						<button type="submit" class="btn btn-info">Pay</button>
						<%
							} else {
						%>
						<button type="submit" class="btn btn-info" disabled>Pay</button>
						<%
							}
						%>
					</form></td>
			</tr>
		</table>
		<h1 style="padding-top: 15px; min-height: 50px"></h1>
	</div>
	<%
		}
	%>
</body>
</html>