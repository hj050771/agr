/*
Navicat MySQL Data Transfer

Source Server         : ceshi
Source Server Version : 50717
Source Host           : 180.168.156.212:2132
Source Database       : cssp_test

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-05-11 17:28:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for antiepidemic_workers
-- ----------------------------
DROP TABLE IF EXISTS `antiepidemic_workers`;
CREATE TABLE `antiepidemic_workers` (
  `id` varchar(36) NOT NULL,
  `ep_id` varchar(36) DEFAULT NULL,
  `coo_name` varchar(20) DEFAULT NULL COMMENT '防疫员姓名',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别:0男，1女',
  `birthday` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of antiepidemic_workers
-- ----------------------------

-- ----------------------------
-- Table structure for areas
-- ----------------------------
DROP TABLE IF EXISTS `areas`;
CREATE TABLE `areas` (
  `id` varchar(36) NOT NULL,
  `ep_id` varchar(36) DEFAULT NULL COMMENT '企业id',
  `area_name` varchar(50) DEFAULT NULL COMMENT '区域名称',
  `rank` int(4) DEFAULT NULL COMMENT '排序字段',
  `parent_id` varchar(36) DEFAULT NULL COMMENT '父id',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of areas
-- ----------------------------

-- ----------------------------
-- Table structure for cars
-- ----------------------------
DROP TABLE IF EXISTS `cars`;
CREATE TABLE `cars` (
  `id` varchar(36) NOT NULL,
  `navicert_no` varchar(50) DEFAULT NULL COMMENT '准运证编号',
  `plate_number` varchar(20) DEFAULT NULL COMMENT '车牌号',
  `approval_date` date DEFAULT NULL COMMENT '批准日期',
  `valid_date_from` date DEFAULT NULL COMMENT '准运证有效开始日期',
  `valid_date_to` date DEFAULT NULL COMMENT '准运证有效结束日期',
  `owner_name` varchar(20) DEFAULT NULL COMMENT '所有者名称',
  `max_load` int(11) DEFAULT NULL COMMENT '最大运载量',
  `load_range` varchar(20) DEFAULT NULL COMMENT '运载范围',
  `Issuing_organ` varchar(50) DEFAULT NULL COMMENT '发证机关',
  `unit_name` varchar(20) DEFAULT NULL COMMENT '使用单位名称',
  `station_code` varchar(30) DEFAULT NULL COMMENT '收购站唯一编码',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cars
-- ----------------------------

-- ----------------------------
-- Table structure for check_contents
-- ----------------------------
DROP TABLE IF EXISTS `check_contents`;
CREATE TABLE `check_contents` (
  `id` varchar(36) NOT NULL COMMENT '检查内容',
  `check_content` varchar(300) DEFAULT NULL,
  `rank` int(4) DEFAULT NULL,
  `content_type` tinyint(1) DEFAULT NULL COMMENT '0填空，1选择',
  `option_name` varchar(50) DEFAULT NULL COMMENT '检查选项id',
  `option_val` varchar(10) DEFAULT NULL,
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of check_contents
-- ----------------------------

-- ----------------------------
-- Table structure for check_content_changes
-- ----------------------------
DROP TABLE IF EXISTS `check_content_changes`;
CREATE TABLE `check_content_changes` (
  `id` varchar(36) NOT NULL,
  `ep_id` varchar(36) DEFAULT NULL,
  `check_log_id` varchar(36) DEFAULT NULL COMMENT '检查记录id',
  `check_item_id` varchar(36) DEFAULT NULL COMMENT '检查项id',
  `check_content_id` varchar(36) DEFAULT NULL COMMENT '检查内容id',
  `comments` varchar(500) DEFAULT NULL COMMENT '整改说明',
  `images` varchar(200) DEFAULT NULL COMMENT '照片',
  `satisfaction_degree` tinyint(1) DEFAULT NULL COMMENT '满意度 -1不满意 0一般 1满意',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of check_content_changes
-- ----------------------------

-- ----------------------------
-- Table structure for check_content_options
-- ----------------------------
DROP TABLE IF EXISTS `check_content_options`;
CREATE TABLE `check_content_options` (
  `id` varchar(36) NOT NULL,
  `form_id` varchar(36) DEFAULT NULL COMMENT '表单id',
  `check_content_id` varchar(36) DEFAULT NULL COMMENT '检查内容id',
  `check_item_id` varchar(36) DEFAULT NULL COMMENT '检查项id',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of check_content_options
-- ----------------------------

-- ----------------------------
-- Table structure for check_forms
-- ----------------------------
DROP TABLE IF EXISTS `check_forms`;
CREATE TABLE `check_forms` (
  `id` varchar(36) NOT NULL,
  `form_name` varchar(50) DEFAULT NULL COMMENT '表单名称',
  `check_type_id` varchar(36) DEFAULT NULL,
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `qualified_score` int(4) DEFAULT NULL COMMENT '合格分',
  `c_id` varchar(36) DEFAULT NULL COMMENT '行业分类id',
  `mc_id` varchar(36) DEFAULT NULL COMMENT '行业细化分类id',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of check_forms
-- ----------------------------

-- ----------------------------
-- Table structure for check_form_logs
-- ----------------------------
DROP TABLE IF EXISTS `check_form_logs`;
CREATE TABLE `check_form_logs` (
  `id` varchar(36) NOT NULL,
  `tenant_id` varchar(36) DEFAULT NULL,
  `form_id` varchar(36) DEFAULT NULL,
  `org_id` varchar(36) DEFAULT NULL,
  `org_name` varchar(50) DEFAULT NULL,
  `check_user` varchar(36) DEFAULT NULL,
  `check_user_name` varchar(50) DEFAULT NULL COMMENT '检查人名称',
  `checked_at` datetime DEFAULT NULL,
  `checked_status` int(4) DEFAULT '0' COMMENT '0未开始，1进行中，2已完成',
  `checked_ep_id` varchar(36) DEFAULT NULL COMMENT '被检查企业id',
  `gov_confirm` varchar(10000) DEFAULT NULL COMMENT '执法单位签字确认',
  `ep_confirm` varchar(10000) DEFAULT NULL COMMENT '企业签字确认',
  `check_location` varchar(60) DEFAULT NULL,
  `longitude` varchar(10) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(10) DEFAULT NULL COMMENT '纬度',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of check_form_logs
-- ----------------------------

-- ----------------------------
-- Table structure for check_images
-- ----------------------------
DROP TABLE IF EXISTS `check_images`;
CREATE TABLE `check_images` (
  `id` varchar(32) NOT NULL,
  `check_log_id` varchar(32) DEFAULT NULL,
  `check_item_id` varchar(32) DEFAULT NULL,
  `image_ids` varchar(5000) DEFAULT NULL,
  `tenant_id` varchar(36) DEFAULT NULL,
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of check_images
-- ----------------------------

-- ----------------------------
-- Table structure for check_items
-- ----------------------------
DROP TABLE IF EXISTS `check_items`;
CREATE TABLE `check_items` (
  `id` varchar(36) NOT NULL,
  `item_name` varchar(30) DEFAULT NULL COMMENT '名称',
  `rank` int(4) DEFAULT NULL,
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `need_content` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of check_items
-- ----------------------------

-- ----------------------------
-- Table structure for check_options
-- ----------------------------
DROP TABLE IF EXISTS `check_options`;
CREATE TABLE `check_options` (
  `id` varchar(36) NOT NULL,
  `option_name` varchar(50) DEFAULT NULL COMMENT '选项名称:逗号分隔',
  `option_val` varchar(10) DEFAULT NULL COMMENT '选项值:逗号分隔',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of check_options
-- ----------------------------
INSERT INTO `check_options` VALUES ('018a4713a5014027811740737eee9641', '符合,不符合', '1,0', 'fzqadmin', '2018-05-10 17:36:35', null, null, '1');
INSERT INTO `check_options` VALUES ('01ab3233946d424c8fee577161cd5fd6', '是,否', '1,0', 'fzdwwsjds', '2018-05-10 10:49:57', null, null, '1');
INSERT INTO `check_options` VALUES ('206b33d883dd41f8a8b61224c9d6503e', '全，差，无', '1,0，-1', '1', '2018-03-14 17:01:26', null, null, '1');
INSERT INTO `check_options` VALUES ('48a7d494b1184645a51f9370fabce58a', '齐全，不齐，无', '1,0，-1', 'fsh_tazxq', '2018-04-10 17:17:59', null, null, '1');
INSERT INTO `check_options` VALUES ('a1ef9904254b48b9a66dc3d9d6083cf6', '有，无', '1,0', '1', '2018-03-14 17:00:58', null, null, '1');
INSERT INTO `check_options` VALUES ('c6b5a31065ca4bb49f4f74e8832bcc86', '良好，一般，较差，差', '1,0，-1，-2', '1', '2018-03-14 17:01:15', null, null, '1');

-- ----------------------------
-- Table structure for check_results
-- ----------------------------
DROP TABLE IF EXISTS `check_results`;
CREATE TABLE `check_results` (
  `id` varchar(36) NOT NULL,
  `check_log_id` varchar(36) DEFAULT NULL,
  `check_item_id` varchar(36) DEFAULT NULL,
  `check_content_id` varchar(36) DEFAULT NULL,
  `check_result` int(4) DEFAULT NULL,
  `check_blanks` varchar(500) DEFAULT NULL,
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cr_primary_key_index` (`id`) USING BTREE,
  KEY `cr_foreign_key_index` (`check_log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of check_results
-- ----------------------------

-- ----------------------------
-- Table structure for check_types
-- ----------------------------
DROP TABLE IF EXISTS `check_types`;
CREATE TABLE `check_types` (
  `id` varchar(36) NOT NULL,
  `check_type_name` varchar(30) DEFAULT NULL,
  `rank` int(4) DEFAULT NULL,
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of check_types
-- ----------------------------
INSERT INTO `check_types` VALUES ('1', '日常检查', '1', 'system', '2018-03-02 17:17:43', 'system', '2018-03-02 17:17:49', '1');
INSERT INTO `check_types` VALUES ('2', '专项检查', '2', 'system', '2018-03-02 17:17:43', 'system', '2018-03-02 17:17:49', '1');

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` varchar(36) NOT NULL,
  `ep_id` varchar(36) DEFAULT NULL,
  `rc_id` varchar(36) DEFAULT NULL COMMENT '风险分级ID',
  `customer_name` varchar(50) DEFAULT NULL,
  `customer_phone` varchar(255) DEFAULT NULL COMMENT '客户电话',
  `license_no` varchar(20) DEFAULT NULL COMMENT '营业执照号',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `tenant_id` varchar(36) DEFAULT NULL,
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customers
-- ----------------------------

-- ----------------------------
-- Table structure for dict
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict` (
  `id` varchar(36) NOT NULL,
  `rank` int(11) DEFAULT NULL COMMENT '排序字段',
  `dict_name` varchar(20) DEFAULT NULL COMMENT '字典分类名称',
  `dict_flag` varchar(50) DEFAULT NULL COMMENT '字典分类标识',
  `is_fixed` tinyint(1) DEFAULT NULL COMMENT '是否固定 0不固定 1固定',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dict
-- ----------------------------
INSERT INTO `dict` VALUES ('13c98fe2925349d6a5c840d157cf484c', '9', '标准化养殖场', 'BZHYZ', '0', 'dbfd8fa8a32843afbd33df2696779ea3', '2018-03-19 16:51:49', null, null, '1');
INSERT INTO `dict` VALUES ('563110ae182d49ed9bbaaf79494879a4', '6', 'GMP证书生效范围', 'GMP', '0', '1', '2018-03-13 14:33:57', null, null, '1');
INSERT INTO `dict` VALUES ('59e0bae911a64e448e8b87f4b0e3759f', '1', '兽医资质', 'SYZZ', '0', 'adebe6ea28ef4121846100b854ed96b2', '2018-04-23 13:59:28', null, null, '1');
INSERT INTO `dict` VALUES ('5ee89d2440c34509aee8d8cb9648210c', '20', '客户风险分级情况', 'RCID', '0', '8be751c107d149cd9041d64cf303a8fb', '2018-03-27 16:48:50', null, null, '1');
INSERT INTO `dict` VALUES ('679d54ffb1c94d5d82b09fd222c53adf', '10', '投入品', 'INP_TEST', '0', '1', '2018-03-12 18:53:28', null, null, '0');
INSERT INTO `dict` VALUES ('71bf197d247f404abcccf3a63c3b577f', '10', '畜禽数量单位', 'ANM_UNIT', '0', 'zxquser1', '2018-03-23 10:35:55', 'fbdb29ac76ee4e26889c704e3d99bd15', '2018-03-23 11:08:26', '1');
INSERT INTO `dict` VALUES ('77ed5ad48ad34acbbe5fd242f8fc4742', '8', '三品一标情况', 'SPYB', '0', 'dbfd8fa8a32843afbd33df2696779ea3', '2018-03-19 16:51:06', null, null, '1');
INSERT INTO `dict` VALUES ('82c5efdb61cf4266850ede6cc024f59c', '2', '认证类型', 'CERT', '0', '', '2018-03-08 16:43:27', '1', '2018-03-08 17:55:08', '1');
INSERT INTO `dict` VALUES ('9413891e06ec45d687cc009348cf0523', '11', '出栏（出场）用途', 'EX_PURPOSE', '0', 'fbdb29ac76ee4e26889c704e3d99bd15', '2018-03-23 11:07:07', null, null, '1');
INSERT INTO `dict` VALUES ('dc02a932ae7e4058b5ca67bdf059b7da', '7', '粪污处理模式', 'FECL', '1', 'sdxmadmin', '2018-03-19 16:49:35', '1bf361b7435d4a289556b901ec9b0c98', '2018-05-03 15:33:35', '1');
INSERT INTO `dict` VALUES ('f849062712cb44a48175466ec20e9a91', '1', '投入品类型', 'INP', '1', '', '2018-03-02 13:37:58', '1', '2018-03-09 16:49:49', '1');

-- ----------------------------
-- Table structure for dict_data
-- ----------------------------
DROP TABLE IF EXISTS `dict_data`;
CREATE TABLE `dict_data` (
  `id` varchar(36) NOT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  `dict_flag` varchar(50) DEFAULT NULL COMMENT '字典分类标识',
  `dict_data_name` varchar(50) DEFAULT NULL COMMENT '字典数据名称',
  `dict_data_code` varchar(20) DEFAULT NULL COMMENT '字典数据编码（dict_flag_1）',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dict_data
-- ----------------------------
INSERT INTO `dict_data` VALUES ('13fca8d1e6aa473bbfdcd0c50cd88c3e', null, 'BZHYZ', '国家级', 'BZHYZ_1', '1bf361b7435d4a289556b901ec9b0c98', '2018-05-03 15:36:31', null, null, '1');
INSERT INTO `dict_data` VALUES ('14ace0bc763e482bb4bb884d00b4fed1', null, 'ANM_UNIT', '头', 'ANM_UNIT_1', '1bf361b7435d4a289556b901ec9b0c98', '2018-05-03 15:39:40', null, null, '1');
INSERT INTO `dict_data` VALUES ('16a1cadc6ecd4e63b620d56658e49dff', null, 'RCID', 'C', 'RCID_3', '1bf361b7435d4a289556b901ec9b0c98', '2018-05-03 15:37:43', null, null, '1');
INSERT INTO `dict_data` VALUES ('1e7cd67e1c394fc9b7cc04e9ab823e6b', null, 'FECL', '其他', 'FECL_4', '1bf361b7435d4a289556b901ec9b0c98', '2018-05-03 15:33:22', null, null, '1');
INSERT INTO `dict_data` VALUES ('5603f4d6d35b41e1a63e4fd8e3756483', null, 'BZHYZ', '省级', 'BZHYZ_2', '1bf361b7435d4a289556b901ec9b0c98', '2018-05-03 15:36:36', null, null, '1');
INSERT INTO `dict_data` VALUES ('67579cc6153c435abfa4e2eee85ac896', null, 'SPYB', '无公害畜产品', 'SPYB_1', '1bf361b7435d4a289556b901ec9b0c98', '2018-05-03 15:34:16', null, null, '1');
INSERT INTO `dict_data` VALUES ('7cb31abb45f94cf88a15b33885529b17', null, 'RCID', 'A', 'RCID_1', '1bf361b7435d4a289556b901ec9b0c98', '2018-05-03 15:37:35', null, null, '1');
INSERT INTO `dict_data` VALUES ('802ffe36051e433d8d098605522bb8dd', null, 'ANM_UNIT', '只', 'ANM_UNIT_2', '1bf361b7435d4a289556b901ec9b0c98', '2018-05-03 15:39:44', null, null, '1');
INSERT INTO `dict_data` VALUES ('9b0f8d35d2934035be1238e2bc78b667', null, 'ANM_UNIT', '匹', 'ANM_UNIT_3', '1bf361b7435d4a289556b901ec9b0c98', '2018-05-03 15:39:50', null, null, '1');
INSERT INTO `dict_data` VALUES ('a4f27e1cc32b42c2b65b47a6a3cb5f27', null, 'FECL', '制取沼气', 'FECL_2', '1bf361b7435d4a289556b901ec9b0c98', '2018-05-03 15:32:59', null, null, '1');
INSERT INTO `dict_data` VALUES ('acdeed08cebe4dc88c33e70b013f08f6', null, 'RCID', 'B', 'RCID_2', '1bf361b7435d4a289556b901ec9b0c98', '2018-05-03 15:37:39', null, null, '1');
INSERT INTO `dict_data` VALUES ('ad034b4c5db54b9c977d22e8179294a9', null, 'FECL', '还田', 'FECL_1', '1bf361b7435d4a289556b901ec9b0c98', '2018-05-03 15:32:35', null, null, '1');
INSERT INTO `dict_data` VALUES ('d7d1f43a28e54f2a8d13d85788d2b3ac', null, 'SPYB', '有机畜产品', 'SPYB_3', '1bf361b7435d4a289556b901ec9b0c98', '2018-05-03 15:34:36', null, null, '1');
INSERT INTO `dict_data` VALUES ('de071149d7fb4c7480ca4dd0c42c5f2f', null, 'FECL', '制造有机肥', 'FECL_3', '1bf361b7435d4a289556b901ec9b0c98', '2018-05-03 15:33:14', null, null, '1');
INSERT INTO `dict_data` VALUES ('e55c8be3545a48e7b17cc7e00abc4844', null, 'SPYB', '地理标识畜产品', 'SPYB_4', '1bf361b7435d4a289556b901ec9b0c98', '2018-05-03 15:35:02', null, null, '1');
INSERT INTO `dict_data` VALUES ('f8589eaa201d4dbdb5fa502acc93c4bf', null, 'BZHYZ', '市级', 'BZHYZ_3', '1bf361b7435d4a289556b901ec9b0c98', '2018-05-03 15:36:43', null, null, '1');
INSERT INTO `dict_data` VALUES ('fa167cc1db6644b78666345cddd7db44', null, 'SPYB', '绿色畜产品', 'SPYB_2', '1bf361b7435d4a289556b901ec9b0c98', '2018-05-03 15:34:27', null, null, '1');

-- ----------------------------
-- Table structure for disease
-- ----------------------------
DROP TABLE IF EXISTS `disease`;
CREATE TABLE `disease` (
  `id` varchar(36) NOT NULL,
  `ep_id` varchar(36) DEFAULT NULL COMMENT '企业id',
  `disease_name` varchar(20) DEFAULT NULL COMMENT '疫病名称',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of disease
-- ----------------------------

-- ----------------------------
-- Table structure for disease_major_categories
-- ----------------------------
DROP TABLE IF EXISTS `disease_major_categories`;
CREATE TABLE `disease_major_categories` (
  `id` varchar(36) NOT NULL,
  `disease_id` varchar(36) DEFAULT NULL COMMENT '疫病id',
  `mc_id` varchar(36) DEFAULT NULL COMMENT '细化分类id',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of disease_major_categories
-- ----------------------------

-- ----------------------------
-- Table structure for disease_vaccines
-- ----------------------------
DROP TABLE IF EXISTS `disease_vaccines`;
CREATE TABLE `disease_vaccines` (
  `id` varchar(36) NOT NULL,
  `ep_id` varchar(36) DEFAULT NULL COMMENT '企业id',
  `disease_id` varchar(36) DEFAULT NULL COMMENT '疫病id',
  `inputs_id` varchar(36) DEFAULT NULL COMMENT '投入品id',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of disease_vaccines
-- ----------------------------

-- ----------------------------
-- Table structure for electronic_certificate
-- ----------------------------
DROP TABLE IF EXISTS `electronic_certificate`;
CREATE TABLE `electronic_certificate` (
  `id` varchar(36) NOT NULL COMMENT '检疫证号',
  `outputs_id` varchar(36) DEFAULT NULL COMMENT '出场关联id',
  `distribution_id` varchar(36) DEFAULT NULL COMMENT '分销证号',
  `animalsource` varchar(20) DEFAULT NULL COMMENT '货主',
  `phone` varchar(15) DEFAULT NULL COMMENT '货主联系电话',
  `clinic_phone` varchar(15) DEFAULT NULL COMMENT '卫生监督所电话',
  `leavelocal` varchar(100) DEFAULT NULL COMMENT '起运地',
  `arrivallocal` varchar(100) DEFAULT NULL COMMENT '到达地',
  `purpose` varchar(5) DEFAULT NULL COMMENT '用途',
  `sort` varchar(50) DEFAULT NULL COMMENT '种类名称',
  `sort_id` varchar(36) DEFAULT NULL COMMENT '种类id',
  `num` int(11) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL COMMENT '单位',
  `carrier` varchar(20) DEFAULT NULL COMMENT '承运人',
  `carrier_phone` varchar(15) DEFAULT NULL COMMENT '承运人联系电话',
  `carry_way` tinyint(1) DEFAULT NULL COMMENT '运载方式',
  `origin` varchar(30) DEFAULT NULL COMMENT '产地',
  `carry_no` varchar(30) DEFAULT NULL COMMENT '运载牌号',
  `ear_tag` varchar(2000) DEFAULT NULL COMMENT '耳标号',
  `ac_ear_tag` varchar(2000) DEFAULT NULL COMMENT '附件耳标号',
  `disinfected_type` tinyint(1) DEFAULT NULL COMMENT '消毒类型',
  `valid_time` varchar(5) DEFAULT NULL COMMENT '有效时间',
  `veterinarian` varchar(30) DEFAULT NULL COMMENT '兽医签名',
  `issue_time` varchar(12) DEFAULT NULL COMMENT '签发时间',
  `quarantine_no` varchar(36) DEFAULT NULL COMMENT '检疫标志号',
  `certified_by` varchar(30) DEFAULT NULL COMMENT '出证单位',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(36) DEFAULT NULL COMMENT '创建人',
  `is_province` tinyint(1) DEFAULT NULL COMMENT '标识省内外',
  `update_user` varchar(36) DEFAULT NULL COMMENT '修改人',
  `certify_type` tinyint(1) DEFAULT NULL COMMENT '出证类型 1:动物A 2:动物B 3:产品A 4:产品B',
  `certify_status` tinyint(1) DEFAULT NULL COMMENT '产品B出证类型 1:正常出证 2:分销换证',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `print_status` tinyint(1) DEFAULT '0' COMMENT '打印状态',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of electronic_certificate
-- ----------------------------

-- ----------------------------
-- Table structure for enterprises
-- ----------------------------
DROP TABLE IF EXISTS `enterprises`;
CREATE TABLE `enterprises` (
  `id` varchar(36) NOT NULL,
  `org_id` varchar(36) DEFAULT NULL COMMENT '组织id',
  `ep_name` varchar(255) DEFAULT NULL COMMENT '企业名称',
  `address` varchar(255) DEFAULT NULL,
  `c_id` varchar(36) DEFAULT NULL COMMENT '行业id',
  `mc_id` varchar(36) DEFAULT NULL COMMENT '行业细化分类id',
  `certificate` varchar(100) DEFAULT NULL COMMENT '合格证',
  `breeding_code` varchar(20) DEFAULT NULL COMMENT '养殖代码',
  `dict_data_fwcl` varchar(20) DEFAULT NULL COMMENT '粪污处理方式',
  `dict_data_spyb` varchar(20) DEFAULT NULL COMMENT '三品一标',
  `dict_data_bzhyzc` varchar(20) DEFAULT NULL COMMENT '标准化养殖场',
  `dict_data_tzlx` varchar(20) DEFAULT NULL COMMENT '屠宰类型',
  `city_code` varchar(20) DEFAULT NULL COMMENT '市编码',
  `city` varchar(50) DEFAULT NULL,
  `county_code` varchar(20) DEFAULT NULL COMMENT '区/县编码',
  `county` varchar(50) DEFAULT NULL,
  `town_code` varchar(20) DEFAULT NULL COMMENT '乡/镇编码',
  `year_output_value` varchar(20) DEFAULT NULL COMMENT '年产值',
  `design_pattern` varchar(20) DEFAULT NULL COMMENT '设计规模',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `lat` decimal(9,6) DEFAULT NULL COMMENT '纬度',
  `lng` decimal(9,6) DEFAULT NULL COMMENT '经度',
  `rc_id` varchar(36) DEFAULT NULL COMMENT '风险分级code',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of enterprises
-- ----------------------------

-- ----------------------------
-- Table structure for enterprise_major_category
-- ----------------------------
DROP TABLE IF EXISTS `enterprise_major_category`;
CREATE TABLE `enterprise_major_category` (
  `id` varchar(36) NOT NULL,
  `ep_id` varchar(36) DEFAULT NULL,
  `mc_id` varchar(36) DEFAULT NULL,
  `mc_name` varchar(50) DEFAULT NULL COMMENT '细化分类名称',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `tenant_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of enterprise_major_category
-- ----------------------------

-- ----------------------------
-- Table structure for epidemic_preventions_monthly
-- ----------------------------
DROP TABLE IF EXISTS `epidemic_preventions_monthly`;
CREATE TABLE `epidemic_preventions_monthly` (
  `id` varchar(36) NOT NULL,
  `ep_id` varchar(36) DEFAULT NULL COMMENT '企业id',
  `division_id` varchar(36) DEFAULT NULL COMMENT '行政区划id',
  `vaccines_id` varchar(36) DEFAULT NULL COMMENT '疫苗id',
  `use_quantity` decimal(12,2) DEFAULT NULL COMMENT '使用量',
  `immune_quantity` decimal(12,2) DEFAULT NULL COMMENT '免疫量',
  `mc_id` varchar(36) DEFAULT NULL COMMENT '细化分类id（猪、牛、羊）',
  `report_status` tinyint(1) DEFAULT NULL COMMENT '上报状态0：未上报 1:已上报',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of epidemic_preventions_monthly
-- ----------------------------

-- ----------------------------
-- Table structure for epidemic_preventions_weekly
-- ----------------------------
DROP TABLE IF EXISTS `epidemic_preventions_weekly`;
CREATE TABLE `epidemic_preventions_weekly` (
  `id` varchar(36) NOT NULL,
  `ep_id` varchar(36) DEFAULT NULL COMMENT '企业id',
  `division_id` varchar(36) DEFAULT NULL COMMENT '行政区划id',
  `vaccines_id` varchar(36) DEFAULT NULL COMMENT '疫苗id',
  `use_quantity` decimal(12,2) DEFAULT NULL COMMENT '使用量',
  `immune_quantity` decimal(12,2) DEFAULT NULL COMMENT '免疫量',
  `expectation_quantity` decimal(12,2) DEFAULT NULL COMMENT '应免数量',
  `process` decimal(3,2) DEFAULT NULL COMMENT '免疫进展',
  `mc_id` varchar(36) DEFAULT NULL COMMENT '细化分类id（猪、牛、羊）',
  `report_status` tinyint(1) DEFAULT NULL COMMENT '上报状态0:未上报 1:已上报',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of epidemic_preventions_weekly
-- ----------------------------

-- ----------------------------
-- Table structure for ep_licenses
-- ----------------------------
DROP TABLE IF EXISTS `ep_licenses`;
CREATE TABLE `ep_licenses` (
  `id` varchar(36) NOT NULL,
  `ep_id` varchar(36) DEFAULT NULL COMMENT '企业id',
  `license_name` varchar(50) DEFAULT NULL,
  `license_no` varchar(50) DEFAULT NULL COMMENT '许可证号',
  `license_type` tinyint(4) DEFAULT NULL COMMENT '许可证类型10:饲料生产 11:兽药生产 20:兽药经营',
  `award_date` datetime DEFAULT NULL COMMENT '发证日期',
  `validity_period` datetime DEFAULT NULL COMMENT '有效期',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ep_licenses
-- ----------------------------

-- ----------------------------
-- Table structure for expectation_quantity
-- ----------------------------
DROP TABLE IF EXISTS `expectation_quantity`;
CREATE TABLE `expectation_quantity` (
  `id` varchar(36) DEFAULT NULL,
  `report_id` varchar(36) DEFAULT NULL,
  `disease_id` varchar(36) DEFAULT NULL,
  `expectation_quantity` decimal(12,2) DEFAULT NULL,
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of expectation_quantity
-- ----------------------------

-- ----------------------------
-- Table structure for gmp
-- ----------------------------
DROP TABLE IF EXISTS `gmp`;
CREATE TABLE `gmp` (
  `id` varchar(36) NOT NULL,
  `ep_id` varchar(36) DEFAULT NULL COMMENT '企业ID',
  `gmp_no` varchar(50) DEFAULT NULL,
  `gmp_scope` varchar(100) DEFAULT NULL COMMENT 'GMP认证范围',
  `effect_date` date DEFAULT NULL COMMENT '生效日期',
  `expiry_date` date DEFAULT NULL COMMENT '失效日期',
  `tenant_id` varchar(36) DEFAULT NULL,
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gmp
-- ----------------------------

-- ----------------------------
-- Table structure for immune_infos
-- ----------------------------
DROP TABLE IF EXISTS `immune_infos`;
CREATE TABLE `immune_infos` (
  `id` varchar(36) NOT NULL,
  `ep_id` varchar(36) DEFAULT NULL COMMENT '企业id',
  `mc_id` varchar(36) DEFAULT NULL COMMENT '免疫对象id',
  `immune_time` datetime DEFAULT NULL COMMENT '免疫时间',
  `inputs_id` varchar(36) DEFAULT NULL COMMENT '投入品id',
  `immune_quantity` decimal(12,2) DEFAULT NULL COMMENT '免疫数量',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of immune_infos
-- ----------------------------

-- ----------------------------
-- Table structure for immune_quantity
-- ----------------------------
DROP TABLE IF EXISTS `immune_quantity`;
CREATE TABLE `immune_quantity` (
  `id` varchar(36) NOT NULL,
  `report_id` varchar(36) DEFAULT NULL COMMENT '报告id',
  `inputs_id` varchar(36) DEFAULT NULL,
  `mc_id` varchar(36) DEFAULT NULL COMMENT '细化分类id（对应major_categories表id）',
  `mc_name` varchar(50) DEFAULT NULL COMMENT '细化分类名称（猪、牛、羊）',
  `immune_quanity` decimal(12,0) DEFAULT NULL COMMENT '免疫数量',
  `expectation_quantity` decimal(12,2) DEFAULT NULL COMMENT '应免数量',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of immune_quantity
-- ----------------------------

-- ----------------------------
-- Table structure for industry_categories
-- ----------------------------
DROP TABLE IF EXISTS `industry_categories`;
CREATE TABLE `industry_categories` (
  `id` varchar(36) NOT NULL,
  `c_name` varchar(50) DEFAULT NULL COMMENT '行业名称(如：养殖、种植、水产)',
  `c_code` varchar(50) DEFAULT NULL COMMENT '行业编码(如：livestock、plat、aquatic)',
  `rank` int(4) DEFAULT NULL COMMENT '排序字段',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '是否有效:1有效，0无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of industry_categories
-- ----------------------------
INSERT INTO `industry_categories` VALUES ('0a476f8eccb844ed9c28429e97d0e271', '乳业', 'dairy', null, '3c9a6c92ae6b4163a881e042672e4bc0', '2018-04-09 13:30:12', null, null, '1');
INSERT INTO `industry_categories` VALUES ('1b12ae73c54149899ef66312dc7712cb', '屠宰', 'slaughter', null, '1', '2018-03-02 13:34:19', null, null, '1');
INSERT INTO `industry_categories` VALUES ('87666a5975764ccc9b5b0136264728cc', '经营', 'management', null, '1', '2018-03-02 13:33:55', null, null, '1');
INSERT INTO `industry_categories` VALUES ('aee8d777ece843d98a4ec79828114e71', '养殖', 'breeding', null, '1', '2018-03-02 13:23:29', null, null, '1');
INSERT INTO `industry_categories` VALUES ('b01ab303d2084b6889fb7a3629803a60', '无害化处理厂', 'nonharmful_disposal', null, '', '2018-03-08 18:40:58', '1', '2018-03-16 09:55:39', '1');
INSERT INTO `industry_categories` VALUES ('df0e984606454ecdba2a5dccd9e284e4', '检测机构', 'detection_org', null, 'adebe6ea28ef4121846100b854ed96b2', '2018-04-25 10:24:46', null, null, '1');
INSERT INTO `industry_categories` VALUES ('e966e2f5d783406ca0242c77069d85dd', '生产', 'production', null, '1', '2018-03-02 13:28:17', null, null, '1');
INSERT INTO `industry_categories` VALUES ('f2722a57812f4f2da0ead015e545b2c2', '种畜禽', 'livestock', null, '1', '2018-03-02 13:25:18', null, null, '1');
INSERT INTO `industry_categories` VALUES ('fc7c10a3c685408dafab590f6c354b5c', '诊疗机构', 'diagnosis_org', null, 'adebe6ea28ef4121846100b854ed96b2', '2018-04-25 10:22:50', null, null, '1');

-- ----------------------------
-- Table structure for inputs
-- ----------------------------
DROP TABLE IF EXISTS `inputs`;
CREATE TABLE `inputs` (
  `id` varchar(36) NOT NULL,
  `ep_id` varchar(36) DEFAULT NULL,
  `c_id` varchar(36) DEFAULT NULL COMMENT '行业分类id',
  `mc_id` varchar(36) DEFAULT NULL COMMENT '行业细化分类id',
  `mc_code` varchar(50) DEFAULT NULL COMMENT '行业细分分类编码',
  `inputs_name` varchar(200) DEFAULT NULL COMMENT '投入品名称',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `feed` tinyint(1) DEFAULT NULL COMMENT '1:饲料  0:兽药'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inputs
-- ----------------------------

-- ----------------------------
-- Table structure for inputs_acquisition
-- ----------------------------
DROP TABLE IF EXISTS `inputs_acquisition`;
CREATE TABLE `inputs_acquisition` (
  `id` varchar(36) NOT NULL,
  `ep_id` varchar(36) DEFAULT NULL COMMENT '企业id',
  `inputs_id` varchar(36) DEFAULT NULL COMMENT '投入品id',
  `inputs_no` varchar(40) DEFAULT NULL COMMENT '产品批号',
  `supplier_id` varchar(36) DEFAULT NULL COMMENT '供应商id',
  `quantity` decimal(12,2) DEFAULT NULL COMMENT '数量',
  `amount` decimal(12,2) DEFAULT NULL COMMENT '金额',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '入库时间',
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tenant_id` varchar(36) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inputs_acquisition
-- ----------------------------

-- ----------------------------
-- Table structure for inputs_consumptions
-- ----------------------------
DROP TABLE IF EXISTS `inputs_consumptions`;
CREATE TABLE `inputs_consumptions` (
  `id` varchar(36) NOT NULL,
  `ep_id` varchar(36) DEFAULT NULL,
  `mc_id` varchar(36) DEFAULT NULL COMMENT '投入品使用对象id',
  `mc_code` varchar(50) DEFAULT NULL COMMENT '饲料行业细化分类编码(如：livestock_pig、livestock_cattle、livestock_sheep)',
  `inputs_id` varchar(36) DEFAULT NULL,
  `quantity` decimal(12,2) DEFAULT NULL,
  `YEAR` int(11) DEFAULT NULL COMMENT '年份',
  `month` int(2) DEFAULT NULL COMMENT '月份',
  `week` int(2) DEFAULT NULL COMMENT '周次',
  `report_status` tinyint(1) DEFAULT NULL COMMENT '上报状态:0:未上报 1:已上报',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `feed` tinyint(1) DEFAULT NULL COMMENT '记录性质0:兽药 1:饲料',
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inputs_consumptions
-- ----------------------------

-- ----------------------------
-- Table structure for inputs_production
-- ----------------------------
DROP TABLE IF EXISTS `inputs_production`;
CREATE TABLE `inputs_production` (
  `id` varchar(36) NOT NULL,
  `ep_id` varchar(36) DEFAULT NULL,
  `inputs_id` varchar(36) DEFAULT NULL COMMENT '投入品id',
  `output` decimal(12,2) DEFAULT NULL COMMENT '产量',
  `output_value` decimal(12,2) DEFAULT NULL COMMENT '产值',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inputs_production
-- ----------------------------

-- ----------------------------
-- Table structure for inputs_sale
-- ----------------------------
DROP TABLE IF EXISTS `inputs_sale`;
CREATE TABLE `inputs_sale` (
  `id` varchar(36) NOT NULL,
  `ep_id` varchar(36) DEFAULT NULL,
  `inputs_id` varchar(36) DEFAULT NULL COMMENT '投入品id',
  `quantity` decimal(12,2) DEFAULT NULL COMMENT '数量',
  `amount` decimal(12,2) DEFAULT NULL COMMENT '金额',
  `customer_id` varchar(36) DEFAULT NULL,
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inputs_sale
-- ----------------------------

-- ----------------------------
-- Table structure for inputs_stock
-- ----------------------------
DROP TABLE IF EXISTS `inputs_stock`;
CREATE TABLE `inputs_stock` (
  `id` varchar(36) NOT NULL,
  `ep_id` varchar(36) DEFAULT NULL,
  `inputs_id` varchar(36) DEFAULT NULL COMMENT '投入品id',
  `stock_quantity` decimal(12,2) DEFAULT NULL COMMENT '库存数量',
  `history_stock_quantity` decimal(12,2) DEFAULT NULL COMMENT '历史库存数量',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inputs_stock
-- ----------------------------

-- ----------------------------
-- Table structure for livestock_outputs_infos
-- ----------------------------
DROP TABLE IF EXISTS `livestock_outputs_infos`;
CREATE TABLE `livestock_outputs_infos` (
  `id` varchar(36) NOT NULL,
  `ep_id` varchar(36) DEFAULT NULL,
  `c_code` varchar(50) DEFAULT NULL COMMENT '行业编码(如：livestock、plat、aquatic)',
  `animalsource` varchar(20) DEFAULT NULL COMMENT '货主-principal_name',
  `telephone` varchar(20) DEFAULT NULL COMMENT '联系电话-principal_phone',
  `output_date` datetime DEFAULT NULL COMMENT '出栏日期',
  `sort_id` varchar(36) DEFAULT NULL COMMENT '动物种类-细化分类id',
  `sort` varchar(50) DEFAULT NULL COMMENT '动物种类-mc_name',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `unit_code` varchar(20) DEFAULT NULL COMMENT '单位-字典数据code',
  `unit` varchar(50) DEFAULT NULL COMMENT '单位-dict_data_name',
  `quarantine_no` varchar(20) DEFAULT NULL COMMENT '检疫证号',
  `price` decimal(12,2) DEFAULT NULL COMMENT '总价',
  `customer_id` varchar(36) DEFAULT NULL COMMENT '客户id',
  `leavelocal` varchar(50) DEFAULT NULL COMMENT '起运地区',
  `startingpoint` varchar(100) DEFAULT NULL COMMENT '启运地区划码',
  `arrivallocal` varchar(50) DEFAULT NULL COMMENT '到达地点',
  `endingpoint` varchar(100) DEFAULT NULL COMMENT '到达地点区划',
  `in_the_province` tinyint(1) DEFAULT NULL COMMENT '是否省内（1：省内；0：省外）',
  `purpose` varchar(50) DEFAULT NULL COMMENT '用途-dict_data_code',
  `purpose_code` varchar(20) DEFAULT NULL COMMENT '用途-字典数据code',
  `report_status` tinyint(1) DEFAULT NULL COMMENT '检疫申报状态:0:未申报 1:已申报',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of livestock_outputs_infos
-- ----------------------------

-- ----------------------------
-- Table structure for livestock_stocks_infos
-- ----------------------------
DROP TABLE IF EXISTS `livestock_stocks_infos`;
CREATE TABLE `livestock_stocks_infos` (
  `id` varchar(36) NOT NULL,
  `ep_id` varchar(36) DEFAULT NULL,
  `ep_name` varchar(100) DEFAULT NULL COMMENT '企业名称',
  `area_id` varchar(36) DEFAULT NULL,
  `area_name` varchar(50) DEFAULT NULL COMMENT '区域名称',
  `quantity` int(11) DEFAULT NULL COMMENT '存栏量',
  `mc_id` varchar(36) DEFAULT NULL COMMENT '行业细化分类id',
  `report_status` tinyint(1) DEFAULT NULL COMMENT '上报状态:0:未上报 1:已上报',
  `male_quantity` decimal(12,2) DEFAULT NULL COMMENT '公数量',
  `female_quantity` decimal(12,2) DEFAULT NULL COMMENT '母数量',
  `cover_quantity` decimal(12,2) DEFAULT NULL COMMENT '种畜禽套数量',
  `sale_quantity` decimal(12,2) DEFAULT NULL COMMENT '销售总量',
  `lactation_quantity` decimal(12,0) DEFAULT NULL COMMENT '哺乳类数量',
  `breed_quantity` decimal(12,0) DEFAULT NULL COMMENT '繁殖类数量',
  `nourish_quantity` decimal(12,0) DEFAULT NULL COMMENT '养育类数量',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of livestock_stocks_infos
-- ----------------------------

-- ----------------------------
-- Table structure for lng_lat
-- ----------------------------
DROP TABLE IF EXISTS `lng_lat`;
CREATE TABLE `lng_lat` (
  `county` varchar(255) DEFAULT NULL,
  `lng` decimal(9,6) DEFAULT NULL,
  `lat` decimal(9,6) DEFAULT NULL,
  `parent_id` varchar(32) DEFAULT NULL,
  `division_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lng_lat
-- ----------------------------
INSERT INTO `lng_lat` VALUES ('高密市', '119.755597', '36.382595', 'd7803c1ec9eb4b0784d28ccec727164c', '370785');
INSERT INTO `lng_lat` VALUES ('寿光市', '118.790652', '36.855480', '6591c1af9d5c45e48ac194767e4e3d7d', '370783');
INSERT INTO `lng_lat` VALUES ('昌乐县', '118.829996', '36.706938', 'b2a058346d514269be4cef62b2c43c55', '370725');
INSERT INTO `lng_lat` VALUES ('寒亭区', '119.219734', '36.775491', 'd5f11776a0e34e0481fd357a6f798311', '370703');
INSERT INTO `lng_lat` VALUES ('诸城市', '119.410103', '35.995654', '1374131f99834030a22b1999029a043e', '370782');
INSERT INTO `lng_lat` VALUES ('青州市', '118.479636', '36.684600', 'facc26b132894bb18849657e18998b6a', '370781');
INSERT INTO `lng_lat` VALUES ('安丘市', '119.218843', '36.478494', '2e8a045d7fa24909a759d605a40efa86', '370784');
INSERT INTO `lng_lat` VALUES ('坊子区', '119.166485', '36.654448', '0f85634db4c9429590e693574dbacd37', '370704');
INSERT INTO `lng_lat` VALUES ('昌邑市', '119.398525', '36.858820', 'ddb22933cbef494e950fcc721e3ae823', '370786');
INSERT INTO `lng_lat` VALUES ('临朐县', '118.542982', '36.512506', 'ddbb555212bf40baa2e66de8dfc1b6c6', '370724');
INSERT INTO `lng_lat` VALUES ('潍城区', '119.024836', '36.728100', '9f31b0c4963a4b2c9ca0ff113dca298c', '370702');
INSERT INTO `lng_lat` VALUES ('奎文区', '119.125203', '36.667745', '752e4e237805412da29842ffbb7c2e88', '370705');

-- ----------------------------
-- Table structure for major_categories
-- ----------------------------
DROP TABLE IF EXISTS `major_categories`;
CREATE TABLE `major_categories` (
  `id` varchar(36) NOT NULL,
  `c_id` varchar(36) DEFAULT NULL COMMENT '行业分类id',
  `parent_id` varchar(36) DEFAULT NULL COMMENT '上级id',
  `mc_name` varchar(50) DEFAULT NULL COMMENT '行业细化分类名称（比如猪、牛、羊）',
  `mc_code` varchar(50) DEFAULT NULL COMMENT '行业细化分类编码(如：livestock_pig、livestock_cattle、livestock_sheep)',
  `rank` int(4) DEFAULT NULL COMMENT '排序字段',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '是否有效: 1有效，0无效',
  `tenant_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of major_categories
-- ----------------------------
INSERT INTO `major_categories` VALUES ('0074bbf920e044bbb529452b98df1e08', 'aee8d777ece843d98a4ec79828114e71', '45fd34c812ca44a78b90d4c434312b7d', '鹌鹑', '001017002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('00e3e37dbed2403baef47627d29bdc1c', 'aee8d777ece843d98a4ec79828114e71', '4daaf81c01cf41359b6a53d5ea7b417c', '豹', '001008004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('01cd76fac17544e184435326b8537af9', '1b12ae73c54149899ef66312dc7712cb', '0223274c64ba4fcd81cb57f78237e79c', '草鸡', '00202', null, 'dbfd8fa8a32843afbd33df2696779ea3', '2018-03-26 10:54:49', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('02203452e37d461ba797a360dbaa8a96', 'aee8d777ece843d98a4ec79828114e71', 'e44f91ba251e4056bf2a2bca690cdcb7', '狐狸', '001007003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('0223274c64ba4fcd81cb57f78237e79c', '1b12ae73c54149899ef66312dc7712cb', 'a394242f19e4476eacaaa04a6ead308c', '马头', '002007008001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('034be829cde641dfb4cfb429710de811', '1b12ae73c54149899ef66312dc7712cb', '53ab5ce32a7148bdb3ecf0b450a49e9f', '鸡肠', '002004005001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('03c5d216fcfe4dbfb7f26e8879bb9128', '1b12ae73c54149899ef66312dc7712cb', 'e9d0eeeac55a466d9b9e15d214e2f0cd', '猪肉', '002001001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('03f52c9327da456cbbf693fb5b559512', '1b12ae73c54149899ef66312dc7712cb', null, '兔头骨血类', '002012007', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('04df777acd0b4288a4caee5ecf1d2baa', '1b12ae73c54149899ef66312dc7712cb', '98cbbd22129a4f249dc6722e1defa8a2', '兔肺', '002012006002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('0668100a684c4c418f5d90340c3878bc', 'f2722a57812f4f2da0ead015e545b2c2', 'b250a11b5954475cb29a05090655d21d', '种羊', '001003002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('068a6b7fe78e4953a471752a0185f0c0', '1b12ae73c54149899ef66312dc7712cb', 'dd9d37a74f354cc89bb2d340df8ea060', '鸭翅', '002005005006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('0858a1a27bc24eac94c5f3e652d98864', '1b12ae73c54149899ef66312dc7712cb', 'f5e48bac749847699d221cf72ff0a02f', '猪气管', '002001007014', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('08686e9b0f214ec59cdda795fada61ce', '1b12ae73c54149899ef66312dc7712cb', 'd47dcbd463b44d1e96d1124b920b2a27', '羊脂肪', '002003008004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('0b1dc17c31fb4190ba70a4707c3df8d4', '1b12ae73c54149899ef66312dc7712cb', '98cbbd22129a4f249dc6722e1defa8a2', '兔脾', '002012006005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('0c0f0186bcfa4bec95efc5e88ef69f67', 'f2722a57812f4f2da0ead015e545b2c2', 'ef060574ce3b402bbdaa14b6dc805720', '种鸡蛋', '002004002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('0c29424715df441f86adb16cb5147d69', 'e966e2f5d783406ca0242c77069d85dd', '99b2c65a03a34239b969721709460e28', '蛋禽饲料', 'production_siliao_tjj_dq', null, '1bf361b7435d4a289556b901ec9b0c98', '2018-05-06 21:58:49', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('0c6f9e4417a84c249b58ecc191dd2cb6', '1b12ae73c54149899ef66312dc7712cb', '1e35470bd9954d70b566afcd8f3a4bed', '鹅骨', '002006007001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('0d536cfcba9e4e6d8a62d0c082453e83', '1b12ae73c54149899ef66312dc7712cb', '98cbbd22129a4f249dc6722e1defa8a2', '兔肝', '002012006003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('0e36687acf8d456c9f196095e69a10a0', 'aee8d777ece843d98a4ec79828114e71', 'c604d529684248f698a03c651a993206', '野猪', '001001003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('0e611469c1344944b5151ca30dafed03', '1b12ae73c54149899ef66312dc7712cb', 'f44986e5ffd74d33ba85b15bcfe990d1', '鸭排', '002005007002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('0ebc304ff0b54beb862b5687f4ae733a', 'aee8d777ece843d98a4ec79828114e71', '15280ad066874badb23a342acd3e5222', '鸭', '001005001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('0f1deca40eab4acea802b81d7e882dab', '1b12ae73c54149899ef66312dc7712cb', '03f52c9327da456cbbf693fb5b559512', '兔血', '002012007002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('0fae781824694649998d46970eb143e4', '1b12ae73c54149899ef66312dc7712cb', '5165c25f86214f3ba7551a2079c407f8', '羊头', '002003010001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('0fd90cfb10214540a819732d2b696965', '1b12ae73c54149899ef66312dc7712cb', 'f5e48bac749847699d221cf72ff0a02f', '猪肺', '002001007002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('0fe985c8b8cb4cdbb8d04da6f291c345', '1b12ae73c54149899ef66312dc7712cb', 'bb5e05cae78948ebb2f35f80df3051c7', '其他', '002004004009', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('103a4405775e414094fb089294c8bfe7', '1b12ae73c54149899ef66312dc7712cb', 'bb5e05cae78948ebb2f35f80df3051c7', '鸡腿', '002004004004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('108d32d2bd854f0dbbb6fca1e40d5e57', '1b12ae73c54149899ef66312dc7712cb', '1ce4d30388ff4e6a8922dcb1774912e1', '鸡肉', '002004001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('1132a0f72c2f4569997e2532d45b2258', '1b12ae73c54149899ef66312dc7712cb', '7246f45f48824f49bfabad68fef3c83a', '驴筋', '002008008005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('1145e3c3e2ab44d687a3b37cb84e821f', 'aee8d777ece843d98a4ec79828114e71', 'ac85c17f55b9422b8a61ac4584c13357', '奶山羊', '001003003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('1170ef1627e34bf2a44198072fcf23da', '1b12ae73c54149899ef66312dc7712cb', '2f5c18cca3884871ad2bd71e4bf800cc', '骡原毛', '002009004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('11babf49baef41678e5d5ae0eb342c7a', '1b12ae73c54149899ef66312dc7712cb', '2f5c18cca3884871ad2bd71e4bf800cc', '骡生皮', '002009003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('12ab1a6b893448f7a935f19e1e5bc200', '1b12ae73c54149899ef66312dc7712cb', 'b40030b9d5924ef7bf9d13a4daee1691', '驴骨', '002008003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('12b6c82fbfa640e2b8c5cec36453a26b', 'f2722a57812f4f2da0ead015e545b2c2', '3d6f29a3568e4989b35382828bd12927', '种鹌鹑蛋', '002014002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('130df40eafc44554800a66019d35d78f', '1b12ae73c54149899ef66312dc7712cb', '345c7604230a437fb7ac670b02e1b1cf', '骡睾丸', '002009006015', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('131dbd705a8647bbb7240f84f667d391', 'aee8d777ece843d98a4ec79828114e71', '4b4074309ef440fc95ace64bac378980', '水生受精卵', '001010006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('132a29b55b4b40409e623d39ce9190ee', 'e966e2f5d783406ca0242c77069d85dd', '52e33f7a3d874a8094a0bd455dab524b', '水产饲料', 'production_siliao_ph_sc', null, '1bf361b7435d4a289556b901ec9b0c98', '2018-05-06 21:50:46', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('13f700e1dac54ee4971c19a910e09bd4', 'e966e2f5d783406ca0242c77069d85dd', '99b2c65a03a34239b969721709460e28', '貂、狐、貉饲料', 'production_siliao_tjj_dhm', null, '1bf361b7435d4a289556b901ec9b0c98', '2018-05-06 22:01:56', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('143a880f67254fd2baade2d2a9a8e62f', '1b12ae73c54149899ef66312dc7712cb', '1d1e326d6dcd482eb5436247b76d91f5', '鸡排', '002004006002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('145b7610f5344548ab347d26ba517055', '1b12ae73c54149899ef66312dc7712cb', null, '羊', '002003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('151959ff869f4cc0837151aa69690d9b', 'b01ab303d2084b6889fb7a3629803a60', null, '猪', 'nonharmful_disposal_1', null, '1', '2018-03-16 16:29:36', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('15280ad066874badb23a342acd3e5222', 'aee8d777ece843d98a4ec79828114e71', null, '鸭', '001005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('152de8f079c046eb81de789951c8aaef', 'aee8d777ece843d98a4ec79828114e71', '45fd34c812ca44a78b90d4c434312b7d', '鹦鹉', '001017007', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('15c8821ac08e410db02fb85bcd2ebe44', 'aee8d777ece843d98a4ec79828114e71', '4e7ff943ae8c4b99bbbe3e54d3abcb9d', '奶牛', '001002003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('16bbbf06ffa84b0b817a2b84ff596772', 'e966e2f5d783406ca0242c77069d85dd', '52e33f7a3d874a8094a0bd455dab524b', '肉禽饲料', 'production_siliao_ph_rq', null, '1bf361b7435d4a289556b901ec9b0c98', '2018-05-06 21:50:07', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('177e3690912b4013ae29eceb43ef195a', '1b12ae73c54149899ef66312dc7712cb', '45cc8e076448485587940de80d65b418', '驴睾丸', '002008007015', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('17959e3e30db4d65815319c281229202', '1b12ae73c54149899ef66312dc7712cb', 'dd9d37a74f354cc89bb2d340df8ea060', '鸭皮', '002005005002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('17a9225b0a2b4f8ba28f5e17aa022067', '1b12ae73c54149899ef66312dc7712cb', 'e2520515a9f34d05aae17f5584249bef', '鹅舌', '002006006006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('17aa914f51184030a9c92f88e14bc3ef', '1b12ae73c54149899ef66312dc7712cb', '7246f45f48824f49bfabad68fef3c83a', '其他', '002008008007', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('19344ea01c6f4c05a52a13acc2e18c2e', '1b12ae73c54149899ef66312dc7712cb', 'd47dcbd463b44d1e96d1124b920b2a27', '带骨羊肉', '002003008002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('1b091c8d9ab1414b92258fcecb0b6272', '1b12ae73c54149899ef66312dc7712cb', 'ba1109d87a994b3bbab4475873006250', '猪脂肪', '002001006003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('1b33672973294f9fadff157f1b29ac27', '1b12ae73c54149899ef66312dc7712cb', 'a394242f19e4476eacaaa04a6ead308c', '其他', '002007008007', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('1c21eb9829ac4b049abd3ea5f75810d6', '1b12ae73c54149899ef66312dc7712cb', '3612d870b5bb478a957a51cf0b2c9dff', '马肝', '002007007003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('1c551e9befb0496eb970c427d22aaea8', '1b12ae73c54149899ef66312dc7712cb', '3612d870b5bb478a957a51cf0b2c9dff', '马气管', '002007007013', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('1ce4d30388ff4e6a8922dcb1774912e1', '1b12ae73c54149899ef66312dc7712cb', null, '鸡', '002004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('1d1e326d6dcd482eb5436247b76d91f5', '1b12ae73c54149899ef66312dc7712cb', null, '鸡骨类', '002004006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('1d321b4d2cf843ba9cea3dcb095d8241', '1b12ae73c54149899ef66312dc7712cb', 'c8522108ea7f44f5ab42360734a46c53', '马原毛', '002007005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('1dbbe95bafa845bea76310f45deed4cc', '1b12ae73c54149899ef66312dc7712cb', 'f44986e5ffd74d33ba85b15bcfe990d1', '鸭骨', '002005007001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('1e35470bd9954d70b566afcd8f3a4bed', '1b12ae73c54149899ef66312dc7712cb', null, '鹅骨类', '002006007', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('1f444e4d8a804875a9c0691ba85576a4', '1b12ae73c54149899ef66312dc7712cb', 'bd454f339e394638bc863694c8121fc6', '鸭肉', '002005001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('1f468778dc774663a5cfc207cc025a28', 'aee8d777ece843d98a4ec79828114e71', 'ac85c17f55b9422b8a61ac4584c13357', '羊', '001003001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('1fcb96b626e44f48814c48b4e4ce49ed', '1b12ae73c54149899ef66312dc7712cb', '45cc8e076448485587940de80d65b418', '驴脑', '002008007010', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('2035a610a8134e5c9401906de54f70e8', 'f2722a57812f4f2da0ead015e545b2c2', 'ef060574ce3b402bbdaa14b6dc805720', '种鸡', '001004002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('20942f5af3414e3289c255c6b4e1c0f6', '1b12ae73c54149899ef66312dc7712cb', '53ab5ce32a7148bdb3ecf0b450a49e9f', '鸡心', '002004005002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('20e56612527641af93ed46fe3c7b57fa', 'aee8d777ece843d98a4ec79828114e71', null, '鹿', '001011', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('20e7faf9279444ac9307230d0efed0c6', 'aee8d777ece843d98a4ec79828114e71', '45fd34c812ca44a78b90d4c434312b7d', '蜜蜂', '001017004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('22ba4de7e01e49fea634bcbac55e8979', 'aee8d777ece843d98a4ec79828114e71', 'ac85c17f55b9422b8a61ac4584c13357', '野羊', '001003004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('22c6b48dbe8946edb199c371afff4ac2', '1b12ae73c54149899ef66312dc7712cb', 'a87ae8880b424826936bd992ace86c3c', '鸭肠', '002005006001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('22e93bb6d1d84a90b94ef77a00ac6ac4', '1b12ae73c54149899ef66312dc7712cb', 'ea344863cb1a42ae9516a29ac41c502e', '驴胴体', '002008006001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('238a71c4907c468f85c8f09386de4b0a', '1b12ae73c54149899ef66312dc7712cb', 'f5e48bac749847699d221cf72ff0a02f', '猪膀胱', '002001007016', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('24f2efc957d2427b8c69d6ab685350ba', '1b12ae73c54149899ef66312dc7712cb', 'e2520515a9f34d05aae17f5584249bef', '鹅肠', '002006006001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('2541e6f03bae40cd963fcb0cd4f7fc77', 'e966e2f5d783406ca0242c77069d85dd', null, '疫苗', 'production_vaccine', null, '1', '2018-03-15 14:18:41', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('259b33dc74214c2ca23cde2510379965', '1b12ae73c54149899ef66312dc7712cb', '1ce4d30388ff4e6a8922dcb1774912e1', '鸡毛', '002004003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('25c8d987f31a41aa8289d2a3cb4fe0ea', '1b12ae73c54149899ef66312dc7712cb', '8e0c209b076e48c09cdf38764b3879f0', '牛生皮', '002002005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('273d7b41d1f84b7197a4c12eb354197a', 'aee8d777ece843d98a4ec79828114e71', 'e44f91ba251e4056bf2a2bca690cdcb7', '豺', '001007005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('27745ad9a5c940c4911fc4d41e84b0ae', '1b12ae73c54149899ef66312dc7712cb', '94f6d01643da453baef3ea2424f0e2bc', '骡头', '002009007001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('27d344f0e2974dc1a3d13df9f09c35fa', '1b12ae73c54149899ef66312dc7712cb', '7887aa6f37734c5ba6db0ca6d5c1fc67', '牛头', '002002009001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('2809fcf9b53b4aa3b5f8e5e331bab08c', '1b12ae73c54149899ef66312dc7712cb', '7887aa6f37734c5ba6db0ca6d5c1fc67', '牛血', '002002009007', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('28838a4b0f2e40178da9859d83eee26c', '1b12ae73c54149899ef66312dc7712cb', 'f5e48bac749847699d221cf72ff0a02f', '其他', '002001007019', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('29ad9b9886424e05851782e8fb77ca7e', '1b12ae73c54149899ef66312dc7712cb', '331f73d36f0d47e28b2afa95af18360e', '骆驼产品', '002011004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('2a3bfcf4e7cb421c8f3e33252b0c4251', '1b12ae73c54149899ef66312dc7712cb', '5fdf5626284449e8bb86528109a224fc', '兔肉', '002012001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('2b0f4381b108434fb3394730d3f264ee', 'b01ab303d2084b6889fb7a3629803a60', null, '动物内脏', 'nonharmful_disposal_3', null, '1', '2018-03-16 16:30:49', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('2b1a3e3127c941899d2bfe0ee3ba6813', '1b12ae73c54149899ef66312dc7712cb', '45cc8e076448485587940de80d65b418', '驴肾', '002008007004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('2b9e7167c244497da0989a38fa343db2', '1b12ae73c54149899ef66312dc7712cb', 'd47dcbd463b44d1e96d1124b920b2a27', '其他', '002003008005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('2c128b6dae504288882a743d6a4e19cf', '1b12ae73c54149899ef66312dc7712cb', 'f5e48bac749847699d221cf72ff0a02f', '猪脾', '002001007005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('2c67c3b608814c2eaf5ad918be4fff7e', 'f2722a57812f4f2da0ead015e545b2c2', '8f9bb30629cc4d55bf6d85d8394dac9b', '雏鹅', '001006003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('2c7fefffcdcf4ffab1b8e0abcdaf42a0', '1b12ae73c54149899ef66312dc7712cb', '491e7670bbcb457abf4c753461eb272c', '羊舌', '002003009012', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('2d02c35c3c794d2790e7b3c2e434e2b6', '1b12ae73c54149899ef66312dc7712cb', null, '鹅肉类', '002006005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('2ed80623a6de4bd3a9847f639e52baaa', '87666a5975764ccc9b5b0136264728cc', null, '兽药', 'management_sy', null, '920f2466a7ba40929f70e15469562caa', '2018-05-10 00:14:57', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('2f09c8786f4544b49aa15f5bf2158238', '1b12ae73c54149899ef66312dc7712cb', '94f6d01643da453baef3ea2424f0e2bc', '骡蹄', '002009007003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('2f0e75f446734edc9976fecd51871b2a', '1b12ae73c54149899ef66312dc7712cb', '5165c25f86214f3ba7551a2079c407f8', '羊脸', '002003010002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('2f5c18cca3884871ad2bd71e4bf800cc', '1b12ae73c54149899ef66312dc7712cb', null, '骡', '002009', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('308d192cdaf8443bb3555551ace6d78d', '1b12ae73c54149899ef66312dc7712cb', 'e9d0eeeac55a466d9b9e15d214e2f0cd', '猪骨', '002001003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('310642bb797e446aa817efc85a29221b', '1b12ae73c54149899ef66312dc7712cb', '69e843c71634401fad313f8dd0580192', '猪蹄', '002001008006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('331f73d36f0d47e28b2afa95af18360e', '1b12ae73c54149899ef66312dc7712cb', null, '骆驼', '002011', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('33564ba589ae4c608af37984c5efa4e3', 'f2722a57812f4f2da0ead015e545b2c2', null, '鹿', '003007', null, '1', '2018-03-02 17:34:37', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('34563ccdcce0497483a9018d36f97f13', '1b12ae73c54149899ef66312dc7712cb', '491e7670bbcb457abf4c753461eb272c', '羊胃', '002003009007', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('345c7604230a437fb7ac670b02e1b1cf', '1b12ae73c54149899ef66312dc7712cb', null, '骡内脏器官类', '002009006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('34eb92ad04ec4e92bfe3ee9fb348d6d2', '1b12ae73c54149899ef66312dc7712cb', 'f5e48bac749847699d221cf72ff0a02f', '猪肝', '002001007003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('3569276b3b61431eb73430bedb27cfdd', 'e966e2f5d783406ca0242c77069d85dd', 'eb7cc0a6fbac4ed8835125648e8727ff', '蛋禽饲料', 'production_siliao_ns_dq', null, '1bf361b7435d4a289556b901ec9b0c98', '2018-05-06 21:54:36', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('35d3c7ac3cb64341b842832783a68ea4', '1b12ae73c54149899ef66312dc7712cb', '345c7604230a437fb7ac670b02e1b1cf', '骡脾', '002009006005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('35f92e7266d0472089804c568c0232d4', '1b12ae73c54149899ef66312dc7712cb', '69e843c71634401fad313f8dd0580192', '猪蹄筋', '002001008004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('3612d870b5bb478a957a51cf0b2c9dff', '1b12ae73c54149899ef66312dc7712cb', null, '马内脏器官类', '002007007', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('37ae2069bda44651aba95877d038b8e3', '1b12ae73c54149899ef66312dc7712cb', '345c7604230a437fb7ac670b02e1b1cf', '骡心', '002009006001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('3815f262edab4d01bf8e34d06fada9d8', '1b12ae73c54149899ef66312dc7712cb', null, '兔肉类', '002012005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('3859a3459bdc4fb0a197b131e550fe62', '1b12ae73c54149899ef66312dc7712cb', '94f6d01643da453baef3ea2424f0e2bc', '骡筋', '002009007005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('38fe62db2d3c451dbecf28dba9e2107d', 'aee8d777ece843d98a4ec79828114e71', 'e44f91ba251e4056bf2a2bca690cdcb7', '狼', '001007002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('3915ce7748ca4d61b2c74fbccacfcae8', 'aee8d777ece843d98a4ec79828114e71', 'e44f91ba251e4056bf2a2bca690cdcb7', '狗', '001007001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('39412fc87e4c4c748350c011c3f38d93', '1b12ae73c54149899ef66312dc7712cb', '3612d870b5bb478a957a51cf0b2c9dff', '马耳', '002007007011', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('3c1200d9d26f49a09ac83a459578edee', 'aee8d777ece843d98a4ec79828114e71', 'e44f91ba251e4056bf2a2bca690cdcb7', '貉', '001007006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('3c2743e3664649c0bb80ac6dbb809075', '1b12ae73c54149899ef66312dc7712cb', 'f5e48bac749847699d221cf72ff0a02f', '猪肠衣', '002001007009', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('3c299006edc14dcfbe7b6225379773f8', '1b12ae73c54149899ef66312dc7712cb', 'ba1109d87a994b3bbab4475873006250', '猪腿', '002001006004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('3c606a3b5fe6464b98795b727411be50', '1b12ae73c54149899ef66312dc7712cb', '345c7604230a437fb7ac670b02e1b1cf', '骡脑', '002009006010', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('3d076a96302744bba6a2b97ec7430103', 'f2722a57812f4f2da0ead015e545b2c2', null, '牛', '003002', null, '1', '2018-03-02 17:22:52', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('3d6f29a3568e4989b35382828bd12927', 'f2722a57812f4f2da0ead015e545b2c2', null, '鹌鹑', '003012', null, '1', '2018-03-02 17:49:46', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('3e46b1c3163f4ac7bfd196ea736cf158', '1b12ae73c54149899ef66312dc7712cb', 'dd9d37a74f354cc89bb2d340df8ea060', '白条鸭', '002005005001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('3e6bced2df874c45926a954fa0a75b30', 'aee8d777ece843d98a4ec79828114e71', 'ac85c17f55b9422b8a61ac4584c13357', '奶羊', '001003005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('3e6ff23bd32e47eda556e3c89c6f539c', '1b12ae73c54149899ef66312dc7712cb', 'c8522108ea7f44f5ab42360734a46c53', '马生皮', '002007004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('3e8f5498be9044a39b9a04a4b840dc78', '1b12ae73c54149899ef66312dc7712cb', '7246f45f48824f49bfabad68fef3c83a', '驴脸', '002008008002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('4033fbdc085e437d92ffbf1bc9d6e8c3', '1b12ae73c54149899ef66312dc7712cb', '3612d870b5bb478a957a51cf0b2c9dff', '马脑', '002007007010', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('409525c87aae4f78be793fa2fa89eeb9', 'e966e2f5d783406ca0242c77069d85dd', null, '饲料', 'production_siliao', null, '1', '2018-03-13 13:40:33', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('40b7ab312e6d46f7bc88a378f174884c', '1b12ae73c54149899ef66312dc7712cb', '98cbbd22129a4f249dc6722e1defa8a2', '兔舌', '002012006010', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('40feaef2f2e04dff9356c883eb0546d1', '1b12ae73c54149899ef66312dc7712cb', '491e7670bbcb457abf4c753461eb272c', '羊绒', '002003009015', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('41abfff5f1b0422b92e5f39559d0d8fa', '1b12ae73c54149899ef66312dc7712cb', '3612d870b5bb478a957a51cf0b2c9dff', '马阴茎', '002007007016', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('41bb52d867d24543abb814ce9fe7128c', '1b12ae73c54149899ef66312dc7712cb', 'bb5e05cae78948ebb2f35f80df3051c7', '鸡油', '002004004005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('4238b5b651a547bbba14c1416dc6ded8', 'f2722a57812f4f2da0ead015e545b2c2', '8f9bb30629cc4d55bf6d85d8394dac9b', '种鹅', '001006002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('4253d632a7d4450b9af1e66a7746ed0e', '1b12ae73c54149899ef66312dc7712cb', 'fe321635ce6e44e18bc782d52be6003b', '牛胎盘', '002002008014', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('42c850169abb437b99aa9748dbc7070d', 'aee8d777ece843d98a4ec79828114e71', 'f7c0b8e834b446348abcffbda27a9176', '野骡', '001009006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('43975c4155ef4c17b261a20af4e4b8dc', '1b12ae73c54149899ef66312dc7712cb', '3815f262edab4d01bf8e34d06fada9d8', '兔腿', '002012005002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('4460943123114eb08213d55820712bdd', '1b12ae73c54149899ef66312dc7712cb', 'f5e48bac749847699d221cf72ff0a02f', '猪阴茎', '002001007018', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('44a18b71664741f8813dfeb1f8cdbf69', '1b12ae73c54149899ef66312dc7712cb', 'a394242f19e4476eacaaa04a6ead308c', '马蹄', '002007008004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('452d4fdbad8a43ce8fe09c22bc7bdecd', '1b12ae73c54149899ef66312dc7712cb', 'f5e48bac749847699d221cf72ff0a02f', '猪耳', '002001007011', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('45a065950d184751a17888c9fd135e4f', '1b12ae73c54149899ef66312dc7712cb', 'a394242f19e4476eacaaa04a6ead308c', '马血', '002007008005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('45cc8e076448485587940de80d65b418', '1b12ae73c54149899ef66312dc7712cb', null, '驴内脏器官类', '002008007', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('45fd34c812ca44a78b90d4c434312b7d', 'aee8d777ece843d98a4ec79828114e71', null, '其他', '001017', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('4629ec2cf5b94c3f8843c90f95aa404f', '1b12ae73c54149899ef66312dc7712cb', '8e0c209b076e48c09cdf38764b3879f0', '牛角', '002002004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('476505ed0bb7439b86853066e70dedfc', '1b12ae73c54149899ef66312dc7712cb', 'dd9d37a74f354cc89bb2d340df8ea060', '鸭油', '002005005003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('47c20827122b48909dd4e2a814ed30e7', 'aee8d777ece843d98a4ec79828114e71', 'c7b81538c4bf492b90ac52dbebf6c31b', '奶骆驼', '001012003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('4877614a315f44e580c61db9cd41df38', 'e966e2f5d783406ca0242c77069d85dd', '99b2c65a03a34239b969721709460e28', '宠物饲料', 'production_siliao_tjj_cw', null, '1bf361b7435d4a289556b901ec9b0c98', '2018-05-06 22:01:00', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('491e7670bbcb457abf4c753461eb272c', '1b12ae73c54149899ef66312dc7712cb', null, '羊内脏器官类', '002003009', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('492a7322daae4cd581a9ec97ce55ba5a', '1b12ae73c54149899ef66312dc7712cb', '94f6d01643da453baef3ea2424f0e2bc', '骡血', '002009007004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('49403459bfc84cc28574ed683742e7af', '1b12ae73c54149899ef66312dc7712cb', '491e7670bbcb457abf4c753461eb272c', '羊睾丸', '002003009014', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('49dcde2fda73459da8f7149f82887290', '1b12ae73c54149899ef66312dc7712cb', '2d02c35c3c794d2790e7b3c2e434e2b6', '鹅脖', '002006005007', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('4a19c0dec9ca4606b0810953d9e9fdd8', '1b12ae73c54149899ef66312dc7712cb', '03f52c9327da456cbbf693fb5b559512', '兔头', '002012007001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('4a4ea7b7637c4e2c81f8f7ee101449db', '1b12ae73c54149899ef66312dc7712cb', 'f5e48bac749847699d221cf72ff0a02f', '猪心', '002001007001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('4a5fca2145ef4f79a1e254c4d8af27e8', 'f2722a57812f4f2da0ead015e545b2c2', null, '驴', '003010', null, '1', '2018-03-02 17:49:09', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('4a9e69e16ae34a9ba224d5f3e400ef24', 'aee8d777ece843d98a4ec79828114e71', '4e7ff943ae8c4b99bbbe3e54d3abcb9d', '野牛', '001002004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('4ac3824042344db3af88b5e610bebae6', '1b12ae73c54149899ef66312dc7712cb', 'a87ae8880b424826936bd992ace86c3c', '鸭食管', '002005006005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('4b0cc0b213214d0599744bc6f53f7148', '1b12ae73c54149899ef66312dc7712cb', 'd47dcbd463b44d1e96d1124b920b2a27', '羊腿', '002003008003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('4b4074309ef440fc95ace64bac378980', 'aee8d777ece843d98a4ec79828114e71', null, '水生', '001010', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('4cc13855dec749098b70d54a94064076', '1b12ae73c54149899ef66312dc7712cb', '7887aa6f37734c5ba6db0ca6d5c1fc67', '牛脸', '002002009002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('4d26eca72c41441e959366e5036f2dfc', '1b12ae73c54149899ef66312dc7712cb', '3815f262edab4d01bf8e34d06fada9d8', '其他', '002012005003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('4d6f9e86e38c4989bb8290760dd1f7a5', 'e966e2f5d783406ca0242c77069d85dd', '52e33f7a3d874a8094a0bd455dab524b', '蛋禽饲料', 'production_siliao_ph_dq', null, '1bf361b7435d4a289556b901ec9b0c98', '2018-05-06 21:49:38', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('4d80deb5e04340a29121e0781ed927e3', '1b12ae73c54149899ef66312dc7712cb', 'a87ae8880b424826936bd992ace86c3c', '鸭胗', '002005006004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('4daaf81c01cf41359b6a53d5ea7b417c', 'aee8d777ece843d98a4ec79828114e71', null, '猫科', '001008', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('4e5c214fca534c6c8654e923f5c33f6b', '1b12ae73c54149899ef66312dc7712cb', '2d02c35c3c794d2790e7b3c2e434e2b6', '鹅皮', '002006005004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('4e7ff943ae8c4b99bbbe3e54d3abcb9d', 'aee8d777ece843d98a4ec79828114e71', null, '牛', '001002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('4ebdf2cbe25b463a9db254f9a5298c30', '1b12ae73c54149899ef66312dc7712cb', '94f6d01643da453baef3ea2424f0e2bc', '骡脸', '002009007002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('4ede14d5f60642fbbb2de965f28c7d2a', 'aee8d777ece843d98a4ec79828114e71', 'f7c0b8e834b446348abcffbda27a9176', '驴', '001009002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('50ab8d5049f641da8b26403a3b597ea3', 'aee8d777ece843d98a4ec79828114e71', '4b4074309ef440fc95ace64bac378980', '虾苗', '001010002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('5165c25f86214f3ba7551a2079c407f8', '1b12ae73c54149899ef66312dc7712cb', null, '羊头蹄骨血类', '002003010', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('51a4607e6c04464db90b65a58bbbf589', '1b12ae73c54149899ef66312dc7712cb', '03f52c9327da456cbbf693fb5b559512', '其他', '002012007003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('51d059aed77c4506b03e001cda873d85', '1b12ae73c54149899ef66312dc7712cb', '98cbbd22129a4f249dc6722e1defa8a2', '兔耳', '002012006009', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('51d633016be843438af2da65c5f5e8f2', '1b12ae73c54149899ef66312dc7712cb', '69e843c71634401fad313f8dd0580192', '其他', '002001008009', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('522c903c3c194c9485dcc726c6d945e1', 'e966e2f5d783406ca0242c77069d85dd', null, '兽药', 'production_shouyao', null, '1', '2018-03-13 13:40:10', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('524ad63142b24745924394619ba80811', '1b12ae73c54149899ef66312dc7712cb', 'fe321635ce6e44e18bc782d52be6003b', '牛脾', '002002008005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('52e33f7a3d874a8094a0bd455dab524b', 'e966e2f5d783406ca0242c77069d85dd', '409525c87aae4f78be793fa2fa89eeb9', '配合饲料', 'production_siliao_ph', null, '1bf361b7435d4a289556b901ec9b0c98', '2018-05-06 21:47:42', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('52f50a6dcaaa49d286fbae5ada470594', '1b12ae73c54149899ef66312dc7712cb', 'f5e48bac749847699d221cf72ff0a02f', '猪胰脏', '002001007006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('52fc3fa580074760afb0a7ba55402005', '1b12ae73c54149899ef66312dc7712cb', '1d1e326d6dcd482eb5436247b76d91f5', '其他', '002004006003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('53ab5ce32a7148bdb3ecf0b450a49e9f', '1b12ae73c54149899ef66312dc7712cb', null, '鸡内脏器官类', '002004005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('53c7e9ab9b6744999b2d6800a07e6dbd', '1b12ae73c54149899ef66312dc7712cb', '3612d870b5bb478a957a51cf0b2c9dff', '马胃', '002007007009', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('544f814a339247f4839794593cf0eb56', '1b12ae73c54149899ef66312dc7712cb', 'dee7b911066c498bb7005de33bbd50cf', '鹅肉', '002006001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('5469e6f8c14b4a72b7644d28fbf3f354', '1b12ae73c54149899ef66312dc7712cb', '491e7670bbcb457abf4c753461eb272c', '羊肺', '002003009002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('5493453083f44bf6b7c975796f4bc0f4', '1b12ae73c54149899ef66312dc7712cb', 'dd9d37a74f354cc89bb2d340df8ea060', '鸭腿', '002005005007', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('54a5d9e98a4b49e7991f61631d7e7d1d', '1b12ae73c54149899ef66312dc7712cb', 'a87ae8880b424826936bd992ace86c3c', '鸭肝', '002005006003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('54bc1878e3ee48519a5f605372519d6a', 'e966e2f5d783406ca0242c77069d85dd', 'eb7cc0a6fbac4ed8835125648e8727ff', '肉禽饲料', 'production_siliao_ns_rq', null, '1bf361b7435d4a289556b901ec9b0c98', '2018-05-06 21:55:12', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('550f3db12f9f42488aa797c178eaa4b0', '1b12ae73c54149899ef66312dc7712cb', '491e7670bbcb457abf4c753461eb272c', '羊阴茎', '002003009016', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('563f21248da04b0eab37fe048d095fe8', '1b12ae73c54149899ef66312dc7712cb', 'fe321635ce6e44e18bc782d52be6003b', '牛脊髓', '002002008015', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('5668e36e2f2b46bda72d5f490e067c8c', 'f2722a57812f4f2da0ead015e545b2c2', 'ef060574ce3b402bbdaa14b6dc805720', '雏鸡', '001004003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('568df84111ee4dcdb8b48967d7487716', '1b12ae73c54149899ef66312dc7712cb', '7887aa6f37734c5ba6db0ca6d5c1fc67', '牛筋', '002002009004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('5717d3099f1d4a849b86135cb17197ef', '1b12ae73c54149899ef66312dc7712cb', '894eccffc7c749149e36b07d8b9c3f58', '骡腿', '002009005003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('57daba33fcc346019bbf25f6a97f3c98', 'aee8d777ece843d98a4ec79828114e71', '45fd34c812ca44a78b90d4c434312b7d', '羊驼', '001017011', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('583ada47b08d427193687d9e56140718', 'aee8d777ece843d98a4ec79828114e71', 'f7c0b8e834b446348abcffbda27a9176', '野马', '001009004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('584412504c564df88fc97938affd0184', '1b12ae73c54149899ef66312dc7712cb', '491e7670bbcb457abf4c753461eb272c', '羊肠衣', '002003009009', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('5910fad18a664b33a60a5c828bdef1dd', 'aee8d777ece843d98a4ec79828114e71', '4daaf81c01cf41359b6a53d5ea7b417c', '果子狸', '001008006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('5945e28f7a06486ca8c4d6036bd48aef', '1b12ae73c54149899ef66312dc7712cb', 'bb5e05cae78948ebb2f35f80df3051c7', '鸡脖', '002004004007', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('59866490f84b49b084dc461d36384316', '1b12ae73c54149899ef66312dc7712cb', 'a394242f19e4476eacaaa04a6ead308c', '马筋', '002007008003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('59952bee15414abd9b2ca1738614ae9d', '1b12ae73c54149899ef66312dc7712cb', '3612d870b5bb478a957a51cf0b2c9dff', '马膀胱', '002007007014', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('59c11d34dfe94cf1a1307a88c43e4f94', 'f2722a57812f4f2da0ead015e545b2c2', null, '马', '003009', null, '1', '2018-03-02 17:48:42', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('5a7f169e93664639a904582fc1163992', '1b12ae73c54149899ef66312dc7712cb', 'a87ae8880b424826936bd992ace86c3c', '鸭舌', '002005006006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('5ad319b35746447f9b6729d923e3e4e0', '1b12ae73c54149899ef66312dc7712cb', '7246f45f48824f49bfabad68fef3c83a', '驴软骨', '002008008006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('5ae4568f637b4589aa2e2896b39d1873', 'aee8d777ece843d98a4ec79828114e71', '4b4074309ef440fc95ace64bac378980', '鱼亲本', '001010003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('5b16c83447bf4068bfa8aeb005da2d48', 'aee8d777ece843d98a4ec79828114e71', '4e7ff943ae8c4b99bbbe3e54d3abcb9d', '牛', '001002001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('5b6c5e6e89774ffebf68cad0ea6bed58', '1b12ae73c54149899ef66312dc7712cb', '45cc8e076448485587940de80d65b418', '其他', '002008007017', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('5c5fd500aa624cdf8a0c57f5be3a4641', '1b12ae73c54149899ef66312dc7712cb', null, '鹿', '002010', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('5cafa897efa5482e84c8495784613730', '1b12ae73c54149899ef66312dc7712cb', 'dee7b911066c498bb7005de33bbd50cf', '鹅绒', '002006003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('5d1b766631cd4783a9d9b22b0f155087', '1b12ae73c54149899ef66312dc7712cb', 'fe321635ce6e44e18bc782d52be6003b', '其他', '002002008019', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('5db17e1b99ef433a9de13d3c25134b69', 'aee8d777ece843d98a4ec79828114e71', '20e56612527641af93ed46fe3c7b57fa', '奶鹿', '001011003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('5e6b11ed636a42e1a393a887562d6d98', '1b12ae73c54149899ef66312dc7712cb', '5165c25f86214f3ba7551a2079c407f8', '羊血', '002003010006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('5fdf5626284449e8bb86528109a224fc', '1b12ae73c54149899ef66312dc7712cb', null, '兔', '002012', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('5fea75c0ffb8467ea7790837b4d8bb88', '1b12ae73c54149899ef66312dc7712cb', 'f5e48bac749847699d221cf72ff0a02f', '猪肠', '002001007008', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('607e80fc5c57461781bb1c246ff9b35c', 'e966e2f5d783406ca0242c77069d85dd', '52e33f7a3d874a8094a0bd455dab524b', '精料补充料', 'production_siliao_ph_jkbc', null, '1bf361b7435d4a289556b901ec9b0c98', '2018-05-06 21:52:02', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('626cf06ee3f44004897b543d80e5d97c', '1b12ae73c54149899ef66312dc7712cb', '5fdf5626284449e8bb86528109a224fc', '兔原毛', '002012003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('63199aee219d49988615ed0026aa9f29', '1b12ae73c54149899ef66312dc7712cb', '53ab5ce32a7148bdb3ecf0b450a49e9f', '鸡肝', '002004005003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('6434f9369b7a4ac6b1f659b4ce784452', 'aee8d777ece843d98a4ec79828114e71', 'c7b81538c4bf492b90ac52dbebf6c31b', '野骆驼', '001012004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('64cff95e996a472984acdab2edd638c7', 'f2722a57812f4f2da0ead015e545b2c2', null, '骆驼', '003008', null, '1', '2018-03-02 17:46:46', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('685259b853af479887b36fc8259e375c', 'aee8d777ece843d98a4ec79828114e71', '4daaf81c01cf41359b6a53d5ea7b417c', '猫', '001008001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('6907152afb184b0781a83c33601cdd2a', 'f2722a57812f4f2da0ead015e545b2c2', '97292fcbd3684080a7b5d500ab5ae8c5', '种猪精液', '002001002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('6916d4d81bc149dbb3a657d275bc63e6', '1b12ae73c54149899ef66312dc7712cb', '45cc8e076448485587940de80d65b418', '驴阴茎', '002008007016', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('69e843c71634401fad313f8dd0580192', '1b12ae73c54149899ef66312dc7712cb', null, '猪头蹄骨血类', '002001008', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('69f31bae4fb6422e80c9fce56996a489', '1b12ae73c54149899ef66312dc7712cb', 'fe321635ce6e44e18bc782d52be6003b', '牛肾', '002002008004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('6c1cb918d6704ef0ae36085790b15f97', '1b12ae73c54149899ef66312dc7712cb', 'be5bedb995bd4de3a0508346f727e3bb', '牛胴体', '002002007001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('6cd789c4650e4a3d82170ca0a07c04b0', '1b12ae73c54149899ef66312dc7712cb', '5165c25f86214f3ba7551a2079c407f8', '羊脊骨', '002003010005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('6d13407a9a914b31a7638c223a322dd0', '1b12ae73c54149899ef66312dc7712cb', '7887aa6f37734c5ba6db0ca6d5c1fc67', '牛排', '002002009006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('6e05a42252604156989df91d1ce3aea1', '1b12ae73c54149899ef66312dc7712cb', 'ba1109d87a994b3bbab4475873006250', '其他', '002001006005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('6ff8f4e0e5434ebaa6a85749d8d7eb21', '1b12ae73c54149899ef66312dc7712cb', 'fe321635ce6e44e18bc782d52be6003b', '牛肺', '002002008002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('70e9c309ba9e49848a3239f08026a8cf', '1b12ae73c54149899ef66312dc7712cb', '2d02c35c3c794d2790e7b3c2e434e2b6', '鹅头', '002006005003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('70f7cf1cb42847bbbfab85ec3dfe2775', '1b12ae73c54149899ef66312dc7712cb', 'e9d0eeeac55a466d9b9e15d214e2f0cd', '猪原毛', '002001005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('712df69531cb4eb5820818732405a03b', '1b12ae73c54149899ef66312dc7712cb', 'bb5e05cae78948ebb2f35f80df3051c7', '鸡爪', '002004004008', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('718df2be20d14a9ba52d7b6cfcdfa5b7', '1b12ae73c54149899ef66312dc7712cb', '45cc8e076448485587940de80d65b418', '驴肺', '002008007003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('71b33e3fa3ce4e8ca2247e5403de02d3', '1b12ae73c54149899ef66312dc7712cb', 'ff02a8d04e374b36a3157c301f675b91', '鸽子血', '002013004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('7246f45f48824f49bfabad68fef3c83a', '1b12ae73c54149899ef66312dc7712cb', null, '驴头蹄骨血类', '002008008', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('725c1e1db0074062a804b3950d8a6e6d', '1b12ae73c54149899ef66312dc7712cb', '491e7670bbcb457abf4c753461eb272c', '羊脑', '002003009010', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('730e1aaf2be24c3e8855dfd75c0c8294', '1b12ae73c54149899ef66312dc7712cb', '491e7670bbcb457abf4c753461eb272c', '羊耳', '002003009011', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('734c973124e743d7ba3ed7c90403c5a2', 'e966e2f5d783406ca0242c77069d85dd', '52e33f7a3d874a8094a0bd455dab524b', '宠物饲料', 'production_siliao_ph_cw', null, '1bf361b7435d4a289556b901ec9b0c98', '2018-05-06 21:52:24', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('74e190fbea6345739905537bfe2bf4c9', '1b12ae73c54149899ef66312dc7712cb', '45cc8e076448485587940de80d65b418', '驴胰脏', '002008007006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('7584b94319cf4b01a163fe98c724f50b', '1b12ae73c54149899ef66312dc7712cb', '53ab5ce32a7148bdb3ecf0b450a49e9f', '鸡冠', '002004005005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('759196efb94448acbb6e7d04b886d7e5', '1b12ae73c54149899ef66312dc7712cb', '45cc8e076448485587940de80d65b418', '驴心', '002008007001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('75ed97ae6bf94a3dab79a07c661ba6f9', '1b12ae73c54149899ef66312dc7712cb', 'e2520515a9f34d05aae17f5584249bef', '鹅肝', '002006006003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('75f90404ec2347ada25822ca2fc7111f', '1b12ae73c54149899ef66312dc7712cb', '53ab5ce32a7148bdb3ecf0b450a49e9f', '其他', '002004005006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('76643d7e87e841c8a0582dcb23ceda17', '1b12ae73c54149899ef66312dc7712cb', '5165c25f86214f3ba7551a2079c407f8', '其他', '002003010007', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('769be88f844d421b80e4d1cdf30c6a97', '1b12ae73c54149899ef66312dc7712cb', '345c7604230a437fb7ac670b02e1b1cf', '骡膀胱', '002009006014', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('775fea69c3064c2bab3cb02a0346aa8e', '1b12ae73c54149899ef66312dc7712cb', 'e9d0eeeac55a466d9b9e15d214e2f0cd', '猪生皮', '002001004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('7847fd7807754aac8f080f6ebeef05ce', '1b12ae73c54149899ef66312dc7712cb', '3612d870b5bb478a957a51cf0b2c9dff', '马睾丸', '002007007015', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('7887aa6f37734c5ba6db0ca6d5c1fc67', '1b12ae73c54149899ef66312dc7712cb', null, '牛头蹄骨血类', '002002009', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('795736d741154bf8b713039ef6a5f1f7', '1b12ae73c54149899ef66312dc7712cb', '491e7670bbcb457abf4c753461eb272c', '羊肠', '002003009008', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('797221948d9949a28542a77433dd5c89', '1b12ae73c54149899ef66312dc7712cb', 'fe321635ce6e44e18bc782d52be6003b', '牛膀胱', '002002008012', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('7986b5f5469c40bea44534f95244bf69', 'aee8d777ece843d98a4ec79828114e71', '45fd34c812ca44a78b90d4c434312b7d', '鸽子', '001017003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('7a6c7b38bf7345d796da18c55823acab', '1b12ae73c54149899ef66312dc7712cb', '3612d870b5bb478a957a51cf0b2c9dff', '马肾', '002007007004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('7a9f529117aa4065a025bb3db8d13aa1', '1b12ae73c54149899ef66312dc7712cb', '491e7670bbcb457abf4c753461eb272c', '羊膀胱', '002003009013', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('7af5a57d30984febb2c7bf5e806cf2a0', '1b12ae73c54149899ef66312dc7712cb', '145b7610f5344548ab347d26ba517055', '羊骨', '002003003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('7bca81e6e86f45bc8066abd0ca3dfead', '1b12ae73c54149899ef66312dc7712cb', '1e35470bd9954d70b566afcd8f3a4bed', '其他', '002006007003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('7c8c8e90aee54abdb5239722485b3716', '1b12ae73c54149899ef66312dc7712cb', '94f6d01643da453baef3ea2424f0e2bc', '其他', '002009007006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('7cb748559b014bdd9ba048bfb0c28691', '1b12ae73c54149899ef66312dc7712cb', 'e2520515a9f34d05aae17f5584249bef', '鹅食管', '002006006005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('7cc75233fdbe4d3da07e07ebb6e70f37', '1b12ae73c54149899ef66312dc7712cb', '5fdf5626284449e8bb86528109a224fc', '兔绒', '002012004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('7ccf300d6b16401297c0b2d344f863bb', '1b12ae73c54149899ef66312dc7712cb', '345c7604230a437fb7ac670b02e1b1cf', '骡阴茎', '002009006016', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('7d46e8b40e3644b6b75461f7ee2815b2', '1b12ae73c54149899ef66312dc7712cb', '8e0c209b076e48c09cdf38764b3879f0', '牛肉', '002002001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('7e0c8a0a5c6b4e8da05b6a80405eff1c', '1b12ae73c54149899ef66312dc7712cb', 'b40030b9d5924ef7bf9d13a4daee1691', '驴肉', '002008001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('7eb236cf76564cd28248bf81af39e311', '1b12ae73c54149899ef66312dc7712cb', 'f3b7c85067bb4f23b6cd8a72efccc7e9', '马胴体', '002007006001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('806ed7afd95f420194459c8c7c0b89fb', '1b12ae73c54149899ef66312dc7712cb', '345c7604230a437fb7ac670b02e1b1cf', '骡肠', '002009006007', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('808ba98e6b3d4a0ca4a501feb58b798a', '1b12ae73c54149899ef66312dc7712cb', '98cbbd22129a4f249dc6722e1defa8a2', '兔脑', '002012006008', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('81f9926554434bc2978b0bf117cc305a', 'aee8d777ece843d98a4ec79828114e71', '4daaf81c01cf41359b6a53d5ea7b417c', '虎', '001008002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('8215f2032cc54d958ef0c8c11a80694d', '1b12ae73c54149899ef66312dc7712cb', '894eccffc7c749149e36b07d8b9c3f58', '骡胴体', '002009005001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('838140fef2f44cc3951466415c74d31e', 'e966e2f5d783406ca0242c77069d85dd', '52e33f7a3d874a8094a0bd455dab524b', '猪饲料', 'production_siliao_ph_zsl', null, '1bf361b7435d4a289556b901ec9b0c98', '2018-05-06 21:48:28', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('847c93d7e9314e278256f61c15d4b3bf', '1b12ae73c54149899ef66312dc7712cb', 'f3b7c85067bb4f23b6cd8a72efccc7e9', '马腿', '002007006003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('8507bd0cfa894fada6cf0f93bca0bdd2', '1b12ae73c54149899ef66312dc7712cb', '145b7610f5344548ab347d26ba517055', '羊角', '002003004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('8551d8d9ef0947dd8ac2d7336c501334', 'aee8d777ece843d98a4ec79828114e71', 'e1a78160158741619bcd6017e39a3e03', '蛋鸡', '001004005', null, 'adebe6ea28ef4121846100b854ed96b2', '2018-05-02 16:50:42', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('861f4b16a8d14bf18d4da6b51abb549c', '1b12ae73c54149899ef66312dc7712cb', '491e7670bbcb457abf4c753461eb272c', '羊肾', '002003009004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('862d4cd6403f4c3d98e57c4132d2f4dd', 'aee8d777ece843d98a4ec79828114e71', '45fd34c812ca44a78b90d4c434312b7d', '孔雀', '001017006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('86d2075520b94cca865fc5eeb8e8651f', 'f2722a57812f4f2da0ead015e545b2c2', 'c4f090fed5fa4fde886e52e04371fd1e', '种鸭蛋', '002005002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('8813cc01ad73485e9552266374bfe67a', '1b12ae73c54149899ef66312dc7712cb', 'fe321635ce6e44e18bc782d52be6003b', '牛睾丸', '002002008013', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('88b98960c21e471b9b9ae5cbefcb2c3c', '1b12ae73c54149899ef66312dc7712cb', '5fdf5626284449e8bb86528109a224fc', '兔生皮', '002012002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('894eccffc7c749149e36b07d8b9c3f58', '1b12ae73c54149899ef66312dc7712cb', null, '骡肉类', '002009005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('8c26acac5bc84d9eaa08eb7f93af1cb3', '1b12ae73c54149899ef66312dc7712cb', 'be5bedb995bd4de3a0508346f727e3bb', '牛脂肪', '002002007002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('8c8d66585cf04ebe8e2acc9fbb83b6d5', '1b12ae73c54149899ef66312dc7712cb', 'dee7b911066c498bb7005de33bbd50cf', '鹅毛', '002006004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('8d9012ecfcb242a8a83f0af405ec90fb', 'aee8d777ece843d98a4ec79828114e71', '4e7ff943ae8c4b99bbbe3e54d3abcb9d', '肉牛', '001002005', null, 'adebe6ea28ef4121846100b854ed96b2', '2018-05-02 16:49:15', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('8da8f48ee1274d138ec075ac94b470f8', '1b12ae73c54149899ef66312dc7712cb', '2d02c35c3c794d2790e7b3c2e434e2b6', '鹅油', '002006005002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('8e0c209b076e48c09cdf38764b3879f0', '1b12ae73c54149899ef66312dc7712cb', null, '牛', '002002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('8e430c69e20d46cd8ce084bec794de73', '1b12ae73c54149899ef66312dc7712cb', 'fe321635ce6e44e18bc782d52be6003b', '牛胃', '002002008007', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('8e7ef59cc5424c85b83a28c04c4e1a78', 'e966e2f5d783406ca0242c77069d85dd', 'eb7cc0a6fbac4ed8835125648e8727ff', '其他', 'production_siliao_ns_qt', null, '1bf361b7435d4a289556b901ec9b0c98', '2018-05-06 21:56:47', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('8ece2d130ca5492387e0e8091a129cfc', 'aee8d777ece843d98a4ec79828114e71', '20e56612527641af93ed46fe3c7b57fa', '鹿', '001011001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('8f24e9c109eb494393c1b9c0d3366bc5', '1b12ae73c54149899ef66312dc7712cb', 'e2520515a9f34d05aae17f5584249bef', '鹅心', '002006006002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('8f9bb30629cc4d55bf6d85d8394dac9b', 'f2722a57812f4f2da0ead015e545b2c2', null, '鹅', '003006', null, '1', '2018-03-02 17:25:07', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('9015368ea71445d39014f65dcf3bb838', '1b12ae73c54149899ef66312dc7712cb', '345c7604230a437fb7ac670b02e1b1cf', '骡肠衣', '002009006008', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('9042c379cd344fbd8498f599cd3da1fb', '1b12ae73c54149899ef66312dc7712cb', 'f44986e5ffd74d33ba85b15bcfe990d1', '其他', '002005007004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('9064c045b4e049a3ab363e85cc43ba53', 'aee8d777ece843d98a4ec79828114e71', '45fd34c812ca44a78b90d4c434312b7d', '鸬鹚', '001017009', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('906f74976f94466a89a5915ec01ad409', '1b12ae73c54149899ef66312dc7712cb', '3612d870b5bb478a957a51cf0b2c9dff', '马心', '002007007001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('9386ce0d36f344c1a70da6b99b514779', '1b12ae73c54149899ef66312dc7712cb', 'f5e48bac749847699d221cf72ff0a02f', '猪舌', '002001007012', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('93969660488845fd910c98e8ecdf6c9f', '1b12ae73c54149899ef66312dc7712cb', 'dd9d37a74f354cc89bb2d340df8ea060', '鸭掌', '002005005008', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('93df6959a3634fd29fa81e0e0443b2b2', '1b12ae73c54149899ef66312dc7712cb', '69e843c71634401fad313f8dd0580192', '猪筋', '002001008003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('93ea9147788845f29d50a2a498828654', '1b12ae73c54149899ef66312dc7712cb', 'e2520515a9f34d05aae17f5584249bef', '鹅胗', '002006006004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('94318d92e9174c06bb976c85c5b74325', '1b12ae73c54149899ef66312dc7712cb', '94f6d01643da453baef3ea2424f0e2bc', '骡软骨', '002009007006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('94af92a269534af497432b844871dbe7', '1b12ae73c54149899ef66312dc7712cb', '145b7610f5344548ab347d26ba517055', '羊肉', '002003001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('94e78ad0e8b7475385cbd22a60b951d8', '1b12ae73c54149899ef66312dc7712cb', '345c7604230a437fb7ac670b02e1b1cf', '骡耳', '002009006011', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('94f6d01643da453baef3ea2424f0e2bc', '1b12ae73c54149899ef66312dc7712cb', null, '骡头蹄骨血类', '002009007', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('95501decb0a64192adae3c89d9bebb68', '1b12ae73c54149899ef66312dc7712cb', 'ea344863cb1a42ae9516a29ac41c502e', '驴脂肪', '002008006002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('955dddfde2ee402e85f9fd350cc868e3', 'aee8d777ece843d98a4ec79828114e71', '45fd34c812ca44a78b90d4c434312b7d', '狍子', '001017010', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('956dc8d2d32047dba971fdbcc9e655a1', 'aee8d777ece843d98a4ec79828114e71', '4b4074309ef440fc95ace64bac378980', '水生稚体', '001010004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('95d7998b3597405397cd69d91813ded3', '1b12ae73c54149899ef66312dc7712cb', '3612d870b5bb478a957a51cf0b2c9dff', '马胰脏', '002007007006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('968206e3fd674ba6b23d42b97e3dc6ae', '1b12ae73c54149899ef66312dc7712cb', 'dd9d37a74f354cc89bb2d340df8ea060', '鸭头', '002005005004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('9706180079d34f4d9cb4fd07b606393e', 'aee8d777ece843d98a4ec79828114e71', 'f7c0b8e834b446348abcffbda27a9176', '马', '001009001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('971a7b4b077c40debca9f823a3f42640', '1b12ae73c54149899ef66312dc7712cb', 'f44986e5ffd74d33ba85b15bcfe990d1', '鸭血', '002005007003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('97292fcbd3684080a7b5d500ab5ae8c5', 'f2722a57812f4f2da0ead015e545b2c2', null, '猪', '003001', null, '1', '2018-03-02 17:18:33', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('977637180eef404986e55a583cd7d8f8', '1b12ae73c54149899ef66312dc7712cb', '7887aa6f37734c5ba6db0ca6d5c1fc67', '牛蹄', '002002009003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('97c0e5019a004719a2ad1e27623401b7', 'f2722a57812f4f2da0ead015e545b2c2', null, '鸽子', '003011', null, '1', '2018-03-02 17:49:32', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('97e14b0e857a4a43af23b0d3dd8988ac', '1b12ae73c54149899ef66312dc7712cb', 'ff02a8d04e374b36a3157c301f675b91', '鸽肉', '002013001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('9808e30d4b314ce9a16aaa125664e538', '1b12ae73c54149899ef66312dc7712cb', 'fe321635ce6e44e18bc782d52be6003b', '牛胰脏', '002002008006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('983421ca6e024c2cb2ddd4751f04e16b', '1b12ae73c54149899ef66312dc7712cb', 'a394242f19e4476eacaaa04a6ead308c', '马软骨', '002007008006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('9841ffdff21244e39a520c3793cd3e1a', '1b12ae73c54149899ef66312dc7712cb', '491e7670bbcb457abf4c753461eb272c', '羊脾', '002003009005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('9881a9b0024b490fa200c2fa2fe02f50', '1b12ae73c54149899ef66312dc7712cb', '1d1e326d6dcd482eb5436247b76d91f5', '鸡骨', '002004006001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('98a16a346cdf4549a175d443068b18e4', '1b12ae73c54149899ef66312dc7712cb', 'fe321635ce6e44e18bc782d52be6003b', '牛舌', '002002008010', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('98cbbd22129a4f249dc6722e1defa8a2', '1b12ae73c54149899ef66312dc7712cb', null, '兔内脏器官类', '002012006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('995f1f9d0eeb47638d9eb0478de87550', '1b12ae73c54149899ef66312dc7712cb', 'fe321635ce6e44e18bc782d52be6003b', '牛耳', '002002008009', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('998ceb1c1cdc4efd90a851ef990670a1', 'f2722a57812f4f2da0ead015e545b2c2', '8f9bb30629cc4d55bf6d85d8394dac9b', '种鹅蛋', '002006002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('99b2c65a03a34239b969721709460e28', 'e966e2f5d783406ca0242c77069d85dd', '409525c87aae4f78be793fa2fa89eeb9', '添加剂预混合饲料', 'production_siliao_tjj', null, '1bf361b7435d4a289556b901ec9b0c98', '2018-05-06 21:58:08', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('9c57ee97acfc462d809457ea582f5b90', '1b12ae73c54149899ef66312dc7712cb', '45cc8e076448485587940de80d65b418', '驴胃', '002008007009', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('9d187b7f97184e789f092b6543af8f98', '1b12ae73c54149899ef66312dc7712cb', '98cbbd22129a4f249dc6722e1defa8a2', '兔肾', '002012006004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('9d2241a1e0c340d29a91e3aa952fbda7', '1b12ae73c54149899ef66312dc7712cb', 'fe321635ce6e44e18bc782d52be6003b', '牛脑', '002002008008', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('9d3a964271794e02a347792cd006989f', '1b12ae73c54149899ef66312dc7712cb', '5165c25f86214f3ba7551a2079c407f8', '羊蹄', '002003010003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('9e309a7510ee4b9db13a41b3b17b5553', '1b12ae73c54149899ef66312dc7712cb', '345c7604230a437fb7ac670b02e1b1cf', '骡舌', '002009006012', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('9f02232510e24a28bd2b943a06a7d7dc', 'aee8d777ece843d98a4ec79828114e71', '45fd34c812ca44a78b90d4c434312b7d', '大雁', '001017008', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('9f67c90cbce347d3b329be02925bb891', '1b12ae73c54149899ef66312dc7712cb', '331f73d36f0d47e28b2afa95af18360e', '骆驼绒', '002011003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('a027f5538b6b43388da7cf90e9a7d240', 'f2722a57812f4f2da0ead015e545b2c2', '97292fcbd3684080a7b5d500ab5ae8c5', '种猪', '001001002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('a0579538806645e1a6d8a68f9aff753a', 'b01ab303d2084b6889fb7a3629803a60', null, '鸡', 'nonharmful_disposal_2', null, '1', '2018-03-16 16:30:26', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('a0ec0972f0de40ffa656cafc75156151', '1b12ae73c54149899ef66312dc7712cb', 'ba1109d87a994b3bbab4475873006250', '猪肘', '002001006002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('a118a784695f44ee92259d2ab85d40a2', '1b12ae73c54149899ef66312dc7712cb', 'd47dcbd463b44d1e96d1124b920b2a27', '羊胴体', '002003008001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('a1550e5bcb4346f0bbf6ccc1f0f5c51e', 'aee8d777ece843d98a4ec79828114e71', 'e1a78160158741619bcd6017e39a3e03', '鸡', '001004001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('a24160e36b9f4e38a56bee5795165fa1', 'aee8d777ece843d98a4ec79828114e71', 'f7c0b8e834b446348abcffbda27a9176', '骡', '001009003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('a31b8854490d4d0fba756b4c453aca79', '1b12ae73c54149899ef66312dc7712cb', '98cbbd22129a4f249dc6722e1defa8a2', '兔阴茎', '002012006011', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('a37fbbb12f5a436f8ffe57ade8940cc9', '1b12ae73c54149899ef66312dc7712cb', '69e843c71634401fad313f8dd0580192', '猪排骨', '002001008007', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('a394242f19e4476eacaaa04a6ead308c', '1b12ae73c54149899ef66312dc7712cb', null, '马头蹄骨血类', '002007008', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('a45cb54e616e4df591c48f24ab4d36f2', '1b12ae73c54149899ef66312dc7712cb', '45cc8e076448485587940de80d65b418', '驴肠', '002008007007', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('a47bf3c8a9764071b716c6627e108068', '1b12ae73c54149899ef66312dc7712cb', 'fe321635ce6e44e18bc782d52be6003b', '牛尾', '002002008011', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('a4ae7ae5b30c461abff1d8eeeaf6e83d', '1b12ae73c54149899ef66312dc7712cb', '894eccffc7c749149e36b07d8b9c3f58', '骡脂肪', '002009005002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('a4f088c679e34f689b76fe870b1bfc4f', '1b12ae73c54149899ef66312dc7712cb', 'fe321635ce6e44e18bc782d52be6003b', '牛肝', '002002008003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('a552109bab384118a23c958cb344e80b', '1b12ae73c54149899ef66312dc7712cb', '3612d870b5bb478a957a51cf0b2c9dff', '马肠衣', '002007007008', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('a5c049ca972c4b3ebde3a0e06b6ae3b6', '1b12ae73c54149899ef66312dc7712cb', 'a394242f19e4476eacaaa04a6ead308c', '马脸', '002007008002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('a67910ead10b4ef3b87e0a1db407ef93', 'aee8d777ece843d98a4ec79828114e71', '15280ad066874badb23a342acd3e5222', '野鸭', '001005004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('a6eb0b140060415dab79b28183b954bc', '1b12ae73c54149899ef66312dc7712cb', 'fe321635ce6e44e18bc782d52be6003b', '牛心管', '002002008016', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('a81e5412035444c89dcd0d47edd178d8', 'f2722a57812f4f2da0ead015e545b2c2', 'b250a11b5954475cb29a05090655d21d', '种羊精液', '002003002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('a85e0053887744b59740ed9e86e0a61d', '1b12ae73c54149899ef66312dc7712cb', '894eccffc7c749149e36b07d8b9c3f58', '其他', '002009005004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('a87ae8880b424826936bd992ace86c3c', '1b12ae73c54149899ef66312dc7712cb', null, '鸭内脏器官类', '002005006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('a91266b9005d41a9a8f0658315223f01', 'f2722a57812f4f2da0ead015e545b2c2', '64cff95e996a472984acdab2edd638c7', '种骆驼精液', '002011002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('a978e0604c92434aa0183aa4f09535d1', '1b12ae73c54149899ef66312dc7712cb', 'f5e48bac749847699d221cf72ff0a02f', '猪肾', '002001007004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('a994ec98d29f4ca59d8eb347efb93782', '1b12ae73c54149899ef66312dc7712cb', 'bb5e05cae78948ebb2f35f80df3051c7', '鸡皮', '002004004002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('aa001a150f37409b9e5ad5a4aca38480', 'aee8d777ece843d98a4ec79828114e71', 'e44f91ba251e4056bf2a2bca690cdcb7', '藏獒', '001007006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('ac2590b84c3c4a259f0686eacfb6b525', '1b12ae73c54149899ef66312dc7712cb', 'c8522108ea7f44f5ab42360734a46c53', '马骨', '002007003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('ac3c43ab0e12493e83c33d044335f5e1', '1b12ae73c54149899ef66312dc7712cb', 'f5e48bac749847699d221cf72ff0a02f', '猪鼻', '002001007013', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('ac4a30ad8a82403a8040b3ad2bb532e5', '1b12ae73c54149899ef66312dc7712cb', 'ba1109d87a994b3bbab4475873006250', '猪胴体', '002001006001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('ac85c17f55b9422b8a61ac4584c13357', 'aee8d777ece843d98a4ec79828114e71', null, '羊', '001003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('acbe0eae52964efe94729f43d90b9d8b', '1b12ae73c54149899ef66312dc7712cb', 'c8522108ea7f44f5ab42360734a46c53', '马肉', '002007001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('ace667a237ec43c7b21faf2a2238323c', '1b12ae73c54149899ef66312dc7712cb', '69e843c71634401fad313f8dd0580192', '猪血', '002001008008', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('b16c4045c3be4b1e96c1990dc6ce2f95', 'f2722a57812f4f2da0ead015e545b2c2', '3d076a96302744bba6a2b97ec7430103', '种牛', '001002002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('b186a7c712184548942e40cfb9d48ee6', '1b12ae73c54149899ef66312dc7712cb', 'ea344863cb1a42ae9516a29ac41c502e', '驴腿', '002008006003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('b19ba507344e4810ab217d3a4906617c', '1b12ae73c54149899ef66312dc7712cb', '345c7604230a437fb7ac670b02e1b1cf', '骡肾', '002009006004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('b1f7dd62817b44b0878976e37e66b0a6', '1b12ae73c54149899ef66312dc7712cb', '2d02c35c3c794d2790e7b3c2e434e2b6', '白条鹅', '002006005001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('b2031fb6d798400e85eb0a1514af5415', 'aee8d777ece843d98a4ec79828114e71', 'e1a78160158741619bcd6017e39a3e03', '野鸡', '001004004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('b22e3efcd2ad4113929fe162e29d326e', 'aee8d777ece843d98a4ec79828114e71', 'c7b81538c4bf492b90ac52dbebf6c31b', '骆驼', '001012001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('b250a11b5954475cb29a05090655d21d', 'f2722a57812f4f2da0ead015e545b2c2', null, '羊', '003003', null, '1', '2018-03-02 17:23:03', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('b2ad15cc2938445a81b966c92b8248b2', 'aee8d777ece843d98a4ec79828114e71', 'c604d529684248f698a03c651a993206', '猪', '001001001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('b3f26e42429147218b2b3a39c79c2783', '1b12ae73c54149899ef66312dc7712cb', '345c7604230a437fb7ac670b02e1b1cf', '骡气管', '002009006013', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('b40030b9d5924ef7bf9d13a4daee1691', '1b12ae73c54149899ef66312dc7712cb', null, '驴', '002008', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('b40852dd719e47808152f2247f68010f', '1b12ae73c54149899ef66312dc7712cb', '98cbbd22129a4f249dc6722e1defa8a2', '兔心', '002012006001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('b458c346671b425cabe4deed4c04743a', '1b12ae73c54149899ef66312dc7712cb', 'ea344863cb1a42ae9516a29ac41c502e', '其他', '002008006004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('b5954d8da45b422eb3b840f4288b835c', '1b12ae73c54149899ef66312dc7712cb', 'be5bedb995bd4de3a0508346f727e3bb', '其他', '002002007003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('b648e31f4d814d559cba324b8883a2d0', 'f2722a57812f4f2da0ead015e545b2c2', '33564ba589ae4c608af37984c5efa4e3', '种鹿精液', '002010002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('b674430b5c8d4dbc8742c51f2f57fa67', '1b12ae73c54149899ef66312dc7712cb', 'bd454f339e394638bc863694c8121fc6', '鸭毛', '002005004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('b68dd7c198624514abc1dca225a8a5b7', '1b12ae73c54149899ef66312dc7712cb', '2f5c18cca3884871ad2bd71e4bf800cc', '骡骨', '002009002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('b6aa5ba3b7ed4c559004266cb8d0f449', '1b12ae73c54149899ef66312dc7712cb', '145b7610f5344548ab347d26ba517055', '羊原毛', '002003006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('b6dfad49e5b14e34896cc63822c3485b', 'e966e2f5d783406ca0242c77069d85dd', '99b2c65a03a34239b969721709460e28', '水产饲料', 'production_siliao_tjj_sc', null, '1bf361b7435d4a289556b901ec9b0c98', '2018-05-06 22:00:11', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('b7ce1d21f81240169f53a72d055626b4', '1b12ae73c54149899ef66312dc7712cb', 'f5e48bac749847699d221cf72ff0a02f', '猪睾丸', '002001007017', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('b8cd0c69440e42bd99c5db22d390b0f2', '1b12ae73c54149899ef66312dc7712cb', '7887aa6f37734c5ba6db0ca6d5c1fc67', '其他', '002002009008', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('b998234560804bf2b988283ef8b7236a', '1b12ae73c54149899ef66312dc7712cb', 'bb5e05cae78948ebb2f35f80df3051c7', '白条鸡', '002004004001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('b9adc5a7a4e34552a27e4793da4a228d', '1b12ae73c54149899ef66312dc7712cb', 'e2520515a9f34d05aae17f5584249bef', '其他', '002006006007', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('b9eb3700b108435fb3080f5c6ffa563c', 'f2722a57812f4f2da0ead015e545b2c2', '97c0e5019a004719a2ad1e27623401b7', '种鸽子蛋', '002013002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('ba1109d87a994b3bbab4475873006250', '1b12ae73c54149899ef66312dc7712cb', null, '猪肉类', '002001006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('bb5e05cae78948ebb2f35f80df3051c7', '1b12ae73c54149899ef66312dc7712cb', null, '鸡肉类', '002004004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('bc4d7af4693d40809ed36948ee30055c', 'f2722a57812f4f2da0ead015e545b2c2', '59c11d34dfe94cf1a1307a88c43e4f94', '种马精液', '002007002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('bcc52f2be9ee4f57a97a694cd9d5adc0', '1b12ae73c54149899ef66312dc7712cb', '8e0c209b076e48c09cdf38764b3879f0', '牛骨', '002002003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('bd454f339e394638bc863694c8121fc6', '1b12ae73c54149899ef66312dc7712cb', null, '鸭', '002005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('be5bedb995bd4de3a0508346f727e3bb', '1b12ae73c54149899ef66312dc7712cb', null, '牛肉类', '002002007', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('be6617594e344b1a9ad6beb98a325774', '1b12ae73c54149899ef66312dc7712cb', 'f5e48bac749847699d221cf72ff0a02f', '猪脑', '002001007010', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('beb6553dd3eb49198f19e30022d613fb', '1b12ae73c54149899ef66312dc7712cb', 'fe321635ce6e44e18bc782d52be6003b', '牛胸腺', '002002008017', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('bec19c5eb0ed40cd9fda2e353755d1ab', '1b12ae73c54149899ef66312dc7712cb', 'dd9d37a74f354cc89bb2d340df8ea060', '其他', '002005005009', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('c1064f546e7e49daa04f5c4c36e980c4', '1b12ae73c54149899ef66312dc7712cb', '7887aa6f37734c5ba6db0ca6d5c1fc67', '牛肉筋', '002002009005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('c115e8f5f56944e6a9bd13f7c965fe42', '1b12ae73c54149899ef66312dc7712cb', '5165c25f86214f3ba7551a2079c407f8', '羊板筋', '002003010004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('c15d08310367446a87420364529f20ca', 'aee8d777ece843d98a4ec79828114e71', 'ec000be6609545ef9d6d08f0fbdae001', '野鹅', '001006004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('c17a4dbc9fb84732a0bf466617c35755', '1b12ae73c54149899ef66312dc7712cb', 'b40030b9d5924ef7bf9d13a4daee1691', '驴生皮', '002008004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('c1c73eaebae848bfb9f3a0c70cba3022', '1b12ae73c54149899ef66312dc7712cb', 'bd454f339e394638bc863694c8121fc6', '鸭绒', '002005003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('c27ddb58f4b64d70acba7c34eee9ad2b', 'aee8d777ece843d98a4ec79828114e71', 'ec000be6609545ef9d6d08f0fbdae001', '鹅', '001006001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('c2c182761a77451e8b694c35ac07cb48', '1b12ae73c54149899ef66312dc7712cb', 'fe321635ce6e44e18bc782d52be6003b', '牛阴茎', '002002008018', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('c3e798d0b7994c57a82b18aae53b0a4a', 'e966e2f5d783406ca0242c77069d85dd', 'eb7cc0a6fbac4ed8835125648e8727ff', '反刍动物饲料', 'production_siliao_ns_fcdw', null, '1bf361b7435d4a289556b901ec9b0c98', '2018-05-06 21:55:51', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('c43f39b34e9243e8bbb5eb6e9002328d', '1b12ae73c54149899ef66312dc7712cb', '345c7604230a437fb7ac670b02e1b1cf', '骡胃', '002009006009', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('c4f090fed5fa4fde886e52e04371fd1e', 'f2722a57812f4f2da0ead015e545b2c2', null, '鸭', '003005', null, '1', '2018-03-02 17:24:56', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('c50a47f754e946b9a4b93f3e2121757c', '1b12ae73c54149899ef66312dc7712cb', '2d02c35c3c794d2790e7b3c2e434e2b6', '其他', '002006005009', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('c52d724b7103456ebc31abc1e6299f6c', '1b12ae73c54149899ef66312dc7712cb', '45cc8e076448485587940de80d65b418', '驴脾', '002008007005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('c587f30fe917430383a7e2e74ada3154', '1b12ae73c54149899ef66312dc7712cb', '3815f262edab4d01bf8e34d06fada9d8', '白条兔', '002012005001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('c59d2a21fb7041fc882890677cc01283', '1b12ae73c54149899ef66312dc7712cb', 'f5e48bac749847699d221cf72ff0a02f', '猪尾', '002001007015', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('c5d7be5ba96f4f14883656163832a168', '1b12ae73c54149899ef66312dc7712cb', '491e7670bbcb457abf4c753461eb272c', '羊胰脏', '002003009006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('c604d529684248f698a03c651a993206', 'aee8d777ece843d98a4ec79828114e71', null, '猪', '001001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('c61f626072804385a7c8bd457fa95708', 'f2722a57812f4f2da0ead015e545b2c2', '64cff95e996a472984acdab2edd638c7', '种骆驼', '001012002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('c653cd2d8f444b2689cd4f845e883917', '1b12ae73c54149899ef66312dc7712cb', '69e843c71634401fad313f8dd0580192', '猪软骨', '002001008005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('c65d1908599a4a07af568fdc678799ab', '1b12ae73c54149899ef66312dc7712cb', 'bb5e05cae78948ebb2f35f80df3051c7', '鸡翅', '002004004006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('c7b81538c4bf492b90ac52dbebf6c31b', 'aee8d777ece843d98a4ec79828114e71', null, '骆驼', '001012', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('c8522108ea7f44f5ab42360734a46c53', '1b12ae73c54149899ef66312dc7712cb', null, '马', '002007', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('c89527a9748c4892991fa62a31abe38b', '1b12ae73c54149899ef66312dc7712cb', 'f3b7c85067bb4f23b6cd8a72efccc7e9', '马脂肪', '002007006002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('c898c8b93b794c8daaf049908e79359f', '1b12ae73c54149899ef66312dc7712cb', '491e7670bbcb457abf4c753461eb272c', '其他', '002003009017', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('cc900f511dc6476388a3ab81b763553c', '1b12ae73c54149899ef66312dc7712cb', '98cbbd22129a4f249dc6722e1defa8a2', '其他', '002012006012', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('ccef654564e34887819d1733c4aa9951', '1b12ae73c54149899ef66312dc7712cb', '7246f45f48824f49bfabad68fef3c83a', '驴血', '002008008004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('cf3505b273524a30b18636aaddb8fc0c', '1b12ae73c54149899ef66312dc7712cb', null, '鹌鹑', '002014', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('cfd1f44b5b7c4e368c866737183a4417', '1b12ae73c54149899ef66312dc7712cb', '5c5fd500aa624cdf8a0c57f5be3a4641', '鹿毛', '002010001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('d064bc560fdf42c89c1f87a6b27e843d', '1b12ae73c54149899ef66312dc7712cb', '345c7604230a437fb7ac670b02e1b1cf', '骡肺', '002009006002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('d1785a35fe78452e845deedb0d72dc55', '1b12ae73c54149899ef66312dc7712cb', null, '其他', '002015', null, 'adebe6ea28ef4121846100b854ed96b2', '2018-05-02 16:55:11', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('d27f6de7897b4825b418aaeb94f65b5c', '1b12ae73c54149899ef66312dc7712cb', '45cc8e076448485587940de80d65b418', '驴耳', '002008007011', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('d4257ee297fe424ebcd726cc94b27a75', '1b12ae73c54149899ef66312dc7712cb', 'b40030b9d5924ef7bf9d13a4daee1691', '驴原毛', '002008005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('d47da7c0ac5649b880df50155daf32ea', '1b12ae73c54149899ef66312dc7712cb', '98cbbd22129a4f249dc6722e1defa8a2', '兔肠', '002012006007', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('d47dcbd463b44d1e96d1124b920b2a27', '1b12ae73c54149899ef66312dc7712cb', null, '羊肉类', '002003008', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('d6591f523e584ae8ad9e7c7ae76b42b2', '1b12ae73c54149899ef66312dc7712cb', '2f5c18cca3884871ad2bd71e4bf800cc', '骡肉', '002009001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('d78a33dcd78d48119257c4044a6d002f', '1b12ae73c54149899ef66312dc7712cb', '7246f45f48824f49bfabad68fef3c83a', '驴头', '002008008001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('d873c40b9c784563ad1baca51b64720b', 'aee8d777ece843d98a4ec79828114e71', 'f7c0b8e834b446348abcffbda27a9176', '野驴', '001009005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('d8a0c7d53b894212826c3222c3ced195', '1b12ae73c54149899ef66312dc7712cb', 'cf3505b273524a30b18636aaddb8fc0c', '鹌鹑肉', '002014001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('d8ef2064771f4b6ebd3fe528087bde4b', '1b12ae73c54149899ef66312dc7712cb', '2d02c35c3c794d2790e7b3c2e434e2b6', '鹅腿', '002006005005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('d90f62adc02c4464bea65099454954f2', '1b12ae73c54149899ef66312dc7712cb', '69e843c71634401fad313f8dd0580192', '猪脸', '002001008002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('d93bb343933d4882845d568e5d298171', '1b12ae73c54149899ef66312dc7712cb', '45cc8e076448485587940de80d65b418', '驴舌', '002008007012', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('d9453d22418c4c26889d3c8ddd631b70', '1b12ae73c54149899ef66312dc7712cb', 'a87ae8880b424826936bd992ace86c3c', '其他', '002005006007', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('d9542aef1d8f49d3ae4642dd52196a55', '1b12ae73c54149899ef66312dc7712cb', '2d02c35c3c794d2790e7b3c2e434e2b6', '鹅翅', '002006005006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('dabcc9e3bb8a4db1bcf5646e53afd3ea', '1b12ae73c54149899ef66312dc7712cb', '45cc8e076448485587940de80d65b418', '驴肝', '002008007002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('dc723c62830a4d87b46b614cd8fe7f2c', '1b12ae73c54149899ef66312dc7712cb', '3612d870b5bb478a957a51cf0b2c9dff', '其他', '002007007017', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('dd1f5372297f49f2ae80ff1431db9b34', '1b12ae73c54149899ef66312dc7712cb', '69e843c71634401fad313f8dd0580192', '猪头', '002001008001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('dd9d37a74f354cc89bb2d340df8ea060', '1b12ae73c54149899ef66312dc7712cb', null, '鸭肉类', '002005005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('ddefa5c3919d46409db21d6f0457d704', '1b12ae73c54149899ef66312dc7712cb', '1e35470bd9954d70b566afcd8f3a4bed', '鹅排', '002006007002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('de2f7c2ce7a941efac7c3e2c3b000d18', '1b12ae73c54149899ef66312dc7712cb', '45cc8e076448485587940de80d65b418', '驴肠衣', '002008007008', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('dec13e04e3814271880a2896a9777715', '1b12ae73c54149899ef66312dc7712cb', 'ff02a8d04e374b36a3157c301f675b91', '白条鸽', '002013003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('dee7b911066c498bb7005de33bbd50cf', '1b12ae73c54149899ef66312dc7712cb', null, '鹅', '002006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('dfd2b0ffe89d4292b117518d9eadf56d', '1b12ae73c54149899ef66312dc7712cb', '345c7604230a437fb7ac670b02e1b1cf', '其他', '002009006017', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('e1a78160158741619bcd6017e39a3e03', 'aee8d777ece843d98a4ec79828114e71', null, '鸡', '001004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('e1ce64c412c04f34943f2077b7e7fc33', 'aee8d777ece843d98a4ec79828114e71', '4daaf81c01cf41359b6a53d5ea7b417c', '狮', '001008003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('e2520515a9f34d05aae17f5584249bef', '1b12ae73c54149899ef66312dc7712cb', null, '鹅内脏器官类', '002006006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('e30c0e2fc5f442b495c473f5ff8ea415', 'e966e2f5d783406ca0242c77069d85dd', '99b2c65a03a34239b969721709460e28', '猪饲料', 'production_siliao_tjj_zsl', null, '1bf361b7435d4a289556b901ec9b0c98', '2018-05-06 21:58:27', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('e3a250af6be84f4b93ce10407d2fd997', '1b12ae73c54149899ef66312dc7712cb', '45cc8e076448485587940de80d65b418', '驴膀胱', '002008007014', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('e44f91ba251e4056bf2a2bca690cdcb7', 'aee8d777ece843d98a4ec79828114e71', null, '犬科', '001007', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('e4688f358e234fd3a1cca2f487d4e769', '1b12ae73c54149899ef66312dc7712cb', '3612d870b5bb478a957a51cf0b2c9dff', '马肠', '002007007007', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('e52a2eda6e33496bb3d9e5bea1fad3b7', '1b12ae73c54149899ef66312dc7712cb', '345c7604230a437fb7ac670b02e1b1cf', '骡肝', '002009006003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('e5869e1343584c6cadde81ae983be1c1', '1b12ae73c54149899ef66312dc7712cb', '2d02c35c3c794d2790e7b3c2e434e2b6', '鹅掌', '002006005008', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('e5f4e0da0c2a44bc8237d6f08b95b1ec', '1b12ae73c54149899ef66312dc7712cb', 'f5e48bac749847699d221cf72ff0a02f', '猪胃', '002001007007', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('e6ce2a1f603b44a3a3f04e95d7d2a065', 'aee8d777ece843d98a4ec79828114e71', '45fd34c812ca44a78b90d4c434312b7d', '兔', '001017005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('e6e4038530f34c14830afafe016c51fc', '1b12ae73c54149899ef66312dc7712cb', '53ab5ce32a7148bdb3ecf0b450a49e9f', '鸡胗', '002004005004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('e761724b64dc40b2aa8d0fcb212f1d30', 'aee8d777ece843d98a4ec79828114e71', '4b4074309ef440fc95ace64bac378980', '水生发眼卵', '001010007', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('e7d58a6ee71046118be3794fc70e521a', 'f2722a57812f4f2da0ead015e545b2c2', '33564ba589ae4c608af37984c5efa4e3', '种鹿', '001011002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('e87ee86b71474820a3c78f2efb09b064', 'e966e2f5d783406ca0242c77069d85dd', 'eb7cc0a6fbac4ed8835125648e8727ff', '猪饲料', 'production_siliao_ns_zsl', null, '1bf361b7435d4a289556b901ec9b0c98', '2018-05-06 21:54:16', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('e9495b42d8374d94b26f1f95bd609e3c', 'f2722a57812f4f2da0ead015e545b2c2', '4a5fca2145ef4f79a1e254c4d8af27e8', '种驴精液', '002008002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('e964fd00db8647ecaab0b58cc4a336c0', 'e966e2f5d783406ca0242c77069d85dd', '52e33f7a3d874a8094a0bd455dab524b', '其他', 'production_siliao_ph_qt', null, '1bf361b7435d4a289556b901ec9b0c98', '2018-05-06 21:53:27', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('e992a86ad6384ae283940bc111ddcddd', 'aee8d777ece843d98a4ec79828114e71', '20e56612527641af93ed46fe3c7b57fa', '野鹿', '001011004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('e9d0c543c59f4c7aa6dd887c149dd10f', 'e966e2f5d783406ca0242c77069d85dd', 'eb7cc0a6fbac4ed8835125648e8727ff', '宠物饲料', 'production_siliao_ns_cw', null, '1bf361b7435d4a289556b901ec9b0c98', '2018-05-06 21:56:10', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('e9d0eeeac55a466d9b9e15d214e2f0cd', '1b12ae73c54149899ef66312dc7712cb', null, '猪', '002001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('ea344863cb1a42ae9516a29ac41c502e', '1b12ae73c54149899ef66312dc7712cb', null, '驴肉类', '002008006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('ea46b0cfc7e945e3892bec563638228b', '1b12ae73c54149899ef66312dc7712cb', 'a87ae8880b424826936bd992ace86c3c', '鸭心', '002005006002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('eaa4e5b97a0e4326a8f43a0b611d6d70', '1b12ae73c54149899ef66312dc7712cb', 'bb5e05cae78948ebb2f35f80df3051c7', '鸡头', '002004004003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('eb32e7281e1b46b1a9af77d018b52a82', '1b12ae73c54149899ef66312dc7712cb', 'f3b7c85067bb4f23b6cd8a72efccc7e9', '其他', '002007006004', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('eb7cc0a6fbac4ed8835125648e8727ff', 'e966e2f5d783406ca0242c77069d85dd', '409525c87aae4f78be793fa2fa89eeb9', '浓缩饲料', 'production_siliao_ns', null, '1bf361b7435d4a289556b901ec9b0c98', '2018-05-06 21:53:50', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('ec000be6609545ef9d6d08f0fbdae001', 'aee8d777ece843d98a4ec79828114e71', null, '鹅', '001006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('ec05673d5b8648db828ee725f3606e84', 'e966e2f5d783406ca0242c77069d85dd', '99b2c65a03a34239b969721709460e28', '反刍动物饲料', 'production_siliao_tjj_fcdw', null, '1bf361b7435d4a289556b901ec9b0c98', '2018-05-06 22:00:37', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('ecb94a25a5884ab286419a16ab8c73cd', 'aee8d777ece843d98a4ec79828114e71', '4b4074309ef440fc95ace64bac378980', '鱼苗', '001010001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('ed167f7bf6324b37ad0e022e55aee946', 'aee8d777ece843d98a4ec79828114e71', '45fd34c812ca44a78b90d4c434312b7d', '麻雀', '001017012', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('ee6176f030d844c68ff1d591340e4e85', 'aee8d777ece843d98a4ec79828114e71', '4b4074309ef440fc95ace64bac378980', '水生幼体', '001010005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('eecf5324dc8e437c9595a7a9dc658c62', 'e966e2f5d783406ca0242c77069d85dd', '99b2c65a03a34239b969721709460e28', '肉禽饲料', 'production_siliao_tjj_rq', null, '1bf361b7435d4a289556b901ec9b0c98', '2018-05-06 21:59:16', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('eee7c56410e049069d725134b2da6ef2', '1b12ae73c54149899ef66312dc7712cb', '3612d870b5bb478a957a51cf0b2c9dff', '马肺', '002007007002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('ef060574ce3b402bbdaa14b6dc805720', 'f2722a57812f4f2da0ead015e545b2c2', null, '鸡', '003004', null, '1', '2018-03-02 17:24:38', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('ef8104ef1c2a4a048272b804705bf0c4', 'e966e2f5d783406ca0242c77069d85dd', 'eb7cc0a6fbac4ed8835125648e8727ff', '水产饲料', 'production_siliao_ns_sc', null, '1bf361b7435d4a289556b901ec9b0c98', '2018-05-06 21:55:30', null, null, '1', null);
INSERT INTO `major_categories` VALUES ('f14af3256b88467c8928e65a85cc116a', 'f2722a57812f4f2da0ead015e545b2c2', 'c4f090fed5fa4fde886e52e04371fd1e', '雏鸭', '001005003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('f14b183184394b6c9336bfaa598d14b1', 'aee8d777ece843d98a4ec79828114e71', '4daaf81c01cf41359b6a53d5ea7b417c', '猞猁', '001008005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('f1762f0643264e4fa3af41b451b4dfd5', '1b12ae73c54149899ef66312dc7712cb', '3612d870b5bb478a957a51cf0b2c9dff', '马脾', '002007007005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('f1a8cd5480dd4a8c883e46febbdf7aae', '1b12ae73c54149899ef66312dc7712cb', '45cc8e076448485587940de80d65b418', '驴气管', '002008007013', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('f244993d7c7e4a75af4b990d127652b6', '1b12ae73c54149899ef66312dc7712cb', 'fe321635ce6e44e18bc782d52be6003b', '牛心', '002002008001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('f33d62db7b064158bd75734be00326b7', '1b12ae73c54149899ef66312dc7712cb', '491e7670bbcb457abf4c753461eb272c', '羊肝', '002003009003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('f3b7c85067bb4f23b6cd8a72efccc7e9', '1b12ae73c54149899ef66312dc7712cb', null, '马肉类', '002007006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('f3e0fe95aaf34f3d8dea2d3f5d99969b', '1b12ae73c54149899ef66312dc7712cb', '3612d870b5bb478a957a51cf0b2c9dff', '马舌', '002007007012', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('f44986e5ffd74d33ba85b15bcfe990d1', '1b12ae73c54149899ef66312dc7712cb', null, '鸭骨血类', '002005007', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('f5e48bac749847699d221cf72ff0a02f', '1b12ae73c54149899ef66312dc7712cb', null, '猪内脏器官类', '002001007', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('f7c0b8e834b446348abcffbda27a9176', 'aee8d777ece843d98a4ec79828114e71', null, '马属', '001009', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('f89f6be9d1444c88981cca642b7264e6', '1b12ae73c54149899ef66312dc7712cb', '8e0c209b076e48c09cdf38764b3879f0', '牛原毛', '002002006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('f9244c0b084d420e84e6636013c5784f', '1b12ae73c54149899ef66312dc7712cb', '98cbbd22129a4f249dc6722e1defa8a2', '兔胰脏', '002012006006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('f9f9dcb666fd4fae881fd56a4c94cdd5', '1b12ae73c54149899ef66312dc7712cb', '145b7610f5344548ab347d26ba517055', '羊生皮', '002003005', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('fae3cb591f5645a4a1fe8978c036b79f', 'f2722a57812f4f2da0ead015e545b2c2', '3d076a96302744bba6a2b97ec7430103', '种牛精液', '002002002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('fc2979f03ecf4d6fa5622da2c518fc82', '1b12ae73c54149899ef66312dc7712cb', '491e7670bbcb457abf4c753461eb272c', '羊心', '002003009001', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('fc4978a8c98f439abcb29a00d3961c8e', '1b12ae73c54149899ef66312dc7712cb', '7246f45f48824f49bfabad68fef3c83a', '驴蹄', '002008008003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('fddd5da098d842fe844128ae45909473', '1b12ae73c54149899ef66312dc7712cb', 'cf3505b273524a30b18636aaddb8fc0c', '白条鹌鹑', '002014003', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('fe2a03949ff44f3fa5e5a8aa65da7f1e', '1b12ae73c54149899ef66312dc7712cb', '345c7604230a437fb7ac670b02e1b1cf', '骡胰脏', '002009006006', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('fe321635ce6e44e18bc782d52be6003b', '1b12ae73c54149899ef66312dc7712cb', null, '牛内脏器官类', '002002008', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('fe3efbc12a3f4c328c7b25d6b0792043', 'f2722a57812f4f2da0ead015e545b2c2', 'c4f090fed5fa4fde886e52e04371fd1e', '种鸭', '001005002', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('ff02a8d04e374b36a3157c301f675b91', '1b12ae73c54149899ef66312dc7712cb', null, '鸽子', '002013', null, null, null, null, null, '1', null);
INSERT INTO `major_categories` VALUES ('ffdc3f8ef4024c6bb336e1e4e864cfef', '1b12ae73c54149899ef66312dc7712cb', 'dd9d37a74f354cc89bb2d340df8ea060', '鸭脖', '002005005005', null, null, null, null, null, '1', null);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` varchar(36) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `ep_id` varchar(36) DEFAULT NULL,
  `purpose` tinyint(2) DEFAULT NULL COMMENT '消息用途1:GMP过期提醒 2:许可证过期提醒 3:存栏上报',
  `send_state` tinyint(1) DEFAULT NULL COMMENT '发送状态0:未发送 1:已发送',
  `path` varchar(100) DEFAULT NULL COMMENT '消息跳转路径',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `tenant_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for milk_buy
-- ----------------------------
DROP TABLE IF EXISTS `milk_buy`;
CREATE TABLE `milk_buy` (
  `id` varchar(36) NOT NULL,
  `certificate_id` varchar(36) DEFAULT NULL COMMENT '准运证编号',
  `car_number` varchar(20) DEFAULT NULL COMMENT '车牌号码',
  `car_name` varchar(36) DEFAULT NULL COMMENT '车辆所有者名称',
  `max_load` decimal(12,2) DEFAULT NULL COMMENT '核定最大运载量（吨）',
  `trans_scope` varchar(20) DEFAULT NULL COMMENT '生鲜乳运输范围',
  `approval_time` datetime DEFAULT NULL COMMENT '批准时间',
  `start_effective_time` datetime DEFAULT NULL COMMENT '准运证有效开始日期',
  `end_effective_time` datetime DEFAULT NULL COMMENT '准运证有效结束日期',
  `issuing_organ` varchar(20) DEFAULT NULL COMMENT '发证机关',
  `user_enterprise` varchar(36) DEFAULT NULL COMMENT '使用单位',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of milk_buy
-- ----------------------------

-- ----------------------------
-- Table structure for monthlist
-- ----------------------------
DROP TABLE IF EXISTS `monthlist`;
CREATE TABLE `monthlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mon` char(7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=375 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of monthlist
-- ----------------------------
INSERT INTO `monthlist` VALUES ('248', '2018-01');
INSERT INTO `monthlist` VALUES ('249', '2018-02');
INSERT INTO `monthlist` VALUES ('250', '2018-03');
INSERT INTO `monthlist` VALUES ('251', '2018-04');
INSERT INTO `monthlist` VALUES ('252', '2018-05');
INSERT INTO `monthlist` VALUES ('253', '2018-06');
INSERT INTO `monthlist` VALUES ('254', '2018-07');
INSERT INTO `monthlist` VALUES ('255', '2018-08');
INSERT INTO `monthlist` VALUES ('256', '2018-09');
INSERT INTO `monthlist` VALUES ('257', '2018-10');
INSERT INTO `monthlist` VALUES ('258', '2018-11');
INSERT INTO `monthlist` VALUES ('259', '2018-12');
INSERT INTO `monthlist` VALUES ('260', '2019-01');
INSERT INTO `monthlist` VALUES ('261', '2019-02');
INSERT INTO `monthlist` VALUES ('262', '2019-03');
INSERT INTO `monthlist` VALUES ('263', '2019-04');
INSERT INTO `monthlist` VALUES ('264', '2019-05');
INSERT INTO `monthlist` VALUES ('265', '2019-06');
INSERT INTO `monthlist` VALUES ('266', '2019-07');
INSERT INTO `monthlist` VALUES ('267', '2019-08');
INSERT INTO `monthlist` VALUES ('268', '2019-09');
INSERT INTO `monthlist` VALUES ('269', '2019-10');
INSERT INTO `monthlist` VALUES ('270', '2019-11');
INSERT INTO `monthlist` VALUES ('271', '2019-12');
INSERT INTO `monthlist` VALUES ('272', '2020-01');
INSERT INTO `monthlist` VALUES ('273', '2020-02');
INSERT INTO `monthlist` VALUES ('274', '2020-03');
INSERT INTO `monthlist` VALUES ('275', '2020-04');
INSERT INTO `monthlist` VALUES ('276', '2020-05');
INSERT INTO `monthlist` VALUES ('277', '2020-06');
INSERT INTO `monthlist` VALUES ('278', '2020-07');
INSERT INTO `monthlist` VALUES ('279', '2020-08');
INSERT INTO `monthlist` VALUES ('280', '2020-09');
INSERT INTO `monthlist` VALUES ('281', '2020-10');
INSERT INTO `monthlist` VALUES ('282', '2020-11');
INSERT INTO `monthlist` VALUES ('283', '2020-12');
INSERT INTO `monthlist` VALUES ('284', '2021-01');
INSERT INTO `monthlist` VALUES ('285', '2021-02');
INSERT INTO `monthlist` VALUES ('286', '2021-03');
INSERT INTO `monthlist` VALUES ('287', '2021-04');
INSERT INTO `monthlist` VALUES ('288', '2021-05');
INSERT INTO `monthlist` VALUES ('289', '2021-06');
INSERT INTO `monthlist` VALUES ('290', '2021-07');
INSERT INTO `monthlist` VALUES ('291', '2021-08');
INSERT INTO `monthlist` VALUES ('292', '2021-09');
INSERT INTO `monthlist` VALUES ('293', '2021-10');
INSERT INTO `monthlist` VALUES ('294', '2021-11');
INSERT INTO `monthlist` VALUES ('295', '2021-12');
INSERT INTO `monthlist` VALUES ('296', '2022-01');
INSERT INTO `monthlist` VALUES ('297', '2022-02');
INSERT INTO `monthlist` VALUES ('298', '2022-03');
INSERT INTO `monthlist` VALUES ('299', '2022-04');
INSERT INTO `monthlist` VALUES ('300', '2022-05');
INSERT INTO `monthlist` VALUES ('301', '2022-06');
INSERT INTO `monthlist` VALUES ('302', '2022-07');
INSERT INTO `monthlist` VALUES ('303', '2022-08');
INSERT INTO `monthlist` VALUES ('304', '2022-09');
INSERT INTO `monthlist` VALUES ('305', '2022-10');
INSERT INTO `monthlist` VALUES ('306', '2022-11');
INSERT INTO `monthlist` VALUES ('307', '2022-12');
INSERT INTO `monthlist` VALUES ('308', '2023-01');
INSERT INTO `monthlist` VALUES ('309', '2023-02');
INSERT INTO `monthlist` VALUES ('310', '2023-03');
INSERT INTO `monthlist` VALUES ('311', '2023-04');
INSERT INTO `monthlist` VALUES ('312', '2023-05');
INSERT INTO `monthlist` VALUES ('313', '2023-06');
INSERT INTO `monthlist` VALUES ('314', '2023-07');
INSERT INTO `monthlist` VALUES ('315', '2023-08');
INSERT INTO `monthlist` VALUES ('316', '2023-09');
INSERT INTO `monthlist` VALUES ('317', '2023-10');
INSERT INTO `monthlist` VALUES ('318', '2023-11');
INSERT INTO `monthlist` VALUES ('319', '2023-12');
INSERT INTO `monthlist` VALUES ('320', '2024-01');
INSERT INTO `monthlist` VALUES ('321', '2024-02');
INSERT INTO `monthlist` VALUES ('322', '2024-03');
INSERT INTO `monthlist` VALUES ('323', '2024-04');
INSERT INTO `monthlist` VALUES ('324', '2024-05');
INSERT INTO `monthlist` VALUES ('325', '2024-06');
INSERT INTO `monthlist` VALUES ('326', '2024-07');
INSERT INTO `monthlist` VALUES ('327', '2024-08');
INSERT INTO `monthlist` VALUES ('328', '2024-09');
INSERT INTO `monthlist` VALUES ('329', '2024-10');
INSERT INTO `monthlist` VALUES ('330', '2024-11');
INSERT INTO `monthlist` VALUES ('331', '2024-12');
INSERT INTO `monthlist` VALUES ('332', '2025-01');
INSERT INTO `monthlist` VALUES ('333', '2025-02');
INSERT INTO `monthlist` VALUES ('334', '2025-03');
INSERT INTO `monthlist` VALUES ('335', '2025-04');
INSERT INTO `monthlist` VALUES ('336', '2025-05');
INSERT INTO `monthlist` VALUES ('337', '2025-06');
INSERT INTO `monthlist` VALUES ('338', '2025-07');
INSERT INTO `monthlist` VALUES ('339', '2025-08');
INSERT INTO `monthlist` VALUES ('340', '2025-09');
INSERT INTO `monthlist` VALUES ('341', '2025-10');
INSERT INTO `monthlist` VALUES ('342', '2025-11');
INSERT INTO `monthlist` VALUES ('343', '2025-12');
INSERT INTO `monthlist` VALUES ('344', '2026-01');
INSERT INTO `monthlist` VALUES ('345', '2026-02');
INSERT INTO `monthlist` VALUES ('346', '2026-03');
INSERT INTO `monthlist` VALUES ('347', '2026-04');
INSERT INTO `monthlist` VALUES ('348', '2026-05');
INSERT INTO `monthlist` VALUES ('349', '2026-06');
INSERT INTO `monthlist` VALUES ('350', '2026-07');
INSERT INTO `monthlist` VALUES ('351', '2026-08');
INSERT INTO `monthlist` VALUES ('352', '2026-09');
INSERT INTO `monthlist` VALUES ('353', '2026-10');
INSERT INTO `monthlist` VALUES ('354', '2026-11');
INSERT INTO `monthlist` VALUES ('355', '2026-12');
INSERT INTO `monthlist` VALUES ('356', '2027-01');
INSERT INTO `monthlist` VALUES ('357', '2027-02');
INSERT INTO `monthlist` VALUES ('358', '2027-03');
INSERT INTO `monthlist` VALUES ('359', '2027-04');
INSERT INTO `monthlist` VALUES ('360', '2027-05');
INSERT INTO `monthlist` VALUES ('361', '2027-06');
INSERT INTO `monthlist` VALUES ('362', '2027-07');
INSERT INTO `monthlist` VALUES ('363', '2027-08');
INSERT INTO `monthlist` VALUES ('364', '2027-09');
INSERT INTO `monthlist` VALUES ('365', '2027-10');
INSERT INTO `monthlist` VALUES ('366', '2027-11');
INSERT INTO `monthlist` VALUES ('367', '2027-12');

-- ----------------------------
-- Table structure for nonharmful_disposal_infos
-- ----------------------------
DROP TABLE IF EXISTS `nonharmful_disposal_infos`;
CREATE TABLE `nonharmful_disposal_infos` (
  `id` varchar(36) NOT NULL,
  `ep_id` varchar(36) DEFAULT NULL,
  `c_id` varchar(36) DEFAULT NULL COMMENT '行业分类id',
  `mc_id` varchar(36) DEFAULT NULL COMMENT '行业细化分类id',
  `disposal_ep_id` varchar(36) DEFAULT NULL COMMENT '目的地id',
  `dict_data_nhd_class` varchar(20) DEFAULT NULL COMMENT '无害化处理种类（字典数据编码）',
  `nhd_count` decimal(12,2) DEFAULT NULL COMMENT '无害化处理数量',
  `tenant_id` varchar(36) DEFAULT NULL,
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nonharmful_disposal_infos
-- ----------------------------

-- ----------------------------
-- Table structure for prevention_materials
-- ----------------------------
DROP TABLE IF EXISTS `prevention_materials`;
CREATE TABLE `prevention_materials` (
  `id` varchar(36) NOT NULL,
  `material_name` varchar(50) DEFAULT NULL COMMENT '物资名称',
  `city_code` varchar(20) DEFAULT NULL,
  `city_name` varchar(20) DEFAULT NULL,
  `country_code` varchar(20) DEFAULT NULL,
  `country_name` varchar(20) DEFAULT NULL,
  `town_code` varchar(20) DEFAULT NULL,
  `town_name` varchar(20) DEFAULT NULL,
  `detail_address` varchar(50) DEFAULT NULL,
  `principal_name` varchar(20) DEFAULT NULL,
  `principal_id_number` varchar(20) DEFAULT NULL,
  `principal_telphone` varchar(20) DEFAULT NULL,
  `dict_data_material_class` varchar(20) DEFAULT NULL COMMENT '物资种类（字典数据编码）',
  `material_count` decimal(12,2) DEFAULT NULL COMMENT '物资数量',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of prevention_materials
-- ----------------------------

-- ----------------------------
-- Table structure for prevention_reports
-- ----------------------------
DROP TABLE IF EXISTS `prevention_reports`;
CREATE TABLE `prevention_reports` (
  `id` varchar(36) NOT NULL,
  `disease_id` varchar(36) DEFAULT NULL COMMENT '疫病ID',
  `inputs_id` varchar(36) DEFAULT NULL COMMENT '疫苗id',
  `report_type` tinyint(1) DEFAULT NULL COMMENT '上报类型 1月报 2周报',
  `report_time` datetime DEFAULT NULL,
  `city_code` varchar(20) DEFAULT NULL COMMENT '市编码',
  `county_code` varchar(20) DEFAULT NULL COMMENT '区/县编码',
  `report_status` tinyint(1) DEFAULT NULL COMMENT '上报状态 0未上报 1已上报',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of prevention_reports
-- ----------------------------

-- ----------------------------
-- Table structure for product_licenses
-- ----------------------------
DROP TABLE IF EXISTS `product_licenses`;
CREATE TABLE `product_licenses` (
  `id` varchar(36) NOT NULL,
  `ep_id` varchar(36) DEFAULT NULL,
  `inputs_id` varchar(36) DEFAULT NULL COMMENT '产品名称（用inputs表）',
  `spec_desc` varchar(20) DEFAULT NULL COMMENT '规格描述',
  `license_no` varchar(20) DEFAULT NULL COMMENT '批号',
  `award_date` date DEFAULT NULL COMMENT '批准日期',
  `validity_period` date DEFAULT NULL COMMENT '有效期',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_licenses
-- ----------------------------

-- ----------------------------
-- Table structure for quarantine_declaration
-- ----------------------------
DROP TABLE IF EXISTS `quarantine_declaration`;
CREATE TABLE `quarantine_declaration` (
  `id` varchar(36) NOT NULL,
  `lo_id` varchar(36) DEFAULT NULL COMMENT '出场出栏关联id',
  `ep_id` varchar(36) DEFAULT NULL COMMENT '企业id',
  `ep_name` varchar(50) DEFAULT NULL COMMENT '申报企业名称',
  `accept_user_id` varchar(36) DEFAULT NULL COMMENT '受理人id',
  `accept_name` varchar(50) DEFAULT NULL COMMENT '受理人',
  `animalsource` varchar(20) DEFAULT NULL COMMENT '货主',
  `telephone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `sign` tinyint(1) DEFAULT NULL COMMENT '申报类别 0:动物 1:产品',
  `sort_id` varchar(36) DEFAULT NULL COMMENT '动物种类-细化分类id',
  `sort` varchar(50) DEFAULT NULL COMMENT 'd动物种类name',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `unit_code` varchar(20) DEFAULT NULL COMMENT '单位字典code',
  `unit` varchar(50) DEFAULT NULL COMMENT '单位字典name',
  `price` decimal(12,2) DEFAULT NULL COMMENT '价格',
  `leavelocal` varchar(50) DEFAULT NULL COMMENT '起运地点',
  `arrivallocal` varchar(50) DEFAULT NULL COMMENT '到达地点',
  `in_the_province` tinyint(1) DEFAULT NULL COMMENT '是否省内 1:省内 0:省外',
  `purpose` varchar(50) DEFAULT NULL COMMENT '用途name',
  `purpose_code` varchar(20) DEFAULT NULL COMMENT '用途code',
  `created_at` datetime DEFAULT NULL COMMENT '申报时间',
  `create_user` varchar(36) DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `accept_status` tinyint(1) DEFAULT '0' COMMENT '受理状态 0:未受理 1:受理 2:完成',
  `status` tinyint(1) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quarantine_declaration
-- ----------------------------

-- ----------------------------
-- Table structure for slaughter_outputs_infos
-- ----------------------------
DROP TABLE IF EXISTS `slaughter_outputs_infos`;
CREATE TABLE `slaughter_outputs_infos` (
  `id` varchar(36) NOT NULL,
  `ep_id` varchar(36) DEFAULT NULL,
  `animalsource` varchar(20) DEFAULT NULL COMMENT '货主-principal_name',
  `telephone` varchar(20) DEFAULT NULL COMMENT '联系电话-principal_phone',
  `sort_id` varchar(36) DEFAULT NULL COMMENT '动物种类-细化分类id',
  `sort` varchar(50) DEFAULT NULL COMMENT '动物种类-细化分类名称',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `unit_code` varchar(20) DEFAULT NULL COMMENT '单位-字典数据编码',
  `unit` varchar(50) DEFAULT NULL COMMENT '单位-字典数据值',
  `leavelocal` varchar(50) DEFAULT NULL COMMENT '启运地区',
  `startingpoint` varchar(100) DEFAULT NULL COMMENT '启运地区划码',
  `arrivallocal` varchar(50) DEFAULT NULL COMMENT '到达地点',
  `endingpoint` varchar(100) DEFAULT NULL COMMENT '到达地点区划',
  `report_status` tinyint(1) DEFAULT NULL COMMENT '上报状态:0:未上报 1:已上报',
  `create_user` varchar(36) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of slaughter_outputs_infos
-- ----------------------------

-- ----------------------------
-- Table structure for slaughter_stocks_infos
-- ----------------------------
DROP TABLE IF EXISTS `slaughter_stocks_infos`;
CREATE TABLE `slaughter_stocks_infos` (
  `id` varchar(36) NOT NULL,
  `ep_id` varchar(36) DEFAULT NULL,
  `ep_name` varchar(100) DEFAULT NULL COMMENT '企业名称',
  `quar_no` varchar(30) DEFAULT NULL COMMENT '检疫证号',
  `mc_id` varchar(36) DEFAULT NULL COMMENT '细化分类id',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `unit` varchar(20) DEFAULT NULL COMMENT '单位（dict_data_code）',
  `animalsource` varchar(20) DEFAULT NULL COMMENT '货主',
  `leavelocal` varchar(50) DEFAULT NULL COMMENT '启运地点',
  `startingpoint` varchar(100) DEFAULT NULL,
  `carrier` varchar(20) DEFAULT NULL COMMENT '承运人',
  `is_abnormal` tinyint(1) DEFAULT NULL COMMENT '运载途中是否异常0:否 1:是',
  `has_disinfected` tinyint(1) DEFAULT NULL COMMENT '是否消毒0:否 1:是',
  `is_healthy` tinyint(1) DEFAULT NULL COMMENT '是否健康 0:否 1:是',
  `is_province` tinyint(1) DEFAULT NULL COMMENT '标识是否为省内 0:否 1:是',
  `report_status` tinyint(1) DEFAULT NULL COMMENT '上报状态:0:未上报 1:已上报',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of slaughter_stocks_infos
-- ----------------------------

-- ----------------------------
-- Table structure for staffs
-- ----------------------------
DROP TABLE IF EXISTS `staffs`;
CREATE TABLE `staffs` (
  `id` varchar(36) NOT NULL,
  `ep_id` varchar(36) DEFAULT NULL COMMENT '企业id',
  `user_name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别:0男，1女',
  `age` tinyint(4) DEFAULT NULL,
  `work_no` varchar(20) DEFAULT NULL COMMENT '工号',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `is_used` tinyint(1) DEFAULT '1' COMMENT '是否使用：0停用，1启用',
  `dict_data_education` varchar(20) DEFAULT NULL COMMENT '学历（字典数据编码）',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '0无效，1有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staffs
-- ----------------------------

-- ----------------------------
-- Table structure for stocks_immune_quantity
-- ----------------------------
DROP TABLE IF EXISTS `stocks_immune_quantity`;
CREATE TABLE `stocks_immune_quantity` (
  `id` varchar(36) NOT NULL,
  `stocks` varchar(1000) DEFAULT NULL COMMENT '存栏',
  `sckty` varchar(500) DEFAULT NULL COMMENT '牲畜口蹄疫',
  `gzbxqlg` varchar(500) DEFAULT NULL COMMENT '高致病性禽流感',
  `axkty` varchar(250) DEFAULT NULL COMMENT 'A型口蹄疫',
  `gzbxzleb` varchar(100) DEFAULT NULL COMMENT '高致病性猪蓝耳病',
  `zw` varchar(100) DEFAULT NULL COMMENT '猪瘟',
  `xcy` varchar(100) DEFAULT NULL COMMENT '新城疫',
  `xfcsy` varchar(100) DEFAULT NULL COMMENT '小反刍兽疫',
  `blsjb` varchar(250) DEFAULT NULL COMMENT '布鲁氏菌病',
  `jqyb` varchar(100) DEFAULT NULL COMMENT '菌球蚴病',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stocks_immune_quantity
-- ----------------------------

-- ----------------------------
-- Table structure for stock_quantity
-- ----------------------------
DROP TABLE IF EXISTS `stock_quantity`;
CREATE TABLE `stock_quantity` (
  `id` varchar(36) NOT NULL,
  `report_id` varchar(36) DEFAULT NULL,
  `stock_quantity` decimal(12,2) DEFAULT NULL COMMENT '存栏量',
  `mc_id` varchar(36) DEFAULT NULL COMMENT '动物分类id',
  `mc_name` varchar(50) DEFAULT NULL COMMENT '动物分类名称',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stock_quantity
-- ----------------------------

-- ----------------------------
-- Table structure for suppliers
-- ----------------------------
DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE `suppliers` (
  `id` varchar(36) NOT NULL,
  `ep_id` varchar(36) DEFAULT NULL,
  `supplier_address` varchar(100) DEFAULT NULL COMMENT '联系地址',
  `contact` varchar(20) DEFAULT NULL COMMENT '联系人',
  `contact_phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `supplier_name` varchar(100) DEFAULT NULL COMMENT '供应商名称',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tmp_enpt
-- ----------------------------
DROP TABLE IF EXISTS `tmp_enpt`;
CREATE TABLE `tmp_enpt` (
  `org_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `principal` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `mc_id` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `male_quantity` int(11) DEFAULT NULL,
  `female_quantity` int(11) DEFAULT NULL,
  `division_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tmp_enpt
-- ----------------------------

-- ----------------------------
-- Table structure for t_fileinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_fileinfo`;
CREATE TABLE `t_fileinfo` (
  `id` varchar(36) NOT NULL,
  `file_type` tinyint(2) DEFAULT NULL COMMENT '文件类型||1:图片',
  `file_ext` varchar(10) DEFAULT NULL COMMENT '文件后缀',
  `file_name` varchar(60) NOT NULL COMMENT '文件显示名',
  `file_path` varchar(200) NOT NULL COMMENT '文件路径',
  `tenant_id` char(32) DEFAULT NULL COMMENT '租户ID',
  `status` tinyint(2) DEFAULT NULL COMMENT '业务状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(36) DEFAULT NULL COMMENT '创建人',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` varchar(36) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_fileinfo
-- ----------------------------

-- ----------------------------
-- Table structure for t_veterinary_drug
-- ----------------------------
DROP TABLE IF EXISTS `t_veterinary_drug`;
CREATE TABLE `t_veterinary_drug` (
  `id` varchar(36) NOT NULL,
  `cptym` varchar(255) DEFAULT NULL COMMENT '产品通用名',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_veterinary_drug
-- ----------------------------

-- ----------------------------
-- Table structure for use_quantity
-- ----------------------------
DROP TABLE IF EXISTS `use_quantity`;
CREATE TABLE `use_quantity` (
  `id` varchar(36) NOT NULL,
  `report_id` varchar(36) DEFAULT NULL COMMENT '报告id',
  `inputs_id` varchar(36) DEFAULT NULL COMMENT '疫苗id',
  `use_quantity` decimal(12,2) DEFAULT NULL COMMENT '使用量',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of use_quantity
-- ----------------------------

-- ----------------------------
-- Table structure for veterinarians
-- ----------------------------
DROP TABLE IF EXISTS `veterinarians`;
CREATE TABLE `veterinarians` (
  `id` varchar(36) NOT NULL,
  `ep_id` varchar(36) DEFAULT NULL,
  `vet_name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `gender` tinyint(1) DEFAULT NULL COMMENT '性别',
  `id_number` varchar(40) DEFAULT NULL COMMENT '身份证号',
  `dict_data_qualification` varchar(20) DEFAULT NULL COMMENT '资质（字典数据编码）',
  `cert_number` varchar(50) DEFAULT NULL COMMENT '资格证号',
  `tenant_id` varchar(36) DEFAULT NULL,
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of veterinarians
-- ----------------------------

-- ----------------------------
-- Table structure for vet_ep_association
-- ----------------------------
DROP TABLE IF EXISTS `vet_ep_association`;
CREATE TABLE `vet_ep_association` (
  `id` varchar(36) NOT NULL,
  `vet_id` varchar(36) NOT NULL COMMENT '兽医id',
  `ep_id` varchar(36) NOT NULL COMMENT '企业id',
  `created_at` datetime DEFAULT NULL COMMENT '申报时间',
  `create_user` varchar(36) DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vet_ep_association
-- ----------------------------

-- ----------------------------
-- Table structure for work_fields
-- ----------------------------
DROP TABLE IF EXISTS `work_fields`;
CREATE TABLE `work_fields` (
  `id` varchar(36) NOT NULL,
  `field_name` varchar(50) DEFAULT NULL COMMENT '字段名称',
  `field_code` varchar(20) DEFAULT NULL COMMENT '字段编号，通过编号进行不同字段的定义',
  `input_type` int(4) DEFAULT '0' COMMENT '1时间类型，0输入框，2下拉框',
  `remark` varchar(100) DEFAULT NULL COMMENT '说明',
  `rank` int(4) DEFAULT NULL COMMENT '排序字段',
  `is_fixed` tinyint(1) DEFAULT '0' COMMENT '是否系统固定字段:1是，0否',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_fields
-- ----------------------------

-- ----------------------------
-- Table structure for work_field_condition
-- ----------------------------
DROP TABLE IF EXISTS `work_field_condition`;
CREATE TABLE `work_field_condition` (
  `id` varchar(36) NOT NULL COMMENT '数据来源url',
  `data_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_field_condition
-- ----------------------------

-- ----------------------------
-- Table structure for work_forms
-- ----------------------------
DROP TABLE IF EXISTS `work_forms`;
CREATE TABLE `work_forms` (
  `id` varchar(36) NOT NULL,
  `tenant_id` varchar(36) DEFAULT NULL COMMENT '租户id',
  `ep_id` varchar(36) DEFAULT NULL COMMENT '企业id',
  `wt_id` varchar(36) DEFAULT NULL COMMENT '作业类型id',
  `wt_alias_name` varchar(50) DEFAULT NULL COMMENT '作业类型别名',
  `wt_define_icon` varchar(50) DEFAULT NULL COMMENT '自定义图标',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '0无效，1有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_forms
-- ----------------------------

-- ----------------------------
-- Table structure for work_form_items
-- ----------------------------
DROP TABLE IF EXISTS `work_form_items`;
CREATE TABLE `work_form_items` (
  `id` varchar(36) NOT NULL,
  `form_id` varchar(36) DEFAULT NULL COMMENT '作业表单id',
  `wf_id` varchar(36) DEFAULT NULL COMMENT '作业字段id',
  `wf_alias_name` varchar(50) DEFAULT NULL COMMENT '作业字段别名',
  `condition_val` varchar(300) DEFAULT NULL COMMENT '字段需要的条件值',
  `default_val` varchar(50) DEFAULT NULL COMMENT '默认值',
  `rank` int(4) DEFAULT NULL COMMENT '排序字段',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_form_items
-- ----------------------------

-- ----------------------------
-- Table structure for work_infos
-- ----------------------------
DROP TABLE IF EXISTS `work_infos`;
CREATE TABLE `work_infos` (
  `id` varchar(36) NOT NULL,
  `tenant_id` varchar(36) DEFAULT NULL,
  `ep_id` varchar(36) DEFAULT NULL COMMENT '企业id',
  `area_id` varchar(36) DEFAULT NULL COMMENT '区域id',
  `form_id` varchar(36) DEFAULT NULL COMMENT '表单id',
  `create_user` varchar(36) DEFAULT NULL COMMENT '当前登录人',
  `farmer_id` varchar(36) DEFAULT NULL COMMENT '农事操作员id',
  `created_at` datetime DEFAULT NULL,
  `work_at` datetime DEFAULT NULL COMMENT '工作时间',
  `wt_id` varchar(36) DEFAULT NULL COMMENT '作业类型id',
  `work_type_name` varchar(50) DEFAULT NULL COMMENT '作业类型名称',
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_infos
-- ----------------------------

-- ----------------------------
-- Table structure for work_results
-- ----------------------------
DROP TABLE IF EXISTS `work_results`;
CREATE TABLE `work_results` (
  `id` varchar(36) NOT NULL,
  `wi_id` varchar(36) DEFAULT NULL COMMENT '农事操作记录id',
  `wf_id` varchar(36) DEFAULT NULL COMMENT '作业字段id',
  `form_item_id` varchar(36) DEFAULT NULL COMMENT '表单项id',
  `field_name` varchar(50) DEFAULT NULL COMMENT '字段名称',
  `field_code` varchar(20) DEFAULT NULL COMMENT '字段编号',
  `inputs_id` varchar(36) DEFAULT NULL COMMENT '投入品id',
  `field_qty` decimal(12,2) DEFAULT NULL COMMENT '字段值：投入品数量、入栏数量，出栏数量',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_results
-- ----------------------------

-- ----------------------------
-- Table structure for work_types
-- ----------------------------
DROP TABLE IF EXISTS `work_types`;
CREATE TABLE `work_types` (
  `id` varchar(36) NOT NULL,
  `w_name` varchar(50) DEFAULT NULL COMMENT '作业类型名称',
  `w_icon` varchar(50) DEFAULT NULL COMMENT '作业图标',
  `remark` varchar(500) DEFAULT NULL COMMENT '说明',
  `c_id` varchar(36) DEFAULT NULL COMMENT '所属行业类型id',
  `m_id` varchar(36) DEFAULT NULL COMMENT '所属的细化分类id',
  `rank` int(4) DEFAULT NULL COMMENT '排序字段',
  `create_user` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '是否有效:1有效，0无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_types
-- ----------------------------
DROP TABLE IF EXISTS `monthlist`;
create table monthlist(id int auto_increment primary key,mon char(7));
insert into monthlist(mon)
  select concat(yy,mon) dt
  from (
         select bb.yy yy,case when mon<10 then concat('-0',mon) else concat('-',mon) end mon
         from (
                select @mon:=@mon+1 mon
                from major_categories,(select @mon:=0) a limit 12) aa
           join (
                  select @yy:=@yy+1 yy
                  from major_categories,(select @yy:=2017) b limit 10) bb) aaa
  order by yy,mon;