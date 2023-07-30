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
import com.entity.Jobs;
@WebServlet("/add_job")
public class AddPostServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String title=req.getParameter("title");
			String location=req.getParameter("location");
			String category=req.getParameter("category");
			String status=req.getParameter("status");
			String desc=req.getParameter("desc");
			
			Jobs j=new Jobs();
			j.setTitle(title);
			j.setLocation(location);
			j.setCategory(category);
			j.setStatus(status);
			j.setDescription(desc);
			
			HttpSession session=req.getSession();
			
			JobsDAO dao=new JobsDAO(DBConnect.getConn());
			boolean f=dao.addJobs(j);
			if(f) {
				session.setAttribute("msg", "Job Added Successfully");
				resp.sendRedirect("post_job.jsp");
				
			}else {
				session.setAttribute("msg", "Error: Job not added..");
				resp.sendRedirect("post_job.jsp");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	

}
