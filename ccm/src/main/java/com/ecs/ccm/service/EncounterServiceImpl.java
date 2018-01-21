package com.ecs.ccm.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.transaction.Transactional;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecs.ccm.dao.PatientDao;
import com.ecs.ccm.entity.Condition;
import com.ecs.ccm.entity.Patient;

/**
 * This is an implementation class for EncouterService interface.All method details can be found on EncouterService interface
 * @author tsegai
 *
 */
@Service
public class EncounterServiceImpl implements EncounterService {

	@Autowired
	private PatientDao patientDao;

	private Logger logger = Logger.getLogger(EncounterServiceImpl.class);

	@Override
	@Transactional
	public void saveCondition(Condition condition, int patientID) {
		Patient patient = patientDao.getPatient(patientID);
		patient.addEncounter(condition);
		patientDao.saveCondition(condition);
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public <T> List<T> getConditionsList(Class<T> type, int patientId) {

		Patient p = patientDao.getPatient(patientId);
		List<? extends Condition> list = p.getConditionList();
		logger.info("here is inside getConditionsPatient");
		List<T> klassList = new ArrayList<>();
		logger.info("here is inside getConditionsPatient2 ");
		int counter = 0;
		for (Condition cond : list) {
			logger.info(cond);
			counter += 1;
			logger.info(counter + "conditions");
			if (type.isInstance(cond))

				logger.info(cond);
			klassList.add((T) cond);
		}
		logger.info("here is inside getConditionsPatient after for loop ");

		return klassList;
	}

	@Override
	@Transactional
	public List<Date> getHistory(String condition,int id) {
		if(condition.equals("Heart Failure"))
			return patientDao.searchHistory("HeartFailure",id);
		if(condition.equals("Coronary Artery Disease"))
			return patientDao.searchHistory("CoronaryArteryDz",id);
		if(condition.equals("Hypertension"))
			return patientDao.searchHistory("Hypertension",id);
		if(condition.equals("Arrhythmia"))
			return patientDao.searchHistory("Arrhythmia", id);
		if(condition.equals("Peripheral Vascular Disease"))
			return patientDao.searchHistory("PeripheralVascularDz", id);
		logger.info("null is about to be returned");
		return null;
	}

	@Override
	@Transactional
	public Condition getHistoryObject(String conditionClass,Date date, int patientId) {
		Condition cond = patientDao.getConditionHistory(conditionClass,date,patientId);
		
		return cond;
	}

	@Override
	@Transactional
	public void deleteEncounter(String condition,Date date,  int patientId) {
		patientDao.deleteEncounter(condition,date,patientId);
		
	}

	@Override
	@Transactional
	public float getPastWeight(String condition, int patientId) {
		return patientDao.getPastWeight(condition,patientId);
		
	}

}
