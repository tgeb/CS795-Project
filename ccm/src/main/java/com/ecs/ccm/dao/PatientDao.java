package com.ecs.ccm.dao;

import java.util.Date;
import java.util.List;

import com.ecs.ccm.entity.Condition;
import com.ecs.ccm.entity.Patient;
import com.ecs.ccm.entity.PatientReportDTO;

/**
 * Classes that implement this interface are responsible for accessing the database
 * @author tsegai
 *
 */
public interface PatientDao {
	/**
	 * Gets a list of patients
	 * @return generic list of type Patient
	 */
	public List<Patient> getAllPatients();
	
	/**Fetch patient using ID
	 * @param id Patient ID
	 * @return Patient object
	 */
	public Patient getPatient(int id);	
	
	/**
	 * Save patient
	 * @param patient Patient object to save
	 */
	public void savePatient(Patient patient);
	
	/**
	 * Delete patient using ID
	 * @param id Patient ID
	 */
	public void deletePatient(int id);
	
	/**
	 * Search and return patient list
	 * @param searchTerm String search term
	 * @return generic list of type Patient
	 */
	public List<Patient> searchPatientByName(String searchTerm);
	
	/**
	 * Save condition form
	 * @param cond Upcasted Condition(base class) object from subclass references.
	 */
	void saveCondition(Condition cond);
	
	/**
	 * Search database for list of dates for specific condition
	 * @param condition String to identify condition
	 * @param id Patient ID
	 * @return generic list of type Date
	 */
	List<Date> searchHistory(String condition,int id);
	
	/**
	 * Get a condition history form using date
	 * @param conditionClass String to identify condition
	 * @param date Date to query database
	 * @param patientId Patient ID
	 * @return any subclass of Condition object(based on conditionClass param) upcasted to base class Condition
	 */
	public Condition getConditionHistory(String conditionClass, Date date,int patientId);
	
	/**
	 * Delete condition encounter
	 * @param condition String to identify condition
	 * @param date Date to query database
	 * @param patientId Patient ID
	 */
	public void deleteEncounter(String condition,Date date,int patientId);
	
	/**
	 * Fetch Name and time for all conditions for given month
	 * @param month Month to query database
	 * @return List of Object arrays holding id and time value each
	 */
	public List<Object[]> getPatientReportDTO(int month);

	/**
	 * Gets patient weight for previous encounter
	 * @param condition String to identify condition
	 * @param patientId Patient ID
	 * @return weight gain of previous encounter
	 */
	public float getPastWeight(String condition, int patientId);
	
	
}
