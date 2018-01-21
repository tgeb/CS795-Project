package com.ecs.ccm.controllers;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ecs.ccm.entity.Arrhythmia;
import com.ecs.ccm.entity.CoronaryArteryDz;
import com.ecs.ccm.entity.HeartFailure;
import com.ecs.ccm.entity.Hypertension;
import com.ecs.ccm.entity.Patient;
import com.ecs.ccm.entity.PatientReportDTO;
import com.ecs.ccm.entity.PeripheralVascularDz;
import com.ecs.ccm.entity.UserInfo;
import com.ecs.ccm.service.EncounterService;
import com.ecs.ccm.service.PatientService;
import com.ecs.ccm.service.ReportService;
import com.ecs.ccm.service.UserService;

/**
 * This class is the main controller class to handle http requests. Class might
 * need to be broken down into several controller classes as code gets larger
 * 
 * @author tsegai
 *
 */
@Controller
// @RequestMapping("/app")
public class MainController {

	/**
	 * Any implementation of the PatientService interface could be injected here.
	 * This object is used to access service layer methods.
	 */
	@Autowired
	PatientService patientService;
	/**
	 * Any implementation of the EncounterService interface could be injected here
	 * This object is used to access service layer methods.
	 */
	@Autowired
	EncounterService encounterService;
	/**
	 * Any implementation of the ReportService interface could be injected here This
	 * object is used to access service layer methods.
	 */
	@Autowired
	ReportService reportService;
	/**
	 * Any implementation of the PatientService interface could be injected here
	 * This object is used to access service layer methods.
	 */
	@Autowired
	UserService userService;

	/**
	 * logger used by this class
	 */
	protected Logger logger = Logger.getLogger(MainController.class);

	/**
	 * Provides authentication page
	 * 
	 * @param error
	 *            passed from failedUrl(/login?error=true) method in
	 *            DemoSecurityConfig class configure() method
	 * @param model
	 *            Model object to make data available to view
	 * @return login form
	 */
	@GetMapping("/login")
	public String loginForm(@RequestParam(value = "error", required = false) String error, Model model) {

		// logger.info("error" + error);
		boolean errorVal = Boolean.parseBoolean(error);
		// logger.info("errorVal" + errorVal);
		if (errorVal)
			model.addAttribute("error", "Invalid Username or Password");

		return "login";
	}

	/**
	 * Provides registration form
	 * 
	 * @return registration form
	 */
	@GetMapping("/register")
	public String registrationForm() {

		return "registration";
	}

	/**
	 * 
	 * @param userName
	 *            user-name value entered by user
	 * @param password
	 *            password value entered by user
	 * @param cnfrmPassword
	 *            confirm password value entered by user
	 * @param model
	 *            Model object to make data available to view
	 * @return Login page if registration was successful or reloads the registration
	 *         page if failed
	 */
	@PostMapping("/registerProcessing")
	public String registrationProcessor(@RequestParam("username") String userName,
			@RequestParam("password") String password, @RequestParam("confirmPassword") String cnfrmPassword,
			Model model) {
		// logger.info("inside registerProcessing");
		if (userService.getUser(userName) == null) {
			if (password.equals(cnfrmPassword)) {
				UserInfo user = new UserInfo(userName, password);
				userService.saveUser(user);
				return "login";
			} else {
				model.addAttribute("passwordMismatch", "Passwords dont match");
			}
		} else {
			model.addAttribute("userExists", "Username already exists");
		}
		return "registration";
	}

	/**
	 * Provides the application main-page
	 * 
	 * @return main-home page. This is the first page users see after successful
	 *         login
	 * 
	 */
	@GetMapping("/home")
	public String mainHome() {

		return "main-home";
	}

	/**
	 * Provides patient enrollment form
	 * 
	 * @param model
	 *            Model object to make data available to view
	 * @return enrollment form
	 */
	@GetMapping("/enrollNew")
	public String enrollmentForm(Model model) {
		Patient patient = new Patient();
		model.addAttribute("patient", patient);
		return "enroll";
	}

	/**
	 * Provides enrollment form populated with patient details
	 * 
	 * @param patientId
	 *            Patient ID to be used to fetch patient from database.
	 * @param model
	 *            Model object to make data available to view
	 * @return enrollment form filled with patient details
	 */
	@GetMapping("/editPatient")
	public String editPatient(@RequestParam("patientId") int patientId, Model model) {

		model.addAttribute("patient", patientService.getPatient(patientId));
		return "enroll";
	}

