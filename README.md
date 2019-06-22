# agile
agile like the Jira

#说明

##业务说明：
1. 任务看板
1.1 新建/修改/删除/查询 CRUD

2. 工作流


--
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


人员组成： 
usr1，usr2，usr3.... -->userGroup -->Role(groupRole/otherRole)

事情拆分量化：project
顶级项目--可能是多个子项目 


JIRA使用OfBiz套件的实体引擎模块与数据库通信，OFBiz是一个非常著名的电子商务平台，是一个非常著名的开源项目，提供了创建基于最新J2EE/XML规范和技术标准，构建大中型企业级、跨平台、跨数据库、跨应用服务器的多层、分布式电子商务类WEB应用系统的框架。 OFBiz最主要的特点是OFBiz提供了一整套的开发基于Java的web应用程序的组件和工具。包括实体引擎, 服务引擎, 消息引擎, 工作流引擎, 规则引擎等。
--------------------- 


CREATE TABLE `cwd_group` (
  `ID` decimal(18,0) NOT NULL,
  `group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lower_group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `active` decimal(9,0) DEFAULT NULL,
  `local` decimal(9,0) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lower_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `group_type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `directory_id` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `uk_group_name_dir_id` (`lower_group_name`,`directory_id`) USING BTREE,
  KEY `idx_group_active` (`lower_group_name`,`active`) USING BTREE,
  KEY `idx_group_dir_id` (`directory_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
