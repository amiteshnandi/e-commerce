<%@page import="java.sql.*"%>
<%@page import="com.deloitte.connection.DBCon"%>

<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String discription = request.getParameter("discription");
String category = request.getParameter("category");
String price = request.getParameter("price");
String image = request.getParameter("image");
String active  = request.getParameter("active");

try{
	Connection con = DBCon.getConnection();
	PreparedStatement ps = con.prepareStatement("insert into user_database.products values(?,?,?,?,?,?,?)");
	ps.setString(1, id);
	ps.setString(2, name);
	ps.setString(3, discription);
	ps.setString(4, category);
	ps.setString(5, price);
	ps.setString(6, image);
	ps.setString(7, active);
	
	ps.executeUpdate();
	response.sendRedirect("addNewProduct.jsp?msg=done");
}catch(Exception e){
	response.sendRedirect("addNewProduct.jsp?msg=wrong");
}
%>