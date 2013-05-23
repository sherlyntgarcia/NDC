-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 23, 2013 at 05:08 AM
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
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ndc_tbl_actual_income_expense`
--

INSERT INTO `ndc_tbl_actual_income_expense` (`id`, `year`, `month`, `total_expense`, `total_income`, `actual_advertising`, `actual_athletics`, `actual_auditing`, `actual_consultancy`, `actual_board_expenses`, `actual_christmas_anniversary`, `actual_communication_service`, `actual_extraordinary`, `actual_janitorial`, `actual_legal`, `actual_light_water`, `actual_meetings`, `actual_memberships`, `actual_messengerial`, `actual_misc`, `actual_other_misc`, `actual_rentals`, `actual_repair_facilities`, `actual_repair_vehicles`, `actual_security`, `actual_subscription`, `actual_supplies_materials`, `actual_taxes`, `actual_training`, `actual_travelling`, `budget_advertising`, `budget_athletics`, `budget_auditing`, `budget_consultancy`, `budget_board_expenses`, `budget_christmas_anniversary`, `budget_communication_service`, `budget_extraordinary`, `budget_janitorial`, `budget_legal`, `budget_light_water`, `budget_meetings`, `budget_memberships`, `budget_messengerial`, `budget_misc`, `budget_other_misc`, `budget_rentals`, `budget_repair_facilities`, `budget_repair_vehicles`, `budget_security`, `budget_subscription`, `budget_supplies_materials`, `budget_taxes`, `budget_training`, `budget_travelling`, `date_updated`, `updated_by`) VALUES
(1, 2012, 10, 93466800, 50558659, 66030, 200133, 2866670, 58498, 1884497, 819819, 1756313, 309948, 1489346, 1035124, 3316891, 2276426, 443792, 452008, 3330209, 760352, 1118766, 3163117, 939878, 10101552, 102948, 470904, 12405286, 600578, 589574, 70000, 147000, 5679000, 190000, 3123800, 1082800, 2836000, 406000, 2253600, 1440400, 3758100, 3088000, 462300, 722200, 7432400, 1557900, 1377000, 3619600, 1316000, 15201800, 126700, 588000, 35919400, 441800, 627000, '2013-05-16 14:02:29', 'lay');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ndc_tbl_capital_expenditures`
--

INSERT INTO `ndc_tbl_capital_expenditures` (`id`, `month`, `year`, `date_updated`, `updated_by`, `budget_capital_expenditures`, `actual_capital_expenditures`) VALUES
(1, 10, 2012, '2013-05-08 02:34:42', 'lay', 12920000, 1055937);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ndc_tbl_collection_efficiency`
--

INSERT INTO `ndc_tbl_collection_efficiency` (`id`, `month`, `year`, `current_amount_collected`, `current_amount_billed`, `past_due_amount_collected`, `past_due_amount_billed`, `date_updated`, `updated_by`) VALUES
(1, 0, 2013, 5000000, 4500000, 3000000, 2500000, '2013-04-15 02:28:33', 'lay');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ndc_tbl_logs`
--

