/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : qyrlzy2

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2020-01-22 18:34:41
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `award`
-- ----------------------------
DROP TABLE IF EXISTS `award`;
CREATE TABLE `award` (
  `award_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `award_date` date DEFAULT NULL,
  `award_title` varchar(300) DEFAULT NULL,
  `award_content` text,
  `award_note` varchar(300) DEFAULT NULL,
  `award_type` int(11) DEFAULT '1' COMMENT '1：奖励 2：惩处',
  PRIMARY KEY (`award_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of award
-- ----------------------------
INSERT INTO `award` VALUES ('1', '1', '2019-02-04', '学习进步神速', '学习进步神速', '', '1');
INSERT INTO `award` VALUES ('2', '3', '2019-04-24', '上班玩手机', '不解释，你懂得', '人还是不错的', '2');

-- ----------------------------
-- Table structure for `depart`
-- ----------------------------
DROP TABLE IF EXISTS `depart`;
CREATE TABLE `depart` (
  `depart_id` int(11) NOT NULL AUTO_INCREMENT,
  `depart_name` varchar(50) DEFAULT NULL,
  `depart_note` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`depart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of depart
-- ----------------------------
INSERT INTO `depart` VALUES ('1', '软件部', '这是一个神奇的地方\r\n');
INSERT INTO `depart` VALUES ('2', '市场部', '这是销售的天下');
INSERT INTO `depart` VALUES ('3', '财务部', '白花花的银子');
INSERT INTO `depart` VALUES ('6', '人事部', '吾问无为谓无');

-- ----------------------------
-- Table structure for `direct`
-- ----------------------------
DROP TABLE IF EXISTS `direct`;
CREATE TABLE `direct` (
  `direct_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL,
  `real_name` varchar(50) DEFAULT NULL,
  `user_sex` int(11) DEFAULT NULL,
  `depart_id` int(11) DEFAULT NULL,
  `user_phone` varchar(50) DEFAULT NULL,
  `user_qq` varchar(50) DEFAULT NULL,
  `user_mail` varchar(50) DEFAULT NULL,
  `user_address` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`direct_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of direct
-- ----------------------------
INSERT INTO `direct` VALUES ('1', 's001', '张为民', '1', '1', '1508888881', '455409331', '455409331@qq.com', '上海路111号');

-- ----------------------------
-- Table structure for `image`
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `img_id` int(11) NOT NULL,
  `img_content` varchar(30) DEFAULT NULL,
  `img_path` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image
-- ----------------------------

-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `manager_id` int(11) NOT NULL AUTO_INCREMENT,
  `manager_name` varchar(50) NOT NULL COMMENT '用户名',
  `manager_pass` varchar(200) NOT NULL,
  `real_name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `manager_power` varchar(100) NOT NULL COMMENT '管理员权限',
  `manager_sex` int(11) DEFAULT '1' COMMENT '1：男  2：女',
  PRIMARY KEY (`manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', 'admin', '4cb0a5502e9aa44a0ca99e96742f2e788aad875a', '董珂', '8', '1');
INSERT INTO `manager` VALUES ('20', 'lhp', '4cb0a5502e9aa44a0ca99e96742f2e788aad875a', '董珂', '8', '1');
INSERT INTO `manager` VALUES ('26', 'admin1', '4cb0a5502e9aa44a0ca99e96742f2e788aad875a', '马云', '3', '1');
INSERT INTO `manager` VALUES ('27', 'admin2', '4cb0a5502e9aa44a0ca99e96742f2e788aad875a', '王健林', '3', '1');
INSERT INTO `manager` VALUES ('28', 'admin3', '4cb0a5502e9aa44a0ca99e96742f2e788aad875a', '马化腾', '3', '1');

-- ----------------------------
-- Table structure for `salary`
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary` (
  `salary_id` int(11) NOT NULL AUTO_INCREMENT,
  `depart_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '员工编号',
  `salary_month` varchar(50) DEFAULT NULL,
  `salary_basic` double DEFAULT NULL COMMENT '基本工资',
  `salary_award` double DEFAULT NULL COMMENT '奖金',
  `salary_yanglao` double(11,0) DEFAULT NULL COMMENT '扣除养老金',
  `salary_baoxian` double(11,0) DEFAULT NULL COMMENT '扣除保险金',
  `salary_zhufang` double(11,0) DEFAULT NULL COMMENT '住房公积金',
  `salary_subsidy` double DEFAULT NULL COMMENT '补贴',
  `salary_punish` double(11,0) DEFAULT NULL COMMENT '处罚金',
  `salary_attend` int(11) DEFAULT '1' COMMENT '1-无 2-有',
  `salary_money` double DEFAULT NULL COMMENT '工资总数',
  `salary_note` varchar(300) DEFAULT NULL COMMENT '备注奖惩信息',
  PRIMARY KEY (`salary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of salary
-- ----------------------------
INSERT INTO `salary` VALUES ('1', null, '1', '2015-04', '1000', '500', '5555', '6565', '3333', '500', '100', '1', '17353', '上班玩手机扣3000');
INSERT INTO `salary` VALUES ('3', null, '7', '2018-04', '1000', '1000', '1000', '1000', '222', '1000', '3000', '2', '2422', '上班玩手机扣3000');
INSERT INTO `salary` VALUES ('4', null, '6', '2018-03', '1000', '10000', '1000', '1000', '1000', '1000', '100', '2', '15100', '表现不错');
INSERT INTO `salary` VALUES ('5', null, '11', '2018-05', '1000', '1000', '1000', '1000', '7777', '1000', '100', '2', '12877', '上班玩手机扣3000');
INSERT INTO `salary` VALUES ('6', null, '12', '2018-03', '1000', '1000', '1000', '1000', '1000', '1000', '3000', '2', '3200', '总是迟到');

-- ----------------------------
-- Table structure for `toach`
-- ----------------------------
DROP TABLE IF EXISTS `toach`;
CREATE TABLE `toach` (
  `toach_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `toach_date1` date DEFAULT NULL,
  `toach_date2` date DEFAULT NULL,
  `toach_title` varchar(300) DEFAULT NULL,
  `toach_content` text,
  `toach_note` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`toach_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of toach
-- ----------------------------
INSERT INTO `toach` VALUES ('1', '1', '2020-02-04', '2020-02-06', '项目经理培训', '项目经理培训', '');
INSERT INTO `toach` VALUES ('2', '6', '2019-05-15', '2019-05-13', 'JAVA', '看见你可能 对方是否实施让人GV深V说不过古巴嘎嘎嘎人把人啊日嘎GV阿嘎冉阿让个人股嘎嘎啊噶个安静安静哦计量柜一很多看哈阿卡丽很快就离开好无奈', '放你那是你说说你那你说 试试事实上军所所军所军可是你是看上你看上哪款是你看上哪款是你开始你是看上你看上哪款是你说可能是看');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL,
  `user_pass` varchar(50) DEFAULT NULL,
  `real_name` varchar(50) NOT NULL,
  `user_sex` int(11) DEFAULT '1' COMMENT '1：男  2：女',
  `user_age` int(11) DEFAULT '22',
  `user_nation` varchar(300) DEFAULT NULL,
  `user_level` varchar(50) DEFAULT NULL,
  `depart_id` int(11) DEFAULT '0',
  `user_pose` varchar(50) DEFAULT NULL,
  `reg_date` date DEFAULT NULL,
  `leave_date` date DEFAULT NULL,
  `leave_reason` varchar(300) DEFAULT NULL,
  `statue` int(11) DEFAULT '1' COMMENT '1-实习 2-正式员工 3,4-申请审核中 5-申请转正',
  `user_type` int(11) DEFAULT '1' COMMENT '1-在职 2-离职',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 's001', '4cb0a5502e9aa44a0ca99e96742f2e788aad875a', '张为民', '1', '26', '', '硕士', '1', '项目经理', '2015-01-12', '2018-05-01', 'ssss', '1', '2');
INSERT INTO `user` VALUES ('3', 's002', '4cb0a5502e9aa44a0ca99e96742f2e788aad875a', '康晓红', '2', '28', '', '本科', '2', '技术经理', '2015-01-12', '2018-05-24', '刚刚', '1', '2');
INSERT INTO `user` VALUES ('4', 's003', '4cb0a5502e9aa44a0ca99e96742f2e788aad875a', '高建国', '1', '29', '北京市', '本科', '1', '普通职员', '2015-01-14', null, null, '1', '1');
INSERT INTO `user` VALUES ('6', 's004', '4cb0a5502e9aa44a0ca99e96742f2e788aad875a', '陈俊', '2', '24', '北京市', '本科', '3', '普通职员', '2015-01-12', null, null, '3', '1');
INSERT INTO `user` VALUES ('7', 's005', '4cb0a5502e9aa44a0ca99e96742f2e788aad875a', '赵晶晶', '2', '27', '', '本科', '3', '普通职员', '2015-01-12', '2018-05-23', '单独', '5', '2');
INSERT INTO `user` VALUES ('10', 's008', '4cb0a5502e9aa44a0ca99e96742f2e788aad875a', '朱倩倩', '2', '22', '北京市', '本科', '6', '普通职员', '2015-01-12', '2015-05-14', '辞职', '1', '1');
INSERT INTO `user` VALUES ('11', 's009', '37b1147482fbeeeed5ead29bc3140d241a583db2', '董珂', '2', '44', '银川市', '本科', '1', '技术经理', '20120-03-13', '2018-05-23', 'ssss', '1', '1');
INSERT INTO `user` VALUES ('12', 's011', '4cb0a5502e9aa44a0ca99e96742f2e788aad875a', '王老师', '2', '28', '山东省济南市', '本科', '1', '技术经理', '2018-05-17', null, null, '1', '1');
INSERT INTO `user` VALUES ('13', 's99', '4cb0a5502e9aa44a0ca99e96742f2e788aad875a', '高渐离', '1', '25', '山东省济南市', '本科', '1', '技术经理', '2018-05-23', null, null, '2', '1');
INSERT INTO `user` VALUES ('14', 's88', '4cb0a5502e9aa44a0ca99e96742f2e788aad875a', '宗鲁叶', '1', '22', '北京市', '本科', '2', '普通职员', '2018-05-23', null, null, '2', '1');
INSERT INTO `user` VALUES ('15', 's77', '4cb0a5502e9aa44a0ca99e96742f2e788aad875a', '王大雷', '1', '25', '北京市', '本科', '1', '技术经理', '2018-05-23', null, null, '1', '1');
