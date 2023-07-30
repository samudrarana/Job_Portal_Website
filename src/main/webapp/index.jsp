<%@page import="java.sql.Connection"%>
<%@page import="com.database.DBConnect"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Job Portal</title>
<%--Text Font --%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Neuton:wght@700&display=swap" rel="stylesheet">

<%--Adding all CSS codes --%>
<%@include file="components/css_codes.jsp"%>
<style type="text/css">

<%--CSS code for backgroung image --%>
.background-img{
	background-image: url('image/background1.jpg');
	background-size: cover;
	width:100%;
	height:85vh;
	
}
/* CSS code for the right-side content */
.right-content {
  position: absolute;
  top: 50%;
  right: 10%;
  transform: translateY(-50%);
  color: #000;
  text-align: center;
}

.right-content h3 {
  font-size: 2rem;
  margin-bottom: 10px;
}

.right-content p {
  font-size: 1.2rem;
  margin-bottom: 20px;
}

.right-content .btn {
  background-color: #4E4FEB;
  color: #fff;
  padding: 10px 20px;
  border-radius: 5px;
  text-decoration: none;
  font-size: 1.2rem;
  transition: background-color 0.3s ease;
}

.right-content .btn:hover {
  background-color: #0066cc;
}

 /* Inline CSS for h1 tag */
  h1 {
    font-size: 5.5rem;
    color: #F31559;
    font-family: 'Neuton', serif;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
  }

</style>

</head>
<body>
	<%-- Adding Navigation bar --%>
	<%@include file="components/navbar.jsp" %>
	
	
	
	<%--Background image and text on body--%>
	<div class="container-fluid background-img">
		<div class="text-center">
			<h1 class=" p-4 " >
			 Job Portal
			</h1>	
		</div>
		<%--Right side content--%>
	    <div class="right-content">
	      <h3>Welcome to our job portal</h3>
	      <p>Get information about available Jobs<br>and start your career.</p>
	      <a href="user_view.jsp" class="btn">Explore Now &#8594;</a>
	    </div>
			
	</div>

<%--Calling Footer --%>
<%@include file="components/footer.jsp" %>
</body>
</html>