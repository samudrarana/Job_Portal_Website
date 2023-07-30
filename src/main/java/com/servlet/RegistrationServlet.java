package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDAO;
import com.database.DBConnect;
import com.entity.User;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String name = req.getParameter("name");
		    String qualification =req.getParameter("qualification");
		    String email = req.getParameter("email");
			String psw = req.getParameter("psw");
			
			UserDAO dao= new UserDAO(DBConnect.getConn());
			
			User u=new User(name,email,psw,qualification,"User");
			boolean f= dao.addUser(u);
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("msg", "Successfully Registered");
				resp.sendRedirect("signup.jsp");
				
			}else {
				session.setAttribute("msg", "Error:Somthing went wrong!");
				resp.sendRedirect("signup.jsp");
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	

}
