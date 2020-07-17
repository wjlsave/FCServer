/*
SQLyog Enterprise v12.08 (64 bit)
MySQL - 5.7.29-log : Database - fcserver
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`fcserver` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `fcserver`;

/*Table structure for table `sys_api` */

DROP TABLE IF EXISTS `sys_api`;

CREATE TABLE `sys_api` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `api_path` varchar(100) DEFAULT NULL COMMENT 'api路径',
  `api_describe` varchar(1000) DEFAULT NULL COMMENT 'api描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='权限表';

/*Data for the table `sys_api` */

insert  into `sys_api`(`id`,`api_path`,`api_describe`) values (5,'/SysApi/pagelist','接口分页'),(6,'/SysUser/pagelist','用户列表'),(7,'/SysUser/detail','用户详情'),(8,'/SysUser/cut','用户删除'),(9,'/SysUser/add','用户添加'),(10,'/SysUser/edit','用户修改'),(11,'/SysUser/resetpassword','用户重置密码'),(12,'/SysRole/pagelist','角色列表'),(13,'/SysRole/detail','角色详情'),(14,'/SysRole/cut','角色删除'),(15,'/SysRole/add','角色添加'),(16,'/SysRole/edit','角色编辑'),(17,'/SysResource/treelist','资源树结构'),(18,'/SysResource/detail','资源详情'),(19,'/SysResource/cut','资源删除'),(20,'/SysResource/add','资源添加'),(21,'/SysResource/edit','资源修改'),(22,'/SysResource/treedrag','资源拖拽'),(24,'/SysResource/getresourceapis','获取资源的所需接口'),(25,'/SysResource/setapis','设置资源的支撑接口'),(26,'/SysApi/pagelist','接口列表'),(27,'/SysApi/detail','接口详情'),(28,'/SysApi/cut','接口删除'),(29,'/SysApi/add','接口添加'),(30,'/SysApi/edit','接口修改');

/*Table structure for table `sys_resource` */

DROP TABLE IF EXISTS `sys_resource`;

CREATE TABLE `sys_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `icon_class` varchar(100) DEFAULT NULL COMMENT '图标icon',
  `resource_name` varchar(50) NOT NULL COMMENT '资源名称',
  `path` varchar(200) DEFAULT NULL COMMENT '菜单路径/按钮code',
  `parent_id` int(11) DEFAULT NULL COMMENT '父资源id',
  `type` int(11) DEFAULT NULL COMMENT '资源类型(1、菜单 2、按钮)',
  `sort` int(11) DEFAULT '0' COMMENT '排序值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='请求路径';

/*Data for the table `sys_resource` */

insert  into `sys_resource`(`id`,`icon_class`,`resource_name`,`path`,`parent_id`,`type`,`sort`) values (1,'el-icon-s-tools','系统配置','/settings',0,1,0),(2,'el-icon-user-solid','用户管理','SysUser',1,1,0),(3,'el-icon-user','角色管理','SysRole',1,1,1),(4,'el-icon-s-grid','资源管理','SysResource',1,1,2),(6,NULL,'添加用户','addSysUser',2,2,1),(7,NULL,'查看用户','seeSysUser',2,2,0),(8,NULL,'修改用户','editSysUser',2,2,3),(9,NULL,'删除用户','cutSysUser',2,2,2),(11,'el-icon-connection','接口管理','SysApi',1,1,4),(12,NULL,'查看接口','seeSysApi',11,2,0),(13,NULL,'添加接口','addSysApi',11,2,0),(14,NULL,'删除接口','cutSysApi',11,2,0),(15,NULL,'修改接口','editSysApi',11,2,0),(16,NULL,'重置密码','resetPassword',2,2,4),(17,NULL,'查看角色','seeSysRole',3,2,0),(18,NULL,'添加角色','addSysRole',3,2,0),(19,NULL,'删除角色','cutSysRole',3,2,0),(20,NULL,'修改角色','editSysRole',3,2,0),(21,NULL,'查看资源','seeSysResource',4,2,0),(22,NULL,'添加资源','addSysResource',4,2,1),(23,NULL,'修改资源','editSysResource',4,2,3),(24,NULL,'删除资源','cutSysResource',4,2,2),(25,NULL,'支撑接口','supportApi',4,2,4);

/*Table structure for table `sys_resource_api_relation` */

DROP TABLE IF EXISTS `sys_resource_api_relation`;

CREATE TABLE `sys_resource_api_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `resource_id` int(11) DEFAULT NULL COMMENT '请求路径id',
  `api_id` int(11) DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='路径权限关联表';

