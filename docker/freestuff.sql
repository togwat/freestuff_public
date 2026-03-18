-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: freestuff
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adsense`
--

CREATE DATABASE IF NOT EXISTS freestuff;

USE freestuff;


DROP TABLE IF EXISTS `adsense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adsense` (
  `serial` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category_profile_mark`
--

DROP TABLE IF EXISTS `category_profile_mark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_profile_mark` (
  `profile_mark_id` int unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(45) NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `date` datetime NOT NULL,
  `ip_address` varchar(20) NOT NULL,
  PRIMARY KEY (`profile_mark_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19575817 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `contact_date` datetime NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `enquiry` text,
  `status` enum('New','Closed') NOT NULL DEFAULT 'New',
  `freestuff_action_date` datetime DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `reply` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3091 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
--  Table structure for table `region`
--
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region` (
  `region_id` int NOT NULL AUTO_INCREMENT,
  `region` varchar(20) NOT NULL,
  PRIMARY KEY (`region_id`)
)ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=latin1;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `district` (
  `district_id` int NOT NULL AUTO_INCREMENT,
  `district` varchar(45) NOT NULL,
  `region_id` int NOT NULL,
  PRIMARY KEY (`district_id`),
  FOREIGN KEY (`region_id`) REFERENCES `region`(`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates` (
  `email_template_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text,
  `from_name` varchar(255) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `reply_to_name` varchar(255) DEFAULT NULL,
  `reply_to_address` varchar(255) DEFAULT NULL,
  `bcc` varchar(255) DEFAULT NULL,
  `to_address` varchar(255) DEFAULT NULL,
  `to_name` varchar(255) DEFAULT NULL,
  `translated_code` text,
  `count` int unsigned DEFAULT NULL,
  PRIMARY KEY (`email_template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_tracker`
--

DROP TABLE IF EXISTS `email_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_tracker` (
  `email_tracker_id` int unsigned NOT NULL AUTO_INCREMENT,
  `date_sent` datetime NOT NULL,
  `template_name` varchar(255) NOT NULL DEFAULT '',
  `email_body` text NOT NULL,
  `to_address` varchar(255) NOT NULL,
  `email_subject` varchar(255) NOT NULL,
  `recipient_user_id` int unsigned NOT NULL,
  `staff_user_id` int unsigned NOT NULL,
  `from_address` varchar(255) NOT NULL,
  `email_blocked` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`email_tracker_id`),
  KEY `to_address` (`to_address`),
  KEY `user_id` (`recipient_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1523807 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `firebase_message`
--

DROP TABLE IF EXISTS `firebase_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `firebase_message` (
  `firebase_message_id` int NOT NULL AUTO_INCREMENT,
  `sent_date` datetime DEFAULT NULL,
  `user` varchar(45) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`firebase_message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3020 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `listing`
--

DROP TABLE IF EXISTS `listing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listing` (
  `listing_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `authorised` enum('y','n','p') NOT NULL DEFAULT 'p',
  `listing_date` datetime NOT NULL,
  `visits` int unsigned NOT NULL DEFAULT '0',
  `last_updated` datetime NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `has_image` enum('y','n') NOT NULL DEFAULT 'n',
  `user_firstname` varchar(255) NOT NULL,
  `removed_reason` varchar(255) DEFAULT NULL,
  `removed_date` datetime DEFAULT NULL,
  `reserved_date` datetime DEFAULT NULL,
  `pushed_to_twitter` datetime DEFAULT NULL,
  `pushed_to_facebook` datetime DEFAULT NULL,
  `listing_type` enum('free','wanted') NOT NULL DEFAULT 'free',
  `expiry_reminded` datetime DEFAULT NULL,
  `original_listing_date` datetime DEFAULT NULL,
  `request_count` tinyint DEFAULT NULL,
  `saved_search_date` datetime DEFAULT NULL,
  `saved_region_search_date` datetime DEFAULT NULL,
  `district_id` int DEFAULT NULL,
  `listing_status` enum('available','reserved','expired','gone','removed') NOT NULL DEFAULT 'available',
  PRIMARY KEY (`listing_id`),
  FULLTEXT KEY `ft` (`title`,`description`)
) ENGINE=InnoDB AUTO_INCREMENT=92766 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `listing_profile_mark`
--

DROP TABLE IF EXISTS `listing_profile_mark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listing_profile_mark` (
  `profile_mark_id` int unsigned NOT NULL AUTO_INCREMENT,
  `listing_id` int unsigned NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `date` datetime NOT NULL,
  `ip_address` varchar(20) NOT NULL,
  `platform` char(1) NOT NULL DEFAULT 'W',
  PRIMARY KEY (`profile_mark_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18382309 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `listing_request`
--

DROP TABLE IF EXISTS `listing_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listing_request` (
  `request_id` int NOT NULL AUTO_INCREMENT,
  `listing_id` int DEFAULT NULL,
  `request_timestamp` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `user_firstname` varchar(45) DEFAULT NULL,
  `user_ip_address` varchar(45) DEFAULT NULL,
  `district_id` int DEFAULT NULL,
  PRIMARY KEY (`request_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=94315 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login_profile_mark`
--

DROP TABLE IF EXISTS `login_profile_mark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_profile_mark` (
  `login_id` int NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=854657 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `conversation_key` varchar(45) NOT NULL,
  `sender_user_id` int NOT NULL,
  `receiver_user_id` int NOT NULL,
  `message` varchar(1024) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_viewed` datetime DEFAULT NULL,
  `email_message_id` varchar(512) DEFAULT NULL,
  `request_id` int DEFAULT NULL,
  `is_latest` enum('y','n') DEFAULT NULL,
  PRIMARY KEY (`message_id`),
  KEY `latest` (`is_latest`),
  KEY `conversation_key` (`conversation_key`)
) ENGINE=InnoDB AUTO_INCREMENT=238511 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `report_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `report_date` datetime NOT NULL,
  `report_comment` varchar(255) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `listing_id` int unsigned NOT NULL,
  `freestuff_comment` varchar(255) DEFAULT NULL,
  `status` enum('NEW','Listing Removed','Warning','Report Rejected','Wanted','Closed') NOT NULL DEFAULT 'NEW',
  `freestuff_action_date` datetime DEFAULT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1778 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `saved_search`
--

DROP TABLE IF EXISTS `saved_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saved_search` (
  `search_id` int NOT NULL AUTO_INCREMENT,
  `created_date` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `search_string` varchar(255) DEFAULT NULL,
  `regions` varchar(255) DEFAULT NULL,
  `listing_type` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`search_id`),
  FULLTEXT KEY `ftx` (`search_string`)
) ENGINE=InnoDB AUTO_INCREMENT=3130 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_outgoing`
--

DROP TABLE IF EXISTS `sms_outgoing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_outgoing` (
  `sms_id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `phone_no` varchar(15) NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `sms_global_msg_id` varchar(45) DEFAULT NULL,
  `sms_global_error` varchar(255) DEFAULT NULL,
  `sms_global_callback` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sms_id`)
) ENGINE=InnoDB AUTO_INCREMENT=83666 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stats_monthly`
--

DROP TABLE IF EXISTS `stats_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stats_monthly` (
  `month` int unsigned NOT NULL AUTO_INCREMENT,
  `listing_views` int unsigned DEFAULT NULL,
  `new_free_listings` int unsigned DEFAULT NULL,
  `new_users` int unsigned DEFAULT NULL,
  `mobile_validations` int unsigned DEFAULT NULL,
  `contacts` int unsigned DEFAULT NULL,
  `category_views` int unsigned DEFAULT NULL,
  `ad_views` int unsigned DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `new_wanted_listings` int unsigned DEFAULT NULL,
  `adsense_earnings` float DEFAULT NULL,
  PRIMARY KEY (`month`)
) ENGINE=InnoDB AUTO_INCREMENT=202509 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thumb`
--

DROP TABLE IF EXISTS `thumb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thumb` (
  `thumb_id` int NOT NULL AUTO_INCREMENT,
  `lister_id` int NOT NULL,
  `requester_id` int NOT NULL,
  `request_id` int DEFAULT NULL,
  `thumb_date` datetime NOT NULL,
  `thumb_ip` varchar(45) DEFAULT NULL,
  `up_down` enum('u','d','x') NOT NULL DEFAULT 'u',
  `credited_date` datetime DEFAULT NULL,
  PRIMARY KEY (`thumb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4552 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `firstname` varchar(45) NOT NULL,
  `created_on` datetime NOT NULL,
  `email_validated` datetime DEFAULT NULL,
  `mobile_validated` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `admin` enum('y','n') NOT NULL DEFAULT 'n',
  `staff` enum('y','n') NOT NULL DEFAULT 'n',
  `mailchimp_push` datetime DEFAULT NULL,
  `user_listing_count` int DEFAULT NULL,
  `user_request_count` int DEFAULT NULL,
  `thumbs_up` int DEFAULT NULL,
  `thumbs_down` int DEFAULT NULL,
  `user_status` enum('active','inactive','banned') DEFAULT 'active',
  `password_hash` varchar(255) DEFAULT NULL,
  `district_id` int DEFAULT NULL,
  `email_bounced_date` datetime DEFAULT NULL,
  `firebase_token` varchar(255) DEFAULT NULL,
  `os_version` enum('IOS','ANDROID') DEFAULT NULL,
  `brevo_id` int DEFAULT NULL,
  `brevo_status` varchar(100) DEFAULT NULL,
  `request_credit` tinyint NOT NULL DEFAULT '5',
  `request_credit_refresh_date` date DEFAULT NULL,
  `z_user_region` varchar(20) DEFAULT NULL,
  `brevo_push_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=162600 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_blocked`
--

DROP TABLE IF EXISTS `user_blocked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_blocked` (
  `user_blocked_id` int NOT NULL AUTO_INCREMENT,
  `blocker_user_id` int NOT NULL,
  `blocked_user_id` int NOT NULL,
  `hide_messages` enum('y','n') NOT NULL,
  `date_blocked` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_blocked_id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_history`
--

DROP TABLE IF EXISTS `user_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_history` (
  `user_history_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `field` varchar(128) DEFAULT NULL,
  `old_value` varchar(255) DEFAULT NULL,
  `new_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5968 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_naughty`
--

DROP TABLE IF EXISTS `user_naughty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_naughty` (
  `naughty_id` int NOT NULL AUTO_INCREMENT,
  `email_hash_1` varchar(255) DEFAULT NULL,
  `email_hash_2` varchar(255) DEFAULT NULL,
  `mobile_hash_1` varchar(255) DEFAULT NULL,
  `mobile_hash_2` varchar(255) DEFAULT NULL,
  `naughty_date` datetime DEFAULT NULL,
  `naughty_offence` varchar(45) DEFAULT NULL,
  `naughty_note` varchar(255) DEFAULT NULL,
  `naughty_score` tinyint NOT NULL DEFAULT '20',
  PRIMARY KEY (`naughty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_remember_me`
--

DROP TABLE IF EXISTS `user_remember_me`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_remember_me` (
  `remember_me_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `passkey` varchar(45) DEFAULT NULL,
  `remembered_date` datetime DEFAULT NULL,
  `last_used_date` datetime DEFAULT NULL,
  PRIMARY KEY (`remember_me_id`)
) ENGINE=InnoDB AUTO_INCREMENT=190913 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_verify`
--

DROP TABLE IF EXISTS `user_verify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_verify` (
  `verify_id` varchar(8) NOT NULL,
  `six_digit_code` varchar(6) DEFAULT NULL,
  `verify_type` varchar(45) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_checked` datetime DEFAULT NULL,
  `date_expired` datetime DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`verify_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*insert regions*/
INSERT INTO freestuff.region (region_id, region) VALUES
                                                      (1,'Northland'),
                                                      (2,'Auckland'),
                                                      (3,'Waikato'),
                                                      (4,'Bay of Plenty'),
                                                      (5,'Gisborne'),
                                                      (6,'Hawkes Bay'),
                                                      (7,'Taranaki'),
                                                      (8,'Manawatu-Wanganui'),
                                                      (9,'Wellington'),
                                                      (10,'Nelson-Tasman'),
                                                      (11,'Marlborough'),
                                                      (12,'West Coast'),
                                                      (13,'Canterbury'),
                                                      (14,'Otago'),
                                                      (15,'Southland');

/*insert districts*/

INSERT INTO freestuff.district (district_id,district,region_id) VALUES
                                                                 (1,'Dargaville',1),
                                                                 (2,'Kaikohe',1),
                                                                 (3,'Kaitaia',1),
                                                                 (4,'Kawakawa',1),
                                                                 (5,'Kerikeri',1),
                                                                 (6,'Mangawhai',1),
                                                                 (7,'Maungaturoto',1),
                                                                 (8,'Paihia',1),
                                                                 (9,'Whangarei',1),
                                                                 (10,'Albany',2);
INSERT INTO freestuff.district (district_id,district,region_id) VALUES
                                                                 (11,'Auckland City',2),
                                                                 (12,'Botany Downs',2),
                                                                 (13,'Clevedon',2),
                                                                 (14,'Franklin',2),
                                                                 (15,'Great Barrier Island',2),
                                                                 (16,'Helensville',2),
                                                                 (17,'Henderson',2),
                                                                 (18,'Hibiscus Coast',2),
                                                                 (19,'Kumeu',2),
                                                                 (20,'Mangere',2);
INSERT INTO freestuff.district (district_id,district,region_id) VALUES
                                                                 (21,'Manukau',2),
                                                                 (22,'New Lynn',2),
                                                                 (23,'North Shore',2),
                                                                 (24,'Onehunga',2),
                                                                 (25,'Papakura',2),
                                                                 (26,'Pukekohe',2),
                                                                 (27,'Remuera',2),
                                                                 (28,'Waiheke Island',2),
                                                                 (29,'Waitakere',2),
                                                                 (30,'Waiuku',2);
INSERT INTO freestuff.district (district_id,district,region_id) VALUES
                                                                 (31,'Warkworth',2),
                                                                 (32,'Wellsford',2),
                                                                 (33,'Cambridge',3),
                                                                 (34,'Coromandel',3),
                                                                 (35,'Hamilton',3),
                                                                 (36,'Huntly',3),
                                                                 (37,'Matamata',3),
                                                                 (38,'Morrinsville',3),
                                                                 (39,'Ngaruawahia',3),
                                                                 (40,'Ngatea',3);
INSERT INTO freestuff.district (district_id,district,region_id) VALUES
                                                                 (41,'Otorohanga',3),
                                                                 (42,'Paeroa',3),
                                                                 (43,'Raglan',3),
                                                                 (44,'Taumarunui',3),
                                                                 (45,'Taupo',3),
                                                                 (46,'Te Awamutu',3),
                                                                 (47,'Te Kuiti',3),
                                                                 (48,'Thames',3),
                                                                 (49,'Tokoroa/Putaruru',3),
                                                                 (50,'Turangi',3);
INSERT INTO freestuff.district (district_id,district,region_id) VALUES
                                                                 (51,'Waihi',3),
                                                                 (52,'Whangamata',3),
                                                                 (53,'Whitianga',3),
                                                                 (54,'Katikati',4),
                                                                 (55,'Kawerau',4),
                                                                 (56,'Mt. Maunganui',4),
                                                                 (57,'Opotiki',4),
                                                                 (58,'Papamoa',4),
                                                                 (59,'Rotorua',4),
                                                                 (60,'Tauranga',4);
INSERT INTO freestuff.district (district_id,district,region_id) VALUES
                                                                 (61,'Te Puke',4),
                                                                 (62,'Waihi Beach',4),
                                                                 (63,'Whakatane',4),
                                                                 (64,'Gisborne',5),
                                                                 (65,'Ruatoria',5),
                                                                 (66,'Hastings',6),
                                                                 (67,'Napier',6),
                                                                 (68,'Waipukurau',6),
                                                                 (69,'Wairoa',6),
                                                                 (70,'Hawera',7);
INSERT INTO freestuff.district (district_id,district,region_id) VALUES
                                                                 (71,'Mokau',7),
                                                                 (72,'New Plymouth',7),
                                                                 (73,'Opunake',7),
                                                                 (74,'Stratford',7),
                                                                 (75,'Ohakune',8),
                                                                 (76,'Taihape',8),
                                                                 (77,'Waiouru',8),
                                                                 (78,'Whanganui',8),
                                                                 (79,'Bulls',8),
                                                                 (80,'Dannevirke',8);
INSERT INTO freestuff.district (district_id,district,region_id) VALUES
                                                                 (81,'Feilding',8),
                                                                 (82,'Levin',8),
                                                                 (83,'Manawatu',8),
                                                                 (84,'Marton',8),
                                                                 (85,'Pahiatua',8),
                                                                 (86,'Palmerston North',8),
                                                                 (87,'Woodville',8),
                                                                 (88,'Carterton',9),
                                                                 (89,'Featherston',9),
                                                                 (90,'Greytown',9);
INSERT INTO freestuff.district (district_id,district,region_id) VALUES
                                                                 (91,'Martinborough',9),
                                                                 (92,'Masterton',9),
                                                                 (93,'Kapiti',9),
                                                                 (94,'Lower Hutt City',9),
                                                                 (95,'Porirua',9),
                                                                 (96,'Upper Hutt City',9),
                                                                 (97,'Wellington City',9),
                                                                 (98,'Golden Bay',10),
                                                                 (99,'Motueka',10),
                                                                 (100,'Murchison',10);
INSERT INTO freestuff.district (district_id,district,region_id) VALUES
                                                                 (101,'Nelson City',10),
                                                                 (102,'Richmond',10),
                                                                 (103,'Stoke',10),
                                                                 (104,'Blenheim',11),
                                                                 (105,'Marlborough Sounds',11),
                                                                 (106,'Picton',11),
                                                                 (107,'Greymouth',12),
                                                                 (108,'Hokitika',12),
                                                                 (109,'Westport',12),
                                                                 (110,'Akaroa',13);
INSERT INTO freestuff.district (district_id,district,region_id) VALUES
                                                                 (111,'Amberley',13),
                                                                 (112,'Ashburton',13),
                                                                 (113,'Belfast',13),
                                                                 (114,'Cheviot',13),
                                                                 (115,'Christchurch City',13),
                                                                 (116,'Darfield',13),
                                                                 (117,'Fairlie',13),
                                                                 (118,'Ferrymead',13),
                                                                 (119,'Geraldine',13),
                                                                 (120,'Halswell',13);
INSERT INTO freestuff.district (district_id,district,region_id) VALUES
                                                                 (121,'Hanmer Springs',13),
                                                                 (122,'Kaiapoi',13),
                                                                 (123,'Kaikoura',13),
                                                                 (124,'Kurow',13),
                                                                 (125,'Lyttelton',13),
                                                                 (126,'Mt Cook',13),
                                                                 (127,'Rangiora',13),
                                                                 (128,'Rolleston',13),
                                                                 (129,'Selwyn',13),
                                                                 (130,'Timaru',13);
INSERT INTO freestuff.district (district_id,district,region_id) VALUES
                                                                 (131,'Twizel',13),
                                                                 (132,'Waimate',13),
                                                                 (133,'Alexandra',14),
                                                                 (134,'Balclutha',14),
                                                                 (135,'Cromwell',14),
                                                                 (136,'Dunedin',14),
                                                                 (137,'Lawrence',14),
                                                                 (138,'Milton',14),
                                                                 (139,'Oamaru',14),
                                                                 (140,'Palmerston',14);
INSERT INTO freestuff.district (district_id,district,region_id) VALUES
                                                                 (141,'Queenstown',14),
                                                                 (142,'Ranfurly',14),
                                                                 (143,'Roxburgh',14),
                                                                 (144,'Tapanui',14),
                                                                 (145,'Wanaka',14),
                                                                 (146,'Bluff',15),
                                                                 (147,'Edendale',15),
                                                                 (148,'Gore',15),
                                                                 (149,'Invercargill',15),
                                                                 (150,'Lumsden',15);
INSERT INTO freestuff.district (district_id,district,region_id) VALUES
                                                                 (151,'Otautau',15),
                                                                 (152,'Riverton',15),
                                                                 (153,'Stewart Island',15),
                                                                 (154,'Te Anau',15),
                                                                 (155,'Tokanui',15),
                                                                 (156,'Winton',15);



INSERT INTO freestuff.`user` (user_id,email,mobile,firstname,created_on,email_validated,mobile_validated,last_login,admin,staff,mailchimp_push,user_listing_count,user_request_count,thumbs_up,thumbs_down,user_status,password_hash,district_id,email_bounced_date,firebase_token,os_version,brevo_id,brevo_status,request_credit,request_credit_refresh_date,z_user_region,brevo_push_date) VALUES
    (1,'admin@freestuff.co.nz','12345','admin','2010-12-24 08:51:03','2012-10-16 14:57:12','2023-11-16 09:29:07','2025-08-25 04:41:44','y','y','2011-05-16 15:10:33',653,17,3,0,'active','',10,NULL,'','IOS',70,'opened',5,'2025-08-13','Auckland','2023-12-15 08:58:02'),
    (2,'lister@freestuff.co.nz','55526272','lister','2010-12-24 08:51:03','2012-10-16 14:57:12','2023-11-16 09:29:07','2025-08-25 04:41:44','n','n','2011-05-16 15:10:33',653,17,3,0,'active','',10,NULL,'','IOS',70,'opened',5,'2025-08-13','Auckland','2023-12-15 08:58:02'),
    (3,'requester@freestuff.co.nz','62726311','requester','2010-12-24 08:51:03','2012-10-16 14:57:12','2023-11-16 09:29:07','2025-08-25 04:41:44','n','n','2011-05-16 15:10:33',653,17,3,0,'active','',10,NULL,'','IOS',70,'opened',5,'2025-08-13','Auckland','2023-12-15 08:58:02');

INSERT INTO freestuff.email_templates (email_template_id,name,subject,message,from_name,from_address,reply_to_name,reply_to_address,bcc,to_address,to_name,translated_code,count) VALUES
(2,'Successful Signup','Welcome to Freestuff','Welcome __firstname__

Freestuff is an exciting new site where everything is free.

Why give stuff away:
   1. Get rid of clutter
   2. Help out your fellow man (or woman)
   3. Recycle, help save the planet

To list an item go here: http://freestuff.co.nz/list

To browse freestuff, go here: http://www.freestuff.co.nz/

Your username is: __email__
Your password is: __password__

Cheers

The Freestuff Team','Freestuff','do-not-reply@freestuff.co.nz','Freestuff','do-not-reply@freestuff.co.nz',NULL,NULL,NULL,'',NULL),
(10,'Remove Listing','Your Listing has been removed','Dear __lister_firstname__

Your listing __listing_title__ has been removed from Freestuff.  For future reference regarding non permitted listings please refer to our terms and conditions page https://freestuff.co.nz/page/terms

__reason__

Regards

The Freestuff Team','Freestuff','do-not-reply@freestuff.co.nz','Freestuff','do-not-reply@freestuff.co.nz',NULL,NULL,NULL,'',NULL),
(11,'Ban User',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL),
(12,'Un-Ban User',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL),
(17,'Report email to Lister','Your Listing has been removed','Dear __lister_firstname__

Your listing __listing_title__ has been removed from Freestuff.  For future reference regarding non permitted listings please refer to our terms and conditions page http://freestuff.co.nz/page/terms

__reason__

Regards

The Freestuff Team','Freestuff','do-not-reply@freestuff.co.nz','Freestuff','do-not-reply@freestuff.co.nz',NULL,NULL,NULL,'',NULL),
(18,'Report email to Reporter','Thanks for the Heads Up','Hi __reporter_firstname__

Thank you for reporting the following listing on freestuff:
__listing_title__

__comment__

Kind Regards
The Freestuff Team','Freestuff','do-not-reply@freestuff.co.nz','Freestuff','do-not-reply@freestuff.co.nz',NULL,NULL,NULL,'',NULL),
(21,'Freestuff expiry reminder','Your listing on Freestuff has expired','Hi __lister_firstname__

You recently gave away the following stuff:
__listing_title__

To keep the site fresh, listings are automatically removed after 2 weeks.

If you still have the item and want to relist it, just click the link below:
__link__


Cheers

The Freestuff Team','Freestuff','no-reply@freestuff.co.nz','Freestuff','no-reply@freestuff.co.nz',NULL,NULL,NULL,'',NULL),
(22,'Wanted stuff expiry reminder','Your Freestuff listing has expired','Hi __lister_firstname__

You recently requested the following stuff:
__listing_title__

To keep the site fresh, listings are automatically removed after 2 weeks.

If you want to relist, just use the link below:
__link__


Cheers

The Freestuff Team','Freestuff','no-reply@freestuff.co.nz',NULL,'no-reply@freestuff.co.nz',NULL,NULL,NULL,'',NULL),
(25,'Reply web enquiry','Thanks for getting in touch',' Hi __name__

Thanks for getting in touch with your enquiry:
__enquiry__

Please see our response below:
__reply__

Kind Regards
The Freestuff Team




 ','Freestuff','do-not-reply@freestuff.co.nz','Freestuff','do-not-reply@freestuff.co.nz',NULL,NULL,NULL,'',NULL),
(28,'Saved Search Match','New listing on freestuff matching your search','Hi __firstname__

There is a new listing matching your search criteria:
__listing_title__
__description__
__link__

If you don''t want these emails, click this link to change your saved searches:
__saved_searches_link__
or click here to unsubscribe from all:
__unsubscribe_link__

Cheers
The Freestuff Team','Freestuff','no-reply@freestuff.co.nz','Freestuff','do-not-reply@freestuff.co.nz',NULL,NULL,NULL,'',NULL);
INSERT INTO freestuff.email_templates (email_template_id,name,subject,message,from_name,from_address,reply_to_name,reply_to_address,bcc,to_address,to_name,translated_code,count) VALUES
(31,'Listing New Request','Freestuff New Request','Hi __firstname__

__message__

Click here to view your listing:
__listing_url__



Kind Regards
The Freestuff Team','Freestuff','team@freestuff.co.nz','Freestuff','do-not-reply@freestuff.co.nz',NULL,NULL,NULL,'',NULL),
(32,'Request New Message','Freestuff New Message','Hi __firstname__

__message__

__action_block__



Kind Regards
The Freestuff Team','Freestuff','team@freestuff.co.nz','Freestuff','do-not-reply@freestuff.co.nz',NULL,NULL,NULL,'',NULL),
(33,'User Verify','Email verification Code','Hi There

Your verification code is: __code__

Alternately, use the link below to verify for email:
__link__

Kind Regards
The Freestuff Team','Freestuff','team@freestuff.co.nz',NULL,NULL,NULL,NULL,NULL,'',NULL),
(34,'Saved Region Match','New listings on freestuff in your area','Hi __firstname__

There are new listings in your region:
__listings__


If you don''t want these emails, click this link to change your saved searches:
__saved_searches_link__
or click here to unsubscribe from all:
__unsubscribe_link__

Cheers
The Freestuff Team','Freestuff','team@freestuff.co.nz','Freestuff','do-not-reply@freestuff.co.nz',NULL,NULL,NULL,'',NULL),
(35,'New Message','New Message','Hi __firstname__

__message__

Reply to the message by clicking the link below:
__reply_url__



__re__


Kind Regards
The Freestuff Team','Freestuff',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL);

