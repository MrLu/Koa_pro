-- MySQL dump 10.13  Distrib 5.7.21, for macos10.13 (x86_64)
--
-- Host: localhost    Database: dic_jp
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text COMMENT '内容',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `creator_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建者id 0:系统',
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '消息类型 0:系统消息',
  `extend1` varchar(100) NOT NULL DEFAULT '' COMMENT '扩展字段1',
  `extend2` varchar(100) NOT NULL DEFAULT '' COMMENT '扩展字段2',
  `extend3` varchar(100) NOT NULL DEFAULT '' COMMENT '扩展字段3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth`
--

DROP TABLE IF EXISTS `user_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_auth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `identity_type` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '1手机号 2邮箱 3用户名 4qq 5微信 6腾讯微博 7新浪微博',
  `identifier` varchar(50) NOT NULL DEFAULT '' COMMENT '手机号 邮箱 用户名或第三方应用的唯一标识',
  `certificate` varchar(20) NOT NULL DEFAULT '' COMMENT '密码凭证(站内的保存密码，站外的不保存或保存token)',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '绑定时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新绑定时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `only` (`uid`,`identity_type`),
  KEY `idx_uid` (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户授权表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth`
--

LOCK TABLES `user_auth` WRITE;
/*!40000 ALTER TABLE `user_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_base`
--

DROP TABLE IF EXISTS `user_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_base` (
  `uid` bigint(20) NOT NULL COMMENT '用户ID',
  `user_role` tinyint(2) unsigned NOT NULL DEFAULT '2' COMMENT '2正常用户 3禁言用户 4虚拟用户 5运营',
  `register_source` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '注册来源：1手机号 2邮箱 3用户名 4qq 5微信 6腾讯微博 7新浪微博',
  `user_name` varchar(32) NOT NULL DEFAULT '' COMMENT '用户账号，必须唯一',
  `nick_name` varchar(32) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '用户性别 0-female 1-male',
  `birthday` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户生日',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT '用户个人签名',
  `mobile` varchar(16) NOT NULL DEFAULT '' COMMENT '手机号码(唯一)',
  `mobile_bind_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '手机号码绑定时间',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱(唯一)',
  `email_bind_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '邮箱绑定时间',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `avatar_src` varchar(255) NOT NULL DEFAULT '' COMMENT '原图头像',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '修改时间',
  `push_token` varchar(50) NOT NULL COMMENT '用户设备push_token',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户基础信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_base`
--

LOCK TABLES `user_base` WRITE;
/*!40000 ALTER TABLE `user_base` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_extra`
--

DROP TABLE IF EXISTS `user_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_extra` (
  `uid` bigint(20) NOT NULL COMMENT '用户 ID',
  `vendor` varchar(64) NOT NULL DEFAULT '' COMMENT '手机厂商：apple|htc|samsung，很少用',
  `client_name` varchar(50) NOT NULL DEFAULT '' COMMENT '客户端名称，如hjskang',
  `client_version` varchar(50) NOT NULL DEFAULT '' COMMENT '客户端版本号，如7.0.1',
  `os_name` varchar(16) NOT NULL DEFAULT '' COMMENT '设备号:android|ios',
  `os_version` varchar(16) NOT NULL DEFAULT '' COMMENT '系统版本号:2.2|2.3|4.0|5.1',
  `device_name` varchar(32) NOT NULL DEFAULT '' COMMENT '设备型号，如:iphone6s、u880、u8800',
  `device_id` varchar(128) NOT NULL DEFAULT '' COMMENT '设备ID',
  `idfa` varchar(50) NOT NULL DEFAULT '' COMMENT '苹果设备的IDFA',
  `idfv` varchar(50) NOT NULL DEFAULT '' COMMENT '苹果设备的IDFV',
  `market` varchar(20) NOT NULL DEFAULT '' COMMENT '来源',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `extend1` varchar(100) NOT NULL DEFAULT '' COMMENT '扩展字段1',
  `extend2` varchar(100) NOT NULL DEFAULT '' COMMENT '扩展字段2',
  `extend3` varchar(100) NOT NULL DEFAULT '' COMMENT '扩展字段3',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户额外信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_extra`
--

LOCK TABLES `user_extra` WRITE;
/*!40000 ALTER TABLE `user_extra` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info_update`
--

DROP TABLE IF EXISTS `user_info_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info_update` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uid` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `attribute_name` varchar(30) NOT NULL COMMENT '属性名',
  `attribute_old_val` varchar(30) NOT NULL DEFAULT '' COMMENT '属性对应旧的值',
  `attribute_new_val` varchar(30) NOT NULL DEFAULT '' COMMENT '属性对应新的值',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='用户注册日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info_update`
--

LOCK TABLES `user_info_update` WRITE;
/*!40000 ALTER TABLE `user_info_update` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_info_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_location`
--

DROP TABLE IF EXISTS `user_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_location` (
  `uid` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `curr_nation` varchar(10) NOT NULL DEFAULT '' COMMENT '所在地国',
  `curr_province` varchar(10) NOT NULL DEFAULT '' COMMENT '所在地省',
  `curr_city` varchar(10) NOT NULL DEFAULT '' COMMENT '所在地市',
  `curr_district` varchar(20) NOT NULL DEFAULT '' COMMENT '所在地地区',
  `location` varchar(255) NOT NULL DEFAULT '' COMMENT '具体地址',
  `longitude` decimal(10,6) DEFAULT NULL COMMENT '经度',
  `latitude` decimal(10,6) DEFAULT NULL COMMENT '纬度',
  `update_time` int(11) unsigned DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户定位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_location`
--

LOCK TABLES `user_location` WRITE;
/*!40000 ALTER TABLE `user_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_login_log`
--

DROP TABLE IF EXISTS `user_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户uid',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '登录方式 第三方/邮箱/手机等',
  `command` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '操作类型 1登陆成功  2登出成功 3登录失败 4登出失败',
  `version` varchar(32) NOT NULL DEFAULT '1.0' COMMENT '客户端版本号',
  `client` varchar(20) NOT NULL DEFAULT 'dabaozha' COMMENT '客户端',
  `device_id` varchar(64) NOT NULL DEFAULT '' COMMENT '登录时设备号',
  `lastip` varchar(32) NOT NULL DEFAULT '' COMMENT '登录ip',
  `os` varchar(16) NOT NULL DEFAULT '' COMMENT '手机系统',
  `osver` varchar(32) NOT NULL DEFAULT '' COMMENT '系统版本',
  `text` varchar(200) NOT NULL DEFAULT '',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `idx_uid_type_time` (`uid`,`type`,`create_time`) USING BTREE,
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='登陆日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login_log`
--

LOCK TABLES `user_login_log` WRITE;
/*!40000 ALTER TABLE `user_login_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_register_log`
--

DROP TABLE IF EXISTS `user_register_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_register_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uid` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `register_method` tinyint(2) unsigned NOT NULL COMMENT '注册方式1手机号 2邮箱 3用户名 4qq 5微信 6腾讯微博 7新浪微博',
  `register_time` int(11) NOT NULL COMMENT '注册时间',
  `register_ip` varchar(16) NOT NULL DEFAULT '' COMMENT '注册IP',
  `register_client` varchar(16) NOT NULL DEFAULT '' COMMENT '注册客户端',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='用户注册日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_register_log`
--

LOCK TABLES `user_register_log` WRITE;
/*!40000 ALTER TABLE `user_register_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_register_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-04 18:02:40