/*Data for the table `sys_resource_api_relation` */

insert  into `sys_resource_api_relation`(`id`,`resource_id`,`api_id`) values (5,1,1),(6,1,3),(7,1,4),(8,1,5),(9,12,27),(10,13,29),(11,14,28),(12,15,1),(13,15,30),(18,6,9),(19,9,8),(20,8,10),(32,16,11),(37,2,3),(38,2,4),(39,2,6),(40,7,3),(41,7,4),(42,7,7),(43,3,12),(44,17,13),(45,18,15),(46,19,14),(47,20,16),(48,4,17),(49,21,18),(50,22,20),(51,24,19),(53,25,24),(54,25,25),(55,23,21),(56,23,22),(57,11,5);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名',
  `role_description` varchar(1000) DEFAULT NULL COMMENT '角色说明',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户角色表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`role_name`,`role_description`,`createtime`) values (1,'管理员','所有业务与系统基础配置权限',NULL),(2,'超级管理员','所有权限',NULL),(3,'普通用户','相关业务权限','2020-07-17 13:59:01');

/*Table structure for table `sys_role_resource_relation` */

DROP TABLE IF EXISTS `sys_role_resource_relation`;

CREATE TABLE `sys_role_resource_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `resource_id` int(11) DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8 COMMENT='角色-权限关联关系表';

/*Data for the table `sys_role_resource_relation` */

insert  into `sys_role_resource_relation`(`id`,`role_id`,`resource_id`) values (226,2,1),(227,2,2),(228,2,7),(229,2,6),(230,2,9),(231,2,8),(232,2,16),(233,2,3),(234,2,17),(235,2,18),(236,2,19),(237,2,20),(238,2,4),(239,2,21),(240,2,22),(241,2,24),(242,2,23),(243,2,25),(244,2,11),(245,2,12),(246,2,13),(247,2,14),(248,2,15),(256,1,2),(257,1,7),(258,1,6),(259,1,9),(260,1,8),(261,1,16),(262,1,3),(263,1,17),(264,1,18),(265,1,19),(266,1,20),(267,1,21),(268,1,23),(269,1,1),(270,1,4);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(50) NOT NULL COMMENT '账号',
  `user_name` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '用户密码',
  `last_login_time` datetime DEFAULT NULL COMMENT '上一次登录时间',
  `state` int(11) DEFAULT '1' COMMENT '1、启用 0、禁用',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`account`,`user_name`,`password`,`last_login_time`,`state`,`create_time`) values (6,'super','wujianglun','4297f44b13955235245b2497399d7a93','2020-07-17 16:55:13',1,'2020-07-09 10:00:11'),(8,'admin','admins','4297f44b13955235245b2497399d7a93','2020-07-17 16:54:23',1,'2020-07-09 10:00:24'),(34,'user1','硕大的','4297f44b13955235245b2497399d7a93',NULL,1,'2020-07-17 14:39:34');

/*Table structure for table `sys_user_role_relation` */

DROP TABLE IF EXISTS `sys_user_role_relation`;

CREATE TABLE `sys_user_role_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COMMENT='用户角色关联关系表';

/*Data for the table `sys_user_role_relation` */

insert  into `sys_user_role_relation`(`id`,`user_id`,`role_id`) values (64,6,2),(65,6,3),(66,6,4),(75,8,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
