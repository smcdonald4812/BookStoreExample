<%@page import="com.mcdonald.cls.PayOrder"%>
<%@page import="com.mcdonald.conns.Connect"%>
<%@page import="com.mcdonald.cls.Users"%>
<%@page import="com.mcdonald.cls.Books"%>
<%@page import="com.mcdonald.cls.Cart"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%!boolean flag = false;
	Cart cart;
	Users user;
	Connect con;
	PayOrder paid;
	String tot = "", pro = "";
	float total, promo = 0.0f;%>
<head>
<meta charset="ISO-8859-1">
<title>Pay</title>
<%
	Cookie[] cook = request.getCookies();
for (Cookie c : cook) {
	if (c.getName().equals("loggedStatus"))
		flag = c.getValue().equals("true");
	if (c.getName().equals("user")) {
		con = new Connect();
		user = con.getUser(c.getValue());
	}
}
%>
</head>
<body>
	<%
		if (!flag) {
		response.sendRedirect("login.jsp");
	} else {
		total = 0.0f;
		cart = (Cart) session.getAttribute("cart");
		if (session.getAttribute("promo") != null) {
			promo = (float) session.getAttribute("promo");
		}
		String[] loc = user.getAddress().split(",");
		String add = loc[0].replace(",", "").trim(), city = loc[1].replace(",", "").trim(),
		state = loc[2].substring(0, 3).trim(), zip = loc[2].substring(4, loc[2].length()).trim();
	%>
	<jsp:include page="navbar.jsp" flush="true" />
	<%
		if (session.getAttribute("payment") != null) {
		paid = con.getPayOrder(user.getUsername());
	%>
	<div class="container" style="padding-top: 85px">
		<div class="col-md-8 order-md-1">
			<h4 class="mb-3">Shipping Address</h4>
			<div class="row">
				<div class="col-md-6 mb-3">
					<label>First name: <%=paid.getNfirst()%></label>
				</div>
				<div class="col-md-6 mb-3">
					<label>Last name: <%=paid.getNlast()%></label>
				</div>
			</div>
			<div class="mb-3">
				<label>Email: <%=user.getEmail()%></label>
			</div>
			<div class="mb-3">
				<label>Address: <%=paid.getAddress()%></label>
			</div>
			<div class="row">
				<div class="col-md-5 mb-3">
					<label>City: <%=paid.getCity()%></label>
				</div>
				<div class="col-md-4 mb-3">
					<label>State: <%=paid.getState()%></label>
				</div>
				<div class="col-md-3 mb-3">
					<label>Zip: <%=paid.getZip()%></label>
				</div>
			</div>
			<hr class="mb-4">
			<h4 class="mb-3">Payment</h4>
			<div class="row">
				<%
					if (session.getAttribute("payment").equals("success")) {
				%>
				<h3 class="font-text-bolder text-sucess mx-auto">Payment was a Success!</h3>
				<%
					} else {
				%>
				<h3 class="font-text-bolder text-danger mx-auto">Payment Failed!</h3>
				<%
					}
				%>
			</div>
			<%
				if (paid != null) {
				cart = null;
				session.setAttribute("cart", cart);
				paid = null;
				session.setAttribute("payment", null);
				session.setAttribute("total", null);
			}
			%>
			<footer class="my-5 pt-5 text-muted text-center text-small">
				<p class="mb-1">Steven McDonald</p>
			</footer>
		</div>
	</div>
	<%
		} else {
	%>
	<div class="container" style="padding-top: 85px">
		<div class="row">
			<div class="col-md-4 order-md-2 mb-4">
				<h4 class="d-flex justify-content-between align-items-center mb-3">
					<span class="text-muted">Your cart</span> <span
						class="badge badge-info badge-pill"><%=cart.getBookCount()%></span>
				</h4>
				<ul class="list-group mb-3">
					<%
						for (Books book : cart.getCartList()) {
						total += book.getCost();
					%>
					<li
						class="list-group-item d-flex justify-content-between lh-condensed">
						<div>
							<h6 class="my-0">
								P<%=book.getTitle()%></h6>
							<small class="text-muted"><%=book.getInfo()%></small>
						</div> <span class="text-muted">$ <%=book.getCost()%></span>
					</li>
					<%
						}
					%>
					<li class="list-group-item d-flex justify-content-between bg-light">
						<div class="text-success">
							<h6 class="my-0">Promo Discount</h6>
						</div> <%
 	pro = String.format("%.2f", promo);
 %> <span class="text-success">-$<%=pro%></span>
					</li>
					<li class="list-group-item d-flex justify-content-between"><span>Total
							(USD)</span> <%
 	if (total > promo) {
 	tot = String.format("%.2f", total - promo);
 	session.setAttribute("total", total-promo);
 } else {
 	tot = "0.00";
 	session.setAttribute("total", 0.0f);
 }
 %> <strong>$ <%=tot%></strong></li>
				</ul>

				<form class="card p-2" method="POST" action="./RedeemServe">
					<div class="input-group">
						<input name="code" type="text" class="form-control"
							placeholder="Promo code">
						<div class="input-group-append">
							<button type="submit" class="btn btn-secondary">Redeem</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-8 order-md-1">
				<h4 class="mb-3">Billing address</h4>
				<form method="POST" action="./PayServe">
					<div class="row">
						<div class="col-md-6 mb-3">
							<label>First name</label> <input type="text" class="form-control"
								name="firstName" value="<%=user.getNfirst()%>" required>
						</div>
						<div class="col-md-6 mb-3">
							<label>Last name</label> <input type="text" class="form-control"
								name="lastName" value="<%=user.getNlast()%>" required>
						</div>
					</div>
					<div class="mb-3">
						<label>Email</label> <input type="email" class="form-control"
							name="email" value="<%=user.getEmail()%>" required>
					</div>
					<div class="mb-3">
						<label>Address</label> <input type="text" class="form-control"
							name="add" value="<%=add%>" required>
					</div>
					<div class="row">
						<div class="col-md-5 mb-3">
							<label>City</label> <input type="text" class="form-control"
								name="city" value="<%=city%>" required>
						</div>
						<div class="col-md-4 mb-3">
							<label>Current State: <%=state%></label> 
							<select name="state"class="form-control"  required>
							<option selected>CT</option>
							<option>DE</option>
							<option>AK</option>
							<option>CA</option>
							<option>TX</option>
							</select>
						</div>
						<div class="col-md-3 mb-3">
							<label>Zip</label> <input type="text" class="form-control"
								name="zip" value="<%=zip%>" required>
						</div>
					</div>
					<hr class="mb-4">
					<h4 class="mb-3">Payment</h4>

					<div class="d-block my-3">
						<div class="custom-control custom-radio">
							<input name="credit" type="radio"
								class="custom-control-input" checked> <label
								class="custom-control-label">Credit card</label>
						</div>
						<div class="custom-control custom-radio">
							<input name="credit" type="radio"
								class="custom-control-input"> <label
								class="custom-control-label">Debit card</label>
						</div>
						<div class="custom-control custom-radio">
							<input name="credit" type="radio"
								class="custom-control-input"> <label
								class="custom-control-label">Paypal</label>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label>Name on card</label> 
							<input type="text" name="fullName" class="form-control" pattern="[A-Z a-z]+" required>
							<small class="text-muted">Full name as displayed on card</small>
						</div>
						<div class="col-md-6 mb-3">
							<label for="cc-number">Credit card number</label> <input
								type="text" class="form-control" name="cardNumber" pattern="[0-9]{16}" required>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3 mb-3">
							<label>Expiration</label>
							<input type="text" class="form-control" name="cardExpiration" pattern="[0-9]{2}/[0-9]{4}" required>
						</div>
						<div class="col-md-3 mb-3">
							<label>CVV</label> 
							<input type="text" class="form-control" name="cardCvv" pattern="[0-9]{3}" required>
						</div>
					</div>
					<hr class="mb-4">
					<button class="btn btn-primary btn-lg btn-block" type="submit">Continue
						to checkout</button>
				</form>
			</div>
		</div>

		<footer class="my-5 pt-5 text-muted text-center text-small">
			<p class="mb-1">Steven McDonald</p>
		</footer>
	</div>
	<%
	}
	}
	%>
</body>
</html>