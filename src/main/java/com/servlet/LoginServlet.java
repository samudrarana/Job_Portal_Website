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


@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String mail=req.getParameter("email");
			String psw =req.getParameter("password");
			User u=new User();
			HttpSession session=req.getSession();
			/*
			 * Admin Email:admin@gmail.com
			 * Admin Password: admin123
			 * */
			
			if("admin@gmail.com".equals(mail) && "admin123".equals(psw)) {
				session.setAttribute("adminUserObj", u);
				u.setRole("admin");
				resp.sendRedirect("admin.jsp");
			}else {
				
				UserDAO dao=new UserDAO(DBConnect.getConn());
				User user=dao.login(mail, psw);
				if(user!=null) {
					session.setAttribute("userobj", user);
					resp.sendRedirect("user_view.jsp");
					
				}else {
					session.setAttribute("msg", "Invalid Credentials..");
					resp.sendRedirect("login.jsp");
				}
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	
	
}
