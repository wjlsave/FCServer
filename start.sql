/*
 Navicat Premium Data Transfer

 Source Server         : localhhost
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : fcserver

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 19/07/2020 23:21:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_api
-- ----------------------------
DROP TABLE IF EXISTS `sys_api`;
CREATE TABLE `sys_api` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `api_path` varchar(100) DEFAULT NULL COMMENT 'api路径',
  `api_describe` varchar(1000) DEFAULT NULL COMMENT 'api描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of sys_api
-- ----------------------------
BEGIN;
INSERT INTO `sys_api` VALUES (5, '/SysApi/pagelist', '接口分页');
INSERT INTO `sys_api` VALUES (6, '/SysUser/pagelist', '用户列表');
INSERT INTO `sys_api` VALUES (7, '/SysUser/detail', '用户详情');
INSERT INTO `sys_api` VALUES (8, '/SysUser/cut', '用户删除');
INSERT INTO `sys_api` VALUES (9, '/SysUser/add', '用户添加');
INSERT INTO `sys_api` VALUES (10, '/SysUser/edit', '用户修改');
INSERT INTO `sys_api` VALUES (11, '/SysUser/resetpassword', '用户重置密码');
INSERT INTO `sys_api` VALUES (12, '/SysRole/pagelist', '角色列表');
INSERT INTO `sys_api` VALUES (13, '/SysRole/detail', '角色详情');
INSERT INTO `sys_api` VALUES (14, '/SysRole/cut', '角色删除');
INSERT INTO `sys_api` VALUES (15, '/SysRole/add', '角色添加');
INSERT INTO `sys_api` VALUES (16, '/SysRole/edit', '角色编辑');
INSERT INTO `sys_api` VALUES (17, '/SysResource/treelist', '资源树结构');
INSERT INTO `sys_api` VALUES (18, '/SysResource/detail', '资源详情');
INSERT INTO `sys_api` VALUES (19, '/SysResource/cut', '资源删除');
INSERT INTO `sys_api` VALUES (20, '/SysResource/add', '资源添加');
INSERT INTO `sys_api` VALUES (21, '/SysResource/edit', '资源修改');
INSERT INTO `sys_api` VALUES (22, '/SysResource/treedrag', '资源拖拽');
INSERT INTO `sys_api` VALUES (24, '/SysResource/getresourceapis', '获取资源的所需接口');
INSERT INTO `sys_api` VALUES (25, '/SysResource/setapis', '设置资源的支撑接口');
INSERT INTO `sys_api` VALUES (26, '/SysApi/pagelist', '接口列表');
INSERT INTO `sys_api` VALUES (27, '/SysApi/detail', '接口详情');
INSERT INTO `sys_api` VALUES (28, '/SysApi/cut', '接口删除');
INSERT INTO `sys_api` VALUES (29, '/SysApi/add', '接口添加');
INSERT INTO `sys_api` VALUES (30, '/SysApi/edit', '接口修改');
COMMIT;

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `icon_class` varchar(100) DEFAULT NULL COMMENT '图标icon',
  `resource_name` varchar(50) NOT NULL COMMENT '资源名称',
  `path` varchar(200) DEFAULT NULL COMMENT '菜单路径/按钮code',
  `parent_id` int DEFAULT NULL COMMENT '父资源id',
  `type` int DEFAULT NULL COMMENT '资源类型(1、菜单 2、按钮)',
  `sort` int DEFAULT '0' COMMENT '排序值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='请求路径';

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
BEGIN;
INSERT INTO `sys_resource` VALUES (1, 'el-icon-s-tools', '系统配置', '/settings', 0, 1, 0);
INSERT INTO `sys_resource` VALUES (2, 'el-icon-user-solid', '用户管理', 'SysUser', 1, 1, 0);
INSERT INTO `sys_resource` VALUES (3, 'el-icon-user', '角色管理', 'SysRole', 1, 1, 1);
INSERT INTO `sys_resource` VALUES (4, 'el-icon-s-grid', '资源管理', 'SysResource', 1, 1, 2);
INSERT INTO `sys_resource` VALUES (6, NULL, '添加用户', 'addSysUser', 2, 2, 1);
INSERT INTO `sys_resource` VALUES (7, NULL, '查看用户', 'seeSysUser', 2, 2, 0);
INSERT INTO `sys_resource` VALUES (8, NULL, '修改用户', 'editSysUser', 2, 2, 3);
INSERT INTO `sys_resource` VALUES (9, NULL, '删除用户', 'cutSysUser', 2, 2, 2);
INSERT INTO `sys_resource` VALUES (11, 'el-icon-connection', '接口管理', 'SysApi', 1, 1, 4);
INSERT INTO `sys_resource` VALUES (12, NULL, '查看接口', 'seeSysApi', 11, 2, 0);
INSERT INTO `sys_resource` VALUES (13, NULL, '添加接口', 'addSysApi', 11, 2, 0);
INSERT INTO `sys_resource` VALUES (14, NULL, '删除接口', 'cutSysApi', 11, 2, 0);
INSERT INTO `sys_resource` VALUES (15, NULL, '修改接口', 'editSysApi', 11, 2, 0);
INSERT INTO `sys_resource` VALUES (16, NULL, '重置密码', 'resetPassword', 2, 2, 4);
INSERT INTO `sys_resource` VALUES (17, NULL, '查看角色', 'seeSysRole', 3, 2, 0);
INSERT INTO `sys_resource` VALUES (18, NULL, '添加角色', 'addSysRole', 3, 2, 0);
INSERT INTO `sys_resource` VALUES (19, NULL, '删除角色', 'cutSysRole', 3, 2, 0);
INSERT INTO `sys_resource` VALUES (20, NULL, '修改角色', 'editSysRole', 3, 2, 0);
INSERT INTO `sys_resource` VALUES (21, NULL, '查看资源', 'seeSysResource', 4, 2, 0);
INSERT INTO `sys_resource` VALUES (22, NULL, '添加资源', 'addSysResource', 4, 2, 1);
INSERT INTO `sys_resource` VALUES (23, NULL, '修改资源', 'editSysResource', 4, 2, 3);
INSERT INTO `sys_resource` VALUES (24, NULL, '删除资源', 'cutSysResource', 4, 2, 2);
INSERT INTO `sys_resource` VALUES (25, NULL, '支撑接口', 'supportApi', 4, 2, 4);
COMMIT;

-- ----------------------------
-- Table structure for sys_resource_api_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource_api_relation`;
CREATE TABLE `sys_resource_api_relation` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `resource_id` int DEFAULT NULL COMMENT '请求路径id',
  `api_id` int DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='路径权限关联表';

-- ----------------------------
-- Records of sys_resource_api_relation
-- ----------------------------
BEGIN;
INSERT INTO `sys_resource_api_relation` VALUES (5, 1, 1);
INSERT INTO `sys_resource_api_relation` VALUES (6, 1, 3);
INSERT INTO `sys_resource_api_relation` VALUES (7, 1, 4);
INSERT INTO `sys_resource_api_relation` VALUES (8, 1, 5);
INSERT INTO `sys_resource_api_relation` VALUES (9, 12, 27);
INSERT INTO `sys_resource_api_relation` VALUES (10, 13, 29);
INSERT INTO `sys_resource_api_relation` VALUES (11, 14, 28);
INSERT INTO `sys_resource_api_relation` VALUES (12, 15, 1);
INSERT INTO `sys_resource_api_relation` VALUES (13, 15, 30);
INSERT INTO `sys_resource_api_relation` VALUES (18, 6, 9);
INSERT INTO `sys_resource_api_relation` VALUES (19, 9, 8);
INSERT INTO `sys_resource_api_relation` VALUES (20, 8, 10);
INSERT INTO `sys_resource_api_relation` VALUES (32, 16, 11);
INSERT INTO `sys_resource_api_relation` VALUES (37, 2, 3);
INSERT INTO `sys_resource_api_relation` VALUES (38, 2, 4);
INSERT INTO `sys_resource_api_relation` VALUES (39, 2, 6);
INSERT INTO `sys_resource_api_relation` VALUES (40, 7, 3);
INSERT INTO `sys_resource_api_relation` VALUES (41, 7, 4);
INSERT INTO `sys_resource_api_relation` VALUES (42, 7, 7);
INSERT INTO `sys_resource_api_relation` VALUES (43, 3, 12);
INSERT INTO `sys_resource_api_relation` VALUES (45, 18, 15);
INSERT INTO `sys_resource_api_relation` VALUES (46, 19, 14);
INSERT INTO `sys_resource_api_relation` VALUES (47, 20, 16);
INSERT INTO `sys_resource_api_relation` VALUES (48, 4, 17);
INSERT INTO `sys_resource_api_relation` VALUES (49, 21, 18);
INSERT INTO `sys_resource_api_relation` VALUES (50, 22, 20);
INSERT INTO `sys_resource_api_relation` VALUES (51, 24, 19);
INSERT INTO `sys_resource_api_relation` VALUES (53, 25, 24);
INSERT INTO `sys_resource_api_relation` VALUES (54, 25, 25);
INSERT INTO `sys_resource_api_relation` VALUES (55, 23, 21);
INSERT INTO `sys_resource_api_relation` VALUES (56, 23, 22);
INSERT INTO `sys_resource_api_relation` VALUES (57, 11, 5);
INSERT INTO `sys_resource_api_relation` VALUES (58, 17, 13);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名',
  `role_description` varchar(1000) DEFAULT NULL COMMENT '角色说明',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '管理员', '所有业务与系统基础配置权限', NULL);
INSERT INTO `sys_role` VALUES (2, '超级管理员', '所有权限', NULL);
INSERT INTO `sys_role` VALUES (3, '普通用户', '相关业务权限', '2020-07-17 13:59:01');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_resource_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource_relation`;
CREATE TABLE `sys_role_resource_relation` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` int DEFAULT NULL COMMENT '角色id',
  `resource_id` int DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8 COMMENT='角色-权限关联关系表';

-- ----------------------------
-- Records of sys_role_resource_relation
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_resource_relation` VALUES (226, 2, 1);
INSERT INTO `sys_role_resource_relation` VALUES (227, 2, 2);
INSERT INTO `sys_role_resource_relation` VALUES (228, 2, 7);
INSERT INTO `sys_role_resource_relation` VALUES (229, 2, 6);
INSERT INTO `sys_role_resource_relation` VALUES (230, 2, 9);
INSERT INTO `sys_role_resource_relation` VALUES (231, 2, 8);
INSERT INTO `sys_role_resource_relation` VALUES (232, 2, 16);
INSERT INTO `sys_role_resource_relation` VALUES (233, 2, 3);
INSERT INTO `sys_role_resource_relation` VALUES (234, 2, 17);
INSERT INTO `sys_role_resource_relation` VALUES (235, 2, 18);
INSERT INTO `sys_role_resource_relation` VALUES (236, 2, 19);
INSERT INTO `sys_role_resource_relation` VALUES (237, 2, 20);
INSERT INTO `sys_role_resource_relation` VALUES (238, 2, 4);
INSERT INTO `sys_role_resource_relation` VALUES (239, 2, 21);
INSERT INTO `sys_role_resource_relation` VALUES (240, 2, 22);
INSERT INTO `sys_role_resource_relation` VALUES (241, 2, 24);
INSERT INTO `sys_role_resource_relation` VALUES (242, 2, 23);
INSERT INTO `sys_role_resource_relation` VALUES (243, 2, 25);
INSERT INTO `sys_role_resource_relation` VALUES (244, 2, 11);
INSERT INTO `sys_role_resource_relation` VALUES (245, 2, 12);
INSERT INTO `sys_role_resource_relation` VALUES (246, 2, 13);
INSERT INTO `sys_role_resource_relation` VALUES (247, 2, 14);
INSERT INTO `sys_role_resource_relation` VALUES (248, 2, 15);
INSERT INTO `sys_role_resource_relation` VALUES (256, 1, 2);
INSERT INTO `sys_role_resource_relation` VALUES (257, 1, 7);
INSERT INTO `sys_role_resource_relation` VALUES (258, 1, 6);
INSERT INTO `sys_role_resource_relation` VALUES (259, 1, 9);
INSERT INTO `sys_role_resource_relation` VALUES (260, 1, 8);
INSERT INTO `sys_role_resource_relation` VALUES (261, 1, 16);
INSERT INTO `sys_role_resource_relation` VALUES (262, 1, 3);
INSERT INTO `sys_role_resource_relation` VALUES (263, 1, 17);
INSERT INTO `sys_role_resource_relation` VALUES (264, 1, 18);
INSERT INTO `sys_role_resource_relation` VALUES (265, 1, 19);
INSERT INTO `sys_role_resource_relation` VALUES (266, 1, 20);
INSERT INTO `sys_role_resource_relation` VALUES (267, 1, 21);
INSERT INTO `sys_role_resource_relation` VALUES (268, 1, 23);
INSERT INTO `sys_role_resource_relation` VALUES (269, 1, 1);
INSERT INTO `sys_role_resource_relation` VALUES (270, 1, 4);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account` varchar(50) NOT NULL COMMENT '账号',
  `user_name` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '用户密码',
  `last_login_time` datetime DEFAULT NULL COMMENT '上一次登录时间',
  `state` int DEFAULT '1' COMMENT '1、启用 0、禁用',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (6, 'super', '超级管理员', '4297f44b13955235245b2497399d7a93', '2020-07-19 19:11:15', 1, '2020-07-09 10:00:11');
INSERT INTO `sys_user` VALUES (8, 'admin', '管理员', '4297f44b13955235245b2497399d7a93', '2020-07-19 15:02:06', 1, '2020-07-09 10:00:24');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role_relation`;
CREATE TABLE `sys_user_role_relation` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int DEFAULT NULL COMMENT '用户id',
  `role_id` int DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='用户角色关联关系表';

-- ----------------------------
-- Records of sys_user_role_relation
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role_relation` VALUES (94, 8, 1);
INSERT INTO `sys_user_role_relation` VALUES (98, 6, 2);
INSERT INTO `sys_user_role_relation` VALUES (99, 6, 4);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
