-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: 195.35.38.155    Database: u755589698_ICTCOServices
-- ------------------------------------------------------
-- Server version	5.5.5-10.11.9-MariaDB

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
-- Table structure for table `Clients_area`
--

DROP TABLE IF EXISTS `Clients_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clients_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `city_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Clients_area_city_id_b30afa06_fk_Clients_city_id` (`city_id`),
  CONSTRAINT `Clients_area_city_id_b30afa06_fk_Clients_city_id` FOREIGN KEY (`city_id`) REFERENCES `Clients_city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clients_area`
--

LOCK TABLES `Clients_area` WRITE;
/*!40000 ALTER TABLE `Clients_area` DISABLE KEYS */;
INSERT INTO `Clients_area` VALUES (1,'Nasr City',1),(2,'Heliopolis',1),(3,'Maadi',1),(4,'Zamalek',1),(5,'New Cairo',1),(6,'Downtown',1),(7,'Garden City',1),(8,'Dokki',1),(9,'Montaza',2),(10,'Smouha',2),(11,'Sidi Gaber',2),(12,'El Shatby',2),(13,'El Raml',2),(14,'Gleem',2),(15,'Stanley',2),(16,'Agamy',2),(17,'6th of October',3),(18,'Sheikh Zayed',3),(19,'Dokki',3),(20,'Mohandessin',3),(21,'Imbaba',3),(22,'Pyramids',3),(23,'Haram',3),(24,'Faisal',3),(25,'Naama Bay',4),(26,'Hadaba',4),(27,'Sharks Bay',4),(28,'Nabq Bay',4),(29,'Old Market',4),(30,'Dahar',5),(31,'Sakkala',5),(32,'El Gouna',5),(33,'Makadi Bay',5),(34,'Sahl Hasheesh',5),(35,'West Bank',6),(36,'East Bank',6),(37,'Karnak',6),(38,'Al Mabadat',6),(39,'Gezira',6),(40,'Awameya',6),(41,'Agilika Island',7),(42,'Elephantine Island',7),(43,'Nubian Village',7),(44,'Sehel',7),(45,'Gharb Aswan',7),(46,'Abu Simbel',7),(47,'Talkha',8),(48,'Al Mahalla',8),(49,'Mansoura Qism 2',8),(50,'Sakha',8),(51,'Gammaleya',8),(52,'Fayed',9),(53,'El Qantara',9),(54,'Al Tayaran',9),(55,'El Sheikh Zayed',9),(56,'El Mostashfa El Askary',9),(57,'El Arab District',10),(58,'Port Fouad',10),(59,'El Manakh',10),(60,'El Zohour',10),(61,'Sharq',10),(62,'Ain Sokhna',11),(63,'El Ganayen',11),(64,'Al Salam',11),(65,'Al Arbaeen',11),(66,'Faisal',11),(67,'Port Tawfiq',11),(68,'El Mehalla El Kobra',12),(69,'El Santa',12),(70,'Basyoun',12),(71,'Kafr El Zayat',12),(72,'Qotour',12),(73,'Fakous',13),(74,'Kafr Saqr',13),(75,'Abu Hammad',13),(76,'Bilbeis',13),(77,'Hihya',13),(78,'Diarb Negm',13),(79,'Delengat',14),(80,'Shubra Khit',14),(81,'Itay El Baroud',14),(82,'Kom Hamada',14),(83,'Abu Hummus',14),(84,'Ibshaway',15),(85,'Tamiya',15),(86,'Youssef El Seddik',15),(87,'Senoris',15),(88,'New Fayoum',15),(89,'Al Fashn',16),(90,'Ehnasia',16),(91,'Biba',16),(92,'Sumusta',16),(93,'Nasser City',16),(94,'Maghagha',17),(95,'Samalut',17),(96,'Abu Qirqas',17),(97,'Malawi',17),(98,'Deir Mawas',17),(99,'Tahta',18),(100,'Gerga',18),(101,'Akhmim',18),(102,'El Maragha',18),(103,'Dar El Salam',18),(104,'Tima',18),(105,'Abnoub',19),(106,'Abu Tig',19),(107,'Manfalut',19),(108,'Dairut',19),(109,'El Badari',19),(110,'Sahel Selim',19),(111,'Qift',20),(112,'Qus',20),(113,'Nag Hammadi',20),(114,'Farshut',20),(115,'El Waqf',20),(116,'Abu Tesht',20),(117,'Sheikh Zuweid',21),(118,'Rafah',21),(119,'Bir El Abd',21),(120,'El Mahdiya',21),(121,'Masaeed',21),(122,'El Alamein',22),(123,'Sidi Abdel Rahman',22),(124,'Siwa',22),(125,'El Obayed',22),(126,'Agiba',22),(127,'Ras El Bar',23),(128,'New Damietta',23),(129,'Kafr Saad',23),(130,'Faraskur',23),(131,'Ezbet El Borg',23),(132,'Banha',24),(133,'Shubra El Kheima',24),(134,'El Qanater',24),(135,'Khanka',24),(136,'Toukh',24),(137,'Qaha',24),(138,'Kafr El Dawwar',25),(139,'Damanhour',25),(140,'Rashid',25),(141,'Abu Hummus',25),(142,'Edku',25),(143,'Zagazig',26),(144,'Bilbeis',26),(145,'Fakous',26),(146,'Abu Hammad',26),(147,'El Husseiniya',26),(148,'Baltim',27),(149,'Desouk',27),(150,'Fouh',27),(151,'Sidi Salem',27),(152,'Biyala',27),(153,'El Riyad',27),(154,'El Mahalla',28),(155,'Samanoud',28),(156,'Zefta',28),(157,'Kafr El Zayat',28),(158,'Basyoun',28),(159,'Santa',28),(160,'Maadyat El Shat',11);
/*!40000 ALTER TABLE `Clients_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clients_city`
--

DROP TABLE IF EXISTS `Clients_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clients_city` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clients_city`
--

