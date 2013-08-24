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
  `role_id` SMALLINT(6) UNSIGNED NOT NULL,
  `node_id` SMALLINT(6) UNSIGNED NOT NULL,
  `level` TINYINT(1) NOT NULL,
  `pid` SMALLINT(6) NOT NULL,
  `module` VARCHAR(50) DEFAULT NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

/*Data for the table `access` */
DELETE FROM access
INSERT  INTO `access`(`role_id`,`node_id`,`level`,`pid`,`module`) VALUES (2,93,0,0,NULL),(2,94,0,0,NULL),(2,144,0,0,NULL),(2,143,0,0,NULL),(2,142,0,0,NULL),(2,2,0,0,NULL),(2,97,0,0,NULL),(2,96,0,0,NULL),(2,95,0,0,NULL),(2,145,0,0,NULL),(2,146,0,0,NULL),(2,6,0,0,NULL),(2,150,0,0,NULL),(2,151,0,0,NULL),(2,152,0,0,NULL),(2,153,0,0,NULL),(2,154,0,0,NULL),(2,30,0,0,NULL),(2,168,0,0,NULL),(2,169,0,0,NULL),(2,84,0,0,NULL),(2,149,0,0,NULL),(2,155,0,0,NULL),(2,158,0,0,NULL),(2,159,0,0,NULL),(2,160,0,0,NULL),(2,165,0,0,NULL),(2,148,0,0,NULL),(2,157,0,0,NULL),(2,156,0,0,NULL),(2,162,0,0,NULL),(2,163,0,0,NULL),(2,164,0,0,NULL),(2,161,0,0,NULL),(2,167,0,0,NULL),(2,166,0,0,NULL),(1,93,0,0,NULL),(1,94,0,0,NULL),(1,2,0,0,NULL),(1,142,0,0,NULL),(1,143,0,0,NULL),(1,6,0,0,NULL),(1,85,0,0,NULL),(1,86,0,0,NULL),(1,88,0,0,NULL),(1,90,0,0,NULL),(1,92,0,0,NULL),(1,7,0,0,NULL),(1,150,0,0,NULL),(1,151,0,0,NULL),(1,152,0,0,NULL),(1,153,0,0,NULL),(1,154,0,0,NULL),(1,30,0,0,NULL),(1,149,0,0,NULL),(1,155,0,0,NULL),(1,158,0,0,NULL),(1,159,0,0,NULL),(1,160,0,0,NULL),(1,165,0,0,NULL),(1,148,0,0,NULL),(1,157,0,0,NULL),(1,156,0,0,NULL),(1,162,0,0,NULL),(1,163,0,0,NULL),(1,164,0,0,NULL),(1,161,0,0,NULL),(1,167,0,0,NULL),(1,166,0,0,NULL),(1,1,0,0,NULL),(127,156,0,0,NULL),(127,157,0,0,NULL),(127,30,0,0,NULL),(127,150,0,0,NULL),(127,151,0,0,NULL),(127,152,0,0,NULL),(127,153,0,0,NULL),(127,154,0,0,NULL),(127,148,0,0,NULL),(127,149,0,0,NULL),(127,155,0,0,NULL),(127,158,0,0,NULL),(127,159,0,0,NULL),(127,160,0,0,NULL),(127,165,0,0,NULL);

/*Table structure for table `node` */

DROP TABLE IF EXISTS `node`;

