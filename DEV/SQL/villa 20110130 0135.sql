-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.41-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema villa
--

CREATE DATABASE IF NOT EXISTS villa;
USE villa;

--
-- Definition of table `advertisement`
--

DROP TABLE IF EXISTS `advertisement`;
CREATE TABLE `advertisement` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `image` blob NOT NULL,
  `link` varchar(1000) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `advertisement`
--

/*!40000 ALTER TABLE `advertisement` DISABLE KEYS */;
/*!40000 ALTER TABLE `advertisement` ENABLE KEYS */;


--
-- Definition of table `linc_mod_right`
--

DROP TABLE IF EXISTS `linc_mod_right`;
CREATE TABLE `linc_mod_right` (
  `mod_id` int(10) unsigned NOT NULL auto_increment,
  `right_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`mod_id`,`right_id`),
  KEY `FK_linc_mod_right_2` (`right_id`),
  CONSTRAINT `FK_linc_mod_right_1` FOREIGN KEY (`mod_id`) REFERENCES `mod` (`id`),
  CONSTRAINT `FK_linc_mod_right_2` FOREIGN KEY (`right_id`) REFERENCES `mst_right` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `linc_mod_right`
--

/*!40000 ALTER TABLE `linc_mod_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `linc_mod_right` ENABLE KEYS */;


--
-- Definition of table `linc_season_tournament`
--

DROP TABLE IF EXISTS `linc_season_tournament`;
CREATE TABLE `linc_season_tournament` (
  `season_id` int(10) unsigned NOT NULL,
  `tournament_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`season_id`,`tournament_id`),
  KEY `FK_linc_season_tournament_2` (`tournament_id`),
  CONSTRAINT `FK_linc_season_tournament_1` FOREIGN KEY (`season_id`) REFERENCES `season` (`id`),
  CONSTRAINT `FK_linc_season_tournament_2` FOREIGN KEY (`tournament_id`) REFERENCES `tournament` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `linc_season_tournament`
--

/*!40000 ALTER TABLE `linc_season_tournament` DISABLE KEYS */;
/*!40000 ALTER TABLE `linc_season_tournament` ENABLE KEYS */;


--
-- Definition of table `linc_tournament_team`
--

DROP TABLE IF EXISTS `linc_tournament_team`;
CREATE TABLE `linc_tournament_team` (
  `tournament_id` int(10) unsigned NOT NULL,
  `team_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`tournament_id`,`team_id`),
  KEY `FK_linc_tournament_team_2` (`team_id`),
  CONSTRAINT `FK_linc_tournament_team_1` FOREIGN KEY (`tournament_id`) REFERENCES `tournament` (`id`),
  CONSTRAINT `FK_linc_tournament_team_2` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `linc_tournament_team`
--

/*!40000 ALTER TABLE `linc_tournament_team` DISABLE KEYS */;
/*!40000 ALTER TABLE `linc_tournament_team` ENABLE KEYS */;


--
-- Definition of table `linc_user_pricetype`
--

DROP TABLE IF EXISTS `linc_user_pricetype`;
CREATE TABLE `linc_user_pricetype` (
  `user_id` int(10) unsigned NOT NULL auto_increment,
  `price_type_id` int(10) unsigned NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`user_id`,`price_type_id`),
  KEY `FK_linc_user_pricetype_2` (`price_type_id`),
  CONSTRAINT `FK_linc_user_pricetype_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_linc_user_pricetype_2` FOREIGN KEY (`price_type_id`) REFERENCES `mst_price_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `linc_user_pricetype`
--

/*!40000 ALTER TABLE `linc_user_pricetype` DISABLE KEYS */;
/*!40000 ALTER TABLE `linc_user_pricetype` ENABLE KEYS */;


--
-- Definition of table `match`
--

DROP TABLE IF EXISTS `match`;
CREATE TABLE `match` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `team1_id` int(10) unsigned NOT NULL,
  `team2_id` int(10) unsigned NOT NULL,
  `handicap` varchar(45) NOT NULL,
  `time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `season_id` int(10) unsigned NOT NULL,
  `tournament_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_match_1` (`team1_id`),
  KEY `FK_match_2` (`team2_id`),
  KEY `FK_match_3` (`season_id`),
  KEY `FK_match_4` (`tournament_id`),
  CONSTRAINT `FK_match_1` FOREIGN KEY (`team1_id`) REFERENCES `team` (`id`),
  CONSTRAINT `FK_match_2` FOREIGN KEY (`team2_id`) REFERENCES `team` (`id`),
  CONSTRAINT `FK_match_3` FOREIGN KEY (`season_id`) REFERENCES `season` (`id`),
  CONSTRAINT `FK_match_4` FOREIGN KEY (`tournament_id`) REFERENCES `tournament` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `match`
--

/*!40000 ALTER TABLE `match` DISABLE KEYS */;
/*!40000 ALTER TABLE `match` ENABLE KEYS */;


--
-- Definition of table `mod`
--

DROP TABLE IF EXISTS `mod`;
CREATE TABLE `mod` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(45) NOT NULL,
  `password_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_mod_1` (`password_id`),
  CONSTRAINT `FK_mod_1` FOREIGN KEY (`password_id`) REFERENCES `password` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mod`
--

/*!40000 ALTER TABLE `mod` DISABLE KEYS */;
/*!40000 ALTER TABLE `mod` ENABLE KEYS */;


--
-- Definition of table `mst_bank_acc_type`
--

DROP TABLE IF EXISTS `mst_bank_acc_type`;
CREATE TABLE `mst_bank_acc_type` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name_en` varchar(45) NOT NULL,
  `name_vi` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_bank_acc_type`
--

/*!40000 ALTER TABLE `mst_bank_acc_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `mst_bank_acc_type` ENABLE KEYS */;


--
-- Definition of table `mst_country`
--

DROP TABLE IF EXISTS `mst_country`;
CREATE TABLE `mst_country` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name_en` varchar(45) NOT NULL,
  `name_vi` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_country`
--

/*!40000 ALTER TABLE `mst_country` DISABLE KEYS */;
/*!40000 ALTER TABLE `mst_country` ENABLE KEYS */;


--
-- Definition of table `mst_prediction_type`
--

DROP TABLE IF EXISTS `mst_prediction_type`;
CREATE TABLE `mst_prediction_type` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name_en` varchar(45) NOT NULL,
  `name_vi` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_prediction_type`
--

/*!40000 ALTER TABLE `mst_prediction_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `mst_prediction_type` ENABLE KEYS */;


--
-- Definition of table `mst_price_type`
--

DROP TABLE IF EXISTS `mst_price_type`;
CREATE TABLE `mst_price_type` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name_en` varchar(45) NOT NULL,
  `name_vi` varchar(45) NOT NULL,
  `price` double NOT NULL,
  `is_unused` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_price_type`
--

/*!40000 ALTER TABLE `mst_price_type` DISABLE KEYS */;
INSERT INTO `mst_price_type` (`id`,`name_en`,`name_vi`,`price`,`is_unused`) VALUES 
 (0,'Free','',0,0),
 (1,'King','',0,0),
 (2,'Occean','',0,0);
/*!40000 ALTER TABLE `mst_price_type` ENABLE KEYS */;


--
-- Definition of table `mst_right`
--

DROP TABLE IF EXISTS `mst_right`;
CREATE TABLE `mst_right` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name_en` varchar(45) NOT NULL,
  `name_vi` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_right`
--

/*!40000 ALTER TABLE `mst_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `mst_right` ENABLE KEYS */;


--
-- Definition of table `mst_trans_cash_type`
--

DROP TABLE IF EXISTS `mst_trans_cash_type`;
CREATE TABLE `mst_trans_cash_type` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name_en` varchar(45) NOT NULL,
  `name_vi` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_trans_cash_type`
--

/*!40000 ALTER TABLE `mst_trans_cash_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `mst_trans_cash_type` ENABLE KEYS */;


--
-- Definition of table `notice`
--

DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `content_en` varchar(1000) NOT NULL,
  `content_vi` varchar(1000) NOT NULL,
  `is_posted` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notice`
--

/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;


--
-- Definition of table `package`
--

DROP TABLE IF EXISTS `package`;
CREATE TABLE `package` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `price_type_id` int(10) unsigned NOT NULL,
  `n_prediction` int(10) unsigned NOT NULL,
  `price` double unsigned NOT NULL,
  `is_unused` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_package_1` (`price_type_id`),
  CONSTRAINT `FK_package_1` FOREIGN KEY (`price_type_id`) REFERENCES `mst_price_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `package`
--

/*!40000 ALTER TABLE `package` DISABLE KEYS */;
/*!40000 ALTER TABLE `package` ENABLE KEYS */;


--
-- Definition of table `password`
--

DROP TABLE IF EXISTS `password`;
CREATE TABLE `password` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `encrypted_pass` varchar(100) NOT NULL,
  `key` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `password`
--

/*!40000 ALTER TABLE `password` DISABLE KEYS */;
/*!40000 ALTER TABLE `password` ENABLE KEYS */;


--
-- Definition of table `policy`
--

DROP TABLE IF EXISTS `policy`;
CREATE TABLE `policy` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `depreciation_rate` double NOT NULL,
  `vip_month_amount` double NOT NULL,
  `vip_year_amount` double NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `policy`
--

/*!40000 ALTER TABLE `policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `policy` ENABLE KEYS */;


--
-- Definition of table `prediction`
--

DROP TABLE IF EXISTS `prediction`;
CREATE TABLE `prediction` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `type_id` int(10) unsigned NOT NULL,
  `begin_post_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `end_post_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `price_type_id` int(10) unsigned NOT NULL,
  `is_team1_won` tinyint(1) NOT NULL,
  `is_over` tinyint(1) NOT NULL,
  `sum_of_goals` int(10) unsigned NOT NULL,
  `match_id` int(10) unsigned NOT NULL,
  `result` int(10) unsigned NOT NULL COMMENT '0:win, 1:draw, 2:loose',
  PRIMARY KEY  (`id`),
  KEY `FK_prediction_1` (`type_id`),
  KEY `FK_prediction_2` (`price_type_id`),
  KEY `FK_prediction_3` (`match_id`),
  CONSTRAINT `FK_prediction_1` FOREIGN KEY (`type_id`) REFERENCES `mst_prediction_type` (`id`),
  CONSTRAINT `FK_prediction_2` FOREIGN KEY (`price_type_id`) REFERENCES `mst_price_type` (`id`),
  CONSTRAINT `FK_prediction_3` FOREIGN KEY (`match_id`) REFERENCES `match` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prediction`
--

/*!40000 ALTER TABLE `prediction` DISABLE KEYS */;
/*!40000 ALTER TABLE `prediction` ENABLE KEYS */;


--
-- Definition of table `season`
--

DROP TABLE IF EXISTS `season`;
CREATE TABLE `season` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `begin_year` int(10) unsigned NOT NULL,
  `end_year` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `season`
--

/*!40000 ALTER TABLE `season` DISABLE KEYS */;
/*!40000 ALTER TABLE `season` ENABLE KEYS */;


--
-- Definition of table `team`
--

DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `logo` blob NOT NULL,
  `country_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_team_1` (`country_id`),
  CONSTRAINT `FK_team_1` FOREIGN KEY (`country_id`) REFERENCES `mst_country` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `team`
--

/*!40000 ALTER TABLE `team` DISABLE KEYS */;
/*!40000 ALTER TABLE `team` ENABLE KEYS */;


--
-- Definition of table `tournament`
--

DROP TABLE IF EXISTS `tournament`;
CREATE TABLE `tournament` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tournament`
--

/*!40000 ALTER TABLE `tournament` DISABLE KEYS */;
/*!40000 ALTER TABLE `tournament` ENABLE KEYS */;


--
-- Definition of table `transaction_cash`
--

DROP TABLE IF EXISTS `transaction_cash`;
CREATE TABLE `transaction_cash` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL,
  `time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `trans_cash_type_id` int(10) unsigned NOT NULL,
  `demanded_amount` double NOT NULL,
  `actual_amount` double NOT NULL,
  `is_confirmed` tinyint(1) NOT NULL,
  `time_of_confirmation` timestamp NOT NULL default '0000-00-00 00:00:00',
  `time_of_transfer` timestamp NOT NULL default '0000-00-00 00:00:00',
  `bank_acc_owner` varchar(45) NOT NULL,
  `bank_acc_number` varchar(45) NOT NULL,
  `bank_acc_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_transaction_cash_1` (`user_id`),
  KEY `FK_transaction_cash_2` (`trans_cash_type_id`),
  KEY `FK_transaction_cash_3` (`bank_acc_type_id`),
  CONSTRAINT `FK_transaction_cash_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_transaction_cash_2` FOREIGN KEY (`trans_cash_type_id`) REFERENCES `mst_trans_cash_type` (`id`),
  CONSTRAINT `FK_transaction_cash_3` FOREIGN KEY (`bank_acc_type_id`) REFERENCES `mst_bank_acc_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction_cash`
--

/*!40000 ALTER TABLE `transaction_cash` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_cash` ENABLE KEYS */;


--
-- Definition of table `transaction_package`
--

DROP TABLE IF EXISTS `transaction_package`;
CREATE TABLE `transaction_package` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL,
  `time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `package_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_transaction_package_1` (`package_id`),
  KEY `FK_transaction_package_2` (`user_id`),
  CONSTRAINT `FK_transaction_package_1` FOREIGN KEY (`package_id`) REFERENCES `package` (`id`),
  CONSTRAINT `FK_transaction_package_2` FOREIGN KEY (`user_id`) REFERENCES `transaction_prediction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction_package`
--

/*!40000 ALTER TABLE `transaction_package` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_package` ENABLE KEYS */;


--
-- Definition of table `transaction_prediction`
--

DROP TABLE IF EXISTS `transaction_prediction`;
CREATE TABLE `transaction_prediction` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL,
  `time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `prediction_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_transaction_prediction_1` (`user_id`),
  KEY `FK_transaction_prediction_2` USING BTREE (`prediction_id`),
  CONSTRAINT `FK_transaction_prediction_2` FOREIGN KEY (`prediction_id`) REFERENCES `prediction` (`id`),
  CONSTRAINT `FK_transaction_prediction_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction_prediction`
--

/*!40000 ALTER TABLE `transaction_prediction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_prediction` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(45) NOT NULL,
  `password_id` int(10) unsigned NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `bank_acc_number` varchar(45) NOT NULL,
  `bank_name` varchar(45) NOT NULL,
  `bank_acc_type_id` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `day_of_birth` datetime NOT NULL,
  `id_card_number` varchar(45) NOT NULL,
  `acc_number` varchar(45) NOT NULL,
  `balance` double NOT NULL,
  `is_activated` tinyint(1) NOT NULL,
  `is_locked` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_user_1` (`password_id`),
  KEY `FK_user_2` (`bank_acc_type_id`),
  CONSTRAINT `FK_user_1` FOREIGN KEY (`password_id`) REFERENCES `password` (`id`),
  CONSTRAINT `FK_user_2` FOREIGN KEY (`bank_acc_type_id`) REFERENCES `mst_bank_acc_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
