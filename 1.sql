-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: blogdemo
-- ------------------------------------------------------
-- Server version	5.7.17-log

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

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add 轮播图',6,'add_banner'),(17,'Can change 轮播图',6,'change_banner'),(18,'Can delete 轮播图',6,'delete_banner'),(19,'Can add 博客分类',7,'add_blogcategory'),(20,'Can change 博客分类',7,'change_blogcategory'),(21,'Can delete 博客分类',7,'delete_blogcategory'),(22,'Can add 评论',8,'add_comment'),(23,'Can change 评论',8,'change_comment'),(24,'Can delete 评论',8,'delete_comment'),(25,'Can add 友情链接',9,'add_friendlylink'),(26,'Can change 友情链接',9,'change_friendlylink'),(27,'Can delete 友情链接',9,'delete_friendlylink'),(28,'Can add 博客',10,'add_post'),(29,'Can change 博客',10,'change_post'),(30,'Can delete 博客',10,'delete_post'),(31,'Can add 标签',11,'add_tags'),(32,'Can change 标签',11,'change_tags'),(33,'Can delete 标签',11,'delete_tags'),(34,'Can add user',12,'add_bloguser'),(35,'Can change user',12,'change_bloguser'),(36,'Can delete user',12,'delete_bloguser'),(37,'Can add 邮箱验证码',13,'add_emailverifyrecord'),(38,'Can change 邮箱验证码',13,'change_emailverifyrecord'),(39,'Can delete 邮箱验证码',13,'delete_emailverifyrecord');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogapp_banner`
--

DROP TABLE IF EXISTS `blogapp_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogapp_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `cover` varchar(100) NOT NULL,
  `link_url` varchar(100) NOT NULL,
  `idx` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogapp_banner`
--