	/**
	 * Provides application admin-home page
	 * 
	 * @param model
	 *            Model object to make data available to view
	 * @return admin-home page.This page is used by users to perform administrative
	 *         tasks such as enrolling new patients and generating reports
	 */
	@GetMapping("/adminHome")
	public String adminHome(Model model) {

		return "admin-home";
	}

	/**
	 * Provides application clinical-home page
	 * 
	 * @param model
	 *            Model object to make data available to view
	 * @return clinical-home page.This page is used to perform clinical tasks such
	 *         as recording encounters.
	 */
	@GetMapping("/clinicalHome")
	public String clinicalHome(Model model) {

		return "clinical-home";
	}

	/**
	 * Saves a patient to database
	 * 
	 * @param patient
	 *            Patient object
	 * @param result
	 *            Binder object.
	 * @return enrollment form if binder object result has errors or redirects to
	 *         admin-home on successful patient enrollment.
	 */
	@PostMapping("/savePatient")
	public String savePatient(@Valid @ModelAttribute("patient") Patient patient, BindingResult result,Model model) {

		if (result.hasErrors()) {
			model.addAttribute("patient",patient);
			return "enroll";
		}

		patientService.savePatient(patient);

		return "redirect:/adminHome";
	}

	/**
	 * Fetches a list of patients from database
	 * 
	 * @deprecated This method is no longer used
	 * @param model
	 *            Model object to make data available to view
	 * @return patient list
	 */
	@GetMapping("/getPatients")
	public String getPatients(Model model) {

		List<Patient> patients = patientService.getPatients();
		model.addAttribute("patient", patients);
		return "patient-list";
	}

	/**
	 * Searches database and returns patient list
	 * 
	 * @param request
	 *            HttpServletRequest object to get pageName parameter
	 * @param searchTerm
	 *            String search term
	 * @param model
	 *            Model object to make data available to view
	 * @return the page from which this method was called.It could be either
	 *         clinical-home or admin-home pages
	 */
	@GetMapping("/searchPatient/{searchTerm}")
	public String search(HttpServletRequest request, @RequestParam("searchTerm") String searchTerm, Model model) {
		String pageName = request.getParameter("pageName");
		model.addAttribute("patientList", searchPatient(searchTerm));
		return pageName;
	}

	/**
	 * Deletes a patient from database
	 * 
	 * @param patientId
	 *            Patient ID
	 * @return reloads page
	 */
	@GetMapping("/delete")
	public String deletePatient(@RequestParam("patientId") int patientId) {
		patientService.deletePatient(patientId);

		return "redirect:/adminHome";
	}

	/**
	 * Displays conditions the patient is enrolled in
	 * 
	 * @param pageString
	 *            String parameter used to decidewhich page to return(either
	 *            manage-home or manage-home-history)
	 * @param patientIdNum
	 *            Patient ID
	 * @param model
	 *            Model object to make data available to view
	 * @return page for recording encounters or showing history based on where the
	 *         method call originated
	 */
	@GetMapping("/manageConditions")
	public String manage(@RequestParam("pageString") String pageString, @RequestParam("patientId") int patientIdNum,
			Model model) {

		Patient patient = patientService.getPatient(patientIdNum);
		List<String> conditions = new ArrayList<>();

		if (patient.isEnrolledArrhythmia()) {
			conditions.add("Arrhythmia");
		}
		if (patient.isEnrolledCoronaryArteryDisease()) {
			conditions.add("Coronary Artery Disease");
		}
		if (patient.isEnrolledHeartFailure()) {
			conditions.add("Heart Failure");
		}
		if (patient.isEnrolledHypertension()) {
			conditions.add("Hypertension");
		}
		if (patient.isEnrolledPeripheralVascularDz()) {
			conditions.add("Peripheral Vascular Disease");
		}

		model.addAttribute("conditionList", conditions);
		model.addAttribute("patientId", patientIdNum);

		if (pageString.equals("manage-home"))
			return "manage-home";
		else
			return "manage-home-history";

	}

