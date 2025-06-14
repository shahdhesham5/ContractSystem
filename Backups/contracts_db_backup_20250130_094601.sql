-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: contracts_db
-- ------------------------------------------------------
-- Server version	8.0.40

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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `city_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Clients_area_city_id_b30afa06_fk_Clients_city_id` (`city_id`),
  CONSTRAINT `Clients_area_city_id_b30afa06_fk_Clients_city_id` FOREIGN KEY (`city_id`) REFERENCES `Clients_city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clients_area`
--

LOCK TABLES `Clients_area` WRITE;
/*!40000 ALTER TABLE `Clients_area` DISABLE KEYS */;
INSERT INTO `Clients_area` VALUES (1,'Nasr City',1),(2,'Heliopolis',1),(3,'Maadi',1),(4,'Zamalek',1),(5,'New Cairo',1),(6,'Downtown',1),(7,'Garden City',1),(8,'Dokki',1),(9,'Montaza',2),(10,'Smouha',2),(11,'Sidi Gaber',2),(12,'El Shatby',2),(13,'El Raml',2),(14,'Gleem',2),(15,'Stanley',2),(16,'Agamy',2),(17,'6th of October',3),(18,'Sheikh Zayed',3),(19,'Dokki',3),(20,'Mohandessin',3),(21,'Imbaba',3),(22,'Pyramids',3),(23,'Haram',3),(24,'Faisal',3),(25,'Naama Bay',4),(26,'Hadaba',4),(27,'Sharks Bay',4),(28,'Nabq Bay',4),(29,'Old Market',4),(30,'Dahar',5),(31,'Sakkala',5),(32,'El Gouna',5),(33,'Makadi Bay',5),(34,'Sahl Hasheesh',5),(35,'West Bank',6),(36,'East Bank',6),(37,'Karnak',6),(38,'Al Mabadat',6),(39,'Gezira',6),(40,'Awameya',6),(41,'Agilika Island',7),(42,'Elephantine Island',7),(43,'Nubian Village',7),(44,'Sehel',7),(45,'Gharb Aswan',7),(46,'Abu Simbel',7),(47,'Talkha',8),(48,'Al Mahalla',8),(49,'Mansoura Qism 2',8),(50,'Sakha',8),(51,'Gammaleya',8),(52,'Fayed',9),(53,'El Qantara',9),(54,'Al Tayaran',9),(55,'El Sheikh Zayed',9),(56,'El Mostashfa El Askary',9),(57,'El Arab District',10),(58,'Port Fouad',10),(59,'El Manakh',10),(60,'El Zohour',10),(61,'Sharq',10),(62,'Ain Sokhna',11),(63,'El Ganayen',11),(64,'Al Salam',11),(65,'Al Arbaeen',11),(66,'Faisal',11),(67,'Port Tawfiq',11),(68,'El Mehalla El Kobra',12),(69,'El Santa',12),(70,'Basyoun',12),(71,'Kafr El Zayat',12),(72,'Qotour',12),(73,'Fakous',13),(74,'Kafr Saqr',13),(75,'Abu Hammad',13),(76,'Bilbeis',13),(77,'Hihya',13),(78,'Diarb Negm',13),(79,'Delengat',14),(80,'Shubra Khit',14),(81,'Itay El Baroud',14),(82,'Kom Hamada',14),(83,'Abu Hummus',14),(84,'Ibshaway',15),(85,'Tamiya',15),(86,'Youssef El Seddik',15),(87,'Senoris',15),(88,'New Fayoum',15),(89,'Al Fashn',16),(90,'Ehnasia',16),(91,'Biba',16),(92,'Sumusta',16),(93,'Nasser City',16),(94,'Maghagha',17),(95,'Samalut',17),(96,'Abu Qirqas',17),(97,'Malawi',17),(98,'Deir Mawas',17),(99,'Tahta',18),(100,'Gerga',18),(101,'Akhmim',18),(102,'El Maragha',18),(103,'Dar El Salam',18),(104,'Tima',18),(105,'Abnoub',19),(106,'Abu Tig',19),(107,'Manfalut',19),(108,'Dairut',19),(109,'El Badari',19),(110,'Sahel Selim',19),(111,'Qift',20),(112,'Qus',20),(113,'Nag Hammadi',20),(114,'Farshut',20),(115,'El Waqf',20),(116,'Abu Tesht',20),(117,'Sheikh Zuweid',21),(118,'Rafah',21),(119,'Bir El Abd',21),(120,'El Mahdiya',21),(121,'Masaeed',21),(122,'El Alamein',22),(123,'Sidi Abdel Rahman',22),(124,'Siwa',22),(125,'El Obayed',22),(126,'Agiba',22),(127,'Ras El Bar',23),(128,'New Damietta',23),(129,'Kafr Saad',23),(130,'Faraskur',23),(131,'Ezbet El Borg',23),(132,'Banha',24),(133,'Shubra El Kheima',24),(134,'El Qanater',24),(135,'Khanka',24),(136,'Toukh',24),(137,'Qaha',24),(138,'Kafr El Dawwar',25),(139,'Damanhour',25),(140,'Rashid',25),(141,'Abu Hummus',25),(142,'Edku',25),(143,'Zagazig',26),(144,'Bilbeis',26),(145,'Fakous',26),(146,'Abu Hammad',26),(147,'El Husseiniya',26),(148,'Baltim',27),(149,'Desouk',27),(150,'Fouh',27),(151,'Sidi Salem',27),(152,'Biyala',27),(153,'El Riyad',27),(154,'El Mahalla',28),(155,'Samanoud',28),(156,'Zefta',28),(157,'Kafr El Zayat',28),(158,'Basyoun',28),(159,'Santa',28),(160,'Other',29);
/*!40000 ALTER TABLE `Clients_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clients_city`
--

DROP TABLE IF EXISTS `Clients_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clients_city` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clients_city`
--

LOCK TABLES `Clients_city` WRITE;
/*!40000 ALTER TABLE `Clients_city` DISABLE KEYS */;
INSERT INTO `Clients_city` VALUES (21,'Al Arish'),(2,'Alexandria'),(19,'Assiut'),(7,'Aswan'),(25,'Beheira'),(16,'Beni Suef'),(1,'Cairo'),(14,'Damanhur'),(23,'Damietta'),(15,'Fayoum'),(28,'Gharbia'),(3,'Giza'),(5,'Hurghada'),(9,'Ismailia'),(27,'Kafr El Sheikh'),(6,'Luxor'),(8,'Mansoura'),(22,'Marsaa Matrouh'),(17,'Minya'),(29,'Other'),(10,'Port Said'),(24,'Qalyubia'),(20,'Qena'),(4,'Sharm El-Sheikh'),(26,'Sharqia'),(18,'Sohag'),(11,'Suez'),(12,'Tanta'),(13,'Zagazig');
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
  `manager` varchar(255) DEFAULT NULL,
  `company_address` longtext NOT NULL,
  `phone_number` varchar(11) NOT NULL,
  `area_id` bigint DEFAULT NULL,
  `city_id` bigint DEFAULT NULL,
  `ERP_code` int DEFAULT NULL,
  `tax_registration_number` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Clients_company_area_id_6e9cb82e_fk_Clients_area_id` (`area_id`),
  KEY `Clients_company_city_id_6af3d64c_fk_Clients_city_id` (`city_id`),
  CONSTRAINT `Clients_company_area_id_6e9cb82e_fk_Clients_area_id` FOREIGN KEY (`area_id`) REFERENCES `Clients_area` (`id`),
  CONSTRAINT `Clients_company_city_id_6af3d64c_fk_Clients_city_id` FOREIGN KEY (`city_id`) REFERENCES `Clients_city` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clients_company`
--

LOCK TABLES `Clients_company` WRITE;
/*!40000 ALTER TABLE `Clients_company` DISABLE KEYS */;
INSERT INTO `Clients_company` VALUES ('07966658-2a08-4cf6-a449-da2ac2a4066a','جمعيه الصناع','العميد/ عبدالرحيم','السويس ( معدية الشط )','01002013535',62,11,NULL,NULL),('10cbb6c2-c48f-418f-b666-87c0bd347652','دمياتك جروب للاستثمار و التنمية الزراعية','أحمد رفعت','مدينة السادات الصناعية - محافظة المنوفية','01210499931',160,29,NULL,584433948),('17595517-fe07-419a-a560-9b60c12ddd3d','أوريون للصناعات الغذائية','أ/ صلاح','مدينة بدر','01006770995',5,1,NULL,NULL),('1ee2fc9a-c107-4ff1-9a98-b7f63e497a05','المواني البرية','أ/ محمد حجازي','وزارة النقل','01065520273',6,1,NULL,NULL),('2c802603-538a-4684-a1f3-71e038faacf0','منجم السكري','أ/ محمود حسونة','مرسي علم','01210947275',122,22,NULL,NULL),('2cfdad2d-da4a-494b-ae7e-2029ee418020','النصر للكيماويات الوسيطة','اسامة','ابو رواش','01006600212',17,3,NULL,NULL),('3cf32c7b-572b-4a3a-9149-2ce98372c9fd','نهضة مصر','ا/ سمير','المنوفية ( الباجور )','01006811004',1,1,NULL,NULL),('4970333e-8ff1-4b61-bb71-3644a85d72ad','دمياتك جروب للحاصلات الزراعية','مصطفى حرب','37X4+576, Deirames, Markaz Abu Humus, Beheira','01271086408',141,25,NULL,350016348),('538dc13a-62e2-4a03-86dd-97075e9c528b','فيلكس بي','ا/ ماجد','6 اكتوبر','01021113711',17,3,NULL,NULL),('6998b90a-ce7a-4174-8800-8a188fe5cd6b','القاهرة للدواجن CPC','ا/ محمود','الجيزة','01009470461',17,3,NULL,NULL),('7f594804-5762-4e54-9d9d-ecf44d88d645','(تنكات) يونيليفر مشرق','م/ عـــاطف','اكتوبر المنطقة االصناعية 6','01202119778',17,3,NULL,100409334),('876b605e-3ca1-446f-a601-cee1ce8e5264','مصر للاسمنت ( بيتون)','أ/ياسر فؤاد','القاهرة ( وسط البلد )','01063487000',6,1,NULL,NULL),('978c5b0e-3543-401a-8c1a-567a3a27e84f','المشروعات البترولية و الاستشارات الفنية - بتروجيت','محمد كمال','الناصرية - الاسكندرية','01001174768',16,2,NULL,100469396),('9c04fe2b-07df-4866-b957-79e3f0acb9fd','مزرعة الاندلس','محمد','طريق اسكندرية القاهرة الصحراوى - مدخل خالد ابن الوليد - الكيلو 56','01101132112',NULL,NULL,NULL,NULL),('aaa375b1-7c0c-4846-8254-bf5591bf2d21','المستثمر للصناعات الغذائية','أ/ صلاح','مدينة بدر','01006770995',1,1,NULL,NULL),('c721f9f8-863f-4d1c-bebb-dbe5be0b4756','الاستثمارية الصناعية فل','م/ باسم','العاشر من رمضان','01009792702',1,1,NULL,NULL),('cf80bdd9-f86c-42b2-a164-9fe2c9f87d58','العربية الخليجية','م/ بدر','مدينة بدر','01228016307',1,1,NULL,NULL),('cffa1627-3e9e-4ed9-8371-58bf7f12536d','لولو للاسوق التجارية الكبيري','أ/ اسلام','القاهرة','01114776093',1,1,NULL,NULL),('d04c119a-2b17-4055-9c88-3a4ef2837670','ديورافيت ايجبت','أ/احمد','العاشر من رمضان','01008219332',1,1,NULL,NULL),('d3be514f-aea0-4e15-ba1a-c2982f337137','الشبة المصرية','م/ أسامة','ابو زعبل','01028004467',132,24,NULL,NULL);
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
  `manager` varchar(255) DEFAULT NULL,
  `site_address` longtext NOT NULL,
  `phone_number` varchar(11) NOT NULL,
  `location_url` varchar(200) DEFAULT NULL,
  `comment` longtext,
  `area_id` bigint DEFAULT NULL,
  `city_id` bigint DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `sub_company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Clients_site_area_id_f5f8070a_fk_Clients_area_id` (`area_id`),
  KEY `Clients_site_city_id_e6223aa5_fk_Clients_city_id` (`city_id`),
  KEY `Clients_site_company_id_73d4c0b3_fk_Clients_company_id` (`company_id`),
  KEY `Clients_site_sub_company_id_73008ef6_fk_Clients_subcompany_id` (`sub_company_id`),
  CONSTRAINT `Clients_site_area_id_f5f8070a_fk_Clients_area_id` FOREIGN KEY (`area_id`) REFERENCES `Clients_area` (`id`),
  CONSTRAINT `Clients_site_city_id_e6223aa5_fk_Clients_city_id` FOREIGN KEY (`city_id`) REFERENCES `Clients_city` (`id`),
  CONSTRAINT `Clients_site_company_id_73d4c0b3_fk_Clients_company_id` FOREIGN KEY (`company_id`) REFERENCES `Clients_company` (`id`),
  CONSTRAINT `Clients_site_sub_company_id_73008ef6_fk_Clients_subcompany_id` FOREIGN KEY (`sub_company_id`) REFERENCES `Clients_subcompany` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clients_site`
--

LOCK TABLES `Clients_site` WRITE;
/*!40000 ALTER TABLE `Clients_site` DISABLE KEYS */;
INSERT INTO `Clients_site` VALUES ('031503f3-7ce5-454a-8d11-2114a28f7221','التجمع الاول','ا/ اسلام','التجمع الاول','01114776093','https://maps.app.goo.gl/PBsq3X8y8zCF9FtEA?g_st=iw','موقع التجمع الاول خطا لحين اضافة الجديد',1,1,'cffa1627-3e9e-4ed9-8371-58bf7f12536d',NULL),('03f27f38-ecd2-4d87-abbe-76a4471829c5','العاشر من رمضان','ا/احمد','العاشر من رمضان','01008219332','https://maps.app.goo.gl/mbMCBGjvmuDmnDaY6','موقع ديواريت ايجيبت خطاء لحين اضافة الصحيح',1,1,'d04c119a-2b17-4055-9c88-3a4ef2837670',NULL),('04dd83d2-ffb0-463e-ac10-9f366bb8547a','اسيوط','أ/ياسر فؤاد','مصر للاسمنت بيتون ( اسيوط )','01063487000','https://maps.app.goo.gl/ENM4e5r2PKRxkPcP6','',105,19,'876b605e-3ca1-446f-a601-cee1ce8e5264',NULL),('0eb01ef2-187c-4108-a7fa-a735c72878e8','الباجور','ا/ سمير','لمنوفية ( الباجور )','01006811004','https://maps.app.goo.gl/gYnNKmAPSomNbCJW7','موقع نهضة مصر خطا لحين اضافة الجديد',1,1,'3cf32c7b-572b-4a3a-9149-2ce98372c9fd',NULL),('21a33f1b-4d94-4bcf-9b78-a85662582a98','لولو مااركت التجمع الخامس','أ/ اسلام','التجمع الخامس','01114776093','https://maps.app.goo.gl/gYnNKmAPSomNbCJW7','موقع التجمع الخامس خطا لحين اضافة الجديد',1,1,'cffa1627-3e9e-4ed9-8371-58bf7f12536d',NULL),('249180df-1051-4d89-92b6-2b02f9ae5957','قفط','أ/ياسر فؤاد','مصر للاسمنت بيتون ( قفط )','01063487000','https://maps.app.goo.gl/mbMCBGjvmuDmnDaY6','',111,20,'876b605e-3ca1-446f-a601-cee1ce8e5264',NULL),('258f3f4f-f784-4e77-aab3-bb2c0752f350','رفح','أ/ محمد حجازي','وزارة النقل ( معبر رفح )','01065520273','https://maps.app.goo.gl/35qAytgLkbjaUTPy7','موقع رفح خطا لحين اضافة الجديد',1,1,'1ee2fc9a-c107-4ff1-9a98-b7f63e497a05',NULL),('3dc67006-6bb1-47c3-8c30-e63af65cd08b','انشاص','ا/ محمود','جميعية عرابي طريق القاهرة الأسماعيلية','01009470461','https://maps.app.goo.gl/gYnNKmAPSomNbCJW7','موقع انشاص خطا لحين اضافة الصحيح',52,9,'6998b90a-ce7a-4174-8800-8a188fe5cd6b','7240208c-17ea-4e83-8c4e-f76303f9b56f'),('41d883ca-d4e8-4798-85cc-a1efc9470e39','6 اكتوبر','ا/ ماجد','اكتوبر المنطقة الصناعية 6','01021113711','https://maps.app.goo.gl/35qAytgLkbjaUTPy7','موقع فيلكس بي خطا لحين اضافة الصحيح',17,3,'538dc13a-62e2-4a03-86dd-97075e9c528b',NULL),('46855125-64b8-4167-848e-16fb6b09921e','المنيا','أ/ياسر فؤاد','مصر للاسمنت بيتون ( المنيا )','01063487000','https://maps.app.goo.gl/mbMCBGjvmuDmnDaY6','',94,17,'876b605e-3ca1-446f-a601-cee1ce8e5264',NULL),('53675080-db9b-4fbe-ada7-90c368fe1398','سوهاج','أ/ياسر فؤاد','مصر للاسمنت بيتون ( سوهاج )','01063487000','https://maps.app.goo.gl/N8emQYMTFTQkfbTF8','',99,18,'876b605e-3ca1-446f-a601-cee1ce8e5264',NULL),('603b4373-4a40-44d7-86a8-1a01dc8a1e20','العاشر من رمضان','م/ باسم','العاشر من رمضان','01009792702','https://maps.app.goo.gl/35qAytgLkbjaUTPy7','موقع فل خطا لحين اضافة الجديد',1,1,'c721f9f8-863f-4d1c-bebb-dbe5be0b4756',NULL),('6656e992-a5d9-4c20-a530-d774d6769f05','المدينة','ا/ محمود','جميعية عرابي طريق القاهرة الأسماعيلية','01009470461','https://maps.app.goo.gl/PBsq3X8y8zCF9FtEA?g_st=iw','موقع المدينة خطا لحين اضافة الجديد',52,9,'6998b90a-ce7a-4174-8800-8a188fe5cd6b','46ae48e9-a533-46bb-b638-72a3a8e4f914'),('685c1736-e4a6-4b85-afe7-aa50f6839be2','سينا 2000','ا/ محمود','مدينة العاشر من رمضان علي بعد 5 كم من كوبري العاشر','01009470461','https://maps.app.goo.gl/mbMCBGjvmuDmnDaY6','موقع سينا 2000 خطا لحين اضافة الجديد',1,1,'6998b90a-ce7a-4174-8800-8a188fe5cd6b','7240208c-17ea-4e83-8c4e-f76303f9b56f'),('69646144-3cbc-4b8f-b824-80da28665b29','القادسيية','ا/ محمود','العاشر من رمضان علي الطريق الدائري الاقليمي','01009470461','https://maps.app.goo.gl/35qAytgLkbjaUTPy7','موقع القادسبة خطا لحين اضافة الصحيح',1,1,'6998b90a-ce7a-4174-8800-8a188fe5cd6b','0376b350-82ac-4722-9f66-f89716ac7f16'),('6fcade12-96b1-4c41-911d-90bde1816c63','لولو ماركت شيراتون','ا/ اسلام','شيراتون','01114776093','https://maps.app.goo.gl/ENM4e5r2PKRxkPcP6','موقع شيراتو خطا لحين اضافة الجديد',1,1,'cffa1627-3e9e-4ed9-8371-58bf7f12536d',NULL),('7ec3495b-150d-46c6-afe7-5686f322b181','ابو زعبل','م/ أسامة','ابو زعبل','01028004467','https://maps.app.goo.gl/gYnNKmAPSomNbCJW7','موقع الشبة المصرية خطا لحين اضافة الجديد',132,24,'d3be514f-aea0-4e15-ba1a-c2982f337137',NULL),('8288315e-f401-445f-a45f-7d716823ce01','قرية خالد بن الوليد','محمد','طريق اسكندرية القاهرة الصحراوى - مدخل خالد ابن الوليد - الكيلو 56','01101132112',NULL,'',NULL,NULL,'9c04fe2b-07df-4866-b957-79e3f0acb9fd',NULL),('8ce20767-1b47-43bf-b312-c7fa8f5d8792','الناصرية','محمد كمال','الناصرية - الاسكندرية','01001174768',NULL,'',9,2,'978c5b0e-3543-401a-8c1a-567a3a27e84f',NULL),('8dd050e3-6658-4163-b6a9-f74798472e5b','قسطل','أ/ محمد حجازي','وزارة النقل','01065520273','https://maps.app.goo.gl/NriGKq4Hgsnq7BFb6','',1,1,'1ee2fc9a-c107-4ff1-9a98-b7f63e497a05',NULL),('9083e2b4-5ee1-4ce7-b8ee-5774bb53ea35','الاقصر','أ/ياسر فؤاد','مصر للاسمنت بيتون ( الاقصر )','01063487000','https://maps.app.goo.gl/s88AJDpCCLVb18dZ8','',35,6,'876b605e-3ca1-446f-a601-cee1ce8e5264',NULL),('90c2618b-fd71-4101-88d3-cc2386ad100c','الصالحية','ا/ محمود','مدينة الصالحية محافظة الأسماعيلية','01009470461','https://maps.app.goo.gl/wWHHagJRn2s4hYJD8','',52,9,'6998b90a-ce7a-4174-8800-8a188fe5cd6b','7240208c-17ea-4e83-8c4e-f76303f9b56f'),('969a9d7f-3061-4cd6-8c6f-768159e9297b','مدينة بدر','أ/ صلاح','مدينة بدر','01006770995','https://maps.app.goo.gl/ENM4e5r2PKRxkPcP6','موقع اريون خطا لحين اضتفة الصحيح',5,1,'17595517-fe07-419a-a560-9b60c12ddd3d',NULL),('a03fd2fb-7d0a-4a36-8e0e-7a963a14c3f4','العوجة','أ/ محمد حجازي','وزارة انقل ( العوجة )','01065520273','https://maps.app.goo.gl/mbMCBGjvmuDmnDaY6','',1,1,'1ee2fc9a-c107-4ff1-9a98-b7f63e497a05',NULL),('a1f2dca7-b446-4996-98a5-dbb146de8f87','ابو حمص','مصطفى حرب','37X4+576, Deirames, Markaz Abu Humus, Beheira','01271086408','https://www.google.com/maps/place/%D9%85%D8%AD%D8%B7%D8%A9+%D8%AF%D9%85%D9%8A%D8%A7%D8%AA%D9%83+%D8%AC%D8%B1%D9%88%D8%A8%E2%80%AD/@31.0979175,30.2556331,17z/data=!4m14!1m7!3m6!1s0x14f6731c26d57355:0xf','',138,25,'4970333e-8ff1-4b61-bb71-3644a85d72ad',NULL),('b49b437f-5928-4bd4-9832-12e653d8bea6','الصف','ا/ محمود','مدينة انشاص علي طريق بلبيس السلام','01009470461','https://maps.app.goo.gl/35qAytgLkbjaUTPy7','موقع الصف خطا لحين اضافة الجديد',23,3,'6998b90a-ce7a-4174-8800-8a188fe5cd6b','76315566-389e-469d-9145-d27f1dafc897'),('bd895064-8d7e-424b-bc77-f56ccd0e8ab2','بني سويف','أ/ياسر فؤاد','مصر للاسمنت بيتون ( بني سويف)','01063487000','https://maps.app.goo.gl/35qAytgLkbjaUTPy7','',89,16,'876b605e-3ca1-446f-a601-cee1ce8e5264',NULL),('c3bc49b9-a8d2-47e0-ac7d-c75f0dab8374','البراوي','ا/ محمود','مدينة انشاص علي طريق بلبيس السلام','01009470461','https://maps.app.goo.gl/35qAytgLkbjaUTPy7','موقع البراوي خطا لحين اضافة الجديد',23,3,'6998b90a-ce7a-4174-8800-8a188fe5cd6b','76315566-389e-469d-9145-d27f1dafc897'),('c69d5ddc-116c-4c07-b093-17d4c00c8e8c','مدينة بدر','م/ بدر','مدينة بدر','01228016307','https://maps.app.goo.gl/mbMCBGjvmuDmnDaY6','موقع العربية الخليجية خطا لحين اضافة الجديد',1,1,'cf80bdd9-f86c-42b2-a164-9fe2c9f87d58',NULL),('cbffd5f1-ce28-46be-ab87-d753d23650b2','السويس  ( غرب )','العميد/ عبدالرحيم','السويس ( معديةالشط ) غرب','01002013535','https://maps.app.goo.gl/PBsq3X8y8zCF9FtEA?g_st=iw','',62,11,'07966658-2a08-4cf6-a449-da2ac2a4066a',NULL),('cdf35269-cd10-4f96-9e76-c0ec9903aa5b','العين السخنة','اسامة',';tv hgsdo','01006600212','https://maps.app.goo.gl/fpQKrXqidy6U5MMq9','',148,27,'2cfdad2d-da4a-494b-ae7e-2029ee418020','1a506104-f26f-458c-8d50-2acbc53f9704'),('d9f6c080-4e95-4585-b47f-381138c077a4','6 اكتوبر','م/ عـــاطف','6اكتوبر المنطقة الصناعية','01202119778','https://maps.app.goo.gl/mbMCBGjvmuDmnDaY6','موقع يونيليفر خطا لحين اضافة موقع جديد',17,3,'7f594804-5762-4e54-9d9d-ecf44d88d645',NULL),('dac9a914-9c9f-457c-831e-5b771ec548ba','اسوان','أ/ياسر فؤاد','مصر للاسمنت بيتون ( اسوان )','01063487000','https://maps.app.goo.gl/gYnNKmAPSomNbCJW7','',41,7,'876b605e-3ca1-446f-a601-cee1ce8e5264',NULL),('e446bd69-4ed4-4459-a0d6-64583493475b','مرسي علم','أ/ محمود حسونة','مرسي علم','01210947275','https://maps.app.goo.gl/N8emQYMTFTQkfbTF8','موقع منجم السكري خطا لحين اضافة الصحيح',122,22,'2c802603-538a-4684-a1f3-71e038faacf0',NULL),('efd10d1a-b666-4054-ab17-e6da5e2931ee','ارقين','أ/ محمد حجازي','وزارة النقل','01065520273','https://maps.app.goo.gl/gkDvKVFsEig6uCKw6','',1,1,'1ee2fc9a-c107-4ff1-9a98-b7f63e497a05',NULL),('f2c7e135-3d97-465f-96ec-a8a9e812d792','السويس ( شرق )','العميد/ عبدالرحيم','السويس ( معدية الشط ) شرق','01002013535','https://maps.app.goo.gl/PBsq3X8y8zCF9FtEA?g_st=iw','',62,11,'07966658-2a08-4cf6-a449-da2ac2a4066a',NULL),('f356fc0a-e9ff-4b79-b01c-808c7ba205fc','مدينة بدر','أ/ صلاح','مدينة بدر','01006770995','https://maps.app.goo.gl/ENM4e5r2PKRxkPcP6','موقع المستثمر خطا لحين اضافة الجديد',1,1,'aaa375b1-7c0c-4846-8254-bf5591bf2d21',NULL),('f51a40b4-5aea-41d7-91c9-aaf5e1928ef7','السادات','أحمد رفعت','مدينة السادات الصناعية - محافظة المنوفية','01210499931',NULL,'',160,29,'10cbb6c2-c48f-418f-b666-87c0bd347652',NULL),('fb9becde-1b87-4a29-9153-d6a1bc41f153','العهد 2','ا/ محمود','علي طريق بلبيس قبل بوابة بلبيس','01009470461','https://maps.app.goo.gl/ENM4e5r2PKRxkPcP6','موقع العهد 2 خطا لحين اضافة الجديد',23,3,'6998b90a-ce7a-4174-8800-8a188fe5cd6b','46ae48e9-a533-46bb-b638-72a3a8e4f914'),('fcca3796-a72e-43ea-a904-105cd5f4a119','العهد 1','ا/ محمود','علي طريق بلبيس قبل بوابة بلبيس','01009470461','https://maps.app.goo.gl/ENM4e5r2PKRxkPcP6','موقع العهد 1 خطا لحين اضافة الصحيح',23,3,'6998b90a-ce7a-4174-8800-8a188fe5cd6b','46ae48e9-a533-46bb-b638-72a3a8e4f914');
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
  `manager` varchar(255) DEFAULT NULL,
  `sub_company_address` longtext NOT NULL,
  `phone_number` varchar(11) NOT NULL,
  `area_id` bigint DEFAULT NULL,
  `city_id` bigint DEFAULT NULL,
  `parent_company_id` varchar(255) NOT NULL,
  `ERP_code` int DEFAULT NULL,
  `tax_registration_number` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Clients_subcompany_area_id_881bd426_fk_Clients_area_id` (`area_id`),
  KEY `Clients_subcompany_city_id_8f940d23_fk_Clients_city_id` (`city_id`),
  KEY `Clients_subcompany_parent_company_id_3fd8b9c1_fk_Clients_c` (`parent_company_id`),
  CONSTRAINT `Clients_subcompany_area_id_881bd426_fk_Clients_area_id` FOREIGN KEY (`area_id`) REFERENCES `Clients_area` (`id`),
  CONSTRAINT `Clients_subcompany_city_id_8f940d23_fk_Clients_city_id` FOREIGN KEY (`city_id`) REFERENCES `Clients_city` (`id`),
  CONSTRAINT `Clients_subcompany_parent_company_id_3fd8b9c1_fk_Clients_c` FOREIGN KEY (`parent_company_id`) REFERENCES `Clients_company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clients_subcompany`
