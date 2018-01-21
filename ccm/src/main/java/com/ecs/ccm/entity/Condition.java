package com.ecs.ccm.entity;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.TableGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Type;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public class Condition {

	@TableGenerator(name = "key_gen",
					table = "keys_gen",
					pkColumnName = "pk_name",
					valueColumnName = "pk_value",
					allocationSize = 30)
	@Id
	@GeneratedValue(strategy = GenerationType.TABLE,
					generator = "key_gen")
	@Column(name = "id")
	int id;

	@ManyToOne(fetch = FetchType.LAZY, 
			 cascade = { CascadeType.DETACH,
					     CascadeType.MERGE, 
					     CascadeType.PERSIST,
					     CascadeType.REFRESH })
	@JoinColumn(name = "patient_id")
	private Patient patient;

	@NotNull(message="required field")
	@Column(name = "encounter_date")	
	@Temporal(TemporalType.TIMESTAMP)
	private Date encounterDate;

	@NotNull(message="required field")
	@Column(name = "start_time_ma")
	@Temporal(TemporalType.TIMESTAMP)
	private Date startTimeMA;

	@NotNull(message="required field")
	@Column(name = "end_time_ma")
	@Temporal(TemporalType.TIMESTAMP)
	private Date endTimeMA;

	@Column(name = "time_spent_ma")
	private long elapsedTimeMA;

	@NotNull(message="required field")
	@Column(name = "start_time_md")
	@Temporal(TemporalType.TIMESTAMP)
	private Date startTimeMD;

	@NotNull(message="required field")
	@Column(name = "end_time_md")
	@Temporal(TemporalType.TIMESTAMP)
	private Date endTimeMD;

	@Column(name = "time_spent_md")
	private long elapsedTimeMD;

	@Column(name = "total_time")
	private long totalTime;

	@Column(name = "sob")
	@Type(type = "yes_no")
	private boolean sob;

	@Column(name = "sob_comments")
	private String sobComments;

	@Column(name = "chest_pain")
	@Type(type = "yes_no")
	private boolean chestPainPressure;

	@Column(name = "chest_pain_comments")
	private String chestPainPressureComments;

	@Column(name = "changes_in_med")
	@Type(type = "yes_no")
	private boolean changesInMed;

	@Column(name = "changes_med_comments")
	private String changesInMedComments;

	@Column(name = "compliant_with_med")
	@Type(type = "yes_no")
	private boolean compliantWithMed;

	@Column(name = "compliant_med_comments")
	private String compliantWithMedComments;

	@Column(name = "chief_complaint")
	private String complaintChief;

	@Column(name = "enrolled_hhc")
	@Type(type = "yes_no")
	private boolean enrolledHhc;

	@Column(name = "enrolled_hhc_comments")
	private String enrolledHhcComments;

	@Column(name = "referred_sw")
	@Type(type = "yes_no")
	private boolean referredToSocialWorker;

	@Column(name = "referred_sw_comments")
	private String referredToSocialWorkerComments;

	@Column(name = "referred_lsc")
	@Type(type = "yes_no")
	private boolean referredToLifeStyleCoach;

	@Column(name = "referred_lsc_comments")
	private String referredToLifeStyleCoachComments;

	@Column(name = "referred_pt")
	@Type(type = "yes_no")
	private boolean referredToPhysicalTrainer;

	@Column(name = "referred_pt_comments")
	private String referredToPhysicalTrainerComments;

	@Column(name = "functional_assessment")
	private String functionalAssessment;

	@Column(name = "home_bp")
	@Type(type = "yes_no")
	private boolean homeBpMonitoring;

	@Column(name = "home_bp_reading")
	private String homeBpMonitoringReading;

	@Column(name = "prognosis")
	private String prognosis;

	@Column(name = "provider_comments")
	private String providerComments;

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public Date getEncounterDate() {
		return encounterDate;
	}

	public void setEncounterDate(Date encounterDate) {
		this.encounterDate = encounterDate;
	}

	public Date getStartTimeMA() {
		return startTimeMA;
	}

	public void setStartTimeMA(Date startTimeMA) {
		this.startTimeMA = startTimeMA;
	}

	public Date getEndTimeMA() {
		return endTimeMA;
	}

	public void setEndTimeMA(Date endTimeMA) {
		this.endTimeMA = endTimeMA;
	}

	public long getElapsedTimeMA() {
		return elapsedTimeMA;
	}

	public void setElapsedTimeMA(long elapsedTimeMA) {
		this.elapsedTimeMA = elapsedTimeMA;
	}

	public Date getStartTimeMD() {
		return startTimeMD;
	}

	public void setStartTimeMD(Date startTimeMD) {
		this.startTimeMD = startTimeMD;
	}

	public Date getEndTimeMD() {
		return endTimeMD;
	}

	public void setEndTimeMD(Date endTimeMD) {
		this.endTimeMD = endTimeMD;
	}

	public long getElapsedTimeMD() {
		return elapsedTimeMD;
	}

	public void setElapsedTimeMD(long elapsedTimeMD) {
		this.elapsedTimeMD = elapsedTimeMD;
	}

	public long getTotalTime() {
		return totalTime;
	}

	public void setTotalTime(long totalTime) {
		this.totalTime = totalTime;
	}

	public Condition() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public boolean isSob() {
		return sob;
	}

	public void setSob(boolean sob) {
		this.sob = sob;
	}

	public String getSobComments() {
		return sobComments;
	}

	public void setSobComments(String sobComments) {
		this.sobComments = sobComments;
	}

	public boolean isChestPainPressure() {
		return chestPainPressure;
	}

	public void setChestPainPressure(boolean chestPainPressure) {
		this.chestPainPressure = chestPainPressure;
	}

	public String getChestPainPressureComments() {
		return chestPainPressureComments;
	}

	public void setChestPainPressureComments(String chestPainPressureComments) {
		this.chestPainPressureComments = chestPainPressureComments;
	}

	public boolean isChangesInMed() {
		return changesInMed;
	}

	public void setChangesInMed(boolean changesInMed) {
		this.changesInMed = changesInMed;
	}

	public String getChangesInMedComments() {
		return changesInMedComments;
	}

	public void setChangesInMedComments(String changesInMedComments) {
		this.changesInMedComments = changesInMedComments;
	}

	public boolean isCompliantWithMed() {
		return compliantWithMed;
	}

	public void setCompliantWithMed(boolean compliantWithMed) {
		this.compliantWithMed = compliantWithMed;
	}

	public String getCompliantWithMedComments() {
		return compliantWithMedComments;
	}

	public void setCompliantWithMedComments(String compliantWithMedComments) {
		this.compliantWithMedComments = compliantWithMedComments;
	}

	public String getComplaintChief() {
		return complaintChief;
	}

	public void setComplaintChief(String complaintChief) {
		this.complaintChief = complaintChief;
	}

	public boolean isEnrolledHhc() {
		return enrolledHhc;
	}

	public void setEnrolledHhc(boolean enrolledHhc) {
		this.enrolledHhc = enrolledHhc;
	}

	public String getEnrolledHhcComments() {
		return enrolledHhcComments;
	}

	public void setEnrolledHhcComments(String enrolledHhcComments) {
		this.enrolledHhcComments = enrolledHhcComments;
	}

	public boolean isReferredToSocialWorker() {
		return referredToSocialWorker;
	}

	public void setReferredToSocialWorker(boolean referredToSocialWorker) {
		this.referredToSocialWorker = referredToSocialWorker;
	}

	public String getReferredToSocialWorkerComments() {
		return referredToSocialWorkerComments;
	}

	public void setReferredToSocialWorkerComments(String referredToSocialWorkerComments) {
		this.referredToSocialWorkerComments = referredToSocialWorkerComments;
	}

	public boolean isReferredToLifeStyleCoach() {
		return referredToLifeStyleCoach;
	}

	public void setReferredToLifeStyleCoach(boolean referredToLifeStyleCoach) {
		this.referredToLifeStyleCoach = referredToLifeStyleCoach;
	}

	public String getReferredToLifeStyleCoachComments() {
		return referredToLifeStyleCoachComments;
	}

	public void setReferredToLifeStyleCoachComments(String referredToLifeStyleCoachComments) {
		this.referredToLifeStyleCoachComments = referredToLifeStyleCoachComments;
	}

	public boolean isReferredToPhysicalTrainer() {
		return referredToPhysicalTrainer;
	}

	public void setReferredToPhysicalTrainer(boolean referredToPhysicalTrainer) {
		this.referredToPhysicalTrainer = referredToPhysicalTrainer;
	}

	public String getReferredToPhysicalTrainerComments() {
		return referredToPhysicalTrainerComments;
	}

	public void setReferredToPhysicalTrainerComments(String referredToPhysicalTrainerComments) {
		this.referredToPhysicalTrainerComments = referredToPhysicalTrainerComments;
	}

	public String getFunctionalAssessment() {
		return functionalAssessment;
	}

	public void setFunctionalAssessment(String functionalAssessment) {
		this.functionalAssessment = functionalAssessment;
	}

	public boolean isHomeBpMonitoring() {
		return homeBpMonitoring;
	}

	public void setHomeBpMonitoring(boolean homeBpMonitoring) {
		this.homeBpMonitoring = homeBpMonitoring;
	}

	public String getHomeBpMonitoringReading() {
		return homeBpMonitoringReading;
	}

	public void setHomeBpMonitoringReading(String homeBpMonitoringReading) {
		this.homeBpMonitoringReading = homeBpMonitoringReading;
	}

	public String getPrognosis() {
		return prognosis;
	}

	public void setPrognosis(String prognosis) {
		this.prognosis = prognosis;
	}

	public String getProviderComments() {
		return providerComments;
	}

	public void setProviderComments(String providerComments) {
		this.providerComments = providerComments;
	}

	@Override
	public String toString() {
		return "Condition [id=" + id + ", patient=" + patient + ", encounterDate=" + encounterDate + ", startTimeMA="
				+ startTimeMA + ", endTimeMA=" + endTimeMA + ", elapsedTimeMA=" + elapsedTimeMA + ", startTimeMD="
				+ startTimeMD + ", endTimeMD=" + endTimeMD + ", elapsedTimeMD=" + elapsedTimeMD + ", totalTime="
				+ totalTime + ", sob=" + sob + ", sobComments=" + sobComments + ", chestPainPressure="
				+ chestPainPressure + ", chestPainPressureComments=" + chestPainPressureComments + ", changesInMed="
				+ changesInMed + ", changesInMedComments=" + changesInMedComments + ", compliantWithMed="
				+ compliantWithMed + ", compliantWithMedComments=" + compliantWithMedComments + ", complaintChief="
				+ complaintChief + ", enrolledHhc=" + enrolledHhc + ", enrolledHhcComments=" + enrolledHhcComments
				+ ", referredToSocialWorker=" + referredToSocialWorker + ", referredToSocialWorkerComments="
				+ referredToSocialWorkerComments + ", referredToLifeStyleCoach=" + referredToLifeStyleCoach
				+ ", referredToLifeStyleCoachComments=" + referredToLifeStyleCoachComments
				+ ", referredToPhysicalTrainer=" + referredToPhysicalTrainer + ", referredToPhysicalTrainerComments="
				+ referredToPhysicalTrainerComments + ", functionalAssessment=" + functionalAssessment
				+ ", homeBpMonitoring=" + homeBpMonitoring + ", homeBpMonitoringReading=" + homeBpMonitoringReading
				+ ", prognosis=" + prognosis + ", providerComments=" + providerComments + "]";
	}

}
