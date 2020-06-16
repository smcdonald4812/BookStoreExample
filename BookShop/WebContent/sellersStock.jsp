<%@page import="com.mcdonald.cls.Cart"%>
<%@page import="com.mcdonald.cls.Sellers"%>
<%@page import="java.util.List"%>
<%@page import="com.mcdonald.cls.Books"%>
<%@page import="com.mcdonald.conns.Connect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%!
Connect con;
List<Books> sellList;
Sellers s;
Books b; 
Cart cart;
%>
<%
con = new Connect();
sellList = con.getStock(Integer.valueOf(request.getParameter("id")));
s = con.getSeller(Integer.valueOf(request.getParameter("id")));
if(session.getAttribute("cart")!=null) {
	cart = (Cart)session.getAttribute("cart");
}
%>
<title><%=s.getName()%></title>
</head>
<body>
<jsp:include page="navbar.jsp" flush="true" />
<div class="mx-auto" style="margin-top: 75px">
		<h1 class="text-center"><%=s.getName() %>'s Stock</h1>
	</div>
	<div class="container" style="padding-top: 50px; display:block">
	<%
		for(Books b : sellList) {
	%>
		<div class="row">
			<div class="col">
			<div class="container shadow-lg bg-light mx-auto">
				<h1 class="text-uppercase font-weight-bolder text-center"
					style="padding-top:15px; min-height: 50px"><%=b.getTitle()%></h1>
				<table class="table table-bordered">
					<tr>
						<td>Author</td>
						<td><%=b.getAuthor()%></td>
					</tr>
					<tr>
						<td>Publisher</td>
						<td><%=b.getPublisher()%></td>
					</tr>
					<tr>
						<td>Year Printed</td>
						<td><%=b.getYear()%></td>
					</tr>
					<tr>
						<td>ISBN</td>
						<td><%=b.getIsbn()%></td>
					</tr>
					<tr>
						<td>Condition</td>
						<td><%=b.getCondition()%></td>
					</tr>
					<tr>
						<td>Stock</td>
						<td><%=b.getStock()%></td>
					</tr>
				</table>
				<h1 style="padding-top:15px; min-height: 50px"></h1>
			</div>
		</div>
		<div class="col">
			<div class="container shadow-lg bg-dark float-right"
				style="max-width: 300px;">
				<div class="btn-group-vertical mx-auto">
					<h3 class="font-text-bolder text-white mx-auto">Description</h3>
					<p class="text-white"><%=b.getInfo()%></p>
					<form class="mx-auto" method="POST" action="./CartServe"><button type="submit" class="btn btn-info">Add to cart</button></form>
				</div>
			</div>
		</div>
		</div>
		<% } %>
	</div>
</body>
</html>