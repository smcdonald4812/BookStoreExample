<%@page import="java.util.List"%>
<%@page import="com.mcdonald.cls.Books"%>
<%@page import="com.mcdonald.conns.Connect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Store</title>
</head>
<body>	
	<%! 
	Connect con = new Connect();
	List<Books> bookList = con.getAllBooks();
	%>
	<jsp:include page="navbar.jsp" flush="true" />

	<!-- Page Content -->
	<div class="container" style="padding-top: 55px">
		<div class="row">
			<div class="col-lg-9 mx-auto">
				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<img class="d-block img-fluid" src="imgs/bookStoreBanner.png"
								alt="First slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="imgs/bookAdverts.png"
								alt="Second slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="imgs/bookBannerAds.png"
								alt="Third slide">
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>

				<div class="row">
					<%
						int i = 0;
						String[] images = {"imgs/bookA.png","imgs/bookB.png","imgs/bookC.png"};
						for(Books b:bookList) {
							if(i>2) i = 0;
							String img = new String(images[i++]);
							request.setAttribute(b.getTitle(), b.getId());
					%>
							<div class="col-lg-4 col-md-6 mb-4">
								<div class="card h-100">
								<a href="book.jsp?=<%=b.getId()%>"><img class="card-img-top" src="<%=img %>"
									alt="Image of <%=b.getTitle()%>"></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="book.jsp?=<%=b.getId()%>"><%=b.getTitle()%></a>
									</h4>
									<h5><%=b.getCost() %></h5>
									<p class="card-text"><%=b.getInfo() %></p>
								</div>
								</div>
							</div>
					<%
						};
					%>
				</div>
				<!-- /.row -->

			</div>
			<!-- /.col-lg-9 -->

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Steven McDonald 2019</p>
		</div>
		<!-- /.container -->
	</footer>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>