	/**
	 * Returns condition forms
	 * 
	 * @param patientId
	 *            Patient ID
	 * @param condition
	 *            Condition string to display in the page
	 * @param pageString
	 *            String used for page rerouting
	 * @param model
	 *            Model object to make data available to view
	 * @return condition forms
	 */
	@GetMapping("/getConditionForm")
	public String getConditionForm(@RequestParam("patientId") int patientId,
			@RequestParam("condition") String condition, @RequestParam("pageString") String pageString,@RequestParam(value="error",required=false) String error, Model model) {

		if (condition.equals("Heart Failure")) {
			// if (!model.containsAttribute("hf")) {
			HeartFailure hf = new HeartFailure();
			hf.setWeightGainPrevious(encounterService.getPastWeight("HeartFailure", patientId));
			Patient p = patientService.getPatient(patientId);
			long age = patientService.getAge(patientId);
			model.addAttribute("error", error);
			model.addAttribute("diagnosis", p.getHeartFailureDiagnosis());
			model.addAttribute("age", age);
			model.addAttribute("name", p.getfName() + " " + p.getlName());
			logger.info("this is weight gain previous" + hf.getWeightGainPrevious());
			model.addAttribute("hf", hf);
			model.addAttribute("patientId", patientId);
			model.addAttribute("pageString", pageString);

			return "heartfailure";
		} else if (condition.equals("Coronary Artery Disease")) {
			CoronaryArteryDz cad = new CoronaryArteryDz();
			Patient p = patientService.getPatient(patientId);
			long age = patientService.getAge(patientId);
			model.addAttribute("error", error);
			model.addAttribute("diagnosis", p.getCoronaryArteryFailureDiagnosis());
			model.addAttribute("age", age);
			model.addAttribute("name", p.getfName() + " " + p.getlName());
			model.addAttribute("cad", cad);
			model.addAttribute("patientId", patientId);
			model.addAttribute("pageString", pageString);
			return "coronary";
		} else if (condition.equals("Hypertension")) {
			Hypertension ht = new Hypertension();
			ht.setWeightGainPrevious(encounterService.getPastWeight("Hypertension", patientId));
			Patient p = patientService.getPatient(patientId);
			long age = patientService.getAge(patientId);
			model.addAttribute("error", error);
			model.addAttribute("diagnosis", p.getHypertensionDiagnosis());
			model.addAttribute("age", age);
			model.addAttribute("name", p.getfName() + " " + p.getlName());
			model.addAttribute("ht", ht);
			model.addAttribute("patientId", patientId);
			model.addAttribute("pageString", pageString);
			return "hypertension";
		} else if (condition.equals("Arrhythmia")) {
			// if(!model.containsAttribute("ar")) {
			Arrhythmia ar = new Arrhythmia();
			Patient p = patientService.getPatient(patientId);
			long age = patientService.getAge(patientId);
			model.addAttribute("error", error);
			model.addAttribute("diagnosis", p.getArrhythmiaDiagnosis());
			model.addAttribute("age", age);
			model.addAttribute("name", p.getfName() + " " + p.getlName());
			model.addAttribute("ar", ar);
			model.addAttribute("patientId", patientId);
			model.addAttribute("pageString", pageString);
			return "arrhythmia";
		} else if (condition.equals("Peripheral Vascular Disease")) {
			PeripheralVascularDz pvd = new PeripheralVascularDz();
			Patient p = patientService.getPatient(patientId);
			long age = patientService.getAge(patientId);
			model.addAttribute("error", error);
			model.addAttribute("diagnosis", p.getPeripheralVascularDzDiagnosis());
			model.addAttribute("age", age);
			model.addAttribute("name", p.getfName() + " " + p.getlName());
			model.addAttribute("pvd", pvd);
			model.addAttribute("patientId", patientId);
			model.addAttribute("pageString", pageString);
			return "peripheral";
		}

		logger.info("end of handler, check id there is an error");
		return "redirect:/manageConditions";

	}
	/*
	 * @PostMapping("/saveCondition") public String
	 * saveCondition(@ModelAttribute("condition") Condition condition, BindingResult
	 * bindingResult1,
	 * 
	 * @RequestParam("cond") String cond, Model model1) {
	 * logger.info("beginning of saveCondition"); // int patientID =
	 * Integer.parseInt(patientId);
	 * 
	 * // logger.info("this is patient ID " + patientID); Condition condit =
	 * (Condition) condition; if (condit instanceof HeartFailure)
	 * logger.info("instance check");
	 * 
	 * logger.info(condition); if (bindingResult1.hasErrors()) {
	 * logger.error(bindingResult1.getAllErrors()); return
	 * "redirect:/manageConditions"; } // logger.info("this is patient ID " +
	 * patientID); int patientID = 12; if (cond.equals("Heart Failure")) {
	 * logger.info("cond is Heart Failure");
	 * 
	 * if (condition instanceof HeartFailure) {
	 * logger.info("cond is Heart Failure object"); HeartFailure hf = (HeartFailure)
	 * condition; try { logger.info("object is heart failure");
	 * encounterService.saveCondition(hf, patientID);
	 * logger.info("HeartFailure is saved"); } catch (Exception e) {
	 * e.printStackTrace(); logger.error(e); } } } if
	 * (cond.equals("Coronary Artery Disease")) {
	 * encounterService.saveCondition((CoronaryArteryDz) condition, patientID);
	 * logger.info("Coronary is saved"); } if (cond.equals("Hypertension")) {
	 * encounterService.saveCondition((Hypertension) condition, patientID);
	 * logger.info("Hypertension is saved"); } if (cond.equals("Arrhythmia")) {
	 * encounterService.saveCondition((Arrhythmia) condition, patientID);
	 * logger.info("Arrhythmia is saved"); } if
	 * (cond.equals("Peripheral Vascular Disease")) {
	 * encounterService.saveCondition((PeripheralVascularDz) condition, patientID);
	 * logger.info("Periphearl Vascular Disease is saved"); }
	 * logger.info("this is before return"); return "redirect:/manageConditions"; }
	 */

