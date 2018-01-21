<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"
	type="text/javascript"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	type="text/javascript"></script>

<script src="https://code.jquery.com/jquery-1.12.4.js"
	type="text/javascript"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"
	type="text/javascript"></script>

<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script type="text/javascript">
function validateForm()
{
    var a=document.forms["Form"]["username"].value;
    var b=document.forms["Form"]["password"].value;
   
    if (a==null || a=="",b==null || b=="")
    {
        alert("Please Fill All Required Fields");
        return false;
    }
}
</script>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Chronic Care Management at East
				Cardiovascular Specialist</a>
		</div>

		<ul class="nav navbar-nav navbar-right">

		</ul>
	</div>
	</nav>
	<div class="jumbotron">

		<div class="container">
			<div id="loginbox" style="margin-top: 50px;"
				class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
				<div class="panel panel-info">
					<div class="panel-heading">
						<div class="panel-title">Sign In</div>
						<!--
						<div
							style="float: right; font-size: 80%; position: relative; top: -10px">
							<a href="#">Forgot password?</a>
						</div>-->
					</div>

					<div style="padding-top: 30px" class="panel-body">

						<div style="display: none" id="login-alert"
							class="alert alert-danger col-sm-12"></div>

						<form
							action="${pageContext.request.contextPath}/j_spring_security_check"
							id="loginform" class="form-horizontal" role="form" method="post"
							name="Form" onsubmit="return validateForm()">

							<c:if test="${not empty error}">
								<h4>
									<label style="color: red">${error}</label>
								</h4>
							</c:if>
							<div style="margin-bottom: 25px" class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-user"></i></span> <input
									id="login-username" type="text" class="form-control"
									name="username" value="" placeholder="username">
							</div>

							<div style="margin-bottom: 25px" class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-lock"></i></span> <input
									id="login-password" type="password" class="form-control"
									name="password" placeholder="password">
							</div>

							<div style="margin-top: 10px" class="form-group">
								<!-- Button -->

								<div class="col-sm-12 controls">
									<!--<input type="submit"  value="Login"id="btn-login""class="btn btn-success">-->
									<input class="btn btn-primary" type="submit" value="Login">

								</div>
							</div>
						</form>

						<!--  
						<div class="input-group">
							<div class="checkbox">
								<label> <input id="login-remember" type="checkbox"
									name="remember" value="1"> Remember me
								</label>
							</div>
						</div>-->




						<!--  
						<div class="form-group">
							<div class="col-md-12 control">
								<div
									style="border-top: 1px solid #888; padding-top: 15px; font-size: 85%">
									Don't have an account! <a href="#"
										onClick="$('#loginbox').hide(); $('#signupbox').show()">
										Register Here </a>
								</div>
							</div>
						</div>-->
						<c:url var="register" value="/register">
							
						</c:url>
						<div class="form-group">
							<div class="col-md-12 control">
								<div
									style="border-top: 1px solid #888; padding-top: 15px; font-size: 85%">
									Don't have an account! <a
										href="${register}">
										Register Here </a>
								</div>
							</div>
						</div>

						<!--</form>-->



					</div>
				</div>
			</div>

			<div id="signupbox" style="display: none; margin-top: 50px"
				class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
				<div class="panel panel-info">
					<div class="panel-heading">
						<div class="panel-title">Sign Up</div>
						<div
							style="float: right; font-size: 85%; position: relative; top: -10px">
							<a id="signinlink" href="#"
								onclick="$('#signupbox').hide(); $('#loginbox').show()">Sign
								In</a>
						</div>
					</div>
					<div class="panel-body">
						<form action="${pageContext.request.contextPath}/register"
							id="signupform" class="form-horizontal" role="form">

							<div id="signupalert" style="display: none"
								class="alert alert-danger">
								<p>Error:</p>
								<span></span>
							</div>


							<!--  
						<div class="form-group">
							<label for="email" class="col-md-3 control-label">Email</label>
							<div class="col-md-9">
								<input type="text" class="form-control" name="email"
									placeholder="Email Address">
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-md-3 control-label">First
								Name</label>
							<div class="col-md-9">
								<input type="text" class="form-control" name="firstname"
									placeholder="First Name">
							</div>
						</div>-->

							<c:if test="${not empty userExists}">
								<h4>
									<label style="color: red">${error}</label>
								</h4>
							</c:if>
							<div class="form-group">
								<label for="lastname" class="col-md-3 control-label">User
									Name</label>
								<div class="col-md-9">
									<input type="text" class="form-control" name="username"
										placeholder="User Name">
								</div>
							</div>
							<c:if test="${not empty passwordMismatch}">
								<h4>
									<label style="color: red">${error}</label>
								</h4>
							</c:if>
							<div class="form-group">
								<label for="password" class="col-md-3 control-label">Password</label>
								<div class="col-md-9">
									<input type="password" class="form-control" name="password"
										placeholder="Password">
								</div>
							</div>

							<div class="form-group">
								<label for="password" class="col-md-3 control-label">Confirm
									Password</label>
								<div class="col-md-9">
									<input type="password" class="form-control"
										name="confirmPassword" placeholder="Confirm Password">
								</div>
							</div>
							<!--  
						<div class="form-group">
							<label for="icode" class="col-md-3 control-label">Invitation
								Code</label>
							<div class="col-md-9">
								<input type="text" class="form-control" name="icode"
									placeholder="">
							</div>
						</div>-->

							<div class="form-group">
								<!-- Button -->
								<div class="col-md-offset-3 col-md-9">
									<input class="btn btn-primary" type="submit" value="Register">

								</div>
							</div>
							<!--  
						<div style="border-top: 1px solid #999; padding-top: 20px"
							class="form-group">

							<div class="col-md-offset-3 col-md-9">
								<button id="btn-fbsignup" type="button" class="btn btn-primary">
									<i class="icon-facebook"></i>   Sign Up with Facebook
								</button>
							</div>
						</div>-->
						</form>
					</div>
				</div>
			</div>


		</div>
	</div>
</body>
</html>