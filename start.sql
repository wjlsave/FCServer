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

/*Table structure for table `sys_permission` */

DROP TABLE IF EXISTS `sys_permission`;

CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `permission_code` varchar(32) DEFAULT NULL COMMENT '权限code',
  `permission_name` varchar(32) DEFAULT NULL COMMENT '权限名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='权限表';

/*Data for the table `sys_permission` */

insert  into `sys_permission`(`id`,`permission_code`,`permission_name`) values (1,'create_user','创建用户'),(2,'query_user','查看用户'),(3,'delete_user','删除用户'),(4,'modify_user','修改用户');

/*Table structure for table `sys_resource` */

DROP TABLE IF EXISTS `sys_resource`;

CREATE TABLE `sys_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `resource_name` varchar(64) NOT NULL COMMENT '资源名称',
  `path` varchar(128) DEFAULT NULL COMMENT '菜单路径/按钮code',
  `parentid` int(11) DEFAULT NULL COMMENT '父资源id',
  `state` int(11) DEFAULT '1' COMMENT '资源状态',
  `type` int(11) DEFAULT NULL COMMENT '资源类型(1、菜单 2、按钮)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='请求路径';

/*Data for the table `sys_resource` */

insert  into `sys_resource`(`id`,`resource_name`,`path`,`parentid`,`state`,`type`) values (1,'/getUser','查询用户',NULL,1,NULL);

/*Table structure for table `sys_resource_permission_relation` */

DROP TABLE IF EXISTS `sys_resource_permission_relation`;

CREATE TABLE `sys_resource_permission_relation` (
  `id` int(11) DEFAULT NULL COMMENT '主键id',
  `resource_id` int(11) DEFAULT NULL COMMENT '请求路径id',
  `permission_id` int(11) DEFAULT NULL COMMENT '权限id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='路径权限关联表';

/*Data for the table `sys_resource_permission_relation` */

insert  into `sys_resource_permission_relation`(`id`,`resource_id`,`permission_id`) values (NULL,1,2);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='角色-权限关联关系表';

/*Data for the table `sys_role_resource_relation` */

insert  into `sys_role_resource_relation`(`id`,`role_id`,`resource_id`) values (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,2,1),(6,2,2);

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`account`,`user_name`,`password`,`last_login_time`,`state`,`create_time`) values (6,'wjl','wujianglun','4297f44b13955235245b2497399d7a93',NULL,1,'2020-07-09 10:00:11'),(7,'admin2','wujianglun','4297f44b13955235245b2497399d7a93',NULL,1,'2020-07-09 10:00:15'),(8,'admin','wujianglun1','4297f44b13955235245b2497399d7a93','2020-07-09 15:09:43',1,'2020-07-09 10:00:24'),(10,'admin3','wujianglun','4297f44b13955235245b2497399d7a93',NULL,1,'2020-07-09 14:34:25');

/*Table structure for table `sys_user_role_relation` */

DROP TABLE IF EXISTS `sys_user_role_relation`;

CREATE TABLE `sys_user_role_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `role_id` int(1) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='用户角色关联关系表';

/*Data for the table `sys_user_role_relation` */

insert  into `sys_user_role_relation`(`id`,`user_id`,`role_id`) values (11,6,1),(12,6,2),(13,6,3),(14,6,4),(27,8,1),(28,7,1),(29,7,2),(30,7,3),(31,7,4),(32,7,5),(35,10,2),(36,10,8);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