	/**
	 * Save heartfailure encounter
	 * 
	 * @param hf
	 *            Heartfailure ModelAttribute(form backing object)
	 * @param bindingResult
	 *            BindingResult object
	 * @param cond
	 *            optional parameter (might be removed in next release)
	 * @param patientId
	 *            Patient ID
	 * @param pageString
	 *            String to passed to view to reroute user to manage-home or
	 *            manage-home-history after saving
	 * @param model
	 *            Model object to make data available to view
	 * @return redirects to manageConditions method
	 */
	@PostMapping("/saveHeartFailure")
	public String saveHeartFailure(@Valid @ModelAttribute("condition") HeartFailure hf, BindingResult bindingResult,
			@RequestParam(value = "cond", required = false) String cond, @RequestParam("patientId") int patientId,
			@RequestParam("pageString") String pageString, Model model) {
		// logger.info(cond);
		// logger.info(patientId);
		List<FieldError> errors = bindingResult.getFieldErrors();
		for (FieldError error : errors) {
			System.out.println(error.getObjectName() + " - " + error.getDefaultMessage());
		}

		if (bindingResult.hasErrors()) {
			logger.info("request has errors");
			String error = "(*)Please fill required fields";
			return "redirect:/getConditionForm?patientId=" + patientId + "&condition=" + cond + "&pageString="
					+ pageString+"&error="+error;
		}

		if (hf instanceof HeartFailure) {
			/*
			 * if (hf.getEncounterDate() == null) hf.setEncounterDate(new Date());
			 */
			encounterService.saveCondition(hf, patientId);
		}

		model.addAttribute("patientId", patientId);
		model.addAttribute("pageString", pageString);

		return "redirect:/manageConditions";
	}

