<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Post job</title>
<%--Adding all CSS codes --%>
<%@include file="components/css_codes.jsp"%>
</head>
<body style="background-color: #AEE2FF">

 <%--For Security --%>
  <c:if test="${empty adminUserObj }">
		<c:redirect url="login.jsp" />
  </c:if>
	
	<%-- Adding Navigation bar --%>
	<%@include file="components/navbar.jsp"%>

	<div class="container p-2">
		<div class="col-md-10 offset-md-1">
			<div class="card">
				<div class="card-body">
					<div class="text-center text-success">
						<i class="fas fa-user-friends fa-3x" style="color: #0e7eaf;"></i>
						
						<c:if test="${not empty msg }">
							<div class="alert alert-success" role="alert">${ msg}</div>
							<c:remove var="msg"/>
						</c:if>

						<h4 style="color: #0A6EBD">Add Jobs</h4>
					</div>


					<form action="add_job" method="post">
						<div class="form-group">
							<label>Job Title</label> <input type="text" name="title"
								required="required" class="form-control">

						</div>
						<div class="form-row">
							<div class="form-group col-md-4">
								<label>Job Location</label> <select name="location"
									class="custom-select" id="inlineFormCustomSelectPref">
									<option selected>Select</option>
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
									<option selected>Select</option>
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
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label>Job Description</label>
							<textarea required rows="6" cols="" name="desc"
								class="form-control"></textarea>
						</div>
						<button class="btn btn-success publish-btn">Publish Job</button>
					</form>
				</div>
			</div>

		</div>
	</div>




</body>
</html>