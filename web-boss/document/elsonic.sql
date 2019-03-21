-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: elsonic
-- ------------------------------------------------------
-- Server version	5.7.20

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
-- Table structure for table `biz_curve_custom`
--

DROP TABLE IF EXISTS `biz_curve_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biz_curve_custom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) DEFAULT NULL,
  `curve_id` int(11) DEFAULT NULL,
  `value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_curve_custom`
--

LOCK TABLES `biz_curve_custom` WRITE;
/*!40000 ALTER TABLE `biz_curve_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `biz_curve_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biz_curve_system`
--

DROP TABLE IF EXISTS `biz_curve_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biz_curve_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `device_type` varchar(45) DEFAULT NULL COMMENT '设备名称',
  `value` varchar(45) DEFAULT NULL COMMENT '曲线值',
  `curve_type` smallint(1) DEFAULT NULL COMMENT '曲线类型\n0：系统\r\n1：自定义',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_curve_system`
--

LOCK TABLES `biz_curve_system` WRITE;
/*!40000 ALTER TABLE `biz_curve_system` DISABLE KEYS */;
/*!40000 ALTER TABLE `biz_curve_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biz_device_cmd`
--

DROP TABLE IF EXISTS `biz_device_cmd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biz_device_cmd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL COMMENT '设备ID',
  `cmd` smallint(5) NOT NULL COMMENT '命令',
  `value` varchar(45) NOT NULL COMMENT '命令值',
  `create_time` varchar(45) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备命令表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_device_cmd`
--

LOCK TABLES `biz_device_cmd` WRITE;
/*!40000 ALTER TABLE `biz_device_cmd` DISABLE KEYS */;
/*!40000 ALTER TABLE `biz_device_cmd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biz_device_info`
--

DROP TABLE IF EXISTS `biz_device_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biz_device_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT '设备名称',
  `password` varchar(45) DEFAULT NULL COMMENT '密码',
  `image` varchar(70) DEFAULT NULL COMMENT '图标图片',
  `photos` varchar(200) DEFAULT NULL COMMENT '图片集',
  `master_id` int(11) DEFAULT NULL COMMENT '创建者id',
  `type` smallint(1) NOT NULL COMMENT '设备类型 0 空调 1 地暖 2新风',
  `mode` varchar(45) NOT NULL COMMENT '设备型号',
  `uuid` varchar(45) NOT NULL,
  `model_id` int(11) DEFAULT NULL COMMENT '快捷模式id',
  `curve_id` int(11) DEFAULT NULL COMMENT '曲线id\n默认0，表示未设置\r\n1：自动学习\r\n2：老人小孩\r\n3：南方曲线\r\n4：北方曲线\r\n5：工作曲线\r\n6：休息曲线',
  `power` int(11) DEFAULT NULL COMMENT '功率',
  `room_id` int(11) NOT NULL COMMENT '房间ID',
  `work_state` smallint(1) DEFAULT NULL COMMENT '工作模式\n针对空调\r\n0：制冷 \r\n1：除湿 \r\n2：送风  \r\n3：制热 \r\n4：自动',
  `wind_speed` smallint(1) DEFAULT NULL COMMENT '0:高；\r\n1:中；\r\n2:低；\r\n3:自动(默认)',
  `hcho` float DEFAULT NULL COMMENT '甲醛',
  `out_pm25` float DEFAULT NULL COMMENT '室外pm2.5',
  `out_temp` float DEFAULT NULL,
  `out_humidity` float DEFAULT NULL COMMENT '室外湿度',
  `cx_filter` varchar(500) DEFAULT NULL COMMENT '初效过滤器',
  `pm_filter` varchar(500) DEFAULT NULL COMMENT 'Pm2.5过滤器',
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `create_time_UNIQUE` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_device_info`
--

LOCK TABLES `biz_device_info` WRITE;
/*!40000 ALTER TABLE `biz_device_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `biz_device_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biz_device_model`
--

DROP TABLE IF EXISTS `biz_device_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biz_device_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `value` int(11) NOT NULL COMMENT '设置值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_device_model`
--

LOCK TABLES `biz_device_model` WRITE;
/*!40000 ALTER TABLE `biz_device_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `biz_device_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biz_feedback_info`
--

DROP TABLE IF EXISTS `biz_feedback_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biz_feedback_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(45) DEFAULT NULL COMMENT '联系方式',
  `description` varchar(45) DEFAULT NULL COMMENT '描述',
  `type` varchar(45) DEFAULT NULL COMMENT '类型',
  `status` varchar(45) DEFAULT NULL COMMENT '状态 0 未处理 1已处理',
  `create_time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_feedback_info`
--

LOCK TABLES `biz_feedback_info` WRITE;
/*!40000 ALTER TABLE `biz_feedback_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `biz_feedback_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biz_group`
--

DROP TABLE IF EXISTS `biz_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biz_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL COMMENT '群组明',
  `description` varchar(200) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL COMMENT '父ID',
  `parent_ids` varchar(45) DEFAULT NULL COMMENT '父ID们',
  `is_avaliable` tinyint(1) DEFAULT NULL COMMENT '0 可用 1 不可用',
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_group`
--

LOCK TABLES `biz_group` WRITE;
/*!40000 ALTER TABLE `biz_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `biz_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biz_group_user`
--

DROP TABLE IF EXISTS `biz_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biz_group_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_group_user`
--

LOCK TABLES `biz_group_user` WRITE;
/*!40000 ALTER TABLE `biz_group_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `biz_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biz_house_info`
--

DROP TABLE IF EXISTS `biz_house_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biz_house_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL COMMENT '名称',
  `image` varchar(70) DEFAULT NULL COMMENT '图标图片',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `is_default` tinyint(1) DEFAULT NULL COMMENT '0 非默认 1 默认',
  `province` varchar(45) DEFAULT NULL COMMENT '省',
  `city` varchar(45) DEFAULT NULL COMMENT '市',
  `area` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL COMMENT '地址',
  `coordinate` varchar(45) DEFAULT NULL COMMENT '经纬度',
  `state` smallint(1) DEFAULT NULL COMMENT '状态',
  `user_in` tinyint(1) DEFAULT NULL COMMENT '是否有人在',
  `sort_index` smallint(2) DEFAULT NULL COMMENT '排序号',
  `header` varchar(70) DEFAULT NULL COMMENT '头像\n',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_house_info`
--

LOCK TABLES `biz_house_info` WRITE;
/*!40000 ALTER TABLE `biz_house_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `biz_house_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biz_house_user`
--

DROP TABLE IF EXISTS `biz_house_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biz_house_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house_id` int(11) DEFAULT NULL COMMENT '房子ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_house_user`
--

LOCK TABLES `biz_house_user` WRITE;
/*!40000 ALTER TABLE `biz_house_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `biz_house_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biz_model_attribute`
--

DROP TABLE IF EXISTS `biz_model_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biz_model_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `value` varchar(45) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_model_attribute`
--

LOCK TABLES `biz_model_attribute` WRITE;
/*!40000 ALTER TABLE `biz_model_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `biz_model_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biz_model_info`
--

DROP TABLE IF EXISTS `biz_model_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biz_model_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT '模式名称',
  `device_type` smallint(1) NOT NULL COMMENT '设备类型',
  `value` varchar(45) NOT NULL,
  `icon` varchar(70) NOT NULL COMMENT '图标\n',
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模式数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_model_info`
--

LOCK TABLES `biz_model_info` WRITE;
/*!40000 ALTER TABLE `biz_model_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `biz_model_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biz_notice`
--

DROP TABLE IF EXISTS `biz_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biz_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL COMMENT '标题',
  `context` varchar(45) DEFAULT NULL COMMENT '内容',
  `alias` varchar(45) DEFAULT NULL COMMENT '设备别名',
  `platform` varchar(45) DEFAULT NULL COMMENT '平台',
  `create_time` varchar(45) DEFAULT NULL COMMENT '系统通知表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_notice`
--

LOCK TABLES `biz_notice` WRITE;
/*!40000 ALTER TABLE `biz_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `biz_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biz_room_info`
--

DROP TABLE IF EXISTS `biz_room_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biz_room_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `type` smallint(1) DEFAULT NULL COMMENT '0 卧室 1 老人/小孩卧室 2 客厅',
  `create_time` int(11) DEFAULT NULL,
  `house_id` varchar(45) DEFAULT NULL COMMENT '房子ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_room_info`
--

LOCK TABLES `biz_room_info` WRITE;
/*!40000 ALTER TABLE `biz_room_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `biz_room_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biz_user_info`
--

DROP TABLE IF EXISTS `biz_user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biz_user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL COMMENT '用户名',
  `password` varchar(60) DEFAULT NULL COMMENT '密码',
  `salt` varchar(60) DEFAULT NULL COMMENT '盐',
  `nickname` varchar(20) DEFAULT NULL COMMENT '昵称',
  `real_name` varchar(45) DEFAULT NULL COMMENT '真实名字',
  `header` varchar(100) DEFAULT NULL COMMENT '头像',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机',
  `email` varchar(45) DEFAULT NULL,
  `question1` varchar(100) DEFAULT NULL COMMENT '问题1',
  `answer1` varchar(100) DEFAULT NULL COMMENT '回答1',
  `question2` varchar(100) DEFAULT NULL COMMENT '问题2',
  `answer2` varchar(100) DEFAULT NULL COMMENT '回答2',
  `question3` varchar(100) DEFAULT NULL COMMENT '问题3',
  `answer3` varchar(100) DEFAULT NULL COMMENT '回答3',
  `open_id` varchar(70) DEFAULT NULL,
  `platform` varchar(45) DEFAULT '"微信"' COMMENT '第三方平台',
  `master_id` int(11) DEFAULT NULL COMMENT '主账号ID',
  `type` varchar(45) NOT NULL DEFAULT '0' COMMENT '账号类型 0 主账号 1 子账号',
  `points` int(11) DEFAULT '0' COMMENT '积分',
  `reg_device` varchar(45) DEFAULT NULL COMMENT '注册设备型号',
  `reg_time` int(11) DEFAULT NULL,
  `reg_rype` varchar(45) DEFAULT NULL COMMENT '注册方式\n0：用户名\r\n1：邮箱\r\n2：手机号\r\n3：第三方\r\n4：子账户',
  `sex` smallint(1) DEFAULT NULL COMMENT '0 女性 1 男性',
  `signature` varchar(45) DEFAULT NULL COMMENT '签名',
  `distance` int(11) DEFAULT NULL COMMENT '地理围栏距离',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_user_info`
--

LOCK TABLES `biz_user_info` WRITE;
/*!40000 ALTER TABLE `biz_user_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `biz_user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_access_record`
--

DROP TABLE IF EXISTS `sys_access_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_access_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sid` varchar(100) DEFAULT NULL COMMENT 'session id',
  `ip_address` varchar(45) DEFAULT NULL COMMENT 'ip地址',
  `handle_module` varchar(200) DEFAULT NULL COMMENT '操作的模块',
  `last_access_time` datetime DEFAULT NULL COMMENT '最后访问时间',
  `username` varchar(45) DEFAULT NULL COMMENT '用户',
  `sensitive_handle` varchar(255) DEFAULT NULL COMMENT '敏感操作',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `sid_UNIQUE` (`sid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=842 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='安全日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_access_record`
--

LOCK TABLES `sys_access_record` WRITE;
/*!40000 ALTER TABLE `sys_access_record` DISABLE KEYS */;
INSERT INTO `sys_access_record` VALUES (839,'c01e8eec-9212-4ef3-b93d-5028fd444536','0:0:0:0:0:0:0:1','资源管理,管理员信息,角色管理,安全日志,实名认证,用户信息','2018-05-28 16:23:50','admin',NULL),(840,'a35b5e6d-aa21-4f71-b5c0-21a0fc315295','0:0:0:0:0:0:0:1','管理员信息,资源管理,角色管理,安全日志','2018-05-28 16:25:00','admin',NULL),(841,'c8e742c4-2af0-4cc1-993d-2b540a8c910c','0:0:0:0:0:0:0:1','管理员信息,角色管理,资源管理,安全日志','2018-05-28 16:31:17','admin',NULL);
/*!40000 ALTER TABLE `sys_access_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_organization`
--

DROP TABLE IF EXISTS `sys_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `organization_name` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `parent_ids` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `is_avaliable` tinyint(1) DEFAULT NULL,
  `org_type` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='组织表（预留）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_organization`
--

LOCK TABLES `sys_organization` WRITE;
/*!40000 ALTER TABLE `sys_organization` DISABLE KEYS */;
INSERT INTO `sys_organization` VALUES (1,'组织架构',0,'0/',1,0,NULL),(2,'新罗区',1,'0/1/',1,0,NULL),(4,'东肖街道',2,'0/1/2/',1,1,NULL),(5,'东肖营业厅',4,'0/1/2/4/',1,2,NULL),(6,'漕溪街道',2,'0/1/2/',1,1,NULL),(8,'漕溪营业厅',6,'0/1/2/6/',1,2,NULL),(9,'测试',6,'0/1/2/6/',0,2,NULL);
/*!40000 ALTER TABLE `sys_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_organization_has_sys_user`
--

DROP TABLE IF EXISTS `sys_organization_has_sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_organization_has_sys_user` (
  `sys_organization_id` bigint(20) NOT NULL,
  `sys_user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`sys_organization_id`,`sys_user_id`) USING BTREE,
  KEY `fk_sys_organization_has_sys_user_sys_user1_idx` (`sys_user_id`) USING BTREE,
  KEY `fk_sys_organization_has_sys_user_sys_organization_idx` (`sys_organization_id`) USING BTREE,
  CONSTRAINT `fk_sys_organization_has_sys_user_sys_organization` FOREIGN KEY (`sys_organization_id`) REFERENCES `sys_organization` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sys_organization_has_sys_user_sys_user1` FOREIGN KEY (`sys_user_id`) REFERENCES `sys_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='预留';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_organization_has_sys_user`
--

LOCK TABLES `sys_organization_has_sys_user` WRITE;
/*!40000 ALTER TABLE `sys_organization_has_sys_user` DISABLE KEYS */;
INSERT INTO `sys_organization_has_sys_user` VALUES (5,5),(5,6);
/*!40000 ALTER TABLE `sys_organization_has_sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_resource`
--

DROP TABLE IF EXISTS `sys_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resource_name` varchar(45) DEFAULT NULL COMMENT '资源名',
  `type` varchar(45) DEFAULT NULL COMMENT '类型',
  `priority` varchar(45) DEFAULT NULL COMMENT '优先级',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父亲ID',
  `parent_ids` varchar(100) DEFAULT NULL COMMENT '祖先ID',
  `permission` varchar(100) DEFAULT NULL COMMENT '权限字符串',
  `is_avaliable` tinyint(1) DEFAULT NULL COMMENT '是否有效',
  `url` varchar(100) DEFAULT NULL COMMENT '权限链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统资源表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_resource`
--

LOCK TABLES `sys_resource` WRITE;
/*!40000 ALTER TABLE `sys_resource` DISABLE KEYS */;
INSERT INTO `sys_resource` VALUES (1,'资源','menu','0',0,'0/',NULL,1,NULL),(40,'后台资源管理','menu','01',1,'0/1/','',1,''),(50,'管理员信息','menu','0102',40,'0/1/40/','user:*',1,'/user/page'),(51,'用户新增','button','010201',50,'0/1/40/50/','user:create',1,''),(52,'用户修改','button','010202',50,'0/1/40/50/','user:update',1,''),(54,'用户查看','button','010204',50,'0/1/40/50/','user:view',1,''),(55,'资源管理','menu','0103',40,'0/1/40/','resource:*',1,'/page/resource/list'),(56,'资源新增','button','010301',55,'0/1/40/55/','resource:create',1,''),(57,'资源修改','button','010302',55,'0/1/40/55/','resource:update',1,''),(58,'资源删除','button','010303',55,'0/1/40/55/','resource:delete',1,''),(59,'资源查看','button','010304',55,'0/1/40/55/','resource:view',1,''),(60,'角色管理','menu','0104',40,'0/1/40/','role:*',1,'/page/role/list'),(61,'角色新增','button','010401',60,'0/1/40/60/','role:create',1,''),(62,'角色修改','button','010402',60,'0/1/40/60/','role:update',1,''),(63,'角色删除','button','010403',60,'0/1/40/60/','role:delete',1,''),(64,'角色查看','button','010404',60,'0/1/40/60/','role:view',1,''),(65,'系统信息','menu','09',1,'0/1/','',1,''),(66,'系统属性','menu','0901',65,'0/1/65/','setting:*',1,'/page/setting/list'),(82,'安全日志','menu','0105',40,'0/1/40/','access-record:*',1,'/page/access-record/list'),(86,'平台用户管理','menu','02',1,'0/1/','',1,''),(98,'用户信息','menu','0201',86,'0/1//86','tduser:*',1,'/page/tduser/list');
/*!40000 ALTER TABLE `sys_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(45) DEFAULT NULL COMMENT '角色',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `resource_ids` varchar(100) DEFAULT NULL COMMENT '资源ID',
  `is_avaliable` tinyint(1) DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'admin','超级管理员','50,55,60,82,66',1),(4,'content','客服人员','50,55,60,82',1);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_has_sys_resource`
--

DROP TABLE IF EXISTS `sys_role_has_sys_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_has_sys_resource` (
  `sys_role_id` bigint(20) NOT NULL,
  `sys_resource_id` bigint(20) NOT NULL,
  PRIMARY KEY (`sys_role_id`,`sys_resource_id`) USING BTREE,
  KEY `fk_sys_role_has_sys_resource_sys_resource1_idx` (`sys_resource_id`) USING BTREE,
  KEY `fk_sys_role_has_sys_resource_sys_role1_idx` (`sys_role_id`) USING BTREE,
  CONSTRAINT `fk_sys_role_has_sys_resource_sys_resource1` FOREIGN KEY (`sys_resource_id`) REFERENCES `sys_resource` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sys_role_has_sys_resource_sys_role1` FOREIGN KEY (`sys_role_id`) REFERENCES `sys_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色资源表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_has_sys_resource`
--

LOCK TABLES `sys_role_has_sys_resource` WRITE;
/*!40000 ALTER TABLE `sys_role_has_sys_resource` DISABLE KEYS */;
INSERT INTO `sys_role_has_sys_resource` VALUES (1,50),(1,55),(1,60),(1,66),(1,82);
/*!40000 ALTER TABLE `sys_role_has_sys_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_setting`
--

DROP TABLE IF EXISTS `sys_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `priority` int(3) DEFAULT NULL COMMENT '优先级',
  `code` varchar(45) DEFAULT NULL COMMENT '设置编码',
  `sys_name` varchar(45) DEFAULT NULL COMMENT '属性名',
  `sys_value` varchar(200) DEFAULT NULL COMMENT '属性值',
  `extend_value1` varchar(100) DEFAULT NULL COMMENT '扩展值1',
  `extend_value2` varchar(100) DEFAULT NULL COMMENT '扩展值2',
  `sys_description` varchar(200) DEFAULT NULL COMMENT '描述',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '是否显示',
  `category_id` int(45) DEFAULT NULL COMMENT '类别ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_setting`
--

LOCK TABLES `sys_setting` WRITE;
/*!40000 ALTER TABLE `sys_setting` DISABLE KEYS */;
INSERT INTO `sys_setting` VALUES (15,1,'0201','CNY','人民币',NULL,NULL,'人民币',1,7),(32,1,'0301','激活扣币','CSC','0.5',NULL,'扣的币为CSC，每次扣0.5个',1,3),(33,2,'0302','申请商家','BATU','0',NULL,'申请商家冻结用户0 BATU币',1,3),(39,2,'2','2','1526280525158.jpg',NULL,NULL,NULL,1,9),(40,3,'3','3','1526280538855.jpg',NULL,NULL,NULL,1,9),(41,1,'1','1','1526280759594.jpg',NULL,NULL,NULL,1,9),(42,3,'0303','白名单用户','49155',NULL,NULL,'币币交易买卖无限制,属性值格式为：用户ID/用户ID/用户ID',1,3);
/*!40000 ALTER TABLE `sys_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_setting_category`
--

DROP TABLE IF EXISTS `sys_setting_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_setting_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) DEFAULT NULL COMMENT '类别名',
  `category_code` varchar(45) DEFAULT NULL COMMENT '类别编码',
  `parent_id` int(11) DEFAULT NULL COMMENT '父ID',
  `parent_ids` varchar(45) DEFAULT NULL COMMENT '祖先ID',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `description` varchar(45) DEFAULT NULL COMMENT '描述',
  `type` tinyint(1) DEFAULT NULL COMMENT '设置类型，1 普通设置类型 2 轮播图设置',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `category_code_UNIQUE` (`category_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='设置类别';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_setting_category`
--

LOCK TABLES `sys_setting_category` WRITE;
/*!40000 ALTER TABLE `sys_setting_category` DISABLE KEYS */;
INSERT INTO `sys_setting_category` VALUES (1,'设置类别','0',0,'0/',1,'根',NULL),(2,'轮播图','02',1,'0/1/',2,NULL,1),(3,'系统属性','03',1,'0/1/',2,NULL,1),(7,'法币设置','01',1,'0/1/',NULL,NULL,1),(8,'法币交易轮播图','0201',2,'0/1/2/',NULL,NULL,2),(9,'币币交易轮播图','0202',2,'0/1/2/',NULL,NULL,2);
/*!40000 ALTER TABLE `sys_setting_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '登陆用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '登陆密码',
  `salt` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `role_ids` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `locked` tinyint(1) DEFAULT '0',
  `phone` varchar(14) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '手机号',
  `nickname` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `user_type` int(3) DEFAULT NULL COMMENT '0 普通用户\n1 商家\n2 维修人员\n3 新装人员\n4 营业厅管理员\n5 管理员\n\n',
  `is_delete` tinyint(1) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `open_id` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '微信openid',
  `machine_code` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '机器码',
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `token` varchar(32) CHARACTER SET utf8mb4 DEFAULT '',
  `image_url` varchar(255) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '用户头像',
  `union_id` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `funds_password` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '资金密码',
  `email` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `google_code` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '谷歌验证码',
  `parent_id` bigint(20) DEFAULT NULL,
  `parent_ids` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `recommended_code` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '推荐码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `open_id_UNIQUE` (`open_id`) USING BTREE,
  UNIQUE KEY `union_id_UNIQUE` (`union_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'admin','ae072005ee1691b2c32220b7817dabb6','a6a1bdb7f0a2d1652626d29f93919097','1',0,'18159801259','super',1,0,'2017-05-15 19:07:20','','',1,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'kefu','c565f60cd29903e75e6383717019281b','8267978f91f062895c5cd51fa3adc74f','1',0,'15539369397','ku',1,0,'2018-05-14 11:56:04',NULL,NULL,1,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'kefu1','d8ab296f34e2e09c412993fa8c3af3ae','c6f6578499c12ebb56f6c37ab2a068cc','1',0,'17539322345','kefu',1,0,'2018-05-14 12:37:50',NULL,NULL,1,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'1','810de881f44f4fab468ee50ac833cc12','7cc4c495bb420ca80348ad7d9b6e8edc','4',0,'13290102000','1',1,1,'2018-05-14 14:01:45',NULL,NULL,1,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_has_sys_role`
--

DROP TABLE IF EXISTS `sys_user_has_sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_has_sys_role` (
  `sys_user_id` bigint(20) NOT NULL,
  `sys_role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`sys_user_id`,`sys_role_id`) USING BTREE,
  KEY `fk_sys_user_has_sys_role_sys_role1_idx` (`sys_role_id`) USING BTREE,
  KEY `fk_sys_user_has_sys_role_sys_user1_idx` (`sys_user_id`) USING BTREE,
  CONSTRAINT `fk_sys_user_has_sys_role_sys_role1` FOREIGN KEY (`sys_role_id`) REFERENCES `sys_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sys_user_has_sys_role_sys_user1` FOREIGN KEY (`sys_user_id`) REFERENCES `sys_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_has_sys_role`
--

LOCK TABLES `sys_user_has_sys_role` WRITE;
/*!40000 ALTER TABLE `sys_user_has_sys_role` DISABLE KEYS */;
INSERT INTO `sys_user_has_sys_role` VALUES (1,1),(2,1),(3,1),(4,4);
/*!40000 ALTER TABLE `sys_user_has_sys_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-28 16:49:52