	/**
	 * Save Coronary Artery Disease encounter
	 * 
	 * @param cad
	 *            CoronaryArteryDz ModelAttribute(form backing object)
	 * @param bindingResult
	 *            BindingResult object
	 * @param cond
	 *            optional parameter (might be removed in next release)
	 * @param patientId
	 *            Patient ID
	 * @param pageString
	 *            String to passed to view to reroute user to manage-home or
	 *            manage-home-history after saving
	 * @param model
	 *            Model object to make data available to view
	 * @return redirects to manageConditions method
	 */
	@PostMapping("/saveCoronary")
	public String saveCoronary(@Valid @ModelAttribute("condition") CoronaryArteryDz cad, BindingResult bindingResult,
			@RequestParam("cond") String cond, @RequestParam("patientId") int patientId,
			@RequestParam("pageString") String pageString, Model model) {

		List<FieldError> errors = bindingResult.getFieldErrors();
		for (FieldError error : errors) {
			logger.info(error.getObjectName() + " - " + error.getDefaultMessage());
		}

		if (bindingResult.hasErrors()) {
			logger.info("request has errors");
			String error = "(*)Please fill required fields";
			return "redirect:/getConditionForm?patientId=" + patientId + "&condition=" + cond + "&pageString="
					+ pageString+"&error="+error;
		}
		if (cad instanceof CoronaryArteryDz) {
			// logger.info("this is encounter date for patient " + patientId + " " +
			// cad.getEncounterDate());
			/*
			 * if (cad.getEncounterDate() == null) cad.setEncounterDate(new Date());
			 */
			logger.info("this is cad" + cad);
			encounterService.saveCondition(cad, patientId);
		}

		model.addAttribute("patientId", patientId);
		model.addAttribute("pageString", pageString);

		return "redirect:/manageConditions";
	}

	/**
	 * Save Hypertension encounter
	 * 
	 * @param ht
	 *            Hypertension ModelAttribute(form backing object)
	 * @param bindingResult
	 *            BindingResult object
	 * @param cond
	 *            optional parameter (might be removed in next release)
	 * @param patientId
	 *            Patient ID
	 * @param pageString
	 *            String to passed to view to reroute user to manage-home or
	 *            manage-home-history after saving
	 * @param model
	 *            Model object to make data available to view
	 * @return redirects to manageConditions method
	 */
	@PostMapping("/saveHypertension")
	public String saveHypertension(@Valid @ModelAttribute("condition") Hypertension ht, BindingResult bindingResult1,
			@RequestParam("cond") String cond, @RequestParam("patientId") int patientId,
			@RequestParam("pageString") String pageString, Model model) {

		List<FieldError> errors = bindingResult1.getFieldErrors();
		for (FieldError error : errors) {
			logger.info(error.getObjectName() + " - " + error.getDefaultMessage());
		}

		if (bindingResult1.hasErrors()) {
			logger.info("request has errors");
			String error = "(*)Please fill required fields";
			return "redirect:/getConditionForm?patientId=" + patientId + "&condition=" + cond + "&pageString="
					+ pageString+"&error="+error;
		}
		if (ht instanceof Hypertension) {
			/*
			 * if (ht.getEncounterDate() == null) ht.setEncounterDate(new Date());
			 */
			encounterService.saveCondition(ht, patientId);
		}

		model.addAttribute("patientId", patientId);
		model.addAttribute("pageString", pageString);

		return "redirect:/manageConditions";
	}

	/**
	 * Save Arrhythmia encounter
	 * 
	 * @param ar
	 *            Arrhythmia ModelAttribute(form backing object)
	 * @param bindingResult
	 *            BindingResult object
	 * @param cond
	 *            optional parameter (might be removed in next release)
	 * @param patientId
	 *            Patient ID
	 * @param pageString
	 *            String to passed to view to reroute user to manage-home or
	 *            manage-home-history after saving
	 * @param model
	 *            Model object to make data available to view
	 * @return redirects to manageConditions method
	 */
	@PostMapping("/saveArrhythmia")
	public String saveArrhythmia(@Valid @ModelAttribute("condition") Arrhythmia ar, BindingResult bindingResult,
			@RequestParam("cond") String cond, @RequestParam("patientId") int patientId,
			@RequestParam("pageString") String pageString, Model model, RedirectAttributes redirectAttributes) {

		List<FieldError> errors = bindingResult.getFieldErrors();
		for (FieldError error : errors) {
			logger.info(error.getObjectName() + " - " + error.getDefaultMessage());
		}

		if (bindingResult.hasErrors()) {
			logger.info("request has errors");
			String error = "(*)Please fill required fields";
			/*
			 * redirectAttributes.addFlashAttribute(
			 * "org.springframework.validation.BindingResult.ar", bindingResult);
			 * redirectAttributes.addFlashAttribute("ar", ar);
			 * 
			 * model.addAttribute("patientId", patientId); model.addAttribute("pageString",
			 * pageString); model.addAttribute("condition", cond);
			 */
			/*
			 * redirectAttributes.addFlashAttribute("patientId", patientId);
			 * redirectAttributes.addFlashAttribute("condition", cond);
			 * redirectAttributes.addFlashAttribute("pageString", pageString);
			 */

			return "redirect:/getConditionForm?patientId=" + patientId + "&condition=" + cond + "&pageString="
					+ pageString +"&error="+error;

		}
		if (ar instanceof Arrhythmia) {
			/*
			 * if (ar.getEncounterDate() == null) ar.setEncounterDate(new Date());
			 */
			encounterService.saveCondition(ar, patientId);
		}

		model.addAttribute("patientId", patientId);
		model.addAttribute("pageString", pageString);

		return "redirect:/manageConditions";
	}

