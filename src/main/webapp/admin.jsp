<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<%--Adding all CSS codes --%>
<%@include file="components/css_codes.jsp"%>

<style type="text/css">
.back-img{
	background-image: url('image/admin1.jpg');
	background-size: cover;
	width:100%;
	height:91vh;

	
}

/* CSS for the Admin Page heading */
.admin-heading {
  font-size: 48px;
  font-weight: bold;
  color: rgba(255, 0, 0, 0.6);
  margin-top: 50px; 
  text-align: center;
  font-family: "Arial", sans-serif; 
}
</style>
</head>
<body>
	 <%--For Security --%>
  <c:if test="${empty adminUserObj }">
		<c:redirect url="login.jsp" />
	</c:if>
	<%-- Adding Navigation bar --%>
	<%@include file="components/navbar.jsp" %>
	<div class="container-fluid back-img">
		<div class="text-center">
			<h2 class="admin-heading">Admin Page</h2>
		</div>
	</div>

</body>
</html>