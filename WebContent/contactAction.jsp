<%@page import="com.deloitte.model.User"%>
<%@page import="com.deloitte.connection.DBCon"%>
<%@page import="java.sql.*"%>

<%

User auth = (User) request.getSession().getAttribute("auth");
int id = auth.getId();
String name = request.getParameter("name");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String body = request.getParameter("body");



try{
	Connection con = DBCon.getConnection();
	PreparedStatement ps = con.prepareStatement("insert into message (user_id, name, email, phone, body) values(?,?,?,?,?);");
	ps.setInt(1, id);
	ps.setString(2, name);
	ps.setString(3, email);
	ps.setString(4, phone);
	ps.setString(5, body);
	ps.executeUpdate();
	response.sendRedirect("contact.jsp?msg=valid");
	
}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("contact.jsp?msg=valid");
}

%>
