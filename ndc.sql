-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 02, 2013 at 02:22 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ndc`
--

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_actual_income_expense`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_actual_income_expense` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `total_expense` double NOT NULL,
  `total_income` double NOT NULL,
  `actual_advertising` double NOT NULL,
  `actual_athletics` double NOT NULL,
  `actual_auditing` double NOT NULL,
  `actual_consultancy` double NOT NULL,
  `actual_board_expenses` double NOT NULL,
  `actual_christmas_anniversary` double NOT NULL,
  `actual_communication_service` double NOT NULL,
  `actual_extraordinary` double NOT NULL,
  `actual_janitorial` double NOT NULL,
  `actual_legal` double NOT NULL,
  `actual_light_water` double NOT NULL,
  `actual_meetings` double NOT NULL,
  `actual_memberships` double NOT NULL,
  `actual_messengerial` double NOT NULL,
  `actual_misc` double NOT NULL,
  `actual_other_misc` double NOT NULL,
  `actual_rentals` double NOT NULL,
  `actual_repair_facilities` double NOT NULL,
  `actual_repair_vehicles` double NOT NULL,
  `actual_security` double NOT NULL,
  `actual_subscription` double NOT NULL,
  `actual_supplies_materials` double NOT NULL,
  `actual_taxes` double NOT NULL,
  `actual_training` double NOT NULL,
  `actual_travelling` double NOT NULL,
  `actual_donations` double NOT NULL,
  `actual_rewards` double NOT NULL,
  `actual_fidelity_and_insurance` double NOT NULL,
  `budget_advertising` double NOT NULL,
  `budget_athletics` double NOT NULL,
  `budget_auditing` double NOT NULL,
  `budget_consultancy` double NOT NULL,
  `budget_board_expenses` double NOT NULL,
  `budget_christmas_anniversary` double NOT NULL,
  `budget_communication_service` double NOT NULL,
  `budget_extraordinary` double NOT NULL,
  `budget_janitorial` double NOT NULL,
  `budget_legal` double NOT NULL,
  `budget_light_water` double NOT NULL,
  `budget_meetings` double NOT NULL,
  `budget_memberships` double NOT NULL,
  `budget_messengerial` double NOT NULL,
  `budget_misc` double NOT NULL,
  `budget_other_misc` double NOT NULL,
  `budget_rentals` double NOT NULL,
  `budget_repair_facilities` double NOT NULL,
  `budget_repair_vehicles` double NOT NULL,
  `budget_security` double NOT NULL,
  `budget_subscription` double NOT NULL,
  `budget_supplies_materials` double NOT NULL,
  `budget_taxes` double NOT NULL,
  `budget_training` double NOT NULL,
  `budget_travelling` double NOT NULL,
  `budget_donations` double NOT NULL,
  `budget_rewards` double NOT NULL,
  `budget_fidelity_and_insurance` double NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ndc_tbl_actual_income_expense`
--

INSERT INTO `ndc_tbl_actual_income_expense` (`id`, `year`, `month`, `total_expense`, `total_income`, `actual_advertising`, `actual_athletics`, `actual_auditing`, `actual_consultancy`, `actual_board_expenses`, `actual_christmas_anniversary`, `actual_communication_service`, `actual_extraordinary`, `actual_janitorial`, `actual_legal`, `actual_light_water`, `actual_meetings`, `actual_memberships`, `actual_messengerial`, `actual_misc`, `actual_other_misc`, `actual_rentals`, `actual_repair_facilities`, `actual_repair_vehicles`, `actual_security`, `actual_subscription`, `actual_supplies_materials`, `actual_taxes`, `actual_training`, `actual_travelling`, `actual_donations`, `actual_rewards`, `actual_fidelity_and_insurance`, `budget_advertising`, `budget_athletics`, `budget_auditing`, `budget_consultancy`, `budget_board_expenses`, `budget_christmas_anniversary`, `budget_communication_service`, `budget_extraordinary`, `budget_janitorial`, `budget_legal`, `budget_light_water`, `budget_meetings`, `budget_memberships`, `budget_messengerial`, `budget_misc`, `budget_other_misc`, `budget_rentals`, `budget_repair_facilities`, `budget_repair_vehicles`, `budget_security`, `budget_subscription`, `budget_supplies_materials`, `budget_taxes`, `budget_training`, `budget_travelling`, `budget_donations`, `budget_rewards`, `budget_fidelity_and_insurance`, `date_updated`, `updated_by`) VALUES
(1, 2012, 10, 93466800, 50558659, 66030, 200133, 2866670, 58498, 1884497, 819819, 1756313, 309948, 1489346, 1035124, 3316891, 2276426, 443792, 452008, 3330209, 760352, 1118766, 3163117, 939878, 10101552, 102948, 470904, 12405286, 600578, 589574, 0, 0, 0, 70000, 147000, 5679000, 190000, 3123800, 1082800, 2836000, 406000, 2253600, 1440400, 3758100, 3088000, 462300, 722200, 7432400, 1557900, 1377000, 3619600, 1316000, 15201800, 126700, 588000, 35919400, 441800, 627000, 0, 0, 0, '2013-05-16 14:02:29', 'lay'),
(2, 2013, 0, 8582500, 6784553.48, 0, 0, 321555.21, 0, 0, 0, 4831.41, 0, 0, 46050, 78945.54, 171847.42, 0, 0, 221309.64, 6839.55, 12000, 208114.1, 27817.19, 0, 17980, 74374.5, 5496739.52, 3600, 92549.4, 0, 0, 0, 44583.33, 24250, 414333.33, 344666.67, 52500, 281250, 117083.33, 33833.33, 185833.33, 92250, 353166.67, 293750, 45416.67, 65333.33, 1146750, 70166.67, 121500, 575666.67, 152000, 1366666.67, 13916.67, 50833.33, 2396166.67, 134750, 205833.33, 0, 0, 0, '2013-05-27 03:16:37', 'lay'),
(3, 2013, 1, 8582500, 2113248.61, 0, 0, 294759.64, 172580.64, 42489.72, 0, 80095.2, 0, 0, 123777.78, 278450.4, 231417.53, 18500, 0, 275572.93, 28511.39, 74757.54, 197888.77, 81173.96, 0, 8470, 44181.58, 33917.56, 24760.19, 101943.78, 0, 0, 0, 44583.33, 24250, 414333.33, 344666.67, 52500, 281250, 117083.33, 33833.33, 185833.33, 92250, 353166.67, 293750, 45416.67, 65333.33, 1146750, 70166.67, 121500, 575666.67, 152000, 1366666.67, 13916.67, 50833.33, 2396166.67, 134750, 205833.33, 0, 0, 0, '2013-05-27 03:23:06', 'lay'),
(4, 2013, 2, 8582500, 7359168.130000001, 22320, 0, 296041.42, 255555.55, 64.28, 270097.55, 79589.39, 0, 0, 45500, 362121.93, 407276.54, 87278.5, 0, 256309.89, 107581, 122005.35, -280062.05, 163906.42, 0, 7700, 28262.53, 5086722.07, 401.76, 40496, 0, 0, 0, 44583.33, 24250, 414333.33, 344666.67, 52500, 281250, 117083.33, 33833.33, 185833.33, 92250, 353166.67, 293750, 45416.67, 65333.33, 1146750, 70166.67, 121500, 575666.67, 152000, 1366666.67, 13916.67, 50833.33, 2396166.67, 134750, 205833.33, 0, 0, 0, '2013-05-27 03:27:16', 'lay'),
(5, 2013, 2, 8590833.34, 7359168.12, 22320, 0, 296041.42, 255555.54, 64.28, 270097.55, 79589.39, 0, 0, 45500, 362121.93, 407276.54, 87278.5, 0, 256309.89, 107581, 122005.35, -280062.05, 163906.42, 0, 7700, 28262.53, 5086722.07, 401.76, 40496, 0, 0, 0, 44583.33, 24250, 414333.33, 344666.67, 52500, 281250, 117083.33, 33833.33, 185833.33, 92250, 353166.67, 293750, 45416.67, 65333.33, 1146750, 70166.67, 121500, 575666.67, 152000, 1366666.67, 13916.67, 50833.33, 2396166.67, 134750, 205833.33, 4166.67, 4166.67, 0, '2013-05-28 05:22:57', 'lay'),
(6, 2013, 3, 8590833.34, 5174223.01, 58140, 147.33, 357798.07, 227777.77, 0, 39313.93, 101651.68, 0, 143106.74, 84988.89, 409715.58, 191036.42, 25237, 52410.04, 260546.8, 54110.21, 96820.51, 97141.03, 67036.48, 2451823.3, 7315, 58632.4, 265360.07, 45322.25, 78791.51, 0, 0, 0, 44583.33, 24250, 414333.33, 344666.67, 52500, 281250, 117083.33, 33833.33, 185833.33, 92250, 353166.67, 293750, 45416.67, 65333.33, 1146750, 70166.67, 121500, 575666.67, 152000, 1366666.67, 13916.67, 50833.33, 2396166.67, 134750, 205833.33, 4166.67, 4166.67, 0, '2013-05-28 05:27:57', 'lay');

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_agri_agra_bonds`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_agri_agra_bonds` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `total` double NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ndc_tbl_agri_agra_bonds`
--

INSERT INTO `ndc_tbl_agri_agra_bonds` (`id`, `amount`, `total`, `date_updated`, `updated_by`, `year`) VALUES
(2, 5000000000, 50000000000, '2013-05-06 04:33:39', 'lemuel', 1999),
(3, 2000000000, 50000000000, '2013-05-06 04:34:08', 'lemuel', 2002),
(4, 2000000000, 50000000000, '2013-05-06 04:34:26', 'lemuel', 2006),
(5, 3500000000, 50000000000, '2013-05-06 04:34:56', 'lemuel', 2009);

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_balance_sheet`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_balance_sheet` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `total_assets` double NOT NULL,
  `total_liabilities` double NOT NULL,
  `total_equity` double NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ndc_tbl_balance_sheet`
--

INSERT INTO `ndc_tbl_balance_sheet` (`id`, `total_assets`, `total_liabilities`, `total_equity`, `date_updated`, `updated_by`, `year`) VALUES
(1, 11549591617, 9372637392, 2176954225, '2013-04-15 02:27:06', 'lay', 2009),
(2, 10544324410, 9466392392, 1077932018, '2013-04-15 02:27:06', 'lay', 2010),
(3, 10041971320, 8592840345, 1449130975, '2013-04-15 02:27:06', 'lay', 2011);

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_bonds_issued`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_bonds_issued` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `year` int(11) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ndc_tbl_bonds_issued`
--

INSERT INTO `ndc_tbl_bonds_issued` (`id`, `amount`, `year`, `date_updated`, `updated_by`) VALUES
(2, 5000000000, 1999, '2013-05-06 03:22:52', 'lemuel'),
(3, 2000000000, 2002, '2013-05-06 03:17:21', 'lemuel'),
(4, 2000000000, 2006, '2013-05-06 03:17:32', 'lemuel'),
(5, 3500000000, 2009, '2013-05-06 03:17:46', 'lemuel');

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_bond_maturity`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_bond_maturity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount_issued` double NOT NULL,
  `bond_payment` double NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ndc_tbl_bond_maturity`
--

INSERT INTO `ndc_tbl_bond_maturity` (`id`, `amount_issued`, `bond_payment`, `date_updated`, `updated_by`, `year`) VALUES
(1, 5000000000, 5, '2013-05-08 02:52:27', 'lemuel', 1999),
(2, 2000000000, 7, '2013-05-08 02:52:53', 'lemuel', 2002),
(3, 2000000000, 5, '2013-05-08 02:53:15', 'lemuel', 2006),
(4, 3500000000, 5, '2013-05-08 02:53:37', 'lemuel', 2009);

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_budget_utilization`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_budget_utilization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `actual_personal_services` double NOT NULL,
  `budget_personal_services` double NOT NULL,
  `actual_MOOE` double NOT NULL,
  `budget_MOOE` double NOT NULL,
  `actual_capital_expenditures` double NOT NULL,
  `budget_capital_expenditures` double NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_capital_expenditures`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_capital_expenditures` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL,
  `budget_capital_expenditures` double NOT NULL,
  `actual_capital_expenditures` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ndc_tbl_capital_expenditures`
--

