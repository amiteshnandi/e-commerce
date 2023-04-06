<%@page import="com.deloitte.dao.OrderDao"%>
<%@page import="com.deloitte.connection.DBCon"%>
<%@page import="com.deloitte.dao.ProductDao"%>
<%@page import="com.deloitte.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
List<Order> orders = null;
if (auth != null) {
	request.setAttribute("auth", auth);
	orders = new OrderDao(DBCon.getConnection()).userOrders(auth.getId());
} else {
	response.sendRedirect("login.jsp");
}

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Orders</title>
<!--External CSS-->
<link rel="stylesheet" href="cart.css">
<!--External CSS-->
<!--Font Awesome Links-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<!--Font Awesome Links-->
<!-- bootstrap links -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- bootstrap links -->
<!-- fonts links -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Kaisei+Tokumin:wght@400;500;700&family=Poppins:wght@300;400;500&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@600&display=swap"
	rel="stylesheet">
<!-- fonts links -->


<!-- Custom Styles -->
<style type="text/css">
.table tbody td {
	vertical-align: middle;
}

.btn-incre, .btn-decre {
	box-shadow: none;
	font-size: 25px;
}
</style>
<!-- Custom Styles -->
</head>

<body>

	<!-- top navbar -->
	<div class="top-navbar">
		<p>WELCOME TO E-KART</p>

		<div class="icons">
			<%
			if (auth != null) {
			%>
			<a><img src="./images/user1.png"
				style="height: 18px; padding-right: 4px;"><%=session.getAttribute("username")%></a>
			<a href="logout"><img src="./images/logout1.png" alt=""
				width="18px">Logout</a>
			<%
			} else {
			%>
			<a href="login.jsp"><img src="./images/register.png" alt=""
				style="height: 18px; padding-right: 4px;">Login/Register</a>
			<%
			}
			%>

		</div>
	</div>
	<!-- top navbar -->

	<!-- navbar -->
	<nav class="navbar navbar-expand-lg" id="navbar">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp" id="logo"><span
				id="span1">E-</span><span id="k-span">K</span>art <span>Shop</span></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span><img src="./images/menu.png" alt="" width="30px"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#product-cards">Product</a>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Category </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown"
							style="background-color: #222222;">
							<li><a class="dropdown-item" href="#">Smart Phone</a></li>
							<li><a class="dropdown-item" href="#">Smart Watch</a></li>
							<li><a class="dropdown-item" href="#">Headphone</a></li>
							<li><a class="dropdown-item" href="#">Laptop</a></li>
							<li><a class="dropdown-item" href="#">PC Moniter</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="about.jsp">About</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a>
					</li>
				</ul>

				<section class="cart-order">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a href="cart.jsp" class="nav-link">
								<i class="fa-solid fa-shopping-cart" style="color: white"></i> <span
								class="badge">${cart_list.size()}</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="orders.jsp">ORDERS</a></li>
					</ul>
				</section>
			</div>
		</div>
	</nav>
	<!-- navbar -->

	<!-- Orders -->
	<div class="container mt-5 pb-3">
		<h2 class="card-header text-center">Your Orders</h2>
		<table class="table table-light mt-2" style="margin-bottom: 30px;">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Product</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Status</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<%
				
				if (orders != null) {
					for (Order o : orders) {
						String status = o.getStatus();
				%>
				<tr>
					<td><%=o.getDate()%></td>
					<td><img src="./images/<%=o.getImage()%>" alt=""
						style="height: 50px; width: 50px;"><%=o.getName()%></td>
					<td><%=o.getCategory()%></td>
					<td><%=o.getQuantity()%></td>
					<td>&#8377 <%=o.getPrice()%></td>
					<td><%=o.getStatus()%></td>
					<td>
					<%if(!status.equals("Delivered")){ 
					%> 
					<a class="btn btn-sm btn-danger"
						style="padding: 12px 8px; background-color: #FF8B13; color: black; border: 1px solid black;"
						href="cancel-order?id=<%=o.getOrderId()%>">Cancel</a> 
					<%} %></td>
				</tr>

				<%
				}
				}
				%>
				<%if (orders == null){%>
				<h2>There is no orders</h2>
				<%} %>

			</tbody>
		</table>
	</div>
	<!-- Orders -->




	<!-- footer -->
	<footer id="footer">
		<div class="footer-top">
			<div class="container">
				<div class="row">

					<div class="col-lg-3 col-md-6 footer-contact">
						<h3>E-Kart Shop</h3>
						<p>
							Karol Bagh <br> New Delhi <br> India <br>
						</p>
						<strong>Phone:</strong> +91 7896589078 <br> <strong>Email:</strong>
						ekartshop@gmail.com <br>
					</div>

					<div class="col-lg-3 col-md-6 footer-links">
						<h4>Usefull Links</h4>
						<ul>
							<li><a href="#">Home</a></li>
							<li><a href="#">About Us</a></li>
							<li><a href="#">Services</a></li>
							<li><a href="#">Terms of service</a></li>
							<li><a href="#">Privacy policey</a></li>
						</ul>
					</div>

					<div class="col-lg-3 col-md-6 footer-links">
						<h4>Products</h4>

						<ul>
							<li><a href="#">Smart Phones</a></li>
							<li><a href="#">Smart Watch</a></li>
							<li><a href="#">Headphones</a></li>
							<li><a href="#">Laptop</a></li>
							<li><a href="#">PC Monitor</a></li>
							<li><a href="#">Microwave Oven</a></li>
							<li><a href="#">Refrigerator</a></li>
							<li><a href="#">Air Conditioner</a></li>
						</ul>
					</div>

					<div class="col-lg-3 col-md-6 footer-links">
						<h4>Our Social Networks</h4>
						<p>Connect with us on Social Media.</p>

						<div class="socail-links mt-3">
							<a href="#"><i class="fa-brands fa-twitter"></i></a> <a href="#"><i
								class="fa-brands fa-facebook-f"></i></a> <a href="#"><i
								class="fa-brands fa-instagram"></i></a> <a href="#"><i
								class="fa-brands fa-skype"></i></a> <a href="#"><i
								class="fa-brands fa-linkedin"></i></a>
						</div>
					</div>

				</div>
			</div>
		</div>
		<hr>
		<div class="container py-4">
			<div class="copyright">
				&copy; Copyright 2023<strong><span> E-Kart Shop</span></strong>. All
				Rights Reserved
			</div>
			<div class="credits">
				Designed by <a href="#">Soumik Hazra</a>
			</div>
		</div>
	</footer>
	<!-- footer -->

	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="JavaScript/script.js"></script>
</body>
</html>