INSERT INTO `ndc_tbl_logs` (`id`, `logged_by`, `access_time`, `description`) VALUES
(1, 'vel', '2013-05-22 09:08:11', 'ADDED NEW SHAREHOLDER');

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
(2, 4752740930, 13334094.71, 3450542.38, 11919371.82, '2013-05-20 04:04:06', 'randy', 2010),
(3, 5406729350, 10807097.58, 3450542.38, 12837697.35, '2013-05-20 04:07:24', 'randy', 2011),
(4, 5089681387.5, 11485082.3, 3504290.38, 13561938.53, '2013-05-20 04:08:04', 'randy', 2012);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ndc_tbl_mooe`
--

INSERT INTO `ndc_tbl_mooe` (`id`, `month`, `year`, `date_updated`, `updated_by`, `budget_mooe`, `actual_mooe`) VALUES
(1, 10, 2012, '2013-05-08 02:33:32', 'lay', 93466800, 50558659);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=305 ;

--
-- Dumping data for table `ndc_tbl_notifications`
--

INSERT INTO `ndc_tbl_notifications` (`id`, `user_id`, `message`, `ndc_group`, `date_notified`, `triggered_by`, `visible`) VALUES
(1, 3, 'Updated ''Net Lending''', 'FMG', '2013-05-06 04:17:38', 'lemuel', 1),
(2, 4, 'Updated ''Net Lending''', 'FMG', '2013-05-06 04:17:38', 'lemuel', 1),
(3, 5, 'Updated ''Net Lending''', 'FMG', '2013-05-06 04:17:38', 'lemuel', 1),
(4, 6, 'Updated ''Net Lending''', 'FMG', '2013-05-06 04:17:38', 'lemuel', 1),
(5, 3, 'Updated ''Agri-Agra Bonds''', 'FMG', '2013-05-06 04:33:40', 'lemuel', 1),
(6, 4, 'Updated ''Agri-Agra Bonds''', 'FMG', '2013-05-06 04:33:40', 'lemuel', 1),
(7, 5, 'Updated ''Agri-Agra Bonds''', 'FMG', '2013-05-06 04:33:40', 'lemuel', 1),
(8, 6, 'Updated ''Agri-Agra Bonds''', 'FMG', '2013-05-06 04:33:40', 'lemuel', 1),
(9, 3, 'Updated ''Agri-Agra Bonds''', 'FMG', '2013-05-06 04:34:08', 'lemuel', 1),
(10, 4, 'Updated ''Agri-Agra Bonds''', 'FMG', '2013-05-06 04:34:08', 'lemuel', 1),
(11, 5, 'Updated ''Agri-Agra Bonds''', 'FMG', '2013-05-06 04:34:08', 'lemuel', 1),
(12, 6, 'Updated ''Agri-Agra Bonds''', 'FMG', '2013-05-06 04:34:08', 'lemuel', 1),
(13, 3, 'Updated ''Agri-Agra Bonds''', 'FMG', '2013-05-06 04:34:27', 'lemuel', 1),
(14, 4, 'Updated ''Agri-Agra Bonds''', 'FMG', '2013-05-06 04:34:27', 'lemuel', 1),
(15, 5, 'Updated ''Agri-Agra Bonds''', 'FMG', '2013-05-06 04:34:27', 'lemuel', 1),
(16, 6, 'Updated ''Agri-Agra Bonds''', 'FMG', '2013-05-06 04:34:27', 'lemuel', 1),
(17, 3, 'Updated ''Agri-Agra Bonds''', 'FMG', '2013-05-06 04:34:56', 'lemuel', 1),
(18, 4, 'Updated ''Agri-Agra Bonds''', 'FMG', '2013-05-06 04:34:57', 'lemuel', 1),
(19, 5, 'Updated ''Agri-Agra Bonds''', 'FMG', '2013-05-06 04:34:57', 'lemuel', 1),
(20, 6, 'Updated ''Agri-Agra Bonds''', 'FMG', '2013-05-06 04:34:57', 'lemuel', 1),
(21, 3, 'Updated ''Occupancy Chart''', 'AMG', '2013-05-06 04:43:17', 'vel', 1),
(22, 4, 'Updated ''Occupancy Chart''', 'AMG', '2013-05-06 04:43:17', 'vel', 1),
(23, 5, 'Updated ''Occupancy Chart''', 'AMG', '2013-05-06 04:43:17', 'vel', 1),
(24, 6, 'Updated ''Occupancy Chart''', 'AMG', '2013-05-06 04:43:17', 'vel', 1),
(25, 3, 'Updated ''Sources & Uses of Funds''', 'AMG', '2013-05-06 04:51:27', 'vel', 1),
(26, 4, 'Updated ''Sources & Uses of Funds''', 'AMG', '2013-05-06 04:51:27', 'vel', 1),
(27, 5, 'Updated ''Sources & Uses of Funds''', 'AMG', '2013-05-06 04:51:27', 'vel', 1),
(28, 6, 'Updated ''Sources & Uses of Funds''', 'AMG', '2013-05-06 04:51:27', 'vel', 1),
(29, 3, 'Updated ''Status of Assets''', 'AMG', '2013-05-06 04:58:38', 'vel', 1),
(30, 4, 'Updated ''Status of Assets''', 'AMG', '2013-05-06 04:58:38', 'vel', 1),
(31, 5, 'Updated ''Status of Assets''', 'AMG', '2013-05-06 04:58:38', 'vel', 1),
(32, 6, 'Updated ''Status of Assets''', 'AMG', '2013-05-06 04:58:38', 'vel', 1),
(33, 3, 'Updated ''Occupancy Chart''', 'AMG', '2013-05-08 01:53:26', 'randy', 1),
(34, 4, 'Updated ''Occupancy Chart''', 'AMG', '2013-05-08 01:53:26', 'randy', 1),
(35, 5, 'Updated ''Occupancy Chart''', 'AMG', '2013-05-08 01:53:26', 'randy', 1),
(36, 6, 'Updated ''Occupancy Chart''', 'AMG', '2013-05-08 01:53:26', 'randy', 1),
(37, 3, 'Updated ''Occupancy Chart''', 'AMG', '2013-05-08 01:55:35', 'randy', 1),
(38, 4, 'Updated ''Occupancy Chart''', 'AMG', '2013-05-08 01:55:35', 'randy', 1),
(39, 5, 'Updated ''Occupancy Chart''', 'AMG', '2013-05-08 01:55:35', 'randy', 1),
(40, 6, 'Updated ''Occupancy Chart''', 'AMG', '2013-05-08 01:55:35', 'randy', 1),
(41, 3, 'Updated ''Sources & Uses of Funds''', 'AMG', '2013-05-08 01:59:34', 'randy', 1),
(42, 4, 'Updated ''Sources & Uses of Funds''', 'AMG', '2013-05-08 01:59:34', 'randy', 1),
(43, 5, 'Updated ''Sources & Uses of Funds''', 'AMG', '2013-05-08 01:59:35', 'randy', 1),
(44, 6, 'Updated ''Sources & Uses of Funds''', 'AMG', '2013-05-08 01:59:35', 'randy', 1),
(45, 3, 'Updated ''Sources & Uses of Funds''', 'AMG', '2013-05-08 02:00:17', 'randy', 1),
(46, 4, 'Updated ''Sources & Uses of Funds''', 'AMG', '2013-05-08 02:00:17', 'randy', 1),
(47, 5, 'Updated ''Sources & Uses of Funds''', 'AMG', '2013-05-08 02:00:17', 'randy', 1),
(48, 6, 'Updated ''Sources & Uses of Funds''', 'AMG', '2013-05-08 02:00:18', 'randy', 1),
(49, 3, 'Updated ''Status of Assets''', 'AMG', '2013-05-08 02:02:59', 'randy', 1),
(50, 4, 'Updated ''Status of Assets''', 'AMG', '2013-05-08 02:02:59', 'randy', 1),
(51, 5, 'Updated ''Status of Assets''', 'AMG', '2013-05-08 02:02:59', 'randy', 1),
(52, 6, 'Updated ''Status of Assets''', 'AMG', '2013-05-08 02:02:59', 'randy', 1),
(53, 3, 'Updated ''Projected Actual Income''', 'FAD', '2013-05-08 02:15:09', 'lay', 1),
(54, 4, 'Updated ''Projected Actual Income''', 'FAD', '2013-05-08 02:15:09', 'lay', 1),
(55, 5, 'Updated ''Projected Actual Income''', 'FAD', '2013-05-08 02:15:09', 'lay', 1),
(56, 6, 'Updated ''Projected Actual Income''', 'FAD', '2013-05-08 02:15:09', 'lay', 1),
(57, 3, 'Updated ''Projected Income''', 'FAD', '2013-05-08 02:17:02', 'lay', 1),
(58, 4, 'Updated ''Projected Income''', 'FAD', '2013-05-08 02:17:02', 'lay', 1),
(59, 5, 'Updated ''Projected Income''', 'FAD', '2013-05-08 02:17:02', 'lay', 1),
(60, 6, 'Updated ''Projected Income''', 'FAD', '2013-05-08 02:17:02', 'lay', 1),
(61, 3, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-08 02:28:08', 'lay', 1),
(62, 4, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-08 02:28:08', 'lay', 1),
(63, 5, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-08 02:28:09', 'lay', 1),
(64, 6, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-08 02:28:09', 'lay', 1),
(65, 3, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-08 02:28:33', 'lay', 1),
(66, 4, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-08 02:28:33', 'lay', 1),
(67, 5, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-08 02:28:33', 'lay', 1),
(68, 6, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-08 02:28:33', 'lay', 1),
(69, 3, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-08 02:29:01', 'lay', 1),
(70, 4, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-08 02:29:01', 'lay', 1),
(71, 5, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-08 02:29:01', 'lay', 1),
(72, 6, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-08 02:29:01', 'lay', 1),
(73, 3, 'Updated ''Budget Utilization (Personal Services)''', 'FAD', '2013-05-08 02:32:23', 'lay', 1),
(74, 4, 'Updated ''Budget Utilization (Personal Services)''', 'FAD', '2013-05-08 02:32:23', 'lay', 1),
(75, 5, 'Updated ''Budget Utilization (Personal Services)''', 'FAD', '2013-05-08 02:32:23', 'lay', 1),
(76, 6, 'Updated ''Budget Utilization (Personal Services)''', 'FAD', '2013-05-08 02:32:23', 'lay', 1),
(77, 3, 'Updated ''Budget Utilization (Maintenance & Other Operating Expenses)''', 'FAD', '2013-05-08 02:33:32', 'lay', 1),
(78, 4, 'Updated ''Budget Utilization (Maintenance & Other Operating Expenses)''', 'FAD', '2013-05-08 02:33:32', 'lay', 1),
(79, 5, 'Updated ''Budget Utilization (Maintenance & Other Operating Expenses)''', 'FAD', '2013-05-08 02:33:32', 'lay', 1),
(80, 6, 'Updated ''Budget Utilization (Maintenance & Other Operating Expenses)''', 'FAD', '2013-05-08 02:33:32', 'lay', 1),
(81, 3, 'Updated ''Budget Utilization (Capital Expenditures)''', 'FAD', '2013-05-08 02:34:43', 'lay', 1),
(82, 4, 'Updated ''Budget Utilization (Capital Expenditures)''', 'FAD', '2013-05-08 02:34:43', 'lay', 1),
(83, 5, 'Updated ''Budget Utilization (Capital Expenditures)''', 'FAD', '2013-05-08 02:34:43', 'lay', 1),
(84, 6, 'Updated ''Budget Utilization (Capital Expenditures)''', 'FAD', '2013-05-08 02:34:43', 'lay', 1),
(85, 3, 'Updated ''Principal & Coupon Payments''', 'FMG', '2013-05-08 02:43:30', 'lemuel', 1),
(86, 4, 'Updated ''Principal & Coupon Payments''', 'FMG', '2013-05-08 02:43:30', 'lemuel', 1),
(87, 5, 'Updated ''Principal & Coupon Payments''', 'FMG', '2013-05-08 02:43:30', 'lemuel', 1),
(88, 6, 'Updated ''Principal & Coupon Payments''', 'FMG', '2013-05-08 02:43:30', 'lemuel', 1),
(89, 3, 'Updated ''Principal & Coupon Payments''', 'FMG', '2013-05-08 02:44:34', 'lemuel', 1),
(90, 4, 'Updated ''Principal & Coupon Payments''', 'FMG', '2013-05-08 02:44:35', 'lemuel', 1),
(91, 5, 'Updated ''Principal & Coupon Payments''', 'FMG', '2013-05-08 02:44:35', 'lemuel', 1),
(92, 6, 'Updated ''Principal & Coupon Payments''', 'FMG', '2013-05-08 02:44:35', 'lemuel', 1),
(93, 3, 'Updated ''Principal & Coupon Payments''', 'FMG', '2013-05-08 02:45:19', 'lemuel', 1),
(94, 4, 'Updated ''Principal & Coupon Payments''', 'FMG', '2013-05-08 02:45:19', 'lemuel', 1),
(95, 5, 'Updated ''Principal & Coupon Payments''', 'FMG', '2013-05-08 02:45:19', 'lemuel', 1),
(96, 6, 'Updated ''Principal & Coupon Payments''', 'FMG', '2013-05-08 02:45:19', 'lemuel', 1),
(97, 3, 'Updated ''Principal & Coupon Payments''', 'FMG', '2013-05-08 02:46:02', 'lemuel', 1),
(98, 4, 'Updated ''Principal & Coupon Payments''', 'FMG', '2013-05-08 02:46:02', 'lemuel', 1),
(99, 5, 'Updated ''Principal & Coupon Payments''', 'FMG', '2013-05-08 02:46:02', 'lemuel', 1),
(100, 6, 'Updated ''Principal & Coupon Payments''', 'FMG', '2013-05-08 02:46:02', 'lemuel', 1),
(101, 3, 'Updated ''Bond Maturity''', 'FMG', '2013-05-08 02:52:27', 'lemuel', 1),
(102, 4, 'Updated ''Bond Maturity''', 'FMG', '2013-05-08 02:52:27', 'lemuel', 1),
(103, 5, 'Updated ''Bond Maturity''', 'FMG', '2013-05-08 02:52:27', 'lemuel', 1),
(104, 6, 'Updated ''Bond Maturity''', 'FMG', '2013-05-08 02:52:27', 'lemuel', 1),
(105, 3, 'Updated ''Bond Maturity''', 'FMG', '2013-05-08 02:52:53', 'lemuel', 1),
(106, 4, 'Updated ''Bond Maturity''', 'FMG', '2013-05-08 02:52:53', 'lemuel', 1),
(107, 5, 'Updated ''Bond Maturity''', 'FMG', '2013-05-08 02:52:53', 'lemuel', 1),
(108, 6, 'Updated ''Bond Maturity''', 'FMG', '2013-05-08 02:52:53', 'lemuel', 1),
(109, 3, 'Updated ''Bond Maturity''', 'FMG', '2013-05-08 02:53:15', 'lemuel', 1),
(110, 4, 'Updated ''Bond Maturity''', 'FMG', '2013-05-08 02:53:15', 'lemuel', 1),
(111, 5, 'Updated ''Bond Maturity''', 'FMG', '2013-05-08 02:53:15', 'lemuel', 1),
(112, 6, 'Updated ''Bond Maturity''', 'FMG', '2013-05-08 02:53:15', 'lemuel', 1),
(113, 3, 'Updated ''Bond Maturity''', 'FMG', '2013-05-08 02:53:37', 'lemuel', 1),
(114, 4, 'Updated ''Bond Maturity''', 'FMG', '2013-05-08 02:53:37', 'lemuel', 1),
(115, 5, 'Updated ''Bond Maturity''', 'FMG', '2013-05-08 02:53:37', 'lemuel', 1),
(116, 6, 'Updated ''Bond Maturity''', 'FMG', '2013-05-08 02:53:37', 'lemuel', 1),
(117, 3, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-16 14:02:29', 'lay', 1),
(118, 4, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-16 14:02:29', 'lay', 1),
(119, 5, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-16 14:02:29', 'lay', 1),
(120, 6, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-16 14:02:29', 'lay', 1),
(121, 3, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-16 14:07:35', 'lay', 1),
(122, 4, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-16 14:07:35', 'lay', 1),
(123, 5, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-16 14:07:35', 'lay', 1),
(124, 6, 'Updated ''Actual Income and Actual Expense''', 'FAD', '2013-05-16 14:07:35', 'lay', 1),
(125, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:48:07', 'jonathan', 1),
(126, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:48:07', 'jonathan', 1),
(127, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:48:08', 'jonathan', 1),
(128, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:48:08', 'jonathan', 1),
(129, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:48:26', 'jonathan', 1),
(130, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:48:26', 'jonathan', 1),
(131, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:48:26', 'jonathan', 1),
(132, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:48:26', 'jonathan', 1),
(133, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:48:47', 'jonathan', 1),
(134, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:48:47', 'jonathan', 1),
(135, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:48:47', 'jonathan', 1),
(136, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:48:47', 'jonathan', 1),
(137, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:49:04', 'jonathan', 1),
(138, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:49:04', 'jonathan', 1),
(139, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:49:04', 'jonathan', 1),
(140, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:49:04', 'jonathan', 1),
(141, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:49:24', 'jonathan', 1),
(142, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:49:24', 'jonathan', 1),
(143, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:49:24', 'jonathan', 1),
(144, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:49:24', 'jonathan', 1),
(145, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:49:41', 'jonathan', 1),
(146, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:49:41', 'jonathan', 1),
(147, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:49:41', 'jonathan', 1),
(148, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:49:41', 'jonathan', 1),
(149, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:49:55', 'jonathan', 1),
(150, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:49:55', 'jonathan', 1),
(151, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:49:55', 'jonathan', 1),
(152, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:49:55', 'jonathan', 1),
(153, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:50:11', 'jonathan', 1),
(154, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:50:11', 'jonathan', 1),
(155, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:50:11', 'jonathan', 1),
(156, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:50:11', 'jonathan', 1),
(157, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:50:29', 'jonathan', 1),
(158, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:50:29', 'jonathan', 1),
(159, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:50:29', 'jonathan', 1),
(160, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 01:50:29', 'jonathan', 1),
(161, 3, 'Updated ''Occupancy Chart''', 'AMG', '2013-05-20 04:04:06', 'randy', 1),
(162, 4, 'Updated ''Occupancy Chart''', 'AMG', '2013-05-20 04:04:07', 'randy', 1),
(163, 5, 'Updated ''Occupancy Chart''', 'AMG', '2013-05-20 04:04:07', 'randy', 1),
(164, 6, 'Updated ''Occupancy Chart''', 'AMG', '2013-05-20 04:04:07', 'randy', 1),
(165, 3, 'Updated ''Occupancy Chart''', 'AMG', '2013-05-20 04:07:24', 'randy', 1),
(166, 4, 'Updated ''Occupancy Chart''', 'AMG', '2013-05-20 04:07:24', 'randy', 1),
(167, 5, 'Updated ''Occupancy Chart''', 'AMG', '2013-05-20 04:07:24', 'randy', 1),
(168, 6, 'Updated ''Occupancy Chart''', 'AMG', '2013-05-20 04:07:24', 'randy', 1),
(169, 3, 'Updated ''Occupancy Chart''', 'AMG', '2013-05-20 04:08:05', 'randy', 1),
(170, 4, 'Updated ''Occupancy Chart''', 'AMG', '2013-05-20 04:08:05', 'randy', 1),
(171, 5, 'Updated ''Occupancy Chart''', 'AMG', '2013-05-20 04:08:05', 'randy', 1),
(172, 6, 'Updated ''Occupancy Chart''', 'AMG', '2013-05-20 04:08:05', 'randy', 1),
(173, 3, 'Updated ''Status of Assets''', 'AMG', '2013-05-20 05:36:48', 'randy', 1),
(174, 4, 'Updated ''Status of Assets''', 'AMG', '2013-05-20 05:36:48', 'randy', 1),
(175, 5, 'Updated ''Status of Assets''', 'AMG', '2013-05-20 05:36:48', 'randy', 1),
(176, 6, 'Updated ''Status of Assets''', 'AMG', '2013-05-20 05:36:48', 'randy', 1),
(177, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 08:23:46', 'jonathan', 1),
(178, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 08:23:46', 'jonathan', 1),
(179, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 08:23:46', 'jonathan', 1),
(180, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 08:23:46', 'jonathan', 1),
(181, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 08:24:13', 'jonathan', 1),
(182, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 08:24:13', 'jonathan', 1),
(183, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 08:24:13', 'jonathan', 1),
(184, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 08:24:13', 'jonathan', 1),
(185, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 08:29:14', 'jonathan', 1),
(186, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 08:29:14', 'jonathan', 1),
(187, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 08:29:14', 'jonathan', 1),
(188, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 08:29:14', 'jonathan', 1),
(189, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 08:29:33', 'jonathan', 1),
(190, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 08:29:33', 'jonathan', 1),
(191, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 08:29:34', 'jonathan', 1),
(192, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 08:29:34', 'jonathan', 1),
(193, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 08:29:52', 'jonathan', 1),
(194, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 08:29:52', 'jonathan', 1),
(195, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 08:29:52', 'jonathan', 1),
(196, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 08:29:52', 'jonathan', 1),
(197, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 08:30:20', 'jonathan', 1),
(198, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 08:30:20', 'jonathan', 1),
(199, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 08:30:20', 'jonathan', 1),
(200, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 08:30:20', 'jonathan', 1),
(201, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:31:47', 'jonathan', 1),
(202, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:31:47', 'jonathan', 1),
(203, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:31:47', 'jonathan', 1),
(204, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:31:47', 'jonathan', 1),
(205, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:32:09', 'jonathan', 1),
(206, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:32:09', 'jonathan', 1),
(207, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:32:09', 'jonathan', 1),
(208, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:32:09', 'jonathan', 1),
(209, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:32:33', 'jonathan', 1),
(210, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:32:33', 'jonathan', 1),
(211, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:32:33', 'jonathan', 1),
(212, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:32:33', 'jonathan', 1),
(213, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:32:56', 'jonathan', 1),
(214, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:32:56', 'jonathan', 1),
(215, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:32:56', 'jonathan', 1),
(216, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:32:56', 'jonathan', 1),
(217, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:33:15', 'jonathan', 1),
(218, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:33:15', 'jonathan', 1),
(219, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:33:15', 'jonathan', 1),
(220, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:33:15', 'jonathan', 1),
(221, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:33:32', 'jonathan', 1),
(222, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:33:32', 'jonathan', 1),
(223, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:33:32', 'jonathan', 1),
(224, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:33:32', 'jonathan', 1),
(225, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:33:53', 'jonathan', 1),
(226, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:33:53', 'jonathan', 1),
(227, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:33:53', 'jonathan', 1),
(228, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:33:53', 'jonathan', 1),
(229, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:34:14', 'jonathan', 1),
(230, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:34:14', 'jonathan', 1),
(231, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:34:14', 'jonathan', 1),
(232, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:34:14', 'jonathan', 1),
(233, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:34:31', 'jonathan', 1),
(234, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:34:31', 'jonathan', 1),
(235, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:34:31', 'jonathan', 1),
(236, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:34:31', 'jonathan', 1),
(237, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:36:00', 'jonathan', 1),
(238, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:36:00', 'jonathan', 1),
(239, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:36:00', 'jonathan', 1),
(240, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:36:01', 'jonathan', 1),
(241, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:37:31', 'jonathan', 1),
(242, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:37:31', 'jonathan', 1),
(243, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:37:31', 'jonathan', 1),
(244, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:37:31', 'jonathan', 1),
(245, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:39:07', 'jonathan', 1),
(246, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:39:07', 'jonathan', 1),
(247, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:39:07', 'jonathan', 1),
(248, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:39:07', 'jonathan', 1),
(249, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:39:54', 'jonathan', 1),
(250, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:39:54', 'jonathan', 1),
(251, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:39:54', 'jonathan', 1),
(252, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:39:54', 'jonathan', 1),
(253, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:43:07', 'jonathan', 1),
(254, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:43:07', 'jonathan', 1),
(255, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:43:07', 'jonathan', 1),
(256, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:43:07', 'jonathan', 1),
(257, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:43:28', 'jonathan', 1),
(258, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:43:28', 'jonathan', 1),
(259, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:43:28', 'jonathan', 1),
(260, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:43:28', 'jonathan', 1),
(261, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:43:48', 'jonathan', 1),
(262, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:43:48', 'jonathan', 1),
(263, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:43:48', 'jonathan', 1),
(264, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:43:48', 'jonathan', 1),
(265, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:44:06', 'jonathan', 1),
(266, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:44:06', 'jonathan', 1),
(267, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:44:06', 'jonathan', 1),
(268, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:44:06', 'jonathan', 1),
(269, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:44:24', 'jonathan', 1),
(270, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:44:24', 'jonathan', 1),
(271, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:44:24', 'jonathan', 1),
(272, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:44:24', 'jonathan', 1),
(273, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:44:40', 'jonathan', 1),
(274, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:44:40', 'jonathan', 1),
(275, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:44:40', 'jonathan', 1),
(276, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:44:40', 'jonathan', 1),
(277, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:44:54', 'jonathan', 1),
(278, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:44:54', 'jonathan', 1),
(279, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:44:54', 'jonathan', 1),
(280, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:44:54', 'jonathan', 1),
(281, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:45:06', 'jonathan', 1),
(282, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:45:06', 'jonathan', 1),
(283, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:45:06', 'jonathan', 1),
(284, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:45:06', 'jonathan', 1),
(285, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:49:44', 'jonathan', 1),
(286, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:49:44', 'jonathan', 1),
(287, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:49:44', 'jonathan', 1),
(288, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:49:44', 'jonathan', 1),
(289, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:50:02', 'jonathan', 1),
(290, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:50:02', 'jonathan', 1),
(291, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:50:02', 'jonathan', 1),
(292, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:50:02', 'jonathan', 1),
(293, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:50:22', 'jonathan', 1),
(294, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:50:22', 'jonathan', 1),
(295, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:50:22', 'jonathan', 1),
(296, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:50:22', 'jonathan', 1),
(297, 3, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:50:40', 'jonathan', 1),
(298, 4, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:50:40', 'jonathan', 1),
(299, 5, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:50:40', 'jonathan', 1),
(300, 6, 'Updated ''Shareholder''', 'SPG', '2013-05-20 09:50:40', 'jonathan', 1),
(301, 3, 'Updated ''Shareholder''', 'AMG', '2013-05-22 09:08:11', 'vel', 1),
(302, 4, 'Updated ''Shareholder''', 'AMG', '2013-05-22 09:08:11', 'vel', 1),
(303, 5, 'Updated ''Shareholder''', 'AMG', '2013-05-22 09:08:11', 'vel', 1),
(304, 6, 'Updated ''Shareholder''', 'AMG', '2013-05-22 09:08:11', 'vel', 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

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
(13, 0.5568, 0.3088, 0.4854, 0.6414, 1.6532, 2.1147, 2.26, 2.2048, 2.2661, 2.4919, 3.2412, 3.1894, '2013-04-15 02:33:33', 'lemuel', 2012, 11);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ndc_tbl_personal_services`
--

