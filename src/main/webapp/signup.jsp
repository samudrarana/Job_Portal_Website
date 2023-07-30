<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Signup</title>
<%--Adding all CSS codes --%>
<%@include file="components/css_codes.jsp"%>
<style ><%@include file="components/style2.css"%></style>
</head>
<body style="background-color:#AEE2FF">
	<%-- Adding Navigation bar --%>
	<%@include file="components/navbar.jsp" %>
	
	<div class="container-fluid">
		<div class="row p-4">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
							<h4>Signup</h4>
						</div>
						
						<c:if test="${not empty msg}">
							<h5 class="text-center text-success">${ msg}</h5>
							<c:remove var="msg"/>
						</c:if>
						
						<form action="register" method="post">
							
							<div class="form-group">
								<label>Full Name</label> 
								<input type="text" placeholder="Enter your name"required="required" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp" name="name">
	
							</div>
							
							<div class="form-group">
								<label>Qualification</label> 
								<input type="text" placeholder="Latest qualification"required="required" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp" name="qualification">
	
							</div>
							
							<div class="form-group">
								<label>Email</label> 
								<input type="email" placeholder="Enter your email.." required="required" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp" name="email">
	
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label>
								<input required="required" type="password" class="form-control" id="exampleInputPassword1"
								name="psw">
							</div>
							<button type="submit" class="btn btn-primary badge-pill btn-block">Register</button>
						</form>
						
						 <div class="text-center mt-3">
                             If you are already registered, <a href="login.jsp">login here</a>.
                         </div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	

</body>
</html>