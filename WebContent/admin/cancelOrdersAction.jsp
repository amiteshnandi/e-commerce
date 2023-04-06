<%@page import="com.deloitte.connection.DBCon"%>
<%@page import="java.sql.*"%>

<%
String id = request.getParameter("id");
String uid = request.getParameter("uid");
String status = "Canceled";

try{
	Connection con = DBCon.getConnection();
	Statement st = con.createStatement();
	st.executeUpdate("update user_database.orders set order_status='"+status+"' where product_id='"+id+"' and user_id='"+uid+"'");
	response.sendRedirect("ordersReceived.jsp?msg=cancel");
	
}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("ordersReceived.jsp?msg=invalid");
}
%>