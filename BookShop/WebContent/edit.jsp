<%@page import="com.mcdonald.cls.Users"%>
<%@page import="com.mcdonald.conns.Connect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%!Connect con;
	Users u;%>
<head>
<meta charset="ISO-8859-1">
<title>Edit Account</title>
</head>
<body class="bg-white">
	<%
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
		if (session.getAttribute("isValid") != null) {
			if (session.getAttribute("isValid").equals("mail")) {
	%>
	<script type="text/javascript">
		alert("\nInvalid Email: Please try again...");
	</script>
	<%
		}
	if (session.getAttribute("isValid").equals("names")) {
	%>
	<script type="text/javascript">
		alert("\nInput a name: Please try again...");
	</script>
	<%
		}
	if (session.getAttribute("isValid").equals("address")) {
	%>
	<script type="text/javascript">
		alert("\nAddress is incorrect: Please try again...");
	</script>
	<%
		}
	if (session.getAttribute("isValid").equals("try")) {
	%>
	<script type="text/javascript">
		alert("\nSomething went wrong with submission: Please try again...");
	</script>
	<%
		}
	session.setAttribute("isValid", null);
	}
	String[] loc = u.getAddress().split(",");
	String add = loc[0].replace(",", "").trim(), city = loc[1].replace(",", "").trim(),
			state = loc[2].substring(0, 3).trim(), zip = loc[2].substring(4, loc[2].length()).trim();
	%>
	<jsp:include page="navbar.jsp" flush="true" />
	<div class="mx-auto" style="margin-top: 75px">
		<h1 class="text-center">Edit Account</h1>
	</div>
	<div class="row" style="padding-top: 50px">
		<div class="col">
			<div class="container shadow-lg bg-light mx-auto">
				<h1 class="text-uppercase font-weight-bolder text-center"
					style="padding-top: 15px; min-height: 50px"><%=u.getUsername()%></h1>
				<form method="post" action="./EditServe">
					<table class="table table-bordered">
						<tr>
							<td>First Name</td>
							<td><input type="text" name="firstName" value="<%=u.getNfirst()%>"></td>
						</tr>
						<tr>
							<td>Last Name</td>
							<td><input type="text" name="lastName" value="<%=u.getNlast()%>"></td>
						</tr>
						<tr>
							<td>Address</td>
							<td><input type="text" name="add" value="<%=add%>"></td>
						<tr>
							<td>City</td>
							<td><input type="text" name="city" value="<%=city%>">
							</td>
						</tr>
						<tr>
							<td>State</td>
							<td><input type="text" name="state" value="<%=state%>">
							</td>
						</tr>
						<tr>
							<td>Zip</td>
							<td><input type="text" name="zip" value="<%=zip%>">
							</td>
						</tr>
						<tr>
							<td>Mobile</td>
							<td><input type="tel" name="mobile"
								value="<%=u.getMobile()%>"></td>
						</tr>
						<tr>
							<td>Email</td>
							<td><input type="email" name="email"
								value="<%=u.getEmail()%>"></td>
						</tr>
						<tr>
							<td><input type="submit" value="Submit"></td>
							<td><input type="reset" value="Reset"></td>
						</tr>
					</table>
				</form>
				<h1 style="padding-top: 15px; min-height: 50px"></h1>
			</div>
		</div>
		<div class="col">
			<div class="float-right">
				<img src="imgs/bookA.png" alt="profile pic">
			</div>
		</div>
	</div>
	<%
		}
	%>
</body>
</html>