	/**
	 * Save Peripheral Vascular Disease encounter
	 * 
	 * @param pvd
	 *            PeripheralVascularDz ModelAttribute(form backing object)
	 * @param bindingResult
	 *            BindingResult object
	 * @param cond
	 *            optional parameter (might be removed in next release)
	 * @param patientId
	 *            Patient ID
	 * @param pageString
	 *            String to passed to view to reroute user to manage-home or
	 *            manage-home-history after saving
	 * @param model
	 *            Model object to make data available to view
	 * @return redirects to manageConditions method
	 */
	@PostMapping("/savePeripheral")
	public String savePeripheral(@Valid @ModelAttribute("condition") PeripheralVascularDz pvd,
			BindingResult bindingResult, @RequestParam("cond") String cond, @RequestParam("patientId") int patientId,
			@RequestParam("pageString") String pageString, Model model) {

		List<FieldError> errors = bindingResult.getFieldErrors();
		for (FieldError error : errors) {
			logger.info(error.getObjectName() + " - " + error.getDefaultMessage());
		}

		if (bindingResult.hasErrors()) {
			logger.info("request has errors");
			String error = "(*)Please fill required fields";
			return "redirect:/getConditionForm?patientId=" + patientId + "&condition=" + cond + "&pageString="
					+ pageString+"&error="+error;
		}
		if (pvd instanceof PeripheralVascularDz) {
			// logger.info("this is encounter date for patient " + patientId + " " +
			// pvd.getEncounterDate());
			/*
			 * if (pvd.getEncounterDate() == null) pvd.setEncounterDate(new Date());
			 */
			encounterService.saveCondition(pvd, patientId);
		}

		model.addAttribute("patientId", patientId);
		model.addAttribute("pageString", pageString);

		return "redirect:/manageConditions";
	}

	/**
	 * Gets list of dates for requested condtion
	 * 
	 * @param patientId
	 *            Patient ID
	 * @param condition
	 *            String to display in condition form
	 * @param pageString
	 *            String used for redirection
	 * @param model
	 *            Model object to make data available to view
	 * @return history page with list of dates if available.
	 */
	@GetMapping("/getConditionHistory")
	public String getConditionHistory(@RequestParam("patientId") int patientId,
			@RequestParam("condition") String condition, @RequestParam("pageString") String pageString, Model model) {

		List<Date> datesList = encounterService.getHistory(condition, patientId);
		List<String> dateString = new ArrayList<>();
		for (Date d : datesList) {
			dateString.add(new SimpleDateFormat("MM-dd-yyyy").format(d));
		}

		model.addAttribute("datesList", datesList);
		model.addAttribute("patientId", patientId);
		model.addAttribute("condition", condition);
		model.addAttribute("pageString", pageString);
		// logger.info("this is page String " + pageString);
		return "history";
	}

