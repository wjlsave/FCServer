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

 Date: 16/07/2020 22:37:12
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
INSERT INTO `sys_api` VALUES (5, 'SysApi/pagelist', '接口分页');
INSERT INTO `sys_api` VALUES (6, 'SysUser/pagelist', '用户列表');
INSERT INTO `sys_api` VALUES (7, 'SysUser/detail', '用户详情');
INSERT INTO `sys_api` VALUES (8, 'SysUser/cut', '用户删除');
INSERT INTO `sys_api` VALUES (9, 'SysUser/add', '用户添加');
INSERT INTO `sys_api` VALUES (10, 'SysUser/edit', '用户修改');
INSERT INTO `sys_api` VALUES (11, 'SysUser/resetpassword', '用户重置密码');
INSERT INTO `sys_api` VALUES (12, 'SysRole/pagelist', '角色列表');
INSERT INTO `sys_api` VALUES (13, 'SysRole/detail', '角色详情');
INSERT INTO `sys_api` VALUES (14, 'SysRole/cut', '角色删除');
INSERT INTO `sys_api` VALUES (15, 'SysRole/add', '角色添加');
INSERT INTO `sys_api` VALUES (16, 'SysRole/edit', '角色编辑');
INSERT INTO `sys_api` VALUES (17, 'SysResource/treelist', '资源树结构');
INSERT INTO `sys_api` VALUES (18, 'SysResource/detail', '资源详情');
INSERT INTO `sys_api` VALUES (19, 'SysResource/cut', '资源删除');
INSERT INTO `sys_api` VALUES (20, 'SysResource/add', '资源添加');
INSERT INTO `sys_api` VALUES (21, 'SysResource/edit', '资源修改');
INSERT INTO `sys_api` VALUES (22, 'SysResource/treedrag', '资源拖拽');
INSERT INTO `sys_api` VALUES (23, 'SysResource/getuserresource', '获取用户资源');
INSERT INTO `sys_api` VALUES (24, 'SysResource/getresourceapis', '获取资源的所需接口');
INSERT INTO `sys_api` VALUES (25, 'SysResource/setapis', '设置资源的支撑接口');
INSERT INTO `sys_api` VALUES (26, 'SysApi/pagelist', '接口列表');
INSERT INTO `sys_api` VALUES (27, 'SysApi/detail', '接口详情');
INSERT INTO `sys_api` VALUES (28, 'SysApi/cut', '接口删除');
INSERT INTO `sys_api` VALUES (29, 'SysApi/add', '接口添加');
INSERT INTO `sys_api` VALUES (30, 'SysApi/edit', '接口修改');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='请求路径';

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
BEGIN;
INSERT INTO `sys_resource` VALUES (1, 'el-icon-s-tools', '系统配置', '/settings', 0, 1, 0);
INSERT INTO `sys_resource` VALUES (2, 'el-icon-user-solid', '用户管理', 'SysUser', 1, 1, 0);
INSERT INTO `sys_resource` VALUES (3, 'el-icon-user', '角色管理', 'SysRole', 1, 1, 1);
INSERT INTO `sys_resource` VALUES (4, 'el-icon-s-grid', '资源管理', 'SysResource', 1, 1, 2);
INSERT INTO `sys_resource` VALUES (6, NULL, '增加用户', 'addSysUser', 2, 2, 1);
INSERT INTO `sys_resource` VALUES (7, NULL, '查看用户', 'seeSysUser', 2, 2, 0);
INSERT INTO `sys_resource` VALUES (8, NULL, '编辑用户', 'editSysUser', 2, 2, 3);
INSERT INTO `sys_resource` VALUES (9, NULL, '删除用户', 'cutSysUser', 2, 2, 2);
INSERT INTO `sys_resource` VALUES (11, 'el-icon-connection', '接口管理', 'SysApi', 1, 1, 3);
INSERT INTO `sys_resource` VALUES (12, NULL, '查看接口', 'seeSysApi', 11, 2, 0);
INSERT INTO `sys_resource` VALUES (13, NULL, '添加接口', 'addSysApi', 11, 2, 0);
INSERT INTO `sys_resource` VALUES (14, NULL, '删除接口', 'cutSysApi', 11, 2, 0);
INSERT INTO `sys_resource` VALUES (15, NULL, '修改接口', 'editSysApi', 11, 2, 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_resource_api_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource_api_relation`;
CREATE TABLE `sys_resource_api_relation` (
  `id` int DEFAULT NULL COMMENT '主键id',
  `resource_id` int DEFAULT NULL COMMENT '请求路径id',
  `api_id` int DEFAULT NULL COMMENT '权限id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='路径权限关联表';

-- ----------------------------
-- Records of sys_resource_api_relation
-- ----------------------------
BEGIN;
INSERT INTO `sys_resource_api_relation` VALUES (NULL, 2, 3);
INSERT INTO `sys_resource_api_relation` VALUES (NULL, 2, 4);
INSERT INTO `sys_resource_api_relation` VALUES (NULL, 7, 3);
INSERT INTO `sys_resource_api_relation` VALUES (NULL, 7, 4);
INSERT INTO `sys_resource_api_relation` VALUES (NULL, 1, 1);
INSERT INTO `sys_resource_api_relation` VALUES (NULL, 1, 3);
INSERT INTO `sys_resource_api_relation` VALUES (NULL, 1, 4);
INSERT INTO `sys_resource_api_relation` VALUES (NULL, 1, 5);
INSERT INTO `sys_resource_api_relation` VALUES (NULL, 12, 27);
INSERT INTO `sys_resource_api_relation` VALUES (NULL, 13, 29);
INSERT INTO `sys_resource_api_relation` VALUES (NULL, 14, 28);
INSERT INTO `sys_resource_api_relation` VALUES (NULL, 15, 1);
INSERT INTO `sys_resource_api_relation` VALUES (NULL, 15, 30);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '管理员', '管理员，拥有所有权限', NULL);
INSERT INTO `sys_role` VALUES (2, '普通用户', '普通用户，拥有部分权限', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COMMENT='角色-权限关联关系表';

-- ----------------------------
-- Records of sys_role_resource_relation
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_resource_relation` VALUES (5, 2, 1);
INSERT INTO `sys_role_resource_relation` VALUES (6, 2, 2);
INSERT INTO `sys_role_resource_relation` VALUES (92, 1, 1);
INSERT INTO `sys_role_resource_relation` VALUES (93, 1, 4);
INSERT INTO `sys_role_resource_relation` VALUES (94, 1, 11);
INSERT INTO `sys_role_resource_relation` VALUES (95, 1, 12);
INSERT INTO `sys_role_resource_relation` VALUES (96, 1, 13);
INSERT INTO `sys_role_resource_relation` VALUES (97, 1, 14);
INSERT INTO `sys_role_resource_relation` VALUES (98, 1, 15);
INSERT INTO `sys_role_resource_relation` VALUES (99, 1, 2);
INSERT INTO `sys_role_resource_relation` VALUES (100, 1, 7);
INSERT INTO `sys_role_resource_relation` VALUES (101, 1, 6);
INSERT INTO `sys_role_resource_relation` VALUES (102, 1, 9);
INSERT INTO `sys_role_resource_relation` VALUES (103, 1, 8);
INSERT INTO `sys_role_resource_relation` VALUES (104, 1, 3);
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (6, 'wjl', 'wujianglun', '4297f44b13955235245b2497399d7a93', NULL, 1, '2020-07-09 10:00:11');
INSERT INTO `sys_user` VALUES (7, 'admin2', 'wujianglun', '4297f44b13955235245b2497399d7a93', NULL, 1, '2020-07-09 10:00:15');
INSERT INTO `sys_user` VALUES (8, 'admin', '洒洒', '4297f44b13955235245b2497399d7a93', '2020-07-16 21:50:21', 1, '2020-07-09 10:00:24');
INSERT INTO `sys_user` VALUES (10, 'admin3', 'wujianglun', '4297f44b13955235245b2497399d7a93', NULL, 1, '2020-07-09 14:34:25');
INSERT INTO `sys_user` VALUES (14, 'admin25', 'wujianglun', '4297f44b13955235245b2497399d7a93', NULL, 1, '2020-07-10 15:34:35');
INSERT INTO `sys_user` VALUES (15, 'acce1', '忘记了', '4297f44b13955235245b2497399d7a93', NULL, 1, '2020-07-10 15:36:48');
INSERT INTO `sys_user` VALUES (16, 'admin256', 'wujianglun', '4297f44b13955235245b2497399d7a93', NULL, 1, '2020-07-10 15:38:16');
INSERT INTO `sys_user` VALUES (17, 'adminx', 'wujianglun', '4297f44b13955235245b2497399d7a93', NULL, 1, '2020-07-10 15:39:04');
INSERT INTO `sys_user` VALUES (18, 'administrator', '王俊凯', '4297f44b13955235245b2497399d7a93', NULL, 1, '2020-07-10 15:47:58');
INSERT INTO `sys_user` VALUES (19, 'admin6', '空间设计', '4297f44b13955235245b2497399d7a93', NULL, 1, '2020-07-10 15:54:32');
INSERT INTO `sys_user` VALUES (20, 'admin69', '空间设计', '4297f44b13955235245b2497399d7a93', '2020-07-10 15:56:43', 1, '2020-07-10 15:56:33');
INSERT INTO `sys_user` VALUES (21, 'admins', '啥都看', '4297f44b13955235245b2497399d7a93', '2020-07-10 15:59:18', 1, '2020-07-10 15:59:22');
INSERT INTO `sys_user` VALUES (22, 'abcd', 'cool', '4297f44b13955235245b2497399d7a93', NULL, 1, '2020-07-10 16:07:39');
INSERT INTO `sys_user` VALUES (23, 'wjlk', 's算了算了', '4297f44b13955235245b2497399d7a93', NULL, 1, '2020-07-10 16:08:46');
INSERT INTO `sys_user` VALUES (24, 'adminaa', '去去去', '4297f44b13955235245b2497399d7a93', NULL, 1, '2020-07-10 17:02:11');
INSERT INTO `sys_user` VALUES (25, 'oksys', '洒洒', '4297f44b13955235245b2497399d7a93', NULL, 1, '2020-07-10 17:03:22');
INSERT INTO `sys_user` VALUES (31, 'assaas', '硕大的', '4297f44b13955235245b2497399d7a93', NULL, 0, '2020-07-10 17:27:22');
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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='用户角色关联关系表';

-- ----------------------------
-- Records of sys_user_role_relation
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role_relation` VALUES (11, 6, 1);
INSERT INTO `sys_user_role_relation` VALUES (12, 6, 2);
INSERT INTO `sys_user_role_relation` VALUES (13, 6, 3);
INSERT INTO `sys_user_role_relation` VALUES (14, 6, 4);
INSERT INTO `sys_user_role_relation` VALUES (28, 7, 1);
INSERT INTO `sys_user_role_relation` VALUES (29, 7, 2);
INSERT INTO `sys_user_role_relation` VALUES (30, 7, 3);
INSERT INTO `sys_user_role_relation` VALUES (31, 7, 4);
INSERT INTO `sys_user_role_relation` VALUES (32, 7, 5);
INSERT INTO `sys_user_role_relation` VALUES (35, 10, 2);
INSERT INTO `sys_user_role_relation` VALUES (36, 10, 8);
INSERT INTO `sys_user_role_relation` VALUES (39, 17, 2);
INSERT INTO `sys_user_role_relation` VALUES (53, 8, 1);
INSERT INTO `sys_user_role_relation` VALUES (54, 14, 2);
INSERT INTO `sys_user_role_relation` VALUES (55, 16, 1);
INSERT INTO `sys_user_role_relation` VALUES (56, 16, 2);
INSERT INTO `sys_user_role_relation` VALUES (57, 23, 2);
INSERT INTO `sys_user_role_relation` VALUES (58, 24, 2);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
