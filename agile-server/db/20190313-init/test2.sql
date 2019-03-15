/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : 127.0.0.1:3306
 Source Schema         : test2

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 15/03/2019 16:03:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_avatar
-- ----------------------------
DROP TABLE IF EXISTS `t_avatar`;
CREATE TABLE `t_avatar`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识表ID',
  `filename` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名称',
  `content_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件类型1image/png 2image/svg+xml',
  `avatar_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'project/user',
  `owner` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保留字段',
  `state` int(8) NULL DEFAULT NULL COMMENT '保留字段,状态',
  `create_date` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标识表 字典作用' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_issue
-- ----------------------------
DROP TABLE IF EXISTS `t_issue`;
CREATE TABLE `t_issue`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '问题表ID',
  `issue_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题表CODE',
  `regulation_id` bigint(20) NOT NULL COMMENT '规则表ID',
  `project_id` bigint(20) NOT NULL COMMENT '问题表ID',
  `project_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目表CODE',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '摘要[text]',
  `issue_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `priority` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优先级',
  `resolution` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '解决方案',
  `workload` int(8) NOT NULL COMMENT '工作量,单位:小时',
  `time_estimate` int(8) NOT NULL COMMENT '估算时间,单位:小时',
  `time_spent` int(8) NOT NULL COMMENT '花费的时间,单位:小时',
  `fix_for` int(8) NOT NULL COMMENT '确定 ... 的日期,单位:小时',
  `state` int(8) NOT NULL COMMENT '状态',
  `archived` bigint(20) NOT NULL COMMENT '存档',
  `issue_status` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前状态，确定上一步下一步是什么',
  `reporter` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报告给谁',
  `assignee` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '受让人',
  `creator` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `due_date` timestamp(0) NULL DEFAULT NULL COMMENT '交期时间',
  `resolution_date` timestamp(0) NULL DEFAULT NULL COMMENT '完成时间',
  `component` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成分; 组分; ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '问题表）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_issue_status
-- ----------------------------
DROP TABLE IF EXISTS `t_issue_status`;
CREATE TABLE `t_issue_status`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识表ID',
  `filename` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名称',
  `avatar_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'project/user',
  `status_category` int(8) NULL DEFAULT NULL COMMENT '保留字段,状态分类',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '说明[text]',
  `create_date` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标识表 字典作用' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_issue_step
-- ----------------------------
DROP TABLE IF EXISTS `t_issue_step`;
CREATE TABLE `t_issue_step`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '步骤表ID',
  `entry_id` bigint(20) NOT NULL COMMENT '项目表ID',
  `step_id` bigint(20) NOT NULL COMMENT '项目表ID',
  `action_id` bigint(20) NOT NULL COMMENT '项目表ID',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '步骤名称',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '说明[text]',
  `caller` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `owner_id` bigint(20) NULL DEFAULT NULL COMMENT '作者ID',
  `owner_name` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者名称',
  `state` int(8) NULL DEFAULT NULL COMMENT '状态',
  `start_date` timestamp(0) NULL DEFAULT NULL COMMENT '开始时间',
  `due_date` timestamp(0) NULL DEFAULT NULL COMMENT '交期时间',
  `finish_date` timestamp(0) NULL DEFAULT NULL COMMENT '完成时间',
  `create_date` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '步骤表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_project
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '项目表ID',
  `code` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'project key  冗余',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目名称名称-128',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '说明[text]',
  `author_id` bigint(20) NULL DEFAULT NULL COMMENT '作者ID',
  `author_name` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者名称',
  `url` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `project_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目类型-128',
  `assignee_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '受让人类型（就是接收”东西“那一方 ）',
  `avatar_id` bigint(20) NULL DEFAULT NULL COMMENT '标识信息的id(主题)',
  `state` int(8) NULL DEFAULT NULL COMMENT '状态',
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '关键字',
  `version` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本',
  `create_date` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_project
-- ----------------------------
INSERT INTO `t_project` VALUES (1, '111', '测试项目一', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL);
INSERT INTO `t_project` VALUES (2, 'UUSSSSSSN001', ' uuu防止表单重复提交项目改造 ', 'UU测试', NULL, 'UU叶超', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_project_change_log
-- ----------------------------
DROP TABLE IF EXISTS `t_project_change_log`;
CREATE TABLE `t_project_change_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '项目数据修改日志表ID',
  `project_id` bigint(20) NOT NULL COMMENT '项目表ID',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称-128',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注释',
  `version` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本',
  `url` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `issue_change_date` timestamp(0) NULL DEFAULT NULL COMMENT '变化时间',
  `create_date` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目数据修改日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_project_component
-- ----------------------------
DROP TABLE IF EXISTS `t_project_component`;
CREATE TABLE `t_project_component`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '项目数据修改日志表ID',
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字符编码,冗余',
  `project_id` bigint(20) NOT NULL COMMENT '项目表ID',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称-128',
  `state` int(8) NULL DEFAULT NULL COMMENT '状态',
  `area_level` int(3) NULL DEFAULT NULL COMMENT '级别',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父节点ID（子项目做级联用）',
  `parent_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父节点名',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注释',
  `url` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `create_date` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '工作内容表（可能是一个project也可能是多个project组成的）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_sys_file
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_file`;
CREATE TABLE `t_sys_file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '显示名称',
  `suffix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '后缀',
  `version` int(11) NOT NULL COMMENT '版本信息id',
  `code` int(11) NOT NULL COMMENT '版本号',
  `key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件标识',
  `size` bigint(20) NOT NULL COMMENT '文件大小',
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件存放url',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `check_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '校验方式',
  `check_code` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '校验码',
  `state` bit(1) NOT NULL COMMENT '逻辑删除用的标识',
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统文件记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_sys_log
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_log`;
CREATE TABLE `t_sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作名称',
  `success` int(4) NULL DEFAULT NULL COMMENT '状态码成功与否',
  `from_address` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作者的地址',
  `target_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作资源的目标地址',
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法/动作',
  `parameter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `operator_id` bigint(20) NULL DEFAULT NULL COMMENT '操作者id',
  `operator_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作者名称',
  `note` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作备注',
  `success_quantity` int(11) NULL DEFAULT 0 COMMENT '成功数量  successQuantity=updateQuantity+saveQuantity',
  `update_quantity` int(11) NULL DEFAULT 0 COMMENT '更新数量',
  `insert_quantity` int(11) NULL DEFAULT NULL COMMENT '插入数量',
  `create_date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_log
-- ----------------------------
INSERT INTO `t_sys_log` VALUES (1, '22222', 22222222, '2222', '2222222', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2019-02-02 14:00:32');

-- ----------------------------
-- Table structure for t_sys_user_group
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user_group`;
CREATE TABLE `t_sys_user_group`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户组名',
  `power` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户权限',
  `active` int(4) NULL DEFAULT NULL COMMENT '状态',
  `group_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_user_group
-- ----------------------------
INSERT INTO `t_sys_user_group` VALUES (1, 'a', 'a', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_user_group` VALUES (2, 'b', 'b', NULL, NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
