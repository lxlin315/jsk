/*
SQLyog Ultimate v11.11 (32 bit)
MySQL - 5.5.8-log : Database - jsk_thinkphp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jsk_thinkphp` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jsk_thinkphp`;

/*Table structure for table `access` */

DROP TABLE IF EXISTS `access`;

CREATE TABLE `access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `pid` smallint(6) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `access` */

insert  into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values (1,1,0,0,NULL),(1,12,0,0,NULL),(1,13,0,0,NULL),(1,14,0,0,NULL),(1,15,0,0,NULL),(1,16,0,0,NULL),(1,17,0,0,NULL),(1,18,0,0,NULL),(1,19,0,0,NULL),(1,20,0,0,NULL),(1,21,0,0,NULL),(1,22,0,0,NULL),(1,23,0,0,NULL),(1,24,0,0,NULL),(1,25,0,0,NULL),(1,26,0,0,NULL),(1,27,0,0,NULL),(1,28,0,0,NULL),(1,29,0,0,NULL),(1,30,0,0,NULL),(1,31,0,0,NULL),(1,32,0,0,NULL),(1,33,0,0,NULL),(1,34,0,0,NULL),(1,35,0,0,NULL),(1,36,0,0,NULL),(1,37,0,0,NULL),(1,2,0,0,NULL),(1,3,0,0,NULL),(1,4,0,0,NULL),(1,5,0,0,NULL),(1,6,0,0,NULL),(1,7,0,0,NULL),(1,8,0,0,NULL),(1,9,0,0,NULL),(1,10,0,0,NULL),(1,11,0,0,NULL),(2,12,0,0,NULL),(2,13,0,0,NULL),(2,14,0,0,NULL),(2,15,0,0,NULL),(2,16,0,0,NULL),(2,17,0,0,NULL),(2,18,0,0,NULL),(2,19,0,0,NULL),(2,20,0,0,NULL),(2,21,0,0,NULL),(2,22,0,0,NULL),(2,23,0,0,NULL),(2,24,0,0,NULL),(2,25,0,0,NULL),(2,26,0,0,NULL),(2,27,0,0,NULL),(2,28,0,0,NULL),(2,29,0,0,NULL),(2,30,0,0,NULL),(2,31,0,0,NULL);

/*Table structure for table `area` */

DROP TABLE IF EXISTS `area`;

CREATE TABLE `area` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `level` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '等级划分',
  `upid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID',
  `sort` smallint(3) unsigned NOT NULL COMMENT '排序号',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否启动',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `area` */

/*Table structure for table `attribute` */

DROP TABLE IF EXISTS `attribute`;

CREATE TABLE `attribute` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '属性名',
  `upid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否可用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `attribute` */

/*Table structure for table `complaint` */

DROP TABLE IF EXISTS `complaint`;

CREATE TABLE `complaint` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(12) DEFAULT NULL COMMENT '手机号码',
  `info` text COMMENT '反馈内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `complaint` */

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '用户名',
  `pwd` varchar(32) NOT NULL COMMENT '密码',
  `card` varchar(30) DEFAULT NULL COMMENT '会员卡号',
  `photo` varchar(50) DEFAULT NULL COMMENT '头像',
  `phone` varchar(32) DEFAULT NULL COMMENT '联系电话',
  `mobile` varchar(32) NOT NULL COMMENT '手机号码',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮件',
  `address` varchar(100) NOT NULL COMMENT '详细地址',
  `jifen` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  `question` varchar(100) NOT NULL COMMENT '密码找回问题',
  `answer` varchar(100) NOT NULL COMMENT '密码找回答案',
  `begintime` date NOT NULL COMMENT '注册时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `customer` */

/*Table structure for table `email` */

DROP TABLE IF EXISTS `email`;

CREATE TABLE `email` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `fromuser` varchar(50) NOT NULL COMMENT '发送用户',
  `touser` text NOT NULL COMMENT '接收用户',
  `content` text NOT NULL COMMENT '发送内容',
  `time` datetime NOT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `email` */

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '员工姓名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号码',
  `wages` decimal(10,2) NOT NULL COMMENT '基本工资',
  `cut` decimal(10,2) NOT NULL COMMENT '绩效提成',
  `address` varchar(100) DEFAULT NULL COMMENT '现居地址',
  `shop_id` smallint(5) unsigned NOT NULL COMMENT '商户编号',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否离职',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `employee` */

/*Table structure for table `events` */

DROP TABLE IF EXISTS `events`;

CREATE TABLE `events` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '活动标题',
  `info` text COMMENT '活动内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `events` */

/*Table structure for table `feiyin` */

DROP TABLE IF EXISTS `feiyin`;

CREATE TABLE `feiyin` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` smallint(5) unsigned NOT NULL COMMENT '商户编号',
  `shopkey` varchar(50) NOT NULL COMMENT '商户编码',
  `apikey` varchar(10) NOT NULL COMMENT 'API密钥',
  `mobile` varchar(20) NOT NULL COMMENT '手机卡号',
  `machinekey` varchar(50) NOT NULL COMMENT '终端编号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `feiyin` */