INSERT INTO `ndc_tbl_personal_services` (`id`, `month`, `year`, `date_updated`, `updated_by`, `budget_personal_services`, `actual_personal_services`) VALUES
(1, 10, 2012, '2013-05-08 02:32:23', 'lay', 22308000, 17532213);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ndc_tbl_projected_actual_income`
--

INSERT INTO `ndc_tbl_projected_actual_income` (`id`, `actual_income`, `date_updated`, `updated_by`, `actual_dividend`, `actual_interest`, `actual_rental`, `actual_gain_on_sale`, `actual_other_income`) VALUES
(1, 720790000, '2013-05-08 02:15:09', 'lay', 147600000, 461600000, 88840000, 22650000, 100000);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ndc_tbl_projected_actual_income_2`
--

INSERT INTO `ndc_tbl_projected_actual_income_2` (`id`, `projected_income`, `projected_dividend`, `projected_interest`, `projected_rental`, `projected_gain_on_sale`, `projected_other_income`, `date_updated`, `updated_by`) VALUES
(1, 992200000, 265900000, 356800000, 97900000, 271400000, 200000, '2013-05-08 02:17:02', 'lay');

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
(50, 'Ma. Lourdes F. Rebueno', 1, 15, '2013-04-15 02:35:34', 'jonathan'),
(51, 'Saturnino H. Mejia', 1, 15, '2013-04-15 02:35:34', 'jonathan'),
(52, 'Lilia L. Arce', 1, 15, '2013-04-15 02:35:34', 'jonathan'),
(53, 'Rhoel Z. Mabazza', 1, 15, '2013-04-15 02:35:34', 'jonathan'),
(54, 'Josephine A. Batiller', 1, 15, '2013-04-15 02:35:34', 'jonathan'),
(55, 'National Development Company', 9995, 17, '2013-04-15 02:35:34', 'jonathan'),
(56, 'Lilia L. Arce', 1, 17, '2013-04-15 02:35:34', 'jonathan'),
(57, 'Saturnino H. Mejia', 1, 17, '2013-04-15 02:35:34', 'jonathan'),
(58, 'Ma. Lourdes F. Rebueno', 1, 17, '2013-04-15 02:35:34', 'jonathan'),
(59, 'Rhoel Z. Mabazza', 1, 17, '2013-04-15 02:35:34', 'jonathan'),
(60, 'Ma. Christina D. De Castro', 1, 17, '2013-04-15 02:35:34', 'jonathan'),
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

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
(33, 15, 59357960, 2302806, 3.9, 'jonathan', '2013-04-15 02:36:47', 2011);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

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
(33, 15, -54552, 0, 0, '2013-04-15 02:37:07', 'jonathan', 2011);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `ndc_tbl_spg_income_statement`
--

