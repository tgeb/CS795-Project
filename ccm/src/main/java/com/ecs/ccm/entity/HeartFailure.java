package com.ecs.ccm.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

@Entity
@Table(name="heartfailure")
public class HeartFailure extends Condition {

	@Column(name="doe")
	@Type(type = "yes_no")
	boolean doe;
	
	@Column(name="doe_comments")
	String doeComments;
	
	@Column(name="pnd")
	@Type(type = "yes_no")
	boolean pnd;
	
	@Column(name="pnd_comments")
	String pndComments;
	
	@Column(name="edema")
	@Type(type = "yes_no")
	boolean edema;
	
	@Column(name="edema_comments")
	String edemaComments;
	
	@Column(name="cough")
	@Type(type = "yes_no")
	boolean cough;
	
	@Column(name="cough_comments")
	String coughComments;
	
	@Column(name="fatigue")
	@Type(type = "yes_no")
	boolean fatigue;
	
	@Column(name="fatigue_comments")
	String fatigueComments;
	
	@Column(name="weight_gain")
	@Type(type = "yes_no")
	boolean weightGain;
	
	@Column(name="weight_gain_current")
	float weightGainCurrent;
	
	@Column(name="weight_gain_previous")
	float weightGainPrevious;
	
	@Column(name="beta_blocker")
	@Type(type = "yes_no")
	boolean betaBlocker;
	
	@Column(name="beta_blocker_comments")
	String betaBlockerComments;
	
	@Column(name="ace_arb_entresto")
	@Type(type = "yes_no")
	boolean aceArbEntresto;
	
	@Column(name="ace_arb_entresto_comments")
	String aceArbEntrestoComments;
	
	@Column(name="aldo_spiro")
	@Type(type = "yes_no")
	boolean aldosteroneSpironolactone;
	
	@Column(name="aldo_spiro_comments")
	String aldosteroneSpironolactoneComments;
	
	@Column(name="diuretic")
	@Type(type = "yes_no")
	boolean diuretic;
	
	@Column(name="diuretic_comments")
	String diureticComments;
	
	@Column(name="bidil")
	@Type(type = "yes_no")
	boolean bidil;
	
	@Column(name="bidil_comments")
	String bidilComments;
	
	@Column(name="salt_restriction")
	@Type(type = "yes_no")
	boolean saltRestriction;
	
	@Column(name="salt_rest_comments")
	String saltRestrictionComments;
	
	@Column(name="fluid_restriction")
	@Type(type = "yes_no")
	boolean fluidRestriction;
	
	@Column(name="fluid_rest_comments")
	String fluidRestrictionComments;
	
	@Column(name="weight_management")
	String weightManagement;
	
	@Column(name="sleep_apnea")
	String sleepApneaScreening;
	
	public HeartFailure() {
		
	}

	public boolean isDoe() {
		return doe;
	}

	public void setDoe(boolean doe) {
		this.doe = doe;
	}

	public String getDoeComments() {
		return doeComments;
	}

	public void setDoeComments(String doeComments) {
		this.doeComments = doeComments;
	}

	public boolean isPnd() {
		return pnd;
	}

	public void setPnd(boolean pnd) {
		this.pnd = pnd;
	}

	public String getPndComments() {
		return pndComments;
	}

	public void setPndComments(String pndComments) {
		this.pndComments = pndComments;
	}

	public boolean isEdema() {
		return edema;
	}

	public void setEdema(boolean edema) {
		this.edema = edema;
	}

	public String getEdemaComments() {
		return edemaComments;
	}

	public void setEdemaComments(String edemaComments) {
		this.edemaComments = edemaComments;
	}

	public boolean isCough() {
		return cough;
	}

	public void setCough(boolean cough) {
		this.cough = cough;
	}

	public String getCoughComments() {
		return coughComments;
	}

	public void setCoughComments(String coughComments) {
		this.coughComments = coughComments;
	}

	public boolean isFatigue() {
		return fatigue;
	}

	public void setFatigue(boolean fatigue) {
		this.fatigue = fatigue;
	}

	public String getFatigueComments() {
		return fatigueComments;
	}

	public void setFatigueComments(String fatigueComments) {
		this.fatigueComments = fatigueComments;
	}

	public boolean isWeightGain() {
		return weightGain;
	}

	public void setWeightGain(boolean weightGain) {
		this.weightGain = weightGain;
	}

	public float getWeightGainCurrent() {
		return weightGainCurrent;
	}

	public void setWeightGainCurrent(float weightGainCurrent) {
		this.weightGainCurrent = weightGainCurrent;
	}

	public float getWeightGainPrevious() {
		return weightGainPrevious;
	}

	public void setWeightGainPrevious(float weightGainPrevious) {
		this.weightGainPrevious = weightGainPrevious;
	}

