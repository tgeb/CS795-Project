package com.ecs.ccm.entity;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class PatientReportDTO {

	private int id;
	private String fName;
	private String lName;
	private long totalTime;
	private String month;
	private String dummyString = "Report month: ";
	private final static Map<Integer,String> monthIntToString;
	static
    {
		monthIntToString = new HashMap<Integer, String>();
		monthIntToString.put(1, "January");
		monthIntToString.put(2, "February");
		monthIntToString.put(3, "March");
		monthIntToString.put(4, "April");
		monthIntToString.put(5, "May");
		monthIntToString.put(6, "June");
		monthIntToString.put(7, "July");
		monthIntToString.put(8, "August");
		monthIntToString.put(9, "September");
		monthIntToString.put(10, "October");
		monthIntToString.put(11, "November");
		monthIntToString.put(12, "December");
    }
	private Date currentDate = new Date();

	public PatientReportDTO() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
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

	public long getTotalTime() {
		return totalTime;
	}

	public void setTotalTime(long totalTime) {
		this.totalTime = totalTime;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = monthIntToString.get(month);
	}

	public Date getCurrentDate() {
		return currentDate;
	}

	public void setCurrentDate(Date currentDate) {
		this.currentDate = currentDate;
	}

	public String getDummyString() {
		return dummyString;
	}

	public void setDummyString(String dummyString) {
		this.dummyString = dummyString;
	}

	public static Map<Integer, String> getMonthinttostring() {
		return monthIntToString;
	}

	@Override
	public String toString() {
		return "PatientReportDTO [id=" + id + ", fName=" + fName + ", lName=" + lName + ", totalTime=" + totalTime
				+ ", month=" + month + ", dummyString=" + dummyString + ", currentDate=" + currentDate + "]";
	}

}
