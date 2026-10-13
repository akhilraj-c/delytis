-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 13, 2026 at 07:06 PM
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
-- Database: `cas`
--

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
-- Table structure for table `tbl_foreign_qualification`
--

DROP TABLE IF EXISTS `tbl_foreign_qualification`;
CREATE TABLE IF NOT EXISTS `tbl_foreign_qualification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_unique_id` bigint DEFAULT NULL,
  `title` text,
  `awarding_body` text,
  `qualification_included_in` varchar(255) DEFAULT NULL,
  `qualification_size` varchar(255) DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
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
-- Table structure for table `tbl_fq_user_role`
--

DROP TABLE IF EXISTS `tbl_fq_user_role`;
CREATE TABLE IF NOT EXISTS `tbl_fq_user_role` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_il_user_role`
--

DROP TABLE IF EXISTS `tbl_il_user_role`;
CREATE TABLE IF NOT EXISTS `tbl_il_user_role` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_impersonate_log`
--

DROP TABLE IF EXISTS `tbl_impersonate_log`;
CREATE TABLE IF NOT EXISTS `tbl_impersonate_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `impersonated_by` bigint DEFAULT NULL,
  `impersonated_user_id` bigint DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_ip` varchar(50) DEFAULT NULL,
  `updated_ip` varchar(50) DEFAULT NULL,
  `created_app_id` bigint DEFAULT NULL,
  `updated_app_id` bigint DEFAULT NULL,
  `created_time` bigint DEFAULT NULL,
  `last_updated_time` bigint DEFAULT NULL,
  `impersonated_email_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_institute_form`
--

