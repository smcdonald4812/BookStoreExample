<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
</head>
<%!String fName = "navBarA.jsp";%>
<%
	if (session.getAttribute("isValid") != null) {
	if (session.getAttribute("isValid").equals("false")) {
%>
<script type="text/javascript">
	alert("\nPassword did not match: Please try again...");
</script>
<%
	}
if (session.getAttribute("isValid").equals("names")) {
%>
<script type="text/javascript">
	alert("\nPut a correct name in: Please try again...");
</script>
<%
	}
if (session.getAttribute("isValid").equals("used")) {
%>
<script type="text/javascript">
	alert("\nUsername taken: Please try again...");
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
if (session.getAttribute("isValid").equals("mail")) {
%>
<script type="text/javascript">
	alert("\nEmail is already used: Please try again...");
</script>
<%
	}
session.setAttribute("isValid", null);
}
%>
<body>
	<jsp:include page="navbar.jsp" flush="true" />
	<div class="container" style="padding-top: 55px">
		<div class="card bg-light">
			<article class="card-body mx-auto" style="max-width: 400px;">
				<h4 class="card-title mt-3 text-center">Create Account</h4>
				<p class="text-center">Create a Free account for the Book Store</p>
				<form method="post" action="./SignUpServ">
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-user"></i>
							</span>
						</div>
						<input name="firstName" class="form-control"
							placeholder="First name" type="text" required>
					</div>
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-user"></i>
							</span>
						</div>
						<input name="lastName" class="form-control"
							placeholder="Last name" type="text" required>
					</div>
					<!-- form-group// -->
					<div class="form-group">
						<label>Address</label> <input name="address"
							type="text" class="form-control"
							placeholder="1234 Main St apt. D" required>
					</div>
					<div class="form-row">
						<div class="form-group col-md-5">
							<label>City</label> <input type="text"
								name="city" class="form-control" required>
						</div>
						<div class="form-group col-md-3">
							<label>State</label> <select
								name="state" class="form-control" required>
								<option selected>CT</option>
								<option>DE</option>
								<option>AK</option>
								<option>CA</option>
								<option>TX</option>
							</select>
						</div>
						<div class="form-group col-md-4">
							<label>Zip</label> <input name="zip" type="text"
								class="form-control" required>
						</div>
					</div>
					<!-- form-group// -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-envelope"></i>
							</span>
						</div>
						<input name="email" class="form-control"
							placeholder="Email address" type="email" required>
					</div>
					<!-- form-group// -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-phone"></i>
							</span>
						</div>
						<input name="mobile" class="form-control"
							placeholder="Phone number" type="tel" required>
					</div>
					<!-- form-group// -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-building"></i>
							</span>
						</div>
						<input name="uname" class="form-control" placeholder="User name"
							type="text" required>
					</div>
					<!-- form-group end.// -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-lock"></i>
							</span>
						</div>
						<input name="pass1" class="form-control"
							placeholder="Create password" type="password" required>
					</div>
					<!-- form-group// -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-lock"></i>
							</span>
						</div>
						<input name="pass2" class="form-control"
							placeholder="Repeat password" type="password" required>
					</div>
					<!-- form-group// -->
					<div class="form-group input-group">

						<input class="checkbox" style="display: inline" type="checkbox"
							name="subscribe" checked> <label class="label"
							style="display: inline">Subscribe to receive emails about
							the latest deals and events!</label>
					</div>
					<!-- form-group// -->
					<div class="form-group">
						<button type="submit" class="btn btn-primary btn-block">
							Create Account</button>
					</div>
					<!-- form-group// -->
					<p class="text-center">
						Have an account? <a href="login.jsp">Log In</a>
					</p>
				</form>
			</article>
		</div>
	</div>
</body>
</html>