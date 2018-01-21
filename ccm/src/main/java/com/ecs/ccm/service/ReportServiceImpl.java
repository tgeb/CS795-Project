package com.ecs.ccm.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecs.ccm.dao.PatientDao;
import com.ecs.ccm.entity.Patient;
import com.ecs.ccm.entity.PatientReportDTO;

/**
 * This is an implementation class for the ReportService interface.Method details can be found in the interface docs.
 * @author tsegai
 *
 */
@Service
public class ReportServiceImpl implements ReportService {

	@Autowired
	PatientDao patientDAO;
	
	private Logger logger = Logger.getLogger(ReportServiceImpl.class);
	
	@Override
	@Transactional
	public List<PatientReportDTO> getPatientReportDTO(int month) {
		
		List<Object[]> currentMonthPatients = patientDAO.getPatientReportDTO(month);
		List<PatientReportDTO> reportDTOList = new ArrayList<>();
		for(Object[] result: currentMonthPatients) {
			Patient patient = patientDAO.getPatient((int)result[0]);
			PatientReportDTO pDTO = new PatientReportDTO();
			pDTO.setId((Integer)result[0]);
			pDTO.setfName(patient.getfName());
			pDTO.setlName(patient.getlName());
			logger.info("this is totalTime "+ result[1]);
			pDTO.setTotalTime((long)(result[1]));
			pDTO.setMonth(month);
			logger.info("this is totalTime "+ pDTO.getTotalTime());

			reportDTOList.add(pDTO);			
		}
		return reportDTOList;
	}

}
