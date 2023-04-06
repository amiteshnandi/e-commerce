package com.deloitte.servlets;

import java.io.IOException;		
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String uname = request.getParameter("name");
		String uUserName = request.getParameter("username");
		String uphone = request.getParameter("phone");
		String uemail = request.getParameter("email");
		String upassword = request.getParameter("password");
		RequestDispatcher dispatcher = null;
		Connection con = null;
		

		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_database?allowPublicKeyRetrieval=true&useSSL=False", "root", "@Soumik27");
			PreparedStatement pst = 
					con.prepareStatement("insert into user_database.users(name, username, phone, email, password) values(?,?,?,?,?) ");
			pst.setString(1, uname);
			pst.setString(2, uUserName);
			pst.setString(3, uphone);
			pst.setString(4, uemail);
			pst.setString(5, upassword);
			
			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("register.jsp");
			if(rowCount > 0) {
				request.setAttribute("status", "success");
			}else {
				request.setAttribute("status", "failed");
			}
			
			dispatcher.forward(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
