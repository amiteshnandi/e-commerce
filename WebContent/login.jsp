<%@page import="com.deloitte.connection.DBCon"%>
<%@page import="com.deloitte.dao.ProductDao"%>
<%@page import="com.deloitte.model.*"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
User auth = (User) request.getSession().getAttribute("auth");
if(auth != null){
	response.sendRedirect("index.jsp");
}
%>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!--External CSS-->
    <link rel="stylesheet" href="register.css">
    <!--External CSS-->
    <!--Font Awesome Links-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <!--Font Awesome Links-->
    <!-- bootstrap links -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap links -->
    <!-- fonts links -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Kaisei+Tokumin:wght@400;500;700&family=Poppins:wght@300;400;500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@600&display=swap" rel="stylesheet">
    <!-- fonts links -->
</head>

<body>

    <!-- navbar -->
    <nav class="navbar navbar-expand-lg" id="navbar">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp" id="logo"><span id="span1">E-</span><span id="k-span">K</span>art<span>Shop</span></a>
        </div>
    </nav>
    <!-- navbar --> 
    

    <!--Login Form-->    
    <div class="form-body">
        <div class="container">
            <%String msg = request.getParameter("msg"); 
    		if("invalid".equals(msg))
    		{
    		%>
    		<h3 class="alert text-center" style="color:#e74c3c;">Login Failed! Please Try Again.</h3>
    		<%} %>
            <div class="header">
                <h2>Login</h2>
            </div>
            <form class="form" id="form" method="post" action="user-login">
                <div class="form-control">
                    <label>Username</label>
                    <input type="text" name="username" id="username" placeholder="Enter Username" autocomplete="off">
                    <i class="fas fa-check-circle"></i>
                    <i class="fas fa-exclamation-circle"></i>
                    <small>Error Msg</small>
                </div>

                <div class="form-control">
                    <label>Password</label>
                    <input type="password" name="password" id="password" placeholder="Enter Password" autocomplete="off">
                    <i class="fas fa-check-circle"></i>
                    <i class="fas fa-exclamation-circle"></i>
                    <small>Error Msg</small>
                </div>
                <input type="submit" value="Login" class="btn">
                <p class="text-center">New User? Register Instead</p>
                <p class="text-center" id="btnregister"><a href="register.jsp">Register</a></p>
            </form>
        </div>
    </div>
    <!--Login Form-->


    <!-- footer -->
    <footer id="footer">
        <div class="footer-top">
            <div class="container">
                <div class="row">

                    <div class="col-lg-3 col-md-6 footer-contact">
                        <h3>E-Kart Shop</h3>
                        <p>
                            Karol Bagh <br>
                            New Delhi <br>
                            India <br>
                        </p>
                        <strong>Phone:</strong> +91 7896589078 <br>
                        <strong>Email:</strong> ekartshop@gmail.com <br>
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
                            <a href="#"><i class="fa-brands fa-twitter"></i></a>
                            <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                            <a href="#"><i class="fa-brands fa-instagram"></i></a>
                            <a href="#"><i class="fa-brands fa-skype"></i></a>
                            <a href="#"><i class="fa-brands fa-linkedin"></i></a>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <hr>
        <div class="container py-4">
            <div class="copyright">
                &copy; Copyright 2023<strong><span> E-Kart Shop</span></strong>. All Rights Reserved
            </div>
            <div class="credits">
                Designed by <a href="#">Soumik Hazra</a>
            </div>
        </div>
    </footer>
    <!-- footer -->

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="login.js"></script>
</body>