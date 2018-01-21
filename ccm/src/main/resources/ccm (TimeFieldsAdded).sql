CREATE DATABASE  IF NOT EXISTS `ccm_master` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ccm_master`;

DROP TABLE IF EXISTS `patient`;

CREATE TABLE `patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `dob` DATE DEFAULT NULL,
  `enrollment_date` DATE DEFAULT NULL,
  `contact_one` varchar(45) DEFAULT NULL,
  `contact_two` varchar(45) DEFAULT NULL,
  `care_giver_one` varchar(45) DEFAULT NULL,
  `care_giver_two` varchar(45) DEFAULT NULL,
  `heartfailure` CHAR(1) DEFAULT NULL,
  `heartfailure_additional` varchar(500) DEFAULT NULL,
  `coronary` CHAR(1) DEFAULT NULL,
  `coronary_additional` varchar(500) DEFAULT NULL,
  `hypertension` CHAR(1) DEFAULT NULL,
  `hypertension_additional` varchar(500) DEFAULT NULL,
  `arrhythmia` CHAR(1) DEFAULT NULL,
  `arrhythmia_additional` varchar(500) DEFAULT NULL,
  `peripheral` CHAR(1) DEFAULT NULL,
  `peripheral_additional` varchar(500) DEFAULT NULL,
  `enrollment_reason` varchar(200) DEFAULT NULL,
  `care_complexity` varchar(45) DEFAULT NULL,
  `heartfailure_diagnosis` varchar(100) DEFAULT NULL,
  `coronary_diagnosis` varchar(100) DEFAULT NULL,
  `hypertension_diagnosis` varchar(100) DEFAULT NULL,
  `arrhythmia_diagnosis` varchar(100) DEFAULT NULL,
  `peripheral_diagnosis` varchar(100) DEFAULT NULL,  
  PRIMARY KEY (`id`)
  
  ) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `heartfailure`;

