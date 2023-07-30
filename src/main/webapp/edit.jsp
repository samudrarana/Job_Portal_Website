<%@page import="com.database.DBConnect"%>
<%@page import="com.dao.JobsDAO"%>
<%@page import="com.entity.Jobs"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit</title>
<%--Adding all CSS codes --%>
<%@include file="components/css_codes.jsp"%>
</head>
<body style="background-color: #AEE2FF">
	<%-- Adding Navigation bar --%>
	<%@include file="components/navbar.jsp"%>

	<div class="container p-2">
		<div class="col-md-10 offset-md-1">
			<div class="card">
				<div class="card-body">
					<div class="text-center text-success">
						<i class="fa-solid fa-pen-to-square fa-3x" style="color: #0e7eaf;"></i>
						
						<%
							int id=Integer.parseInt(request.getParameter("id"));
							JobsDAO dao=new JobsDAO(DBConnect.getConn());
							Jobs j=dao.getJobById(id);
						%>
						

						<h4 style="color: #0A6EBD">Edit Jobs</h4>
					</div>


					<form action="update_job" method="post">
					
						<input type="hidden" value="<%=j.getId() %>" name="id">
						<div class="form-group">
							<label>Job Title</label> <input type="text" name="title"
								required="required" class="form-control" value="<%=j.getTitle()%>">

						</div>
						<div class="form-row">
							<div class="form-group col-md-4">
								<label>Job Location</label> <select name="location"
									class="custom-select" id="inlineFormCustomSelectPref">
									<option value="<%=j.getLocation()%>"><%=j.getLocation() %></option>
									<option value="Bengaluru">Bengaluru</option>
									<option value="Delhi">Delhi</option>
									<option value="Kolkata">Kolkata</option>
									<option value="Hydrabad">Hydrabad</option>
									<option value="Chennai">Chennai</option>
									<option value="Mumbai">Mumbai</option>

								</select>
							</div>
							<div class="form-group col-md-4">
								<label>Category</label> <select name="category"
									class="custom-select" id="inlineFormCustomSelectPref">
									<option value="<%=j.getCategory() %>"><%=j.getCategory() %></option>
									<option value="AI Expert">AI Expert</option>
									<option value="Developer">Developer</option>
									<option value="Engineer">Engineer</option>
									<option value="Data Scientist">Data Scientist</option>
									<option value="Banking">Banking</option>
									<option value="Sales">Sales</option>

								</select>
							</div>
							<div class="form-group col-md-4">
								<label>Status</label> <select name="status" class="form-control">
									<option value="<%=j.getStatus() %>"><%=j.getStatus() %></option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label>Job Description</label>
							<textarea required rows="6" cols="" name="desc"
								class="form-control"><%=j.getDescription() %></textarea>
						</div>
						<button class="btn btn-success publish-btn">Update</button>
					</form>
				</div>
			</div>

		</div>
	</div>




</body>
</html>