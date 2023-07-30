package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.JobsDAO;
import com.database.DBConnect;
@WebServlet("/delete")
public class DeleteJobServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			JobsDAO dao=new JobsDAO(DBConnect.getConn());
			boolean f=dao.deleteJobs(id);
			

			HttpSession session=req.getSession();
			
			
			if(f) {
				session.setAttribute("msg", "Job Deleted Successfully");
				resp.sendRedirect("view_jobs.jsp");
				
			}else {
				session.setAttribute("msg", "Error: Job not deleted..");
				resp.sendRedirect("view_jobs.jsp");
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
	}
	
	

}
