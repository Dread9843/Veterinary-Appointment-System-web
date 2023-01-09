/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.24-MariaDB : Database - vetcare_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`vetcare_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `vetcare_db`;

/*Table structure for table `appointment_list` */

DROP TABLE IF EXISTS `appointment_list`;

CREATE TABLE `appointment_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cus_id` int(11) DEFAULT NULL,
  `code` varchar(100) NOT NULL,
  `schedule` date NOT NULL,
  `owner_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `category_id` int(30) NOT NULL,
  `breed` varchar(200) NOT NULL,
  `age` varchar(50) NOT NULL,
  `service_ids` varchar(100) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `timeslot` varchar(200) DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `appointment_list_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

/*Data for the table `appointment_list` */

insert  into `appointment_list`(`id`,`cus_id`,`code`,`schedule`,`owner_name`,`email`,`address`,`category_id`,`breed`,`age`,`service_ids`,`status`,`timeslot`,`date_created`,`date_updated`) values 
(1,15,'VETCARE-2023010001','2023-01-04','sahil maharjan','anjalishrestha172@gmail.com','aa',7,'','1','5',0,'12:00-13:00','2023-01-04 17:44:22',NULL),
(2,15,'VETCARE-2023010002','2023-01-04','anjali','herohancy2sahil@gmail.com','aa',11,'','2','4',0,'12:00-13:00','2023-01-04 17:46:17',NULL),
(3,15,'VETCARE-2023010001','2023-01-04','sahil maharjan','anjalishrestha172@gmail.com','aa',7,'','1','5',0,'12:00-13:00','2023-01-04 17:44:22',NULL),
(4,15,'VETCARE-2023010002','2023-01-04','anjali','herohancy2sahil@gmail.com','aa',11,'','2','4',0,'12:00-13:00','2023-01-04 17:46:17',NULL),
(5,15,'VETCARE-2023010001','2023-01-04','sahil maharjan','anjalishrestha172@gmail.com','aa',7,'','1','5',0,'12:00-13:00','2023-01-04 17:44:22',NULL),
(9,15,'VETCARE-2023010003','2023-01-09','sahil maharjan','mhrsahil16@gmail.com','Zxfg',11,'','1','4',1,'11:00-12:00','2023-01-08 22:02:18','2023-01-09 10:35:54');

/*Table structure for table `category_list` */

DROP TABLE IF EXISTS `category_list`;

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = Active, 1 = Delete',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

/*Data for the table `category_list` */

insert  into `category_list`(`id`,`name`,`delete_flag`,`date_created`,`date_updated`) values 
(1,'Dogs',1,'2022-01-04 10:31:11',NULL),
(2,'Cats',1,'2022-01-04 10:31:38',NULL),
(3,'Hamsters',1,'2022-01-04 10:32:02',NULL),
(4,'Rabbits',1,'2022-01-04 10:32:13',NULL),
(5,'Birds',1,'2022-01-04 10:32:47',NULL),
(6,'test',1,'2022-01-04 10:33:02',NULL),
(7,'Cats',0,'2022-12-11 19:42:32',NULL),
(8,'Dogs',0,'2022-12-11 19:42:39',NULL),
(9,'Birds',0,'2022-12-11 19:42:48',NULL),
(10,'Rabbits',0,'2022-12-11 19:42:59',NULL),
(11,'Cow',0,'2022-12-11 19:50:02',NULL),
(12,'Goats',0,'2022-12-11 19:50:10',NULL),
(13,'Sheep',0,'2022-12-11 19:50:19',NULL),
(15,'Hens/Ducks',0,'2022-12-12 11:29:08',NULL);

/*Table structure for table `message_list` */

DROP TABLE IF EXISTS `message_list`;

CREATE TABLE `message_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `fullname` text NOT NULL,
  `contact` text NOT NULL,
  `email` text NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `message_list` */

insert  into `message_list`(`id`,`fullname`,`contact`,`email`,`message`,`status`,`date_created`) values 
(1,'Anjali Shrestha','9840167003ss','mhrsahil16@gmail.com','aasdf',1,'2022-12-24 20:25:21'),
(2,'Anjali Shrestha','9840167003','anjalishrestha172@gmail.com','Hello sir',1,'2022-12-24 20:27:54');

/*Table structure for table `service_list` */

DROP TABLE IF EXISTS `service_list`;

