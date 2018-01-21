package com.ecs.ccm.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

@Entity
@Table(name="coronary")
public class CoronaryArteryDz extends Condition{
	
	@Column(name="pnd")
	@Type(type = "yes_no")
	boolean pnd;
	
	@Column(name="pnd_comments")
	String pndComments;
	
	@Column(name="doe")
	@Type(type = "yes_no")
	boolean doe;
	
	@Column(name="doe_comments")
	String doeComments;
	
	@Column(name="fatigue")
	@Type(type = "yes_no")
	boolean fatigue;
	
	@Column(name="fatigue_comments")
	String fatigueComments;
	
	@Column(name="antiplat")
	@Type(type = "yes_no")
	boolean antiplateletTherapy;
	
	@Column(name="antiplat_comments")
	String antiplateletTherapyComments;
	
	@Column(name="ace_arb")
	@Type(type = "yes_no")
	boolean aceArb;
	
	@Column(name="ace_arb_comments")
	String aceArbComments;
	
	@Column(name="beta_blocker")
	@Type(type = "yes_no")
	boolean betaBlocker;
	
	@Column(name="beta_blocker_comments")
	String betaBlockerComments;
	
	@Column(name="lipid_mgmt")
	@Type(type = "yes_no")
	boolean lipidMgmt;
	
	@Column(name="lipid_comments")
	String lipidMgmtComments;
	
	@Column(name="nitrites")
	@Type(type = "yes_no")
	boolean nitritesRenexa;
	
	@Column(name="nitrites_comments")
	String nitritesRenexaComments;
	
	@Column(name="salt_restriction")
	@Type(type = "yes_no")
	boolean saltRestriction;
	
	@Column(name="salt_rest_comments")
	String saltRestrictionComments;
	
	@Column(name="cholest_mgmt")
	@Type(type = "yes_no")
	boolean cholesterolMgmt;
	
	@Column(name="cholest_comments")
	String cholesterolMgmtComments;
	
	@Column(name="sleep_apnea")
	String sleepApneaScreening;
	
	public CoronaryArteryDz() {
		
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
	public boolean isAntiplateletTherapy() {
		return antiplateletTherapy;
	}
	public void setAntiplateletTherapy(boolean antiplateletTherapy) {
		this.antiplateletTherapy = antiplateletTherapy;
	}
	public String getAntiplateletTherapyComments() {
		return antiplateletTherapyComments;
	}
	public void setAntiplateletTherapyComments(String antiplateletTherapyComments) {
		this.antiplateletTherapyComments = antiplateletTherapyComments;
	}
	public boolean isAceArb() {
		return aceArb;
	}
	public void setAceArb(boolean aceArb) {
		this.aceArb = aceArb;
	}
	public String getAceArbComments() {
		return aceArbComments;
	}
	public void setAceArbComments(String aceArbComments) {
		this.aceArbComments = aceArbComments;
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
	public boolean isLipidMgmt() {
		return lipidMgmt;
	}
	public void setLipidMgmt(boolean lipidMgmt) {
		this.lipidMgmt = lipidMgmt;
	}
	public String getLipidMgmtComments() {
		return lipidMgmtComments;
	}
	public void setLipidMgmtComments(String lipidMgmtComments) {
		this.lipidMgmtComments = lipidMgmtComments;
	}
	public boolean isNitritesRenexa() {
		return nitritesRenexa;
	}
	public void setNitritesRenexa(boolean nitritesRenexa) {
		this.nitritesRenexa = nitritesRenexa;
	}
	public String getNitritesRenexaComments() {
		return nitritesRenexaComments;
	}
	public void setNitritesRenexaComments(String nitritesRenexaComments) {
		this.nitritesRenexaComments = nitritesRenexaComments;
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
	public boolean isCholesterolMgmt() {
		return cholesterolMgmt;
	}
	public void setCholesterolMgmt(boolean cholesterolMgmt) {
		this.cholesterolMgmt = cholesterolMgmt;
	}
	public String getCholesterolMgmtComments() {
		return cholesterolMgmtComments;
	}
	public void setCholesterolMgmtComments(String cholesterolMgmtComments) {
		this.cholesterolMgmtComments = cholesterolMgmtComments;
	}
	public String getSleepApneaScreening() {
		return sleepApneaScreening;
	}
	public void setSleepApneaScreening(String sleepApneaScreening) {
		this.sleepApneaScreening = sleepApneaScreening;
	}
	@Override
	public String toString() {
		return "CoronaryArteryDz [pnd=" + pnd + ", pndComments=" + pndComments + ", doe=" + doe + ", doeComments="
				+ doeComments + ", fatigue=" + fatigue + ", fatigueComments=" + fatigueComments
				+ ", antiplateletTherapy=" + antiplateletTherapy + ", antiplateletTherapyComments="
				+ antiplateletTherapyComments + ", aceArb=" + aceArb + ", aceArbComments=" + aceArbComments
				+ ", betaBlocker=" + betaBlocker + ", betaBlockerComments=" + betaBlockerComments + ", lipidMgmt="
				+ lipidMgmt + ", lipidMgmtComments=" + lipidMgmtComments + ", nitritesRenexa=" + nitritesRenexa
				+ ", nitritesRenexaComments=" + nitritesRenexaComments + ", saltRestriction=" + saltRestriction
				+ ", saltRestrictionComments=" + saltRestrictionComments + ", cholesterolMgmt=" + cholesterolMgmt
				+ ", choelesterolMgmtComments=" + cholesterolMgmtComments + ", sleepApneaScreening="
				+ sleepApneaScreening + "]";
	}
	
}
