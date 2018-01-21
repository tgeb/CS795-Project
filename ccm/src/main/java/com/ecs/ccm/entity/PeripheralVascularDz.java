package com.ecs.ccm.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

@Entity
@Table(name="peripheral")
public class PeripheralVascularDz extends Condition {
	
	@Column(name="leg_pain")
	@Type(type = "yes_no")
	boolean legPain;
	
	@Column(name="leg_pain_comments")
	String legPainComments;
	
	@Column(name="leg_swelling")
	@Type(type = "yes_no")
	boolean legSwelling;
	
	@Column(name="leg_swelling_comments")
	String legSwellingComments;
	
	@Column(name="skn_clr_changes")
	@Type(type = "yes_no")
	boolean skinColorChanges;
	
	@Column(name="skn_clr_changes_comments")
	String skinColorChangesComments;
	
	@Column(name="skn_brkdn")
	@Type(type = "yes_no")
	boolean skinBreakdown;
	
	@Column(name="skn_brkdn_comments")
	String skinBreakdownComments;
	
	@Column(name="fever_chills")
	@Type(type = "yes_no")
	boolean feverChills;
	
	@Column(name="fever_chills_comments")
	String feverChillsComments;
	
	@Column(name="antiplat")
	@Type(type = "yes_no")
	boolean antiplateletTherapy;
	
	@Column(name="antiplat_comments")
	String antiplateletTherapyComments;
	
	@Column(name="anticoagulants")
	@Type(type = "yes_no")
	boolean anticoagulants;
	
	@Column(name="anticoagulants_comments")
	String anticoagulantsComments;
	
	@Column(name="leg_elvtn")
	@Type(type = "yes_no")
    boolean legElevation;
	
	@Column(name="leg_elvtn_comments")
    String legElevationComments;
	
	@Column(name="cmprsn_stkgs")
	@Type(type = "yes_no")
    boolean compressionStockings;
	
	@Column(name="cmprsn_stkgs_comments")
    String compressionStockingsComments;
	
	@Column(name="salt_restriction")
	@Type(type = "yes_no")
    boolean saltRestrictions;
	
	@Column(name="salt_rest_comments")
    String saltRestrictionsComments;
	
	@Column(name="diuretic")
	@Type(type = "yes_no")
    boolean diuretic;
	
	@Column(name="diuretic_comments")
    String diureticComments;
	
	@Column(name="lipid_mgmt")
	@Type(type = "yes_no")
	boolean lipidMgmt;
	
	@Column(name="lipid_comments")
	String lipidMgmtComments;
	
	@Column(name="cholest_comments")
    String cholestrolMgmtComments;
	
