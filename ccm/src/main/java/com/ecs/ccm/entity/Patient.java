package com.ecs.ccm.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Type;
import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "patient")
public class Patient {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id",updatable = false, nullable = false)
	private int id;

	@NotBlank(message="Please enter first name")
	@Column(name = "first_name")
	private String fName;

	@NotBlank(message="Please enter last name")
	@Column(name = "last_name")
	private String lName;

	@NotNull(message="Please enter date of birth")
	@Temporal(TemporalType.DATE)
	@Column(name = "dob")	
	private Date dob;

	@NotNull(message="Please enter enrollment date")
	@Temporal(TemporalType.DATE)
	@Column(name = "enrollment_date")	
	private Date enrollmentDate;

	@NotBlank(message="Please enter care giver details")
	@Column(name = "care_giver_one")
	private String careGiverOne;

	@Column(name = "care_giver_two")
	private String careGiverTwo;

	@NotBlank(message="Please enter contact details")
	@Column(name = "contact_one")
	private String contactInfoOne;

	@Column(name = "contact_two")
	private String contactInfoTwo;

	@Column(name = "heartfailure")
	@Type(type = "yes_no")
	private boolean enrolledHeartFailure;

	@Column(name = "heartfailure_additional")
	private String heartFailureAdditional;

	@Column(name = "coronary")
	@Type(type = "yes_no")
	private boolean enrolledCoronaryArteryDisease;

	@Column(name = "coronary_additional")
	private String coronaryAdditional;

	@Column(name = "hypertension")
	@Type(type = "yes_no")
	private boolean enrolledHypertension;

	@Column(name = "hypertension_additional")
	private String hypertensionAdditional;

	@Column(name = "arrhythmia")
	@Type(type = "yes_no")
	private boolean enrolledArrhythmia;

	@Column(name = "arrhythmia_additional")
	private String arrhythmiaAdditional;

	@Column(name = "peripheral")
	@Type(type = "yes_no")
	private boolean enrolledPeripheralVascularDz;

	@Column(name = "peripheral_additional")
	private String peripheralAdditional;

	@Column(name = "enrollment_reason")
	private String enrollmentReason;

	@Column(name = "care_complexity")
	private String careComplexity;

	@Column(name = "heartfailure_diagnosis")
	private String heartFailureDiagnosis;

	@Column(name = "coronary_diagnosis")
	private String coronaryArteryFailureDiagnosis;

	@Column(name = "hypertension_diagnosis")
	private String hypertensionDiagnosis;

	@Column(name = "arrhythmia_diagnosis")
	private String arrhythmiaDiagnosis;

	@Column(name = "peripheral_diagnosis")
	private String peripheralVascularDzDiagnosis;