INSERT INTO `ndc_tbl_spg_income_statement` (`id`, `project_id`, `revenue`, `net_income`, `profit_margin`, `date_updated`, `updated_by`, `year`) VALUES
(1, 1, 700388, 164249, 33.5, '2013-04-15 02:37:27', 'jonathan', 2009),
(2, 1, 513239, 65957, 18.9, '2013-04-15 02:37:27', 'jonathan', 2010),
(3, 1, 652663, 205144, 45.7, '2013-04-15 02:37:27', 'jonathan', 2011),
(4, 6, 11943.7, 1846, 21.7, '2013-04-15 02:37:27', 'jonathan', 2009),
(5, 6, 22897.8, 3952, 30, '2013-04-15 02:37:27', 'jonathan', 2010),
(6, 6, 25813.6, 6031.1, 35.3, '2013-04-15 02:37:27', 'jonathan', 2011),
(7, 8, 110398620, 1993213, 2.6, '2013-04-15 02:37:27', 'jonathan', 2009),
(8, 8, 135798151, 15892033, 12.1, '2013-04-15 02:37:27', 'jonathan', 2010),
(9, 8, 127334325, -1329201, -1.3, '2013-04-15 02:37:27', 'jonathan', 2011),
(10, 9, 902806208, 83334998, 89.6, '2013-04-15 02:37:27', 'jonathan', 2009),
(11, 9, 677573396, 58717920, 89.9, '2013-04-15 02:37:27', 'jonathan', 2010),
(12, 9, 1484743648, 429563731, 67, '2013-04-15 02:37:27', 'jonathan', 2011),
(13, 12, 23982025, 437698, 1.6, '2013-04-15 02:37:27', 'jonathan', 2009),
(14, 12, 34534428, 23352699, 94.4, '2013-04-15 02:37:27', 'jonathan', 2010),
(15, 12, 17718418, 9523856, 74.2, '2013-04-15 02:37:27', 'jonathan', 2011),
(16, 11, 3566627, 2092812, 29.9, '2013-04-15 02:37:27', 'jonathan', 2009),
(17, 11, 3660681, 1850102, 63.6, '2013-04-15 02:37:27', 'jonathan', 2010),
(18, 11, 3624800, 1710709, 64, '2013-04-15 02:37:27', 'jonathan', 2011),
(19, 13, 397532, 62685, 21.4, '2013-04-15 02:37:27', 'jonathan', 2009),
(20, 13, 397532, 50714, 17.1, '2013-04-15 02:37:27', 'jonathan', 2010),
(21, 13, 8313858, -720532, -6.8, '2013-04-15 02:37:27', 'jonathan', 2011),
(22, 10, 695522, 64404, 12.9, '2013-04-15 02:37:27', 'jonathan', 2009),
(23, 10, 695522, 53625, 10.6, '2013-04-15 02:37:27', 'jonathan', 2010),
(24, 10, 13748946, 9535407, 98.1, '2013-04-15 02:37:27', 'jonathan', 2011),
(25, 17, 649931, -100413, -15.4, '2013-04-15 02:37:27', 'jonathan', 2009),
(26, 17, 597047, -2778511, -464.1, '2013-04-15 02:37:27', 'jonathan', 2010),
(27, 17, 527455, -1912332, -361.2, '2013-04-15 02:37:27', 'jonathan', 2011),
(28, 16, 0, 0, 0, '2013-04-15 02:37:27', 'jonathan', 2009),
(29, 16, 127171115, 8738775, 28.7, '2013-04-15 02:37:27', 'jonathan', 2010),
(30, 16, 126711894, 4338094, 29.3, '2013-04-15 02:37:27', 'jonathan', 2011),
(31, 15, 2018848, 1092399, 54.1, '2013-04-15 02:37:27', 'jonathan', 2009),
(32, 15, 1459202, 457009, 31.3, '2013-04-15 02:37:27', 'jonathan', 2010),
(33, 15, 1329731, 383795, 28.9, '2013-04-15 02:37:27', 'jonathan', 2011);

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
(10, 4, 'Pinagkaisa Realty Corporation', 'The Pinagkaisa Realty Corporation (PRC) was organized in 1977 under the Corporation Law of the Philippines and registered with the Securities and Exchange Commission on March 13, 1978 under Registry Number 78665.\r\n\\n\\n\r\nThe Company was organized to acquire, buy, sell, exchange, manage, improve, lease, or otherwise deal in real property.\r\n\\n\\n\r\nWith the termination of the American Parity Agreement on July 3, 1974, the National Development Company (NDC) acquired through absolute purchase 60% undivided interest in the four parcels of land owned by the Philippine Electric Manufacturing Company (PEMCO), [now GE Lighting Philippines, Inc. (GELP)]. On September 30, 1977, a Deed of Assignment and Transfer was executed wherein NDC and PEMCO conveyed their respective 60% and 40% undivided interest in exchange for fully paid shares of stock of PRC.\r\n\\n\\n\r\nIn November 1977, a Contract of Lease was executed between PRC and PEMCO leasing the subject parcels of land to the latter for a period of twenty-five (25) years, renewable for another twenty-five (25) years.   The said Contract of Lease, which was effective October 1, 1977, expired on September 30, 2002.  \r\n\\n\\n\r\nA New Lease Contract was executed on July 4, 2011 for a period of 18 years and 3 months commencing on 01 October 2002 and ending on December 31, 2020.', '', 'Philippine Peso(PHP)', '2013-05-23 02:55:15'),
(11, 4, 'Kamayan Realty Corporation', 'KRC was organized with the primary purpose of allowing then Getty Oil Philippines Inc. (now Pilipinas Shell Petroleum Corporation) [Shell]) to continue its business on the land they used to own.  The National Development Company (NDC) owns 60% of KRC and the balance of 40% is owned by Shell.\r\nKRC owns 54 parcels of land located in various cities and municipalities in the Philippines with a land area of 40,139 square meters. The estimated fair market value of the KRC landholdings as of July and August 2010 based on third party appraisal is P352,356,000.00.\r\nIn 2001, Shell renewed the lease for ten (10) years covering 26 parcels in eleven (11) locations with an area of 15,046.8 square meters and returned to KRC 28 parcels in four (4) locations or an area of 25,092.20 square meters for KRC to dispose through sale or lease via public bidding. \r\n\\n\\n\r\nIn 2012, Shell renewed the lease for fifteen (15) years covering 14 parcels in seven locations or an area of 7,242.10 square meters; returned to KRC eight (8) parcels in three (3) locations with an area of 5,982 square meters while awaiting completion of environmental clean-up of the Sta. Mesa site consisting of four (4) parcels or an area of 1,822.70 square meters.', '', 'Philippine Peso(PHP)', '2013-05-22 09:55:14'),
(12, 4, 'Batangas Land Co. Inc.', 'Batangas Land Company, Inc. (BLC) was organized with the primary purpose of allowing Caltex Philippines, Inc. (now Chevron Philippines Inc. [Chevron]) to continue its business in the lands they used to own. NDC owns 60% of BLC and the balance of 40% is owned by Chevron.\r\nBLC owns 162 parcels of land located in various cities and provinces in the Philippines with a land area of 1,929,205 square meters. The estimated fair market value of the BLC landholdings as of 28 November 2007 based on the average of two (2) third party appraisal is P3.8 Billion.\r\nOut of the 162 parcels of land, 15 parcels with a total area of 116,921 square meters were returned by Chevron for BLC to dispose through public bidding.  \r\n\\n\\n\r\nThe balance of 147 parcels or 1,812,284 square meters are leased to Chevron until 30 September 2025.', '', 'Philippine Peso(PHP)', '2013-05-23 02:54:35'),
(13, 4, 'Gy Real Estate, Inc.', 'The GY Real Estate, Inc. (GYREI) was organized in 1973 under the Corporation Law of the Philippines and registered with the Securities and Exchange Commission on February 1, 1974 under Registry Number 54511.\r\n\\n\\n\r\nThe Company was created to acquire, buy, sell, exchange, manage, improve, lease, or otherwise deal in real property.\r\n\\n\\n\r\nWith the termination of the American Parity Agreement on July 3, 1974, Goodyear Phils., Inc. (GPI) (formerly Goodyear Tire and Rubber Company of the Philippines, Ltd.) donated 60% of its undivided interest, right and title to its two (2) parcels of land to the National Development Company (NDC) on May 26, 1975.  On the same day, NDC and GPI entered into a Deed of Transfer and Conveyance and conveyed these two (2) parcels of land to GYREI for a 60% and 40% undivided interest, respectively, in exchange for fully paid shares of stock of the Company.  Still on the same date, a Contract of Lease was executed by and between GYREI and GPI leasing to the latter the two (2) parcels of land located at Almanza, Las Piñas for a period of 25 years, renewable for another 25 years.  The Contract of Lease has expired on May 26, 2000.  \r\nIn their meetings on November 18 and 27, 2009, respectively, the NDC and GYREI Boards approved the renewal of the Contract of Lease with GPI retroactive May 26, 2000 and was terminated effective April 15, 2011.  \r\n\\n\\n\r\nThe Company has an existing Contract of Lease  with  HH  Asia   Tyre  Corporation (HH ATC) for the period April 16, 2011 to November 30, 2013.', '', 'Philippine Peso(PHP)', '2013-05-22 09:54:36'),
(14, 5, 'Refractories Corporation of the Philippines', 'RCP was established on 13 October 1976 to manufacture refractory products. It operates a plant for monolithic refractories in Valenzuela City, Metro Manila. It closed its other manufacturing plant in Iligan City which was designed to produce refractory bricks for the cement industry. \r\n\\n\\n\r\nDownturn in the cement industry resulted in financial difficulties for RCP. This led the company to file for corporate rehabilitation on 2 September 2009 before the Regional Trial Court, Branch 159, in Pasig City.', '', 'Philippine Peso(PHP)', '2013-05-23 02:52:00'),
(15, 6, 'Philippine Infrastructure Corporation', 'NDC-Philippine Infrastructure Corporation (NPIC) was incorporated under the Securities and Exchange Commission under Registration No. CS200501240 on January 27, 2005.  Its incorporation was authorized per Memorandum from the Executive Secretary, dated December 13, 2004, upon the  recommendation of the Secretary of the Department of Trade and Industry and Secretary of Finance and shall be attached to the DTI.\r\n\r\nMandate:\r\n\r\nDevelop, package, structure and or manage investments in infrastructure projects and commercial ventures related to the development of infrastructure in which the NDC wishes to participate or invest. \r\n\r\nStatus and Accomplishments:\r\n\r\n<ul style="margin-left:50px">\r\n<li>	Completed the Business Plan for the Laguindingan and Mindanao Airports Development Projects.</li>\r\n\r\n<li>	Completed the Preliminary Engineering Design for the Daang Hari-SLEX Link Road Project</li>\r\n\r\n<li>	Completed the Feasibility Study on the Calamba-Laguna (CALA) North-South Expressway Project</li>\r\n\r\n<li>	Completed the Feasibility Study on the R10C3R9 Expressway Project</li>\r\n</ul>\r\n\r\n<p style="margin-left:20px">Plans and Programs:</p>\r\n\r\n<ul style="margin-left:50px">\r\n<li>	To channel the Official Development Assistance (ODA) loans from Japan International Cooperation Agency (JICA) to NDC-PIC that will eventually be provide by a sovereign guarantee cover from NDC  and DOF</li>\r\n\r\n<li>	These loans will be re-lend to private infrastructure projects  with the private commercial banks providing additional loans to the projects.</li>\r\n</ul>', '', 'Philippine Peso(PHP)', '2013-05-23 03:04:35'),
(16, 4, 'LIDE Management Corporation', 'The Leyte Industrial Estate (LIDE) was established in November 1979 through Letter of Instruction No. 962 to spur economic development in Region VIII and as prime site for heavy industries.\r\n\\n\\n\r\nThe LIDE property is owned by the Nationa l Development Company, a government owned and controlled corporation, attached to the Department of Trade and Industry.\r\n\\n\\n\r\nLIDE has been proclaimed as Special Economic Zone (SEZ) under RA 7195 as amended by RA 8748 or the Special Economic Zone Act of 1995.\r\n\\n\\n\r\nThe LIDE Management Corporation (LMC) through the collective efforts of the National Development Company (NDC), PHILPHOS and PASAR, has been organized and incorporated on December 31, 1993 to manage and administer the entire LIDE Complex, and assume the functions of PHILPHOS and PASAR over the operations of the LIDE Water Supply System (LWSS) Project and Support Facilities Administration (SFA).\r\n\\n\\n\r\nThe LIDE Management Corporation is located at the LIDE Compound in Isabel, Leyte. It is being managed and operated by key competent personnel composed of General Manager, Department Managers, Section Heads, Community Relations Officer and Administrative Support Staff. The Company is under the supervision of the Board of Directors (BOD) composed of highly qualified experts and well-respected officers from the NDC as the BOD Chair, and members from PASAR and PHILPHOS.', '', 'Philippine Peso(PHP)', '2013-05-23 02:57:20'),
(17, 4, 'First Cavite Industrial Estate, Inc.', 'First Cavite Industrial Estate, Inc. (FCIEI) is a joint venture project of the National Development Company (NDC), Marubeni Corporation and Japan International Development Organization Ltd. (JAIDO), a corporation established by KEIDANREN (Japan Federation of Economic Organization).  FCIEI was registered with the Securities and Exchange Commission (SEC) on December 14, 1990 under SEC Registry No. 184885 and with the Board of Investments (BOI) under Certificate of Registration No. 89-491 dated January 09, 1991.\r\n\\n\\n\r\nMandate:\r\n\\n\\n\r\nFCIEI was created principally to acquire, own, lease, hold, subdivide, construct, develop, equip, operate, maintain and generally deal in industrial estates and in any and all lands, estates, buildings, plants, construction or manufacturing works, canneries, mills, factories, refineries, warehouses and other business structures.  Secondarily, and for such purposes, to acquire, construct, maintain and operate roads, bridges, pumping plants, drainage systems, structures, systems and works of all kinds, and all machinery, equipment, instrument, apparatus and appliances which may be required, needed or used in connection therewith and to do all acts, matters, and things incidental to, necessary or desirable for and in connection with the foregoing\r\n\\n\\n\r\nStatus and Accomplishments:\r\n\r\n<ul style="margin-left:50px">\r\n<li>	FCIE developed the 154.5 hectare property of NDC at Dasmarinas,Cavite into an industrial estate and economic zone.</li>\r\n\r\n<li>	In 1997, after having sold all the saleable lots within the industrial estate, FCIEI transferred the Management and operation of the estate including the infrastructure and common facilities to the FCIE Association, an association composed of all the locators inside the estate.</li>\r\n\r\n<li>	FCIEI executed Contract of lease with the FCIE Association, Inc. for the common areas, roads and open spaces.</li>\r\n\r\n<li>	Signed  MOA providing ROW for the following NDC properties; the NDC Humayao property and the NDC Housing Project (Pueblocillo)</li></ul>\r\n\r\n<p style="margin-left:20px">Plans and Programs:</p>\r\n\r\n<ul style="margin-left:50px">\r\n<li>	The development of NDC’s 19.2 hectares of   land property located at Humayao, Dasmarinas, Cavite, as an expansion of FCIEI.</li> </ul>\r\n', '', 'Philippine Peso(PHP)', '2013-05-22 09:57:34');

-- --------------------------------------------------------

--
-- Table structure for table `ndc_tbl_status_assets`
--

CREATE TABLE IF NOT EXISTS `ndc_tbl_status_assets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `under_lease` double NOT NULL,
  `for_sale_lease` double NOT NULL,
  `for_cmp` double NOT NULL,
  `with_court_case` double NOT NULL,
  `for_relocation_survey` double NOT NULL,
  `for_titling` double NOT NULL,
  `with_jv` double NOT NULL,
  `for_project_development` double NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ndc_tbl_status_assets`
--

INSERT INTO `ndc_tbl_status_assets` (`id`, `under_lease`, `for_sale_lease`, `for_cmp`, `with_court_case`, `for_relocation_survey`, `for_titling`, `with_jv`, `for_project_development`, `date_updated`, `updated_by`, `year`) VALUES
(2, 12, 19, 10, 4, 3, 6, 1, 3, '2013-05-20 05:23:21', 'randy', 2012);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
(1, 'first', 'middle', 'last', 'mlfr', 'b4aee7857a870c9d88d1c189dfca612e', 'sample@yahoo.com', '', 'POWER_USER', 1, 0, 'sample?', 'sample'),
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
