<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Coronary Artery Disease</title>
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>

<script
	src="https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/a549aa8780dbda16f6cff545aeabc3d71073911e/src/js/bootstrap-datetimepicker.js"></script>


<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/a549aa8780dbda16f6cff545aeabc3d71073911e/build/css/bootstrap-datetimepicker.css">
<!-- 
<script type="text/javascript">
	$(function() {
		$("#datepickerEncounter").datepicker();
		$('#stMA').timepicker({});
		$('#etMA').timepicker({});
		$('#stMD').timepicker({});
		$('#etMD').timepicker({});
	});
</script> -->
<style>
.button {
	margin: auto;
	display: block;
}
</style>
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
			<h4>
				<b>Condition: Coronary Artery Disease</b>
			</h4>
			<h4>
				<b>Patient Name: ${name}</b>
			</h4>

			<h4>
				<b>age: ${age}</b>
			</h4>
			<h4>
				<b>Diagnosis: ${diagnosis}</b>
			</h4>
			<c:url var="saveCondition" value="/saveCoronary">
				<c:param name="cond" value="Coronary Artery Disease"></c:param>
				<c:param name="patientId" value="${patientId}"></c:param>
				<c:param name="pageString" value="${pageString}"></c:param>

			</c:url>

			<c:url var="getConditionHist" value="/getConditionHistory">
				<c:param name="condition" value="Coronary Artery Disease"></c:param>
				<c:param name="patientId" value="${patientId}"></c:param>
				<c:param name="pageString" value="${pageString}"></c:param>
			</c:url>
			<form:form action="${saveCondition }" modelAttribute="cad">
				<form:input type="hidden" path="id" />
				<!--<form:input type="hidden" path="encounterDate" />-->
				<table style="width: 50%">
					<tr>
					<c:if test="${not empty error}">
							<h5>
								<label style="color: red">${error}</label>
							</h5>
						</c:if>
						<th><h5>
								<b>TIME DETAILS</b>
							</h5></th>
					</tr>
					<tr>
						<td><label style="color: red">*</label>
						<form:label path="startTimeMA">Start time(MA)</form:label>
							<div class='input-group date' id='stMA'>
								<form:input path="startTimeMA" class="form-control" />
								<span class="input-group-addon"> <span
									class="glyphicon glyphicon-calendar"></span>
								</span>
							</div></td>
						<td><label style="color: red">*</label>
						<form:label path="endTimeMA">End time(MA)</form:label>
							<div class='input-group date' id='etMA'>
								<form:input path="endTimeMA" class="form-control" />
								<span class="input-group-addon"> <span
									class="glyphicon glyphicon-calendar"></span>
								</span>
							</div></td>
						<!--  
					<td><input class="btn btn-primary active pull-right"
						type="submit" value="Submit" style="float: right"></td>-->

					</tr>
					<tr>
						<td><label style="color: red">*</label>
						<form:label path="startTimeMD">Start time(MD)</form:label>
							<div class='input-group date' id='stMD'>
								<form:input path="startTimeMD" class="form-control" />
								<span class="input-group-addon"> <span
									class="glyphicon glyphicon-calendar"></span>
								</span>
							</div></td>
						<td><label style="color: red">*</label>
						<form:label path="endTimeMD">End time(MD)</form:label>
							<div class='input-group date' id='etMD'>
								<form:input path="endTimeMD" class="form-control" />
								<span class="input-group-addon"> <span
									class="glyphicon glyphicon-calendar"></span>
								</span>
							</div></td>
					</tr>
					<tr>
						<td><label style="color: red">*</label>
						<form:label path="encounterDate">Encounter date:</form:label> <form:input
								id='encDate' path="encounterDate" class="form-control" /></td>
					</tr>
					<br>

					<div>
						<input class="btn btn-primary active button" type="submit"
							value="Submit">
					</div>
				</table>
				<table style="width: 100%">
					<tr>
						<th><h5>
								<b>SYMPTOM MANAGEMENT</b>
							</h5></th>
					</tr>
					<tr>
						<td>SOB</td>
						<td><div>
								<form:radiobutton path="sob" label="Yes" value="true" />

								<form:radiobutton path="sob" label="No" value="false" />


							</div></td>
						<td><form:textarea path="sobComments"
								placeholder="Additional Information" rows="3" cols="40" /></td>
					</tr>
					<tr>
						<td>DOE</td>
						<td><div>
								<form:radiobutton path="doe" label="Yes" value="true" />

								<form:radiobutton path="doe" label="No" value="false" />


							</div></td>
						<td><form:textarea path="doeComments"
								placeholder="Additional Information" rows="3" cols="40" /></td>
					</tr>
					<tr>
						<td>PND</td>
						<td><div>
								<form:radiobutton path="pnd" label="Yes" value="true" />

								<form:radiobutton path="pnd" label="No" value="false" />


							</div></td>
						<td><form:textarea path="pndComments"
								placeholder="Additional Information" rows="3" cols="40" /></td>
					</tr>

					<tr>
						<td>Chest Pain/Pressure</td>
						<td><div>
								<form:radiobutton path="chestPainPressure" label="Yes"
									value="true" />

								<form:radiobutton path="chestPainPressure" label="No"
									value="false" />


							</div></td>
						<td><form:textarea path="chestPainPressureComments"
								placeholder="Additional Information" rows="3" cols="40" /></td>
					</tr>
					<tr>
						<td>Fatigue</td>
						<td><div>
								<form:radiobutton path="fatigue" label="Yes" value="true" />

								<form:radiobutton path="fatigue" label="No" value="false" />


							</div></td>
						<td><form:textarea path="fatigueComments"
								placeholder="Additional Information" rows="3" cols="40" /></td>
					</tr>


					<br>
					<br>
					<tr>
						<th><h5>
								<b>MEDICATION MANAGEMENT</b>
							</h5></th>
					</tr>
					<tr>
						<td>Antiplatelet Therapy</td>
						<td><div>
								<form:radiobutton path="antiplateletTherapy" label="Yes"
									value="true" />

								<form:radiobutton path="antiplateletTherapy" label="No"
									value="false" />


							</div></td>
						<td><form:textarea path="antiplateletTherapyComments"
								placeholder="Additional Information" rows="3" cols="40" /></td>
					</tr>
					<tr>
						<td>ACE/ARB</td>
						<td><div>
								<form:radiobutton path="aceArb" label="Yes" value="true" />

								<form:radiobutton path="aceArb" label="No" value="false" />


							</div></td>
						<td><form:textarea path="aceArbComments"
								placeholder="Additional Information" rows="3" cols="40" /></td>
					</tr>
					<tr>
						<td>Beta Blocker</td>
						<td><div>
								<form:radiobutton path="betaBlocker" label="Yes" value="true" />

								<form:radiobutton path="betaBlocker" label="No" value="false" />


							</div></td>
						<td><form:textarea path="betaBlockerComments"
								placeholder="Additional Information" rows="3" cols="40" /></td>
					</tr>
					<tr>
						<td>Lipid Management</td>
						<td><div>
								<form:radiobutton path="lipidMgmt" label="Yes" value="true" />

								<form:radiobutton path="lipidMgmt" label="No" value="false" />


							</div></td>
						<td><form:textarea path="lipidMgmtComments"
								placeholder="Additional Information" rows="3" cols="40" /></td>
					</tr>
					<tr>
						<td>Nitrites/Renexa</td>
						<td><div>
								<form:radiobutton path="nitritesRenexa" label="Yes" value="true" />

								<form:radiobutton path="nitritesRenexa" label="No" value="false" />


							</div></td>
						<td><form:textarea path="nitritesRenexaComments"
								placeholder="Additional Information" rows="3" cols="40" /></td>
					</tr>
					<tr>
						<td>Any changes in meds by another provider?</td>
						<td><div>
								<form:radiobutton path="changesInMed" label="Yes" value="true" />

								<form:radiobutton path="changesInMed" label="No" value="false" />


							</div></td>
						<td><form:textarea path="changesInMedComments"
								placeholder="Additional Information" rows="3" cols="40" /></td>
					</tr>
					<tr>
						<td>Compliant with medication</td>
						<td><div>
								<form:radiobutton path="compliantWithMed" label="Yes"
									value="true" />

								<form:radiobutton path="compliantWithMed" label="No"
									value="false" />


							</div></td>
						<td><form:textarea path="compliantWithMedComments"
								placeholder="Additional Information" rows="3" cols="40" /></td>
					</tr>
					<tr>
						<td><form:textarea path="complaintChief"
								placeholder="Chief Complaint" rows="3" cols="50" /></td>
					</tr>
					<tr>
						<th><h5>
								<b>MEDICATION MANAGEMENT</b>
							</h5></th>
					</tr>
					<tr>
						<td>Enrolled in HHC</td>
						<td><div>
								<form:radiobutton path="enrolledHhc" label="Yes" value="true" />

								<form:radiobutton path="enrolledHhc" label="No" value="false" />


							</div></td>
						<td><form:textarea path="enrolledHhcComments"
								placeholder="Additional Information" rows="3" cols="40" /></td>
					</tr>
					<tr>
						<td>Referred to Social Worker?</td>
						<td><div>
								<form:radiobutton path="referredToSocialWorker" label="Yes"
									value="true" />

								<form:radiobutton path="referredToSocialWorker" label="No"
									value="false" />


							</div></td>
						<td><form:textarea path="referredToSocialWorkerComments"
								placeholder="Additional Information" rows="3" cols="40" /></td>
					</tr>
					<tr>
						<td>Referred to Lifestyle Coach?</td>
						<td><div>
								<form:radiobutton path="referredToLifeStyleCoach" label="Yes"
									value="true" />

								<form:radiobutton path="referredToLifeStyleCoach" label="No"
									value="false" />


							</div></td>
						<td><form:textarea path="referredToLifeStyleCoachComments"
								placeholder="Additional Information" rows="3" cols="40" /></td>
					</tr>
					<tr>
						<td>Referred to Physical Trainer?</td>

						<td><div>
								<form:radiobutton path="referredToPhysicalTrainer" label="Yes"
									value="true" />

								<form:radiobutton path="referredToPhysicalTrainer" label="No"
									value="false" />


							</div></td>
						<td><form:textarea path="referredToPhysicalTrainerComments"
								placeholder="Additional Information" rows="3" cols="40" /></td>
					</tr>
					<tr>
						<th><h5>
								<b>TREATMENT GOALS</b>
							</h5></th>
					</tr>
					<tr>
						<td>Salt Restriction</td>
						<td><div>
								<form:radiobutton path="saltRestriction" label="Yes"
									value="true" />

								<form:radiobutton path="saltRestriction" label="No"
									value="false" />


							</div></td>
						<td><form:textarea path="saltRestrictionComments"
								placeholder="Additional Information" rows="3" cols="40" /></td>
					</tr>
					<tr>
						<td>Cholesterol Management</td>
						<td><div>
								<form:radiobutton path="cholesterolMgmt" label="Yes"
									value="true" />

								<form:radiobutton path="cholesterolMgmt" label="No"
									value="false" />


							</div></td>
						<td><form:textarea path="cholesterolMgmtComments"
								placeholder="Additional Information" rows="3" cols="40" /></td>
					</tr>
					<tr>
						<td>Home BP monitoring</td>
						<td><div>
								<form:radiobutton path="homeBpMonitoring" label="Yes"
									value="true" />

								<form:radiobutton path="homeBpMonitoring" label="No"
									value="false" />

							</div></td>
						<td><form:input path="homeBpMonitoringReading" /></td>
					</tr>
					<tr>
						<td>Functional Assessment</td>
						<td><form:textarea path="functionalAssessment"
								placeholder="Additional Information" rows="3" cols="40" /></td>
					</tr>
					<tr>
						<td>Sleep Apnea Screening</td>
						<td><form:textarea path="sleepApneaScreening"
								placeholder="Additional Information" rows="3" cols="40" /></td>
					</tr>
					<tr>
						<th><h5>
								<b>PROGNOSIS/EXPECTED OUTCOME(SELECT ONE)</b>
							</h5></th>
					</tr>
					<tr>
						<td><div>
								<form:radiobutton path="prognosis"
									value="Patient Stable(low risk)"
									label="Patient Stable(low risk)" />

							</div>
							<div>
								<form:radiobutton path="prognosis"
									value="Ofc Visit Needed(low/mod risk)"
									label="Ofc Visit Needed(low/mod risk)" />

							</div>
							<div>
								<form:radiobutton path="prognosis"
									value="ER/Hosp Adm(mod/high risk)"
									label="ER/Hosp Adm(mod/high risk)" />

							</div>
							<div>
								<form:radiobutton path="prognosis"
									value="Consult for Hospics/Palliative Care"
									label="Consult for Hospics/Palliative Care" />

							</div></td>
					</tr>
					<tr>
						<th>Provider Comments <br>
						<form:textarea path="providerComments"
								placeholder="Provider Comments" rows="6" cols="40" /></th>
					</tr>
				</table>

			</form:form>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#stMA').datetimepicker();
			$('#etMA').datetimepicker();
			$('#stMD').datetimepicker();
			$('#etMD').datetimepicker();
			$('#encDate').datepicker();

			$("#stMA").on("dp.change", function(e) {
				$('#etMA').data("DateTimePicker").minDate(e.date);
			});
			$("#etMA").on("dp.change", function(e) {
				$('#stMA').data("DateTimePicker").maxDate(e.date);
			});

			$("#stMD").on("dp.change", function(e) {
				$('#etMD').data("DateTimePicker").minDate(e.date);
			});
			$("#etMD").on("dp.change", function(e) {
				$('#stMD').data("DateTimePicker").maxDate(e.date);
			});

			$(".radioBtn").prop("checked", false);

		});
	</script>
</body>
</html>