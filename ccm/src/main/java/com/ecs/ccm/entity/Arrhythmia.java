package com.ecs.ccm.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

@Entity
@Table(name="arrhythmia")
public class Arrhythmia extends Condition {
	
		@Column(name="palpitations")
		@Type(type = "yes_no")
		private boolean palpitations;
		
		@Column(name="palpitations_comments")
		private String palpitationsComments;
		
		@Column(name="dizziness")
		@Type(type = "yes_no")
		private boolean dizziness;
		
		@Column(name="dizziness_comments")
		private String dizzinessComments;
		
		@Column(name="syncope")
		@Type(type = "yes_no")
		private boolean syncopeNearSyncope;
		
		@Column(name="syncope_comments")
		private String syncopeNearSyncopeComments;
		
		@Column(name="bleeding")
		@Type(type = "yes_no")
		private boolean bleeding;
		
		@Column(name="bleeding_comments")
		private String bleedingComments;
		
		@Column(name="weakness")
		@Type(type = "yes_no")
		private boolean weaknessFatigue;
		
		@Column(name="weakness_comments")
		private String weaknessFatigueComments;
		
		@Column(name="antiarrhythmics")
		@Type(type = "yes_no")
		private boolean antiarrhythmics;
		
		@Column(name="antiarrhythmics_comments")
		private String antiarrhythmicsComments;
		
		@Column(name="antiplatelet")
		@Type(type = "yes_no")
		private boolean antiplateletTherapy;
		
		@Column(name="antiplatelet_comments")
		private String antiplateletTherapyComments;
		
		@Column(name="anticoagulants")
		@Type(type = "yes_no")
		private boolean anticoagulants;
		
		@Column(name="anticoagulants_comments")
		private String anticoagulantsComments;
		
		@Column(name="creatinine_comments")
		private String creatinineClearanceComments;
		
		@Column(name="pt_INR_comments")
		private String ptInrComments;
		
		@Column(name="fall_risk_comments")
		private String fallRiskComments;
		
		@Column(name="sleep_apnea")
		private String sleepApneaScreening;
		
		@Column(name="nutrition")
		private String nutrition;		
		
		public Arrhythmia() {
			
		}
		public boolean isPalpitations() {
			return palpitations;
		}
		public void setPalpitations(boolean palpitations) {
			this.palpitations = palpitations;
		}
		public String getPalpitationsComments() {
			return palpitationsComments;
		}
		public void setPalpitationsComments(String palpitationsComments) {
			this.palpitationsComments = palpitationsComments;
		}
		public boolean isDizziness() {
			return dizziness;
		}
		public void setDizziness(boolean dizziness) {
			this.dizziness = dizziness;
		}
		public String getDizzinessComments() {
			return dizzinessComments;
		}
		public void setDizzinessComments(String dizzinessComments) {
			this.dizzinessComments = dizzinessComments;
		}
		public boolean isSyncopeNearSyncope() {
			return syncopeNearSyncope;
		}
		public void setSyncopeNearSyncope(boolean syncopeNearSyncope) {
			this.syncopeNearSyncope = syncopeNearSyncope;
		}
		public String getSyncopeNearSyncopeComments() {
			return syncopeNearSyncopeComments;
		}
		public void setSyncopeNearSyncopeComments(String syncopeNearSyncopeComments) {
			this.syncopeNearSyncopeComments = syncopeNearSyncopeComments;
		}
		public boolean isBleeding() {
			return bleeding;
		}
		public void setBleeding(boolean bleeding) {
			this.bleeding = bleeding;
		}
		public String getBleedingComments() {
			return bleedingComments;
		}
		public void setBleedingComments(String bleedingComments) {
			this.bleedingComments = bleedingComments;
		}
		public boolean isWeaknessFatigue() {
			return weaknessFatigue;
		}
		public void setWeaknessFatigue(boolean weaknessFatigue) {
			this.weaknessFatigue = weaknessFatigue;
		}
		public String getWeaknessFatigueComments() {
			return weaknessFatigueComments;
		}
		public void setWeaknessFatigueComments(String weaknessFatigueComments) {
			this.weaknessFatigueComments = weaknessFatigueComments;
		}
		public boolean isAntiarrhythmics() {
			return antiarrhythmics;
		}
		public void setAntiarrhythmics(boolean antiarrhythmics) {
			this.antiarrhythmics = antiarrhythmics;
		}
		public String getAntiarrhythmicsComments() {
			return antiarrhythmicsComments;
		}
		public void setAntiarrhythmicsComments(String antiarrhythmicsComments) {
			this.antiarrhythmicsComments = antiarrhythmicsComments;
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
		public String getCreatinineClearanceComments() {
			return creatinineClearanceComments;
		}
		public void setCreatinineClearanceComments(String creatinineClearanceComments) {
			this.creatinineClearanceComments = creatinineClearanceComments;
		}
		public String getPtInrComments() {
			return ptInrComments;
		}
		public void setPtInrComments(String ptInrComments) {
			this.ptInrComments = ptInrComments;
		}
		public String getFallRiskComments() {
			return fallRiskComments;
		}
		public void setFallRiskComments(String fallRiskComments) {
			this.fallRiskComments = fallRiskComments;
		}
		public String getSleepApneaScreening() {
			return sleepApneaScreening;
		}
		public void setSleepApneaScreening(String sleepApneaScreening) {
			this.sleepApneaScreening = sleepApneaScreening;
		}
		public String getNutrition() {
			return nutrition;
		}
		public void setNutrition(String nutrition) {
			this.nutrition = nutrition;
		}
		@Override
		public String toString() {
			return "Arrhythmia [palpitations=" + palpitations + ", palpitationsComments=" + palpitationsComments
					+ ", dizziness=" + dizziness + ", dizzinessComments=" + dizzinessComments + ", syncopeNearSyncope="
					+ syncopeNearSyncope + ", syncopeNearSyncopeComments=" + syncopeNearSyncopeComments + ", bleeding="
					+ bleeding + ", bleedingComments=" + bleedingComments + ", weaknessFatigue=" + weaknessFatigue
					+ ", weaknessFatigueComments=" + weaknessFatigueComments + ", antiarrhythmics=" + antiarrhythmics
					+ ", antiarrhythmicsComments=" + antiarrhythmicsComments + ", antiplateletTherapy="
					+ antiplateletTherapy + ", antiplateletTherapyComments=" + antiplateletTherapyComments
					+ ", anticoagulants=" + anticoagulants + ", anticoagulantsComments=" + anticoagulantsComments
					+ ", creatinineClearanceComments=" + creatinineClearanceComments + ", ptInrComments="
					+ ptInrComments + ", fallRiskComments=" + fallRiskComments + ", sleepApneaScreening="
					+ sleepApneaScreening + ", nutrition=" + nutrition + "]";
		}
	
		
		
}