CREATE TABLE `heartfailure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `encounter_date` DATE DEFAULT NULL,
  `start_time_ma` DATETIME DEFAULT NULL,
  `end_time_ma` DATETIME DEFAULT NULL,
  `time_spent_ma`INT DEFAULT 0,
  `start_time_md` DATETIME DEFAULT NULL,
  `end_time_md` DATETIME DEFAULT NULL,
  `time_spent_md`INT DEFAULT 0,
  `total_time`INT DEFAULT 0,
  `sob` CHAR(1) DEFAULT NULL,
  `sob_comments` varchar(500) DEFAULT NULL,
  `chest_pain` CHAR(1) DEFAULT NULL,
  `chest_pain_comments` varchar(500) DEFAULT NULL,
  `changes_in_med` CHAR(1) DEFAULT NULL,
  `changes_med_comments` varchar(500) DEFAULT NULL,
  `compliant_with_med` CHAR(1) DEFAULT NULL,
  `compliant_med_comments` varchar(500) DEFAULT NULL,
  `chief_complaint` varchar(500) DEFAULT NULL,
  `enrolled_hhc` CHAR(1) DEFAULT NULL,
  `enrolled_hhc_comments` varchar(500) DEFAULT NULL,
  `referred_sw` CHAR(1) DEFAULT NULL,
  `referred_sw_comments` varchar(500) DEFAULT NULL,
  `referred_lsc` CHAR(1) DEFAULT NULL,
  `referred_lsc_comments` varchar(500) DEFAULT NULL,
  `referred_pt` CHAR(1) DEFAULT NULL,
  `referred_pt_comments` varchar(500) DEFAULT NULL,
  `functional_assessment` varchar(500) DEFAULT NULL,
  `home_bp` CHAR(1) DEFAULT NULL,
  `home_bp_reading` varchar(10) DEFAULT NULL,  
  `doe` CHAR(1) DEFAULT NULL,
  `doe_comments` varchar(500) DEFAULT NULL,
  `pnd` CHAR(1) DEFAULT NULL,
  `pnd_comments` varchar(500) DEFAULT NULL,
  `edema` CHAR(1) DEFAULT NULL,
  `edema_comments` varchar(500) DEFAULT NULL,
  `cough` CHAR(1) DEFAULT NULL,
  `cough_comments` varchar(500) DEFAULT NULL,
  `fatigue` CHAR(1) DEFAULT NULL,
  `fatigue_comments` varchar(500) DEFAULT NULL,
  `weight_gain` CHAR(1) DEFAULT NULL,
  `weight_gain_current`FLOAT(5,2) DEFAULT NULL,
  `weight_gain_previous`FLOAT(5,2) DEFAULT NULL,
  `beta_blocker` CHAR(1) DEFAULT NULL,
  `beta_blocker_comments` varchar(500) DEFAULT NULL,
  `ace_arb_entresto` CHAR(1) DEFAULT NULL,
  `ace_arb_entresto_comments` varchar(500) DEFAULT NULL,
  `aldo_spiro` CHAR(1) DEFAULT NULL,
  `aldo_spiro_comments` varchar(500) DEFAULT NULL,
  `diuretic` CHAR(1) DEFAULT NULL,
  `diuretic_comments` varchar(500) DEFAULT NULL,
  `bidil` CHAR(1) DEFAULT NULL,
  `bidil_comments` varchar(500) DEFAULT NULL,
  `salt_restriction` CHAR(1) DEFAULT NULL,
  `salt_rest_comments` varchar(500) DEFAULT NULL,
  `fluid_restriction` CHAR(1) DEFAULT NULL,
  `fluid_rest_comments` varchar(500) DEFAULT NULL,
  `weight_management` varchar(500) DEFAULT NULL,
  `sleep_apnea` varchar(500) DEFAULT NULL,
  `prognosis` varchar(25) DEFAULT NULL,  
  `provider_comments` varchar(500) DEFAULT NULL,  
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_PATIENT_ID` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`) ON DELETE NO   ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `coronary`;
CREATE TABLE `coronary` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `patient_id` INT(11) NOT NULL,
  `encounter_date` DATE DEFAULT NULL,
  `start_time_ma` DATETIME DEFAULT NULL,
  `end_time_ma` DATETIME DEFAULT NULL,
  `time_spent_ma`INT DEFAULT 0,
  `start_time_md` DATETIME DEFAULT NULL,
  `end_time_md` DATETIME DEFAULT NULL,
  `time_spent_md`INT DEFAULT 0,
  `total_time`INT DEFAULT 0,
  `sob` CHAR(1) DEFAULT NULL,
  `sob_comments` varchar(500) DEFAULT NULL,
  `chest_pain` CHAR(1) DEFAULT NULL,
  `chest_pain_comments` varchar(500) DEFAULT NULL,
  `changes_in_med` CHAR(1) DEFAULT NULL,
  `changes_med_comments` varchar(500) DEFAULT NULL,
  `compliant_with_med` CHAR(1) DEFAULT NULL,
  `compliant_med_comments` varchar(500) DEFAULT NULL,
  `chief_complaint` varchar(500) DEFAULT NULL,
  `enrolled_hhc` CHAR(1) DEFAULT NULL,
  `enrolled_hhc_comments` varchar(500) DEFAULT NULL,
  `referred_sw` CHAR(1) DEFAULT NULL,
  `referred_sw_comments` varchar(500) DEFAULT NULL,
  `referred_lsc` CHAR(1) DEFAULT NULL,
  `referred_lsc_comments` varchar(500) DEFAULT NULL,
  `referred_pt` CHAR(1) DEFAULT NULL,
  `referred_pt_comments` varchar(500) DEFAULT NULL,
  `functional_assessment` varchar(500) DEFAULT NULL,
  `home_bp` CHAR(1) DEFAULT NULL,
  `home_bp_reading` varchar(10) DEFAULT NULL,  
  `doe` CHAR(1) DEFAULT NULL,
  `doe_comments` varchar(500) DEFAULT NULL,
  `pnd` CHAR(1) DEFAULT NULL,
  `pnd_comments` varchar(500) DEFAULT NULL,
  `fatigue` CHAR(1) DEFAULT NULL,
  `fatigue_comments` varchar(500) DEFAULT NULL,
  `antiplat` CHAR(1) DEFAULT NULL,
  `antiplat_comments` varchar(500) DEFAULT NULL,
  `ace_arb` CHAR(1) DEFAULT NULL,
  `ace_arb_comments` varchar(500) DEFAULT NULL,
  `beta_blocker` CHAR(1) DEFAULT NULL,
  `beta_blocker_comments` varchar(500) DEFAULT NULL,
  `lipid_mgmt` CHAR(1) DEFAULT NULL,
  `lipid_comments` varchar(500) DEFAULT NULL,
  `nitrites` CHAR(1) DEFAULT NULL,
  `nitrites_comments` varchar(500) DEFAULT NULL,
  `salt_restriction` CHAR(1) DEFAULT NULL,
  `salt_rest_comments` varchar(500) DEFAULT NULL,
  `cholest_mgmt` CHAR(1) DEFAULT NULL,
  `cholest_comments` varchar(500) DEFAULT NULL,
  `sleep_apnea` varchar(500) DEFAULT NULL,
  `prognosis` varchar(25) DEFAULT NULL,  
  `provider_comments` varchar(500) DEFAULT NULL,  
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_PATIENT_ID_C` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `hypertension`;
CREATE TABLE `hypertension` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `encounter_date` DATE DEFAULT NULL,
  `start_time_ma` DATETIME DEFAULT NULL,
  `end_time_ma` DATETIME DEFAULT NULL,
  `time_spent_ma`INT DEFAULT 0,
  `start_time_md` DATETIME DEFAULT NULL,
  `end_time_md` DATETIME DEFAULT NULL,
  `time_spent_md`INT DEFAULT 0,
  `total_time`INT DEFAULT 0,
  `sob` CHAR(1) DEFAULT NULL,
  `sob_comments` varchar(500) DEFAULT NULL,
  `chest_pain` CHAR(1) DEFAULT NULL,
  `chest_pain_comments` varchar(500) DEFAULT NULL,
  `changes_in_med` CHAR(1) DEFAULT NULL,
  `changes_med_comments` varchar(500) DEFAULT NULL,
  `compliant_with_med` CHAR(1) DEFAULT NULL,
  `compliant_med_comments` varchar(500) DEFAULT NULL,
  `chief_complaint` varchar(500) DEFAULT NULL,
  `enrolled_hhc` CHAR(1) DEFAULT NULL,
  `enrolled_hhc_comments` varchar(500) DEFAULT NULL,
  `referred_sw` CHAR(1) DEFAULT NULL,
  `referred_sw_comments` varchar(500) DEFAULT NULL,
  `referred_lsc` CHAR(1) DEFAULT NULL,
  `referred_lsc_comments` varchar(500) DEFAULT NULL,
  `referred_pt` CHAR(1) DEFAULT NULL,
  `referred_pt_comments` varchar(500) DEFAULT NULL,
  `functional_assessment` varchar(500) DEFAULT NULL,
  `home_bp` CHAR(1) DEFAULT NULL,
  `home_bp_reading` varchar(10) DEFAULT NULL, 
  `doe` CHAR(1) DEFAULT NULL,
  `doe_comments` varchar(500) DEFAULT NULL,
  `pnd` CHAR(1) DEFAULT NULL,
  `pnd_comments` varchar(500) DEFAULT NULL,
  `edema` CHAR(1) DEFAULT NULL,
  `edema_comments` varchar(500) DEFAULT NULL,
  `headache` CHAR(1) DEFAULT NULL,
  `headache_comments` varchar(500) DEFAULT NULL,
  `fatigue` CHAR(1) DEFAULT NULL,
  `fatigue_comments` varchar(500) DEFAULT NULL,
  `weight_gain` CHAR(1) DEFAULT NULL,
  `weight_gain_current`FLOAT(5,2) DEFAULT NULL,
  `weight_gain_previous`FLOAT(5,2) DEFAULT NULL,
  `ace_arb` CHAR(1) DEFAULT NULL,
  `ace_arb_comments` varchar(500) DEFAULT NULL,
  `beta_blocker` CHAR(1) DEFAULT NULL,
  `beta_blocker_comments` varchar(500) DEFAULT NULL,
  `aldo_spiro` CHAR(1) DEFAULT NULL,
  `aldo_spiro_comments` varchar(500) DEFAULT NULL,
  `diuretic` CHAR(1) DEFAULT NULL,
  `diuretic_comments` varchar(500) DEFAULT NULL,
  `bidil` CHAR(1) DEFAULT NULL,
  `bidil_comments` varchar(500) DEFAULT NULL,
  `salt_restriction` CHAR(1) DEFAULT NULL,
  `salt_rest_comments` varchar(500) DEFAULT NULL,
  `fluid_restriction` CHAR(1) DEFAULT NULL,
  `fluid_rest_comments` varchar(500) DEFAULT NULL,
  `cholest_mgmt` CHAR(1) DEFAULT NULL,
  `cholest_comments` varchar(500) DEFAULT NULL,
  `sleep_apnea` varchar(500) DEFAULT NULL, 
  `prognosis` varchar(25) DEFAULT NULL,  
  `provider_comments` varchar(500) DEFAULT NULL,  
  PRIMARY KEY (`id`),
   CONSTRAINT `FK_PATIENT_ID_HYPER` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `arrhythmia`;
