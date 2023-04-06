<%@include file="adminHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>E-Kart: Admin Pannel</title>
<link rel="stylesheet" href="home-style.css">
<style>
</style>
</head>
<body>
	<div class="container">
		<h1 class="text-center">WELCOME ADMIN</h1>
		<div class="row">
			<div class="col-lg-4 col-sm-6 py-3">
				<a href="addNewProduct.jsp"><div class="admin-links" style="background-color:#FEFF86;">Add New Product <i class='fas fa-plus-square'></i></div></a>
			</div>
			
			<div class="col-lg-4 col-sm-6 py-3" >
				<a href="allProductEditProduct.jsp"><div class="admin-links" style="background-color:#B0DAFF;">All Products & Edit Products <i class='fab fa-elementor'></i></div></a>
			</div>
			
			<div class="col-lg-4 col-sm-6 py-3" >
				<a href="ordersReceived.jsp"><div class="admin-links" style="background-color:#FFB4B4;">Orders Received <i class="fas fa-archive"></i></div></a>
			</div>
			
			<div class="col-lg-4 col-sm-6 py-3" >
				<a href="cancelOrders.jsp"><div class="admin-links" style="background-color:#F3E8FF;">Canceled Orders <i class='fas fa-window-close'></i></div></a>
			</div>
			
			<div class="col-lg-4 col-sm-6 py-3" >
				<a href="deliveredOrders.jsp"><div class="admin-links" style="background-color:#F6F1E9;">Delivered Orders <i class='fas fa-dolly'></i></div></a>
			</div>
			
			<div class="col-lg-4 col-sm-6 py-3" >
				<a href="messagesReceived.jsp"><div class="admin-links" style="background-color:#B3E5BE;">Messages Received <i class='fas fa-comment-alt'></i></div></a>
			</div>
			

			

		</div>

	</div>

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
</body>
</html>