DROP TABLE IF EXISTS `tbl_institute_form`;
CREATE TABLE IF NOT EXISTS `tbl_institute_form` (
  `form_id` bigint NOT NULL AUTO_INCREMENT,
  `form_unique_id` bigint NOT NULL,
  `institute_name` varchar(250) NOT NULL,
  `inst_app_lic_no` varchar(250) DEFAULT NULL,
  `license_type` smallint DEFAULT NULL,
  `approval_doc_path` text,
  `issue_date` double DEFAULT NULL,
  `exp_date` double DEFAULT NULL,
  `is_bqa_reviewed` smallint DEFAULT NULL,
  `bqa_review_comment` text,
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
  `rejection_date` double DEFAULT NULL,
  `listing_id` varchar(255) DEFAULT NULL,
  `is_awarding_body` int DEFAULT NULL,
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
  UNIQUE KEY `tbl_ilep_panel_unique_id` (`id`),
  UNIQUE KEY `uk_tbl_listed_institutes_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_listed_institutes`
--

INSERT INTO `tbl_listed_institutes` (`id`, `user_id`, `email`, `institute_name_english`, `institute_name_arabic`, `listing_id`, `created_by`, `created_ip`, `updated_ip`, `created_app_id`, `updated_app_id`, `created_time`, `last_updated_time`, `mobile_number`) VALUES
(1, 8, 'bqa-inst-test@yopmail.com', 'Institution Name', 'مؤسسة', 'IL11-1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '17001241');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_national_qualification`
--

DROP TABLE IF EXISTS `tbl_national_qualification`;
CREATE TABLE IF NOT EXISTS `tbl_national_qualification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_unique_id` bigint DEFAULT NULL,
  `title` text,
  `qualification_size` varchar(255) DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
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
-- Table structure for table `tbl_nqf_data`
--

DROP TABLE IF EXISTS `tbl_nqf_data`;
CREATE TABLE IF NOT EXISTS `tbl_nqf_data` (
  `id` bigint NOT NULL,
  `total_listed` int NOT NULL DEFAULT '0',
  `institution_total_archived` int NOT NULL DEFAULT '0',
  `total_not_yet_listed` int NOT NULL DEFAULT '0',
  `total_completed_report` int NOT NULL DEFAULT '0',
  `total_in_progress` int NOT NULL DEFAULT '0',
  `total_in_market` int NOT NULL DEFAULT '0',
  `total_placed` int NOT NULL DEFAULT '0',
  `qualification_total_archived` int NOT NULL DEFAULT '0',
  `created_by` bigint DEFAULT NULL,
  `created_ip` varchar(45) DEFAULT NULL,
  `updated_ip` varchar(45) DEFAULT NULL,
  `created_app_id` bigint DEFAULT NULL,
  `updated_app_id` bigint DEFAULT NULL,
  `created_time` bigint DEFAULT NULL,
  `last_updated_time` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_qp_user_role`
--

DROP TABLE IF EXISTS `tbl_qp_user_role`;
CREATE TABLE IF NOT EXISTS `tbl_qp_user_role` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_qp_user_role`
--

INSERT INTO `tbl_qp_user_role` (`user_id`, `role_id`) VALUES
(2, 1),
(1, 2),
(8, 3),
(3, 4),
(9, 4),
(10,7),
(4, 9),
(5, 9),
(6, 9),
(7, 9);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_readiness_score_config`
--

DROP TABLE IF EXISTS `tbl_readiness_score_config`;
CREATE TABLE IF NOT EXISTS `tbl_readiness_score_config` (
  `id` bigint NOT NULL,
  `readiness_score` tinyint NOT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_ip` varchar(45) DEFAULT NULL,
  `updated_ip` varchar(45) DEFAULT NULL,
  `created_app_id` bigint DEFAULT NULL,
  `updated_app_id` bigint DEFAULT NULL,
  `created_time` bigint DEFAULT NULL,
  `last_updated_time` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;

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
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_role`
--

INSERT INTO `tbl_role` (`id`, `user_type`, `sub_type`, `name`, `created_ip`, `updated_ip`, `created_app_id`, `updated_app_id`, `created_time`, `last_updated_time`, `active`) VALUES
(1, 3, 0, 'DFO_ADMIN', NULL, NULL, NULL, NULL, NULL, NULL, 1),
(2, 0, 0, 'SUPER_ADMIN', NULL, NULL, NULL, NULL, NULL, NULL, 1),
(3, 1, 0, 'INSTITUTION', NULL, NULL, NULL, NULL, NULL, NULL, 1),
(4, 3, 1, 'APPLICATION_MANAGER', NULL, NULL, NULL, NULL, NULL, NULL, 1),
(5, 3, 2, 'DFO_MEMBER', NULL, NULL, NULL, NULL, NULL, NULL, 1),
(6, 4, 0, 'CHIEF', NULL, NULL, NULL, NULL, NULL, NULL, 1),
(7, 5, 0, 'DIRECTOR', NULL, NULL, NULL, NULL, NULL, NULL, 1),
(8, 6, 0, 'GENERAL_DIRECTOR', NULL, NULL, NULL, NULL, NULL, NULL, 1),
(9, 7, 0, 'PANEL_MEMBER', NULL, '103.42.196.113, 10.246.192.222', NULL, 12114, NULL, 1776918943236, 1),
(10, 8, 0, 'MCO', NULL, NULL, NULL, NULL, NULL, NULL, 1),
(11, 9, 0, 'OBSERVER', NULL, NULL, NULL, NULL, NULL, NULL, 1);

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
  `qp_access_status` int DEFAULT NULL,
  `il_access_status` int DEFAULT NULL,
  `fq_access_status` int DEFAULT NULL,
  `old_user_id` bigint DEFAULT NULL,
  `parent_inst` bigint DEFAULT NULL,
  `il_assigned_chief_id` bigint DEFAULT NULL,
  `qp_assigned_chief_id` bigint DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `fk_il_assigned_chief` (`il_assigned_chief_id`),
  KEY `fk_qp_assigned_chief` (`qp_assigned_chief_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `username`, `email_id`, `password`, `created_ip`, `updated_ip`, `created_app_id`, `updated_app_id`, `created_time`, `last_updated_time`, `position`, `contact_number`, `report_access`, `access_right`, `active`, `bio`, `qp_access_status`, `il_access_status`, `fq_access_status`, `old_user_id`, `parent_inst`, `il_assigned_chief_id`, `qp_assigned_chief_id`) VALUES
(1, 'Super admin', 'bqa-admin-test@yopmail.com', '1234', '', '', 0, 0, NULL, NULL, NULL, '17001234', NULL, NULL, 1, NULL, 1, 0, 0, NULL, NULL, NULL, NULL),
(2, 'DFO Admin', 'bqa-dfo-test@yopmail.com', '1234', '', '', 0, 0, NULL, NULL, NULL, '17001235', NULL, NULL, 1, NULL, 1, 1, 1, NULL, NULL, NULL, NULL),
(3, 'Application Manager', 'bqa-am-test@yopmail.com', '1234', '', '', 0, 0, NULL, NULL, NULL, '17001236', NULL, NULL, 1, NULL, 1, 1, 1, NULL, NULL, NULL, NULL),
(4, 'Panel 1', 'bqa-panel1-test@yopmail.com', '1234', '', '', 0, 0, NULL, NULL, NULL, '17001237', NULL, NULL, 1, NULL, 1, 1, 1, NULL, NULL, NULL, NULL),
(5, 'Panel 2', 'bqa-panel2-test@yopmail.com', '1234', '', '', 0, 0, NULL, NULL, NULL, '17001238', NULL, NULL, 1, NULL, 1, 1, 1, NULL, NULL, NULL, NULL),
(6, 'Panel 3', 'bqa-panel3-test@yopmail.com', '1234', '', '', 0, 0, NULL, NULL, NULL, '17001239', NULL, NULL, 1, NULL, 1, 1, 1, NULL, NULL, NULL, NULL),
(7, 'Panel 4', 'bqa-panel4-test@yopmail.com', '1234', '', '', 0, 0, NULL, NULL, NULL, '17001240', NULL, NULL, 1, NULL, 1, 1, 1, NULL, NULL, NULL, NULL),
(8, 'Institution', 'bqa-inst-test@yopmail.com', '1234', '', '', 0, 0, NULL, NULL, NULL, '17001241', NULL, NULL, 1, NULL, 1, 1, 1, NULL, NULL, NULL, NULL),
(9, 'Chief', 'bqa-chief-test@yopmail.com', '1234', '', '', 0, 0, NULL, NULL, NULL, '17001245', NULL, NULL, 1, NULL, 1, 0, 0, NULL, NULL, NULL, NULL),
(10, 'Director', 'bqa-director-test@yopmail.com', '1234', '', '', 0, 0, NULL, NULL, NULL, '17001255', NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_login_info`
--

DROP TABLE IF EXISTS `tbl_user_login_info`;
CREATE TABLE IF NOT EXISTS `tbl_user_login_info` (
  `login_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `user_type` smallint DEFAULT NULL,
  `sub_type` smallint DEFAULT NULL,
  `app_id` smallint NOT NULL,
  `otp` varchar(6) DEFAULT NULL,
  `otp_expiry_time` double DEFAULT NULL,
  `token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
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
  `il_user_type` smallint DEFAULT NULL,
  `il_sub_type` smallint DEFAULT NULL,
  `qp_user_type` smallint DEFAULT NULL,
  `qp_sub_type` smallint DEFAULT NULL,
  `fq_user_type` int DEFAULT NULL,
  `fq_sub_type` int DEFAULT NULL,
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

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD CONSTRAINT `fk_il_assigned_chief` FOREIGN KEY (`il_assigned_chief_id`) REFERENCES `tbl_user` (`user_id`),
  ADD CONSTRAINT `fk_qp_assigned_chief` FOREIGN KEY (`qp_assigned_chief_id`) REFERENCES `tbl_user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
