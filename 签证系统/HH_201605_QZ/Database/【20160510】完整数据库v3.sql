/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : qianzheng

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2016-05-10 17:01:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qz_access
-- ----------------------------
DROP TABLE IF EXISTS `qz_access`;
CREATE TABLE `qz_access` (
  `role_id` smallint(6) NOT NULL,
  `node_id` smallint(6) NOT NULL,
  `level` tinyint(1) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qz_access
-- ----------------------------

-- ----------------------------
-- Table structure for qz_agency
-- ----------------------------
DROP TABLE IF EXISTS `qz_agency`;
CREATE TABLE `qz_agency` (
  `ag_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ag_name` varchar(50) DEFAULT NULL COMMENT '名称',
  `ag_tel` int(11) DEFAULT NULL COMMENT '联系方式',
  `ag_type` tinyint(1) DEFAULT NULL COMMENT '类别：1. 个人,2. 企业/公司',
  `ag_code` varchar(64) DEFAULT NULL COMMENT '证件号：类型为个人时， 表示身份证;类型为企业/公司时， 表示营业执照号',
  `ag_contact` varchar(50) DEFAULT NULL COMMENT '联系人:类型为企业/公司生效',
  `ag_corporation` varchar(50) DEFAULT NULL COMMENT '法人:类型为企业/公司生效',
  `ag_address` varchar(256) DEFAULT NULL COMMENT '地址',
  `ag_zip` int(11) DEFAULT NULL COMMENT '邮编',
  `ag_remarks` text COMMENT '备注',
  `ag_status` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`ag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代理商';

-- ----------------------------
-- Records of qz_agency
-- ----------------------------

-- ----------------------------
-- Table structure for qz_country
-- ----------------------------
DROP TABLE IF EXISTS `qz_country`;
CREATE TABLE `qz_country` (
  `ct_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ct_name` varchar(50) DEFAULT NULL COMMENT '国家名',
  `ct_code` varchar(16) DEFAULT NULL COMMENT '国家缩写',
  `ct_stime` int(11) DEFAULT NULL COMMENT '保存时间',
  `ct_status` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`ct_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='国家';

-- ----------------------------
-- Records of qz_country
-- ----------------------------

-- ----------------------------
-- Table structure for qz_country_schedule
-- ----------------------------
DROP TABLE IF EXISTS `qz_country_schedule`;
CREATE TABLE `qz_country_schedule` (
  `cs_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ct_code` varchar(16) DEFAULT NULL COMMENT '国家缩写',
  `cs_date` int(11) DEFAULT NULL COMMENT '日期',
  `cs_type` tinyint(1) DEFAULT NULL COMMENT '类型:1 工作,2放假',
  PRIMARY KEY (`cs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='假日/工作时间';

-- ----------------------------
-- Records of qz_country_schedule
-- ----------------------------

-- ----------------------------
-- Table structure for qz_finance
-- ----------------------------
DROP TABLE IF EXISTS `qz_finance`;
CREATE TABLE `qz_finance` (
  `fin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ag_id` int(11) DEFAULT NULL COMMENT '代理商外键',
  `fin_amount` decimal(10,0) DEFAULT NULL COMMENT '结算总额',
  `fin_ctime` int(11) DEFAULT NULL COMMENT '结算添加时间',
  `fin_complete_time` int(11) DEFAULT NULL COMMENT '结算完成时间',
  `fin_status` tinyint(1) DEFAULT NULL COMMENT '状态:1 结算中,2 已结清',
  PRIMARY KEY (`fin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='结算';

-- ----------------------------
-- Records of qz_finance
-- ----------------------------

-- ----------------------------
-- Table structure for qz_info_education
-- ----------------------------
DROP TABLE IF EXISTS `qz_info_education`;
CREATE TABLE `qz_info_education` (
  `ied_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ied_school` varchar(50) DEFAULT NULL COMMENT '学校名称',
  `ied_sdate` int(11) DEFAULT NULL COMMENT '开始年月',
  `ied_edate` int(11) DEFAULT NULL COMMENT '结束年月',
  `ied_address` varchar(255) DEFAULT NULL COMMENT '学校地址',
  `ied_zip` varchar(8) DEFAULT NULL COMMENT '学校邮编',
  `ied_profession` varchar(50) DEFAULT NULL COMMENT '专业',
  `ied_certificate` varchar(16) DEFAULT NULL COMMENT '文凭',
  `ied_stime` int(11) DEFAULT NULL COMMENT '保存时间',
  `ied_status` tinyint(4) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`ied_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='万能信息表-学历';

-- ----------------------------
-- Records of qz_info_education
-- ----------------------------

-- ----------------------------
-- Table structure for qz_info_experience
-- ----------------------------
DROP TABLE IF EXISTS `qz_info_experience`;
CREATE TABLE `qz_info_experience` (
  `iex_id` int(11) NOT NULL COMMENT '主键',
  `iex_company` varchar(64) DEFAULT NULL COMMENT '单位名称',
  `iex_leader` varchar(50) DEFAULT NULL COMMENT '领导姓名',
  `iex_sdate` int(11) DEFAULT NULL COMMENT '服务起始年月',
  `iex_edate` int(11) DEFAULT NULL COMMENT '服务截止年月',
  `iex_last_position` varchar(50) DEFAULT NULL COMMENT '离职时职位',
  `iex_address` varchar(255) DEFAULT NULL COMMENT '地址',
  `iex_tel` varchar(14) DEFAULT NULL,
  `iex_stime` int(11) DEFAULT NULL COMMENT '保存时间',
  `iex_status` tinyint(4) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`iex_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='万能信息表-工作经历';

-- ----------------------------
-- Records of qz_info_experience
-- ----------------------------

-- ----------------------------
-- Table structure for qz_info_family
-- ----------------------------
DROP TABLE IF EXISTS `qz_info_family`;
CREATE TABLE `qz_info_family` (
  `if_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `if_relation` varchar(8) DEFAULT NULL COMMENT '关系',
  `if_name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `if_date` int(11) DEFAULT NULL COMMENT '出生日期',
  `if_marriage` tinyint(1) DEFAULT NULL COMMENT '婚姻状态',
  `if_reach_time` int(11) DEFAULT NULL COMMENT '上次去此目的时间:没有去过则为 0 ',
  `if_address` varchar(255) DEFAULT NULL COMMENT '家庭地址',
  `if_stime` int(11) DEFAULT NULL COMMENT '保存时间',
  `if_status` tinyint(4) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`if_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='万能信息表-家庭成员';

-- ----------------------------
-- Records of qz_info_family
-- ----------------------------

-- ----------------------------
-- Table structure for qz_info_main
-- ----------------------------
DROP TABLE IF EXISTS `qz_info_main`;
CREATE TABLE `qz_info_main` (
  `im_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mem_id` int(11) DEFAULT NULL COMMENT '客户ID',
  `im_code` varchar(64) DEFAULT NULL COMMENT '标识',
  `im_value` int(11) DEFAULT NULL COMMENT '值',
  `im_stime` int(11) DEFAULT NULL COMMENT '保存时间',
  `im_status` tinyint(4) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`im_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='万能信息表-主表';

-- ----------------------------
-- Records of qz_info_main
-- ----------------------------

-- ----------------------------
-- Table structure for qz_info_sign_history
-- ----------------------------
DROP TABLE IF EXISTS `qz_info_sign_history`;
CREATE TABLE `qz_info_sign_history` (
  `ish_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mem_id` int(11) DEFAULT NULL COMMENT '客户ID',
  `ish_country` varchar(64) DEFAULT NULL COMMENT '申请国家',
  `ish_date` int(11) DEFAULT NULL COMMENT '申请日期',
  `ish_type` varchar(16) DEFAULT NULL COMMENT '签证类别',
  `ish_place` varchar(255) DEFAULT NULL COMMENT '申请地点',
  `ish_reject` tinyint(1) DEFAULT NULL COMMENT '是否遭拒',
  `ish_reject_reason` text COMMENT '遭拒原因',
  `ish_reach_time` int(11) DEFAULT NULL COMMENT '抵达时间',
  `ish_leave_time` int(11) DEFAULT NULL COMMENT '离境时间',
  `ish_stime` int(11) DEFAULT NULL COMMENT '保存时间',
  `ish_status` tinyint(4) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`ish_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='万能信息表-签证历史表';

-- ----------------------------
-- Records of qz_info_sign_history
-- ----------------------------

-- ----------------------------
-- Table structure for qz_info_sign_reject
-- ----------------------------
DROP TABLE IF EXISTS `qz_info_sign_reject`;
CREATE TABLE `qz_info_sign_reject` (
  `isr_id` int(11) NOT NULL AUTO_INCREMENT,
  `mem_id` int(11) DEFAULT NULL COMMENT '客户ID',
  `isr_country` varchar(64) DEFAULT NULL COMMENT '申请国家',
  `isr_date` int(11) DEFAULT NULL COMMENT '申请日期',
  `isr_type` varchar(16) DEFAULT NULL COMMENT '签证类别',
  `isr_reason` text COMMENT '被拒原因',
  `isr_stime` int(11) DEFAULT NULL COMMENT '保存时间',
  `isr_status` tinyint(4) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`isr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='万能信息表-签证被拒历史';

-- ----------------------------
-- Records of qz_info_sign_reject
-- ----------------------------

-- ----------------------------
-- Table structure for qz_knowledge
-- ----------------------------
DROP TABLE IF EXISTS `qz_knowledge`;
CREATE TABLE `qz_knowledge` (
  `kl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `kl_type` int(11) DEFAULT NULL COMMENT '类型',
  `kl_title` varchar(50) DEFAULT NULL COMMENT '标题',
  `kl_content` text COMMENT '内容',
  `kl_stime` int(11) DEFAULT NULL COMMENT '保存时间',
  `kl_status` int(11) DEFAULT NULL COMMENT '状态',
  `kl_create_uid` int(11) DEFAULT NULL COMMENT '添加人',
  PRIMARY KEY (`kl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='共享知识库';

-- ----------------------------
-- Records of qz_knowledge
-- ----------------------------

-- ----------------------------
-- Table structure for qz_log
-- ----------------------------
DROP TABLE IF EXISTS `qz_log`;
CREATE TABLE `qz_log` (
  `log_key` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `u_key` int(11) DEFAULT NULL COMMENT '操作人外键',
  `g_key` int(11) DEFAULT NULL COMMENT '商家外键',
  `log_ip` int(11) DEFAULT NULL COMMENT 'ip',
  `log_time` int(11) DEFAULT NULL COMMENT '操作时间',
  `log_code` int(11) DEFAULT NULL COMMENT '操作编码',
  `log_url` varchar(255) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`log_key`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qz_log
-- ----------------------------
INSERT INTO `qz_log` VALUES ('1', null, null, '0', '1462870731', '1', 'http://localhost/hh_201605_qz/index.php/index/index.html');
INSERT INTO `qz_log` VALUES ('2', null, null, '0', '1462870731', '0', 'http://localhost/hh_201605_qz/index.php/admin/system_config/index.html');
INSERT INTO `qz_log` VALUES ('3', null, null, '0', '1462870738', '0', 'http://localhost/hh_201605_qz/index.php/admin/system_menu/index.html');
INSERT INTO `qz_log` VALUES ('4', null, null, '0', '1462870739', '0', 'http://localhost/hh_201605_qz/index.php/admin/system_config/index.html');
INSERT INTO `qz_log` VALUES ('5', null, null, '0', '1462870740', '0', 'http://localhost/hh_201605_qz/index.php/admin/access/index.html');
INSERT INTO `qz_log` VALUES ('6', null, null, '0', '1462870741', '0', 'http://localhost/hh_201605_qz/index.php/admin/datebase/index.html');
INSERT INTO `qz_log` VALUES ('7', null, null, '0', '1462870742', '0', 'http://localhost/hh_201605_qz/index.php/admin/datebase/export.html');
INSERT INTO `qz_log` VALUES ('8', null, null, '0', '1462870742', '0', 'http://localhost/hh_201605_qz/index.php/admin/datebase/import.html');
INSERT INTO `qz_log` VALUES ('9', null, null, '0', '1462870743', '0', 'http://localhost/hh_201605_qz/index.php/admin/datebase/index.html');
INSERT INTO `qz_log` VALUES ('10', null, null, '0', '1462870744', '0', 'http://localhost/hh_201605_qz/index.php/admin/access/index.html');
INSERT INTO `qz_log` VALUES ('11', null, null, '0', '1462870744', '0', 'http://localhost/hh_201605_qz/index.php/admin/system_config/index.html');
INSERT INTO `qz_log` VALUES ('12', null, null, '0', '1462870745', '0', 'http://localhost/hh_201605_qz/index.php/admin/system_menu/index.html');
INSERT INTO `qz_log` VALUES ('13', null, null, '0', '1462870746', '0', 'http://localhost/hh_201605_qz/index.php/admin/datebase/index.html');
INSERT INTO `qz_log` VALUES ('14', null, null, '0', '1462870747', '0', 'http://localhost/hh_201605_qz/index.php/admin/datebase/export.html');
INSERT INTO `qz_log` VALUES ('15', null, null, '0', '1462870748', '0', 'http://localhost/hh_201605_qz/index.php/admin/datebase/import.html');
INSERT INTO `qz_log` VALUES ('16', null, null, '0', '1462870749', '0', 'http://localhost/hh_201605_qz/index.php/admin/datebase/index.html');
INSERT INTO `qz_log` VALUES ('17', null, null, '0', '1462870750', '0', 'http://localhost/hh_201605_qz/index.php/admin/access/nodelist.html');
INSERT INTO `qz_log` VALUES ('18', null, null, '0', '1462870751', '0', 'http://localhost/hh_201605_qz/index.php/admin/datebase/index.html');
INSERT INTO `qz_log` VALUES ('19', null, null, '0', '1462870752', '0', 'http://localhost/hh_201605_qz/index.php/admin/access/index.html');
INSERT INTO `qz_log` VALUES ('20', null, null, '0', '1462870752', '0', 'http://localhost/hh_201605_qz/index.php/admin/datebase/index.html');
INSERT INTO `qz_log` VALUES ('21', null, null, '0', '1462870753', '0', 'http://localhost/hh_201605_qz/index.php/admin/access/role_list.html');
INSERT INTO `qz_log` VALUES ('22', null, null, '0', '1462870754', '0', 'http://localhost/hh_201605_qz/index.php/admin/system_config/index.html');
INSERT INTO `qz_log` VALUES ('23', null, null, '0', '1462870755', '0', 'http://localhost/hh_201605_qz/index.php/admin/access/nodelist.html');
INSERT INTO `qz_log` VALUES ('24', null, null, '0', '1462870755', '0', 'http://localhost/hh_201605_qz/index.php/admin/datebase/index.html');
INSERT INTO `qz_log` VALUES ('25', null, null, '0', '1462870756', '0', 'http://localhost/hh_201605_qz/index.php/admin/system_menu/index.html');
INSERT INTO `qz_log` VALUES ('26', null, null, '0', '1462870756', '0', 'http://localhost/hh_201605_qz/index.php/admin/access/role_list.html');
INSERT INTO `qz_log` VALUES ('27', null, null, '0', '1462870757', '0', 'http://localhost/hh_201605_qz/index.php/admin/access/role_list.html');
INSERT INTO `qz_log` VALUES ('28', null, null, '0', '1462870758', '0', 'http://localhost/hh_201605_qz/index.php/admin/access/nodelist.html');
INSERT INTO `qz_log` VALUES ('29', null, null, '0', '1462870758', '0', 'http://localhost/hh_201605_qz/index.php/admin/access/index.html');
INSERT INTO `qz_log` VALUES ('30', null, null, '0', '1462870759', '0', 'http://localhost/hh_201605_qz/index.php/admin/access/role_list.html');
INSERT INTO `qz_log` VALUES ('31', null, null, '0', '1462870760', '0', 'http://localhost/hh_201605_qz/index.php/admin/system_menu/index.html');
INSERT INTO `qz_log` VALUES ('32', null, null, '0', '1462870763', '0', 'http://localhost/hh_201605_qz/index.php/system_menu/auto.html');
INSERT INTO `qz_log` VALUES ('33', null, null, '0', '1462870778', '0', 'http://localhost/hh_201605_qz/index.php/system_menu/auto.html?show_lv=0&module=USER');
INSERT INTO `qz_log` VALUES ('34', null, null, '0', '1462870786', '0', 'http://localhost/hh_201605_qz/index.php/system_menu/auto.html?show_lv=0&module=USER');
INSERT INTO `qz_log` VALUES ('35', null, null, '0', '1462870788', '0', 'http://localhost/hh_201605_qz/index.php/system_menu/auto.html?show_lv=0&module=USER');
INSERT INTO `qz_log` VALUES ('36', null, null, '0', '1462870796', '0', 'http://localhost/hh_201605_qz/index.php/admin/system_menu/index.html');
INSERT INTO `qz_log` VALUES ('37', null, null, '0', '1462870798', '0', 'http://localhost/hh_201605_qz/index.php/system_menu/auto.html');
INSERT INTO `qz_log` VALUES ('38', null, null, '0', '1462870801', '0', 'http://localhost/hh_201605_qz/index.php/system_menu/auto.html');
INSERT INTO `qz_log` VALUES ('39', null, null, '0', '1462870808', '0', 'http://localhost/hh_201605_qz/index.php/admin/system_config/index.html');
INSERT INTO `qz_log` VALUES ('40', null, null, '0', '1462870809', '0', 'http://localhost/hh_201605_qz/index.php/admin/system_menu/index.html');
INSERT INTO `qz_log` VALUES ('41', null, null, '0', '1462870810', '0', 'http://localhost/hh_201605_qz/index.php/admin/access/index.html');
INSERT INTO `qz_log` VALUES ('42', null, null, '0', '1462870810', '0', 'http://localhost/hh_201605_qz/index.php/admin/access/role_list.html');
INSERT INTO `qz_log` VALUES ('43', null, null, '0', '1462870811', '0', 'http://localhost/hh_201605_qz/index.php/admin/access/nodelist.html');
INSERT INTO `qz_log` VALUES ('44', null, null, '0', '1462870829', '0', 'http://localhost/hh_201605_qz/index.php/admin/access/index.html');
INSERT INTO `qz_log` VALUES ('45', null, null, '0', '1462870829', '0', 'http://localhost/hh_201605_qz/index.php/admin/access/role_list.html');
INSERT INTO `qz_log` VALUES ('46', null, null, '0', '1462870830', '0', 'http://localhost/hh_201605_qz/index.php/admin/system_menu/index.html');
INSERT INTO `qz_log` VALUES ('47', null, null, '0', '1462870831', '0', 'http://localhost/hh_201605_qz/index.php/admin/system_config/index.html');
INSERT INTO `qz_log` VALUES ('48', null, null, '0', '1462870832', '0', 'http://localhost/hh_201605_qz/index.php/admin/system_menu/index.html');
INSERT INTO `qz_log` VALUES ('49', null, null, '0', '1462870849', '0', 'http://localhost/hh_201605_qz/index.php/admin/access/index.html');
INSERT INTO `qz_log` VALUES ('50', null, null, '0', '1462870850', '0', 'http://localhost/hh_201605_qz/index.php/admin/access/nodelist.html');
INSERT INTO `qz_log` VALUES ('51', null, null, '0', '1462870892', '0', 'http://localhost/hh_201605_qz/index.php/admin/system_menu/index.html');

-- ----------------------------
-- Table structure for qz_member
-- ----------------------------
DROP TABLE IF EXISTS `qz_member`;
CREATE TABLE `qz_member` (
  `mem_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mem_code` varchar(32) DEFAULT NULL COMMENT '身份证',
  `mem_name` varchar(10) DEFAULT NULL COMMENT '姓名',
  `mem_sex` tinyint(4) DEFAULT NULL COMMENT '性别',
  `mem_face` varchar(255) DEFAULT NULL COMMENT '头像',
  `mem_address` varchar(255) DEFAULT NULL COMMENT '常驻地',
  `mem_passport` varchar(64) DEFAULT NULL COMMENT '护照号码',
  `mem_birthday` int(11) DEFAULT NULL COMMENT '出生年月',
  `mem_mobile` varchar(14) DEFAULT NULL COMMENT '手机号码',
  `mem_remarks` text COMMENT '备注',
  `mem_income_max` int(11) DEFAULT NULL COMMENT '最高收入',
  `mem_income_min` int(11) DEFAULT NULL COMMENT '最低收入',
  `mem_sign` int(11) DEFAULT NULL COMMENT '签证数',
  `or_create_uid` int(11) DEFAULT NULL COMMENT '录入客服',
  `mem_ctime` int(11) DEFAULT NULL COMMENT '添加时间',
  `mem_stime` int(11) DEFAULT NULL COMMENT '保存时间',
  PRIMARY KEY (`mem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户表';

-- ----------------------------
-- Records of qz_member
-- ----------------------------

-- ----------------------------
-- Table structure for qz_member_follow
-- ----------------------------
DROP TABLE IF EXISTS `qz_member_follow`;
CREATE TABLE `qz_member_follow` (
  `mf_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `u_id` int(11) DEFAULT NULL COMMENT '跟进人',
  `mf_time` int(11) DEFAULT NULL COMMENT '跟进时间',
  `mf_contect` text COMMENT '跟进内容',
  `mf_stime` int(11) DEFAULT NULL COMMENT '保存时间',
  `mf_status` tinyint(4) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`mf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='跟进记录';

-- ----------------------------
-- Records of qz_member_follow
-- ----------------------------

-- ----------------------------
-- Table structure for qz_message
-- ----------------------------
DROP TABLE IF EXISTS `qz_message`;
CREATE TABLE `qz_message` (
  `mess_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mess_title` varchar(64) DEFAULT NULL COMMENT '标题',
  `mess_content` text COMMENT '内容',
  `mess_time` int(11) DEFAULT NULL COMMENT '时间',
  `mess_status` tinyint(4) DEFAULT NULL COMMENT '状态',
  `mess_to` tinyint(1) DEFAULT NULL COMMENT '针对用户:1 个人,2 多人',
  PRIMARY KEY (`mess_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息';

-- ----------------------------
-- Records of qz_message
-- ----------------------------

-- ----------------------------
-- Table structure for qz_message_user
-- ----------------------------
DROP TABLE IF EXISTS `qz_message_user`;
CREATE TABLE `qz_message_user` (
  `messu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `u_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `mess_id` int(11) DEFAULT NULL COMMENT '消息外键',
  `messu_read` tinyint(4) DEFAULT NULL COMMENT '是否已读',
  `messu_status` tinyint(4) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`messu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息用户关联表';

-- ----------------------------
-- Records of qz_message_user
-- ----------------------------

-- ----------------------------
-- Table structure for qz_node
-- ----------------------------
DROP TABLE IF EXISTS `qz_node`;
CREATE TABLE `qz_node` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `sort` smallint(6) DEFAULT NULL,
  `pid` smallint(6) NOT NULL,
  `level` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qz_node
-- ----------------------------

-- ----------------------------
-- Table structure for qz_orders
-- ----------------------------
DROP TABLE IF EXISTS `qz_orders`;
CREATE TABLE `qz_orders` (
  `or_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ser_id` int(11) DEFAULT NULL COMMENT '服务ID',
  `or_code` varchar(20) DEFAULT NULL COMMENT '档案单号:国家简称 + 日期 + 序列号 001-999;例  USA20160509001',
  `or_ref_num` int(11) DEFAULT NULL COMMENT '参考号',
  `or_remarks` text COMMENT '备注',
  `or_status` int(11) DEFAULT NULL COMMENT '状态',
  `or_ctime` int(11) DEFAULT NULL COMMENT '录入时间',
  `or_stime` int(11) DEFAULT NULL COMMENT '保存时间',
  `or_expectation` int(11) DEFAULT NULL COMMENT '预计完成日',
  `or_create_uid` int(11) DEFAULT NULL COMMENT '录入客服',
  `or_deal_uid` int(11) DEFAULT NULL COMMENT '操作人员',
  `ag_id` int(11) DEFAULT NULL COMMENT '代理商',
  `or_fee` decimal(10,2) DEFAULT NULL COMMENT '档案单服务费',
  `or_type` varchar(16) DEFAULT NULL COMMENT '签证类别',
  `or_mode` tinyint(1) DEFAULT NULL COMMENT '签证方式:1. 复杂,2.复杂',
  `fin_id` int(11) DEFAULT NULL COMMENT '结算外键:为 0 则为未结算',
  `or_group` varchar(20) DEFAULT NULL COMMENT '团号，为空则表示非组团，组团则保存团号',
  PRIMARY KEY (`or_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='签证档案单';

-- ----------------------------
-- Records of qz_orders
-- ----------------------------

-- ----------------------------
-- Table structure for qz_orders_detail
-- ----------------------------
DROP TABLE IF EXISTS `qz_orders_detail`;
CREATE TABLE `qz_orders_detail` (
  `od_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `or_id` int(11) DEFAULT NULL COMMENT '档案单 ID ',
  `mem_id` int(11) DEFAULT NULL COMMENT '客户ID',
  `od_name` varchar(50) DEFAULT NULL COMMENT '资料栏位',
  `od_content` text COMMENT '资料内容',
  PRIMARY KEY (`od_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='详细资料';

-- ----------------------------
-- Records of qz_orders_detail
-- ----------------------------

-- ----------------------------
-- Table structure for qz_orders_invoice
-- ----------------------------
DROP TABLE IF EXISTS `qz_orders_invoice`;
CREATE TABLE `qz_orders_invoice` (
  `oi_id` int(11) NOT NULL AUTO_INCREMENT,
  `or_id` int(11) DEFAULT NULL COMMENT '档案单 ID ',
  `oi_header` varchar(50) DEFAULT NULL COMMENT '发票抬头',
  `oi_type` varchar(50) DEFAULT NULL COMMENT '发票类型',
  `oi_fee` decimal(10,2) unsigned DEFAULT NULL COMMENT '发票金额',
  `oi_content` text COMMENT '发票内容',
  `oi_remarks` text COMMENT '发票备注',
  `oi_status` tinyint(1) DEFAULT NULL COMMENT '发票状态',
  PRIMARY KEY (`oi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发票申请';

-- ----------------------------
-- Records of qz_orders_invoice
-- ----------------------------

-- ----------------------------
-- Table structure for qz_orders_log
-- ----------------------------
DROP TABLE IF EXISTS `qz_orders_log`;
CREATE TABLE `qz_orders_log` (
  `ol_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `or_id` int(11) DEFAULT NULL COMMENT '档案单ID',
  `ol_code` int(11) DEFAULT NULL COMMENT '操作编号',
  `ol_content` text COMMENT '操作内容:ol_code = 0 时生效',
  `u_id` int(11) DEFAULT NULL COMMENT '操作人',
  `ol_time` int(11) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`ol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='进度记录';

-- ----------------------------
-- Records of qz_orders_log
-- ----------------------------

-- ----------------------------
-- Table structure for qz_orders_member
-- ----------------------------
DROP TABLE IF EXISTS `qz_orders_member`;
CREATE TABLE `qz_orders_member` (
  `om_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `or_id` int(11) DEFAULT NULL COMMENT '档案单 ID ',
  `mem_id` int(11) DEFAULT NULL COMMENT '客户ID',
  `om_detail` text COMMENT '客户资料:序列化存储',
  `om_is_contacts` tinyint(1) DEFAULT '0' COMMENT '是否联系人，0否 1是',
  PRIMARY KEY (`om_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户信息';

-- ----------------------------
-- Records of qz_orders_member
-- ----------------------------

-- ----------------------------
-- Table structure for qz_role
-- ----------------------------
DROP TABLE IF EXISTS `qz_role`;
CREATE TABLE `qz_role` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qz_role
-- ----------------------------

-- ----------------------------
-- Table structure for qz_role_user
-- ----------------------------
DROP TABLE IF EXISTS `qz_role_user`;
CREATE TABLE `qz_role_user` (
  `role_id` mediumint(9) DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qz_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for qz_service
-- ----------------------------
DROP TABLE IF EXISTS `qz_service`;
CREATE TABLE `qz_service` (
  `ser_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ser_country` varchar(50) DEFAULT NULL COMMENT '国家',
  `ser_country_code` varchar(16) DEFAULT NULL COMMENT '国家缩写',
  `ser_deal_time` int(11) DEFAULT NULL COMMENT '办理时长',
  `ser_fee` decimal(10,2) DEFAULT NULL COMMENT '签证费用',
  `ser_type` char(16) DEFAULT NULL COMMENT '签证类型：1旅游观光,2探亲访友,3商务,4留学,5移民,6工作',
  `ser_mode` tinyint(1) DEFAULT NULL COMMENT '签证方式:1. 复杂,2.简单',
  PRIMARY KEY (`ser_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='签证服务';

-- ----------------------------
-- Records of qz_service
-- ----------------------------

-- ----------------------------
-- Table structure for qz_service_detail
-- ----------------------------
DROP TABLE IF EXISTS `qz_service_detail`;
CREATE TABLE `qz_service_detail` (
  `sd_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ser_id` int(11) DEFAULT NULL COMMENT '服务外键',
  `sd_name` varchar(32) DEFAULT NULL COMMENT '栏位名称',
  PRIMARY KEY (`sd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资料栏位';

-- ----------------------------
-- Records of qz_service_detail
-- ----------------------------

-- ----------------------------
-- Table structure for qz_system_config
-- ----------------------------
DROP TABLE IF EXISTS `qz_system_config`;
CREATE TABLE `qz_system_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `title` varchar(32) DEFAULT '' COMMENT '配置标题',
  `name` varchar(32) NOT NULL COMMENT '配置名称',
  `value` text NOT NULL COMMENT '配置值',
  `group` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_id` int(11) NOT NULL,
  `create_date` int(11) NOT NULL,
  `last_update_id` int(11) NOT NULL,
  `last_update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
-- Records of qz_system_config
-- ----------------------------
INSERT INTO `qz_system_config` VALUES ('1', '', 'DEVELOP_MODE', '1', '0', '1', '0', '0', '0', '0');
INSERT INTO `qz_system_config` VALUES ('100', '', 'WEB_SITE_TITLE', '后台', '1', '1', '0', '1459926752', '0', '1459926752');
INSERT INTO `qz_system_config` VALUES ('101', '', 'WEB_SITE_LOGO', 'Uploads/logo/2016-04-06/5704b6dfa9f56.gif', '1', '1', '0', '1459926752', '0', '1459926752');

-- ----------------------------
-- Table structure for qz_system_menu
-- ----------------------------
DROP TABLE IF EXISTS `qz_system_menu`;
CREATE TABLE `qz_system_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级菜单ID',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `url` varchar(127) NOT NULL DEFAULT '' COMMENT '链接地址',
  `icon` varchar(64) NOT NULL COMMENT '图标',
  `dev` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否开发模式可见',
  `ctime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `utime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sort` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `module` varchar(10) NOT NULL COMMENT '分组名，存大写，如ADMIN，USER',
  `node_id` int(11) DEFAULT NULL COMMENT '节点ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of qz_system_menu
-- ----------------------------
INSERT INTO `qz_system_menu` VALUES ('2', '0', '系统', '', 'fa fa-cog', '0', '1459926399', '1459926399', '4', '1', 'ADMIN', '0');
INSERT INTO `qz_system_menu` VALUES ('7', '2', '系统功能', '', 'fa fa-folder-open-o', '0', '1459926399', '1459926399', '0', '1', 'ADMIN', '0');
INSERT INTO `qz_system_menu` VALUES ('9', '2', '数据中心', '', 'fa fa-folder-open-o', '0', '1459926399', '1459926399', '3', '1', 'ADMIN', '0');
INSERT INTO `qz_system_menu` VALUES ('14', '7', '系统设置', 'Admin/SystemConfig/index', 'fa fa-gears', '0', '1459926399', '1459926399', '1', '1', 'ADMIN', '212');
INSERT INTO `qz_system_menu` VALUES ('15', '14', '修改设置', 'Admin/SystemConfig/groupSave', '', '0', '1459926399', '1459926399', '1', '1', 'ADMIN', '288');
INSERT INTO `qz_system_menu` VALUES ('24', '7', '菜单管理', 'Admin/SystemMenu/index', 'fa fa-bars', '0', '1459926399', '1459926399', '3', '1', 'ADMIN', '214');
INSERT INTO `qz_system_menu` VALUES ('25', '24', '添加', 'Admin/SystemMenu/add', '', '0', '1459926399', '1459926399', '1', '1', 'ADMIN', '289');
INSERT INTO `qz_system_menu` VALUES ('26', '24', '编辑', 'Admin/SystemMenu/edit', '', '0', '1459926399', '1459926399', '2', '1', 'ADMIN', '290');
INSERT INTO `qz_system_menu` VALUES ('27', '24', '设置状态', 'Admin/SystemMenu/setStatus', '', '0', '1459926399', '1459926399', '3', '1', 'ADMIN', '291');
INSERT INTO `qz_system_menu` VALUES ('52', '9', '数据字典', 'Admin/Datebase/index', 'fa fa-database', '1', '1459926399', '1459926399', '1', '1', 'ADMIN', '114');
INSERT INTO `qz_system_menu` VALUES ('53', '9', '数据备份', 'Admin/Datebase/export', 'fa fa-copy', '0', '1459926399', '1459926399', '2', '1', 'ADMIN', '115');
INSERT INTO `qz_system_menu` VALUES ('54', '53', '备份', 'Admin/Datebase/do_export', '', '0', '1459926399', '1459926399', '1', '1', 'ADMIN', '120');
INSERT INTO `qz_system_menu` VALUES ('55', '53', '优化表', 'Admin/Datebase/optimize', '', '0', '1459926399', '1459926399', '2', '1', 'ADMIN', '117');
INSERT INTO `qz_system_menu` VALUES ('56', '53', '修复表', 'Admin/Datebase/repair', '', '0', '1459926399', '1459926399', '3', '1', 'ADMIN', '118');
INSERT INTO `qz_system_menu` VALUES ('57', '9', '数据还原', 'Admin/Datebase/import', 'fa fa-refresh', '1', '1459926399', '1459926399', '3', '1', 'ADMIN', '116');
INSERT INTO `qz_system_menu` VALUES ('58', '57', '还原备份', 'Admin/Datebase/do_import', '', '0', '1459926399', '1459926399', '1', '1', 'ADMIN', '121');
INSERT INTO `qz_system_menu` VALUES ('59', '57', '删除备份', 'Admin/Datebase/del', '', '0', '1459926399', '1459926399', '2', '1', 'ADMIN', '119');
INSERT INTO `qz_system_menu` VALUES ('99', '2', '权限管理', '', 'fa fa-eye', '0', '1459926399', '1459926399', '1', '1', 'ADMIN', '0');
INSERT INTO `qz_system_menu` VALUES ('161', '99', '管理员列表', 'Admin/Access/index', 'fa fa-adjust', '0', '1459926399', '1459926399', '0', '1', 'ADMIN', '99');
INSERT INTO `qz_system_menu` VALUES ('162', '99', '角色管理', 'Admin/Access/role_list', 'fa fa-anchor', '0', '1459926399', '1459926399', '0', '1', 'ADMIN', '126');
INSERT INTO `qz_system_menu` VALUES ('163', '99', '节点管理', 'Admin/Access/nodeList', 'fa fa-arrows', '1', '1459926399', '1459926399', '0', '1', 'ADMIN', '105');
INSERT INTO `qz_system_menu` VALUES ('164', '161', '新增管理员', 'Admin/Access/add_admin', 'fa fa-bell', '0', '1459926399', '1459926399', '0', '1', 'ADMIN', '100');
INSERT INTO `qz_system_menu` VALUES ('165', '161', '编辑管理员', 'Admin/Access/edit_admin', 'fa fa-bell-o', '0', '1459926399', '1459926399', '0', '1', 'ADMIN', '101');
INSERT INTO `qz_system_menu` VALUES ('166', '162', '添加角色', 'Admin/Access/addRole', 'fa fa-cab', '0', '1459926399', '1459926399', '0', '1', 'ADMIN', '296');
INSERT INTO `qz_system_menu` VALUES ('167', '162', '编辑角色', 'Admin/Access/editAdmin', 'fa fa-calendar', '0', '1459926399', '1459926399', '0', '1', 'ADMIN', '297');
INSERT INTO `qz_system_menu` VALUES ('170', '163', '编辑节点', 'Admin/Access/editNode', 'fa fa-comment-o', '0', '1459926399', '1459926399', '0', '1', 'ADMIN', '122');
INSERT INTO `qz_system_menu` VALUES ('171', '162', '编辑角色', 'Admin/Access/editRole', 'fa fa-calendar', '0', '1459926399', '1459926399', '0', '1', 'ADMIN', '295');
INSERT INTO `qz_system_menu` VALUES ('172', '163', '添加节点', 'Admin/Access/addNode', 'fa fa-bars', '0', '1459926399', '1459926399', '0', '1', 'ADMIN', '106');
INSERT INTO `qz_system_menu` VALUES ('174', '14', '基本', 'Admin/system_config/index', '', '0', '1459926399', '1459926399', '0', '1', 'ADMIN', '287');
INSERT INTO `qz_system_menu` VALUES ('265', '24', '自动菜单', 'Admin/SystemMenu/auto', '', '0', '1459926399', '1459926399', '0', '1', 'ADMIN', '298');

-- ----------------------------
-- Table structure for qz_user
-- ----------------------------
DROP TABLE IF EXISTS `qz_user`;
CREATE TABLE `qz_user` (
  `u_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `u_name` varchar(50) DEFAULT NULL,
  `u_username` varchar(50) DEFAULT NULL COMMENT '用户id',
  `u_type` tinyint(1) DEFAULT NULL COMMENT '用户类型：\r\n10: 平台管理人员',
  `u_mobile` char(11) DEFAULT NULL COMMENT '手机号码',
  `u_pwd` varchar(50) DEFAULT NULL COMMENT '密码',
  `u_status` int(11) DEFAULT NULL COMMENT '状态',
  `u_leave` tinyint(1) DEFAULT NULL COMMENT '请假状态：1正常，0请假中',
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qz_user
-- ----------------------------
INSERT INTO `qz_user` VALUES ('1', null, 'admin', '10', '', '0c7540eb7e65b553ec1ba6b20de79608', '1', null);

-- ----------------------------
-- Table structure for qz_user_leave
-- ----------------------------
DROP TABLE IF EXISTS `qz_user_leave`;
CREATE TABLE `qz_user_leave` (
  `ul_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `u_id` int(11) DEFAULT NULL COMMENT '请假员工',
  `ul_sdate` int(11) DEFAULT NULL COMMENT '请假开始时间',
  `ul_edate` int(11) DEFAULT NULL COMMENT '请假结束时间',
  `ul_length` int(11) DEFAULT NULL COMMENT '请假时长',
  PRIMARY KEY (`ul_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='请假记录';

-- ----------------------------
-- Records of qz_user_leave
-- ----------------------------
