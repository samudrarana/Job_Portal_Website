<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<%@include file="components/css_codes.jsp"%>
<!-- CSS Code -->
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
							<h4>Login</h4>
						</div>
						<c:if test="${not empty msg }">
							<h4 class="text-center text-danger">${msg}</h4>
							<c:remove var="msg"/>
						</c:if>	
						
						<form action="login" method="post">
							<div class="form-group">
								<label>Email</label> 
								<input type="email" placeholder="Enter registered email.." required="required" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp" name="email">
	
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label>
								<input required="required" type="password" class="form-control" id="exampleInputPassword1"
								name="password">
							</div>
							<button type="submit" class="btn btn-primary badge-pill btn-block">Login</button>
						</form>
						
						<div class="text-center mt-3">
							If you are not registered,
							<a href="signup.jsp">sign up here</a>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	

</body>
</html>