LOCK TABLES `blogapp_banner` WRITE;
/*!40000 ALTER TABLE `blogapp_banner` DISABLE KEYS */;
INSERT INTO `blogapp_banner` VALUES (1,'111','static/images/banner/1.jpg','http://www.kongzhizhen.com/',1,1),(2,'222','static/images/banner/7娃.jpg','http://www.kongzhizhen.com/',2,0);
/*!40000 ALTER TABLE `blogapp_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogapp_blogcategory`
--

DROP TABLE IF EXISTS `blogapp_blogcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogapp_blogcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogapp_blogcategory`
--

LOCK TABLES `blogapp_blogcategory` WRITE;
/*!40000 ALTER TABLE `blogapp_blogcategory` DISABLE KEYS */;
INSERT INTO `blogapp_blogcategory` VALUES (1,'图书'),(2,'分类1');
/*!40000 ALTER TABLE `blogapp_blogcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogapp_comment`
--

DROP TABLE IF EXISTS `blogapp_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogapp_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pub_date` datetime(6) NOT NULL,
  `content` longtext NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blogapp_comment_post_id_b709c5d9_fk_blogapp_post_id` (`post_id`),
  KEY `blogapp_comment_user_id_136384d7_fk_userapp_bloguser_id` (`user_id`),
  CONSTRAINT `blogapp_comment_post_id_b709c5d9_fk_blogapp_post_id` FOREIGN KEY (`post_id`) REFERENCES `blogapp_post` (`id`),
  CONSTRAINT `blogapp_comment_user_id_136384d7_fk_userapp_bloguser_id` FOREIGN KEY (`user_id`) REFERENCES `userapp_bloguser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogapp_comment`
--

LOCK TABLES `blogapp_comment` WRITE;
/*!40000 ALTER TABLE `blogapp_comment` DISABLE KEYS */;
INSERT INTO `blogapp_comment` VALUES (1,'2018-10-29 06:45:52.000000','zhen 666666',1,1),(2,'2018-10-29 06:46:05.000000','zhen 88888888888',2,1),(3,'2018-10-29 08:53:52.000000','898989',2,1),(4,'2018-10-31 02:06:15.770138','yuyuyu',1,1),(5,'2018-10-31 02:08:02.517478','121212',2,1),(6,'2018-10-31 02:09:14.806418','444444444',2,1),(7,'2018-10-31 02:11:50.141045','0000',1,1),(9,'2018-10-31 02:31:14.581034','9090',2,1),(10,'2018-10-31 02:37:19.597748','90===',1,1),(11,'2018-10-31 02:37:49.967988','111',1,1),(12,'2018-10-31 10:19:28.602600','44',3,1),(13,'2018-10-31 15:18:08.953274','epogirhn ',1,1);
/*!40000 ALTER TABLE `blogapp_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogapp_friendlylink`
--

DROP TABLE IF EXISTS `blogapp_friendlylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogapp_friendlylink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `link` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogapp_friendlylink`
--

LOCK TABLES `blogapp_friendlylink` WRITE;
/*!40000 ALTER TABLE `blogapp_friendlylink` DISABLE KEYS */;
INSERT INTO `blogapp_friendlylink` VALUES (1,'百度','http://www.baidu.com');
/*!40000 ALTER TABLE `blogapp_friendlylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogapp_post`
--

DROP TABLE IF EXISTS `blogapp_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogapp_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` longtext NOT NULL,
  `pub_date` datetime(6) NOT NULL,
  `cover` varchar(100) NOT NULL,
  `views` int(11) NOT NULL,
  `recommend` tinyint(1) NOT NULL,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blogapp_post_category_id_c475debb_fk_blogapp_blogcategory_id` (`category_id`),
  KEY `blogapp_post_user_id_f3e20e29_fk_userapp_bloguser_id` (`user_id`),
  CONSTRAINT `blogapp_post_category_id_c475debb_fk_blogapp_blogcategory_id` FOREIGN KEY (`category_id`) REFERENCES `blogapp_blogcategory` (`id`),
  CONSTRAINT `blogapp_post_user_id_f3e20e29_fk_userapp_bloguser_id` FOREIGN KEY (`user_id`) REFERENCES `userapp_bloguser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogapp_post`
--

LOCK TABLES `blogapp_post` WRITE;
/*!40000 ALTER TABLE `blogapp_post` DISABLE KEYS */;
INSERT INTO `blogapp_post` VALUES (1,'标题1','666666666','2018-10-29 05:36:07.000000','static/images/post/1.jpg',30,1,2,1),(2,'标题2','8888888','2018-10-29 09:00:13.000000','static/images/post/火娃.jpg',33,0,1,1),(3,'标题3','33333333333333333333','2018-10-31 10:16:50.000000','static/images/post/7娃.jpg',900,1,1,1);
/*!40000 ALTER TABLE `blogapp_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogapp_post_tags`
--

DROP TABLE IF EXISTS `blogapp_post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogapp_post_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `tags_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blogapp_post_tags_post_id_tags_id_07f7dfae_uniq` (`post_id`,`tags_id`),
  KEY `blogapp_post_tags_tags_id_9b78c133_fk_blogapp_tags_id` (`tags_id`),
  CONSTRAINT `blogapp_post_tags_post_id_ac6aba5d_fk_blogapp_post_id` FOREIGN KEY (`post_id`) REFERENCES `blogapp_post` (`id`),
  CONSTRAINT `blogapp_post_tags_tags_id_9b78c133_fk_blogapp_tags_id` FOREIGN KEY (`tags_id`) REFERENCES `blogapp_tags` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogapp_post_tags`
--

LOCK TABLES `blogapp_post_tags` WRITE;
/*!40000 ALTER TABLE `blogapp_post_tags` DISABLE KEYS */;
INSERT INTO `blogapp_post_tags` VALUES (1,1,1),(3,1,2),(2,2,1),(4,3,4);
/*!40000 ALTER TABLE `blogapp_post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogapp_tags`
--

DROP TABLE IF EXISTS `blogapp_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogapp_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogapp_tags`
--

LOCK TABLES `blogapp_tags` WRITE;
/*!40000 ALTER TABLE `blogapp_tags` DISABLE KEYS */;
INSERT INTO `blogapp_tags` VALUES (1,'标签1'),(2,'333'),(4,'31');
/*!40000 ALTER TABLE `blogapp_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_userapp_bloguser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_userapp_bloguser_id` FOREIGN KEY (`user_id`) REFERENCES `userapp_bloguser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-10-29 02:48:53.015323','1','111',1,'[{\"added\": {}}]',6,1),(2,'2018-10-29 02:50:04.556352','2','222',1,'[{\"added\": {}}]',6,1),(3,'2018-10-29 05:34:36.553106','1','图书',1,'[{\"added\": {}}]',7,1),(4,'2018-10-29 05:35:31.885283','1','标签1',1,'[{\"added\": {}}]',11,1),(5,'2018-10-29 05:36:24.499398','1','标题1',1,'[{\"added\": {}}]',10,1),(6,'2018-10-29 05:53:01.322776','2','标题2',1,'[{\"added\": {}}]',10,1),(7,'2018-10-29 06:01:11.651569','2','333',1,'[{\"added\": {}}]',11,1),(8,'2018-10-29 06:45:59.471978','1','zhen 666666',1,'[{\"added\": {}}]',8,1),(9,'2018-10-29 06:46:09.842065','2','zhen 88888888888',1,'[{\"added\": {}}]',8,1),(10,'2018-10-29 08:19:55.658074','1','百度',1,'[{\"added\": {}}]',9,1),(11,'2018-10-29 08:54:00.960510','3','898989',1,'[{\"added\": {}}]',8,1),(12,'2018-10-29 09:00:17.966691','2','标题2',2,'[{\"changed\": {\"fields\": [\"pub_date\"]}}]',10,1),(13,'2018-10-30 02:29:06.285356','1','标题1',2,'[]',10,1),(14,'2018-10-30 10:28:46.971124','2','分类1',1,'[{\"added\": {}}]',7,1),(15,'2018-10-30 10:29:00.990162','1','标题1',2,'[{\"changed\": {\"fields\": [\"category\"]}}]',10,1),(16,'2018-10-30 18:24:48.085334','8','',3,'',8,1),(17,'2018-10-31 02:16:10.687380','3','333',1,'[{\"added\": {}}]',11,1),(18,'2018-10-31 02:16:33.570817','3','333',3,'',11,1),(19,'2018-10-31 02:16:58.464826','4','31',1,'[{\"added\": {}}]',11,1),(20,'2018-10-31 02:17:21.477393','3','标题3',1,'[{\"added\": {}}]',10,1),(21,'2018-10-31 02:19:08.947739','2','标题2',2,'[{\"changed\": {\"fields\": [\"recommend\"]}}]',10,1),(22,'2018-10-31 02:19:54.725499','3','标题3',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',10,1),(23,'2018-10-31 03:31:13.064028','4','jack',3,'',12,1),(24,'2018-10-31 03:31:13.100052','3','jackman1',3,'',12,1),(25,'2018-10-31 03:33:02.198428','1','jackman',2,'[{\"changed\": {\"fields\": [\"nickname\"]}}]',12,1),(26,'2018-10-31 03:33:15.455050','5','jack',1,'[{\"added\": {}}]',12,1),(27,'2018-10-31 03:34:38.276261','6','jj',2,'[{\"changed\": {\"fields\": [\"nickname\"]}}]',12,1),(28,'2018-10-31 03:48:23.932382','7','jjj',2,'[{\"changed\": {\"fields\": [\"is_staff\", \"is_active\", \"nickname\"]}}]',12,1),(29,'2018-11-01 00:57:22.967454','6','jj',2,'[]',12,1),(30,'2018-11-01 01:39:37.955168','11','jackman3',3,'',12,1),(31,'2018-11-01 01:39:37.958410','10','jk',3,'',12,1),(32,'2018-11-01 01:39:37.961431','9','jc2',3,'',12,1),(33,'2018-11-01 01:39:37.965417','8','gogogo',3,'',12,1),(34,'2018-11-01 01:39:37.970422','7','jjj',3,'',12,1),(35,'2018-11-01 01:39:37.975423','6','jj',3,'',12,1),(36,'2018-11-01 01:39:37.978442','5','jack',3,'',12,1),(37,'2018-11-01 01:52:16.059969','14','jackman3',3,'',12,1),(38,'2018-11-01 01:52:16.062959','13','jackman2',3,'',12,1),(39,'2018-11-01 01:52:16.065970','12','jackman1',3,'',12,1),(40,'2018-11-01 02:00:13.005094','17','jackman3',3,'',12,1),(41,'2018-11-01 02:00:13.041103','16','jackman2',3,'',12,1),(42,'2018-11-01 02:00:13.045106','15','jackman1',3,'',12,1),(43,'2018-11-01 02:03:23.601693','21','jackman6',3,'',12,1),(44,'2018-11-01 02:03:23.639787','19','jackman2',3,'',12,1),(45,'2018-11-01 02:03:23.643799','18','jackman1',3,'',12,1),(46,'2018-11-01 02:08:34.475718','23','jackman8',3,'',12,1),(47,'2018-11-01 02:08:34.478719','22','jackman1',3,'',12,1),(48,'2018-11-01 02:30:45.164640','28','jackman77',3,'',12,1),(49,'2018-11-01 02:30:45.169695','26','jackman4',3,'',12,1),(50,'2018-11-01 02:48:39.858548','31','jackman323',3,'',12,1),(51,'2018-11-01 02:48:39.880538','30','jackman1',3,'',12,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(6,'blogapp','banner'),(7,'blogapp','blogcategory'),(8,'blogapp','comment'),(9,'blogapp','friendlylink'),(10,'blogapp','post'),(11,'blogapp','tags'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(12,'userapp','bloguser'),(13,'userapp','emailverifyrecord');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-10-29 02:41:46.867472'),(2,'contenttypes','0002_remove_content_type_name','2018-10-29 02:41:47.017588'),(3,'auth','0001_initial','2018-10-29 02:41:47.474903'),(4,'auth','0002_alter_permission_name_max_length','2018-10-29 02:41:47.568971'),(5,'auth','0003_alter_user_email_max_length','2018-10-29 02:41:47.577990'),(6,'auth','0004_alter_user_username_opts','2018-10-29 02:41:47.587985'),(7,'auth','0005_alter_user_last_login_null','2018-10-29 02:41:47.595989'),(8,'auth','0006_require_contenttypes_0002','2018-10-29 02:41:47.599992'),(9,'auth','0007_alter_validators_add_error_messages','2018-10-29 02:41:47.608999'),(10,'auth','0008_alter_user_username_max_length','2018-10-29 02:41:47.618018'),(11,'userapp','0001_initial','2018-10-29 02:41:48.280488'),(12,'admin','0001_initial','2018-10-29 02:41:48.511652'),(13,'admin','0002_logentry_remove_auto_add','2018-10-29 02:41:48.524648'),(14,'blogapp','0001_initial','2018-10-29 02:41:49.124087'),(15,'blogapp','0002_auto_20181029_1041','2018-10-29 02:41:49.690476'),(16,'sessions','0001_initial','2018-10-29 02:41:49.766531');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2plr10pqqr9r8llvqewabysd4lxhuo3m','ZDg1M2UwMzU4YWMzNDMxNTM4N2RmZDQwOGZmNWIwNGEwYWJjNzQ1Mjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjJhMzUxYWFkNDc0ZDAyM2FlNmZmMzcyYzFkNmFhOWE2NGVlYTBkIn0=','2018-11-15 01:41:29.822035');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userapp_bloguser`
--

DROP TABLE IF EXISTS `userapp_bloguser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userapp_bloguser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userapp_bloguser`
--

LOCK TABLES `userapp_bloguser` WRITE;
/*!40000 ALTER TABLE `userapp_bloguser` DISABLE KEYS */;
INSERT INTO `userapp_bloguser` VALUES (1,'pbkdf2_sha256$36000$6mPBfRFuTvHJ$OK8R3dI8D7s14CpNfMDKku0XWBNBJqiTjakF5I3V+E4=','2018-11-01 04:59:35.608194',1,'jackman','','','jackman@qq.com',1,1,'2018-10-29 02:43:02.000000','jackman'),(24,'pbkdf2_sha256$36000$76jHN1BrxAYs$eylp77ytUkj74ZiJ1QNdfWwgGk91Nk0+3Kgaua0n+/Q=','2018-11-01 06:05:35.802148',0,'jackman22','','','1476177660@qq.com',0,1,'2018-11-01 02:09:13.581001',''),(25,'pbkdf2_sha256$36000$W9YIByZ7SaC9$3Q2P4CDx4TlAn+AAcGLmbwWvcz8eHmFwZ6bCYVb8wew=','2018-11-01 05:20:06.825388',0,'jackman11','','','jackman_zhang@163.com',0,1,'2018-11-01 02:10:19.415154','');
/*!40000 ALTER TABLE `userapp_bloguser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userapp_bloguser_groups`
--

DROP TABLE IF EXISTS `userapp_bloguser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userapp_bloguser_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bloguser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userapp_bloguser_groups_bloguser_id_group_id_3b320c4e_uniq` (`bloguser_id`,`group_id`),
  KEY `userapp_bloguser_groups_group_id_6521ba89_fk_auth_group_id` (`group_id`),
  CONSTRAINT `userapp_bloguser_gro_bloguser_id_f42c4df1_fk_userapp_b` FOREIGN KEY (`bloguser_id`) REFERENCES `userapp_bloguser` (`id`),
  CONSTRAINT `userapp_bloguser_groups_group_id_6521ba89_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userapp_bloguser_groups`
--

LOCK TABLES `userapp_bloguser_groups` WRITE;
/*!40000 ALTER TABLE `userapp_bloguser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `userapp_bloguser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userapp_bloguser_user_permissions`
--

DROP TABLE IF EXISTS `userapp_bloguser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userapp_bloguser_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bloguser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userapp_bloguser_user_pe_bloguser_id_permission_i_9d7c9e6e_uniq` (`bloguser_id`,`permission_id`),
  KEY `userapp_bloguser_use_permission_id_e95be918_fk_auth_perm` (`permission_id`),
  CONSTRAINT `userapp_bloguser_use_bloguser_id_77042bc2_fk_userapp_b` FOREIGN KEY (`bloguser_id`) REFERENCES `userapp_bloguser` (`id`),
  CONSTRAINT `userapp_bloguser_use_permission_id_e95be918_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userapp_bloguser_user_permissions`
--

LOCK TABLES `userapp_bloguser_user_permissions` WRITE;
/*!40000 ALTER TABLE `userapp_bloguser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `userapp_bloguser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userapp_emailverifyrecord`
--

DROP TABLE IF EXISTS `userapp_emailverifyrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userapp_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(30) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userapp_emailverifyrecord`
--

LOCK TABLES `userapp_emailverifyrecord` WRITE;
/*!40000 ALTER TABLE `userapp_emailverifyrecord` DISABLE KEYS */;
INSERT INTO `userapp_emailverifyrecord` VALUES (1,'dNuLigfuNr4YP23u','jackman_zhang@163.com','register','2018-11-01 09:17:20.688592'),(2,'mKEploBNvZkR3a64','jackman_zhang@163.com','register','2018-11-01 09:29:05.754174'),(3,'mSVgdVBXvC4CIXzR','jackman_zhang@163.com','register','2018-11-01 09:37:46.515595'),(4,'HvrmOQmHY5l7jage','jackman_zhang@163.com','register','2018-11-01 09:38:55.917982'),(7,'nueeAuUhpa65tFhZ','1476177660@qq.com','register','2018-11-01 09:50:34.373656'),(9,'5cfeuAyfNG68PNPw','1476177660@qq.com','register','2018-11-01 09:54:12.448613'),(10,'35srAFuvql15zJkS','1476177660@qq.com','register','2018-11-01 09:57:30.942804'),(12,'fQPOQyvvtt9cLPSl','1476177660@qq.com','register','2018-11-01 10:01:07.349577'),(13,'VYUzfhArhWqk2osp','jackman_zhang@163.com','register','2018-11-01 10:01:52.639576'),(15,'gpczgHec5VjxoGeh','jackman_zhang@163.com','register','2018-11-01 10:05:36.815242'),(19,'vKIJzT29dPOfwHOU','jackman_zhang@163.com','register','2018-11-01 10:19:32.690110'),(20,'z0GcocFWeYnHBFJl','','register','2018-11-01 10:21:45.460830'),(21,'1C3ciUvoeKHmo5Is','','register','2018-11-01 10:21:50.658003'),(22,'iED4hilDXf1B1TBa','1111@qq.com','register','2018-11-01 10:47:38.339870'),(23,'LAcYFE7msKCHsCZK','234234234@qq.com','register','2018-11-01 10:48:20.732577'),(28,'ytZnexx5GEfehnZ7','jackman_zhang@163.com','forget','2018-11-01 11:52:44.070321'),(30,'1vH57LfXWUNdVJSU','jackman_zhang@163.com','forget','2018-11-01 11:56:05.333618'),(31,'mEgf3axbtB6GBgZN','jackman_zhang@163.com','forget','2018-11-01 11:56:33.085969'),(41,'s9SpjS01qx3LwdMk','jackman_zhang@163.com','forget','2018-11-01 13:12:16.389348'),(43,'KcBWqCnwD3Les0sn','jackman_zhang@163.com','forget','2018-11-01 13:16:52.540126');
/*!40000 ALTER TABLE `userapp_emailverifyrecord` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-01 16:12:52
