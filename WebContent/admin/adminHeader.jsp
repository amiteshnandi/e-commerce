<%@page import="com.deloitte.connection.DBCon"%>
<%@page import="com.deloitte.dao.ProductDao"%>
<%@page import="com.deloitte.model.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../styles.css">
<!--Font Awesome Links-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<!--Font Awesome Links-->
<!-- bootstrap links -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- bootstrap links -->
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

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

ProductDao pd = new ProductDao(DBCon.getConnection());
List<Product> products = pd.getAllProducts();

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>

</head>
<body>

	<!-- top navbar -->
	<div class="top-navbar">
		<p>WELCOME TO E-KART</p>

		<div class="icons">
			<%
			if (auth != null) {
			%>
			<a><img src="../images/user1.png" style="height: 18px; padding-right: 4px;"><%=session.getAttribute("username")%></a> 
			<a href="../logout"><img src="./images/logout1.png"
				alt="" width="18px">Logout</a>
			<%
			} else {
			%>
			<a href="login.jsp"><img src="../images/register.png" alt="" style="height: 18px; padding-right: 4px;">Login/Register</a>
			<%
			}
			%>

		</div>
	</div>
	<!-- top navbar -->
	
	<!-- navbar -->
	<nav class="navbar navbar-expand-lg" id="navbar">
		<div class="container-fluid">
			<a class="navbar-brand" href="adminHome.jsp" id="logo"><span
				id="span1">E-</span><span id="k-span">K</span>art <span>Shop</span></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span><img src="./images/menu.png" alt="" width="30px"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="adminHome.jsp">DASHBOARD</a></li>
					<!-- 
					<li class="nav-item"><a class="nav-link" href="allProductEditProduct.jsp">All Products & Edit Products <i class='fab fa-elementor'></i></a></li>
					<li class="nav-item"><a class="nav-link" href="ordersReceived.jsp">Orders Received <i class="fas fa-archive"></i></a></li>
					<li class="nav-item"><a class="nav-link" href="cancelOrders.jsp">Canceled Orders <i class='fas fa-window-close'></i></a></li>
					<li class="nav-item"><a class="nav-link" href="#">Delivered Orders<i class='fas fa-dolly'></i></a></li>
					<li class="nav-item"><a class="nav-link" href="#">Messages Received<i class='fas fa-comment-alt'></i></a></li>
					 -->
				</ul>
			</div>
		</div>
	</nav>
	<!-- navbar -->
	<br>
	
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</body>
</html>