LOCK TABLES `Clients_city` WRITE;
/*!40000 ALTER TABLE `Clients_city` DISABLE KEYS */;
INSERT INTO `Clients_city` VALUES (21,'Al Arish'),(2,'Alexandria'),(19,'Assiut'),(7,'Aswan'),(25,'Beheira'),(16,'Beni Suef'),(1,'Cairo'),(14,'Damanhur'),(23,'Damietta'),(15,'Fayoum'),(28,'Gharbia'),(3,'Giza'),(5,'Hurghada'),(9,'Ismailia'),(27,'Kafr El Sheikh'),(6,'Luxor'),(8,'Mansoura'),(22,'Marsaa Matrouh'),(17,'Minya'),(10,'Port Said'),(24,'Qalyubia'),(20,'Qena'),(4,'Sharm El-Sheikh'),(26,'Sharqia'),(18,'Sohag'),(11,'Suez'),(12,'Tanta'),(13,'Zagazig');
/*!40000 ALTER TABLE `Clients_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clients_company`
--

DROP TABLE IF EXISTS `Clients_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clients_company` (
  `id` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_address` longtext NOT NULL,
  `phone_number` varchar(11) NOT NULL,
  `manager` varchar(255) DEFAULT NULL,
  `area_id` bigint(20) DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Clients_company_area_id_6e9cb82e_fk_Clients_area_id` (`area_id`),
  KEY `Clients_company_city_id_6af3d64c_fk_Clients_city_id` (`city_id`),
  CONSTRAINT `Clients_company_area_id_6e9cb82e_fk_Clients_area_id` FOREIGN KEY (`area_id`) REFERENCES `Clients_area` (`id`),
  CONSTRAINT `Clients_company_city_id_6af3d64c_fk_Clients_city_id` FOREIGN KEY (`city_id`) REFERENCES `Clients_city` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clients_company`
--

LOCK TABLES `Clients_company` WRITE;
/*!40000 ALTER TABLE `Clients_company` DISABLE KEYS */;
INSERT INTO `Clients_company` VALUES ('29b5f2e5-4769-444b-9c31-01812ebca5eb','منجم السكري','مرسي علم','01210947275','أ/محمد سمير',NULL,NULL),('442b153f-b9c3-4b03-88de-b59b53de42b0','جمعيه الصناع','معدية الشط ( شرق -غرب )','01002013535','العميد/ عبدالرحيم',62,11),('65679145-61d9-4342-ae59-5f6c9ba857db','أوريون للصناعات الغذائية','مدينة السادس من أكتوبر المنطقة الصناعية','01026611767','أ/ مجدي',17,3),('76331430-8646-49e4-90ed-5772fe334068','لولو للاسوق التجارية الكبري - شيراتون','شيراتون','01114776093','أ/ اسلام',NULL,1),('8b89cac0-74f9-45a2-adef-aaf3f8bd341a','ديورافيت ايجبت','العاشر من رمضان','01008219332','ا/احمد',1,1),('8cef4109-e027-456d-a77f-0bf5e19b8a7d','لولو للاسوق التجارية الكبري - التجمع الأول','التجمع الاول','01114776093','أ/ اسلام',NULL,1),('a6675d80-ca3d-4649-98b0-eb1fecd8b63a','مصر للاسمنت ( بيتون)','القاهرة - وسط البلد','01063487000','أ/ياسر فؤاد',1,1),('b300da6a-c138-4da8-966c-0f99c4cf0a34','المستثمر للصناعات الغذائية','مدينة بدر','01006770995','أ/ صلاح',NULL,1),('c26b8eae-8769-45b9-9cc7-fa49aa336512','لولو للاسوق التجارية الكبري -التجمع الخامس','التجمع الخامس','01026611767','أ/ اسلام',1,1);
/*!40000 ALTER TABLE `Clients_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clients_site`
--

DROP TABLE IF EXISTS `Clients_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clients_site` (
  `id` varchar(255) NOT NULL,
  `site_name` varchar(255) NOT NULL,
  `site_address` longtext NOT NULL,
  `phone_number` varchar(11) NOT NULL,
  `location_url` varchar(200) DEFAULT NULL,
  `comment` longtext DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `sub_company_id` varchar(255) DEFAULT NULL,
  `manager` varchar(255) DEFAULT NULL,
  `area_id` bigint(20) DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Clients_site_company_id_73d4c0b3_fk_Clients_company_id` (`company_id`),
  KEY `Clients_site_sub_company_id_73008ef6_fk_Clients_subcompany_id` (`sub_company_id`),
  KEY `Clients_site_area_id_f5f8070a_fk_Clients_area_id` (`area_id`),
  KEY `Clients_site_city_id_e6223aa5_fk_Clients_city_id` (`city_id`),
  CONSTRAINT `Clients_site_area_id_f5f8070a_fk_Clients_area_id` FOREIGN KEY (`area_id`) REFERENCES `Clients_area` (`id`),
  CONSTRAINT `Clients_site_city_id_e6223aa5_fk_Clients_city_id` FOREIGN KEY (`city_id`) REFERENCES `Clients_city` (`id`),
  CONSTRAINT `Clients_site_company_id_73d4c0b3_fk_Clients_company_id` FOREIGN KEY (`company_id`) REFERENCES `Clients_company` (`id`),
  CONSTRAINT `Clients_site_sub_company_id_73008ef6_fk_Clients_subcompany_id` FOREIGN KEY (`sub_company_id`) REFERENCES `Clients_subcompany` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clients_site`
--

LOCK TABLES `Clients_site` WRITE;
/*!40000 ALTER TABLE `Clients_site` DISABLE KEYS */;
INSERT INTO `Clients_site` VALUES ('2ba87ed9-0413-4ad5-883b-e984bc6b683c','اسوان','اسوان','01063487000','https://maps.app.goo.gl/gYnNKmAPSomNbCJW7','','a6675d80-ca3d-4649-98b0-eb1fecd8b63a',NULL,'أ/ياسر فؤاد',44,7),('3393d641-fdc5-4f82-bd0a-7ca6cb6d2c61','المنيا','المنيا','01063487000','https://maps.app.goo.gl/PBsq3X8y8zCF9FtEA?g_st=iw','موقع المنيا خطا لحين اضافة الصحيح','a6675d80-ca3d-4649-98b0-eb1fecd8b63a',NULL,'أ/ياسر فؤاد',94,17),('3aafaf06-5efc-4385-8a06-c09fed3746c1','السويس','السويس ( معدية الشط )','01002013535','https://maps.app.goo.gl/PBsq3X8y8zCF9FtEA?g_st=iw','','442b153f-b9c3-4b03-88de-b59b53de42b0',NULL,'العميد/ عبدالرحيم',160,11),('48828362-085c-4845-948f-87853364bb12','التجمع الاول','التجمع الاول','01114776093','https://maps.app.goo.gl/gYnNKmAPSomNbCJW7','موقع التجمع الاول خطا لحين اضافة الصحيح','8cef4109-e027-456d-a77f-0bf5e19b8a7d',NULL,'أ/ اسلام',1,1),('5f5ec155-3d32-4797-bef1-8ac09c3a3017','قفط','قفط','01063487000','https://maps.app.goo.gl/mbMCBGjvmuDmnDaY6','','a6675d80-ca3d-4649-98b0-eb1fecd8b63a',NULL,'أ/ياسر فؤاد',111,20),('6f82cdd1-0551-4ed0-b935-65a5a2e33e27','مرسي علم','مرسي علم','01210947275','https://maps.app.goo.gl/ENM4e5r2PKRxkPcP6','موقع منجم السكري خطا لحين اضافة الصحيح','29b5f2e5-4769-444b-9c31-01812ebca5eb',NULL,'ا/ محمد سمير',30,5),('6fe8b503-5619-45e9-8670-f4178c22cdc3','شيراتون','شيراتون','01114776093','https://maps.app.goo.gl/35qAytgLkbjaUTPy7','موقع الشيراتون خطا لحين اضافة الصحيح','76331430-8646-49e4-90ed-5772fe334068',NULL,'أ/ اسلام',1,1),('7bb42959-f85b-4faa-95ca-4de0035e7082','بني سويف','بني سويف','01063487000','https://maps.app.goo.gl/35qAytgLkbjaUTPy7','','a6675d80-ca3d-4649-98b0-eb1fecd8b63a',NULL,'أ/ياسر فؤاد',89,16),('85bcc7a4-edf4-40ff-b347-1452a37c1a9c','اسيوط','اسيوط','01063487000','https://maps.app.goo.gl/ENM4e5r2PKRxkPcP6','','a6675d80-ca3d-4649-98b0-eb1fecd8b63a',NULL,'أ/ياسر فؤاد',105,19),('9466233f-b4fc-4fd4-95f4-3bb964543aea','سوهاج','سوهاج','01063487000','https://maps.app.goo.gl/N8emQYMTFTQkfbTF8','','a6675d80-ca3d-4649-98b0-eb1fecd8b63a',NULL,'أ/ياسر فؤاد',101,18),('a774bc94-a8dd-473e-b5a1-67dfb7cc5087','الاقصر','الاقصر','01063487000','https://maps.app.goo.gl/s88AJDpCCLVb18dZ8','','a6675d80-ca3d-4649-98b0-eb1fecd8b63a',NULL,'أ/ياسر فؤاد',35,6),('bac815d5-db4c-488c-8e4b-73cf90bd095f','التجمع الخامس','التجمع الخامس','01114776093','https://maps.app.goo.gl/mbMCBGjvmuDmnDaY6','موقع التجمع الخامس خطا لحين اضافة الصحيح','c26b8eae-8769-45b9-9cc7-fa49aa336512',NULL,'أ/ اسلام',1,1),('dc9f394c-b0d7-454b-86ef-1aa113176457','6 اكتوبر','السادس من اكتوبر','01026611767','https://maps.app.goo.gl/mbMCBGjvmuDmnDaY6','موقع اريون خطا حين اضافة الصحيح','65679145-61d9-4342-ae59-5f6c9ba857db',NULL,'أ/ مجدي',17,3),('dff40425-988c-48d8-9553-963e4d53a245','اسوان','اسوان','01063487000','https://maps.app.goo.gl/gYnNKmAPSomNbCJW7','','a6675d80-ca3d-4649-98b0-eb1fecd8b63a',NULL,'أ/ياسر فؤاد',44,7);
/*!40000 ALTER TABLE `Clients_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clients_subcompany`
--

DROP TABLE IF EXISTS `Clients_subcompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clients_subcompany` (
  `id` varchar(255) NOT NULL,
  `sub_company_name` varchar(255) NOT NULL,
  `sub_company_address` longtext NOT NULL,
  `phone_number` varchar(11) NOT NULL,
  `parent_company_id` varchar(255) NOT NULL,
  `manager` varchar(255) DEFAULT NULL,
  `area_id` bigint(20) DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Clients_subcompany_parent_company_id_3fd8b9c1_fk_Clients_c` (`parent_company_id`),
  KEY `Clients_subcompany_area_id_881bd426_fk_Clients_area_id` (`area_id`),
  KEY `Clients_subcompany_city_id_8f940d23_fk_Clients_city_id` (`city_id`),
  CONSTRAINT `Clients_subcompany_area_id_881bd426_fk_Clients_area_id` FOREIGN KEY (`area_id`) REFERENCES `Clients_area` (`id`),
  CONSTRAINT `Clients_subcompany_city_id_8f940d23_fk_Clients_city_id` FOREIGN KEY (`city_id`) REFERENCES `Clients_city` (`id`),
  CONSTRAINT `Clients_subcompany_parent_company_id_3fd8b9c1_fk_Clients_c` FOREIGN KEY (`parent_company_id`) REFERENCES `Clients_company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clients_subcompany`
--

LOCK TABLES `Clients_subcompany` WRITE;
/*!40000 ALTER TABLE `Clients_subcompany` DISABLE KEYS */;
/*!40000 ALTER TABLE `Clients_subcompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'admin'),(3,'alex'),(4,'cairo');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add company',7,'add_company'),(26,'Can change company',7,'change_company'),(27,'Can delete company',7,'delete_company'),(28,'Can view company',7,'view_company'),(29,'Can add sub company',8,'add_subcompany'),(30,'Can change sub company',8,'change_subcompany'),(31,'Can delete sub company',8,'delete_subcompany'),(32,'Can view sub company',8,'view_subcompany'),(33,'Can add site',9,'add_site'),(34,'Can change site',9,'change_site'),(35,'Can delete site',9,'delete_site'),(36,'Can view site',9,'view_site'),(37,'Can add city',10,'add_city'),(38,'Can change city',10,'change_city'),(39,'Can delete city',10,'delete_city'),(40,'Can view city',10,'view_city'),(41,'Can add area',11,'add_area'),(42,'Can change area',11,'change_area'),(43,'Can delete area',11,'delete_area'),(44,'Can view area',11,'view_area'),(45,'Can add contract',12,'add_contract'),(46,'Can change contract',12,'change_contract'),(47,'Can delete contract',12,'delete_contract'),(48,'Can view contract',12,'view_contract'),(49,'Can add maintenance schedule',13,'add_maintenanceschedule'),(50,'Can change maintenance schedule',13,'change_maintenanceschedule'),(51,'Can delete maintenance schedule',13,'delete_maintenanceschedule'),(52,'Can view maintenance schedule',13,'view_maintenanceschedule'),(53,'Can add invoice schedule',14,'add_invoiceschedule'),(54,'Can change invoice schedule',14,'change_invoiceschedule'),(55,'Can delete invoice schedule',14,'delete_invoiceschedule'),(56,'Can view invoice schedule',14,'view_invoiceschedule'),(57,'Can add engineers',15,'add_engineers'),(58,'Can change engineers',15,'change_engineers'),(59,'Can delete engineers',15,'delete_engineers'),(60,'Can view engineers',15,'view_engineers'),(61,'Can add emergency visits',16,'add_emergencyvisits'),(62,'Can change emergency visits',16,'change_emergencyvisits'),(63,'Can delete emergency visits',16,'delete_emergencyvisits'),(64,'Can view emergency visits',16,'view_emergencyvisits'),(65,'Can add vehicles',17,'add_vehicles'),(66,'Can change vehicles',17,'change_vehicles'),(67,'Can delete vehicles',17,'delete_vehicles'),(68,'Can view vehicles',17,'view_vehicles');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$BSgeD2mQp29ddfXqQ0KSd9$MqhTaJZAUX5dtwXdv5cW4BnDG66GBBO9lGEG/8ANdBE=','2024-10-20 05:55:42.912522',1,'admin','','','admin@gmail.com',1,1,'2024-10-15 11:01:55.641801'),(3,'pbkdf2_sha256$600000$bwFNUPCpEDCXFZjAY92toD$+EOJ/64M2XDNsEiuQ5A8RktAM6+Uu+8KdJPs0IPGUow=','2024-11-12 08:20:44.566810',0,'reem','','','',0,1,'2024-10-20 09:53:37.000000'),(5,'pbkdf2_sha256$600000$8kc4wtvqH4UsmtWF44Dsey$YlJoXLcGYaLsLXjp3AnDJzQ85zptSZqlt2C2T5JjUcg=','2024-11-06 14:24:19.599628',0,'eman','','','eman@gmail.com',0,1,'2024-10-23 10:33:03.000000'),(6,'pbkdf2_sha256$600000$xl5vmAYQGwmUUTgMNtsXor$MNZO+LFYADjw8reNHHaaHQWPIMmOEqtt9CrLfvCMIRI=','2024-11-14 12:06:26.966300',1,'ictco','','','ictco@gmail.com',1,1,'2024-10-29 08:34:52.221304'),(7,'pbkdf2_sha256$600000$9g2R8oKDogtcnaaQc8SoOA$23NbwQ1yGeE06Qx2HTNQjxXX6N7L81PjhZQE8k6Angw=','2024-10-30 07:41:19.347854',0,'Kareem','','','',0,1,'2024-10-29 08:52:13.000000'),(8,'pbkdf2_sha256$600000$3C6OERMJXGK7oe4ou4uULJ$A+k3b9Sxw5oUlClONrKMPR4s0jC36ocFlJtLsO0xZsM=',NULL,0,'Alexandria','','','',0,1,'2024-11-12 09:29:25.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (3,1,2),(1,3,2),(4,5,2),(2,6,2),(5,7,4),(6,8,3);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracts_contract`
--

DROP TABLE IF EXISTS `contracts_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contracts_contract` (
  `id` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `contract_price_value` double NOT NULL,
  `emergency_visit_price` double DEFAULT NULL,
  `annual_increase` int(11) DEFAULT NULL,
  `invoice_frequency` varchar(255) NOT NULL,
  `maintenance_frequency` varchar(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `auto_renew` tinyint(1) NOT NULL,
  `damgh_date` date DEFAULT NULL,
  `damgh_price` double DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `pdf` varchar(100) DEFAULT NULL,
  `company_id` varchar(255) NOT NULL,
  `branch_site` varchar(255) NOT NULL,
  `invoice_date_calculation` varchar(10) NOT NULL,
  `emergency_within_period` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contracts_contract_company_id_b071885c_fk_Clients_company_id` (`company_id`),
  CONSTRAINT `contracts_contract_company_id_b071885c_fk_Clients_company_id` FOREIGN KEY (`company_id`) REFERENCES `Clients_company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts_contract`
--

LOCK TABLES `contracts_contract` WRITE;
/*!40000 ALTER TABLE `contracts_contract` DISABLE KEYS */;
INSERT INTO `contracts_contract` VALUES ('049564e8-b695-4bec-98bd-209e75b9a0ce','2025-06-01','2026-05-31',5000,500,10,'Every 6 Months','Every Month','Millenium company',1,NULL,0,'','pdfs/أوريون للصناعات الغذائية/تجديد_عقد_شركة_اوريون_للصناعات_الغذائية_TqUVpnm.pdf','65679145-61d9-4342-ae59-5f6c9ba857db','Cairo','end',48),('13811ac7-81ed-4aa7-8b7d-2cc6d7b4c1e6','2024-07-01','2025-06-30',60000,0,10,'Every Month','Every Month','Millenium company',1,NULL,0,'','pdfs/جمعيه الصناع/جمعية_الصناع_المصريون_LEL7eIL.pdf','442b153f-b9c3-4b03-88de-b59b53de42b0','Cairo','end',48),('863b9f76-c664-4cb3-86b7-839f71d1083d','2023-10-01','2024-09-30',3450,0,NULL,'Every 3 Months','Every 3 Months','Millenium company',0,NULL,0,'','pdfs/لولو للاسوق التجارية الكبري - التجمع الأول/لولو_للاسواق_التجارية_الكبري__التجمع_الاول_.pdf','8cef4109-e027-456d-a77f-0bf5e19b8a7d','Cairo','end',48),('a8dc186b-e422-4029-aa12-3837b353b566','2025-02-01','2026-01-31',20400,5100,NULL,'Every 3 Months','Every 3 Months','Millenium company',1,NULL,0,'','pdfs/منجم السكري/منجم_السكري_مجدد_sboisEC.pdf','29b5f2e5-4769-444b-9c31-01812ebca5eb','Cairo','end',48),('badbb4e4-f6dc-424b-be87-9c3c66a4e709','2024-03-01','2025-02-28',81784,1650,10,'Every 2 Months','Every 2 Months','Millenium company',1,NULL,0,'','pdfs/مصر للاسمنت ( بيتون)/مصر_للاسمنت__بيتون.pdf','a6675d80-ca3d-4649-98b0-eb1fecd8b63a','Cairo','end',48),('e19ee990-f6dd-4be2-b1ad-97cbbc2a19a1','2024-02-01','2025-01-31',3737,0,NULL,'Every 3 Months','Every 3 Months','Millenium company',0,NULL,0,'','pdfs/لولو للاسوق التجارية الكبري - شيراتون/لولو_للاسواق_التجارية_الكبري__شيراتون.pdf','76331430-8646-49e4-90ed-5772fe334068','Cairo','end',NULL);
/*!40000 ALTER TABLE `contracts_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracts_emergencyvisits`
--

DROP TABLE IF EXISTS `contracts_emergencyvisits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contracts_emergencyvisits` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `request_visit_date` date NOT NULL,
  `actual_visit_date` date DEFAULT NULL,
  `done` tinyint(1) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `pdf` varchar(100) DEFAULT NULL,
  `contract_id` varchar(255) NOT NULL,
  `eng_id` bigint(20) DEFAULT NULL,
  `site_id` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contracts_emergencyv_contract_id_906c1891_fk_contracts` (`contract_id`),
  KEY `contracts_emergencyv_eng_id_0b80b8b3_fk_contracts` (`eng_id`),
  KEY `contracts_emergencyvisits_site_id_315d44e9_fk_Clients_site_id` (`site_id`),
  CONSTRAINT `contracts_emergencyv_contract_id_906c1891_fk_contracts` FOREIGN KEY (`contract_id`) REFERENCES `contracts_contract` (`id`),
  CONSTRAINT `contracts_emergencyv_eng_id_0b80b8b3_fk_contracts` FOREIGN KEY (`eng_id`) REFERENCES `contracts_engineers` (`id`),
  CONSTRAINT `contracts_emergencyvisits_site_id_315d44e9_fk_Clients_site_id` FOREIGN KEY (`site_id`) REFERENCES `Clients_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts_emergencyvisits`
--

LOCK TABLES `contracts_emergencyvisits` WRITE;
/*!40000 ALTER TABLE `contracts_emergencyvisits` DISABLE KEYS */;
/*!40000 ALTER TABLE `contracts_emergencyvisits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracts_engineers`
--

DROP TABLE IF EXISTS `contracts_engineers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contracts_engineers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts_engineers`
--

LOCK TABLES `contracts_engineers` WRITE;
/*!40000 ALTER TABLE `contracts_engineers` DISABLE KEYS */;
INSERT INTO `contracts_engineers` VALUES (1,'م. خالد جمال'),(2,'م. محمود صادق'),(3,'م. نصر فتحي'),(4,'م. عبد الرحمن أحمد'),(5,'ا. السيد محمود'),(6,'ا. محمد محمود'),(7,'ا. أحمد محمود'),(8,'ا. يحيي احمد'),(9,'ا. علي ابراهيم');
/*!40000 ALTER TABLE `contracts_engineers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracts_invoiceschedule`
--

DROP TABLE IF EXISTS `contracts_invoiceschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contracts_invoiceschedule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `invoice_date` date NOT NULL,
  `amount` double NOT NULL,
  `is_paid` tinyint(1) NOT NULL,
  `contract_id` varchar(255) NOT NULL,
  `sub_company_id` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `pdf` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contracts_invoicesch_contract_id_33a31321_fk_contracts` (`contract_id`),
  KEY `contracts_invoicesch_sub_company_id_5189eb83_fk_Clients_s` (`sub_company_id`),
  KEY `contracts_invoicesch_company_id_c990e92c_fk_Clients_c` (`company_id`),
  CONSTRAINT `contracts_invoicesch_company_id_c990e92c_fk_Clients_c` FOREIGN KEY (`company_id`) REFERENCES `Clients_company` (`id`),
  CONSTRAINT `contracts_invoicesch_contract_id_33a31321_fk_contracts` FOREIGN KEY (`contract_id`) REFERENCES `contracts_contract` (`id`),
  CONSTRAINT `contracts_invoicesch_sub_company_id_5189eb83_fk_Clients_s` FOREIGN KEY (`sub_company_id`) REFERENCES `Clients_subcompany` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts_invoiceschedule`
--

LOCK TABLES `contracts_invoiceschedule` WRITE;
/*!40000 ALTER TABLE `contracts_invoiceschedule` DISABLE KEYS */;
INSERT INTO `contracts_invoiceschedule` VALUES (83,'2024-07-31',5000,0,'13811ac7-81ed-4aa7-8b7d-2cc6d7b4c1e6',NULL,'442b153f-b9c3-4b03-88de-b59b53de42b0','',''),(84,'2024-08-30',5000,0,'13811ac7-81ed-4aa7-8b7d-2cc6d7b4c1e6',NULL,'442b153f-b9c3-4b03-88de-b59b53de42b0','',''),(85,'2024-09-29',5000,0,'13811ac7-81ed-4aa7-8b7d-2cc6d7b4c1e6',NULL,'442b153f-b9c3-4b03-88de-b59b53de42b0','',''),(86,'2024-10-28',5000,0,'13811ac7-81ed-4aa7-8b7d-2cc6d7b4c1e6',NULL,'442b153f-b9c3-4b03-88de-b59b53de42b0','',''),(87,'2024-11-27',5000,0,'13811ac7-81ed-4aa7-8b7d-2cc6d7b4c1e6',NULL,'442b153f-b9c3-4b03-88de-b59b53de42b0','',''),(88,'2024-12-26',5000,0,'13811ac7-81ed-4aa7-8b7d-2cc6d7b4c1e6',NULL,'442b153f-b9c3-4b03-88de-b59b53de42b0','',''),(89,'2025-01-25',5000,0,'13811ac7-81ed-4aa7-8b7d-2cc6d7b4c1e6',NULL,'442b153f-b9c3-4b03-88de-b59b53de42b0','',''),(90,'2025-02-24',5000,0,'13811ac7-81ed-4aa7-8b7d-2cc6d7b4c1e6',NULL,'442b153f-b9c3-4b03-88de-b59b53de42b0','',''),(91,'2025-03-23',5000,0,'13811ac7-81ed-4aa7-8b7d-2cc6d7b4c1e6',NULL,'442b153f-b9c3-4b03-88de-b59b53de42b0','',''),(92,'2025-04-22',5000,0,'13811ac7-81ed-4aa7-8b7d-2cc6d7b4c1e6',NULL,'442b153f-b9c3-4b03-88de-b59b53de42b0','',''),(93,'2025-05-21',5000,0,'13811ac7-81ed-4aa7-8b7d-2cc6d7b4c1e6',NULL,'442b153f-b9c3-4b03-88de-b59b53de42b0','',''),(94,'2025-06-20',5000,0,'13811ac7-81ed-4aa7-8b7d-2cc6d7b4c1e6',NULL,'442b153f-b9c3-4b03-88de-b59b53de42b0','',''),(95,'2023-12-31',862.5,0,'863b9f76-c664-4cb3-86b7-839f71d1083d',NULL,'8cef4109-e027-456d-a77f-0bf5e19b8a7d','',''),(96,'2024-03-30',862.5,0,'863b9f76-c664-4cb3-86b7-839f71d1083d',NULL,'8cef4109-e027-456d-a77f-0bf5e19b8a7d','',''),(97,'2024-06-29',862.5,0,'863b9f76-c664-4cb3-86b7-839f71d1083d',NULL,'8cef4109-e027-456d-a77f-0bf5e19b8a7d','',''),(98,'2024-09-28',862.5,0,'863b9f76-c664-4cb3-86b7-839f71d1083d',NULL,'8cef4109-e027-456d-a77f-0bf5e19b8a7d','',''),(103,'2024-04-30',13630.666666666666,0,'badbb4e4-f6dc-424b-be87-9c3c66a4e709',NULL,'a6675d80-ca3d-4649-98b0-eb1fecd8b63a','',''),(104,'2024-06-29',13630.666666666666,0,'badbb4e4-f6dc-424b-be87-9c3c66a4e709',NULL,'a6675d80-ca3d-4649-98b0-eb1fecd8b63a','',''),(105,'2024-08-28',13630.666666666666,0,'badbb4e4-f6dc-424b-be87-9c3c66a4e709',NULL,'a6675d80-ca3d-4649-98b0-eb1fecd8b63a','',''),(106,'2024-10-27',13630.666666666666,0,'badbb4e4-f6dc-424b-be87-9c3c66a4e709',NULL,'a6675d80-ca3d-4649-98b0-eb1fecd8b63a','',''),(107,'2024-12-26',13630.666666666666,0,'badbb4e4-f6dc-424b-be87-9c3c66a4e709',NULL,'a6675d80-ca3d-4649-98b0-eb1fecd8b63a','',''),(108,'2025-02-25',13630.666666666666,0,'badbb4e4-f6dc-424b-be87-9c3c66a4e709',NULL,'a6675d80-ca3d-4649-98b0-eb1fecd8b63a','',''),(115,'2024-04-30',934.25,0,'e19ee990-f6dd-4be2-b1ad-97cbbc2a19a1',NULL,'76331430-8646-49e4-90ed-5772fe334068','',''),(116,'2024-07-29',934.25,0,'e19ee990-f6dd-4be2-b1ad-97cbbc2a19a1',NULL,'76331430-8646-49e4-90ed-5772fe334068','',''),(117,'2024-10-28',934.25,0,'e19ee990-f6dd-4be2-b1ad-97cbbc2a19a1',NULL,'76331430-8646-49e4-90ed-5772fe334068','',''),(118,'2025-01-27',934.25,0,'e19ee990-f6dd-4be2-b1ad-97cbbc2a19a1',NULL,'76331430-8646-49e4-90ed-5772fe334068','',''),(119,'2025-04-30',5100,0,'a8dc186b-e422-4029-aa12-3837b353b566',NULL,'29b5f2e5-4769-444b-9c31-01812ebca5eb','',''),(120,'2025-07-29',5100,0,'a8dc186b-e422-4029-aa12-3837b353b566',NULL,'29b5f2e5-4769-444b-9c31-01812ebca5eb','',''),(121,'2025-10-28',5100,0,'a8dc186b-e422-4029-aa12-3837b353b566',NULL,'29b5f2e5-4769-444b-9c31-01812ebca5eb','',''),(122,'2026-01-27',5100,0,'a8dc186b-e422-4029-aa12-3837b353b566',NULL,'29b5f2e5-4769-444b-9c31-01812ebca5eb','',''),(123,'2025-08-31',2500,0,'049564e8-b695-4bec-98bd-209e75b9a0ce',NULL,'65679145-61d9-4342-ae59-5f6c9ba857db','',''),(124,'2026-02-27',2500,0,'049564e8-b695-4bec-98bd-209e75b9a0ce',NULL,'65679145-61d9-4342-ae59-5f6c9ba857db','','');
/*!40000 ALTER TABLE `contracts_invoiceschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracts_maintenanceschedule`
--

DROP TABLE IF EXISTS `contracts_maintenanceschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contracts_maintenanceschedule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `visit_date` date NOT NULL,
  `contract_id` varchar(255) NOT NULL,
  `site_id` varchar(255) NOT NULL,
  `done` tinyint(1) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `pdf` varchar(100) DEFAULT NULL,
  `eng_id` bigint(20) DEFAULT NULL,
  `completed_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contracts_maintenanc_contract_id_4b7c061a_fk_contracts` (`contract_id`),
  KEY `contracts_maintenanc_site_id_0db70cba_fk_Clients_s` (`site_id`),
  KEY `contracts_maintenanc_eng_id_3b884cec_fk_contracts` (`eng_id`),
  CONSTRAINT `contracts_maintenanc_contract_id_4b7c061a_fk_contracts` FOREIGN KEY (`contract_id`) REFERENCES `contracts_contract` (`id`),
  CONSTRAINT `contracts_maintenanc_eng_id_3b884cec_fk_contracts` FOREIGN KEY (`eng_id`) REFERENCES `contracts_engineers` (`id`),
  CONSTRAINT `contracts_maintenanc_site_id_0db70cba_fk_Clients_s` FOREIGN KEY (`site_id`) REFERENCES `Clients_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts_maintenanceschedule`
--

LOCK TABLES `contracts_maintenanceschedule` WRITE;
/*!40000 ALTER TABLE `contracts_maintenanceschedule` DISABLE KEYS */;
INSERT INTO `contracts_maintenanceschedule` VALUES (73,'2024-07-01','13811ac7-81ed-4aa7-8b7d-2cc6d7b4c1e6','3aafaf06-5efc-4385-8a06-c09fed3746c1',0,'','',NULL,NULL,'2024-08-01'),(74,'2024-08-01','13811ac7-81ed-4aa7-8b7d-2cc6d7b4c1e6','3aafaf06-5efc-4385-8a06-c09fed3746c1',0,'','',NULL,NULL,'2024-09-01'),(75,'2024-09-01','13811ac7-81ed-4aa7-8b7d-2cc6d7b4c1e6','3aafaf06-5efc-4385-8a06-c09fed3746c1',0,'','',NULL,NULL,'2024-10-01'),(76,'2024-10-01','13811ac7-81ed-4aa7-8b7d-2cc6d7b4c1e6','3aafaf06-5efc-4385-8a06-c09fed3746c1',0,'','',NULL,NULL,'2024-11-01'),(77,'2024-11-01','13811ac7-81ed-4aa7-8b7d-2cc6d7b4c1e6','3aafaf06-5efc-4385-8a06-c09fed3746c1',0,'','',NULL,NULL,'2024-12-01'),(78,'2024-12-01','13811ac7-81ed-4aa7-8b7d-2cc6d7b4c1e6','3aafaf06-5efc-4385-8a06-c09fed3746c1',0,'','',NULL,NULL,'2025-01-01'),(79,'2025-01-01','13811ac7-81ed-4aa7-8b7d-2cc6d7b4c1e6','3aafaf06-5efc-4385-8a06-c09fed3746c1',0,'','',NULL,NULL,'2025-02-01'),(80,'2025-02-01','13811ac7-81ed-4aa7-8b7d-2cc6d7b4c1e6','3aafaf06-5efc-4385-8a06-c09fed3746c1',0,'','',NULL,NULL,'2025-03-01'),(81,'2025-03-01','13811ac7-81ed-4aa7-8b7d-2cc6d7b4c1e6','3aafaf06-5efc-4385-8a06-c09fed3746c1',0,'','',NULL,NULL,'2025-04-01'),(82,'2025-04-01','13811ac7-81ed-4aa7-8b7d-2cc6d7b4c1e6','3aafaf06-5efc-4385-8a06-c09fed3746c1',0,'','',NULL,NULL,'2025-05-01'),(83,'2025-05-01','13811ac7-81ed-4aa7-8b7d-2cc6d7b4c1e6','3aafaf06-5efc-4385-8a06-c09fed3746c1',0,'','',NULL,NULL,'2025-06-01'),(84,'2025-06-01','13811ac7-81ed-4aa7-8b7d-2cc6d7b4c1e6','3aafaf06-5efc-4385-8a06-c09fed3746c1',0,'','',NULL,NULL,'2025-06-30'),(85,'2023-10-01','863b9f76-c664-4cb3-86b7-839f71d1083d','48828362-085c-4845-948f-87853364bb12',0,'','',NULL,NULL,'2024-01-01'),(86,'2024-01-01','863b9f76-c664-4cb3-86b7-839f71d1083d','48828362-085c-4845-948f-87853364bb12',0,'','',NULL,NULL,'2024-04-01'),(87,'2024-04-01','863b9f76-c664-4cb3-86b7-839f71d1083d','48828362-085c-4845-948f-87853364bb12',0,'','',NULL,NULL,'2024-07-01'),(88,'2024-07-01','863b9f76-c664-4cb3-86b7-839f71d1083d','48828362-085c-4845-948f-87853364bb12',0,'','',NULL,NULL,'2024-09-30'),(93,'2024-03-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','2ba87ed9-0413-4ad5-883b-e984bc6b683c',0,'','',NULL,NULL,'2024-05-01'),(94,'2024-03-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','3393d641-fdc5-4f82-bd0a-7ca6cb6d2c61',0,'','',NULL,NULL,'2024-05-01'),(95,'2024-03-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','5f5ec155-3d32-4797-bef1-8ac09c3a3017',0,'','',NULL,NULL,'2024-05-01'),(96,'2024-03-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','7bb42959-f85b-4faa-95ca-4de0035e7082',0,'','',NULL,NULL,'2024-05-01'),(97,'2024-03-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','85bcc7a4-edf4-40ff-b347-1452a37c1a9c',0,'','',NULL,NULL,'2024-05-01'),(98,'2024-03-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','9466233f-b4fc-4fd4-95f4-3bb964543aea',0,'','',NULL,NULL,'2024-05-01'),(99,'2024-03-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','a774bc94-a8dd-473e-b5a1-67dfb7cc5087',0,'','',NULL,NULL,'2024-05-01'),(100,'2024-03-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','dff40425-988c-48d8-9553-963e4d53a245',0,'','',NULL,NULL,'2024-05-01'),(101,'2024-05-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','2ba87ed9-0413-4ad5-883b-e984bc6b683c',0,'','',NULL,NULL,'2024-07-01'),(102,'2024-05-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','3393d641-fdc5-4f82-bd0a-7ca6cb6d2c61',0,'','',NULL,NULL,'2024-07-01'),(103,'2024-05-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','5f5ec155-3d32-4797-bef1-8ac09c3a3017',0,'','',NULL,NULL,'2024-07-01'),(104,'2024-05-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','7bb42959-f85b-4faa-95ca-4de0035e7082',0,'','',NULL,NULL,'2024-07-01'),(105,'2024-05-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','85bcc7a4-edf4-40ff-b347-1452a37c1a9c',0,'','',NULL,NULL,'2024-07-01'),(106,'2024-05-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','9466233f-b4fc-4fd4-95f4-3bb964543aea',0,'','',NULL,NULL,'2024-07-01'),(107,'2024-05-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','a774bc94-a8dd-473e-b5a1-67dfb7cc5087',0,'','',NULL,NULL,'2024-07-01'),(108,'2024-05-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','dff40425-988c-48d8-9553-963e4d53a245',0,'','',NULL,NULL,'2024-07-01'),(109,'2024-07-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','2ba87ed9-0413-4ad5-883b-e984bc6b683c',0,'','',NULL,NULL,'2024-09-01'),(110,'2024-07-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','3393d641-fdc5-4f82-bd0a-7ca6cb6d2c61',0,'','',NULL,NULL,'2024-09-01'),(111,'2024-07-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','5f5ec155-3d32-4797-bef1-8ac09c3a3017',0,'','',NULL,NULL,'2024-09-01'),(112,'2024-07-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','7bb42959-f85b-4faa-95ca-4de0035e7082',0,'','',NULL,NULL,'2024-09-01'),(113,'2024-07-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','85bcc7a4-edf4-40ff-b347-1452a37c1a9c',0,'','',NULL,NULL,'2024-09-01'),(114,'2024-07-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','9466233f-b4fc-4fd4-95f4-3bb964543aea',0,'','',NULL,NULL,'2024-09-01'),(115,'2024-07-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','a774bc94-a8dd-473e-b5a1-67dfb7cc5087',0,'','',NULL,NULL,'2024-09-01'),(116,'2024-07-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','dff40425-988c-48d8-9553-963e4d53a245',0,'','',NULL,NULL,'2024-09-01'),(117,'2024-09-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','2ba87ed9-0413-4ad5-883b-e984bc6b683c',0,'','',NULL,NULL,'2024-11-01'),(118,'2024-09-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','3393d641-fdc5-4f82-bd0a-7ca6cb6d2c61',0,'','',NULL,NULL,'2024-11-01'),(119,'2024-09-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','5f5ec155-3d32-4797-bef1-8ac09c3a3017',0,'','',NULL,NULL,'2024-11-01'),(120,'2024-09-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','7bb42959-f85b-4faa-95ca-4de0035e7082',0,'','',NULL,NULL,'2024-11-01'),(121,'2024-09-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','85bcc7a4-edf4-40ff-b347-1452a37c1a9c',0,'','',NULL,NULL,'2024-11-01'),(122,'2024-09-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','9466233f-b4fc-4fd4-95f4-3bb964543aea',0,'','',NULL,NULL,'2024-11-01'),(123,'2024-09-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','a774bc94-a8dd-473e-b5a1-67dfb7cc5087',0,'','',NULL,NULL,'2024-11-01'),(124,'2024-09-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','dff40425-988c-48d8-9553-963e4d53a245',0,'','',NULL,NULL,'2024-11-01'),(125,'2024-11-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','2ba87ed9-0413-4ad5-883b-e984bc6b683c',0,'','',NULL,NULL,'2025-01-01'),(126,'2024-11-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','3393d641-fdc5-4f82-bd0a-7ca6cb6d2c61',0,'','',NULL,NULL,'2025-01-01'),(127,'2024-11-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','5f5ec155-3d32-4797-bef1-8ac09c3a3017',0,'','',NULL,NULL,'2025-01-01'),(128,'2024-11-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','7bb42959-f85b-4faa-95ca-4de0035e7082',0,'','',NULL,NULL,'2025-01-01'),(129,'2024-11-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','85bcc7a4-edf4-40ff-b347-1452a37c1a9c',0,'','',NULL,NULL,'2025-01-01'),(130,'2024-11-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','9466233f-b4fc-4fd4-95f4-3bb964543aea',0,'','',NULL,NULL,'2025-01-01'),(131,'2024-11-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','a774bc94-a8dd-473e-b5a1-67dfb7cc5087',0,'','',NULL,NULL,'2025-01-01'),(132,'2024-11-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','dff40425-988c-48d8-9553-963e4d53a245',0,'','',NULL,NULL,'2025-01-01'),(133,'2025-01-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','2ba87ed9-0413-4ad5-883b-e984bc6b683c',0,'','',NULL,NULL,'2025-02-28'),(134,'2025-01-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','3393d641-fdc5-4f82-bd0a-7ca6cb6d2c61',0,'','',NULL,NULL,'2025-02-28'),(135,'2025-01-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','5f5ec155-3d32-4797-bef1-8ac09c3a3017',0,'','',NULL,NULL,'2025-02-28'),(136,'2025-01-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','7bb42959-f85b-4faa-95ca-4de0035e7082',0,'','',NULL,NULL,'2025-02-28'),(137,'2025-01-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','85bcc7a4-edf4-40ff-b347-1452a37c1a9c',0,'','',NULL,NULL,'2025-02-28'),(138,'2025-01-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','9466233f-b4fc-4fd4-95f4-3bb964543aea',0,'','',NULL,NULL,'2025-02-28'),(139,'2025-01-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','a774bc94-a8dd-473e-b5a1-67dfb7cc5087',0,'','',NULL,NULL,'2025-02-28'),(140,'2025-01-01','badbb4e4-f6dc-424b-be87-9c3c66a4e709','dff40425-988c-48d8-9553-963e4d53a245',0,'','',NULL,NULL,'2025-02-28'),(189,'2024-02-01','e19ee990-f6dd-4be2-b1ad-97cbbc2a19a1','6fe8b503-5619-45e9-8670-f4178c22cdc3',0,'','',NULL,NULL,'2024-05-01'),(190,'2024-05-01','e19ee990-f6dd-4be2-b1ad-97cbbc2a19a1','6fe8b503-5619-45e9-8670-f4178c22cdc3',0,'','',NULL,NULL,'2024-08-01'),(191,'2024-08-01','e19ee990-f6dd-4be2-b1ad-97cbbc2a19a1','6fe8b503-5619-45e9-8670-f4178c22cdc3',0,'','',NULL,NULL,'2024-11-01'),(192,'2024-11-01','e19ee990-f6dd-4be2-b1ad-97cbbc2a19a1','6fe8b503-5619-45e9-8670-f4178c22cdc3',0,'','',NULL,NULL,'2025-01-31'),(193,'2025-02-01','a8dc186b-e422-4029-aa12-3837b353b566','6f82cdd1-0551-4ed0-b935-65a5a2e33e27',0,'','',NULL,NULL,'2025-05-01'),(194,'2025-05-01','a8dc186b-e422-4029-aa12-3837b353b566','6f82cdd1-0551-4ed0-b935-65a5a2e33e27',0,'','',NULL,NULL,'2025-08-01'),(195,'2025-08-01','a8dc186b-e422-4029-aa12-3837b353b566','6f82cdd1-0551-4ed0-b935-65a5a2e33e27',0,'','',NULL,NULL,'2025-11-01'),(196,'2025-11-01','a8dc186b-e422-4029-aa12-3837b353b566','6f82cdd1-0551-4ed0-b935-65a5a2e33e27',0,'','',NULL,NULL,'2026-01-31'),(197,'2025-03-01','049564e8-b695-4bec-98bd-209e75b9a0ce','dc9f394c-b0d7-454b-86ef-1aa113176457',0,'','',NULL,NULL,'2025-04-01'),(198,'2025-04-01','049564e8-b695-4bec-98bd-209e75b9a0ce','dc9f394c-b0d7-454b-86ef-1aa113176457',0,'','',NULL,NULL,'2025-05-01'),(199,'2025-05-01','049564e8-b695-4bec-98bd-209e75b9a0ce','dc9f394c-b0d7-454b-86ef-1aa113176457',0,'','',NULL,NULL,'2025-06-01'),(200,'2025-06-01','049564e8-b695-4bec-98bd-209e75b9a0ce','dc9f394c-b0d7-454b-86ef-1aa113176457',0,'','',NULL,NULL,'2025-07-01'),(201,'2025-07-01','049564e8-b695-4bec-98bd-209e75b9a0ce','dc9f394c-b0d7-454b-86ef-1aa113176457',0,'','',NULL,NULL,'2025-08-01'),(202,'2025-08-01','049564e8-b695-4bec-98bd-209e75b9a0ce','dc9f394c-b0d7-454b-86ef-1aa113176457',0,'','',NULL,NULL,'2025-09-01'),(203,'2025-09-01','049564e8-b695-4bec-98bd-209e75b9a0ce','dc9f394c-b0d7-454b-86ef-1aa113176457',0,'','',NULL,NULL,'2025-10-01'),(204,'2025-10-01','049564e8-b695-4bec-98bd-209e75b9a0ce','dc9f394c-b0d7-454b-86ef-1aa113176457',0,'','',NULL,NULL,'2025-11-01'),(205,'2025-11-01','049564e8-b695-4bec-98bd-209e75b9a0ce','dc9f394c-b0d7-454b-86ef-1aa113176457',0,'','',NULL,NULL,'2025-12-01'),(206,'2025-12-01','049564e8-b695-4bec-98bd-209e75b9a0ce','dc9f394c-b0d7-454b-86ef-1aa113176457',0,'','',NULL,NULL,'2026-01-01'),(207,'2026-01-01','049564e8-b695-4bec-98bd-209e75b9a0ce','dc9f394c-b0d7-454b-86ef-1aa113176457',0,'','',NULL,NULL,'2026-02-01'),(208,'2026-02-01','049564e8-b695-4bec-98bd-209e75b9a0ce','dc9f394c-b0d7-454b-86ef-1aa113176457',0,'','',NULL,NULL,'2026-02-28');
/*!40000 ALTER TABLE `contracts_maintenanceschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracts_vehicles`
--

DROP TABLE IF EXISTS `contracts_vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contracts_vehicles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `num_vehicles` int(10) unsigned NOT NULL CHECK (`num_vehicles` >= 0),
  `vehicle_capacity` int(10) unsigned NOT NULL CHECK (`vehicle_capacity` >= 0),
  `depot` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts_vehicles`
--

LOCK TABLES `contracts_vehicles` WRITE;
/*!40000 ALTER TABLE `contracts_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `contracts_vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-10-15 11:03:22.419694','2','shahd',1,'[{\"added\": {}}]',4,1),(2,'2024-10-20 09:53:37.568493','3','reem',1,'[{\"added\": {}}]',4,1),(3,'2024-10-20 09:53:56.768143','3','reem',2,'[{\"changed\": {\"fields\": [\"Superuser status\"]}}]',4,1),(4,'2024-10-20 09:58:47.505729','2','shahd',3,'',4,1),(5,'2024-10-20 09:59:31.033182','4','shahd',1,'[{\"added\": {}}]',4,1),(6,'2024-10-20 09:59:46.509998','4','shahd',2,'[]',4,1),(7,'2024-10-29 08:39:04.010240','1','your_group_name',3,'',3,6),(8,'2024-10-29 08:39:23.122454','3','alex',1,'[{\"added\": {}}]',3,6),(9,'2024-10-29 08:39:35.768571','4','cairo',1,'[{\"added\": {}}]',3,6),(10,'2024-10-29 08:40:42.096301','5','eman',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\", \"Groups\"]}}]',4,6),(11,'2024-10-29 08:41:41.072083','4','shahd',3,'',4,6),(12,'2024-10-29 08:52:13.960764','7','Kareem',1,'[{\"added\": {}}]',4,6),(13,'2024-10-29 08:53:02.075777','7','Kareem',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,6),(14,'2024-10-29 09:35:26.032412','1','خالد',1,'[{\"added\": {}}]',15,6),(15,'2024-10-29 09:36:00.874196','2','محمود صادق',1,'[{\"added\": {}}]',15,6),(16,'2024-10-31 08:40:37.153215','160','Maadyat El Shat',1,'[{\"added\": {}}]',11,6),(17,'2024-11-12 09:29:26.452774','8','Alexandria',1,'[{\"added\": {}}]',4,6),(18,'2024-11-12 09:29:54.603261','8','Alexandria',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,6),(19,'2024-11-12 09:31:03.462245','3','نصر فتحي',1,'[{\"added\": {}}]',15,6),(20,'2024-11-12 09:33:38.617033','1','خالد جمال',2,'[{\"changed\": {\"fields\": [\"Engineer name\"]}}]',15,6),(21,'2024-11-12 10:28:05.780678','4','م . عبد الرحمن أحمد',1,'[{\"added\": {}}]',15,6),(22,'2024-11-12 10:28:34.408582','3','م. نصر فتحي',2,'[{\"changed\": {\"fields\": [\"Engineer name\"]}}]',15,6),(23,'2024-11-12 10:29:10.256927','2','م. محمود صادق',2,'[{\"changed\": {\"fields\": [\"Engineer name\"]}}]',15,6),(24,'2024-11-12 10:29:43.146293','1','م. خالد جمال',2,'[{\"changed\": {\"fields\": [\"Engineer name\"]}}]',15,6),(25,'2024-11-12 10:30:45.644570','5','أ . السيد محمود',1,'[{\"added\": {}}]',15,6),(26,'2024-11-12 10:31:32.741283','5','ا. السيد محمود',2,'[{\"changed\": {\"fields\": [\"Engineer name\"]}}]',15,6),(27,'2024-11-12 10:31:53.443394','4','م. عبد الرحمن أحمد',2,'[{\"changed\": {\"fields\": [\"Engineer name\"]}}]',15,6),(28,'2024-11-12 10:32:35.571194','6','ا. محمد محمود',1,'[{\"added\": {}}]',15,6),(29,'2024-11-12 10:33:30.240837','7','ا. أحمد محمود',1,'[{\"added\": {}}]',15,6),(30,'2024-11-12 10:35:22.420119','8','ا. يحيي احمد',1,'[{\"added\": {}}]',15,6),(31,'2024-11-12 10:36:12.090752','9','ا. علي ابراهيم',1,'[{\"added\": {}}]',15,6);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(11,'Clients','area'),(10,'Clients','city'),(7,'Clients','company'),(9,'Clients','site'),(8,'Clients','subcompany'),(5,'contenttypes','contenttype'),(12,'contracts','contract'),(16,'contracts','emergencyvisits'),(15,'contracts','engineers'),(14,'contracts','invoiceschedule'),(13,'contracts','maintenanceschedule'),(17,'contracts','vehicles'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'Clients','0001_initial','2024-10-15 10:55:49.423487'),(2,'Clients','0002_company_manager_site_manager_subcompany_manager','2024-10-15 10:55:50.358845'),(3,'Clients','0003_city_area_company_area_company_city_site_area_and_more','2024-10-15 10:55:53.744054'),(4,'Clients','0004_alter_company_area_alter_company_city_and_more','2024-10-15 10:56:04.937568'),(5,'contenttypes','0001_initial','2024-10-15 10:56:05.976569'),(6,'auth','0001_initial','2024-10-15 10:56:11.327402'),(7,'admin','0001_initial','2024-10-15 10:56:12.654638'),(8,'admin','0002_logentry_remove_auto_add','2024-10-15 10:56:13.023871'),(9,'admin','0003_logentry_add_action_flag_choices','2024-10-15 10:56:13.390653'),(10,'contenttypes','0002_remove_content_type_name','2024-10-15 10:56:14.843993'),(11,'auth','0002_alter_permission_name_max_length','2024-10-15 10:56:15.487075'),(12,'auth','0003_alter_user_email_max_length','2024-10-15 10:56:16.069403'),(13,'auth','0004_alter_user_username_opts','2024-10-15 10:56:16.440041'),(14,'auth','0005_alter_user_last_login_null','2024-10-15 10:56:17.009395'),(15,'auth','0006_require_contenttypes_0002','2024-10-15 10:56:17.379319'),(16,'auth','0007_alter_validators_add_error_messages','2024-10-15 10:56:17.750146'),(17,'auth','0008_alter_user_username_max_length','2024-10-15 10:56:18.439864'),(18,'auth','0009_alter_user_last_name_max_length','2024-10-15 10:56:19.010351'),(19,'auth','0010_alter_group_name_max_length','2024-10-15 10:56:19.560649'),(20,'auth','0011_update_proxy_permissions','2024-10-15 10:56:20.474837'),(21,'auth','0012_alter_user_first_name_max_length','2024-10-15 10:56:21.026003'),(22,'contracts','0001_initial','2024-10-15 10:56:21.947201'),(23,'contracts','0002_alter_contract_damgh_date_alter_contract_pdf','2024-10-15 10:56:22.694934'),(24,'contracts','0003_contract_branch_site','2024-10-15 10:56:23.426710'),(25,'contracts','0004_maintenanceschedule','2024-10-15 10:56:24.729673'),(26,'contracts','0005_alter_contract_end_date','2024-10-15 10:56:25.307124'),(27,'contracts','0006_alter_contract_annual_increase','2024-10-15 10:56:25.695228'),(28,'contracts','0007_alter_contract_annual_increase','2024-10-15 10:56:26.280572'),(29,'contracts','0008_contract_invoice_date_calculation','2024-10-15 10:56:27.017841'),(30,'contracts','0009_invoiceschedule','2024-10-15 10:56:27.950379'),(31,'contracts','0010_invoiceschedule_company','2024-10-15 10:56:28.729108'),(32,'contracts','0011_remove_invoiceschedule_company_and_more','2024-10-15 10:56:31.371332'),(33,'contracts','0012_invoiceschedule_company','2024-10-15 10:56:32.259384'),(34,'contracts','0013_maintenanceschedule_done','2024-10-15 10:56:33.018232'),(35,'contracts','0014_maintenanceschedule_actual_visit_date_and_more','2024-10-15 10:56:34.122100'),(36,'contracts','0015_invoiceschedule_image_invoiceschedule_pdf','2024-10-15 10:56:34.935694'),(37,'contracts','0016_maintenanceschedule_done_by','2024-10-15 10:56:35.501452'),(38,'contracts','0017_engineers_remove_maintenanceschedule_done_by_and_more','2024-10-15 10:56:36.891600'),(39,'contracts','0018_contract_emergency_within_period','2024-10-15 10:56:37.604099'),(40,'contracts','0019_emergencyvisits','2024-10-15 10:56:39.551515'),(41,'contracts','0020_emergencyvisits_comment','2024-10-15 10:56:40.266261'),(42,'contracts','0021_remove_maintenanceschedule_actual_visit_date_and_more','2024-10-15 10:56:41.501071'),(43,'contracts','0022_alter_maintenanceschedule_due_date','2024-10-15 10:56:41.871781'),(44,'contracts','0023_alter_maintenanceschedule_due_date','2024-10-15 10:56:42.639536'),(45,'contracts','0024_emergencyvisits_price','2024-10-15 10:56:43.548720'),(46,'sessions','0001_initial','2024-10-15 10:56:44.750601'),(47,'Clients','0002_alter_company_area_alter_company_city_and_more','2024-10-29 07:33:45.265103'),(48,'contracts','0002_alter_contract_annual_increase_and_more','2024-10-29 07:33:45.826369'),(49,'contracts','0003_vehicles_alter_contract_annual_increase','2024-11-13 07:58:04.593677'),(50,'Clients','0005_alter_company_area_alter_company_city_and_more','2024-11-14 11:53:39.411273'),(51,'Clients','0006_alter_site_area_alter_site_city_alter_site_comment_and_more','2024-11-14 11:53:39.978892'),(52,'Clients','0007_alter_site_location_url','2024-11-14 11:53:40.468911'),(53,'contracts','0025_alter_contract_annual_increase_and_more','2024-11-14 11:53:41.130264'),(54,'contracts','0026_alter_maintenanceschedule_contract_and_more','2024-11-14 11:53:41.888363'),(55,'contracts','0027_alter_invoiceschedule_contract','2024-11-14 11:53:42.819111'),(56,'contracts','0028_alter_invoiceschedule_company_and_more','2024-11-14 11:53:43.650428'),(57,'contracts','0029_vehicles','2024-11-14 12:01:13.799320'),(58,'contracts','0030_vehicles_depot','2024-11-14 12:01:14.719241'),(59,'contracts','0031_alter_contract_annual_increase','2024-11-14 12:01:15.168451');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0r6zxriqh1gw19v3u5uw9cej6wpti3lt','.eJxVjEEOwiAQRe_C2hBKhQGX7j0DgRlGqgaS0q6MdzckXej2v_f-W4S4byXsPa9hIXERVpx-txTxmesA9Ij13iS2uq1LkkORB-3y1ii_rof7d1BiL6MGJiBiojMYby0xopqZJ80GiGN22qFzoBXMPqFLBqaolUFM3gJZ8fkCGpE4ug:1t5hgz:zralMZFbWhzZ5oHHFnd8LZQmeMu0R37xMqzDAk92RlY','2024-11-12 08:35:09.092392'),('3fb2341s57v64rlttj09sl2afv8zysur','.eJxVjDsOwjAQBe_iGln-LbEp6XMGa9fe4ACypTipEHeHSCmgfTPzXiLitpa4dV7inMVFgDj9boTpwXUH-Y711mRqdV1mkrsiD9rl2DI_r4f7d1Cwl2_Nk2Zy2iQ_AZAaEBANW_RGkQ_2rEI21gGxhSFpm4PVAB6z9o5cYifeH-bzN5c:1t7Y0Q:hiRp8KbbOQqwHV3ERh4jNmwz4VhdeUctg-lgQHA3APE','2024-11-17 10:38:50.737859'),('4cf5w3ft097jqq7vqa96u3k7nbww2s8n','.eJxVjEEOwiAQRe_C2hBgWgZcuvcMDQyDVA0kpV0Z765NutDtf-_9l5jCtpZp67xMcxJnAeL0u8VAD647SPdQb01Sq-syR7kr8qBdXlvi5-Vw_w5K6OVbK2csjDERaEcwEgTDFhwiZ7YaUVs1KD9qox1mgxEC5Owh02A0MXrx_gC7Azbt:1t2U7w:fyOPFkXztHSNNeE7HNTviOTi5lbA2wweRFt_IJ_qHt4','2024-11-03 11:29:40.478692'),('4rbbjy2l062wvphlj31wyd6gslh4s28r','.eJxVjDsOwjAQBe_iGln-LbEp6XMGa9fe4ACypTipEHeHSCmgfTPzXiLitpa4dV7inMVFgDj9boTpwXUH-Y711mRqdV1mkrsiD9rl2DI_r4f7d1Cwl2_Nk2Zy2iQ_AZAaEBANW_RGkQ_2rEI21gGxhSFpm4PVAB6z9o5cYifeH-bzN5c:1t5gkA:ZhXgAIhEarzdb6yf8G-iUFKxVySKWGxXFcHory0nRkU','2024-11-12 07:34:22.322038'),('6wc6pzfdng2xj97v8p1d567wqmfbhbs4','.eJxVjEEOwiAQRe_C2hBKhQGX7j0DgRlGqgaS0q6MdzckXej2v_f-W4S4byXsPa9hIXERVpx-txTxmesA9Ij13iS2uq1LkkORB-3y1ii_rof7d1BiL6MGJiBiojMYby0xopqZJ80GiGN22qFzoBXMPqFLBqaolUFM3gJZ8fkCGpE4ug:1t8ekq:mFueWA9FVQNA9GG0NwSzS4onYGzQKMFg-GswkzesbF4','2024-11-20 12:03:20.458195'),('6z91tz9jeda6s5hmoevwjq1akvy5f74c','.eJxVjDsOwjAQBe_iGln-LbEp6XMGa9fe4ACypTipEHeHSCmgfTPzXiLitpa4dV7inMVFgDj9boTpwXUH-Y711mRqdV1mkrsiD9rl2DI_r4f7d1Cwl2_Nk2Zy2iQ_AZAaEBANW_RGkQ_2rEI21gGxhSFpm4PVAB6z9o5cYifeH-bzN5c:1t3YgA:9Ok_M-trVhNdaxHkmnhkxJQTD7ZSJD5lxGGOaCloszY','2024-11-06 10:33:26.620415'),('83fm9aoig5u2w4keje4prb60dojzhq9v','.eJxVjDsOwjAQBe_iGln-LbEp6XMGa9fe4ACypTipEHeHSCmgfTPzXiLitpa4dV7inMVFgDj9boTpwXUH-Y711mRqdV1mkrsiD9rl2DI_r4f7d1Cwl2_Nk2Zy2iQ_AZAaEBANW_RGkQ_2rEI21gGxhSFpm4PVAB6z9o5cYifeH-bzN5c:1t8gxH:68Zusgie_tJdwlJRMxtuDC8uJH5rbjyYThSyw0CBfg4','2024-11-20 14:24:19.746496'),('8azu1kk4e5zfign2vo89jaiv6fmcn5on','.eJxVjEEOwiAQRe_C2hCglDIu3XsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3EWRpx-t4j04LqDdMd6a5JaXZc5yl2RB-3y2hI_L4f7d1Cwl2892AlYjRGsU54dMroha5-t847UAEjZKgdMRJA9aQ0GclSTzWYkpY14fwDUvTeE:1t0fLQ:KnAZSJIsYV56TbTjIH9NnUZcdZqdFiZVxNEkh6Ez2Kw','2024-10-29 11:04:04.995138'),('dolj54nyphg69jatxlrzeacglodc53bz','.eJxVjEEOwiAQRe_C2hBKhQGX7j0DgRlGqgaS0q6MdzckXej2v_f-W4S4byXsPa9hIXERVpx-txTxmesA9Ij13iS2uq1LkkORB-3y1ii_rof7d1BiL6MGJiBiojMYby0xopqZJ80GiGN22qFzoBXMPqFLBqaolUFM3gJZ8fkCGpE4ug:1t8fFn:5upSOc4DB44iPYWOiE0IgC03UMyXo70IZ3Ggh5dsZFU','2024-11-20 12:35:19.826196'),('e1txy724g6y3k0hnlhgv7wcscoiz7bl2','.eJxVjEEOwiAQRe_C2hBKhQGX7j0DgRlGqgaS0q6MdzckXej2v_f-W4S4byXsPa9hIXERVpx-txTxmesA9Ij13iS2uq1LkkORB-3y1ii_rof7d1BiL6MGJiBiojMYby0xopqZJ80GiGN22qFzoBXMPqFLBqaolUFM3gJZ8fkCGpE4ug:1t8iIk:iSgVBiSQ_ZKnKBCuxzI3tLw0qV7mlfczlfo78V65wtE','2024-11-20 15:50:34.733121'),('ezq7dcnjpql3npbsoo66r8fmzkemgiv9','.eJxVjDsOwjAQBe_iGln-LbEp6XMGa9fe4ACypTipEHeHSCmgfTPzXiLitpa4dV7inMVFgDj9boTpwXUH-Y711mRqdV1mkrsiD9rl2DI_r4f7d1Cwl2_Nk2Zy2iQ_AZAaEBANW_RGkQ_2rEI21gGxhSFpm4PVAB6z9o5cYifeH-bzN5c:1t7Xp8:q-CbV5CZEZJsKuvLEXTqLrAET09nzKPaFkpsf1BM8Hc','2024-11-17 10:27:10.468917'),('fr3646qrvcd3863avh21ovy6u2unybye','.eJxVjEEOwiAQRe_C2hBKhQGX7j0DgRlGqgaS0q6MdzckXej2v_f-W4S4byXsPa9hIXERVpx-txTxmesA9Ij13iS2uq1LkkORB-3y1ii_rof7d1BiL6MGJiBiojMYby0xopqZJ80GiGN22qFzoBXMPqFLBqaolUFM3gJZ8fkCGpE4ug:1tBYcF:eCqQEON4ahCS8dP-HAL8eBYtRKnFyu-rNSvTRlYl-WY','2024-11-28 12:06:27.196457'),('j3hawp1f8calwf7e4g9gvzt8sbpcaq2a','.eJxVjEEOwiAQRe_C2hBKhQGX7j0DgRlGqgaS0q6MdzckXej2v_f-W4S4byXsPa9hIXERVpx-txTxmesA9Ij13iS2uq1LkkORB-3y1ii_rof7d1BiL6MGJiBiojMYby0xopqZJ80GiGN22qFzoBXMPqFLBqaolUFM3gJZ8fkCGpE4ug:1tAmIE:iWcilVREU2QSQxgo7nIGAeViZUY6NNyzJ8xCrRL5Vc4','2024-11-26 08:30:34.859014'),('k3t9pkk1akhbcfcu8pztszmpaa3gxij6','.eJxVjDsOwjAQBe_iGln-LbEp6XMGa9fe4ACypTipEHeHSCmgfTPzXiLitpa4dV7inMVFgDj9boTpwXUH-Y711mRqdV1mkrsiD9rl2DI_r4f7d1Cwl2_Nk2Zy2iQ_AZAaEBANW_RGkQ_2rEI21gGxhSFpm4PVAB6z9o5cYifeH-bzN5c:1t3a0o:krrMh78PVGEg9KqkyyxsKSjp-CcTuPLJ5C8N_CpJPvU','2024-11-06 11:58:50.932296'),('kfsgrfd3fnv4nqmmrc3zdo6lq8rj4s7q','.eJxVjEEOwiAQRe_C2hBKhQGX7j0DgRlGqgaS0q6MdzckXej2v_f-W4S4byXsPa9hIXERVpx-txTxmesA9Ij13iS2uq1LkkORB-3y1ii_rof7d1BiL6MGJiBiojMYby0xopqZJ80GiGN22qFzoBXMPqFLBqaolUFM3gJZ8fkCGpE4ug:1tAn0d:C7rkLnmw3GIttwuvdTGw2BiHPb_a4Wo957u6wFLnMoU','2024-11-26 09:16:27.799960'),('l6dxe8zti3fev216qz13538h5101lc27','.eJxVjEEOwiAQRe_C2hBKhQGX7j0DgRlGqgaS0q6MdzckXej2v_f-W4S4byXsPa9hIXERVpx-txTxmesA9Ij13iS2uq1LkkORB-3y1ii_rof7d1BiL6MGJiBiojMYby0xopqZJ80GiGN22qFzoBXMPqFLBqaolUFM3gJZ8fkCGpE4ug:1t90LR:KxjUv8wRwTK0pX9PDRRPriJ1Zc9NccvZVkdB6aHx8u4','2024-11-21 11:06:33.899249'),('leexojzhqlx91o2m7ihjn130c634ku6v','.eJxVjEEOwiAQRe_C2hBgWgZcuvcMDQyDVA0kpV0Z765NutDtf-_9l5jCtpZp67xMcxJnAeL0u8VAD647SPdQb01Sq-syR7kr8qBdXlvi5-Vw_w5K6OVbK2csjDERaEcwEgTDFhwiZ7YaUVs1KD9qox1mgxEC5Owh02A0MXrx_gC7Azbt:1t5gx2:muSQnggvG1BCf-2A3EnwgGSIjGem3D-fePdr72CgN6A','2024-11-12 07:47:40.397010'),('ljd5us6c62vbcljcijneyjmr1wp6qapf','.eJxVjDsOgzAQBe_iOrLwFzZles6Adr2rmCSyJQxVlLsHJIqknZn33mrCbc3T1mSZZlZX5dXllxGmp5RD8APLvepUy7rMpI9En7bpsbK8bmf7d5Cx5X1tfDLOc-8SA0kUougsAzAG6yWBsdDJIBDBDjtiws46kh5C8A7BqM8X6Zg3rQ:1t5gmC:Ke3kuuIhFks8h1Q4XSf5UChas0UXAiLEFPmmR-jQV34','2024-11-12 07:36:28.871471'),('m4jd0lutpwuo22uupzso7cqpa4yl83gg','.eJxVjDsOwjAQBe_iGln-LbEp6XMGa9fe4ACypTipEHeHSCmgfTPzXiLitpa4dV7inMVFgDj9boTpwXUH-Y711mRqdV1mkrsiD9rl2DI_r4f7d1Cwl2_Nk2Zy2iQ_AZAaEBANW_RGkQ_2rEI21gGxhSFpm4PVAB6z9o5cYifeH-bzN5c:1t7Y0O:MjKdEBgkzhbSDgV13KGDqCoiA_-uGsqZ4jrwy_WzQaM','2024-11-17 10:38:48.409899'),('r7l9kphyidm07x139bzo15azg3jt5zwu','.eJxVjEEOwiAQRe_C2hBKhQGX7j0DgRlGqgaS0q6MdzckXej2v_f-W4S4byXsPa9hIXERVpx-txTxmesA9Ij13iS2uq1LkkORB-3y1ii_rof7d1BiL6MGJiBiojMYby0xopqZJ80GiGN22qFzoBXMPqFLBqaolUFM3gJZ8fkCGpE4ug:1t8i9x:dPw-9xSO-ZyHTjCIsuB6pX8F-9Oepwv8NvT9Dr9h9FY','2024-11-20 15:41:29.683345'),('tih9zy3mxrot7hs97u5r3a0gy82sl1mk','.eJxVjDsOwjAQBe_iGln-LbEp6XMGa9fe4ACypTipEHeHSCmgfTPzXiLitpa4dV7inMVFgDj9boTpwXUH-Y711mRqdV1mkrsiD9rl2DI_r4f7d1Cwl2_Nk2Zy2iQ_AZAaEBANW_RGkQ_2rEI21gGxhSFpm4PVAB6z9o5cYifeH-bzN5c:1t3a0p:knrrmRhyAwh0Yu0UHBqpMn_jFaoIhUirRBLA9wdeTQg','2024-11-06 11:58:51.873551'),('tqdxs2skn3v8gdz0o34qzvtu1yvfdd4u','.eJxVjEEOwiAQRe_C2hBgWgZcuvcMDQyDVA0kpV0Z765NutDtf-_9l5jCtpZp67xMcxJnAeL0u8VAD647SPdQb01Sq-syR7kr8qBdXlvi5-Vw_w5K6OVbK2csjDERaEcwEgTDFhwiZ7YaUVs1KD9qox1mgxEC5Owh02A0MXrx_gC7Azbt:1t8dyW:L8DIgXlUGHxoNj9HX-PZxHqBie3hpzCQqPYZmHAZeqU','2024-11-20 11:13:24.155292'),('ydscefmhf61qnjh2wytmsoonz6my044h','.eJxVjEEOwiAQRe_C2hBKhQGX7j0DgRlGqgaS0q6MdzckXej2v_f-W4S4byXsPa9hIXERVpx-txTxmesA9Ij13iS2uq1LkkORB-3y1ii_rof7d1BiL6MGJiBiojMYby0xopqZJ80GiGN22qFzoBXMPqFLBqaolUFM3gJZ8fkCGpE4ug:1t8iIy:z3s04UpD_ipzXbVpU_8wnh1X5Sd9VBMp0VgTkt8WGbs','2024-11-20 15:50:48.450283');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-14 12:38:00
