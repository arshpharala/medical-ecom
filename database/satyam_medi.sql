/*
SQLyog Community v13.3.0 (64 bit)
MySQL - 9.1.0 : Database - u449904512_medibazaar
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`u449904512_medibazaar` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `u449904512_medibazaar`;

/*Table structure for table `addresses` */

DROP TABLE IF EXISTS `addresses`;

CREATE TABLE `addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int NOT NULL DEFAULT '1',
  `province_id` int NOT NULL,
  `city_id` int NOT NULL,
  `area_id` int DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landmark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `addresses` */

insert  into `addresses`(`id`,`user_id`,`name`,`phone`,`country_id`,`province_id`,`city_id`,`area_id`,`address`,`landmark`,`created_at`,`updated_at`,`deleted_at`) values 
(2,2,'satyam suri','07009965155',1,2,3,8,'36/2 mission compound',NULL,'2025-12-07 23:40:02','2025-12-07 23:40:02',NULL),
(3,2,'satyam suri','07009965155',1,2,4,13,'36/2 mission compound',NULL,'2025-12-07 23:51:23','2025-12-07 23:51:23',NULL);

/*Table structure for table `admin_roles` */

DROP TABLE IF EXISTS `admin_roles`;

CREATE TABLE `admin_roles` (
  `admin_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  UNIQUE KEY `unique_admin_role` (`admin_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `admin_roles` */

/*Table structure for table `admins` */

DROP TABLE IF EXISTS `admins`;

CREATE TABLE `admins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `admins` */

insert  into `admins`(`id`,`name`,`email`,`password`,`remember_token`,`created_at`,`updated_at`) values 
(1,'Admin','admin@example.com','$2y$12$mNgi5Nz153u3Pl3ZliieNunwShG4n.dpFOwiiTWp.Xy9uu5jmky4y',NULL,'2025-08-13 02:39:41','2025-08-13 02:39:41');

/*Table structure for table `areas` */

DROP TABLE IF EXISTS `areas`;

CREATE TABLE `areas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `areas` */

insert  into `areas`(`id`,`city_id`,`name`,`created_at`,`updated_at`) values 
(1,1,'Al Maryah Island','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(2,1,'Al Raha','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(3,1,'Al Khalidiyah','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(4,1,'Al Khalifa Street','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(5,2,'Al Jimi','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(6,2,'Al Mutared','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(7,2,'Al Hili','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(8,3,'Deira','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(9,3,'Bur Dubai','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(10,3,'Marina','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(11,3,'Jumeirah','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(12,3,'Downtown','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(13,4,'Hatta Village','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(14,4,'Hatta Wadi Hub','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(15,5,'JAFZA','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(16,5,'Jebel Ali Village','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(17,6,'Al Majaz','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(18,6,'Al Nahda','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(19,6,'Al Khan','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(20,7,'Ajman Corniche','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(21,7,'Al Nuaimiya','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(22,8,'UAQ Free Zone','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(23,8,'Sinaiya','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(24,9,'Al Nakheel','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(25,9,'Al Hamra','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(26,10,'Dibba Corniche','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(27,11,'Fujairah City Centre','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(28,11,'Masafi','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(29,11,'Khor Fakkan','2025-08-13 02:39:42','2025-08-13 02:39:42');

/*Table structure for table `attachments` */

DROP TABLE IF EXISTS `attachments`;

CREATE TABLE `attachments` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachable_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attachments_attachable_type_attachable_id_index` (`attachable_type`,`attachable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `attachments` */

insert  into `attachments`(`id`,`file_path`,`file_type`,`file_name`,`attachable_type`,`attachable_id`,`created_at`,`updated_at`) values 
('0198d7ef-725f-706d-939e-e6f67da389e9','attachments/43h8G8GWUhCtGKdqiP8spXf33GAHIg4A8apMLNv5.jpg','image/jpeg','01.jpg','App\\Models\\Catalog\\ProductVariant','0198d7ef-7251-70d7-aaf8-f4440ab9268d','2025-08-23 21:17:30','2025-08-23 21:17:30'),
('0198d7f1-8d65-726d-9510-a135ea7fb922','attachments/cSXF8czLH6KT94rrnpoOOaKqymqatIJTRLzzQnpz.jpg','image/jpeg','03.jpg','App\\Models\\Catalog\\ProductVariant','0198d7f1-8d59-7048-8dff-09dc96ea3a81','2025-08-23 21:19:48','2025-08-23 21:19:48'),
('0198d7f2-e945-7388-bbf6-59c4d83012d0','attachments/n9eyowl0XqUwM6I2NqvJPzPS0QthsBrcZyUuyRUO.jpg','image/jpeg','04.jpg','App\\Models\\Catalog\\ProductVariant','0198d7f2-e900-72a0-b5f3-32952716db37','2025-08-23 21:21:17','2025-08-23 21:21:17'),
('0198d7f5-d90d-71ec-af92-fcb5f413126f','attachments/sVAiXXx3p1MeDcBDZ4ELtHUrOKT9Rmko88TXA1Oh.jpg','image/jpeg','05.jpg','App\\Models\\Catalog\\ProductVariant','0198d7f5-d901-7147-aa32-5ebea3e6ef54','2025-08-23 21:24:30','2025-08-23 21:24:30'),
('0198dd12-1f02-7348-b700-6c9d3bfdb57c','attachments/8hYNHCoYa7aiMoyKJ2jQ9RJmm1r48LFSJvjQNgjX.jpg','image/jpeg','02 (1).jpg','App\\Models\\Catalog\\ProductVariant','0198dd12-1eaa-724c-8bdf-eb090d08b0c5','2025-08-24 21:13:29','2025-08-24 21:13:29'),
('019afa28-f73e-737c-b042-e085ccbfcd3a','attachments/JAa0fJ77cHqBr9JUQsmhD2vjFRMoldoqOwefg41x.jpg','image/jpeg','900x837-CMF86V80.jpg','App\\Models\\Catalog\\ProductVariant','0198d7ed-2521-72fd-a60b-02182a9061b5','2025-12-07 22:53:00','2025-12-07 22:53:00'),
('019afa2a-6de0-7212-a6ea-cdbb8fe9d8d1','attachments/lIzrn2ixpO1DiYrEzDZi8YRxx8dM8dKetaO4s6cK.jpg','image/jpeg','900x837-CMF86V80.jpg','App\\Models\\Catalog\\ProductVariant','0198dcec-7007-724d-a1e2-caad426d4e18','2025-12-07 22:54:36','2025-12-07 22:54:36'),
('019afa2b-8964-705b-8dcf-2b1f2afd6b33','attachments/hvuhR9rCW4kvEN75QHGp7PALnLwqKk7mE4YBBxRo.jpg','image/jpeg','258x259-NHS Prescription Bags.jpg','App\\Models\\Catalog\\ProductVariant','0198dcec-7007-724d-a1e2-caad426d4e18','2025-12-07 22:55:48','2025-12-07 22:55:48');

/*Table structure for table `attribute_values` */

DROP TABLE IF EXISTS `attribute_values`;

CREATE TABLE `attribute_values` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_values_attribute_id_index` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `attribute_values` */

insert  into `attribute_values`(`id`,`attribute_id`,`value`) values 
('0198d7ea-5f6c-71d3-8cdd-78effda034cb','0198d7ea-5f49-7280-bd7c-b692a53ef2f1','White');

/*Table structure for table `attributes` */

DROP TABLE IF EXISTS `attributes`;

CREATE TABLE `attributes` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `attributes` */

insert  into `attributes`(`id`,`name`,`created_at`,`updated_at`,`deleted_at`) values 
('0198d7ea-5f49-7280-bd7c-b692a53ef2f1','Color','2025-08-23 21:11:58','2025-08-23 21:11:58',NULL);

/*Table structure for table `banner_translations` */

DROP TABLE IF EXISTS `banner_translations`;

CREATE TABLE `banner_translations` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `banner_translations_banner_id_locale_unique` (`banner_id`,`locale`),
  KEY `banner_translations_banner_id_index` (`banner_id`),
  KEY `banner_translations_locale_index` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `banner_translations` */

insert  into `banner_translations`(`id`,`banner_id`,`locale`,`title`,`subtitle`,`description`,`created_at`,`updated_at`) values 
('0198f285-f40c-738a-8cfe-e5c3ce28522d','0198f285-f3f0-7306-b3c9-8783ae6bf250','en','Face Mask',NULL,'Quis autem vel eum iure reprehenin voluptate velit esse quam nihil molestiae conse','2025-08-29 01:12:01','2025-08-29 01:12:01');

/*Table structure for table `banners` */

DROP TABLE IF EXISTS `banners`;

CREATE TABLE `banners` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `background` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `btn_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btn_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btn_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `banners` */

insert  into `banners`(`id`,`image`,`background`,`text_color`,`btn_text`,`btn_color`,`btn_link`,`position`,`is_active`,`created_at`,`updated_at`,`deleted_at`) values 
('0198f285-f3f0-7306-b3c9-8783ae6bf250','banners/ftTetSYl0SsyNqBgobPnEEE2izTA12keBqcrsgsi.png','banners/PjItueUUdtmhhPy6088kjGr2n8YpOHazh3w6aYZe.jpg','#000000','Shop Now','#4e97fd','/products/',1,1,'2025-08-29 01:12:01','2025-08-29 02:59:12',NULL);

/*Table structure for table `billing_addresses` */

DROP TABLE IF EXISTS `billing_addresses`;

CREATE TABLE `billing_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `area` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landmark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `billing_addresses_user_id_foreign` (`user_id`),
  CONSTRAINT `billing_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `billing_addresses` */

/*Table structure for table `brands` */

DROP TABLE IF EXISTS `brands`;

CREATE TABLE `brands` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `position` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brands_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `brands` */

/*Table structure for table `cache` */

DROP TABLE IF EXISTS `cache`;

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cache` */

insert  into `cache`(`key`,`value`,`expiration`) values 
('laravel_cache_app_settings','a:14:{s:10:\"site_title\";s:26:\"Optimised Medical Supplies\";s:13:\"contact_email\";s:32:\"info@optimisedmedicalsupplie.com\";s:13:\"contact_phone\";s:11:\"01234567899\";s:7:\"address\";s:49:\"The cottage, Old berrow manor, birmingham, B955PF\";s:9:\"copyright\";s:57:\"Optimised Medical Supplies ©  2025.  All Rights Reserved\";s:9:\"site_logo\";s:54:\"settings/nqiWzZqIfwIB9R7CRxWrOiIajmTXMTBVx7tCWOdc.webp\";s:16:\"site_footer_logo\";s:54:\"settings/trSI5PZcpZu8yIfRmNrdpOBZONfSMguNW2Ui3DlV.webp\";s:12:\"site_favicon\";s:54:\"settings/zWYbpWRytOcPfsTsu8SG1ciPSXrHGzzjaVjbOZFt.webp\";s:8:\"facebook\";s:25:\"https://www.facebook.com/\";s:9:\"instagram\";s:26:\"https://www.instagram.com/\";s:8:\"linkedin\";N;s:9:\"pinterest\";N;s:7:\"twitter\";s:17:\"https://www.x.com\";s:10:\"site_intro\";s:100:\"But must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born\";}',2080496866);

/*Table structure for table `cache_locks` */

DROP TABLE IF EXISTS `cache_locks`;

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cache_locks` */

/*Table structure for table `cart_items` */

DROP TABLE IF EXISTS `cart_items`;

CREATE TABLE `cart_items` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cart_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_variant_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int unsigned NOT NULL DEFAULT '1',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `cart_items_cart_id_index` (`cart_id`),
  KEY `cart_items_product_variant_id_index` (`product_variant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cart_items` */

/*Table structure for table `carts` */

DROP TABLE IF EXISTS `carts`;

CREATE TABLE `carts` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_user_id_index` (`user_id`),
  KEY `carts_session_id_index` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `carts` */

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  `is_visible` tinyint(1) NOT NULL DEFAULT '1',
  `show_on_homepage` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_index` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `categories` */

insert  into `categories`(`id`,`slug`,`icon`,`image`,`banner_image`,`background_color`,`text_color`,`parent_id`,`position`,`is_visible`,`show_on_homepage`,`created_at`,`updated_at`,`deleted_at`) values 
('0198d3f6-2f07-716a-ab44-8dab08ae7c0e','gun-covid-19','categories/5DQji84lB7jDLR2dA2m2Y35XpmbZmZEB5qcr0TxQ.jpg',NULL,NULL,NULL,NULL,NULL,2,1,0,'2025-08-23 02:46:23','2025-08-23 02:46:39',NULL),
('0198d7df-f004-7182-bf7a-b106ac223520','digital-meter','categories/B0BMxf6lFrNX6cY5x2Asuy2WQFUA0GZfbil3sBAD.jpg','categories/M17dLvirhkWDilSxSTcnzx9MTBxQgm2ZvJmTahvs.jpg','categories/UqvK9TERdadhglcI6wQZnPUk807rIc4wfbCACWrP.jpg','#000000','#000000',NULL,1,1,0,'2025-08-23 21:00:34','2025-12-07 23:09:46',NULL),
('0198d7e5-a650-7368-9bba-655e8ae5d0ee','pulse','categories/u1aTtAorn22rnbXxe6JuUCB8p1y9gzWps6IfaoNa.jpg',NULL,NULL,NULL,NULL,NULL,3,1,0,'2025-08-23 21:06:48','2025-08-23 21:06:59',NULL),
('0198d7e6-3c13-725a-be80-c9f5909d31ac','lab-surgery','categories/yPr9NxtvtBhh2xVPORuFpWEnVSK1BCGw9ak142jt.jpg','categories/gOMdwtVUu797nKRnbRAoDK7l4f1mUAzM10obJsJ3.jpg','categories/iB0M3K3jkJoqNpaJ5Dm6SfOk9mtb2HL0unA5J7Ce.jpg','#000000','#000000',NULL,4,1,0,'2025-08-23 21:07:26','2025-12-07 23:11:38',NULL),
('0198d7e7-0fde-731e-9d18-a49938d60fe7','surgery-lab','categories/st0JGQJpd5VypnkeBkj2g4tBMrDlTVgukYU7qgfn.jpg','categories/OxwTTTn5aoBUpGWSYxg6AzR4oBckenekMl29nV8e.jpg','categories/plM5YOdM58Dql79qWmwFzunrQlaOOIlociYbO4CA.jpg','#000000','#000000',NULL,5,1,0,'2025-08-23 21:08:21','2025-12-07 23:12:20',NULL),
('0198dd0b-be92-707e-b51a-c57195136245','hand-sanitizer',NULL,NULL,NULL,NULL,NULL,NULL,6,1,0,'2025-08-24 21:06:31','2025-08-24 21:06:31',NULL);

/*Table structure for table `category_attributes` */

DROP TABLE IF EXISTS `category_attributes`;

CREATE TABLE `category_attributes` (
  `category_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`category_id`,`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `category_attributes` */

insert  into `category_attributes`(`category_id`,`attribute_id`) values 
('0198d3f6-2f07-716a-ab44-8dab08ae7c0e','0198d7ea-5f49-7280-bd7c-b692a53ef2f1'),
('0198d7df-f004-7182-bf7a-b106ac223520','0198d7ea-5f49-7280-bd7c-b692a53ef2f1'),
('0198d7e5-a650-7368-9bba-655e8ae5d0ee','0198d7ea-5f49-7280-bd7c-b692a53ef2f1'),
('0198d7e6-3c13-725a-be80-c9f5909d31ac','0198d7ea-5f49-7280-bd7c-b692a53ef2f1'),
('0198d7e7-0fde-731e-9d18-a49938d60fe7','0198d7ea-5f49-7280-bd7c-b692a53ef2f1'),
('0198dd0b-be92-707e-b51a-c57195136245','0198d7ea-5f49-7280-bd7c-b692a53ef2f1');

/*Table structure for table `category_translations` */

DROP TABLE IF EXISTS `category_translations`;

CREATE TABLE `category_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_translations_category_id_locale_unique` (`category_id`,`locale`),
  KEY `category_translations_category_id_index` (`category_id`),
  KEY `category_translations_locale_index` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `category_translations` */

insert  into `category_translations`(`id`,`category_id`,`locale`,`name`) values 
(1,'0198d3f6-2f07-716a-ab44-8dab08ae7c0e','en','Gun Covid -19'),
(2,'0198d7df-f004-7182-bf7a-b106ac223520','en','Digital Meter'),
(3,'0198d7e5-a650-7368-9bba-655e8ae5d0ee','en','Pulse'),
(4,'0198d7e6-3c13-725a-be80-c9f5909d31ac','en','Lab Surgery'),
(5,'0198d7e7-0fde-731e-9d18-a49938d60fe7','en','Surgery Lab'),
(6,'0198dd0b-be92-707e-b51a-c57195136245','en','Hand Sanitizer');

/*Table structure for table `cities` */

DROP TABLE IF EXISTS `cities`;

CREATE TABLE `cities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `province_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cities` */

insert  into `cities`(`id`,`province_id`,`name`,`created_at`,`updated_at`) values 
(1,1,'Abu Dhabi','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(2,1,'Al Ain','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(3,2,'Dubai','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(4,2,'Hatta','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(5,2,'Jebel Ali','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(6,3,'Sharjah','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(7,4,'Ajman','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(8,5,'Umm Al Quwain','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(9,6,'Ras Al Khaimah','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(10,6,'Dibba Al Hisn','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(11,7,'Fujairah','2025-08-13 02:39:42','2025-08-13 02:39:42');

/*Table structure for table `countries` */

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` int NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tax_label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_percentage` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `countries_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `countries` */

insert  into `countries`(`id`,`code`,`name`,`currency_id`,`icon`,`created_at`,`updated_at`,`tax_label`,`tax_percentage`) values 
(1,'UA','United Arab Emirates',0,'','2025-08-13 02:39:42','2025-08-13 02:39:42','',0.00);

/*Table structure for table `coupon_product_variant` */

DROP TABLE IF EXISTS `coupon_product_variant`;

CREATE TABLE `coupon_product_variant` (
  `coupon_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_variant_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `coupon_product_variant` */

/*Table structure for table `coupon_usages` */

DROP TABLE IF EXISTS `coupon_usages`;

CREATE TABLE `coupon_usages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `coupon_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `coupon_usages` */

/*Table structure for table `coupons` */

DROP TABLE IF EXISTS `coupons`;

CREATE TABLE `coupons` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `scope` enum('cart','variant') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cart',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `min_cart_amount` decimal(10,2) DEFAULT NULL,
  `first_time_only` tinyint(1) NOT NULL DEFAULT '0',
  `start_at` timestamp NULL DEFAULT NULL,
  `end_at` timestamp NULL DEFAULT NULL,
  `max_usage` int DEFAULT NULL,
  `max_usage_per_user` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupons_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `coupons` */

/*Table structure for table `currencies` */

DROP TABLE IF EXISTS `currencies`;

CREATE TABLE `currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal` smallint DEFAULT '2',
  `group_separator` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT ',',
  `decimal_separator` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '.',
  `currency_position` enum('Left','Right') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `symbol_html` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `exchange_rate` decimal(10,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `currencies_code_unique` (`code`),
  UNIQUE KEY `currencies_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `currencies` */

insert  into `currencies`(`id`,`code`,`name`,`symbol`,`decimal`,`group_separator`,`decimal_separator`,`currency_position`,`created_at`,`updated_at`,`deleted_at`,`symbol_html`,`is_default`,`exchange_rate`) values 
(1,'AED','United Arab Emirates Dirham','د.إ',2,',','.','Right','2025-08-13 02:39:42','2025-08-13 02:39:42',NULL,'',0,0.0000),
(2,'USD','US Dollar','$',2,',','.','Left','2025-08-13 02:39:42','2025-08-13 02:39:42',NULL,'',0,0.0000),
(3,'EUR','Euro','€',2,'.',',','Left','2025-08-13 02:39:42','2025-08-13 02:39:42',NULL,'',0,0.0000),
(4,'GBP','British Pound','£',2,',','.','Left','2025-08-13 02:39:42','2025-08-13 02:39:42',NULL,'',1,0.0000),
(5,'INR','Indian Rupee','₹',2,',','.','Left','2025-08-13 02:39:42','2025-08-13 02:39:42',NULL,'',0,0.0000),
(6,'SAR','Saudi Riyal','ر.س',2,',','.','Right','2025-08-13 02:39:42','2025-08-13 02:39:42',NULL,'',0,0.0000),
(7,'PKR','Pakistani Rupee','₨',2,',','.','Left','2025-08-13 02:39:42','2025-08-13 02:39:42',NULL,'',0,0.0000);

/*Table structure for table `ec_addresses` */

DROP TABLE IF EXISTS `ec_addresses`;

CREATE TABLE `ec_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int NOT NULL DEFAULT '1',
  `province_id` int NOT NULL,
  `city_id` int NOT NULL,
  `area_id` int NOT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `landmark` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_addresses` */

/*Table structure for table `ec_admin_roles` */

DROP TABLE IF EXISTS `ec_admin_roles`;

CREATE TABLE `ec_admin_roles` (
  `admin_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  UNIQUE KEY `unique_admin_role` (`admin_id`,`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_admin_roles` */

/*Table structure for table `ec_admins` */

DROP TABLE IF EXISTS `ec_admins`;

CREATE TABLE `ec_admins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_admins_email_unique` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_admins` */

/*Table structure for table `ec_announcement_translations` */

DROP TABLE IF EXISTS `ec_announcement_translations`;

CREATE TABLE `ec_announcement_translations` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `announcement_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  UNIQUE KEY `ec_announcement_translations_announcement_id_locale_unique` (`announcement_id`,`locale`),
  KEY `ec_announcement_translations_locale_index` (`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_announcement_translations` */

/*Table structure for table `ec_announcements` */

DROP TABLE IF EXISTS `ec_announcements`;

CREATE TABLE `ec_announcements` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_announcements` */

/*Table structure for table `ec_areas` */

DROP TABLE IF EXISTS `ec_areas`;

CREATE TABLE `ec_areas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_areas` */

/*Table structure for table `ec_attachments` */

DROP TABLE IF EXISTS `ec_attachments`;

CREATE TABLE `ec_attachments` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachable_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_attachments_attachable_type_attachable_id_index` (`attachable_type`,`attachable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_attachments` */

/*Table structure for table `ec_attribute_values` */

DROP TABLE IF EXISTS `ec_attribute_values`;

CREATE TABLE `ec_attribute_values` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_attribute_values_attribute_id_index` (`attribute_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_attribute_values` */

/*Table structure for table `ec_attributes` */

DROP TABLE IF EXISTS `ec_attributes`;

CREATE TABLE `ec_attributes` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_attributes` */

/*Table structure for table `ec_banner_translations` */

DROP TABLE IF EXISTS `ec_banner_translations`;

CREATE TABLE `ec_banner_translations` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_banner_translations_banner_id_locale_unique` (`banner_id`,`locale`),
  KEY `ec_banner_translations_banner_id_index` (`banner_id`),
  KEY `ec_banner_translations_locale_index` (`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_banner_translations` */

/*Table structure for table `ec_banners` */

DROP TABLE IF EXISTS `ec_banners`;

CREATE TABLE `ec_banners` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `background` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `btn_text` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btn_color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btn_link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_banners` */

/*Table structure for table `ec_billing_addresses` */

DROP TABLE IF EXISTS `ec_billing_addresses`;

CREATE TABLE `ec_billing_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `area` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `landmark` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_billing_addresses_user_id_foreign` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_billing_addresses` */

/*Table structure for table `ec_brands` */

DROP TABLE IF EXISTS `ec_brands`;

CREATE TABLE `ec_brands` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `position` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_brands_slug_unique` (`slug`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_brands` */

/*Table structure for table `ec_cache` */

DROP TABLE IF EXISTS `ec_cache`;

CREATE TABLE `ec_cache` (
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_cache` */

insert  into `ec_cache`(`key`,`value`,`expiration`) values 
('laravel_cache_app_settings','a:0:{}',2080156824);

/*Table structure for table `ec_cache_locks` */

DROP TABLE IF EXISTS `ec_cache_locks`;

CREATE TABLE `ec_cache_locks` (
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_cache_locks` */

/*Table structure for table `ec_cart_items` */

DROP TABLE IF EXISTS `ec_cart_items`;

CREATE TABLE `ec_cart_items` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cart_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_variant_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int unsigned NOT NULL DEFAULT '1',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `ec_cart_items_cart_id_index` (`cart_id`),
  KEY `ec_cart_items_product_variant_id_index` (`product_variant_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_cart_items` */

/*Table structure for table `ec_carts` */

DROP TABLE IF EXISTS `ec_carts`;

CREATE TABLE `ec_carts` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_carts_user_id_index` (`user_id`),
  KEY `ec_carts_session_id_index` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_carts` */

/*Table structure for table `ec_categories` */

DROP TABLE IF EXISTS `ec_categories`;

CREATE TABLE `ec_categories` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  `is_visible` tinyint(1) NOT NULL DEFAULT '1',
  `show_on_homepage` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_categories_slug_unique` (`slug`),
  KEY `ec_categories_parent_id_index` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_categories` */

/*Table structure for table `ec_category_attributes` */

DROP TABLE IF EXISTS `ec_category_attributes`;

CREATE TABLE `ec_category_attributes` (
  `category_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`category_id`,`attribute_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_category_attributes` */

/*Table structure for table `ec_category_translations` */

DROP TABLE IF EXISTS `ec_category_translations`;

CREATE TABLE `ec_category_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_category_translations_category_id_locale_unique` (`category_id`,`locale`),
  KEY `ec_category_translations_category_id_index` (`category_id`),
  KEY `ec_category_translations_locale_index` (`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_category_translations` */

/*Table structure for table `ec_cities` */

DROP TABLE IF EXISTS `ec_cities`;

CREATE TABLE `ec_cities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `province_id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_cities` */

/*Table structure for table `ec_countries` */

DROP TABLE IF EXISTS `ec_countries`;

CREATE TABLE `ec_countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` int NOT NULL,
  `icon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tax_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_percentage` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_countries_code_unique` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_countries` */

/*Table structure for table `ec_coupon_product_variant` */

DROP TABLE IF EXISTS `ec_coupon_product_variant`;

CREATE TABLE `ec_coupon_product_variant` (
  `coupon_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_variant_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_coupon_product_variant` */

/*Table structure for table `ec_coupon_usages` */

DROP TABLE IF EXISTS `ec_coupon_usages`;

CREATE TABLE `ec_coupon_usages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `coupon_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_coupon_usages` */

/*Table structure for table `ec_coupons` */

DROP TABLE IF EXISTS `ec_coupons`;

CREATE TABLE `ec_coupons` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percentage') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `scope` enum('cart','variant') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cart',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `min_cart_amount` decimal(10,2) DEFAULT NULL,
  `first_time_only` tinyint(1) NOT NULL DEFAULT '0',
  `start_at` timestamp NULL DEFAULT NULL,
  `end_at` timestamp NULL DEFAULT NULL,
  `max_usage` int DEFAULT NULL,
  `max_usage_per_user` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_coupons_code_unique` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_coupons` */

/*Table structure for table `ec_currencies` */

DROP TABLE IF EXISTS `ec_currencies`;

CREATE TABLE `ec_currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal` smallint DEFAULT '2',
  `group_separator` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ',',
  `decimal_separator` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '.',
  `currency_position` enum('Left','Right') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `symbol_html` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `exchange_rate` decimal(10,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_currencies_code_unique` (`code`),
  UNIQUE KEY `ec_currencies_name_unique` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_currencies` */

/*Table structure for table `ec_email_admin` */

DROP TABLE IF EXISTS `ec_email_admin`;

CREATE TABLE `ec_email_admin` (
  `email_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` int NOT NULL,
  `type` enum('to','cc','bcc','exclude') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_email_admin` */

/*Table structure for table `ec_email_user` */

DROP TABLE IF EXISTS `ec_email_user`;

CREATE TABLE `ec_email_user` (
  `email_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `type` enum('to','cc','bcc','exclude') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_email_user` */

/*Table structure for table `ec_emails` */

DROP TABLE IF EXISTS `ec_emails`;

CREATE TABLE `ec_emails` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `template` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply_to_email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_emails` */

/*Table structure for table `ec_failed_jobs` */

DROP TABLE IF EXISTS `ec_failed_jobs`;

CREATE TABLE `ec_failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_failed_jobs` */

/*Table structure for table `ec_inventory_source_stocks` */

DROP TABLE IF EXISTS `ec_inventory_source_stocks`;

CREATE TABLE `ec_inventory_source_stocks` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `inventory_source_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_variant_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inventory_source_stock_unique` (`inventory_source_id`,`product_variant_id`),
  KEY `ec_inventory_source_stocks_inventory_source_id_index` (`inventory_source_id`),
  KEY `ec_inventory_source_stocks_product_variant_id_index` (`product_variant_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_inventory_source_stocks` */

/*Table structure for table `ec_inventory_sources` */

DROP TABLE IF EXISTS `ec_inventory_sources`;

CREATE TABLE `ec_inventory_sources` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contact_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_fax` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int NOT NULL,
  `province_id` int NOT NULL,
  `city_id` int NOT NULL,
  `street` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` decimal(10,6) DEFAULT NULL,
  `lng` decimal(10,6) DEFAULT NULL,
  `priority` int unsigned NOT NULL DEFAULT '10',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_inventory_sources_code_unique` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_inventory_sources` */

/*Table structure for table `ec_job_batches` */

DROP TABLE IF EXISTS `ec_job_batches`;

CREATE TABLE `ec_job_batches` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_job_batches` */

/*Table structure for table `ec_jobs` */

DROP TABLE IF EXISTS `ec_jobs`;

CREATE TABLE `ec_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_jobs_queue_index` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_jobs` */

/*Table structure for table `ec_keywords` */

DROP TABLE IF EXISTS `ec_keywords`;

CREATE TABLE `ec_keywords` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_keywords_keyword_unique` (`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_keywords` */

/*Table structure for table `ec_locales` */

DROP TABLE IF EXISTS `ec_locales`;

CREATE TABLE `ec_locales` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direction` enum('ltr','rtl') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_locales_code_unique` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_locales` */

/*Table structure for table `ec_meta_keyword` */

DROP TABLE IF EXISTS `ec_meta_keyword`;

CREATE TABLE `ec_meta_keyword` (
  `meta_id` bigint unsigned NOT NULL,
  `keyword_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`meta_id`,`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_meta_keyword` */

/*Table structure for table `ec_metas` */

DROP TABLE IF EXISTS `ec_metas`;

CREATE TABLE `ec_metas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `metable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `metable_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `meta_unique` (`metable_id`,`metable_type`,`locale`),
  KEY `ec_metas_metable_type_metable_id_index` (`metable_type`,`metable_id`),
  KEY `ec_metas_locale_index` (`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_metas` */

/*Table structure for table `ec_migrations` */

DROP TABLE IF EXISTS `ec_migrations`;

CREATE TABLE `ec_migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_migrations` */

insert  into `ec_migrations`(`id`,`migration`,`batch`) values 
(1,'0001_01_01_000000_create_users_table',1),
(2,'0001_01_01_000001_create_cache_table',1),
(3,'0001_01_01_000002_create_jobs_table',1),
(4,'2025_07_08_085822_create_categories_table',1),
(5,'2025_07_08_085823_create_attributes_table',1),
(6,'2025_07_08_085823_create_products_table',1),
(7,'2025_07_08_102548_create_settings_table',1),
(8,'2025_07_08_125949_create_attachments_table',1),
(9,'2025_07_09_055116_create_category_attributes_table',1),
(10,'2025_07_09_074817_create_countries_table',1),
(11,'2025_07_09_074904_create_product_countries_table',1),
(12,'2025_07_09_074930_create_brands_table',1),
(13,'2025_07_11_100753_create_metas_table',1),
(14,'2025_07_11_114848_create_product_variant_shippings_table',1),
(15,'2025_07_11_130000_create_pages_table',1),
(16,'2025_07_12_091838_create_locales_table',1),
(17,'2025_07_12_121956_create_admins_table',1),
(18,'2025_07_17_053035_create_carts_table',1),
(19,'2025_07_17_083051_create_billing_addresses_table',1),
(20,'2025_07_17_083056_create_user_cards_table',1),
(21,'2025_07_17_092833_create_customer_columns',1),
(22,'2025_07_17_092834_create_subscriptions_table',1),
(23,'2025_07_17_092835_create_subscription_items_table',1),
(24,'2025_07_17_120856_create_orders_table',1),
(25,'2025_07_17_120943_create_order_line_items_table',1),
(26,'2025_07_18_095538_add_customer_fields_to_users_table',1),
(27,'2025_07_19_124012_create_user_details_table',1),
(28,'2025_07_22_101943_create_currencies_table',1),
(29,'2025_07_23_092304_create_addresses_table',1),
(30,'2025_07_28_080009_create_offers_table',1),
(31,'2025_07_29_143629_create_authorization_tables',1),
(32,'2025_07_30_100705_create_payment_gateways_table',1),
(33,'2025_07_30_144934_create_coupons_table',1),
(34,'2025_08_01_154307_add_is_guest_to_users_table',1),
(35,'2025_08_01_162838_add_tax_to_countries_table',1),
(36,'2025_08_04_111957_create_tags_table',1),
(37,'2025_08_09_153022_create_emails_table',1),
(38,'2025_08_12_144904_add_symbol_html_to_currencies_table',1),
(39,'2025_08_13_091455_create_vendors_table',1),
(40,'2025_08_16_160031_add_promo_fields_to_offers_table',1),
(41,'2025_08_21_093142_create_wishlists_table',1),
(42,'2025_08_22_101601_create_inventory_sources_table',1),
(43,'2025_08_23_144015_add_prvoider_details_to_users_table',1),
(44,'2025_08_25_014438_create_testimonials_table',1),
(45,'2025_08_25_031115_create_news_table',1),
(46,'2025_08_28_093622_add_color_columns_to_categories_table',1),
(47,'2025_08_29_003605_create_banners_table',1),
(48,'2025_09_06_114358_create_announcements_table',1),
(49,'2025_09_13_100232_create_subscribers_table',1),
(50,'2025_10_15_095900_add_email_sent_column_in_orders_table',1);

/*Table structure for table `ec_modules` */

DROP TABLE IF EXISTS `ec_modules`;

CREATE TABLE `ec_modules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_modules_name_unique` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_modules` */

/*Table structure for table `ec_news` */

DROP TABLE IF EXISTS `ec_news`;

CREATE TABLE `ec_news` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `author` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_guide` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `position` int NOT NULL DEFAULT '99',
  `published_at` timestamp NOT NULL DEFAULT '2025-12-04 01:15:26',
  `thumbnail` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_news` */

/*Table structure for table `ec_news_translations` */

DROP TABLE IF EXISTS `ec_news_translations`;

CREATE TABLE `ec_news_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `news_id` int NOT NULL,
  `locale` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `intro` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_news_translations_news_id_locale_unique` (`news_id`,`locale`),
  KEY `ec_news_translations_locale_index` (`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_news_translations` */

/*Table structure for table `ec_offer_product_variants` */

DROP TABLE IF EXISTS `ec_offer_product_variants`;

CREATE TABLE `ec_offer_product_variants` (
  `offer_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_variant_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `ec_offer_product_variants_offer_id_product_variant_id_unique` (`offer_id`,`product_variant_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_offer_product_variants` */

/*Table structure for table `ec_offer_translations` */

DROP TABLE IF EXISTS `ec_offer_translations`;

CREATE TABLE `ec_offer_translations` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `offer_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_offer_translations_offer_id_locale_unique` (`offer_id`,`locale`),
  KEY `ec_offer_translations_offer_id_index` (`offer_id`),
  KEY `ec_offer_translations_locale_index` (`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_offer_translations` */

/*Table structure for table `ec_offers` */

DROP TABLE IF EXISTS `ec_offers`;

CREATE TABLE `ec_offers` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_type` enum('fixed','percent') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `discount_value` decimal(10,2) NOT NULL,
  `starts_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `banner_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bg_color` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `show_in_slider` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ec_offers_is_active_starts_at_ends_at_index` (`is_active`,`starts_at`,`ends_at`),
  KEY `ec_offers_position_index` (`position`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_offers` */

/*Table structure for table `ec_order_line_items` */

DROP TABLE IF EXISTS `ec_order_line_items`;

CREATE TABLE `ec_order_line_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `product_variant_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_order_line_items_order_id_foreign` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_order_line_items` */

/*Table structure for table `ec_orders` */

DROP TABLE IF EXISTS `ec_orders`;

CREATE TABLE `ec_orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `billing_address_id` int NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` enum('card','paypal') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `external_reference` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `tax` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_orders_reference_number_unique` (`reference_number`),
  UNIQUE KEY `ec_orders_order_number_unique` (`order_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_orders` */

/*Table structure for table `ec_page_section_translations` */

DROP TABLE IF EXISTS `ec_page_section_translations`;

CREATE TABLE `ec_page_section_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `page_section_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_page_section_translations_page_section_id_locale_unique` (`page_section_id`,`locale`),
  KEY `ec_page_section_translations_page_section_id_index` (`page_section_id`),
  KEY `ec_page_section_translations_locale_index` (`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_page_section_translations` */

/*Table structure for table `ec_page_sections` */

DROP TABLE IF EXISTS `ec_page_sections`;

CREATE TABLE `ec_page_sections` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_page_sections_page_id_index` (`page_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_page_sections` */

/*Table structure for table `ec_page_translations` */

DROP TABLE IF EXISTS `ec_page_translations`;

CREATE TABLE `ec_page_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `page_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_page_translations_page_id_locale_unique` (`page_id`,`locale`),
  KEY `ec_page_translations_page_id_index` (`page_id`),
  KEY `ec_page_translations_locale_index` (`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_page_translations` */

/*Table structure for table `ec_pages` */

DROP TABLE IF EXISTS `ec_pages`;

CREATE TABLE `ec_pages` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `position` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_pages_slug_unique` (`slug`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_pages` */

/*Table structure for table `ec_password_reset_tokens` */

DROP TABLE IF EXISTS `ec_password_reset_tokens`;

CREATE TABLE `ec_password_reset_tokens` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_password_reset_tokens` */

/*Table structure for table `ec_payment_gateways` */

DROP TABLE IF EXISTS `ec_payment_gateways`;

CREATE TABLE `ec_payment_gateways` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `gateway` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `additional` json DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_payment_gateways` */

/*Table structure for table `ec_permissions` */

DROP TABLE IF EXISTS `ec_permissions`;

CREATE TABLE `ec_permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `module_id` int unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_module_permission` (`module_id`,`name`),
  KEY `ec_permissions_module_id_index` (`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_permissions` */

/*Table structure for table `ec_product_countries` */

DROP TABLE IF EXISTS `ec_product_countries`;

CREATE TABLE `ec_product_countries` (
  `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT '1',
  `tax` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`product_id`,`country_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_product_countries` */

/*Table structure for table `ec_product_translations` */

DROP TABLE IF EXISTS `ec_product_translations`;

CREATE TABLE `ec_product_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_product_translations_product_id_locale_unique` (`product_id`,`locale`),
  KEY `ec_product_translations_product_id_index` (`product_id`),
  KEY `ec_product_translations_locale_index` (`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_product_translations` */

/*Table structure for table `ec_product_variant_attribute_value` */

DROP TABLE IF EXISTS `ec_product_variant_attribute_value`;

CREATE TABLE `ec_product_variant_attribute_value` (
  `product_variant_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_value_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`product_variant_id`,`attribute_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_product_variant_attribute_value` */

/*Table structure for table `ec_product_variant_shippings` */

DROP TABLE IF EXISTS `ec_product_variant_shippings`;

CREATE TABLE `ec_product_variant_shippings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_variant_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `length` decimal(8,2) DEFAULT NULL,
  `width` decimal(8,2) DEFAULT NULL,
  `height` decimal(8,2) DEFAULT NULL,
  `weight` decimal(8,2) DEFAULT NULL,
  `qty_per_carton` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_product_variant_shippings_product_variant_id_unique` (`product_variant_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_product_variant_shippings` */

/*Table structure for table `ec_product_variants` */

DROP TABLE IF EXISTS `ec_product_variants`;

CREATE TABLE `ec_product_variants` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_product_variants_sku_unique` (`sku`),
  KEY `ec_product_variants_product_id_index` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_product_variants` */

/*Table structure for table `ec_products` */

DROP TABLE IF EXISTS `ec_products`;

CREATE TABLE `ec_products` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `is_new` tinyint(1) NOT NULL DEFAULT '0',
  `show_in_slider` tinyint(1) NOT NULL DEFAULT '0',
  `position` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_products_slug_unique` (`slug`),
  KEY `ec_products_category_id_index` (`category_id`),
  KEY `ec_products_brand_id_index` (`brand_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_products` */

/*Table structure for table `ec_provinces` */

DROP TABLE IF EXISTS `ec_provinces`;

CREATE TABLE `ec_provinces` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_provinces` */

/*Table structure for table `ec_role_permissions` */

DROP TABLE IF EXISTS `ec_role_permissions`;

CREATE TABLE `ec_role_permissions` (
  `role_id` int unsigned NOT NULL,
  `permission_id` int unsigned NOT NULL,
  UNIQUE KEY `unique_role_permission` (`role_id`,`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_role_permissions` */

/*Table structure for table `ec_roles` */

DROP TABLE IF EXISTS `ec_roles`;

CREATE TABLE `ec_roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_roles_name_unique` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_roles` */

/*Table structure for table `ec_sessions` */

DROP TABLE IF EXISTS `ec_sessions`;

CREATE TABLE `ec_sessions` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_sessions_user_id_index` (`user_id`),
  KEY `ec_sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_sessions` */

insert  into `ec_sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values 
('uHnpGm5Ts3xU4pYmTkG5JMgsUAgh6VdHm62N897t',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1VvYUdCT0lGbzVJbzdpSTdISzVQckxyMU1zc2dCSDUwakhoRGxseCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1764796861);

/*Table structure for table `ec_settings` */

DROP TABLE IF EXISTS `ec_settings`;

CREATE TABLE `ec_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_settings_key_unique` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_settings` */

/*Table structure for table `ec_subscribers` */

DROP TABLE IF EXISTS `ec_subscribers`;

CREATE TABLE `ec_subscribers` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscribed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `unsubscribed_at` timestamp NULL DEFAULT NULL,
  `source` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_subscribers_email_unique` (`email`),
  KEY `ec_subscribers_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_subscribers` */

/*Table structure for table `ec_subscription_items` */

DROP TABLE IF EXISTS `ec_subscription_items`;

CREATE TABLE `ec_subscription_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint unsigned NOT NULL,
  `stripe_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_product` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_subscription_items_stripe_id_unique` (`stripe_id`),
  KEY `ec_subscription_items_subscription_id_stripe_price_index` (`subscription_id`,`stripe_price`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_subscription_items` */

/*Table structure for table `ec_subscriptions` */

DROP TABLE IF EXISTS `ec_subscriptions`;

CREATE TABLE `ec_subscriptions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_subscriptions_stripe_id_unique` (`stripe_id`),
  KEY `ec_subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_subscriptions` */

/*Table structure for table `ec_tag_product_variant` */

DROP TABLE IF EXISTS `ec_tag_product_variant`;

CREATE TABLE `ec_tag_product_variant` (
  `tag_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_variant_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_tag_product_variant` */

/*Table structure for table `ec_tags` */

DROP TABLE IF EXISTS `ec_tags`;

CREATE TABLE `ec_tags` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `position` int NOT NULL DEFAULT '99',
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_tags` */

/*Table structure for table `ec_testimonial_translations` */

DROP TABLE IF EXISTS `ec_testimonial_translations`;

CREATE TABLE `ec_testimonial_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `testimonial_id` int NOT NULL,
  `locale` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_testimonial_translations_testimonial_id_locale_unique` (`testimonial_id`,`locale`),
  KEY `ec_testimonial_translations_locale_index` (`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_testimonial_translations` */

/*Table structure for table `ec_testimonials` */

DROP TABLE IF EXISTS `ec_testimonials`;

CREATE TABLE `ec_testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `position` int NOT NULL DEFAULT '99',
  `rating` int NOT NULL DEFAULT '5',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_testimonials` */

/*Table structure for table `ec_user_cards` */

DROP TABLE IF EXISTS `ec_user_cards`;

CREATE TABLE `ec_user_cards` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `card_last_four` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_brand` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_month` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_year` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gateway` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_user_cards_user_id_foreign` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_user_cards` */

/*Table structure for table `ec_user_details` */

DROP TABLE IF EXISTS `ec_user_details`;

CREATE TABLE `ec_user_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_user_details` */

/*Table structure for table `ec_users` */

DROP TABLE IF EXISTS `ec_users`;

CREATE TABLE `ec_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `password_changed_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_guest` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_last_four` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `provider_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_users_email_unique` (`email`),
  KEY `ec_users_stripe_id_index` (`stripe_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_users` */

/*Table structure for table `ec_vendors` */

DROP TABLE IF EXISTS `ec_vendors`;

CREATE TABLE `ec_vendors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_vendors_email_unique` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_vendors` */

/*Table structure for table `ec_wishlists` */

DROP TABLE IF EXISTS `ec_wishlists`;

CREATE TABLE `ec_wishlists` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int unsigned NOT NULL,
  `product_variant_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_wishlists_user_id_product_variant_id_unique` (`user_id`,`product_variant_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ec_wishlists` */

/*Table structure for table `email_admin` */

DROP TABLE IF EXISTS `email_admin`;

CREATE TABLE `email_admin` (
  `email_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` int NOT NULL,
  `type` enum('to','cc','bcc','exclude') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `email_admin` */

/*Table structure for table `email_user` */

DROP TABLE IF EXISTS `email_user`;

CREATE TABLE `email_user` (
  `email_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `type` enum('to','cc','bcc','exclude') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `email_user` */

/*Table structure for table `emails` */

DROP TABLE IF EXISTS `emails`;

CREATE TABLE `emails` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply_to_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `emails` */

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `inventory_source_stocks` */

DROP TABLE IF EXISTS `inventory_source_stocks`;

CREATE TABLE `inventory_source_stocks` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inventory_source_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_variant_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inventory_source_stock_unique` (`inventory_source_id`,`product_variant_id`),
  KEY `inventory_source_stocks_inventory_source_id_index` (`inventory_source_id`),
  KEY `inventory_source_stocks_product_variant_id_index` (`product_variant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `inventory_source_stocks` */

/*Table structure for table `inventory_sources` */

DROP TABLE IF EXISTS `inventory_sources`;

CREATE TABLE `inventory_sources` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `contact_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int NOT NULL,
  `province_id` int NOT NULL,
  `city_id` int NOT NULL,
  `street` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` decimal(10,6) DEFAULT NULL,
  `lng` decimal(10,6) DEFAULT NULL,
  `priority` int unsigned NOT NULL DEFAULT '10',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inventory_sources_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `inventory_sources` */

/*Table structure for table `job_batches` */

DROP TABLE IF EXISTS `job_batches`;

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `job_batches` */

/*Table structure for table `jobs` */

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jobs` */

/*Table structure for table `keywords` */

DROP TABLE IF EXISTS `keywords`;

CREATE TABLE `keywords` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `keywords_keyword_unique` (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `keywords` */

/*Table structure for table `locales` */

DROP TABLE IF EXISTS `locales`;

CREATE TABLE `locales` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direction` enum('ltr','rtl') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locales_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `locales` */

insert  into `locales`(`id`,`code`,`name`,`logo`,`direction`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'en','English',NULL,'ltr','2025-08-13 02:39:42','2025-08-13 02:39:42',NULL);

/*Table structure for table `meta_keyword` */

DROP TABLE IF EXISTS `meta_keyword`;

CREATE TABLE `meta_keyword` (
  `meta_id` bigint unsigned NOT NULL,
  `keyword_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`meta_id`,`keyword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `meta_keyword` */

/*Table structure for table `metas` */

DROP TABLE IF EXISTS `metas`;

CREATE TABLE `metas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `metable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metable_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `meta_unique` (`metable_id`,`metable_type`,`locale`),
  KEY `metas_metable_type_metable_id_index` (`metable_type`,`metable_id`),
  KEY `metas_locale_index` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `metas` */

insert  into `metas`(`id`,`metable_type`,`metable_id`,`locale`,`meta_title`,`meta_description`,`meta_keywords`,`created_at`,`updated_at`) values 
(1,'App\\Models\\CMS\\Page','0198a078-f8d6-7131-b895-28a70d1d6ef0','en','Optimised Medical Supplies','Shop for our products at exclusive prices Optimised Medical Supplies Ltd SHOP NOW! Surgical Gloves Face Masks Hand Sanitizers Essential Medicines from £22.99 to £17.99 Shop for our products at exclusive prices Medical & Pharmaceutical Supplies SHOP NOW! Free Shipping Enjoy free shipping on all…',NULL,'2025-08-13 02:48:59','2025-08-13 02:48:59'),
(2,'App\\Models\\CMS\\Page','0198a07a-9302-70cc-91b9-bacb1baac14f','en','Contact Us – Optimised Medical Supplies','Contact Us Address The cottage, Old berrow manor, birmingham, B955PF phone number +012 345 678 99 +457 789 789 65 Email info@optimisedmedicalsuppli',NULL,'2025-08-13 02:50:44','2025-08-13 02:50:44'),
(3,'App\\Models\\Catalog\\Product','0198d7f4-59a3-7374-bcea-8746781160f2','en',NULL,NULL,NULL,'2025-08-23 21:35:21','2025-08-23 21:35:21'),
(4,'App\\Models\\CMS\\Page','0198f28f-e281-722c-a23e-0ad058bb475f','en',NULL,NULL,NULL,'2025-08-29 01:22:52','2025-08-29 01:22:52'),
(5,'App\\Models\\CMS\\Page','0198f2a6-b73c-72d2-b4ef-bffd9bd4e8c9','en','Optimised Medical Supplies','Shop for our products at exclusive prices Optimised Medical Supplies Ltd SHOP NOW! Surgical Gloves Face Masks Hand Sanitizers Essential Medicines from £22.99 to £17.99 Shop for our products at exclusive prices Medical & Pharmaceutical Supplies SHOP NOW! Free Shipping Enjoy free shipping on all…',NULL,'2025-08-29 01:47:48','2025-08-29 01:47:48'),
(6,'App\\Models\\CMS\\Page','0198f2a7-43f2-717f-aff5-9a486fcf3d09','en','Contact Us – Optimised Medical Supplies','Contact Us Address The cottage, Old berrow manor, birmingham, B955PF phone number +012 345 678 99 +457 789 789 65 Email info@optimisedmedicalsuppli',NULL,'2025-08-29 01:48:24','2025-08-29 01:48:24'),
(7,'App\\Models\\CMS\\Page','0198f2a8-024c-7150-b0b5-1b667f526193','en','Products | Optimised Medical Supplies','View Latest Products',NULL,'2025-08-29 01:49:13','2025-08-29 01:49:13'),
(8,'App\\Models\\CMS\\Page','01991177-050d-73c1-bf8d-25fba376278c','en',NULL,NULL,NULL,'2025-09-04 03:29:09','2025-09-04 03:29:09'),
(9,'App\\Models\\CMS\\Page','01991162-f0e7-72e5-a361-f075c2844ff3','en',NULL,NULL,NULL,'2025-09-04 03:29:37','2025-09-04 03:29:37'),
(10,'App\\Models\\CMS\\Page','0199113f-d3d9-7166-adab-21ead2be9126','en',NULL,NULL,NULL,'2025-09-04 03:30:47','2025-09-04 03:30:47'),
(11,'App\\Models\\CMS\\Page','01991199-dbce-73ba-8744-c8cc3eede52e','en',NULL,NULL,NULL,'2025-09-04 03:31:07','2025-09-04 03:31:07'),
(12,'App\\Models\\CMS\\News','019911d5-708b-7067-9cf6-cf37d2c9cd18','en','Essential Medical Equipment & Their Use Cases | Complete Guide','Discover the most important medical equipment used in hospitals, clinics, and home healthcare. Learn their functions, benefits, and practical use cases in modern medical care.',NULL,'2025-09-04 03:31:46','2025-12-04 11:27:22');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'0001_01_01_000000_create_users_table',1),
(2,'0001_01_01_000001_create_cache_table',1),
(3,'0001_01_01_000002_create_jobs_table',1),
(4,'2025_07_08_085822_create_categories_table',1),
(5,'2025_07_08_085823_create_attributes_table',1),
(6,'2025_07_08_085823_create_products_table',1),
(7,'2025_07_08_102548_create_settings_table',1),
(8,'2025_07_08_125949_create_attachments_table',1),
(9,'2025_07_09_055116_create_category_attributes_table',1),
(10,'2025_07_09_074817_create_countries_table',1),
(11,'2025_07_09_074904_create_product_countries_table',1),
(12,'2025_07_09_074930_create_brands_table',1),
(13,'2025_07_11_100753_create_metas_table',1),
(14,'2025_07_11_114848_create_product_variant_shippings_table',1),
(15,'2025_07_11_130000_create_pages_table',1),
(16,'2025_07_12_091838_create_locales_table',1),
(17,'2025_07_12_121956_create_admins_table',1),
(18,'2025_07_17_053035_create_carts_table',1),
(19,'2025_07_17_083051_create_billing_addresses_table',1),
(20,'2025_07_17_083056_create_user_cards_table',1),
(21,'2025_07_17_092833_create_customer_columns',1),
(22,'2025_07_17_092834_create_subscriptions_table',1),
(23,'2025_07_17_092835_create_subscription_items_table',1),
(24,'2025_07_17_120856_create_orders_table',1),
(25,'2025_07_17_120943_create_order_line_items_table',1),
(26,'2025_07_18_095538_add_customer_fields_to_users_table',1),
(27,'2025_07_19_124012_create_user_details_table',1),
(28,'2025_07_22_101943_create_currencies_table',1),
(29,'2025_07_23_092304_create_addresses_table',1),
(30,'2025_07_28_080009_create_offers_table',1),
(31,'2025_07_29_143629_create_authorization_tables',1),
(32,'2025_07_30_100705_create_payment_gateways_table',1),
(33,'2025_07_30_144934_create_coupons_table',1),
(34,'2025_08_01_154307_add_is_guest_to_users_table',1),
(35,'2025_08_01_162838_add_tax_to_countries_table',1),
(36,'2025_08_04_111957_create_tags_table',1),
(37,'2025_08_09_153022_create_emails_table',1),
(38,'2025_08_12_144904_add_symbol_html_to_currencies_table',1),
(39,'2025_08_13_091455_create_vendors_table',2),
(40,'2025_08_16_160031_add_promo_fields_to_offers_table',2),
(41,'2025_08_21_093142_create_wishlists_table',2),
(42,'2025_08_22_101601_create_inventory_sources_table',3),
(43,'2025_08_23_144015_add_prvoider_details_to_users_table',3),
(48,'2025_08_25_014438_create_testimonials_table',4),
(49,'2025_08_25_031115_create_news_table',5);

/*Table structure for table `modules` */

DROP TABLE IF EXISTS `modules`;

CREATE TABLE `modules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `modules_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `modules` */

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_guide` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `position` int NOT NULL DEFAULT '99',
  `published_at` timestamp NOT NULL DEFAULT '2025-09-04 03:04:55',
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `news_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `news` */

insert  into `news`(`id`,`category_id`,`author`,`slug`,`is_guide`,`is_active`,`position`,`published_at`,`thumbnail`,`image`,`created_at`,`updated_at`,`deleted_at`) values 
('019911d5-708b-7067-9cf6-cf37d2c9cd18','0198d3f6-2f07-716a-ab44-8dab08ae7c0e','Rosalina Pong','essential-medical-equipment-usecases',0,1,1,'2025-09-04 03:04:00','news/1H1Hv9bdfSCdsL0lWwEUimdBLeHCOsw7sIQYer2Q.png','news/S0enL6fcyDNfUhTu3AOxTDf4s2fjDFniK9Zy2WYE.png','2025-09-04 03:07:04','2025-12-04 11:27:22',NULL);

/*Table structure for table `news_translations` */

DROP TABLE IF EXISTS `news_translations`;

CREATE TABLE `news_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `news_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `intro` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `news_translations_news_id_locale_unique` (`news_id`,`locale`),
  KEY `news_translations_locale_index` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `news_translations` */

insert  into `news_translations`(`id`,`news_id`,`locale`,`title`,`intro`,`description`) values 
(1,'019911d5-708b-7067-9cf6-cf37d2c9cd18','en','Essential Medical Equipment: Types, Benefits & Real-World Use Cases Explained','<p>Medical equipment forms the foundation of modern healthcare, helping doctors diagnose illnesses, monitor patient conditions, and deliver effective treatment. From basic tools like thermometers to advanced machines like ventilators and ECGs, each device plays a crucial role in improving patient outcomes. In this guide, we explore essential medical equipment and their real-world use cases.</p>','<div class=\"blog-text\">\r\n<h2 data-start=\"614\" data-end=\"635\"><strong data-start=\"617\" data-end=\"633\">Introduction</strong></h2>\r\n<p data-start=\"636\" data-end=\"1020\">Medical equipment plays a vital role in diagnosing, monitoring, and treating patients across hospitals, clinics, laboratories, and even home-care setups. With rapid advancements in technology, modern healthcare now depends on accurate, reliable, and easy-to-use devices. This article explores the most essential medical equipment, their importance, and practical real-world use cases.</p>\r\n<hr data-start=\"1022\" data-end=\"1025\">\r\n<h2 data-start=\"1027\" data-end=\"1059\"><strong data-start=\"1030\" data-end=\"1057\">1. Diagnostic Equipment</strong></h2>\r\n<p data-start=\"1060\" data-end=\"1131\">Diagnostic devices help doctors identify diseases early and accurately.</p>\r\n<h3 data-start=\"1133\" data-end=\"1159\"><strong data-start=\"1137\" data-end=\"1157\">Common Examples:</strong></h3>\r\n<ul data-start=\"1160\" data-end=\"1500\">\r\n<li data-start=\"1160\" data-end=\"1222\">\r\n<p data-start=\"1162\" data-end=\"1222\"><strong data-start=\"1162\" data-end=\"1177\">Stethoscope</strong> &ndash; Used to listen to heart and lung sounds.</p>\r\n</li>\r\n<li data-start=\"1223\" data-end=\"1316\">\r\n<p data-start=\"1225\" data-end=\"1316\"><strong data-start=\"1225\" data-end=\"1264\">Blood Pressure Monitor (BP Machine)</strong> &ndash; Measures blood pressure quickly and accurately.</p>\r\n</li>\r\n<li data-start=\"1317\" data-end=\"1365\">\r\n<p data-start=\"1319\" data-end=\"1365\"><strong data-start=\"1319\" data-end=\"1334\">Thermometer</strong> &ndash; Measures body temperature.</p>\r\n</li>\r\n<li data-start=\"1366\" data-end=\"1429\">\r\n<p data-start=\"1368\" data-end=\"1429\"><strong data-start=\"1368\" data-end=\"1383\">ECG Machine</strong> &ndash; Detects electrical activity of the heart.</p>\r\n</li>\r\n<li data-start=\"1430\" data-end=\"1500\">\r\n<p data-start=\"1432\" data-end=\"1500\"><strong data-start=\"1432\" data-end=\"1454\">Ultrasound Machine</strong> &ndash; Creates internal body images for diagnosis.</p>\r\n</li>\r\n</ul>\r\n<h3 data-start=\"1502\" data-end=\"1522\"><strong data-start=\"1506\" data-end=\"1520\">Use Cases:</strong></h3>\r\n<ul data-start=\"1523\" data-end=\"1700\">\r\n<li data-start=\"1523\" data-end=\"1636\">\r\n<p data-start=\"1525\" data-end=\"1636\">Detecting heart problems, fever, infections, pregnancy monitoring, internal injuries, and chronic conditions.</p>\r\n</li>\r\n<li data-start=\"1637\" data-end=\"1700\">\r\n<p data-start=\"1639\" data-end=\"1700\">Essential during routine check-ups and emergency assessments.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1702\" data-end=\"1705\">\r\n<h2 data-start=\"1707\" data-end=\"1739\"><strong data-start=\"1710\" data-end=\"1737\">2. Monitoring Equipment</strong></h2>\r\n<p data-start=\"1740\" data-end=\"1805\">Monitoring equipment helps track patient conditions continuously.</p>\r\n<h3 data-start=\"1807\" data-end=\"1833\"><strong data-start=\"1811\" data-end=\"1831\">Common Examples:</strong></h3>\r\n<ul data-start=\"1834\" data-end=\"2030\">\r\n<li data-start=\"1834\" data-end=\"1886\">\r\n<p data-start=\"1836\" data-end=\"1886\"><strong data-start=\"1836\" data-end=\"1854\">Pulse Oximeter</strong> &ndash; Measures oxygen saturation.</p>\r\n</li>\r\n<li data-start=\"1887\" data-end=\"1970\">\r\n<p data-start=\"1889\" data-end=\"1970\"><strong data-start=\"1889\" data-end=\"1909\">Patient Monitors</strong> &ndash; Track heart rate, respiratory rate, BP, and temperature.</p>\r\n</li>\r\n<li data-start=\"1971\" data-end=\"2030\">\r\n<p data-start=\"1973\" data-end=\"2030\"><strong data-start=\"1973\" data-end=\"1988\">Glucometers</strong> &ndash; Used for monitoring blood sugar levels.</p>\r\n</li>\r\n</ul>\r\n<h3 data-start=\"2032\" data-end=\"2052\"><strong data-start=\"2036\" data-end=\"2050\">Use Cases:</strong></h3>\r\n<ul data-start=\"2053\" data-end=\"2225\">\r\n<li data-start=\"2053\" data-end=\"2143\">\r\n<p data-start=\"2055\" data-end=\"2143\">Used in ICUs, emergency rooms, operating theaters, and home-care for chronic patients.</p>\r\n</li>\r\n<li data-start=\"2144\" data-end=\"2225\">\r\n<p data-start=\"2146\" data-end=\"2225\">Helpful in managing diabetes, respiratory illnesses, and post-surgery recovery.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"2227\" data-end=\"2230\">\r\n<h2 data-start=\"2232\" data-end=\"2263\"><strong data-start=\"2235\" data-end=\"2261\">3. Treatment Equipment</strong></h2>\r\n<p data-start=\"2264\" data-end=\"2323\">These devices directly support or treat medical conditions.</p>\r\n<h3 data-start=\"2325\" data-end=\"2351\"><strong data-start=\"2329\" data-end=\"2349\">Common Examples:</strong></h3>\r\n<ul data-start=\"2352\" data-end=\"2645\">\r\n<li data-start=\"2352\" data-end=\"2411\">\r\n<p data-start=\"2354\" data-end=\"2411\"><strong data-start=\"2354\" data-end=\"2369\">Ventilators</strong> &ndash; Provide artificial breathing support.</p>\r\n</li>\r\n<li data-start=\"2412\" data-end=\"2487\">\r\n<p data-start=\"2414\" data-end=\"2487\"><strong data-start=\"2414\" data-end=\"2432\">Infusion Pumps</strong> &ndash; Deliver fluids or medications at controlled rates.</p>\r\n</li>\r\n<li data-start=\"2488\" data-end=\"2571\">\r\n<p data-start=\"2490\" data-end=\"2571\"><strong data-start=\"2490\" data-end=\"2504\">Nebulizers</strong> &ndash; Convert liquid medication into mist for respiratory treatment.</p>\r\n</li>\r\n<li data-start=\"2572\" data-end=\"2645\">\r\n<p data-start=\"2574\" data-end=\"2645\"><strong data-start=\"2574\" data-end=\"2592\">Defibrillators</strong> &ndash; Restore normal heart rhythm during cardiac arrest.</p>\r\n</li>\r\n</ul>\r\n<h3 data-start=\"2647\" data-end=\"2667\"><strong data-start=\"2651\" data-end=\"2665\">Use Cases:</strong></h3>\r\n<ul data-start=\"2668\" data-end=\"2814\">\r\n<li data-start=\"2668\" data-end=\"2719\">\r\n<p data-start=\"2670\" data-end=\"2719\">Life-saving support during critical conditions.</p>\r\n</li>\r\n<li data-start=\"2720\" data-end=\"2814\">\r\n<p data-start=\"2722\" data-end=\"2814\">Widely used in hospitals, ambulances, and home-care setups for chronic respiratory patients.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"2816\" data-end=\"2819\">\r\n<h2 data-start=\"2821\" data-end=\"2851\"><strong data-start=\"2824\" data-end=\"2849\">4. Surgical Equipment</strong></h2>\r\n<p data-start=\"2852\" data-end=\"2898\">These tools assist surgeons during operations.</p>\r\n<h3 data-start=\"2900\" data-end=\"2926\"><strong data-start=\"2904\" data-end=\"2924\">Common Examples:</strong></h3>\r\n<ul data-start=\"2927\" data-end=\"3041\">\r\n<li data-start=\"2927\" data-end=\"2943\">\r\n<p data-start=\"2929\" data-end=\"2943\"><strong data-start=\"2929\" data-end=\"2941\">Scalpels</strong></p>\r\n</li>\r\n<li data-start=\"2944\" data-end=\"2969\">\r\n<p data-start=\"2946\" data-end=\"2969\"><strong data-start=\"2946\" data-end=\"2967\">Surgical scissors</strong></p>\r\n</li>\r\n<li data-start=\"2970\" data-end=\"2996\">\r\n<p data-start=\"2972\" data-end=\"2996\"><strong data-start=\"2972\" data-end=\"2994\">Sutures &amp; staplers</strong></p>\r\n</li>\r\n<li data-start=\"2997\" data-end=\"3012\">\r\n<p data-start=\"2999\" data-end=\"3012\"><strong data-start=\"2999\" data-end=\"3010\">Forceps</strong></p>\r\n</li>\r\n<li data-start=\"3013\" data-end=\"3041\">\r\n<p data-start=\"3015\" data-end=\"3041\"><strong data-start=\"3015\" data-end=\"3041\">Endoscopic instruments</strong></p>\r\n</li>\r\n</ul>\r\n<h3 data-start=\"3043\" data-end=\"3063\"><strong data-start=\"3047\" data-end=\"3061\">Use Cases:</strong></h3>\r\n<ul data-start=\"3064\" data-end=\"3239\">\r\n<li data-start=\"3064\" data-end=\"3127\">\r\n<p data-start=\"3066\" data-end=\"3127\">Required in hospitals, surgery centers, and dental clinics.</p>\r\n</li>\r\n<li data-start=\"3128\" data-end=\"3239\">\r\n<p data-start=\"3130\" data-end=\"3239\">Used for minor procedures to major operations like appendectomy, orthopedic surgeries, and cardiac surgeries.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"3241\" data-end=\"3244\">\r\n<h2 data-start=\"3246\" data-end=\"3278\"><strong data-start=\"3249\" data-end=\"3276\">5. Laboratory Equipment</strong></h2>\r\n<p data-start=\"3279\" data-end=\"3320\">Used for diagnostic testing and research.</p>\r\n<h3 data-start=\"3322\" data-end=\"3348\"><strong data-start=\"3326\" data-end=\"3346\">Common Examples:</strong></h3>\r\n<ul data-start=\"3349\" data-end=\"3437\">\r\n<li data-start=\"3349\" data-end=\"3376\">\r\n<p data-start=\"3351\" data-end=\"3376\"><strong data-start=\"3351\" data-end=\"3374\">Centrifuge machines</strong></p>\r\n</li>\r\n<li data-start=\"3377\" data-end=\"3396\">\r\n<p data-start=\"3379\" data-end=\"3396\"><strong data-start=\"3379\" data-end=\"3394\">Microscopes</strong></p>\r\n</li>\r\n<li data-start=\"3397\" data-end=\"3420\">\r\n<p data-start=\"3399\" data-end=\"3420\"><strong data-start=\"3399\" data-end=\"3418\">Blood analyzers</strong></p>\r\n</li>\r\n<li data-start=\"3421\" data-end=\"3437\">\r\n<p data-start=\"3423\" data-end=\"3437\"><strong data-start=\"3423\" data-end=\"3437\">Incubators</strong></p>\r\n</li>\r\n</ul>\r\n<h3 data-start=\"3439\" data-end=\"3459\"><strong data-start=\"3443\" data-end=\"3457\">Use Cases:</strong></h3>\r\n<ul data-start=\"3460\" data-end=\"3595\">\r\n<li data-start=\"3460\" data-end=\"3501\">\r\n<p data-start=\"3462\" data-end=\"3501\">Testing blood, urine, tissue samples.</p>\r\n</li>\r\n<li data-start=\"3502\" data-end=\"3595\">\r\n<p data-start=\"3504\" data-end=\"3595\">Used widely in pathology labs, research institutions, and hospitals for accurate diagnosis.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"3597\" data-end=\"3600\">\r\n<h2 data-start=\"3602\" data-end=\"3639\"><strong data-start=\"3605\" data-end=\"3637\">6. Home Healthcare Equipment</strong></h2>\r\n<p data-start=\"3640\" data-end=\"3702\">Growing demand due to remote care and post-treatment recovery.</p>\r\n<h3 data-start=\"3704\" data-end=\"3730\"><strong data-start=\"3708\" data-end=\"3728\">Common Examples:</strong></h3>\r\n<ul data-start=\"3731\" data-end=\"3855\">\r\n<li data-start=\"3731\" data-end=\"3758\">\r\n<p data-start=\"3733\" data-end=\"3758\"><strong data-start=\"3733\" data-end=\"3756\">Digital BP Monitors</strong></p>\r\n</li>\r\n<li data-start=\"3759\" data-end=\"3778\">\r\n<p data-start=\"3761\" data-end=\"3778\"><strong data-start=\"3761\" data-end=\"3776\">Glucometers</strong></p>\r\n</li>\r\n<li data-start=\"3779\" data-end=\"3797\">\r\n<p data-start=\"3781\" data-end=\"3797\"><strong data-start=\"3781\" data-end=\"3795\">Nebulizers</strong></p>\r\n</li>\r\n<li data-start=\"3798\" data-end=\"3836\">\r\n<p data-start=\"3800\" data-end=\"3836\"><strong data-start=\"3800\" data-end=\"3834\">Electric wheelchairs &amp; walkers</strong></p>\r\n</li>\r\n<li data-start=\"3837\" data-end=\"3855\">\r\n<p data-start=\"3839\" data-end=\"3855\"><strong data-start=\"3839\" data-end=\"3855\">Thermometers</strong></p>\r\n</li>\r\n</ul>\r\n<h3 data-start=\"3857\" data-end=\"3877\"><strong data-start=\"3861\" data-end=\"3875\">Use Cases:</strong></h3>\r\n<ul data-start=\"3878\" data-end=\"3987\">\r\n<li data-start=\"3878\" data-end=\"3916\">\r\n<p data-start=\"3880\" data-end=\"3916\">Managing chronic diseases at home.</p>\r\n</li>\r\n<li data-start=\"3917\" data-end=\"3987\">\r\n<p data-start=\"3919\" data-end=\"3987\">Elderly care, post-surgery monitoring, and remote health management.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"3989\" data-end=\"3992\">\r\n<h2 data-start=\"3994\" data-end=\"4013\"><strong data-start=\"3997\" data-end=\"4011\">Conclusion</strong></h2>\r\n<p data-start=\"4014\" data-end=\"4358\">Medical equipment is the backbone of modern healthcare, supporting diagnosis, treatment, monitoring, and patient recovery. Whether in hospitals or at home, these devices ensure better accuracy, quick decision-making, and improved patient outcomes. As technology evolves, the demand for reliable and advanced medical equipment continues to grow.</p>\r\n</div>');

/*Table structure for table `offer_product_variants` */

DROP TABLE IF EXISTS `offer_product_variants`;

CREATE TABLE `offer_product_variants` (
  `offer_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_variant_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `offer_product_variants_offer_id_product_variant_id_unique` (`offer_id`,`product_variant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `offer_product_variants` */

insert  into `offer_product_variants`(`offer_id`,`product_variant_id`) values 
('0198dd1e-72b5-7268-b53e-11507575ae2e','0198dcec-7007-724d-a1e2-caad426d4e18'),
('0198dd1e-72b5-7268-b53e-11507575ae2e','0198dd12-1eaa-724c-8bdf-eb090d08b0c5');

/*Table structure for table `offer_translations` */

DROP TABLE IF EXISTS `offer_translations`;

CREATE TABLE `offer_translations` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `offer_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offer_translations_offer_id_locale_unique` (`offer_id`,`locale`),
  KEY `offer_translations_offer_id_index` (`offer_id`),
  KEY `offer_translations_locale_index` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `offer_translations` */

insert  into `offer_translations`(`id`,`offer_id`,`locale`,`title`,`description`,`created_at`,`updated_at`) values 
('0198dd1e-72c7-738c-8a60-3340e5b42ded','0198dd1e-72b5-7268-b53e-11507575ae2e','en','Deal Of This Week','Explore our latest products on this week deal','2025-08-24 21:26:56','2025-08-24 21:32:40');

/*Table structure for table `offers` */

DROP TABLE IF EXISTS `offers`;

CREATE TABLE `offers` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `discount_value` decimal(10,2) NOT NULL,
  `starts_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `banner_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bg_color` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `show_in_slider` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `offers_is_active_starts_at_ends_at_index` (`is_active`,`starts_at`,`ends_at`),
  KEY `offers_position_index` (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `offers` */

insert  into `offers`(`id`,`discount_type`,`discount_value`,`starts_at`,`ends_at`,`is_active`,`banner_image`,`link_url`,`bg_color`,`position`,`created_at`,`updated_at`,`deleted_at`,`show_in_slider`) values 
('0198dd1e-72b5-7268-b53e-11507575ae2e','percent',10.00,'2025-08-24 21:24:00','2025-08-31 23:25:00',1,NULL,NULL,NULL,0,'2025-08-24 21:26:56','2025-08-24 21:32:40',NULL,0);

/*Table structure for table `order_line_items` */

DROP TABLE IF EXISTS `order_line_items`;

CREATE TABLE `order_line_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `product_variant_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_line_items_order_id_foreign` (`order_id`),
  CONSTRAINT `order_line_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `order_line_items` */

insert  into `order_line_items`(`id`,`order_id`,`product_variant_id`,`quantity`,`price`,`subtotal`,`created_at`,`updated_at`,`deleted_at`) values 
(1,2,'0198dcec-7007-724d-a1e2-caad426d4e18',2,100.00,200.00,'2025-12-07 23:40:02','2025-12-07 23:40:02',NULL),
(2,3,'0198dcec-7007-724d-a1e2-caad426d4e18',1,100.00,100.00,'2025-12-07 23:51:23','2025-12-07 23:51:23',NULL);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `billing_address_id` int NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` enum('card','paypal','stripe','cod') COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `external_reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `tax` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_reference_number_unique` (`reference_number`),
  UNIQUE KEY `orders_order_number_unique` (`order_number`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `orders` */

insert  into `orders`(`id`,`reference_number`,`order_number`,`user_id`,`billing_address_id`,`email`,`payment_method`,`payment_status`,`external_reference`,`currency_id`,`sub_total`,`tax`,`total`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'128187','2782872',2,32,'satyamsuri82@gmail.com','card','completed','1981',1,21.00,3.00,21.00,'2025-12-05 03:20:17',NULL,NULL),
(2,'ORD-00001','7ed70fc2-499d-4fbb-9079-e048c3fd98db',2,2,'satyamsuri82@gmail.com','stripe','pending','pi_3SbnoPHdtcETBVzj0AiVZ7i7',4,200.00,10.00,210.00,'2025-12-07 23:40:02','2025-12-07 23:40:04',NULL),
(3,'ORD-00002','abf3d679-6157-406e-a5bc-baf1881f1e7c',2,3,'satyamsuri82@gmail.com','stripe','paid','pi_3SbnzNHdtcETBVzj1Oy6cUvP',4,100.00,5.00,105.00,'2025-12-07 23:51:23','2025-12-07 23:51:26',NULL);

/*Table structure for table `page_section_translations` */

DROP TABLE IF EXISTS `page_section_translations`;

CREATE TABLE `page_section_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `page_section_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_section_translations_page_section_id_locale_unique` (`page_section_id`,`locale`),
  KEY `page_section_translations_page_section_id_index` (`page_section_id`),
  KEY `page_section_translations_locale_index` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `page_section_translations` */

insert  into `page_section_translations`(`id`,`page_section_id`,`locale`,`heading`,`content`,`created_at`,`updated_at`) values 
(1,'6804d0ce-9561-46fc-8e73-34d46a289872','en','Conatct Us','<p>Sed ut perspiciatis unde omnis natus error</p>','2025-09-04 01:10:49','2025-09-04 03:30:24'),
(2,'69ba6abd-bd3b-48c6-aebb-1ef2e961cafc','en','','','2025-09-04 01:10:49','2025-09-04 01:10:49'),
(3,'0c340907-a113-4099-8343-1a02f1a2f74c','en','Send Us A Message','<p>Sed ut perspiciatis unde omnis iste natus error</p>','2025-09-04 01:10:49','2025-09-04 03:30:24'),
(4,'e2e3c718-4abe-4a3b-b31a-11c65f98a5f2','en','What Our Client’s Say','<p>Sed ut perspiciatis unde omnis iste natus error</p>','2025-09-04 01:29:41','2025-09-04 01:37:42'),
(5,'c2426acf-17e5-48b4-8ef0-56a221d87dae','en','25','<p>Years of experience</p>','2025-09-04 01:29:41','2025-09-04 01:37:42'),
(6,'47a3b82a-4892-4e79-8d27-aaae35afa53e','en','Our MIssion & Vision','<p>Quis autem vel eum iure reprehenderit quin voluptate velit esse quam nihil molestiae consequatur vel illum qui dolorem eum</p>','2025-09-04 01:29:41','2025-09-04 01:37:42'),
(7,'9f0147fa-303e-45df-9468-50ace6209883','en','Treatment For Covid -19','<p>But I must explain to you how all this mistaken idea denouncing pleasure and praising pain was born and complete account</p>','2025-09-04 01:29:41','2025-09-04 01:37:42'),
(8,'48fce03f-9758-4735-8622-87f00fb8fdb2','en','2560','<p>Saticfied Clients</p>','2025-09-04 01:37:42','2025-09-04 01:52:25'),
(9,'f70be224-0f3c-47b3-bffa-4f187231e534','en','9862','<p>Finished Works</p>','2025-09-04 01:37:42','2025-09-04 01:52:25'),
(10,'a01860ee-f5b0-43ed-896d-9bec044a2f3b','en','7563','<p>covid -19 specialist</p>','2025-09-04 01:37:42','2025-09-04 01:52:25'),
(11,'4e74402e-14c9-497e-a87b-4c986c42bb11','en','6534','<p>global brands</p>','2025-09-04 01:37:42','2025-09-04 01:52:25'),
(12,'76d28f5c-d72f-4076-bcaa-3340ebac4c7c','en','Our Main Goals','<p>Sed ut perspiciatis unde omnis iste natus error</p>','2025-09-04 01:37:42','2025-09-04 01:52:25'),
(13,'a6b6befd-39be-4144-906c-8e826066eee6','en','Medical Accessories','<p>Sed ut perspiciatis unde omnis wste natsit volupta explic</p>','2025-09-04 01:37:42','2025-09-04 01:52:25'),
(14,'bc346fa2-0a7f-4ea8-9a4d-c223de7fe6a6','en','Covid - 19 Treatment Center','<p>Sed ut perspiciatis unde omnis wste natsit volupta explic</p>','2025-09-04 01:37:42','2025-09-04 01:52:25'),
(15,'cd74514f-c252-42ae-a84d-2574f86d9821','en','24/7 Hours Emergency Care','<p>Sed ut perspiciatis unde omnis wste natsit volupta explic</p>','2025-09-04 01:37:42','2025-09-04 01:52:25'),
(16,'a8aac1b5-c24e-4e06-b621-f7d0e3f54caf','en','Online Free Consultations','<p>Sed ut perspiciatis unde omnis wste natsit volupta explic</p>','2025-09-04 01:37:42','2025-09-04 01:52:25');

/*Table structure for table `page_sections` */

DROP TABLE IF EXISTS `page_sections`;

CREATE TABLE `page_sections` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `position` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_sections_page_id_index` (`page_id`),
  CONSTRAINT `page_sections_chk_1` CHECK (json_valid(`settings`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `page_sections` */

insert  into `page_sections`(`id`,`page_id`,`type`,`image`,`settings`,`position`,`is_active`,`created_at`,`updated_at`,`deleted_at`) values 
('0c340907-a113-4099-8343-1a02f1a2f74c','0198f2a7-43f2-717f-aff5-9a486fcf3d09','contact-form',NULL,NULL,0,1,'2025-09-04 01:10:49','2025-09-04 03:30:24',NULL),
('47a3b82a-4892-4e79-8d27-aaae35afa53e','01991177-050d-73c1-bf8d-25fba376278c','what-client-says-1',NULL,NULL,10,1,'2025-09-04 01:29:41','2025-09-04 03:29:09',NULL),
('48fce03f-9758-4735-8622-87f00fb8fdb2','01991177-050d-73c1-bf8d-25fba376278c','stats-1','sections/YBVN8vRzY6biUkguEgGpfN0DDr54o2gZB1L9cRnl.png',NULL,7,1,'2025-09-04 01:37:42','2025-09-04 03:29:09',NULL),
('4e74402e-14c9-497e-a87b-4c986c42bb11','01991177-050d-73c1-bf8d-25fba376278c','stats-4','sections/HZDQySjl4u1MskgWBBxtpTggc8vkwme2HVJWxMJ2.png',NULL,3,1,'2025-09-04 01:37:42','2025-09-04 03:29:09',NULL),
('6804d0ce-9561-46fc-8e73-34d46a289872','0198f2a7-43f2-717f-aff5-9a486fcf3d09','main-section','sections/a7i3SceJTLZt37hEuiFrcVRNqvasyiuErIXBx9bY.png',NULL,2,1,'2025-09-04 01:10:49','2025-09-04 03:30:24',NULL),
('69ba6abd-bd3b-48c6-aebb-1ef2e961cafc','0198f2a7-43f2-717f-aff5-9a486fcf3d09','main-section-icon','sections/U4UtFXSPb4HlV4ACdZaBBn6mL5F2mHFQ5QaVmQ5v.png',NULL,1,1,'2025-09-04 01:10:49','2025-09-04 03:30:24',NULL),
('76d28f5c-d72f-4076-bcaa-3340ebac4c7c','01991177-050d-73c1-bf8d-25fba376278c','goals',NULL,NULL,2,1,'2025-09-04 01:37:42','2025-09-04 03:29:09',NULL),
('9f0147fa-303e-45df-9468-50ace6209883','01991177-050d-73c1-bf8d-25fba376278c','what-client-says-2',NULL,NULL,5,1,'2025-09-04 01:29:41','2025-09-04 03:29:09',NULL),
('a01860ee-f5b0-43ed-896d-9bec044a2f3b','01991177-050d-73c1-bf8d-25fba376278c','stats-3','sections/KQApgqpv3wr3sVA103DQagXvWkK0Ouw6V1YKgUHS.png',NULL,9,1,'2025-09-04 01:37:42','2025-09-04 03:29:09',NULL),
('a6b6befd-39be-4144-906c-8e826066eee6','01991177-050d-73c1-bf8d-25fba376278c','goals-1','sections/C23mAapfi4HvcVBEBff9qGYG6xZ3vkudOYDckeU5.png',NULL,8,1,'2025-09-04 01:37:42','2025-09-04 03:29:09',NULL),
('a8aac1b5-c24e-4e06-b621-f7d0e3f54caf','01991177-050d-73c1-bf8d-25fba376278c','goals-4','sections/5wPPUGz8aJvbHrRv9khgZ461oeslkoPzZ0TyAePN.png',NULL,12,1,'2025-09-04 01:37:42','2025-09-04 03:29:09',NULL),
('bc346fa2-0a7f-4ea8-9a4d-c223de7fe6a6','01991177-050d-73c1-bf8d-25fba376278c','goals-2','sections/SSmAYfRh4cM9S0mokwJyAYJ8nPLL6t0BXGPZJhav.png',NULL,11,1,'2025-09-04 01:37:42','2025-09-04 03:29:09',NULL),
('c2426acf-17e5-48b4-8ef0-56a221d87dae','01991177-050d-73c1-bf8d-25fba376278c','what-client-says-year',NULL,NULL,6,1,'2025-09-04 01:29:41','2025-09-04 03:29:09',NULL),
('cd74514f-c252-42ae-a84d-2574f86d9821','01991177-050d-73c1-bf8d-25fba376278c','goals-3','sections/NTeESYczns9WvV8Abt7OF4MSicHS9sRXd9tF7PCL.png',NULL,1,1,'2025-09-04 01:37:42','2025-09-04 03:29:09',NULL),
('e2e3c718-4abe-4a3b-b31a-11c65f98a5f2','01991177-050d-73c1-bf8d-25fba376278c','what-client-says','sections/viZvIsotifnShpb0zKPFUcVnrarA6EYhYrHQIVB3.jpg',NULL,0,1,'2025-09-04 01:29:41','2025-09-04 03:29:09',NULL),
('f70be224-0f3c-47b3-bffa-4f187231e534','01991177-050d-73c1-bf8d-25fba376278c','stats-2','sections/1yi6XvQ2nXDllwxC7uIEvNbdVcVVX9GbdT1Xjc3g.png',NULL,4,1,'2025-09-04 01:37:42','2025-09-04 03:29:09',NULL);

/*Table structure for table `page_translations` */

DROP TABLE IF EXISTS `page_translations`;

CREATE TABLE `page_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `page_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_translations_page_id_locale_unique` (`page_id`,`locale`),
  KEY `page_translations_page_id_index` (`page_id`),
  KEY `page_translations_locale_index` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `page_translations` */

insert  into `page_translations`(`id`,`page_id`,`locale`,`title`,`content`,`created_at`,`updated_at`) values 
(1,'0198f2a6-b73c-72d2-b4ef-bffd9bd4e8c9','en','Home','','2025-08-29 01:47:48','2025-08-29 01:47:48'),
(2,'0198f2a7-43f2-717f-aff5-9a486fcf3d09','en','Contact','','2025-08-29 01:48:24','2025-08-29 01:48:24'),
(3,'0198f2a8-024c-7150-b0b5-1b667f526193','en','Products','','2025-08-29 01:49:13','2025-08-29 01:49:13'),
(4,'0199113f-d3d9-7166-adab-21ead2be9126','en','Login','','2025-09-04 00:23:39','2025-09-04 00:23:39'),
(5,'01991162-f0e7-72e5-a361-f075c2844ff3','en','Cart','','2025-09-04 01:02:00','2025-09-04 01:02:00'),
(6,'01991177-050d-73c1-bf8d-25fba376278c','en','About','','2025-09-04 01:23:56','2025-09-04 01:23:56'),
(7,'01991199-dbce-73ba-8744-c8cc3eede52e','en','News','','2025-09-04 02:02:00','2025-09-04 02:02:00');

/*Table structure for table `pages` */

DROP TABLE IF EXISTS `pages`;

CREATE TABLE `pages` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `position` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `pages` */

insert  into `pages`(`id`,`slug`,`banner`,`is_active`,`position`,`created_at`,`updated_at`,`deleted_at`) values 
('0198f2a6-b73c-72d2-b4ef-bffd9bd4e8c9','home',NULL,1,0,'2025-08-29 01:47:48','2025-08-29 01:47:48',NULL),
('0198f2a7-43f2-717f-aff5-9a486fcf3d09','contact-us','pages/8g3munjZw3T7K8XzAjpv9LH9bSva9eBYQdQ11vgm.jpg',1,6,'2025-08-29 01:48:24','2025-09-04 03:30:24',NULL),
('0198f2a8-024c-7150-b0b5-1b667f526193','products','pages/e6qAkUVS75QN6DNmPHbiITpxAuja3mrJW2u73po8.jpg',1,0,'2025-08-29 01:49:13','2025-09-04 03:31:22',NULL),
('0199113f-d3d9-7166-adab-21ead2be9126','login','pages/vEwEbPehVjcf150jABQp1j2dMZaBLqFQDHnCjocY.jpg',1,4,'2025-09-04 00:23:39','2025-09-04 03:30:47',NULL),
('01991162-f0e7-72e5-a361-f075c2844ff3','cart','pages/1R0Vn95yCzJWNFCVXgb9X8zRjWKOqZYHb4G4QYPo.jpg',1,5,'2025-09-04 01:02:00','2025-09-04 03:29:37',NULL),
('01991177-050d-73c1-bf8d-25fba376278c','about-us','pages/Xe8Yzi4k7UROTqQTRiExPvM1jQJs4Oe9vIOAyTxx.jpg',1,7,'2025-09-04 01:23:56','2025-09-04 03:29:09',NULL),
('01991199-dbce-73ba-8744-c8cc3eede52e','news','pages/q8cwCZlbdKETO5Wqx6579COX9Z7695joFINxC6GS.jpg',1,7,'2025-09-04 02:02:00','2025-09-04 03:31:07',NULL);

/*Table structure for table `password_reset_tokens` */

DROP TABLE IF EXISTS `password_reset_tokens`;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_reset_tokens` */

/*Table structure for table `payment_gateways` */

DROP TABLE IF EXISTS `payment_gateways`;

CREATE TABLE `payment_gateways` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `gateway` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` text COLLATE utf8mb4_unicode_ci,
  `secret` text COLLATE utf8mb4_unicode_ci,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `payment_gateways_chk_1` CHECK (json_valid(`additional`))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `payment_gateways` */

insert  into `payment_gateways`(`id`,`gateway`,`key`,`secret`,`additional`,`is_active`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'stripe','eyJpdiI6ImtYWEEyWWFNUFZlWVRBOW41elJIUkE9PSIsInZhbHVlIjoiRC9QK2doa1YzelNrL01GckxtMVcybFZmVGhUQ3d5c2JxMW9Pc3RxVm4wYlRLVDluVGkzVkdZWVhhbW13cVBJbklkWVg4WG90eGdqVEVoQlJzbU1BQjJqZVd0RjVvL2lVQjdNZlZwSnlwV2d1bVBZY1BZdTdVM1JhSEozRndlcmxXZExVUElqYndHQVM0NkhXT2wxYVF3PT0iLCJtYWMiOiJlMTlkNDYyODJkOTY2ODA3OGUwN2RjYTNkNjI5OGRiNDk0MzFkZGUwNmNkYjdhMDQwZGM1NDU2ZGFjOGE5ZmI2IiwidGFnIjoiIn0=','eyJpdiI6InlaNHlSRTBQWEpRRUd5ZmpSRU14a2c9PSIsInZhbHVlIjoiTHQzZFJGdnFGZEJWck95UWtMbCtPcjVGUjE5c25GTC82THNkTDJpQ0JYNVRadUhsRlpTQkZrS3FDLzF4bDFPbjErTDRjT2lNWERXc0ZkTVFvWGFpTlZDTXZYSHNwdWpVSExLN2JKV1BzNVVNLzhtUmhUNzVyWHpkdEhjbmozblhrcTFPOG9kd2NzcXRwTyt5a1VCc0h3PT0iLCJtYWMiOiI0N2M5YTAzOTEyZWY1Mjc4YTJmZDBiNmZiNTc0MDIwYmI5N2U1Njk0NmQyYTQ4NmY1YmIzMWFhNjEyM2Y3Y2ZiIiwidGFnIjoiIn0=',NULL,1,'2025-12-07 23:25:15','2025-12-07 23:25:15',NULL);

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `module_id` int unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_module_permission` (`module_id`,`name`),
  KEY `permissions_module_id_index` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permissions` */

/*Table structure for table `product_countries` */

DROP TABLE IF EXISTS `product_countries`;

CREATE TABLE `product_countries` (
  `product_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT '1',
  `tax` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`product_id`,`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_countries` */

/*Table structure for table `product_translations` */

DROP TABLE IF EXISTS `product_translations`;

CREATE TABLE `product_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_translations_product_id_locale_unique` (`product_id`,`locale`),
  KEY `product_translations_product_id_index` (`product_id`),
  KEY `product_translations_locale_index` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_translations` */

insert  into `product_translations`(`id`,`product_id`,`locale`,`name`,`description`) values 
(1,'0198d3f7-b4d4-72f4-b5a1-edcca88e53e3','en','Temperature','Temperature'),
(2,'0198d7ee-b250-700e-88ce-8e46cd9fbf5e','en','Thermometer',NULL),
(3,'0198d7f1-1c88-73f0-add0-de69e53ee8db','en','Oximeter',NULL),
(4,'0198d7f2-51f8-738f-9bc1-88856522849f','en','N95 Face Mask',NULL),
(5,'0198d7f4-59a3-7374-bcea-8746781160f2','en','Hand Gloves',NULL),
(6,'0198dce8-a674-72a0-b681-00d74f0b6960','en','Blood Pressure Meter',NULL),
(7,'0198dd10-420e-71d4-b84a-99e67ac3f2b3','en','Hand Sanitizer Covid -19',NULL);

/*Table structure for table `product_variant_attribute_value` */

DROP TABLE IF EXISTS `product_variant_attribute_value`;

CREATE TABLE `product_variant_attribute_value` (
  `product_variant_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_value_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`product_variant_id`,`attribute_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_variant_attribute_value` */

insert  into `product_variant_attribute_value`(`product_variant_id`,`attribute_value_id`) values 
('0198d7ed-2521-72fd-a60b-02182a9061b5','0198d7ea-5f6c-71d3-8cdd-78effda034cb'),
('0198d7ef-7251-70d7-aaf8-f4440ab9268d','0198d7ea-5f6c-71d3-8cdd-78effda034cb'),
('0198d7f1-8d59-7048-8dff-09dc96ea3a81','0198d7ea-5f6c-71d3-8cdd-78effda034cb'),
('0198d7f2-e900-72a0-b5f3-32952716db37','0198d7ea-5f6c-71d3-8cdd-78effda034cb'),
('0198d7f5-d901-7147-aa32-5ebea3e6ef54','0198d7ea-5f6c-71d3-8cdd-78effda034cb'),
('0198dcec-7007-724d-a1e2-caad426d4e18','0198d7ea-5f6c-71d3-8cdd-78effda034cb'),
('0198dd12-1eaa-724c-8bdf-eb090d08b0c5','0198d7ea-5f6c-71d3-8cdd-78effda034cb');

/*Table structure for table `product_variant_shippings` */

DROP TABLE IF EXISTS `product_variant_shippings`;

CREATE TABLE `product_variant_shippings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_variant_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `length` decimal(8,2) DEFAULT NULL,
  `width` decimal(8,2) DEFAULT NULL,
  `height` decimal(8,2) DEFAULT NULL,
  `weight` decimal(8,2) DEFAULT NULL,
  `qty_per_carton` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_variant_shippings_product_variant_id_unique` (`product_variant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_variant_shippings` */

insert  into `product_variant_shippings`(`id`,`product_variant_id`,`length`,`width`,`height`,`weight`,`qty_per_carton`,`created_at`,`updated_at`) values 
(1,'0198d7ed-2521-72fd-a60b-02182a9061b5',10.00,10.00,10.00,1.00,1.00,'2025-08-23 21:14:59','2025-08-23 21:14:59'),
(2,'0198d7ef-7251-70d7-aaf8-f4440ab9268d',10.00,10.00,10.00,1.00,1.00,'2025-08-23 21:17:30','2025-08-23 21:17:30'),
(3,'0198d7f1-8d59-7048-8dff-09dc96ea3a81',10.00,10.00,10.00,1.00,1.00,'2025-08-23 21:19:48','2025-08-23 21:19:48'),
(4,'0198d7f2-e900-72a0-b5f3-32952716db37',10.00,10.00,10.00,1.00,1.00,'2025-08-23 21:21:17','2025-08-23 21:21:17'),
(5,'0198d7f5-d901-7147-aa32-5ebea3e6ef54',10.00,10.00,10.00,1.00,1.00,'2025-08-23 21:24:30','2025-08-23 21:24:30'),
(6,'0198dcec-7007-724d-a1e2-caad426d4e18',10.00,10.00,10.00,1.00,1.00,'2025-08-24 20:32:19','2025-08-24 20:32:19'),
(7,'0198dd12-1eaa-724c-8bdf-eb090d08b0c5',1.00,1.00,1.00,1.00,1.00,'2025-08-24 21:13:29','2025-08-24 21:13:29');

/*Table structure for table `product_variants` */

DROP TABLE IF EXISTS `product_variants`;

CREATE TABLE `product_variants` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_variants_sku_unique` (`sku`),
  KEY `product_variants_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_variants` */

insert  into `product_variants`(`id`,`product_id`,`sku`,`price`,`stock`,`created_at`,`updated_at`,`deleted_at`) values 
('0198d7ed-2521-72fd-a60b-02182a9061b5','0198d3f7-b4d4-72f4-b5a1-edcca88e53e3','SKU-00001',400.00,10,'2025-08-23 21:14:59','2025-08-23 21:14:59',NULL),
('0198d7ef-7251-70d7-aaf8-f4440ab9268d','0198d7ee-b250-700e-88ce-8e46cd9fbf5e','SKU-00002',400.00,10,'2025-08-23 21:17:30','2025-08-23 21:17:30',NULL),
('0198d7f1-8d59-7048-8dff-09dc96ea3a81','0198d7f1-1c88-73f0-add0-de69e53ee8db','SKU-00003',400.00,10,'2025-08-23 21:19:48','2025-08-23 21:19:48',NULL),
('0198d7f2-e900-72a0-b5f3-32952716db37','0198d7f2-51f8-738f-9bc1-88856522849f','SKU-00004',400.00,10,'2025-08-23 21:21:17','2025-08-23 21:21:17',NULL),
('0198d7f5-d901-7147-aa32-5ebea3e6ef54','0198d7f4-59a3-7374-bcea-8746781160f2','SKU-00005',400.00,10,'2025-08-23 21:24:30','2025-08-23 21:24:30',NULL),
('0198dcec-7007-724d-a1e2-caad426d4e18','0198dce8-a674-72a0-b681-00d74f0b6960','SKU-00006',100.00,1,'2025-08-24 20:32:19','2025-08-24 20:32:19',NULL),
('0198dd12-1eaa-724c-8bdf-eb090d08b0c5','0198dd10-420e-71d4-b84a-99e67ac3f2b3','SKU-00007',200.00,10,'2025-08-24 21:13:29','2025-08-24 21:13:29',NULL);

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `is_new` tinyint(1) NOT NULL DEFAULT '0',
  `show_in_slider` tinyint(1) NOT NULL DEFAULT '0',
  `position` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  KEY `products_category_id_index` (`category_id`),
  KEY `products_brand_id_index` (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `products` */

insert  into `products`(`id`,`category_id`,`brand_id`,`slug`,`is_active`,`is_featured`,`is_new`,`show_in_slider`,`position`,`created_at`,`updated_at`,`deleted_at`) values 
('0198d3f7-b4d4-72f4-b5a1-edcca88e53e3','0198d3f6-2f07-716a-ab44-8dab08ae7c0e',NULL,'temperature',1,0,0,1,1,'2025-08-23 02:48:03','2025-08-23 02:48:03',NULL),
('0198d7ee-b250-700e-88ce-8e46cd9fbf5e','0198d7df-f004-7182-bf7a-b106ac223520',NULL,'thermometer',1,0,1,1,1,'2025-08-23 21:16:41','2025-08-23 21:16:41',NULL),
('0198d7f1-1c88-73f0-add0-de69e53ee8db','0198d7e5-a650-7368-9bba-655e8ae5d0ee',NULL,'Oximeter',1,0,1,1,2,'2025-08-23 21:19:19','2025-08-23 21:19:19',NULL),
('0198d7f2-51f8-738f-9bc1-88856522849f','0198d7e6-3c13-725a-be80-c9f5909d31ac',NULL,'n950-face-mask',1,0,1,1,4,'2025-08-23 21:20:38','2025-08-23 21:20:38',NULL),
('0198d7f4-59a3-7374-bcea-8746781160f2','0198d7e7-0fde-731e-9d18-a49938d60fe7',NULL,'hand-gloves',1,1,0,1,5,'2025-08-23 21:22:51','2025-08-23 21:35:21',NULL),
('0198dce8-a674-72a0-b681-00d74f0b6960','0198d7df-f004-7182-bf7a-b106ac223520',NULL,'blood-pressure-meter',1,0,1,0,0,'2025-08-24 20:28:11','2025-08-24 20:28:11',NULL),
('0198dd10-420e-71d4-b84a-99e67ac3f2b3','0198dd0b-be92-707e-b51a-c57195136245',NULL,'hand-sanitizer-covid-19',1,0,0,0,0,'2025-08-24 21:11:26','2025-08-24 21:11:26',NULL);

/*Table structure for table `provinces` */

DROP TABLE IF EXISTS `provinces`;

CREATE TABLE `provinces` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `provinces` */

insert  into `provinces`(`id`,`country_id`,`name`,`created_at`,`updated_at`) values 
(1,1,'Abu Dhabi','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(2,1,'Dubai','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(3,1,'Sharjah','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(4,1,'Ajman','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(5,1,'Umm Al Quwain','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(6,1,'Ras Al Khaimah','2025-08-13 02:39:42','2025-08-13 02:39:42'),
(7,1,'Fujairah','2025-08-13 02:39:42','2025-08-13 02:39:42');

/*Table structure for table `role_permissions` */

DROP TABLE IF EXISTS `role_permissions`;

CREATE TABLE `role_permissions` (
  `role_id` int unsigned NOT NULL,
  `permission_id` int unsigned NOT NULL,
  UNIQUE KEY `unique_role_permission` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `role_permissions` */

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

/*Table structure for table `sessions` */

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sessions` */

insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values 
('0XVnMJiCRepG9rFhWarx6kPEpHUZebkxV37JjrKW',2,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiTE9OU2ZDRTdKSDN2NG9naVdGSDVaWnNlZE9md1pCSmF6UmxmamxUSSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jdXN0b21lcnMvcHJvZmlsZSI7czo1OiJyb3V0ZSI7czoxNzoiY3VzdG9tZXJzLnByb2ZpbGUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YToxOntzOjg6ImludGVuZGVkIjtzOjM5OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvY3VzdG9tZXJzL3Byb2ZpbGUiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=',1765137243),
('24QxgeuPc2YlUVadNvBbqeWM1w3STK3NFhdtV7Gd',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQlJEbkNjSkV0eURJQjh0R2IwSnJ3emlWWEprcTMxTmxuN3R0eGhiSCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cy9ibG9vZC1wcmVzc3VyZS1tZXRlci9zaXRlLndlYm1hbmlmZXN0IjtzOjU6InJvdXRlIjtzOjEzOiJwcm9kdWN0cy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1765133883),
('7ku0NJYTb1FUgzZ5ZGAcdSb33t93Y4vvpqZY7VTJ',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidDZLZjUySGd1emV4NVpZb0lTM3M0RUxJd1dqdm1JT0FaNDlIbkh3UyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cy9oYW5kLWdsb3Zlcy9zaXRlLndlYm1hbmlmZXN0IjtzOjU6InJvdXRlIjtzOjEzOiJwcm9kdWN0cy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1765134779),
('a0X5f7aSlsjNAPEAJ57kzUMGQlaRLPrGe5SpOXtf',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWHJSanBXVkUzWEM5enE0YmNuVXU3MXp3YmpkaVlkYmhWbzNXQ0duOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cy9oYW5kLWdsb3Zlcy9zaXRlLndlYm1hbmlmZXN0IjtzOjU6InJvdXRlIjtzOjEzOiJwcm9kdWN0cy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1765134755),
('BKhpCdk6lzuzIWQqE9flxGYRgCNgXogE431X1MZe',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoicnA5a3Nza3QyVk11SUdPTVdGV21PcExKdGNqbDNsWGt0YmI5aEowbiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cy9ibG9vZC1wcmVzc3VyZS1tZXRlci9zaXRlLndlYm1hbmlmZXN0IjtzOjU6InJvdXRlIjtzOjEzOiJwcm9kdWN0cy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1765133709),
('LdIpJ9bXSIRlnizjv5ETAqmn91I2Jl0lgm912Xha',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWmNRWFRwbWx1R0k5cWgxWXM2ejhoaXRhQXhLUGhEUGUweGM1YUoyRCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cy9oYW5kLWdsb3Zlcy9zaXRlLndlYm1hbmlmZXN0IjtzOjU6InJvdXRlIjtzOjEzOiJwcm9kdWN0cy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1765134885),
('LWu5qMb1ChuvkzivT807YYyY0ow4yAt7zrEQTXph',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVlJsWDVJaGs5d0tsakJiTHJXS1JqYnNCRG9oQk9QT0U2UGNQRkhGOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozOToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2N1c3RvbWVycy9wcm9maWxlIjt9czo1MjoibG9naW5fYWRtaW5fNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=',1765134894),
('rr9OzDmCrg6Co6LXH3MpDpFQ8illirxnvBl2TF7g',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUNpSXpLM2FxdUs1NG8wZGhvcngzcTlEZVpIekJoS3hNRUxBQTY2VSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cy9ibG9vZC1wcmVzc3VyZS1tZXRlci9zaXRlLndlYm1hbmlmZXN0IjtzOjU6InJvdXRlIjtzOjEzOiJwcm9kdWN0cy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1765133617),
('uW1qlY1qsXjrOVMZvNTPF5CcFDJgUjspYT8He12J',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibkV0djJXVno3cmVMaWtYTk5PM3NCUHlUSENwNnpGM2l1WnNzZzM0WCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cy9ibG9vZC1wcmVzc3VyZS1tZXRlci9zaXRlLndlYm1hbmlmZXN0IjtzOjU6InJvdXRlIjtzOjEzOiJwcm9kdWN0cy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1765133754),
('Vy1UUfT0j65dHleGHOMns2TJb0VpoF68ij3SpsqN',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoicTNUWlpHWmsxSkVqRHpGVVc4ZVZRdmhNckYzMHlIZkJTclJ1dzBJVCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cy9ibG9vZC1wcmVzc3VyZS1tZXRlci9zaXRlLndlYm1hbmlmZXN0IjtzOjU6InJvdXRlIjtzOjEzOiJwcm9kdWN0cy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1765133774),
('wLaHI3FF1LfqqCjeOk5KBWCj8bEjzfpplaMDSH89',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMU04U2trRlhxYnBvY3hqaUdVOW9YWWtPaGlZcVBMUmlNbmdwM3dteiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cy9ibG9vZC1wcmVzc3VyZS1tZXRlci9zaXRlLndlYm1hbmlmZXN0IjtzOjU6InJvdXRlIjtzOjEzOiJwcm9kdWN0cy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1765133721),
('zKXXHfezEVHcC5Vi1QMr5kmKnzG7Wpc0FkMSLfop',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUMyNFpsRDY5a2ZSeXdjcXhPUEhPMTN3WXhod2FWQkNXaThyOWhCdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cy9ibG9vZC1wcmVzc3VyZS1tZXRlci9zaXRlLndlYm1hbmlmZXN0IjtzOjU6InJvdXRlIjtzOjEzOiJwcm9kdWN0cy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1765133778);

/*Table structure for table `settings` */

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `settings` */

insert  into `settings`(`id`,`key`,`value`,`created_at`,`updated_at`) values 
(1,'site_title','Optimised Medical Supplies','2025-08-13 02:43:54','2025-08-13 02:43:54'),
(2,'contact_email','info@optimisedmedicalsupplie.com','2025-08-13 02:43:54','2025-08-13 02:43:54'),
(3,'contact_phone','01234567899','2025-08-13 02:43:54','2025-08-13 02:43:54'),
(4,'address','The cottage, Old berrow manor, birmingham, B955PF','2025-08-13 02:43:54','2025-08-13 02:43:54'),
(5,'copyright','Optimised Medical Supplies ©  2025.  All Rights Reserved','2025-08-13 02:43:54','2025-08-25 04:07:27'),
(6,'site_logo','settings/nqiWzZqIfwIB9R7CRxWrOiIajmTXMTBVx7tCWOdc.webp','2025-08-13 02:43:54','2025-08-13 02:43:54'),
(7,'site_footer_logo','settings/trSI5PZcpZu8yIfRmNrdpOBZONfSMguNW2Ui3DlV.webp','2025-08-13 02:43:54','2025-08-13 02:43:54'),
(8,'site_favicon','settings/zWYbpWRytOcPfsTsu8SG1ciPSXrHGzzjaVjbOZFt.webp','2025-08-13 02:43:54','2025-08-13 02:43:54'),
(9,'facebook','https://www.facebook.com/','2025-08-25 04:02:31','2025-08-25 04:02:31'),
(10,'instagram','https://www.instagram.com/','2025-08-25 04:02:31','2025-08-25 04:02:31'),
(11,'linkedin',NULL,'2025-08-25 04:02:31','2025-08-25 04:02:31'),
(12,'pinterest',NULL,'2025-08-25 04:02:31','2025-08-25 04:02:31'),
(13,'twitter','https://www.x.com','2025-08-25 04:02:31','2025-08-25 04:02:31'),
(14,'site_intro','But must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born','2025-08-25 04:06:30','2025-08-25 04:07:27');

/*Table structure for table `subscription_items` */

DROP TABLE IF EXISTS `subscription_items`;

CREATE TABLE `subscription_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint unsigned NOT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscription_items_stripe_id_unique` (`stripe_id`),
  KEY `subscription_items_subscription_id_stripe_price_index` (`subscription_id`,`stripe_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `subscription_items` */

/*Table structure for table `subscriptions` */

DROP TABLE IF EXISTS `subscriptions`;

CREATE TABLE `subscriptions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscriptions_stripe_id_unique` (`stripe_id`),
  KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `subscriptions` */

/*Table structure for table `tag_product_variant` */

DROP TABLE IF EXISTS `tag_product_variant`;

CREATE TABLE `tag_product_variant` (
  `tag_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_variant_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tag_product_variant` */

insert  into `tag_product_variant`(`tag_id`,`product_variant_id`) values 
('0198d7ec-2fc7-73ce-8492-9f1e5d5e2445','0198d7ed-2521-72fd-a60b-02182a9061b5'),
('0198d7ec-2fc7-73ce-8492-9f1e5d5e2445','0198d7ef-7251-70d7-aaf8-f4440ab9268d'),
('0198d7ec-2fc7-73ce-8492-9f1e5d5e2445','0198d7f1-8d59-7048-8dff-09dc96ea3a81'),
('0198d7ec-2fc7-73ce-8492-9f1e5d5e2445','0198d7f2-e900-72a0-b5f3-32952716db37'),
('0198d7ec-2fc7-73ce-8492-9f1e5d5e2445','0198d7f5-d901-7147-aa32-5ebea3e6ef54'),
('0198d80a-a259-7203-ac58-c9a5d3898286','0198dcec-7007-724d-a1e2-caad426d4e18'),
('0198d80a-a259-7203-ac58-c9a5d3898286','0198dd12-1eaa-724c-8bdf-eb090d08b0c5');

/*Table structure for table `tags` */

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `position` int NOT NULL DEFAULT '99',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tags` */

insert  into `tags`(`id`,`is_active`,`position`,`name`,`created_at`,`updated_at`,`deleted_at`) values 
('0198d7ec-2fc7-73ce-8492-9f1e5d5e2445',1,1,'Covid-19','2025-08-23 21:13:56','2025-08-23 21:13:56',NULL),
('0198d80a-a259-7203-ac58-c9a5d3898286',1,1,'Best Seller','2025-08-23 21:47:12','2025-08-23 21:47:12',NULL),
('0198d80a-de30-732b-bb3a-c08778287508',1,2,'Top Rated','2025-08-23 21:47:27','2025-08-23 21:47:27',NULL),
('0198d80b-0e6d-70d4-b86f-4c732e64a3c1',1,3,'Popular','2025-08-23 21:47:40','2025-08-23 21:47:40',NULL);

/*Table structure for table `testimonial_translations` */

DROP TABLE IF EXISTS `testimonial_translations`;

CREATE TABLE `testimonial_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `testimonial_id` int NOT NULL,
  `locale` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `testimonial_translations_testimonial_id_locale_unique` (`testimonial_id`,`locale`),
  KEY `testimonial_translations_locale_index` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `testimonial_translations` */

insert  into `testimonial_translations`(`id`,`testimonial_id`,`locale`,`name`,`description`) values 
(1,3,'','Sebastian Barry','Sed perspiciatis unde omnis iste natus erolup tatem accusantium doloremque laudantium totam\r\n                                reperiam eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta\r\n                                sunt explicabo.'),
(2,3,'en','Sebastian Barry','Sed perspiciatis unde omnis iste natus erolup tatem accusantium doloremque laudantium totam\r\n                                reperiam eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta\r\n                                sunt explicabo.'),
(3,4,'en','Oliver Greenwood','Sed perspiciatis unde omnis iste natus erolup tatem accusantium doloremque laudantium totam\r\n                                reperiam eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta\r\n                                sunt explicabo.');

/*Table structure for table `testimonials` */

DROP TABLE IF EXISTS `testimonials`;

CREATE TABLE `testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `position` int NOT NULL DEFAULT '99',
  `rating` int NOT NULL DEFAULT '5',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `testimonials` */

insert  into `testimonials`(`id`,`image`,`designation`,`company_name`,`company_logo`,`is_active`,`position`,`rating`,`created_at`,`updated_at`) values 
(3,'promos/sJXl39WthwkMrhTAVSqLSFviWdur8Z1p301Kmybj.png','Business Manager',NULL,NULL,1,99,5,'2025-08-25 02:41:31','2025-08-25 02:58:14'),
(4,'testimonials/ro8HNPYapZ9VFWq0EuMsW8HK6fRjFZb5WxFsNKB4.png','Business Manager',NULL,NULL,1,99,5,'2025-08-25 02:59:21','2025-08-25 02:59:21');

/*Table structure for table `user_cards` */

DROP TABLE IF EXISTS `user_cards`;

CREATE TABLE `user_cards` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `card_last_four` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_brand` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_month` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gateway` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_cards_user_id_foreign` (`user_id`),
  CONSTRAINT `user_cards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_cards` */

/*Table structure for table `user_details` */

DROP TABLE IF EXISTS `user_details`;

CREATE TABLE `user_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_details` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `password_changed_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_guest` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_last_four` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_stripe_id_index` (`stripe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`last_login_at`,`password_changed_at`,`is_active`,`is_guest`,`created_at`,`updated_at`,`stripe_id`,`pm_type`,`pm_last_four`,`trial_ends_at`,`provider_id`,`provider_name`) values 
(1,'User','user@example.com',NULL,'$2y$12$p91x81vouUinP6ZdfsReAO6ifxzO22TzMe8OZWj6lqvGdT1veo2D6',NULL,NULL,NULL,1,0,'2025-08-13 02:39:42','2025-08-13 02:39:42',NULL,NULL,NULL,NULL,NULL,NULL),
(2,'satyam suri','satyamsuri82@gmail.com',NULL,'$2y$12$mNgi5Nz153u3Pl3ZliieNunwShG4n.dpFOwiiTWp.Xy9uu5jmky4y',NULL,NULL,NULL,1,0,'2025-12-05 01:38:54','2025-12-07 23:40:03','cus_TYvfVVEiWvOhPT',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `vendors` */

DROP TABLE IF EXISTS `vendors`;

CREATE TABLE `vendors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vendors_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `vendors` */

/*Table structure for table `wishlists` */

DROP TABLE IF EXISTS `wishlists`;

CREATE TABLE `wishlists` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int unsigned NOT NULL,
  `product_variant_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wishlists_user_id_product_variant_id_unique` (`user_id`,`product_variant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `wishlists` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
