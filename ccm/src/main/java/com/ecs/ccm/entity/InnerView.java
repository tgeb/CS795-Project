package com.ecs.ccm.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="innerTimeView")
public class InnerView {

	@Id
	@Column(name="patient_id")
	private int id;
	
	@Column(name="total_time")
	private long totalTime;
	
	
	@Column(name="encounter_date")
	@Temporal(TemporalType.DATE)
	private Date encounterDate;


	public InnerView() {
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public long getTime() {
		return totalTime;
	}


	public void setTime(long totalTime) {
		this.totalTime = totalTime;
	}


	public Date getEncounterDate() {
		return encounterDate;
	}


	public void setEncounterDate(Date encounterDate) {
		this.encounterDate = encounterDate;
	}


	@Override
	public String toString() {
		return "InnerView [id=" + id + ", time=" + totalTime + ", encounterDate=" + encounterDate + "]";
	}
	
	
}
