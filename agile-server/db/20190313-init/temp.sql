
# 工作内容表（可能是一个project也可能是多个project组成的事情） t_component
# 项目表 t_project
# 修改记录 t_project_change_log
--------------------------------------
# released	v.	发布; 发行; 释放( release的过去式和过去分词 ); 放开;

# archived v.	存档( archive的过去式和过去分词 );





# 项目表 t_project

CREATE TABLE `t_project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '项目表ID',
    `key` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'project key',
    `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目名称名称-128',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '说明[text]',
  `author_id` bigint(20) DEFAULT NULL COMMENT '作者ID',
    `author_name` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者名称',

    `url` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
    `project_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目类型-128',
  `assignee_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '受让人类型（就是接收”东西“那一方 ）',

  `avatar_id` bigint(20) NOT NULL COMMENT '标识信息的id(主题)',
  `state` int(8) NOT NULL COMMENT '状态',
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '关键字',
    `version` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '版本',


  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='项目表';


# 修改记录 t_project_change_log


# 工作内容表（可能是一个project也可能是多个project组成的事情） t_component

-------------
# 1. 可定制=节点：步骤// 这个节点是用多表  1方案表 2方案详情  （注意：放弃 自关联表这个设计）
# 2. 写在在问题上=目标产出价值：XXX

# 问题 的类型与 项目类型是不同维度的  规则
# 规则表 t_regulation

# 问题表 t_issue
  CREATE TABLE `t_issue` (
     `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '问题表ID',
    `issue_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题表CODE',
     `regulation_id` bigint(20) NOT NULL  COMMENT '规则表ID',
    `project_id` bigint(20) NOT NULL  COMMENT '问题表ID',
    `project_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目表CODE',

    `description` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '摘要[text]',
     `issue_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
     `priority` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优先级',
     `resolution` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '解决方案',
    `workload` int(8) NOT NULL COMMENT '工作量,单位:小时',

    `time_estimate` int(8) NOT NULL COMMENT '估算时间,单位:小时',
    `time_spent` int(8) NOT NULL COMMENT '花费的时间,单位:小时',
    `fix_for` int(8) NOT NULL COMMENT '确定 ... 的日期,单位:小时',

    `state` int(8) NOT NULL COMMENT '状态',

     `archived` bigint(20) NOT NULL  COMMENT '存档',

    `issue_status` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前状态，确定上一步下一步是什么',
    `reporter` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报告给谁',
    `assignee` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '受让人',
    `creator` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',



    `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
    `update_date` timestamp NULL DEFAULT NULL COMMENT '更新时间',
    `due_date` timestamp NULL DEFAULT NULL COMMENT '交期时间',
    `resolution_date` timestamp NULL DEFAULT NULL COMMENT '完成时间',

    `component` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成分; 组分; ',




    PRIMARY KEY (`id`) USING BTREE
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='问题表）';


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