INSERT INTO `ndc_tbl_capital_expenditures` (`id`, `month`, `year`, `date_updated`, `updated_by`, `budget_capital_expenditures`, `actual_capital_expenditures`) VALUES
(1, 10, 2012, '2013-05-08 02:34:42', 'lay', 12920000, 1055937),
(2, 2, 2013, '2013-05-27 02:59:24', 'lay', 13498000, 180512.08),
(3, 2, 2013, '2013-05-27 03:01:40', 'lay', 13498000, 14000000),
(4, 2, 2013, '2013-05-27 03:04:00', 'lay', 13498000, 180512.08),
(5, 3, 2013, '2013-05-28 05:17:06', 'lay', 13498000, 270422.79);

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_collection_efficiency`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_collection_efficiency` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `current_amount_collected` double NOT NULL,
  `current_amount_billed` double NOT NULL,
  `past_due_amount_collected` double NOT NULL,
  `past_due_amount_billed` double NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ndc_tbl_collection_efficiency`
--

INSERT INTO `ndc_tbl_collection_efficiency` (`id`, `month`, `year`, `current_amount_collected`, `current_amount_billed`, `past_due_amount_collected`, `past_due_amount_billed`, `date_updated`, `updated_by`) VALUES
(2, 3, 2013, 14135265.46, 20085290.22, 5524256.11, 91649227.49, '2013-05-27 02:51:38', 'lay'),
(6, 6, 2013, 50000000, 50000000, 50000000, 50000000, '2013-07-26 04:49:49', 'lay');

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_customer_feedback`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_customer_feedback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `p1q1` text NOT NULL,
  `p1q2` text NOT NULL,
  `p1q3` text NOT NULL,
  `p1q4` text NOT NULL,
  `p1q5` text NOT NULL,
  `p1q6` text NOT NULL,
  `p1q7` text NOT NULL,
  `p1q8` text NOT NULL,
  `p1q9` text NOT NULL,
  `p1q10` text NOT NULL,
  `p1q11` text NOT NULL,
  `p2q1` text NOT NULL,
  `p2q2` text NOT NULL,
  `p2q3` text NOT NULL,
  `p2q4` text NOT NULL,
  `p2q5` text NOT NULL,
  `p2q6` text NOT NULL,
  `p2q7` text NOT NULL,
  `p2q8` text NOT NULL,
  `p2q9` text NOT NULL,
  `p2q10` text NOT NULL,
  `p2q11` text NOT NULL,
  `p2q12` text NOT NULL,
  `p2q13` text NOT NULL,
  `p2q14` text NOT NULL,
  `p2q15` text NOT NULL,
  `name_of_respondent` varchar(255) NOT NULL,
  `organization_name` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `date_submitted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_economic_impact`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_economic_impact` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rehabilitated` double NOT NULL,
  `restored` double NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ndc_tbl_economic_impact`
--

INSERT INTO `ndc_tbl_economic_impact` (`id`, `rehabilitated`, `restored`, `date_updated`, `updated_by`) VALUES
(1, 194391, 92463, '2013-04-15 02:28:45', 'lemuel');

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_income_statement`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_income_statement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `operating_income` double NOT NULL,
  `dividend` double NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ndc_tbl_income_statement`
--

INSERT INTO `ndc_tbl_income_statement` (`id`, `operating_income`, `dividend`, `updated_by`, `date_updated`, `year`) VALUES
(1, 574979228, 50000000, 'lay', '2013-04-15 02:29:05', 2009),
(2, 742279949, 50000000, 'lay', '2013-04-15 02:29:05', 2010),
(3, 856681498, 100000000, 'lay', '2013-04-15 02:29:05', 2011);

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_logs`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logged_by` varchar(100) NOT NULL,
  `access_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

--
-- Dumping data for table `ndc_tbl_logs`
--

INSERT INTO `ndc_tbl_logs` (`id`, `logged_by`, `access_time`, `description`) VALUES
(1, 'jonathan', '2013-05-27 00:33:22', 'ERROR WHILE DISPLAYING BAR LINE CHART'),
(2, 'lemuel', '2013-05-27 01:35:27', 'ADDED NEW PDST-F RATES'),
(3, 'lemuel', '2013-05-27 01:40:41', 'ADDED NEW PDST-F RATES'),
(4, 'lemuel', '2013-05-27 01:46:22', 'ADDED NEW PDST-F RATES'),
(5, 'lay', '2013-05-27 02:45:56', 'ADDED NEW PROJECTED INCOME'),
(6, 'lay', '2013-05-27 02:48:24', 'ADDED NEW PROJECTED ACTUAL INCOME'),
(7, 'lay', '2013-05-27 02:48:42', 'ADDED NEW PROJECTED ACTUAL INCOME'),
(8, 'lay', '2013-05-27 02:51:38', 'ADDED NEW COLLECTION EFFICIENCY'),
(9, 'lay', '2013-05-27 02:56:21', 'ADDED NEW BUDGET UTILIZATION (PERSONAL SERVICES)'),
(10, 'lay', '2013-05-27 02:58:42', 'ADDED NEW BUDGET UTILIZATION (MAINTENANCE & OTHER OPERATING EXPENSES)'),
(11, 'lay', '2013-05-27 02:59:24', 'ADDED NEW BUDGET UTILIZATION (CAPITAL EXPENDITURES)'),
(12, 'lay', '2013-05-27 03:01:43', 'ADDED NEW BUDGET UTILIZATION (CAPITAL EXPENDITURES)'),
(13, 'lay', '2013-05-27 03:04:01', 'ADDED NEW BUDGET UTILIZATION (CAPITAL EXPENDITURES)'),
(14, 'lay', '2013-05-27 03:16:37', 'ADDED NEW ACTUAL INCOME EXPENSE'),
(15, 'lay', '2013-05-27 03:23:06', 'ADDED NEW ACTUAL INCOME EXPENSE'),
(16, 'lay', '2013-05-27 03:27:16', 'ADDED NEW ACTUAL INCOME EXPENSE'),
(17, 'colette', '2013-05-28 01:49:24', 'DEACTIVATED USERS WITH ID: 3 '),
(18, 'colette', '2013-05-28 01:49:39', 'ACTIVATED USERS WITH ID: 3 '),
(19, 'lay', '2013-05-28 05:14:25', 'ADDED NEW PROJECTED ACTUAL INCOME'),
(20, 'lay', '2013-05-28 05:16:02', 'ADDED NEW BUDGET UTILIZATION (PERSONAL SERVICES)'),
(21, 'lay', '2013-05-28 05:16:42', 'ADDED NEW BUDGET UTILIZATION (MAINTENANCE & OTHER OPERATING EXPENSES)'),
(22, 'lay', '2013-05-28 05:17:06', 'ADDED NEW BUDGET UTILIZATION (CAPITAL EXPENDITURES)'),
(23, 'lay', '2013-05-28 05:22:57', 'ADDED NEW ACTUAL INCOME EXPENSE'),
(24, 'lay', '2013-05-28 05:27:58', 'ADDED NEW ACTUAL INCOME EXPENSE'),
(25, 'lay', '2013-05-28 06:33:06', 'ADDED NEW COLLECTION EFFICIENCY'),
(26, 'NDC User', '2013-05-30 03:11:44', 'ERROR WHILE DISPLAYING BAR CHART FOR NIA Loan Collection'),
(27, 'NDC User', '2013-05-30 03:11:44', 'ERROR WHILE DISPLAYING BUDGET UTILIZATION CHART'),
(28, 'NDC User', '2013-05-30 03:11:44', 'ERROR WHILE DISPLAYING COLLECTION EFFICIENCY CHART'),
(29, 'NDC User', '2013-05-30 03:11:44', 'ERROR WHILE DISPLAYING PROJECTED ACTUAL INCOME SUB CHART'),
(30, 'NDC User', '2013-05-30 03:11:44', 'ERROR WHILE DISPLAYING BAR CHART'),
(31, 'anonymousUser', '2013-06-03 03:15:25', 'ERROR WHILE DISPLAYING BAR CHART'),
(32, 'anonymousUser', '2013-06-03 03:15:25', 'ERROR WHILE DISPLAYING STOCK AREA CHART'),
(33, 'anonymousUser', '2013-06-03 03:15:25', 'ERROR WHILE DISPLAYING PROJECTED ACTUAL INCOME SUB CHART'),
(34, 'jonathan', '2013-06-03 08:04:15', 'UPLOADED NEW DOCUMENT ''1368656907349.pdf'''),
(35, 'randy', '2013-06-06 05:02:01', 'ADDED NEW STATUS OF ASSETS'),
(36, 'lay', '2013-07-26 04:37:52', 'ADDED NEW COLLECTION EFFICIENCY'),
(37, 'lay', '2013-07-26 04:46:48', 'ADDED NEW COLLECTION EFFICIENCY'),
(38, 'lay', '2013-07-26 04:48:19', 'ADDED NEW COLLECTION EFFICIENCY'),
(39, 'lay', '2013-07-26 04:49:49', 'ADDED NEW COLLECTION EFFICIENCY');

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_maintenance_cost`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_maintenance_cost` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `market_value` double NOT NULL,
  `rpt` double NOT NULL,
  `duesfees` double NOT NULL,
  `security` double NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ndc_tbl_maintenance_cost`
--

INSERT INTO `ndc_tbl_maintenance_cost` (`id`, `market_value`, `rpt`, `duesfees`, `security`, `date_updated`, `updated_by`, `year`) VALUES
(2, 114739653.74, 13334094.71, 3450542.38, 11919371.82, '2013-05-29 05:14:43', 'randy', 2010),
(3, 116955865.74, 10807097.58, 3450542.38, 12837697.35, '2013-05-29 05:15:03', 'randy', 2011),
(4, 97196201.31, 11485082.3, 3504290.38, 13561938.53, '2013-05-29 05:15:25', 'randy', 2012);

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_mooe`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_mooe` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL,
  `budget_mooe` double NOT NULL,
  `actual_mooe` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ndc_tbl_mooe`
--

INSERT INTO `ndc_tbl_mooe` (`id`, `month`, `year`, `date_updated`, `updated_by`, `budget_mooe`, `actual_mooe`) VALUES
(1, 10, 2012, '2013-05-08 02:33:32', 'lay', 93466800, 50558659),
(2, 2, 2013, '2013-05-27 02:58:42', 'lay', 103090000, 16256970.21),
(3, 3, 2013, '2013-05-28 05:16:42', 'lay', 103090000, 21431193.22);

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_net_lending`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_net_lending` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bond_issued` double NOT NULL,
  `bond_net_lending` double NOT NULL,
  `coupon` double NOT NULL,
  `coupon_net_lending` double NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ndc_tbl_net_lending`
--

INSERT INTO `ndc_tbl_net_lending` (`id`, `bond_issued`, `bond_net_lending`, `coupon`, `coupon_net_lending`, `date_updated`, `updated_by`, `year`) VALUES
(1, 5000000000, 0, 1968750000, 0, '2013-05-06 04:20:15', 'lemuel', 1999),
(2, 2000000000, 0, 962500000, 58750000, '2013-05-06 04:21:14', 'lemuel', 2002),
(3, 2000000000, 1375000000, 587500000, 182468126.64, '2013-05-06 04:22:14', 'lemuel', 2006),
(4, 3500000000, 0, 896875000, 538125000, '2013-05-06 04:22:52', 'lemuel', 2009);

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_nia_loan_collections`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_nia_loan_collections` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `principal_loan_receivable` double NOT NULL,
  `principal_collection` double NOT NULL,
  `interest_loan_receivable` double NOT NULL,
  `interest_collection` double NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ndc_tbl_nia_loan_collections`
--

INSERT INTO `ndc_tbl_nia_loan_collections` (`id`, `principal_loan_receivable`, `principal_collection`, `interest_loan_receivable`, `interest_collection`, `date_updated`, `updated_by`) VALUES
(1, 5500000000, 624999500, 2306408436.27, 400607527, '2013-04-15 02:30:10', 'lemuel');

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_nia_loan_proceeds_allocation`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_nia_loan_proceeds_allocation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `car` double NOT NULL,
  `region_1` double NOT NULL,
  `ariip` double NOT NULL,
  `region_2` double NOT NULL,
  `mariis` double NOT NULL,
  `region_3` double NOT NULL,
  `upriis` double NOT NULL,
  `region_4` double NOT NULL,
  `region_5` double NOT NULL,
  `region_6` double NOT NULL,
  `region_7` double NOT NULL,
  `region_8` double NOT NULL,
  `region_9` double NOT NULL,
  `region_10` double NOT NULL,
  `region_11` double NOT NULL,
  `region_12` double NOT NULL,
  `region_13` double NOT NULL,
  `armm` double NOT NULL,
  `ncr` double NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ndc_tbl_nia_loan_proceeds_allocation`
--

INSERT INTO `ndc_tbl_nia_loan_proceeds_allocation` (`id`, `car`, `region_1`, `ariip`, `region_2`, `mariis`, `region_3`, `upriis`, `region_4`, `region_5`, `region_6`, `region_7`, `region_8`, `region_9`, `region_10`, `region_11`, `region_12`, `region_13`, `armm`, `ncr`, `date_updated`, `updated_by`) VALUES
(1, 175150000, 328949999.55, 635000000, 551909988, 227000000, 462500000, 181000000, 524200000, 532925000, 188250000, 183300000, 344593227, 121925000, 182000000, 94200000, 243500000, 231900000, 76000000, 15975000, '2013-04-15 02:30:24', 'lemuel');

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_nia_loan_proceeds_utilization`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_nia_loan_proceeds_utilization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repair_rehab_restore` double NOT NULL,
  `farm_to_market_roads` double NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ndc_tbl_nia_loan_proceeds_utilization`
--

INSERT INTO `ndc_tbl_nia_loan_proceeds_utilization` (`id`, `repair_rehab_restore`, `farm_to_market_roads`, `date_updated`, `updated_by`) VALUES
(1, 4828164268.55, 497368227, '2013-04-15 02:30:31', 'lemuel');

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_notifications`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_notifications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `ndc_group` varchar(255) NOT NULL,
  `date_notified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `triggered_by` varchar(255) NOT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=120 ;

