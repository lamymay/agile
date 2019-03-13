

CREATE TABLE `project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '项目表ID',
    `key` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'project key',

    `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目名称名称-128',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '说明[text]',
  `author_id` bigint(20) DEFAULT NULL COMMENT '作者ID',
    `author_name` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者名称',

    `url` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
    `project_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目类型-128',
  `assignee_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '受让人类型（就是接收”东西“那一方 ）',

  `avatar_id` bigint(20) NOT NULL COMMENT '标识信息的id',
  `status` int(4) NOT NULL DEFAULT '1' COMMENT '文章的模式:0为私有，1为公开，2为仅好友查看',
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '关键字',
    `version` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '版本',


  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='项目表';

# 修改记录

CREATE TABLE `project_change_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '项目数据修改日志表ID',
  `project_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '项目表ID',
    `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '注释',
    `version` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '版本',
    `url` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
  `issue_change_date` timestamp NULL DEFAULT NULL COMMENT '变化时间',

  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='项目数据修改日志表';







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