	/**
	 * 
	 * @param patientID
	 *            Patient ID
	 * @param condition
	 *            String holding the name of condition, used for fetching condition
	 *            forms
	 * @param dateString
	 *            Date to query database
	 * @param pageString
	 *            String used for redirection
	 * @param model
	 *            Model object to make data available to view
	 * @return condition forms populated with patient history details
	 * @throws ParseException
	 */
	@GetMapping("/getConditionHistoryWithDate")
	public String getConditionHistoryForm(@RequestParam("patientId") String patientID,
			@RequestParam("condition") String condition, @RequestParam("date") String dateString,
			@RequestParam("pageString") String pageString, Model model) throws ParseException {
		int patientId = Integer.parseInt(patientID);
		
		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dateString);
		// logger.info("this is dateString "+date);
		if (condition.equals("Heart Failure")) {
			HeartFailure hf = (HeartFailure) encounterService.getHistoryObject("HeartFailure", date, patientId);
			// String dt = new SimpleDateFormat("yyyy/MM/dd
			// HH:mm:ss").format(hf.getStartTimeMA());
			hf.setWeightGainPrevious(encounterService.getPastWeight("HeartFailure", patientId));
			Patient p = patientService.getPatient(patientId);
			long age = patientService.getAge(patientId);
			model.addAttribute("diagnosis", p.getHeartFailureDiagnosis());
			model.addAttribute("age", age);
			model.addAttribute("name", p.getfName() + " " + p.getlName());
			model.addAttribute("hf", hf);
			// logger.info("heartfailure form history is passed" + hf.getStartTimeMA());
			model.addAttribute("patientId", patientId);
			model.addAttribute("pageString", pageString);
			return "heartfailure";
		} else if (condition.equals("Coronary Artery Disease")) {
			CoronaryArteryDz cad = (CoronaryArteryDz) encounterService.getHistoryObject("CoronaryArteryDz", date,
					patientId);
			Patient p = patientService.getPatient(patientId);
			long age = patientService.getAge(patientId);
			model.addAttribute("diagnosis", p.getCoronaryArteryFailureDiagnosis());
			model.addAttribute("age", age);
			model.addAttribute("name", p.getfName() + " " + p.getlName());
			model.addAttribute("cad", cad);
			model.addAttribute("patientId", patientId);
			model.addAttribute("pageString", pageString);
			return "coronary";
		} else if (condition.equals("Hypertension")) {
			Hypertension ht = (Hypertension) encounterService.getHistoryObject("Hypertension", date, patientId);
			ht.setWeightGainPrevious(encounterService.getPastWeight("HeartFailure", patientId));
			Patient p = patientService.getPatient(patientId);
			long age = patientService.getAge(patientId);
			model.addAttribute("diagnosis", p.getHypertensionDiagnosis());
			model.addAttribute("age", age);
			model.addAttribute("name", p.getfName() + " " + p.getlName());
			model.addAttribute("ht", ht);
			model.addAttribute("patientId", patientId);
			model.addAttribute("pageString", pageString);
			return "hypertension";
		} else if (condition.equals("Arrhythmia")) {
			Arrhythmia ar = (Arrhythmia) encounterService.getHistoryObject("Arrhythmia", date, patientId);
			Patient p = patientService.getPatient(patientId);
			long age = patientService.getAge(patientId);
			model.addAttribute("diagnosis", p.getArrhythmiaDiagnosis());
			model.addAttribute("age", age);
			model.addAttribute("name", p.getfName() + " " + p.getlName());
			model.addAttribute("ar", ar);
			model.addAttribute("patientId", patientId);
			model.addAttribute("pageString", pageString);
			return "arrhythmia";
		} else if (condition.equals("Peripheral Vascular Disease")) {
			PeripheralVascularDz pvd = (PeripheralVascularDz) encounterService.getHistoryObject("PeripheralVascularDz",
					date, patientId);
			Patient p = patientService.getPatient(patientId);
			long age = patientService.getAge(patientId);
			model.addAttribute("diagnosis", p.getPeripheralVascularDzDiagnosis());
			model.addAttribute("age", age);
			model.addAttribute("name", p.getfName() + " " + p.getlName());
			model.addAttribute("pvd", pvd);
			model.addAttribute("patientId", patientId);
			model.addAttribute("pageString", pageString);
			return "peripheral";
		}

