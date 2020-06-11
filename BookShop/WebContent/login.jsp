<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Log In</title>
</head>
<body class="bg-light">
<jsp:include page="navbar.jsp" flush="true" />
	<%
		if (session.getAttribute("login") != null) {
	%>
	<script type="text/javascript">
		alert("\nInvalid username or password: Please try again...");
	</script>
	<%
		}
	%>
	<div class="container shadow-lg bg-white mx-auto"
		style="margin-top: 20%; max-width: 300px">
		<!-- Login Form -->
		<form class="mx-auto" method="POST" action="./LoginServe">
			<div class="form-group">
				<label class="label mx-auto font-weight-bolder text-center">LOGIN</label><br>
				<input class="mx-auto" type="text" name="userName"
					placeholder="user name" required><br> <input
					class="mx-auto" style="margin-top: 5px" type="password" name="pass"
					placeholder="password" required><br>
				<button class="btn btn-success" style="margin-top: 5px"
					type="submit">Log In</button>
			</div>
		</form>
		<!-- Remind Passowrd -->
		<div class="mx-auto" style="padding-bottom: 5px">
			<a href="#"><button class="btn btn-info">Forgot
					Password?</button></a> <a href="signup.jsp"><button class="btn btn-info">Sign
					Up</button></a>
		</div>
		<div class="mx-auto"></div>
	</div>
</body>
</html>