<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Encounter Form</title>
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
	$(function() {
		$("#datepickerEncounter").datepicker();
		$('#stMA').timepicker({});
		$('#etMA').timepicker({});
		$('#stMD').timepicker({});
		$('#etMD').timepicker({});
	});
</script>
</head>
<%
	System.out.println("this is outside map loop");
%>
<c:forEach var="condMap" items="${condMap}">
	<!-- Key is ${entry.key} Value is ${entry.value} -->
	<c:if
		test="${(condMap.key=='enrolledHypertension') && (!condMap.value) }">
		<%
			System.out.println("this is inside map loop before script");
		%>

		<script type="text/javascript">
			$(function disable() {
				$('#pills-hypertension').removeAttr("data-toggle");
			});
			$(window).load(function() {
				disable();
				;
			});
		</script>
		<%
			System.out.println("this is inside map loop after script");
		%>
	</c:if>
</c:forEach>

<!--<input type="hidden" id="condList" value="${condList }">
<c:if test="${condList.get('enrolledArrhythmia')}">
	<script>
		$(function() {
			$('#pills-arrhythmia').removeAttr("data-toggle");
		});
	</script>

</c:if>
<input type="hidden" id="condList" value="${condList }">

<c:if test="${condList.get('enrolledHeartfailure')}">
		<c:out value = "${'Inside hypertension'}"/>
	
	<script>
		$(function() {
			$('#pills-heartFailure').removeAttr("data-toggle");
		});
	</script>

</c:if>
<c:if test="${condList.get('enrolledCoronary')}">
	<script>
		$(function() {
			$('#pills-artery').removeAttr("data-toggle");
		});
	</script>

</c:if>
<c:if test="${condList.get('enrolledHypertension')}">
	<c:out value = "${'Inside hypertension'}"/>
	<script>
		$(function() {
			$('#pills-hypertension').removeAttr("data-toggle");
		});
	</script>

</c:if>
<c:if test="${condList.get('enrolledPeripheral')}">
	<script>
		$(function() {
			$('#pills-peripheral').removeAttr("data-toggle");
		});
	</script>

