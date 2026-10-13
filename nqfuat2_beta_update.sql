-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 13, 2026 at 07:07 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nqfuat2`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_app_mng_mapping`
--

DROP TABLE IF EXISTS `tbl_app_mng_mapping`;
CREATE TABLE IF NOT EXISTS `tbl_app_mng_mapping` (
  `map_id` bigint NOT NULL AUTO_INCREMENT,
  `form_unique_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `user_type` smallint DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_ip` text NOT NULL,
  `updated_ip` text NOT NULL,
  `created_app_id` bigint NOT NULL,
  `updated_app_id` bigint NOT NULL,
  `created_time` double DEFAULT NULL,
  `last_updated_time` double DEFAULT NULL,
  PRIMARY KEY (`map_id`),
  UNIQUE KEY `tbl_app_mng_mapping_unique_id` (`map_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_archival_form`
--

DROP TABLE IF EXISTS `tbl_archival_form`;
CREATE TABLE IF NOT EXISTS `tbl_archival_form` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `decision` text,
  `comment` text,
  `reason` text,
  `form_unique_id` bigint NOT NULL,
  `sector` int DEFAULT NULL,
  `created_ip` text,
  `updated_ip` text,
  `created_app_id` bigint DEFAULT NULL,
  `updated_app_id` bigint DEFAULT NULL,
  `created_time` bigint DEFAULT NULL,
  `last_updated_time` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_checklist_management`
--

DROP TABLE IF EXISTS `tbl_checklist_management`;
CREATE TABLE IF NOT EXISTS `tbl_checklist_management` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_unique_id` bigint DEFAULT NULL COMMENT 'Application formUniqueId (null for global DFO checklists)',
  `checklist_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Checklist category: DFO or ILEP',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Uploaded file name',
  `file_size` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Formatted file size',
  `file_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'S3 Location URL or data URL',
  `uploaded_by_user_id` bigint DEFAULT NULL COMMENT 'User ID who uploaded the file',
  `uploaded_by_user_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'User code (e.g. 3:0 for DFO Admin, 7:0 for ILEP Member)',
  `created_time` bigint DEFAULT NULL COMMENT 'Creation epoch timestamp in milliseconds',
  `last_updated_time` bigint DEFAULT NULL COMMENT 'Last updated epoch timestamp in milliseconds',
  `created_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_app_id` bigint DEFAULT NULL,
  `updated_app_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_form_unique_id` (`form_unique_id`),
  KEY `idx_checklist_type` (`checklist_type`),
  KEY `idx_type_form` (`checklist_type`,`form_unique_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_client_registration`
--

DROP TABLE IF EXISTS `tbl_client_registration`;
CREATE TABLE IF NOT EXISTS `tbl_client_registration` (
  `app_id` bigint NOT NULL AUTO_INCREMENT,
  `device_id` varchar(50) DEFAULT NULL,
  `os_info` varchar(30) DEFAULT NULL,
  `model_info` text,
  `device_token` text,
  `app_version` varchar(30) DEFAULT NULL,
  `count` int DEFAULT NULL,
  `created_ip` text,
  `updated_ip` text,
  `created_time` double DEFAULT NULL,
  `last_updated_time` double DEFAULT NULL,
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_confirmation_panel`
--

DROP TABLE IF EXISTS `tbl_confirmation_panel`;
CREATE TABLE IF NOT EXISTS `tbl_confirmation_panel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_unique_id` bigint DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `position` varchar(500) DEFAULT NULL,
  `have_major_changes` int DEFAULT NULL,
  `chair` int DEFAULT NULL,
  `over_all_nqf_level` varchar(100) DEFAULT NULL,
  `over_all_nqf_credit` varchar(100) DEFAULT NULL,
  `comments` text,
  `date` bigint DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_time` bigint DEFAULT NULL,
  `created_ip` varchar(500) DEFAULT NULL,
  `updated_ip` varchar(500) DEFAULT NULL,
  `created_app_id` bigint DEFAULT NULL,
  `updated_app_id` bigint DEFAULT NULL,
  `last_updated_time` bigint DEFAULT NULL,
  `is_revalidation` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_conflict_form`
--

DROP TABLE IF EXISTS `tbl_conflict_form`;
CREATE TABLE IF NOT EXISTS `tbl_conflict_form` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_unique_id` bigint NOT NULL,
  `institution_conflict_data` text,
  `ilep_conflict_data` text,
  `institution_conflict_status` smallint DEFAULT NULL,
  `ilep_conflict_status` smallint DEFAULT NULL,
  `is_conflict_approved` smallint DEFAULT NULL,
  `is_history` smallint DEFAULT NULL,
  `panel_status` smallint DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_ip` text NOT NULL,
  `updated_ip` text NOT NULL,
  `created_app_id` bigint NOT NULL,
  `updated_app_id` bigint NOT NULL,
  `created_time` double DEFAULT NULL,
  `last_updated_time` double DEFAULT NULL,
  `panel_declaration_1` tinyint DEFAULT NULL,
  `panel_declaration_2` tinyint DEFAULT NULL,
  `panel_declaration_3` tinyint DEFAULT NULL,
  `panel_declaration_4` tinyint DEFAULT NULL,
  `panel_declaration_5` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbl_conflict_form_unique_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_conflict_form_v2`
--

DROP TABLE IF EXISTS `tbl_conflict_form_v2`;
CREATE TABLE IF NOT EXISTS `tbl_conflict_form_v2` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_unique_id` bigint DEFAULT NULL,
  `ilep_panel_id` bigint DEFAULT NULL,
  `ilep_user_id` bigint DEFAULT NULL,
  `institution_has_conflict` int DEFAULT NULL,
  `institution_conflict_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ilep_has_conflict` int DEFAULT NULL,
  `institution_conflict_status` int DEFAULT NULL,
  `ilep_conflict_status` int DEFAULT NULL,
  `assignment_type` int DEFAULT NULL,
  `is_history` int NOT NULL DEFAULT '0',
  `created_by` bigint DEFAULT NULL,
  `created_ip` varchar(255) DEFAULT NULL,
  `updated_ip` varchar(255) DEFAULT NULL,
  `created_app_id` bigint DEFAULT NULL,
  `updated_app_id` bigint DEFAULT NULL,
  `created_time` bigint DEFAULT NULL,
  `last_updated_time` bigint DEFAULT NULL,
  `ilep_member_unique_id` bigint NOT NULL,
  `panel_declaration_1` tinyint DEFAULT NULL,
  `panel_declaration_2` tinyint DEFAULT NULL,
  `panel_declaration_3` tinyint DEFAULT NULL,
  `panel_declaration_4` tinyint DEFAULT NULL,
  `panel_declaration_5` tinyint DEFAULT NULL,
  `version` bigint NOT NULL DEFAULT '0',
  `panel_order` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_conflict_form_v2_ilep_panel_id` (`ilep_panel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_date_extension`
--

DROP TABLE IF EXISTS `tbl_date_extension`;
CREATE TABLE IF NOT EXISTS `tbl_date_extension` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_unique_id` mediumtext,
  `status` int NOT NULL,
  `reason` text NOT NULL,
  `date` mediumtext NOT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_ip` text NOT NULL,
  `updated_ip` text NOT NULL,
  `created_app_id` bigint NOT NULL,
  `updated_app_id` bigint NOT NULL,
  `created_time` double DEFAULT NULL,
  `last_updated_time` double DEFAULT NULL,
  `type` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_doc_feedback`
--

DROP TABLE IF EXISTS `tbl_doc_feedback`;
CREATE TABLE IF NOT EXISTS `tbl_doc_feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_unique_id` bigint NOT NULL,
  `qac_feedback_description` text,
  `qac_feedback_file` text,
  `institution_additional_info_status` smallint DEFAULT NULL,
  `institution_comment` text,
  `submitted_report_file` text,
  `nac_comment` text,
  `nac_file` text,
  `gdq_ac_shared_comment` text,
  `gdq_ac_shared_file` text,
  `nac_additional_info_status` smallint DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_ip` text NOT NULL,
  `updated_ip` text NOT NULL,
  `created_app_id` bigint NOT NULL,
  `updated_app_id` bigint NOT NULL,
  `created_time` double DEFAULT NULL,
  `last_updated_time` double DEFAULT NULL,
  `serial_no` varchar(250) DEFAULT NULL,
  `mcu_scanned_file` text,
  `nac_feedback_description` text,
  `nac_feedback_file` text,
  `dfo_cmnt_mco` text,
  `dfo_file_mco` text,
  `dfo_signed_file` text,
  `dfo_signed_comment` text,
  `dfo_signed_status` smallint DEFAULT '0',
  `dfo_shared_cabinet` smallint DEFAULT '0',
  `dfo_shared_cabinet_comment` text,
  `dfo_shared_cabinet_file` text,
  `dfo_cabinet_approved` smallint DEFAULT '0',
  `dfo_approve_appeal_comment` text,
  `dfo_approve_appeal_file` text,
  `am_approve_report_comment` text,
  `am_approve_report_file` text,
  `doc_shared_to_nac_comment` text,
  `doc_shared_to_nac_file` text,
  `doc_shared_to_qac_comment` text,
  `doc_shared_to_qac_file` text,
  `factual_accuracy_start_comment` text,
  `factual_accuracy_start_file` text,
  `qac_approve_comment` text,
  `qac_approve_file` text,
  `dfo_chief_approve_comment` text,
  `dfo_chief_approve_file` text,
  `gdq_ac_approve_comment` text,
  `gdq_ac_approve_file` text,
  `institute_appeal_comment` text,
  `institute_appeal_file` text,
  `dfo_cabinet_approved_comment` text,
  `dfo_cabinet_approved_file` text,
  `mcu_file_comment` text,
  `nac_approval_date` double DEFAULT NULL,
  `cabinet_approval_date` double DEFAULT NULL,
  `dce_comment` text,
  `dce_approval_date` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_due_dates`
--

DROP TABLE IF EXISTS `tbl_due_dates`;
CREATE TABLE IF NOT EXISTS `tbl_due_dates` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `action` int NOT NULL,
  `action_name` text NOT NULL,
  `type` int NOT NULL,
  `no_of_days` int NOT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_ip` text NOT NULL,
  `updated_ip` text NOT NULL,
  `created_app_id` bigint NOT NULL,
  `updated_app_id` bigint NOT NULL,
  `created_time` double DEFAULT NULL,
  `last_updated_time` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_forgot_password`
--

DROP TABLE IF EXISTS `tbl_forgot_password`;
CREATE TABLE IF NOT EXISTS `tbl_forgot_password` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email_id` text NOT NULL,
  `otp_code` varchar(20) NOT NULL,
  `expiry_time` double NOT NULL,
  `created_ip` text NOT NULL,
  `updated_ip` text NOT NULL,
  `created_app_id` bigint NOT NULL,
  `updated_app_id` bigint NOT NULL,
  `created_time` double DEFAULT NULL,
  `last_updated_time` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbl_forgot_password_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_form_appln_manager`
--

DROP TABLE IF EXISTS `tbl_form_appln_manager`;
CREATE TABLE IF NOT EXISTS `tbl_form_appln_manager` (
  `form_id` bigint NOT NULL AUTO_INCREMENT,
  `form_unique_id` bigint NOT NULL,
  `ip1` varchar(250) DEFAULT NULL,
  `ip1_status` smallint DEFAULT NULL,
  `ip1_status_comment` text,
  `ip2` varchar(250) DEFAULT NULL,
  `ip2_status` smallint DEFAULT NULL,
  `ip2_status_comment` text,
  `ip3` smallint DEFAULT NULL,
  `ip3_status` smallint DEFAULT NULL,
  `ip3_status_comment` text,
  `ip4` smallint DEFAULT NULL,
  `ip4_status` smallint DEFAULT NULL,
  `ip4_status_comment` text,
  `ip5_sub1` text,
  `ip5_sub2` double DEFAULT NULL,
  `ip5_sub3` double DEFAULT NULL,
  `ip5_status` smallint DEFAULT NULL,
  `ip5_status_comment` text,
  `ip6` smallint DEFAULT NULL,
  `ip6_status` smallint DEFAULT NULL,
  `ip6_status_comment` text,
  `ip7` smallint DEFAULT NULL,
  `ip7_status` smallint DEFAULT NULL,
  `ip7_status_comment` text,
  `ip8_sub1` smallint DEFAULT NULL,
  `ip8_sub2` text,
  `ip8_status` smallint DEFAULT NULL,
  `ip8_status_comment` text,
  `ip9_sub_1` text,
  `ip9_sub_2` text,
  `ip9_sub_3` text,
  `ip9_status` smallint DEFAULT NULL,
  `ip9_status_comment` text,
  `ip10_sub_1` text,
  `ip10_sub_2` text,
  `ip10_sub_3` text,
  `ip10_status` smallint DEFAULT NULL,
  `ip10_status_comment` text,
  `ip11_sub_1` text,
  `ip11_sub_2` text,
  `ip11_sub_3` text,
  `ip11_sub_4` text,
  `ip11_status` smallint DEFAULT NULL,
  `ip11_status_comment` text,
  `ip12_sub_1` text,
  `ip12_sub_2` text,
  `ip12_sub_3` text,
  `ip12_sub_4` text,
  `ip12_status` smallint DEFAULT NULL,
  `ip12_status_comment` text,
  `qa_1` text,
  `qa_1_status` smallint DEFAULT NULL,
  `qa_1_status_comment` text,
  `qa_2` text,
  `qa_2_status` smallint DEFAULT NULL,
  `qa_2_status_comment` text,
  `qa_3` double DEFAULT NULL,
  `qa_3_status` smallint DEFAULT NULL,
  `qa_3_status_comment` text,
  `qa_4` text,
  `qa_4_status` smallint DEFAULT NULL,
  `qa_4_status_comment` text,
  `s1_atp_1_sub_1` text,
  `s1_atp_1_sub_2` text,
  `s1_atp_1_status` smallint DEFAULT NULL,
  `s1_atp_1_status_comment` text,
  `s1_atp_2_sub_1` text,
  `s1_atp_2_sub_2` text,
  `s1_atp_2_status` smallint DEFAULT NULL,
  `s1_atp_2_status_comment` text,
  `s1_atp_3_sub_1` text,
  `s1_atp_3_sub_2` text,
  `s1_atp_3_status` smallint DEFAULT NULL,
  `s1_atp_3_status_comment` text,
  `s1_atp_4_sub_1` text,
  `s1_atp_4_sub_2` text,
  `s1_atp_4_status` smallint DEFAULT NULL,
  `s1_atp_4_status_comment` text,
  `s1_atp_5_sub_1` text,
  `s1_atp_5_sub_2` text,
  `s1_atp_5_status` smallint DEFAULT NULL,
  `s1_atp_5_status_comment` text,
  `s1_atp_6_sub_1` text,
  `s1_atp_6_sub_2` text,
  `s1_atp_6_status` smallint DEFAULT NULL,
  `s1_atp_6_status_comment` text,
  `s2_qdar_1_sub_1` text,
  `s2_qdar_1_sub_2` text,
  `s2_qdar_1_status` smallint DEFAULT NULL,
  `s2_qdar_1_status_comment` text,
  `s2_qdar_2_sub_1` text,
  `s2_qdar_2_sub_2` text,
  `s2_qdar_2_status` smallint DEFAULT NULL,
  `s2_qdar_2_status_comment` text,
  `s2_qdar_3_sub_1` text,
  `s2_qdar_3_sub_2` text,
  `s2_qdar_3_status` smallint DEFAULT NULL,
  `s2_qdar_3_status_comment` text,
  `s2_qdar_4_sub_1` text,
  `s2_qdar_4_sub_2` text,
  `s2_qdar_4_status` smallint DEFAULT NULL,
  `s2_qdar_4_status_comment` text,
  `s2_qdar_5_sub_1` text,
  `s2_qdar_5_sub_2` text,
  `s2_qdar_5_status` smallint DEFAULT NULL,
  `s2_qdar_5_status_comment` text,
  `s2_qdar_6_sub_1` text,
  `s2_qdar_6_sub_2` text,
  `s2_qdar_6_status` smallint DEFAULT NULL,
  `s2_qdar_6_status_comment` text,
  `s3_adm_1_sub_1` text,
  `s3_adm_1_sub_2` text,
  `s3_adm_1_status` smallint DEFAULT NULL,
  `s3_adm_1_status_comment` text,
  `s3_adm_2_sub_1` text,
  `s3_adm_2_sub_2` text,
  `s3_adm_2_status` smallint DEFAULT NULL,
  `s3_adm_2_status_comment` text,
  `s3_adm_3_sub_1` text,
  `s3_adm_3_sub_2` text,
  `s3_adm_3_status` smallint DEFAULT NULL,
  `s3_adm_3_status_comment` text,
  `s3_adm_4_sub_1` text,
  `s3_adm_4_sub_2` text,
  `s3_adm_4_status` smallint DEFAULT NULL,
  `s3_adm_4_status_comment` text,
  `s3_adm_5_sub_1` text,
  `s3_adm_5_sub_2` text,
  `s3_adm_5_status` smallint DEFAULT NULL,
  `s3_adm_5_status_comment` text,
  `s3_adm_6_sub_1` text,
  `s3_adm_6_sub_2` text,
  `s3_adm_6_status` smallint DEFAULT NULL,
  `s3_adm_6_status_comment` text,
  `s3_adm_7_sub_1` text,
  `s3_adm_7_sub_2` text,
  `s3_adm_7_status` smallint DEFAULT NULL,
  `s3_adm_7_status_comment` text,
  `s3_adm_8_sub_1` text,
  `s3_adm_8_sub_2` text,
  `s3_adm_8_status` smallint DEFAULT NULL,
  `s3_adm_8_status_comment` text,
  `s3_adm_9_sub_1` text,
  `s3_adm_9_sub_2` text,
  `s3_adm_9_status` smallint DEFAULT NULL,
  `s3_adm_9_status_comment` text,
  `s4_c_1_sub_1` text,
  `s4_c_1_sub_2` text,
  `s4_c_1_status` smallint DEFAULT NULL,
  `s4_c_1_status_comment` text,
  `s4_c_2_sub_1` text,
  `s4_c_2_sub_2` text,
  `s4_c_2_status` smallint DEFAULT NULL,
  `s4_c_2_status_comment` text,
  `s4_c_3_sub_1` text,
  `s4_c_3_sub_2` text,
  `s4_c_3_status` smallint DEFAULT NULL,
  `s4_c_3_status_comment` text,
  `s5_scqi_1_sub_1` text,
  `s5_scqi_1_sub_2` text,
  `s5_scqi_1_status` smallint DEFAULT NULL,
  `s5_scqi_1_status_comment` text,
  `s5_scqi_2_sub_1` text,
  `s5_scqi_2_sub_2` text,
  `s5_scqi_2_status` smallint DEFAULT NULL,
  `s5_scqi_2_status_comment` text,
  `s5_scqi_3_sub_1` text,
  `s5_scqi_3_sub_2` text,
  `s5_scqi_3_status` smallint DEFAULT NULL,
  `s5_scqi_3_status_comment` text,
  `ap_cont_1` text,
  `ap_cont_2` text,
  `ap_cont_3` text,
  `ap_cont_4` text,
  `overall_status` smallint DEFAULT NULL,
  `overall_status_comment` text,
  `extra_evd_elabo_status` smallint DEFAULT NULL,
  `is_extenstion_requested` smallint DEFAULT NULL,
  `extension_requested_date` double DEFAULT NULL,
  `extension_requested_status` smallint DEFAULT NULL,
  `reason_for_extension` text,
  `created_by` bigint DEFAULT NULL,
  `created_ip` text,
  `updated_ip` text,
  `created_app_id` bigint DEFAULT NULL,
  `updated_app_id` bigint DEFAULT NULL,
  `created_time` double DEFAULT NULL,
  `last_updated_time` double DEFAULT NULL,
  `others_data` text,
  `regulatory_other_data` text,
  `licenced_by_other_data` text,
  `institution_type_other_data` text,
  `field_other_data` text,
  `not_applicable` text,
  `add_data_sub_date` double DEFAULT NULL,
  `file_path_parameter` text,
  PRIMARY KEY (`form_id`),
  UNIQUE KEY `tbl_form_appln_manager_form_unique_id` (`form_unique_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ilep`
--

DROP TABLE IF EXISTS `tbl_ilep`;
CREATE TABLE IF NOT EXISTS `tbl_ilep` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_unique_id` bigint NOT NULL,
  `ilep_member_id` bigint NOT NULL,
  `is_head` smallint DEFAULT NULL,
  `is_dfo_approved` smallint DEFAULT NULL,
  `grand_access` int DEFAULT '0',
  `institution_conflict_data` text,
  `ilep_conflict_data` text,
  `institution_conflict_status` smallint DEFAULT NULL,
  `ilep_conflict_status` smallint DEFAULT NULL,
  `is_conflict_approved_am` smallint DEFAULT NULL,
  `is_conflict_approved_dfo` smallint DEFAULT NULL,
  `is_history` smallint DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_ip` text NOT NULL,
  `updated_ip` text NOT NULL,
  `created_app_id` bigint NOT NULL,
  `updated_app_id` bigint NOT NULL,
  `created_time` double DEFAULT NULL,
  `last_updated_time` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbl_ilep_panel_unique_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ilep_evaluation_form`
--

DROP TABLE IF EXISTS `tbl_ilep_evaluation_form`;
CREATE TABLE IF NOT EXISTS `tbl_ilep_evaluation_form` (
  `evaluation_id` bigint NOT NULL AUTO_INCREMENT,
  `form_unique_id` bigint NOT NULL,
  `std_1_1` text,
  `std_1_2` text,
  `std_1_3` text,
  `std_1_4` text,
  `std_1_5` text,
  `std_1_6` text,
  `s1_atp_condition` text,
  `s1_atp_suggestion` text,
  `s1_atp_judgement` int DEFAULT NULL,
  `s1_atp_judgement_history` text,
  `std_2_1` text,
  `std_2_2` text,
  `std_2_3` text,
  `std_2_4` text,
  `std_2_5` text,
  `std_2_6` text,
  `s2_qdar_condition` text,
  `s2_qdar_suggestion` text,
  `s2_qdar_judgement` int DEFAULT NULL,
  `s2_qdar_judgement_history` text,
  `std_3_1` text,
  `std_3_2` text,
  `std_3_3` text,
  `std_3_4` text,
  `std_3_5` text,
  `std_3_6` text,
  `std_3_7` text,
  `std_3_8` text,
  `std_3_9` text,
  `s3_adm_condition` text,
  `s3_adm_suggestion` text,
  `s3_adm_judgement` int DEFAULT NULL,
  `s3_adm_judgement_history` text,
  `std_4_1` text,
  `std_4_2` text,
  `std_4_3` text,
  `std_4_4` text,
  `std_4_5` text,
  `std_4_6` text,
  `std_4_7` text,
  `s4_condition` text,
  `s4_suggestion` text,
  `s4_judgement` int DEFAULT NULL,
  `s4_judgement_history` text,
  `std_5_1` text,
  `std_5_2` text,
  `std_5_3` text,
  `s5_scqi_condition` text,
  `s5_scqi_suggestion` text,
  `s5_scqi_judgement` int DEFAULT NULL,
  `s5_scqi_judgement_history` text,
  `overall_judgement` int DEFAULT NULL,
  `overall_judgement_history` text,
  `condition_fulfilment_date` bigint DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_ip` text,
  `updated_ip` text,
  `created_app_id` bigint DEFAULT NULL,
  `updated_app_id` bigint DEFAULT NULL,
  `created_time` double DEFAULT NULL,
  `last_updated_time` double DEFAULT NULL,
  `partial_met_count` int DEFAULT NULL,
  `partial_met_date` double DEFAULT NULL,
  `partial_met_status` int DEFAULT NULL,
  `am_feedback_comment` text,
  `am_feedback_file` text,
  `am_feedback_action_history` text,
  `partial_met_comment` text,
  `partial_met_file` text,
  `dfo_chief_eval_cmnt` text,
  `dfo_chief_plain_cmnt` text,
  `gdq_ac_eval_cmnt` text,
  `gdq_ac_plain_cmnt` text,
  `qac_eval_cmnt` text,
  `qac_plain_cmnt` text,
  `inst_cmnt_bck_file` text,
  `inst_cmnt_bck` text,
  `dec1` text,
  `dec2` text,
  `dec3` text,
  `draft` text,
  `condfil` text,
  `is_extenstion_requested` int DEFAULT NULL,
  `fac_accuracy_status` int DEFAULT NULL,
  `extension_requested_date` bigint DEFAULT NULL,
  `extension_requested_status` int DEFAULT NULL,
  `reason_for_extension` text,
  `std_2_7` text,
  PRIMARY KEY (`evaluation_id`),
  UNIQUE KEY `tbl_ilep_evaluation_form_unique_id` (`form_unique_id`),
  UNIQUE KEY `tbl_ilep_evaluation_unique_id` (`evaluation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ilep_evaluation_report_copy`
--

DROP TABLE IF EXISTS `tbl_ilep_evaluation_report_copy`;
CREATE TABLE IF NOT EXISTS `tbl_ilep_evaluation_report_copy` (
  `evaluation_copy_id` bigint NOT NULL AUTO_INCREMENT,
  `form_unique_id` bigint NOT NULL,
  `report_as_json_string` longtext,
  `created_by` bigint DEFAULT NULL,
  `created_ip` text NOT NULL,
  `updated_ip` text NOT NULL,
  `created_app_id` bigint NOT NULL,
  `updated_app_id` bigint NOT NULL,
  `created_time` double DEFAULT NULL,
  `last_updated_time` double DEFAULT NULL,
  PRIMARY KEY (`evaluation_copy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ilep_panel`
--

DROP TABLE IF EXISTS `tbl_ilep_panel`;
CREATE TABLE IF NOT EXISTS `tbl_ilep_panel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_unique_id` bigint NOT NULL,
  `panel_id` bigint NOT NULL,
  `ilep_member_id` bigint NOT NULL,
  `is_head` smallint DEFAULT NULL,
  `is_dfo_approved` smallint DEFAULT NULL,
  `panel_status` smallint DEFAULT NULL,
  `grand_access` int DEFAULT '0',
  `created_by` bigint DEFAULT NULL,
  `created_ip` text NOT NULL,
  `updated_ip` text NOT NULL,
  `created_app_id` bigint NOT NULL,
  `updated_app_id` bigint NOT NULL,
  `created_time` double DEFAULT NULL,
  `last_updated_time` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbl_ilep_panel_unique_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_institute_form`
--

DROP TABLE IF EXISTS `tbl_institute_form`;
CREATE TABLE IF NOT EXISTS `tbl_institute_form` (
  `form_id` bigint NOT NULL AUTO_INCREMENT,
  `form_unique_id` bigint NOT NULL,
  `form_parent_unique_id` bigint DEFAULT '0',
  `revalidation_form_unique_id` bigint DEFAULT NULL,
  `is_verification_panel_required` int DEFAULT NULL,
  `is_revalidation` int DEFAULT NULL,
  `is_draft` int DEFAULT NULL,
  `institute_name` varchar(250) NOT NULL,
  `inst_app_lic_no` varchar(250) DEFAULT NULL,
  `license_type` smallint DEFAULT NULL,
  `approval_doc_path` text,
  `issue_date` double DEFAULT NULL,
  `exp_date` double DEFAULT NULL,
  `is_bqa_reviewed` smallint DEFAULT NULL,
  `review_issue_date` double DEFAULT NULL,
  `review_jud_result` text,
  `is_offering_nan_loc_course_qa` smallint DEFAULT NULL,
  `offering_description` text,
  `planned_sub_date` text,
  `random_date` double DEFAULT '0',
  `poc_name` varchar(250) DEFAULT NULL,
  `poc_email` varchar(50) DEFAULT NULL,
  `poc_cn_number` text,
  `poc_title` text,
  `add_data_sub_date` double DEFAULT NULL,
  `status` smallint DEFAULT NULL,
  `resubmit_status` smallint DEFAULT NULL,
  `resubmit_count` bigint DEFAULT NULL,
  `last_resubmit_date` double DEFAULT NULL,
  `current_submit_date` double DEFAULT NULL,
  `current_stage` smallint DEFAULT NULL,
  `is_extenstion_requested` smallint DEFAULT NULL,
  `reqsted_ext_date` double DEFAULT NULL,
  `evln_ext_date` mediumtext,
  `vfn_ext_date` mediumtext,
  `date_ext_reason` text,
  `date_ext_status` smallint DEFAULT NULL,
  `form_flow_history` text,
  `created_ip` text NOT NULL,
  `updated_ip` text NOT NULL,
  `created_app_id` bigint DEFAULT NULL,
  `updated_app_id` bigint DEFAULT NULL,
  `created_time` double DEFAULT NULL,
  `last_updated_time` double DEFAULT NULL,
  `assigned_app_manager` bigint DEFAULT NULL,
  `institution_id` bigint DEFAULT NULL,
  `factual_accuracy_file` text,
  `factual_accuracy_comment` text,
  `inst_factual_accuracy_dead_line` bigint DEFAULT NULL,
  `others_data` text,
  `not_applicable` text,
  `sub_status` smallint DEFAULT NULL,
  `completed_status` text,
  `inst_appeal` smallint DEFAULT '0',
  `inst_appeal_approve` smallint DEFAULT '0',
  `inst_appeal_exp` double DEFAULT '0',
  `over_all_approve_history` text,
  `regulatory_other_data` text,
  `licenced_by_other_data` text,
  `institution_type_other_data` text,
  `field_other_data` text,
  `current_status_due_date` double DEFAULT '0',
  `rejection_reason` text,
  `rejected_by_user_type` int DEFAULT NULL,
  `remainder_mail_sent` int NOT NULL DEFAULT '0',
  `terminated_mail_sent` int NOT NULL DEFAULT '0',
  `qualification_title` varchar(500) DEFAULT NULL,
  `no_of_modules` int DEFAULT '0',
  `listing_id` varchar(500) DEFAULT NULL,
  `overall_status` int DEFAULT NULL,
  `overall_evln_status` int DEFAULT NULL,
  `overall_evln_cmt` text,
  `evln_deadline` mediumtext,
  `overall_verification_status` int DEFAULT NULL,
  `overall_verification_cmt` text,
  `verification_deadline` mediumtext,
  `evaluation_flag` int DEFAULT NULL,
  `verification_flag` int DEFAULT NULL,
  `evaluation_rejection_count` int DEFAULT NULL,
  `verification_rejection_count` int DEFAULT NULL,
  `qualification_type` int DEFAULT NULL,
  `awarding_body` text,
  `included_in_other` text,
  `qualification_size` text,
  `rejection_date` double DEFAULT NULL,
  `is_paid` int DEFAULT '0',
  `placed_date` double DEFAULT NULL,
  `original_placement_date` double DEFAULT NULL,
  `qp_id` varchar(255) DEFAULT NULL,
  `payment_id` bigint DEFAULT NULL,
  `is_new_revalidation_form` smallint NOT NULL DEFAULT '0',
  `workflow_type` int NOT NULL DEFAULT '1',
  `current_action` int DEFAULT NULL,
  `current_action_users` text,
  `current_action_usercodes` text,
  PRIMARY KEY (`form_id`),
  UNIQUE KEY `tbl_institute_form_unique_id` (`form_unique_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_listed_institutes`
--

DROP TABLE IF EXISTS `tbl_listed_institutes`;
CREATE TABLE IF NOT EXISTS `tbl_listed_institutes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `email` text NOT NULL,
  `institute_name_english` varchar(500) DEFAULT NULL,
  `institute_name_arabic` varchar(500) DEFAULT NULL,
  `listing_id` varchar(200) DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_ip` text,
  `updated_ip` text,
  `created_app_id` bigint DEFAULT NULL,
  `updated_app_id` bigint DEFAULT NULL,
  `created_time` double DEFAULT NULL,
  `last_updated_time` double DEFAULT NULL,
  `mobile_number` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbl_ilep_panel_unique_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_log`
--

DROP TABLE IF EXISTS `tbl_log`;
CREATE TABLE IF NOT EXISTS `tbl_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_unique_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `user_type` smallint DEFAULT NULL,
  `user_sub_type` smallint DEFAULT NULL,
  `user_name` text,
  `previous_status` int DEFAULT NULL,
  `previous_message` text,
  `changed_status` int DEFAULT NULL,
  `changed_message` text,
  `created_by` bigint DEFAULT NULL,
  `created_ip` text NOT NULL,
  `updated_ip` text NOT NULL,
  `created_app_id` bigint DEFAULT NULL,
  `updated_app_id` bigint DEFAULT NULL,
  `created_time` double DEFAULT NULL,
  `last_updated_time` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbl_log_unique_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mail_template`
--

DROP TABLE IF EXISTS `tbl_mail_template`;
CREATE TABLE IF NOT EXISTS `tbl_mail_template` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `template_name` varchar(100) NOT NULL,
  `template_code` varchar(100) NOT NULL,
  `template_description` varchar(200) DEFAULT NULL,
  `template_body` text,
  `display_sequence` smallint DEFAULT NULL,
  `is_active` smallint NOT NULL DEFAULT '1',
  `template_subject` text,
  `created_by` bigint DEFAULT NULL,
  `created_ip` text NOT NULL,
  `updated_ip` text NOT NULL,
  `created_app_id` bigint NOT NULL,
  `updated_app_id` bigint NOT NULL,
  `created_time` double DEFAULT NULL,
  `last_updated_time` double DEFAULT NULL,
  `institute_cc` int DEFAULT NULL,
  `dfo_admin_cc` int DEFAULT NULL,
  `am_cc` int DEFAULT NULL,
  `dfo_member_cc` int DEFAULT NULL,
  `chief_cc` int DEFAULT NULL,
  `director_cc` int DEFAULT NULL,
  `ilep_cc` int DEFAULT NULL,
  `institution_head_cc` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbl_mail_template_unique_id` (`template_code`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_mail_template`
--

INSERT INTO `tbl_mail_template` (`id`, `template_name`, `template_code`, `template_description`, `template_body`, `display_sequence`, `is_active`, `template_subject`, `created_by`, `created_ip`, `updated_ip`, `created_app_id`, `updated_app_id`, `created_time`, `last_updated_time`, `institute_cc`, `dfo_admin_cc`, `am_cc`, `dfo_member_cc`, `chief_cc`, `director_cc`, `ilep_cc`, `institution_head_cc`) VALUES
(1, 'Institute registration mail', 'INSTITUTE_REGISTRATION', 'Mail for the completion of institute registration', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">Dear {userName} ,<br><br>\r\nThank you for completing your registration for the Qualification Placement Process. Your registration form is under review by the Directorate of Framework Operations (DFO) Team, and you will be contacted shortly to provide you with information regarding the next step.<br><br>\r\nDFO Team\r\n</div>', 1, 1, 'Qualification Placement Registration', NULL, '0', '0', 0, 0, NULL, NULL, 0, 1, 0, 0, 1, 1, 0, 0),
(3, 'Institution application rejected', 'INSTITUTION_REJECTED', 'To send mail to institution for rejection of application', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">Dear {userName},<br><br>\r\n                                                                    Thank you for registering your Institution for the Institutional Listing Process!<br><br>\r\n                                                                    Kindly note that your application was not scheduled for the upcoming academic year. <br><br>\r\n                                                                    For more information, please do not hesitate to contact 17562461 or GDQ@bqa.gov.bh.\r\n                                                                    Thank you! <br><br>  DFO Team  </div>', 3, 1, 'Institutional Qualification Placement Application – Not Scheduled', NULL, '', '', 0, 0, NULL, NULL, 0, 1, 0, 0, 1, 1, 0, 0),
(6, 'Institution application terminated', 'INSTITUTION_TERMINATED', 'To send mail to institution on termination of application', NULL, 4, 0, NULL, NULL, '', '', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(7, 'On Dfo Assign AM Mail', 'DFO_ASSIGN_AM', 'To get details of APPLICATION MANAGER with contact details', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">\nDear {userName},<br><br>\n                                                                    Thank you for submitting your Qualification placement Application for the qualification titled {QualificationTitle}.<br><br>\n                                                                    The Directorate of National Framework Operations (DFO) of the Education &\n                                                                    Training Quality Authority (BQA) conducts the Administrative Check processes to\n                                                                    ensure the completeness and clarity of the application before acknowledging its\n                                                                    receipt. The application’s main contact is detailed below:\n                                                                    <br><br>\n                                                                    Application Manager Name: {managerName}\n                                                                    <p style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:left;color:#003366;\">Application Manager Contact Number: {managerContactNumber}</p>\n                                                                    Application Manager Email: {managerEmail}\n                                                                    <br><br>\n                                                                    You will be receiving the Administrative Check Outcomes shortly. Kindly note that\n                                                                    for any further information or updates regarding your application, you may kindly\n                                                                    contact your application manager.\n                                                                    <br><br>\n                                                                    DFO Team\n                                                                                         </div>', 5, 1, 'Institutional Qualification placement – Administrative Check And Verification', NULL, '', '', 0, 0, NULL, NULL, 0, 0, 1, 0, 1, 1, 0, 0),
(8, 'On administrative check by application manager', 'AM_ADMINISTRATIVE_CHECK_NOT_COMPLETED', 'On administrative check by application manager to institute to complete the incomplete section as additional task with a deadline', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">\r\nDear {userName},<br><br>\r\n                                                                    This is to inform you that the DFO Team has conducted an Administrative Check for the\r\n                                                                    submitted Qualification Placement Application titled {QualificationTitle}. The purpose of this\r\n                                                                    process is to ensure the clarity and completeness of your application before\r\n                                                                    acknowledging its receipt. <br><br>\r\n                                                                    Your application form needs to be updated with more information for some indicators.\r\n                                                                    Thus, complete the incomplete sections and attach the required evidence, whenever\r\n                                                                     applicable. The deadline for submitting the Administrative Check requirement is {proposedDate}.\r\n                                                                    <br><br>\r\n                                                                    If any clarification is required, please do not hesitate to contact your application manager. Thank you for your cooperation.\r\n\r\n                                                                    <br><br>\r\n                                                                    DFO Team\r\n                                                                                         </div>', 6, 1, 'Institutional Listing – Administrative Check Outcome', NULL, '', '', 0, 0, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 1),
(10, 'On DFO Director approves the ILEP panel', 'DFOA_APPROVE_ILEP_PANEL', 'On DFO Director approves the ILEP panel to INSTITUTE user to sign no conflict form', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">\nDear {userName},<br><br>\n                                                                                         Hope this message finds you well!<br><br>\n                                                                                         We are pleased to let you know that your Qualification Placement Application titled {QualificationTitle} is now in the validation stage. However, before taking this application any further, we need your declaration of any conflict of interest regarding the proposed Validation Panel members.<br>\n											 Please refer to your dashboard and review the BIOs of the nominated Panel - It would be highly appreciated if you could declare any conflict of interest within two working days.<br>\n                                                                                         Your prompt response is highly appreciated, as it will expedite the evaluation process.<br><br>\n                                                                                         Thank you very much!\n\n                                                                                         <br>\n                                                                                         DFO Team\n                                                                                                              </div>', 8, 1, 'Institutional Qualification Placement – Panel Conflict of Interest Declaration', NULL, '', '', 0, 0, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0),
(11, 'On Institution sign sign non conflict mail', 'INSTITUTE_SIGN_NON_CONFLICT', 'On institute  sign no conflict form agianist ILEP', 'Dear {userName},<br><br>\r\n\r\n                         	Application -{applicationId}  is assigned to you, please complete your action<br><br>\r\n\r\n                         Thanks,<br>\r\n                         Team BQA', 9, 1, NULL, NULL, '', '', 0, 0, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0),
(12, 'On Application manager not approving conflict', 'AM_NOT_APPROVE_CONFLICT', 'On Application manager not approving the conflict form against ILEP panel by institute to ILEP Panel to sign no conflict with institution details', 'Dear {userName},<br><br>\r\n                                                                 One application is assigned to you and your panel by Application Manager and DFO , Please review and do action [Conflict or No-conflict]]<br><br>\r\n                                                                 Application ID: {applicationId}\r\n                                                                 <br>\r\n                                                                 <br>                       <br>', 10, 0, NULL, NULL, '', '', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(13, 'On ILEP members signing the no conflict form', 'ILEP_SIGN_NON_CONFLICT', 'On ILEP members signing the no conflict form to Application manager to schedule meeting with GDQ/DFO director', 'Dear {userName},<br><br>\r\n                                                                 One application is ILEP conflict signed by both parties, please schedule the meeting with GDQ/DFO Director<br><br>\r\n                                                                 Application ID:  {applicationId}\r\n                                                                 <br>\r\n                                                                 <br>                       <br>\r\n', 11, 0, NULL, NULL, '', '', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(14, 'On Grant access', 'GRANT_ACCESS', 'On institute  sign no conflict form agianist ILEP', '<div\n    style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">\n    Dear {userName},<br><br>\n\n    This message is to inform you that you are granted the access to the Qualification Placement\n    Application titled {instituteName}. You can now view the application form and evidence.<br>\n    For more information, please contact the {amName} through {amEmail} or {amPhone}.\n    <br><br>\n    Thank you!\n    <br><br>\n    DFO Team\n</div>', 12, 1, 'Institutional Qualification Placement – Access Granted', NULL, '', '', 0, 0, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0),
(16, 'On site visit completed', 'SITE_VISIT_COMPLETED', 'On site visit completed', 'Dear {userName},<br><br>\r\n\r\n                         	Application -{applicationId} is completed the evaluation, please submit your action.<br><br>\r\n\r\n                         Thanks,<br>\r\n                         Team BQA', 14, 1, NULL, NULL, '', '', 0, 0, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0),
(17, 'On Institute signs no confidentiality', 'INSTITUE_SIGN_NON_CONFIDENTIALITY', 'On Institute signs no confidentiality agreement to all ILEP members to update event documnet forms ', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">Dear {userName},<br><br>\n                                                                                                                                        This message is to inform you that the Visit Agenda, the List of Evidence Required for the\n                                                                                                                                        Virtual Visit and Virtual Visit Guidelines are now available on the system. <br><br>\n                                                                                                                                        You are kindly requested to submit a filled-out copy of the agenda and the required\n                                                                                                                                        evidence by {dueDate}. <br><br>\n                                                                                                                                        Invitations to the virtual visit will be sent to your team after receiving the agenda.\n                                                                                                                                        For more information, please contact the {managerName} through {managerMail} or {managerNumber}. <br><br>\n                                                                                                                                        Thank you\n\n                                                                                                                                        <br><br>\n                                                                                                                                        DFO Team\n                                                                                                                                                             </div>', 15, 1, 'Institutional Qualification Placement – Required Visit Document', NULL, '', '', 0, 0, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0),
(18, 'On ILEP submit final summary', 'ILEP_SUBMIT_FINAL_SUMMARY', 'On ILEP member update outcome summary with final jufgement to Application manager to update site visit required status', 'Dear {userName},<br><br>\r\n                                                                 One application is completed the Non-conflict for both parties, please complete the following actions as per the covinence<br><br>\r\n                                                                 Application ID:  {applicationId}\r\n                                                                 <br>\r\n                                                                 1. Schedule meeting with GDQ/DFO Director\r\n\r\n                                                                 <br>                       <br>\r\n                                                                 2. Upload MOM after the meeting\r\n\r\n                                                                 <br>                       <br>\r\n                                                                 3. Set site visit required status and assign the date', 16, 0, NULL, NULL, '', '', 0, 0, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0),
(19, 'On Application manage approves ILEP report', 'AM_APPROVE_ILEP_REPORT', 'On Application manage approves the report updated by ILEP Panel DFO Director fo review and approval', 'Dear {userName},<br><br>\r\n\r\n                         	Application -{applicationId} is completed the evaluation, please submit your action.<br><br>\r\n\r\n                         Thanks,<br>\r\n                         Team BQA', 17, 0, NULL, NULL, '', '', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(20, 'On QAC feedback submitted', 'QAC_FEEDBACK_SUBMITTED', 'On qac feedback submitted send mail to DFO director', 'Dear {userName},<br><br>\r\n\r\n                         	Application -{applicationId} is completed the QAC feedback, please submit your action.<br><br>\r\n\r\n                         Thanks,<br>\r\n                         Team BQA', 18, 1, NULL, NULL, '', '', 0, 0, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0),
(21, 'On QAC updated', 'QAC_UPDATED', 'On qac updated', 'Dear {userName},<br><br>\r\n\r\n                         	Application -{applicationId} is completed the QAC feedback updated, please submit your action.<br><br>\r\n\r\n                         Thanks,<br>\r\n                         Team BQA', 19, 1, NULL, NULL, '', '', 0, 0, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0),
(23, 'On QAC approving the report', 'QAC_APPROVE_REPORT', 'On QAC approving the report to Application manager/DFO to send document for factual check |', 'Dear {userName},<br><br>\r\n\r\n                         	Application -{applicationId} is approved by QAC, please submit your action.<br><br>\r\n\r\n                         Thanks,<br>\r\n                         Team BQA', 21, 1, NULL, NULL, '', '', 0, 0, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0),
(24, 'On Factual accuracy started', 'FACTUAL_ACCURACY_STARTED', 'factual accuracy', 'Dear {userName},<br><br>\r\n\r\n                         	Application -{applicationId} is started the factual accuracy, please submit your action.<br><br>\r\n\r\n                         Thanks,<br>\r\n                         Team BQA', 22, 0, NULL, NULL, '', '', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(25, 'On administrative check by application manager', 'AM_ADMINISTRATIVE_CHECK_EVALUATION_NOT_COMPLETED', 'On administrative check by application manager to institute to complete the incomplete section as additional task with a deadline', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">Dear {userName} ,<br><br>\r\n                          This is to inform you that the DFO Team has conducted an Administrative Check for the submitted Qualification Placement Application for {instituteName}. The purpose of this process is to ensure the clarity and completeness of your application before acknowledging its receipt. <br>\r\n                          Your application form needs to be updated with more information for some indicators. Thus, complete the incomplete sections and attach the required evidence, whenever applicable. The deadline for submitting the Administrative Check requirement is {deadline} <br>\r\n                          If any clarification is required, please do not hesitate to contact your application manager. <br><br>\r\n                          Thank you for your cooperation.<br>\r\n                          DFO Team\r\n                        </div>', 23, 1, 'Institutional Qualification Placement – Administrative Check Outcome', NULL, '', '', 0, 0, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0),
(27, 'On verification check by application manager', 'AM_VERIFICATION_NOT_COMPLETED', 'On Verification by application manager to institute to complete the incomplete section as additional task with a deadline', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">Dear {userName} ,<br><br>\r\n                          This is to inform you that the DFO Team has conducted a Verification for the submitted Qualification Placement Application for {instituteName}. The purpose of this process is to ensure the clarity and completeness of your application before acknowledging its receipt. <br>\r\n                          Your application form needs to be updated with more information for some indicators. Thus, complete the incomplete sections and attach the required evidence, whenever applicable. The deadline for submitting the Verification requirement is {deadline}. <br>\r\n                          If any clarification is required, please do not hesitate to contact your application manager. <br><br>\r\n                          Thank you for your cooperation.<br>\r\n                          DFO Team\r\n                        </div>', 24, 1, 'Institutional Qualification Placement – Verification Outcome', NULL, '', '', 0, 0, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0),
(37, 'INSTITUTE applicaton scheduled mail', 'INSTITUTE_APPLICATION_SCHEDULED', 'The message sent to the Institution after their application was scheduled', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">Dear {userName} ,<br><br>\n                            Thank you for registering your Institution for the Qualification Placement Process! <br><br>\nThe Directorate of National Framework Operations (DFO) of the Education & Training Quality Authority (BQA) would like to inform you that your Institution is scheduled to submit the Qualification Placement Application for the qualification titled {QualificationTitle} by {submissionDate}. To facilitate this process and provide further assistance, BQA developed an online capacity-building workshop available on the BQA website through this <a href=\"http://bqa-material.s3-website.me-south-1.amazonaws.com/\">link</a>. You can start filling in the Qualification Placement Application Form through the NQF system. <br><br>\n The NQF Handbook for Institutions is available on the BQA website through this <a href=\"https://www.bqa.gov.bh/En/QaaetUnits/NQFU/SiteAssets/Pages/RelatedDocuments/NQF%20Handbook%202023%20Edition%20(EN).pdf\">link</a>. At any moment, you can visit our website, <a href=\"www.bqa.gov.bh\">www.bqa.gov.bh</a>, for all documents. If you have any queries, please do not hesitate to contact us by email at GDQ@bqa.gov.bh\n                         <br><br>\n                          DFO Team\n   </div>', 25, 1, 'Institutional Qualification placement - Approval', NULL, '', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0),
(39, 'On AM Rejection', 'AM_INSTITUTION_REJECTED', 'On Application Manager Rejection ', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">Dear {userName} ,<br><br>\r\n                          This message is to acknowledge that your application titled {instituteName} does not\r\n			  pass the administrative check/Verification stage and thus, was rejected. <br>\r\n                          For more information, please do not hesitate to contact 17562461 or GDQ@bqa.gov.bh.<br><br>\r\n                          Thank you.<br>\r\n                          DFO Team\r\n                        </div>', 26, 1, 'Institutional Qualification Placement – Rejected', NULL, '', '', 0, 0, NULL, NULL, 0, 1, 0, 0, 1, 1, 0, 0),
(40, 'On application manager - Rejection', 'AM_REJECTED_THE_DOCUMENT', 'On AM rejection', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">Dear {userName} ,<br><br>\r\n                          This message is to acknowledge that your application titled {instituteName} does not\r\n			  pass the administrative check stage and thus, was rejected. <br>\r\n                          For more information, please do not hesitate to contact 17562461 or GDQ@bqa.gov.bh.<br><br>\r\n                          Thank you.<br>\r\n                          DFO Team\r\n                        </div>', 27, 1, 'Institutional Qualification Placement – Rejected', NULL, '', '', 0, 0, NULL, NULL, 0, 1, 1, 0, 1, 1, 0, 0),
(41, 'On grant access by AM', 'AM_GRANT_ACCESS_EVALUATION_PANEL', 'On AM grant access', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">Dear {userName} ,<br><br>\r\n                          This message is to inform you that you granted the access to the Institutional Qualification Placement Application titled {instituteName}. You can now view the application form and evidence. <br>\r\n                           For more information, please contact the {managerName} through {managerMail} or {managerNumber}. <br><br>\r\n                          Thank you.<br>\r\n                          DFO Team\r\n                        </div>', 28, 1, 'Institutional Qualification Placement – Access Granted', NULL, '', '', 0, 0, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0),
(42, 'On first meeting scheduled', 'FIRST_EVALUATON_MEETING', 'On first meeting scheduled', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">\n                                                                                                                              Dear {userName},<br><br>\n                                                                                                                             This message is to inform you that the First Validation meeting is scheduled to be held on {meetingDate} at {meetingTime}. Please refer to your dashboard to view the application. The\n                                                                                                                             objectives of the meeting are:  <br><br>\n                                                                                                                             <ul>\n                                                                                                                             <li> Recap training for the validator/ validation panel members</li>\n                                                                                                                             <li> Set the time for the next meeting referring to the specified time frame based on the\n                                                                                                                             qualification size and propose a suitable date for the validation event based on processing \n                                                                                                                             timeframe.</li>\n                                                                                                                              </ul>\n                                                                                                                             For more information, please contact the {managerName} through {managerMail} or {managerNumber} .<br><br>\n                                                                                                                             Thank you.\n\n                                                                                                                                   <br><br>\n                                                                                                                                      DFO Team\n                                                                                                                             </div>', 29, 1, 'Institutional Qualification Placement Application  – First Validation Meeting', NULL, '', '', 0, 0, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0),
(43, 'On first meeting outcomes', 'FIRST_MEETING_OUTCOMES', 'On first meeting outcomes', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">\n                                                                                                                            Dear {userName},<br><br>\n\n                                                                                                                           Thank you for attending the First Validation Meeting!<br>\n                                                                                                                           This message is to inform you that the first meeting documents and outcomes are now\n                                                                                                                           available on the system. Please refer to your dashboard to view documents. You are kindly\n                                                                                                                           required to submit the following, before {deadLine} :\n                                                                                                                            <br><br>\n                                                                                                                                <ul>\n                                                                                                                            <li> The Validation Report through the system. </li>\n                                                                                                                           <li>  Upload the Extra Evidence and Question From to the system. </li>                                     </ul>\n                                                                                                                           For more information, please contact the {managerName} through {managerMail} or {managerNumber}.<br><br> Thank you!\n\n                                                                                                                                                                                                                                                                       <br><br>\n                                                                                                                                                                                                                                                                       DFO Team\n                                                                                                                       </div>', 30, 1, ' Institutional Qualification Placement Application  – First Meeting Outcomes ', NULL, '', '', 0, 0, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0),
(44, 'On second meeting', 'SECOND_EVALUATON_MEETING', 'On second meeting', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">\n                                                                                                                               Dear {userName},<br><br>\n\n                                                                                                                              This message is to inform you that the Second Validation meeting is scheduled to be held on {meetingDate} at {meetingTime}.\n                                                                                                                              For more information, please contact the {managerName} through {managerMail} or {managerNumber}.<br><br> Thank you.\n\n                                                                                                                                                                                                                                                                          <br><br>\n                                                                                                                                                                                                                                                                          DFO Team\n                                                                                                                     </div>', 31, 1, ' Institutional Qualification Placement Application – Second Validation Meeting', NULL, '', '', 0, 0, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0),
(46, 'On Application manager create site visit', 'AM_CREATE_SITE_VISIT', 'On Application manager creating site visit', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">\n    Dear {userName},<br><br>\n\n    The email is to inform you that the visit for the application titled {instituteName} is confirmed\n    to be held on {visitDate}. Please access your dashboard to find the visit documents and\n    information.<br><br>\n    For more information, please contact the {amName} through {amEmail} or {amPhone}.\n    <br><br>\n    Thank you!\n    <br><br>\n    DFO Team\n</div>', 32, 1, 'Institutional Qualification Placement Application –Visit ', NULL, '', '', 0, 0, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0),
(47, 'On site visit- extra evidence', 'SITE_VISIT_EXTRA_EVIDENCE', 'On site visit - extra evidence', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">\n                                                                                                                         Dear {userName},<br><br>\n\n                                                                                                                        This message is to inform you that the institution has uploaded the extra evidence required for\n                                                                                                                        the visit. Please access your dashboard to review the evidence and fill in the evidence findings\n                                                                                                                        form and submit it back to the system.<br>\n                                                                                                                        For more information, please contact the {managerName} through {managerMail} or {managerNumber}.<br><br> Thank you!\n\n                                                                                                                                                                                                                                                                    <br><br>\n                                                                                                                                                                                                                                                                    DFO Team\n                                                                                                                                                                                                                                                                                         </div>', 33, 1, 'Institutional Qualification Placement Application –Visit Extra Evidence', NULL, '', '', 0, 0, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0),
(48, 'Post site visit', 'POST_VISIT_OUTCOME', 'Post site visit', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">\n                                                                                                                Dear {userName},<br><br>\n\n                                                                                                               Many thanks for taking part and contributing to {instituteName}  Institutional Listing\n                                                                                                               Visit.<br>\n                                                                                                               You are kindly requested to incorporate the conditions and suggestions covered in the\n                                                                                                               meeting protocol and spoken feedback and visit findings into the report and send the final\n                                                                                                               version by {frstDate}.\n                                                                                                               Also, it would be greatly appreciated if you upload the filled Evidence Form and List of\n                                                                                                               Questions at your convenience.<br><br>\n                                                                                                               For more information, please contact the {managerName} through {managerMail} or {managerNumber}.<br><br> Thank you!\n\n                                                                                                                                                                                                                                                           <br><br>\n                                                                                                                                                                                                                                                           DFO Team\n                                                                                                                                                                                                                                                                                </div>\n', 34, 1, 'Institutional Qualification Placement Application – Post Visit ', NULL, '', '', 0, 0, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0),
(49, 'FACTUAL ACCURACY not LISTEDmail', 'FACTUAL_ACCURACY_NOT_LISTED', 'Mail to institution user to inform application is terminated', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">\r\nDear {userName},<br><br>\r\n                                                                                                                                         Trust this email finds you well. <br><br>\r\n                                                                                                                                         Thank you for submitting the Institutional Qualification Placement Application for {instituteName}.<br><br>\r\n                                                                                                                                         We would like to advise you that the Overall Judgment of the Validation Panel for the\r\n                                                                                                                                         aforementioned Institution is: “Not Valid”. Please access your dashboard to view the\r\n                                                                                                                                         Validation Report Draft for more details regarding the above judgment. Kindly note\r\n                                                                                                                                         that the report is confidential, provisional and for factual accuracy purposes only.<br><br>\r\n                                                                                                                                         It would be appreciated if you could check the report for factual accuracy and return it\r\n                                                                                                                                         back to the General Directorate of National Qualifications Framework & National\r\n                                                                                                                                         Examinations with any written comment by {proposedDate}. If the\r\n                                                                                                                                         General Directorate does not receive any reply by then, the document will be considered\r\n                                                                                                                                         as there are no errors of facts.<br><br>\r\n                                                                                                                                         Please note that a full Institutional Qualification Placement Application re-submission will be required\r\n                                                                                                                                         but this cannot be submitted earlier than six months of the above-mentioned date. The\r\n                                                                                                                                         resubmitted application will be processed as per the GDQ plans and schedule.<br><br>\r\n                                                                                                                                         Kindly note that if you wish to appeal against the judgment, you need to submit a formal\r\n                                                                                                                                         letter clearly stating the case and grounds for appeal along with the appeal form and\r\n                                                                                                                                         supported by relevant evidence, addressed to the General Director within five working\r\n                                                                                                                                         days of receiving this letter.<br><br>\r\n                                                                                                                                         For more details, refer to BQA’s website, www.bqa.gov.bh.\r\n                                                                                                                                         <br><br>\r\n                                                                                                                                         DFO Team\r\n                                                                                                                                                              </div>', 35, 1, ' Institutional Qualification Placement – Report Factual Accuracy', NULL, '', '', 0, 0, NULL, NULL, 0, 1, 1, 0, 1, 1, 0, 0),
(50, 'FACTUAL ACCURACY LISTED mail', 'FACTUAL_ACCURACY_LISTED', 'Mail to institution user to inform application is terminated', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">\r\n                                                                                                                     Dear {userName},<br><br>\r\n\r\n                                                                                                                    Trust this email finds you well.<br><br>\r\n                                                                                                                    Thank you for submitting the Institutional Qualification Placement Application for {instituteName}.<br><br>\r\n                                                                                                                    Please access your dashboard to view the Validation Report Draft along with the Arabic\r\n                                                                                                                    and English Profiles.<br><br>\r\n                                                                                                                    Kindly note that the report and profiles are drafts, confidential, provisional, and for\r\n                                                                                                                    factual accuracy purposes only. I would appreciate it if you could check them for factual\r\n                                                                                                                    accuracy and return them back to the General Directorate of National Qualifications\r\n                                                                                                                    Framework & National Examinations with any written comment by {proposedDate}. If the General Directorate does not receive any reply by the aforementioned\r\n                                                                                                                    date, the documents will be considered as there are no errors of facts.<br><br>\r\n                                                                                                                    If you have any queries, please do not hesitate to contact 17562461 or GDQ@bqa.gov.bh\r\n\r\n                                                                                                                                                                                                                                                                <br><br>\r\n                                                                                                                                                                                                                                                                DFO Team\r\n                                                                                                                                                                                                                                                                                     </div>', 36, 1, '  Institutional Qualification Placement – Report Factual Accuracy', NULL, '', '', 0, 0, NULL, NULL, 0, 1, 1, 0, 1, 1, 0, 0),
(51, 'QP - Deferred for Condition Fulfilment mail', 'FACTUAL_ACCURACY_DEFFERED', '8.If the report judgment was Deferred for Condition Fulfilment, the following message  would be sent to the Institution', '<div style=\"font-family:Poppins,Helvetica,Arial,sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#036\">Dear {userName}, <br>\r\n  <br>Trust this email finds you well. <br>\r\n  <br>Thank you for submitting the Qualification Placement Application for the qualification titled {instituteName} . <br>\r\n  <br>We would like to advise you that the Overall Judgement of the Validation Panel for the aforementioned application is: ‘Deferred for Condition Fulfilment’. Please access your dashboard to view the Evaluation Report Draft. Kindly note that the condition(s) stated in the report need to be addressed by {dueDate}. Please refer to the report for factual accuracy and for more details regarding the condition(s). <br>\r\n  <br>Please note that failing to address the condition within the specified timeframe would result in changing the Overall Judgement to ‘Not Valid’, and a full Institutional Qualification Placement Application re-submission will be required. Kindly note that the report is confidential, provisional and for internal purposes only. <br>\r\n  <br>Please respond by providing all necessary evidence detailing how the condition(s) are addressed as part of the Condition Fulfilment Form. If you have any queries, please do not hesitate to contact 17562461 or GDQ@bqa.gov.bh. <br>\r\n  <br>DFO Team\r\n</div>', 37, 1, 'Institutional Qualification Placement – Deferred for Condition Fulfilment', NULL, '', '', 0, 0, NULL, NULL, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO `tbl_mail_template` (`id`, `template_name`, `template_code`, `template_description`, `template_body`, `display_sequence`, `is_active`, `template_subject`, `created_by`, `created_ip`, `updated_ip`, `created_app_id`, `updated_app_id`, `created_time`, `last_updated_time`, `institute_cc`, `dfo_admin_cc`, `am_cc`, `dfo_member_cc`, `chief_cc`, `director_cc`, `ilep_cc`, `institution_head_cc`) VALUES
(52, 'QP – Condition Fulfilment Report Factual Accuracy mail', 'INSTITUTE_LISTING_CONDITION_FULFILMENT_REPORT_FACTUAL_LISTED', 'if the report judgment was Listed, the following message would be sent to the  Institution', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">Dear {userName},<br><br>\r\n                                                                                                                                                               Trust this email finds you well!<br><br>\r\n                                                                                                                                                               Thank you for submitting the condition fulfilment form for Institutional Qualification Placement\r\n                                                                                                                                                               Application for {instituteName} .<br><br>\r\n                                                                                                                                                               Please access your dashboard to view the Condition Fulfilment Report Draft along with\r\n                                                                                                                                                               the Arabic and English Profiles. <br><br>\r\n                                                                                                                                                               Kindly note that the report and profiles are drafts, confidential, provisional, and for\r\n                                                                                                                                                               factual accuracy purposes only. I would appreciate it if you could check them for factual\r\n                                                                                                                                                               accuracy and return them back to the General Directorate of National Qualifications\r\n                                                                                                                                                               Framework & National Examinations with any written comment by {dueDate}. If the General Directorate does not receive any reply by the\r\n                                                                                                                                                               aforementioned date, the documents will be considered as there are no errors of facts. <br><br>\r\n                                                                                                                                                               If you have any queries, please do not hesitate to contact 17562461 or GDQ@bqa.gov.bh.\r\n                                                                                                                                                               <br><br>\r\n                                                                                                                                                               DFO Team\r\n                                                                                                                                                                                    </div>', 38, 0, 'Institutional Qualification Placement – Condition Fulfilment Report Factual Accuracy', NULL, '', '', 0, 0, NULL, NULL, 0, 1, 1, 0, 1, 1, 0, 0),
(53, 'QP– Condition Fulfilment Report Factual Accuracy mail', 'INSTITUTE_LISTING_CONDITION_FULFILMENT_REPORT_FACTUAL_NOT_LISTED', ' If the report judgment was Not Listed, the following message would be sent to the  Institution', '<div style=\"font-family:Poppins,Helvetica,Arial,sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#036\">Dear {userName}, <br>\r\n  <br>Trust this email finds you well. <br>\r\n  <br>Thank you for submitting the Institutional Qualification Placement Application for {instituteName} . <br>\r\n  <br>We would like to advise you that the Overall Judgement of the Validation Panel for the aforementioned application is: ‘Deferred for Condition Fulfilment’. Please access your dashboard to view the Validation Report Draft. Kindly note that the condition(s) stated in the report need to be addressed within {dueDate}. Please refer to the report for factual accuracy and for more details regarding the condition(s). <br>\r\n  <br>Please note that failing to address the condition within the specified timeframe would result in changing the Overall Judgement to ‘Not Valid’, and a full Institutional Qualification Placement Application re-submission will be required. Kindly note that the report is confidential, provisional and for internal purposes only. <br>\r\n  <br>Please respond by providing all necessary evidence detailing how the condition(s) are addressed as part of the Condition Fulfilment Form. If you have any queries, please do not hesitate to contact 17562461 or GDQ@bqa.gov.bh. <br>\r\n  <br>DFO Team\r\n</div>', 39, 0, 'Institutional Qualification Placement – Condition Fulfilment Report Factual Accuracy', NULL, '', '', 0, 0, NULL, NULL, 0, 1, 1, 0, 1, 1, 0, 0),
(54, 'QP – Condition Fulfilment mail', 'CONDITION_FULFILMENT_DEADLINE', 'The ILEP Should receive the following message', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">\r\n                                                                                                                          Dear {userName},<br><br>\r\n\r\n                                                                                                                         This email is to inform you that we have received the Condition Fulfilment for the\r\n                                                                                                                          Institutional Qualification Placement Application titled {instituteName}. Please access your dashboard to\r\n                                                                                                                         view the documents. Upon your kind perusal of the evidence, you are kindly requested to\r\n                                                                                                                         draft the Condition Fulfillment Report and submit it by {proposedDate}.\r\n\r\n                                                                                                                         For more information, please contact the {managerName} through {managerMail} or {managerNumber}.<br><br> Thank you!\r\n\r\n                                                                                                                                                                                                                                                                     <br><br>\r\n                                                                                                                                                                                                                                                                     DFO Team\r\n                                                                                                                                                                                                                                                                                          </div>\r\n', 40, 1, ' Institutional Qualification Placement – Condition Fulfilment', NULL, '', '', 0, 0, NULL, NULL, 0, 1, 1, 0, 1, 1, 0, 0),
(55, 'QP – Condition Fulfilment', 'REPORT_PANEL_CONFIRMATION_CHIEF', 'The ILEP Should receive the following message', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">\n                                                                                                                          Dear {userName},<br><br>\n\n                                                                                                                         Hope this email finds you well!\n                                                                                                                         We would like to thank you on behalf of myself and the BQA team for your hard work.\n                                                                                                                         Your contribution and hard work during the past few months are very much appreciated.\n                                                                                                                         Please access your dashboard, where you can find the final evaluation report for your\n                                                                                                                         kind perusal and confirmation. The edited version is based on your esteemed\n                                                                                                                         contribution, comments, findings of the visit and the NQF QP standards. I look forward to\n                                                                                                                         receiving your confirmation by {frstDate}.\n                                                                                                                         For more information, please contact the {managerName} through {managerMail} or {managerNumber}.<br><br> Thank you!\n\n                                                                                                                                                                                                                                                                     <br><br>\n                                                                                                                                                                                                                                                                     DFO Team\n                                                                                                                                                                                                                                                                                          </div>', 41, 1, ' Institutional Qualification Placement – Condition Fulfilment', NULL, '', '', 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(56, 'Institutional QP – Listed mail', 'INSTITUTE_LISTING_AFTER_CABINET_APPROVE', 'The application status appears to the Institution changed to “Listed”. The following  message would be sent to the institution', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">Dear {instituteName},<br><br>\r\n                                                                                                                          Congratulations! <br><br>\r\n                                                                                                                          This is to inform you that your qualification titled {userName} is officially Placed on\r\n                                                                                                                          the NQF Register. You can view the Institution details and profiles through the following\r\n                                                                                                                          link:<br><br>\r\n                                                                                                                          Valid Institutions List (bqa.gov.bh)<br><br>\r\n                                                                                                                          Thank you!\r\n                                                                                                                          <br><br>\r\n                                                                                                                          DFO Team\r\n                                                                                                                                               </div>', 42, 1, 'Institutional Qualification Placement – Valid', NULL, '', '', 0, 0, NULL, NULL, 0, 1, 1, 0, 1, 1, 0, 0),
(57, 'INSTITUTE SIGN NO CONFLICT mail', 'INSTITUTE_SIGN_NO_CONFLICT', 'Mail to ilep when institute sign no colfict', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">\n                                                                                                               Dear {userName},<br><br>\n\n                                                                                                              This message is to inform you that a new Qualification Placement Application titled {QualificationTitle}  was assigned to you. Please check your dashboard to fill out the Conflict-of-Interest\n                                                                                                              Declaration Form.<br>\n                                                                                                              For more information, please contact the {amName} through {amMail} or {amPhone}.<br><br>\n\n                                                                                                              Thank you!<br>\n                                                                                                              DFO Team\n\n                                                                                                                                                                                                                                                         \n', 43, 1, 'Institutional Qualification Placement Application - Assigned ', NULL, '', '', 0, 0, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0),
(58, 'Admin check set deadline', 'CONDITION_FULFILMENT_ILEP_DEADLINE', 'AM should set a deadline for ILEP submission. An email should be sent to the ILEP with all the detail', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">\n                                                                                                                     Dear {userName},<br><br>\n\n                                                                                                                    This email is to inform you that we have received the Condition Fulfilment for the\n                                                                                                                    Institutional Qualification Placement Application titled {instituteName}. Please access your dashboard to\n                                                                                                                    view the documents. Upon your kind perusal of the evidence, you are kindly requested to\n                                                                                                                    draft the Condition Fulfillment Report and submit it by {proposedDate}.<br><br>\n                                                                                                                    For more information, please contact the {managerName} through {managerMail} or {managerNumber}. <br><br>\n                                                                                                                    Thank you.<br><br>\n                                                                                                                   <b> DFO Team<b>\n\n                                                                                                                                                                                                                                                                <br><br>\n                                                                                                                                                                                                                                                                DFO Team\n                                                                                                                                                                                                                                                                                     </div>', 44, 1, 'Institutional Qualification Placement Application – Condition Fulfilment', NULL, '', '', 0, 0, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0),
(60, 'On appeal create', 'ON_APPEAL_CREATE', 'On Appeal create', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">Dear {userName},<br><br>\n\nThis email is to inform you that the qualification titled {QPName} has requested for an Appeal, please submit your action. <br><br>\n                                                                                                     Thank you\n\n                                                                                                                                        <br><br>\n                                                                                                                                        DFO Team\n                                                                                                                                                             </div>', 46, 1, 'Institutional Qualification Placement – Appeal Requested', NULL, '', '', 0, 0, NULL, NULL, 0, 1, 1, 0, 1, 0, 0, 0),
(61, 'On appeal approved', 'ON_APPEAL_APPROVED', 'On Appeal approved', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">Dear {userName},<br><br>\n\nThis email is to inform you that the request for Appeal has been approved for the Qualification titled {QPName} . Please submit your action. <br><br>\n                                                                                                     Thank you\n\n                                                                                                                                        <br><br>\n                                                                                                                                        DFO Team\n                                                                                                                                                             </div>', 47, 1, 'Institutional Qualification Placement – Appeal Approved', NULL, '', '', 0, 0, NULL, NULL, 0, 1, 1, 0, 1, 1, 0, 0),
(63, 'Institutional Listing –Visit Required Documents ', 'VISIT_REQUIRED_DOCUMENTS', 'Once the AM uploaded the visit requirements the following message should be sent to  the Institution', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">\n    Dear {userName},<br><br>\n\n    The email is to inform you that the visit for the application titled {instituteName} is confirmed\n    to be held on {visitDate}. Please access your dashboard to find the visit documents and\n    information.<br><br>\n    You are kindly requested to submit a filled-out copy of the agenda and the submit the required evidence by {visitDate}. <br><br>\n    For more information, please contact the {amName} through {amEmail} or {amPhone}.\n    <br><br>\n    Thank you!\n    <br><br>\n    DFO Team\n</div>', 49, 1, 'Institutional Qualification Placement – Visit', NULL, '0', '0', 0, 0, NULL, NULL, 0, 1, 1, 0, 1, 1, 0, 0),
(64, 'Archival request ', 'ARCHIVAL_REQUEST', 'once institution requests for archival', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">Dear {userName} ,<br><br>\r\nThank you for submitting a request for the Archival process for the Qualification titled {name}. We would like to inform you that your application is currently under review.<br><br>\r\n                                                                                                                                                               If you have any queries, please do not hesitate to contact 17562461 or GDQ@bqa.gov.bh.\r\n                                                                                                                                                               <br><br>\r\n                                                                                                                                                               DFO Team\r\n</div>', 50, 1, 'Institutional Qualification Placement – Archival ', NULL, '0', '0', 0, 0, 0, NULL, 0, 1, 0, 0, 1, 1, 0, 0),
(65, 'Archival approved', 'ARCHIVAL_APPROVE', 'ARCHIVAL APPROVED', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">\r\n    Dear {userName},<br><br> \r\nThis is to inform you that your request for the Archival of the Qualification titled {name} has been Approved.<br><br>Thank you!\r\n\r\n    <br>\r\n    DFO Team\r\n</div>', 51, 1, 'Institutional Qualification Placement – Archival Approved', NULL, '0', '0', 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0),
(68, 'archival rejected', 'ARCHIVAL_REJECTED', 'ARCHIVAL_REJECTED', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">\r\n    Dear {userName},<br><br> \r\nThis is to inform you that your request for the Archival of the Qualification titled {name} has been Rejected.<br><br>Thank you!\r\n\r\n    <br>\r\n    DFO Team\r\n</div>', 52, 1, 'Institutional Qualification Placement – Archival Rejected', NULL, '0', '0', 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0),
(69, 'Monitoring request', 'MONITORING_REQUEST', 'MONITORING_REQUEST', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">Dear {userName} ,<br><br>\r\nThank you for submitting a request for the Monitoring process for the Qualification titled {name}. We would like to inform you that your application is currently under review.<br><br>\r\n                                                                                                                                                               If you have any queries, please do not hesitate to contact 17562461 or GDQ@bqa.gov.bh.\r\n                                                                                                                                                               <br><br>\r\n                                                                                                                                                               DFO Team\r\n</div>', 53, 1, 'Institutional Qualification Placement – Monitoring', NULL, '0', '0', 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0),
(70, 'Archival whole institute', 'ARCHIVAL_INSTITUTE', 'ARCHIVAL_INSTITUTE', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">\r\nThank you for submitting a request for the Archival process for the Institution titled {name}. We would like to inform you that your application is currently under review.<br><br>\r\n                                                                                                                                                               If you have any queries, please do not hesitate to contact 17562461 or GDQ@bqa.gov.bh.\r\n                                                                                                                                                               <br><br>\r\n                                                                                                                                                               DFO Team\r\n</div>', 54, 1, 'Institutional Qualification Placement – Archival ', NULL, '0', '0', 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0),
(71, 'Admin check ok mail', 'AM_ADMINISTRATIVE_CHECK_COMPLETED', 'Mail to institution user to inform application is comleted', ' <div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">\nDear {userName},<br><br>\n This message is to acknowledge that your Qualification titled {instituteName} is received and will be forwarded to the evaluation stage. You will be contacted shortly to provide you with information related to the evaluation Panel. The application’s main contact is detailed below: <br>\n <br>\n Application ID: {applicationId} <br>\n Application Manager Name: {managerName}<br>\n Application Manager Contact Number: {managerNumber}<br>\n Application Manager Email: {managerMail}<br>\n <br>  <br> \n\n Kindly ensure that the applicable service charge is paid to enable further processing of your application. Please note that the application process cannot proceed to the next stage until the payment has been received. For more information about the service charge please visit the following <a href=\"https://www.bqa-nqf.gov.bh/qp/help/List-of-BQA-Services.pdf\">link </a>. <br><br>\n The site visit will be conducted within 15 days of this acknowledgement. In case of any conflict, this timeline may be extended by up to 5 additional days. The institution will be informed of the confirmed site visit date. <br><br>\n\n If any clarification is required, please do not hesitate to contact your application manager. <br><br>\n Thank you for your cooperation.\n\n <br><br>\n DFO Team\n </div>', 55, 1, 'Institutional Qualification Placement – Acknowledgment', 0, '', '0', 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 1),
(73, 'ON NAC approval', 'NAC_SHARED', 'On NAC approval to MCO', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\"> Dear {userName},<br><br> The qualification titled {qualificationTitle} offered by the institute  {instName} has been approved by NAC . Please submit your action <br><br> Thank you! <br> DFO Team </div>', 26, 1, 'Institutional Qualification Placement - NAC Approval', NULL, '', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0),
(74, 'forgot password', 'FORGOT_PASSWORD', 'reset password ', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif; font-size:20px; font-weight:300; line-height:30px; text-align:justify; color:#003366;\">\r\n Dear {userName},<br><br>\r\n We received a request to reset the password for your account. To proceed, please click on the link below. If you did not initiate this request, Please disregard this email.<br><br>\r\n <a href=\"{resetLink}\" target=\"_blank\"> {resetLink}</a><br><br>\r\n Thank you,<br>\r\n DFO Team<br><br>\r\n</div>', 1, 1, 'Qualification Placement - Reset Password', NULL, '', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0),
(75, 'institution submission mail', 'INSTITUTION_SUBMITTED', 'after institution submitted application', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">The Qualification titled {userName} has submitted their application for the Qualification Placement Process. Please assign an application manager to oversee and complete the administrative check process.<br><br>Thank you<br>DFO Team<br></div>', 1, 1, 'Instituional Qualification Placement - Application Submission', NULL, '', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 1, 1, 0, 0),
(76, 'institution re-submission mail', 'INSTITUTION_RESUBMITTED', 'after institution re-submitted application', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">Dear {userName}<br><br>Thank you for Re-submitting your Qualification Placement Application for the Administrative Check Process! You will be receiving the Administrative Check Outcomes shortly. Kindly note that\r\n for any further information or updates regarding your application, you may kindly\r\n contact your application manager.<br><br>Thank you<br>DFO Team<br><br><br></div>', 1, 1, 'Institutional Qualification Placement - Application Re-Submission', NULL, '', '', 0, 0, NULL, NULL, 0, 0, 1, 0, 1, 0, 0, 0),
(77, 'institution re-submission mail', 'INSTITUTION_RESUBMITTED_VERIFICATION', 'after institution re-submitted application', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">Dear {userName}<br><br>Thank you for Re-submitting your Qualification Placement Application for the Verification Process! You will be receiving the Verification Outcomes shortly. Kindly note that\r\n for any further information or updates regarding your application, you may kindly\r\n contact your application manager.<br><br>Thank you<br>DFO Team<br><br><br></div>', 1, 1, 'Institutional Qualification Placement - Application Re-Submission', NULL, '', '', 0, 0, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0),
(78, 'INSTITUTE application scheduled mail', 'INSTITUTE_APPLICATION_SCHEDULED_DFO', 'The message sent to the DFO after their application was scheduled', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">The Directorate of National Framework Operations (DFO) of the Education & Training Quality Authority (BQA) would like to inform that the Qualification titled {instituteName} is scheduled to submit the Qualification Placement Application by {submissionDate}.<br><br>DFO Team</div>', 42, 1, 'Qualification Placement Application - Submission Approval', NULL, '', '', 0, 0, NULL, NULL, 0, 1, 0, 0, 1, 1, 0, 0),
(79, 'CHIEF APPROVAL REMINDER', 'CHIEF_APPROVAL_REMINDER', 'to sent mail to chief after am approval', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">\r\nDear {user},<br><br>\r\n We would like to inform you that the Application Manager has successfully reviewed the report for Qualification titled {instituteName}. <br>\r\n\r\nYour review and approval are required as the next step in the process. Kindly log in to the system and review the submitted report at your earliest convenience.\r\n <br><br>\r\n DFO Team\r\n </div>', 5, 1, 'Institutional Qualification placement – Chief Approval', NULL, '', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0),
(80, 'On CF administrative check incomplete by application manager to institution', 'CF_AM_ADMINISTRATIVE_CHECK_INCOMPLETE', 'On incomplete cf administrative check by application manager to institute to complete the incomplete section as additional task', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">\nDear {userName},<br><br>\n                                                                    This is to inform you that the DFO Team has conducted an condition fulfilment Administrative Check for the\n                                                                    submitted Qualification Placement Application titled {qualificationName}. The purpose of this\n                                                                    process is to ensure the clarity and completeness of your application before\n                                                                    acknowledging its receipt. <br><br>\n                                                                    Your application form needs to be updated with more information for some indicators.\n                                                                    Thus, complete the incomplete sections and attach the required evidence, whenever\n                                                                     applicable.\n                                                                    <br><br>\n                                                                    If any clarification is required, please do not hesitate to contact your application manager. Thank you for your cooperation.\n\n                                                                    <br><br>\n                                                                    DFO Team\n                                                                                         </div>', NULL, 1, 'Qualification Placement– Incomplete conditional fulfilment Administrative Check', NULL, '', '', 0, 0, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0),
(82, 'Validation Panel Member Declared a Conflict of Interest', 'PANEL_HAVE_CONFLICT_V2', 'Validation Panel Member Declared a Conflict of Interest', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">\nDear {userName},<br><br>\n\nThis message is to inform you that a Validation Panel member has declared a conflict of interest for the Qualification Placement Application titled {instituteName}. Please check your dashboard to review the conflict declaration details and take the necessary action.<br><br>\n\nThank you!<br><br>\n\nDFO Team\n\n</div>', NULL, 1, 'Validation Panel Member Declared a Conflict of Interest', NULL, '', '', 0, 0, NULL, NULL, 0, 1, 0, 0, 1, 0, 0, 0),
(83, 'Institution Declared a Conflict of Interest', 'INSTITUTE_HAVE_CONFLICT_V2', 'Institution Declared a Conflict of Interest', '<div style=\"font-family:Poppins, Helvetica, Arial, sans-serif;font-size:20px;font-weight:300;line-height:30px;text-align:justify;color:#003366;\">\nDear {userName},<br><br>\n\nHope this message finds you well!<br><br>\n\nThis is to inform you that the institution has declared a conflict of interest regarding the nominated Validation Panel members for the Qualification Placement Application titled {QualificationTitle}.<br><br>\n\nKindly review the conflict declaration details in your dashboard and take the necessary action.<br><br>\n\nDFO Team\n\n</div>', NULL, 1, 'Institution Declared a Conflict of Interest', NULL, '', '', 0, 0, NULL, NULL, 0, 1, 0, 0, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mapping_panel`
--

DROP TABLE IF EXISTS `tbl_mapping_panel`;
CREATE TABLE IF NOT EXISTS `tbl_mapping_panel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_unique_id` bigint DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `position` varchar(500) DEFAULT NULL,
  `have_major_changes` int DEFAULT NULL,
  `chair` int DEFAULT NULL,
  `over_all_nqf_level` varchar(100) DEFAULT NULL,
  `over_all_nqf_credit` varchar(100) DEFAULT NULL,
  `equal_components` int DEFAULT NULL,
  `exit_level` int DEFAULT NULL,
  `proportional_design` int DEFAULT NULL,
  `others` int DEFAULT NULL,
  `others_comment` varchar(500) DEFAULT NULL,
  `date` bigint DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_time` bigint DEFAULT NULL,
  `created_ip` varchar(500) DEFAULT NULL,
  `updated_ip` varchar(500) DEFAULT NULL,
  `created_app_id` bigint DEFAULT NULL,
  `updated_app_id` bigint DEFAULT NULL,
  `last_updated_time` bigint DEFAULT NULL,
  `is_revalidation` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_meeting`
--

DROP TABLE IF EXISTS `tbl_meeting`;
CREATE TABLE IF NOT EXISTS `tbl_meeting` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_unique_id` bigint NOT NULL,
  `first_date_and_time` double DEFAULT NULL,
  `mom_url` text,
  `first_link_or_location` text,
  `first_meeting_type` int DEFAULT NULL,
  `first_method` int DEFAULT NULL,
  `dead_line` double DEFAULT '0',
  `first_meet_report_doc_cmnts` text,
  `first_meet_ques_cmnts` text,
  `first_meet_evid_cmnts` text,
  `second_date_and_time` text,
  `second_link_or_location` text,
  `second_meeting_type` int DEFAULT NULL,
  `second_method` int DEFAULT NULL,
  `second_meet_report_doc_cmnts` text,
  `second_meet_ques_cmnts` text,
  `second_meet_evid_cmnts` text,
  `created_by` bigint DEFAULT NULL,
  `created_ip` text NOT NULL,
  `updated_ip` text NOT NULL,
  `created_app_id` bigint NOT NULL,
  `updated_app_id` bigint NOT NULL,
  `created_time` double DEFAULT NULL,
  `last_updated_time` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbl_meeting_unique_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_monitoring_change_form`
--

DROP TABLE IF EXISTS `tbl_monitoring_change_form`;
CREATE TABLE IF NOT EXISTS `tbl_monitoring_change_form` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_unique_id` bigint NOT NULL,
  `change_type` int DEFAULT NULL,
  `description` text,
  `file` text,
  `created_ip` text,
  `updated_ip` text,
  `created_app_id` bigint DEFAULT NULL,
  `updated_app_id` bigint DEFAULT NULL,
  `created_time` double DEFAULT NULL,
  `last_updated_time` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_monitoring_form`
--

DROP TABLE IF EXISTS `tbl_monitoring_form`;
CREATE TABLE IF NOT EXISTS `tbl_monitoring_form` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_unique_id` bigint NOT NULL,
  `planned_for_change` int DEFAULT NULL,
  `planned_date` varchar(255) DEFAULT NULL,
  `change_description` text,
  `confirmation` int DEFAULT NULL,
  `have_changes` int DEFAULT NULL,
  `comments` text,
  `created_ip` text,
  `updated_ip` text,
  `created_app_id` bigint DEFAULT NULL,
  `updated_app_id` bigint DEFAULT NULL,
  `created_time` double DEFAULT NULL,
  `last_updated_time` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment_details`
--

DROP TABLE IF EXISTS `tbl_payment_details`;
CREATE TABLE IF NOT EXISTS `tbl_payment_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_unique_id` bigint DEFAULT NULL,
  `payment_remark` varchar(500) DEFAULT NULL,
  `payment_file` text,
  `receipt_no` varchar(500) DEFAULT NULL,
  `invoice_number` varchar(500) DEFAULT NULL,
  `invoice_date` bigint DEFAULT NULL,
  `transaction_date` bigint DEFAULT NULL,
  `is_paid` int DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `updated_by` bigint DEFAULT NULL,
  `created_ip` varchar(150) DEFAULT NULL,
  `updated_ip` varchar(150) DEFAULT NULL,
  `created_app_id` bigint DEFAULT NULL,
  `updated_app_id` bigint DEFAULT NULL,
  `created_time` bigint DEFAULT NULL,
  `last_updated_time` bigint DEFAULT NULL,
  `service_charge_amount` decimal(10,3) DEFAULT NULL,
  `service_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `form_unique_id` (`form_unique_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_planned_submission_dates`
--

DROP TABLE IF EXISTS `tbl_planned_submission_dates`;
CREATE TABLE IF NOT EXISTS `tbl_planned_submission_dates` (
  `date_id` bigint NOT NULL AUTO_INCREMENT,
  `planned_date` double DEFAULT NULL,
  `submission_end_date` double NOT NULL DEFAULT '0',
  `created_ip` text,
  `updated_ip` text,
  `created_time` double DEFAULT NULL,
  `last_updated_time` double DEFAULT NULL,
  `created_by` bigint NOT NULL,
  `created_app_id` bigint NOT NULL,
  `updated_app_id` bigint NOT NULL,
  PRIMARY KEY (`date_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_program_structure`
--

DROP TABLE IF EXISTS `tbl_program_structure`;
CREATE TABLE IF NOT EXISTS `tbl_program_structure` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sl_no` int DEFAULT NULL,
  `form_unique_id` bigint DEFAULT NULL,
  `unit_code` varchar(100) DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `mandatory` int DEFAULT NULL,
  `have_major_changes` int DEFAULT NULL,
  `nqf_level` varchar(100) DEFAULT NULL,
  `nqf_credit` varchar(100) DEFAULT NULL,
  `overall_nqf_credit` varchar(100) DEFAULT NULL,
  `revalidation_desc` text,
  `overall_nqf_level` varchar(100) DEFAULT NULL,
  `mapping_score_card` text,
  `file` text,
  `file_type` int DEFAULT NULL,
  `version` int DEFAULT NULL,
  `sub_version` int DEFAULT NULL,
  `description` text,
  `am_status` int DEFAULT NULL,
  `latest_am_check` int DEFAULT NULL,
  `am_user_id` int DEFAULT NULL,
  `am_comment` int DEFAULT NULL,
  `am_file` int DEFAULT NULL,
  `am_temp` int DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_time` bigint DEFAULT NULL,
  `created_ip` varchar(500) DEFAULT NULL,
  `updated_ip` varchar(500) DEFAULT NULL,
  `created_app_id` bigint DEFAULT NULL,
  `updated_app_id` bigint DEFAULT NULL,
  `last_updated_time` bigint DEFAULT NULL,
  `status` int DEFAULT NULL,
  `am_file_status` int DEFAULT NULL,
  `am_file_comment` text,
  `is_revalidation` int DEFAULT NULL,
  `comments` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_program_structure_checklist`
--

DROP TABLE IF EXISTS `tbl_program_structure_checklist`;
CREATE TABLE IF NOT EXISTS `tbl_program_structure_checklist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_unique_id` bigint NOT NULL,
  `sl_no` int NOT NULL,
  `criterion` int NOT NULL,
  `sub_criterion` varchar(255) NOT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_program_structure_work_flow`
--

DROP TABLE IF EXISTS `tbl_program_structure_work_flow`;
CREATE TABLE IF NOT EXISTS `tbl_program_structure_work_flow` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_unique_id` bigint DEFAULT NULL,
  `program_tag` varchar(10) DEFAULT NULL,
  `have_major_changes` int DEFAULT NULL,
  `version` int DEFAULT NULL,
  `description` text,
  `file` text,
  `status` int DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_time` bigint DEFAULT NULL,
  `created_ip` varchar(500) DEFAULT NULL,
  `updated_ip` varchar(500) DEFAULT NULL,
  `created_app_id` bigint DEFAULT NULL,
  `updated_app_id` bigint DEFAULT NULL,
  `last_updated_time` bigint DEFAULT NULL,
  `tag` varchar(100) DEFAULT NULL,
  `am_verification_status` int DEFAULT NULL,
  `am_user_id` mediumtext,
  `am_comment` text,
  `am_file` text,
  `am_temp` text,
  `sub_version` int DEFAULT NULL,
  `latest_am_check` int DEFAULT NULL,
  `is_revalidation` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_qp_institute_form`
--

DROP TABLE IF EXISTS `tbl_qp_institute_form`;
CREATE TABLE IF NOT EXISTS `tbl_qp_institute_form` (
  `form_id` bigint NOT NULL AUTO_INCREMENT,
  `form_unique_id` bigint NOT NULL,
  `form_parent_unique_id` bigint NOT NULL,
  `institute_name` varchar(250) NOT NULL,
  `inst_app_lic_no` varchar(250) DEFAULT NULL,
  `license_type` smallint DEFAULT NULL,
  `approval_doc_path` text,
  `issue_date` bigint DEFAULT NULL,
  `exp_date` bigint DEFAULT NULL,
  `planned_sub_date` bigint DEFAULT NULL,
  `poc_name` varchar(250) DEFAULT NULL,
  `poc_email` varchar(50) DEFAULT NULL,
  `poc_cn_number` text,
  `poc_title` text,
  `status` smallint DEFAULT NULL,
  `resubmit_status` smallint DEFAULT NULL,
  `created_ip` text NOT NULL,
  `updated_ip` text NOT NULL,
  `created_app_id` bigint DEFAULT NULL,
  `updated_app_id` bigint DEFAULT NULL,
  `created_time` bigint DEFAULT NULL,
  `last_updated_time` bigint DEFAULT NULL,
  `qualification_title` text,
  `no_of_units` bigint DEFAULT NULL,
  PRIMARY KEY (`form_id`),
  UNIQUE KEY `tbl_qp_institute_form_unique_id` (`form_unique_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_qualification_profile`
--

DROP TABLE IF EXISTS `tbl_qualification_profile`;
CREATE TABLE IF NOT EXISTS `tbl_qualification_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_unique_id` bigint NOT NULL,
  `is_revalidation` int DEFAULT NULL,
  `qualification_name_english` text,
  `qualification_name_arabic` text,
  `institution_name_english` text,
  `qualification_nqf_level` text,
  `orginal_placement_date` text,
  `reason_for_revalidation` text,
  `notes` text,
  `qualification_nqf_credit` text,
  `number_of_units` text,
  `institution_name_arabic` text,
  `college_name_english` text,
  `college_name_arabic` text,
  `listing_id` text,
  `approval_number` text,
  `issue_date` bigint DEFAULT NULL,
  `exp_date` bigint DEFAULT NULL,
  `start_date` bigint DEFAULT NULL,
  `board_name` text,
  `narrow` text,
  `detailed` text,
  `qualification_desc` text,
  `qualification_desc_url` text,
  `target_learners` text,
  `target_learners_url` text,
  `overall_status` smallint DEFAULT NULL,
  `submission_date` bigint DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_ip` text,
  `updated_ip` text,
  `created_app_id` bigint DEFAULT NULL,
  `updated_app_id` bigint DEFAULT NULL,
  `created_time` bigint DEFAULT NULL,
  `last_updated_time` bigint DEFAULT NULL,
  `file_path_parameter` text,
  `auth_person_name` text,
  `auth_person_title` text,
  `auth_person_email` text,
  `auth_person_mobile` text,
  `sign_flag` int DEFAULT NULL,
  `qualification_placement_date` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_role`
--

DROP TABLE IF EXISTS `tbl_role`;
CREATE TABLE IF NOT EXISTS `tbl_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_type` int DEFAULT NULL,
  `sub_type` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_ip` varchar(50) DEFAULT NULL,
  `updated_ip` varchar(50) DEFAULT NULL,
  `created_app_id` bigint DEFAULT NULL,
  `updated_app_id` bigint DEFAULT NULL,
  `created_time` bigint DEFAULT NULL,
  `last_updated_time` bigint DEFAULT NULL,
  `active` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_site_date_change_requests`
--

DROP TABLE IF EXISTS `tbl_site_date_change_requests`;
CREATE TABLE IF NOT EXISTS `tbl_site_date_change_requests` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_unique_id` bigint NOT NULL,
  `institute_name` text,
  `ilep_member_names` text,
  `licence_body` text,
  `requested_date_1` double DEFAULT NULL,
  `requested_date_2` double DEFAULT NULL,
  `requested_date_3` double DEFAULT NULL,
  `justification` text,
  `am_approve` smallint DEFAULT NULL,
  `chief_approve` smallint DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_ip` text NOT NULL,
  `updated_ip` text NOT NULL,
  `created_app_id` bigint NOT NULL,
  `updated_app_id` bigint NOT NULL,
  `created_time` double DEFAULT NULL,
  `last_updated_time` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_site_visit`
--

DROP TABLE IF EXISTS `tbl_site_visit`;
CREATE TABLE IF NOT EXISTS `tbl_site_visit` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_unique_id` bigint NOT NULL,
  `institute_name` text,
  `person_involved` text,
  `site_visit_required` smallint DEFAULT NULL,
  `visit_date` double DEFAULT NULL,
  `inst_rep_name` text,
  `inst_rep_position` text,
  `inst_rep_contact` text,
  `inst_rep_email` text,
  `ilep_documents` text,
  `inst_documents` text,
  `created_by` bigint DEFAULT NULL,
  `created_ip` text NOT NULL,
  `updated_ip` text NOT NULL,
  `created_app_id` bigint NOT NULL,
  `updated_app_id` bigint NOT NULL,
  `created_time` double DEFAULT NULL,
  `last_updated_time` double DEFAULT NULL,
  `confidentiality_status` int DEFAULT NULL,
  `date1` double DEFAULT NULL,
  `date2` double DEFAULT NULL,
  `date3` double DEFAULT NULL,
  `is_date_ext_req` smallint DEFAULT '0',
  `report_file` text,
  `agenda_form` text,
  `agenda_comment` text,
  `filled_agenda_form` text,
  `filled_agenda_comment` text,
  `am_mark_site_visit` int DEFAULT '0',
  `am_mark_site_visit_comment` text,
  `am_reject_document_comment` text,
  `am_evaluate_uploaded_site_visit_doc` text,
  `ilep_evaluate_uploaded_site_visit_doc` text,
  `inst_upload_ext_evd_dead_line` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_static_qualification_details`
--

DROP TABLE IF EXISTS `tbl_static_qualification_details`;
CREATE TABLE IF NOT EXISTS `tbl_static_qualification_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `qualification_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nqf_level` varchar(50) DEFAULT NULL,
  `nqf_credit` varchar(50) DEFAULT NULL,
  `institution_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sector` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `operation_status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `process_count` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `condition_fulfilled` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `placement_date` varchar(255) DEFAULT NULL,
  `qualification_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_std_work_flow`
--

DROP TABLE IF EXISTS `tbl_std_work_flow`;
CREATE TABLE IF NOT EXISTS `tbl_std_work_flow` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_unique_id` bigint DEFAULT NULL,
  `have_major_changes` int DEFAULT NULL,
  `is_revalidation` int DEFAULT NULL,
  `parent_tag` varchar(10) DEFAULT NULL,
  `tag` varchar(10) DEFAULT NULL,
  `version` int DEFAULT NULL,
  `sub_version` int DEFAULT NULL,
  `description` text,
  `file` text,
  `status` int DEFAULT NULL,
  `am_status` int DEFAULT NULL,
  `am_user_id` mediumtext,
  `am_comment` text,
  `am_file` text,
  `created_by` bigint DEFAULT NULL,
  `created_time` bigint DEFAULT NULL,
  `created_ip` varchar(500) DEFAULT NULL,
  `updated_ip` varchar(500) DEFAULT NULL,
  `created_app_id` bigint DEFAULT NULL,
  `updated_app_id` bigint DEFAULT NULL,
  `last_updated_time` bigint DEFAULT NULL,
  `am_temp` text,
  `latest_am_check` int DEFAULT NULL,
  `latest_inst_check` int DEFAULT NULL,
  `is_cf` int NOT NULL,
  `inst_description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `email_id` text NOT NULL,
  `password` text NOT NULL,
  `created_ip` text NOT NULL,
  `updated_ip` text NOT NULL,
  `created_app_id` bigint NOT NULL,
  `updated_app_id` bigint NOT NULL,
  `created_time` double DEFAULT NULL,
  `last_updated_time` double DEFAULT NULL,
  `position` text,
  `contact_number` text,
  `report_access` int DEFAULT NULL,
  `access_right` smallint DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  `bio` text,
  `parent_inst` bigint DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_login_info`
--

DROP TABLE IF EXISTS `tbl_user_login_info`;
CREATE TABLE IF NOT EXISTS `tbl_user_login_info` (
  `login_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `user_type` smallint NOT NULL,
  `sub_type` smallint DEFAULT NULL,
  `app_id` smallint NOT NULL,
  `token` text NOT NULL,
  `refresh_token` text,
  `expiry_time` double DEFAULT NULL,
  `public_key` text,
  `private_key` text,
  `aes_key` text,
  `aes_key_encrypted` text,
  `created_ip` text NOT NULL,
  `updated_ip` text NOT NULL,
  `created_app_id` bigint NOT NULL,
  `updated_app_id` bigint NOT NULL,
  `created_time` double DEFAULT NULL,
  `last_updated_time` double DEFAULT NULL,
  PRIMARY KEY (`login_id`),
  UNIQUE KEY `tbl_user_login_info_id` (`login_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_role`
--

DROP TABLE IF EXISTS `tbl_user_role`;
CREATE TABLE IF NOT EXISTS `tbl_user_role` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temp_tbl_user_role`
--

DROP TABLE IF EXISTS `temp_tbl_user_role`;
CREATE TABLE IF NOT EXISTS `temp_tbl_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
CREATE TABLE IF NOT EXISTS `test` (
  `id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
