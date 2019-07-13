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


 Date: 14/03/2019 17:57:55
*/
----------------------------------------------------------------------------------------------------------
# 1. 可定制=节点：步骤// 这个节点是用多表  1方案表 2方案详情  （注意：放弃 自关联表这个设计）
# 2. 写在在问题上=目标产出价值：XXX

# 问题 的类型与 项目类型是不同维度的  规则
# 看板--画布中一些问题   画布相当于一个project
# 他所想要的一个事情由多个project组成的样子 在项目管理中去操作与呈现
# 系统图标表 字典作用
----------------------------------------------------------------------------------------------------------

#-------------相关表--------------------------
# 工作内容表（可能是一个project也可能是多个project组成的事情） t_component
# 项目表 t_project
# 修改记录 t_project_change_log
# 规则表 t_regulation
# 问题表 t_issue
# 问题状态字典定义


----------------------------------------------------------------------------------------------------------
任务有什么组成
1. 事情
2. 人员
3. 时间

描述业务：
对于事情来说：谁什么时间要做什么，利用什么条件做成什么样子


对于个人来设计：我有什么事情需要做。事情的的最小颗粒（状态，有起始时间，优先级，紧急状态，分配者是谁，所属哪个顶级项目，所属流程中的哪一个流程）
也就是说 人员与事情是关联的，与事情的最小颗粒度是关联的

业务计划：
投入：人员/时间/设备
措施（要求）：怎么做
节点：步骤
目标产出价值：XXX
汇总分析：



用户应该是和项目直接关联的
注意项目需要处理的东西都应该哟从属表去完成
项目的扩展与转移暂时是不考虑的
管家级别操作是需要记录的
----------------------------------------------------------------------------------------------------------

#以下为临时数据
我们公司要用版本控制（SVN）和过程管理（JIRA）相配合开发软件，所以两个都得用喽！
JIRA是集项目计划、任务分配、需求管理、错误跟踪于一体的商业软件。JIRA创建的问题类型包括New Feature、Bug、Task和Improvement四种，还可以自定义，所以它也是过程管理系统。JIRA融合了项目管理、任务管理和缺陷管理，许多著名的开源项目都采用了JIRA。














# 问题状态字典定义
CREATE TABLE `issue_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识表ID',

  `filename` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名称',
  `avatar_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'project/user',
  `status_category` int(8) NULL DEFAULT NULL COMMENT '保留字段,状态分类',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '说明[text]',

  `create_date` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标识表 字典作用' ROW_FORMAT = Dynamic;




# 工作内容表（可能是一个project也可能是多个project组成的事情） t_component
CREATE TABLE `t_project_component` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '项目数据修改日志表ID',
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字符编码,冗余',
  `project_id` bigint(20) NOT NULL  COMMENT '项目表ID',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称-128',
  `state` int(8) NOT NULL COMMENT '状态',
   `area_level` int(3) NULL DEFAULT NULL COMMENT '级别',
   `parent_id` int(11) NOT NULL COMMENT '父节点ID（子项目做级联用）',
  `parent_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父节点名',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '注释',
  `url` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新时间',

  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='工作内容表（可能是一个project也可能是多个project组成的）';

----------------------------------------------------------------------------------------------------------

# 单词
# released	v.	发布; 发行; 释放( release的过去式和过去分词 ); 放开;
# archived v.	存档( archive的过去式和过去分词 );







