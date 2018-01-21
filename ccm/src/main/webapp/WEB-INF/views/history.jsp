<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manage Conditions</title>
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
	
	<c:url var="getConditionList" value="/manageConditions">
				<c:param name="pageString" value="${pageString }"/>
				<c:param name="patientId" value="${patientId}" />
	</c:url>
	
	<a href="${getConditionList}" >Back</a>
		
		<c:if test="${fn:length(datesList) > 0}">
		<h4><b>Please select a date(yyyy-MM-dd):</b></h4>
		</c:if>
		
		<c:if test="${empty datesList}">
		<h5><b>Patient has no history for <c:out value="${condition}" escapeXml="false" /> at the moment.</b></h5>
		</c:if>
		
		
		<c:forEach items="${datesList}" var="date">
		
			<c:url var="getConditionForm" value="/getConditionHistoryWithDate">
				<c:param name="condition" value="${condition}"/>
				<c:param name="patientId" value="${patientId}" />
				<c:param name="date" value="${date}" />
				<c:param name="pageString" value="${pageString}" />								
			</c:url>
			
			<c:url var="delete" value="/deleteEncounter">
				<c:param name="patientId" value="${patientId}"></c:param>
				<c:param name="condition" value="${condition}"/>
				<c:param name="date" value="${date}" />		
				<c:param name="pageString" value="${pageString}" />			
			</c:url>
			
			<a href="${getConditionForm}" class="btn btn-primary active"><i
				class="glyphicon" aria-hidden="true"></i>${date}</a>
				<a href="${delete}"
					onclick="if(!(confirm('Are you sure you want to delete this encounter?'))) return false">Delete</a>
				<br>
		</c:forEach>

	</div>
	</div>
</body>
</html>