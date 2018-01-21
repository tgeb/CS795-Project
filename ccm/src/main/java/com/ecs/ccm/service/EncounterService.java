package com.ecs.ccm.service;

import java.util.Date;
import java.util.List;

import com.ecs.ccm.entity.Condition;

/**
 * This class is responsible for any services related to patient encounters(such as saving,fetching history and deleting encounters)
 * @author tsegai
 *
 */
public interface EncounterService {
	
	/**
	 * Saves condition
	 * @param condition String to identify condition
	 * @param patientID Patient ID
	 */
	public void saveCondition(Condition condition, int patientID);
	
	/**
	 * Gets list of dates for selected condition
	 * @param condition String to identify condition
	 * @param id Patient ID
	 * @return list of type Date
	 */
	public List<Date> getHistory(String condition, int id);
	
	/**
	 * Fetches Condition object for selected condition
	 * @param conditionClass String to identify condition
	 * @param date String to query database
	 * @param patientId Patient ID
	 * @return Condition object for specific date(cannot be null)
	 */
	public Condition getHistoryObject(String conditionClass,Date date, int patientId);
	
	/**
	 * Deletes encounter
	 * @param condition String to identify condition
	 * @param date date String to query database
	 * @param patientId Patient ID
	 */
	public void deleteEncounter(String condition,Date date,int patientId);

	/**
	 * Gets last encounter weight gain of patient
	 * @param condition String to identify condition
	 * @param patientId Patient ID
	 * @return weight gain
	 */
	public float getPastWeight(String condition, int patientId);
	
 }