--

LOCK TABLES `Clients_subcompany` WRITE;
/*!40000 ALTER TABLE `Clients_subcompany` DISABLE KEYS */;
INSERT INTO `Clients_subcompany` VALUES ('0376b350-82ac-4722-9f66-f89716ac7f16','وادي النطرون لأنتاج بداري التسمين','ا/ محمود','العاشر من رمضان علي الطريق الدائري الاقليمي','01009470461',1,1,'6998b90a-ce7a-4174-8800-8a188fe5cd6b',NULL,NULL),('1a506104-f26f-458c-8d50-2acbc53f9704','النصر 1','اسامة','العنوان','01006600212',17,3,'2cfdad2d-da4a-494b-ae7e-2029ee418020',NULL,NULL),('46ae48e9-a533-46bb-b638-72a3a8e4f914','القاهرة لمجازر الدواجن','ا/ محمود','علي طريق بلبيس قبل بوابة بلبيس','01009470461',23,3,'6998b90a-ce7a-4174-8800-8a188fe5cd6b',NULL,NULL),('7240208c-17ea-4e83-8c4e-f76303f9b56f','القاهرة الجديدة للدواجن','ا/ محمود','جميعية عرابي طريق القاهرة الأسماعيلية','01009470461',52,9,'6998b90a-ce7a-4174-8800-8a188fe5cd6b',NULL,NULL),('76315566-389e-469d-9145-d27f1dafc897','القاهرة للدواجن','ا/ محمود','مدينة انشاص علي طريق بلبيس السلام','01009470461',23,3,'6998b90a-ce7a-4174-8800-8a188fe5cd6b',NULL,NULL);
/*!40000 ALTER TABLE `Clients_subcompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'admin'),(2,'alex'),(3,'cairo');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add area',7,'add_area'),(26,'Can change area',7,'change_area'),(27,'Can delete area',7,'delete_area'),(28,'Can view area',7,'view_area'),(29,'Can add city',8,'add_city'),(30,'Can change city',8,'change_city'),(31,'Can delete city',8,'delete_city'),(32,'Can view city',8,'view_city'),(33,'Can add company',9,'add_company'),(34,'Can change company',9,'change_company'),(35,'Can delete company',9,'delete_company'),(36,'Can view company',9,'view_company'),(37,'Can add sub company',10,'add_subcompany'),(38,'Can change sub company',10,'change_subcompany'),(39,'Can delete sub company',10,'delete_subcompany'),(40,'Can view sub company',10,'view_subcompany'),(41,'Can add site',11,'add_site'),(42,'Can change site',11,'change_site'),(43,'Can delete site',11,'delete_site'),(44,'Can view site',11,'view_site'),(45,'Can add contract',12,'add_contract'),(46,'Can change contract',12,'change_contract'),(47,'Can delete contract',12,'delete_contract'),(48,'Can view contract',12,'view_contract'),(49,'Can add engineers',13,'add_engineers'),(50,'Can change engineers',13,'change_engineers'),(51,'Can delete engineers',13,'delete_engineers'),(52,'Can view engineers',13,'view_engineers'),(53,'Can add maintenance schedule',14,'add_maintenanceschedule'),(54,'Can change maintenance schedule',14,'change_maintenanceschedule'),(55,'Can delete maintenance schedule',14,'delete_maintenanceschedule'),(56,'Can view maintenance schedule',14,'view_maintenanceschedule'),(57,'Can add invoice schedule',15,'add_invoiceschedule'),(58,'Can change invoice schedule',15,'change_invoiceschedule'),(59,'Can delete invoice schedule',15,'delete_invoiceschedule'),(60,'Can view invoice schedule',15,'view_invoiceschedule'),(61,'Can add emergency visits',16,'add_emergencyvisits'),(62,'Can change emergency visits',16,'change_emergencyvisits'),(63,'Can delete emergency visits',16,'delete_emergencyvisits'),(64,'Can view emergency visits',16,'view_emergencyvisits'),(65,'Can add vehicles',17,'add_vehicles'),(66,'Can change vehicles',17,'change_vehicles'),(67,'Can delete vehicles',17,'delete_vehicles'),(68,'Can view vehicles',17,'view_vehicles'),(69,'Can add crontab',18,'add_crontabschedule'),(70,'Can change crontab',18,'change_crontabschedule'),(71,'Can delete crontab',18,'delete_crontabschedule'),(72,'Can view crontab',18,'view_crontabschedule'),(73,'Can add interval',19,'add_intervalschedule'),(74,'Can change interval',19,'change_intervalschedule'),(75,'Can delete interval',19,'delete_intervalschedule'),(76,'Can view interval',19,'view_intervalschedule'),(77,'Can add periodic task',20,'add_periodictask'),(78,'Can change periodic task',20,'change_periodictask'),(79,'Can delete periodic task',20,'delete_periodictask'),(80,'Can view periodic task',20,'view_periodictask'),(81,'Can add periodic task track',21,'add_periodictasks'),(82,'Can change periodic task track',21,'change_periodictasks'),(83,'Can delete periodic task track',21,'delete_periodictasks'),(84,'Can view periodic task track',21,'view_periodictasks'),(85,'Can add solar event',22,'add_solarschedule'),(86,'Can change solar event',22,'change_solarschedule'),(87,'Can delete solar event',22,'delete_solarschedule'),(88,'Can view solar event',22,'view_solarschedule'),(89,'Can add clocked',23,'add_clockedschedule'),(90,'Can change clocked',23,'change_clockedschedule'),(91,'Can delete clocked',23,'delete_clockedschedule'),(92,'Can view clocked',23,'view_clockedschedule');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$cvuR6U8cG0R4lBlTfpQZn9$UXe6F7kk31a6bcKn2LkSJb6Y+f6w0tLv0l8TfjHL7H8=','2025-01-16 08:31:20.246795',1,'admin','','','admin@gmail.com',1,1,'2024-11-18 10:24:35.278214'),(2,'pbkdf2_sha256$600000$kUWsXTVgtkB4a583dfdOHs$7xq8Y6ub2XbIXtkTFK8rHLX96lMrqo5i/Imob15WGKs=','2025-01-14 12:02:57.118048',0,'ictco','','','',0,1,'2024-11-18 10:30:20.000000'),(3,'pbkdf2_sha256$600000$MpQDa7jvsjFfbvDGMQXsL2$jkVBzBemyeSBEXTtGwdH3T9akRGgGPVx877wAU1eMUg=','2025-01-30 08:00:58.957192',0,'eman','','','',0,1,'2024-11-18 12:20:56.000000'),(5,'pbkdf2_sha256$600000$He0YXsqNf2772baageuSqX$ybcq+Ggox0e9e0EdtFpFCg7/h2Th5n/v7C/uixVT12o=','2025-01-28 13:00:06.995767',0,'Rasha_Salama','','','',0,1,'2025-01-14 10:09:54.000000'),(6,'pbkdf2_sha256$600000$mlWCAjR7BELyBAEo3imcII$cFUyf596OC0AdzpAO/WYT1ezuwNmIBd/pQiLhqL1EbE=','2025-01-16 08:27:21.109979',0,'Alex','','','',0,1,'2025-01-16 07:52:17.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,1,1),(2,2,1),(9,3,1),(5,5,1),(10,6,2);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `annual_increase` int DEFAULT NULL,
  `auto_renew` tinyint(1) NOT NULL,
  `emergency_visit_price` double DEFAULT NULL,
  `emergency_within_period` int DEFAULT NULL,
  `invoice_frequency` varchar(255) NOT NULL,
  `invoice_date_calculation` varchar(10) NOT NULL,
  `maintenance_frequency` varchar(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `branch_site` varchar(255) NOT NULL,
  `damgh_date` date DEFAULT NULL,
  `damgh_price` double DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `pdf` varchar(100) DEFAULT NULL,
  `company_id` varchar(255) NOT NULL,
  `is_taxed` tinyint(1) NOT NULL,
  `tax_percentage` double NOT NULL,
  `renewed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contracts_contract_company_id_b071885c_fk_Clients_company_id` (`company_id`),
  CONSTRAINT `contracts_contract_company_id_b071885c_fk_Clients_company_id` FOREIGN KEY (`company_id`) REFERENCES `Clients_company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts_contract`
--

LOCK TABLES `contracts_contract` WRITE;
/*!40000 ALTER TABLE `contracts_contract` DISABLE KEYS */;
INSERT INTO `contracts_contract` VALUES ('145610f5-cd4d-4d10-800b-a71651c2a981','2024-03-01','2025-02-28',81784,10,1,1650,48,'Every 2 Months','end','Every 2 Months','Millenium company','Cairo',NULL,0,'','pdfs/مصر للاسمنت ( بيتون)/مصر_للاسمنت__بيتون_rQ2QGZa.pdf','876b605e-3ca1-446f-a601-cee1ce8e5264',0,14,0),('1e89bfb8-e432-4de1-a7c8-1228e8474b14','2024-02-01','2025-01-31',3737,NULL,0,0,48,'Every 3 Months','end','Every 3 Months','Millenium company','Cairo',NULL,0,'','pdfs/لولو للاسوق التجارية الكبيري/لولو_للاسواق_التجارية_الكبري__شيراتون_AcxAvBN.pdf','cffa1627-3e9e-4ed9-8371-58bf7f12536d',0,14,0),('202cfd68-6c89-45a9-92f0-f6462526f826','2024-04-01','2025-03-31',4000,10,0,0,48,'Every 3 Months','end','Every Month','Millenium company','Cairo',NULL,0,'','pdfs/ديورافيت ايجبت/ديورافيت_إيجيبت_HhYmnOJ.pdf','d04c119a-2b17-4055-9c88-3a4ef2837670',0,14,0),('28f20a9f-75aa-44f7-8a7a-dffa7e8e9ef8','2025-01-01','2025-12-31',6979.5,10,0,585.64,48,'Every 3 Months','end','Every Month','International company','Alexandria','2024-07-22',0,'','pdfs/المشروعات البترولية و الاستشارات الفنية - بتروجيت/عقد_صيانة_بتروجيت_2024.pdf','978c5b0e-3543-401a-8c1a-567a3a27e84f',0,14,0),('2a51dd30-c5de-4d96-bf5b-141f24aaee85','2024-06-01','2025-05-31',4991.25,10,1,0,48,'Every 6 Months','end','Every 2 Months','Millenium company','Cairo',NULL,0,'','pdfs/الشبة المصرية/الشبة_المصرية.pdf','d3be514f-aea0-4e15-ba1a-c2982f337137',0,14,0),('333bdaab-341b-4d03-a47e-08fdecae033d','2024-05-01','2025-04-30',7700,10,0,495,NULL,'Every 2 Months','start','Every 2 Months','Millenium company','Alexandria','2024-10-20',0,'','pdfs/دمياتك جروب للحاصلات الزراعية/عقد_صيانة_دمياتك_جروب_ابو_حمص_1-5-2023.pdf','4970333e-8ff1-4b61-bb71-3644a85d72ad',0,14,0),('354cbc58-3f23-4e52-bd0e-395d538faa4e','2025-01-01','2025-12-31',3025,10,1,0,48,'Every 6 Months','start','Every 3 Months','Millenium company','Cairo',NULL,0,'','pdfs/نهضة مصر/نهضة_مصر.pdf','3cf32c7b-572b-4a3a-9149-2ce98372c9fd',0,14,0),('3951705e-8d5d-41cd-afbd-bab4ed2b9971','2024-06-01','2025-05-31',7500,10,1,1000,72,'Every 6 Months','end','Every Month','Millenium company','Cairo',NULL,0,'','pdfs/أوريون للصناعات الغذائية/تجديد_عقد_شركة_اوريون_للصناعات_الغذائية_rjv2RUs.pdf','17595517-fe07-419a-a560-9b60c12ddd3d',0,14,0),('43de47c9-65df-4ed9-9b51-de830b1a1c54','2024-01-01','2024-12-31',20000,10,0,0,48,'Every 3 Months','end','Every Month','Millenium company','Cairo',NULL,0,'','pdfs/فيلكس بي/فيلكس_بي_فيلمز.pdf','538dc13a-62e2-4a03-86dd-97075e9c528b',0,14,0),('541cac7a-237c-48df-a8d0-08ac4629268b','2024-10-01','2025-09-30',3450,NULL,0,0,48,'Every 3 Months','end','Every 3 Months','Millenium company','Cairo',NULL,0,'','pdfs/لولو للاسوق التجارية الكبيري/لولو_للاسواق_التجارية_الكبري__التجمع_الاول__XDBM1we.pdf','cffa1627-3e9e-4ed9-8371-58bf7f12536d',0,14,0),('5dd6ffaa-8cc8-4b4e-9556-bda87c8f0429','2024-02-01','2025-01-31',235000,NULL,0,0,NULL,'Every 2 Months','end','Every 2 Months','Millenium company','Cairo',NULL,0,'','pdfs/المواني البرية/الهيئة_العامة_للمواني_البرية_والجافة_والمناطق_اللوجستية.pdf','1ee2fc9a-c107-4ff1-9a98-b7f63e497a05',0,14,0),('6b574e81-2a71-4504-90cc-19055eb1b414','2024-05-01','2025-04-30',7700,10,0,495,NULL,'Every 2 Months','start','Every 2 Months','Millenium company','Alexandria','2024-05-08',0,'','pdfs/دمياتك جروب للاستثمار و التنمية الزراعية/عقد_صيانة_دمياتك_جروب_ابو_السادات_1-5-2023.pdf','10cbb6c2-c48f-418f-b666-87c0bd347652',0,14,0),('7559880d-3d08-4ff5-91b6-1083beee985e','2024-05-12','2025-05-11',258557.5,10,1,2500,48,'Every Month','end','Every Month','Millenium company','Cairo',NULL,0,'','pdfs/القاهرة للدواجن CPC/القاهرة_للدواجن_SJP9H36.pdf','6998b90a-ce7a-4174-8800-8a188fe5cd6b',1,14,0),('b03c5a23-f48e-45d8-947c-c60ab4d7da59','2025-01-01','2025-12-31',7000,NULL,0,0,72,'Every 6 Months','end','Every 2 Months','International company','Cairo',NULL,0,'','pdfs/(تنكات) يونيليفر مشرق/يونيلفر_مشرق_للعناية_المنزلية__تانكات_.pdf','7f594804-5762-4e54-9d9d-ecf44d88d645',0,14,0),('bb4aa5d1-1f5b-4d4e-9b44-5595422b3290','2024-07-01','2025-06-30',60000,NULL,1,0,48,'Every Month','end','Every 2 Weeks','Millenium company','Cairo',NULL,0,'','pdfs/جمعيه الصناع/جمعية_الصناع_المصريون_pr6m0mD.pdf','07966658-2a08-4cf6-a449-da2ac2a4066a',0,14,0),('bea7e404-9982-4699-b2f2-dcda373ab5b8','2024-02-01','2025-01-31',20400,NULL,0,5100,48,'Every 3 Months','end','Every 2 Months','Millenium company','Cairo',NULL,0,'','pdfs/منجم السكري/منجم_السكري_مجدد_dn0PPYe.pdf','2c802603-538a-4684-a1f3-71e038faacf0',0,14,0),('da37c682-9218-4d68-bb57-c769e75f370a','2024-05-01','2025-04-30',6754.39,10,0,607.9,48,'Every 6 Months','start','Every 3 Months','International company','Alexandria','2024-03-04',NULL,'','pdfs/مزرعة الاندلس/عقد_صيانة_سيلاج_-2023.pdf','9c04fe2b-07df-4866-b957-79e3f0acb9fd',0,14,0),('e447002c-5820-4e0d-8ded-898629b4f454','2024-06-01','2025-05-31',11979,10,1,0,48,'Every 6 Months','end','Every Month','Millenium company','Cairo',NULL,0,'','pdfs/الاستثمارية الصناعية فل/شركة_الاستثمارات_الصناعية__فل_.pdf','c721f9f8-863f-4d1c-bebb-dbe5be0b4756',0,14,0),('f84ce7c4-c92f-4d1e-8b8e-547a63d51a45','2024-02-01','2025-01-31',4485,NULL,0,0,48,'Every 3 Months','end','Every 3 Months','Millenium company','Cairo',NULL,0,'','pdfs/لولو للاسوق التجارية الكبيري/لولو_للاسواق_التجاري_الكبير__التجمع_الخامس.pdf','cffa1627-3e9e-4ed9-8371-58bf7f12536d',0,14,0),('fa3b6290-f5b9-4ed6-ab05-92ac65dffb19','2024-06-01','2025-05-31',5200,10,1,1300,48,'Every 6 Months','end','Every 3 Months','Millenium company','Cairo',NULL,0,'','pdfs/المستثمر للصناعات الغذائية/المثتسمر_للصناعات_الغذائية_SYKwutI.pdf','aaa375b1-7c0c-4846-8254-bf5591bf2d21',0,14,0),('fd1505dd-86cf-4285-955c-42df5ca95aaa','2024-05-25','2025-05-24',10890,10,1,1500,48,'Every 6 Months','end','Every 2 Months','Millenium company','Cairo',NULL,0,'','pdfs/العربية الخليجية/العربية_الخليجية_لعصر_وتكرير_الزيوت_النباتية.pdf','cf80bdd9-f86c-42b2-a164-9fe2c9f87d58',0,14,0),('ff9cef3b-b1a3-40d4-bd2c-dabd1c5db1a5','2024-01-01','2024-12-31',3025,10,1,0,48,'Every 6 Months','start','Every 3 Months','Millenium company','Cairo',NULL,0,'','pdfs/نهضة مصر/نهضة_مصر.pdf','3cf32c7b-572b-4a3a-9149-2ce98372c9fd',0,14,1);
/*!40000 ALTER TABLE `contracts_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracts_emergencyvisits`
--

DROP TABLE IF EXISTS `contracts_emergencyvisits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contracts_emergencyvisits` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `request_visit_date` date NOT NULL,
  `actual_visit_date` date DEFAULT NULL,
  `price` double DEFAULT NULL,
  `done` tinyint(1) DEFAULT NULL,
  `comment` longtext,
  `image` varchar(100) DEFAULT NULL,
  `pdf` varchar(100) DEFAULT NULL,
  `contract_id` varchar(255) NOT NULL,
  `eng_id` bigint DEFAULT NULL,
  `site_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contracts_emergencyv_contract_id_906c1891_fk_contracts` (`contract_id`),
  KEY `contracts_emergencyv_eng_id_0b80b8b3_fk_contracts` (`eng_id`),
  KEY `contracts_emergencyvisits_site_id_315d44e9_fk_Clients_site_id` (`site_id`),
  CONSTRAINT `contracts_emergencyv_contract_id_906c1891_fk_contracts` FOREIGN KEY (`contract_id`) REFERENCES `contracts_contract` (`id`),
  CONSTRAINT `contracts_emergencyv_eng_id_0b80b8b3_fk_contracts` FOREIGN KEY (`eng_id`) REFERENCES `contracts_engineers` (`id`),
  CONSTRAINT `contracts_emergencyvisits_site_id_315d44e9_fk_Clients_site_id` FOREIGN KEY (`site_id`) REFERENCES `Clients_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts_emergencyvisits`
--

LOCK TABLES `contracts_emergencyvisits` WRITE;
/*!40000 ALTER TABLE `contracts_emergencyvisits` DISABLE KEYS */;
INSERT INTO `contracts_emergencyvisits` VALUES (1,'2024-12-29','2024-12-29',7500,0,'','','','145610f5-cd4d-4d10-800b-a71651c2a981',NULL,'04dd83d2-ffb0-463e-ac10-9f366bb8547a'),(2,'2025-01-14',NULL,1650,0,'','','','145610f5-cd4d-4d10-800b-a71651c2a981',NULL,'46855125-64b8-4167-848e-16fb6b09921e'),(3,'2025-01-15',NULL,2500,0,'','','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'69646144-3cbc-4b8f-b824-80da28665b29');
/*!40000 ALTER TABLE `contracts_emergencyvisits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracts_engineers`
--

DROP TABLE IF EXISTS `contracts_engineers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contracts_engineers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts_engineers`
--

LOCK TABLES `contracts_engineers` WRITE;
/*!40000 ALTER TABLE `contracts_engineers` DISABLE KEYS */;
INSERT INTO `contracts_engineers` VALUES (2,'خالد جمال'),(3,'نصر فتحي'),(4,'علي ابراهيم'),(5,'يحيي عبدالحفيظ'),(6,'كريم شاهين'),(7,'عبدالله محمد'),(8,'مصطفي محمد'),(9,'طارق'),(10,'محمد علي'),(11,'محمود حجازي'),(13,'م. محمود صادق'),(14,'أ. السيد محمود'),(15,'أ. محمد محمود'),(16,'أ. احمد محمود');
/*!40000 ALTER TABLE `contracts_engineers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracts_invoiceschedule`
--

DROP TABLE IF EXISTS `contracts_invoiceschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contracts_invoiceschedule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `invoice_date` date NOT NULL,
  `amount` double NOT NULL,
  `is_paid` tinyint(1) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `pdf` varchar(100) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `contract_id` varchar(255) NOT NULL,
  `sub_company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contracts_invoicesch_company_id_c990e92c_fk_Clients_c` (`company_id`),
  KEY `contracts_invoicesch_contract_id_33a31321_fk_contracts` (`contract_id`),
  KEY `contracts_invoicesch_sub_company_id_5189eb83_fk_Clients_s` (`sub_company_id`),
  CONSTRAINT `contracts_invoicesch_company_id_c990e92c_fk_Clients_c` FOREIGN KEY (`company_id`) REFERENCES `Clients_company` (`id`),
  CONSTRAINT `contracts_invoicesch_contract_id_33a31321_fk_contracts` FOREIGN KEY (`contract_id`) REFERENCES `contracts_contract` (`id`),
  CONSTRAINT `contracts_invoicesch_sub_company_id_5189eb83_fk_Clients_s` FOREIGN KEY (`sub_company_id`) REFERENCES `Clients_subcompany` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=869 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts_invoiceschedule`
--

LOCK TABLES `contracts_invoiceschedule` WRITE;
/*!40000 ALTER TABLE `contracts_invoiceschedule` DISABLE KEYS */;
INSERT INTO `contracts_invoiceschedule` VALUES (25,'2024-11-30',2600,1,'','invoices-pdfs/المستثمر للصناعات الغذائية/1009_-_المستثمر_للصناعات_الغذائية.pdf','aaa375b1-7c0c-4846-8254-bf5591bf2d21','fa3b6290-f5b9-4ed6-ab05-92ac65dffb19',NULL),(26,'2025-05-29',2600,1,'','invoices-pdfs/المستثمر للصناعات الغذائية/911-المستثمر.pdf','aaa375b1-7c0c-4846-8254-bf5591bf2d21','fa3b6290-f5b9-4ed6-ab05-92ac65dffb19',NULL),(31,'2024-03-31',39166.666666666664,1,'','invoices-pdfs/المواني البرية/891_-_المواني.pdf','1ee2fc9a-c107-4ff1-9a98-b7f63e497a05','5dd6ffaa-8cc8-4b4e-9556-bda87c8f0429',NULL),(32,'2024-05-30',39166.666666666664,1,'','invoices-pdfs/المواني البرية/921-المواني_البرية.pdf','1ee2fc9a-c107-4ff1-9a98-b7f63e497a05','5dd6ffaa-8cc8-4b4e-9556-bda87c8f0429',NULL),(33,'2024-07-29',39166.666666666664,1,'','invoices-pdfs/المواني البرية/948_-_المواني_البرية.pdf','1ee2fc9a-c107-4ff1-9a98-b7f63e497a05','5dd6ffaa-8cc8-4b4e-9556-bda87c8f0429',NULL),(34,'2024-09-28',39166.666666666664,1,'','invoices-pdfs/المواني البرية/981_-_المواني_البرية.pdf','1ee2fc9a-c107-4ff1-9a98-b7f63e497a05','5dd6ffaa-8cc8-4b4e-9556-bda87c8f0429',NULL),(35,'2024-11-27',39166.666666666664,1,'','invoices-pdfs/المواني البرية/1008_-_الهيئة_العامة_للمواني_البرية_شهر_11.pdf','1ee2fc9a-c107-4ff1-9a98-b7f63e497a05','5dd6ffaa-8cc8-4b4e-9556-bda87c8f0429',NULL),(36,'2025-01-26',39166.666666666664,0,'','','1ee2fc9a-c107-4ff1-9a98-b7f63e497a05','5dd6ffaa-8cc8-4b4e-9556-bda87c8f0429',NULL),(41,'2024-06-30',1512.5,1,'','invoices-pdfs/نهضة مصر/نهضة_مصر_للتصنيع_الزراعي_940.pdf','3cf32c7b-572b-4a3a-9149-2ce98372c9fd','ff9cef3b-b1a3-40d4-bd2c-dabd1c5db1a5',NULL),(42,'2024-12-29',1512.5,0,'','','3cf32c7b-572b-4a3a-9149-2ce98372c9fd','ff9cef3b-b1a3-40d4-bd2c-dabd1c5db1a5',NULL),(43,'2024-11-30',5989.5,1,'','invoices-pdfs/الاستثمارية الصناعية فل/1001_-_الاستثمارات_الصناعية.pdf','c721f9f8-863f-4d1c-bebb-dbe5be0b4756','e447002c-5820-4e0d-8ded-898629b4f454',NULL),(44,'2025-05-29',5989.5,0,'','','c721f9f8-863f-4d1c-bebb-dbe5be0b4756','e447002c-5820-4e0d-8ded-898629b4f454',NULL),(45,'2024-11-30',2495.625,1,'','invoices-pdfs/الشبة المصرية/1000_-_الشبة_المصرية.pdf','d3be514f-aea0-4e15-ba1a-c2982f337137','2a51dd30-c5de-4d96-bf5b-141f24aaee85',NULL),(46,'2025-05-29',2495.625,0,'','','d3be514f-aea0-4e15-ba1a-c2982f337137','2a51dd30-c5de-4d96-bf5b-141f24aaee85',NULL),(47,'2024-03-31',5000,1,'','invoices-pdfs/فيلكس بي/881-فيلكس_بي.pdf','538dc13a-62e2-4a03-86dd-97075e9c528b','43de47c9-65df-4ed9-9b51-de830b1a1c54',NULL),(48,'2024-06-29',5000,1,'','invoices-pdfs/فيلكس بي/971_-_فليكس_بي.pdf','538dc13a-62e2-4a03-86dd-97075e9c528b','43de47c9-65df-4ed9-9b51-de830b1a1c54',NULL),(49,'2024-09-28',5000,1,'','invoices-pdfs/فيلكس بي/971_-_فليكس_بي_f1J0dgf.pdf','538dc13a-62e2-4a03-86dd-97075e9c528b','43de47c9-65df-4ed9-9b51-de830b1a1c54',NULL),(50,'2024-12-27',5000,0,'','','538dc13a-62e2-4a03-86dd-97075e9c528b','43de47c9-65df-4ed9-9b51-de830b1a1c54',NULL),(51,'2024-11-24',5445,1,'','invoices-pdfs/العربية الخليجية/997_-_العربية_الخليجية_aPrQRG6.pdf','cf80bdd9-f86c-42b2-a164-9fe2c9f87d58','fd1505dd-86cf-4285-955c-42df5ca95aaa',NULL),(52,'2025-05-23',5445,0,'','','cf80bdd9-f86c-42b2-a164-9fe2c9f87d58','fd1505dd-86cf-4285-955c-42df5ca95aaa',NULL),(113,'2024-04-30',934.25,1,'','invoices-pdfs/لولو للاسوق التجارية الكبيري/880-اللولو_التجمع_الاول.pdf','cffa1627-3e9e-4ed9-8371-58bf7f12536d','1e89bfb8-e432-4de1-a7c8-1228e8474b14',NULL),(114,'2024-07-29',934.25,1,'','invoices-pdfs/لولو للاسوق التجارية الكبيري/977_-_التجمع_الاول__اللولو_ماركت.pdf','cffa1627-3e9e-4ed9-8371-58bf7f12536d','1e89bfb8-e432-4de1-a7c8-1228e8474b14',NULL),(115,'2024-10-28',934.25,1,'','invoices-pdfs/لولو للاسوق التجارية الكبيري/شهر_10_-_اللولو_ماركت_شيراتون.pdf','cffa1627-3e9e-4ed9-8371-58bf7f12536d','1e89bfb8-e432-4de1-a7c8-1228e8474b14',NULL),(116,'2025-01-27',934.25,0,'','','cffa1627-3e9e-4ed9-8371-58bf7f12536d','1e89bfb8-e432-4de1-a7c8-1228e8474b14',NULL),(117,'2024-04-30',1121.25,1,'','invoices-pdfs/لولو للاسوق التجارية الكبيري/894-اللولو_الخامس.pdf','cffa1627-3e9e-4ed9-8371-58bf7f12536d','f84ce7c4-c92f-4d1e-8b8e-547a63d51a45',NULL),(118,'2024-07-29',1121.25,1,'','invoices-pdfs/لولو للاسوق التجارية الكبيري/_اللو_ماركت_التجمع_الخامس_938.pdf','cffa1627-3e9e-4ed9-8371-58bf7f12536d','f84ce7c4-c92f-4d1e-8b8e-547a63d51a45',NULL),(119,'2024-10-28',1121.25,1,'','invoices-pdfs/لولو للاسوق التجارية الكبيري/983_-_اللولو_ماركت_التجمع_الخامس_1.pdf','cffa1627-3e9e-4ed9-8371-58bf7f12536d','f84ce7c4-c92f-4d1e-8b8e-547a63d51a45',NULL),(120,'2025-01-27',1121.25,0,'','','cffa1627-3e9e-4ed9-8371-58bf7f12536d','f84ce7c4-c92f-4d1e-8b8e-547a63d51a45',NULL),(125,'2024-12-31',862.5,0,'','','cffa1627-3e9e-4ed9-8371-58bf7f12536d','541cac7a-237c-48df-a8d0-08ac4629268b',NULL),(126,'2025-03-30',862.5,0,'','','cffa1627-3e9e-4ed9-8371-58bf7f12536d','541cac7a-237c-48df-a8d0-08ac4629268b',NULL),(127,'2025-06-29',862.5,0,'','','cffa1627-3e9e-4ed9-8371-58bf7f12536d','541cac7a-237c-48df-a8d0-08ac4629268b',NULL),(128,'2025-09-28',862.5,0,'','','cffa1627-3e9e-4ed9-8371-58bf7f12536d','541cac7a-237c-48df-a8d0-08ac4629268b',NULL),(141,'2024-07-31',5000,1,'','invoices-pdfs/جمعيه الصناع/936-جمعية_الصناع.pdf','07966658-2a08-4cf6-a449-da2ac2a4066a','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL),(142,'2024-08-30',5000,1,'','invoices-pdfs/جمعيه الصناع/960_-_جمعية_الصناع_المصريون.pdf','07966658-2a08-4cf6-a449-da2ac2a4066a','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL),(143,'2024-09-29',5000,1,'','invoices-pdfs/جمعيه الصناع/972_-_جمعية_الصناع_المصريون.pdf','07966658-2a08-4cf6-a449-da2ac2a4066a','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL),(144,'2024-10-28',5000,1,'','invoices-pdfs/جمعيه الصناع/982_-_جمعية_الصناع_المصريون.pdf','07966658-2a08-4cf6-a449-da2ac2a4066a','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL),(145,'2024-11-27',5000,0,'','','07966658-2a08-4cf6-a449-da2ac2a4066a','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL),(146,'2024-12-26',5000,0,'','','07966658-2a08-4cf6-a449-da2ac2a4066a','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL),(147,'2025-01-25',5000,0,'','','07966658-2a08-4cf6-a449-da2ac2a4066a','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL),(148,'2025-02-24',5000,0,'','','07966658-2a08-4cf6-a449-da2ac2a4066a','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL),(149,'2025-03-23',5000,0,'','','07966658-2a08-4cf6-a449-da2ac2a4066a','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL),(150,'2025-04-22',5000,0,'','','07966658-2a08-4cf6-a449-da2ac2a4066a','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL),(151,'2025-05-21',5000,0,'','','07966658-2a08-4cf6-a449-da2ac2a4066a','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL),(152,'2025-06-20',5000,0,'','','07966658-2a08-4cf6-a449-da2ac2a4066a','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL),(153,'2024-11-30',3750,1,'','invoices-pdfs/أوريون للصناعات الغذائية/شهر11_-_جمعية_الصناع.pdf','17595517-fe07-419a-a560-9b60c12ddd3d','3951705e-8d5d-41cd-afbd-bab4ed2b9971',NULL),(154,'2025-05-29',3750,0,'','','17595517-fe07-419a-a560-9b60c12ddd3d','3951705e-8d5d-41cd-afbd-bab4ed2b9971',NULL),(207,'2024-06-30',1000,1,'','invoices-pdfs/ديورافيت ايجبت/925-ديرافيت.pdf','d04c119a-2b17-4055-9c88-3a4ef2837670','202cfd68-6c89-45a9-92f0-f6462526f826',NULL),(208,'2024-09-29',1000,1,'','invoices-pdfs/ديورافيت ايجبت/970_-_ديورفيت.pdf','d04c119a-2b17-4055-9c88-3a4ef2837670','202cfd68-6c89-45a9-92f0-f6462526f826',NULL),(209,'2024-12-28',1000,0,'','','d04c119a-2b17-4055-9c88-3a4ef2837670','202cfd68-6c89-45a9-92f0-f6462526f826',NULL),(210,'2025-03-27',1000,0,'','','d04c119a-2b17-4055-9c88-3a4ef2837670','202cfd68-6c89-45a9-92f0-f6462526f826',NULL),(211,'2024-04-30',5100,1,'','invoices-pdfs/منجم السكري/السكري_لمناجم_الذهب_897_1.pdf','2c802603-538a-4684-a1f3-71e038faacf0','bea7e404-9982-4699-b2f2-dcda373ab5b8',NULL),(212,'2024-07-29',5100,1,'','invoices-pdfs/منجم السكري/السكري_لمناجم_الذهب955.pdf','2c802603-538a-4684-a1f3-71e038faacf0','bea7e404-9982-4699-b2f2-dcda373ab5b8',NULL),(213,'2024-10-28',5100,1,'','invoices-pdfs/منجم السكري/993_-_السكري_لمناجم_الذهب.pdf','2c802603-538a-4684-a1f3-71e038faacf0','bea7e404-9982-4699-b2f2-dcda373ab5b8',NULL),(214,'2025-01-27',5100,0,'','','2c802603-538a-4684-a1f3-71e038faacf0','bea7e404-9982-4699-b2f2-dcda373ab5b8',NULL),(215,'2024-04-30',13272.28,1,'','invoices-pdfs/مصر للاسمنت ( بيتون)/904-مصر_بيتون_-عقد_صيانة_nfwaOQH.pdf','876b605e-3ca1-446f-a601-cee1ce8e5264','145610f5-cd4d-4d10-800b-a71651c2a981',NULL),(216,'2024-06-30',13272.27,1,'','invoices-pdfs/مصر للاسمنت ( بيتون)/945_مصر_للاسمنت_بيتون_Z2MiaQ9.pdf','876b605e-3ca1-446f-a601-cee1ce8e5264','145610f5-cd4d-4d10-800b-a71651c2a981',NULL),(217,'2024-08-30',13272.27,1,'','invoices-pdfs/مصر للاسمنت ( بيتون)/966_-_مصر_للاسمنت_DOhzryb.pdf','876b605e-3ca1-446f-a601-cee1ce8e5264','145610f5-cd4d-4d10-800b-a71651c2a981',NULL),(218,'2024-10-30',13272.27,1,'','invoices-pdfs/مصر للاسمنت ( بيتون)/986_-_مصر_للاسمنت_بيتون.pdf','876b605e-3ca1-446f-a601-cee1ce8e5264','145610f5-cd4d-4d10-800b-a71651c2a981',NULL),(219,'2024-12-30',13272.27,0,'','','876b605e-3ca1-446f-a601-cee1ce8e5264','145610f5-cd4d-4d10-800b-a71651c2a981',NULL),(220,'2025-02-28',13272.27,0,'','','876b605e-3ca1-446f-a601-cee1ce8e5264','145610f5-cd4d-4d10-800b-a71651c2a981',NULL),(281,'2024-05-01',1283.33,0,'','','4970333e-8ff1-4b61-bb71-3644a85d72ad','333bdaab-341b-4d03-a47e-08fdecae033d',NULL),(282,'2024-07-01',1283.33,0,'','','4970333e-8ff1-4b61-bb71-3644a85d72ad','333bdaab-341b-4d03-a47e-08fdecae033d',NULL),(283,'2024-09-01',1283.33,0,'','','4970333e-8ff1-4b61-bb71-3644a85d72ad','333bdaab-341b-4d03-a47e-08fdecae033d',NULL),(284,'2024-11-01',1283.33,0,'','','4970333e-8ff1-4b61-bb71-3644a85d72ad','333bdaab-341b-4d03-a47e-08fdecae033d',NULL),(285,'2025-01-01',1283.33,0,'','','4970333e-8ff1-4b61-bb71-3644a85d72ad','333bdaab-341b-4d03-a47e-08fdecae033d',NULL),(286,'2025-03-01',1283.33,0,'','','4970333e-8ff1-4b61-bb71-3644a85d72ad','333bdaab-341b-4d03-a47e-08fdecae033d',NULL),(805,'2024-06-11',2519.28,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','0376b350-82ac-4722-9f66-f89716ac7f16'),(806,'2024-06-11',7557.83,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','46ae48e9-a533-46bb-b638-72a3a8e4f914'),(807,'2024-06-11',7557.83,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','7240208c-17ea-4e83-8c4e-f76303f9b56f'),(808,'2024-06-11',5038.56,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','76315566-389e-469d-9145-d27f1dafc897'),(809,'2024-07-10',2519.28,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','0376b350-82ac-4722-9f66-f89716ac7f16'),(810,'2024-07-10',7557.83,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','46ae48e9-a533-46bb-b638-72a3a8e4f914'),(811,'2024-07-10',7557.83,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','7240208c-17ea-4e83-8c4e-f76303f9b56f'),(812,'2024-07-10',5038.56,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','76315566-389e-469d-9145-d27f1dafc897'),(813,'2024-08-09',2519.28,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','0376b350-82ac-4722-9f66-f89716ac7f16'),(814,'2024-08-09',7557.83,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','46ae48e9-a533-46bb-b638-72a3a8e4f914'),(815,'2024-08-09',7557.83,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','7240208c-17ea-4e83-8c4e-f76303f9b56f'),(816,'2024-08-09',5038.56,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','76315566-389e-469d-9145-d27f1dafc897'),(817,'2024-09-08',2519.28,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','0376b350-82ac-4722-9f66-f89716ac7f16'),(818,'2024-09-08',7557.83,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','46ae48e9-a533-46bb-b638-72a3a8e4f914'),(819,'2024-09-08',7557.83,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','7240208c-17ea-4e83-8c4e-f76303f9b56f'),(820,'2024-09-08',5038.56,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','76315566-389e-469d-9145-d27f1dafc897'),(821,'2024-10-07',2519.28,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','0376b350-82ac-4722-9f66-f89716ac7f16'),(822,'2024-10-07',7557.83,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','46ae48e9-a533-46bb-b638-72a3a8e4f914'),(823,'2024-10-07',7557.83,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','7240208c-17ea-4e83-8c4e-f76303f9b56f'),(824,'2024-10-07',5038.56,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','76315566-389e-469d-9145-d27f1dafc897'),(825,'2024-11-06',2519.28,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','0376b350-82ac-4722-9f66-f89716ac7f16'),(826,'2024-11-06',7557.83,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','46ae48e9-a533-46bb-b638-72a3a8e4f914'),(827,'2024-11-06',7557.83,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','7240208c-17ea-4e83-8c4e-f76303f9b56f'),(828,'2024-11-06',5038.56,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','76315566-389e-469d-9145-d27f1dafc897'),(829,'2024-12-05',2519.28,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','0376b350-82ac-4722-9f66-f89716ac7f16'),(830,'2024-12-05',7557.83,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','46ae48e9-a533-46bb-b638-72a3a8e4f914'),(831,'2024-12-05',7557.83,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','7240208c-17ea-4e83-8c4e-f76303f9b56f'),(832,'2024-12-05',5038.56,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','76315566-389e-469d-9145-d27f1dafc897'),(833,'2025-01-04',2519.28,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','0376b350-82ac-4722-9f66-f89716ac7f16'),(834,'2025-01-04',7557.83,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','46ae48e9-a533-46bb-b638-72a3a8e4f914'),(835,'2025-01-04',7557.83,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','7240208c-17ea-4e83-8c4e-f76303f9b56f'),(836,'2025-01-04',5038.56,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','76315566-389e-469d-9145-d27f1dafc897'),(837,'2025-02-03',2519.28,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','0376b350-82ac-4722-9f66-f89716ac7f16'),(838,'2025-02-03',7557.83,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','46ae48e9-a533-46bb-b638-72a3a8e4f914'),(839,'2025-02-03',7557.83,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','7240208c-17ea-4e83-8c4e-f76303f9b56f'),(840,'2025-02-03',5038.56,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','76315566-389e-469d-9145-d27f1dafc897'),(841,'2025-03-02',2519.28,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','0376b350-82ac-4722-9f66-f89716ac7f16'),(842,'2025-03-02',7557.83,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','46ae48e9-a533-46bb-b638-72a3a8e4f914'),(843,'2025-03-02',7557.83,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','7240208c-17ea-4e83-8c4e-f76303f9b56f'),(844,'2025-03-02',5038.56,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','76315566-389e-469d-9145-d27f1dafc897'),(845,'2025-04-01',2519.28,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','0376b350-82ac-4722-9f66-f89716ac7f16'),(846,'2025-04-01',7557.83,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','46ae48e9-a533-46bb-b638-72a3a8e4f914'),(847,'2025-04-01',7557.83,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','7240208c-17ea-4e83-8c4e-f76303f9b56f'),(848,'2025-04-01',5038.56,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','76315566-389e-469d-9145-d27f1dafc897'),(849,'2025-04-30',2519.28,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','0376b350-82ac-4722-9f66-f89716ac7f16'),(850,'2025-04-30',7557.83,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','46ae48e9-a533-46bb-b638-72a3a8e4f914'),(851,'2025-04-30',7557.83,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','7240208c-17ea-4e83-8c4e-f76303f9b56f'),(852,'2025-04-30',5038.56,0,'','','6998b90a-ce7a-4174-8800-8a188fe5cd6b','7559880d-3d08-4ff5-91b6-1083beee985e','76315566-389e-469d-9145-d27f1dafc897'),(853,'2025-06-30',3500,0,'','','7f594804-5762-4e54-9d9d-ecf44d88d645','b03c5a23-f48e-45d8-947c-c60ab4d7da59',NULL),(854,'2025-12-29',3500,0,'','','7f594804-5762-4e54-9d9d-ecf44d88d645','b03c5a23-f48e-45d8-947c-c60ab4d7da59',NULL),(855,'2025-01-01',1512.5,0,'','','3cf32c7b-572b-4a3a-9149-2ce98372c9fd','354cbc58-3f23-4e52-bd0e-395d538faa4e',NULL),(856,'2025-07-01',1512.5,0,'','','3cf32c7b-572b-4a3a-9149-2ce98372c9fd','354cbc58-3f23-4e52-bd0e-395d538faa4e',NULL),(857,'2025-03-31',1744.88,0,'','','978c5b0e-3543-401a-8c1a-567a3a27e84f','28f20a9f-75aa-44f7-8a7a-dffa7e8e9ef8',NULL),(858,'2025-06-29',1744.88,0,'','','978c5b0e-3543-401a-8c1a-567a3a27e84f','28f20a9f-75aa-44f7-8a7a-dffa7e8e9ef8',NULL),(859,'2025-09-28',1744.88,0,'','','978c5b0e-3543-401a-8c1a-567a3a27e84f','28f20a9f-75aa-44f7-8a7a-dffa7e8e9ef8',NULL),(860,'2025-12-27',1744.88,0,'','','978c5b0e-3543-401a-8c1a-567a3a27e84f','28f20a9f-75aa-44f7-8a7a-dffa7e8e9ef8',NULL),(861,'2024-05-01',3377.2,0,'','','9c04fe2b-07df-4866-b957-79e3f0acb9fd','da37c682-9218-4d68-bb57-c769e75f370a',NULL),(862,'2024-11-01',3377.2,0,'','','9c04fe2b-07df-4866-b957-79e3f0acb9fd','da37c682-9218-4d68-bb57-c769e75f370a',NULL),(863,'2024-05-01',1283.33,0,'','','10cbb6c2-c48f-418f-b666-87c0bd347652','6b574e81-2a71-4504-90cc-19055eb1b414',NULL),(864,'2024-07-01',1283.33,0,'','','10cbb6c2-c48f-418f-b666-87c0bd347652','6b574e81-2a71-4504-90cc-19055eb1b414',NULL),(865,'2024-09-01',1283.33,0,'','','10cbb6c2-c48f-418f-b666-87c0bd347652','6b574e81-2a71-4504-90cc-19055eb1b414',NULL),(866,'2024-11-01',1283.33,0,'','','10cbb6c2-c48f-418f-b666-87c0bd347652','6b574e81-2a71-4504-90cc-19055eb1b414',NULL),(867,'2025-01-01',1283.33,0,'','','10cbb6c2-c48f-418f-b666-87c0bd347652','6b574e81-2a71-4504-90cc-19055eb1b414',NULL),(868,'2025-03-01',1283.33,0,'','','10cbb6c2-c48f-418f-b666-87c0bd347652','6b574e81-2a71-4504-90cc-19055eb1b414',NULL);
/*!40000 ALTER TABLE `contracts_invoiceschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracts_maintenanceschedule`
--

DROP TABLE IF EXISTS `contracts_maintenanceschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contracts_maintenanceschedule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `visit_date` date NOT NULL,
  `due_date` date DEFAULT NULL,
  `completed_date` date DEFAULT NULL,
  `done` tinyint(1) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `pdf` varchar(100) DEFAULT NULL,
  `contract_id` varchar(255) NOT NULL,
  `eng_id` bigint DEFAULT NULL,
  `site_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contracts_maintenanc_contract_id_4b7c061a_fk_contracts` (`contract_id`),
  KEY `contracts_maintenanc_eng_id_3b884cec_fk_contracts` (`eng_id`),
  KEY `contracts_maintenanc_site_id_0db70cba_fk_Clients_s` (`site_id`),
  CONSTRAINT `contracts_maintenanc_contract_id_4b7c061a_fk_contracts` FOREIGN KEY (`contract_id`) REFERENCES `contracts_contract` (`id`),
  CONSTRAINT `contracts_maintenanc_eng_id_3b884cec_fk_contracts` FOREIGN KEY (`eng_id`) REFERENCES `contracts_engineers` (`id`),
  CONSTRAINT `contracts_maintenanc_site_id_0db70cba_fk_Clients_s` FOREIGN KEY (`site_id`) REFERENCES `Clients_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=649 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts_maintenanceschedule`
--

LOCK TABLES `contracts_maintenanceschedule` WRITE;
/*!40000 ALTER TABLE `contracts_maintenanceschedule` DISABLE KEYS */;
INSERT INTO `contracts_maintenanceschedule` VALUES (37,'2024-06-01','2024-09-01','2024-06-10',1,'','maintenance-visits-pdfs/المستثمر للصناعات الغذائية/10-6_JehaoaY.pdf','fa3b6290-f5b9-4ed6-ab05-92ac65dffb19',8,'f356fc0a-e9ff-4b79-b01c-808c7ba205fc'),(38,'2024-09-01','2024-12-01','2024-09-08',1,'','maintenance-visits-pdfs/المستثمر للصناعات الغذائية/8-9.pdf','fa3b6290-f5b9-4ed6-ab05-92ac65dffb19',9,'f356fc0a-e9ff-4b79-b01c-808c7ba205fc'),(39,'2024-12-01','2025-03-01','2024-03-13',1,'','maintenance-visits-pdfs/المستثمر للصناعات الغذائية/13-3_kfVeYzk.pdf','fa3b6290-f5b9-4ed6-ab05-92ac65dffb19',11,'f356fc0a-e9ff-4b79-b01c-808c7ba205fc'),(40,'2025-03-01','2025-05-31','2024-05-13',1,'','maintenance-visits-pdfs/المستثمر للصناعات الغذائية/13-5_zIHPiUQ.pdf','fa3b6290-f5b9-4ed6-ab05-92ac65dffb19',5,'f356fc0a-e9ff-4b79-b01c-808c7ba205fc'),(45,'2024-02-01','2024-04-01','2024-02-22',1,'','maintenance-visits-pdfs/المواني البرية/22-2.pdf','5dd6ffaa-8cc8-4b4e-9556-bda87c8f0429',11,'258f3f4f-f784-4e77-aab3-bb2c0752f350'),(46,'2024-02-01','2024-04-01','2024-03-03',1,'','maintenance-visits-pdfs/المواني البرية/3-3.pdf','5dd6ffaa-8cc8-4b4e-9556-bda87c8f0429',2,'8dd050e3-6658-4163-b6a9-f74798472e5b'),(47,'2024-02-01','2024-04-01','2024-02-21',1,'','maintenance-visits-pdfs/المواني البرية/21-2.pdf','5dd6ffaa-8cc8-4b4e-9556-bda87c8f0429',11,'a03fd2fb-7d0a-4a36-8e0e-7a963a14c3f4'),(48,'2024-02-01','2024-04-01','2024-02-03',1,'','maintenance-visits-pdfs/المواني البرية/2-3.pdf','5dd6ffaa-8cc8-4b4e-9556-bda87c8f0429',2,'efd10d1a-b666-4054-ab17-e6da5e2931ee'),(49,'2024-04-01','2024-06-01','2024-04-18',1,'','maintenance-visits-pdfs/المواني البرية/18-4.pdf','5dd6ffaa-8cc8-4b4e-9556-bda87c8f0429',11,'258f3f4f-f784-4e77-aab3-bb2c0752f350'),(50,'2024-04-01','2024-06-01','2024-05-01',1,'','maintenance-visits-pdfs/المواني البرية/1-5.pdf','5dd6ffaa-8cc8-4b4e-9556-bda87c8f0429',11,'8dd050e3-6658-4163-b6a9-f74798472e5b'),(51,'2024-04-01','2024-06-01','2024-04-17',1,'','maintenance-visits-pdfs/المواني البرية/17-4.pdf','5dd6ffaa-8cc8-4b4e-9556-bda87c8f0429',11,'a03fd2fb-7d0a-4a36-8e0e-7a963a14c3f4'),(52,'2024-04-01','2024-06-01','2024-05-02',1,'','maintenance-visits-pdfs/المواني البرية/2-5.pdf','5dd6ffaa-8cc8-4b4e-9556-bda87c8f0429',11,'efd10d1a-b666-4054-ab17-e6da5e2931ee'),(53,'2024-06-01','2024-08-01','2024-06-12',1,'','maintenance-visits-pdfs/المواني البرية/12-6.pdf','5dd6ffaa-8cc8-4b4e-9556-bda87c8f0429',3,'258f3f4f-f784-4e77-aab3-bb2c0752f350'),(54,'2024-06-01','2024-08-01','2024-07-02',1,'','maintenance-visits-pdfs/المواني البرية/2-7.pdf','5dd6ffaa-8cc8-4b4e-9556-bda87c8f0429',2,'8dd050e3-6658-4163-b6a9-f74798472e5b'),(55,'2024-06-01','2024-08-01','2024-06-11',1,'','maintenance-visits-pdfs/المواني البرية/11-6_gtSlKfq.pdf','5dd6ffaa-8cc8-4b4e-9556-bda87c8f0429',3,'a03fd2fb-7d0a-4a36-8e0e-7a963a14c3f4'),(56,'2024-06-01','2024-08-01','2024-07-01',1,'','maintenance-visits-pdfs/المواني البرية/1-7.pdf','5dd6ffaa-8cc8-4b4e-9556-bda87c8f0429',2,'efd10d1a-b666-4054-ab17-e6da5e2931ee'),(57,'2024-08-01','2024-10-01','2024-08-20',1,'','maintenance-visits-pdfs/المواني البرية/20-8.pdf','5dd6ffaa-8cc8-4b4e-9556-bda87c8f0429',3,'258f3f4f-f784-4e77-aab3-bb2c0752f350'),(58,'2024-08-01','2024-10-01','2024-09-03',1,'','maintenance-visits-pdfs/المواني البرية/3-9.pdf','5dd6ffaa-8cc8-4b4e-9556-bda87c8f0429',3,'8dd050e3-6658-4163-b6a9-f74798472e5b'),(59,'2024-08-01','2024-10-01','2024-08-21',1,'','maintenance-visits-pdfs/المواني البرية/21-8.pdf','5dd6ffaa-8cc8-4b4e-9556-bda87c8f0429',3,'a03fd2fb-7d0a-4a36-8e0e-7a963a14c3f4'),(60,'2024-08-01','2024-10-01','2024-09-02',1,'','maintenance-visits-pdfs/المواني البرية/2-9.pdf','5dd6ffaa-8cc8-4b4e-9556-bda87c8f0429',3,'efd10d1a-b666-4054-ab17-e6da5e2931ee'),(61,'2024-10-01','2024-12-01','2024-10-20',1,'','maintenance-visits-pdfs/المواني البرية/20-10.pdf','5dd6ffaa-8cc8-4b4e-9556-bda87c8f0429',3,'258f3f4f-f784-4e77-aab3-bb2c0752f350'),(62,'2024-10-01','2024-12-01','2024-11-03',1,'','maintenance-visits-pdfs/المواني البرية/3-11.pdf','5dd6ffaa-8cc8-4b4e-9556-bda87c8f0429',2,'8dd050e3-6658-4163-b6a9-f74798472e5b'),(63,'2024-10-01','2024-12-01','2024-10-21',1,'','maintenance-visits-pdfs/المواني البرية/21-8_v5b65gn.pdf','5dd6ffaa-8cc8-4b4e-9556-bda87c8f0429',3,'a03fd2fb-7d0a-4a36-8e0e-7a963a14c3f4'),(64,'2024-10-01','2024-12-01','2024-11-02',1,'','maintenance-visits-pdfs/المواني البرية/2-11.pdf','5dd6ffaa-8cc8-4b4e-9556-bda87c8f0429',2,'efd10d1a-b666-4054-ab17-e6da5e2931ee'),(65,'2024-12-01','2025-01-31',NULL,0,'','','5dd6ffaa-8cc8-4b4e-9556-bda87c8f0429',NULL,'258f3f4f-f784-4e77-aab3-bb2c0752f350'),(67,'2024-12-01','2025-01-31',NULL,0,'','','5dd6ffaa-8cc8-4b4e-9556-bda87c8f0429',NULL,'a03fd2fb-7d0a-4a36-8e0e-7a963a14c3f4'),(68,'2024-12-01','2025-01-31',NULL,0,'','','5dd6ffaa-8cc8-4b4e-9556-bda87c8f0429',NULL,'efd10d1a-b666-4054-ab17-e6da5e2931ee'),(81,'2024-01-01','2024-04-01','2024-03-10',1,'','maintenance-visits-pdfs/نهضة مصر/١٠-٣.pdf','ff9cef3b-b1a3-40d4-bd2c-dabd1c5db1a5',2,'0eb01ef2-187c-4108-a7fa-a735c72878e8'),(82,'2024-04-01','2024-07-01',NULL,0,'','','ff9cef3b-b1a3-40d4-bd2c-dabd1c5db1a5',NULL,'0eb01ef2-187c-4108-a7fa-a735c72878e8'),(83,'2024-07-01','2024-10-01','2024-08-18',1,'','maintenance-visits-pdfs/نهضة مصر/18-8.pdf','ff9cef3b-b1a3-40d4-bd2c-dabd1c5db1a5',2,'0eb01ef2-187c-4108-a7fa-a735c72878e8'),(84,'2024-10-01','2024-12-31',NULL,0,'','','ff9cef3b-b1a3-40d4-bd2c-dabd1c5db1a5',NULL,'0eb01ef2-187c-4108-a7fa-a735c72878e8'),(85,'2024-06-01','2024-07-01','2024-06-06',1,'','maintenance-visits-pdfs/الاستثمارية الصناعية فل/26-6.pdf','e447002c-5820-4e0d-8ded-898629b4f454',NULL,'603b4373-4a40-44d7-86a8-1a01dc8a1e20'),(86,'2024-07-01','2024-08-01','2024-07-30',1,'','maintenance-visits-pdfs/الاستثمارية الصناعية فل/30-7.pdf','e447002c-5820-4e0d-8ded-898629b4f454',2,'603b4373-4a40-44d7-86a8-1a01dc8a1e20'),(87,'2024-08-01','2024-09-01','2024-08-19',1,'','maintenance-visits-pdfs/الاستثمارية الصناعية فل/19-8.pdf','e447002c-5820-4e0d-8ded-898629b4f454',2,'603b4373-4a40-44d7-86a8-1a01dc8a1e20'),(88,'2024-09-01','2024-10-01','2024-09-04',1,'','maintenance-visits-pdfs/الاستثمارية الصناعية فل/4-9.pdf','e447002c-5820-4e0d-8ded-898629b4f454',5,'603b4373-4a40-44d7-86a8-1a01dc8a1e20'),(89,'2024-10-01','2024-11-01','2024-10-16',1,'','maintenance-visits-pdfs/الاستثمارية الصناعية فل/16-10.pdf','e447002c-5820-4e0d-8ded-898629b4f454',2,'603b4373-4a40-44d7-86a8-1a01dc8a1e20'),(90,'2024-11-01','2024-12-01','2024-11-07',1,'','maintenance-visits-pdfs/الاستثمارية الصناعية فل/7-11.pdf','e447002c-5820-4e0d-8ded-898629b4f454',2,'603b4373-4a40-44d7-86a8-1a01dc8a1e20'),(91,'2024-12-01','2025-01-01',NULL,0,'','','e447002c-5820-4e0d-8ded-898629b4f454',NULL,'603b4373-4a40-44d7-86a8-1a01dc8a1e20'),(92,'2025-01-01','2025-02-01',NULL,0,'','','e447002c-5820-4e0d-8ded-898629b4f454',NULL,'603b4373-4a40-44d7-86a8-1a01dc8a1e20'),(93,'2025-02-01','2025-03-01',NULL,0,'','','e447002c-5820-4e0d-8ded-898629b4f454',NULL,'603b4373-4a40-44d7-86a8-1a01dc8a1e20'),(94,'2025-03-01','2025-04-01',NULL,0,'','','e447002c-5820-4e0d-8ded-898629b4f454',NULL,'603b4373-4a40-44d7-86a8-1a01dc8a1e20'),(95,'2025-04-01','2025-05-01',NULL,0,'','','e447002c-5820-4e0d-8ded-898629b4f454',NULL,'603b4373-4a40-44d7-86a8-1a01dc8a1e20'),(96,'2025-05-01','2025-05-31',NULL,0,'','','e447002c-5820-4e0d-8ded-898629b4f454',NULL,'603b4373-4a40-44d7-86a8-1a01dc8a1e20'),(97,'2024-06-01','2024-08-01','2024-06-04',1,'','maintenance-visits-pdfs/الشبة المصرية/2-6.pdf','2a51dd30-c5de-4d96-bf5b-141f24aaee85',3,'7ec3495b-150d-46c6-afe7-5686f322b181'),(98,'2024-08-01','2024-10-01','2024-09-08',1,'','maintenance-visits-pdfs/الشبة المصرية/8-9.pdf','2a51dd30-c5de-4d96-bf5b-141f24aaee85',3,'7ec3495b-150d-46c6-afe7-5686f322b181'),(99,'2024-10-01','2024-12-01',NULL,0,'','','2a51dd30-c5de-4d96-bf5b-141f24aaee85',NULL,'7ec3495b-150d-46c6-afe7-5686f322b181'),(100,'2024-12-01','2025-02-01',NULL,0,'','','2a51dd30-c5de-4d96-bf5b-141f24aaee85',NULL,'7ec3495b-150d-46c6-afe7-5686f322b181'),(101,'2025-02-01','2025-04-01',NULL,0,'','','2a51dd30-c5de-4d96-bf5b-141f24aaee85',NULL,'7ec3495b-150d-46c6-afe7-5686f322b181'),(102,'2025-04-01','2025-05-31',NULL,0,'','','2a51dd30-c5de-4d96-bf5b-141f24aaee85',NULL,'7ec3495b-150d-46c6-afe7-5686f322b181'),(103,'2024-01-01','2024-02-01','2024-01-08',1,'','maintenance-visits-pdfs/فيلكس بي/8-1.pdf','43de47c9-65df-4ed9-9b51-de830b1a1c54',7,'41d883ca-d4e8-4798-85cc-a1efc9470e39'),(104,'2024-02-01','2024-03-01','2024-02-04',1,'','maintenance-visits-pdfs/فيلكس بي/4-2.pdf','43de47c9-65df-4ed9-9b51-de830b1a1c54',11,'41d883ca-d4e8-4798-85cc-a1efc9470e39'),(105,'2024-03-01','2024-04-01','2024-03-31',1,'','maintenance-visits-pdfs/فيلكس بي/زيارة_دورية__31-3.pdf','43de47c9-65df-4ed9-9b51-de830b1a1c54',3,'41d883ca-d4e8-4798-85cc-a1efc9470e39'),(106,'2024-04-01','2024-05-01','2024-04-29',1,'','maintenance-visits-pdfs/فيلكس بي/29-4.pdf','43de47c9-65df-4ed9-9b51-de830b1a1c54',3,'41d883ca-d4e8-4798-85cc-a1efc9470e39'),(107,'2024-05-01','2024-06-01','2024-05-16',1,'','maintenance-visits-pdfs/فيلكس بي/16-5.pdf','43de47c9-65df-4ed9-9b51-de830b1a1c54',11,'41d883ca-d4e8-4798-85cc-a1efc9470e39'),(108,'2024-06-01','2024-07-01','2024-06-26',1,'','maintenance-visits-pdfs/فيلكس بي/24-6.pdf','43de47c9-65df-4ed9-9b51-de830b1a1c54',8,'41d883ca-d4e8-4798-85cc-a1efc9470e39'),(109,'2024-07-01','2024-08-01','2024-08-14',1,'','maintenance-visits-pdfs/فيلكس بي/14-8.pdf','43de47c9-65df-4ed9-9b51-de830b1a1c54',8,'41d883ca-d4e8-4798-85cc-a1efc9470e39'),(110,'2024-08-01','2024-09-01','2024-08-29',1,'','maintenance-visits-pdfs/فيلكس بي/29-8.pdf','43de47c9-65df-4ed9-9b51-de830b1a1c54',5,'41d883ca-d4e8-4798-85cc-a1efc9470e39'),(111,'2024-09-01','2024-10-01','2024-09-29',1,'','maintenance-visits-pdfs/فيلكس بي/29-9.pdf','43de47c9-65df-4ed9-9b51-de830b1a1c54',NULL,'41d883ca-d4e8-4798-85cc-a1efc9470e39'),(112,'2024-10-01','2024-11-01','2024-10-24',1,'','maintenance-visits-pdfs/فيلكس بي/24-10.pdf','43de47c9-65df-4ed9-9b51-de830b1a1c54',2,'41d883ca-d4e8-4798-85cc-a1efc9470e39'),(113,'2024-11-01','2024-12-01',NULL,0,'','','43de47c9-65df-4ed9-9b51-de830b1a1c54',NULL,'41d883ca-d4e8-4798-85cc-a1efc9470e39'),(114,'2024-12-01','2024-12-31',NULL,0,'','','43de47c9-65df-4ed9-9b51-de830b1a1c54',NULL,'41d883ca-d4e8-4798-85cc-a1efc9470e39'),(115,'2024-05-25','2024-07-25','2024-07-21',1,'','maintenance-visits-pdfs/العربية الخليجية/٢١-٧.pdf','fd1505dd-86cf-4285-955c-42df5ca95aaa',3,'c69d5ddc-116c-4c07-b093-17d4c00c8e8c'),(116,'2024-07-25','2024-09-25','2024-08-05',1,'','maintenance-visits-pdfs/العربية الخليجية/٥-٨.pdf','fd1505dd-86cf-4285-955c-42df5ca95aaa',3,'c69d5ddc-116c-4c07-b093-17d4c00c8e8c'),(117,'2024-09-25','2024-11-25','2024-11-05',1,'','maintenance-visits-pdfs/العربية الخليجية/٥-١١.pdf','fd1505dd-86cf-4285-955c-42df5ca95aaa',2,'c69d5ddc-116c-4c07-b093-17d4c00c8e8c'),(118,'2024-11-25','2025-01-25','2024-11-19',1,'','maintenance-visits-pdfs/العربية الخليجية/العربية_الخليجية_شهر_11.pdf','fd1505dd-86cf-4285-955c-42df5ca95aaa',2,'c69d5ddc-116c-4c07-b093-17d4c00c8e8c'),(119,'2025-01-25','2025-03-25',NULL,0,'','','fd1505dd-86cf-4285-955c-42df5ca95aaa',NULL,'c69d5ddc-116c-4c07-b093-17d4c00c8e8c'),(120,'2025-03-25','2025-05-24',NULL,0,'','','fd1505dd-86cf-4285-955c-42df5ca95aaa',NULL,'c69d5ddc-116c-4c07-b093-17d4c00c8e8c'),(217,'2024-03-01','2024-05-01','2024-03-26',1,'','maintenance-visits-pdfs/مصر للاسمنت ( بيتون)/26-3.pdf','145610f5-cd4d-4d10-800b-a71651c2a981',11,'04dd83d2-ffb0-463e-ac10-9f366bb8547a'),(218,'2024-03-01','2024-05-01','2024-03-24',1,'','maintenance-visits-pdfs/مصر للاسمنت ( بيتون)/24-3.pdf','145610f5-cd4d-4d10-800b-a71651c2a981',11,'249180df-1051-4d89-92b6-2b02f9ae5957'),(219,'2024-03-01','2024-05-01','2024-03-06',1,'','maintenance-visits-pdfs/مصر للاسمنت ( بيتون)/6-2.pdf','145610f5-cd4d-4d10-800b-a71651c2a981',2,'46855125-64b8-4167-848e-16fb6b09921e'),(220,'2024-03-01','2024-05-01','2024-03-25',1,'','maintenance-visits-pdfs/مصر للاسمنت ( بيتون)/25-3.pdf','145610f5-cd4d-4d10-800b-a71651c2a981',11,'53675080-db9b-4fbe-ada7-90c368fe1398'),(221,'2024-03-01','2024-05-01','2024-03-05',1,'','maintenance-visits-pdfs/مصر للاسمنت ( بيتون)/5-3.pdf','145610f5-cd4d-4d10-800b-a71651c2a981',2,'9083e2b4-5ee1-4ce7-b8ee-5774bb53ea35'),(222,'2024-03-01','2024-05-01','2024-04-01',1,'','maintenance-visits-pdfs/مصر للاسمنت ( بيتون)/1-4.pdf','145610f5-cd4d-4d10-800b-a71651c2a981',7,'bd895064-8d7e-424b-bc77-f56ccd0e8ab2'),(223,'2024-03-01','2024-05-01','2024-04-29',1,'','maintenance-visits-pdfs/مصر للاسمنت ( بيتون)/29-4.pdf','145610f5-cd4d-4d10-800b-a71651c2a981',11,'dac9a914-9c9f-457c-831e-5b771ec548ba'),(224,'2024-05-01','2024-07-01',NULL,0,'','','145610f5-cd4d-4d10-800b-a71651c2a981',NULL,'04dd83d2-ffb0-463e-ac10-9f366bb8547a'),(225,'2024-05-01','2024-07-01','2024-06-26',1,'','maintenance-visits-pdfs/مصر للاسمنت ( بيتون)/26-6.pdf','145610f5-cd4d-4d10-800b-a71651c2a981',2,'249180df-1051-4d89-92b6-2b02f9ae5957'),(226,'2024-05-01','2024-07-01','2024-06-04',1,'','maintenance-visits-pdfs/مصر للاسمنت ( بيتون)/4-6.pdf','145610f5-cd4d-4d10-800b-a71651c2a981',11,'46855125-64b8-4167-848e-16fb6b09921e'),(227,'2024-05-01','2024-07-01','2024-07-29',1,'','maintenance-visits-pdfs/مصر للاسمنت ( بيتون)/29-7.pdf','145610f5-cd4d-4d10-800b-a71651c2a981',11,'53675080-db9b-4fbe-ada7-90c368fe1398'),(228,'2024-05-01','2024-07-01','2024-06-27',1,'','maintenance-visits-pdfs/مصر للاسمنت ( بيتون)/27-6.pdf','145610f5-cd4d-4d10-800b-a71651c2a981',2,'9083e2b4-5ee1-4ce7-b8ee-5774bb53ea35'),(229,'2024-05-01','2024-07-01','2024-05-07',1,'','maintenance-visits-pdfs/مصر للاسمنت ( بيتون)/7-5.pdf','145610f5-cd4d-4d10-800b-a71651c2a981',11,'bd895064-8d7e-424b-bc77-f56ccd0e8ab2'),(230,'2024-05-01','2024-07-01','2024-06-29',1,'','maintenance-visits-pdfs/مصر للاسمنت ( بيتون)/29-6.pdf','145610f5-cd4d-4d10-800b-a71651c2a981',2,'dac9a914-9c9f-457c-831e-5b771ec548ba'),(231,'2024-07-01','2024-09-01',NULL,0,'','','145610f5-cd4d-4d10-800b-a71651c2a981',NULL,'04dd83d2-ffb0-463e-ac10-9f366bb8547a'),(232,'2024-07-01','2024-09-01','2024-07-28',1,'','maintenance-visits-pdfs/مصر للاسمنت ( بيتون)/28-7.pdf','145610f5-cd4d-4d10-800b-a71651c2a981',11,'249180df-1051-4d89-92b6-2b02f9ae5957'),(233,'2024-07-01','2024-09-01','2024-07-31',1,'','maintenance-visits-pdfs/مصر للاسمنت ( بيتون)/31-7.pdf','145610f5-cd4d-4d10-800b-a71651c2a981',11,'46855125-64b8-4167-848e-16fb6b09921e'),(234,'2024-07-01','2024-09-01','2024-07-29',1,'','maintenance-visits-pdfs/مصر للاسمنت ( بيتون)/29-7_dDcw7T8.pdf','145610f5-cd4d-4d10-800b-a71651c2a981',11,'53675080-db9b-4fbe-ada7-90c368fe1398'),(235,'2024-07-01','2024-09-01','2024-08-27',1,'','maintenance-visits-pdfs/مصر للاسمنت ( بيتون)/27-8.pdf','145610f5-cd4d-4d10-800b-a71651c2a981',9,'9083e2b4-5ee1-4ce7-b8ee-5774bb53ea35'),(236,'2024-07-01','2024-09-01','2024-07-10',1,'','maintenance-visits-pdfs/مصر للاسمنت ( بيتون)/7-10.pdf','145610f5-cd4d-4d10-800b-a71651c2a981',6,'bd895064-8d7e-424b-bc77-f56ccd0e8ab2'),(237,'2024-07-01','2024-09-01','2024-08-26',1,'','maintenance-visits-pdfs/مصر للاسمنت ( بيتون)/26-8.pdf','145610f5-cd4d-4d10-800b-a71651c2a981',9,'dac9a914-9c9f-457c-831e-5b771ec548ba'),(238,'2024-09-01','2024-11-01','2024-10-29',1,'','maintenance-visits-pdfs/مصر للاسمنت ( بيتون)/29-10.pdf','145610f5-cd4d-4d10-800b-a71651c2a981',2,'04dd83d2-ffb0-463e-ac10-9f366bb8547a'),(239,'2024-09-01','2024-11-01','2024-10-30',1,'','maintenance-visits-pdfs/مصر للاسمنت ( بيتون)/30-10.pdf','145610f5-cd4d-4d10-800b-a71651c2a981',2,'249180df-1051-4d89-92b6-2b02f9ae5957'),(240,'2024-09-01','2024-11-01',NULL,0,'','','145610f5-cd4d-4d10-800b-a71651c2a981',NULL,'46855125-64b8-4167-848e-16fb6b09921e'),(241,'2024-09-01','2024-11-01','2024-10-30',1,'','maintenance-visits-pdfs/مصر للاسمنت ( بيتون)/30-10_kNr1YVk.pdf','145610f5-cd4d-4d10-800b-a71651c2a981',2,'53675080-db9b-4fbe-ada7-90c368fe1398'),(242,'2024-09-01','2024-11-01',NULL,0,'','','145610f5-cd4d-4d10-800b-a71651c2a981',NULL,'9083e2b4-5ee1-4ce7-b8ee-5774bb53ea35'),(243,'2024-09-01','2024-11-01','2024-10-21',1,'','maintenance-visits-pdfs/مصر للاسمنت ( بيتون)/21-10.pdf','145610f5-cd4d-4d10-800b-a71651c2a981',2,'bd895064-8d7e-424b-bc77-f56ccd0e8ab2'),(244,'2024-09-01','2024-11-01','2024-10-31',1,'','maintenance-visits-pdfs/مصر للاسمنت ( بيتون)/31-10.pdf','145610f5-cd4d-4d10-800b-a71651c2a981',2,'dac9a914-9c9f-457c-831e-5b771ec548ba'),(245,'2024-11-01','2025-01-01',NULL,0,'','','145610f5-cd4d-4d10-800b-a71651c2a981',NULL,'04dd83d2-ffb0-463e-ac10-9f366bb8547a'),(246,'2024-11-01','2025-01-01',NULL,0,'','','145610f5-cd4d-4d10-800b-a71651c2a981',NULL,'249180df-1051-4d89-92b6-2b02f9ae5957'),(247,'2024-11-01','2025-01-01',NULL,0,'','','145610f5-cd4d-4d10-800b-a71651c2a981',NULL,'46855125-64b8-4167-848e-16fb6b09921e'),(248,'2024-11-01','2025-01-01',NULL,0,'','','145610f5-cd4d-4d10-800b-a71651c2a981',NULL,'53675080-db9b-4fbe-ada7-90c368fe1398'),(249,'2024-11-01','2025-01-01',NULL,0,'','','145610f5-cd4d-4d10-800b-a71651c2a981',NULL,'9083e2b4-5ee1-4ce7-b8ee-5774bb53ea35'),(250,'2024-11-01','2025-01-01',NULL,0,'','','145610f5-cd4d-4d10-800b-a71651c2a981',NULL,'bd895064-8d7e-424b-bc77-f56ccd0e8ab2'),(251,'2024-11-01','2025-01-01',NULL,0,'','','145610f5-cd4d-4d10-800b-a71651c2a981',NULL,'dac9a914-9c9f-457c-831e-5b771ec548ba'),(252,'2025-01-01','2025-02-28',NULL,0,'','','145610f5-cd4d-4d10-800b-a71651c2a981',NULL,'04dd83d2-ffb0-463e-ac10-9f366bb8547a'),(253,'2025-01-01','2025-02-28',NULL,0,'','','145610f5-cd4d-4d10-800b-a71651c2a981',NULL,'249180df-1051-4d89-92b6-2b02f9ae5957'),(254,'2025-01-01','2025-02-28',NULL,0,'','','145610f5-cd4d-4d10-800b-a71651c2a981',NULL,'46855125-64b8-4167-848e-16fb6b09921e'),(255,'2025-01-01','2025-02-28',NULL,0,'','','145610f5-cd4d-4d10-800b-a71651c2a981',NULL,'53675080-db9b-4fbe-ada7-90c368fe1398'),(256,'2025-01-01','2025-02-28',NULL,0,'','','145610f5-cd4d-4d10-800b-a71651c2a981',NULL,'9083e2b4-5ee1-4ce7-b8ee-5774bb53ea35'),(257,'2025-01-01','2025-02-28',NULL,0,'','','145610f5-cd4d-4d10-800b-a71651c2a981',NULL,'bd895064-8d7e-424b-bc77-f56ccd0e8ab2'),(258,'2025-01-01','2025-02-28',NULL,0,'','','145610f5-cd4d-4d10-800b-a71651c2a981',NULL,'dac9a914-9c9f-457c-831e-5b771ec548ba'),(259,'2024-02-01','2024-05-01','2024-04-03',1,'','maintenance-visits-pdfs/لولو للاسوق التجارية الكبيري/3-4.pdf','1e89bfb8-e432-4de1-a7c8-1228e8474b14',11,'031503f3-7ce5-454a-8d11-2114a28f7221'),(260,'2024-02-01','2024-05-01','2024-04-03',1,'','maintenance-visits-pdfs/لولو للاسوق التجارية الكبيري/3-4_nE5x05d.pdf','1e89bfb8-e432-4de1-a7c8-1228e8474b14',11,'21a33f1b-4d94-4bcf-9b78-a85662582a98'),(261,'2024-02-01','2024-05-01','2024-04-03',1,'','maintenance-visits-pdfs/لولو للاسوق التجارية الكبيري/3-4_eje8e9o.pdf','1e89bfb8-e432-4de1-a7c8-1228e8474b14',11,'6fcade12-96b1-4c41-911d-90bde1816c63'),(262,'2024-05-01','2024-08-01','2024-06-06',1,'','maintenance-visits-pdfs/لولو للاسوق التجارية الكبيري/6-6.pdf','1e89bfb8-e432-4de1-a7c8-1228e8474b14',2,'031503f3-7ce5-454a-8d11-2114a28f7221'),(263,'2024-05-01','2024-08-01','2024-06-06',1,'','maintenance-visits-pdfs/لولو للاسوق التجارية الكبيري/6-6_ud3aeG9.pdf','1e89bfb8-e432-4de1-a7c8-1228e8474b14',2,'21a33f1b-4d94-4bcf-9b78-a85662582a98'),(264,'2024-05-01','2024-08-01','2024-06-06',1,'','maintenance-visits-pdfs/لولو للاسوق التجارية الكبيري/6-6_KAGHXYl.pdf','1e89bfb8-e432-4de1-a7c8-1228e8474b14',2,'6fcade12-96b1-4c41-911d-90bde1816c63'),(265,'2024-08-01','2024-11-01','2024-08-05',1,'','maintenance-visits-pdfs/لولو للاسوق التجارية الكبيري/5-8.pdf','1e89bfb8-e432-4de1-a7c8-1228e8474b14',2,'031503f3-7ce5-454a-8d11-2114a28f7221'),(266,'2024-08-01','2024-11-01','2024-08-05',1,'','maintenance-visits-pdfs/لولو للاسوق التجارية الكبيري/5-8_KcPS5Jn.pdf','1e89bfb8-e432-4de1-a7c8-1228e8474b14',2,'21a33f1b-4d94-4bcf-9b78-a85662582a98'),(267,'2024-08-01','2024-11-01','2024-08-05',1,'','maintenance-visits-pdfs/لولو للاسوق التجارية الكبيري/5-8_2I3vDdX.pdf','1e89bfb8-e432-4de1-a7c8-1228e8474b14',2,'6fcade12-96b1-4c41-911d-90bde1816c63'),(268,'2024-11-01','2025-01-31',NULL,0,'','','1e89bfb8-e432-4de1-a7c8-1228e8474b14',NULL,'031503f3-7ce5-454a-8d11-2114a28f7221'),(269,'2024-11-01','2025-01-31',NULL,0,'','','1e89bfb8-e432-4de1-a7c8-1228e8474b14',NULL,'21a33f1b-4d94-4bcf-9b78-a85662582a98'),(270,'2024-11-01','2025-01-31',NULL,0,'','','1e89bfb8-e432-4de1-a7c8-1228e8474b14',NULL,'6fcade12-96b1-4c41-911d-90bde1816c63'),(271,'2024-02-01','2024-05-01',NULL,0,'','','f84ce7c4-c92f-4d1e-8b8e-547a63d51a45',NULL,'031503f3-7ce5-454a-8d11-2114a28f7221'),(272,'2024-02-01','2024-05-01',NULL,0,'','','f84ce7c4-c92f-4d1e-8b8e-547a63d51a45',NULL,'21a33f1b-4d94-4bcf-9b78-a85662582a98'),(273,'2024-02-01','2024-05-01',NULL,0,'','','f84ce7c4-c92f-4d1e-8b8e-547a63d51a45',NULL,'6fcade12-96b1-4c41-911d-90bde1816c63'),(274,'2024-05-01','2024-08-01',NULL,0,'','','f84ce7c4-c92f-4d1e-8b8e-547a63d51a45',NULL,'031503f3-7ce5-454a-8d11-2114a28f7221'),(275,'2024-05-01','2024-08-01',NULL,0,'','','f84ce7c4-c92f-4d1e-8b8e-547a63d51a45',NULL,'21a33f1b-4d94-4bcf-9b78-a85662582a98'),(276,'2024-05-01','2024-08-01',NULL,0,'','','f84ce7c4-c92f-4d1e-8b8e-547a63d51a45',NULL,'6fcade12-96b1-4c41-911d-90bde1816c63'),(277,'2024-08-01','2024-11-01',NULL,0,'','','f84ce7c4-c92f-4d1e-8b8e-547a63d51a45',NULL,'031503f3-7ce5-454a-8d11-2114a28f7221'),(278,'2024-08-01','2024-11-01',NULL,0,'','','f84ce7c4-c92f-4d1e-8b8e-547a63d51a45',NULL,'21a33f1b-4d94-4bcf-9b78-a85662582a98'),(279,'2024-08-01','2024-11-01',NULL,0,'','','f84ce7c4-c92f-4d1e-8b8e-547a63d51a45',NULL,'6fcade12-96b1-4c41-911d-90bde1816c63'),(280,'2024-11-01','2025-01-31',NULL,0,'','','f84ce7c4-c92f-4d1e-8b8e-547a63d51a45',NULL,'031503f3-7ce5-454a-8d11-2114a28f7221'),(281,'2024-11-01','2025-01-31',NULL,0,'','','f84ce7c4-c92f-4d1e-8b8e-547a63d51a45',NULL,'21a33f1b-4d94-4bcf-9b78-a85662582a98'),(282,'2024-11-01','2025-01-31',NULL,0,'','','f84ce7c4-c92f-4d1e-8b8e-547a63d51a45',NULL,'6fcade12-96b1-4c41-911d-90bde1816c63'),(295,'2024-10-01','2025-01-01',NULL,0,'','','541cac7a-237c-48df-a8d0-08ac4629268b',NULL,'031503f3-7ce5-454a-8d11-2114a28f7221'),(296,'2024-10-01','2025-01-01',NULL,0,'','','541cac7a-237c-48df-a8d0-08ac4629268b',NULL,'21a33f1b-4d94-4bcf-9b78-a85662582a98'),(297,'2024-10-01','2025-01-01',NULL,0,'','','541cac7a-237c-48df-a8d0-08ac4629268b',NULL,'6fcade12-96b1-4c41-911d-90bde1816c63'),(298,'2025-01-01','2025-04-01',NULL,0,'','','541cac7a-237c-48df-a8d0-08ac4629268b',NULL,'031503f3-7ce5-454a-8d11-2114a28f7221'),(299,'2025-01-01','2025-04-01',NULL,0,'','','541cac7a-237c-48df-a8d0-08ac4629268b',NULL,'21a33f1b-4d94-4bcf-9b78-a85662582a98'),(300,'2025-01-01','2025-04-01',NULL,0,'','','541cac7a-237c-48df-a8d0-08ac4629268b',NULL,'6fcade12-96b1-4c41-911d-90bde1816c63'),(301,'2025-04-01','2025-07-01',NULL,0,'','','541cac7a-237c-48df-a8d0-08ac4629268b',NULL,'031503f3-7ce5-454a-8d11-2114a28f7221'),(302,'2025-04-01','2025-07-01',NULL,0,'','','541cac7a-237c-48df-a8d0-08ac4629268b',NULL,'21a33f1b-4d94-4bcf-9b78-a85662582a98'),(303,'2025-04-01','2025-07-01',NULL,0,'','','541cac7a-237c-48df-a8d0-08ac4629268b',NULL,'6fcade12-96b1-4c41-911d-90bde1816c63'),(304,'2025-07-01','2025-09-30',NULL,0,'','','541cac7a-237c-48df-a8d0-08ac4629268b',NULL,'031503f3-7ce5-454a-8d11-2114a28f7221'),(305,'2025-07-01','2025-09-30',NULL,0,'','','541cac7a-237c-48df-a8d0-08ac4629268b',NULL,'21a33f1b-4d94-4bcf-9b78-a85662582a98'),(306,'2025-07-01','2025-09-30',NULL,0,'','','541cac7a-237c-48df-a8d0-08ac4629268b',NULL,'6fcade12-96b1-4c41-911d-90bde1816c63'),(333,'2024-07-01','2024-07-15','2024-07-07',1,'','maintenance-visits-pdfs/جمعيه الصناع/٧-٧_غرب.pdf','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',11,'cbffd5f1-ce28-46be-ab87-d753d23650b2'),(334,'2024-07-01','2024-07-15','2024-07-07',1,'','maintenance-visits-pdfs/جمعيه الصناع/٧-٧_شرق.pdf','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',11,'f2c7e135-3d97-465f-96ec-a8a9e812d792'),(335,'2024-07-15','2024-07-29','2024-07-29',1,'','maintenance-visits-pdfs/جمعيه الصناع/29-7_غرب.pdf','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',2,'cbffd5f1-ce28-46be-ab87-d753d23650b2'),(336,'2024-07-15','2024-07-29','2024-07-29',1,'','maintenance-visits-pdfs/جمعيه الصناع/29-7_شرق.pdf','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',2,'f2c7e135-3d97-465f-96ec-a8a9e812d792'),(337,'2024-07-29','2024-08-12','2024-08-27',1,'','maintenance-visits-pdfs/جمعيه الصناع/29-7_غرب_wpjfJKU.pdf','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',2,'cbffd5f1-ce28-46be-ab87-d753d23650b2'),(338,'2024-07-29','2024-08-12','2024-07-27',1,'','maintenance-visits-pdfs/جمعيه الصناع/29-7_شرق_kpPLzG8.pdf','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',2,'f2c7e135-3d97-465f-96ec-a8a9e812d792'),(339,'2024-08-12','2024-08-26','2024-08-12',1,'','maintenance-visits-pdfs/جمعيه الصناع/12-8.pdf','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',2,'cbffd5f1-ce28-46be-ab87-d753d23650b2'),(340,'2024-08-12','2024-08-26','2024-08-12',1,'','maintenance-visits-pdfs/جمعيه الصناع/12-8_شرق_RA1jNpH.pdf','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',2,'f2c7e135-3d97-465f-96ec-a8a9e812d792'),(341,'2024-08-26','2024-09-09','2024-08-19',1,'','maintenance-visits-pdfs/جمعيه الصناع/19-8_غرب_o30hhpM.pdf','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',5,'cbffd5f1-ce28-46be-ab87-d753d23650b2'),(342,'2024-08-26','2024-09-09','2024-08-19',1,'','maintenance-visits-pdfs/جمعيه الصناع/19-8_شرق_ISoK4sy.pdf','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',5,'f2c7e135-3d97-465f-96ec-a8a9e812d792'),(343,'2024-09-09','2024-09-23','2024-09-23',1,'','maintenance-visits-pdfs/جمعيه الصناع/23-9_غرب_VYU6zUU.pdf','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',3,'cbffd5f1-ce28-46be-ab87-d753d23650b2'),(344,'2024-09-09','2024-09-23','2024-09-23',1,'','maintenance-visits-pdfs/جمعيه الصناع/23-9_شرق_QeHv6EN.pdf','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',3,'f2c7e135-3d97-465f-96ec-a8a9e812d792'),(345,'2024-09-23','2024-10-07','2024-09-30',1,'','maintenance-visits-pdfs/جمعيه الصناع/30-9_غرب.pdf','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',2,'cbffd5f1-ce28-46be-ab87-d753d23650b2'),(346,'2024-09-23','2024-10-07','2024-09-30',1,'','maintenance-visits-pdfs/جمعيه الصناع/30-9_شرق.pdf','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',3,'f2c7e135-3d97-465f-96ec-a8a9e812d792'),(347,'2024-10-07','2024-10-21','2024-10-22',1,'','maintenance-visits-pdfs/جمعيه الصناع/22-10_غرب.pdf','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',5,'cbffd5f1-ce28-46be-ab87-d753d23650b2'),(348,'2024-10-07','2024-10-21','2024-10-30',1,'','maintenance-visits-pdfs/جمعيه الصناع/30-10_جمعية_الصناع_شرق.pdf','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',6,'f2c7e135-3d97-465f-96ec-a8a9e812d792'),(349,'2024-10-21','2024-11-04','2024-10-30',1,'','maintenance-visits-pdfs/جمعيه الصناع/30-10_جمعية_الصناع_غرب_.pdf','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',6,'cbffd5f1-ce28-46be-ab87-d753d23650b2'),(350,'2024-10-21','2024-11-04',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'f2c7e135-3d97-465f-96ec-a8a9e812d792'),(351,'2024-11-04','2024-11-18',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'cbffd5f1-ce28-46be-ab87-d753d23650b2'),(352,'2024-11-04','2024-11-18',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'f2c7e135-3d97-465f-96ec-a8a9e812d792'),(353,'2024-11-18','2024-12-02',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'cbffd5f1-ce28-46be-ab87-d753d23650b2'),(354,'2024-11-18','2024-12-02',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'f2c7e135-3d97-465f-96ec-a8a9e812d792'),(355,'2024-12-02','2024-12-16',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'cbffd5f1-ce28-46be-ab87-d753d23650b2'),(356,'2024-12-02','2024-12-16',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'f2c7e135-3d97-465f-96ec-a8a9e812d792'),(357,'2024-12-16','2024-12-30',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'cbffd5f1-ce28-46be-ab87-d753d23650b2'),(358,'2024-12-16','2024-12-30',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'f2c7e135-3d97-465f-96ec-a8a9e812d792'),(359,'2024-12-30','2025-01-13',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'cbffd5f1-ce28-46be-ab87-d753d23650b2'),(360,'2024-12-30','2025-01-13',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'f2c7e135-3d97-465f-96ec-a8a9e812d792'),(361,'2025-01-13','2025-01-27',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'cbffd5f1-ce28-46be-ab87-d753d23650b2'),(362,'2025-01-13','2025-01-27',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'f2c7e135-3d97-465f-96ec-a8a9e812d792'),(363,'2025-01-27','2025-02-10',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'cbffd5f1-ce28-46be-ab87-d753d23650b2'),(364,'2025-01-27','2025-02-10',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'f2c7e135-3d97-465f-96ec-a8a9e812d792'),(365,'2025-02-10','2025-02-24',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'cbffd5f1-ce28-46be-ab87-d753d23650b2'),(366,'2025-02-10','2025-02-24',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'f2c7e135-3d97-465f-96ec-a8a9e812d792'),(367,'2025-02-24','2025-03-10',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'cbffd5f1-ce28-46be-ab87-d753d23650b2'),(368,'2025-02-24','2025-03-10',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'f2c7e135-3d97-465f-96ec-a8a9e812d792'),(369,'2025-03-10','2025-03-24',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'cbffd5f1-ce28-46be-ab87-d753d23650b2'),(370,'2025-03-10','2025-03-24',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'f2c7e135-3d97-465f-96ec-a8a9e812d792'),(371,'2025-03-24','2025-04-07',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'cbffd5f1-ce28-46be-ab87-d753d23650b2'),(372,'2025-03-24','2025-04-07',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'f2c7e135-3d97-465f-96ec-a8a9e812d792'),(373,'2025-04-07','2025-04-21',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'cbffd5f1-ce28-46be-ab87-d753d23650b2'),(374,'2025-04-07','2025-04-21',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'f2c7e135-3d97-465f-96ec-a8a9e812d792'),(375,'2025-04-21','2025-05-05',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'cbffd5f1-ce28-46be-ab87-d753d23650b2'),(376,'2025-04-21','2025-05-05',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'f2c7e135-3d97-465f-96ec-a8a9e812d792'),(377,'2025-05-05','2025-05-19',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'cbffd5f1-ce28-46be-ab87-d753d23650b2'),(378,'2025-05-05','2025-05-19',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'f2c7e135-3d97-465f-96ec-a8a9e812d792'),(379,'2025-05-19','2025-06-02',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'cbffd5f1-ce28-46be-ab87-d753d23650b2'),(380,'2025-05-19','2025-06-02',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'f2c7e135-3d97-465f-96ec-a8a9e812d792'),(381,'2025-06-02','2025-06-16',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'cbffd5f1-ce28-46be-ab87-d753d23650b2'),(382,'2025-06-02','2025-06-16',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'f2c7e135-3d97-465f-96ec-a8a9e812d792'),(383,'2025-06-16','2025-06-30',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'cbffd5f1-ce28-46be-ab87-d753d23650b2'),(384,'2025-06-16','2025-06-30',NULL,0,'','','bb4aa5d1-1f5b-4d4e-9b44-5595422b3290',NULL,'f2c7e135-3d97-465f-96ec-a8a9e812d792'),(385,'2024-06-01','2024-07-01','2024-06-23',1,'','maintenance-visits-pdfs/أوريون للصناعات الغذائية/23-6.pdf','3951705e-8d5d-41cd-afbd-bab4ed2b9971',3,'969a9d7f-3061-4cd6-8c6f-768159e9297b'),(386,'2024-07-01','2024-08-01','2024-08-29',1,'','maintenance-visits-pdfs/أوريون للصناعات الغذائية/29-8.pdf','3951705e-8d5d-41cd-afbd-bab4ed2b9971',2,'969a9d7f-3061-4cd6-8c6f-768159e9297b'),(387,'2024-08-01','2024-09-01','2024-09-18',1,'','maintenance-visits-pdfs/أوريون للصناعات الغذائية/18-9.pdf','3951705e-8d5d-41cd-afbd-bab4ed2b9971',5,'969a9d7f-3061-4cd6-8c6f-768159e9297b'),(388,'2024-09-01','2024-10-01','2024-09-08',1,'','maintenance-visits-pdfs/أوريون للصناعات الغذائية/8-9.pdf','3951705e-8d5d-41cd-afbd-bab4ed2b9971',5,'969a9d7f-3061-4cd6-8c6f-768159e9297b'),(389,'2024-10-01','2024-11-01','2024-10-24',1,'','maintenance-visits-pdfs/أوريون للصناعات الغذائية/24-10.pdf','3951705e-8d5d-41cd-afbd-bab4ed2b9971',2,'969a9d7f-3061-4cd6-8c6f-768159e9297b'),(390,'2024-11-01','2024-12-01','2024-11-01',1,'','maintenance-visits-pdfs/أوريون للصناعات الغذائية/11-1.pdf','3951705e-8d5d-41cd-afbd-bab4ed2b9971',3,'969a9d7f-3061-4cd6-8c6f-768159e9297b'),(391,'2024-12-01','2025-01-01',NULL,0,'','','3951705e-8d5d-41cd-afbd-bab4ed2b9971',NULL,'969a9d7f-3061-4cd6-8c6f-768159e9297b'),(392,'2025-01-01','2025-02-01',NULL,0,'','','3951705e-8d5d-41cd-afbd-bab4ed2b9971',NULL,'969a9d7f-3061-4cd6-8c6f-768159e9297b'),(393,'2025-02-01','2025-03-01',NULL,0,'','','3951705e-8d5d-41cd-afbd-bab4ed2b9971',NULL,'969a9d7f-3061-4cd6-8c6f-768159e9297b'),(394,'2025-03-01','2025-04-01',NULL,0,'','','3951705e-8d5d-41cd-afbd-bab4ed2b9971',NULL,'969a9d7f-3061-4cd6-8c6f-768159e9297b'),(395,'2025-04-01','2025-05-01',NULL,0,'','','3951705e-8d5d-41cd-afbd-bab4ed2b9971',NULL,'969a9d7f-3061-4cd6-8c6f-768159e9297b'),(396,'2025-05-01','2025-05-31',NULL,0,'','','3951705e-8d5d-41cd-afbd-bab4ed2b9971',NULL,'969a9d7f-3061-4cd6-8c6f-768159e9297b'),(397,'2024-05-12','2024-06-12','2024-05-27',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/27-5_7Vd9vIc.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',11,'3dc67006-6bb1-47c3-8c30-e63af65cd08b'),(398,'2024-05-12','2024-06-12','2024-05-14',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/14-5_9ezhajn.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',11,'6656e992-a5d9-4c20-a530-d774d6769f05'),(399,'2024-05-12','2024-06-12','2024-05-27',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/27-5_9lfNyBc.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',11,'685c1736-e4a6-4b85-afe7-aa50f6839be2'),(400,'2024-05-12','2024-06-12','2024-05-27',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/27-5_DaERepa.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',11,'69646144-3cbc-4b8f-b824-80da28665b29'),(401,'2024-05-12','2024-06-12','2024-05-27',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/27-5_3VKKGZc.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',11,'90c2618b-fd71-4101-88d3-cc2386ad100c'),(402,'2024-05-12','2024-06-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'b49b437f-5928-4bd4-9832-12e653d8bea6'),(403,'2024-05-12','2024-06-12','2024-05-14',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/14-5.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',11,'c3bc49b9-a8d2-47e0-ac7d-c75f0dab8374'),(404,'2024-05-12','2024-06-12','2024-05-20',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/20-5_S9oKn3T.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',11,'fb9becde-1b87-4a29-9153-d6a1bc41f153'),(405,'2024-05-12','2024-06-12','2024-05-02',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/2-5_Uq4O36t.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',11,'fcca3796-a72e-43ea-a904-105cd5f4a119'),(406,'2024-06-12','2024-07-12','2024-06-09',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/9-6_wJNeEmN.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',8,'3dc67006-6bb1-47c3-8c30-e63af65cd08b'),(407,'2024-06-12','2024-07-12','2024-06-25',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/25-6_iiEhHt1.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',11,'6656e992-a5d9-4c20-a530-d774d6769f05'),(408,'2024-06-12','2024-07-12','2024-06-24',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/24-6_uyFdkQB.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',11,'685c1736-e4a6-4b85-afe7-aa50f6839be2'),(409,'2024-06-12','2024-07-12','2024-06-24',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/24-6_Au5SsUO.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',11,'69646144-3cbc-4b8f-b824-80da28665b29'),(410,'2024-06-12','2024-07-12','2024-07-29',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/29-7_BbzBfuD.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',3,'90c2618b-fd71-4101-88d3-cc2386ad100c'),(411,'2024-06-12','2024-07-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'b49b437f-5928-4bd4-9832-12e653d8bea6'),(412,'2024-06-12','2024-07-12','2024-06-25',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/25-6_69cV8Qf.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',11,'c3bc49b9-a8d2-47e0-ac7d-c75f0dab8374'),(413,'2024-06-12','2024-07-12','2024-06-25',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/25-6_1MGQ3a0.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',11,'fb9becde-1b87-4a29-9153-d6a1bc41f153'),(414,'2024-06-12','2024-07-12','2024-06-25',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/25-6_Mxj4ex5.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',11,'fcca3796-a72e-43ea-a904-105cd5f4a119'),(415,'2024-07-12','2024-08-12','2024-07-08',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/8-7_pKza2gj.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',8,'3dc67006-6bb1-47c3-8c30-e63af65cd08b'),(416,'2024-07-12','2024-08-12','2024-07-14',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/14-7_AXAdX4V.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',11,'6656e992-a5d9-4c20-a530-d774d6769f05'),(417,'2024-07-12','2024-08-12','2024-07-14',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/14-7_uCAVf4z.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',11,'685c1736-e4a6-4b85-afe7-aa50f6839be2'),(418,'2024-07-12','2024-08-12','2024-07-08',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/8-7_xKeG5wv.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',8,'69646144-3cbc-4b8f-b824-80da28665b29'),(419,'2024-07-12','2024-08-12','2024-08-27',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/27-8_pvPlM6F.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',5,'90c2618b-fd71-4101-88d3-cc2386ad100c'),(420,'2024-07-12','2024-08-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'b49b437f-5928-4bd4-9832-12e653d8bea6'),(421,'2024-07-12','2024-08-12','2024-07-14',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/14-7_z2IMuQg.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',11,'c3bc49b9-a8d2-47e0-ac7d-c75f0dab8374'),(422,'2024-07-12','2024-08-12','2024-07-08',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/8-7_5Mpb28Z.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',8,'fb9becde-1b87-4a29-9153-d6a1bc41f153'),(423,'2024-07-12','2024-08-12','2024-07-08',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/8-7_igJDJug.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',8,'fcca3796-a72e-43ea-a904-105cd5f4a119'),(424,'2024-08-12','2024-09-12','2024-08-18',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/18-8_G2UfJH2.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',9,'3dc67006-6bb1-47c3-8c30-e63af65cd08b'),(425,'2024-08-12','2024-09-12','2024-08-27',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/27-8_E810gF4.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',11,'6656e992-a5d9-4c20-a530-d774d6769f05'),(426,'2024-08-12','2024-09-12','2024-08-27',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/27-8_BWHkWnv.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',10,'685c1736-e4a6-4b85-afe7-aa50f6839be2'),(427,'2024-08-12','2024-09-12','2024-08-27',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/27-8_sjhHn4Y.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',5,'69646144-3cbc-4b8f-b824-80da28665b29'),(428,'2024-08-12','2024-09-12','2024-09-24',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/24-9_E8Z42Uq.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',6,'90c2618b-fd71-4101-88d3-cc2386ad100c'),(429,'2024-08-12','2024-09-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'b49b437f-5928-4bd4-9832-12e653d8bea6'),(430,'2024-08-12','2024-09-12','2024-08-27',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/27-8_OZ16I5L.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',5,'c3bc49b9-a8d2-47e0-ac7d-c75f0dab8374'),(431,'2024-08-12','2024-09-12','2024-08-18',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/18-8_0pkddIa.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',9,'fb9becde-1b87-4a29-9153-d6a1bc41f153'),(432,'2024-08-12','2024-09-12','2024-08-18',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/18-8_lBwbbmm.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',8,'fcca3796-a72e-43ea-a904-105cd5f4a119'),(433,'2024-09-12','2024-10-12','2024-10-22',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/22-10_lMZ1ZMS.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',2,'3dc67006-6bb1-47c3-8c30-e63af65cd08b'),(434,'2024-09-12','2024-10-12','2024-09-10',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/10-9_rXxRJKP.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',9,'6656e992-a5d9-4c20-a530-d774d6769f05'),(435,'2024-09-12','2024-10-12','2024-09-24',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/24-9_2ENfSTS.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',6,'685c1736-e4a6-4b85-afe7-aa50f6839be2'),(436,'2024-09-12','2024-10-12','2024-09-24',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/24-9_8eooxf4.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',6,'69646144-3cbc-4b8f-b824-80da28665b29'),(437,'2024-09-12','2024-10-12','2024-10-13',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/13-10_kQUuKiD.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',6,'90c2618b-fd71-4101-88d3-cc2386ad100c'),(438,'2024-09-12','2024-10-12','2024-09-16',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/الصف_١٦-٩.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',2,'b49b437f-5928-4bd4-9832-12e653d8bea6'),(439,'2024-09-12','2024-10-12','2024-09-10',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/10-9_tKjOZKq.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',9,'c3bc49b9-a8d2-47e0-ac7d-c75f0dab8374'),(440,'2024-09-12','2024-10-12','2024-09-09',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/9-9_dM9RO64.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',9,'fb9becde-1b87-4a29-9153-d6a1bc41f153'),(441,'2024-09-12','2024-10-12','2024-09-09',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/9-9_QVCF0Eg.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',9,'fcca3796-a72e-43ea-a904-105cd5f4a119'),(442,'2024-10-12','2024-11-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'3dc67006-6bb1-47c3-8c30-e63af65cd08b'),(443,'2024-10-12','2024-11-12','2024-10-13',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/13-10_zeOwBvS.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',6,'6656e992-a5d9-4c20-a530-d774d6769f05'),(444,'2024-10-12','2024-11-12','2024-10-13',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/13-10_cPurvZ0.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',6,'685c1736-e4a6-4b85-afe7-aa50f6839be2'),(445,'2024-10-12','2024-11-12','2024-10-13',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/13-10_2tfHQsd.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',6,'69646144-3cbc-4b8f-b824-80da28665b29'),(446,'2024-10-12','2024-11-12','2024-10-17',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/17-10_39W3kTs.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',2,'90c2618b-fd71-4101-88d3-cc2386ad100c'),(447,'2024-10-12','2024-11-12','2024-10-27',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/الصف_٢٨-١٠.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',2,'b49b437f-5928-4bd4-9832-12e653d8bea6'),(448,'2024-10-12','2024-11-12','2024-10-13',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/13-10_rImeWrI.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',6,'c3bc49b9-a8d2-47e0-ac7d-c75f0dab8374'),(449,'2024-10-12','2024-11-12','2024-10-22',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/22-10_cVmTaez.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',2,'fb9becde-1b87-4a29-9153-d6a1bc41f153'),(450,'2024-10-12','2024-11-12','2024-10-22',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/22-10_gKDzxTL.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',2,'fcca3796-a72e-43ea-a904-105cd5f4a119'),(451,'2024-11-12','2024-12-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'3dc67006-6bb1-47c3-8c30-e63af65cd08b'),(452,'2024-11-12','2024-12-12','2024-11-07',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/7-11_hCnKKid.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',10,'6656e992-a5d9-4c20-a530-d774d6769f05'),(453,'2024-11-12','2024-12-12','2024-11-07',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/7-11_MUlC1HM.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',10,'685c1736-e4a6-4b85-afe7-aa50f6839be2'),(454,'2024-11-12','2024-12-12','2024-11-07',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/7-11_8jcySjv.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',10,'69646144-3cbc-4b8f-b824-80da28665b29'),(455,'2024-11-12','2024-12-12','2024-11-04',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/4-11_Mwk8HvC.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',6,'90c2618b-fd71-4101-88d3-cc2386ad100c'),(456,'2024-11-12','2024-11-12','2024-12-25',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/القاهرة_للدواجن_الصف_شهر_11.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',2,'b49b437f-5928-4bd4-9832-12e653d8bea6'),(457,'2024-11-12','2024-12-12','2024-11-07',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/7-11_iKfqZHj.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',10,'c3bc49b9-a8d2-47e0-ac7d-c75f0dab8374'),(458,'2024-11-12','2024-12-12','2024-11-10',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/العهد_2_شهر_11.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',6,'fb9becde-1b87-4a29-9153-d6a1bc41f153'),(459,'2024-11-12','2024-12-12','2024-11-10',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/العهد_1_شهر_11.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',6,'fcca3796-a72e-43ea-a904-105cd5f4a119'),(460,'2024-12-12','2025-01-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'3dc67006-6bb1-47c3-8c30-e63af65cd08b'),(461,'2024-12-12','2025-01-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'6656e992-a5d9-4c20-a530-d774d6769f05'),(462,'2024-12-12','2025-01-12','2024-12-16',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/سينا_2000_شهر_12.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',5,'685c1736-e4a6-4b85-afe7-aa50f6839be2'),(463,'2024-12-12','2025-01-12','2024-12-16',1,'','maintenance-visits-pdfs/القاهرة للدواجن CPC/القادسية_شهر_12.pdf','7559880d-3d08-4ff5-91b6-1083beee985e',5,'69646144-3cbc-4b8f-b824-80da28665b29'),(464,'2024-12-12','2025-01-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'90c2618b-fd71-4101-88d3-cc2386ad100c'),(465,'2024-12-12','2025-01-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'b49b437f-5928-4bd4-9832-12e653d8bea6'),(466,'2024-12-12','2025-01-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'c3bc49b9-a8d2-47e0-ac7d-c75f0dab8374'),(467,'2024-12-12','2025-01-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'fb9becde-1b87-4a29-9153-d6a1bc41f153'),(468,'2024-12-12','2025-01-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'fcca3796-a72e-43ea-a904-105cd5f4a119'),(469,'2025-01-12','2025-02-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'3dc67006-6bb1-47c3-8c30-e63af65cd08b'),(470,'2025-01-12','2025-02-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'6656e992-a5d9-4c20-a530-d774d6769f05'),(471,'2025-01-12','2025-02-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'685c1736-e4a6-4b85-afe7-aa50f6839be2'),(472,'2025-01-12','2025-02-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'69646144-3cbc-4b8f-b824-80da28665b29'),(473,'2025-01-12','2025-02-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'90c2618b-fd71-4101-88d3-cc2386ad100c'),(474,'2025-01-12','2025-02-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'b49b437f-5928-4bd4-9832-12e653d8bea6'),(475,'2025-01-12','2025-02-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'c3bc49b9-a8d2-47e0-ac7d-c75f0dab8374'),(476,'2025-01-12','2025-02-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'fb9becde-1b87-4a29-9153-d6a1bc41f153'),(477,'2025-01-12','2025-02-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'fcca3796-a72e-43ea-a904-105cd5f4a119'),(478,'2025-02-12','2025-03-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'3dc67006-6bb1-47c3-8c30-e63af65cd08b'),(479,'2025-02-12','2025-03-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'6656e992-a5d9-4c20-a530-d774d6769f05'),(480,'2025-02-12','2025-03-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'685c1736-e4a6-4b85-afe7-aa50f6839be2'),(481,'2025-02-12','2025-03-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'69646144-3cbc-4b8f-b824-80da28665b29'),(482,'2025-02-12','2025-03-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'90c2618b-fd71-4101-88d3-cc2386ad100c'),(483,'2025-02-12','2025-03-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'b49b437f-5928-4bd4-9832-12e653d8bea6'),(484,'2025-02-12','2025-03-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'c3bc49b9-a8d2-47e0-ac7d-c75f0dab8374'),(485,'2025-02-12','2025-03-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'fb9becde-1b87-4a29-9153-d6a1bc41f153'),(486,'2025-02-12','2025-03-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'fcca3796-a72e-43ea-a904-105cd5f4a119'),(487,'2025-03-12','2025-04-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'3dc67006-6bb1-47c3-8c30-e63af65cd08b'),(488,'2025-03-12','2025-04-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'6656e992-a5d9-4c20-a530-d774d6769f05'),(489,'2025-03-12','2025-04-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'685c1736-e4a6-4b85-afe7-aa50f6839be2'),(490,'2025-03-12','2025-04-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'69646144-3cbc-4b8f-b824-80da28665b29'),(491,'2025-03-12','2025-04-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'90c2618b-fd71-4101-88d3-cc2386ad100c'),(492,'2025-03-12','2025-04-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'b49b437f-5928-4bd4-9832-12e653d8bea6'),(493,'2025-03-12','2025-04-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'c3bc49b9-a8d2-47e0-ac7d-c75f0dab8374'),(494,'2025-03-12','2025-04-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'fb9becde-1b87-4a29-9153-d6a1bc41f153'),(495,'2025-03-12','2025-04-12',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'fcca3796-a72e-43ea-a904-105cd5f4a119'),(496,'2025-04-12','2025-05-11',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'3dc67006-6bb1-47c3-8c30-e63af65cd08b'),(497,'2025-04-12','2025-05-11',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'6656e992-a5d9-4c20-a530-d774d6769f05'),(498,'2025-04-12','2025-05-11',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'685c1736-e4a6-4b85-afe7-aa50f6839be2'),(499,'2025-04-12','2025-05-11',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'69646144-3cbc-4b8f-b824-80da28665b29'),(500,'2025-04-12','2025-05-11',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'90c2618b-fd71-4101-88d3-cc2386ad100c'),(501,'2025-04-12','2025-05-11',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'b49b437f-5928-4bd4-9832-12e653d8bea6'),(502,'2025-04-12','2025-05-11',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'c3bc49b9-a8d2-47e0-ac7d-c75f0dab8374'),(503,'2025-04-12','2025-05-11',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'fb9becde-1b87-4a29-9153-d6a1bc41f153'),(504,'2025-04-12','2025-05-11',NULL,0,'','','7559880d-3d08-4ff5-91b6-1083beee985e',NULL,'fcca3796-a72e-43ea-a904-105cd5f4a119'),(509,'2024-04-01','2024-05-01','2024-04-04',1,'','maintenance-visits-pdfs/ديورافيت ايجبت/4-4.pdf','202cfd68-6c89-45a9-92f0-f6462526f826',5,'03f27f38-ecd2-4d87-abbe-76a4471829c5'),(510,'2024-05-01','2024-06-01','2024-05-07',1,'','maintenance-visits-pdfs/ديورافيت ايجبت/7-5_ديورافيت.pdf','202cfd68-6c89-45a9-92f0-f6462526f826',2,'03f27f38-ecd2-4d87-abbe-76a4471829c5'),(511,'2024-06-01','2024-07-01','2024-06-06',1,'','maintenance-visits-pdfs/ديورافيت ايجبت/4-6.pdf','202cfd68-6c89-45a9-92f0-f6462526f826',8,'03f27f38-ecd2-4d87-abbe-76a4471829c5'),(512,'2024-07-01','2024-08-01','2024-07-01',1,'','maintenance-visits-pdfs/ديورافيت ايجبت/1-7.pdf','202cfd68-6c89-45a9-92f0-f6462526f826',8,'03f27f38-ecd2-4d87-abbe-76a4471829c5'),(513,'2024-08-01','2024-09-01','2024-08-01',1,'','maintenance-visits-pdfs/ديورافيت ايجبت/8-1.pdf','202cfd68-6c89-45a9-92f0-f6462526f826',5,'03f27f38-ecd2-4d87-abbe-76a4471829c5'),(514,'2024-09-01','2024-10-01','2024-09-01',1,'','maintenance-visits-pdfs/ديورافيت ايجبت/1-9.pdf','202cfd68-6c89-45a9-92f0-f6462526f826',5,'03f27f38-ecd2-4d87-abbe-76a4471829c5'),(515,'2024-10-01','2024-11-01',NULL,0,'','','202cfd68-6c89-45a9-92f0-f6462526f826',NULL,'03f27f38-ecd2-4d87-abbe-76a4471829c5'),(516,'2024-11-01','2024-12-01','2024-11-05',1,'','maintenance-visits-pdfs/ديورافيت ايجبت/العربية_الخليجية_شهر_11.pdf','202cfd68-6c89-45a9-92f0-f6462526f826',2,'03f27f38-ecd2-4d87-abbe-76a4471829c5'),(517,'2024-12-01','2025-01-01','2024-12-05',0,'','maintenance-visits-pdfs/ديورافيت ايجبت/ديورافيت_شهر_12.pdf','202cfd68-6c89-45a9-92f0-f6462526f826',2,'03f27f38-ecd2-4d87-abbe-76a4471829c5'),(518,'2025-01-01','2025-02-01',NULL,0,'','','202cfd68-6c89-45a9-92f0-f6462526f826',NULL,'03f27f38-ecd2-4d87-abbe-76a4471829c5'),(519,'2025-02-01','2025-03-01',NULL,0,'','','202cfd68-6c89-45a9-92f0-f6462526f826',NULL,'03f27f38-ecd2-4d87-abbe-76a4471829c5'),(520,'2025-03-01','2025-03-31',NULL,0,'','','202cfd68-6c89-45a9-92f0-f6462526f826',NULL,'03f27f38-ecd2-4d87-abbe-76a4471829c5'),(521,'2024-02-01','2024-04-01','2024-03-10',1,'','maintenance-visits-pdfs/منجم السكري/10-3.pdf','bea7e404-9982-4699-b2f2-dcda373ab5b8',7,'e446bd69-4ed4-4459-a0d6-64583493475b'),(522,'2024-04-01','2024-06-01','2024-04-26',1,'','maintenance-visits-pdfs/منجم السكري/26-4.pdf','bea7e404-9982-4699-b2f2-dcda373ab5b8',11,'e446bd69-4ed4-4459-a0d6-64583493475b'),(523,'2024-06-01','2024-08-01','2024-06-01',1,'','maintenance-visits-pdfs/منجم السكري/1-6_bhh5fNO.pdf','bea7e404-9982-4699-b2f2-dcda373ab5b8',8,'e446bd69-4ed4-4459-a0d6-64583493475b'),(524,'2024-08-01','2024-10-01','2024-10-20',1,'','maintenance-visits-pdfs/منجم السكري/منجم_السكري_٢٠-١٠.pdf','bea7e404-9982-4699-b2f2-dcda373ab5b8',6,'e446bd69-4ed4-4459-a0d6-64583493475b'),(525,'2024-10-01','2024-12-01',NULL,0,'','','bea7e404-9982-4699-b2f2-dcda373ab5b8',NULL,'e446bd69-4ed4-4459-a0d6-64583493475b'),(526,'2024-12-01','2025-01-31',NULL,0,'','','bea7e404-9982-4699-b2f2-dcda373ab5b8',NULL,'e446bd69-4ed4-4459-a0d6-64583493475b'),(539,'2024-05-01','2024-07-01',NULL,0,'','','333bdaab-341b-4d03-a47e-08fdecae033d',NULL,'a1f2dca7-b446-4996-98a5-dbb146de8f87'),(540,'2024-07-01','2024-09-01',NULL,0,'','','333bdaab-341b-4d03-a47e-08fdecae033d',NULL,'a1f2dca7-b446-4996-98a5-dbb146de8f87'),(541,'2024-09-01','2024-11-01',NULL,0,'','','333bdaab-341b-4d03-a47e-08fdecae033d',NULL,'a1f2dca7-b446-4996-98a5-dbb146de8f87'),(542,'2024-11-01','2025-01-01',NULL,0,'','','333bdaab-341b-4d03-a47e-08fdecae033d',NULL,'a1f2dca7-b446-4996-98a5-dbb146de8f87'),(543,'2025-01-01','2025-03-01',NULL,0,'','','333bdaab-341b-4d03-a47e-08fdecae033d',NULL,'a1f2dca7-b446-4996-98a5-dbb146de8f87'),(544,'2025-03-01','2025-04-30',NULL,0,'','','333bdaab-341b-4d03-a47e-08fdecae033d',NULL,'a1f2dca7-b446-4996-98a5-dbb146de8f87'),(545,'2025-01-01','2025-04-01',NULL,0,'','','354cbc58-3f23-4e52-bd0e-395d538faa4e',NULL,'0eb01ef2-187c-4108-a7fa-a735c72878e8'),(546,'2025-04-01','2025-07-01',NULL,0,'','','354cbc58-3f23-4e52-bd0e-395d538faa4e',NULL,'0eb01ef2-187c-4108-a7fa-a735c72878e8'),(547,'2025-07-01','2025-10-01',NULL,0,'','','354cbc58-3f23-4e52-bd0e-395d538faa4e',NULL,'0eb01ef2-187c-4108-a7fa-a735c72878e8'),(548,'2025-10-01','2025-12-31',NULL,0,'','','354cbc58-3f23-4e52-bd0e-395d538faa4e',NULL,'0eb01ef2-187c-4108-a7fa-a735c72878e8'),(621,'2025-01-01','2025-03-01',NULL,0,'','','b03c5a23-f48e-45d8-947c-c60ab4d7da59',NULL,'d9f6c080-4e95-4585-b47f-381138c077a4'),(622,'2025-03-01','2025-05-01',NULL,0,'','','b03c5a23-f48e-45d8-947c-c60ab4d7da59',NULL,'d9f6c080-4e95-4585-b47f-381138c077a4'),(623,'2025-05-01','2025-07-01',NULL,0,'','','b03c5a23-f48e-45d8-947c-c60ab4d7da59',NULL,'d9f6c080-4e95-4585-b47f-381138c077a4'),(624,'2025-07-01','2025-09-01',NULL,0,'','','b03c5a23-f48e-45d8-947c-c60ab4d7da59',NULL,'d9f6c080-4e95-4585-b47f-381138c077a4'),(625,'2025-09-01','2025-11-01',NULL,0,'','','b03c5a23-f48e-45d8-947c-c60ab4d7da59',NULL,'d9f6c080-4e95-4585-b47f-381138c077a4'),(626,'2025-11-01','2025-12-31',NULL,0,'','','b03c5a23-f48e-45d8-947c-c60ab4d7da59',NULL,'d9f6c080-4e95-4585-b47f-381138c077a4'),(627,'2025-01-01','2025-02-01',NULL,0,'','','28f20a9f-75aa-44f7-8a7a-dffa7e8e9ef8',NULL,'8ce20767-1b47-43bf-b312-c7fa8f5d8792'),(628,'2025-02-01','2025-03-01',NULL,0,'','','28f20a9f-75aa-44f7-8a7a-dffa7e8e9ef8',NULL,'8ce20767-1b47-43bf-b312-c7fa8f5d8792'),(629,'2025-03-01','2025-04-01',NULL,0,'','','28f20a9f-75aa-44f7-8a7a-dffa7e8e9ef8',NULL,'8ce20767-1b47-43bf-b312-c7fa8f5d8792'),(630,'2025-04-01','2025-05-01',NULL,0,'','','28f20a9f-75aa-44f7-8a7a-dffa7e8e9ef8',NULL,'8ce20767-1b47-43bf-b312-c7fa8f5d8792'),(631,'2025-05-01','2025-06-01',NULL,0,'','','28f20a9f-75aa-44f7-8a7a-dffa7e8e9ef8',NULL,'8ce20767-1b47-43bf-b312-c7fa8f5d8792'),(632,'2025-06-01','2025-07-01',NULL,0,'','','28f20a9f-75aa-44f7-8a7a-dffa7e8e9ef8',NULL,'8ce20767-1b47-43bf-b312-c7fa8f5d8792'),(633,'2025-07-01','2025-08-01',NULL,0,'','','28f20a9f-75aa-44f7-8a7a-dffa7e8e9ef8',NULL,'8ce20767-1b47-43bf-b312-c7fa8f5d8792'),(634,'2025-08-01','2025-09-01',NULL,0,'','','28f20a9f-75aa-44f7-8a7a-dffa7e8e9ef8',NULL,'8ce20767-1b47-43bf-b312-c7fa8f5d8792'),(635,'2025-09-01','2025-10-01',NULL,0,'','','28f20a9f-75aa-44f7-8a7a-dffa7e8e9ef8',NULL,'8ce20767-1b47-43bf-b312-c7fa8f5d8792'),(636,'2025-10-01','2025-11-01',NULL,0,'','','28f20a9f-75aa-44f7-8a7a-dffa7e8e9ef8',NULL,'8ce20767-1b47-43bf-b312-c7fa8f5d8792'),(637,'2025-11-01','2025-12-01',NULL,0,'','','28f20a9f-75aa-44f7-8a7a-dffa7e8e9ef8',NULL,'8ce20767-1b47-43bf-b312-c7fa8f5d8792'),(638,'2025-12-01','2025-12-31',NULL,0,'','','28f20a9f-75aa-44f7-8a7a-dffa7e8e9ef8',NULL,'8ce20767-1b47-43bf-b312-c7fa8f5d8792'),(639,'2024-05-01','2024-08-01',NULL,0,'','','da37c682-9218-4d68-bb57-c769e75f370a',NULL,'8288315e-f401-445f-a45f-7d716823ce01'),(640,'2024-08-01','2024-11-01',NULL,0,'','','da37c682-9218-4d68-bb57-c769e75f370a',NULL,'8288315e-f401-445f-a45f-7d716823ce01'),(641,'2024-11-01','2025-02-01',NULL,0,'','','da37c682-9218-4d68-bb57-c769e75f370a',NULL,'8288315e-f401-445f-a45f-7d716823ce01'),(642,'2025-02-01','2025-04-30',NULL,0,'','','da37c682-9218-4d68-bb57-c769e75f370a',NULL,'8288315e-f401-445f-a45f-7d716823ce01'),(643,'2024-05-01','2024-07-01',NULL,0,'','','6b574e81-2a71-4504-90cc-19055eb1b414',NULL,'f51a40b4-5aea-41d7-91c9-aaf5e1928ef7'),(644,'2024-07-01','2024-09-01',NULL,0,'','','6b574e81-2a71-4504-90cc-19055eb1b414',NULL,'f51a40b4-5aea-41d7-91c9-aaf5e1928ef7'),(645,'2024-09-01','2024-11-01',NULL,0,'','','6b574e81-2a71-4504-90cc-19055eb1b414',NULL,'f51a40b4-5aea-41d7-91c9-aaf5e1928ef7'),(646,'2024-11-01','2025-01-01',NULL,0,'','','6b574e81-2a71-4504-90cc-19055eb1b414',NULL,'f51a40b4-5aea-41d7-91c9-aaf5e1928ef7'),(647,'2025-01-01','2025-03-01',NULL,0,'','','6b574e81-2a71-4504-90cc-19055eb1b414',NULL,'f51a40b4-5aea-41d7-91c9-aaf5e1928ef7'),(648,'2025-03-01','2025-04-30',NULL,0,'','','6b574e81-2a71-4504-90cc-19055eb1b414',NULL,'f51a40b4-5aea-41d7-91c9-aaf5e1928ef7');
/*!40000 ALTER TABLE `contracts_maintenanceschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracts_vehicles`
--

DROP TABLE IF EXISTS `contracts_vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contracts_vehicles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `num_vehicles` int unsigned NOT NULL,
  `vehicle_capacity` int unsigned NOT NULL,
  `depot` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `contracts_vehicles_chk_1` CHECK ((`num_vehicles` >= 0)),
  CONSTRAINT `contracts_vehicles_chk_2` CHECK ((`vehicle_capacity` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-11-18 10:30:20.217836','2','ictco',1,'[{\"added\": {}}]',4,1),(2,'2024-11-18 10:30:28.786756','2','ictco',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(3,'2024-11-18 12:20:56.972429','3','eman',1,'[{\"added\": {}}]',4,1),(4,'2024-11-18 12:21:05.669674','3','eman',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(5,'2024-11-18 13:29:20.658858','1','خالد جمال',1,'[{\"added\": {}}]',13,1),(6,'2024-11-18 13:29:20.708679','2','خالد جمال',1,'[{\"added\": {}}]',13,1),(7,'2024-11-18 13:29:31.730354','3','نصر فتحي',1,'[{\"added\": {}}]',13,1),(8,'2024-11-18 13:29:36.661630','1','خالد جمال',3,'',13,1),(9,'2024-11-18 13:29:48.821282','4','علي ابراهيم',1,'[{\"added\": {}}]',13,1),(10,'2024-11-18 13:30:09.424792','5','يحيي عبدالحفيظ',1,'[{\"added\": {}}]',13,1),(11,'2024-11-18 13:30:18.061658','6','كريم شاهين',1,'[{\"added\": {}}]',13,1),(12,'2024-11-18 13:30:29.312656','7','عبدالله محمد',1,'[{\"added\": {}}]',13,1),(13,'2024-11-18 13:30:37.378713','8','مصطفي محمد',1,'[{\"added\": {}}]',13,1),(14,'2024-11-18 13:30:43.254080','9','طارق',1,'[{\"added\": {}}]',13,1),(15,'2024-11-18 13:30:49.525265','10','محمد علي',1,'[{\"added\": {}}]',13,1),(16,'2024-11-26 10:11:12.456768','11','محمد حجازي',1,'[{\"added\": {}}]',13,1),(17,'2024-11-26 10:11:29.584968','11','محمود حجازي',2,'[{\"changed\": {\"fields\": [\"Engineer name\"]}}]',13,1),(18,'2024-12-18 10:47:24.573765','215','Invoice for مصر للاسمنت ( بيتون) on 2024-04-30',1,'[{\"added\": {}}]',15,1),(19,'2024-12-18 10:48:59.046997','216','Invoice for مصر للاسمنت ( بيتون) on 2024-06-30',1,'[{\"added\": {}}]',15,1),(20,'2024-12-18 10:49:48.311038','217','Invoice for مصر للاسمنت ( بيتون) on 2024-08-30',1,'[{\"added\": {}}]',15,1),(21,'2024-12-18 10:53:25.714417','218','Invoice for مصر للاسمنت ( بيتون) on 2024-10-30',1,'[{\"added\": {}}]',15,1),(22,'2024-12-18 10:53:55.670886','219','Invoice for مصر للاسمنت ( بيتون) on 2024-12-30',1,'[{\"added\": {}}]',15,1),(23,'2024-12-18 10:54:46.163894','220','Invoice for مصر للاسمنت ( بيتون) on 2025-02-28',1,'[{\"added\": {}}]',15,1),(24,'2024-12-18 10:55:30.217593','217','Invoice for مصر للاسمنت ( بيتون) on 2024-08-30',2,'[{\"changed\": {\"fields\": [\"Invoice value\"]}}]',15,1),(25,'2024-12-18 10:55:42.934609','216','Invoice for مصر للاسمنت ( بيتون) on 2024-06-30',2,'[{\"changed\": {\"fields\": [\"Invoice value\"]}}]',15,1),(26,'2024-12-18 10:56:09.459867','220','Invoice for مصر للاسمنت ( بيتون) on 2025-02-28',2,'[{\"changed\": {\"fields\": [\"Company Name\"]}}]',15,1),(27,'2024-12-18 10:56:18.671646','219','Invoice for مصر للاسمنت ( بيتون) on 2024-12-30',2,'[{\"changed\": {\"fields\": [\"Company Name\"]}}]',15,1),(28,'2024-12-18 10:56:27.143134','218','Invoice for مصر للاسمنت ( بيتون) on 2024-10-30',2,'[{\"changed\": {\"fields\": [\"Company Name\"]}}]',15,1),(29,'2024-12-18 10:56:33.520071','217','Invoice for مصر للاسمنت ( بيتون) on 2024-08-30',2,'[{\"changed\": {\"fields\": [\"Company Name\"]}}]',15,1),(30,'2024-12-18 10:56:39.471522','216','Invoice for مصر للاسمنت ( بيتون) on 2024-06-30',2,'[{\"changed\": {\"fields\": [\"Company Name\"]}}]',15,1),(31,'2024-12-18 10:56:47.477633','215','Invoice for مصر للاسمنت ( بيتون) on 2024-04-30',2,'[{\"changed\": {\"fields\": [\"Company Name\"]}}]',15,1),(32,'2024-12-24 07:42:44.859975','b49b437f-5928-4bd4-9832-12e653d8bea6','الصف',2,'[{\"changed\": {\"fields\": [\"Sub Company Name\"]}}]',11,1),(33,'2025-01-14 10:08:41.489072','4','Rasha_Salama',1,'[{\"added\": {}}]',4,1),(34,'2025-01-14 10:09:20.890804','4','Rasha_Salama',3,'',4,1),(35,'2025-01-14 10:09:54.601845','5','Rasha_Salama',1,'[{\"added\": {}}]',4,1),(36,'2025-01-14 10:10:09.473198','5','Rasha_Salama',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(37,'2025-01-14 12:26:21.175557','5','Rasha_Salama',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(38,'2025-01-14 12:26:46.393064','3','eman',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(39,'2025-01-14 12:36:03.662561','3','eman',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(40,'2025-01-14 12:36:17.036750','3','eman',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(41,'2025-01-14 12:36:55.446141','3','eman',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(42,'2025-01-14 12:37:58.976302','3','eman',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(43,'2025-01-14 12:52:50.566516','5','Rasha_Salama',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(44,'2025-01-16 07:23:26.531710','12','محم',1,'[{\"added\": {}}]',13,1),(45,'2025-01-16 07:23:51.890196','12','محم',3,'',13,1),(46,'2025-01-16 07:24:05.578675','13','م. محمود صادق',1,'[{\"added\": {}}]',13,1),(47,'2025-01-16 07:24:44.408158','14','أ. السيد محمود',1,'[{\"added\": {}}]',13,1),(48,'2025-01-16 07:25:03.038685','15','أ. محمد محمود',1,'[{\"added\": {}}]',13,1),(49,'2025-01-16 07:25:30.054132','16','أ. احمد محمود',1,'[{\"added\": {}}]',13,1),(50,'2025-01-16 07:29:42.478112','29','Other',1,'[{\"added\": {}}]',8,1),(51,'2025-01-16 07:30:06.225885','160','Other',1,'[{\"added\": {}}]',7,1),(52,'2025-01-16 07:52:17.735654','6','Alex',1,'[{\"added\": {}}]',4,1),(53,'2025-01-16 07:53:01.906393','6','Alex',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(54,'2025-01-16 07:53:08.381210','6','Alex',2,'[]',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_clockedschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_clockedschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_clockedschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clocked_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_clockedschedule`
--

LOCK TABLES `django_celery_beat_clockedschedule` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_clockedschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_clockedschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_crontabschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_crontabschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_crontabschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `minute` varchar(240) NOT NULL,
  `hour` varchar(96) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  `day_of_month` varchar(124) NOT NULL,
  `month_of_year` varchar(64) NOT NULL,
  `timezone` varchar(63) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_crontabschedule`
--

LOCK TABLES `django_celery_beat_crontabschedule` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_crontabschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_crontabschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_intervalschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_intervalschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_intervalschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `every` int NOT NULL,
  `period` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_intervalschedule`
--

LOCK TABLES `django_celery_beat_intervalschedule` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_intervalschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_intervalschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_periodictask`
--

DROP TABLE IF EXISTS `django_celery_beat_periodictask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_periodictask` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime(6) DEFAULT NULL,
  `total_run_count` int unsigned NOT NULL,
  `date_changed` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `crontab_id` int DEFAULT NULL,
  `interval_id` int DEFAULT NULL,
  `solar_id` int DEFAULT NULL,
  `one_off` tinyint(1) NOT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `priority` int unsigned DEFAULT NULL,
  `headers` longtext NOT NULL DEFAULT (_utf8mb3'{}'),
  `clocked_id` int DEFAULT NULL,
  `expire_seconds` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` (`crontab_id`),
  KEY `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` (`interval_id`),
  KEY `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` (`solar_id`),
  KEY `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` (`clocked_id`),
  CONSTRAINT `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` FOREIGN KEY (`clocked_id`) REFERENCES `django_celery_beat_clockedschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` FOREIGN KEY (`crontab_id`) REFERENCES `django_celery_beat_crontabschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` FOREIGN KEY (`interval_id`) REFERENCES `django_celery_beat_intervalschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` FOREIGN KEY (`solar_id`) REFERENCES `django_celery_beat_solarschedule` (`id`),
  CONSTRAINT `django_celery_beat_periodictask_chk_1` CHECK ((`total_run_count` >= 0)),
  CONSTRAINT `django_celery_beat_periodictask_chk_2` CHECK ((`priority` >= 0)),
  CONSTRAINT `django_celery_beat_periodictask_chk_3` CHECK ((`expire_seconds` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_periodictask`
--

LOCK TABLES `django_celery_beat_periodictask` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_periodictask` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_periodictask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_periodictasks`
--

DROP TABLE IF EXISTS `django_celery_beat_periodictasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_periodictasks` (
  `ident` smallint NOT NULL,
  `last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_periodictasks`
--

LOCK TABLES `django_celery_beat_periodictasks` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_periodictasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_periodictasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_solarschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_solarschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_solarschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event` varchar(24) NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq` (`event`,`latitude`,`longitude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_solarschedule`
--

LOCK TABLES `django_celery_beat_solarschedule` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_solarschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_solarschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'Clients','area'),(8,'Clients','city'),(9,'Clients','company'),(11,'Clients','site'),(10,'Clients','subcompany'),(5,'contenttypes','contenttype'),(12,'contracts','contract'),(16,'contracts','emergencyvisits'),(13,'contracts','engineers'),(15,'contracts','invoiceschedule'),(14,'contracts','maintenanceschedule'),(17,'contracts','vehicles'),(23,'django_celery_beat','clockedschedule'),(18,'django_celery_beat','crontabschedule'),(19,'django_celery_beat','intervalschedule'),(20,'django_celery_beat','periodictask'),(21,'django_celery_beat','periodictasks'),(22,'django_celery_beat','solarschedule'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'Clients','0001_initial','2024-11-18 10:19:41.982218'),(2,'Clients','0002_alter_company_area_alter_company_city_and_more','2024-11-18 10:19:42.046026'),(3,'contenttypes','0001_initial','2024-11-18 10:19:42.086075'),(4,'auth','0001_initial','2024-11-18 10:19:42.578188'),(5,'admin','0001_initial','2024-11-18 10:19:42.720369'),(6,'admin','0002_logentry_remove_auto_add','2024-11-18 10:19:42.729053'),(7,'admin','0003_logentry_add_action_flag_choices','2024-11-18 10:19:42.737138'),(8,'contenttypes','0002_remove_content_type_name','2024-11-18 10:19:42.814187'),(9,'auth','0002_alter_permission_name_max_length','2024-11-18 10:19:42.874651'),(10,'auth','0003_alter_user_email_max_length','2024-11-18 10:19:42.894411'),(11,'auth','0004_alter_user_username_opts','2024-11-18 10:19:42.903117'),(12,'auth','0005_alter_user_last_login_null','2024-11-18 10:19:42.952385'),(13,'auth','0006_require_contenttypes_0002','2024-11-18 10:19:42.955687'),(14,'auth','0007_alter_validators_add_error_messages','2024-11-18 10:19:42.963886'),(15,'auth','0008_alter_user_username_max_length','2024-11-18 10:19:43.023517'),(16,'auth','0009_alter_user_last_name_max_length','2024-11-18 10:19:43.090759'),(17,'auth','0010_alter_group_name_max_length','2024-11-18 10:19:43.110832'),(18,'auth','0011_update_proxy_permissions','2024-11-18 10:19:43.145272'),(19,'auth','0012_alter_user_first_name_max_length','2024-11-18 10:19:43.205762'),(20,'contracts','0001_initial','2024-11-18 10:19:43.859599'),(21,'contracts','0002_alter_contract_annual_increase_and_more','2024-11-18 10:19:44.153574'),(22,'contracts','0003_vehicles_alter_contract_annual_increase','2024-11-18 10:19:44.186074'),(23,'sessions','0001_initial','2024-11-18 10:19:44.231008'),(24,'contracts','0004_alter_contract_maintenance_frequency','2024-11-21 08:19:21.150458'),(25,'Clients','0003_company_erp_code_company_tax_registration_number_and_more','2025-01-12 12:32:09.134952'),(26,'contracts','0005_contract_is_taxed_contract_tax_percentage','2025-01-12 12:32:09.310645'),(27,'contracts','0006_contract_renewed','2025-01-15 13:50:32.528891'),(28,'django_celery_beat','0001_initial','2025-01-15 13:50:32.815569'),(29,'django_celery_beat','0002_auto_20161118_0346','2025-01-15 13:50:32.921473'),(30,'django_celery_beat','0003_auto_20161209_0049','2025-01-15 13:50:32.970381'),(31,'django_celery_beat','0004_auto_20170221_0000','2025-01-15 13:50:32.992800'),(32,'django_celery_beat','0005_add_solarschedule_events_choices','2025-01-15 13:50:33.052752'),(33,'django_celery_beat','0006_auto_20180322_0932','2025-01-15 13:50:33.150897'),(34,'django_celery_beat','0007_auto_20180521_0826','2025-01-15 13:50:33.216070'),(35,'django_celery_beat','0008_auto_20180914_1922','2025-01-15 13:50:33.258042'),(36,'django_celery_beat','0006_auto_20180210_1226','2025-01-15 13:50:33.281563'),(37,'django_celery_beat','0006_periodictask_priority','2025-01-15 13:50:33.364811'),(38,'django_celery_beat','0009_periodictask_headers','2025-01-15 13:50:33.465932'),(39,'django_celery_beat','0010_auto_20190429_0326','2025-01-15 13:50:33.756733'),(40,'django_celery_beat','0011_auto_20190508_0153','2025-01-15 13:50:33.874251'),(41,'django_celery_beat','0012_periodictask_expire_seconds','2025-01-15 13:50:33.977867'),(42,'django_celery_beat','0013_auto_20200609_0727','2025-01-15 13:50:33.995188'),(43,'django_celery_beat','0014_remove_clockedschedule_enabled','2025-01-15 13:50:34.029599'),(44,'django_celery_beat','0015_edit_solarschedule_events_choices','2025-01-15 13:50:34.040163'),(45,'django_celery_beat','0016_alter_crontabschedule_timezone','2025-01-15 13:50:34.055609'),(46,'django_celery_beat','0017_alter_crontabschedule_month_of_year','2025-01-15 13:50:34.072352'),(47,'django_celery_beat','0018_improve_crontab_helptext','2025-01-15 13:50:34.087408'),(48,'django_celery_beat','0019_alter_periodictasks_options','2025-01-15 13:50:34.094153');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0q85umdah2bt1bahyazilxefsle972p7','.eJxVjEEOwiAQRe_C2pACQgeX7nsGMjOAVA0kpV0Z765NutDtf-_9lwi4rSVsPS1hjuIijDj9boT8SHUH8Y711iS3ui4zyV2RB-1yajE9r4f7d1Cwl2892ujYR0AClQldMmeXSbPHZMCwY1JoRyDt0YICtKQ8eO1yhjx4N4j3BwC2OCA:1tHhIg:BVy2RBwjGjzisRBrL_08Qs7yNdBZ2dde7OIeCjubSyQ','2024-12-15 10:35:38.103094'),('0ryujcjyfpjqpgobe0uzke3js7h44bp9','.eJxVjDsOwjAQBe_iGlle_xJT0ucM1nq9wQHkSHFSIe5OIqWA9s3Me4uI21ri1niJUxZXAeLyuyWkJ9cD5AfW-yxprusyJXko8qRNDnPm1-10_w4KtrLXyUNI5LPxbNjonkdvbGJwtg-wI2UygSPErDtviDrldOBk3ahIg3Li8wXhTTeR:1tRSsq:ByurOcKWdCd6j3gFjH3ex93GNRX15RvgT1OUgH9c4t0','2025-01-11 09:13:20.023352'),('0tbxk4ec3atk29u6pbklclf6g8y20wi6','.eJxVjEEOwiAQRe_C2pACQgeX7nsGMjOAVA0kpV0Z765NutDtf-_9lwi4rSVsPS1hjuIijDj9boT8SHUH8Y711iS3ui4zyV2RB-1yajE9r4f7d1Cwl2892ujYR0AClQldMmeXSbPHZMCwY1JoRyDt0YICtKQ8eO1yhjx4N4j3BwC2OCA:1tc0L0:uPVWOlA0gdRbbrL2PK_WO4BPVEy-p7uaCsWmHcSICOI','2025-02-09 10:57:58.906123'),('1vrf7099ux4erecgvhbhlhj9xyl3jy8g','.eJxVjDsOwjAQBe_iGlle_xJT0ucM1nq9wQHkSHFSIe5OIqWA9s3Me4uI21ri1niJUxZXAeLyuyWkJ9cD5AfW-yxprusyJXko8qRNDnPm1-10_w4KtrLXyUNI5LPxbNjonkdvbGJwtg-wI2UygSPErDtviDrldOBk3ahIg3Li8wXhTTeR:1tRGv6:TZky9j1CjFtvJcEDf6N5mNYPYeostBcrJSC1TZPNcRc','2025-01-10 20:26:52.523739'),('2aah07nk7x7rjr7v5q6zor7plk7a55gi','.eJxVjEEOwiAQRe_C2pACQgeX7nsGMjOAVA0kpV0Z765NutDtf-_9lwi4rSVsPS1hjuIijDj9boT8SHUH8Y711iS3ui4zyV2RB-1yajE9r4f7d1Cwl2892ujYR0AClQldMmeXSbPHZMCwY1JoRyDt0YICtKQ8eO1yhjx4N4j3BwC2OCA:1tHevN:g6KrEjF9iCinz3ouYSS0FwpnLd6Esr86yECjVJuNa9s','2024-12-15 08:03:25.629666'),('2bfo3loxj5jgjbr56ep2kdx2cdo39y7t','.eJxVjEEOwiAQRe_C2pACQgeX7nsGMjOAVA0kpV0Z765NutDtf-_9lwi4rSVsPS1hjuIijDj9boT8SHUH8Y711iS3ui4zyV2RB-1yajE9r4f7d1Cwl2892ujYR0AClQldMmeXSbPHZMCwY1JoRyDt0YICtKQ8eO1yhjx4N4j3BwC2OCA:1tdPTu:ZGBWT_L02uqRPmsYxNiskeRLOrACl14sGCkisZL6G_E','2025-02-13 08:00:58.975361'),('35v2iwe3mhqhhpjvzl0xcpi8v7u8scel','.eJxVjMsOwiAQRf-FtSFDebt07zeQgQGpGkhKuzL-uzbpQrf3nHNfLOC21rCNvISZ2JlN7PS7RUyP3HZAd2y3zlNv6zJHviv8oINfO-Xn5XD_DiqO-q3BigIChQOp0MhCPhNZ5Ql1ARsVJgSnvU5kDTgJ2ZiiNJgJS_Qkib0_2Oo3zQ:1tPeMX:sYDSfKfSUEMaZkLslfW2AHC0CBYzXf_u60jf5OxCoIY','2025-01-06 09:04:29.425056'),('861tqpg88ws729iebon761bk32wvawhp','.eJxVjEEOwiAQRe_C2pACQgeX7nsGMjOAVA0kpV0Z765NutDtf-_9lwi4rSVsPS1hjuIijDj9boT8SHUH8Y711iS3ui4zyV2RB-1yajE9r4f7d1Cwl2892ujYR0AClQldMmeXSbPHZMCwY1JoRyDt0YICtKQ8eO1yhjx4N4j3BwC2OCA:1tLcUp:yI35R2ICvDc6RmMK9_xfAobO4xOatw8D6KZKRVNiOFc','2024-12-26 06:16:23.077732'),('8wt35cnllb6c7apj3r190adzb21d9zy4','.eJxVjMsOwiAQRf-FtSFDebt07zeQgQGpGkhKuzL-uzbpQrf3nHNfLOC21rCNvISZ2JlN7PS7RUyP3HZAd2y3zlNv6zJHviv8oINfO-Xn5XD_DiqO-q3BigIChQOp0MhCPhNZ5Ql1ARsVJgSnvU5kDTgJ2ZiiNJgJS_Qkib0_2Oo3zQ:1tWGQA:ijzkbH291dlqO12bRL6IRcLV9OzIYLFB5HHIxt5dXH0','2025-01-24 14:55:34.052552'),('90baf6esjaym4y38y42b4312b732inos','.eJxVjEEOwiAQRe_C2pACQgeX7nsGMjOAVA0kpV0Z765NutDtf-_9lwi4rSVsPS1hjuIijDj9boT8SHUH8Y711iS3ui4zyV2RB-1yajE9r4f7d1Cwl2892ujYR0AClQldMmeXSbPHZMCwY1JoRyDt0YICtKQ8eO1yhjx4N4j3BwC2OCA:1tGCwJ:K-BBAWr464UPrRFw63w0WIFXQsKPtIrhYhpANER2c7A','2024-12-11 07:58:23.893947'),('bbm8kd90z1mw4bnrtgmtw1be2dn4yvd4','.eJxVjEEOwiAQRe_C2pACQgeX7nsGMjOAVA0kpV0Z765NutDtf-_9lwi4rSVsPS1hjuIijDj9boT8SHUH8Y711iS3ui4zyV2RB-1yajE9r4f7d1Cwl2892ujYR0AClQldMmeXSbPHZMCwY1JoRyDt0YICtKQ8eO1yhjx4N4j3BwC2OCA:1tMjAz:jOaS9g8mIaNMkiWujGB9zZYZoaLwaH5Yeavv1CmHaB8','2024-12-29 07:36:29.169911'),('bs4pmp1yomz3rrb2o2xi6p0vsttxuwc3','.eJxVjEEOwiAQRe_C2pACQgeX7nsGMjOAVA0kpV0Z765NutDtf-_9lwi4rSVsPS1hjuIijDj9boT8SHUH8Y711iS3ui4zyV2RB-1yajE9r4f7d1Cwl2892ujYR0AClQldMmeXSbPHZMCwY1JoRyDt0YICtKQ8eO1yhjx4N4j3BwC2OCA:1tD0oR:NR0G-N4LLiYR3jJMIRw7SNYZgnHRXV1HVZgALBbRufg','2024-12-02 12:25:03.890014'),('c924qzctefrqejv1zrfyhmgezbayr9jc','.eJxVjDsOwjAQBe_iGlle_xJT0ucM1nq9wQHkSHFSIe5OIqWA9s3Me4uI21ri1niJUxZXAeLyuyWkJ9cD5AfW-yxprusyJXko8qRNDnPm1-10_w4KtrLXyUNI5LPxbNjonkdvbGJwtg-wI2UygSPErDtviDrldOBk3ahIg3Li8wXhTTeR:1tXgPM:Jh3KQdShDfJ7oR4bLha6i15By3JVKBi2ylmxNcnMJxg','2025-01-28 12:52:36.372868'),('d0k0wld5wbalx7nyc03d0a8s0yhvmzpx','.eJxVjEEOwiAQRe_C2pACQgeX7nsGMjOAVA0kpV0Z765NutDtf-_9lwi4rSVsPS1hjuIijDj9boT8SHUH8Y711iS3ui4zyV2RB-1yajE9r4f7d1Cwl2892ujYR0AClQldMmeXSbPHZMCwY1JoRyDt0YICtKQ8eO1yhjx4N4j3BwC2OCA:1tXeNV:Fve_DnT2Qu6HGwrbkf3k4mcsYnH96RS9cSUlYUOSSqs','2025-01-28 10:42:33.640672'),('d74ds77n1m7kyequ31048fcfudrqfjqw','.eJxVjDsOwjAQBe_iGlle_xJT0ucM1nq9wQHkSHFSIe5OIqWA9s3Me4uI21ri1niJUxZXAeLyuyWkJ9cD5AfW-yxprusyJXko8qRNDnPm1-10_w4KtrLXyUNI5LPxbNjonkdvbGJwtg-wI2UygSPErDtviDrldOBk3ahIg3Li8wXhTTeR:1tRSsI:gzg93L9anzxnPcVd2Hpme-5_YH0tvfx_2NKTl-F0LaY','2025-01-11 09:12:46.501999'),('ditximpnv86p22yt5m7c6dsjvtcqgie8','.eJxVjEEOwiAQRe_C2pACQgeX7nsGMjOAVA0kpV0Z765NutDtf-_9lwi4rSVsPS1hjuIijDj9boT8SHUH8Y711iS3ui4zyV2RB-1yajE9r4f7d1Cwl2892ujYR0AClQldMmeXSbPHZMCwY1JoRyDt0YICtKQ8eO1yhjx4N4j3BwC2OCA:1tD0yS:PXJk8T-4c2K-vKaBYoApMMSoqTPmsnM5Ee2XaOXkRaw','2024-12-02 12:35:24.683292'),('ea1ode7bxnknk8h0o2o61oimyf57h7ob','.eJxVjMsOwiAQRf-FtSG8BZfu_QYywIxUDSSlXRn_3TbpQrf3nHPfLMK61LgOnONU2IVZdvrdEuQnth2UB7R757m3ZZ4S3xV-0MFvveDrerh_BxVG3eqQvLLkAhkUSUkyJD0QUiZptSYnBISyScFnf0bjHahsgrbSIoIPyD5f8m84LQ:1tclCJ:oCCkww3xmsNRn3NKI2mWZQ8Cdtv9j8qrmIJ5-eaEwEU','2025-02-11 13:00:07.049690'),('egnfoby989cka8x2g0um0b7f9apqln47','.eJxVjEEOwiAQRe_C2pACQgeX7nsGMjOAVA0kpV0Z765NutDtf-_9lwi4rSVsPS1hjuIijDj9boT8SHUH8Y711iS3ui4zyV2RB-1yajE9r4f7d1Cwl2892ujYR0AClQldMmeXSbPHZMCwY1JoRyDt0YICtKQ8eO1yhjx4N4j3BwC2OCA:1tQnAw:wUDlFkU18EhlTSWJoDNOiRcd1bqCL6a9cxA4767Yzog','2025-01-09 12:41:14.989785'),('es1xj8f47yzfmdwzztudxwwu7s5s7d8w','.eJxVjEEOwiAQRe_C2pACQgeX7nsGMjOAVA0kpV0Z765NutDtf-_9lwi4rSVsPS1hjuIijDj9boT8SHUH8Y711iS3ui4zyV2RB-1yajE9r4f7d1Cwl2892ujYR0AClQldMmeXSbPHZMCwY1JoRyDt0YICtKQ8eO1yhjx4N4j3BwC2OCA:1tDrrm:LNjiVPOyk5SHjGTZ6d594cB9-hMi5-_DpPIUxPhoW18','2024-12-04 21:04:02.559345'),('gswq0avu491kbknt8cmyzmzebhb0q30d','.eJxVjDsOwjAQBe_iGlle_xJT0ucM1nq9wQHkSHFSIe5OIqWA9s3Me4uI21ri1niJUxZXAeLyuyWkJ9cD5AfW-yxprusyJXko8qRNDnPm1-10_w4KtrLXyUNI5LPxbNjonkdvbGJwtg-wI2UygSPErDtviDrldOBk3ahIg3Li8wXhTTeR:1tODtm:6RiCuhXlYrdvP5MCimH_I1F7dU8EJeV5TcC4yQ2fWG8','2025-01-02 10:36:54.520371'),('hjtnln97zr7dhx56mw69f7ip6uapz6mh','.eJxVjMsOwiAQRf-FtSG8BZfu_QYywIxUDSSlXRn_3TbpQrf3nHPfLMK61LgOnONU2IVZdvrdEuQnth2UB7R757m3ZZ4S3xV-0MFvveDrerh_BxVG3eqQvLLkAhkUSUkyJD0QUiZptSYnBISyScFnf0bjHahsgrbSIoIPyD5f8m84LQ:1tXfsU:jp6LY5v27RBO6gVA0heA4L03HTgr4y0--l_U-FVZOYU','2025-01-28 12:18:38.009468'),('k948kz73mvj9sj282mgnmc0ym97ftslb','.eJxVjEEOwiAQRe_C2pACQgeX7nsGMjOAVA0kpV0Z765NutDtf-_9lwi4rSVsPS1hjuIijDj9boT8SHUH8Y711iS3ui4zyV2RB-1yajE9r4f7d1Cwl2892ujYR0AClQldMmeXSbPHZMCwY1JoRyDt0YICtKQ8eO1yhjx4N4j3BwC2OCA:1tDp4N:tUY9OHIcIjN4VpklaZkRq3jGO80henWH4EBtw5ZSCBI','2024-12-04 18:04:51.813116'),('myf6cv57cbbsxo1lgigufeplnvbd78ln','.eJxVjEEOwiAQRe_C2pACQgeX7nsGMjOAVA0kpV0Z765NutDtf-_9lwi4rSVsPS1hjuIijDj9boT8SHUH8Y711iS3ui4zyV2RB-1yajE9r4f7d1Cwl2892ujYR0AClQldMmeXSbPHZMCwY1JoRyDt0YICtKQ8eO1yhjx4N4j3BwC2OCA:1tcmru:gzMtuvUmB5Qsk3w_SCXnOKqiOmgzN_cnoe5ghOy6Jbs','2025-02-11 14:47:10.263186'),('ncj4nb3uv9d4sp65hu898v2nedhaq205','.eJxVjDsOwjAQBe_iGlle_xJT0ucM1nq9wQHkSHFSIe5OIqWA9s3Me4uI21ri1niJUxZXAeLyuyWkJ9cD5AfW-yxprusyJXko8qRNDnPm1-10_w4KtrLXyUNI5LPxbNjonkdvbGJwtg-wI2UygSPErDtviDrldOBk3ahIg3Li8wXhTTeR:1tNrUb:zVsFaWD1e4vdljS17A4VlRhfXMoStjnR4pimm0iWDAY','2025-01-01 10:41:25.553547'),('qk39qh6dsqqjrhyvumlumda245hbn54y','.eJxVjDsOwjAQBe_iGlle_xJT0ucM1nq9wQHkSHFSIe5OIqWA9s3Me4uI21ri1niJUxZXAeLyuyWkJ9cD5AfW-yxprusyJXko8qRNDnPm1-10_w4KtrLXyUNI5LPxbNjonkdvbGJwtg-wI2UygSPErDtviDrldOBk3ahIg3Li8wXhTTeR:1tKDtr:chlzlO1TLZktOZgm6LWNqUCsyTE1mb0pHqh_1QcK6Cs','2024-12-22 09:48:27.296953'),('u1zosfkceredb4im3r5j6wi0yf4u8zx0','.eJxVjEEOwiAQRe_C2pACQgeX7nsGMjOAVA0kpV0Z765NutDtf-_9lwi4rSVsPS1hjuIijDj9boT8SHUH8Y711iS3ui4zyV2RB-1yajE9r4f7d1Cwl2892ujYR0AClQldMmeXSbPHZMCwY1JoRyDt0YICtKQ8eO1yhjx4N4j3BwC2OCA:1tDe7Q:9NRsS3O0Pz-niPjI_R1GnRVihdsYqdEP_kgpm4nxUmY','2024-12-04 06:23:16.348164'),('vkr0ba1haypldv6nlzizdsohuhzyvu1a','.eJxVjDsOwjAQBe_iGlle_xJT0ucM1nq9wQHkSHFSIe5OIqWA9s3Me4uI21ri1niJUxZXAeLyuyWkJ9cD5AfW-yxprusyJXko8qRNDnPm1-10_w4KtrLXyUNI5LPxbNjonkdvbGJwtg-wI2UygSPErDtviDrldOBk3ahIg3Li8wXhTTeR:1tYKjd:77HtJc2hu1QbXQXJtjaxuYKtX1CzUUpr4VBdC-1r28w','2025-01-30 07:56:13.569631'),('xkunrec7cpmr3thjredtwxrx0l13ssas','.eJxVjDsOwjAQBe_iGlle_xJT0ucM1nq9wQHkSHFSIe5OIqWA9s3Me4uI21ri1niJUxZXAeLyuyWkJ9cD5AfW-yxprusyJXko8qRNDnPm1-10_w4KtrLXyUNI5LPxbNjonkdvbGJwtg-wI2UygSPErDtviDrldOBk3ahIg3Li8wXhTTeR:1tYLHc:Df94Y_Yj0bE64smQdszD0KJ0FvUKN4VqdVEeGyUVlac','2025-01-30 08:31:20.252204'),('z1kqxpuu3jls0y3bnliodu50ngxh129j','.eJxVjEEOwiAQRe_C2pACQgeX7nsGMjOAVA0kpV0Z765NutDtf-_9lwi4rSVsPS1hjuIijDj9boT8SHUH8Y711iS3ui4zyV2RB-1yajE9r4f7d1Cwl2892ujYR0AClQldMmeXSbPHZMCwY1JoRyDt0YICtKQ8eO1yhjx4N4j3BwC2OCA:1tLcVN:3T7yv9pB84TO80niDdZCqParoYAU18KHr_hK1iWFHbs','2024-12-26 06:16:57.542534');
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

-- Dump completed on 2025-01-30  9:46:02
