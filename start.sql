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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='权限表';

/*Data for the table `sys_api` */

insert  into `sys_api`(`id`,`api_path`,`api_describe`) values (1,'create_user','创建用户'),(3,'delete_user','删除用户'),(4,'modify_user','修改用户'),(5,'SysApi/pagelist','接口分页');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='请求路径';

/*Data for the table `sys_resource` */

insert  into `sys_resource`(`id`,`icon_class`,`resource_name`,`path`,`parent_id`,`type`,`sort`) values (1,'el-icon-s-tools','系统配置','/settings',0,1,0),(2,'el-icon-user-solid','用户管理','SysUser',1,1,1),(3,'el-icon-user','角色管理','SysRole',1,1,2),(4,'el-icon-s-grid','资源管理','SysResource',1,1,0),(6,NULL,'增加用户','addSysUser',2,2,1),(7,NULL,'查看用户','seeSysUser',2,2,0),(8,NULL,'编辑用户','editSysUser',2,2,3),(9,NULL,'删除用户','cutSysUser',2,2,2),(11,'el-icon-connection','接口管理','SysApi',1,1,0),(12,NULL,'查看接口','seeSysApi',11,2,0),(13,NULL,'添加接口','addSysApi',11,2,0),(14,NULL,'删除接口','cutSysApi',11,2,0),(15,NULL,'修改接口','editSysApi',11,2,0);

/*Table structure for table `sys_resource_api_relation` */

DROP TABLE IF EXISTS `sys_resource_api_relation`;

CREATE TABLE `sys_resource_api_relation` (
  `id` int(11) DEFAULT NULL COMMENT '主键id',
  `resource_id` int(11) DEFAULT NULL COMMENT '请求路径id',
  `api_id` int(11) DEFAULT NULL COMMENT '权限id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='路径权限关联表';

/*Data for the table `sys_resource_api_relation` */

insert  into `sys_resource_api_relation`(`id`,`resource_id`,`api_id`) values (NULL,1,2);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名',
  `role_description` varchar(1000) DEFAULT NULL COMMENT '角色说明',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户角色表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`role_name`,`role_description`,`createtime`) values (1,'管理员','管理员，拥有所有权限',NULL),(2,'普通用户','普通用户，拥有部分权限',NULL);

/*Table structure for table `sys_role_resource_relation` */

DROP TABLE IF EXISTS `sys_role_resource_relation`;

CREATE TABLE `sys_role_resource_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `resource_id` int(11) DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COMMENT='角色-权限关联关系表';

/*Data for the table `sys_role_resource_relation` */

insert  into `sys_role_resource_relation`(`id`,`role_id`,`resource_id`) values (5,2,1),(6,2,2),(92,1,1),(93,1,4),(94,1,11),(95,1,12),(96,1,13),(97,1,14),(98,1,15),(99,1,2),(100,1,7),(101,1,6),(102,1,9),(103,1,8),(104,1,3);

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`account`,`user_name`,`password`,`last_login_time`,`state`,`create_time`) values (6,'wjl','wujianglun','4297f44b13955235245b2497399d7a93',NULL,1,'2020-07-09 10:00:11'),(7,'admin2','wujianglun','4297f44b13955235245b2497399d7a93',NULL,1,'2020-07-09 10:00:15'),(8,'admin','洒洒','4297f44b13955235245b2497399d7a93','2020-07-16 15:11:32',1,'2020-07-09 10:00:24'),(10,'admin3','wujianglun','4297f44b13955235245b2497399d7a93',NULL,1,'2020-07-09 14:34:25'),(14,'admin25','wujianglun','4297f44b13955235245b2497399d7a93',NULL,1,'2020-07-10 15:34:35'),(15,'acce1','忘记了','4297f44b13955235245b2497399d7a93',NULL,1,'2020-07-10 15:36:48'),(16,'admin256','wujianglun','4297f44b13955235245b2497399d7a93',NULL,1,'2020-07-10 15:38:16'),(17,'adminx','wujianglun','4297f44b13955235245b2497399d7a93',NULL,1,'2020-07-10 15:39:04'),(18,'administrator','王俊凯','4297f44b13955235245b2497399d7a93',NULL,1,'2020-07-10 15:47:58'),(19,'admin6','空间设计','4297f44b13955235245b2497399d7a93',NULL,1,'2020-07-10 15:54:32'),(20,'admin69','空间设计','4297f44b13955235245b2497399d7a93','2020-07-10 15:56:43',1,'2020-07-10 15:56:33'),(21,'admins','啥都看','4297f44b13955235245b2497399d7a93','2020-07-10 15:59:18',1,'2020-07-10 15:59:22'),(22,'abcd','cool','4297f44b13955235245b2497399d7a93',NULL,1,'2020-07-10 16:07:39'),(23,'wjlk','s算了算了','4297f44b13955235245b2497399d7a93',NULL,1,'2020-07-10 16:08:46'),(24,'adminaa','去去去','4297f44b13955235245b2497399d7a93',NULL,1,'2020-07-10 17:02:11'),(25,'oksys','洒洒','4297f44b13955235245b2497399d7a93',NULL,1,'2020-07-10 17:03:22'),(31,'assaas','硕大的','4297f44b13955235245b2497399d7a93',NULL,0,'2020-07-10 17:27:22');

/*Table structure for table `sys_user_role_relation` */

DROP TABLE IF EXISTS `sys_user_role_relation`;

CREATE TABLE `sys_user_role_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `role_id` int(1) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='用户角色关联关系表';

/*Data for the table `sys_user_role_relation` */

insert  into `sys_user_role_relation`(`id`,`user_id`,`role_id`) values (11,6,1),(12,6,2),(13,6,3),(14,6,4),(28,7,1),(29,7,2),(30,7,3),(31,7,4),(32,7,5),(35,10,2),(36,10,8),(39,17,2),(53,8,1),(54,14,2),(55,16,1),(56,16,2),(57,23,2),(58,24,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
