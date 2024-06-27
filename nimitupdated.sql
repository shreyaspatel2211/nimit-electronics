-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: localhost    Database: nimit_electronics_live
-- ------------------------------------------------------
-- Server version	8.0.37-0ubuntu0.20.04.3

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'iPad','2024-05-27 01:49:00','2024-06-03 04:48:22'),(2,'Tablet','2024-05-27 01:49:00','2024-06-03 04:48:08'),(3,'Mobile','2024-05-27 01:50:00','2024-06-03 04:47:59');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `companies_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Vivo','Vivo','1234567890','company1@gmail.com','2024-05-27 01:50:00','2024-06-24 07:55:05'),(2,'Apple','Apple','1234567890','company2@gmail.com','2024-05-27 01:50:00','2024-06-24 07:55:11'),(3,'Oppo','Oppo','2345678901','company3@gmail.com','2024-05-27 01:51:00','2024-06-24 07:54:59'),(4,'Samsung','Samsung','1234567890','samsung@gmail.com','2024-06-03 04:49:00','2024-06-24 07:54:53');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_rows` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int unsigned NOT NULL,
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),(2,1,'name','text','Name',1,1,1,1,1,1,NULL,2),(3,1,'email','text','Email',1,1,1,1,1,1,NULL,3),(4,1,'password','password','Password',1,0,0,1,1,0,NULL,4),(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,NULL,5),(6,1,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,6),(7,1,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),(8,1,'avatar','image','Avatar',0,1,1,1,1,1,NULL,8),(9,1,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}',10),(10,1,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),(11,1,'settings','hidden','Settings',0,0,0,0,0,0,NULL,12),(12,2,'id','number','ID',1,0,0,0,0,0,NULL,1),(13,2,'name','text','Name',1,1,1,1,1,1,NULL,2),(14,2,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(15,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(16,3,'id','number','ID',1,0,0,0,0,0,NULL,1),(17,3,'name','text','Name',1,1,1,1,1,1,NULL,2),(18,3,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(19,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(20,3,'display_name','text','Display Name',1,1,1,1,1,1,NULL,5),(21,1,'role_id','text','Role',1,1,1,1,1,1,NULL,9),(37,8,'id','text','Id',1,0,0,0,0,0,'{}',1),(38,8,'name','text','Name',1,1,1,1,1,1,'{}',5),(39,8,'description','rich_text_box','Description',0,0,0,0,0,0,'{}',17),(40,8,'price','text','Price (MOP)',1,1,1,1,1,1,'{}',6),(41,8,'quantity','text','Quantity',0,0,0,0,0,0,'{}',19),(43,8,'category_id','select_dropdown','Category Id',0,0,0,0,0,0,'{}',2),(44,8,'company_id','select_dropdown','Company Id',1,1,1,1,1,1,'{}',3),(45,8,'created_at','timestamp','Created At',0,0,1,1,0,1,'{}',11),(46,8,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',20),(47,10,'id','text','Id',1,0,0,0,0,0,'{}',1),(48,10,'name','text','Name',1,1,1,1,1,1,'{}',2),(49,10,'address','text','Address',1,1,1,1,1,1,'{}',3),(50,10,'phone_number','text','Phone Number',1,1,1,1,1,1,'{}',4),(51,10,'email','text','Email',1,1,1,1,1,1,'{}',5),(52,10,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',6),(53,10,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',7),(54,9,'id','text','Id',1,0,0,0,0,0,'{}',1),(55,9,'name','text','Name',1,1,1,1,1,1,'{}',2),(56,9,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',3),(57,9,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',4),(61,8,'product_belongsto_company_relationship','relationship','Company',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\Company\",\"table\":\"companies\",\"type\":\"belongsTo\",\"column\":\"company_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}',10),(62,8,'product_belongsto_category_relationship','relationship','Category',0,0,0,0,0,0,'{\"model\":\"App\\\\Models\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}',16),(63,11,'id','text','Id',1,0,0,0,0,0,'{}',1),(64,11,'shop_name','text','Shop Name',1,1,1,1,1,1,'{}',2),(65,11,'shop_email','text','Shop Email',1,1,1,1,1,1,'{}',3),(66,11,'shop_phone','text','Shop Phone',1,1,1,1,1,1,'{}',4),(67,11,'shop_address','text','Shop Address',1,1,1,1,1,1,'{}',5),(68,11,'shop_website','text','Shop Website',0,1,1,1,1,1,'{}',6),(69,11,'owner_name','text','Owner Name',1,1,1,1,1,1,'{}',7),(70,11,'owner_email','text','Owner Email',1,1,1,1,1,1,'{}',8),(71,11,'owner_phone','text','Owner Phone',1,1,1,1,1,1,'{}',9),(72,11,'owner_address','text','Owner Address',0,1,1,1,1,1,'{}',10),(73,11,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',11),(74,11,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',12),(75,8,'product_hasmany_shop_relationship','relationship','Shops',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\Shop\",\"table\":\"shops\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"shop_name\",\"pivot_table\":\"shop_product\",\"pivot\":\"1\",\"taggable\":\"0\"}',14),(76,8,'enable','checkbox','Enable',1,1,1,1,1,1,'{\"checked\":\"true\"}',12),(77,11,'shop_hasmany_product_relationship','relationship','products',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\Product\",\"table\":\"products\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"shop_product\",\"pivot\":\"1\",\"taggable\":\"0\"}',13),(78,8,'images','multiple_images','Images',0,1,1,1,1,1,'{}',9),(79,8,'operating_system','text','Operating System',0,0,0,0,0,0,'{}',21),(80,8,'ram_memory','text','Ram Memory',0,0,0,0,0,0,'{}',22),(81,8,'model','text','Model',0,1,1,1,1,1,'{}',13),(82,8,'product_dimensions','text','Product Dimensions',0,0,0,0,0,0,'{}',18),(84,8,'colour','text','Colour',0,0,0,0,0,0,'{}',23),(85,8,'weight','text','Weight',0,0,0,0,0,0,'{}',24),(87,8,'features','text','Features',0,0,0,0,0,0,'{}',25),(88,8,'storage','text','Storage',0,0,0,0,0,0,'{}',26),(89,8,'technical_details','rich_text_box','Technical Details',0,0,0,0,0,0,'{}',27),(90,8,'code','text','Code',0,0,0,0,0,0,'{}',4),(91,14,'id','text','Id',1,0,0,0,0,0,'{}',1),(92,14,'title','text','Title',1,1,1,1,1,1,'{}',2),(93,14,'description','text','Description',1,1,1,1,1,1,'{}',3),(94,14,'discount','text','Discount',1,1,1,1,1,1,'{}',5),(95,14,'discount_type','select_dropdown','Discount Type',1,1,1,1,1,1,'{\"options\":{\"flat\":\"Flat\",\"percentage\":\"Percentage\"}}',4),(96,14,'valid_from','date','Valid From',1,1,1,1,1,1,'{}',6),(97,14,'valid_until','date','Valid Until',1,1,1,1,1,1,'{}',7),(98,14,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',8),(99,14,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',9),(100,14,'offer_belongstomany_product_relationship','relationship','products',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\Product\",\"table\":\"products\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"products_offers\",\"pivot\":\"1\",\"taggable\":\"0\"}',10),(101,8,'product_belongstomany_offer_relationship','relationship','offers',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\Offer\",\"table\":\"offers\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"products_offers\",\"pivot\":\"1\",\"taggable\":\"0\"}',8),(102,1,'user_belongstomany_shop_relationship','relationship','shops',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\Shop\",\"table\":\"shops\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"shop_name\",\"pivot_table\":\"user_shops\",\"pivot\":\"1\",\"taggable\":null}',13),(103,8,'all_shops','checkbox','All Shops',0,1,1,1,1,1,'{}',15),(104,8,'net_landing_cost','text','Net Landing Cost',0,1,1,1,1,1,'{}',7);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','TCG\\Voyager\\Http\\Controllers\\VoyagerUserController','',1,0,NULL,'2024-05-23 02:37:34','2024-05-23 02:37:34'),(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2024-05-23 02:37:34','2024-05-23 02:37:34'),(3,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController','',1,0,NULL,'2024-05-23 02:37:34','2024-05-23 02:37:34'),(8,'products','products','Product','Products','voyager-phone','App\\Models\\Product',NULL,NULL,NULL,1,1,'{\"order_column\":null,\"order_display_column\":\"code\",\"order_direction\":\"asc\",\"default_search_key\":\"name\",\"scope\":null}','2024-05-23 06:17:26','2024-06-25 14:03:26'),(9,'categories','categories','Category','Categories','voyager-categories','App\\Models\\Category',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2024-05-23 06:19:26','2024-05-23 07:05:39'),(10,'companies','companies','Company','Companies','voyager-company','App\\Models\\Company',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2024-05-23 06:22:24','2024-05-23 07:07:31'),(11,'shops','shops','Shop','Shops','voyager-shop','App\\Models\\Shop',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2024-05-23 23:41:04','2024-05-24 00:13:58'),(14,'offers','offers','Offer','Offers','voyager-gift','App\\Models\\Offer',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2024-06-05 00:40:27','2024-06-05 00:59:04');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2024-05-23 02:37:35','2024-05-23 02:37:35','voyager.dashboard',NULL),(2,1,'Media','','_self','voyager-images',NULL,NULL,4,'2024-05-23 02:37:35','2024-05-23 06:10:29','voyager.media.index',NULL),(3,1,'Users','','_self','voyager-person','#000000',NULL,3,'2024-05-23 02:37:35','2024-05-23 05:23:37','voyager.users.index','null'),(4,1,'Roles','','_self','voyager-lock',NULL,NULL,2,'2024-05-23 02:37:35','2024-05-23 02:37:35','voyager.roles.index',NULL),(5,1,'Tools','','_self','voyager-tools',NULL,NULL,5,'2024-05-23 02:37:35','2024-05-23 06:10:29',NULL,NULL),(6,1,'Menu Builder','','_self','voyager-list',NULL,5,1,'2024-05-23 02:37:35','2024-05-23 06:10:29','voyager.menus.index',NULL),(7,1,'Database','','_self','voyager-data',NULL,5,2,'2024-05-23 02:37:35','2024-05-23 06:10:29','voyager.database.index',NULL),(8,1,'Compass','','_self','voyager-compass',NULL,5,3,'2024-05-23 02:37:35','2024-05-23 06:10:29','voyager.compass.index',NULL),(9,1,'BREAD','','_self','voyager-bread',NULL,5,4,'2024-05-23 02:37:35','2024-05-23 06:10:29','voyager.bread.index',NULL),(10,1,'Settings','','_self','voyager-settings',NULL,NULL,6,'2024-05-23 02:37:35','2024-05-23 06:10:29','voyager.settings.index',NULL),(16,1,'Products','','_self','voyager-phone','#000000',NULL,9,'2024-05-23 06:17:26','2024-05-23 07:08:40','voyager.products.index','null'),(17,1,'Categories','','_self','voyager-categories','#000000',NULL,10,'2024-05-23 06:19:26','2024-05-23 07:06:39','voyager.categories.index','null'),(18,1,'Companies','','_self','voyager-company','#000000',NULL,11,'2024-05-23 06:22:24','2024-05-23 07:07:17','voyager.companies.index','null'),(19,1,'Shops','','_self','voyager-shop',NULL,NULL,12,'2024-05-23 23:41:04','2024-05-23 23:41:04','voyager.shops.index',NULL),(20,1,'Offers','','_self','voyager-gift',NULL,NULL,13,'2024-06-05 00:40:27','2024-06-05 00:40:27','voyager.offers.index',NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'admin','2024-05-23 02:37:35','2024-05-23 02:37:35');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2016_01_01_000000_add_voyager_user_fields',1),(4,'2016_01_01_000000_create_data_types_table',1),(5,'2016_05_19_173453_create_menu_table',1),(6,'2016_10_21_190000_create_roles_table',1),(7,'2016_10_21_190000_create_settings_table',1),(8,'2016_11_30_135954_create_permission_table',1),(9,'2016_11_30_141208_create_permission_role_table',1),(10,'2016_12_26_201236_data_types__add__server_side',1),(11,'2017_01_13_000000_add_route_to_menu_items_table',1),(12,'2017_01_14_005015_create_translations_table',1),(13,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(14,'2017_03_06_000000_add_controller_to_data_types_table',1),(15,'2017_04_21_000000_add_order_to_data_rows_table',1),(16,'2017_07_05_210000_add_policyname_to_data_types_table',1),(17,'2017_08_05_000000_add_group_to_settings_table',1),(18,'2017_11_26_013050_add_user_role_relationship',1),(19,'2017_11_26_015000_create_user_roles_table',1),(20,'2018_03_11_000000_add_user_settings',1),(21,'2018_03_14_000000_add_details_to_data_types_table',1),(22,'2018_03_16_000000_make_settings_value_nullable',1),(23,'2019_08_19_000000_create_failed_jobs_table',1),(24,'2019_12_14_000001_create_personal_access_tokens_table',1),(25,'2024_05_23_071648_create_category_table',1),(26,'2024_05_23_072505_create_company_table',2),(27,'2024_05_23_075138_create_category_table',3),(28,'2024_05_23_075224_create_company_table',4),(29,'2024_05_23_075416_create_product_table',5),(30,'2024_05_23_080200_create_product_table',6),(31,'2024_05_23_112655_create_categories_table',7),(32,'2024_05_23_112735_create_companies_table',8),(33,'2024_05_23_112807_create_products_table',9),(34,'2024_05_24_042732_add_enable_to_products_table',10),(35,'2024_05_24_044525_create_shops_table',11),(36,'2024_05_24_050218_create_shop_product_table',12),(37,'2016_01_01_000000_create_pages_table',13),(38,'2016_01_01_000000_create_posts_table',13),(39,'2016_02_15_204651_create_categories_table',14),(40,'2017_04_11_000000_alter_post_nullable_fields_table',14),(42,'2024_05_27_064906_create_companies_table',15),(43,'2024_05_27_070822_create_categories_table',16),(44,'2024_05_27_070903_create_companies_table',17),(45,'2024_05_27_071000_create_products_table',18),(46,'2024_05_27_071216_create_shops_table',19),(47,'2024_05_27_071324_create_shop_product_table',20),(48,'2024_05_27_073507_create_add_fields_products_table',21),(49,'2024_05_27_074424_create_alter_image_products_table',22),(50,'2024_05_27_075020_create_add_image_products_table',23),(51,'2024_05_27_080105_create_products_table',24),(52,'2024_05_27_080204_create_shop_product_table',25),(53,'2024_06_03_080009_add_code_to_ptoduct',26),(54,'2024_06_05_052808_create_offers_table',27),(55,'2024_06_05_055445_create_products_offers_table',28);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` decimal(8,2) NOT NULL,
  `discount_type` enum('flat','percentage') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `valid_from` date NOT NULL,
  `valid_until` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
INSERT INTO `offers` VALUES (1,'offer1','afjkkgjdvbnd',20.00,'percentage','2024-06-05','2024-06-30','2024-06-05 00:46:00','2024-06-05 00:51:50'),(2,'offer2','hdsfg wjlkfhkjewkfd',200.00,'flat','2024-06-04','2024-07-07','2024-06-05 00:47:00','2024-06-05 00:51:15'),(3,'offer3','afjkkgjdvbnd',10.00,'percentage','2024-06-05','2024-07-07','2024-06-05 06:22:47','2024-06-05 06:22:47'),(4,'test','testing',30.00,'flat','2023-12-12','2024-07-01','2024-06-14 11:28:14','2024-06-14 11:28:14'),(5,'testing','testing desc',30.00,'percentage','2033-03-12','4352-03-12','2024-06-14 11:45:36','2024-06-14 11:45:36'),(6,'Special Offer','Its a festival offer',50.00,'percentage','2024-06-12','2024-07-12','2024-06-14 11:59:57','2024-06-14 11:59:57'),(7,'offere4','offer4',100.00,'flat','2024-06-18','2024-06-30','2024-06-17 11:48:22','2024-06-17 11:48:22');
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_role` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1),(1,2),(1,3),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(16,2),(17,1),(17,2),(18,1),(18,2),(19,1),(19,2),(20,1),(21,1),(21,2),(22,1),(22,2),(23,1),(23,2),(24,1),(24,2),(25,1),(25,2),(41,1),(41,2),(41,3),(42,1),(42,2),(42,3),(43,1),(43,2),(44,1),(44,2),(45,1),(45,2),(46,1),(46,2),(46,3),(47,1),(47,2),(47,3),(48,1),(48,2),(49,1),(49,2),(50,1),(50,2),(51,1),(51,2),(52,1),(52,2),(53,1),(53,2),(54,1),(54,2),(55,1),(55,2),(56,1),(56,2),(57,1),(57,2),(58,1),(58,2),(59,1),(59,2),(60,1),(60,2),(61,1),(61,2),(62,1),(62,2),(63,1),(63,2),(64,1),(64,2),(65,1),(65,2);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2024-05-23 02:37:35','2024-05-23 02:37:35'),(2,'browse_bread',NULL,'2024-05-23 02:37:35','2024-05-23 02:37:35'),(3,'browse_database',NULL,'2024-05-23 02:37:35','2024-05-23 02:37:35'),(4,'browse_media',NULL,'2024-05-23 02:37:35','2024-05-23 02:37:35'),(5,'browse_compass',NULL,'2024-05-23 02:37:35','2024-05-23 02:37:35'),(6,'browse_menus','menus','2024-05-23 02:37:35','2024-05-23 02:37:35'),(7,'read_menus','menus','2024-05-23 02:37:35','2024-05-23 02:37:35'),(8,'edit_menus','menus','2024-05-23 02:37:35','2024-05-23 02:37:35'),(9,'add_menus','menus','2024-05-23 02:37:35','2024-05-23 02:37:35'),(10,'delete_menus','menus','2024-05-23 02:37:35','2024-05-23 02:37:35'),(11,'browse_roles','roles','2024-05-23 02:37:35','2024-05-23 02:37:35'),(12,'read_roles','roles','2024-05-23 02:37:35','2024-05-23 02:37:35'),(13,'edit_roles','roles','2024-05-23 02:37:35','2024-05-23 02:37:35'),(14,'add_roles','roles','2024-05-23 02:37:35','2024-05-23 02:37:35'),(15,'delete_roles','roles','2024-05-23 02:37:35','2024-05-23 02:37:35'),(16,'browse_users','users','2024-05-23 02:37:35','2024-05-23 02:37:35'),(17,'read_users','users','2024-05-23 02:37:35','2024-05-23 02:37:35'),(18,'edit_users','users','2024-05-23 02:37:35','2024-05-23 02:37:35'),(19,'add_users','users','2024-05-23 02:37:35','2024-05-23 02:37:35'),(20,'delete_users','users','2024-05-23 02:37:35','2024-05-23 02:37:35'),(21,'browse_settings','settings','2024-05-23 02:37:35','2024-05-23 02:37:35'),(22,'read_settings','settings','2024-05-23 02:37:35','2024-05-23 02:37:35'),(23,'edit_settings','settings','2024-05-23 02:37:35','2024-05-23 02:37:35'),(24,'add_settings','settings','2024-05-23 02:37:35','2024-05-23 02:37:35'),(25,'delete_settings','settings','2024-05-23 02:37:35','2024-05-23 02:37:35'),(41,'browse_products','products','2024-05-23 06:17:26','2024-05-23 06:17:26'),(42,'read_products','products','2024-05-23 06:17:26','2024-05-23 06:17:26'),(43,'edit_products','products','2024-05-23 06:17:26','2024-05-23 06:17:26'),(44,'add_products','products','2024-05-23 06:17:26','2024-05-23 06:17:26'),(45,'delete_products','products','2024-05-23 06:17:26','2024-05-23 06:17:26'),(46,'browse_categories','categories','2024-05-23 06:19:26','2024-05-23 06:19:26'),(47,'read_categories','categories','2024-05-23 06:19:26','2024-05-23 06:19:26'),(48,'edit_categories','categories','2024-05-23 06:19:26','2024-05-23 06:19:26'),(49,'add_categories','categories','2024-05-23 06:19:26','2024-05-23 06:19:26'),(50,'delete_categories','categories','2024-05-23 06:19:26','2024-05-23 06:19:26'),(51,'browse_companies','companies','2024-05-23 06:22:24','2024-05-23 06:22:24'),(52,'read_companies','companies','2024-05-23 06:22:24','2024-05-23 06:22:24'),(53,'edit_companies','companies','2024-05-23 06:22:24','2024-05-23 06:22:24'),(54,'add_companies','companies','2024-05-23 06:22:24','2024-05-23 06:22:24'),(55,'delete_companies','companies','2024-05-23 06:22:24','2024-05-23 06:22:24'),(56,'browse_shops','shops','2024-05-23 23:41:04','2024-05-23 23:41:04'),(57,'read_shops','shops','2024-05-23 23:41:04','2024-05-23 23:41:04'),(58,'edit_shops','shops','2024-05-23 23:41:04','2024-05-23 23:41:04'),(59,'add_shops','shops','2024-05-23 23:41:04','2024-05-23 23:41:04'),(60,'delete_shops','shops','2024-05-23 23:41:04','2024-05-23 23:41:04'),(61,'browse_offers','offers','2024-06-05 00:40:27','2024-06-05 00:40:27'),(62,'read_offers','offers','2024-06-05 00:40:27','2024-06-05 00:40:27'),(63,'edit_offers','offers','2024-06-05 00:40:27','2024-06-05 00:40:27'),(64,'add_offers','offers','2024-06-05 00:40:27','2024-06-05 00:40:27'),(65,'delete_offers','offers','2024-06-05 00:40:27','2024-06-05 00:40:27');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` decimal(8,2) NOT NULL,
  `quantity` int DEFAULT '0',
  `images` json DEFAULT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `company_id` bigint unsigned NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `operating_system` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ram_memory` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_dimensions` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colour` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(8,2) DEFAULT NULL,
  `features` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `storage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `technical_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `all_shops` tinyint DEFAULT NULL,
  `net_landing_cost` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_company_id_foreign` (`company_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (18,'iphone15','<p>iphone15</p>',25000.00,6,'[\"products/June2024/BJSGQHkwbQVjEgdGwrTL.png\"]',3,2,1,'ios','‎8 GB',NULL,'‎16.1 x 0.9 x 7.4 cm; 205 g','Black',250.00,'Glass Back Design with colour-blocked pattern, IP68 Water Resistant, Corning® Gorilla® Glass Victus® Protection, Camera: 200MP Main Camera with Samsung ISOCELL HP3 sensor, 8MP Ultrawide and 2MP Macro (2x,4x Lossless In-sensor zoom, OIS + EIS)| 16MP Front (Selfie) Camera; 7P lens, Dual LED Flash, In-Display Fingerprint Sensor with Heart rate detection | IR Blaster','128','<p>vdfdfds</p>','2024-06-24 08:23:00','2024-06-25 12:57:20','iphone15',0,'45000'),(19,'oppo','<p>dfdsf</p>',25000.00,5,'[\"products/June2024/gzSNLEUfrtZSZuD6JC8G.jpeg\"]',2,3,1,'‎Android 13, MIUI 14','‎8 GB','‎MZB0G4BIN','‎16.1 x 0.9 x 7.4 cm; 205 g','Black',250.00,'Glass Back Design with colour-blocked pattern, IP68 Water Resistant, Corning® Gorilla® Glass Victus® Protection, Camera: 200MP Main Camera with Samsung ISOCELL HP3 sensor, 8MP Ultrawide and 2MP Macro (2x,4x Lossless In-sensor zoom, OIS + EIS)| 16MP Front (Selfie) Camera; 7P lens, Dual LED Flash, In-Display Fingerprint Sensor with Heart rate detection | IR Blaster','128','<p>dfdfsda</p>','2024-06-24 09:44:00','2024-06-25 10:49:56','oppo',1,NULL),(20,'oppo','<p>svsvdsv</p>',700000.00,5,'[\"products/June2024/UGCJaWGL6SuhCGKnPHGr.png\"]',2,3,0,NULL,NULL,'‎MZB0G4BIN','‎16.1 x 0.9 x 7.4 cm; 205 g','Black',250.00,'Glass Back Design with colour-blocked pattern, IP68 Water Resistant, Corning® Gorilla® Glass Victus® Protection, Camera: 200MP Main Camera with Samsung ISOCELL HP3 sensor, 8MP Ultrawide and 2MP Macro (2x,4x Lossless In-sensor zoom, OIS + EIS)| 16MP Front (Selfie) Camera; 7P lens, Dual LED Flash, In-Display Fingerprint Sensor with Heart rate detection | IR Blaster','128','<p>dsfdsv</p>','2024-06-24 10:21:00','2024-06-25 14:05:56','oppo1',0,'45000'),(23,'Iphone 15',NULL,50000.00,0,'[\"products/June2024/Y7nWwKBUWfqefpn2G5C4.png\"]',NULL,2,1,NULL,NULL,'STRP',NULL,NULL,NULL,NULL,NULL,NULL,'2024-06-25 12:45:00','2024-06-25 14:06:46',NULL,0,'45000'),(28,'Iphone 10',NULL,30000.00,0,'[\"products/June2024/vqLfZ4Nk76sWiZp37mAd.webp\"]',NULL,2,1,NULL,NULL,'STRP',NULL,NULL,NULL,NULL,NULL,NULL,'2024-06-25 13:13:00','2024-06-25 13:33:32',NULL,1,'28000');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_offers`
--

DROP TABLE IF EXISTS `products_offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_offers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `offer_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_offers_offer_id_foreign` (`offer_id`),
  KEY `products_offers_product_id_foreign` (`product_id`),
  CONSTRAINT `products_offers_offer_id_foreign` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_offers_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_offers`
--

LOCK TABLES `products_offers` WRITE;
/*!40000 ALTER TABLE `products_offers` DISABLE KEYS */;
INSERT INTO `products_offers` VALUES (20,3,19,NULL,NULL),(22,1,18,NULL,NULL),(23,1,23,NULL,NULL),(28,4,28,NULL,NULL);
/*!40000 ALTER TABLE `products_offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Administrator','2024-05-23 02:37:35','2024-05-23 02:37:35'),(2,'Deluxe Mobile Admin','Deluxe Mobile Admin','2024-05-23 02:37:35','2024-06-24 07:43:56'),(3,'Shop','Shop','2024-06-13 08:03:48','2024-06-24 07:41:09');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site.title','Site Title','Deluxe mobile','','text',1,'Site'),(2,'site.description','Site Description','Discover the latest electronics at Deluxe mobile','','text',2,'Site'),(3,'site.logo','Site Logo','','','image',3,'Site'),(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID',NULL,'','text',4,'Site'),(5,'admin.bg_image','Admin Background Image','settings/June2024/fvb7nIuBax9rEjDZbZ3x.png','','image',5,'Admin'),(6,'admin.title','Admin Title','Deluxe mobile','','text',1,'Admin'),(7,'admin.description','Admin Description','Discover the latest in cutting-edge electronics at Deluxe Mobile','','text',2,'Admin'),(8,'admin.loader','Admin Loader','settings/June2024/AXNf600wSfYkh1aqdpfo.png','','image',3,'Admin'),(9,'admin.icon_image','Admin Icon Image','settings/June2024/ncsCeoFrCpI1gg9u1UwE.png','','image',4,'Admin'),(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)',NULL,'','text',1,'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_product`
--

DROP TABLE IF EXISTS `shop_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_product` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_product_shop_id_foreign` (`shop_id`),
  KEY `shop_product_product_id_foreign` (`product_id`),
  CONSTRAINT `shop_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `shop_product_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product`
--

LOCK TABLES `shop_product` WRITE;
/*!40000 ALTER TABLE `shop_product` DISABLE KEYS */;
INSERT INTO `shop_product` VALUES (12,1,18,NULL,NULL),(14,7,20,NULL,NULL),(17,1,19,NULL,NULL),(18,7,19,NULL,NULL),(19,1,23,NULL,NULL);
/*!40000 ALTER TABLE `shop_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops`
--

DROP TABLE IF EXISTS `shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shops_shop_email_unique` (`shop_email`),
  UNIQUE KEY `shops_owner_email_unique` (`owner_email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops`
--

LOCK TABLES `shops` WRITE;
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops` VALUES (1,'shop1','shop1@gmail.com','1234567890','dsafdsfsaf','daksdkajh','shop1','shop1owner@gmail.com','1234322552','dsfsggffd','2024-05-27 01:52:19','2024-05-27 01:52:19'),(7,'shop2','shop2@gmail.com','1234567890','gift city','shop website','shop2owner','shop2owner@gmail.com','1234567890','gift city','2024-06-17 11:39:19','2024-06-17 11:39:19');
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int unsigned NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (9,2);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_shops`
--

DROP TABLE IF EXISTS `user_shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_shops` (
  `user_id` bigint unsigned NOT NULL,
  `shop_id` bigint unsigned NOT NULL,
  KEY `user_shops_user_id_foreign` (`user_id`),
  KEY `user_shops_shop_id_foreign` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_shops`
--

LOCK TABLES `user_shops` WRITE;
/*!40000 ALTER TABLE `user_shops` DISABLE KEYS */;
INSERT INTO `user_shops` VALUES (19,1),(19,2),(18,1),(18,2),(10,1),(12,1),(6,2),(6,1),(17,1),(15,2),(19,1),(19,2),(18,1),(18,2),(10,1),(12,1),(6,2),(6,1),(17,1),(15,2),(19,1),(19,2),(18,1),(18,2),(10,1),(12,1),(6,2),(6,1),(17,1),(15,2),(9,1),(9,7),(8,1);
/*!40000 ALTER TABLE `user_shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'superadmin','superadmin@email.com','users/default.png',NULL,'$2y$12$NfpwodspNqDXLonhE7Vm0u28Gbet2o/QpwZ/OZhsISChZVLomoBLu','w9lqa5fYy0cuW7EQXVL25SLT9wDxjW4XqbCkt129uEQSOZHcUQ78OmI3IlfD',NULL,'2024-05-23 04:53:13','2024-05-23 04:53:13'),(7,2,'Deluxe Mobile Admin','admin@deluxemobile.in','users/June2024/roiAHvEsgrmodOrmYdKa.jpeg',NULL,'$2y$12$TaYCgaeJ9uGaDBZJN34yLe87jKDu2.O6koIw8VdcuiRnUEHkqg8qy','GbT6YJmQKjAegg45aMb29RAZFJcUt70qwab5zq8HDzcGGS2KyAs9J3J88vzq','{\"locale\":\"en\"}','2024-06-13 08:44:36','2024-06-24 12:37:40'),(8,3,'Shop User','shop@gmail.com','users/June2024/cJpa21FI2vXvKqqAooW3.jpeg',NULL,'$2y$12$IAFi1Pl9l4ONfcEo847U4.LOc48P9rLZKliOoIq8cRPlUrUU6NKAS',NULL,'{\"locale\":\"en\"}','2024-06-13 08:53:22','2024-06-24 12:37:27'),(9,3,'user1','user1@mailinator.com','users/June2024/ziop2v8iu1f1hJggtv3R.jpeg',NULL,'$2y$12$vR2OR8F93120XQ7yQ60sQ.l.6k6CO0G.mLNR9VVaGshpHFTtuUhOq',NULL,'{\"locale\":\"en\"}','2024-06-17 11:46:43','2024-06-24 07:40:25');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-26  4:48:27
