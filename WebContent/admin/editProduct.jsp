<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp"%>
<html>
<head>
<link rel="stylesheet" href="addNewProduct.css">
<title>Edit Product</title>
<style>
.back
{
  color: white;
  margin-left: 2.5%
}
</style>
</head>
<body>
 <h2><a class="back" href="allProductEditProduct.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>
<%

String id = request.getParameter("id");
try{
	Connection con = DBCon.getConnection();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from products where id='"+id+"'");
	while(rs.next()){
%>
 
     <!--Edit Product Form-->
    <div class="form-body">
        <div class="container">
            <div class="header">
                <h2>Edit Product</h2>
                <h2>Product ID: <%out.println(id);%></h2>
            </div>
            <form class="form" id="form" method="post" action="editProductAction.jsp">
                <input type="hidden" name="id" value=<%out.println(id); %>> 
                <div class="form-control">
                    <label>Enter Name</label>
                    <input type="text" name="name" value="<%=rs.getString(2) %>" required>
                </div>
                
                <div class="form-control">
                    <label>Enter Description</label>
                    <input type="text" name="description" value="<%=rs.getString(3) %>" required>
                </div>
                
                <div class="form-control">
                    <label>Enter Category</label>
                    <input type="text" name="category" value="<%=rs.getString(4) %>" required>
                </div>
                                
                <div class="form-control">
                    <label>Enter Price</label>
					<input type="number" name="price" value="<%=rs.getString(5) %>" required>
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
    <!--Edit Product Form-->
 
<%
	}
}
catch(Exception e){
	System.out.println(e);
}
%>

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
</body>
</html>