/*Table structure for table `flavor` */

DROP TABLE IF EXISTS `flavor`;

CREATE TABLE `flavor` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '口味名',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否可用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `flavor` */

/*Table structure for table `gift` */

DROP TABLE IF EXISTS `gift`;

CREATE TABLE `gift` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '赠品名',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否可用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `gift` */

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '类目名',
  `type_id` smallint(5) unsigned NOT NULL COMMENT '商品类型',
  `shuliang` int(11) NOT NULL COMMENT '数量',
  `price` decimal(10,2) NOT NULL COMMENT '销售价格',
  `jifen` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  `begintime` date NOT NULL COMMENT '上架时间',
  `selltotle` int(11) NOT NULL DEFAULT '0' COMMENT '销售量',
  `shop_id` smallint(5) unsigned NOT NULL COMMENT '商户编号',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否下架',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

/*Table structure for table `goodsattr` */

DROP TABLE IF EXISTS `goodsattr`;

CREATE TABLE `goodsattr` (
  `goods_id` smallint(6) unsigned NOT NULL,
  `attr_id` smallint(6) unsigned NOT NULL,
  KEY `goods_id` (`goods_id`),
  KEY `attr_id` (`attr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `goodsattr` */

/*Table structure for table `goodsflavor` */

DROP TABLE IF EXISTS `goodsflavor`;

CREATE TABLE `goodsflavor` (
  `goods_id` smallint(6) unsigned NOT NULL,
  `flavor_id` smallint(6) unsigned NOT NULL,
  KEY `goods_id` (`goods_id`),
  KEY `flavor_id` (`flavor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `goodsflavor` */

/*Table structure for table `goodstype` */

DROP TABLE IF EXISTS `goodstype`;

CREATE TABLE `goodstype` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '类目名',
  `upid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否可用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `goodstype` */

/*Table structure for table `goodstypecut` */

DROP TABLE IF EXISTS `goodstypecut`;

CREATE TABLE `goodstypecut` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` smallint(5) unsigned NOT NULL COMMENT '商品类目ID',
  `cut` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '提成比例',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否可用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `goodstypecut` */

/*Table structure for table `level` */

DROP TABLE IF EXISTS `level`;

CREATE TABLE `level` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '等级名',
  `jifen` int(11) NOT NULL COMMENT '积分等级值',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否可用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `level` */

/*Table structure for table `node` */

DROP TABLE IF EXISTS `node`;

CREATE TABLE `node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `ismenu` tinyint(1) DEFAULT '0',
  `attributes` varchar(100) DEFAULT NULL,
  `iconCls` varchar(255) DEFAULT NULL,
  `sort` smallint(6) unsigned DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `group_id` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Data for the table `node` */

insert  into `node`(`id`,`name`,`title`,`status`,`ismenu`,`attributes`,`iconCls`,`sort`,`pid`,`level`,`remark`,`group_id`) values (1,'Home','后台管理',1,0,'','icon-edit',1,0,1,'',0),(2,'System','系统设置',1,1,'System','',14,1,2,'',0),(3,'Node','节点管理',1,1,'/Node/index','',1,2,3,'节点管理',2),(4,'Role','角色管理',1,1,'/Role/index','',2,2,3,'角色管理',2),(5,'User','用户管理',1,1,'/User/index','',3,2,3,'后台用户',2),(6,'Config','网站配置',1,1,'/Config/index','',4,2,3,'网站全局配置',0),(7,'Service','接口配置',1,1,'/Service/index','',5,2,3,'第三方接口配置',0),(8,'DataSecurity','数据安全',1,1,'/DataSecurity/index','',6,2,3,'数据备份、数据恢复',0),(9,'Printer','飞印管理',1,1,'/Printer/index','',7,2,3,'飞印无线打印机配置',0),(10,'Sms','短信配置',1,1,'/Sms/index','',8,2,3,'短信配置、短信发送',0),(11,'Email','邮箱配置',1,1,'/Email/index','',9,2,3,'邮箱配置',0),(12,'Shop','商户管理',1,1,'Shop','',1,1,2,'',0),(13,'Shop','加盟商户',1,1,'/Shop/index','',2,12,3,'管理所有加盟商户',0),(14,'Area','开通区域',1,1,'/Area/index','',3,12,3,'开通区域（省份、行政区域、热门商圈）',0),(15,'Cuisine','菜系设置',1,1,'/Cuisine/index','',4,12,3,'如：美味快餐、便利食品、蛋糕甜品等',0),(16,'Info','资料管理',1,1,'Info','',2,1,2,'',0),(17,'ShopInfo','信息维护',1,1,'/ShopInfo/index','',1,16,3,'商户信息设置，含送餐范围及时间',0),(18,'SubShop','分店管理',1,1,'/SubShop/index','',2,16,3,'分店管理',0),(19,'Employee','员工信息',1,1,'/Employee/index','',3,16,3,'员工信息，包括总店员工及分店员工信息',0),(20,'Product','商品管理',1,1,'Product','',3,1,2,'',0),(21,'GoodsType','类目管理',1,1,'/GoodsType/index','',1,20,3,'商品类目',0),(22,'Goods','商品管理',1,1,'/Goods/index','',2,20,3,'商品信息',0),(23,'Flavor','口味设置',1,1,'/Flavor/index','',3,20,3,'菜品口味搭配',0),(24,'Gift','赠品设置',1,1,'/Gift/index','',4,20,3,'赠品设置',0),(25,'Customer','会员管理',1,1,'Customer','',4,1,2,'',0),(26,'Customer','会员列表',1,1,'/Customer/index','',1,25,3,'包括会员生日提醒',0),(27,'Level','会员等级',1,1,'/Level/index','',2,25,3,'',0),(28,'Message','互动管理',1,1,'/Message/index','',5,1,2,'',0),(29,'Complaint','投诉建议',1,1,'/Complaint/index','',1,28,3,'',0),(30,'Evaluate','用户点评',1,1,'/Evaluate/index','',2,28,3,'',0),(31,'Events','最新活动',1,1,'/Events/index','',3,28,3,'',0),(32,'Order','订单管理',1,1,'Order','',6,1,2,'',0),(33,'Order','订单信息',1,1,'/Order/index','',1,32,3,'',0),(34,'Report','统计报表',1,1,'Report','',7,1,2,'',0),(35,'Report','销售统计',1,1,'/Report/index','',1,34,3,'',0),(36,'Wages','员工绩效',1,1,'/Wages/index','',2,34,3,'',0),(37,'WeChat','微信平台',1,1,'WeChat','',8,1,2,'',0),(38,'Apply','申请商户',1,1,'/Apply/index','',1,12,3,'商户的入驻申请',0),(39,'GoodsCut','销售提成',1,1,'/GoodsCut/index','',10,2,3,'根据商品的不同类目进行提成',0);

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `orderkey` varchar(12) NOT NULL COMMENT '订单编号',
  `cus_id` smallint(5) unsigned NOT NULL COMMENT '顾客ID',
  `totle` decimal(10,2) NOT NULL COMMENT '总价',
  `outtime` datetime DEFAULT NULL COMMENT '外送时间',
  `address` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `remark` varchar(100) DEFAULT NULL COMMENT '特殊要求',
  `ordertime` datetime DEFAULT NULL COMMENT '下单时间',
  `shop_id` smallint(5) unsigned NOT NULL COMMENT '商户编号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderkey` (`orderkey`),
  KEY `cus_id` (`cus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order` */

/*Table structure for table `orderdetails` */

DROP TABLE IF EXISTS `orderdetails`;

CREATE TABLE `orderdetails` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `orderkey` varchar(12) NOT NULL COMMENT '订单编号',
  `goods_id` smallint(5) NOT NULL COMMENT '商品编号',
  `goods_name` varchar(20) NOT NULL COMMENT '商品名称',
  `shuliang` int(11) NOT NULL COMMENT '份数',
  `price` decimal(10,2) NOT NULL COMMENT '单价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orderdetails` */

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `ename` varchar(5) DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `ename` (`ename`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id`,`name`,`pid`,`status`,`remark`,`ename`,`create_time`,`update_time`) values (1,'超级管理员',0,1,'超级管理员拥有后台的最高控制权限，可以不用设置“可访问资源”','',0,0),(2,'商户总店管理员',NULL,1,'每个加盟商户拥有一个管理员账号，该账号由超级管理员分配',NULL,1376356627,1376356627),(20,'商户分店管理员',NULL,1,'商户分店管理员',NULL,1376365991,1376365991);

/*Table structure for table `role_user` */

DROP TABLE IF EXISTS `role_user`;

CREATE TABLE `role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role_user` */

insert  into `role_user`(`role_id`,`user_id`) values (1,'1'),(2,'2');

/*Table structure for table `shop` */

DROP TABLE IF EXISTS `shop`;

CREATE TABLE `shop` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '商户名',
  `logo` varchar(30) NOT NULL COMMENT 'LOGO',
  `shoptype_id` smallint(6) unsigned NOT NULL COMMENT '行业性质',
  `ordercode` varchar(10) NOT NULL COMMENT '订单代号',
  `username` varchar(20) NOT NULL COMMENT '负责人',
  `mobile` varchar(11) NOT NULL COMMENT '负责人联系方式',
  `area_id` smallint(5) unsigned DEFAULT '0' COMMENT '所在城市',
  `Address` varchar(40) DEFAULT NULL COMMENT '详细地址',
  `apply_status` tinyint(1) DEFAULT '0' COMMENT '是否同意申请',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否可用',
  `info` text NOT NULL COMMENT '简介',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `shop` */

/*Table structure for table `shopgoodstype` */

DROP TABLE IF EXISTS `shopgoodstype`;

CREATE TABLE `shopgoodstype` (
  `shop_id` smallint(5) unsigned NOT NULL COMMENT '商户ID',
  `type_id` smallint(5) unsigned NOT NULL COMMENT '商品类目ID',
  KEY `shop_id` (`shop_id`),
  KEY `type_id` (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `shopgoodstype` */

/*Table structure for table `shoppic` */

DROP TABLE IF EXISTS `shoppic`;

CREATE TABLE `shoppic` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` smallint(5) unsigned NOT NULL COMMENT '商户编号',
  `name` varchar(64) NOT NULL COMMENT '图片名',
  `url` varchar(30) NOT NULL COMMENT '图片地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `shoppic` */

/*Table structure for table `shoptype` */

DROP TABLE IF EXISTS `shoptype`;

CREATE TABLE `shoptype` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '性质名',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否可用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `shoptype` */

/*Table structure for table `sms` */

DROP TABLE IF EXISTS `sms`;

CREATE TABLE `sms` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `fromuser` varchar(50) NOT NULL COMMENT '发送用户',
  `touser` text NOT NULL COMMENT '接收用户',
  `content` text NOT NULL COMMENT '发送内容',
  `time` datetime NOT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sms` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(64) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `bind_account` varchar(50) NOT NULL,
  `last_login_time` int(11) unsigned DEFAULT '0',
  `last_login_ip` varchar(40) DEFAULT NULL,
  `login_count` mediumint(8) unsigned DEFAULT '0',
  `verify` varchar(32) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `type_id` tinyint(2) unsigned DEFAULT '0',
  `info` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`account`,`nickname`,`password`,`bind_account`,`last_login_time`,`last_login_ip`,`login_count`,`verify`,`email`,`remark`,`create_time`,`update_time`,`status`,`type_id`,`info`) values (1,'admin','超级管理员','827ccb0eea8a706c4c34a16891f84e7b','',1376707939,'127.0.0.1',58,'8888','250441630@qq.com','超级管理员',1222907803,1239977420,1,0,''),(2,'lxlin315','李小林','827ccb0eea8a706c4c34a16891f84e7b','',1376537445,'127.0.0.1',16,NULL,'lxlin315@163.com','商户管理员',0,0,1,0,'');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
