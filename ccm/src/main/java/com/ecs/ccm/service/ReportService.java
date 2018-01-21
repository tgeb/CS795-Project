package com.ecs.ccm.service;

import java.util.List;

import com.ecs.ccm.entity.PatientReportDTO;

/**
 * This class is responsible for getting PatientReportDTO(Data Transfer Object) to send to BillingHtmlView class
 * @author tsegai
 *
 */
public interface ReportService {
	
	/**
	 * Get a list of PatientReportDTO objects. PatientReportDTO objects are created inside this method.
	 * @param month String to query database
	 * @return list of type PatientReportDTO
	 */
	public List<PatientReportDTO> getPatientReportDTO(int month);

}
