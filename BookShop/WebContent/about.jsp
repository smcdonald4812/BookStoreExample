<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About</title>
</head>
<body>
	<jsp:include page="navbar.jsp" flush="true" />
	<div class="container mx-auto" style="padding-top: 75px">
		<div class="container shadow-lg bg-light mx-auto">
			<h1 class="font-weight-bolder text-center mx-auto"
				style="padding-top: 15px; min-height: 50px">About</h1>
			<p class="mx-auto text-center text-wrap">This is an example of a small bookstore web site. 
			This site was made with JSP, Servlets, JDBC 4 MySQL Driver, MySQL, BootStrap, and regular POJO.
			The payment JSP and Servlet are not realistic, as this IS NOT a real site and there is no card processing.
			The promotion Servlet also does not connect to the database as these are here solely for example functionality,
			and will not be changed. The promotional codes are PROMO1, PROMO2, and PROMO3.
			</p>
			<h1 style="padding-top: 15px; min-height: 50px"></h1>
		</div>
	</div>
</body>
</html>