</c:if>
-->
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
	<br>
	<div class="jumbotron">
	<a href="${pageContext.request.contextPath}/clinicalHome">Clinical Home</a>
	
		<h4>Encounter details</h4>

		<input type="hidden" id="condList" value="${condList }">
		<!--  
		<%
			//int patientID = (Integer) request.getAttribute("patientIdNum");
			//System.out.println(patientID);
			//<%=patientID%>
		%>-->
		<c:url var="saveEncounter" value="/saveEncounter">
			<c:param name="patientId" value="${patientIdNum}"></c:param>
		</c:url>
		<form:form action="${saveEncounter}" >
		Encounter date:<form:input path="encounterDate"
				id="datepickerEncounter" />
			<br>

		<!-- 	<input type="hidden" value="" name="patientIDNo"> -->
		Start time(MA):<form:input path="startTimeMA" id="stMA" />
		End time(MA):<form:input path="endTimeMA" id="etMA" />
		Start time(Physician):<form:input path="startTimeMD" id="stMD" />
		End time(Physician):<form:input path="endTimeMD" id="etMD" />
			<input type="submit" value="Submit">

			<br>
			<h4>
				<b>MANAGED CONDITIONS</b>
			</h4>
			<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
				<li class="nav-item"><a class="nav-link"
					id="pills-heartFailure-tab" data-toggle="pill"
					href="#pills-heartFailure" role="tab"
					aria-controls="pills-heartFailure" aria-expanded="true">Heart
						Failure</a></li>
				<li class="nav-item"><a class="nav-link" id="pills-artery-tab"
					data-toggle="pill" href="#pills-artery" role="tab"
					aria-controls="pills-artery" aria-expanded="true">Coronary
						Artery Dz/IHD</a></li>

				<li class="nav-item"><a class="nav-link"
					id="pills-hypertension-tab" data-toggle="pill"
					href="#pills-hypertension" role="tab"
					aria-controls="pills-hypertension" aria-expanded="true">Hypertension</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					id="pills-arrhythmia-tab" data-toggle="pill"
					href="#pills-arrhythmia" role="tab"
					aria-controls="pills-arrhythmia" aria-expanded="true">Arrhythmia</a></li>
				<li class="nav-item"><a class="nav-link"
					id="pills-peripheral-tab" data-toggle="pill"
					href="#pills-peripheral" role="tab"
					aria-controls="pills-peripheral" aria-expanded="true">Peripheral
						Vascular Disease</a></li>

			</ul>

			<div class="tab-content" id="pills-tabContent">

				<!--********************This is start of Heart Failure Tab************************************-->

				<div class="tab-pane fade" id="pills-heartFailure" role="tabpanel"
					aria-labelledby="pills-heartFailure-tab">
					<table style="width: 100%">
						<tr>
							<th><h5>
									<b>SYMPTOM MANAGEMENT</b>
								</h5></th>
						</tr>
						<tr>
							<td><form:label path="hf.sob">SOB</form:label></td>
							<td><div>
									<form:radiobutton path="hf.sob" label="Yes" />

									<form:radiobutton path="hf.sob" label="No" />


								</div></td>
							<td><form:textarea path="hf.sobComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>DOE</td>
							<td><div>
									<form:radiobutton path="hf.doe" label="Yes" />

									<form:radiobutton path="hf.doe" label="No" />

								</div></td>
							<td><form:textarea path="hf.doeComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>PND</td>
							<td><div>
									<form:radiobutton path="hf.pnd" label="Yes" />

									<form:radiobutton path="hf.pnd" label="No" />

								</div></td>
							<td><form:textarea path="hf.pndComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Edema</td>
							<td><div>
									<form:radiobutton path="hf.edema" label="Yes" />

									<form:radiobutton path="hf.edema" label="No" />

								</div></td>
							<td><form:textarea path="hf.edemaComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Chest Pain/Pressure</td>
							<td><div>
									<form:radiobutton path="hf.chestPainPressure" label="Yes" />

									<form:radiobutton path="hf.chestPainPressure" label="No" />

								</div></td>
							<td><form:textarea path="hf.chestPainPressureComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Cough</td>
							<td><div>
									<form:radiobutton path="hf.cough" label="Yes" />

									<form:radiobutton path="hf.cough" label="No" />

								</div></td>
							<td><form:textarea path="hf.coughComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Fatigue</td>
							<td><div>
									<form:radiobutton path="hf.fatigue" label="Yes" />

									<form:radiobutton path="hf.fatigue" label="No" />

								</div></td>
							<td><form:textarea path="hf.fatigueComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Weight Gain</td>
							<td><div>
									<form:radiobutton path="hf.weightGain" label="Yes" />

									<form:radiobutton path="hf.weightGain" label="No" />

								</div></td>
							<td><form:input path="hf.weightGainCurrent"
									placeholder="Current Weight" /> Past weight: <form:input
									path="hf.weightGainPrevious" style="width: 100px;"
									placeholder="AutoPopulated" /></td>
						</tr>
						<br>
						<tr>
							<th><h5>
									<b>MEDICATION MANAGEMENT</b>
								</h5></th>
						</tr>
						<tr>
							<td>Beta Blocker</td>
							<td><div>
									<form:radiobutton path="hf.betaBlocker" label="Yes" />

									<form:radiobutton path="hf.betaBlocker" label="No" />

								</div></td>
							<td><form:textarea path="hf.betaBlockerComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>ACE/ARB/Entresto</td>
							<td><div>
									<form:radiobutton path="hf.aceArbEntresto" label="Yes" />

									<form:radiobutton path="hf.aceArbEntresto" label="No" />

								</div></td>
							<td><form:textarea path="hf.aceArbEntrestoComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Aldosterone/Spironolactone</td>
							<td><div>
									<form:radiobutton path="hf.aldosteroneSpironolactone"
										label="Yes" />

									<form:radiobutton path="hf.aldosteroneSpironolactone"
										label="No" />

								</div></td>
							<td><form:textarea
									path="hf.aldosteroneSpironolactoneComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Diuretic</td>
							<td><div>
									<form:radiobutton path="hf.diuretic" label="Yes" />

									<form:radiobutton path="hf.diuretic" label="No" />

								</div></td>
							<td><form:textarea path="hf.diureticComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td><div>
									<form:radiobutton path="hf.bidil" label="Yes" />

									<form:radiobutton path="hf.bidil" label="No" />

								</div></td>
							<td><form:textarea path="hf.bidilComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Any changes in meds by provider?</td>
							<td><div>
									<form:radiobutton path="hf.changesInMed" label="Yes" />

									<form:radiobutton path="hf.changesInMed" label="No" />

								</div></td>
							<td><form:textarea path="hf.changesInMedComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Compliant with medication</td>
							<td><div>
									<form:radiobutton path="hf.compliantWithMed" label="Yes" />

									<form:radiobutton path="hf.compliantWithMed" label="No" />

								</div></td>
							<td><form:textarea path="hf.compliantWithMedComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td><form:textarea path="hf.complaintChief"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<th><h5>
									<b>COMM SERVICE/SOC SERVICE/HHC</b>
								</h5></th>
						</tr>
						<tr>
							<td>Enrolled in HHC</td>
							<td><div>
									<form:radiobutton path="hf.enrolledHhc" label="Yes" />

									<form:radiobutton path="hf.enrolledHhc" label="No" />

								</div></td>
							<td><form:textarea path="hf.enrolledHhcComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Referred to Social Worker?</td>
							<td><div>
									<form:radiobutton path="hf.referredToSocialWorker" label="Yes" />

									<form:radiobutton path="hf.referredToSocialWorker" label="No" />

								</div></td>
							<td><form:textarea path="hf.referredToSocialWorkerComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Referred to Lifestyle Coach?</td>
							<td><div>
									<form:radiobutton path="hf.referredToLifeStyleCoach"
										label="Yes" />

									<form:radiobutton path="hf.referredToLifeStyleCoach" label="No" />

								</div></td>
							<td><form:textarea
									path="hf.referredToLifeStyleCoachComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Referred to Physical Trainer?</td>
							<td><div>
									<form:radiobutton path="hf.referredToPhysicalTrainer"
										label="Yes" />

									<form:radiobutton path="hf.referredToPhysicalTrainer"
										label="No" />

								</div></td>
							<td><form:textarea
									path="hf.referredToPhysicalTrainerComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<th><h5>
									<b>TREATMENT GOALS</b>
								</h5></th>
						</tr>
						<tr>
							<td>Salt Restriction</td>
							<td><div>
									<form:radiobutton path="hf.saltRestriction" label="Yes" />

									<form:radiobutton path="hf.saltRestriction" label="No" />

								</div></td>
							<td><form:textarea path="hf.saltRestrictionComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Fluid Restriction</td>
							<td><div>
									<form:radiobutton path="hf.fluidRestriction" label="Yes" />

									<form:radiobutton path="hf.fluidRestriction" label="No" />

								</div></td>
							<td><form:textarea path="hf.fluidRestrictionComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Weight Management</td>
							<td><form:textarea path="hf.weightManagement"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Home BP monitoring</td>
							<td><div>
									<form:radiobutton path="hf.homeBpMonitoring" label="Yes" />

									<form:radiobutton path="hf.homeBpMonitoring" label="No" />

								</div></td>
							<td><form:input path="hf.homeBpMonitoringReading" /></td>
						</tr>
						<tr>
							<td>Functional Assessment</td>
							<td><form:textarea path="hf.functionalAssessment"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Sleep Apnea Screening</td>
							<td><form:textarea path="hf.sleepApneaScreening"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<th>Prognosis/Expected Outcome(select one)</th>
						</tr>
						<tr>
							<td><div>
									<form:radiobutton path="hf.prognosis" />
									<form:label path="hf.prognosis">Patient Stable(low risk)
									</form:label>
								</div>
								<div>
									<form:radiobutton path="hf.prognosis" />
									Ofc Visit Needed(low/mod risk)
								</div>
								<div>
									<form:radiobutton path="hf.prognosis" />
									ER/Hosp Adm(mod/high risk)
								</div>
								<div>
									<form:radiobutton path="hf.prognosis" />
									Consult for Hospics/Palliative Care
								</div></td>

						</tr>
						<tr>
							<th>Provider Comments <form:textarea
									path="hf.providerComments" placeholder="Provider Comments"
									rows="6" cols="50" /></th>
						</tr>
					</table>

				</div>
				<!--********************This is end of Heart Failure Tab************************************-->
				<!--********************This is start of Coronary Artery Tab************************************-->

				<div class="tab-pane fade " id="pills-artery" role="tabpanel"
					aria-labelledby="pills-artery-tab">
					<table style="width: 100%">
						<tr>
							<th><h5>
									<b>SYMPTOM MANAGEMENT</b>
								</h5></th>
						</tr>
						<tr>
							<td>SOB</td>
							<td><div>
									<form:radiobutton path="cad.sob" label="Yes" />

									<form:radiobutton path="cad.sob" label="No" />


								</div></td>
							<td><form:textarea path="cad.sobComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>DOE</td>
							<td><div>
									<form:radiobutton path="cad.doe" label="Yes" />

									<form:radiobutton path="cad.doe" label="No" />


								</div></td>
							<td><form:textarea path="cad.doeComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>PND</td>
							<td><div>
									<form:radiobutton path="cad.pnd" label="Yes" />

									<form:radiobutton path="cad.pnd" label="No" />


								</div></td>
							<td><form:textarea path="cad.pndComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>

						<tr>
							<td>Chest Pain/Pressure</td>
							<td><div>
									<form:radiobutton path="cad.chestPainPressure" label="Yes" />

									<form:radiobutton path="cad.chestPainPressure" label="No" />


								</div></td>
							<td><form:textarea path="cad.chestPainPressureComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Fatigue</td>
							<td><div>
									<form:radiobutton path="cad.fatigue" label="Yes" />

									<form:radiobutton path="cad.fatigue" label="No" />


								</div></td>
							<td><form:textarea path="cad.fatigueComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
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
									<form:radiobutton path="cad.antiplateletTherapy" label="Yes" />

									<form:radiobutton path="cad.antiplateletTherapy" label="No" />


								</div></td>
							<td><form:textarea path="cad.antiplateletTherapyComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>ACE/ARB</td>
							<td><div>
									<form:radiobutton path="cad.aceArb" label="Yes" />

									<form:radiobutton path="cad.aceArb" label="No" />


								</div></td>
							<td><form:textarea path="cad.aceArbComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Beta Blocker</td>
							<td><div>
									<form:radiobutton path="cad.betaBlocker" label="Yes" />

									<form:radiobutton path="cad.betaBlocker" label="No" />


								</div></td>
							<td><form:textarea path="cad.betaBlockerComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Lipid Management</td>
							<td><div>
									<form:radiobutton path="cad.lipidMgmt" label="Yes" />

									<form:radiobutton path="cad.lipidMgmt" label="No" />


								</div></td>
							<td><form:textarea path="cad.lipidMgmtComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Nitrites/Renexa</td>
							<td><div>
									<form:radiobutton path="cad.nitritesRenexa" label="Yes" />

									<form:radiobutton path="cad.nitritesRenexa" label="No" />


								</div></td>
							<td><form:textarea path="cad.nitritesRenexaComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Any changes in meds by another provider?</td>
							<td><div>
									<form:radiobutton path="cad.changesInMed" label="Yes" />

									<form:radiobutton path="cad.changesInMed" label="No" />


								</div></td>
							<td><form:textarea path="cad.changesInMedComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Compliant with medication</td>
							<td><div>
									<form:radiobutton path="cad.compliantWithMed" label="Yes" />

									<form:radiobutton path="cad.compliantWithMed" label="No" />


								</div></td>
							<td><form:textarea path="cad.compliantWithMedComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td><form:textarea path="cad.complaintChief"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<th><h5>
									<b>MEDICATION MANAGEMENT</b>
								</h5></th>
						</tr>
						<tr>
							<td>Enrolled in HHC</td>
							<td><div>
									<form:radiobutton path="cad.enrolledHhc" label="Yes" />

									<form:radiobutton path="cad.enrolledHhc" label="No" />


								</div></td>
							<td><form:textarea path="cad.enrolledHhcComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Referred to Social Worker?</td>
							<td><div>
									<form:radiobutton path="cad.referredToSocialWorker" label="Yes" />

									<form:radiobutton path="cad.referredToSocialWorker" label="No" />


								</div></td>
							<td><form:textarea path="cad.referredToSocialWorkerComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Referred to Lifestyle Coach?</td>
							<td><div>
									<form:radiobutton path="cad.referredToLifeStyleCoach"
										label="Yes" />

									<form:radiobutton path="cad.referredToLifeStyleCoach"
										label="No" />


								</div></td>
							<td><form:textarea
									path="cad.referredToLifeStyleCoachComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Referred to Physical Trainer?</td>

							<td><div>
									<form:radiobutton path="cad.referredToPhysicalTrainer"
										label="Yes" />

									<form:radiobutton path="cad.referredToPhysicalTrainer"
										label="No" />


								</div></td>
							<td><form:textarea
									path="cad.referredToPhysicalTrainerComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<th><h5>
									<b>TREATMENT GOALS</b>
								</h5></th>
						</tr>
						<tr>
							<td>Salt Restriction</td>
							<td><div>
									<form:radiobutton path="cad.saltRestriction" label="Yes" />

									<form:radiobutton path="cad.saltRestriction" label="No" />


								</div></td>
							<td><form:textarea path="cad.saltRestrictionComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Cholestrol Management</td>
							<td><div>
									<form:radiobutton path="cad.cholesterolMgmt" label="Yes" />

									<form:radiobutton path="cad.cholesterolMgmt" label="No" />


								</div></td>
							<td><form:textarea path="cad.cholesterolMgmtComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Home BP monitoring</td>
							<td><div>
									<form:radiobutton path="cad.homeBpMonitoring" label="Yes" />

									<form:radiobutton path="cad.homeBpMonitoring" label="No" />

								</div></td>
							<td><form:input path="cad.homeBpMonitoringReading" /></td>
						</tr>
						<tr>
							<td>Functional Assessment</td>
							<td><form:textarea path="cad.functionalAssessment"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Sleep Apnea Screening</td>
							<td><form:textarea path="cad.sleepApneaScreening"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<th><h5>
									<b>PROGNOSIS/EXPECTED OUTCOME(SELECT ONE)</b>
								</h5></th>
						</tr>
						<tr>
							<td><div>
									<form:radiobutton path="cad.prognosis"
										value="Patient Stable(low risk)"
										label="Patient Stable(low risk)" />

								</div>
								<div>
									<form:radiobutton path="cad.prognosis"
										value="Ofc Visit Needed(low/mod risk)"
										label="Ofc Visit Needed(low/mod risk)" />

								</div>
								<div>
									<form:radiobutton path="cad.prognosis"
										value="ER/Hosp Adm(mod/high risk)"
										label="ER/Hosp Adm(mod/high risk)" />

								</div>
								<div>
									<form:radiobutton path="cad.prognosis"
										value="Consult for Hospics/Palliative Care"
										label="Consult for Hospics/Palliative Care" />

								</div></td>
						</tr>
						<tr>
							<th>Provider Comments <form:textarea
									path="cad.providerComments" placeholder="Provider Comments"
									rows="6" cols="50" /></th>
						</tr>
					</table>

				</div>
				<!--********************This is end of Coronary Artery Tab************************************-->

				<!--********************This is start of Hypertension Tab**********************************-->
				<div class="tab-pane fade" id="pills-hypertension" role="tabpanel"
					aria-labelledby="pills-hypertension-tab">
					<table style="width: 100%">
						<tr>
							<th><h5>
									<b>SYMPTOM MANAGEMENT</b>
								</h5></th>
						</tr>
						<tr>
							<td>SOB</td>
							<td><div>
									<form:radiobutton path="ht.sob" label="Yes" />

									<form:radiobutton path="ht.sob" label="No" />

								</div></td>
							<td><form:textarea path="ht.sobComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>DOE</td>
							<td><div>
									<form:radiobutton path="ht.doe" label="Yes" />

									<form:radiobutton path="ht.doe" label="No" />

								</div></td>
							<td><form:textarea path="ht.doeComments"
									placeholder="Additional Information" /></td>
						</tr>
						<tr>
							<td>PND</td>
							<td><div>
									<form:radiobutton path="ht.pnd" label="Yes" />

									<form:radiobutton path="ht.pnd" label="No" />

								</div></td>
							<td><form:textarea path="ht.pndComments"
									placeholder="Additional Information" /></td>
						</tr>
						<tr>
							<td>Edema</td>
							<td><div>
									<form:radiobutton path="ht.edema" label="Yes" />

									<form:radiobutton path="ht.edema" label="No" />

								</div></td>
							<td><form:textarea path="ht.edemaComments"
									placeholder="Additional Information" /></td>
						</tr>

						<tr>
							<td>Chest Pain/Pressure</td>
							<td><div>
									<form:radiobutton path="ht.chestPainPressure" label="Yes" />

									<form:radiobutton path="ht.chestPainPressure" label="No" />

								</div></td>
							<td><form:textarea path="ht.chestPainPressureComments"
									placeholder="Additional Information" /></td>
						</tr>
						<tr>
							<td>Headache</td>
							<td><div>
									<form:radiobutton path="ht.headache" label="Yes" />

									<form:radiobutton path="ht.headache" label="No" />

								</div></td>
							<td><form:textarea path="ht.headacheComments"
									placeholder="Additional Information" /></td>
						</tr>
						<tr>
							<td>Fatigue</td>
							<td><div>
									<form:radiobutton path="ht.fatigue" label="Yes" />
									<form:radiobutton path="ht.fatigue" label="No" />
								</div></td>
							<td><form:textarea path="ht.fatigueComments"
									placeholder="Additional Information" /></td>
						</tr>
						<tr>
							<td>Weight Gain</td>
							<td><div>
									<form:radiobutton path="ht.weightGain" label="Yes" />
									<form:radiobutton path="ht.weightGain" label="No" />
								</div></td>
							<td><form:input path="ht.weightGainCurrent" /> <form:input
									path="ht.weightGainPrevious" /></td>
						</tr>

						<br>
						<br>
						<tr>
							<th><h5>
									<b>MEDICATION MANAGEMENT</b>
								</h5></th>
						</tr>

						<tr>
							<td>Beta Blocker</td>
							<td><div>
									<form:radiobutton path="ht.betaBlocker" label="Yes" />
									<form:radiobutton path="ht.betaBlocker" label="No" />
								</div></td>
							<td><form:textarea path="ht.betaBlockerComments"
									placeholder="Additional Information" /></td>
						</tr>
						<tr>
							<td>ACE/ARB</td>
							<td><div>
									<form:radiobutton path="ht.aceArb" label="Yes" />
									<form:radiobutton path="ht.aceArb" label="No" />
								</div></td>
							<td><form:textarea path="ht.aceArbComments"
									placeholder="Additional Information" /></td>
						</tr>
						<tr>
							<td>Aldosterone/Spironolactone</td>
							<td><div>
									<form:radiobutton path="ht.aldosteroneSpironolactone"
										label="Yes" />
									<form:radiobutton path="ht.aldosteroneSpironolactone"
										label="No" />
								</div></td>
							<td><form:textarea
									path="ht.aldosteroneSpironolactoneComments"
									placeholder="Additional Information" /></td>
						</tr>
						<tr>
							<td>Diuretic</td>
							<td><div>
									<form:radiobutton path="ht.diuretic" label="Yes" />
									<form:radiobutton path="ht.diuretic" label="No" />
								</div></td>
							<td><form:textarea path="ht.diureticComments"
									placeholder="Additional Information" /></td>
						</tr>
						<tr>
							<td>Bidil</td>
							<td><div>
									<form:radiobutton path="ht.bidil" label="Yes" />
									<form:radiobutton path="ht.bidil" label="No" />
								</div></td>
							<td><form:textarea path="ht.bidilComments"
									placeholder="Additional Information" /></td>
						</tr>
						<tr>
							<td>Any changes in meds by another provider?</td>
							<td><div>
									<form:radiobutton path="ht.changesInMed" label="Yes" />
									<form:radiobutton path="ht.changesInMed" label="No" />
								</div></td>
							<td><form:textarea path="ht.changesInMedComments"
									placeholder="Additional Information" /></td>
						</tr>
						<tr>
							<td>Compliant with medication</td>
							<td><div>
									<form:radiobutton path="ht.compliantWithMed" label="Yes" />
									<form:radiobutton path="ht.compliantWithMed" label="No" />
								</div></td>
							<td><form:textarea path="ht.compliantWithMedComments"
									placeholder="Additional Information" /></td>
						</tr>
						<tr>
							<td><form:textarea path="ht.complaintChief"
									placeholder="Additional Information" /></td>
						</tr>
						<tr>
							<th><h5>
									<b>COMM SERVICE/SOC SERVICE/HHC</b>
								</h5></th>
						</tr>
						<tr>
							<td>Enrolled in HHC</td>
							<td><div>
									<form:radiobutton path="ht.enrolledHhc" label="Yes" />
									<form:radiobutton path="ht.enrolledHhc" label="No" />
								</div></td>
							<td><form:textarea path="ht.enrolledHhcComments"
									placeholder="Additional Information" /></td>
						</tr>
						<tr>
							<td>Referred to Social Worker?</td>
							<td><div>
									<form:radiobutton path="ht.referredToSocialWorker" label="Yes" />
									<form:radiobutton path="ht.referredToSocialWorker" label="No" />
								</div></td>
							<td><form:textarea path="ht.referredToSocialWorkerComments"
									placeholder="Additional Information" /></td>
						</tr>
						<tr>
							<td>Referred to Lifestyle Coach?</td>
							<td><div>
									<form:radiobutton path="ht.referredToLifeStyleCoach"
										label="Yes" />
									<form:radiobutton path="ht.referredToLifeStyleCoach" label="No" />
								</div></td>
							<td><form:textarea
									path="ht.referredToLifeStyleCoachComments"
									placeholder="Additional Information" /></td>
						</tr>
						<tr>
							<td>Referred to Physical Trainer?</td>
							<td><div>
									<form:radiobutton path="ht.referredToPhysicalTrainer"
										label="Yes" />
									<form:radiobutton path="ht.referredToPhysicalTrainer"
										label="No" />
								</div></td>
							<td><form:textarea
									path="ht.referredToPhysicalTrainerComments"
									placeholder="Additional Information" /></td>
						</tr>
						<tr>
							<th><h5>
									<b>TREATMENT GOALS</b>
								</h5></th>
						</tr>
						<tr>
							<td>Salt Restriction</td>
							<td><div>
									<form:radiobutton path="ht.saltRestriction" label="Yes" />
									<form:radiobutton path="ht.saltRestriction" label="No" />
								</div></td>
							<td><form:textarea path="ht.saltRestrictionComments"
									placeholder="Additional Information" /></td>
						</tr>
						<tr>
							<td>Fluid Restriction</td>
							<td><div>
									<form:radiobutton path="ht.fluidRestriction" label="Yes" />
									<form:radiobutton path="ht.fluidRestriction" label="No" />
								</div></td>
							<td><form:textarea path="ht.fluidRestrictionComments"
									placeholder="Additional Information" /></td>
						</tr>
						<tr>
							<td>Cholestrol Management</td>
							<td><div>
									<form:radiobutton path="ht.cholesterolMgmt" label="Yes" />
									<form:radiobutton path="ht.cholesterolMgmt" label="No" />
								</div></td>
							<td><form:textarea path="ht.cholesterolMgmtComments"
									placeholder="Additional Information" /></td>
						</tr>
						<tr>
							<td>Home BP monitoring</td>
							<td><div>
									<form:radiobutton path="ht.homeBpMonitoring" label="Yes" />
									<form:radiobutton path="ht.homeBpMonitoring" label="No" />
								</div></td>
							<td><form:input path="ht.homeBpMonitoringReading" /></td>
						</tr>
						<tr>
							<td>Functional Assessment</td>
							<td><form:textarea path="ht.functionalAssessment"
									placeholder="Additional Information" /></td>
						</tr>
						<tr>
							<td>Sleep Apnea Screening</td>
							<td><form:textarea path="ht.sleepApneaScreening"
									placeholder="Additional Information" /></td>
						</tr>
						<tr>
							<th>Prognosis/Expected Outcome(select one)</th>
						</tr>
						<tr>
							<td><div>
									<form:radiobutton path="ht.prognosis"
										value=" Patient Stable(low risk)"
										label="Patient Stable(low risk)" />
								</div>
								<div>
									<form:radiobutton path="ht.prognosis"
										value="Ofc
									Visit Needed(low/mod risk) "
										label="Ofc Visit Needed(low/mod risk)" />
								</div>
								<div>
									<form:radiobutton path="ht.prognosis"
										value="ER/Hosp Adm(mod/high risk) "
										label="ER/Hosp Adm(mod/high risk)" />
								</div>
								<div>
									<form:radiobutton path="ht.prognosis"
										value="Consult for Hospics/Palliative Care "
										label="Consult for Hospics/Palliative Care" />
								</div></td>
						</tr>
						<tr>
							<th>Provider Comments <form:textarea
									path="ht.providerComments" placeholder="Provider Comments"
									rows="6" cols="50" /></th>
						</tr>
					</table>
				</div>
				<!--********************This is end of Hypertension Tab************************************-->

				<!--********************This is start of Arrhythmia Tab************************************-->

				<div class="tab-pane fade" id="pills-arrhythmia" role="tabpanel"
					aria-labelledby="pills-arrhythmia-tab">
					<table style="width: 100%">
						<tr>
							<th><h5>
									<b>SYMPTOM MANAGEMENT</b>
								</h5></th>
						</tr>
						<tr>
							<td>SOB</td>
							<td><div>
									<form:radiobutton path="ar.sob" label="Yes" />

									<form:radiobutton path="ar.sob" label="No" />

								</div></td>
							<td><form:textarea path="ar.sobComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Chest Pain/Pressure</td>
							<td><div>
									<form:radiobutton path="ar.chestPainPressure" label="Yes" />

									<form:radiobutton path="ar.chestPainPressure" label="No" />

								</div></td>
							<td><form:textarea path="ar.chestPainPressureComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Palpitations</td>
							<td><div>
									<form:radiobutton path="ar.palpitations" label="Yes" />

									<form:radiobutton path="ar.palpitations" label="No" />

								</div></td>
							<td><form:textarea path="ar.palpitationsComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Dizziness</td>
							<td><div>
									<form:radiobutton path="ar.dizziness" label="Yes" />

									<form:radiobutton path="ar.dizziness" label="No" />

								</div></td>
							<td><form:textarea path="ar.dizzinessComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Syncope/Near Syncope</td>
							<td><div>
									<form:radiobutton path="ar.syncopeNearSyncope" label="Yes" />

									<form:radiobutton path="ar.syncopeNearSyncope" label="No" />

								</div></td>
							<td><form:textarea path="ar.syncopeNearSyncopeComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Bleeding</td>
							<td><div>
									<form:radiobutton path="ar.bleeding" label="Yes" />

									<form:radiobutton path="ar.bleeding" label="No" />

								</div></td>
							<td><form:textarea path="ar.bleedingComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>

						<tr>
							<td>Weakness/Fatigue</td>
							<td><div>
									<form:radiobutton path="ar.weaknessFatigue" label="Yes" />

									<form:radiobutton path="ar.weaknessFatigue" label="No" />

								</div></td>
							<td><form:textarea path="ar.weaknessFatigueComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>


						<br>
						<br>
						<tr>
							<th><h5>
									<b>MEDICATION MANAGEMENT</b>
								</h5></th>
						</tr>

						<tr>
							<td>Antiarrhythmics</td>
							<td><div>
									<form:radiobutton path="ar.antiarrhythmics" label="Yes" />

									<form:radiobutton path="ar.antiarrhythmics" label="No" />

								</div></td>
							<td><form:textarea path="ar.antiarrhythmicsComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Antiplatelet Therapy</td>
							<td><div>
									<form:radiobutton path="ar.antiplateletTherapy" label="Yes" />

									<form:radiobutton path="ar.antiplateletTherapy" label="No" />

								</div></td>
							<td><form:textarea path="ar.antiplateletTherapyComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Anticoagulants(warfarin/pradaxa)</td>
							<td><div>
									<form:radiobutton path="ar.anticoagulants" label="Yes" />

									<form:radiobutton path="ar.anticoagulants" label="No" />

								</div></td>
							<td><form:textarea path="ar.anticoagulantsComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>

						<tr>
							<td>Any changes in meds by another provider?</td>
							<td><div>
									<form:radiobutton path="ar.changesInMed" label="Yes" />

									<form:radiobutton path="ar.changesInMed" label="No" />

								</div></td>
							<td><form:textarea path="ar.changesInMedComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Compliant with medication</td>
							<td><div>
									<form:radiobutton path="ar.compliantWithMed" label="Yes" />

									<form:radiobutton path="ar.compliantWithMed" label="No" />

								</div></td>
							<td><form:textarea path="ar.compliantWithMedComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td><form:textarea path="ar.complaintChief"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<th><h5>
									<b>COMM SERV/SOC SERV/HHC</b>
								</h5></th>
						</tr>
						<tr>
							<td>Enrolled in HHC?</td>
							<td><div>
									<form:radiobutton path="ar.enrolledHhc" label="Yes" />

									<form:radiobutton path="ar.enrolledHhc" label="No" />

								</div></td>
							<td><form:textarea path="ar.enrolledHhcComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Referred to Social Worker?</td>
							<td><div>
									<form:radiobutton path="ar.referredToSocialWorker" label="Yes" />

									<form:radiobutton path="ar.referredToSocialWorker" label="No" />

								</div></td>
							<td><form:textarea path="ar.referredToSocialWorkerComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Referred to Lifestyle Coach?</td>
							<td><div>
									<form:radiobutton path="ar.referredToLifeStyleCoach"
										label="Yes" />

									<form:radiobutton path="ar.referredToLifeStyleCoach" label="No" />

								</div></td>
							<td><form:textarea
									path="ar.referredToLifeStyleCoachComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Referred to Physical Trainer?</td>
							<td><div>
									<form:radiobutton path="ar.referredToPhysicalTrainer"
										label="Yes" />

									<form:radiobutton path="ar.referredToPhysicalTrainer"
										label="No" />

								</div></td>
							<td><form:textarea
									path="ar.referredToPhysicalTrainerComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<th><h5>
									<b>TREATMENT GOALS</b>
								</h5></th>
						</tr>
						<tr>
							<td>Creatinine Clearance</td>
							<td><form:textarea path="ar.creatinineClearanceComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>PT/INR, Home INR results</td>
							<td><form:textarea path="ar.ptInrComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Fall Risk</td>
							<td><form:textarea path="ar.fallRiskComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Home BP Monitoring</td>
							<td><div>
									<form:radiobutton path="ar.homeBpMonitoring" label="Yes" />
									Yes
									<form:radiobutton path="ar.homeBpMonitoring" label="No" />
									No

								</div></td>
							<td><form:input path="ar.homeBpMonitoringReading" /></td>
						</tr>
						<tr>
							<td>Functional Assessment</td>
							<td><form:textarea path="ar.functionalAssessment"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Sleep Apnea Screening</td>
							<td><form:textarea path="ar.sleepApneaScreening"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
						</tr>
						<tr>
							<td>Nutrition</td>
							<td><form:textarea path="ar.nutrition"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<th><h5>
									<b>PROGNOSIS/EXPECTED OUTCOME(SELECT ONE)</b>
								</h5></th>
						</tr>
						<tr>
							<td><div>
									<form:radiobutton path="ar.prognosis"
										value=" Patient Stable(low risk)"
										label="Patient Stable(low risk)" />
								</div>
								<div>
									<form:radiobutton path="ar.prognosis"
										value="Ofc
									Visit Needed(low/mod risk) "
										label="Ofc Visit Needed(low/mod risk)" />
								</div>
								<div>
									<form:radiobutton path="ar.prognosis"
										value="ER/Hosp Adm(mod/high risk) "
										label="ER/Hosp Adm(mod/high risk)" />
								</div>
								<div>
									<form:radiobutton path="ar.prognosis"
										value="Consult for Hospics/Palliative Care "
										label="Consult for Hospics/Palliative Care" />
								</div></td>
						</tr>
						<tr>
							<th>Provider Comments <form:textarea
									path="ar.providerComments" placeholder="Provider Comments"
									rows="6" cols="50" /></th>
						</tr>
					</table>
				</div>
				<!--********************This is end of Arrhythmia Tab************************************-->

				<!--********************This is start of Peripheral Vascular Disease Tab************************************-->
				<div class="tab-pane fade" id="pills-peripheral" role="tabpanel"
					aria-labelledby="pills-peripheral-tab">
					<table style="width: 100%">
						<tr>
							<th><h5>
									<b>SYMPTOM MANAGEMENT</b>
								</h5></th>
						</tr>
						<tr>
							<td>SOB</td>
							<td><div>
									<form:radiobutton path="pvd.sob" label="Yes" />

									<form:radiobutton path="pvd.sob" label="No" />

								</div></td>
							<td><form:textarea path="pvd.sobComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Chest Pain/Pressure</td>
							<td><div>
									<form:radiobutton path="pvd.chestPainPressure" label="Yes" />

									<form:radiobutton path="pvd.chestPainPressure" label="No" />

								</div></td>
							<td><form:textarea path="pvd.chestPainPressureComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Leg Pain</td>
							<td><div>
									<form:radiobutton path="pvd.legPain" label="Yes" />

									<form:radiobutton path="pvd.legPain" label="No" />

								</div></td>
							<td><form:textarea path="pvd.legPainComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Leg Swelling</td>
							<td><div>
									<form:radiobutton path="pvd.legSwelling" label="Yes" />

									<form:radiobutton path="pvd.legSwelling" label="No" />

								</div></td>
							<td><form:textarea path="pvd.legSwellingComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Skin Color Changes</td>
							<td><div>
									<form:radiobutton path="pvd.skinColorChanges" label="Yes" />

									<form:radiobutton path="pvd.skinColorChanges" label="No" />

								</div></td>
							<td><form:textarea path="pvd.skinColorChangesComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Skin Breakdown</td>
							<td><div>
									<form:radiobutton path="pvd.skinBreakdown" label="Yes" />

									<form:radiobutton path="pvd.skinBreakdown" label="No" />

								</div></td>
							<td><form:textarea path="pvd.skinBreakdownComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>

						<tr>
							<td>Fever/Chills</td>
							<td><div>
									<form:radiobutton path="pvd.feverChills" label="Yes" />

									<form:radiobutton path="pvd.feverChills" label="No" />

								</div></td>
							<td><form:textarea path="pvd.feverChillsComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<br>
						<tr>
							<th><h5>
									<b>MEDICATION MANAGEMENT</b>
								</h5></th>
						</tr>
						<tr>
							<td>Antiplatelet Therapy</td>
							<td><div>
									<form:radiobutton path="pvd.antiplateletTherapy" label="Yes" />

									<form:radiobutton path="pvd.antiplateletTherapy" label="No" />

								</div></td>
							<td><form:textarea path="pvd.antiplateletTherapyComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Anticoagulants(warfarin/pradaxa)</td>
							<td><div>
									<form:radiobutton path="pvd.anticoagulants" label="Yes" />

									<form:radiobutton path="pvd.anticoagulants" label="No" />

								</div></td>
							<td><form:textarea path="pvd.anticoagulantsComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>

						<tr>
							<td>Any changes in meds by another provider?</td>
							<td><div>
									<form:radiobutton path="pvd.changesInMed" label="Yes" />

									<form:radiobutton path="pvd.changesInMed" label="No" />

								</div></td>
							<td><form:textarea path="pvd.changesInMedComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Compliant with medication</td>
							<td><div>
									<form:radiobutton path="pvd.compliantWithMed" label="Yes" />

									<form:radiobutton path="pvd.compliantWithMed" label="No" />

								</div></td>
							<td><form:textarea path="pvd.compliantWithMedComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td><form:textarea path="pvd.complaintChief"
									placeholder="Chief Complaint" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<th><h5>
									<b>COMM SERV/SOC SERV/HHC</b>
								</h5></th>
						</tr>
						<tr>
							<td>Enrolled in HHC?</td>
							<td><div>
									<form:radiobutton path="pvd.enrolledHhc" label="Yes" />

									<form:radiobutton path="pvd.enrolledHhc" label="No" />

								</div></td>
							<td><form:textarea path="pvd.enrolledHhcComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Referred to Social Worker?</td>
							<td><div>
									<form:radiobutton path="pvd.referredToSocialWorker" label="Yes" />

									<form:radiobutton path="pvd.referredToSocialWorker" label="No" />

								</div></td>
							<td><form:textarea path="pvd.referredToSocialWorkerComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Referred to Lifestyle Coach?</td>
							<td><div>
									<form:radiobutton path="pvd.referredToLifeStyleCoach"
										label="Yes" />

									<form:radiobutton path="pvd.referredToLifeStyleCoach"
										label="No" />

								</div></td>
							<td><form:textarea
									path="pvd.referredToLifeStyleCoachComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Referred to Physical Trainer?</td>
							<td><div>
									<form:radiobutton path="pvd.referredToPhysicalTrainer"
										label="Yes" />

									<form:radiobutton path="pvd.referredToPhysicalTrainer"
										label="No" />

								</div></td>
							<td><form:textarea
									path="pvd.referredToPhysicalTrainerComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<th><h5>
									<b>TREATMENT GOALS</b>
								</h5></th>
						</tr>
						<tr>
							<td>Leg Elevation</td>
							<td><div>
									<form:radiobutton path="pvd.legElevation" label="Yes" />

									<form:radiobutton path="pvd.legElevation" label="No" />

								</div></td>
							<td><form:textarea path="pvd.legElevationComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Compression Stockings</td>
							<td><div>
									<form:radiobutton path="pvd.compressionStockings" label="Yes" />
									<form:radiobutton path="pvd.compressionStockings" label="No" />
								</div></td>
							<td><form:textarea path="pvd.compressionStockingsComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Salt Restrictions</td>
							<td><div>
									<form:radiobutton path="pvd.saltRestrictions" label="Yes" />

									<form:radiobutton path="pvd.saltRestrictions" label="No" />

								</div></td>
							<td><form:textarea path="pvd.saltRestrictionsComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Diuretic</td>
							<td><div>
									<form:radiobutton path="pvd.diuretic" label="Yes" />

									<form:radiobutton path="pvd.diuretic" label="No" />

								</div></td>
							<td><form:textarea path="pvd.diureticComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Cholestrol Management</td>
							<td><form:textarea path="pvd.cholestrolMgmtComments"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>
						<tr>
							<td>Home BP Monitoring</td>
							<td><div>
									<form:radiobutton path="pvd.homeBpMonitoring" label="Yes" />

									<form:radiobutton path="pvd.homeBpMonitoring" label="No" />


								</div></td>
							<td><form:input path="pvd.homeBpMonitoringReading" /></td>
						</tr>
						<tr>
							<td>Functional Assessment</td>
							<td><form:textarea path="pvd.functionalAssessment"
									placeholder="Additional Information" rows="2" cols="50" /></td>
						</tr>

						<tr>
							<th><h5>
									<b>PROGNOSIS/EXPECTED OUTCOME(SELECT ONE)</b>
								</h5></th>
						</tr>
						<tr>
							<td><div>
									<form:radiobutton path="pvd.prognosis"
										value=" Patient Stable(low risk)"
										label="Patient Stable(low risk)" />
								</div>
								<div>
									<form:radiobutton path="pvd.prognosis"
										value="Ofc
									Visit Needed(low/mod risk) "
										label="Ofc Visit Needed(low/mod risk)" />
								</div>
								<div>
									<form:radiobutton path="pvd.prognosis"
										value="ER/Hosp Adm(mod/high risk) "
										label="ER/Hosp Adm(mod/high risk)" />
								</div>
								<div>
									<form:radiobutton path="pvd.prognosis"
										value="Consult for Hospics/Palliative Care "
										label="Consult for Hospics/Palliative Care" />
								</div></td>
						</tr>
						<tr>
							<th>Provider Comments <form:textarea
									path="pvd.providerComments" placeholder="Provider Comments"
									rows="6" cols="50" /></th>
						</tr>
					</table>
				</div>
				<!--********************This is end of Peripheral Vascular Disease Tab************************************-->
			</div>
		</form:form>


	</div>
</body>
</html>