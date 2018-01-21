package com.ecs.ccm.service;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecs.ccm.dao.PatientDao;
import com.ecs.ccm.entity.Patient;

/**
 * This is an implementation for PatientService interface.Method details can be found on the interface docs.
 * @author tsegai
 *
 */
@Service
public class PatientServiceImpl implements PatientService {
	
	@Autowired
	private PatientDao patientDao;
	
	@Override
	@Transactional
	public List<Patient> getPatients() {
		List<Patient> patients = patientDao.getAllPatients();
		return patients;
	}

	@Override
	@Transactional
	public Patient getPatient(int id) {
		Patient patient = patientDao.getPatient(id);
		return patient;
	}

	@Override
	@Transactional
	public void savePatient(Patient patient) {
		patientDao.savePatient(patient);
		
	}
	
	@Override
	@Transactional
	public void deletePatient(int id) {
		patientDao.deletePatient(id);
		
	}

	@Override
	@Transactional
	public List<Patient> searchByName(String searchTerm) {
		
		return patientDao.searchPatientByName(searchTerm);
	}

	@Override
	@Transactional
	public long getAge(int patientId) {
		Patient p = patientDao.getPatient(patientId);
		Date date = p.getDob();
		//logger.info("this is date" + p.getDob());
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		LocalDate birth = LocalDate.of(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH),
				cal.get(Calendar.DAY_OF_MONTH));
		LocalDate now = LocalDate.now(); // use for age-calculation: LocalDate.now()

		//long age = ChronoUnit.YEARS.between(birth, now);
		return ChronoUnit.YEARS.between(birth, now);
	}

	

}
