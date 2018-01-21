package com.ecs.ccm.utils;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;

import com.ecs.ccm.entity.PatientReportDTO;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

/**
 * This class is responsible for preparing the report.Model object, model will be passed from controller method billingReport()
 * @author tsegai
 *
 */
@Component("billing")
public class BillingReport extends AbstractView {
	private JasperReport billingReport;

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String reportName = "/home/tsegai/Desktop/billing.pdf";

		//response.setContentType("application/pdf");
		@SuppressWarnings("unchecked")
		List<PatientReportDTO> patientList = (List<PatientReportDTO>) model.get("patientReportDTO");
		// data source
		JRDataSource dataSource = getDataSource(patientList);
		// compile jrxml template and get report
		JasperReport report = getReport();
		// fill the report with data source objects
		JasperPrint jasperPrint = JasperFillManager.fillReport(report, null, dataSource);
		JasperExportManager.exportReportToPdfFile(jasperPrint,reportName);
		
		// export to html

		/*
		 * File pdf = File.createTempFile("output.", ".pdf");
		 * JasperExportManager.exportReportToPdfStream(jasperPrint, new
		 * FileOutputStream(pdf));
		 */

		
		/*
		JRPdfExporter exporter = new JRPdfExporter();

		exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
		exporter.setExporterOutput(new SimpleOutputStreamExporterOutput("billingReport.pdf"));

		SimplePdfReportConfiguration reportConfig = new SimplePdfReportConfiguration();
		reportConfig.setSizePageToContent(true);
		reportConfig.setForceLineBreakPolicy(false);

		SimplePdfExporterConfiguration exportConfig = new SimplePdfExporterConfiguration();
		exportConfig.setMetadataAuthor("ecs");
		exportConfig.setEncrypted(true);
		exportConfig.setAllowedPermissionsHint("PRINTING");

		exporter.setConfiguration(reportConfig);
		exporter.setConfiguration(exportConfig);

		exporter.exportReport();*/
		

		/*
		 * JRPdfExporter exporter = new JRPdfExporter(); exporter.setExporterInput(new
		 * SimpleExporterInput(jasperPrint)); File pdf = File.createTempFile("output.",
		 * ".pdf"); exporter.setExporterOutput(new
		 * SimpleOutputStreamExporterOutput(pdf)); SimplePdfExporterConfiguration
		 * configuration = new SimplePdfExporterConfiguration();
		 * configuration.setMetadataAuthor("Petter"); //why not set some config as we
		 * like exporter.setConfiguration(configuration); exporter.exportReport();
		 */

		/*
		 * HtmlExporter exporter = new
		 * HtmlExporter(DefaultJasperReportsContext.getInstance());
		 * exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
		 * exporter.setExporterOutput(new
		 * SimpleHtmlExporterOutput(response.getWriter()));
		 */
		// exporter.exportReport();
	}

	/**
	 * Method returns JRDataSource object
	 * @param patientList list of type PatientReportDTO 
	 * @return JRDataSource object
	 */
	private JRDataSource getDataSource(List<PatientReportDTO> patientList) {
		JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(patientList);
		return dataSource;
	}

	/**
	 * Method sets InputStream using billing.jrxml file (located in resources folder) and returns JasperReport object 
	 * @return JasperReport object
	 * @throws JRException
	 */
	public JasperReport getReport() throws JRException {
		if (billingReport == null) {// compile only once lazily
			InputStream stream = getClass().getResourceAsStream("/billing.jrxml");
			billingReport = JasperCompileManager.compileReport(stream);
		}
		return billingReport;
	}
}