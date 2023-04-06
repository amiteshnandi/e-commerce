package com.deloitte.servlets;

import java.io.IOException;		
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.deloitte.connection.DBCon;
import com.deloitte.dao.UserDao;
import com.deloitte.model.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		

		try (PrintWriter out = response.getWriter()) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			HttpSession session = request.getSession();
//			RequestDispatcher dispatcher = null;
			
			try {
				UserDao udao = new UserDao(DBCon.getConnection());
				User user = udao.userLogin(username, password);
//				dispatcher = request.getRequestDispatcher("login.jsp");
				
				if("admin".equals(username) && "admin123".equals(password)) {
					request.getSession().setAttribute("auth", user);
					session.setAttribute("username", user.getUsername());
					response.sendRedirect("admin/adminHome.jsp");
				}
				else if (user != null) {
					request.getSession().setAttribute("auth", user);
					session.setAttribute("username", user.getUsername());
					response.sendRedirect("index.jsp");
				}
				else {
					response.sendRedirect("login.jsp?msg=invalid");
				}
//				dispatcher.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	}

}
