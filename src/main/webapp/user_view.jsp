<%@page import="com.database.DBConnect"%>
<%@page import="com.dao.JobsDAO"%>
<%@page import="com.entity.Jobs"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<%--Adding all CSS codes --%>
<%@include file="components/css_codes.jsp"%>

<style>
h5 {
	/* Adding a thinner and lighter black outline with 0.5px offset horizontally and vertically */
	text-shadow: -0.5px -0.5px 0 rgba(0, 0, 0, 0.5), 0.5px -0.5px 0
		rgba(0, 0, 0, 0.5), -0.5px 0.5px 0 rgba(0, 0, 0, 0.5), 0.5px 0.5px 0
		rgba(0, 0, 0, 0.5);
}
.card {
  border: 1px solid #ddd;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  background-color: #fff;
  margin-bottom: 20px;
  padding: 20px;
}

.card-title {
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 10px;
  background-color: #fff; 
  padding: 10px; /* Adding padding to the heading */
}

.card-subtitle {
  font-size: 18px;
  color: #555;
  margin-bottom: 10px;
}

.card-text {
  color: #444;
  margin-bottom: 20px;
}

.card-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.btn-view-more {
  padding: 8px 15px;
  font-size: 16px;
  font-weight: bold;
  color: #fff;
  background-color: #007bff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  text-decoration: none;
}

.btn-view-more:hover {
  background-color: #0056b3;
}


.filter-field {
  margin-bottom: 15px;
}
  h5 {
   
    text-align: center; /* Center the text horizontally */
    border-radius: 4px; 
    
  }

  /* CSS styles for the span within h5 */
  h5 span {
    background-color: white;
    padding-left: 10px; 
    padding-right: 10px;
  }
</style>
</head>
<body style="background-color: #AEE2FF">
 <%--For Security --%>
  <c:if test="${empty userobj }">
		<c:redirect url="login.jsp" />
	</c:if>

	<%-- Adding Navigation bar --%>
	<%@include file="components/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-primary"><span>Available Jobs</span></h5>
				<%--Msg for updating profile --%>
				<c:if test="${not empty msg }">
					<h4 class="text-center text-success">${msg}</h4>
					<c:remove var="msg"/>
				</c:if>

				<div class="card">
					<div class="card-body">
						<form class="form-inline" action="filter.jsp" method="get">
							<%--For filtering --%>
							<div class="form-group col-md-5 mt-1">
								<h5>Location</h5>
							
							</div>
							<div class="form-group col-md-4 mt-1">
								<h5>Category</h5>
							</div>
						
							<div class="form-group col-md-5">
								 <select name="location" 
									class="custom-select" id="inlineFormCustomSelectPref">
									<option selected value="loca">Select</option>
									<option value="Bengaluru">Bengaluru</option>
									<option value="Delhi">Delhi</option>
									<option value="Kolkata">Kolkata</option>
									<option value="Hydrabad">Hydrabad</option>
									<option value="Chennai">Chennai</option>
									<option value="Mumbai">Mumbai</option>

								</select>
							</div>
							
							<div class="form-group col-md-5">
								<select name="category"
									class="custom-select" id="inlineFormCustomSelectPref">
									<option selected value="cate">Select</option>
									<option value="AI Expert">AI Expert</option>
									<option value="Developer">Developer</option>
									<option value="Engineer">Engineer</option>
									<option value="Data Scientist">Data Scientist</option>
									<option value="Banking">Banking</option>
									<option value="Sales">Sales</option>

								</select>
							</div>
							<button class="btn btn-primary">Filter Jobs</button>
							
						</form>
					</div>
				</div>
				
				<%
				JobsDAO dao = new JobsDAO(DBConnect.getConn());
				List<Jobs> list = dao.getAllJobsForUser();
				for (Jobs j : list) {
				%>
				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="fa-regular fa-clipboard fa-2x"></i>
						</div>
			
						<h6><%=j.getTitle()%></h6>
						<%
							if(j.getDescription().length()>0 && j.getDescription().length()<150){
								%>
								<p><%=j.getDescription()%></p>
								<% 
							}else{
						%>
						<p><%=j.getDescription().substring(0, 150) %>...
						</p>
						<%
							}
						%>
						<br>
						<div class="form-row">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm" 
								value="Location:<%=j.getLocation() %>" readonly>
						
							</div>
							
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Category:<%=j.getCategory()%>" readonly>
							</div>


						</div>
						<h6>
							Published Date and Time:<%=j.getPublishDate()%></h6>
						<div class="text-center">
							<a href="view_more.jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-primary text-white">View More</a>
								 
						</div>
					</div>
				</div>
				<%
				}
				%>
				
				



			</div>
		</div>
	</div>

</body>
</html>