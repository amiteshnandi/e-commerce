<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.deloitte.connection.DBCon"%>
<%@page import="com.deloitte.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
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
<title>E-Kart</title>
<!--External CSS-->
<link rel="stylesheet" href="styles.css">
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
</head>

<body>

	<!-- top navbar -->
	<div class="top-navbar">
		<p>WELCOME TO E-KART</p>

		<div class="icons">
			<%
			if (auth != null) {
			%>
			<a><img src="./images/user1.png" style="height: 18px; padding-right: 4px;"><%=session.getAttribute("username")%></a> 
			<a href="logout"><img src="./images/logout1.png"
				alt="" width="18px">Logout</a>
			<%
			} else {
			%>
			<a href="login.jsp"><img src="./images/register.png" alt="" style="height: 18px; padding-right: 4px;">Login/Register</a>
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
					<li class="nav-item"><a class="nav-link" href="#product-cards">Products</a>
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

				<%
				if (auth != null) {
				%>
				<section class="cart-order">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a href="cart.jsp" class="nav-link">
								<i class="fa-solid fa-shopping-cart" style="color: white"></i> 
								<span class="badge">${cart_list.size()}</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="orders.jsp">ORDERS</a></li>
					</ul>
				</section>
				<%
				}
				%>

			</div>
		</div>
	</nav>
	<!-- navbar -->

	<!-- carousel -->
	<div id="carouselExampleAutoplaying"
		class="carousel slide carousel-dark" data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleAutoplaying"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleAutoplaying"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleAutoplaying"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item">
				<section class="home w-100">
					<div class="content">
						<h1>
							<span>Electronic Products</span> <br> Up To <span id="span1">25%</span>
							Off
						</h1>
						<p>
							No EMI Txn: 5% Up to Rs. 2000 Instant Discount* on Credit and
							Debit Cards <br>EMI Txn: 5% Up to Rs. 3500 Cashback* on
							Credit Card EMI
						</p>
						<div class="btn">
							<button>Shop Now</button>
						</div>

					</div>
					<div class="img">
						<img class="img-fluid" src="./images/background.png" alt="">
					</div>
				</section>
			</div>
			<div class="carousel-item active">
				<section class="banner">
					<div class="content">
						<h1>
							Up To <span id="span2">50%</span> Off On Laptops
						</h1>
						<p>
							No EMI Txn: 5% Up to Rs. 2000 Instant Discount* on Credit and
							Debit Cards <br>EMI Txn: 5% Up to Rs. 3500 Cashback* on
							Credit Card EMI
						</p>
						<div class="btn">
							<button>Shop Now</button>
						</div>

					</div>
					<div class="img">
						<img class="img-fluid"
							src="./images/mbp16-spacegray-gallery1-202301.jpg" alt="">
					</div>
				</section>
			</div>
			<div class="carousel-item">
				<section class="home">
					<div class="content">
						<h1>
							Up To <span id="span1">25%</span> Off on Smartphones
						</h1>
						<p>
							No EMI Txn: 5% Up to Rs. 2000 Instant Discount* on Credit and
							Debit Cards <br>EMI Txn: 5% Up to Rs. 3500 Cashback* on
							Credit Card EMI
						</p>
						<div class="btn">
							<button>Shop Now</button>
						</div>

					</div>
					<div class="img2">
						<img class="img-fluid" src="./images/Iphone.png" alt="">
					</div>
				</section>
			</div>
		</div>

		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<!-- carousel -->

	<!-- product cards -->
	<div class="container" id="product-cards">
		<h1 class="title text-center">PRODUCTS</h1>

		<div class="row">
			<div
				class="d-flex flex-wrap justify-content-center mt-5 filter-button-group">
				<button type="button" class="btn m-2 text-dark active-filter-btn"
					data-filter="*">All Products</button>
				<button type="button" class="btn m-2 text-dark"
					data-filter=".smartphones">Smartphones</button>
				<button type="button" class="btn m-2 text-dark"
					data-filter=".smartwatchs">Smartwatchs</button>
				<button type="button" class="btn m-2 text-dark"
					data-filter=".headphones">Headphones</button>
				<button type="button" class="btn m-2 text-dark"
					data-filter=".laptops">Laptops</button>
				<button type="button" class="btn m-2 text-dark"
					data-filter=".monitor">PC Monitor</button>
				<form action="searchHome.jsp" method="post">
                    <input id="" type="search" name="search" placeholder="Search">
                    <button class="btn"><i class="fas fa-search"></i></button>
                </form>
			</div>
			<div class="product-card-items mt-4 row gx-0 gy-3" id="product-card-items">
				<%
				int z = 0;
				try{
					String search = request.getParameter("search");
					Connection con = DBCon.getConnection();
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery("select * from products where name like '%"+search+"%' or category like '%"+search+"%' and active='Yes'");
					while(rs.next()){
						z=1;
				%>
				<div
					class="col-lg-3 col-sm-6 py-3 py-md-0 p-3 <%=rs.getString(4)%> product">
					<div class="card">
						<img src="./images/<%=rs.getString(6)%>" alt="">
						<div class="card-body">
							<h3 class="text-center"><%=rs.getString(2)%></h3>
							<p class="text-center"><%=rs.getString(3)%></p>
							<div class="star text-center">
								<i class="fa-solid fa-star checked"></i> <i
									class="fa-solid fa-star checked"></i> <i
									class="fa-solid fa-star checked"></i> <i
									class="fa-solid fa-star checked"></i> <i
									class="fa-solid fa-star checked"></i>
							</div>
							<h2>
								&#8377
								<%=rs.getString(5)%>
								<span><a href="add-to-cart?id=<%=rs.getString(1)%>"><i
										class="fa-solid fa-cart-shopping" style=""></i></a></span>
							</h2>
						</div>
					</div>
				</div>
				<%
				}
				}
				catch(Exception e){
					System.out.println(e);
				}
				%>
				
				<%if(z==0){%>
					<h2 style="color: black; text-align: center";>Oops! No Products Found</h2>
				<%} %>
				
			</div>
		</div>
	</div>

	<!-- product cards -->



	<!-- other cards -->
	<div class="container" id="other-cards">
		<div class="row">
			<div class="col-md-6 py-3 py-md-0">
				<div class="card">
					<div class="card-image position-relative overflow-hidden">
						<img class="img-fluid" src="./images/c1.png" alt="">
					</div>
					<div class="card-img-overlay">
						<h3>BEST LAPTOPS</h3>
						<h5>Latest Collection</h5>
						<p>
							Up To <span>25%</span> Off
						</p>
						<button id="shopnow">Shop Now</button>
					</div>
				</div>
			</div>
			<div class="col-md-6 py-3 py-md-0">
				<div class="card">
					<div class="card-image position-relative overflow-hidden">
						<img class="img-fluid" src="./images/c2.png" alt="">
					</div>
					<div class="card-img-overlay">
						<h3>BEST HEADPHONES</h3>
						<h5>Latest Collection</h5>
						<p>
							Up To <span>50%</span> Off
						</p>
						<button id="shopnow">Shop Now</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- other cards -->


	<!-- other cards -->
	<div class="container" id="other">
		<div class="row">
			<div class="col-md-4 py-3 py-md-0">
				<div class="card">
					<div class="card-image position-relative overflow-hidden">
						<img class="img-fluid" src="./images/household-appliances.png"
							alt="">
						<div class="card-img-overlay">
							<h3>Home Appliances</h3>
							<p>
								Up To <span>50%</span> Off
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4 py-3 py-md-0">
				<div class="card">
					<div class="card-image position-relative overflow-hidden">
						<img class="img-fluid" src="./images/AC WallpaperRS.png" alt="">
						<div class="card-img-overlay">
							<h3>Air Conditioner</h3>
							<p>
								Up To <span>30%</span> Off
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4 py-3 py-md-0">
				<div class="card">
					<div class="card-image position-relative overflow-hidden">
						<img class="img-fluid" src="./images/fridgeW (2).png" alt="">
						<div class="card-img-overlay">
							<h3>Refrigerators</h3>
							<p>
								Up To <span>20%</span> Off
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- other cards -->



	<!-- offer -->
	<div class="container" id="offer">
		<div class="row">
			<div class="col-md-3 py-3 py-md-0">
				<i class="fa-solid fa-cart-shopping"></i>
				<h3>Free Shipping</h3>
				<p>On order over &#8377 10000</p>
			</div>
			<div class="col-md-3 py-3 py-md-0">
				<i class="fa-solid fa-rotate-left"></i>
				<h3>Free Returns</h3>
				<p>Within 30 days</p>
			</div>
			<div class="col-md-3 py-3 py-md-0">
				<i class="fa-solid fa-truck"></i>
				<h3>Fast Delivery</h3>
				<p>World Wide</p>
			</div>
			<div class="col-md-3 py-3 py-md-0">
				<i class="fa-solid fa-thumbs-up"></i>
				<h3>Large Collection</h3>
				<p>Of products</p>
			</div>
		</div>
	</div>
	<!-- offer -->



	<!-- newslater -->
	<div class="container" id="newslater">
		<h3 class="text-center">Subscribe To The E-Kart Shop For Latest
			Updates.</h3>
		<div class="input text-center">
			<input type="text" placeholder="Enter Your Email..">
			<button id="subscribe">SUBSCRIBE</button>
		</div>
	</div>
	<!-- newslater -->


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

	<a href="#" class="arrow"><i><img src="./images/arrow.png"
			alt=""></i></a>

	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.js"></script>
	<script src="JavaScript/script.js"></script>

</body>

</html>