	public PeripheralVascularDz() {
		
	}
	public boolean isLegPain() {
		return legPain;
	}
	public void setLegPain(boolean legPain) {
		this.legPain = legPain;
	}
	public String getLegPainComments() {
		return legPainComments;
	}
	public void setLegPainComments(String legPainComments) {
		this.legPainComments = legPainComments;
	}
	public boolean isLegSwelling() {
		return legSwelling;
	}
	public void setLegSwelling(boolean legSwelling) {
		this.legSwelling = legSwelling;
	}
	public String getLegSwellingComments() {
		return legSwellingComments;
	}
	public void setLegSwellingComments(String legSwellingComments) {
		this.legSwellingComments = legSwellingComments;
	}
	public boolean isSkinColorChanges() {
		return skinColorChanges;
	}
	public void setSkinColorChanges(boolean skinColorChanges) {
		this.skinColorChanges = skinColorChanges;
	}
	public String getSkinColorChangesComments() {
		return skinColorChangesComments;
	}
	public void setSkinColorChangesComments(String skinColorChangesComments) {
		this.skinColorChangesComments = skinColorChangesComments;
	}
	public boolean isSkinBreakdown() {
		return skinBreakdown;
	}
	public void setSkinBreakdown(boolean skinBreakdown) {
		this.skinBreakdown = skinBreakdown;
	}
	public String getSkinBreakdownComments() {
		return skinBreakdownComments;
	}
	public void setSkinBreakdownComments(String skinBreakdownComments) {
		this.skinBreakdownComments = skinBreakdownComments;
	}
	public boolean isFeverChills() {
		return feverChills;
	}
	public void setFeverChills(boolean feverChills) {
		this.feverChills = feverChills;
	}
	public String getFeverChillsComments() {
		return feverChillsComments;
	}
	public void setFeverChillsComments(String feverChillsComments) {
		this.feverChillsComments = feverChillsComments;
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
	public boolean isAnticoagulants() {
		return anticoagulants;
	}
	public void setAnticoagulants(boolean anticoagulants) {
		this.anticoagulants = anticoagulants;
	}
	public String getAnticoagulantsComments() {
		return anticoagulantsComments;
	}
	public void setAnticoagulantsComments(String anticoagulantsComments) {
		this.anticoagulantsComments = anticoagulantsComments;
	}
	public boolean isLegElevation() {
		return legElevation;
	}
	public void setLegElevation(boolean legElevation) {
		this.legElevation = legElevation;
	}
	public String getLegElevationComments() {
		return legElevationComments;
	}
	public void setLegElevationComments(String legElevationComments) {
		this.legElevationComments = legElevationComments;
	}
	public boolean isCompressionStockings() {
		return compressionStockings;
	}
	public void setCompressionStockings(boolean compressionStockings) {
		this.compressionStockings = compressionStockings;
	}
	public String getCompressionStockingsComments() {
		return compressionStockingsComments;
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
	public void setCompressionStockingsComments(String compressionStockingsComments) {
		this.compressionStockingsComments = compressionStockingsComments;
	}
	public boolean isSaltRestrictions() {
		return saltRestrictions;
	}
	public void setSaltRestrictions(boolean saltRestrictions) {
		this.saltRestrictions = saltRestrictions;
	}
	public String getSaltRestrictionsComments() {
		return saltRestrictionsComments;
	}
	public void setSaltRestrictionsComments(String saltRestrictionsComments) {
		this.saltRestrictionsComments = saltRestrictionsComments;
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
	public String getCholestrolMgmtComments() {
		return cholestrolMgmtComments;
	}
	public void setCholestrolMgmtComments(String cholestrolMgmtComments) {
		this.cholestrolMgmtComments = cholestrolMgmtComments;
	}
	@Override
	public String toString() {
		return "PeripheralVascularDz [legPain=" + legPain + ", legPainComments=" + legPainComments + ", legSwelling="
				+ legSwelling + ", legSwellingComments=" + legSwellingComments + ", skinColorChanges="
				+ skinColorChanges + ", skinColorChangesComments=" + skinColorChangesComments + ", skinBreakdown="
				+ skinBreakdown + ", skinBreakdownComments=" + skinBreakdownComments + ", feverChills=" + feverChills
				+ ", feverChillsComments=" + feverChillsComments + ", antiplateletTherapy=" + antiplateletTherapy
				+ ", antiplateletTherapyComments=" + antiplateletTherapyComments + ", anticoagulants=" + anticoagulants
				+ ", anticoagulantsComments=" + anticoagulantsComments + ", legElevation=" + legElevation
				+ ", legElevationComments=" + legElevationComments + ", compressionStockings=" + compressionStockings
				+ ", compressionStockingsComments=" + compressionStockingsComments + ", saltRestrictions="
				+ saltRestrictions + ", saltRestrictionsComments=" + saltRestrictionsComments + ", diuretic=" + diuretic
				+ ", diureticComments=" + diureticComments + ", lipidMgmt=" + lipidMgmt + ", lipidMgmtComments="
				+ lipidMgmtComments + ", cholestrolMgmtComments=" + cholestrolMgmtComments + "]";
	}
    
}