CREATE TABLE `node` (
  `id` SMALLINT(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `title` VARCHAR(50) DEFAULT NULL,
  `status` TINYINT(1) DEFAULT '0',
  `ismenu` TINYINT(1) DEFAULT '0',
  `attributes` VARCHAR(100) DEFAULT NULL,
  `iconCls` VARCHAR(255) DEFAULT NULL,
  `sort` SMALLINT(6) UNSIGNED DEFAULT NULL,
  `pid` SMALLINT(6) UNSIGNED NOT NULL,
  `level` TINYINT(1) UNSIGNED NOT NULL,
  `remark` VARCHAR(255) DEFAULT NULL,
  `group_id` TINYINT(3) UNSIGNED DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MYISAM AUTO_INCREMENT=181 DEFAULT CHARSET=utf8;
SELECT * FROM node WHERE STATUS = 1
/*Data for the table `node` */
DELETE FROM `node`

INSERT  INTO `node`(`id`,`name`,`title`,`status`,`ismenu`,`attributes`,`iconCls`,`sort`,`pid`,`level`,`remark`,`group_id`) VALUES 
(1,'Home','后台管理',1,0,'','icon-edit',11,0,1,'',0),
(2,'System','系统设置',1,1,'System','',14,1,2,'',0),
	(3,'Node','节点管理',1,1,'/Node/index','',1,2,3,'节点管理',2),
	(4,'Role','角色管理',1,1,'/Role/index','',2,2,3,'角色管理',2),
	(5,'User','用户管理',1,1,'/User/index','',3,2,3,'后台用户',2),
	
/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` SMALLINT(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `pid` SMALLINT(6) DEFAULT NULL,
  `status` TINYINT(1) UNSIGNED DEFAULT NULL,
  `remark` VARCHAR(255) DEFAULT NULL,
  `ename` VARCHAR(5) DEFAULT NULL,
  `create_time` INT(11) NOT NULL,
  `update_time` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `ename` (`ename`),
  KEY `status` (`status`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

DELETE FROM `role`
/*Data for the table `role` */

SELECT * FROM `role`

INSERT  INTO `role`(`id`,`name`,`pid`,`status`,`remark`,`ename`,`create_time`,`update_time`) VALUES 
(1,'超级管理员',0,1,'超级管理员拥有后台的最高控制权限','',0,0)

/*Table structure for table `role_user` */

DROP TABLE IF EXISTS `role_user`;

CREATE TABLE `role_user` (
  `role_id` MEDIUMINT(9) UNSIGNED DEFAULT NULL,
  `user_id` CHAR(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

/*Data for the table `role_user` */
DELETE FROM role_user
INSERT  INTO `role_user`(`role_id`,`user_id`) VALUES (1,'1'),(2,'2');
SELECT * FROM role_user

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account` VARCHAR(64) NOT NULL COMMENT '登录名',
  `nickname` VARCHAR(50) NOT NULL COMMENT '真实姓名',
  `password` VARCHAR(32) NOT NULL COMMENT '密码',
  `bind_account` VARCHAR(50) NOT NULL,
  `last_login_time` INT(11) UNSIGNED DEFAULT '0' COMMENT '最后一次登录时间',
  `last_login_ip` VARCHAR(40) DEFAULT NULL COMMENT '最后一次登录IP',
  `login_count` MEDIUMINT(8) UNSIGNED DEFAULT '0' COMMENT '登录次数',
  `verify` VARCHAR(32) DEFAULT NULL,
  `email` VARCHAR(200) NOT NULL COMMENT '电子邮件',
  `remark` VARCHAR(255) NOT NULL COMMENT '备注',
  `create_time` INT(11) UNSIGNED NOT NULL COMMENT '创建时间',
  `update_time` INT(11) UNSIGNED NOT NULL COMMENT '修改时间',
  `status` TINYINT(1) DEFAULT '0' COMMENT '状态',
  `type_id` TINYINT(2) UNSIGNED DEFAULT '0',
  `info` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

/*Data for the table `user` */

INSERT  INTO `user`(`id`,`account`,`nickname`,`password`,`bind_account`,`last_login_time`,`last_login_ip`,`login_count`,`verify`,`email`,`remark`,`create_time`,`update_time`,`status`,`type_id`,`info`) VALUES 
(1,'admin','超级管理员','827ccb0eea8a706c4c34a16891f84e7b','',1376063460,'127.0.0.1',0,'8888','250441630@qq.com','超级管理员',1222907803,1239977420,1,0,'')

SELECT * FROM `user`


/*
 * Table structure for table `area` 
 * 开通区域 
 */

DROP TABLE IF EXISTS `area`;

CREATE TABLE `area` (
  `id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '名称',
  `level` TINYINT(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '等级划分',
  `upid` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父级ID',
  `sort` SMALLINT(3) UNSIGNED NOT NULL COMMENT '排序号',
  `status` TINYINT(1) DEFAULT '0' COMMENT '是否启动',
  PRIMARY KEY  (`id`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

INSERT INTO `area` VALUES(1,'重庆',0,0,1,1);

INSERT INTO `area` VALUES(2,'沙坪坝',1,1,1,1);
INSERT INTO `area` VALUES(3,'渝中区',1,1,2,1);
INSERT INTO `area` VALUES(4,'南岸区',1,1,3,1);
INSERT INTO `area` VALUES(5,'渝北区',1,1,4,1);
INSERT INTO `area` VALUES(6,'江北区',1,1,5,1);

INSERT INTO `area` VALUES(7,'三峡广场商圈',2,2,1,1);
INSERT INTO `area` VALUES(8,'解放碑商圈',2,3,2,1);
INSERT INTO `area` VALUES(9,'万达广场商圈',2,4,3,1);
INSERT INTO `area` VALUES(10,'两江新区软件园',2,5,4,1);
INSERT INTO `area` VALUES(11,'观音桥商圈',2,6,5,1);

/*
 * Table structure for table `shoptype` 
 *
 * 商户行业类型表 
 *
 */

DROP TABLE IF EXISTS `shoptype`;

CREATE TABLE `shoptype` (
  `id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) NOT NULL COMMENT '性质名',
  `status` TINYINT(1) DEFAULT '0' COMMENT '是否可用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

INSERT INTO `shoptype` VALUES(1,'餐饮快餐',1);
INSERT INTO `shoptype` VALUES(2,'便利副食',1);
INSERT INTO `shoptype` VALUES(3,'蛋糕甜品',1);

/*
 * Table structure for table `shop` 
 *
 * 商户信息表
 *
 * 说明：含申请入驻以及已经入驻的商户  
 */

DROP TABLE IF EXISTS `shop`;

CREATE TABLE `shop` (
  `id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) NOT NULL COMMENT '商户名',
  `logo` VARCHAR(30) NOT NULL COMMENT 'LOGO',
  `xingzhi` SMALLINT(2) NOT NULL COMMENT '性质', /* 1：私营  2：加盟  3：连锁  */
  `shoptype_id` SMALLINT(6) UNSIGNED NOT NULL COMMENT '行业类型',
  `ordercode` VARCHAR(10) NOT NULL COMMENT '订单代号',
  `phone` VARCHAR(20) COMMENT '订餐电话（座机）',
  `username` VARCHAR(20) NOT NULL COMMENT '负责人',
  `mobile` VARCHAR(11) NOT NULL COMMENT '联系方式',
  `area_id` SMALLINT(5) UNSIGNED DEFAULT '0' COMMENT '所在城市',
  `address` VARCHAR(40) DEFAULT NULL COMMENT '详细地址',
  `apply_status` TINYINT(1) DEFAULT '0' COMMENT '是否同意申请',
  `apply_time` DATETIME NOT NULL COMMENT '申请时间',  
  `status` TINYINT(1) DEFAULT '0' COMMENT '是否可用',
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  `update_time` DATETIME NOT NULL COMMENT '修改时间',
  `info` TEXT NOT NULL COMMENT '简介',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

INSERT INTO `shop` VALUES(1,'佳士客','',3,1,'jsk-','0234001046166','吴宏新','18623006248',9,'重庆南坪四小区',0,'2013-08-17 00:00:00',0,'','','佳士客快餐简介……')
/*
 * Table structure for table `shoppic` 
 *
 * 商户图片
 *
 */

DROP TABLE IF EXISTS `shoppic`;

CREATE TABLE `shoppic` (
  `id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `shop_id` SMALLINT(5) UNSIGNED NOT NULL COMMENT '商户编号',
  `name` VARCHAR(64) NOT NULL COMMENT '图片名',
  `url` VARCHAR(30) NOT NULL COMMENT '图片地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;


/*
 * Table structure for table `employee` 
 *
 * 员工信息表 
 *
 */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) NOT NULL COMMENT '员工姓名',
  `mobile` VARCHAR(20) NOT NULL COMMENT '手机号码',
  `wages` DECIMAL(10,2) NOT NULL COMMENT '基本工资',
  `cut` DECIMAL(10,2) NOT NULL COMMENT '绩效提成',
  `address` VARCHAR(100) COMMENT '现居地址',
  `shop_id` SMALLINT(5) UNSIGNED NOT NULL COMMENT '商户编号',
  `status` TINYINT(1) DEFAULT '0' COMMENT '是否离职',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

/*
 * Table structure for table `goodstype` 
 *
 * 商品类目表 
 *
 */

DROP TABLE IF EXISTS `goodstype`;

CREATE TABLE `goodstype` (
  `id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) NOT NULL COMMENT '类目名',
  `upid` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父级ID',
  `status` TINYINT(1) DEFAULT '0' COMMENT '是否可用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

/*
 * Table structure for table `shopgoodstype` 
 *
 * 商户商品类目表
 *
 */

DROP TABLE IF EXISTS `shopgoodstype`;

CREATE TABLE `shopgoodstype` (
  `shop_id` SMALLINT(5) UNSIGNED NOT NULL COMMENT '商户ID',
  `type_id` SMALLINT(5) UNSIGNED NOT NULL COMMENT '商品类目ID',
  KEY `shop_id`(`shop_id`),
  KEY `type_id`(`type_id`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

/*
 * Table structure for table `goodstypecut` 
 *
 * 提成比例表 
 *
 */

DROP TABLE IF EXISTS `goodstypecut`;

CREATE TABLE `goodstypecut` (
  `id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type_id` SMALLINT(5) UNSIGNED NOT NULL COMMENT '商品类目ID',
  `cut` INT UNSIGNED NOT NULL DEFAULT '0' COMMENT '提成比例',
  `status` TINYINT(1) DEFAULT '0' COMMENT '是否可用',
  PRIMARY KEY (`id`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;


/*
 * Table structure for table `product` 
 *
 * 商品信息表 
 *
 */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) NOT NULL COMMENT '商品名',
  `type_id` SMALLINT(5) UNSIGNED NOT NULL COMMENT '商品类型',
  `shuliang` INT NOT NULL COMMENT '数量',
  `price` DECIMAL(10,2) NOT NULL COMMENT '销售价格',
  `jifen` INT NOT NULL DEFAULT '0' COMMENT '单个销售积分',
  `begintime` DATE NOT NULL COMMENT '上架时间',
  `selltotle` INT NOT NULL DEFAULT '0' COMMENT '销售量',
  `shop_id` SMALLINT(5) UNSIGNED NOT NULL COMMENT '商户编号',
  `status` TINYINT(1) DEFAULT '0' COMMENT '是否下架',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;


/*
 * Table structure for table `attribute` 
 *
 * 商品属性表 
 *
 */

DROP TABLE IF EXISTS `attribute`;

CREATE TABLE `attribute` (
  `id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) NOT NULL COMMENT '属性名',
  `value` VARCHAR(200) COMMENT '属性值',
  `upid` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父级ID',
  `status` TINYINT(1) DEFAULT '0' COMMENT '是否可用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;


/*
 * Table structure for table `goodsattr` 
 *
 * 商品属性值
 *
 */

DROP TABLE IF EXISTS `goodsattr`;

CREATE TABLE `goodsattr` (
  `goods_id` SMALLINT(6) UNSIGNED NOT NULL,
  `attr_id` SMALLINT(6) UNSIGNED NOT NULL,
  KEY `goods_id` (`goods_id`),
  KEY `attr_id` (`attr_id`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;


/*
 * Table structure for table `flavor` 
 *
 * 口味设置 
 *
 */

DROP TABLE IF EXISTS `flavor`;

CREATE TABLE `flavor` (
  `id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) NOT NULL COMMENT '口味名',
  `remark` VARCHAR(100) COMMENT '备注',
  `status` TINYINT(1) DEFAULT '0' COMMENT '是否可用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;


/*
 * Table structure for table `goodsflavor` 
 *
 * 商品口味
 *
 */

DROP TABLE IF EXISTS `goodsflavor`;

CREATE TABLE `goodsflavor` (
  `goods_id` SMALLINT(6) UNSIGNED NOT NULL,
  `flavor_id` SMALLINT(6) UNSIGNED NOT NULL,
  KEY `goods_id` (`goods_id`),
  KEY `flavor_id` (`flavor_id`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

/* 
 * Table structure for table `gift` 
 * 
 * 赠品设置 
 * 
 */

DROP TABLE IF EXISTS `gift`;

CREATE TABLE `gift` (
  `id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) NOT NULL COMMENT '赠品名',
  `remark` VARCHAR(100) COMMENT '备注',
  `status` TINYINT(1) DEFAULT '0' COMMENT '是否可用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

/*
 * Table structure for table `level` 
 *
 * 积分等级表 
 *
 */

DROP TABLE IF EXISTS `level`;

CREATE TABLE `level` (
  `id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) NOT NULL COMMENT '等级名',
  `jifen` INT NOT NULL COMMENT '积分等级值',
  `status` TINYINT(1) DEFAULT '0' COMMENT '是否可用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

/*
 * Table structure for table `customer` 
 *
 * 顾客信息表 
 *
 */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) NOT NULL COMMENT '用户名',
  `pwd` VARCHAR(32) NOT NULL COMMENT '密码',
  `card` VARCHAR(30) COMMENT '会员卡号',
  `photo` VARCHAR(50) COMMENT '头像',
  `phone` VARCHAR(32) COMMENT '联系电话',
  `mobile` VARCHAR(32) NOT NULL COMMENT '手机号码',
  `email` VARCHAR(50) COMMENT '电子邮件',
  `address` VARCHAR(100) NOT NULL COMMENT '详细地址',
  `jifen` INT NOT NULL DEFAULT '0' COMMENT '积分',
  `question` VARCHAR(100) NOT NULL COMMENT '密码找回问题',
  `answer` VARCHAR(100) NOT NULL COMMENT '密码找回答案',
  `begintime` DATE NOT NULL COMMENT '注册时间',
  `status` TINYINT(1) DEFAULT '0' COMMENT '是否可用',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*
 * Table structure for table `order` 
 *
 * 订单信息表 
 *
 */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `orderkey` VARCHAR(12) NOT NULL COMMENT '订单编号',
  `cus_id` SMALLINT(5) UNSIGNED NOT NULL COMMENT '顾客ID',
  `totle` DECIMAL(10,2) NOT NULL COMMENT '总价',
  `outtime` DATETIME COMMENT '外送时间',
  `address` VARCHAR(100) COMMENT '详细地址',
  `remark` VARCHAR(100) COMMENT '特殊要求',
  `ordertime` DATETIME COMMENT '下单时间',
  `shop_id` SMALLINT(5) UNSIGNED NOT NULL COMMENT '商户编号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderkey` (`orderkey`),
  KEY `cus_id`(`cus_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*
 * Table structure for table `orderdetails` 
 *
 * 订单详细表 
 *
 */

DROP TABLE IF EXISTS `orderdetails`;

CREATE TABLE `orderdetails` (
  `id` SMALLINT (5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `orderkey` VARCHAR (12) NOT NULL COMMENT '订单编号',
  `goods_id` SMALLINT (5) NOT NULL COMMENT '商品编号',
  `goods_name` VARCHAR (20) NOT NULL COMMENT '商品名称',
  `shuliang` INT NOT NULL COMMENT '份数',
  `price` DECIMAL (10, 2) NOT NULL COMMENT '单价',
  PRIMARY KEY (`id`)
) ENGINE = INNODB DEFAULT CHARSET = utf8 ;



/*
 * Table structure for table `complaint` 
 *
 * 意见反馈表 
 *
 */

DROP TABLE IF EXISTS `complaint`;

CREATE TABLE `complaint` (
  `id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `mobile` VARCHAR(12) COMMENT '手机号码',
  `info` TEXT COMMENT '反馈内容',
  PRIMARY KEY (`id`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

/*
 * Table structure for table `evaluate` 
 *
 * 用户点评表 
 *
 */

DROP TABLE IF EXISTS `evaluate`;

CREATE TABLE `evaluate` (
  `id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `mobile` VARCHAR(12) COMMENT '手机号码',
  `info` TEXT COMMENT '反馈内容',
  PRIMARY KEY (`id`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;



/*
 * Table structure for table `events` 
 *
 * 最新活动 
 *
 */

DROP TABLE IF EXISTS `events`;

CREATE TABLE `events` (
  `id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(50) NOT NULL COMMENT '活动标题',
  `info` TEXT COMMENT '活动内容',
  PRIMARY KEY (`id`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;


/*
 * Table structure for table `feiyin` 
 *
 * 飞印配置中心 
 *
 */

DROP TABLE IF EXISTS `feiyin`;

CREATE TABLE `feiyin` (
  `id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `shop_id` SMALLINT(5) UNSIGNED NOT NULL COMMENT '商户编号',
  `shopkey` VARCHAR(50) NOT NULL COMMENT '商户编码',
  `apikey` VARCHAR(10) NOT NULL COMMENT 'API密钥',
  `mobile` VARCHAR(20) NOT NULL COMMENT '手机卡号',
  `machinekey` VARCHAR(50) NOT NULL COMMENT '终端编号',
  `status` TINYINT(1) DEFAULT '0' COMMENT '是否可用',
  PRIMARY KEY (`id`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

INSERT INTO feiyin VALUES(1,1,'766f58a0d21b11e18092005056a20012','3c5df167','18716451738','4600271662265937',1);

/*
 * Table structure for table `sms` 
 *
 * 短信收发记录 
 *
 */

DROP TABLE IF EXISTS `sms`;

CREATE TABLE `sms` (
  `id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fromuser` VARCHAR(50) NOT NULL COMMENT '发送用户',
  `touser` TEXT NOT NULL COMMENT '接收用户',
  `content` TEXT NOT NULL COMMENT '发送内容',
  `time` DATETIME NOT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;


/*
 * Table structure for table `email` 
 *
 * 邮件收发记录 
 *
 */

DROP TABLE IF EXISTS `email`;

CREATE TABLE `email` (
  `id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fromuser` VARCHAR(50) NOT NULL COMMENT '发送用户',
  `touser` TEXT NOT NULL COMMENT '接收用户',
  `content` TEXT NOT NULL COMMENT '发送内容',
  `time` DATETIME NOT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;