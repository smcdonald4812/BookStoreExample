<%@page import="com.mcdonald.cls.Sellers"%>
<%@page import="com.mcdonald.conns.Connect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%! Connect con; Sellers b;%>
<%
	if(request.getQueryString()==null){
		response.sendRedirect("store.jsp");
	} else {
		con=new Connect();
		b = con.getSeller(Integer.valueOf(request.getQueryString().substring(request.getQueryString().indexOf("=")+1)));
		session.setAttribute("currentSeller", b);
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=b.getName() %></title>
</head>
<body>
<jsp:include page="navbar.jsp" flush="true" />
<div class="mx-auto" style="margin-top: 75px">
		<h1 class="text-center">Seller</h1>
	</div>
	<div class="row" style="padding-top: 50px">
		<div class="col">
			<div class="container shadow-lg bg-light mx-auto"
				>
				<h1 class="text-uppercase font-weight-bolder text-center"
					style="padding-top:15px; min-height: 50px"><%=b.getName()%></h1>
				<table class="table table-bordered">
					<tr>
						<td>Address</td>
						<td><%=b.getAddress()%></td>
					</tr>
					<tr>
						<td>Phone Number</td>
						<td><%=b.getMobile()%></td>
					</tr>
					<tr>
						<td>Email</td>
						<td><%=b.getEmail()%></td>
					</tr>
				</table>
				<h1 style="padding-top:15px; min-height: 50px"></h1>
			</div>
		</div>
		<div class="col">
			<div class="float-right">
				<img src="imgs/sellA.png" alt="profile pic">
			</div>
		</div>
		<div class="col">
			<div class="container shadow-lg bg-dark float-right"
				style="max-width: 300px;">
				<div class="btn-group-vertical mx-auto">
					<h3 class="font-text-bolder text-white mx-auto">Description</h3>
					<p class="text-white"><%=b.getInfo()%></p>
					<form class="mx-auto" method="POST" action="sellersStock.jsp"><input type="hidden" name="id" value="<%=b.getId()%>"><button type="submit" class="btn btn-info">Book Avilability</button></form>
				</div>
			</div>
		</div>
	</div>
	<% } %>
</body>
</html>