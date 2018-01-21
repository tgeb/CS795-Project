package com.ecs.ccm.dao;

import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ecs.ccm.entity.Condition;
import com.ecs.ccm.entity.HeartFailure;
import com.ecs.ccm.entity.Hypertension;
import com.ecs.ccm.entity.Patient;

/**
 * This class is responsible for accessing the database
 * 
 * @author tsegai
 *
 */
@Repository
public class PatientDaoImpl implements PatientDao {

	@Autowired
	private SessionFactory sessionFactory;

	/*
	 * @Autowired private EntityManager em;
	 */

	protected Logger logger = Logger.getLogger(PatientDaoImpl.class);

	@Override
	public List<Patient> getAllPatients() {
		Session currentSession = sessionFactory.getCurrentSession();

		Query<Patient> query = currentSession.createQuery("from Patient", Patient.class);
		List<Patient> patients = query.getResultList();
		return patients;
	}

	@Override
	public Patient getPatient(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Patient patient = currentSession.get(Patient.class, id);
		return patient;
	}

	@Override
	public void savePatient(Patient patient) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(patient);
	}

	@Override
	public void deletePatient(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("delete from Patient where id=:patientId");
		query.setParameter("patientId", id);
		query.executeUpdate();

	}

	@Override
	public List<Patient> searchPatientByName(String searchTerm) {
		Session currentSession = sessionFactory.getCurrentSession();
		/*
		 * Query<Patient> query = currentSession
		 * .createQuery("from Patient p WHERE p.fName = :searchTerm OR p.lName = :searchTerm "
		 * , Patient.class); query.setParameter("searchTerm", searchTerm);
		 */
		Query<Patient> query = currentSession.createQuery(
				"from Patient p WHERE p.fName LIKE CONCAT('%',?1,'%') OR p.lName LIKE CONCAT('%',?2,'%') ",
				Patient.class);
		query.setParameter("1", searchTerm);
		query.setParameter("2", searchTerm);
		List<Patient> patients = query.getResultList();
		for (Patient p : patients)
			logger.info(p);
		return patients;
	}

	@Override
	public void saveCondition(Condition cond) {
		Session currentSession = sessionFactory.getCurrentSession();
		logger.info("this is cond Id " + cond.getId());
		currentSession.saveOrUpdate(cond);
		logger.info("cond saved");

	}

	@Override
	public List<Date> searchHistory(String condition, int id) {
		Session currentSession = sessionFactory.getCurrentSession();

		String queryOne = "SELECT c.encounterDate FROM ";
		String queryTwo = condition;
		String queryThree = " c WHERE c.patient.id = :id";

		String finalQuery = queryOne + queryTwo + queryThree;

		Query<Date> query = currentSession.createQuery(finalQuery, Date.class);
		query.setParameter("id", id);
		List<Date> dates = query.getResultList();
		for (Date d : dates)
			logger.info(d);

		return dates;
	}

	@Override
	public Condition getConditionHistory(String conditionClass, Date date, int patientId) {
		Session currentSession = sessionFactory.getCurrentSession();
		logger.info("this is inside DAO");
		String queryOne = "SELECT c FROM ";
		String queryTwo = conditionClass;
		String queryThree = " c WHERE c.encounterDate = :date AND c.patient.id = :id";

		String finalQuery = queryOne + queryTwo + queryThree;
		logger.info(finalQuery);
		Query<Condition> query = currentSession.createQuery(finalQuery, Condition.class);
		query.setParameter("date", date);
		query.setParameter("id", patientId);
		Condition cond = query.getSingleResult();

		logger.info(cond.getId());
		logger.info("object returned");

		return (Condition) cond;

	}

	@Override
	public void deleteEncounter(String condition, Date date, int patientId) {
		Session currentSession = sessionFactory.getCurrentSession();
		String queryOne = "DELETE FROM ";
		String queryTwo = condition;
		String queryThree = " c WHERE c.patient.id=:id AND c.encounterDate = :date";
		String finalQuery = queryOne + queryTwo + queryThree;
		Query query = currentSession.createQuery(finalQuery);
		query.setParameter("id", patientId);
		query.setParameter("date", date);
		query.executeUpdate();

	}

	@Override
	public List<Object[]> getPatientReportDTO(int month) {

		Session currentSession = sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery(
				"SELECT v.id,SUM(v.totalTime) as totalTime FROM InnerView v WHERE MONTH(v.encounterDate) =:month GROUP BY v.id",
				Object[].class);
		query.setParameter("month", month);
		List<Object[]> allPatients = query.getResultList();
		for (Object[] result : allPatients)
			logger.info("PatientId: " + result[0] + " total time " + result[1]);

		return allPatients;
	}

	@Override
	public float getPastWeight(String condition, int patientId) {
		Session currentSession = sessionFactory.getCurrentSession();

		String queryFour = "SELECT c.weightGainCurrent FROM ";
		String queryFive = condition;
		String querySix = " c WHERE c.encounterDate = (SELECT MAX(encounterDate) as date FROM ";
		String querySeven = " c WHERE c.patient.id =:id) AND c.patient.id=:id ";

		String finalQueryWtGain = queryFour + queryFive + querySix + queryFive + querySeven;
		Query<Float> queryWtGain = currentSession.createQuery(finalQueryWtGain, Float.class);
		queryWtGain.setParameter("id", patientId);
		// Query queryWtGain = currentSession.createQuery("SELECT v.weightGainCurrent
		// FROM InnerView v WHERE v.encounterDate = MAX(encounterDate)",Object[].class);
		List<Float> wtGain = queryWtGain.getResultList();
		
		logger.info("this is weight gain " + wtGain);
		/*
		 * if (condition.equals("HeartFailure")) { HeartFailure hf = (HeartFailure)
		 * cond; hf.setWeightGainCurrent(wtGain); } if
		 * (condition.equals("Hypertension")) { Hypertension ht = (Hypertension) cond;
		 * ht.setWeightGainCurrent(wtGain); }
		 */
		if (wtGain.isEmpty())
			return 0;
		else return wtGain.get(0);
	}
}