CREATE TABLE `service_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `category_ids` text NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `fee` float NOT NULL DEFAULT 0,
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `service_list` */

insert  into `service_list`(`id`,`category_ids`,`name`,`description`,`fee`,`delete_flag`,`date_created`,`date_updated`) values 
(1,'9,7,8,10','Wellness Exam & Vaccination','<p><span style=\"text-align: justify; font-family: &quot;Times New Roman&quot;;\">Preventive medicine including vaccinations, heartworm prevention, flea/tick control, and wellness programs for all stages of life.</span><br></p>',500,0,'2022-12-12 11:25:30','2022-12-23 20:20:37'),
(2,'7,8','Dentistry','<p><span style=\"text-align: justify;\">Our clinical service provides a full range of procedures for the diagnosis and treatment of oral diseases in dogs, cats.</span><br></p>',1000,0,'2022-12-12 11:27:18','2022-12-23 20:21:34'),
(3,'15','Poultry PM and Culture','<p><span style=\"text-align: justify; font-family: \"Times New Roman\";\">VetCare provides poultry disease diagnosis and treatment.</span><br></p>',1200,0,'2022-12-12 11:28:40','2022-12-23 20:22:38'),
(4,'9,7,11,8,12,15,10,13','Minor & Major Surgery','<p><span style=\"color: rgb(87, 89, 92); font-family: &quot;Times New Roman&quot;; font-size: 18px;\">We provide a wide varierty of surgical procedure including Spay &amp; Neuter. Orthopedic surgery &amp; soft tissue surgery.</span><br></p>',1500,0,'2022-12-23 20:24:06',NULL),
(5,'7,8,10',' Preventive Medicine','<p>Preventive medicine including vaccinations, heartworm prevention, flea/tick control, and wellness programs for all stages of life.<span style=\"text-align: justify; font-family: &quot;Times New Roman&quot;;\"></span><br></p>',800,0,'2022-12-23 20:25:54',NULL),
(6,'7,8,10','Pet Smart','<p><span style=\"color: rgb(87, 89, 92); font-family: Roboto, sans-serif; font-size: 18px;\">For your feasibility we have developed a Pet market within hospital itself, which requires all pet accessories, pet food/chews, prefab plastic shampoos, tick and flea prevention powders..</span><br></p>',1000,0,'2022-12-23 20:27:57',NULL);

/*Table structure for table `system_info` */

DROP TABLE IF EXISTS `system_info`;

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `system_info` */

insert  into `system_info`(`id`,`meta_field`,`meta_value`) values 
(1,'name','VetCare'),
(6,'short_name','VetCare'),
(11,'logo','uploads/logo-1641262650.png'),
(13,'user_avatar','uploads/user_avatar.jpg'),
(14,'cover','uploads/cover-1641262651.png'),
(15,'content','Array'),
(16,'email','info@vetcare.com'),
(17,'contact','9840167003'),
(18,'from_time','11:00'),
(19,'to_time','21:30'),
(20,'address','Teku, Kathmandu'),
(23,'max_appointment','25'),
(24,'clinic_schedule','9:00 AM - 5:00 PM'),
(0,'max_patient','5'),
(0,'interval','60'),
(0,'start_time','10:00'),
(0,'end_time','15:00');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(250) NOT NULL,
  `phone` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `password` text NOT NULL,
  `address` varchar(250) DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `user_status` varchar(250) DEFAULT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

/*Data for the table `users` */

insert  into `users`(`id`,`fullname`,`phone`,`email`,`password`,`address`,`type`,`user_status`,`otp`,`date_added`,`date_updated`) values 
(13,'Sahil Maharjan','9840167003','mhrsahil16@gmail.com','$2y$10$NkAKeQHqSuJd9xuzorRaP.dfp4i8ojM2h7a03r.FOotFSaFmo9NVS','Teku',1,'verified',NULL,'2022-12-11 17:56:34',NULL),
(15,'Rakesh Shrestha','9861962215','anjalishrestha172@gmail.com','$2y$10$IoOwgGqYKUXh7LsWY.DcMu2EfMd8CXItYCRGoV/n8/rgL6gFi4O9y','Thankot',3,'verified','296559','2022-12-11 18:35:52','2023-01-05 11:16:48'),
(17,'Prayushma Maharjan','9810336812','stha.alniza@gmail.com','$2y$10$f3gC1eCr0rJVGndNGpUJsukM3wdXzaYhhROZqknN787xgNUShioU6','Teku',2,'verified',NULL,'2022-12-15 19:03:06',NULL),
(18,'Nikesh Shrestha','9860803083','sthanikesh08@gmail.com','$2y$10$rk30vCmQ03Hh1jacnQe40OL40E/Ps00hUEDHaBcDlqfOcOs1aEPTq','Thankot',3,'verified','747057','2022-12-16 18:27:03','2022-12-16 18:28:31'),
(19,'nikesh shrestha','9861962215','seemoreclan3@gmail.com','$2y$10$yZZIb6GNvhwvzfdu8TkxsuMsEc8mziUu3I1ZYewsJyRlNd9Ds3.r6','Kathmandu',3,'verified','737842','2023-01-02 15:15:57','2023-01-02 15:16:32');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