	public boolean isBetaBlocker() {
		return betaBlocker;
	}

	public void setBetaBlocker(boolean betaBlocker) {
		this.betaBlocker = betaBlocker;
	}

	public String getBetaBlockerComments() {
		return betaBlockerComments;
	}

	public void setBetaBlockerComments(String betaBlockerComments) {
		this.betaBlockerComments = betaBlockerComments;
	}

	public boolean isAceArbEntresto() {
		return aceArbEntresto;
	}

	public void setAceArbEntresto(boolean aceArbEntresto) {
		this.aceArbEntresto = aceArbEntresto;
	}

	public String getAceArbEntrestoComments() {
		return aceArbEntrestoComments;
	}

	public void setAceArbEntrestoComments(String aceArbEntrestoComments) {
		this.aceArbEntrestoComments = aceArbEntrestoComments;
	}

	public boolean isAldosteroneSpironolactone() {
		return aldosteroneSpironolactone;
	}

	public void setAldosteroneSpironolactone(boolean aldosteroneSpironolactone) {
		this.aldosteroneSpironolactone = aldosteroneSpironolactone;
	}

	public String getAldosteroneSpironolactoneComments() {
		return aldosteroneSpironolactoneComments;
	}

	public void setAldosteroneSpironolactoneComments(String aldosteroneSpironolactoneComments) {
		this.aldosteroneSpironolactoneComments = aldosteroneSpironolactoneComments;
	}

	public boolean isDiuretic() {
		return diuretic;
	}

	public void setDiuretic(boolean diuretic) {
		this.diuretic = diuretic;
	}

	public String getDiureticComments() {
		return diureticComments;
	}

	public void setDiureticComments(String diureticComments) {
		this.diureticComments = diureticComments;
	}

	public boolean isBidil() {
		return bidil;
	}

	public void setBidil(boolean bidil) {
		this.bidil = bidil;
	}

	public String getBidilComments() {
		return bidilComments;
	}

	public void setBidilComments(String bidilComments) {
		this.bidilComments = bidilComments;
	}

	public boolean isSaltRestriction() {
		return saltRestriction;
	}

	public void setSaltRestriction(boolean saltRestriction) {
		this.saltRestriction = saltRestriction;
	}

	public String getSaltRestrictionComments() {
		return saltRestrictionComments;
	}

	public void setSaltRestrictionComments(String saltRestrictionComments) {
		this.saltRestrictionComments = saltRestrictionComments;
	}

	public boolean isFluidRestriction() {
		return fluidRestriction;
	}

	public void setFluidRestriction(boolean fluidRestriction) {
		this.fluidRestriction = fluidRestriction;
	}

	public String getFluidRestrictionComments() {
		return fluidRestrictionComments;
	}

	public void setFluidRestrictionComments(String fluidRestrictionComments) {
		this.fluidRestrictionComments = fluidRestrictionComments;
	}

	public String getWeightManagement() {
		return weightManagement;
	}

	public void setWeightManagement(String weightManagement) {
		this.weightManagement = weightManagement;
	}

	public String getSleepApneaScreening() {
		return sleepApneaScreening;
	}

	public void setSleepApneaScreening(String sleepApneaScreening) {
		this.sleepApneaScreening = sleepApneaScreening;
	}

	@Override
	public String toString() {
		return "HeartFailure [doe=" + doe + ", doeComments=" + doeComments + ", pnd=" + pnd + ", pndComments="
				+ pndComments + ", edema=" + edema + ", edemaComments=" + edemaComments + ", cough=" + cough
				+ ", coughComments=" + coughComments + ", fatigue=" + fatigue + ", fatigueComments=" + fatigueComments
				+ ", weightGain=" + weightGain + ", weightGainCurrent=" + weightGainCurrent + ", weightGainPrevious="
				+ weightGainPrevious + ", betaBlocker=" + betaBlocker + ", betaBlockerComments=" + betaBlockerComments
				+ ", aceArbEntresto=" + aceArbEntresto + ", aceArbEntrestoComments=" + aceArbEntrestoComments
				+ ", aldosteroneSpironolactone=" + aldosteroneSpironolactone + ", aldosteroneSpironolactoneComments="
				+ aldosteroneSpironolactoneComments + ", diuretic=" + diuretic + ", diureticComments="
				+ diureticComments + ", bidil=" + bidil + ", bidilComments=" + bidilComments + ", saltRestriction="
				+ saltRestriction + ", saltRestrictionComments=" + saltRestrictionComments + ", fluidRestriction="
				+ fluidRestriction + ", fluidRestrictionComments=" + fluidRestrictionComments + ", weightManagement="
				+ weightManagement + ", sleepApneaScreening=" + sleepApneaScreening + "]";
	}
	
}