--
-- Dumping data for table `ndc_tbl_notifications`
--

INSERT INTO `ndc_tbl_notifications` (`id`, `user_id`, `message`, `ndc_group`, `date_notified`, `triggered_by`, `visible`) VALUES
(1, 3, 'Updated ''PDST-F Rates''', 'FMG', '2013-05-28 02:08:01', 'lemuel', 0),
(2, 4, 'Updated ''PDST-F Rates''', 'FMG', '2013-05-27 01:35:27', 'lemuel', 1),
(3, 5, 'Updated ''PDST-F Rates''', 'FMG', '2013-05-27 01:35:27', 'lemuel', 1),
(4, 6, 'Updated ''PDST-F Rates''', 'FMG', '2013-05-27 01:35:27', 'lemuel', 1),
(5, 3, 'Updated ''PDST-F Rates''', 'FMG', '2013-05-28 02:08:01', 'lemuel', 0),
(6, 4, 'Updated ''PDST-F Rates''', 'FMG', '2013-05-27 01:40:41', 'lemuel', 1),
(7, 5, 'Updated ''PDST-F Rates''', 'FMG', '2013-05-27 01:40:42', 'lemuel', 1),
(8, 6, 'Updated ''PDST-F Rates''', 'FMG', '2013-05-27 01:40:42', 'lemuel', 1),
(9, 3, 'Updated ''PDST-F Rates''', 'FMG', '2013-05-28 02:08:01', 'lemuel', 0),
(10, 4, 'Updated ''PDST-F Rates''', 'FMG', '2013-05-27 01:46:22', 'lemuel', 1),
(11, 5, 'Updated ''PDST-F Rates''', 'FMG', '2013-05-27 01:46:22', 'lemuel', 1),
(12, 6, 'Updated ''PDST-F Rates''', 'FMG', '2013-05-27 01:46:22', 'lemuel', 1),
(13, 3, 'Updated ''Projected Income''', 'FAD', '2013-05-28 02:08:00', 'lay', 0),
(14, 4, 'Updated ''Projected Income''', 'FAD', '2013-05-27 02:45:56', 'lay', 1),
(15, 5, 'Updated ''Projected Income''', 'FAD', '2013-05-27 02:45:56', 'lay', 1),
(16, 6, 'Updated ''Projected Income''', 'FAD', '2013-05-27 02:45:56', 'lay', 1),
(17, 3, 'Updated ''Projected Actual Income''', 'FAD', '2013-05-28 02:08:00', 'lay', 0),
(18, 4, 'Updated ''Projected Actual Income''', 'FAD', '2013-05-27 02:48:24', 'lay', 1),
(19, 5, 'Updated ''Projected Actual Income''', 'FAD', '2013-05-27 02:48:24', 'lay', 1),
(20, 6, 'Updated ''Projected Actual Income''', 'FAD', '2013-05-27 02:48:24', 'lay', 1),
(21, 3, 'Updated ''Projected Actual Income''', 'FAD', '2013-05-28 02:08:00', 'lay', 0),
(22, 4, 'Updated ''Projected Actual Income''', 'FAD', '2013-05-27 02:48:43', 'lay', 1),
(23, 5, 'Updated ''Projected Actual Income''', 'FAD', '2013-05-27 02:48:43', 'lay', 1),
(24, 6, 'Updated ''Projected Actual Income''', 'FAD', '2013-05-27 02:48:43', 'lay', 1),
(25, 3, 'Updated ''Collection Efficiency''', 'FAD', '2013-05-28 02:08:00', 'lay', 0),
(26, 4, 'Updated ''Collection Efficiency''', 'FAD', '2013-05-27 02:51:38', 'lay', 1),
(27, 5, 'Updated ''Collection Efficiency''', 'FAD', '2013-05-27 02:51:38', 'lay', 1),
(28, 6, 'Updated ''Collection Efficiency''', 'FAD', '2013-05-27 02:51:39', 'lay', 1),
(29, 3, 'Updated ''Budget Utilization (Personal Services)''', 'FAD', '2013-05-28 02:08:00', 'lay', 0),
(30, 4, 'Updated ''Budget Utilization (Personal Services)''', 'FAD', '2013-05-27 02:56:21', 'lay', 1),
(31, 5, 'Updated ''Budget Utilization (Personal Services)''', 'FAD', '2013-05-27 02:56:21', 'lay', 1),
(32, 6, 'Updated ''Budget Utilization (Personal Services)''', 'FAD', '2013-05-27 02:56:21', 'lay', 1),
(33, 3, 'Updated ''Budget Utilization (Maintenance & Other Operating Expenses)''', 'FAD', '2013-05-28 02:08:00', 'lay', 0),
(34, 4, 'Updated ''Budget Utilization (Maintenance & Other Operating Expenses)''', 'FAD', '2013-05-27 02:58:42', 'lay', 1),
(35, 5, 'Updated ''Budget Utilization (Maintenance & Other Operating Expenses)''', 'FAD', '2013-05-27 02:58:42', 'lay', 1),
(36, 6, 'Updated ''Budget Utilization (Maintenance & Other Operating Expenses)''', 'FAD', '2013-05-27 02:58:42', 'lay', 1),
(37, 3, 'Updated ''Budget Utilization (Capital Expenditures)''', 'FAD', '2013-05-28 02:08:00', 'lay', 0),
(38, 4, 'Updated ''Budget Utilization (Capital Expenditures)''', 'FAD', '2013-05-27 02:59:24', 'lay', 1),
(39, 5, 'Updated ''Budget Utilization (Capital Expenditures)''', 'FAD', '2013-05-27 02:59:24', 'lay', 1),
(40, 6, 'Updated ''Budget Utilization (Capital Expenditures)''', 'FAD', '2013-05-27 02:59:24', 'lay', 1),
(41, 3, 'Updated ''Budget Utilization (Capital Expenditures)''', 'FAD', '2013-05-28 02:08:00', 'lay', 0),
(42, 4, 'Updated ''Budget Utilization (Capital Expenditures)''', 'FAD', '2013-05-27 03:01:46', 'lay', 1),
(43, 5, 'Updated ''Budget Utilization (Capital Expenditures)''', 'FAD', '2013-05-27 03:01:46', 'lay', 1),
(44, 6, 'Updated ''Budget Utilization (Capital Expenditures)''', 'FAD', '2013-05-27 03:01:46', 'lay', 1),
(45, 3, 'Updated ''Budget Utilization (Capital Expenditures)''', 'FAD', '2013-05-28 02:08:00', 'lay', 0),
(46, 4, 'Updated ''Budget Utilization (Capital Expenditures)''', 'FAD', '2013-05-27 03:04:01', 'lay', 1),
(47, 5, 'Updated ''Budget Utilization (Capital Expenditures)''', 'FAD', '2013-05-27 03:04:01', 'lay', 1),
(48, 6, 'Updated ''Budget Utilization (Capital Expenditures)''', 'FAD', '2013-05-27 03:04:01', 'lay', 1),
(49, 3, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-28 02:08:00', 'lay', 0),
(50, 4, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-27 03:16:37', 'lay', 1),
(51, 5, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-27 03:16:37', 'lay', 1),
(52, 6, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-27 03:16:37', 'lay', 1),
(53, 3, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-28 02:08:00', 'lay', 0),
(54, 4, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-27 03:23:06', 'lay', 1),
(55, 5, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-27 03:23:06', 'lay', 1),
(56, 6, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-27 03:23:06', 'lay', 1),
(57, 3, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-28 02:08:00', 'lay', 0),
(58, 4, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-27 03:27:16', 'lay', 1),
(59, 5, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-27 03:27:16', 'lay', 1),
(60, 6, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-27 03:27:16', 'lay', 1),
(61, 1, 'Updated ''Projected Actual Income''', 'FAD', '2013-05-30 03:12:47', 'lay', 0),
(62, 3, 'Updated ''Projected Actual Income''', 'FAD', '2013-06-03 07:09:48', 'lay', 0),
(63, 4, 'Updated ''Projected Actual Income''', 'FAD', '2013-05-28 05:14:25', 'lay', 1),
(64, 5, 'Updated ''Projected Actual Income''', 'FAD', '2013-05-28 05:14:25', 'lay', 1),
(65, 6, 'Updated ''Projected Actual Income''', 'FAD', '2013-05-28 05:14:25', 'lay', 1),
(66, 1, 'Updated ''Budget Utilization (Personal Services)''', 'FAD', '2013-05-30 03:12:47', 'lay', 0),
(67, 3, 'Updated ''Budget Utilization (Personal Services)''', 'FAD', '2013-06-03 07:09:48', 'lay', 0),
(68, 4, 'Updated ''Budget Utilization (Personal Services)''', 'FAD', '2013-05-28 05:16:03', 'lay', 1),
(69, 5, 'Updated ''Budget Utilization (Personal Services)''', 'FAD', '2013-05-28 05:16:03', 'lay', 1),
(70, 6, 'Updated ''Budget Utilization (Personal Services)''', 'FAD', '2013-05-28 05:16:03', 'lay', 1),
(71, 1, 'Updated ''Budget Utilization (Maintenance & Other Operating Expenses)''', 'FAD', '2013-05-30 03:12:47', 'lay', 0),
(72, 3, 'Updated ''Budget Utilization (Maintenance & Other Operating Expenses)''', 'FAD', '2013-06-03 07:09:48', 'lay', 0),
(73, 4, 'Updated ''Budget Utilization (Maintenance & Other Operating Expenses)''', 'FAD', '2013-05-28 05:16:43', 'lay', 1),
(74, 5, 'Updated ''Budget Utilization (Maintenance & Other Operating Expenses)''', 'FAD', '2013-05-28 05:16:43', 'lay', 1),
(75, 6, 'Updated ''Budget Utilization (Maintenance & Other Operating Expenses)''', 'FAD', '2013-05-28 05:16:43', 'lay', 1),
(76, 1, 'Updated ''Budget Utilization (Capital Expenditures)''', 'FAD', '2013-05-30 03:12:47', 'lay', 0),
(77, 3, 'Updated ''Budget Utilization (Capital Expenditures)''', 'FAD', '2013-06-03 07:09:48', 'lay', 0),
(78, 4, 'Updated ''Budget Utilization (Capital Expenditures)''', 'FAD', '2013-05-28 05:17:06', 'lay', 1),
(79, 5, 'Updated ''Budget Utilization (Capital Expenditures)''', 'FAD', '2013-05-28 05:17:06', 'lay', 1),
(80, 6, 'Updated ''Budget Utilization (Capital Expenditures)''', 'FAD', '2013-05-28 05:17:06', 'lay', 1),
(81, 1, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-30 03:12:47', 'lay', 0),
(82, 3, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-06-03 07:09:48', 'lay', 0),
(83, 4, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-28 05:22:57', 'lay', 1),
(84, 5, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-28 05:22:57', 'lay', 1),
(85, 6, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-28 05:22:57', 'lay', 1),
(86, 1, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-30 03:12:47', 'lay', 0),
(87, 3, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-06-03 07:09:48', 'lay', 0),
(88, 4, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-28 05:27:58', 'lay', 1),
(89, 5, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-28 05:27:58', 'lay', 1),
(90, 6, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-28 05:27:59', 'lay', 1),
(91, 1, 'Updated ''Collection Efficiency''', 'FAD', '2013-05-30 03:12:47', 'lay', 0),
(92, 3, 'Updated ''Collection Efficiency''', 'FAD', '2013-06-03 07:09:48', 'lay', 0),
(93, 4, 'Updated ''Collection Efficiency''', 'FAD', '2013-05-28 06:33:06', 'lay', 1),
(94, 5, 'Updated ''Collection Efficiency''', 'FAD', '2013-05-28 06:33:06', 'lay', 1),
(95, 6, 'Updated ''Collection Efficiency''', 'FAD', '2013-05-28 06:33:06', 'lay', 1),
(96, 3, 'Updated New Document <a target=''_blank'' href=''/NDC/download/ASEAN/1368656907349.pdf''> 1368656907349.pdf </a>', 'SPG', '2013-06-03 08:04:15', 'jonathan', 1),
(97, 4, 'Updated New Document <a target=''_blank'' href=''/NDC/download/ASEAN/1368656907349.pdf''> 1368656907349.pdf </a>', 'SPG', '2013-06-03 08:04:15', 'jonathan', 1),
(98, 5, 'Updated New Document <a target=''_blank'' href=''/NDC/download/ASEAN/1368656907349.pdf''> 1368656907349.pdf </a>', 'SPG', '2013-06-03 08:04:15', 'jonathan', 1),
(99, 6, 'Updated New Document <a target=''_blank'' href=''/NDC/download/ASEAN/1368656907349.pdf''> 1368656907349.pdf </a>', 'SPG', '2013-06-03 08:04:15', 'jonathan', 1),
(100, 3, 'Updated ''Status of Assets''', 'AMG', '2013-06-06 05:02:01', 'randy', 1),
(101, 4, 'Updated ''Status of Assets''', 'AMG', '2013-06-06 05:02:01', 'randy', 1),
(102, 5, 'Updated ''Status of Assets''', 'AMG', '2013-06-06 05:02:01', 'randy', 1),
(103, 6, 'Updated ''Status of Assets''', 'AMG', '2013-06-06 05:02:01', 'randy', 1),
(104, 3, 'Updated ''Collection Efficiency''', 'FAD', '2013-07-26 04:37:52', 'lay', 1),
(105, 4, 'Updated ''Collection Efficiency''', 'FAD', '2013-07-26 04:37:52', 'lay', 1),
(106, 5, 'Updated ''Collection Efficiency''', 'FAD', '2013-07-26 04:37:52', 'lay', 1),
(107, 6, 'Updated ''Collection Efficiency''', 'FAD', '2013-07-26 04:37:52', 'lay', 1),
(108, 3, 'Updated ''Collection Efficiency''', 'FAD', '2013-07-26 04:46:49', 'lay', 1),
(109, 4, 'Updated ''Collection Efficiency''', 'FAD', '2013-07-26 04:46:49', 'lay', 1),
(110, 5, 'Updated ''Collection Efficiency''', 'FAD', '2013-07-26 04:46:49', 'lay', 1),
(111, 6, 'Updated ''Collection Efficiency''', 'FAD', '2013-07-26 04:46:49', 'lay', 1),
(112, 3, 'Updated ''Collection Efficiency''', 'FAD', '2013-07-26 04:48:19', 'lay', 1),
(113, 4, 'Updated ''Collection Efficiency''', 'FAD', '2013-07-26 04:48:19', 'lay', 1),
(114, 5, 'Updated ''Collection Efficiency''', 'FAD', '2013-07-26 04:48:19', 'lay', 1),
(115, 6, 'Updated ''Collection Efficiency''', 'FAD', '2013-07-26 04:48:19', 'lay', 1),
(116, 3, 'Updated ''Collection Efficiency''', 'FAD', '2013-07-26 04:49:49', 'lay', 1),
(117, 4, 'Updated ''Collection Efficiency''', 'FAD', '2013-07-26 04:49:49', 'lay', 1),
(118, 5, 'Updated ''Collection Efficiency''', 'FAD', '2013-07-26 04:49:49', 'lay', 1),
(119, 6, 'Updated ''Collection Efficiency''', 'FAD', '2013-07-26 04:49:49', 'lay', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_occupancy`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_occupancy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `occupied` bigint(20) NOT NULL,
  `vacant` bigint(20) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ndc_tbl_occupancy`
--

INSERT INTO `ndc_tbl_occupancy` (`id`, `occupied`, `vacant`, `date_updated`, `updated_by`) VALUES
(1, 17, 2, '2013-05-08 01:53:26', 'randy');

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_options`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_options` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `email_subject` varchar(255) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ndc_tbl_options`
--

INSERT INTO `ndc_tbl_options` (`id`, `email`, `email_subject`, `date_updated`, `updated_by`) VALUES
(1, 'mchavez@egg.ph', 'Customer Feedback', '2013-04-29 02:38:34', 'mlfr'),
(2, 'mchavez@egg.ph', 'Customer Feedback', '2013-05-03 05:23:49', 'mlfr');

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_particulars`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_particulars` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=65 ;

--
-- Dumping data for table `ndc_tbl_particulars`
--

INSERT INTO `ndc_tbl_particulars` (`id`, `name`, `date_updated`, `updated_by`) VALUES
(1, 'Philippines', '2013-04-15 02:32:12', 'jonathan'),
(2, 'Malaysia', '2013-04-15 02:32:12', 'jonathan'),
(3, 'Indonesia', '2013-04-15 02:32:12', 'jonathan'),
(4, 'Thailand', '2013-04-15 02:32:12', 'jonathan'),
(5, 'Singapore', '2013-04-15 02:32:12', 'jonathan'),
(6, 'Brunei', '2013-04-15 02:32:12', 'jonathan'),
(7, 'NRDC', '2013-04-15 02:32:12', 'jonathan'),
(8, 'DMCI Holdings, Incorporated', '2013-04-15 02:32:12', 'jonathan'),
(9, 'PCD Nominee Corporation (NF)', '2013-04-15 02:32:12', 'jonathan'),
(10, 'Dacon Corporation', '2013-04-15 02:32:12', 'jonathan'),
(11, 'National Development Company', '2013-04-15 02:32:12', 'jonathan'),
(12, 'Bronzeoak Philippines, Inc.', '2013-04-15 02:32:12', 'jonathan'),
(13, 'Bronzeoak Clean Energy, Inc.', '2013-04-15 02:32:12', 'jonathan'),
(14, 'Valmayor Venture, Inc.', '2013-04-15 02:32:12', 'jonathan'),
(15, 'San Julio Realty, Inc.', '2013-04-15 02:32:12', 'jonathan'),
(16, 'MA Jimenez, Inc.', '2013-04-15 02:32:12', 'jonathan'),
(17, 'Philippine Clean Energy', '2013-04-15 02:32:12', 'jonathan'),
(18, 'Bronzeoak Investment Holdings, Inc.', '2013-04-15 02:32:12', 'jonathan'),
(19, 'Manila Clean Energy', '2013-04-15 02:32:12', 'jonathan'),
(20, 'RCP Holdings, Inc.', '2013-04-15 02:32:12', 'jonathan'),
(21, 'Alsons Devt & Investment Corp.', '2013-04-15 02:32:12', 'jonathan'),
(22, 'Toyota Tsusho Corporations', '2013-04-15 02:32:12', 'jonathan'),
(23, 'Mino Yogyo Co., Ltd.', '2013-04-15 02:32:12', 'jonathan'),
(24, 'Philippine Exporters Confederation, Inc.', '2013-04-15 02:32:12', 'jonathan'),
(25, 'MEDCO Holdings, Inc.', '2013-04-15 02:32:12', 'jonathan'),
(26, 'Science Park of the Philippines, Inc.', '2013-04-15 02:32:12', 'jonathan'),
(27, 'World Trade Center Management, Inc.', '2013-04-15 02:32:12', 'jonathan'),
(28, 'The Philippine American Life and General Insurance Company', '2013-04-15 02:32:12', 'jonathan'),
(29, 'BOD', '2013-04-15 02:32:12', 'jonathan'),
(30, 'ICCP Holdings Corp.', '2013-04-15 02:32:12', 'jonathan'),
(31, 'Philamlife', '2013-04-15 02:32:12', 'jonathan'),
(32, 'Fremont Investor, Inc. (Bechtel Family)', '2013-04-15 02:32:12', 'jonathan'),
(33, 'Perf Realty Corp.', '2013-04-15 02:32:12', 'jonathan'),
(34, 'Panay Electric Company', '2013-04-15 02:32:12', 'jonathan'),
(35, 'Valmora Investment and Management Corporation', '2013-04-15 02:32:12', 'jonathan'),
(36, 'ICCP Land Management, Inc.', '2013-04-15 02:32:12', 'jonathan'),
(37, 'ICCP Managers, Inc.', '2013-04-15 02:32:12', 'jonathan'),
(38, 'Chevron Philippines, Inc.', '2013-04-15 02:32:12', 'jonathan'),
(39, 'Chevron Philippines Petroleum Co., Inc.', '2013-04-15 02:32:12', 'jonathan'),
(40, 'Pilipinas Shell Petroleum Corporation', '2013-04-15 02:32:12', 'jonathan'),
(41, 'Goodyear Philippines, Inc.', '2013-04-15 02:32:12', 'jonathan'),
(42, 'GE Lighting Phils., Inc.', '2013-04-15 02:32:12', 'jonathan'),
(43, 'Lilia L. Arce', '2013-04-15 02:32:12', 'jonathan'),
(44, 'Saturnino H. Mejia', '2013-04-15 02:32:12', 'jonathan'),
(45, 'Ma. Lourdes F. Rebueno', '2013-04-15 02:32:12', 'jonathan'),
(46, 'Rhoel Z. Mabazza', '2013-04-15 02:32:12', 'jonathan'),
(47, 'Ma. Christina D. De Castro', '2013-04-15 02:32:12', 'jonathan'),
(48, 'Josephine A. Batiller', '2013-04-15 02:32:12', 'jonathan'),
(49, 'Philippine Associated Smelting and Refining Corporation (PASAR)', '2013-04-15 02:32:12', 'jonathan'),
(50, 'Philippine Phosphate Fertilizer Corporation (PHILPHOS)', '2013-04-15 02:32:12', 'jonathan'),
(51, 'Others', '2013-04-15 02:32:12', 'jonathan'),
(52, 'Republic Glass Holdings Corp.', '2013-05-20 09:37:00', 'jonathan'),
(53, 'Foresight Realty and Development Corp.', '2013-05-20 09:36:36', 'jonathan'),
(54, 'Raul Anthony Concepcion', '2013-05-20 09:38:13', 'jonathan'),
(55, 'Gavinsburg Investment, Inc.', '2013-05-20 09:39:36', 'jonathan'),
(56, 'Frabelle Fishing Corp.', '2013-05-20 09:40:19', 'jonathan'),
(57, 'Kenrick Teng', '2013-05-20 09:40:34', 'jonathan'),
(58, 'Bryan G. Teng', '2013-05-20 09:40:54', 'jonathan'),
(59, 'Migada Holdings, Inc.', '2013-05-20 09:41:29', 'jonathan'),
(60, 'Queen Mother Prime Holdings, Inc.', '2013-05-20 09:41:53', 'jonathan'),
(61, 'Intxausti, Inc.', '2013-05-20 09:42:07', 'jonathan'),
(62, 'Serico, Inc.', '2013-05-20 09:42:15', 'jonathan'),
(63, 'First Georgetown Ventures, Inc.', '2013-05-20 09:42:37', 'jonathan'),
(64, 'Tomen', '2013-05-20 09:49:16', 'jonathan');

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_pdst_f_rates`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_pdst_f_rates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `1_month_avg` double NOT NULL,
  `3_month_avg` double NOT NULL,
  `6_month_avg` double NOT NULL,
  `1_year_avg` double NOT NULL,
  `2_year_avg` double NOT NULL,
  `3_year_avg` double NOT NULL,
  `4_year_avg` double NOT NULL,
  `5_year_avg` double NOT NULL,
  `7_year_avg` double NOT NULL,
  `10_year_avg` double NOT NULL,
  `20_year_avg` double NOT NULL,
  `25_year_avg` double NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `ndc_tbl_pdst_f_rates`
--

INSERT INTO `ndc_tbl_pdst_f_rates` (`id`, `1_month_avg`, `3_month_avg`, `6_month_avg`, `1_year_avg`, `2_year_avg`, `3_year_avg`, `4_year_avg`, `5_year_avg`, `7_year_avg`, `10_year_avg`, `20_year_avg`, `25_year_avg`, `date_updated`, `updated_by`, `year`, `month`) VALUES
(1, 2.0262, 1.7471, 2.0865, 2.1706, 2.824, 3.7759, 4.8308, 5.079, 5.2956, 5.4, 6.6546, 6.4689, '2013-04-15 02:33:33', 'lemuel', 2012, 0),
(2, 2.02, 2.0655, 2.4402, 2.6672, 3.0401, 3.749, 4.2475, 4.6099, 4.7485, 4.9654, 5.7404, 5.8987, '2013-04-15 02:33:33', 'lemuel', 2012, 1),
(3, 2.2663, 2.2905, 2.3951, 2.8842, 3.2591, 3.7301, 4.4086, 4.5426, 4.6303, 5.2522, 5.6228, 6.0356, '2013-04-15 02:33:33', 'lemuel', 2012, 2),
(4, 2.2841, 2.2385, 2.2758, 2.5397, 2.9634, 3.3369, 4.1062, 4.2603, 4.4242, 5.0249, 5.3253, 5.6819, '2013-04-15 02:33:33', 'lemuel', 2012, 3),
(5, 2.3346, 2.3064, 2.3555, 2.7985, 3.0859, 3.7894, 4.6214, 4.9346, 5.0645, 5.7307, 5.9747, 6.3786, '2013-04-15 02:33:33', 'lemuel', 2012, 4),
(6, 2.3346, 2.3064, 2.3555, 2.7985, 3.0859, 3.7894, 4.6214, 4.9346, 5.0645, 5.7307, 5.9747, 6.3786, '2013-04-15 02:33:33', 'lemuel', 2012, 4),
(7, 2.3833, 2.291, 2.3881, 2.604, 3.1404, 3.8767, 4.5414, 4.9393, 5.0445, 5.7649, 5.9116, 6.2826, '2013-04-15 02:33:33', 'lemuel', 2012, 5),
(8, 2.3724, 2.161, 2.3105, 2.5564, 2.9132, 3.8191, 4.4414, 4.6625, 4.8394, 5.3581, 5.6614, 5.9219, '2013-04-15 02:33:33', 'lemuel', 2012, 6),
(9, 2.1994, 1.6369, 1.9532, 2.4412, 2.8535, 3.7118, 4.4653, 4.626, 4.7443, 4.8679, 5.6163, 5.7809, '2013-04-15 02:33:33', 'lemuel', 2012, 7),
(10, 1.6975, 1.1803, 1.5879, 2.0923, 2.788, 3.8412, 4.2842, 4.5909, 4.6717, 4.7603, 5.6115, 5.7662, '2013-04-15 02:33:33', 'lemuel', 2012, 8),
(11, 0.9398, 0.6895, 0.9065, 1.1593, 2.3035, 3.087, 3.5229, 3.6741, 3.7226, 3.9013, 4.5506, 4.7384, '2013-04-15 02:33:33', 'lemuel', 2012, 9),
(12, 1.1141, 0.5715, 0.8254, 1.0197, 3.0078, 3.9493, 4.3408, 4.2533, 4.482, 5.087, 5.8485, 5.9762, '2013-04-15 02:33:33', 'lemuel', 2012, 10),
(13, 0.5568, 0.3088, 0.4854, 0.6414, 1.6532, 2.1147, 2.26, 2.2048, 2.2661, 2.4919, 3.2412, 3.1894, '2013-04-15 02:33:33', 'lemuel', 2012, 11),
(14, 0.4048, 0.329, 0.5615, 0.9372, 2.7139, 3.4959, 3.6537, 3.6747, 3.8872, 4.1581, 5.5234, 5.3289, '2013-05-27 01:35:27', 'lemuel', 2013, 0),
(15, 0.3888, 0.3947, 0.6603, 1.1903, 2.9761, 3.1086, 3.6521, 3.6842, 3.9343, 4.0945, 5.4958, 5.0851, '2013-05-27 01:40:41', 'lemuel', 2013, 1),
(16, 0.3748, 0.3452, 0.4119, 0.7985, 2.2378, 2.5725, 2.8107, 2.8587, 3.0455, 3.2595, 4.121, 4.1054, '2013-05-27 01:46:22', 'lemuel', 2013, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_personal_services`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_personal_services` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL,
  `budget_personal_services` double NOT NULL,
  `actual_personal_services` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ndc_tbl_personal_services`
--

INSERT INTO `ndc_tbl_personal_services` (`id`, `month`, `year`, `date_updated`, `updated_by`, `budget_personal_services`, `actual_personal_services`) VALUES
(1, 10, 2012, '2013-05-08 02:32:23', 'lay', 22308000, 17532213),
(2, 2, 2013, '2013-05-27 02:56:20', 'lay', 25678750, 5323634.41),
(3, 3, 2013, '2013-05-28 05:16:02', 'lay', 25678750, 7732715.62);

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_principal_and_coupon_payments`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_principal_and_coupon_payments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bond_issued` double NOT NULL,
  `coupon` double NOT NULL,
  `bond_payment` double NOT NULL,
  `coupon_payment` double NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ndc_tbl_principal_and_coupon_payments`
--

INSERT INTO `ndc_tbl_principal_and_coupon_payments` (`id`, `bond_issued`, `coupon`, `bond_payment`, `coupon_payment`, `date_updated`, `updated_by`, `year`) VALUES
(1, 5000000000, 1968750000, 5000000000, 1968750000, '2013-05-08 02:43:30', 'lemuel', 1999),
(2, 2000000000, 962500000, 2000000000, 962500000, '2013-05-08 02:44:34', 'lemuel', 2002),
(3, 2000000000, 587500000, 2000000000, 587500000, '2013-05-08 02:45:19', 'lemuel', 2006),
(4, 3500000000, 896875000, 2000000000, 538125000, '2013-05-08 02:46:01', 'lemuel', 2009);

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_projected_actual_income`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_projected_actual_income` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `actual_income` double NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL,
  `actual_dividend` double NOT NULL,
  `actual_interest` double NOT NULL,
  `actual_rental` double NOT NULL,
  `actual_gain_on_sale` double NOT NULL,
  `actual_other_income` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ndc_tbl_projected_actual_income`
--

INSERT INTO `ndc_tbl_projected_actual_income` (`id`, `actual_income`, `date_updated`, `updated_by`, `actual_dividend`, `actual_interest`, `actual_rental`, `actual_gain_on_sale`, `actual_other_income`) VALUES
(1, 720790000, '2013-05-08 02:15:09', 'lay', 147600000, 461600000, 88840000, 22650000, 100000),
(2, 185128661, '2013-05-27 02:48:24', 'lay', 15140564, 149636065, 20100242, 251790, 0),
(3, 185128661, '2013-05-27 02:48:41', 'lay', 15140564, 149636065, 20100242, 251790, 0),
(4, 237047246.47, '2013-05-28 05:14:25', 'lay', 15140564, 186523457.05, 35122120.64, 261104.78, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_projected_actual_income_2`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_projected_actual_income_2` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `projected_income` double NOT NULL,
  `projected_dividend` double NOT NULL,
  `projected_interest` double NOT NULL,
  `projected_rental` double NOT NULL,
  `projected_gain_on_sale` double NOT NULL,
  `projected_other_income` double NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ndc_tbl_projected_actual_income_2`
--

INSERT INTO `ndc_tbl_projected_actual_income_2` (`id`, `projected_income`, `projected_dividend`, `projected_interest`, `projected_rental`, `projected_gain_on_sale`, `projected_other_income`, `date_updated`, `updated_by`) VALUES
(1, 992200000, 265900000, 356800000, 97900000, 271400000, 200000, '2013-05-08 02:17:02', 'lay'),
(2, 1115800000, 193800000, 447700000, 130000000, 344300000, 0, '2013-05-27 02:45:56', 'lay');

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_shareholders`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_shareholders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shareholders` varchar(255) NOT NULL,
  `shares` double NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=101 ;

--
-- Dumping data for table `ndc_tbl_shareholders`
--

INSERT INTO `ndc_tbl_shareholders` (`id`, `shareholders`, `shares`, `project_id`, `date_updated`, `updated_by`) VALUES
(1, 'Philippines', 28600, 1, '2013-04-15 02:35:34', 'jonathan'),
(2, 'Malaysia', 212000, 1, '2013-04-15 02:35:34', 'jonathan'),
(3, 'Indonesia', 28600, 1, '2013-04-15 02:35:34', 'jonathan'),
(4, 'Thailand', 28600, 1, '2013-04-15 02:35:34', 'jonathan'),
(5, 'Singapore', 2200, 1, '2013-04-15 02:35:34', 'jonathan'),
(6, 'Indonesia', 5634, 2, '2013-04-15 02:35:34', 'jonathan'),
(7, 'Malaysia', 1221, 2, '2013-04-15 02:35:34', 'jonathan'),
(8, 'Philippines', 1221, 2, '2013-04-15 02:35:34', 'jonathan'),
(9, 'Thailand', 1221, 2, '2013-04-15 02:35:34', 'jonathan'),
(10, 'Singapore', 94, 2, '2013-04-15 02:35:34', 'jonathan'),
(11, 'Thailand', 11700473, 3, '2013-04-15 02:35:34', 'jonathan'),
(12, 'Brunei', 100100, 3, '2013-04-15 02:35:34', 'jonathan'),
(13, 'Indonesia', 1301300, 3, '2013-04-15 02:35:34', 'jonathan'),
(14, 'Malaysia', 1301300, 3, '2013-04-15 02:35:34', 'jonathan'),
(15, 'Philamlife', 100100, 3, '2013-04-15 02:35:34', 'jonathan'),
(16, 'Singapore', 100100, 3, '2013-04-15 02:35:34', 'jonathan'),
(17, 'NRDC', 55000000, 5, '2013-04-15 02:35:34', 'jonathan'),
(18, 'PCD Nominee Corporation (NF)', 45000000, 5, '2013-04-15 02:35:34', 'jonathan'),
(19, 'National Development Company', 25000000, 5, '2013-04-15 02:35:34', 'jonathan'),
(20, 'DMCI Holdings, Incorporated', 163432385, 6, '2013-04-15 02:35:34', 'jonathan'),
(21, 'PCD Nominee Corporation (NF)', 79025362, 6, '2013-04-15 02:35:34', 'jonathan'),
(22, 'Dacon Corporation', 16030085, 6, '2013-04-15 02:35:34', 'jonathan'),
(23, 'National Development Company', 11364658, 6, '2013-04-15 02:35:34', 'jonathan'),
(24, 'Others', 27022510, 6, '2013-04-15 02:35:34', 'jonathan'),
(35, 'National Development Company', 599996, 8, '2013-04-15 02:35:34', 'jonathan'),
(36, 'Philippine Exporters Confederation, Inc.', 299998, 8, '2013-04-15 02:35:34', 'jonathan'),
(37, 'MEDCO Holdings, Inc.', 299998, 8, '2013-04-15 02:35:34', 'jonathan'),
(38, 'Science Park of the Philippines, Inc.', 149999, 8, '2013-04-15 02:35:34', 'jonathan'),
(39, 'World Trade Center Management, Inc.', 149998, 8, '2013-04-15 02:35:34', 'jonathan'),
(40, 'The Philippine American Life and General Insurance Company', 149999, 8, '2013-04-15 02:35:34', 'jonathan'),
(41, 'BOD', 8, 8, '2013-04-15 02:35:34', 'jonathan'),
(42, 'National Development Company', 40395, 11, '2013-04-15 02:35:34', 'jonathan'),
(43, 'Pilipinas Shell Petroleum Corporation', 26930, 11, '2013-04-15 02:35:34', 'jonathan'),
(44, 'National Development Company', 545187, 13, '2013-04-15 02:35:34', 'jonathan'),
(45, 'Goodyear Philippines, Inc.', 363458, 13, '2013-04-15 02:35:34', 'jonathan'),
(46, 'National Development Company', 135033, 10, '2013-04-15 02:35:34', 'jonathan'),
(47, 'GE Lighting Phils., Inc.', 90064, 10, '2013-04-15 02:35:34', 'jonathan'),
(48, 'Others', 63, 10, '2013-04-15 02:35:34', 'jonathan'),
(49, 'National Development Company', 79995, 15, '2013-04-15 02:35:34', 'jonathan'),
(55, 'National Development Company', 9995, 17, '2013-04-15 02:35:34', 'jonathan'),
(61, 'National Development Company', 2117500, 7, '2013-05-20 01:48:07', 'jonathan'),
(62, 'Bronzeoak Philippines, Inc.', 806988, 7, '2013-05-20 01:48:26', 'jonathan'),
(63, 'Bronzeoak Clean Energy, Inc.', 6852723, 7, '2013-05-20 01:48:47', 'jonathan'),
(64, 'Valmayor Venture, Inc.', 812000, 7, '2013-05-20 01:49:04', 'jonathan'),
(65, 'San Julio Realty, Inc.', 867035, 7, '2013-05-20 01:49:24', 'jonathan'),
(66, 'MA Jimenez, Inc.', 1779635, 7, '2013-05-20 01:49:40', 'jonathan'),
(67, 'Philippine Clean Energy', 1466962, 7, '2013-05-20 01:49:55', 'jonathan'),
(68, 'Bronzeoak Investment Holdings, Inc.', 1274391, 7, '2013-05-20 01:50:11', 'jonathan'),
(69, 'Manila Clean Energy', 1783717, 7, '2013-05-20 01:50:29', 'jonathan'),
(70, 'National Development Company', 21974, 12, '2013-05-20 08:23:46', 'jonathan'),
(71, 'Chevron Philippines Petroleum Co., Inc.', 14649, 12, '2013-05-20 08:24:12', 'jonathan'),
(73, 'Philippine Associated Smelting and Refining Corporation (PASAR)', 400, 16, '2013-05-20 08:29:33', 'jonathan'),
(74, 'National Development Company', 200, 16, '2013-05-20 08:29:52', 'jonathan'),
(75, 'Philippine Phosphate Fertilizer Corporation (PHILPHOS)', 400, 16, '2013-05-20 08:30:20', 'jonathan'),
(76, 'ICCP Holdings Corp.', 189438334, 9, '2013-05-20 09:31:46', 'jonathan'),
(77, 'ICCP Land Management, Inc.', 9166666, 9, '2013-05-20 09:32:09', 'jonathan'),
(78, 'Philamlife', 83948333, 9, '2013-05-20 09:32:33', 'jonathan'),
(79, 'Perf Realty Corp.', 27984000, 9, '2013-05-20 09:32:55', 'jonathan'),
(80, 'Fremont Investor, Inc. (Bechtel Family)', 50368999, 9, '2013-05-20 09:33:15', 'jonathan'),
(81, 'National Development Company', 28474100, 9, '2013-05-20 09:33:32', 'jonathan'),
(82, 'Panay Electric Company', 36000000, 9, '2013-05-20 09:33:53', 'jonathan'),
(83, 'Valmora Investment and Management Corporation', 20000000, 9, '2013-05-20 09:34:14', 'jonathan'),
(84, 'ICCP Managers, Inc.', 7718132, 9, '2013-05-20 09:34:31', 'jonathan'),
(85, 'Republic Glass Holdings Corp.', 47241454, 9, '2013-05-20 09:36:00', 'jonathan'),
(86, 'Foresight Realty and Development Corp.', 20619000, 9, '2013-05-20 09:37:31', 'jonathan'),
(87, 'Raul Anthony Concepcion', 1030950, 9, '2013-05-20 09:39:06', 'jonathan'),
(88, 'Gavinsburg Investment, Inc.', 20500000, 9, '2013-05-20 09:39:54', 'jonathan'),
(89, 'Frabelle Fishing Corp.', 10309278, 9, '2013-05-20 09:43:07', 'jonathan'),
(90, 'Kenrick Teng', 2061856, 9, '2013-05-20 09:43:28', 'jonathan'),
(91, 'Bryan G. Teng', 2061856, 9, '2013-05-20 09:43:48', 'jonathan'),
(92, 'Migada Holdings, Inc.', 4132712, 9, '2013-05-20 09:44:06', 'jonathan'),
(93, 'Queen Mother Prime Holdings, Inc.', 7216495, 9, '2013-05-20 09:44:24', 'jonathan'),
(94, 'Intxausti, Inc.', 10927835, 9, '2013-05-20 09:44:40', 'jonathan'),
(95, 'Serico, Inc.', 10500000, 9, '2013-05-20 09:44:54', 'jonathan'),
(96, 'First Georgetown Ventures, Inc.', 10300000, 9, '2013-05-20 09:45:06', 'jonathan'),
(97, 'National Development Company', 4328932.08, 14, '2013-05-20 09:49:44', 'jonathan'),
(98, 'Alsons Devt & Investment Corp.', 5273426.35, 14, '2013-05-20 09:50:02', 'jonathan'),
(99, 'Mino Yogyo Co., Ltd.', 2407148.6, 14, '2013-05-20 09:50:22', 'jonathan'),
(100, 'Tomen', 1108468.97, 14, '2013-05-20 09:50:39', 'jonathan');

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_sources_funds`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_sources_funds` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `projected_sources_of_funds` double NOT NULL,
  `projected_uses_of_funds` double NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ndc_tbl_sources_funds`
--

INSERT INTO `ndc_tbl_sources_funds` (`id`, `projected_sources_of_funds`, `projected_uses_of_funds`, `date_updated`, `updated_by`, `year`) VALUES
(1, 255676033.56, 44971214, '2013-05-08 01:59:34', 'randy', 2013),
(2, 156801092.57, 24754185.52, '2013-05-08 02:00:17', 'randy', 2014);

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_spg_balance_sheet`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_spg_balance_sheet` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) NOT NULL,
  `total_assets` double NOT NULL,
  `total_liabilities` double NOT NULL,
  `debt_to_assets` double NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `ndc_tbl_spg_balance_sheet`
--

INSERT INTO `ndc_tbl_spg_balance_sheet` (`id`, `project_id`, `total_assets`, `total_liabilities`, `debt_to_assets`, `updated_by`, `date_updated`, `year`) VALUES
(1, 1, 1994369, 1094064, 54.9, 'jonathan', '2013-04-15 02:36:47', 2009),
(2, 1, 1277182, 310920, 24.3, 'jonathan', '2013-04-15 02:36:47', 2010),
(3, 1, 1479949, 308543, 20.8, 'jonathan', '2013-04-15 02:36:47', 2011),
(4, 6, 24263.3, 14379.7, 59.5, 'jonathan', '2013-04-15 02:36:47', 2009),
(5, 6, 30494.7, 18154.8, 59.3, 'jonathan', '2013-04-15 02:36:47', 2010),
(6, 6, 35628.2, 20819.7, 58.4, 'jonathan', '2013-04-15 02:36:47', 2011),
(7, 8, 214039524, 38900564, 18.2, 'jonathan', '2013-04-15 02:36:47', 2009),
(8, 8, 214699699, 36043706, 16.8, 'jonathan', '2013-04-15 02:36:47', 2010),
(9, 8, 200099476, 35147684, 17.6, 'jonathan', '2013-04-15 02:36:47', 2011),
(10, 9, 3755948196, 2533563501, 67.5, 'jonathan', '2013-04-15 02:36:47', 2009),
(11, 9, 3969579832, 2712844817, 68.3, 'jonathan', '2013-04-15 02:36:47', 2010),
(12, 9, 4067328588, 2485263440, 61.1, 'jonathan', '2013-04-15 02:36:47', 2011),
(13, 12, 42055299, 1532036, 3.6, 'jonathan', '2013-04-15 02:36:47', 2009),
(14, 12, 52988185, 13711902, 25.9, 'jonathan', '2013-04-15 02:36:47', 2010),
(15, 12, 59231054, 13074433, 22.1, 'jonathan', '2013-04-15 02:36:47', 2011),
(16, 11, 15222072, 4345371, 28.5, 'jonathan', '2013-04-15 02:36:47', 2009),
(17, 11, 11632216, 998386, 8.6, 'jonathan', '2013-04-15 02:36:47', 2010),
(18, 11, 11038320, 541948, 4.9, 'jonathan', '2013-04-15 02:36:47', 2011),
(19, 13, 9685111, 54539, 0.6, 'jonathan', '2013-04-15 02:36:47', 2009),
(20, 13, 9738824, 57650, 0.6, 'jonathan', '2013-04-15 02:36:47', 2010),
(21, 13, 153876233, 763720, 0.5, 'jonathan', '2013-04-15 02:36:47', 2011),
(22, 10, 2624106, 70912, 2.7, 'jonathan', '2013-04-15 02:36:47', 2009),
(23, 10, 2654797.21, 48039, 1.8, 'jonathan', '2013-04-15 02:36:47', 2010),
(24, 10, 3891968.21, 123440, 3.2, 'jonathan', '2013-04-15 02:36:47', 2011),
(25, 17, 13219113, 3866808, 29.3, 'jonathan', '2013-04-15 02:36:47', 2009),
(26, 17, 11611144, 8604071, 74.1, 'jonathan', '2013-04-15 02:36:47', 2010),
(27, 17, 10555648, 9813286, 93, 'jonathan', '2013-04-15 02:36:47', 2011),
(28, 16, 0, 0, 0, 'jonathan', '2013-04-15 02:36:47', 2009),
(29, 16, 73966275, 71151396, 96.2, 'jonathan', '2013-04-15 02:36:47', 2010),
(30, 16, 69630907, 62477934, 89.7, 'jonathan', '2013-04-15 02:36:47', 2011),
(31, 15, 60811883, 2494806, 4.1, 'jonathan', '2013-04-15 02:36:47', 2009),
(32, 15, 59191772, 2342806, 3.96, 'jonathan', '2013-04-15 02:36:47', 2010),
(33, 15, 59357960, 2302806, 3.9, 'jonathan', '2013-04-15 02:36:47', 2011),
(34, 5, 337131016.5, 193448860, 57.38, 'jonathan', '2013-05-24 02:44:36', 2011),
(35, 5, 381782591.5, 172520448.94, 45.19, 'jonathan', '2013-05-24 02:45:45', 2010),
(36, 5, 318780441, 184717933, 57.95, 'jonathan', '2013-05-24 02:46:33', 2009),
(37, 7, 2986608628, 3423944586, 114.64, 'jonathan', '2013-05-24 02:58:21', 2011),
(38, 7, 2996114772, 3147179497, 105.04, 'jonathan', '2013-05-24 02:59:19', 2010);

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_spg_cash_flow`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_spg_cash_flow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) NOT NULL,
  `operating_activities` double NOT NULL,
  `investing_activities` double NOT NULL,
  `financing_activities` double NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `ndc_tbl_spg_cash_flow`
--

INSERT INTO `ndc_tbl_spg_cash_flow` (`id`, `project_id`, `operating_activities`, `investing_activities`, `financing_activities`, `date_updated`, `updated_by`, `year`) VALUES
(1, 1, 456069, 9185, 0, '2013-04-15 02:37:07', 'jonathan', 2009),
(2, 1, 658895, 205704, 0, '2013-04-15 02:37:07', 'jonathan', 2010),
(3, 1, 208046, 80907, 0, '2013-04-15 02:37:07', 'jonathan', 2011),
(4, 6, 3699.1, -8831.6, 4635, '2013-04-15 02:37:07', 'jonathan', 2009),
(5, 6, 6725, -12945.9, 9550.4, '2013-04-15 02:37:07', 'jonathan', 2010),
(6, 6, 6643.5, -2557.5, -2901.6, '2013-04-15 02:37:07', 'jonathan', 2011),
(7, 8, 28956130, -32229830, 4816526, '2013-04-15 02:37:07', 'jonathan', 2009),
(8, 8, 39176785, -19949402, -20274527, '2013-04-15 02:37:07', 'jonathan', 2010),
(9, 8, 8288313, -18874977, 1757729, '2013-04-15 02:37:07', 'jonathan', 2011),
(10, 9, 97061520, -29923776, 183400472, '2013-04-15 02:37:07', 'jonathan', 2009),
(11, 9, 334552, -46024127, 152353330, '2013-04-15 02:37:07', 'jonathan', 2010),
(12, 9, 291602797, -66149957, -448644346, '2013-04-15 02:37:07', 'jonathan', 2011),
(13, 12, -3124960, -176594, -345094, '2013-04-15 02:37:07', 'jonathan', 2009),
(14, 12, 35686737, -44806, -24567492, '2013-04-15 02:37:07', 'jonathan', 2010),
(15, 12, 8839281, -19855, -2653283, '2013-04-15 02:37:07', 'jonathan', 2011),
(16, 11, -12484, 0, -1674587, '2013-04-15 02:37:07', 'jonathan', 2009),
(17, 11, -1487647, 0, -2092812, '2013-04-15 02:37:07', 'jonathan', 2010),
(18, 11, 460342, 0, -1850102, '2013-04-15 02:37:07', 'jonathan', 2011),
(19, 13, 57611, 0, -72718, '2013-04-15 02:37:07', 'jonathan', 2009),
(20, 13, 51101, 0, 0, '2013-04-15 02:37:07', 'jonathan', 2010),
(21, 13, 467566, 0, 0, '2013-04-15 02:37:07', 'jonathan', 2011),
(22, 10, 78267, 0, -77026, '2013-04-15 02:37:07', 'jonathan', 2009),
(23, 10, 38735.21, 0, 0, '2013-04-15 02:37:07', 'jonathan', 2010),
(24, 10, 9627022, 0, -8372668, '2013-04-15 02:37:07', 'jonathan', 2011),
(25, 17, -19039, 0, 0, '2013-04-15 02:37:07', 'jonathan', 2009),
(26, 17, 61359, 0, 0, '2013-04-15 02:37:07', 'jonathan', 2010),
(27, 17, -379911, 0, 0, '2013-04-15 02:37:07', 'jonathan', 2011),
(28, 16, 0, 0, 0, '2013-04-15 02:37:07', 'jonathan', 2009),
(29, 16, 2452873, -1032470, 0, '2013-04-15 02:37:07', 'jonathan', 2010),
(30, 16, 4076776, -3303181, 0, '2013-04-15 02:37:07', 'jonathan', 2011),
(31, 15, -907492, 1006725, 0, '2013-04-15 02:37:07', 'jonathan', 2009),
(32, 15, -836171, 52436879, 0, '2013-04-15 02:37:07', 'jonathan', 2010),
(33, 15, -54552, 0, 0, '2013-04-15 02:37:07', 'jonathan', 2011),
(34, 5, -2104527, -4462761, -20698918, '2013-05-24 02:48:22', 'jonathan', 2011),
(35, 5, 72057939.62, -2738192.87, -12222438.37, '2013-05-24 02:49:04', 'jonathan', 2010),
(36, 5, 13430002, -7934611, 10133970, '2013-05-24 02:49:35', 'jonathan', 2009),
(37, 7, 115881896, -39507415, 3750782, '2013-05-24 03:00:18', 'jonathan', 2011),
(38, 7, 29462149, -16048349, 92909, '2013-05-24 03:00:46', 'jonathan', 2010);

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_spg_categories_existing`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_spg_categories_existing` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ndc_tbl_spg_categories_existing`
--

INSERT INTO `ndc_tbl_spg_categories_existing` (`id`, `name`, `date_updated`) VALUES
(1, 'ASEAN', '2013-02-14 07:08:05'),
(2, 'MINING', '2013-02-14 07:08:47'),
(3, 'ENERGY', '2013-02-14 07:08:47'),
(4, 'REAL ESTATE', '2013-02-14 07:08:47'),
(5, 'INDUSTRIAL', '2013-02-14 07:08:47'),
(6, 'OTHERS', '2013-02-14 07:08:48');

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_spg_income_statement`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_spg_income_statement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) NOT NULL,
  `revenue` double NOT NULL,
  `net_income` double NOT NULL,
  `profit_margin` double NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

--
-- Dumping data for table `ndc_tbl_spg_income_statement`
--

INSERT INTO `ndc_tbl_spg_income_statement` (`id`, `project_id`, `revenue`, `net_income`, `profit_margin`, `date_updated`, `updated_by`, `year`) VALUES
(1, 1, 700388, 164249, 33.5, '2013-05-27 00:53:14', 'jonathan', 2009),
(2, 1, 513239, 65957, 18.9, '2013-05-27 00:53:27', 'jonathan', 2010),
(3, 1, 652663, 205144, 45.7, '2013-05-27 00:53:39', 'jonathan', 2011),
(4, 6, 11943.7, 1846, 21.7, '2013-05-27 00:54:30', 'jonathan', 2009),
(5, 6, 22897.8, 3952, 30, '2013-05-27 00:54:47', 'jonathan', 2010),
(6, 6, 25813.6, 6031.1, 35.3, '2013-05-27 00:55:00', 'jonathan', 2011),
(7, 8, 110398620, 1993213, 2.6, '2013-05-27 00:55:26', 'jonathan', 2009),
(8, 8, 135798151, 15892033, 12.1, '2013-05-27 00:55:34', 'jonathan', 2010),
(9, 8, 127334325, -1329201, -1.3, '2013-05-27 00:55:43', 'jonathan', 2011),
(10, 9, 902806208, 83334998, 89.6, '2013-05-27 00:56:48', 'jonathan', 2009),
(11, 9, 677573396, 58717920, 89.9, '2013-05-27 00:58:40', 'jonathan', 2010),
(12, 9, 1484743648, 429563731, 67, '2013-05-27 00:58:48', 'jonathan', 2011),
(13, 12, 23982025, 437698, 1.6, '2013-05-27 00:59:05', 'jonathan', 2009),
(14, 12, 34534428, 23352699, 94.4, '2013-05-27 00:59:16', 'jonathan', 2010),
(15, 12, 17718418, 9523856, 74.2, '2013-05-27 00:59:27', 'jonathan', 2011),
(16, 11, 3566627, 2092812, 29.9, '2013-05-27 00:59:52', 'jonathan', 2009),
(17, 11, 3660681, 1850102, 63.6, '2013-05-27 01:00:01', 'jonathan', 2010),
(18, 11, 3624800, 1710709, 64, '2013-05-27 01:00:10', 'jonathan', 2011),
(19, 13, 397532, 62685, 21.4, '2013-05-27 01:00:33', 'jonathan', 2009),
(20, 13, 397532, 50714, 17.1, '2013-05-27 01:00:40', 'jonathan', 2010),
(21, 13, 8313858, -720532, -6.8, '2013-05-27 01:00:49', 'jonathan', 2011),
(22, 10, 695522, 64404, 12.9, '2013-05-27 01:01:12', 'jonathan', 2009),
(23, 10, 695522, 53625, 10.6, '2013-05-27 01:01:22', 'jonathan', 2010),
(24, 10, 13748946, 9535407, 98.1, '2013-05-27 01:01:32', 'jonathan', 2011),
(25, 17, 649931, -100413, -15.4, '2013-05-27 01:01:52', 'jonathan', 2009),
(26, 17, 597047, -2778511, -464.1, '2013-05-27 01:02:07', 'jonathan', 2010),
(27, 17, 527455, -1912332, -361.2, '2013-05-27 01:02:15', 'jonathan', 2011),
(29, 16, 127171115, 8738775, 28.7, '2013-05-27 01:03:55', 'jonathan', 2010),
(30, 16, 126711894, 4338094, 29.3, '2013-05-27 01:04:03', 'jonathan', 2011),
(32, 15, 1459202, 457009, 31.3, '2013-05-27 01:04:48', 'jonathan', 2010),
(33, 15, 1329731, 383795, 28.9, '2013-05-27 01:05:01', 'jonathan', 2011),
(35, 5, 38815875, -34713327, -25.11, '2013-05-27 01:07:36', 'jonathan', 2011),
(36, 5, 113440010.51, 73830821.57, 72.44, '2013-05-27 01:07:26', 'jonathan', 2010),
(37, 7, 1030682808, -286271233, 5.7, '2013-05-27 01:08:09', 'jonathan', 2011),
(38, 7, 509626568, -496216771, -20.9, '2013-05-27 01:08:00', 'jonathan', 2010),
(39, 15, 2018848, 1092399, 54.1, '2013-05-27 01:05:31', 'jonathan', 2009);

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_spg_sub_categories_existing`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_spg_sub_categories_existing` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `profile` text NOT NULL,
  `milestone` text NOT NULL,
  `currency` varchar(255) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `ndc_tbl_spg_sub_categories_existing`
--

INSERT INTO `ndc_tbl_spg_sub_categories_existing` (`id`, `category_id`, `name`, `profile`, `milestone`, `currency`, `date_updated`) VALUES
(1, 1, 'Asean Bintulu Fertilizer', 'ASEAN Bintulu Fertilizer Sdn Bhd operates ammonia and urea plants in Bintulu, Sarawak under the petrochemicals industry in Malaysia.\r\n\\n\\n\r\nThe Bintulu Complex was commissioned in September 1985. It has a capacity of 400,000 ton per annum for ammonia and 600,000 ton per annum urea. Ammonia is used to manufacture fertilizers and as an anticorrosion agent in oil refineries. It is used in the rubber, chemical and petrochemical industries. Urea is used as a fertilizer and as a raw material to manufacture protein in animal fodder and important chemical compounds such as urea formaldehyde.', '', 'Malaysian Ringgit(RM)', '2013-05-23 02:50:41'),
(2, 1, 'Asean Aceh Fertilizer', 'Established on April 12, 1979 in Indonesia. A joint venture company between ASEAN countries to produce urea fertilizer and ammonia liquid as byproduct.\r\n\r\n\\n\\n\r\n\r\nStarted operation in 1983 and stopped in 2003 when it failed to secure its gas supply from ExxonMobil Indonesia.\r\n\r\n\\n\\n\r\n\r\nOn 14 January 2006, the company began the process for its liquidation after being idle for three years. \r\n\r\n\\n\\n\r\n\r\nThe company is now under liquidation.\r\n', '', 'Indonesian Rupiah(IDR)', '2013-05-22 09:44:08'),
(3, 1, 'Asean Potash Mining Corporation', 'Incorporated in Thailand on March 7, 1991 as part of the joint industrial projects formed among the founding ASEAN-member countries.\r\n\\n\\n\r\nThe primary purpose of the company is the mining of potash and the production and distribution of potash fertilizer.\r\n\\n\\n\r\nSince its incorporation in 1991, it did not operate due to absence of mining concessional permit from the Ministry of Natural Resources and Environment, and lack of working capital, among others. ', '', 'Thai Baht(THB)', '2013-05-22 09:45:37'),
(5, 2, 'Philippine Mining Development Corporation', 'Philippine Mining Development Corporation (PMDC) is the corporate arm of the DENR mandated to conduct exploration and to delineate mineral deposits (gold and copper) for direct mining and development by the state.  PMDC spearheads the Government''s initiative to develop the 8,100 hectares Diwalwal Mineral Reservation, including, but not limited to, the renowned Diwalwal gold rush area in Mr. Diwata, Compostela Valley.', '', 'Philippine Peso(PHP)', '2013-05-22 09:16:48'),
(6, 2, 'Semirara Mining Corporation', 'SCC was established on 26 February 1980 to explore and mine coal resources in Semirara Island, Antique.\r\n\\n\\n\r\nSCC is the biggest open-pit coal miner in the country servicing mainly the power and cement industries.', '', 'Philippine Peso(PHP)', '2013-05-23 02:53:02'),
(7, 3, 'San Carlos Bio-Energy Incorporated', 'San Carlos Bioenergy, Inc. (SCBI), a joint venture project between the private and the government sector, is an integrated ethanol distillery and power cogeneration plant with an output capacity of 125,000 liters per day (lpd) of fuel grade ethanol and approximately 8 MW of electricity.', '', 'Philippine Peso(PHP)', '2013-05-17 16:26:10'),
(8, 4, 'Manila Exposition Complex, Incorporated', 'MECI was registered on March 2, 1995, primarily to acquire by purchase, exchange, assignment, gift or otherwise, and to hold, own and use for investment.\n\nThe company owned World Trade Center Manila.', '', 'Philippine Peso(PHP)', '2013-05-17 16:26:10'),
(9, 4, 'Science Park of the Philippines, Incorporated', 'SPPI, established in 1989, is an industrial estate developer. An industry pioneer and leader, it has developed a series of well-managed and strategically located industrial parks, registered as Special Economic Zones.\r\n\\n\\n\r\nSPPI provides well-managed locations for light and medium industries, especially support and manufacturing industries, with environment-friendly operations. HEIP also caters to heavy industries. Industries include electronics, telecommunications, electrical appliances, auto parts, packaging and consumer goods. \r\n\\n\\n\r\nSPPI offers complete and advanced infrastructure and facilities to support manufacturing operations. It provides abundant supply of power, water and telecommunications to ensure non-stop manufacturing activities. \r\n\\n\\n\r\nSPPI industrial parks are strategically located and easily accessible; proximate to financial and industrial cities sans the noise and pollution. For local and foreign expatriates, nearby are first-class residences, schools, commercial, leisure, sports and cultural facilities.', '', 'Philippine Peso(PHP)', '2013-05-23 02:56:41'),
(10, 4, 'Pinagkaisa Realty Corporation', 'Pinagkaisa Realty Corporation (PRC) was organized in 1977 under the Corporation Law of the Philippines and registered with the Securities and Exchange Commission on March 13, 1978 under Registry Number 78665.\r\n\\n\\n\r\nThe Company was organized to acquire, buy, sell, exchange, manage, improve, lease or otherwise deal in real property.\r\n\\n\\n\r\nWith the termination of the American Parity Agreement on July 3, 1974, the National Development Company (NDC) acquired through absolute purchase 60% undivided interest in the four parcels of land owned by the Philippine Electric Manufacturing Company (PEMCO), [now GE Lighting Philippines, Inc. (GELP)]. On September 30, 1977, a Deed of Assignment and Transfer was executed wherein NDC and PEMCO conveyed their respective 60% and 40% undivided interest in exchange for fully paid shares of stock of PRC.\r\n\\n\\n\r\nThe property is currently under lease to GE Lighting Philippines, Inc.', '', 'Philippine Peso(PHP)', '2013-06-06 06:23:27'),
(11, 4, 'Kamayan Realty Corporation', 'Kamayan Realty Corporation (KRC) was organized with the primary purpose of allowing then Getty Oil Philippines Inc. (now Pilipinas Shell Petroleum Corporation [Shell]) to continue its business on the land it used to own. NDC owns 60% of KRC and the balance of 40% is owned by Shell.\r\n\\n\\n\r\nKRC owns 54 parcels of land located in various cities and municipalities in the Philippines with a land area of 40,139 square meters. The fair market value of the KRC landholdings as of 2010 is P352,356,000.00.\r\n\\n\\n\r\nShell leases 14 parcels of land in seven locations. The lease expires on February 28, 2026.', '', 'Philippine Peso(PHP)', '2013-06-06 06:11:26'),
(12, 4, 'Batangas Land Co. Inc.', 'Batangas Land Company, Inc. (BLC) was organized with the primary purpose of allowing Caltex Philippines, Inc. (now Chevron Philippines Inc. [Chevron]) to continue its business in the lands it used to own. NDC owns 60% of BLC and the balance of 40% is owned by Chevron.\r\n\\n\\n\r\nBLC owns 162 parcels of land located in various cities and provinces in the Philippines with a land area of 1,929,205 square meters. The fair market value of the BLC landholdings as of 28 November 2007 is P3.8 Billion.\r\n\\n\\n\r\nChevron leases 147 parcels of land, the biggest of which is in San Pascual, Batangas. The lease is up to September 2025. There are parcels of land which are still available for lease by other interested parties.', '', 'Philippine Peso(PHP)', '2013-06-07 05:49:45'),
(13, 4, 'Gy Real Estate, Inc.', 'GY Real Estate, Inc. (GYREI) was organized in 1973 under the Corporation Law of the Philippines and registered with the Securities and Exchange Commission on February 1, 1974 under Registry Number 54511.\r\n\\n\\n\r\nThe Company was created to acquire, buy, sell, exchange, manage, improve, lease or otherwise deal in real property.\r\n\\n\\n\r\nWith the termination of the American Parity Agreement on July 3, 1974, Goodyear Phils, Inc. (GPI) (formerly Goodyear Tire and Rubber Company of the Philippines, Ltd.) donated 60% of its undivided interest, right and title to its two (2) parcels of land to the National Development Company (NDC) on May 26, 1975. On the same day, NDC and GPI entered into a Deed of Transfer and Conveyance and conveyed these two(2) parcels of land to GYREI for a 60% and 40% undivided interest, respectively, in exchange for fully paid shares of stock of the Company.\r\n\\n\\n\r\nThe property was leased by GPI until April 15, 2011, when GPI decided not to renew its occupancy of the property.\r\n\\n\\n\r\nThe Company has an existing Contract of Lease with HH Asia Tyre Corporation (HH ATC) for the period April 16, 2011 to November 30, 2013.', '', 'Philippine Peso(PHP)', '2013-06-06 06:19:39'),
(14, 5, 'Refractories Corporation of the Philippines', 'RCP was established on 13 October 1976 to manufacture refractory products. It operates a plant for monolithic refractories in Valenzuela City, Metro Manila. It closed its other manufacturing plant in Iligan City which was designed to produce refractory bricks for the cement industry. \r\n\\n\\n\r\nDownturn in the cement industry resulted in financial difficulties for RCP. This led the company to file for corporate rehabilitation on 2 September 2009 before the Regional Trial Court, Branch 159, in Pasig City.', '', 'Philippine Peso(PHP)', '2013-05-23 02:52:00'),
(15, 6, 'Philippine Infrastructure Corporation', 'NDC-Philippine Infrastructure Corporation (NPIC) was incorporated under the Securities and Exchange Commission under Registration No. CS200501240 on January 27, 2005.  Its incorporation was authorized per Memorandum from the Executive Secretary, dated December 13, 2004, upon the  recommendation of the Secretary of the Department of Trade and Industry and Secretary of Finance and shall be attached to the DTI.\r\n\r\nMandate:\r\n\r\nDevelop, package, structure and or manage investments in infrastructure projects and commercial ventures related to the development of infrastructure in which the NDC wishes to participate or invest. \r\n\r\nStatus and Accomplishments:\r\n\r\n<ul style="margin-left:50px">\r\n<li>	Completed the Business Plan for the Laguindingan and Mindanao Airports Development Projects.</li>\r\n\r\n<li>	Completed the Preliminary Engineering Design for the Daang Hari-SLEX Link Road Project</li>\r\n\r\n<li>	Completed the Feasibility Study on the Calamba-Laguna (CALA) North-South Expressway Project</li>\r\n\r\n<li>	Completed the Feasibility Study on the R10C3R9 Expressway Project</li>\r\n</ul>\r\n\r\n<p style="margin-left:20px">Plans and Programs:</p>\r\n\r\n<ul style="margin-left:50px">\r\n<li>	To channel the Official Development Assistance (ODA) loans from Japan International Cooperation Agency (JICA) to NDC-PIC that will eventually be provide by a sovereign guarantee cover from NDC  and DOF</li>\r\n\r\n<li>	These loans will be re-lend to private infrastructure projects  with the private commercial banks providing additional loans to the projects.</li>\r\n</ul>', '', 'Philippine Peso(PHP)', '2013-05-23 03:04:35'),
(16, 4, 'LIDE Management Corporation', '<b>Creation of LIDE</b>\r\n\\n\\n\r\nLeyte Industrial Development Estate (LIDE) was established in November 1979 through Letter of Instruction No. 962 to spur economic development in Region VIII and as prime site for heavy industries.\r\n\\n\\n\r\nThe LIDE property is owned by the National Development Company, a government-owned and controlled corporation, attached to the Department of Trade and Industry.\r\n\\n\\n\r\nLIDE has been proclaimed as Special Economic Zone (SEZ) under RA 7195 as amended by RA 8748 or the Special Economic Zone Act of 1995.\r\n\\n\\n\r\n<b> LIDE Industry Locators </b>\r\n\\n\\n\r\n<table class="table table-bordered" style="width:700px">\r\n<tr>\r\n<th> Major Locators </th>\r\n<th> Industry/Product </th>\r\n</tr>\r\n<tr>\r\n<td> Philippine Phosphate Fertilizer Corporation </td>\r\n<td> Phosphate fertilizer </td>\r\n</tr>\r\n<tr>\r\n<td> Philippine Associated Smelting and Refining Corporation </td>\r\n<td> Copper Smelter and refinery. Primary product is electrolytic copper cathodes </td>\r\n</tr>\r\n<tr>\r\n<td> Century Hua Guang Smelting, Inc. (new locator) </td>\r\n<td> Ferronickel </td>\r\n</tr>\r\n<tr>\r\n<td> Other Locators: </td>\r\n<td> </td>\r\n</tr>\r\n<tr>\r\n<td> Cleanaway Philippines, Inc. </td>\r\n<td> Industries'' hazardous/toxic wastes management </td>\r\n</tr>\r\n<tr>\r\n<td> ALC Tonggo Fertilizer Manufacturing </td>\r\n<td> Aluminum sulfate </td>\r\n</tr>\r\n<tr>\r\n<td> Scorpio Cable Vision </td>\r\n<td> Cable TV network </td>\r\n</tr>\r\n<tr>\r\n<td> FAG Machine Shop and Services Co. </td>\r\n<td> Fabrication shop of industrial parts </td>\r\n</tr>\r\n<tr>\r\n<td> Islacom, Eastern Visayas Telecom, SMART Comm, Inc. </td>\r\n<td> Telecommunications </td>\r\n</tr>\r\n<tr>\r\n<td> Petron Corporation </td>\r\n<td> Fuel (for the requirements of industry locators) </td>\r\n</tr>\r\n<tr>\r\n<td> LIDE Management Corporation </td>\r\n<td> Supervise/manage the Estate and the LIDE Water Supply System </td>\r\n</tr>\r\n</table>\r\n\\n\\n\r\n<b> Feature of the Estate </b>\r\n\\n\\n\r\n<b>LIDE Location</b>: Municipality of Isabel, Northwestern part of the Province of Leyte, Philippines. It can be reached from Manila via airlines to:\r\n\\n\\n\r\na. Cebu City, then a fast craft to Ormoc City, from there a 40-minute ride to LIDE; or\r\n\\n\r\nb. Tacloban City, then ride a chartered or passenger bus for about 3-hours to LIDE.\r\n\\n\\n\r\n<b>Total Area</b>: 420 hectares\r\n\\n\\n\r\n<b>Available Area</b>: 50-hectares may be developed further for other industries for lease or sale to interested locators.\r\n\\n\\n\r\n<b>Support Facilities and Amenities</b>: Security, port and cargo handling facilities, communication facilities, airstrip, reliable water system, fuel tank farm, recreational facilities and direct power connection at Tongonan Geothermal Power Plant.\r\n\\n\\n\r\n<b>Administration of LIDE</b>\r\n\\n\\n\r\nThe LIDE Management Corporation (LMC) was organized and incorporated to manage and administer the entire LIDE complex.', '', 'Philippine Peso(PHP)', '2013-06-07 09:42:31'),
(17, 4, 'First Cavite Industrial Estate, Inc.', 'First Cavite Industrial Estate, Inc. (FCIEI) is a joint venture project of the National Development Company (NDC), Marubeni Corporation and Japan International Development Organization Ltd. (JAIDO), a corporation established by KEIDANREN (Japan Federation of Economic Organization).  FCIEI was registered with the Securities and Exchange Commission (SEC) on December 14, 1990 under SEC Registry No. 184885 and with the Board of Investments (BOI) under Certificate of Registration No. 89-491 dated January 09, 1991.\r\n\\n\\n\r\nMandate:\r\n\\n\\n\r\nFCIEI was created principally to acquire, own, lease, hold, subdivide, construct, develop, equip, operate, maintain and generally deal in industrial estates and in any and all lands, estates, buildings, plants, construction or manufacturing works, canneries, mills, factories, refineries, warehouses and other business structures.  Secondarily, and for such purposes, to acquire, construct, maintain and operate roads, bridges, pumping plants, drainage systems, structures, systems and works of all kinds, and all machinery, equipment, instrument, apparatus and appliances which may be required, needed or used in connection therewith and to do all acts, matters, and things incidental to, necessary or desirable for and in connection with the foregoing\r\n\\n\\n\r\nStatus and Accomplishments:\r\n\r\n<ul style="margin-left:50px">\r\n<li>	FCIE developed the 154.5 hectare property of NDC at Dasmarinas,Cavite into an industrial estate and economic zone.</li>\r\n\r\n<li>	In 1997, after having sold all the saleable lots within the industrial estate, FCIEI transferred the Management and operation of the estate including the infrastructure and common facilities to the FCIE Association, an association composed of all the locators inside the estate.</li>\r\n\r\n<li>	FCIEI executed Contract of lease with the FCIE Association, Inc. for the common areas, roads and open spaces.</li>\r\n\r\n<li>	Signed  MOA providing ROW for the following NDC properties; the NDC Humayao property and the NDC Housing Project (Pueblocillo)</li></ul>\r\n\r\n<p style="margin-left:20px">Plans and Programs:</p>\r\n\r\n<ul style="margin-left:50px">\r\n<li>	The development of NDC’s 19.2 hectares of   land property located at Humayao, Dasmarinas, Cavite, as an expansion of FCIEI.</li> </ul>\r\n', '', 'Philippine Peso(PHP)', '2013-05-22 09:57:34');

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_status_assets`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_status_assets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `under_lease` double NOT NULL,
  `for_sale_lease` double NOT NULL,
  `with_court_case` double NOT NULL,
  `for_relocation_survey` double NOT NULL,
  `for_titling` double NOT NULL,
  `with_jv` double NOT NULL,
  `for_project_development` double NOT NULL,
  `on_going` double NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ndc_tbl_status_assets`
--

INSERT INTO `ndc_tbl_status_assets` (`id`, `under_lease`, `for_sale_lease`, `with_court_case`, `for_relocation_survey`, `for_titling`, `with_jv`, `for_project_development`, `on_going`, `date_updated`, `updated_by`, `year`) VALUES
(3, 13, 27, 3, 3, 7, 1, 3, 2, '2013-06-06 05:02:01', 'randy', 2013);

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_uploads`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_uploads` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `category` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ndc_tbl_uploads`
--

INSERT INTO `ndc_tbl_uploads` (`id`, `date_updated`, `updated_by`, `filename`, `description`, `category`) VALUES
(1, '2013-06-03 08:04:15', 'jonathan', '1368656907349.pdf', 'sample upload', 'ASEAN');

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_users`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) DEFAULT NULL,
  `middle_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `username` varchar(10) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `ndc_group` varchar(10) DEFAULT NULL,
  `role` varchar(30) DEFAULT NULL,
  `is_activated` tinyint(4) DEFAULT NULL,
  `login_attempts` int(11) DEFAULT '0',
  `secret_question` text,
  `secret_answer` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `ndc_tbl_users`
--

INSERT INTO `ndc_tbl_users` (`id`, `first_name`, `middle_name`, `last_name`, `username`, `password`, `email`, `ndc_group`, `role`, `is_activated`, `login_attempts`, `secret_question`, `secret_answer`) VALUES
(1, 'first', 'middle', 'last', 'mlfr', 'b4aee7857a870c9d88d1c189dfca612e', 'sample@yahoo.com', '', 'POWER_USER', 1, 0, NULL, NULL),
(2, 'first', 'middle', 'last', 'colette', 'b0c817ea37fc4d673d4e83b5c666d736', 'sample@yahoo.com', NULL, 'POWER_USER', 1, 0, NULL, NULL),
(3, 'first', 'middle', 'last', 'shm', 'b1a269e5ad5f5e338d64b561def7cce2', 'sample@yahoo.com', NULL, 'TACTICAL_USER', 1, 0, NULL, NULL),
(4, 'first', 'middle', 'last', 'lla', '90fb64acdd95670179c0758edbefe339', 'sample@yahoo.com', NULL, 'TACTICAL_USER', 1, 0, NULL, NULL),
(5, 'first', 'middle', 'last', 'rzm', 'a07587c25ecd3fcdc567de858352747c', 'sample@yahoo.com', NULL, 'TACTICAL_USER', 1, 0, NULL, NULL),
(6, 'first', 'middle', 'last', 'jgl', '105877711d1c3aacb66ca2ab4b17e4f0', 'sample@yahoo.com', NULL, 'TACTICAL_USER', 1, 0, NULL, NULL),
(7, 'Jonathan', 'Dela Cruz', 'Eugenio', 'jonathan', '20b5ce4a6d7bf04ba208349cd56cb024', 'jceugenio2003@yahoo.com', 'SPG', 'SPG_STRATEGIC_USER', 1, 0, 'Month and Year of Appointment in NDC?', 'January 2006'),
(8, 'first', 'middle', 'last', 'rommel', '406614307d4bd3c932be1b696c40fd27', 'sample@yahoo.com', 'SPG', 'SPG_STRATEGIC_USER', 1, 0, NULL, NULL),
(9, 'first', 'middle', 'last', 'vmb', '5a19bf856833e2fea5a935022dd2926f', 'sample@yahoo.com', 'SPG', 'SPG_STRATEGIC_USER', 1, 0, NULL, NULL),
(10, 'Lemuel', 'Dayto', 'Imperial', 'lemuel', '9d67a47cbb78b6b2c75b881eda264590', 'ldimperial@ndc.gov.ph', 'FMG', 'FMG_STRATEGIC_USER', 1, 0, 'Month and Year of Appointment in NDC?', 'March 2006'),
(11, 'first', 'middle', 'last', 'vel', 'a93eed0e4bfbfda2b387636f230791a4', 'sample@yahoo.com', 'AMG', 'AMG_STRATEGIC_USER', 1, 0, NULL, NULL),
(12, 'first', 'middle', 'last', 'jojo', '1a2dd37afa3c6eca7f667cccb48fecee', 'sample@yahoo.com', 'AMG', 'AMG_STRATEGIC_USER', 1, 0, NULL, NULL),
(13, 'Randy', 'Riva', 'Grecia', 'randy', '932ae3c43e5b9478a175863a5c015f1b', 'rrgrecia@ptt.gov.ph', 'AMG', 'AMG_STRATEGIC_USER', 1, 0, 'Month and Year of Appointment in NDC?', 'September 2011'),
(14, 'Laylord Xyrchez', 'Ramones', 'Taganas', 'lay', '7a2da4a1811a1523ed96bf6db94b188a', 'laylordxrt@ndc.gov.ph', 'FAD', 'FAD_STRATEGIC_USER', 1, 0, 'Month and Year of Appointment in NDC?', 'June 2005'),
(15, 'first', 'middle', 'last', 'christie', 'c752118ef2df5d400b35318f85adcd67', 'sample@yahoo.com', 'FAD', 'FAD_STRATEGIC_USER', 1, 0, NULL, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
