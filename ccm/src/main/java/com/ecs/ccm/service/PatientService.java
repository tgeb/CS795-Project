package com.ecs.ccm.service;

import java.util.List;

import com.ecs.ccm.entity.Patient;

/**
 * This class is responsible for accessing database for
 * @author tsegai
 *
 */
public interface PatientService {
	/**
	 * Gets list of patients
	 * @return list of type Patient
	 */
	public List<Patient> getPatients();
	
	/**
	 * Gets single patient using ID
	 * @param id Patient ID
	 * @return Patient object
	 */
	public Patient getPatient(int id);
	
	/**
	 * Saves single patient
	 * @param patient Patient object
	 */
	public void savePatient(Patient patient);
	
	/**
	 * Deletes single patient using ID
	 * @param id Patient ID
	 */
	public void deletePatient(int id);
	
	/**
	 * Searches database using search term
	 * @param searchTerm String to identify patient(implementations for this method use queries to retrieve partial matches)
	 * @return list of type Patient
	 */
	public List<Patient> searchByName(String searchTerm);

	/**
	 * Gets the age of patient
	 * @param patientId Patient ID
	 * @return age 
	 */
	public long getAge(int patientId);
	
}
