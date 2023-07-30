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
<title>Jobs:View More</title>
<%--Adding all CSS codes --%>
<%@include file="components/css_codes.jsp"%>

<style>
h5 {
	/* Adding a thinner and lighter black outline with 0.5px offset horizontally and vertically */
	text-shadow: -0.5px -0.5px 0 rgba(0, 0, 0, 0.5), 0.5px -0.5px 0
		rgba(0, 0, 0, 0.5), -0.5px 0.5px 0 rgba(0, 0, 0, 0.5), 0.5px 0.5px 0
		rgba(0, 0, 0, 0.5);
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

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"/>
	</c:if>
	<%-- Adding Navigation bar --%>
	<%@include file="components/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class=" text-primary"><span>Job Details</span></h5>
				
				<%
					int id= Integer.parseInt(request.getParameter("id"));
					JobsDAO dao = new JobsDAO(DBConnect.getConn());
					Jobs j= dao.getJobById(id);
				%>


				<div class="card mt-5">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="fa-regular fa-clipboard fa-2x"></i>
						</div>
						<h6><%=j.getTitle()%></h6>
						<p><%=j.getDescription()%></p>
						<br>
						<div class="form-row">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Location:<%=j.getLocation()%>" readonly>

							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Category:<%=j.getCategory()%>" readonly>
							</div>
							

						</div>
						<h6>
							Published Date and Time:<%=j.getPublishDate().toString()%></h6>
						
					</div>
				</div>

				



			</div>
		</div>
	</div>

</body>
</html>