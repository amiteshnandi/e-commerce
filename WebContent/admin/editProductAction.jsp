<%@page import="com.deloitte.connection.DBCon"%>
<%@page import="java.sql.*"%>


<% 
String id = request.getParameter("id");
String name = request.getParameter("name");
String description = request.getParameter("description");
String category = request.getParameter("category");
String price = request.getParameter("price");
String active = request.getParameter("active");

try{
	Connection con = DBCon.getConnection();
	Statement st = con.createStatement();
	st.executeUpdate("update products set name='"+name+"', description='"+description+"', category='"+category+"', price='"+price+"', active='"+active+"' where id='"+id+"'");
	response.sendRedirect("allProductEditProduct.jsp?msg=done");
	
}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
}


%>