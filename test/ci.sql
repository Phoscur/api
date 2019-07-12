/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

create schema ugamela collate latin1_swedish_ci;

USE ugamela;

--
-- Table structure for table `buildings`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buildings` (
  `planetID` int(11) NOT NULL,
  `metal_mine` int(11) NOT NULL DEFAULT 0,
  `crystal_mine` int(11) NOT NULL DEFAULT 0,
  `deuterium_synthesizer` int(11) NOT NULL DEFAULT 0,
  `solar_plant` int(11) NOT NULL DEFAULT 0,
  `fusion_reactor` int(11) NOT NULL DEFAULT 0,
  `robotic_factory` int(11) NOT NULL DEFAULT 0,
  `nanite_factory` int(11) NOT NULL DEFAULT 0,
  `shipyard` int(11) NOT NULL DEFAULT 0,
  `metal_storage` int(11) NOT NULL DEFAULT 0,
  `crystal_storage` int(11) NOT NULL DEFAULT 0,
  `deuterium_storage` int(11) NOT NULL DEFAULT 0,
  `research_lab` int(11) NOT NULL DEFAULT 0,
  `terraformer` int(11) NOT NULL DEFAULT 0,
  `alliance_depot` int(11) NOT NULL DEFAULT 0,
  `missile_silo` int(11) NOT NULL DEFAULT 0,
  UNIQUE KEY `planetid_UNIQUE` (`planetID`),
  CONSTRAINT `fk_building_planetid` FOREIGN KEY (`planetID`) REFERENCES `planets` (`planetID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buildings`
--

INSERT INTO `buildings` VALUES (50832,10,5,4,4,0,3,0,8,5,4,2,3,0,0,0),(61614,10,5,4,4,0,3,0,8,5,4,2,3,0,0,0),(62338,10,5,4,4,0,3,0,8,5,4,2,3,0,0,0),(87851,10,5,4,4,0,3,0,8,5,4,2,3,0,0,0),(93133,10,5,4,4,0,3,0,8,5,4,2,3,0,0,0),(167546850,10,5,4,4,0,3,6,8,5,4,2,3,0,0,0);

--
-- Table structure for table `defenses`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `defenses` (
  `planetID` int(11) NOT NULL,
  `rocket_launcher` int(11) NOT NULL DEFAULT 0,
  `light_laser` int(11) NOT NULL DEFAULT 0,
  `heavy_laser` int(11) NOT NULL DEFAULT 0,
  `ion_cannon` int(11) NOT NULL DEFAULT 0,
  `gauss_cannon` int(11) NOT NULL DEFAULT 0,
  `plasma_turret` int(11) NOT NULL DEFAULT 0,
  `small_shield_dome` int(11) NOT NULL DEFAULT 0,
  `large_shield_dome` int(11) NOT NULL DEFAULT 0,
  `anti_ballistic_missile` int(11) NOT NULL DEFAULT 0,
  `interplanetary_missile` int(11) NOT NULL DEFAULT 0,
  UNIQUE KEY `planetid_UNIQUE` (`planetID`),
  CONSTRAINT `fk_defense_planetid` FOREIGN KEY (`planetID`) REFERENCES `planets` (`planetID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defenses`
--

INSERT INTO `defenses` VALUES (50832,0,0,0,0,0,0,0,0,0,0),(61614,0,0,0,0,0,0,0,0,0,0),(62338,0,0,0,0,0,0,0,0,0,0),(87851,0,0,0,0,0,0,0,0,0,0),(93133,0,0,0,0,0,0,0,0,0,0),(167546850,0,0,0,0,0,0,0,0,0,0);

--
-- Table structure for table `errors`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `errors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` text NOT NULL,
  `method` text NOT NULL,
  `line` text NOT NULL,
  `exception` text NOT NULL,
  `description` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `errors`
--


--
-- Table structure for table `fleet`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fleet` (
  `planetID` int(11) NOT NULL,
  `small_cargo_ship` int(11) NOT NULL DEFAULT 0,
  `large_cargo_ship` int(11) NOT NULL DEFAULT 0,
  `light_fighter` int(11) NOT NULL DEFAULT 0,
  `heavy_fighter` int(11) NOT NULL DEFAULT 0,
  `cruiser` int(11) NOT NULL DEFAULT 0,
  `battleship` int(11) NOT NULL DEFAULT 0,
  `colony_ship` int(11) NOT NULL DEFAULT 0,
  `recycler` int(11) NOT NULL DEFAULT 0,
  `espionage_probe` int(11) NOT NULL DEFAULT 0,
  `bomber` int(11) NOT NULL DEFAULT 0,
  `solar_satellite` int(11) NOT NULL DEFAULT 0,
  `destroyer` int(11) NOT NULL DEFAULT 0,
  `battlecruiser` int(11) NOT NULL DEFAULT 0,
  `deathstar` int(11) NOT NULL DEFAULT 0,
  UNIQUE KEY `planetid_UNIQUE` (`planetID`),
  CONSTRAINT `fk_fleet_planetid` FOREIGN KEY (`planetID`) REFERENCES `planets` (`planetID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fleet`
--

INSERT INTO `fleet` VALUES (50832,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(61614,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(62338,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(87851,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(93133,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(167546850,5000,0,0,0,0,0,0,0,0,0,31,0,0,0);

--
-- Table structure for table `flights`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flights` (
  `flightID` int(11) NOT NULL AUTO_INCREMENT,
  `ownerID` int(11) NOT NULL,
  `mission` tinyint(1) NOT NULL,
  `fleetlist` text NOT NULL,
  `start_id` int(11) NOT NULL,
  `start_type` tinyint(1) NOT NULL,
  `start_time` int(11) NOT NULL,
  `end_id` int(11) NOT NULL,
  `end_type` tinyint(1) NOT NULL,
  `end_time` int(11) NOT NULL,
  `loaded_metal` int(11) NOT NULL DEFAULT 0,
  `loaded_crystal` int(11) NOT NULL DEFAULT 0,
  `loaded_deuterium` int(11) NOT NULL DEFAULT 0,
  `returning` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`flightID`),
  KEY `fk_flight_ownerid` (`ownerID`),
  CONSTRAINT `fk_flight_ownerid` FOREIGN KEY (`ownerID`) REFERENCES `users` (`userID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flights`
--


--
-- Table structure for table `galaxy`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `galaxy` (
  `planetID` int(11) NOT NULL DEFAULT 0,
  `pos_galaxy` int(2) NOT NULL,
  `pos_system` int(3) NOT NULL,
  `pos_planet` int(2) NOT NULL,
  `debris_metal` int(11) NOT NULL DEFAULT 0,
  `debris_crystal` int(11) NOT NULL DEFAULT 0,
  UNIQUE KEY `planetid_UNIQUE` (`planetID`),
  CONSTRAINT `fk_galaxy_planetid` FOREIGN KEY (`planetID`) REFERENCES `planets` (`planetID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galaxy`
--

INSERT INTO `galaxy` VALUES (50832,9,44,4,0,0),(61614,7,5,7,0,0),(62338,6,46,7,0,0),(87851,7,29,5,0,0),(93133,4,71,2,0,0),(167546850,9,54,1,0,0);

--
-- Table structure for table `messages`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `messageID` int(11) NOT NULL AUTO_INCREMENT,
  `senderID` int(11) NOT NULL,
  `receiverID` int(11) NOT NULL,
  `sendtime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `type` tinyint(1) NOT NULL,
  `subject` varchar(45) NOT NULL,
  `body` text NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`messageID`),
  UNIQUE KEY `messageID_UNIQUE` (`messageID`),
  KEY `fk_messages_users1_idx` (`senderID`),
  KEY `fk_messages_users2_idx` (`receiverID`),
  CONSTRAINT `fk_messages_users1` FOREIGN KEY (`senderID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_messages_users2` FOREIGN KEY (`receiverID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` VALUES (1,1,1,'0000-00-00 00:00:00',1,'test','asdf',0),(2,1,1,'0000-00-00 00:00:00',1,'test','asdf',0),(3,1,1,'0000-00-00 00:00:00',1,'test','asdf',0),(4,1,1,'0000-00-00 00:00:00',1,'test','asdf',0),(5,1,1,'2019-07-08 19:28:28',1,'test','asdf',0),(6,1,1,'0000-00-00 00:00:00',1,'test','asdf',0),(7,1,1,'0000-00-00 00:00:00',1,'test','asdf',0),(8,1,1,'0000-00-00 00:00:00',1,'test','asdf',0),(9,1,1,'0000-00-00 00:00:00',1,'test','asdf',0),(10,1,1,'0000-00-00 00:00:00',1,'test','asdf',0),(11,1,1,'0000-00-00 00:00:00',1,'test','asdf',0),(12,1,1,'0000-00-00 00:00:00',1,'test','asdf',0),(13,1,1,'0000-00-00 00:00:00',1,'test','asdf',0),(14,1,1,'0000-00-00 00:00:00',1,'test','asdf',0),(15,1,1,'0000-00-00 00:00:00',1,'test','asdf',0),(16,1,1,'0000-00-00 00:00:00',1,'test','asdf',0),(17,1,1,'0000-00-00 00:00:00',1,'test','asdf',0),(18,1,1,'0000-00-00 00:00:00',1,'test','asdf',0),(19,1,1,'0000-00-00 00:00:00',1,'test','asdf',0),(20,1,1,'0000-00-00 00:00:00',1,'test','asdf',0),(21,1,1,'0000-00-00 00:00:00',1,'test','asdf',0),(22,1,1,'0000-00-00 00:00:00',1,'test','asdf',0),(23,1,1,'0000-00-00 00:00:00',1,'test','asdf',0),(24,1,1,'0000-00-00 00:00:00',1,'test','asdf',0),(25,1,1,'0000-00-00 00:00:00',1,'test','asdf',0),(26,1,1,'0000-00-00 00:00:00',1,'test','asdf',0),(27,1,1,'2019-07-08 16:23:23',1,'test','asdf',0),(35,1,48,'2019-07-08 19:27:21',1,'Test','Test',0),(36,1,48,'2019-07-08 19:28:16',1,'Test','Test',0),(37,1,48,'2019-07-08 19:28:28',1,'Test','Test',0);

--
-- Table structure for table `planets`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planets` (
  `planetID` int(11) NOT NULL,
  `ownerID` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `galaxy` int(11) NOT NULL,
  `system` int(11) NOT NULL,
  `planet` int(11) NOT NULL,
  `last_update` int(11) DEFAULT NULL,
  `planet_type` int(1) NOT NULL,
  `image` char(32) NOT NULL,
  `diameter` int(11) NOT NULL,
  `fields_current` int(3) NOT NULL DEFAULT 0,
  `fields_max` int(3) NOT NULL,
  `temp_min` int(3) NOT NULL,
  `temp_max` int(3) NOT NULL,
  `metal` double(16,6) NOT NULL DEFAULT 500.000000,
  `crystal` double(16,6) NOT NULL DEFAULT 500.000000,
  `deuterium` double(16,6) NOT NULL DEFAULT 0.000000,
  `energy_used` int(11) NOT NULL DEFAULT 0,
  `energy_max` int(11) NOT NULL DEFAULT 0,
  `metal_mine_percent` int(3) NOT NULL DEFAULT 100,
  `crystal_mine_percent` int(3) NOT NULL DEFAULT 100,
  `deuterium_synthesizer_percent` int(3) NOT NULL DEFAULT 100,
  `solar_plant_percent` int(3) NOT NULL DEFAULT 100,
  `fusion_reactor_percent` int(3) NOT NULL DEFAULT 100,
  `solar_satellite_percent` int(3) NOT NULL DEFAULT 100,
  `b_building_id` int(3) DEFAULT NULL,
  `b_building_endtime` int(10) DEFAULT NULL,
  `b_tech_id` int(3) DEFAULT NULL,
  `b_tech_endtime` int(10) DEFAULT NULL,
  `b_hangar_id` text DEFAULT NULL,
  `b_hangar_start_time` int(11) NOT NULL DEFAULT 0,
  `b_hangar_plus` tinyint(1) NOT NULL DEFAULT 0,
  `destroyed` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`planetID`),
  KEY `fk_planet_ownerid` (`ownerID`),
  CONSTRAINT `fk_planet_ownerid` FOREIGN KEY (`ownerID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planets`
--

INSERT INTO `planets` VALUES (50832,41,'Heimatplanet',9,44,4,1521057319,1,'wuestenplanet01',10094,0,102,64,64,500.000000,500.000000,0.000000,0,0,100,100,100,100,100,100,NULL,NULL,NULL,NULL,NULL,0,0,0),(61614,59,'Heimatplanet',7,5,7,1521056909,1,'trockenplanet01',11957,0,143,115,115,500.000000,500.000000,0.000000,0,0,100,100,100,100,100,100,NULL,NULL,NULL,NULL,NULL,0,0,0),(62338,74,'Heimatplanet',6,46,7,1521056944,1,'wuestenplanet02',11823,0,140,123,123,500.000000,500.000000,0.000000,0,0,100,100,100,100,100,100,NULL,NULL,NULL,NULL,NULL,0,0,0),(87851,48,'Heimatplanet',7,29,5,1521057391,1,'trockenplanet01',10433,0,109,56,56,500.000000,500.000000,0.000000,0,0,100,100,100,100,100,100,NULL,NULL,NULL,NULL,NULL,0,0,0),(93133,35,'Heimatplanet',4,71,2,1521057486,1,'trockenplanet05',12894,0,166,42,42,500.000000,500.000000,0.000000,0,0,100,100,100,100,100,100,NULL,NULL,NULL,NULL,NULL,0,0,0),(167546850,1,'Planet',9,54,1,1556635321,1,'dschjungelplanet02',14452,0,196,73,195,358000.000000,315555.853784,200000.000000,398,2211,100,100,100,100,100,100,0,0,0,0,'1, {\"planetID\":\"167546850\",\"lastUpdateTime\":1559120318,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":\"167546850\",\"lastUpdateTime\":1559120441,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":\"167546850\",\"lastUpdateTime\":1559120907,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":\"167546850\",\"lastUpdateTime\":1559124027,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":\"167546850\",\"lastUpdateTime\":1559127625,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":\"167546850\",\"lastUpdateTime\":1559131239,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":\"167546850\",\"lastUpdateTime\":1559133107,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":\"167546850\",\"lastUpdateTime\":1559134825,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":\"167546850\",\"lastUpdateTime\":1559138427,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":\"167546850\",\"lastUpdateTime\":1559142040,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":\"167546850\",\"lastUpdateTime\":1559145642,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":\"167546850\",\"lastUpdateTime\":1559149244,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":\"167546850\",\"lastUpdateTime\":1559152834,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":\"167546850\",\"lastUpdateTime\":1559156425,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":\"167546850\",\"lastUpdateTime\":1559160030,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":\"167546850\",\"lastUpdateTime\":1559163690,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":\"167546850\",\"lastUpdateTime\":1559167254,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":\"167546850\",\"lastUpdateTime\":1559170829,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":\"167546850\",\"lastUpdateTime\":1559174435,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":\"167546850\",\"lastUpdateTime\":1559178022,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":\"167546850\",\"lastUpdateTime\":1559181674,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":\"167546850\",\"lastUpdateTime\":1559185238,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":\"167546850\",\"lastUpdateTime\":1559188828,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":\"167546850\",\"lastUpdateTime\":1559192423,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":\"167546850\",\"lastUpdateTime\":1559196074,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":\"167546850\",\"lastUpdateTime\":1559199623,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":\"167546850\",\"lastUpdateTime\":1562009111,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":\"167546850\",\"lastUpdateTime\":1562009531,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":167546850,\"lastUpdateTime\":1562009745,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":167546850,\"lastUpdateTime\":1562009775,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":167546850,\"lastUpdateTime\":1562009798,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":167546850,\"lastUpdateTime\":1562009806,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":167546850,\"lastUpdateTime\":1562009869,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":167546850,\"lastUpdateTime\":1562009882,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":167546850,\"lastUpdateTime\":1562083239,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":167546850,\"lastUpdateTime\":1562083281,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":167546850,\"lastUpdateTime\":1562083365,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":167546850,\"lastUpdateTime\":1562601106,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":167546850,\"lastUpdateTime\":1562601370,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":167546850,\"lastUpdateTime\":1562601989,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":167546850,\"lastUpdateTime\":1562647811,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":167546850,\"lastUpdateTime\":1562648512,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":167546850,\"lastUpdateTime\":1562650059,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":167546850,\"lastUpdateTime\":1562681102,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":167546850,\"lastUpdateTime\":1562681579,\"timeRemaining\":5,\"queue\":{\"301\":1}}, {\"planetID\":167546850,\"lastUpdateTime\":1562681693,\"timeRemaining\":5,\"queue\":{\"301\":1}}',1,0,0);

--
-- Table structure for table `stats`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats` (
  `userID` int(11) NOT NULL,
  `points` bigint(11) NOT NULL DEFAULT 0,
  `old_rank` tinyint(4) NOT NULL DEFAULT 0,
  `rank` tinyint(4) NOT NULL DEFAULT 0,
  UNIQUE KEY `userid_UNIQUE` (`userID`),
  CONSTRAINT `fk_stats_userid` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats`
--

INSERT INTO `stats` VALUES (1,2220584795,1,1);

--
-- Table structure for table `techs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `techs` (
  `userID` int(11) NOT NULL,
  `espionage_tech` tinyint(2) NOT NULL DEFAULT 0,
  `computer_tech` tinyint(2) NOT NULL DEFAULT 0,
  `weapon_tech` tinyint(2) NOT NULL DEFAULT 0,
  `armour_tech` tinyint(2) NOT NULL DEFAULT 0,
  `shielding_tech` tinyint(2) NOT NULL DEFAULT 0,
  `energy_tech` tinyint(2) NOT NULL DEFAULT 0,
  `hyperspace_tech` tinyint(2) NOT NULL DEFAULT 0,
  `combustion_drive_tech` tinyint(2) NOT NULL DEFAULT 0,
  `impulse_drive_tech` tinyint(2) NOT NULL DEFAULT 0,
  `hyperspace_drive_tech` tinyint(2) NOT NULL DEFAULT 0,
  `laser_tech` tinyint(2) NOT NULL DEFAULT 0,
  `ion_tech` tinyint(2) NOT NULL DEFAULT 0,
  `plasma_tech` tinyint(2) NOT NULL DEFAULT 0,
  `intergalactic_research_tech` tinyint(2) NOT NULL DEFAULT 0,
  `graviton_tech` tinyint(2) NOT NULL DEFAULT 0,
  UNIQUE KEY `userid_UNIQUE` (`userID`),
  CONSTRAINT `fk_research_userid` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techs`
--

INSERT INTO `techs` VALUES (1,23,23,23,23,23,23,23,23,23,23,23,23,23,21,1),(35,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(41,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(48,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(59,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(74,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

--
-- Table structure for table `users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(60) NOT NULL,
  `email` varchar(64) NOT NULL,
  `onlinetime` varchar(10) NOT NULL,
  `currentplanet` int(11) NOT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `id_UNIQUE` (`userID`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `currentplanet_UNIQUE` (`currentplanet`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

INSERT INTO `users` VALUES (1,'admin','$2a$10$LbHHx04gtF18GlWHCc5tPun4EPbxRNUfVOlnlJ9KGea7xLSmMqnOe','user_1501005189510@test.com','1556635321',167546850),(35,'LGY2Y37244','$2y$10$vuN6zY0x3.OyGo3OkjCXP.7j1zFMqvb54dQrGCO.Fk6rjmUZ7.iLq','L17@WEC.test','1521057486',93133),(41,'TO17AWPCL8','$2y$10$MJWeh1cgdlouSNsBCO4RUOmxndjCRk69kiVY/ctswbDncbKyfoVqC','BVK@F67.test','1521057319',50832),(48,'CGY6098AFK','$2y$10$fH8nF33GYS2VIE8sggjzO.iqzwGYGUousLPeG9xDa.zdM5OU5.9ay','HCM@5NF.test','1521057390',87851),(59,'WPV14MGVSJ','$2y$10$uBO3yb0a7.FgmRQffxzZF.ByC0OZtNMyUdTFqFraf3flvvBbONlDi','QXS@0VK.test','0',61614),(74,'YTNAP87LZ3','$2y$10$bm6QTXo3nRdVHTHJa.fOBuM26lk3sI94103MKkvh7tsplmIGK0OTy','10G@4RA.test','0',62338);
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;


DELIMITER //
CREATE PROCEDURE `getFreePosition`(IN maxGalaxy int, IN maxSystem int, IN minPlanet int, IN maxPlanet int)
BEGIN
    DECLARE pos_galaxy INT;
    DECLARE pos_system INT;
    DECLARE pos_planet INT;

    DECLARE taken TINYINT(1) DEFAULT 1;

    WHILE taken > 0 DO
    SET pos_galaxy = ROUND(RAND()*(maxGalaxy-1)+1);
    SET pos_system = ROUND(RAND()*(maxSystem-1)+1);
    SET pos_planet = ROUND(RAND()*(maxPlanet-minPlanet)+minPlanet);

    SET taken = (SELECT 1 FROM ugamela.planets WHERE 'galaxy' = CONCAT('', pos_galaxy) AND 'system' = CONCAT('', pos_system) AND 'planet' = CONCAT('', pos_planet));

    -- if the userID was free
    IF(taken IS NULL) THEN
        SET taken = 0;
    END IF;

    END WHILE;

    SELECT pos_galaxy AS `posGalaxy`, pos_system AS `posSystem`, pos_planet AS `posPlanet`;

END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `getNewPlanetId`()
BEGIN
    DECLARE idtaken TINYINT(1) DEFAULT 1;
    DECLARE planet_id INT;

    SET idtaken = 1;
    SET planet_id = 0;

    WHILE idtaken > 0 DO
    SET planet_id = FLOOR(RAND()*(2147483648-200+1)+200);

    SET idtaken = (SELECT 1 FROM ugamela.planets WHERE planetID = planet_id);

    -- if the userID was free
    IF(idtaken IS NULL) THEN
        SET idtaken = 0;
    END IF;

    END WHILE;

    SELECT planet_id AS `planetID`;

END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `getNewUserId`()
BEGIN
    DECLARE idtaken TINYINT(1) DEFAULT 1;
    DECLARE usr_userid INT;

    SET idtaken = 1;
    SET usr_userid = 0;

    WHILE idtaken > 0 DO
    SET usr_userid = FLOOR(RAND()*(2147483648-200+1)+200);

    SET idtaken = (SELECT 1 FROM ugamela.users WHERE userID = usr_userid);

    -- if the userID was free
    IF(idtaken IS NULL) THEN
        SET idtaken = 0;
    END IF;

    END WHILE;

    SELECT usr_userid AS `userID`;

END//
DELIMITER ;

CREATE USER 'dev'@'127.0.0.1' IDENTIFIED BY 'dev';
GRANT ALL ON *.* TO 'dev'@'127.0.0.1';


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
