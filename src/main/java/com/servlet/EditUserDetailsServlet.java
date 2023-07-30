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

@WebServlet("/update_profile")
public class EditUserDetailsServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("name");
			String qualification =req.getParameter("qualification");
		    String email = req.getParameter("email");
			String psw = req.getParameter("psw");

			UserDAO dao= new UserDAO(DBConnect.getConn());
			
			User u=new User();
			u.setId(id);
			u.setName(name);
			u.setQualification(qualification);
			u.setEmail(email);
			u.setPassword(psw);
			boolean f= dao.editUser(u);
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("msg", "Profile Successfully Updated");
				resp.sendRedirect("user_view.jsp");
				
			}else {
				session.setAttribute("msg", "Error:Somthing wrong!");
				resp.sendRedirect("user_view.jsp");
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
