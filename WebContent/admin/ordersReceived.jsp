<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/ordersReceived-style.css">
<title>Home</title>
<link rel="stylesheet" href="tables.css">
</head>
<body>



<%
String msg = request.getParameter("msg");
if("cancel".equals(msg))
{
%>
<h3 class="alert text-center" style="color:#2ecc71;">Order Cancel Successfully!</h3>
<%} %>

<%
if("delivered".equals(msg)) 
{
%>
<h3 class="alert text-center" style="color:#2ecc71;">Successfully Updated!</h3>
<%} %>

<%if("invalid".equals(msg))
{	
%>
<h3 class="alert text-center" style="color:#e74c3c;">Some thing went wrong! Try Again!</h3>
<%} %>

	<div class="container mt-5 pb-3">
		<h2 class="card-header text-center">Orders Received <i class="fas fa-archive"></i></h2>
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
					<th scope="col">Delivered</th>
					<th scope="col">Cancel</th>
					
				</tr>
			</thead>
			<tbody>
			<%
			try{
				Connection con = DBCon.getConnection();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select * from user_database.orders where order_status='Processing'");
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
					<td><a id="table-link" href="editStatus.jsp?id=<%= rs.getString(2)%>&uid=<%=rs.getString(3)%>">Delivered <i class='fas fa-dolly'></i></a></td>
					<td><a id="table-link" href="cancelOrdersAction.jsp?id=<%= rs.getString(2)%>&uid=<%=rs.getString(3) %>">Cancel <i class="fas fa-window-close"></i></a></td>
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