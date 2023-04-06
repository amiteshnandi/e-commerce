<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="addNewProduct.css">
<title>Add New Product</title>
</head>
<body>

<%
String msg = request.getParameter("msg");
if("done".equals(msg)){
%>
<h3 class="alert text-center" style="color:#2ecc71;">Product Added Successfully!</h3>
<% } %>

<%
if("wrong".equals(msg)){
%>
<h3 class="alert text-center" style="color:#e74c3c;">Some thing went wrong! Try Again!</h3>
<% } %>

<%
int id=1;
try{
	Connection con = DBCon.getConnection();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select max(id) from user_database.products");
	while(rs.next()){
		id = rs.getInt(1);
		id = id+1;
	}
}catch(Exception e){
	e.printStackTrace();
}
%>

    <!--New Product Form-->
    <div class="form-body">
        <div class="container">
            <div class="header">
                <h2>Product ID: <%out.println(id);%></h2>
            </div>
            <form class="form" id="form" method="post" action="addNewProductAction.jsp">
                <input type="hidden" name="id" value=<%out.println(id); %>> 
                <div class="form-control">
                    <label>Product Name</label>
                    <input class="input-style" type="text" name="name" placeholder="Enter Product Name" required>
                </div>
                
                <div class="form-control">
                    <label>Product Description</label>
                    <input class="input-style" type="text" name="discription" placeholder="Enter Product Discription" required>
                </div>
                
                <div class="form-control">
                    <label>Product Category</label>
					<input class="input-style" type="text" name="category" placeholder="Enter Product Category" required>
                </div>
                
                <div class="form-control">
                    <label>Price</label>
					<input class="input-style" type="number" name="price" placeholder="Enter Price" required>
                </div>
                
                <div class="form-control">
                    <label>Image</label>
                    <input class="input-style" type="text" name="image" placeholder="Enter Image Name" required>
                </div>
                
                <div class="form-control">
                    <label>Active</label>
                       <select class="form-select" name="active">
   							<option value="Yes">Yes</option>
   							<option value="No">No</option>
   					   </select>
                </div>
                
                <button class="btn btn-primary">Save <i class='far fa-arrow-alt-circle-right'></i></button>
            </form>
        </div>
    </div>
 </form>
    <!--New Product Form-->
 
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