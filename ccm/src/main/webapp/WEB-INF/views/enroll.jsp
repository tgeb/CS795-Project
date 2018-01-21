<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CCM Enrollment Form</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">

<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="stylesheet"	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
	$(function() {
		$("#datepickerEnroll").datepicker();
		$("#datepickerDob").datepicker();

	});
</script>
<script>
	$('[name="cod"]').on('change', function() {
		$('#select').toggle(this.checked);
	}).change();
</script>
<style type="text/css">

.error{
	color:red;
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
	<br>

	<div class="jumbotron">
	
		<a href="${pageContext.request.contextPath}/adminHome" class="btn btn-primary active">Back to admin home</a>
		
		<h2>Enrollment Form</h2>
		
		<br>
		<div class="container">
			<h6>(<label style="color: red">*</label>) Required fields</h6>
			<form:form action="savePatient" modelAttribute="patient"
				name="enrollForm">
				<form:input type="hidden" path="id"/>
				<table>
					<tr>
						<td>First Name:<label style="color: red">*</label></td>
						<td><form:errors path="fName" cssClass="error"/><br>
						<form:input path="fName" /></td>
						
					</tr>
					<tr>
						<td>Last Name:<label style="color: red">*</label></td>
						<td><form:errors path="lName"  cssClass="error"/><br>
						<form:input path="lName" /></td>
						
					</tr>
					<tr>
						<td>DoB:<label style="color: red">*</label></td>
						<td><form:errors path="dob" cssClass="error"/><br>
						<form:input id="datepickerDob" path="dob" /></td>
						
					</tr>
					<tr>
						<td>Enrollment Date:<label style="color: red">*</label></td>
						<td><form:errors path="enrollmentDate" cssClass="error"/><br>
						<form:input id="datepickerEnroll" path="enrollmentDate" /></td>
						
					</tr>
					<tr>
						<td>Contact Information 1:<label style="color: red">*</label></td>
						<td><form:errors path="contactInfoOne" cssClass="error"/><br>
						<form:input path="contactInfoOne" /></td>
					</tr>
					<tr>
						<td>Contact Information 2:</td>
						<td><form:input path="contactInfoTwo" /></td>
					</tr>
					<tr>
						<td>Care Giver 1:<label style="color: red">*</label></td>
						<td><form:errors path="careGiverOne" cssClass="error"/><br>
						<form:input path="careGiverOne" /></td>
					</tr>
					<tr>
						<td>Care Giver 2:</td>
						<td><form:input path="careGiverTwo" /></td>
					</tr>
					<tr>
						<td colspan="2"><b>Chronic Conditions to Manage</b></td>
					</tr>
					<tr>

						<td><form:checkbox id="heart" path="enrolledHeartFailure"
								onclick="javascript:document.enrollForm.heartFailureAdditional.hidden=!document.enrollForm.heart.checked;" />
							HeartFailure<br> <form:textarea
								path="heartFailureAdditional" hidden="true"
								id="heartFailureAdditional" name="heartFailureAdditional"
								rows="2" cols="50" /></td>

					</tr>
					<tr>

						<td><form:checkbox id="coronary"
								path="enrolledCoronaryArteryDisease"
								onclick="javascript:document.enrollForm.coronaryAdditional.hidden=!document.enrollForm.coronary.checked;" />
							Coronary Artery Disease<br> <form:textarea
								path="coronaryAdditional" hidden="true" id="coronaryAdditional"
								name="coronaryAdditional" rows="2" cols="50" /></td>
					</tr>

					<tr>

						<td><form:checkbox id="hypertension"
								path="enrolledHypertension"
								onclick="javascript:document.enrollForm.hypertensionAdditional.hidden=!document.enrollForm.hypertension.checked;" />
							Hypertension<br> <form:textarea
								path="hypertensionAdditional" hidden="true"
								id="hypertensionAdditional" name="hypertensionAdditional"
								rows="2" cols="50" /></td>
					</tr>
					<tr>

						<td><form:checkbox id="arrhythmia"
								path="enrolledArrhythmia"
								onclick="javascript:document.enrollForm.arrhythmiaAdditional.hidden=!document.enrollForm.arrhythmia.checked;" />
							Arrhythmia<br> <form:textarea path="arrhythmiaAdditional"
								hidden="true" id="arrhythmiaAdditional"
								name="arrhythmiaAdditional" rows="2" cols="50" /></td>
					</tr>
					<tr>

						<td><form:checkbox id="peripheral"
								path="enrolledPeripheralVascularDz"
								onclick="javascript:document.enrollForm.peripheralAdditional.hidden=!document.enrollForm.peripheral.checked;" />
							Peripheral Vascular Disease<br> <form:textarea
								path="peripheralAdditional" hidden="true"
								id="peripheralAdditional" name="peripheralAdditional" rows="2"
								cols="50" /></td>
					</tr>
					<tr>
						<td colspan="2"><b>REASON FOR ENROLLMENT IN CHRONIC CARE
								MANAGEMENT:</b></td>
					</tr>
					<tr>
						<td colspan="2"><form:textarea path="enrollmentReason"
								id="reasons" name="reasons" rows="2" cols="50" /></td>
					</tr>
					<tr>
						<td>Care Complexity:</td>
						<td>
							<ul>
								<form:select path="careComplexity">
									<form:option value="Simple CCM">Simple CCM</form:option>
									<form:option value="Complex CCM">Complex CCM</form:option>
								</form:select>
							</ul>
						</td>
					</tr>

					<tr>
						<td colspan="2"><b>COMPREHENSIVE CARE PLAN SUMMARY:</b></td>
					</tr>
					<tr>
						<td>Heart Failure:</td>
						<td>
							<ul>
								<form:select path="heartFailureDiagnosis">
									<form:option value="">Select a diagnosis</form:option>
									<form:option value="I50.22 Systolic HF chronic">I50.22  &nbsp;Systolic HF chronic</form:option>
									<form:option value="I50.23S ystolic HF acute on chronic">I50.23  &nbsp;Systolic HF acute on chronic</form:option>
									<form:option value="I50.32 Diastolic HF chronic">I50.32  &nbsp;Diastolic HF chronic</form:option>
									<form:option
										value="I50.33 Diastolic HF acute on chronic">I50.33  &nbsp;Diastolic HF acute a chronic</form:option>
									<form:option
										value="I50.42 Systolic & diastolic HF chronic">I50.42  &nbsp;Systolic & diastolic HF chronic</form:option>
									<form:option
										value="I50.43  Sys & diastolic HF acute on chronic">I50.43  &nbsp;Sys & diastolic HF acute on chronic</form:option>
								</form:select>
							</ul>
						</td>
					</tr>

					<tr>
						<td>Coronary Artery Disease:</td>
						<td>
							<ul>
								<form:select path="coronaryArteryFailureDiagnosis">
									<form:option value="">Select a diagnosis</form:option>
									<form:option value="I25.10 CAD w/o angina">I25.10  &nbsp;CAD w/o angina</form:option>
									<form:option value="I25.110 CAD w/ unstable angina">I25.110  &nbsp;CAD w/ unstable angina</form:option>
									<form:option value="I25.111 CAD w/ angina w/ spasm">I25.111  &nbsp;CAD w/ angina w/ spasm</form:option>
									<form:option value="I25.118 CAD w/ other angina">I25.118  &nbsp;CAD w/ other angina</form:option>
									<form:option value="I25.119 CAD w/ unspecified angina">I25.119  &nbsp;CAD w/ unspecified angina</form:option>
									<form:option value="I25.700 CAD of bypass graft w/ angina">I25.700  &nbsp;CAD of bypass graft w/ angina</form:option>
									<form:option
										value="I25.701 CAD of bypass graft w/ angina w/ spasm">II25.701  &nbsp;CAD of bypass graft w/ angina w/ spasm</form:option>
									<form:option
										value="I25.708 CAD of bypass graft w/ other angina">I25.708  &nbsp;CAD of bypass graft w/ other angina</form:option>
									<form:option
										value="I25.709 CAD of bypass graft w/ unspec angina">I25.709  &nbsp;CAD of bypass graft w/ unspec angina</form:option>
									<form:option value="I25.810 CAD of bypass graft w/o angina">I25.810  &nbsp;CAD of bypass graft w/o angina</form:option>
									<form:option value="I25.82 Chronic total occlusion">I25.82  &nbsp;Chronic total occlusion</form:option>
									<form:option value="I25.83 CAD due to lipid rich placque">I25.83  &nbsp;CAD due to lipid rich placque</form:option>
									<form:option value="I25.84 CAD due to calcified coronary lesion">I25.84  &nbsp;CAD due to calcified coronary lesion</form:option>
									<form:option value="I25.9 Chronic Ischemic Heart Dz">I25.9  &nbsp;Chronic Ischemic Heart Dz</form:option>
								</form:select>

							</ul>
						</td>
					</tr>
					<tr>
						<td>Hypertension with without heart dz:</td>
						<td>
							<ul>
								<form:select path="hypertensionDiagnosis">
									<form:option value="">Select a diagnosis</form:option>
									<form:option value="I10 Essential hypertension (HTN)">I10 &nbsp;Essential hypertension (HTN)</form:option>
									<form:option
										value="I11.0 Hypertensive heart dz w/ heart failure">I11.0  &nbsp;Hypertensive heart dz w/ heart failure</form:option>
									<form:option
										value="I11.9 Hypertensive heart dz w/o heart failure">I11.9 &nbsp;Hypertensive heart dz w/o heart failure</form:option>
									<form:option
										value="I12.0 Hypertensive chronic kidney dz (stage 5)">I12.0  &nbsp;Hypertensive chronic kidney dz (stage 5)</form:option>
									<form:option
										value="I12.9 Hypertensive chronic kidney dz (stg 1-4)">I12.9  &nbsp;Hypertensive chronic kidney dz (stg 1-4)</form:option>
									<form:option
										value="I13.0 Hypertensive hrt dz w/ HF & CKD (stg 1-4)">I13.0  &nbsp;Hypertensive hrt dz w/ HF & CKD (stg 1-4)</form:option>
									<form:option
										value="I13.2 Hypertensive hrt dz w/ HF & CKD (stg 5)">I13.2  &nbsp;Hypertensive hrt dz w/ HF & CKD (stg 5)</form:option>
									<form:option
										value="I13.10 Hypertensive hrt dz w/o HF & CKD (stg 1-4)">I13.10 &nbsp;Hypertensive hrt dz w/o HF & CKD (stg 1-4)</form:option>
									<form:option
										value="I25.11 Hypertensive hrt dz w/o HF & CKD (stg 5)">I25.11 &nbsp;Hypertensive hrt dz w/o HF & CKD (stg 5)</form:option>
								</form:select>
							</ul>
						</td>
					</tr>
					<tr>
						<td>Arrhythmia:</td>
						<td>
							<ul>
								<form:select path="arrhythmiaDiagnosis">
									<form:option value="">Select a diagnosis</form:option>
									<form:option value="I48.91 Afib unspecified">I48.91 Afib unspecified</form:option>
									<form:option value="I48.0 Proximal AF">I48.0  &nbsp;&nbsp;Proximal AF</form:option>
									<form:option value="I48.1 Persistent AF">I48.1  &nbsp;&nbsp;Persistent AF</form:option>
									<form:option value="I48.2 Chronic AF">I48.2  &nbsp;&nbsp;Chronic AF</form:option>
									<form:option value="I48.92 Aflutter unspecified">I48.92 Aflutter unspecified</form:option>
									<form:option value="I47.1 SVT">I47.1  &nbsp;&nbsp;SVT</form:option>
									<form:option value="I47.2 Ventricular tachycardia">I47.2  &nbsp;&nbsp;Ventricular tachycardia</form:option>
									<form:option value="I47.9 Proximal tachy unspecified">I47.9  &nbsp;&nbsp;Proximal tachy unspecified</form:option>
								</form:select>

							</ul>
						</td>
					</tr>
					<tr>
						<td>Peripheral Vascular Disease:</td>
						<td>
							<ul>
								<form:select path="peripheralVascularDzDiagnosis">
									<form:option value="">Select a diagnosis</form:option>
									<form:option value="I70.211 Claudication intermittent R leg">I70.211 &nbsp;Claudication intermittent R leg</form:option>
									<form:option value="I70.212 Claudication intermittent L leg">I70.212 &nbsp;Claudication intermittent L leg</form:option>
									<form:option
										value="I70.213 Claudication intermittent bilat lower ext">I70.213 &nbsp;Claudication intermittent bilat lower ext</form:option>
									<form:option value="I70.221 Atherosclerosis w/ rest pain R leg">I70.221 &nbsp;Atherosclerosis w/ rest pain R leg</form:option>
									<form:option value="I70.222 Atherosclerosis w/ rest pain L leg">I70.222 &nbsp;Atherosclerosis w/ rest pain L leg</form:option>
									<form:option
										value="I70.223 Atherosclerosis w/ rest pain bilat low ext">I70.223 &nbsp;Atherosclerosis w/ rest pain bilat low ext</form:option>
									<form:option value="I73.9 PVD">I73.9 &nbsp;PVD</form:option>
									<form:option
										value="I87.2Venous (peripheral) insufficiency chronic">I87.2 &nbsp;Venous (peripheral) insufficiency chronic</form:option>
									<form:option value="I70.1 Atherosclerosis RENAL artery">I70.1 &nbsp;Atherosclerosis RENAL artery</form:option>
								</form:select>

							</ul>
						</td>
					</tr>

					<tr>
						<td colspan="2"><input class="btn btn-primary" type="submit" value="Submit" /></td>
					</tr>
				</table>
			</form:form>
		</div>
	</div>
</body>
</html>