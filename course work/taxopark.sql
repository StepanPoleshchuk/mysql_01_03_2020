-- MySQL dump 10.13  Distrib 8.0.16, for macos10.14 (x86_64)
--
-- Host: localhost    Database: taxopark
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `car_brand`
--

DROP TABLE IF EXISTS `car_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `car_brand` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `brand` varchar(45) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `brand_UNIQUE` (`brand`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='бренды автомобилей';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_brand`
--

LOCK TABLES `car_brand` WRITE;
/*!40000 ALTER TABLE `car_brand` DISABLE KEYS */;
INSERT INTO `car_brand` VALUES (1,'skoda','2021-04-21 03:10:19',NULL),(2,'volkswagen','2021-04-21 03:10:19',NULL),(3,'bmw','2021-04-21 03:10:19',NULL),(4,'hyundai','2021-04-21 03:10:19',NULL),(5,'kia','2021-04-21 03:10:19',NULL),(6,'mercedes benz','2021-04-21 03:10:19',NULL),(7,'nissan','2021-04-21 03:20:15',NULL);
/*!40000 ALTER TABLE `car_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_model`
--

DROP TABLE IF EXISTS `car_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `car_model` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `model` varchar(45) DEFAULT NULL,
  `car_brand_id` int unsigned NOT NULL,
  `car_type_id` int unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_car_model_car_type_idx` (`car_type_id`),
  KEY `fk_car_model_car_brand1_idx` (`car_brand_id`),
  CONSTRAINT `fk_car_model_car_brand1` FOREIGN KEY (`car_brand_id`) REFERENCES `car_brand` (`id`),
  CONSTRAINT `fk_car_model_car_type` FOREIGN KEY (`car_type_id`) REFERENCES `car_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='модели автомобилей + их класс в системе такси (эконом, комфорт, бизнес)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_model`
--

LOCK TABLES `car_model` WRITE;
/*!40000 ALTER TABLE `car_model` DISABLE KEYS */;
INSERT INTO `car_model` VALUES (1,'rio',5,1,'2021-04-21 03:18:41',NULL),(2,'optima',5,2,'2021-04-21 03:18:41',NULL),(3,'octavia',1,2,'2021-04-21 03:18:41',NULL),(4,'superb',1,2,'2021-04-21 03:18:41',NULL),(5,'rapid',1,1,'2021-04-21 03:18:41',NULL),(6,'polo',2,1,'2021-04-21 03:18:41',NULL),(7,'jetta',2,2,'2021-04-21 03:18:41',NULL),(8,'multivan',2,3,'2021-04-21 03:18:41',NULL),(9,'520d',3,4,'2021-04-21 03:18:41',NULL),(10,'520i',3,4,'2021-04-21 03:18:41',NULL),(11,'solaris',4,1,'2021-04-21 03:18:41',NULL),(12,'sonata',4,2,'2021-04-21 03:18:41',NULL),(13,'e220d',6,4,'2021-04-21 03:18:41',NULL),(14,'e200d',6,4,'2021-04-21 03:18:41',NULL),(15,'almera',7,1,'2021-04-21 03:22:22',NULL);
/*!40000 ALTER TABLE `car_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_park`
--

DROP TABLE IF EXISTS `car_park`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `car_park` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT 'название парка',
  `chief_name` varchar(45) DEFAULT NULL COMMENT 'руководитель парка',
  `phone` bigint unsigned NOT NULL,
  `TIN` bigint unsigned NOT NULL COMMENT 'ИНН',
  `adress` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  UNIQUE KEY `TIN_UNIQUE` (`TIN`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='парки (название парка, ИНН, начальство, номер телефона для связи)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_park`
--

LOCK TABLES `car_park` WRITE;
/*!40000 ALTER TABLE `car_park` DISABLE KEYS */;
INSERT INTO `car_park` VALUES (1,'ООО \"ТРАНСКОМ ПИТЕР\"','Петров Петр Вячеславович',89990009090,3993993030,'198207,СПБ,ЛЕНИНСКИЙ ПР.Д.100,ЛИТЕР А,ПОМ.4-Н'),(2,'ООО \"ЕВРО-СЕРВИС\"','Иванов Иван Витальевич',89990008080,4884882020,'198207,СПБ,ПР.СТАЧЕК,Д.106,ЛИТЕР А'),(3,'ООО \"АВУАРАВТО\"','Калитка Аркадий Степанович',89990007070,5775771010,'190005,СПБ,ПР.ТРОИЦКИЙ,Д.18,ЛИТЕР А,ПОМ.4-Н'),(4,'ООО \"МОБИЛ-ПРЕСТИЖ\"','Сидоров Алексей Алексеевич',89990006060,6666660000,'197136,СПБ,УЛ.ПОДРЕЗОВА,Д.17,ЛИТЕР А,ПОМ.6Н');
/*!40000 ALTER TABLE `car_park` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_status`
--

DROP TABLE IF EXISTS `car_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `car_status` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `status_UNIQUE` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='статус в котором находится автомобиль(ремзона, оклейка, на линии, без водителя, пересменка, сон)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_status`
--

LOCK TABLES `car_status` WRITE;
/*!40000 ALTER TABLE `car_status` DISABLE KEYS */;
INSERT INTO `car_status` VALUES (6,'без водителя(пустой)'),(7,'кузовной ремонт'),(1,'на линии'),(4,'оклейка'),(5,'пересменка'),(2,'ремзона'),(3,'сон');
/*!40000 ALTER TABLE `car_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_type`
--

DROP TABLE IF EXISTS `car_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `car_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `type_UNIQUE` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='классы автомобилей (эконом, комфорт, бизнес)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_type`
--

LOCK TABLES `car_type` WRITE;
/*!40000 ALTER TABLE `car_type` DISABLE KEYS */;
INSERT INTO `car_type` VALUES (1,'standart','2021-04-21 03:12:03',NULL),(2,'comfort','2021-04-21 03:12:03',NULL),(3,'minivan','2021-04-21 03:12:03',NULL),(4,'business','2021-04-21 03:12:03',NULL);
/*!40000 ALTER TABLE `car_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `clients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL DEFAULT 'Клиент',
  `phone` bigint NOT NULL,
  `birthday` date DEFAULT NULL,
  `home_adress` varchar(100) DEFAULT NULL,
  `balance` int NOT NULL DEFAULT '0' COMMENT 'количество средств на безналичном счете водителя',
  `default_description` varchar(245) DEFAULT NULL COMMENT 'описание, информация для водителя и для оператора, добавляющаяся к каждому новому заказу автоматически (предпочитаемый класс автомобиля по умолчанию, способ оплаты по умолчанию)',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_blocked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - ok\n1 - blocked',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Herminio Waters',89118981650,'2004-04-01','67676 Natalie Knoll',0,NULL,'1973-07-08 23:43:05','2010-02-25 11:08:31',0),(2,'Ms. Mayra Paucek',89116166183,'2017-02-16','',0,NULL,'2019-10-02 09:08:49','1970-06-17 11:53:22',0),(3,'Alden Rowe',89119467970,'2006-04-06','',200,NULL,'1980-12-25 08:24:24','2021-04-21 04:35:53',0),(4,'Domenick Hayes',89115590137,'1997-03-23','10711 Lizzie Throughway Apt. 820',0,NULL,'2001-06-27 15:29:59','2006-06-28 12:41:25',0),(5,'Emie Sporer',89116605869,'1992-08-26','',0,'корпоративный клиент','2008-09-18 12:52:10','2021-04-21 04:35:53',0),(6,'Miss Clotilde Gleason',89117788285,'1996-10-27','7852 Hulda Wells Suite 571',0,NULL,'2006-05-21 23:53:09','1993-08-05 09:37:59',0),(7,'Ethan Collins',89115157627,'2014-01-15','775 Moen Spring Apt. 557',0,NULL,'1992-07-27 02:16:14','2001-06-12 05:50:01',0),(8,'Kaci Schultz DVM',89112241530,'2016-05-29','',0,NULL,'1989-06-24 00:42:10','2021-04-21 04:35:53',1),(9,'Flavio Windler',89116030185,'2009-11-23','437 Abshire Trafficway',0,NULL,'2003-06-25 10:19:03','1993-09-20 02:53:24',0),(10,'Darrel Ward V',89113339005,'2009-02-22','',0,NULL,'1988-08-11 20:14:42','1985-01-30 13:44:52',0),(11,'Prof. Arthur Yundt DDS',89119970357,'2009-10-11','00786 Muller Circles',0,NULL,'2021-04-01 18:16:47','1993-10-26 21:46:13',0),(12,'Dr. Fidel Cummerata Sr.',89115124261,'2001-03-10','',0,NULL,'2010-12-07 14:56:39','2000-04-15 00:02:00',0),(13,'Heloise Sanford',89114035132,'1984-11-24','105 Hane Village',0,NULL,'2011-04-26 10:04:15','2011-12-25 06:14:26',0),(14,'Jaime Borer',89115304704,'2001-11-04','082 Elian Harbor',0,NULL,'2019-04-20 05:13:55','2004-08-10 23:57:35',0),(15,'Louvenia Kuvalis',89117418119,'1984-06-28','',0,'корпоративный клиент','2005-02-04 03:12:35','2021-04-21 04:35:53',0),(16,'Twila Spencer',89115675510,'1988-01-20','307 Kuhn Glens',0,NULL,'1991-12-14 17:15:03','2009-12-08 12:59:52',0),(17,'Dr. Aurelio Braun IV',89117026542,'2001-08-20','',0,'только эконом','1993-04-17 19:08:01','2021-04-21 04:35:53',1),(18,'Bridget Walsh',89119453257,'1978-09-14','',0,NULL,'1984-08-31 03:22:13','1970-12-30 13:25:09',0),(19,'Mr. Lance Little',89113913357,'2011-06-09','532 Zieme Ports',400,NULL,'1976-01-30 05:23:28','2021-04-21 04:35:53',0),(20,'Alex Bruen',89118324742,'1995-12-15','7712 Kohler Lock Apt. 914',0,NULL,'1992-03-10 23:17:45','1989-08-28 20:54:24',0),(21,'Trycia Corwin',89112133914,'2010-09-30','',0,NULL,'1992-01-02 03:50:45','2011-02-24 03:03:02',0),(22,'Joana Kling',89113508746,'2020-09-04','',0,NULL,'1993-02-17 11:53:05','1998-01-05 07:09:34',0),(23,'Antonia Kohler',89119535380,'1981-12-11','',0,NULL,'2009-10-23 23:07:21','1988-01-05 09:09:13',0),(24,'Dr. Royce Kreiger PhD',89114160313,'1988-04-28','',0,NULL,'1970-10-20 00:03:05','2016-09-13 09:56:56',0),(25,'Helen Schulist',89115840359,'1988-09-02','',0,NULL,'1976-07-30 18:46:39','2018-07-21 08:38:49',0),(26,'Joseph Conn',89114298722,'1998-09-10','',0,NULL,'1998-01-09 00:52:37','2013-11-19 16:17:19',0),(27,'Margot Wuckert',89117132905,'1984-06-30','186 Hollie Drive Apt. 966',0,NULL,'1989-04-21 00:35:46','1974-08-27 16:21:21',0),(28,'Betsy Auer I',89116332216,'1979-11-26','',0,NULL,'1995-10-30 06:50:02','2011-01-15 10:03:18',0),(29,'Mertie Gerhold V',89115921545,'1970-10-05','',0,NULL,'2003-10-13 22:59:12','2009-04-11 12:47:30',0),(30,'Prof. Gail Stiedemann',89112230374,'1988-02-27','',0,NULL,'2004-05-15 09:53:12','2016-07-26 20:14:21',0),(31,'Dr. Danny O\'Hara',89112824838,'1991-07-16','',300,NULL,'1982-05-11 07:10:20','2021-04-21 04:35:53',0),(32,'Fiona Stokes',89116320785,'1997-11-09','',0,NULL,'2013-07-29 09:35:28','2018-06-30 19:11:27',0),(33,'Stanford Bogan',89117313527,'1992-11-15','72581 Sipes Inlet Apt. 883',0,'только эконом','1996-01-31 20:18:01','2021-04-21 04:35:53',0),(34,'Miss Mollie Douglas',89114464755,'2018-06-29','',0,NULL,'2016-02-29 02:02:00','2006-11-09 17:40:35',0),(35,'Dr. Coleman Gleason',89117930424,'1980-09-22','',0,NULL,'2002-09-09 11:28:55','1988-11-15 05:59:44',0),(36,'Claudine Mertz',89112975981,'1996-05-31','',0,NULL,'1990-09-01 22:18:00','1995-10-23 15:44:52',0),(37,'William Mayert',89117605758,'1996-03-25','4198 Schultz Point',500,NULL,'1986-02-13 03:15:34','2021-04-21 04:35:53',0),(38,'Prof. Otha Prosacco',89114007346,'2005-08-07','541 Eula Dam Suite 264',0,NULL,'1977-08-17 02:29:16','1976-05-08 16:20:43',0),(39,'Marina Schiller IV',89118372356,'2004-01-05','',0,NULL,'2005-06-17 04:02:12','1974-01-12 15:37:26',0),(40,'Connor Terry',89114248359,'2012-08-24','',0,NULL,'1976-12-03 20:55:34','1985-10-07 17:25:49',0),(41,'Dr. Sven McGlynn DDS',89114983644,'2008-02-02','127 Bergstrom Parkways Suite 296',0,'только эконом','2013-07-04 16:14:47','2021-04-21 04:35:53',0),(42,'Demond Howe',89119902193,'2010-03-12','',0,NULL,'2018-07-26 23:50:45','1990-12-13 21:47:46',0),(43,'Myriam Cruickshank',89113925297,'1987-05-04','145 Champlin Glens Apt. 569',0,NULL,'1987-07-23 07:15:46','2016-03-21 00:48:19',0),(44,'Matilde Wyman',89114545952,'1994-11-27','',100,NULL,'1970-11-06 15:33:04','2021-04-21 04:35:53',0),(45,'Horace Wiza',89115726418,'1993-06-21','875 Bradtke Bypass',0,'корпоративный клиент','2004-07-11 04:26:18','2021-04-21 04:35:53',0),(46,'Jonathon Carter Sr.',89119776172,'2001-02-23','6525 Alia Union',0,NULL,'2008-06-01 08:07:19','2016-03-24 12:21:23',0),(47,'Natalie Bartoletti',89112775608,'2013-09-23','',0,NULL,'1985-04-12 06:24:01','1992-05-20 22:27:33',0),(48,'Prof. Wilhelm Volkman',89118215461,'1994-08-21','98769 Dorothy Place',0,'только эконом','2019-12-28 02:17:35','2021-04-21 04:35:53',0),(49,'Ava Ferry',89119643211,'2009-06-17','562 Bergnaum Lights',0,NULL,'1998-03-11 18:16:06','1982-11-06 12:32:46',0),(50,'Prof. Alek Lehner',89117047263,'1998-07-06','2055 Effertz Islands Suite 923',0,NULL,'2019-05-17 01:48:37','2000-06-01 09:21:20',0);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `drivers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `second_name` varchar(45) NOT NULL,
  `phone` bigint NOT NULL,
  `driver_license_id` varchar(45) NOT NULL,
  `balance` int NOT NULL DEFAULT '0' COMMENT 'количество средств на безналичном счете водителя',
  `van_allow` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'пройденный инструктаж на минивен',
  `business_allow` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'пройденный инструктаж на бизнес автомобили',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_blocked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - ok\n1 - blocked',
  `rating` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  UNIQUE KEY `driver_license_id_UNIQUE` (`driver_license_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES (1,'Rowan','Padberg',89994037494,'5266377104',1144,1,0,'1992-02-18 13:06:40','2021-04-22 00:17:08',0,4.96),(2,'Myrna','Huel',89995083937,'5780077270',13,1,0,'1978-06-23 17:22:15','2021-04-22 00:17:08',0,4.36),(3,'Liliana','Gottlieb',89995822731,'5376520857',2364,1,0,'2006-05-02 07:17:25','2021-04-22 00:17:08',0,5.00),(4,'Javonte','Koelpin',89990384542,'5939348911',2777,0,1,'1989-03-27 05:44:41','2021-04-22 00:17:08',0,5.00),(5,'Joyce','Considine',89993273329,'5841202082',1228,1,0,'1982-10-01 08:33:23','2005-05-24 03:04:41',0,4.72),(6,'Claudie','Mayer',89999933235,'5089282076',783,1,0,'1974-01-12 20:57:55','2021-04-22 00:17:08',0,4.13),(7,'Delia','Emmerich',89990340498,'5596009508',1068,1,0,'1971-08-17 03:40:45','2003-04-23 18:02:58',0,5.00),(8,'Vladimir','Hoppe',89992878881,'5665364031',769,0,0,'2012-03-27 14:53:18','2021-04-22 00:17:08',0,4.68),(9,'Elvera','Hintz',89996169751,'5735301570',2820,0,0,'2012-09-15 02:33:40','1973-08-14 09:55:15',0,4.44),(10,'Cara','Gulgowski',89991108948,'5028617194',1603,0,0,'1987-10-03 07:46:27','2021-04-22 00:17:08',1,3.91),(11,'Freddie','Stoltenberg',89991020400,'5393397945',1326,0,0,'2019-10-12 23:02:19','2021-04-22 00:17:08',0,4.55),(12,'Daisha','Zemlak',89992672666,'5501919515',2366,0,0,'1985-12-26 00:01:44','2002-03-08 14:53:52',0,4.59),(13,'Lucie','Hoppe',89999992449,'5366203867',1653,1,0,'1989-01-02 15:42:02','2021-04-22 00:17:08',0,4.29),(14,'Alia','Pollich',89993795546,'5511218746',808,0,0,'1982-06-06 04:53:02','2021-04-22 00:17:08',0,3.99),(15,'Minerva','Russel',89995738941,'5660187792',517,0,1,'2016-12-30 06:03:21','2021-04-22 00:17:08',0,4.80),(16,'Carlee','Steuber',89997031703,'5751935173',2161,0,0,'1990-04-24 02:35:47','2021-04-22 00:17:08',1,3.91),(17,'Lyric','Lubowitz',89994399775,'5010177224',1648,0,0,'1972-11-18 16:02:29','1995-10-30 20:15:39',0,4.30),(18,'Hilda','Heathcote',89999611007,'5676261229',3063,1,0,'2007-04-03 18:05:34','2021-04-22 00:17:08',0,5.00),(19,'Ayden','Kris',89995834294,'5036430783',2549,0,0,'1993-04-02 20:45:41','2021-04-22 00:17:08',0,5.00),(20,'August','Sauer',89996079331,'5461972218',843,0,0,'1973-04-13 19:52:20','1997-09-20 12:50:07',1,4.04),(21,'Trystan','Cronin',89992053277,'5297738008',530,1,0,'2005-12-16 13:40:01','1994-11-20 05:35:24',0,4.61),(22,'Else','Kassulke',89992171714,'5398927757',1725,0,0,'2010-06-05 16:25:43','1992-05-19 21:24:16',1,3.96),(23,'Rosella','Bode',89994791246,'5223837606',2309,0,1,'1987-04-30 10:04:51','2021-04-22 00:17:08',0,4.92),(24,'Vincenzo','Hermiston',89995903127,'5206695462',960,0,0,'2008-06-25 01:13:11','2021-04-22 00:17:08',0,4.85),(25,'Jesus','Walter',89999499714,'5439319446',1015,0,0,'2011-11-01 21:04:26','1998-04-18 13:40:58',0,5.00);
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `having_cars`
--

DROP TABLE IF EXISTS `having_cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `having_cars` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `car_model_id` int unsigned NOT NULL,
  `car_plate` char(9) NOT NULL COMMENT 'ГРЗ на автомобиле',
  `VIN` char(17) NOT NULL,
  `production_year` year NOT NULL COMMENT 'год производства по СРТС',
  `srts` varchar(45) NOT NULL,
  `car_park_id` int unsigned NOT NULL,
  `is_brand` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'брендированный автомобиль - 1',
  `license_id` int unsigned DEFAULT NULL COMMENT 'номер лицензии\nесли NULL - автомобиль еще не получил лицензию ',
  `mileage` int unsigned NOT NULL COMMENT 'пробег',
  `last_inspection` int unsigned DEFAULT NULL COMMENT 'последний техосмотр',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `delited_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `VIN_UNIQUE` (`VIN`),
  UNIQUE KEY `car_plate_UNIQUE` (`car_plate`),
  UNIQUE KEY `srts_UNIQUE` (`srts`),
  UNIQUE KEY `license_id_UNIQUE` (`license_id`),
  KEY `fk_having_cars_car_model1_idx` (`car_model_id`),
  KEY `fk_having_cars_car_park1_idx` (`car_park_id`),
  CONSTRAINT `fk_having_cars_car_model1` FOREIGN KEY (`car_model_id`) REFERENCES `car_model` (`id`),
  CONSTRAINT `fk_having_cars_car_park1` FOREIGN KEY (`car_park_id`) REFERENCES `car_park` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='конкретные машины в системе (номера, vin, год выпуска, пробеги, информация о ТО)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `having_cars`
--

LOCK TABLES `having_cars` WRITE;
/*!40000 ALTER TABLE `having_cars` DISABLE KEYS */;
INSERT INTO `having_cars` VALUES (1,3,'Т330РС178','VF1KT12C651521602',2016,'1612828211',1,1,860846,200112,197900,'2021-04-21 04:13:37',NULL,NULL),(2,3,'В810ТК178','WVGZZZ7LZ5D070953',2017,'16АУ200132',2,1,155238,131244,120473,'2021-04-21 04:13:37',NULL,NULL),(3,3,'Е297РН198','WVGZZZ1TZ7W076180',2017,'20УУ008933',2,0,NULL,123344,120923,'2021-04-21 04:13:37',NULL,NULL),(4,3,'Т272РК198','XW8AN4NE5LH018005',2017,'3928900009',3,1,234778,322222,300123,'2021-04-21 04:13:37',NULL,NULL),(5,3,'Т535ТН78','WDC1668241В104853',2016,'6765332112',3,1,123983,240332,210323,'2021-04-21 04:13:37',NULL,NULL),(6,9,'Т364НК10','WDF44781313038661',2019,'8976234234',4,0,241479,50221,45022,'2021-04-21 04:13:37',NULL,NULL),(7,13,'Р832НН777','WAUZZZ8V8G1034948',2020,'55АА367367',4,0,134739,39123,35231,'2021-04-21 04:13:37',NULL,NULL),(8,10,'О511ВХ78','VF7FCKFUC28893125',2019,'76АУ234777',4,0,127640,65821,55213,'2021-04-21 04:13:37',NULL,NULL),(9,6,'О524ОО178','W0L0SDL0896079020',2018,'2345009009',2,1,242333,120443,115473,'2021-04-21 04:20:01','2021-04-21 04:32:49',NULL),(10,6,'У024МУ777','JTBCV02J604246838',2017,'3387988099',1,1,452111,159223,155928,'2021-04-21 04:20:01',NULL,NULL),(11,6,'У675МК178','XW8AD5NE5FH019975',2019,'21АУ344200',3,1,776444,90600,80288,'2021-04-21 04:20:01',NULL,NULL),(12,11,'В638ВК78','W0L0AHL4858040107',2020,'43АА322333',2,0,NULL,14102,10233,'2021-04-21 04:20:01',NULL,NULL),(13,8,'У853ВР178','WBAEV33435KW50439',2018,'3311678678',1,1,233123,134525,130222,'2021-04-21 04:32:49',NULL,NULL),(14,15,'С044ОУ78','4T1BF1FK4CU541180',2018,'4467888888',1,1,441232,146453,142022,'2021-04-21 04:32:49',NULL,NULL),(15,15,'Р651РВ178','1FAHP2DW5BG130087',2018,'1232678678',2,1,123523,156755,152231,'2021-04-21 04:32:49',NULL,NULL),(16,2,'С514ЕХ178','4S4BP62C687357230',2018,'67АА324343',3,1,235413,146747,140223,'2021-04-21 04:32:49',NULL,NULL),(17,2,'Е656ЕХ78','5TDBA22C84S035347',2017,'43АУ443111',3,1,134122,186788,182321,'2021-04-21 04:32:49',NULL,NULL),(18,5,'У152ХР178','WBAEG2326PCB55347',2017,'2344325543',4,1,234121,167889,162311,'2021-04-21 04:32:49',NULL,NULL),(19,5,'О376КН78','3N1CE2CP0FL307993',2017,'3432111432',1,1,435643,187666,181232,'2021-04-21 04:32:49',NULL,NULL),(20,5,'У662КО178','4T1BF1FK2DU617044',2017,'3434987789',1,1,334634,198766,196100,'2021-04-21 04:32:49','2021-04-22 05:36:34',NULL);
/*!40000 ALTER TABLE `having_cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs_online_cars`
--

DROP TABLE IF EXISTS `logs_online_cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `logs_online_cars` (
  `id` int NOT NULL,
  `status` int unsigned NOT NULL,
  `car_id` int unsigned NOT NULL,
  `driver_id` int unsigned NOT NULL,
  `started_at` datetime NOT NULL,
  `finished_at` datetime NOT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COMMENT='все действия и пересадки с автомобилями и водителями';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs_online_cars`
--

LOCK TABLES `logs_online_cars` WRITE;
/*!40000 ALTER TABLE `logs_online_cars` DISABLE KEYS */;
INSERT INTO `logs_online_cars` VALUES (5,1,6,8,'0000-00-00 00:00:00','2021-04-22 05:08:45'),(6,2,8,14,'0000-00-00 00:00:00','2021-04-22 05:08:45'),(3,1,4,7,'0000-00-00 00:00:00','2021-04-22 05:09:53'),(8,2,1,18,'2021-04-22 01:00:39','2021-04-22 05:11:01'),(14,1,19,2,'2021-04-22 05:13:30','2021-04-22 05:14:58'),(2,1,3,5,'2021-04-22 01:00:39','2021-04-22 05:15:42');
/*!40000 ALTER TABLE `logs_online_cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `oldest_clients`
--

DROP TABLE IF EXISTS `oldest_clients`;
/*!50001 DROP VIEW IF EXISTS `oldest_clients`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `oldest_clients` AS SELECT 
 1 AS `name`,
 1 AS `phone`,
 1 AS `age`,
 1 AS `birthday`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `online_cars`
--

DROP TABLE IF EXISTS `online_cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `online_cars` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `having_cars_id` int unsigned NOT NULL,
  `drivers_id` int unsigned NOT NULL,
  `car_status_id` int unsigned NOT NULL,
  `started_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `having_cars_id_UNIQUE` (`having_cars_id`),
  UNIQUE KEY `drivers_id_UNIQUE` (`drivers_id`),
  KEY `fk_online_cars_having_cars1_idx` (`having_cars_id`),
  KEY `fk_online_cars_drivers1_idx` (`drivers_id`),
  KEY `fk_online_cars_car_status1_idx` (`car_status_id`),
  CONSTRAINT `fk_online_cars_car_status1` FOREIGN KEY (`car_status_id`) REFERENCES `car_status` (`id`),
  CONSTRAINT `fk_online_cars_drivers1` FOREIGN KEY (`drivers_id`) REFERENCES `drivers` (`id`),
  CONSTRAINT `fk_online_cars_having_cars1` FOREIGN KEY (`having_cars_id`) REFERENCES `having_cars` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='основная рабочая таблица, показывает количество машин на линии, на ремзоне, сне, оклейке, а так же машин без водителя\nкаждая машина будет фигурировать только единожды, каждый водитель тоже. \nчтобы поставить на автомобиль нового водителя, удалите старого (запись перейдет в архивную таблицу) и после этого добавляйте нового\nв таблице содержатся только актуальные данные';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `online_cars`
--

LOCK TABLES `online_cars` WRITE;
/*!40000 ALTER TABLE `online_cars` DISABLE KEYS */;
INSERT INTO `online_cars` VALUES (1,2,12,1,'2021-04-22 01:00:39'),(4,5,3,1,'2021-04-22 01:00:39'),(7,9,9,1,'2021-04-22 01:00:39'),(9,13,13,3,'2021-04-22 01:00:39'),(10,14,15,3,'2021-04-22 01:00:39'),(11,11,17,3,'2021-04-22 01:00:39'),(15,18,6,2,'2021-04-22 05:14:26'),(16,17,8,1,'2021-04-22 05:14:49'),(17,3,5,1,'2021-04-22 05:17:11');
/*!40000 ALTER TABLE `online_cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_type`
--

DROP TABLE IF EXISTS `order_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL COMMENT 'наличные средства, картой в машине, картой в приложении, бонусный счет, APPLEPAY',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_UNIQUE` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='типы оплаты заявок, payment type';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_type`
--

LOCK TABLES `order_type` WRITE;
/*!40000 ALTER TABLE `order_type` DISABLE KEYS */;
INSERT INTO `order_type` VALUES (4,'apple pay'),(5,'bonus account'),(2,'by card'),(1,'cash'),(3,'prepaid');
/*!40000 ALTER TABLE `order_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `clients_id` int unsigned NOT NULL,
  `drivers_id` int unsigned NOT NULL,
  `car_type_id` int unsigned NOT NULL,
  `having_cars_id` int unsigned NOT NULL,
  `order_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_type_id` int unsigned NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `price` int unsigned NOT NULL,
  `start_adress` varchar(255) NOT NULL,
  `intermediate_address` varchar(255) DEFAULT NULL,
  `finish_adress` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `finished_at` datetime DEFAULT NULL,
  `raiting` tinyint unsigned DEFAULT NULL COMMENT 'оценка поездки',
  `feedback` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_orders_clients1_idx` (`clients_id`),
  KEY `fk_orders_drivers1_idx` (`drivers_id`),
  KEY `fk_orders_having_cars1_idx` (`having_cars_id`),
  KEY `fk_orders_car_type1_idx` (`car_type_id`),
  KEY `fk_orders_order_type1_idx` (`order_type_id`),
  CONSTRAINT `fk_orders_car_type1` FOREIGN KEY (`car_type_id`) REFERENCES `car_type` (`id`),
  CONSTRAINT `fk_orders_clients1` FOREIGN KEY (`clients_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `fk_orders_drivers1` FOREIGN KEY (`drivers_id`) REFERENCES `drivers` (`id`),
  CONSTRAINT `fk_orders_having_cars1` FOREIGN KEY (`having_cars_id`) REFERENCES `having_cars` (`id`),
  CONSTRAINT `fk_orders_order_type1` FOREIGN KEY (`order_type_id`) REFERENCES `order_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8 COMMENT='заявки созданные клиентами';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,34,1,1,1,'1981-12-18 06:36:02',1,'',1100,'738 Johnnie Fords Apt. 916','0000 Klein Lakes Apt. 702','36932 Williamson Station Apt. 558','1981-12-18 05:36:02','2021-04-22 00:38:22','1981-12-18 09:36:02',5,NULL),(2,28,2,1,2,'2001-08-31 13:48:15',2,' помочь клиенту',1300,'6534 Jacobs Village Suite 413','','38741 Mario Radial Apt. 059','2001-08-31 12:48:15','2021-04-22 00:38:22','2001-08-31 16:48:15',5,NULL),(3,42,3,2,3,'1975-08-10 08:09:01',3,' 10 парадная',1010,'833 Tony Mission','12750 Josefina Pass Suite 966','07790 Kessler Lodge Suite 653','1975-08-10 07:09:01','2021-04-22 00:38:22','1975-08-10 11:09:01',4,NULL),(4,18,4,1,4,'1994-07-25 15:48:48',4,'',680,'333 Predovic Harbor Apt. 284','9173 Hills Mall','72405 Vivian Wall','1994-07-25 14:48:48','2021-04-22 00:38:22','1994-07-25 18:48:48',5,NULL),(5,10,5,2,5,'1996-03-20 15:54:36',5,' только русский водитель',1290,'984 Barrows Islands','','130 Hilpert Track','1996-03-20 14:54:36','2021-04-22 00:38:22','1996-03-20 18:54:36',4,NULL),(6,36,6,1,6,'2005-06-25 13:20:57',1,'крайний подъезд',1260,'94000 Rusty Locks','','4326 Ortiz Glens Suite 186','2005-06-25 12:20:57','2021-04-22 03:02:33','2005-06-25 16:20:57',4,NULL),(7,11,7,2,7,'1983-12-23 14:59:57',2,'',2020,'4969 Olson Underpass','61454 Deckow Circles','21142 Gerlach Cape','1983-12-23 13:59:57','2021-04-22 00:38:22','1983-12-23 17:59:57',4,NULL),(8,19,8,1,8,'1972-09-18 12:50:32',3,'',880,'2820 Heidenreich Haven','528 Denesik Stravenue','2615 Krajcik Square','1972-09-18 11:50:32','2021-04-22 03:02:33','1972-09-18 15:50:32',4,NULL),(9,9,9,1,9,'2002-04-20 10:53:37',4,' под номером дома',1170,'0615 Kristy Underpass Apt. 105','','899 DuBuque Tunnel','2002-04-20 09:53:37','2021-04-22 00:38:22','2002-04-20 13:53:37',5,NULL),(10,50,10,2,10,'2001-10-21 19:18:45',5,' сдача с 1000',1560,'48207 Marquardt Street','','1146 Alexys Run Suite 256','2001-10-21 18:18:45','2021-04-22 00:38:22','2001-10-21 22:18:45',4,NULL),(11,50,11,2,11,'1972-11-01 13:07:07',1,'',900,'30944 Beahan Drive Apt. 099','03570 Lakin Fall','95950 Klocko Fords','1972-11-01 12:07:07','2021-04-22 00:38:22','1972-11-01 16:07:07',4,NULL),(12,24,12,1,12,'1978-04-06 22:09:27',2,'',1210,'2056 Predovic Island','4895 Lemke Mission','2200 Isaias Crossroad','1978-04-06 21:09:27','2021-04-22 00:38:22','1978-04-07 01:09:27',4,NULL),(13,15,13,1,13,'1993-11-03 16:19:07',3,'',480,'89374 Hegmann Curve','','91744 Lubowitz Overpass Apt. 905','1993-11-03 15:19:07','2021-04-22 00:38:22','1993-11-03 19:19:07',4,NULL),(14,39,14,1,14,'2013-11-28 05:46:31',4,' парадная 2',1000,'73482 Samir Ramp','90134 Jerde Bridge Suite 581','4350 Carolina Plaza Suite 612','2013-11-28 04:46:31','2021-04-22 03:02:33','2013-11-28 08:46:31',5,NULL),(15,12,15,1,15,'2019-01-23 04:46:49',5,'крайний подъезд',390,'662 Hahn Port Suite 303','790 Erna Prairie','570 Arlo Lake Apt. 397','2019-01-23 03:46:49','2021-04-22 03:02:33','2019-01-23 07:46:49',4,NULL),(16,32,16,1,16,'1990-09-01 23:49:19',1,'',1120,'2334 Parker Ramp','','567 Kavon Plaza Apt. 685','1990-09-01 22:49:19','2021-04-22 00:38:22','1990-09-02 02:49:19',4,NULL),(17,25,17,2,17,'1982-08-24 06:08:39',2,'',610,'753 Maggio Roads Suite 913','1380 Leonora Course','2412 Grant Isle Apt. 658','1982-08-24 05:08:39','2021-04-22 00:38:22','1982-08-24 09:08:39',4,NULL),(18,4,18,1,18,'1997-11-06 05:08:34',3,'',1180,'87986 Cartwright Heights','1084 Natalia Plain Apt. 471','167 Swaniawski Flats Apt. 992','1997-11-06 04:08:34','2021-04-22 00:38:22','1997-11-06 08:08:34',5,NULL),(19,43,19,1,19,'1977-06-11 20:20:42',4,' 9 парадная',750,'435 Frederick Prairie Suite 832','','4050 Toy Port','1977-06-11 19:20:42','2021-04-22 03:02:33','1977-06-11 23:20:42',4,NULL),(20,32,20,2,20,'1985-07-06 06:30:35',5,'',600,'586 Finn Harbor Apt. 433','','511 Daryl Port Suite 071','1985-07-06 05:30:35','2021-04-22 00:38:22','1985-07-06 09:30:35',5,NULL),(21,19,21,2,1,'1973-05-08 23:48:12',1,'',780,'57161 Luther Tunnel','','906 Stevie Station','1973-05-08 22:48:12','2021-04-22 00:38:22','1973-05-09 02:48:12',4,NULL),(22,43,22,1,2,'1993-09-08 01:27:38',2,' у калитки',750,'363 Tamia Pine','61526 Raynor Route','63271 Hettinger Field','1993-09-08 00:27:38','2021-04-22 00:38:22','1993-09-08 04:27:38',5,NULL),(23,32,23,1,3,'1985-07-09 00:15:39',3,'',870,'35311 Tyler Lodge','552 Braun Bridge Apt. 320','353 Andrew Fords Suite 488','1985-07-08 23:15:39','2021-04-22 00:38:22','1985-07-09 03:15:39',4,NULL),(24,6,24,2,4,'1998-09-26 06:14:07',4,' сдача с 1000',700,'5902 Alana Islands','','943 Block Views Suite 814','1998-09-26 05:14:07','2021-04-22 00:38:22','1998-09-26 09:14:07',4,NULL),(25,38,25,1,5,'1997-10-04 01:04:05',5,' возможно придется подождать',770,'8194 Stokes Stravenue Suite 225','705 Cormier Rapids Apt. 664','692 Renner Mission','1997-10-04 00:04:05','2021-04-22 03:02:33','1997-10-04 04:04:05',5,NULL),(26,44,1,1,6,'1976-07-04 18:03:54',1,'',220,'02444 Fredrick Station Apt. 939','','402 Glover Locks','1976-07-04 17:03:54','2021-04-22 00:38:22','1976-07-04 21:03:54',4,NULL),(27,8,2,2,7,'1970-06-02 05:34:27',2,' на углу дома',790,'1019 Ulices Station','','31520 Bruce Forks','1970-06-02 04:34:27','2021-04-22 00:38:22','1970-06-02 08:34:27',5,NULL),(28,48,3,2,8,'1982-11-30 00:08:41',3,' парадная 3',760,'170 Denis Mills Suite 853','','986 Hauck Plaza Apt. 505','1982-11-29 23:08:41','2021-04-22 00:38:22','1982-11-30 03:08:41',4,NULL),(29,40,4,1,9,'1977-11-29 22:42:31',4,'',620,'84374 Sandrine Isle','','688 Funk Springs','1977-11-29 21:42:31','2021-04-22 00:38:22','1977-11-30 01:42:31',5,NULL),(30,27,5,1,10,'2015-09-10 11:49:27',5,' 9 парадная',560,'114 Nathan Squares','','609 Hettinger Locks Suite 302','2015-09-10 10:49:27','2021-04-22 00:38:22','2015-09-10 14:49:27',5,NULL),(31,8,6,1,11,'2002-01-14 02:36:16',1,'',670,'488 Dariana Mountains','5121 Bechtelar Cliffs Suite 847','926 Easter Via Suite 909','2002-01-14 01:36:16','2021-04-22 00:38:22','2002-01-14 05:36:16',5,NULL),(32,14,7,1,12,'2009-04-20 21:40:35',2,'',990,'3491 Bednar Mountains Apt. 217','','532 Langosh Mountains','2009-04-20 20:40:35','2021-04-22 00:38:22','2009-04-21 00:40:35',4,NULL),(33,18,8,1,13,'2018-03-20 21:03:17',3,'',1070,'4956 Waelchi Island Apt. 356','','62472 Nolan Mountain','2018-03-20 20:03:17','2021-04-22 00:38:22','2018-03-21 00:03:17',4,NULL),(34,31,9,2,14,'1975-04-25 18:39:49',4,' с остановки',750,'2836 Walker Forks','','698 Bosco Rapid Apt. 661','1975-04-25 17:39:49','2021-04-22 00:38:22','1975-04-25 21:39:49',5,NULL),(35,15,10,1,15,'2017-07-13 09:09:38',5,'',1030,'808 Alvah Key Apt. 781','395 Runolfsdottir Garden Apt. 262','9735 Domenick Mall Suite 047','2017-07-13 08:09:38','2021-04-22 03:02:33','2017-07-13 12:09:38',4,NULL),(36,39,11,1,16,'2010-01-08 20:11:44',1,'',680,'058 Fritsch Crossroad','','991 Jasen Fall Apt. 980','2010-01-08 19:11:44','2021-04-22 03:02:33','2010-01-08 23:11:44',4,NULL),(37,26,12,2,17,'2015-05-26 10:13:01',2,' с остановки',920,'021 Sophie Common Suite 195','8084 Cooper Brook','5980 Grant Islands Suite 015','2015-05-26 09:13:01','2021-04-22 00:38:22','2015-05-26 13:13:01',5,NULL),(38,10,13,1,18,'1996-12-04 09:34:59',3,'',770,'00648 Lakin Light','','889 Tremblay Villages','1996-12-04 08:34:59','2021-04-22 00:38:22','1996-12-04 12:34:59',5,NULL),(39,8,14,1,19,'2013-06-28 11:31:48',4,' парадная 4',1260,'629 Schaden Rue Suite 784','9139 Runolfsson Parks Suite 463','227 Huel Gateway','2013-06-28 10:31:48','2021-04-22 03:02:33','2013-06-28 14:31:48',4,NULL),(40,24,15,1,20,'1979-04-15 00:07:36',5,' последний подъезд',1190,'6305 Funk Spring','','2330 Jewell Landing Suite 677','1979-04-14 23:07:36','2021-04-22 00:38:22','1979-04-15 03:07:36',5,NULL),(41,19,16,1,1,'1992-11-17 02:48:15',1,'',900,'94919 Wiegand Junction Apt. 183','627 Abdiel Grove','631 Terry Land','1992-11-17 01:48:15','2021-04-22 00:38:22','1992-11-17 05:48:15',4,NULL),(42,30,17,2,2,'2014-02-27 11:31:57',2,'',2020,'578 Kuhn Freeway Apt. 338','360 Maggio Prairie','45877 Riley Crossroad','2014-02-27 10:31:57','2021-04-22 00:38:22','2014-02-27 14:31:57',5,NULL),(43,3,18,2,3,'2006-05-24 18:23:54',3,'',350,'66735 Kuhn Turnpike','846 Kristopher Shoal Apt. 971','75641 Phoebe Squares','2006-05-24 17:23:54','2021-04-22 00:38:22','2006-05-24 21:23:54',4,NULL),(44,11,19,2,4,'1991-03-05 16:51:47',4,'',760,'814 Alvina Dam Suite 930','206 Brandt Loaf','1284 Keyshawn Courts','1991-03-05 15:51:47','2021-04-22 00:38:22','1991-03-05 19:51:47',4,NULL),(45,38,20,1,5,'2005-11-07 15:46:58',5,'',1040,'88361 Kale Spring','','1783 Oberbrunner Branch Suite 649','2005-11-07 14:46:58','2021-04-22 00:38:22','2005-11-07 18:46:58',5,NULL),(46,13,21,1,6,'2017-10-13 00:13:38',1,'',540,'177 Cronin Harbor Apt. 032','','2404 Kyla Village Apt. 361','2017-10-12 23:13:38','2021-04-22 00:38:22','2017-10-13 03:13:38',5,NULL),(47,29,22,1,7,'1982-03-18 16:54:38',2,' парадная 4',1060,'129 Shanahan Junctions','','6949 Aubree Dam','1982-03-18 15:54:38','2021-04-22 00:38:22','1982-03-18 19:54:38',4,NULL),(48,39,23,1,8,'2010-08-24 12:17:35',3,'',690,'97468 Joanne Freeway Suite 225','184 Herzog Crossing Suite 776','118 Lilly Pines','2010-08-24 11:17:35','2021-04-22 00:38:22','2010-08-24 15:17:35',4,NULL),(49,49,24,1,9,'2005-08-10 09:40:11',4,'',1190,'3581 Henri Terrace','','399 Lehner Village Apt. 906','2005-08-10 08:40:11','2021-04-22 00:38:22','2005-08-10 12:40:11',4,NULL),(50,43,25,1,10,'2003-10-05 00:11:09',5,' у магазина',900,'7496 Muller Lights','','63593 Gaylord Club','2003-10-04 23:11:09','2021-04-22 03:02:33','2003-10-05 03:11:09',5,NULL),(51,45,1,1,11,'2019-09-29 16:39:20',1,'',1130,'8325 Beier Locks Suite 143','72822 Tillman Summit Suite 029','6456 Else Green Suite 356','2019-09-29 15:39:20','2021-04-22 03:02:33','2019-09-29 19:39:20',5,NULL),(52,33,2,1,12,'2005-10-24 13:10:29',2,'',810,'3775 Candida Unions','','897 Schuppe Trafficway','2005-10-24 12:10:29','2021-04-22 03:02:33','2005-10-24 16:10:29',5,NULL),(53,1,3,2,13,'1983-12-17 06:51:45',3,' 8 парадная',950,'383 Schultz Valleys','1480 Rath Parks Apt. 140','847 Bernier Squares','1983-12-17 05:51:45','2021-04-22 00:38:22','1983-12-17 09:51:45',4,NULL),(54,36,4,1,14,'2012-11-09 18:55:46',4,'',1220,'811 O\'Connell Coves Apt. 497','6007 Lambert Mountains Apt. 639','034 Friesen Fort','2012-11-09 17:55:46','2021-04-22 03:02:33','2012-11-09 21:55:46',4,NULL),(55,33,5,1,15,'1985-09-10 17:18:42',5,'',1410,'1771 Herman Branch Suite 957','6479 Fahey Causeway','016 Becker Summit','1985-09-10 16:18:42','2021-04-22 00:38:22','1985-09-10 20:18:42',5,NULL),(56,14,6,1,16,'2000-05-13 13:01:32',1,'',890,'5564 Rosalyn Parkway','7771 Thiel Walk Apt. 515','99595 Gottlieb Roads','2000-05-13 12:01:32','2021-04-22 00:38:22','2000-05-13 16:01:32',4,NULL),(57,23,7,2,17,'1996-08-15 17:40:34',2,'',190,'40142 Glover Ford','','4437 Treutel Forks Suite 584','1996-08-15 16:40:34','2021-04-22 00:38:22','1996-08-15 20:40:34',4,NULL),(58,3,8,1,18,'2017-09-17 11:08:11',3,'',450,'71435 O\'Hara Stravenue','','53406 Simonis Courts','2017-09-17 10:08:11','2021-04-22 00:38:22','2017-09-17 14:08:11',5,NULL),(59,12,9,1,19,'1989-09-11 16:41:59',4,'',700,'352 Abernathy Shoals Suite 475','','3806 Frederic Points','1989-09-11 15:41:59','2021-04-22 03:02:33','1989-09-11 19:41:59',5,NULL),(60,5,10,1,20,'1998-02-23 13:34:34',5,'',980,'54971 Franecki Valleys','','667 Dare Landing Apt. 931','1998-02-23 12:34:34','2021-04-22 03:02:33','1998-02-23 16:34:34',5,NULL),(61,15,11,2,1,'1978-07-25 01:27:15',1,' под номером дома',1040,'1090 Kadin Highway Suite 614','46914 Bergstrom Ramp Suite 923','01342 Dibbert Lock Suite 321','1978-07-25 00:27:15','2021-04-22 00:38:22','1978-07-25 04:27:15',5,NULL),(62,39,12,1,2,'1999-12-12 01:50:39',2,'',190,'954 Turcotte Mews Apt. 073','','98783 Beatty Lodge','1999-12-12 00:50:39','2021-04-22 00:38:22','1999-12-12 04:50:39',4,NULL),(63,10,13,1,3,'2012-11-15 01:29:21',3,'',2940,'1593 Johathan Inlet','','169 Larson Port','2012-11-15 00:29:21','2021-04-22 00:38:22','2012-11-15 04:29:21',5,NULL),(64,47,14,1,4,'1995-12-23 06:30:39',4,' поторопитесь',610,'1747 Treutel Parkway Suite 782','666 Keeling Island','340 Koelpin Mountain Suite 286','1995-12-23 05:30:39','2021-04-22 03:02:33','1995-12-23 09:30:39',4,NULL),(65,11,15,1,5,'1993-02-08 01:57:55',5,' 9 парадная',260,'745 Mayer Parkways Apt. 131','','7725 Bruen Glen Suite 548','1993-02-08 00:57:55','2021-04-22 03:02:33','1993-02-08 04:57:55',5,NULL),(66,18,16,2,6,'1984-10-08 04:57:54',1,'',430,'17001 Harmony Pines Apt. 151','2552 Kuphal Ports','2615 Osinski Village Suite 502','1984-10-08 03:57:54','2021-04-22 00:38:22','1984-10-08 07:57:54',5,NULL),(67,7,17,1,7,'1971-03-01 23:59:37',2,'',250,'51645 Kihn Divide','778 Zieme Club Apt. 959','0108 Angelica Canyon Suite 956','1971-03-01 22:59:37','2021-04-22 03:02:33','1971-03-02 02:59:37',4,NULL),(68,7,18,1,8,'2005-02-15 07:46:23',3,' бабушка',900,'773 Kevin Lake','','234 Abraham Crescent Suite 431','2005-02-15 06:46:23','2021-04-22 03:02:33','2005-02-15 10:46:23',5,NULL),(69,46,19,1,9,'1978-08-24 18:49:45',4,' 8 парадная',1130,'24055 Wolf Street Apt. 654','','853 Delta Overpass Apt. 968','1978-08-24 17:49:45','2021-04-22 03:02:33','1978-08-24 21:49:45',4,NULL),(70,41,20,2,10,'1973-01-11 18:35:11',5,'',940,'90214 West Well','667 Kris Springs Apt. 915','7397 Lisa Shoals Suite 471','1973-01-11 17:35:11','2021-04-22 00:38:22','1973-01-11 21:35:11',4,NULL),(71,36,21,2,11,'2019-02-06 08:12:53',1,' поторопитесь',2020,'15424 Romaguera Tunnel Suite 791','0133 Stanton Run Apt. 184','6993 Tod Cove Apt. 473','2019-02-06 07:12:53','2021-04-22 00:38:22','2019-02-06 11:12:53',4,NULL),(72,13,22,1,12,'1997-07-09 17:42:56',2,'',1000,'8672 Bartell Fields Apt. 943','6600 Dell Village Suite 966','5399 Cristopher Heights','1997-07-09 16:42:56','2021-04-22 00:38:22','1997-07-09 20:42:56',5,NULL),(73,17,23,1,13,'1991-11-30 12:55:54',3,'',220,'0664 Domenica Square Suite 580','09365 Batz Extension Suite 208','39866 Hyatt Fords Apt. 250','1991-11-30 11:55:54','2021-04-22 00:38:22','1991-11-30 15:55:54',5,NULL),(74,10,24,1,14,'2019-06-04 10:04:29',4,' парадная 3',1240,'009 Weimann Spur','','636 Kevin Loop','2019-06-04 09:04:29','2021-04-22 00:38:22','2019-06-04 13:04:29',5,NULL),(75,30,25,2,15,'2016-09-01 06:42:31',5,' 9 парадная',1080,'54540 Ophelia Village Suite 378','673 Neal Vista Apt. 725','30691 Marquardt Island','2016-09-01 05:42:31','2021-04-22 00:38:22','2016-09-01 09:42:31',5,NULL),(76,25,1,2,16,'1997-10-11 06:11:53',1,' парадная 2',730,'3691 Baumbach Points','086 Kreiger Station','03771 Fadel Villages Apt. 982','1997-10-11 05:11:53','2021-04-22 00:38:22','1997-10-11 09:11:53',4,NULL),(77,19,2,1,17,'1974-03-22 23:42:19',2,'',1710,'68440 Alaina Fords','','8659 Jayden Causeway Suite 936','1974-03-22 22:42:19','2021-04-22 00:38:22','1974-03-23 02:42:19',4,NULL),(78,43,3,1,18,'1998-04-24 18:02:08',3,' парадная 5',1130,'5394 Hartmann River Apt. 599','','5209 Tromp Plain','1998-04-24 17:02:08','2021-04-22 00:38:22','1998-04-24 21:02:08',5,NULL),(79,5,4,1,19,'2005-06-23 15:08:25',4,'',470,'978 Preston Creek','337 Walter Road','305 Nienow Trafficway','2005-06-23 14:08:25','2021-04-22 00:38:22','2005-06-23 18:08:25',5,NULL),(80,42,5,1,20,'1970-06-04 22:18:15',5,' под номером дома',990,'43955 Noah Grove','0682 Bria Locks','761 Mohr Street Apt. 714','1970-06-04 21:18:15','2021-04-22 00:38:22','1970-06-05 01:18:15',4,NULL),(81,37,6,1,1,'2010-12-30 07:21:09',1,' на углу дома',550,'0576 Schaefer Mills','98857 Brown Mountain','906 Kobe Port','2010-12-30 06:21:09','2021-04-22 00:38:22','2010-12-30 10:21:09',4,NULL),(82,14,7,1,2,'2016-12-24 10:33:40',2,'крайний подъезд',980,'210 Ollie Fords','8907 Tyreek Lock Apt. 736','369 Maud Pines Apt. 227','2016-12-24 09:33:40','2021-04-22 00:38:22','2016-12-24 13:33:40',4,NULL),(83,11,8,1,3,'2017-09-30 18:50:44',3,'',250,'70934 Cassin Springs Suite 176','27832 Ashly Cape','953 Citlalli Tunnel','2017-09-30 17:50:44','2021-04-22 03:02:33','2017-09-30 21:50:44',5,NULL),(84,41,9,1,4,'1996-11-17 10:24:43',4,' под номером дома',1010,'3120 Eugene Hill Apt. 826','','76965 Caleb Ways','1996-11-17 09:24:43','2021-04-22 03:02:33','1996-11-17 13:24:43',5,NULL),(85,15,10,1,5,'2005-05-07 02:16:25',5,'',730,'26441 Howe Groves Suite 386','','396 Dale Spur Suite 452','2005-05-07 01:16:25','2021-04-22 03:02:33','2005-05-07 05:16:25',5,NULL),(86,47,11,1,6,'2011-05-10 15:42:33',1,' парадная 5',530,'0156 Mellie Flat','','033 Macejkovic Lodge Apt. 268','2011-05-10 14:42:33','2021-04-22 00:38:22','2011-05-10 18:42:33',4,NULL),(87,13,12,1,7,'1997-06-24 05:30:41',2,'',1110,'78036 Edwina Throughway Suite 979','700 Nader Pines Suite 525','6060 Jovanny Springs Suite 212','1997-06-24 04:30:41','2021-04-22 03:02:33','1997-06-24 08:30:41',4,NULL),(88,20,13,1,8,'1998-10-22 12:55:54',3,' у калитки',630,'956 Rhiannon Way','','873 Mayer Stravenue Suite 942','1998-10-22 11:55:54','2021-04-22 00:38:22','1998-10-22 15:55:54',5,NULL),(89,35,14,1,9,'2008-09-04 02:27:32',4,'',480,'03052 Rae Path','','76776 Crona Ramp Suite 719','2008-09-04 01:27:32','2021-04-22 00:38:22','2008-09-04 05:27:32',4,NULL),(90,11,15,2,10,'1976-12-03 10:10:36',5,'',680,'43198 Langworth Wells','0221 Pacocha Circle Suite 493','0378 Anya Neck Suite 147','1976-12-03 09:10:36','2021-04-22 00:38:22','1976-12-03 13:10:36',5,NULL),(91,39,16,1,11,'1973-06-24 12:06:42',1,'',980,'33632 Hahn Forest','44986 Nikita Drive','688 Florida Prairie Apt. 100','1973-06-24 11:06:42','2021-04-22 03:02:33','1973-06-24 15:06:42',4,NULL),(92,38,17,1,12,'1978-12-21 12:32:04',2,'',440,'63089 Hauck Mountain','','2413 Henderson Ferry Suite 775','1978-12-21 11:32:04','2021-04-22 00:38:22','1978-12-21 15:32:04',5,NULL),(93,30,18,1,13,'1974-12-01 23:12:50',3,' 10 парадная',990,'253 Isaac Shoal Suite 227','','50161 Fabiola Rapids','1974-12-01 22:12:50','2021-04-22 03:02:33','1974-12-02 02:12:50',4,NULL),(94,10,19,2,14,'1976-07-19 00:44:46',4,' только русский водитель',650,'528 Mariana Fall Apt. 044','','89409 Schulist Pass','1976-07-18 23:44:46','2021-04-22 00:38:22','1976-07-19 03:44:46',5,NULL),(95,25,20,1,15,'2013-04-14 08:33:35',5,' парадная 5',500,'4725 Lakin Rapids','','96569 Rudy Causeway','2013-04-14 07:33:35','2021-04-22 00:38:22','2013-04-14 11:33:35',4,NULL),(96,43,21,2,16,'1973-08-10 03:48:10',1,' 8 парадная',690,'123 Blair Overpass Suite 353','','21712 Evie Greens','1973-08-10 02:48:10','2021-04-22 00:38:22','1973-08-10 06:48:10',4,NULL),(97,27,22,1,17,'2002-11-02 22:47:33',2,'',740,'60484 Alberto Extension Suite 714','','668 Isaias Brooks Apt. 432','2002-11-02 21:47:33','2021-04-22 03:02:33','2002-11-03 01:47:33',4,NULL),(98,24,23,1,18,'2009-07-17 23:44:23',3,' парадная 2',730,'0059 Fred Junctions Apt. 684','2653 Terrance Inlet Suite 623','95019 Alexie Island Suite 018','2009-07-17 22:44:23','2021-04-22 00:38:22','2009-07-18 02:44:23',4,NULL),(99,21,24,1,19,'1972-02-11 06:18:42',4,'крайний подъезд',630,'5287 Cummings Turnpike','','53423 Mustafa Coves Apt. 794','1972-02-11 05:18:42','2021-04-22 00:38:22','1972-02-11 09:18:42',5,NULL),(100,26,25,2,20,'1986-09-15 01:50:15',5,' парадная 2',1020,'76080 Hoppe Squares','6952 Mayer Fall Apt. 663','991 Sanford Vista','1986-09-15 00:50:15','2021-04-22 00:38:22','1986-09-15 04:50:15',5,NULL),(101,23,1,1,1,'2005-10-23 07:13:56',1,'',1210,'47328 Alexandrea Court Apt. 647','331 Wilson Springs','669 Fisher Mission Apt. 143','2005-10-23 06:13:56','2021-04-22 00:38:22','2005-10-23 10:13:56',4,NULL),(102,31,2,1,2,'1999-01-25 10:08:09',2,' под номером дома',1170,'695 Wolf Tunnel Apt. 050','005 Dickens Skyway Apt. 923','2730 Nitzsche Ports Suite 217','1999-01-25 09:08:09','2021-04-22 00:38:22','1999-01-25 13:08:09',5,NULL),(103,15,3,2,3,'2009-11-08 09:49:46',3,'',500,'5777 Strosin Fork Suite 432','73532 O\'Keefe Crossroad Suite 251','525 Domingo Villages','2009-11-08 08:49:46','2021-04-22 00:38:22','2009-11-08 12:49:46',4,NULL),(104,9,4,1,4,'2001-11-09 21:38:30',4,' только русский водитель',380,'59086 Romaguera Passage','6143 Kyla Station Suite 383','306 Kassulke Station','2001-11-09 20:38:30','2021-04-22 00:38:22','2001-11-10 00:38:30',4,NULL),(105,20,5,1,5,'2012-01-25 15:29:13',5,'',400,'90097 Lavina Passage','693 Huel Plaza Suite 935','3182 Aimee Trafficway','2012-01-25 14:29:13','2021-04-22 00:38:22','2012-01-25 18:29:13',4,NULL),(106,21,6,2,6,'1999-06-02 10:38:05',1,'',1140,'2671 Dooley Drive Apt. 847','7706 Darwin Village','42695 Kenya Islands','1999-06-02 09:38:05','2021-04-22 00:38:22','1999-06-02 13:38:05',5,NULL),(107,23,7,1,7,'2016-04-01 22:55:17',2,'',200,'5844 Watson Spurs Apt. 021','','635 Frederique Loaf Suite 553','2016-04-01 21:55:17','2021-04-22 03:02:33','2016-04-02 01:55:17',5,NULL),(108,43,8,1,8,'2003-07-02 08:53:28',3,'',370,'716 Callie Isle','','038 Jayson Landing Suite 201','2003-07-02 07:53:28','2021-04-22 00:38:22','2003-07-02 11:53:28',5,NULL),(109,26,9,1,9,'2005-01-25 22:22:48',4,'',1560,'38009 Goodwin Freeway','4419 King Pine','4495 Beer Mission Suite 196','2005-01-25 21:22:48','2021-04-22 03:02:33','2005-01-26 01:22:48',5,NULL),(110,23,10,1,10,'1995-03-16 19:26:33',5,'крайний подъезд',760,'510 Oliver Divide Apt. 490','','12985 Will Meadows','1995-03-16 18:26:33','2021-04-22 00:38:22','1995-03-16 22:26:33',5,NULL),(111,23,11,1,11,'2018-11-25 08:27:22',1,'',2940,'37576 Lorenzo Cape Apt. 143','','51496 Vita Fields Apt. 884','2018-11-25 07:27:22','2021-04-22 00:38:22','2018-11-25 11:27:22',4,NULL),(112,42,12,2,12,'2011-11-09 09:32:10',2,' помочь клиенту',420,'78616 Lola Ford','','33762 Fay Street Suite 595','2011-11-09 08:32:10','2021-04-22 00:38:22','2011-11-09 12:32:10',4,NULL),(113,1,13,2,13,'2017-10-18 10:32:15',3,' парадная 3',1090,'6805 Camren Forks Apt. 661','77584 Zaria Vista Apt. 284','1674 Tommie Mall Apt. 886','2017-10-18 09:32:15','2021-04-22 00:38:22','2017-10-18 13:32:15',5,NULL),(114,38,14,1,14,'1994-03-05 03:59:48',4,' сдача с 1000',780,'910 Paucek Squares Apt. 069','','603 Bartoletti Street Apt. 018','1994-03-05 02:59:48','2021-04-22 00:38:22','1994-03-05 06:59:48',4,NULL),(115,29,15,2,15,'2004-02-29 12:07:52',5,' у калитки',1200,'1042 Torphy Station','','52732 Mueller Way Suite 065','2004-02-29 11:07:52','2021-04-22 00:38:22','2004-02-29 15:07:52',4,NULL),(116,42,16,1,16,'1982-11-13 13:40:33',1,'',1410,'665 Meredith Junction Apt. 230','0055 Macejkovic Mountain Suite 474','546 VonRueden Mews','1982-11-13 12:40:33','2021-04-22 03:02:33','1982-11-13 16:40:33',4,NULL),(117,48,17,1,17,'1971-09-21 17:49:29',2,'',760,'9148 Bradtke Street Suite 555','93270 Schmeler Common Apt. 243','147 Dawson Centers Suite 589','1971-09-21 16:49:29','2021-04-22 00:38:22','1971-09-21 20:49:29',4,NULL),(118,17,18,1,18,'1981-07-10 19:57:21',3,'',1110,'048 Francesca Route','','225 Marvin Motorway','1981-07-10 18:57:21','2021-04-22 00:38:22','1981-07-10 22:57:21',4,NULL),(119,21,19,1,19,'1999-06-27 21:39:16',4,'',1180,'9520 Will Coves Apt. 046','','85840 Silas Tunnel','1999-06-27 20:39:16','2021-04-22 03:02:33','1999-06-28 00:39:16',5,NULL),(120,2,20,1,20,'1972-12-19 09:40:46',5,'',540,'7079 Breitenberg Well Apt. 475','','202 Goyette Courts Apt. 773','1972-12-19 08:40:46','2021-04-22 03:02:33','1972-12-19 12:40:46',4,NULL),(121,16,21,1,1,'1987-06-14 05:01:41',1,'крайний подъезд',1050,'4023 Dandre Wall','9378 Bednar Manor','4766 Durgan Brooks Apt. 725','1987-06-14 04:01:41','2021-04-22 00:38:22','1987-06-14 08:01:41',5,NULL),(122,18,22,1,2,'1978-11-20 11:50:02',2,'',1030,'42309 Harvey Terrace Apt. 451','','07384 Wiegand Branch','1978-11-20 10:50:02','2021-04-22 03:02:33','1978-11-20 14:50:02',5,NULL),(123,46,23,1,3,'2003-03-10 14:39:57',3,' парадная 4',1150,'146 Hahn Ranch Suite 560','1567 Jordy Forks Suite 502','9693 Damon Square Suite 910','2003-03-10 13:39:57','2021-04-22 00:38:22','2003-03-10 17:39:57',5,NULL),(124,41,24,1,4,'2005-08-23 06:35:45',4,' возможно придется подождать',330,'4794 Harris Pine Suite 707','','48676 Lillie Point Suite 255','2005-08-23 05:35:45','2021-04-22 03:02:33','2005-08-23 09:35:45',5,NULL),(125,32,25,1,5,'2008-06-28 02:02:56',5,' поторопитесь',410,'65504 Dudley Centers','','595 Hickle Meadows Suite 867','2008-06-28 01:02:56','2021-04-22 00:38:22','2008-06-28 05:02:56',5,NULL),(126,45,1,1,6,'2018-02-09 16:21:51',1,' парадная 2',1130,'8915 Rippin Extensions Apt. 656','','02004 Schiller Canyon','2018-02-09 15:21:51','2021-04-22 00:38:22','2018-02-09 19:21:51',5,NULL),(127,6,2,1,7,'1978-09-20 10:47:35',2,'',220,'7323 Lauryn Trafficway','','90574 Alvis Throughway','1978-09-20 09:47:35','2021-04-22 03:02:33','1978-09-20 13:47:35',5,NULL),(128,21,3,1,8,'1987-07-02 03:19:58',3,'',1140,'5785 Hortense Shoals','2586 Cooper Springs','0478 Corbin Crest Apt. 151','1987-07-02 02:19:58','2021-04-22 00:38:22','1987-07-02 06:19:58',5,NULL),(129,26,4,1,9,'2014-12-21 21:31:17',4,'',1000,'7365 Brekke Turnpike','','89295 Klocko Villages','2014-12-21 20:31:17','2021-04-22 00:38:22','2014-12-22 00:31:17',4,NULL),(130,21,5,1,10,'1986-05-16 17:34:16',5,'',220,'8458 Hartmann Key Apt. 663','','0316 Melyssa Neck Suite 479','1986-05-16 16:34:16','2021-04-22 00:38:22','1986-05-16 20:34:16',5,NULL),(131,35,6,1,11,'1990-10-12 03:41:32',1,'крайний подъезд',1060,'997 Bernhard Spurs','','973 Hackett Loop Suite 967','1990-10-12 02:41:32','2021-04-22 00:38:22','1990-10-12 06:41:32',5,NULL),(132,8,7,2,12,'2016-11-21 22:51:38',2,'',500,'8946 Heaney Expressway Apt. 854','7895 Walsh Harbor','65157 Harvey Course Suite 777','2016-11-21 21:51:38','2021-04-22 00:38:22','2016-11-22 01:51:38',5,NULL),(133,47,8,1,13,'1988-09-06 20:18:53',3,'',1170,'49388 Madilyn Track Suite 247','','34802 Brakus Shore Suite 253','1988-09-06 19:18:53','2021-04-22 03:02:33','1988-09-06 23:18:53',4,NULL),(134,16,9,1,14,'1995-11-16 23:07:29',4,' у магазина',250,'1578 Kieran Run','','78081 Sporer Ridges Apt. 666','1995-11-16 22:07:29','2021-04-22 00:38:22','1995-11-17 02:07:29',5,NULL),(135,48,10,2,15,'2019-08-31 17:38:07',5,' с остановки',2160,'20901 Kira Estate Apt. 739','','35748 Barrows Prairie Apt. 458','2019-08-31 16:38:07','2021-04-22 00:38:22','2019-08-31 20:38:07',4,NULL),(136,26,11,1,16,'2001-07-20 00:14:04',1,'',1090,'223 Mervin Gateway','24684 Hilll Cliff Apt. 101','8725 Walton Ranch','2001-07-19 23:14:04','2021-04-22 03:02:33','2001-07-20 03:14:04',5,NULL),(137,41,12,2,17,'2016-03-04 19:26:29',2,'',300,'8917 Zieme Trafficway Suite 608','044 Creola Heights Suite 540','1465 Keebler Loop','2016-03-04 18:26:29','2021-04-22 00:38:22','2016-03-04 22:26:29',5,NULL),(138,4,13,1,18,'2021-02-20 08:19:21',3,'',880,'207 McDermott Drive Suite 835','8639 Reilly Island Suite 594','96120 Tillman Mall Suite 128','2021-02-20 07:19:21','2021-04-22 00:38:22','2021-02-20 11:19:21',4,NULL),(139,33,14,1,19,'2019-08-07 13:45:22',4,'',1040,'078 Gerda Vista','8667 Addison Estate','9222 Emmerich Harbors','2019-08-07 12:45:22','2021-04-22 00:38:22','2019-08-07 16:45:22',4,NULL),(140,16,15,1,20,'1991-04-21 07:32:07',5,'',1180,'8215 Vada Inlet','','209 Pacocha Flat','1991-04-21 06:32:07','2021-04-22 00:38:22','1991-04-21 10:32:07',5,NULL),(141,14,16,1,1,'2009-01-18 03:43:03',1,'',680,'8509 Nader Circle','','0898 Sawayn Locks','2009-01-18 02:43:03','2021-04-22 00:38:22','2009-01-18 06:43:03',5,NULL),(142,23,17,1,2,'2007-10-25 12:55:19',2,'',420,'866 Sanford Isle Suite 748','','39372 Linnea Springs Apt. 560','2007-10-25 11:55:19','2021-04-22 00:38:22','2007-10-25 15:55:19',5,NULL),(143,34,18,1,3,'1993-08-09 20:56:43',3,'',1030,'95395 Ignacio Orchard Apt. 307','658 Schowalter Underpass Apt. 346','591 Cyrus Camp','1993-08-09 19:56:43','2021-04-22 03:02:33','1993-08-09 23:56:43',5,NULL),(144,25,19,1,4,'1983-02-17 19:06:25',4,'',370,'305 Olaf Center Apt. 689','','51798 Sedrick Stravenue','1983-02-17 18:06:25','2021-04-22 03:02:33','1983-02-17 22:06:25',4,NULL),(145,17,20,1,5,'1998-02-27 02:57:45',5,' 8 парадная',630,'280 Larry Ramp','3579 Donny Avenue','91777 Rogahn Mews','1998-02-27 01:57:45','2021-04-22 00:38:22','1998-02-27 05:57:45',5,NULL),(146,14,21,1,6,'2011-09-08 20:12:26',1,' парадная 3',650,'928 Sipes Ports','','413 Jakob Run Apt. 409','2011-09-08 19:12:26','2021-04-22 03:02:33','2011-09-08 23:12:26',5,NULL),(147,16,22,1,7,'1970-07-25 07:47:49',2,' помочь клиенту',1120,'2021 Alberto Creek Apt. 140','','50368 Parisian Crossing','1970-07-25 06:47:49','2021-04-22 03:02:33','1970-07-25 10:47:49',4,NULL),(148,43,23,1,8,'1973-10-11 04:15:32',3,'',630,'472 Ebert Island','','1545 Mario Roads Apt. 060','1973-10-11 03:15:32','2021-04-22 03:02:33','1973-10-11 07:15:32',5,NULL),(149,44,24,2,9,'2014-07-19 19:13:41',4,'',410,'10437 Price Harbor','54515 Hamill Parkways Suite 211','8251 Christop Prairie Suite 855','2014-07-19 18:13:41','2021-04-22 00:38:22','2014-07-19 22:13:41',5,NULL),(150,47,25,1,10,'1993-08-17 13:52:13',5,' парадная 2',730,'04804 Swift Meadows Suite 394','','423 Shayne Trail','1993-08-17 12:52:13','2021-04-22 00:38:22','1993-08-17 16:52:13',5,NULL),(151,8,1,1,11,'1989-04-13 11:14:40',1,' последний подъезд',700,'051 Alysha Stream Apt. 515','514 Pfannerstill Passage Apt. 048','558 Lilliana Green','1989-04-13 10:14:40','2021-04-22 00:38:22','1989-04-13 14:14:40',4,NULL),(152,22,2,1,12,'1974-02-26 03:34:36',2,' парадная 3',430,'13208 Michelle Walks Suite 888','7580 Streich Burgs','9413 Ronaldo Harbors','1974-02-26 02:34:36','2021-04-22 00:38:22','1974-02-26 06:34:36',5,NULL),(153,12,3,1,13,'1976-09-03 15:46:39',3,'',890,'8894 Kohler Mill Suite 171','','6146 Jaida Stream','1976-09-03 14:46:39','2021-04-22 00:38:22','1976-09-03 18:46:39',5,NULL),(154,34,4,1,14,'1979-04-03 03:25:17',4,' сдача с 1000',1710,'904 Otho Island Apt. 959','','2478 Giovanna Trail Apt. 381','1979-04-03 02:25:17','2021-04-22 00:38:22','1979-04-03 06:25:17',5,NULL),(155,45,5,2,15,'1975-07-20 15:58:52',5,' парадная 3',650,'29816 Christiansen Plaza','73223 Randall Manors Suite 873','24274 Hattie Junction Apt. 444','1975-07-20 14:58:52','2021-04-22 00:38:22','1975-07-20 18:58:52',5,NULL),(156,24,6,1,16,'2006-07-18 21:46:17',1,'',720,'90247 Hintz Alley','6823 Bosco Forge','073 Frami Fields','2006-07-18 20:46:17','2021-04-22 00:38:22','2006-07-19 00:46:17',4,NULL),(157,4,7,2,17,'2000-08-14 14:21:35',2,'',1040,'2346 Kali Track Apt. 806','473 Cronin Falls Suite 522','734 Kelly Way','2000-08-14 13:21:35','2021-04-22 00:38:22','2000-08-14 17:21:35',4,NULL),(158,36,8,1,18,'2008-09-17 13:07:13',3,' 9 парадная',1100,'672 Gaylord Extension','','5178 Jones Dam Suite 268','2008-09-17 12:07:13','2021-04-22 00:38:22','2008-09-17 16:07:13',5,NULL),(159,48,9,2,19,'1999-08-14 06:55:22',4,' помочь клиенту',1180,'101 Florence Fields Suite 530','76763 Herminio Walk','19986 Abe Street','1999-08-14 05:55:22','2021-04-22 00:38:22','1999-08-14 09:55:22',5,NULL),(160,28,10,2,20,'1975-07-04 15:43:32',5,' парадная 4',1280,'950 Kristy Haven','2803 Sven Tunnel Suite 098','2419 Morar Landing Suite 072','1975-07-04 14:43:32','2021-04-22 00:38:22','1975-07-04 18:43:32',5,NULL),(161,10,11,1,1,'1989-01-16 20:09:01',1,' сдача с 1000',1050,'8867 Miller Trail Suite 513','013 Jacobi Courts Apt. 344','44880 Osbaldo Hill','1989-01-16 19:09:01','2021-04-22 03:02:33','1989-01-16 23:09:01',5,NULL),(162,2,12,1,2,'1984-07-01 03:56:09',2,'',710,'571 Alene Mill Apt. 123','87789 D\'angelo Land Suite 585','0994 Josue Fords Suite 894','1984-07-01 02:56:09','2021-04-22 03:02:33','1984-07-01 06:56:09',4,NULL),(163,3,13,1,3,'1981-04-23 11:33:33',3,' последний подъезд',970,'59899 Reba Club Apt. 235','','8869 Schimmel Divide','1981-04-23 10:33:33','2021-04-22 03:02:33','1981-04-23 14:33:33',4,NULL),(164,26,14,1,4,'2000-02-16 03:22:07',4,'',1130,'760 Brandyn Expressway','31534 Conroy Islands Suite 134','2843 Mittie Springs','2000-02-16 02:22:07','2021-04-22 03:02:33','2000-02-16 06:22:07',4,NULL),(165,6,15,1,5,'2014-06-10 14:51:59',5,'',1190,'08803 Schamberger Orchard Suite 673','','7528 Aaliyah Shore Suite 436','2014-06-10 13:51:59','2021-04-22 03:02:33','2014-06-10 17:51:59',4,NULL),(166,19,16,2,6,'1981-04-02 17:51:55',1,' помочь клиенту',810,'3927 Ayden Hills Suite 371','','6857 Amaya Expressway','1981-04-02 16:51:55','2021-04-22 00:38:22','1981-04-02 20:51:55',5,NULL),(167,1,17,1,7,'1976-06-16 17:28:54',2,' парадная 5',810,'36384 Hammes Via','92967 Otho Courts','495 Sawayn Bridge','1976-06-16 16:28:54','2021-04-22 00:38:22','1976-06-16 20:28:54',5,NULL),(168,11,18,1,8,'2004-03-05 03:45:40',3,' парадная 5',540,'8991 DuBuque Cliffs Suite 667','','964 Langworth Park Suite 409','2004-03-05 02:45:40','2021-04-22 00:38:22','2004-03-05 06:45:40',4,NULL),(169,1,19,1,9,'2020-08-10 02:34:49',4,'',710,'425 Josh Greens','9145 Kane Trail Apt. 633','235 Leanna Square','2020-08-10 01:34:49','2021-04-22 03:02:33','2020-08-10 05:34:49',5,NULL),(170,42,20,1,10,'1970-06-27 01:23:01',5,'',460,'440 Austen Orchard','090 Marley Meadow','77891 Rempel Land','1970-06-27 00:23:01','2021-04-22 00:38:22','1970-06-27 04:23:01',5,NULL),(171,26,21,1,11,'2015-04-26 12:25:04',1,' с остановки',380,'0122 Nader Expressway Apt. 922','709 Hagenes Row Apt. 208','661 Orrin Pines','2015-04-26 11:25:04','2021-04-22 00:38:22','2015-04-26 15:25:04',5,NULL),(172,33,22,1,12,'1988-09-28 22:12:47',2,'',470,'5890 Alene Prairie','','231 Chanelle Burg','1988-09-28 21:12:47','2021-04-22 00:38:22','1988-09-29 01:12:47',5,NULL),(173,45,23,1,13,'1991-08-13 03:21:03',3,' бабушка',640,'58293 Kristopher Stream Apt. 593','6849 Harris Shores','4815 Tromp Lake Suite 894','1991-08-13 02:21:03','2021-04-22 00:38:22','1991-08-13 06:21:03',5,NULL),(174,22,24,1,14,'1985-12-24 17:32:10',4,' помочь клиенту',720,'42710 Brody Highway','','17624 Lilyan Station','1985-12-24 16:32:10','2021-04-22 00:38:22','1985-12-24 20:32:10',5,NULL),(175,23,25,2,15,'2006-04-05 20:28:17',5,' у магазина',370,'79539 Franecki Estates','','041 Dominique Summit Suite 296','2006-04-05 19:28:17','2021-04-22 00:38:22','2006-04-05 23:28:17',5,NULL),(176,24,1,2,16,'2003-01-04 20:48:52',1,' на углу дома',430,'8149 Nicolas Motorway Suite 582','','46791 Schaefer Fort Apt. 854','2003-01-04 19:48:52','2021-04-22 00:38:22','2003-01-04 23:48:52',5,NULL),(177,34,2,2,17,'1978-04-27 14:04:22',2,' парадная 2',220,'03523 Colby Square Suite 679','2683 Borer Summit Suite 991','8634 Bahringer Islands Apt. 147','1978-04-27 13:04:22','2021-04-22 00:38:22','1978-04-27 17:04:22',4,NULL),(178,5,3,1,18,'1993-11-27 02:35:25',3,'',910,'5562 Lonie Mall Apt. 363','51436 Rosanna Lights Suite 789','86001 Barton Burgs Suite 697','1993-11-27 01:35:25','2021-04-22 00:38:22','1993-11-27 05:35:25',5,NULL),(179,42,4,1,19,'2017-06-07 11:10:50',4,' парадная 3',810,'9001 Daniel Tunnel','838 Jeramy Glen Suite 029','8152 Leda Cliff','2017-06-07 10:10:50','2021-04-22 00:38:22','2017-06-07 14:10:50',4,NULL),(180,30,5,2,20,'1991-11-23 19:49:14',5,'',890,'01540 Alex Knoll Suite 272','','9945 Myrtle Causeway','1991-11-23 18:49:14','2021-04-22 00:38:22','1991-11-23 22:49:14',5,NULL),(181,45,6,2,1,'2000-01-15 01:17:52',1,'',470,'631 Batz Point Apt. 593','','451 Halvorson Parkway','2000-01-15 00:17:52','2021-04-22 00:38:22','2000-01-15 04:17:52',4,NULL),(182,26,7,1,2,'2001-09-30 12:26:35',2,' бабушка',1630,'4416 Medhurst Brooks Suite 138','1903 Anya Parkways Apt. 615','752 Lane Manor','2001-09-30 11:26:35','2021-04-22 00:38:22','2001-09-30 15:26:35',4,NULL),(183,1,8,2,3,'1989-07-12 21:59:10',3,' сдача с 1000',220,'6913 Sadye Fords Apt. 158','','0224 Aufderhar Green Apt. 982','1989-07-12 20:59:10','2021-04-22 00:38:22','1989-07-13 00:59:10',5,NULL),(184,42,9,2,4,'1976-11-27 19:46:55',4,' возможно придется подождать',1410,'88051 Ricky Street Apt. 432','','106 Daryl Road','1976-11-27 18:46:55','2021-04-22 00:38:22','1976-11-27 22:46:55',5,NULL),(185,33,10,1,5,'1988-06-15 10:34:26',5,'',5220,'2028 Labadie Corners','','9371 Doris Village','1988-06-15 09:34:26','2021-04-22 00:38:22','1988-06-15 13:34:26',5,NULL),(186,17,11,2,6,'1973-12-10 11:00:32',1,' только русский водитель',5220,'51957 Otis Estates','6629 Nina Plain Apt. 351','68968 Megane Island','1973-12-10 10:00:32','2021-04-22 00:38:22','1973-12-10 14:00:32',4,NULL),(187,38,12,1,7,'1976-02-08 12:29:50',2,' парадная 4',930,'68443 Oberbrunner Summit Apt. 572','','97043 Cruickshank Squares Suite 005','1976-02-08 11:29:50','2021-04-22 03:02:33','1976-02-08 15:29:50',5,NULL),(188,27,13,1,8,'1999-07-16 06:19:12',3,' сдача с 1000',370,'575 Helena Ford','4960 Waters Spurs Suite 837','411 Tamia Lakes Suite 625','1999-07-16 05:19:12','2021-04-22 03:02:33','1999-07-16 09:19:12',5,NULL),(189,46,14,1,9,'1980-07-03 12:24:37',4,' под номером дома',440,'727 Bernhard Locks Suite 345','','53982 Cristobal Motorway','1980-07-03 11:24:37','2021-04-22 03:02:33','1980-07-03 15:24:37',4,NULL),(190,49,15,1,10,'1985-02-11 18:03:39',5,'',5220,'652 Kareem Ports Apt. 132','058 West Streets Apt. 501','68876 Roscoe Streets','1985-02-11 17:03:39','2021-04-22 03:02:33','1985-02-11 21:03:39',4,NULL),(191,41,16,1,11,'2019-07-10 08:59:15',1,'',710,'814 Tina Path','3112 Halvorson Land Apt. 757','236 Prosacco Burgs','2019-07-10 07:59:15','2021-04-22 03:02:33','2019-07-10 11:59:15',5,NULL),(192,28,17,1,12,'2001-08-20 11:14:46',2,' под номером дома',2160,'592 Price Ports','','48798 Francisca Inlet','2001-08-20 10:14:46','2021-04-22 00:38:22','2001-08-20 14:14:46',5,NULL),(193,7,18,1,13,'2018-11-21 17:36:55',3,' под номером дома',310,'4923 Rogers Mount','','9850 Annamae Fields','2018-11-21 16:36:55','2021-04-22 00:38:22','2018-11-21 20:36:55',4,NULL),(194,16,19,1,14,'1981-04-12 17:09:12',4,' сдача с 1000',780,'36424 Verlie Mill Suite 922','','161 Lesch Viaduct Apt. 036','1981-04-12 16:09:12','2021-04-22 00:38:22','1981-04-12 20:09:12',4,NULL),(195,37,20,1,15,'1998-11-26 09:13:20',5,' сдача с 1000',500,'382 Tromp Plain Apt. 724','50046 Beer River Apt. 340','702 Bergstrom Turnpike','1998-11-26 08:13:20','2021-04-22 00:38:22','1998-11-26 12:13:20',5,NULL),(196,24,21,1,16,'2009-07-14 21:03:53',1,' парадная 5',1300,'539 Kulas Wells','0378 Mertz Fall','6328 Lehner Islands','2009-07-14 20:03:53','2021-04-22 00:38:22','2009-07-15 00:03:53',5,NULL),(197,7,22,2,17,'2000-03-13 00:39:27',2,' молчаливый водитель',510,'4770 Walsh Summit Suite 463','631 Robbie Avenue','58351 Isabell Garden','2000-03-12 23:39:27','2021-04-22 00:38:22','2000-03-13 03:39:27',5,NULL),(198,4,23,1,18,'2020-09-06 12:44:07',3,'',2940,'077 Bahringer Pines','5786 Gusikowski Bridge Apt. 977','4726 Lora Pines Apt. 442','2020-09-06 11:44:07','2021-04-22 03:02:33','2020-09-06 15:44:07',4,NULL),(199,49,24,2,19,'2002-07-27 21:46:23',4,' возможно придется подождать',1080,'823 Kreiger Passage','','73286 Leonor Ports Suite 335','2002-07-27 20:46:23','2021-04-22 00:38:22','2002-07-28 00:46:23',5,NULL),(200,40,25,1,20,'2008-03-21 16:09:59',5,'',690,'281 Johann Manors Apt. 755','570 Fay Prairie Suite 771','392 Alysa Valleys Suite 930','2008-03-21 15:09:59','2021-04-22 00:38:22','2008-03-21 19:09:59',4,NULL),(201,13,1,1,1,'1996-07-29 14:14:28',1,'',200,'83830 Rahsaan Port','44383 Harris Burg Apt. 922','770 Kozey Street Apt. 365','1996-07-29 13:14:28','2021-04-22 00:38:22','1996-07-29 17:14:28',5,NULL),(202,13,2,1,2,'1994-02-11 14:38:13',2,'',500,'168 Heloise Road Suite 220','','16840 Bode Drive','1994-02-11 13:38:13','2021-04-22 00:38:22','1994-02-11 17:38:13',4,NULL),(203,45,3,1,3,'2008-02-07 10:17:19',3,' у магазина',630,'840 Harrison Track','9489 Mohr Glen','2449 Delilah Drive Suite 091','2008-02-07 09:17:19','2021-04-22 00:38:22','2008-02-07 13:17:19',4,NULL),(204,46,4,1,4,'1985-09-16 19:41:08',4,'',1070,'764 Macejkovic Spring Apt. 550','','2073 Kuvalis Union Apt. 411','1985-09-16 18:41:08','2021-04-22 00:38:22','1985-09-16 22:41:08',4,NULL),(205,16,5,1,5,'1993-04-09 11:22:25',5,'',710,'5806 Pacocha Corner Suite 982','','9426 Skye Common','1993-04-09 10:22:25','2021-04-22 00:38:22','1993-04-09 14:22:25',4,NULL),(206,46,6,1,6,'1982-02-24 12:18:34',1,'',530,'4911 Thompson Wall','','726 Keven Hill Suite 641','1982-02-24 11:18:34','2021-04-22 00:38:22','1982-02-24 15:18:34',5,NULL),(207,31,7,2,7,'2004-02-24 03:04:19',2,' последний подъезд',370,'228 Feest Creek Apt. 854','1124 Witting Port Suite 845','5050 Spencer Shore','2004-02-24 02:04:19','2021-04-22 00:38:22','2004-02-24 06:04:19',5,NULL),(208,32,8,1,8,'2007-04-21 04:19:43',3,' у магазина',970,'1495 Konopelski Avenue','','2386 Heather Square Suite 593','2007-04-21 03:19:43','2021-04-22 00:38:22','2007-04-21 07:19:43',5,NULL),(209,43,9,2,9,'1995-03-19 03:31:30',4,'',410,'28810 Maida Port','850 Daphne Trail Suite 714','6461 Irwin Port','1995-03-19 02:31:30','2021-04-22 00:38:22','1995-03-19 06:31:30',5,NULL),(210,38,10,1,10,'2011-08-16 07:33:06',5,' 8 парадная',880,'596 Abernathy Shore','','65808 Faye Lakes','2011-08-16 06:33:06','2021-04-22 00:38:22','2011-08-16 10:33:06',4,NULL),(211,29,11,1,11,'2011-09-16 15:58:12',1,'',590,'70719 Eliane Parkways Apt. 090','','770 Toy Garden','2011-09-16 14:58:12','2021-04-22 00:38:22','2011-09-16 18:58:12',5,NULL),(212,8,12,1,12,'2004-05-23 07:39:00',2,'',430,'34370 Oswaldo Oval Suite 958','','887 Mathilde Port Suite 314','2004-05-23 06:39:00','2021-04-22 03:02:33','2004-05-23 10:39:00',4,NULL),(213,42,13,1,13,'1974-12-22 12:21:30',3,'',670,'750 Kenton Locks','','87448 Marianna Square','1974-12-22 11:21:30','2021-04-22 03:02:33','1974-12-22 15:21:30',4,NULL),(214,2,14,1,14,'1970-11-26 12:23:03',4,' поторопитесь',1210,'6920 Harvey Stream','73849 Schowalter Roads Apt. 659','06487 Destiny Plaza','1970-11-26 11:23:03','2021-04-22 00:38:22','1970-11-26 15:23:03',4,NULL),(215,34,15,1,15,'1972-11-19 00:49:55',5,' 10 парадная',890,'15955 Medhurst Garden Suite 145','','54767 Kihn Keys','1972-11-18 23:49:55','2021-04-22 03:02:33','1972-11-19 03:49:55',4,NULL),(216,33,16,1,16,'2009-09-16 02:22:25',1,' 9 парадная',490,'549 Thad Walk','8928 Jaylon Bypass','942 Margarita Highway','2009-09-16 01:22:25','2021-04-22 00:38:22','2009-09-16 05:22:25',5,NULL),(217,50,17,1,17,'1996-11-09 14:35:22',2,'',1090,'07667 Oliver Squares Apt. 158','09662 Roxanne Flat','81483 Addie Rest Suite 554','1996-11-09 13:35:22','2021-04-22 00:38:22','1996-11-09 17:35:22',4,NULL),(218,38,18,1,18,'2001-07-24 13:56:16',3,' последний подъезд',1010,'979 Kiehn Mountains Apt. 911','74144 Isabella Unions','400 Jamal Meadows Apt. 021','2001-07-24 12:56:16','2021-04-22 03:02:33','2001-07-24 16:56:16',4,NULL),(219,27,19,1,19,'1986-09-04 10:30:25',4,' у паркинга',5220,'0248 Marks Spurs Apt. 338','133 Arely Shoal Apt. 763','59580 Antonietta Prairie Apt. 884','1986-09-04 09:30:25','2021-04-22 00:38:22','1986-09-04 13:30:25',4,NULL),(220,29,20,1,20,'2018-07-10 03:06:14',5,'',1110,'4036 Al Spur','4309 Joe Way','922 Rebecca Tunnel Suite 190','2018-07-10 02:06:14','2021-04-22 00:38:22','2018-07-10 06:06:14',4,NULL),(221,32,21,1,1,'1986-04-04 08:29:53',1,'',260,'077 Etha Ports Apt. 377','','15013 McDermott Drive Apt. 745','1986-04-04 07:29:53','2021-04-22 00:38:22','1986-04-04 11:29:53',4,NULL),(222,40,22,2,2,'2003-07-08 15:59:33',2,'',550,'705 McGlynn Glens Suite 939','','594 Conroy Street','2003-07-08 14:59:33','2021-04-22 00:38:22','2003-07-08 18:59:33',5,NULL),(223,45,23,1,3,'1993-01-26 11:20:23',3,'',5220,'69163 Wallace Shoals','9361 Schimmel Squares','712 Katarina Port','1993-01-26 10:20:23','2021-04-22 00:38:22','1993-01-26 14:20:23',5,NULL),(224,1,24,2,4,'1976-12-01 12:43:52',4,'',680,'56783 Prohaska Fall Apt. 400','462 Niko Roads','733 Gaylord Throughway','1976-12-01 11:43:52','2021-04-22 00:38:22','1976-12-01 15:43:52',5,NULL),(225,7,25,1,5,'2002-03-29 00:09:10',5,'',1250,'5686 Hoeger Trail Suite 656','737 Karson Pines Suite 164','7620 Block Causeway Suite 427','2002-03-28 23:09:10','2021-04-22 00:38:22','2002-03-29 03:09:10',5,NULL),(226,25,1,1,6,'1999-02-01 23:23:58',1,' молчаливый водитель',950,'880 Santa Knoll','','3957 Cristal Manors','1999-02-01 22:23:58','2021-04-22 00:38:22','1999-02-02 02:23:58',5,NULL),(227,17,2,1,7,'2020-11-24 10:22:51',2,' парадная 3',1030,'51899 Mary Valleys Apt. 364','4617 Gilberto Loop','94306 Friesen Locks Apt. 188','2020-11-24 09:22:51','2021-04-22 00:38:22','2020-11-24 13:22:51',4,NULL),(228,36,3,2,8,'2020-11-25 04:48:55',3,'',740,'103 Tomasa Dale','75891 Amya Canyon Apt. 539','041 Treva Island Apt. 644','2020-11-25 03:48:55','2021-04-22 00:38:22','2020-11-25 07:48:55',4,NULL),(229,23,4,2,9,'1972-08-03 19:48:44',4,' под номером дома',230,'42184 Larue Road Suite 570','740 Stacy Curve','31470 Raynor Road','1972-08-03 18:48:44','2021-04-22 00:38:22','1972-08-03 22:48:44',4,NULL),(230,37,5,1,10,'1987-10-13 08:58:41',5,'',1220,'84629 Everette Isle','','4766 Theresia Forest','1987-10-13 07:58:41','2021-04-22 00:38:22','1987-10-13 11:58:41',5,NULL),(231,33,6,2,11,'1997-07-29 07:56:01',1,' последний подъезд',380,'3692 Rey Flat','','0399 Joanne Plaza','1997-07-29 06:56:01','2021-04-22 00:38:22','1997-07-29 10:56:01',5,NULL),(232,32,7,1,12,'1991-09-25 04:00:03',2,' парадная 2',850,'25881 Kaci Islands','197 Fay Greens','0292 Schulist Springs','1991-09-25 03:00:03','2021-04-22 00:38:22','1991-09-25 07:00:03',5,NULL),(233,10,8,2,13,'1993-03-14 06:06:11',3,' бабушка',630,'872 Nader Parkway','46715 Lazaro Stream','75599 Bartell Key Apt. 724','1993-03-14 05:06:11','2021-04-22 00:38:22','1993-03-14 09:06:11',5,NULL),(234,30,9,2,14,'2007-07-20 20:53:54',4,' сдача с 1000',1560,'515 Connelly Crest Suite 668','37133 Dorothy Glens','54544 Armand Lakes','2007-07-20 19:53:54','2021-04-22 00:38:22','2007-07-20 23:53:54',4,NULL),(235,48,10,1,15,'2009-07-20 07:11:57',5,'',560,'585 Prosacco Plaza','','41344 Chet Landing Apt. 016','2009-07-20 06:11:57','2021-04-22 00:38:22','2009-07-20 10:11:57',5,NULL),(236,15,11,2,16,'1982-04-15 03:50:58',1,' возможно придется подождать',2020,'7954 Oberbrunner Circle','','72280 Reta Coves Suite 250','1982-04-15 02:50:58','2021-04-22 00:38:22','1982-04-15 06:50:58',4,NULL),(237,10,12,2,17,'2008-05-12 10:05:59',2,' на углу дома',610,'308 Torp Estates Suite 470','674 Sauer Key Apt. 640','9812 Ted Forks','2008-05-12 09:05:59','2021-04-22 00:38:22','2008-05-12 13:05:59',4,NULL),(238,47,13,2,18,'1980-11-25 12:22:30',3,' 10 парадная',1270,'9178 Ethyl Summit','','68432 Rory Isle','1980-11-25 11:22:30','2021-04-22 00:38:22','1980-11-25 15:22:30',4,NULL),(239,15,14,1,19,'2000-11-23 21:06:19',4,'',720,'49915 Ella Place Apt. 720','','224 Runolfsdottir Underpass','2000-11-23 20:06:19','2021-04-22 00:38:22','2000-11-24 00:06:19',4,NULL),(240,41,15,1,20,'1996-01-19 21:16:49',5,'',460,'4481 Will Village','8726 Abe Key','81497 Nels Shores','1996-01-19 20:16:49','2021-04-22 00:38:22','1996-01-20 00:16:49',4,NULL),(241,38,16,2,1,'1994-08-28 14:30:39',1,' у паркинга',1160,'95104 Leola Extensions','9506 Murphy Mountains','4037 O\'Keefe Parkways Suite 898','1994-08-28 13:30:39','2021-04-22 00:38:22','1994-08-28 17:30:39',4,NULL),(242,22,17,1,2,'2004-04-05 16:38:22',2,'',710,'542 O\'Hara Path Suite 463','','1139 Marjory Mills Apt. 977','2004-04-05 15:38:22','2021-04-22 03:02:33','2004-04-05 19:38:22',4,NULL),(243,31,18,1,3,'2015-07-02 19:54:57',3,'',880,'91562 Heathcote Terrace','','738 Felix Lake Apt. 092','2015-07-02 18:54:57','2021-04-22 03:02:33','2015-07-02 22:54:57',5,NULL),(244,19,19,1,4,'1972-09-05 16:06:44',4,'',1000,'942 Asha Ford','','2453 Balistreri Highway Apt. 854','1972-09-05 15:06:44','2021-04-22 03:02:33','1972-09-05 19:06:44',5,NULL),(245,33,20,1,5,'1984-08-09 14:26:14',5,' помочь клиенту',1270,'2605 Filomena Lights Suite 281','4987 Lauriane Extensions','651 Yundt Crest','1984-08-09 13:26:14','2021-04-22 00:38:22','1984-08-09 17:26:14',4,NULL),(246,36,21,2,6,'1990-04-16 02:37:30',1,'',300,'842 Collins Spurs','','7048 Trystan Walks Suite 762','1990-04-16 01:37:30','2021-04-22 00:38:22','1990-04-16 05:37:30',5,NULL),(247,50,22,1,7,'2002-01-26 05:07:17',2,'',800,'6469 Beatty Forges','3260 Tamara Throughway Suite 545','16736 Uriel Estate','2002-01-26 04:07:17','2021-04-22 00:38:22','2002-01-26 08:07:17',5,NULL),(248,9,23,1,8,'1990-08-18 14:18:55',3,'',530,'39105 Schumm Mission','','2779 Osbaldo Brooks Suite 790','1990-08-18 13:18:55','2021-04-22 03:02:33','1990-08-18 17:18:55',4,NULL),(249,39,24,2,9,'1994-06-17 05:28:45',4,'',1030,'30489 Jeremie Ridges Suite 349','3908 Koss Corners','6738 Schroeder Creek Suite 574','1994-06-17 04:28:45','2021-04-22 00:38:22','1994-06-17 08:28:45',4,NULL),(250,42,25,1,10,'2015-12-27 02:10:51',5,' на углу дома',440,'16435 Miller Mountains Apt. 051','67942 Beau Falls Apt. 725','60030 Foster Pike','2015-12-27 01:10:51','2021-04-22 00:38:22','2015-12-27 05:10:51',4,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `work_status`
--

DROP TABLE IF EXISTS `work_status`;
/*!50001 DROP VIEW IF EXISTS `work_status`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `work_status` AS SELECT 
 1 AS `car_number`,
 1 AS `driver`,
 1 AS `phone`,
 1 AS `status`,
 1 AS `started`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `oldest_clients`
--

/*!50001 DROP VIEW IF EXISTS `oldest_clients`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `oldest_clients` AS select `clients`.`name` AS `name`,`clients`.`phone` AS `phone`,timestampdiff(YEAR,`clients`.`birthday`,now()) AS `age`,`clients`.`birthday` AS `birthday` from `clients` order by timestampdiff(YEAR,`clients`.`birthday`,now()) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `work_status`
--

/*!50001 DROP VIEW IF EXISTS `work_status`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `work_status` AS select (select `having_cars`.`car_plate` from `having_cars` where (`c`.`having_cars_id` = `having_cars`.`id`)) AS `car_number`,concat(`d`.`second_name`,' ',`d`.`first_name`) AS `driver`,`d`.`phone` AS `phone`,(select `car_status`.`status` from `car_status` where (`c`.`car_status_id` = `car_status`.`id`)) AS `status`,`c`.`started_at` AS `started` from (`online_cars` `c` join `drivers` `d` on((`d`.`id` = `c`.`drivers_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-22  7:17:40
