<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CCM home</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/home">Chronic Care Management at East
				Cardiovascular Specialist</a>
		</div>

		<ul class="nav navbar-nav navbar-right">

			<li><a href="${pageContext.request.contextPath}/ccmLogout"><span class="glyphicon glyphicon-log-out"></span>
					Log out</a></li>
		</ul>
	</div>
	</nav>
	<div class="jumbotron">
		<div class="container">

			<!--  
		<div class="btn-group text-center">
			<a href="${pageContext.request.contextPath}/clinicalHome"
				class="btn btn-primary active text-center"> <i
				class="glyphicon glyphicon-heart" aria-hidden="true"></i> Clinical
			</a> <a href="${pageContext.request.contextPath}/adminHome"
				class="btn btn-primary active text-center"> <i
				class="glyphicon glyphicon-edit" aria-hidden="true"></i>Admin
			</a>
		</div>-->
			<br>
			<br>
			<table style="width: 100%;">
				<tr>
					<td style="text-align: center; vertical-align: middle;"><a
						href="${pageContext.request.contextPath}/clinicalHome"
						class="btn btn-primary active text-center"> <i
							class="glyphicon glyphicon-heart" aria-hidden="true"></i>
							Clinical
					</a><a href="${pageContext.request.contextPath}/adminHome"
						class="btn btn-primary active text-center"> <i
							class="glyphicon glyphicon-edit" aria-hidden="true"></i>Admin
					</a></td>

				</tr>
			</table>
		</div>
	</div>

</body>
</html>