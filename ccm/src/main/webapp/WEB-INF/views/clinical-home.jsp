<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Clinical</title>
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
		<a href="${pageContext.request.contextPath}/adminHome">Admin Home</a>
		<form
			action="${pageContext.request.contextPath}/searchPatient/{searchTerm}"
			method="GET">
			<%
				String uri = request.getRequestURI();

				String pageName = uri.substring(uri.lastIndexOf("/") + 1, uri.lastIndexOf('.'));
				System.out.println("Page name is " + pageName);
			%>
			<input type="hidden" name="pageName" value="<%=pageName%>">
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
			<!-- 
			<c:if test="${fn:length(patientList) == 0}">
				<h5>
					<b>No search results</b>
				</h5>
			</c:if>-->
			<c:forEach items="${patientList}" var="patient">
				<c:url var="profile" value="/viewProfile">
					<c:param name="patient" value="${patient}"></c:param>
				</c:url>

				<c:url var="newEncounter" value="/manageConditions">
					<c:param name="patientId" value="${patient.id }"></c:param>
					<c:param name="pageString" value="manage-home"></c:param>
				</c:url>

				<c:url var="viewEncounters" value="/manageConditions">
					<c:param name="patientId" value="${patient.id}"></c:param>
					<c:param name="pageString" value="manage-home-history"></c:param>
				</c:url>

				<tr>
					<td>${patient.id}</td>
					<td>${patient.fName}</td>
					<td>${patient.lName}</td>
					<td><a href="${newEncounter}">Manage Conditions</a> | <a
						href="${viewEncounters}">History</a></td>
				</tr>
			</c:forEach>

		</table>

</div>

	</div>
</body>
</html>