		// logger.info("end of handler");
		return "redirect:/manageConditions";
	}

	/**
	 * Delete encounter for a condition
	 * 
	 * @param patientID
	 *            Patient ID
	 * @param condition
	 *            String used to identify condition
	 * @param dateString
	 *            Date to query database
	 * @param pageString
	 *            String used for redirection
	 * @param model
	 *            Model object to make data available to view
	 * @return reloads page
	 * @throws ParseException
	 */
	@GetMapping("/deleteEncounter")
	public String deleteEncounter(@RequestParam("patientId") String patientID,
			@RequestParam("condition") String condition, @RequestParam("date") String dateString,
			@RequestParam("pageString") String pageString, Model model) throws ParseException {

		int patientId = Integer.parseInt(patientID);
		/*
		 * DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-M-d",
		 * Locale.ENGLISH); LocalDate date = LocalDate.parse(dateString, formatter);
		 */

		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dateString);

		if (condition.equals("Heart Failure")) {
			encounterService.deleteEncounter("HeartFailure", date, patientId);

		} else if (condition.equals("Coronary Artery Disease")) {
			encounterService.deleteEncounter("CoronaryArteryDz", date, patientId);

		} else if (condition.equals("Hypertension")) {
			encounterService.deleteEncounter("Hypertension", date, patientId);

		} else if (condition.equals("Arrhythmia")) {
			encounterService.deleteEncounter("Arrhythmia", date, patientId);

		} else if (condition.equals("Peripheral Vascular Disease")) {
			encounterService.deleteEncounter("PeripheralVascularDz", date, patientId);
		}
		/*
		 * List<Date> datesList = encounterService.getHistory(condition, patientId);
		 * model.addAttribute("datesList", datesList);
		 */
		model.addAttribute("patientId", patientId);
		model.addAttribute("condition", condition);
		model.addAttribute("pageString", pageString);
		return "redirect:/getConditionHistory";
	}

	/**
	 * Procides reports page
	 * 
	 * @param model
	 *            Model object to make data available to view
	 * @return reports page
	 */
	@GetMapping("/report")
	public String reportsPage(Model model) {

		return "reportsPage";
	}

	/**
	 * Prepares report
	 * 
	 * @param month
	 *            String parameter for selected month
	 * @param model
	 *            Model object to make data available to view
	 * @return billing bean.Bean is resolved by
	 *         org.springframework.web.servlet.view.BeanNameViewResolver. A
	 *         component class with bean name "billing" is present in utils package.
	 */
	@GetMapping("/billing/{month}")
	public String billingReport(@RequestParam(name = "month") String month, Model model) {

		// logger.info("This is the integer" + month);
		int monthInt = Integer.parseInt(month);
		// logger.info("This is the integer" + monthInt);
		List<PatientReportDTO> list = reportService.getPatientReportDTO(monthInt);
		for (PatientReportDTO p : list)
			// logger.info(p);
			model.addAttribute("patientReportDTO", reportService.getPatientReportDTO(monthInt));
		// model.addAttribute("patientList", patientService.getPatients());
		return "billing";
	}

	/**
	 * This method fetches patient list upon a call from inside search() method in
	 * the same class
	 * 
	 * @param searchTerm
	 *            String search term passed from inside search() method
	 * @return list of patients
	 */
	public List<Patient> searchPatient(String searchTerm) {
		List<Patient> patientList = patientService.searchByName(searchTerm);
		return patientList;
	}

	/**
	 * Binder for date objects in Heartfailure objects
	 * 
	 * @param binder
	 *            WebDataBinder object to register CustomDateEditor.
	 */
	@InitBinder("hf")
	public void initBinderHeartFailure(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		sdf.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
	}

	/**
	 * Binder for date objects in PeripheralVascularDz objects
	 * 
	 * @param binder
	 *            WebDataBinder object to register CustomDateEditor.
	 */
	@InitBinder("pvd")
	public void initBinderPeripheral(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		sdf.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
	}

	/**
	 * Binder for date objects in Hypertension objects
	 * 
	 * @param binder
	 *            WebDataBinder object to register CustomDateEditor.
	 */
	@InitBinder("ht")
	public void initBinderhypertension(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		sdf.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
	}

	/**
	 * Binder for date objects in CoronaryArteryDz objects
	 * 
	 * @param binder
	 *            WebDataBinder object to register CustomDateEditor.
	 */
	@InitBinder("cad")
	public void initBinderCoronary(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		sdf.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
	}

	/**
	 * Binder for date objects in Arrhythmia objects
	 * 
	 * @param binder
	 *            WebDataBinder object to register CustomDateEditor.
	 */
	@InitBinder("ar")
	public void initBinderArrhythmia(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		sdf.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
	}

	/**
	 * Binder for date objects in Patient object
	 * 
	 * @param binder
	 *            WebDataBinder object to register CustomDateEditor.
	 */
	@InitBinder("patient")
	public void initBinderPatient(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		sdf.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
	}

}
