<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/ordersReceived-style.css">
<title>Home</title>
<link rel="stylesheet" href="tables.css">
</head>
<body>

 
	<div class="container mt-5 pb-3">
		<h2 class="card-header text-center">Canceled Orders <i class='fas fa-window-close'></i></h2>
		<table class="table table-light mt-2" style="margin-bottom: 30px;">
			<thead>
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">User Id</th>
					<th scope="col">Product Id</th>
					<th scope="col">Order Quantity</th>
					<th scope="col">Order Date</th>
					<th scope="col">Delivery Date</th>
					<th scope="col">Order Status</th>
					
				</tr>
			</thead>
			<tbody>
			<%
			try{
				Connection con = DBCon.getConnection();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select * from user_database.orders where order_status='Canceled'");
				while(rs.next())
				{
			%>

				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
					<td><%=rs.getString(7) %></td>
					<td><%=rs.getString(6) %></td>
				</tr>
				<%
				}
			}
			catch(Exception e){
				System.out.println(e);
			}
				%>

			</tbody>
		</table>
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