	@OneToMany(mappedBy = "patient", 
			   cascade = CascadeType.ALL, 
			   fetch = FetchType.LAZY)
	private List<Condition> conditionList;
	
	
	public Patient() {

	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public void setPatientId(int id) {
		this.id = id;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public Date getEnrollmentDate() {
		return enrollmentDate;
	}

	public void setEnrollmentDate(Date enrollmentDate) {
		this.enrollmentDate = enrollmentDate;
	}

	public String getCareGiverOne() {
		return careGiverOne;
	}

	public void setCareGiverOne(String careGiverOne) {
		this.careGiverOne = careGiverOne;
	}

	public String getCareGiverTwo() {
		return careGiverTwo;
	}

	public void setCareGiverTwo(String careGiverTwo) {
		this.careGiverTwo = careGiverTwo;
	}

	public String getContactInfoOne() {
		return contactInfoOne;
	}

	public void setContactInfoOne(String contactInfoOne) {
		this.contactInfoOne = contactInfoOne;
	}

	public String getContactInfoTwo() {
		return contactInfoTwo;
	}

	public void setContactInfoTwo(String contactInfoTwo) {
		this.contactInfoTwo = contactInfoTwo;
	}

	public boolean isEnrolledHeartFailure() {
		return enrolledHeartFailure;
	}

	public void setEnrolledHeartFailure(boolean enrolledHeartFailure) {
		this.enrolledHeartFailure = enrolledHeartFailure;
	}

	public String getHeartFailureAdditional() {
		return heartFailureAdditional;
	}

	public void setHeartFailureAdditional(String heartFailureAdditional) {
		this.heartFailureAdditional = heartFailureAdditional;
	}

	public boolean isEnrolledCoronaryArteryDisease() {
		return enrolledCoronaryArteryDisease;
	}

	public void setEnrolledCoronaryArteryDisease(boolean enrolledCoronaryArteryDisease) {
		this.enrolledCoronaryArteryDisease = enrolledCoronaryArteryDisease;
	}

	public String getCoronaryAdditional() {
		return coronaryAdditional;
	}

	public void setCoronaryAdditional(String coronaryAdditional) {
		this.coronaryAdditional = coronaryAdditional;
	}

	public boolean isEnrolledHypertension() {
		return enrolledHypertension;
	}

	public void setEnrolledHypertension(boolean enrolledHypertension) {
		this.enrolledHypertension = enrolledHypertension;
	}

	public String getHypertensionAdditional() {
		return hypertensionAdditional;
	}

	public void setHypertensionAdditional(String hypertensionAdditional) {
		this.hypertensionAdditional = hypertensionAdditional;
	}

	public boolean isEnrolledArrhythmia() {
		return enrolledArrhythmia;
	}

	public void setEnrolledArrhythmia(boolean enrolledArrhythmia) {
		this.enrolledArrhythmia = enrolledArrhythmia;
	}

	public String getArrhythmiaAdditional() {
		return arrhythmiaAdditional;
	}

	public void setArrhythmiaAdditional(String arrhythmiaAdditional) {
		this.arrhythmiaAdditional = arrhythmiaAdditional;
	}

	public boolean isEnrolledPeripheralVascularDz() {
		return enrolledPeripheralVascularDz;
	}

	public void setEnrolledPeripheralVascularDz(boolean enrolledPeripheralVascularDz) {
		this.enrolledPeripheralVascularDz = enrolledPeripheralVascularDz;
	}

	public String getPeripheralAdditional() {
		return peripheralAdditional;
	}

	public void setPeripheralAdditional(String peripheralAdditional) {
		this.peripheralAdditional = peripheralAdditional;
	}

	public String getEnrollmentReason() {
		return enrollmentReason;
	}

	public void setEnrollmentReason(String enrollmentReason) {
		this.enrollmentReason = enrollmentReason;
	}

	public String getCareComplexity() {
		return careComplexity;
	}

	public void setCareComplexity(String careComplexity) {
		this.careComplexity = careComplexity;
	}

	public String getHeartFailureDiagnosis() {
		return heartFailureDiagnosis;
	}

	public void setHeartFailureDiagnosis(String heartFailureDiagnosis) {
		this.heartFailureDiagnosis = heartFailureDiagnosis;
	}

	public String getCoronaryArteryFailureDiagnosis() {
		return coronaryArteryFailureDiagnosis;
	}

	public void setCoronaryArteryFailureDiagnosis(String coronaryArteryFailureDiagnosis) {
		this.coronaryArteryFailureDiagnosis = coronaryArteryFailureDiagnosis;
	}

	public String getHypertensionDiagnosis() {
		return hypertensionDiagnosis;
	}

	public void setHypertensionDiagnosis(String hypertensionDiagnosis) {
		this.hypertensionDiagnosis = hypertensionDiagnosis;
	}

	public String getArrhythmiaDiagnosis() {
		return arrhythmiaDiagnosis;
	}

	public void setArrhythmiaDiagnosis(String arrhythmiaDiagnosis) {
		this.arrhythmiaDiagnosis = arrhythmiaDiagnosis;
	}

	public String getPeripheralVascularDzDiagnosis() {
		return peripheralVascularDzDiagnosis;
	}

	public void setPeripheralVascularDzDiagnosis(String peripheralVascularDzDiagnosis) {
		this.peripheralVascularDzDiagnosis = peripheralVascularDzDiagnosis;
	}
		
	public void addEncounter(Condition condition) {
		if (conditionList == null)
			conditionList = new ArrayList<>();
		conditionList.add(condition);
		System.out.println("condition added for patient " + this.id);
		condition.setPatient(this);
	}

	public List<Condition> getConditionList() {
		System.out.println("inside getConditionList");
		return conditionList;
	}

	public void setConditionList(List<Condition> conditionList) {
		this.conditionList = conditionList;
	}

	@Override
	public String toString() {
		return "Patient [patientId=" + id + ", fName=" + fName + ", lName=" + lName + ", dob=" + dob
				+ ", enrollmentDate=" + enrollmentDate + ", careGiverOne=" + careGiverOne + ", careGiverTwo="
				+ careGiverTwo + ", contactInfoOne=" + contactInfoOne + ", contactInfoTwo=" + contactInfoTwo
				+ ", enrollmentHeartFailure=" + enrolledHeartFailure + ", heartFailureAdditional="
				+ heartFailureAdditional + ", enrollmentCoronaryArteryDisease=" + enrolledCoronaryArteryDisease
				+ ", coronaryAdditional=" + coronaryAdditional + ", enrollmentHypertension=" + enrolledHypertension
				+ ", hypertensionAdditional=" + hypertensionAdditional + ", enrollmentArrhythmia="
				+ enrolledArrhythmia + ", arrhythmiaAdditional=" + arrhythmiaAdditional
				+ ", enrollmentPeripheralVascularDz=" + enrolledPeripheralVascularDz + ", peripheralAdditional="
				+ peripheralAdditional + ", enrollmentReason=" + enrollmentReason + ", careComplexity=" + careComplexity
				+ ", heartFailureDiagnosis=" + heartFailureDiagnosis + ", coronaryArteryFailureDiagnosis="
				+ coronaryArteryFailureDiagnosis + ", hypertensionDiagnosis=" + hypertensionDiagnosis
				+ ", arrhythmiaDiagnosis=" + arrhythmiaDiagnosis + ", peripheralVascularDzDiagnosis="
				+ peripheralVascularDzDiagnosis + "]";
	}

}
