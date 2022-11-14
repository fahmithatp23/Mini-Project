/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.31 : Database - gramadb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gramadb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `gramadb`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

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

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add login',7,'add_login'),
(26,'Can change login',7,'change_login'),
(27,'Can delete login',7,'delete_login'),
(28,'Can view login',7,'view_login'),
(29,'Can add services',8,'add_services'),
(30,'Can change services',8,'change_services'),
(31,'Can delete services',8,'delete_services'),
(32,'Can view services',8,'view_services'),
(33,'Can add user',9,'add_user'),
(34,'Can change user',9,'change_user'),
(35,'Can delete user',9,'delete_user'),
(36,'Can view user',9,'view_user'),
(37,'Can add staff',10,'add_staff'),
(38,'Can change staff',10,'change_staff'),
(39,'Can delete staff',10,'delete_staff'),
(40,'Can view staff',10,'view_staff'),
(41,'Can add servicerequests',11,'add_servicerequests'),
(42,'Can change servicerequests',11,'change_servicerequests'),
(43,'Can delete servicerequests',11,'delete_servicerequests'),
(44,'Can view servicerequests',11,'view_servicerequests'),
(45,'Can add reasons',12,'add_reasons'),
(46,'Can change reasons',12,'change_reasons'),
(47,'Can delete reasons',12,'delete_reasons'),
(48,'Can view reasons',12,'view_reasons'),
(49,'Can add documents',13,'add_documents'),
(50,'Can change documents',13,'change_documents'),
(51,'Can delete documents',13,'delete_documents'),
(52,'Can view documents',13,'view_documents');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$390000$ZGPccks0kb7zF5zrp7lPMl$3wiqrzZIve4zpCKiiVLZe4SFPzAN9Pk1bMLmGOPtIQ8=','2022-11-13 09:35:14.767135',1,'admin','','','admin@gmail.com',1,1,'2022-11-13 05:14:25.176843');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

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

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(13,'gramaapp','documents'),
(7,'gramaapp','login'),
(12,'gramaapp','reasons'),
(11,'gramaapp','servicerequests'),
(8,'gramaapp','services'),
(10,'gramaapp','staff'),
(9,'gramaapp','user'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2022-11-13 05:11:27.776305'),
(2,'auth','0001_initial','2022-11-13 05:11:28.296485'),
(3,'admin','0001_initial','2022-11-13 05:11:28.426956'),
(4,'admin','0002_logentry_remove_auto_add','2022-11-13 05:11:28.434965'),
(5,'admin','0003_logentry_add_action_flag_choices','2022-11-13 05:11:28.444339'),
(6,'contenttypes','0002_remove_content_type_name','2022-11-13 05:11:28.515016'),
(7,'auth','0002_alter_permission_name_max_length','2022-11-13 05:11:28.571531'),
(8,'auth','0003_alter_user_email_max_length','2022-11-13 05:11:28.598638'),
(9,'auth','0004_alter_user_username_opts','2022-11-13 05:11:28.611291'),
(10,'auth','0005_alter_user_last_login_null','2022-11-13 05:11:28.674965'),
(11,'auth','0006_require_contenttypes_0002','2022-11-13 05:11:28.677882'),
(12,'auth','0007_alter_validators_add_error_messages','2022-11-13 05:11:28.684881'),
(13,'auth','0008_alter_user_username_max_length','2022-11-13 05:11:28.742703'),
(14,'auth','0009_alter_user_last_name_max_length','2022-11-13 05:11:28.815820'),
(15,'auth','0010_alter_group_name_max_length','2022-11-13 05:11:28.836722'),
(16,'auth','0011_update_proxy_permissions','2022-11-13 05:11:28.844368'),
(17,'auth','0012_alter_user_first_name_max_length','2022-11-13 05:11:28.889995'),
(18,'gramaapp','0001_initial','2022-11-13 05:11:29.317114'),
(19,'sessions','0001_initial','2022-11-13 05:11:29.346391'),
(20,'gramaapp','0002_alter_services_description_alter_services_documents','2022-11-13 05:53:02.736701');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('lgb8gt0ogg3i5k3191olpux5h6loymmi','.eJxVjj0OgzAMhe-SuYoccGjSsXvPEMWxU2gRSASmqncvqViYnvy9H_mjxoHVzVxUiNvah63IEipRRp0YxfSWqRr8itNz1mme1mUgXSP6cIt-zCzj_cieBvpY-r2dwXZX4yRKFxvvG7IEkshxAmDTJpsoE3ovCN6jy9mKASRoGS07g_tokXD8vFTFnfzv7w-kMUEr:1ou9OU:zr8ttDdYsQbkvBuewhbtIqQBGwEOWKKm-OvHUdGMRqk','2022-11-27 09:35:14.775136'),
('yal7mw3jcs31xfaaiawkkjubjgybeu62','.eJxVjsEOgyAQRP-Fc0MWBQo99u43mF12qbZGE9FT03-vJF68vpl5ma-aRlYPf1M97tvQ70XWvhJl1IURpo_MNeA3zq9Fp2Xe1pF0regzLbpbWKbn2b0IBizDsc7g_N0EQfHYxNiQI5BEgRMAmza5RJlsjGIhRhtydmLAErRsHQdjD-la_7nfHz08PDc:1ou821:qMU1zcVP7DdNklt50G6KL_zmLByitB_Q7u-ZcbHbbpQ','2022-11-27 08:07:57.638762');

/*Table structure for table `gramaapp_documents` */

DROP TABLE IF EXISTS `gramaapp_documents`;

CREATE TABLE `gramaapp_documents` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `certificatetype` varchar(90) NOT NULL,
  `certificate` varchar(90) NOT NULL,
  `reqid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gramaapp_documents_reqid_id_8304253c_fk_gramaapp_` (`reqid_id`),
  CONSTRAINT `gramaapp_documents_reqid_id_8304253c_fk_gramaapp_` FOREIGN KEY (`reqid_id`) REFERENCES `gramaapp_servicerequests` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `gramaapp_documents` */

insert  into `gramaapp_documents`(`id`,`certificatetype`,`certificate`,`reqid_id`) values 
(1,'proof of birth','rationcard.txt',1),
(2,'ration card copy','rationcard_iRjya8W.txt',1),
(3,'form of registration','regform of deathcertificate.jpg',1),
(4,'certificate of causes of death.','deathcause.jpg',1),
(5,'birth certificate','Birth-Certificate.jpg',2),
(6,'proof of description','asna.pdf',2),
(7,'proof of birth','Birth-Certificate_9IlZTBS.jpg',4),
(8,'affidavit specifying the date and time of death','affidavit-for-deathtime.jpg',4),
(9,'ration card copy','rationcard-kerala.jpg',4),
(10,'form of registration','regform of deathcertificate_q96EO8t.jpg',4),
(11,'certificate of causes of death.','deathcause_1V8CgPN.jpg',4),
(12,'voter id','voterid.jpg',5),
(13,'birth certificate','Birth-Certificate_8HNyuiY.jpg',5),
(14,'proof of description','affidavit-for-deathtime_jbsId7i.jpg',5);

/*Table structure for table `gramaapp_login` */

DROP TABLE IF EXISTS `gramaapp_login`;

CREATE TABLE `gramaapp_login` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(90) NOT NULL,
  `password` varchar(90) NOT NULL,
  `type` varchar(90) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `gramaapp_login` */

insert  into `gramaapp_login`(`id`,`username`,`password`,`type`) values 
(1,'admin','admin','admin'),
(2,'anumol','Anu@12345','staff'),
(3,'Anilp','Anilp@123','user'),
(6,'gopu','Gopu@123','user'),
(7,'naveen','Naveen@123','staff');

/*Table structure for table `gramaapp_reasons` */

DROP TABLE IF EXISTS `gramaapp_reasons`;

CREATE TABLE `gramaapp_reasons` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `reason` varchar(90) NOT NULL,
  `reqid_id` bigint NOT NULL,
  `staffid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gramaapp_reasons_reqid_id_85e88787_fk_gramaapp_` (`reqid_id`),
  KEY `gramaapp_reasons_staffid_id_a3acd196_fk_gramaapp_login_id` (`staffid_id`),
  CONSTRAINT `gramaapp_reasons_reqid_id_85e88787_fk_gramaapp_` FOREIGN KEY (`reqid_id`) REFERENCES `gramaapp_servicerequests` (`id`),
  CONSTRAINT `gramaapp_reasons_staffid_id_a3acd196_fk_gramaapp_login_id` FOREIGN KEY (`staffid_id`) REFERENCES `gramaapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `gramaapp_reasons` */

insert  into `gramaapp_reasons`(`id`,`reason`,`reqid_id`,`staffid_id`) values 
(1,'incomplete docs',1,1),
(2,'timeout',5,2);

/*Table structure for table `gramaapp_servicerequests` */

DROP TABLE IF EXISTS `gramaapp_servicerequests`;

CREATE TABLE `gramaapp_servicerequests` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `status` varchar(90) NOT NULL,
  `serviceid_id` bigint NOT NULL,
  `uid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gramaapp_servicerequ_serviceid_id_2f915168_fk_gramaapp_` (`serviceid_id`),
  KEY `gramaapp_servicerequests_uid_id_fbcdf07f_fk_gramaapp_user_id` (`uid_id`),
  CONSTRAINT `gramaapp_servicerequ_serviceid_id_2f915168_fk_gramaapp_` FOREIGN KEY (`serviceid_id`) REFERENCES `gramaapp_services` (`id`),
  CONSTRAINT `gramaapp_servicerequests_uid_id_fbcdf07f_fk_gramaapp_user_id` FOREIGN KEY (`uid_id`) REFERENCES `gramaapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `gramaapp_servicerequests` */

insert  into `gramaapp_servicerequests`(`id`,`date`,`status`,`serviceid_id`,`uid_id`) values 
(1,'2022-11-13','reject',3,1),
(2,'2022-11-13','forward',1,1),
(3,'2022-11-13','pending',3,1),
(4,'2022-11-13','pending',3,1),
(5,'2022-11-13','reject',1,2);

/*Table structure for table `gramaapp_services` */

DROP TABLE IF EXISTS `gramaapp_services`;

CREATE TABLE `gramaapp_services` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `servicename` varchar(90) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `documents` varchar(1000) NOT NULL,
  `amount` varchar(90) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `gramaapp_services` */

insert  into `gramaapp_services`(`id`,`servicename`,`description`,`documents`,`amount`) values 
(1,'marriage certificate','apply within 100 days','voter id,birth certificate,proof of description','500'),
(3,'Death Certificate','apply within 1 0r 2 months','proof of birth,affidavit specifying the date and time of death,ration card copy,form of registration,certificate of causes of death.','500');

/*Table structure for table `gramaapp_staff` */

DROP TABLE IF EXISTS `gramaapp_staff`;

CREATE TABLE `gramaapp_staff` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fname` varchar(90) NOT NULL,
  `lname` varchar(90) NOT NULL,
  `email` varchar(90) NOT NULL,
  `place` varchar(90) NOT NULL,
  `post` varchar(90) NOT NULL,
  `pin` varchar(90) NOT NULL,
  `phone` varchar(90) NOT NULL,
  `lid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gramaapp_staff_lid_id_b38cedc3_fk_gramaapp_login_id` (`lid_id`),
  CONSTRAINT `gramaapp_staff_lid_id_b38cedc3_fk_gramaapp_login_id` FOREIGN KEY (`lid_id`) REFERENCES `gramaapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `gramaapp_staff` */

insert  into `gramaapp_staff`(`id`,`fname`,`lname`,`email`,`place`,`post`,`pin`,`phone`,`lid_id`) values 
(1,'anu','lekshmi','anu@gmail.com','edappal','edappal','679552','9876556344',2),
(4,'naveen','john','naveen@gmail.com','kakkayam','kakkayam','654321','9876543210',7);

/*Table structure for table `gramaapp_user` */

DROP TABLE IF EXISTS `gramaapp_user`;

CREATE TABLE `gramaapp_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fname` varchar(90) NOT NULL,
  `lname` varchar(90) NOT NULL,
  `gender` varchar(90) NOT NULL,
  `email` varchar(90) NOT NULL,
  `place` varchar(90) NOT NULL,
  `post` varchar(90) NOT NULL,
  `pin` varchar(90) NOT NULL,
  `phone` varchar(90) NOT NULL,
  `lid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gramaapp_user_lid_id_84f7e607_fk_gramaapp_login_id` (`lid_id`),
  CONSTRAINT `gramaapp_user_lid_id_84f7e607_fk_gramaapp_login_id` FOREIGN KEY (`lid_id`) REFERENCES `gramaapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `gramaapp_user` */

insert  into `gramaapp_user`(`id`,`fname`,`lname`,`gender`,`email`,`place`,`post`,`pin`,`phone`,`lid_id`) values 
(1,'Anil','Padikkal','male','anilp@gmail.com','kudallur','Anakkara','679553','9876543200',3),
(2,'Gopal','kishna','male','gopu@gmail.com','palakkad','thrikkanapuram','679883','9845342100',6);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