CREATE TABLE `arrhythmia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `encounter_date` DATE DEFAULT NULL,
  `start_time_ma` DATETIME DEFAULT NULL,
  `end_time_ma` DATETIME DEFAULT NULL,
  `time_spent_ma`INT DEFAULT 0,
  `start_time_md` DATETIME DEFAULT NULL,
  `end_time_md` DATETIME DEFAULT NULL,
  `time_spent_md`INT DEFAULT 0,
  `total_time`INT DEFAULT 0,
  `sob` CHAR(1) DEFAULT NULL,
  `sob_comments` varchar(500) DEFAULT NULL,
  `chest_pain` CHAR(1) DEFAULT NULL,
  `chest_pain_comments` varchar(500) DEFAULT NULL,
  `changes_in_med` CHAR(1) DEFAULT NULL,
  `changes_med_comments` varchar(500) DEFAULT NULL,
  `compliant_with_med` CHAR(1) DEFAULT NULL,
  `compliant_med_comments` varchar(500) DEFAULT NULL,
  `chief_complaint` varchar(500) DEFAULT NULL,
  `enrolled_hhc` CHAR(1) DEFAULT NULL,
  `enrolled_hhc_comments` varchar(500) DEFAULT NULL,
  `referred_sw` CHAR(1) DEFAULT NULL,
  `referred_sw_comments` varchar(500) DEFAULT NULL,
  `referred_lsc` CHAR(1) DEFAULT NULL,
  `referred_lsc_comments` varchar(500) DEFAULT NULL,
  `referred_pt` CHAR(1) DEFAULT NULL,
  `referred_pt_comments` varchar(500) DEFAULT NULL,
  `functional_assessment` varchar(500) DEFAULT NULL,
  `home_bp` CHAR(1) DEFAULT NULL,
  `home_bp_reading` varchar(10) DEFAULT NULL,
  `palpitations` CHAR(1) DEFAULT NULL,
  `palpitations_comments` varchar(500) DEFAULT NULL,
  `dizziness` CHAR(1) DEFAULT NULL,
  `dizziness_comments` varchar(500) DEFAULT NULL,
  `syncope` CHAR(1) DEFAULT NULL,
  `syncope_comments` varchar(500) DEFAULT NULL,
  `bleeding` CHAR(1) DEFAULT NULL,
  `bleeding_comments` varchar(500) DEFAULT NULL,
  `weakness` CHAR(1) DEFAULT NULL,
  `weakness_comments` varchar(500) DEFAULT NULL,
  `antiarrhythmics` CHAR(1) DEFAULT NULL,
  `antiarrhythmics_comments` varchar(500) DEFAULT NULL,
  `antiplatelet` CHAR(1) DEFAULT NULL,
  `antiplatelet_comments` varchar(500) DEFAULT NULL,
  `anticoagulants` CHAR(1) DEFAULT NULL,
  `anticoagulants_comments` varchar(500) DEFAULT NULL,
  `creatinine_comments` varchar(500) DEFAULT NULL,
  `pt_INR_comments` varchar(500) DEFAULT NULL,
  `fall_risk_comments` varchar(500) DEFAULT NULL,
  `sleep_apnea` varchar(500) DEFAULT NULL, 
  `nutrition` varchar(500) DEFAULT NULL,  
  `prognosis` varchar(25) DEFAULT NULL,  
  `provider_comments` varchar(500) DEFAULT NULL,  
  PRIMARY KEY (`id`),
   CONSTRAINT `FK_PATIENT_ID_ARR`FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `peripheral`;
CREATE TABLE `peripheral` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `encounter_date` DATE DEFAULT NULL,
  `start_time_ma` DATETIME DEFAULT NULL,
  `end_time_ma` DATETIME DEFAULT NULL,
  `time_spent_ma`INT DEFAULT 0,
  `start_time_md` DATETIME DEFAULT NULL,
  `end_time_md` DATETIME DEFAULT NULL,
  `time_spent_md`INT DEFAULT 0,
  `total_time`INT DEFAULT 0,
  `sob` CHAR(1) DEFAULT NULL,
  `sob_comments` varchar(500) DEFAULT NULL,
  `chest_pain` CHAR(1) DEFAULT NULL,
  `chest_pain_comments` varchar(500) DEFAULT NULL,
  `changes_in_med` CHAR(1) DEFAULT NULL,
  `changes_med_comments` varchar(500) DEFAULT NULL,
  `compliant_with_med` CHAR(1) DEFAULT NULL,
  `compliant_med_comments` varchar(500) DEFAULT NULL,
  `chief_complaint` varchar(500) DEFAULT NULL,
  `enrolled_hhc` CHAR(1) DEFAULT NULL,
  `enrolled_hhc_comments` varchar(500) DEFAULT NULL,
  `referred_sw` CHAR(1) DEFAULT NULL,
  `referred_sw_comments` varchar(500) DEFAULT NULL,
  `referred_lsc` CHAR(1) DEFAULT NULL,
  `referred_lsc_comments` varchar(500) DEFAULT NULL,
  `referred_pt` CHAR(1) DEFAULT NULL,
  `referred_pt_comments` varchar(500) DEFAULT NULL,
  `functional_assessment` varchar(500) DEFAULT NULL,
  `home_bp` CHAR(1) DEFAULT NULL,
  `home_bp_reading` varchar(10) DEFAULT NULL,
  `leg_pain` CHAR(1) DEFAULT NULL,
  `leg_pain_comments` varchar(500) DEFAULT NULL,
  `leg_swelling` CHAR(1) DEFAULT NULL,
  `leg_swelling_comments` varchar(500) DEFAULT NULL,
  `skn_clr_changes` CHAR(1) DEFAULT NULL,
  `skn_clr_changes_comments` varchar(500) DEFAULT NULL,  
  `skn_brkdn` CHAR(1) DEFAULT NULL,
  `skn_brkdn_comments` varchar(500) DEFAULT NULL,
  `fever_chills` CHAR(1) DEFAULT NULL,
  `fever_chills_comments` varchar(500) DEFAULT NULL,
  `antiplat` CHAR(1) DEFAULT NULL,
  `antiplat_comments` varchar(500) DEFAULT NULL,
  `anticoagulants` CHAR(1) DEFAULT NULL,
  `anticoagulants_comments` varchar(500) DEFAULT NULL,
  `leg_elvtn` CHAR(1) DEFAULT NULL,
  `leg_elvtn_comments` varchar(500) DEFAULT NULL,
  `cmprsn_stkgs` CHAR(1) DEFAULT NULL,
  `cmprsn_stkgs_comments` varchar(500) DEFAULT NULL,
  `lipid_mgmt` CHAR(1) DEFAULT NULL,
  `lipid_comments` varchar(500) DEFAULT NULL,
  `salt_restriction` CHAR(1) DEFAULT NULL,
  `salt_rest_comments` varchar(500) DEFAULT NULL,
  `diuretic` CHAR(1) DEFAULT NULL,
  `diuretic_comments` varchar(500) DEFAULT NULL,    
  `cholest_comments` varchar(500) DEFAULT NULL,
  `prognosis` varchar(25) DEFAULT NULL,  
  `provider_comments` varchar(500) DEFAULT NULL,  
  PRIMARY KEY (`id`),
 CONSTRAINT `FK_PATIENT_ID_P` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

########## Hibernate Key generator table######################################  
  
DROP TABLE IF EXISTS `keys_gen`;
CREATE TABLE `keys_gen`(
`PK_NAME` varchar(100) NOT NULL, 
`PK_VALUE` INT NOT NULL,
PRIMARY KEY (`PK_NAME`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

################ User accounts table####################################
DROP TABLE IF EXISTS user_info;
CREATE TABLE user_info (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(25) DEFAULT 'ROLE_ADMIN',
  PRIMARY KEY (`id`)  
  ) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
  
  insert into user_info (`user_name`,`password`) values ('ecs','$2a$10$dbtKFYzifUwR4cK6lVu0/.ShI9z4mxheL/f7Ywum58dfvtT9mWZmi');


##########THIS ARE TRIGGERS FOR INSERT###########################

DROP TRIGGER IF EXISTS time_all_hf;
DELIMITER $$
CREATE TRIGGER time_all_hf BEFORE INSERT ON heartfailure
FOR EACH ROW 
	BEGIN
		SET NEW.time_spent_ma = TIMESTAMPDIFF(MINUTE,NEW.start_time_ma,NEW.end_time_ma);
		SET NEW.time_spent_md = TIMESTAMPDIFF(MINUTE,NEW.start_time_md,NEW.end_time_md);
		SET NEW.total_time = NEW.time_spent_ma + NEW.time_spent_md;
END$$

DELIMITER ;

DROP TRIGGER IF EXISTS time_all_ht;
DELIMITER $$
CREATE TRIGGER time_all_ht BEFORE INSERT ON hypertension
FOR EACH ROW 
	BEGIN
		SET NEW.time_spent_ma = TIMESTAMPDIFF(MINUTE,NEW.start_time_ma,NEW.end_time_ma);
		SET NEW.time_spent_md = TIMESTAMPDIFF(MINUTE,NEW.start_time_md,NEW.end_time_md);
		SET NEW.total_time = NEW.time_spent_ma + NEW.time_spent_md;
END$$

DELIMITER ;

DROP TRIGGER IF EXISTS time_all_coronary;
DELIMITER $$
CREATE TRIGGER time_all_coronary BEFORE INSERT ON coronary
FOR EACH ROW 
	BEGIN
		SET NEW.time_spent_ma = TIMESTAMPDIFF(MINUTE,NEW.start_time_ma,NEW.end_time_ma);
		SET NEW.time_spent_md = TIMESTAMPDIFF(MINUTE,NEW.start_time_md,NEW.end_time_md);
		SET NEW.total_time = NEW.time_spent_ma + NEW.time_spent_md;
END$$

DELIMITER ;

DROP TRIGGER IF EXISTS time_all_ar;
DELIMITER $$
CREATE TRIGGER time_all_ar BEFORE INSERT ON arrhythmia
FOR EACH ROW 
	BEGIN
		SET NEW.time_spent_ma = TIMESTAMPDIFF(MINUTE,NEW.start_time_ma,NEW.end_time_ma);
		SET NEW.time_spent_md = TIMESTAMPDIFF(MINUTE,NEW.start_time_md,NEW.end_time_md);
		SET NEW.total_time = NEW.time_spent_ma + NEW.time_spent_md;
END$$

DELIMITER ;

DROP TRIGGER IF EXISTS time_all_peripheral;
DELIMITER $$
CREATE TRIGGER time_all_peripheral BEFORE INSERT ON peripheral
FOR EACH ROW 
	BEGIN
		SET NEW.time_spent_ma = TIMESTAMPDIFF(MINUTE,NEW.start_time_ma,NEW.end_time_ma);
		SET NEW.time_spent_md = TIMESTAMPDIFF(MINUTE,NEW.start_time_md,NEW.end_time_md);
		SET NEW.total_time = NEW.time_spent_ma + NEW.time_spent_md;
END$$

DELIMITER ;

##########THIS ARE TRIGGERS FOR UPDATE###########################

DROP TRIGGER IF EXISTS time_hf_update;
DELIMITER $$
CREATE TRIGGER time_hf_update BEFORE UPDATE ON heartfailure
FOR EACH ROW 
	BEGIN
		SET NEW.time_spent_ma = TIMESTAMPDIFF(MINUTE,NEW.start_time_ma,NEW.end_time_ma);
		SET NEW.time_spent_md = TIMESTAMPDIFF(MINUTE,NEW.start_time_md,NEW.end_time_md);
		SET NEW.total_time = NEW.time_spent_ma + NEW.time_spent_md;
END$$

DELIMITER ;
DROP TRIGGER IF EXISTS time_ht_update;
DELIMITER $$
CREATE TRIGGER time_ht_update BEFORE UPDATE ON hypertension
FOR EACH ROW 
	BEGIN
		SET NEW.time_spent_ma = TIMESTAMPDIFF(MINUTE,NEW.start_time_ma,NEW.end_time_ma);
		SET NEW.time_spent_md = TIMESTAMPDIFF(MINUTE,NEW.start_time_md,NEW.end_time_md);
		SET NEW.total_time = NEW.time_spent_ma + NEW.time_spent_md;
END$$

DELIMITER ;
DROP TRIGGER IF EXISTS time_coronary_update;
DELIMITER $$
CREATE TRIGGER time_coronary_update BEFORE UPDATE ON coronary
FOR EACH ROW 
	BEGIN
		SET NEW.time_spent_ma = TIMESTAMPDIFF(MINUTE,NEW.start_time_ma,NEW.end_time_ma);
		SET NEW.time_spent_md = TIMESTAMPDIFF(MINUTE,NEW.start_time_md,NEW.end_time_md);
		SET NEW.total_time = NEW.time_spent_ma + NEW.time_spent_md;
END$$

DELIMITER ;
DROP TRIGGER IF EXISTS time_ar_update;
DELIMITER $$
CREATE TRIGGER time_ar_update BEFORE UPDATE ON arrhythmia
FOR EACH ROW 
	BEGIN
		SET NEW.time_spent_ma = TIMESTAMPDIFF(MINUTE,NEW.start_time_ma,NEW.end_time_ma);
		SET NEW.time_spent_md = TIMESTAMPDIFF(MINUTE,NEW.start_time_md,NEW.end_time_md);
		SET NEW.total_time = NEW.time_spent_ma + NEW.time_spent_md;
END$$

DELIMITER ;
DROP TRIGGER IF EXISTS time_peripheral_update;
DELIMITER $$
CREATE TRIGGER time_peripheral_update BEFORE UPDATE ON peripheral
FOR EACH ROW 
	BEGIN
		SET NEW.time_spent_ma = TIMESTAMPDIFF(MINUTE,NEW.start_time_ma,NEW.end_time_ma);
		SET NEW.time_spent_md = TIMESTAMPDIFF(MINUTE,NEW.start_time_md,NEW.end_time_md);
		SET NEW.total_time = NEW.time_spent_ma + NEW.time_spent_md;
END$$

DELIMITER ;

################### This is a view for reporting ############################################

DROP VIEW if exists innerTimeView;
CREATE VIEW innerTimeView as 
    SELECT patient_id,total_time,encounter_date FROM heartfailure
	UNION ALL
	SELECT patient_id,total_time,encounter_date FROM coronary
	UNION ALL
	SELECT patient_id,total_time,encounter_date FROM peripheral
	UNION ALL
	SELECT patient_id,total_time,encounter_date FROM arrhythmia 
	UNION ALL
	SELECT patient_id,total_time,encounter_date FROM hypertension;
