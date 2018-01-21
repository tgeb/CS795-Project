<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reports</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
<style>
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}
</style>
<script type="text/javascript">
	function validate() {
		//var selecte=document.forms["Form"]["month"].value;
		var value = document.getElementById("monthSelect");
		if (value.selectedIndex == 0) {
			alert("Please select a month");
			return false;
		}
	}
</script>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand"
				href="${pageContext.request.contextPath}/home">Chronic Care
				Management at East Cardiovascular Specialist</a>
		</div>

		<ul class="nav navbar-nav navbar-right">

			<li><a href="${pageContext.request.contextPath}/ccmLogout"><span
					class="glyphicon glyphicon-log-out"></span> Log out</a></li>
		</ul>
	</div>
	</nav>
	<div class="jumbotron">
		<div class="container">
			<br>
			<form action="${pageContext.request.contextPath}/billing/{month}"
				method="GET" onsubmit="return validate()" name="Form">
				<b>Please select month</b>: <select name="month" id="monthSelect">
					<option value="select" label="Select Month" />
					<option value="1" label="January" />
					<option value="2" label="February" />
					<option value="3" label="March" />
					<option value="4" label="April" />
					<option value="5" label="May" />
					<option value="6" label="June" />
					<option value="7" label="July" />
					<option value="8" label="August" />
					<option value="9" label="September" />
					<option value="10" label="October" />
					<option value="11" label="November" />
					<option value="12" label="December" />
				</select> <br> <input class="btn btn-default" type="submit"
					value="Submit" />
			</form>
			<br>
			<!--  
			<table style="width: 500px">
				<tr>
					<th>ID</th>
					<th>First Name</th>
					<th>Last Name</th>
				</tr>
				<c:forEach items="${patientList}" var="patient">
					<c:url var="edit" value="/savePatient">
						<c:param name="patientId" value="${patient.id }"></c:param>
					</c:url>

					<c:url var="delete" value="/delete">
						<c:param name="patientId" value="${patient.id }"></c:param>
					</c:url>
					<tr>
						<td>${patient.id}</td>
						<td>${patient.fName}</td>
						<td>${patient.lName}</td>

					</tr>
				</c:forEach>

			</table>


			<a href="${pageContext.request.contextPath}/billing">Get Monthly
				Report</a>
			-->
		</div>
	</div>
</body>
</html>