<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Home</title>
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
			<br>
			<a href="${pageContext.request.contextPath}/clinicalHome">Clinical
				Home</a> <br> <a
				href="${pageContext.request.contextPath}/enrollNew"
				class="btn btn-primary active">Enroll New Patient</a> <a
				href="${pageContext.request.contextPath}/report"
				class="btn btn-primary active">Reports</a>
			<!--  
	<a href="${pageContext.request.contextPath}/uploadForm"
		class="btn btn-primary active">Upload Files</a>
	<a href="${pageContext.request.contextPath}/downloadForm"
		class="btn btn-primary active">Download Enrollment Form</a>-->

			<form
				action="${pageContext.request.contextPath}/searchPatient/{searchTerm}"
				method="GET">
				<%
					String uri = request.getRequestURI();

					String pageName = uri.substring(uri.lastIndexOf("/") + 1, uri.lastIndexOf('.'));
					System.out.println("Page name is " + pageName);
				%>
				<input type="hidden" name="pageName" value="<%=pageName%>">
				<!--  		 <c:set var="pageName" value="${pageName}" />
		-->
				<input type="text" name="searchTerm"
					placeholder="Search patient by name"> <input type="submit"
					value="Search">
			</form>

			<table style="width: 500px">
				<tr>
					<th>ID</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Actions</th>
				</tr>
				<c:forEach items="${patientList}" var="patient">
					<c:url var="edit" value="/editPatient">
						<c:param name="patientId" value="${patient.id }"></c:param>
					</c:url>
					<c:url var="delete" value="/delete">
						<c:param name="patientId" value="${patient.id }"></c:param>
					</c:url>
					<tr>
						<td>${patient.id}</td>
						<td>${patient.fName}</td>
						<td>${patient.lName}</td>
						<td><a href="${delete}"
							onclick="if(!(confirm('Are you sure you want to delete this patient?'))) return false">Unenroll</a>
							| <a href="${edit}">Edit</a></td>
					</tr>
				</c:forEach>

			</table>


		</div>
	</div>

</body>
</html>