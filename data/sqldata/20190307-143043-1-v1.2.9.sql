-- ----------------------------------------
-- EyouCms MySQL Data Transfer 
-- 
-- Server         : 127.0.0.1_3306
-- Server Version : 5.5.54-log
-- Host           : 127.0.0.1:3306
-- Database       : dd58
-- 
-- Part : #1
-- Version : #v1.2.9
-- Date : 2019-03-07 14:30:43
-- -----------------------------------------

SET FOREIGN_KEY_CHECKS = 0;


-- -----------------------------
-- Table structure for `ey_ad`
-- -----------------------------
DROP TABLE IF EXISTS `ey_ad`;
CREATE TABLE `ey_ad` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '广告位置ID',
  `media_type` tinyint(1) DEFAULT '0' COMMENT '广告类型',
  `title` varchar(60) DEFAULT '' COMMENT '广告名称',
  `links` varchar(255) DEFAULT '' COMMENT '广告链接',
  `litpic` varchar(255) DEFAULT '' COMMENT '图片地址',
  `start_time` int(11) DEFAULT '0' COMMENT '投放时间',
  `end_time` int(11) DEFAULT '0' COMMENT '结束时间',
  `intro` text COMMENT '描述',
  `link_man` varchar(60) DEFAULT '' COMMENT '添加人',
  `link_email` varchar(60) DEFAULT '' COMMENT '添加人邮箱',
  `link_phone` varchar(60) DEFAULT '' COMMENT '添加人联系电话',
  `click` int(11) DEFAULT '0' COMMENT '点击量',
  `bgcolor` varchar(30) DEFAULT '' COMMENT '背景颜色',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '1=显示，0=屏蔽',
  `sort_order` int(11) DEFAULT '0' COMMENT '排序',
  `target` varchar(50) DEFAULT '' COMMENT '是否开启浏览器新窗口',
  `admin_id` int(10) DEFAULT '0' COMMENT '管理员ID',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '伪删除，1=是，0=否',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '多语言',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `position_id` (`pid`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- -----------------------------
-- Records of `ey_ad`
-- -----------------------------
INSERT INTO `ey_ad` VALUES ('1', '1', '1', '幻灯一', '', '/uploads/allimg/20190307/4a2fe86037fa8aca97c093804884abf9.jpg', '0', '0', '', '', '', '', '0', '', '1', '100', '1', '1', '0', 'cn', '1551922078', '1551922078');
INSERT INTO `ey_ad` VALUES ('2', '1', '1', '幻灯二', '', '/uploads/allimg/20190307/b154d4f0c92ef6aa2eb474e86e6a0ce2.jpg', '0', '0', '', '', '', '', '0', '', '1', '100', '1', '1', '0', 'cn', '1551922088', '1551922088');

-- -----------------------------
-- Table structure for `ey_ad_position`
-- -----------------------------
DROP TABLE IF EXISTS `ey_ad_position`;
CREATE TABLE `ey_ad_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) DEFAULT '' COMMENT '广告位置名称',
  `width` smallint(5) unsigned DEFAULT '0' COMMENT '广告位宽度',
  `height` smallint(5) unsigned DEFAULT '0' COMMENT '广告位高度',
  `intro` text COMMENT '广告描述',
  `status` tinyint(1) DEFAULT '1' COMMENT '0关闭1开启',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '多语言',
  `admin_id` int(10) DEFAULT '0' COMMENT '管理员ID',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '伪删除，1=是，0=否',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='广告位置表';

-- -----------------------------
-- Records of `ey_ad_position`
-- -----------------------------
INSERT INTO `ey_ad_position` VALUES ('1', '首页头部大幻灯', '0', '0', '', '1', 'cn', '1', '0', '1551922061', '1551922061');

-- -----------------------------
-- Table structure for `ey_admin`
-- -----------------------------
DROP TABLE IF EXISTS `ey_admin`;
CREATE TABLE `ey_admin` (
  `admin_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `pen_name` varchar(50) DEFAULT '' COMMENT '笔名（发布文章后显示责任编辑的名字）',
  `true_name` varchar(20) DEFAULT '' COMMENT '真实姓名',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机号码',
  `email` varchar(60) DEFAULT '' COMMENT 'email',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `last_login` int(11) DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` varchar(15) DEFAULT '' COMMENT '最后登录ip',
  `login_cnt` int(11) DEFAULT '0' COMMENT '登录次数',
  `session_id` varchar(50) DEFAULT '' COMMENT 'session_id',
  `parent_id` int(10) DEFAULT '0' COMMENT '父管理员ID',
  `role_id` int(10) NOT NULL DEFAULT '-1' COMMENT '角色组ID（-1表示超级管理员）',
  `mark_lang` varchar(50) DEFAULT 'cn' COMMENT '当前语言标识',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态(0=屏蔽，1=正常)',
  `add_time` int(11) DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`admin_id`),
  KEY `user_name` (`user_name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- -----------------------------
-- Records of `ey_admin`
-- -----------------------------
INSERT INTO `ey_admin` VALUES ('1', 'admin', '', 'admin', '', '', '7959ec68e999edd0380ff0809f76fa42', '1551939825', '127.0.0.1', '3', 'v5m0f9s10igsjgcoc6lalvjno5', '0', '-1', 'cn', '1', '1551921033', '0');

-- -----------------------------
-- Table structure for `ey_admin_log`
-- -----------------------------
DROP TABLE IF EXISTS `ey_admin_log`;
CREATE TABLE `ey_admin_log` (
  `log_id` bigint(16) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `admin_id` int(10) DEFAULT NULL COMMENT '管理员id',
  `log_info` varchar(255) DEFAULT NULL COMMENT '日志描述',
  `log_ip` varchar(30) DEFAULT NULL COMMENT 'ip地址',
  `log_url` varchar(255) DEFAULT NULL COMMENT 'url',
  `log_time` int(10) DEFAULT NULL COMMENT '日志时间',
  PRIMARY KEY (`log_id`),
  KEY `admin_id` (`admin_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COMMENT='管理员操作日志表';

-- -----------------------------
-- Records of `ey_admin_log`
-- -----------------------------
INSERT INTO `ey_admin_log` VALUES ('2', '0', '自动退出', '127.0.0.1', '/login.php', '1551921034');
INSERT INTO `ey_admin_log` VALUES ('3', '1', '后台登录', '127.0.0.1', '/login.php', '1551921040');
INSERT INTO `ey_admin_log` VALUES ('4', '1', '新增栏目：关于我们 ', '127.0.0.1', '/login.php', '1551921761');
INSERT INTO `ey_admin_log` VALUES ('5', '1', '编辑栏目：关于我们 ', '127.0.0.1', '/login.php', '1551921767');
INSERT INTO `ey_admin_log` VALUES ('6', '1', '新增栏目：房产资讯 ', '127.0.0.1', '/login.php', '1551921776');
INSERT INTO `ey_admin_log` VALUES ('7', '1', '新增栏目：二手房 ', '127.0.0.1', '/login.php', '1551921783');
INSERT INTO `ey_admin_log` VALUES ('8', '1', '新增栏目：小区 ', '127.0.0.1', '/login.php', '1551921789');
INSERT INTO `ey_admin_log` VALUES ('9', '1', '编辑栏目：小区 ', '127.0.0.1', '/login.php', '1551921795');
INSERT INTO `ey_admin_log` VALUES ('10', '1', '新增栏目：别墅 ', '127.0.0.1', '/login.php', '1551921803');
INSERT INTO `ey_admin_log` VALUES ('11', '1', '新增栏目：出售 ', '127.0.0.1', '/login.php', '1551921811');
INSERT INTO `ey_admin_log` VALUES ('12', '1', '新增栏目：联系我们', '127.0.0.1', '/login.php', '1551921816');
INSERT INTO `ey_admin_log` VALUES ('13', '1', '新增栏目：公司简介', '127.0.0.1', '/login.php', '1551921847');
INSERT INTO `ey_admin_log` VALUES ('14', '1', '新增栏目：企业文化', '127.0.0.1', '/login.php', '1551921859');
INSERT INTO `ey_admin_log` VALUES ('15', '1', '新增栏目：省内资讯', '127.0.0.1', '/login.php', '1551921904');
INSERT INTO `ey_admin_log` VALUES ('16', '1', '新增栏目：省外资讯', '127.0.0.1', '/login.php', '1551921926');
INSERT INTO `ey_admin_log` VALUES ('17', '1', '新增广告位：首页头部大幻灯', '127.0.0.1', '/login.php', '1551922061');
INSERT INTO `ey_admin_log` VALUES ('18', '1', '新增广告：幻灯一', '127.0.0.1', '/login.php', '1551922078');
INSERT INTO `ey_admin_log` VALUES ('19', '1', '新增广告：幻灯二', '127.0.0.1', '/login.php', '1551922088');
INSERT INTO `ey_admin_log` VALUES ('20', '1', '伪删除栏目：出售 ', '127.0.0.1', '/login.php', '1551922209');
INSERT INTO `ey_admin_log` VALUES ('21', '1', '新增产品参数：1212', '127.0.0.1', '/login.php', '1551922671');
INSERT INTO `ey_admin_log` VALUES ('22', '1', '删除产品参数-id：1', '127.0.0.1', '/login.php', '1551922769');
INSERT INTO `ey_admin_log` VALUES ('23', '1', '新增栏目：公司团队', '127.0.0.1', '/login.php', '1551923136');
INSERT INTO `ey_admin_log` VALUES ('24', '1', '编辑栏目：公司简介', '127.0.0.1', '/login.php', '1551923788');
INSERT INTO `ey_admin_log` VALUES ('25', '1', '编辑栏目：公司简介', '127.0.0.1', '/login.php', '1551923795');
INSERT INTO `ey_admin_log` VALUES ('26', '1', '编辑栏目：公司简介', '127.0.0.1', '/login.php', '1551923809');
INSERT INTO `ey_admin_log` VALUES ('27', '1', '编辑栏目：关于我们 ', '127.0.0.1', '/login.php', '1551923818');
INSERT INTO `ey_admin_log` VALUES ('28', '1', '编辑栏目：企业文化', '127.0.0.1', '/login.php', '1551923834');
INSERT INTO `ey_admin_log` VALUES ('29', '1', '编辑栏目：企业文化', '127.0.0.1', '/login.php', '1551923973');
INSERT INTO `ey_admin_log` VALUES ('30', '1', '编辑栏目：企业文化', '127.0.0.1', '/login.php', '1551924038');
INSERT INTO `ey_admin_log` VALUES ('31', '1', '编辑栏目：公司团队', '127.0.0.1', '/login.php', '1551924338');
INSERT INTO `ey_admin_log` VALUES ('32', '1', '编辑栏目：公司团队', '127.0.0.1', '/login.php', '1551924364');
INSERT INTO `ey_admin_log` VALUES ('33', '1', '新增栏目：在线留言', '127.0.0.1', '/login.php', '1551924631');
INSERT INTO `ey_admin_log` VALUES ('34', '1', '新增留言表单：姓名', '127.0.0.1', '/login.php', '1551924640');
INSERT INTO `ey_admin_log` VALUES ('35', '1', '新增留言表单：手机', '127.0.0.1', '/login.php', '1551924646');
INSERT INTO `ey_admin_log` VALUES ('36', '1', '新增留言表单：QQ/微信', '127.0.0.1', '/login.php', '1551924653');
INSERT INTO `ey_admin_log` VALUES ('37', '1', '新增留言表单：邮箱', '127.0.0.1', '/login.php', '1551924657');
INSERT INTO `ey_admin_log` VALUES ('38', '1', '新增留言表单：留言内容', '127.0.0.1', '/login.php', '1551924677');
INSERT INTO `ey_admin_log` VALUES ('39', '1', '新增自定义变量：二维码', '127.0.0.1', '/login.php', '1551925268');
INSERT INTO `ey_admin_log` VALUES ('40', '1', '新增自定义变量：QQ', '127.0.0.1', '/login.php', '1551925512');
INSERT INTO `ey_admin_log` VALUES ('41', '1', '新增自定义变量：微博地址', '127.0.0.1', '/login.php', '1551925547');
INSERT INTO `ey_admin_log` VALUES ('42', '1', '新增自定义变量：电话', '127.0.0.1', '/login.php', '1551925729');
INSERT INTO `ey_admin_log` VALUES ('43', '1', '新增自定义变量：地址', '127.0.0.1', '/login.php', '1551926026');
INSERT INTO `ey_admin_log` VALUES ('44', '1', '新增自定义变量：邮箱', '127.0.0.1', '/login.php', '1551926048');
INSERT INTO `ey_admin_log` VALUES ('45', '1', '新增自定义变量：传真', '127.0.0.1', '/login.php', '1551926069');
INSERT INTO `ey_admin_log` VALUES ('46', '1', '编辑栏目：关于我们 ', '127.0.0.1', '/login.php', '1551926681');
INSERT INTO `ey_admin_log` VALUES ('47', '1', '新增文章：如何填写购房意向书？几招教您搞定', '127.0.0.1', '/login.php', '1551927649');
INSERT INTO `ey_admin_log` VALUES ('48', '1', '新增文章：房地产开发五证是指什么？为什么要选择五证齐全的房子？', '127.0.0.1', '/login.php', '1551927687');
INSERT INTO `ey_admin_log` VALUES ('49', '1', '新增文章：什么叫小产权房子？购买小产权房子需要承受什么风险？', '127.0.0.1', '/login.php', '1551927743');
INSERT INTO `ey_admin_log` VALUES ('50', '1', '编辑栏目：房产资讯 ', '127.0.0.1', '/login.php', '1551927996');
INSERT INTO `ey_admin_log` VALUES ('51', '1', '编辑栏目：房产资讯 ', '127.0.0.1', '/login.php', '1551928010');
INSERT INTO `ey_admin_log` VALUES ('52', '1', '新增文章：签订商品房买卖合同需要注意哪些问题和哪些盲区？', '127.0.0.1', '/login.php', '1551928305');
INSERT INTO `ey_admin_log` VALUES ('53', '1', '删除留言-id：1', '127.0.0.1', '/login.php', '1551929588');
INSERT INTO `ey_admin_log` VALUES ('54', '1', '编辑栏目：二手房 ', '127.0.0.1', '/login.php', '1551929649');
INSERT INTO `ey_admin_log` VALUES ('55', '1', '编辑栏目：小区 ', '127.0.0.1', '/login.php', '1551929660');
INSERT INTO `ey_admin_log` VALUES ('56', '1', '编辑栏目：别墅 ', '127.0.0.1', '/login.php', '1551929670');
INSERT INTO `ey_admin_log` VALUES ('57', '1', '编辑栏目：联系我们', '127.0.0.1', '/login.php', '1551929680');
INSERT INTO `ey_admin_log` VALUES ('58', '1', '新增栏目：精品房源', '127.0.0.1', '/login.php', '1551929734');
INSERT INTO `ey_admin_log` VALUES ('59', '1', '新增栏目：最新房源', '127.0.0.1', '/login.php', '1551929743');
INSERT INTO `ey_admin_log` VALUES ('60', '1', '新增栏目：滨海小区', '127.0.0.1', '/login.php', '1551929838');
INSERT INTO `ey_admin_log` VALUES ('61', '1', '新增栏目：滨江小区', '127.0.0.1', '/login.php', '1551929853');
INSERT INTO `ey_admin_log` VALUES ('62', '1', '新增栏目：精品别墅', '127.0.0.1', '/login.php', '1551929884');
INSERT INTO `ey_admin_log` VALUES ('63', '1', '新增栏目：联系方式', '127.0.0.1', '/login.php', '1551929899');
INSERT INTO `ey_admin_log` VALUES ('64', '1', '编辑栏目：联系方式', '127.0.0.1', '/login.php', '1551929940');
INSERT INTO `ey_admin_log` VALUES ('65', '1', '新增产品：恒大御海天下', '127.0.0.1', '/login.php', '1551930369');
INSERT INTO `ey_admin_log` VALUES ('66', '1', '新增产品：绿城桃李春风别墅', '127.0.0.1', '/login.php', '1551930551');
INSERT INTO `ey_admin_log` VALUES ('67', '1', '新增产品：南国威尼斯城别墅', '127.0.0.1', '/login.php', '1551930680');
INSERT INTO `ey_admin_log` VALUES ('68', '1', '编辑产品：南国威尼斯城别墅', '127.0.0.1', '/login.php', '1551930689');
INSERT INTO `ey_admin_log` VALUES ('69', '1', '新增产品：碧桂园中央半岛别墅', '127.0.0.1', '/login.php', '1551930755');
INSERT INTO `ey_admin_log` VALUES ('70', '1', '新增产品：耀江西岸公馆别墅', '127.0.0.1', '/login.php', '1551930812');
INSERT INTO `ey_admin_log` VALUES ('71', '1', '编辑产品：耀江西岸公馆别墅', '127.0.0.1', '/login.php', '1551930824');
INSERT INTO `ey_admin_log` VALUES ('72', '1', '新增产品：富力盈溪谷先生的院子别墅', '127.0.0.1', '/login.php', '1551930906');
INSERT INTO `ey_admin_log` VALUES ('73', '1', '新增产品：融创观澜湖公园壹号', '127.0.0.1', '/login.php', '1551931054');
INSERT INTO `ey_admin_log` VALUES ('74', '1', '新增产品：景园悦海湾 ', '127.0.0.1', '/login.php', '1551931205');
INSERT INTO `ey_admin_log` VALUES ('75', '1', '新增产品：富力悦海湾别墅', '127.0.0.1', '/login.php', '1551931267');
INSERT INTO `ey_admin_log` VALUES ('76', '1', '新增产品：恒大御海天下 ', '127.0.0.1', '/login.php', '1551931349');
INSERT INTO `ey_admin_log` VALUES ('77', '1', '新增产品：融创美伦熙语 ', '127.0.0.1', '/login.php', '1551931415');
INSERT INTO `ey_admin_log` VALUES ('78', '1', '新增产品：星华海岸城 ', '127.0.0.1', '/login.php', '1551931475');
INSERT INTO `ey_admin_log` VALUES ('79', '1', '新增产品：雅居乐金沙湾 ', '127.0.0.1', '/login.php', '1551931586');
INSERT INTO `ey_admin_log` VALUES ('80', '1', '新增产品：碧桂园剑桥郡 ', '127.0.0.1', '/login.php', '1551931652');
INSERT INTO `ey_admin_log` VALUES ('81', '1', '新增产品：楠滨华庭', '127.0.0.1', '/login.php', '1551931722');
INSERT INTO `ey_admin_log` VALUES ('82', '1', '新增产品：中盟椰海国际', '127.0.0.1', '/login.php', '1551931779');
INSERT INTO `ey_admin_log` VALUES ('83', '1', '新增产品：阳光椰风苑', '127.0.0.1', '/login.php', '1551931839');
INSERT INTO `ey_admin_log` VALUES ('84', '1', '新增产品：恩祥新城 ', '127.0.0.1', '/login.php', '1551931911');
INSERT INTO `ey_admin_log` VALUES ('85', '1', '编辑栏目：别墅 ', '127.0.0.1', '/login.php', '1551931953');
INSERT INTO `ey_admin_log` VALUES ('86', '1', '编辑栏目：小区 ', '127.0.0.1', '/login.php', '1551931963');
INSERT INTO `ey_admin_log` VALUES ('87', '1', '编辑栏目：二手房 ', '127.0.0.1', '/login.php', '1551931975');
INSERT INTO `ey_admin_log` VALUES ('88', '1', '自动退出', '127.0.0.1', '/login.php', '1551939813');
INSERT INTO `ey_admin_log` VALUES ('89', '1', '后台登录', '127.0.0.1', '/login.php', '1551939825');

-- -----------------------------
-- Table structure for `ey_archives`
-- -----------------------------
DROP TABLE IF EXISTS `ey_archives`;
CREATE TABLE `ey_archives` (
  `aid` int(10) NOT NULL AUTO_INCREMENT,
  `typeid` int(10) NOT NULL DEFAULT '0' COMMENT '当前栏目',
  `channel` int(10) NOT NULL DEFAULT '0' COMMENT '模型ID',
  `is_b` tinyint(1) DEFAULT '0' COMMENT '加粗',
  `title` varchar(200) DEFAULT '' COMMENT '标题',
  `litpic` varchar(250) DEFAULT '' COMMENT '封面图片',
  `is_head` tinyint(1) DEFAULT '0' COMMENT '头条（0=否，1=是）',
  `is_special` tinyint(1) DEFAULT '0' COMMENT '特荐（0=否，1=是）',
  `is_top` tinyint(1) DEFAULT '0' COMMENT '置顶（0=否，1=是）',
  `is_recom` tinyint(1) DEFAULT '0' COMMENT '推荐（0=否，1=是）',
  `is_jump` tinyint(1) DEFAULT '0' COMMENT '跳转链接（0=否，1=是）',
  `author` varchar(200) DEFAULT '' COMMENT '作者',
  `click` int(10) DEFAULT '0' COMMENT '浏览量',
  `arcrank` tinyint(1) DEFAULT '0' COMMENT '阅读权限：0=开放浏览，-1=待审核稿件',
  `jumplinks` varchar(200) DEFAULT '' COMMENT '外链跳转',
  `ismake` tinyint(1) DEFAULT '0' COMMENT '是否静态页面（0=动态，1=静态）',
  `seo_title` varchar(200) DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` varchar(200) DEFAULT '' COMMENT 'SEO关键词',
  `seo_description` text COMMENT 'SEO描述',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态(0=屏蔽，1=正常)',
  `sort_order` int(10) DEFAULT '0' COMMENT '排序号',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `admin_id` int(10) DEFAULT '0' COMMENT '管理员ID',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '伪删除，1=是，0=否',
  `del_method` tinyint(1) DEFAULT '0' COMMENT '伪删除状态，1为主动删除，2为跟随上级栏目被动删除',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`aid`),
  KEY `aid` (`typeid`,`channel`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='文档主表';

-- -----------------------------
-- Records of `ey_archives`
-- -----------------------------
INSERT INTO `ey_archives` VALUES ('1', '1', '6', '0', '关于我们 ', '', '0', '0', '0', '0', '0', '', '0', '0', '', '0', '', '', '', '1', '100', 'cn', '0', '0', '0', '1551921767', '1551926681');
INSERT INTO `ey_archives` VALUES ('2', '7', '6', '0', '联系我们', '', '0', '0', '0', '0', '0', '', '0', '0', '', '0', '', '', '', '1', '100', 'cn', '0', '0', '0', '1551921816', '1551929680');
INSERT INTO `ey_archives` VALUES ('3', '8', '6', '0', '公司简介', '', '0', '0', '0', '0', '0', '', '0', '0', '', '0', '', '', '', '1', '100', 'cn', '0', '0', '0', '1551921847', '1551923809');
INSERT INTO `ey_archives` VALUES ('4', '9', '6', '0', '企业文化', '', '0', '0', '0', '0', '0', '', '0', '0', '', '0', '', '', '', '1', '100', 'cn', '0', '0', '0', '1551921859', '1551924038');
INSERT INTO `ey_archives` VALUES ('5', '12', '6', '0', '公司团队', '', '0', '0', '0', '0', '0', '', '0', '0', '', '0', '', '', '', '1', '100', 'cn', '0', '0', '0', '1551923136', '1551924364');
INSERT INTO `ey_archives` VALUES ('6', '10', '1', '0', '如何填写购房意向书？几招教您搞定', '/uploads/ueditor/20190307/5c8089440ee99.png', '0', '0', '0', '0', '0', '', '232', '0', '', '0', '', '', '相信好多想要购房的朋友都会碰到购房意向书，那什么是购房意向书呢？购房意向书主要出现在下面这种情况中：当一套抢手房源有很多买家竞争的时候，买卖双方会提出签订购房意向书以表示购房的意愿，也能提前预防房源被其他买家买走的情况出现。购房意向书是一种意向性的协议，不包括房屋具体情况和购房合同细节，有助于买家和买家之间有效沟通并达成彼此的需求。购房意向书在购房流程中是比较重要的一环，但是有不少朋友不了解怎样写购房意向书，下面小编就来教大家如何写意向书的方法：1.当买家决定购买卖方（开发商）位于某市某路的一套房子时，可以与卖方签订购房意向书并按意向书中的内容签订正式的预售合同，卖方不得将房屋另行出售给他人。2.意向书中应包含以下内容：房屋具体建筑面积、房屋单价、房屋暂定总款等，并约定房屋面积以房地产测绘机构测定结果为准，且房屋总价以机构测定结果乘以房屋单价的结果为准实行多退少补原则。3.意向书签订后买方应在项目开盘销售日起的十五日内携带本意向书、确认金收款凭证、本人身份证至售楼处签订正式的预售合同并支付购房款。4.若买方逾期未与卖方签订正式预售合同的话视为买方自动放弃该套房源，卖方有权将其重新出售给', '1', '100', 'cn', '1', '0', '0', '1551927611', '1551927611');
INSERT INTO `ey_archives` VALUES ('7', '10', '1', '0', '房地产开发五证是指什么？为什么要选择五证齐全的房子？', '/uploads/ueditor/20190307/5c8089762cce0.png', '0', '0', '0', '0', '0', '', '249', '0', '', '0', '', '', '对于许多准备置业的买房新手，买房时往往不知道应该从哪儿看起，那么看这儿就对了。买房必须关注的便是五证问题，一个五证齐全的房子能让你在买房后的服务和前期的购买都具有法律保障，那么房地产开发五证是指什么？为什么要选择五证齐全的房子？下面为您一一详解。五证是什么及其含义：1、《国有土地使用证》：这是地块开发建设的基础，具备此证说明开发商交了土地出让金，地买了使用土地是合法的。2、《建设工程规划许可证》：证明建设工程符合要求。3、《建筑用地规划许可证》：说明开发商的产品设计规划申请通过并决定将要盖的业态，同时证明用地合法，该建筑不是违建。4、《建设工程施工许可证》：说明该地可以开工盖房，开发商有了此证才能动工。5、《商品房销售(预售)许可证》：依照规定达到了工程量后房屋可以进入市场正式销售。小贴士：需要注意的是，对于新买房的置业者们，在进入售楼处的时候一定看五证是否公示、售楼处所公示出来的五证上面的日期一定要看是否到期、您当前所处的售楼处和商品房的预售证是否匹配。为什么选择五证齐全房子？1、签订的合同具有法律效应，五证不全以后出了问题很难处理2、五证不全的房子开发商可能会“偷梁换柱”，会有一房', '1', '100', 'cn', '1', '0', '0', '1551927652', '1551927652');
INSERT INTO `ey_archives` VALUES ('8', '10', '1', '0', '什么叫小产权房子？购买小产权房子需要承受什么风险？', '/uploads/ueditor/20190307/7bc045439166362b98ad9d032a05dac9.jpg', '0', '0', '0', '0', '0', '', '215', '0', '', '0', '', '', '小产权的房子能购买吗？长期困扰在不明真相的购房者们，价格便宜的房屋一般都会有可大可小的问题，有些特殊的房屋是不能办理房产证书的，小产权房屋就在其中，小产权的房屋价格往往比普通商品房的房价还要低，什么叫小产权房子？购买小产权房子需要承受什么风险？什么叫小产权房子？用简单、通俗易懂的话来说，就是国家房管部门颁发的产权证、能进行交易的就叫大产权房子，能买到的普通商品房就是属于大产权房子，包含了三种产权就是40年产权、50年产权、70年产权，而小产权房子国家是不发房产证的，土地使用证、预售证都是没有的。识别小产权房子有三种性质1、由村名集体建设在集体用地上建成的房子，在宅基地上成功建设的房子，所属权是该村的所有人，邻村、外村的村名是不可以购买的。2、各种类型的养老院、农业园的别墅：这类型的房屋一旦起冲突、发生纠纷，购买此地房子的业主是得不到任何的赔偿，因之前购买所签的合同在法律上是无效的。3、集体企业用地、占用耕地违反建设成的房屋。购买小产权房子需要承受什么风险？1、不能办理房产证对于在集体用地上建设成功的小产权房子，是只有此村的村民才能购买，除此之外城市居民购买了是无法办理房产证的，只能用相', '1', '100', 'cn', '1', '0', '0', '1551927690', '1551927690');
INSERT INTO `ey_archives` VALUES ('9', '10', '1', '0', '签订商品房买卖合同需要注意哪些问题和哪些盲区？', '/uploads/ueditor/20190307/5c808bde7a850.png', '0', '0', '0', '0', '0', '', '133', '0', '', '0', '', '', '购房对于普遍人来说算得上是当今社会的一件大事，所以要购买商品房之前也需要谨小慎微，而为了保障购房者的权益《商品房销售管理办法》第十六条规定了地产开发企业和买受人应当订立书面商品房买卖合同。那么签订商品房买卖合同不能忽略哪些需要注意问题呢？一．一定合同中要注明或明确与开发商谈定的付款方式，是一次性付款还是按揭付款，最好要注明如果按揭付款时申请不到银行的付款方式的处理办法。二．一定要明确合同中的所购面积是不是自己看中哪个户型的面积（如分摊的公用面积是多少，实际使用是多少），如果将买房子的面积出现了误差超过不是合同约定范围面积购房者有权退房并向开发商追缴利息损失。三．一定要在合同里确定各居室、客厅、厕所的面积，房屋在建造时候使用的建筑结构、装修及设备的材料、品牌和型号，确保是不是属于合格产品，如果入住发现不是合同中所明确的材质出现伪劣材质可以追究开发商的责任。四．一定要让开发商在合同里明确房屋的交付使用日期，必须具体到某年某月某日不能在合同里出现棱模两可的交房时间的表达方式，因为这样如果开发商不按照合同规定的交房日期的话我们可以按照此条款追究其违约责任。以上就是小编整理出来的四条签订《商品房', '1', '100', 'cn', '1', '0', '0', '1551928275', '1551928275');
INSERT INTO `ey_archives` VALUES ('10', '19', '6', '0', '联系方式', '', '0', '0', '0', '0', '0', '', '0', '0', '', '0', '', '', '', '1', '100', 'cn', '0', '0', '0', '1551929899', '0');
INSERT INTO `ey_archives` VALUES ('11', '18', '2', '0', '恒大御海天下', '/uploads/allimg/20190307/61469d6bec5fdca367c9eec28797ad53.jpg', '0', '0', '0', '0', '0', '', '149', '0', '', '0', '', '', '恒大御海天下地处海南马袅湾滨海国际旅游区内，项目占地约1665亩，建筑面积约122万，1.37容积率，绿地率46%；项目纵享湾区中央小岛（规划有海岛欢乐世界）、红树林生态湿地、滨海防风森林等三大生态资源，项目内规划有约2833（建筑面积）儿童奇幻王国、约1890（建筑面积）精英幼儿园、约1.07万（建筑面积）风情商业街、约4616（建筑面积）滨海娱乐会所四大缤纷配套，是集旅游观光、娱乐运动、生态休闲于一体的度假大盘。项目首推产品定位为享受型度假产品：【瞰海高层】建筑面积约51-154（带装修），方正格局，带入户花园、景观阳台，拥河景海景双重享受。【半岛别墅（低层住宅）】建筑面积约42（带装修），一层可享两层，带前庭后院私家亲水花园。项目拥有约12万平米臻美威尼斯式水系，园林内曲径通幽，围绕中心景观种植有造型百余种热带植被。', '1', '100', 'cn', '1', '0', '0', '1551930231', '1551930369');
INSERT INTO `ey_archives` VALUES ('12', '18', '2', '0', '绿城桃李春风别墅', '/uploads/allimg/20190307/ef1d66460d6799320cf09109e5f3df8a.jpg', '0', '0', '0', '0', '0', '', '269', '0', '', '0', '', '', '绿城·桃李春风位于海口市琼山区云龙产业园，项目总占地1100亩，共1278户，是海口千亩千栋纯独栋别墅社区。项目周边交通体系发达，同时具备机场、绕城高速、东线高速、环岛轻轨，城市主干道等立体交通网络，将项目与海南紧密联系在一起。项目距国兴大道省政府车程约30公里，项目为业主提供汽车租赁、金融购车等服务，有从市区直达项目的免费班车，每天定点定区域在市区内接送客户 。绿城·桃李春风周边配套完善，设有美兰高尔夫、台达高尔夫、观澜湖高尔夫等近10座球场。更有鸿洲马会、鸿洲游艇会、奥特莱斯世界名品折扣店、美兰机场离岛免税店等休闲中心，交通和生活配套成熟&nbsp;。绿城·桃李春风作为海口规模庞大的度假式近郊别墅大盘,由1278户175㎡-359㎡的纯别墅组成，整个社区规划为一处休闲度假小镇。建筑设计风格在保证实用舒适的基础上，力求体现出基于海南本土风格之上简洁雅致的特质。绿城·桃李春风社区布局以湖、湾水系为景观核心，打造了300亩自然集中式园林。户户别墅面湖而居，一湖、一湾景观中心发散出5个主要水系，形似人们的手指，将一缕缕活水有序地分布到20个精致的组团里。在园林设计上，充分考虑别墅客户的生活', '1', '100', 'cn', '1', '0', '0', '1551930486', '1551930551');
INSERT INTO `ey_archives` VALUES ('13', '18', '2', '0', '南国威尼斯城别墅', '/uploads/allimg/20190307/fd1bf7f3dce24907927b619f287f388d.jpg', '0', '0', '0', '0', '0', '', '223', '0', '', '0', '', '', '南国威尼斯城项目位于海南国际旅游岛的省会海口市美兰机场附近。项目用地南临南渡江支流三十六曲溪，西侧与省级云定公路贴邻，南北侧均为种植林地，整个地块南北跨度约990m,东西长约1200m，地块规整。南国威尼斯城项目用地约1347亩，总建筑面积约82万平方米。项目产品种类丰富，是由公寓、独院别墅（含带商铺）、巴黎公馆、南加别墅、花园洋房等巴洛克风格建筑组合而成的恢宏欧陆城邦。该项目养生配套设施齐全，商业风情街满足生活所需，植被葱郁、湖光山色、环境优美、景色怡人、美不胜收，是旅游度假产品中的得力之作。 南国威尼斯城作为海口规模大的楼盘，拥有78万平方米恢宏城邦，产品物业类型齐全，包括从小户型公寓、花园洋房、叠加别墅、联排别墅、双拼别墅、独立别墅、风情商业街的全系列产品。南国威尼斯城适用合理的户型设计，一房一厅50多平米，两房一厅60-70平米，两房两厅85平米左右，三房两厅两卫105平米，花园洋房140--150平米，联排别墅180平米，双拼别墅200平米，独栋别墅250--350平米。所有户型均紧凑合理，项目总户数为8000户，其中二期户数为440户. 南国威尼斯城便捷顺畅的交通', '1', '100', 'cn', '1', '0', '0', '1551930577', '1551930689');
INSERT INTO `ey_archives` VALUES ('14', '18', '2', '0', '碧桂园中央半岛别墅', '/uploads/allimg/20190307/26f7851ad3647e3ba37c2eac49dfa3c8.jpg', '0', '0', '0', '0', '0', '', '193', '0', '', '0', '', '', '碧桂园中央半岛，是广物地产集团打造的滨海别墅盘。项目总占地约310万平米（4628亩），总建筑面积过100万平米，坐拥数公里城市海岸线。项目北临琼州海峡，与广东省相隔18海里；西面隔江相望是海甸岛，可共享海甸岛醇熟生活配套；南面是内海湾区，与广物滨海国际隔湾相望；东面则是南渡江出海口的壮丽景观，自然风光好，海南之心是海口可观赏日出日落景观的滨海社区。项目内规划有1600亩水系，以及江、河、海、湾四景汇聚的风景岸线，由多座风格迥异的桥梁贯穿各个形状各异、大小不同的地块，真正将艺术、生态与滨海居住融合。项目设计以迈阿密、威尼斯为规划蓝本，以“白色迈阿密”风格结合海南热带风情以及新埠岛的岛屿海景资源，因地布局，汇聚成现代的建筑风格。项目一共分四期开发，首期开发05/07/10三个地块，产品涵盖独栋，双拼，联排，合院别墅、平层等多种物业类型。', '1', '100', 'cn', '1', '0', '0', '1551930705', '1551930755');
INSERT INTO `ey_archives` VALUES ('15', '18', '2', '0', '耀江西岸公馆别墅', '/uploads/allimg/20190307/2ca3678d782b39c58985013df1d8fdd5.jpg', '0', '0', '0', '0', '0', '', '146', '0', '', '0', '', '', '耀江·西岸公馆位项目于享有“高尚居住区”之美称的海口市西海岸，项目用地呈长方形，南北宽241米，东西长586米，总占地面积180亩，总建筑面积约11.59万平方米，项目北临滨海大道，遥望新国宾馆，西邻西海豪园，东北近蔚蓝海岸项目。距海边300余米，本项目由35栋独立别墅、12栋15-18层纯板式高层住宅及望海空中会所组成.是以高起点.高标准打造的融休闲.度假、居住为一体的滨海度假居住社区。耀江·西岸公馆项目为东南亚热带融汇简欧建筑风格，建筑立面线条流畅简洁，用材考究，大方细致、端庄典雅，楼宇外立面外墙裙房采用天然石材，主体采用真石漆，外墙以米黄色为主调，局部采用浅棕色，形成端庄典雅的建筑风格,尽显欧陆底蕴的低调奢华，园林景观则对应建筑的简约风格.分组团精雕细琢打造具有浓郁热带风情的大型水景园林，建筑与环境相融，人文与生态相伴。水系沿景观主轴连通一体，贯穿整个小区.宛若蓝色项链，将独立别墅区与海景公寓区自然分隔。项目绿化率高达50%，容积率仅为0.7，住宅564户，海景公寓的主力户型为81-89㎡两房，107-135㎡三房；独立别墅面积为405-662㎡。', '1', '100', 'cn', '1', '0', '0', '1551930760', '1551930824');
INSERT INTO `ey_archives` VALUES ('16', '18', '2', '0', '富力盈溪谷先生的院子别墅', '/uploads/allimg/20190307/f434743d6e3b58c841bba1733ca16cf2.jpg', '0', '0', '0', '0', '0', '', '117', '0', '', '0', '', '', '富力盈溪谷三期先生的院子，项目位于海口西海岸城市新区，在45万火山岩地貌的肥沃土地上,精心勾勒西班牙的水岸社区，拥享138亩千年那甲古河自然水系、8000原生湖泊、1500风情商业街、2000会所、3大主题公园、3大阳光泳池等丰富配套,逾240种植物近5万棵树遍布全区，是典型低密度、低容积率、高绿化的品质社区。融合西班牙小镇独有的热情与浪漫，筑就罕见的大花园纯墅庄园，尊享海南美妙风景.220-280㎡独栋双拼别墅，1200生态公园后花园，果树景观，沁心宜人，享大庭院，户户花园，600私家庭院尽享。', '1', '100', 'cn', '1', '0', '0', '1551930832', '1551930906');
INSERT INTO `ey_archives` VALUES ('17', '16', '2', '0', '融创观澜湖公园壹号', '/uploads/allimg/20190307/c32b4d1bead94719c6524b4dbf10f385.jpg', '0', '0', '0', '0', '0', '', '292', '0', '', '0', '', '', '融创·观澜湖公园壹号为中国地产十强融创在海南省会海口市开发的旅游度假兼自住的综合型项目，项目位于海口市观澜湖旅游度假区内，共享观澜湖成熟配套，项目总占地217亩，总建筑面积33.3万平方米，综合容积率2.3。项目紧邻观澜湖旅游度假区主入口，延观澜湖2号高尔夫球场顺势排布，纯板式结构，南北通透。楼体坐北朝南，高尔夫果岭、百年荔枝林景观尽收眼底，带来一见倾心的诗意生活。', '1', '100', 'cn', '1', '0', '0', '1551930963', '1551931054');
INSERT INTO `ey_archives` VALUES ('18', '16', '2', '0', '景园悦海湾 ', '/uploads/allimg/20190307/be3b89b7d684538499c603b73e4165dd.jpg', '0', '0', '0', '0', '0', '', '114', '0', '', '0', '', '', '景园悦海湾项目是由甘肃商会策划、景园集团倾力打造的房地产项目，位于海南长寿之乡澄迈老城经济开发区。风景秀丽，碧海、蓝天、沙滩、阳光常年相伴，一年四季微风吹拂，生态环境宜人。同时尊踞盈滨半岛，粮食作物、水果、蔬菜等含硒量高，是天养生度假的地方。景园悦海湾项目占地400亩，共建10栋高层住宅外加一栋多功能会所。小区共有2960多户，停车位有2700多个。户型全面，从50多到170多平，从一房到四房均有；项目10层以上少部分楼层可以看到海，120米大楼间距享受视觉效果。户型南北通透、方方正正、采光好，实用性高，并且提供非毛坯，方便于业主轻松入住的需求.景园悦海湾项目携手景观设计团队，倾力打造一个内湖水景，以此满足人们居住生活中对水的向往和享受，大面积的内湖水景辅以音乐喷泉、泳池、亲水广场、叠水等景观营造，让水景于社区之间自然渗透，彻底浸润人的身心。小区还将打造浓郁西北特色为主的主题商业街，特别引进了西北特色的餐饮、购物及休闲娱乐配套，让您身处海南也能感受到家乡的味道。', '1', '100', 'cn', '1', '0', '0', '1551931139', '1551931205');
INSERT INTO `ey_archives` VALUES ('19', '16', '2', '0', '富力悦海湾别墅', '/uploads/allimg/20190307/dbdcfa9a63892dc1c8f2b194b01451f7.jpg', '0', '0', '0', '0', '0', '', '139', '0', '', '0', '', '', '富力悦海湾位于临高文澜江入海口，紧邻琼州海峡，占据生态富硒地，总规划7800亩，容积率1.6，绿化率40%。富力悦海湾海陆空交通配套一体化，在短程内便可畅行全岛。从项目出发，10公里可到达高铁临高南站，经由环岛西线高速70公里享达海口市区，100公里高速直通美兰国际机场，社区内还将配有业主巴士、观光游览车等出行配套。富力悦海湾全面升级富力红树湾的健康理念及配套，规划以大健康生活体验为主旨的五大健康中心（健康管理中心、爱乐歌剧院、奥林匹克体育中心、悦海生活广场、湾主体验馆），辅以旅游、居住、商业等配套复合发展，是一座国际级全配套的全龄旅居养生目的地。', '1', '100', 'cn', '1', '0', '0', '1551931207', '1551931267');
INSERT INTO `ey_archives` VALUES ('20', '16', '2', '0', '恒大御海天下 ', '/uploads/allimg/20190307/cc17fb57274d54249b3e790c265dd792.jpg', '0', '0', '0', '0', '0', '', '171', '0', '', '0', '', '', '恒大御海天下地处海南马袅湾滨海国际旅游区内，项目占地约1665亩，建筑面积约122万，1.37容积率，绿地率46%；项目纵享湾区中央小岛（规划有海岛欢乐世界）、红树林生态湿地、滨海防风森林等三大生态资源，项目内规划有约2833（建筑面积）儿童奇幻王国、约1890（建筑面积）精英幼儿园、约1.07万（建筑面积）风情商业街、约4616（建筑面积）滨海娱乐会所四大缤纷配套，是集旅游观光、娱乐运动、生态休闲于一体的度假大盘。项目首推产品定位为享受型度假产品：【瞰海高层】建筑面积约51-154（带装修），方正格局，带入户花园、景观阳台，拥河景海景双重享受。【半岛别墅（低层住宅）】建筑面积约42（带装修），一层可享两层，带前庭后院私家亲水花园。项目拥有约12万平米臻美威尼斯式水系，园林内曲径通幽，围绕中心景观种植有造型百余种热带植被。', '1', '100', 'cn', '1', '0', '0', '1551931282', '1551931349');
INSERT INTO `ey_archives` VALUES ('21', '16', '2', '0', '融创美伦熙语 ', '/uploads/allimg/20190307/196a485e7e86b79ee41201dcfae56993.jpg', '0', '0', '0', '0', '0', '', '187', '0', '', '0', '', '', '融创·美伦熙语地处“世界长寿之乡”“产业富集地”“海口后花园”之称的澄迈老城。融创以“精品”战略为主，携手海南生态软件园匠心打造，配备国内度假生活配套和一级资质物管服务，把未来社区的美好构想落为现实，打造海南宜居的社区。海口绕城高速、海渝西线、南海大道、滨海大道直通项目。距老城高铁站约5.8公里，距省会海口20公里，距美兰国际机场32公里，57路、59路公交车途经项目，直达海口市区。社区内将规划有业主食堂、咖啡吧、温泉泡池、泳池、业主活动中心、健康跑道等配套，并且配备一级资质物业服务，给您带来度假生活体验。项目一期户型有75㎡两房、80㎡两房和105㎡三房，均以非毛坯交付。板式户型全南向设计，南北通透，通风采光条件好。户户拥有南向景观阳台，南北卧室全部含飘窗，可尽揽湖、河、海景色。融创·美伦熙语的设计，严谨考量每一处细节升级，从实用、舒适、健康、安全等方面为业主打造安心好房。', '1', '100', 'cn', '1', '0', '0', '1551931351', '1551931415');
INSERT INTO `ey_archives` VALUES ('22', '16', '2', '0', '星华海岸城 ', '/uploads/allimg/20190307/8e7cf5bdc40fc48c9f05965ce0eb6059.jpg', '0', '0', '0', '0', '0', '', '272', '0', '', '0', '', '', '星华海岸城项目是由海南星华集团投资有限公司打造的160万平方米滨海项目。星华.海岸城位于海南省海口市西海岸度假区，北侧22公里海岸线隔路相望，南侧五源河公务员小区，东侧是五源河学校，西侧为海口火车站和动车海口站。项目离海口市政府新行政中心约1.5公里，离市中心约12公里，离海口火车站约5公里，距海口美兰国际机场约35公里。星华.海岸城总占地面积约500亩，总建筑面积约200万㎡，一期共1378户，容积率为2.5，绿化率为40％，1183个车位。公寓户型：1+1房（67㎡），2房84-88㎡，3房119-138㎡星华海岸城二期位于长滨六路4号，与海口五源河学校一路之隔。二期容积率为2.24，绿化率为40％，由10栋21-24层的高层和5栋11层的板式小高层组成，共1072户，1614个车位（地下车位1450个，地上车位164个）。海南星华集团投资有限公司初创于1992年，本着“与客户共享成功，与员工共求发展，与社会共同进步”的企业宗旨，奉行“诚信、创新、卓越、高效”的企业精神和“科学管理、锐意创新、与时俱进”的发展经营方针，经过二十五年的探索与发展，已成为一家以房地产业和旅游业为**，集', '1', '100', 'cn', '1', '0', '0', '1551931420', '1551931475');
INSERT INTO `ey_archives` VALUES ('23', '14', '2', '0', '雅居乐金沙湾 ', '/uploads/allimg/20190307/b3561a011ed66bfbd450df2a7d221d03.jpg', '0', '0', '0', '0', '0', '', '180', '0', '', '0', '', '', '雅居乐金沙湾，是雅居乐地产地产深耕市场25载，顺应滨海旅居发展潮流，首次登陆海口的匠心巨作。项目位于海口市西海岸金沙湾 ，依托西海岸绝版一线原生海景资源和海口市CBD 千亿配套， 形成“城市与海兼得”的独特区位 。邀请美国AECOME设计公司、广东省建筑研究院联袂担纲规划设计，重金打造国际 ，五星级酒店等 服务配套，全方位满足客户的 ，中短期度假，和长期居住的需求，全新演绎 “都市版第二人生”。', '1', '100', 'cn', '1', '0', '0', '1551931489', '1551931586');
INSERT INTO `ey_archives` VALUES ('24', '14', '2', '0', '碧桂园剑桥郡 ', '/uploads/allimg/20190307/d7e3a1c6ac9a0d25bf38ab6de3114435.jpg', '0', '0', '0', '0', '0', '', '273', '0', '', '0', '', '', '碧桂园剑桥郡，海口城南超越之作，项目位于椰海大道与丘海大道延长线交汇处西南侧，项目为碧桂园2018年在海口重磅打造的大型城市智慧教育住区，是海南一个引入目前国内的SSGF建造技术项目，居住品质将超越目前海南传统社区。项目规划的优质教育。匠心打造17-18层南北纯板式洋房，约101-179㎡三至四房，舒适低密度智能化社区，内部规划五重立体高尔夫园林、成人标准泳池、标准篮球场、羽毛球场、全龄段儿童户外乐园、社区跑道等升级配套。', '1', '100', 'cn', '1', '0', '0', '1551931601', '1551931652');
INSERT INTO `ey_archives` VALUES ('25', '14', '2', '0', '楠滨华庭', '/uploads/allimg/20190307/8fe6e6478474f1b01d5d942345ed3343.jpg', '0', '0', '0', '0', '0', '', '116', '0', '', '0', '', '', '楠滨华庭项目总占地37710.42㎡，总建筑面积135693㎡，有两个地块分两期开发，一期占地13341.34㎡，建筑面积42992.95㎡，容积率：2.5 ，绿化率：37.05%，由一个三层的商场，两栋23层高层公寓组成，有沿街商铺31间，住宅户型分别是86.86㎡ 两房两厅 ，123.86㎡三房两厅，139.82㎡四房两厅。二期占地24369.08㎡，建筑面积92694.98㎡，容积率：3.0，绿化率：35%，由五栋高层公寓组成，沿街商铺83个，住宅户型分别是两房两厅87.89㎡，三房两厅116.77㎡，121.36㎡,123.52㎡,126.34㎡，四房两厅139.85㎡，六房两厅238.79㎡.一期预计2018年12月31前交付使用，二期待定。', '1', '100', 'cn', '1', '0', '0', '1551931654', '1551931722');
INSERT INTO `ey_archives` VALUES ('26', '14', '2', '0', '中盟椰海国际', '/uploads/allimg/20190307/af445cbaa62e71b780328efc26d768ba.jpg', '0', '0', '0', '0', '0', '', '201', '0', '', '0', '', '', '中盟·椰海国际打造低建筑密度16%，人车分流，环境安逸，舒适宜居。主推户型板塔结合，全明户型，独具入户花园，方正宽敞大阳台，延景入室，生机盎然，南北通透，静谧一角，风雅静逸。', '1', '100', 'cn', '1', '0', '0', '1551931724', '1551931779');
INSERT INTO `ey_archives` VALUES ('27', '14', '2', '0', '阳光椰风苑', '/uploads/allimg/20190307/fc5bd2b6fe16fe914d51317e182fa62b.jpg', '0', '0', '0', '0', '0', '', '100', '0', '', '0', '', '', '阳光椰风苑位于塔岭新区，是定安鼎泰置业有限公司在定安开发兴建的，以养生度假为主题的大型社区。阳光椰风苑总占地约86311.55平方米，建筑面积176725平方米，共1784户，是一个集多层、高层、酒店、商业的综合项目。阳光椰风苑分两期开发，一期已经交房使用。二期推出背面临街的一栋17层公寓楼，两梯6户，户型为一房和两房，面积在48到81平米，适合养老、度假及**。', '1', '100', 'cn', '1', '0', '0', '1551931782', '1551931839');
INSERT INTO `ey_archives` VALUES ('28', '14', '2', '0', '恩祥新城 ', '/uploads/allimg/20190307/e81c31f4bd06dbe96c4c7be663a20add.jpg', '0', '0', '0', '0', '0', '', '115', '0', '', '0', '', '', '恩祥·新城位于椰海大道和海榆中线的交汇处，项目分8期开发，一期占地111亩，建面约26万㎡。项目集商业中心、旅游区、创意产业、传统文化及生态资源为一体的商业集群。恩祥集团将联合北京王府井商业、北京大学附属中学、北京大学附属小学等品牌，打造集健康教育、休闲旅游、休憩商业、宜居生活为一体的项目。', '1', '100', 'cn', '1', '0', '0', '1551931841', '1551931911');

-- -----------------------------
-- Table structure for `ey_arcmulti`
-- -----------------------------
DROP TABLE IF EXISTS `ey_arcmulti`;
CREATE TABLE `ey_arcmulti` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `tagid` varchar(60) NOT NULL DEFAULT '' COMMENT '标签ID',
  `tagname` varchar(60) NOT NULL DEFAULT '' COMMENT '标签名',
  `innertext` text NOT NULL COMMENT '标签模板代码',
  `pagesize` int(10) NOT NULL DEFAULT '0' COMMENT '分页列表',
  `querysql` text NOT NULL COMMENT '完整SQL',
  `ordersql` varchar(200) DEFAULT '' COMMENT '排序SQL',
  `addfieldsSql` varchar(255) DEFAULT '' COMMENT '附加字段SQL',
  `addtableName` varchar(50) DEFAULT '' COMMENT '附加字段的数据表，不包含表前缀',
  `attstr` text COMMENT '属性字符串',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='多页标记存储数据表';

-- -----------------------------
-- Records of `ey_arcmulti`
-- -----------------------------
INSERT INTO `ey_arcmulti` VALUES ('1', 'arclista2eb60d7f86d7508668169b51bf67d19', 'arclist', '', '6', 'SELECT `b`.*,`a`.* FROM `ey_archives` `a` LEFT JOIN `ey_arctype` `b` ON `b`.`id`=`a`.`typeid` WHERE  (  a.typeid IN (3,3) AND a.channel IN (2) AND a.arcrank > -1 AND a.status = 1 AND a.is_del = 0 )  AND `a`.`lang` = \'cn\' ORDER BY a.sort_order asc, a.aid desc LIMIT 6', 'a.sort_order asc, a.aid desc', '', '', 'a:2:{s:3:\\\"row\\\";s:1:\\\"6\\\";s:8:\\\"titlelen\\\";s:2:\\\"40\\\";}', '1551923104', '1551928595');
INSERT INTO `ey_arcmulti` VALUES ('2', 'arclistfa72fce6d186fe89c2cc2c1c8c054625', 'arclist', '', '6', 'SELECT `b`.*,`a`.* FROM `ey_archives` `a` LEFT JOIN `ey_arctype` `b` ON `b`.`id`=`a`.`typeid` WHERE  (  a.typeid IN (4,4) AND a.channel IN (2) AND a.arcrank > -1 AND a.status = 1 AND a.is_del = 0 )  AND `a`.`lang` = \'cn\' ORDER BY a.sort_order asc, a.aid desc LIMIT 6', 'a.sort_order asc, a.aid desc', '', '', 'a:2:{s:3:\\\"row\\\";s:1:\\\"6\\\";s:8:\\\"titlelen\\\";s:2:\\\"40\\\";}', '1551923104', '1551928595');
INSERT INTO `ey_arcmulti` VALUES ('3', 'arclista365d69309049b9658c64ab5fc4e4eb3', 'arclist', '', '6', 'SELECT `b`.*,`a`.* FROM `ey_archives` `a` LEFT JOIN `ey_arctype` `b` ON `b`.`id`=`a`.`typeid` WHERE  (  a.typeid IN (5,5) AND a.channel IN (2) AND a.arcrank > -1 AND a.status = 1 AND a.is_del = 0 )  AND `a`.`lang` = \'cn\' ORDER BY a.sort_order asc, a.aid desc LIMIT 6', 'a.sort_order asc, a.aid desc', '', '', 'a:2:{s:3:\\\"row\\\";s:1:\\\"6\\\";s:8:\\\"titlelen\\\";s:2:\\\"40\\\";}', '1551923104', '1551928595');
INSERT INTO `ey_arcmulti` VALUES ('4', 'arclist92aa33fcbf8a9d57347258119cbc087a', 'arclist', '', '3', 'SELECT `b`.*,`a`.* FROM `ey_archives` `a` LEFT JOIN `ey_arctype` `b` ON `b`.`id`=`a`.`typeid` WHERE  (  a.typeid IN (2,10,11,2) AND a.channel IN (1) AND a.arcrank > -1 AND a.status = 1 AND a.is_del = 0 )  AND `a`.`lang` = \'cn\' ORDER BY a.sort_order asc, a.aid desc LIMIT 3', 'a.sort_order asc, a.aid desc', '', '', 'a:2:{s:3:\\\"row\\\";s:1:\\\"3\\\";s:8:\\\"titlelen\\\";s:2:\\\"40\\\";}', '1551923464', '1551939808');
INSERT INTO `ey_arcmulti` VALUES ('5', 'arclistfd79b28932e1a429cc28a5d0900cc0c2', 'arclist', '', '6', 'SELECT `b`.*,`a`.* FROM `ey_archives` `a` LEFT JOIN `ey_arctype` `b` ON `b`.`id`=`a`.`typeid` WHERE  (  a.typeid IN (3,14,15,3) AND a.channel IN (2) AND a.arcrank > -1 AND a.status = 1 AND a.is_del = 0 )  AND `a`.`lang` = \'cn\' ORDER BY a.sort_order asc, a.aid desc LIMIT 6', 'a.sort_order asc, a.aid desc', '', '', 'a:2:{s:3:\\\"row\\\";s:1:\\\"6\\\";s:8:\\\"titlelen\\\";s:2:\\\"40\\\";}', '1551930910', '1551939808');
INSERT INTO `ey_arcmulti` VALUES ('6', 'arclist629ac9afa5643d21ecd09dd769243bfc', 'arclist', '', '6', 'SELECT `b`.*,`a`.* FROM `ey_archives` `a` LEFT JOIN `ey_arctype` `b` ON `b`.`id`=`a`.`typeid` WHERE  (  a.typeid IN (4,16,17,4) AND a.channel IN (2) AND a.arcrank > -1 AND a.status = 1 AND a.is_del = 0 )  AND `a`.`lang` = \'cn\' ORDER BY a.sort_order asc, a.aid desc LIMIT 6', 'a.sort_order asc, a.aid desc', '', '', 'a:2:{s:3:\\\"row\\\";s:1:\\\"6\\\";s:8:\\\"titlelen\\\";s:2:\\\"40\\\";}', '1551930910', '1551939808');
INSERT INTO `ey_arcmulti` VALUES ('7', 'arclistbc030373e7b9b01a1233b0fd689faa5f', 'arclist', '', '6', 'SELECT `b`.*,`a`.* FROM `ey_archives` `a` LEFT JOIN `ey_arctype` `b` ON `b`.`id`=`a`.`typeid` WHERE  (  a.typeid IN (5,18,5) AND a.channel IN (2) AND a.arcrank > -1 AND a.status = 1 AND a.is_del = 0 )  AND `a`.`lang` = \'cn\' ORDER BY a.sort_order asc, a.aid desc LIMIT 6', 'a.sort_order asc, a.aid desc', '', '', 'a:2:{s:3:\\\"row\\\";s:1:\\\"6\\\";s:8:\\\"titlelen\\\";s:2:\\\"40\\\";}', '1551930910', '1551939808');

-- -----------------------------
-- Table structure for `ey_arcrank`
-- -----------------------------
DROP TABLE IF EXISTS `ey_arcrank`;
CREATE TABLE `ey_arcrank` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `rank` smallint(6) DEFAULT '0' COMMENT '权限值',
  `name` char(20) DEFAULT '' COMMENT '会员名称',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文档阅读权限表';

-- -----------------------------
-- Records of `ey_arcrank`
-- -----------------------------
INSERT INTO `ey_arcrank` VALUES ('1', '0', '开放浏览', 'cn', '0', '0');
INSERT INTO `ey_arcrank` VALUES ('2', '-1', '待审核稿件', 'cn', '0', '0');

-- -----------------------------
-- Table structure for `ey_arctype`
-- -----------------------------
DROP TABLE IF EXISTS `ey_arctype`;
CREATE TABLE `ey_arctype` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '栏目ID',
  `channeltype` int(10) DEFAULT '0' COMMENT '栏目顶级模型ID',
  `current_channel` int(10) DEFAULT '0' COMMENT '栏目当前模型ID',
  `parent_id` int(10) DEFAULT '0' COMMENT '栏目上级ID',
  `typename` varchar(200) DEFAULT '' COMMENT '栏目名称',
  `dirname` varchar(200) DEFAULT '' COMMENT '目录英文名',
  `dirpath` varchar(200) DEFAULT '' COMMENT '目录存放HTML路径',
  `englist_name` varchar(200) DEFAULT '' COMMENT '栏目英文名',
  `grade` tinyint(1) DEFAULT '0' COMMENT '栏目等级',
  `typelink` varchar(200) DEFAULT '' COMMENT '栏目链接',
  `litpic` varchar(250) DEFAULT '' COMMENT '栏目图片',
  `templist` varchar(200) DEFAULT '' COMMENT '列表模板文件名',
  `tempview` varchar(200) DEFAULT '' COMMENT '文档模板文件名',
  `seo_title` varchar(200) DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` varchar(200) DEFAULT '' COMMENT 'seo关键字',
  `seo_description` text COMMENT 'seo描述',
  `sort_order` int(10) DEFAULT '0' COMMENT '排序号',
  `is_hidden` tinyint(1) DEFAULT '0' COMMENT '是否隐藏栏目：0=显示，1=隐藏',
  `is_part` tinyint(1) DEFAULT '0' COMMENT '栏目属性：0=内容栏目，1=外部链接',
  `admin_id` int(10) DEFAULT '0' COMMENT '管理员ID',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '伪删除，1=是，0=否',
  `del_method` tinyint(1) DEFAULT '0' COMMENT '伪删除状态，1为主动删除，2为跟随上级栏目被动删除',
  `status` tinyint(1) DEFAULT '1' COMMENT '启用 (1=正常，0=屏蔽)',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dirname` (`dirname`,`lang`) USING BTREE,
  KEY `parent_id` (`channeltype`,`parent_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='文档栏目表';

-- -----------------------------
-- Records of `ey_arctype`
-- -----------------------------
INSERT INTO `ey_arctype` VALUES ('1', '1', '6', '0', '关于我们 ', 'guanyuwomen', '/html/guanyuwomen', 'ABOUT US', '0', '', '/uploads/allimg/20190307/92bab331c320a810c3bf29d5ba7a9264.jpg', 'lists_single.htm', '', '', '', '', '100', '0', '0', '1', '0', '0', '1', 'cn', '1551921761', '1551926681');
INSERT INTO `ey_arctype` VALUES ('2', '1', '1', '0', '房产资讯 ', 'fangchanzixun', '/html/fangchanzixun', 'Real estate information', '0', '', '/uploads/allimg/20190307/4f2fc433a32c0b2b067b6f78684be994.jpg', 'lists_article.htm', 'view_article.htm', '', '', '', '100', '0', '0', '1', '0', '0', '1', 'cn', '1551921776', '1551928010');
INSERT INTO `ey_arctype` VALUES ('3', '2', '2', '0', '二手房 ', 'ershoufang', '/html/ershoufang', 'Quality second-hand house', '0', '', '/uploads/allimg/20190307/657692ad1d4fa71d0ca3106196d20004.jpg', 'lists_product.htm', 'view_product.htm', '', '', '', '100', '0', '0', '1', '0', '0', '1', 'cn', '1551921783', '1551931975');
INSERT INTO `ey_arctype` VALUES ('4', '1', '2', '0', '小区 ', 'xiaoqu', '/html/xiaoqu', 'Elegant district', '0', '', '/uploads/allimg/20190307/28a4ec821ad4d398ec4aaae41657336b.jpg', 'lists_product.htm', 'view_product.htm', '', '', '', '100', '0', '0', '1', '0', '0', '1', 'cn', '1551921789', '1551931963');
INSERT INTO `ey_arctype` VALUES ('5', '2', '2', '0', '别墅 ', 'bieshu', '/html/bieshu', 'Boutique villa', '0', '', '/uploads/allimg/20190307/167eed1baa058b27846930ee031e50f7.jpg', 'lists_product.htm', 'view_product.htm', '', '', '', '100', '0', '0', '1', '0', '0', '1', 'cn', '1551921803', '1551931952');
INSERT INTO `ey_arctype` VALUES ('6', '2', '2', '0', '出售 ', 'chushou', '/html/chushou', '', '0', '', '', 'lists_product.htm', 'view_product.htm', '', '', '', '100', '0', '0', '1', '1', '1', '1', 'cn', '1551921811', '1551922209');
INSERT INTO `ey_arctype` VALUES ('7', '6', '6', '0', '联系我们', 'lianxiwomen', '/html/lianxiwomen', '', '0', '', '/uploads/allimg/20190307/1b488dd54c29cd0843e90f4ddab01a6e.jpg', 'lists_single.htm', '', '', '', '', '100', '0', '0', '1', '0', '0', '1', 'cn', '1551921816', '1551929680');
INSERT INTO `ey_arctype` VALUES ('8', '1', '6', '1', '公司简介', 'gongsijianjie', '/html/guanyuwomen/gongsijianjie', 'ABOUT US', '1', '', '/uploads/allimg/20190307/41955ca9a436f4f42aece6978d22c60d.jpg', 'lists_single.htm', '', '', '', '某某置业创建于2009年6月，坐落于广东深圳市，主营新房代理销售。专注旅游地产面向全国，借助互联网，成功的将全国旅居地产楼盘信息与购房者进行连接。实现了特有的房地产行业的O20业务模式，并将致力于将线上线下的业务模式做到极致。2018年业务开始面向海南、广西、广东、云南、河南几大省份。未来业务将覆盖全国沿海地区。某某置业是一家专业的旅游地产网络平台。我们坚持以客户需求为核心，面向全国客户提供专业详细的旅游地产市场解读，旅居购房、旅居楼盘咨询等服务。', '100', '0', '0', '1', '0', '0', '1', 'cn', '1551921847', '1551926681');
INSERT INTO `ey_arctype` VALUES ('9', '1', '6', '1', '企业文化', 'qiyewenhua', '/html/guanyuwomen/qiyewenhua', '', '1', '', '/uploads/allimg/20190307/41d49088a1ddd48195f48e94ad7c2d15.jpg', 'lists_single.htm', '', '', '', '核心价值观：诚信、创新、服务，企业核心： 诚信，企业精神： 团结拼搏、开拓求实、满足用户、科技进步。客户：为客户提供高质量和最大价值的专业化产品和服务，以真诚和实力赢得客户的理解、尊重和支持。市场：为客户降低采购成本和风险，为客户投资提供切实保障。发展：追求永续发展的目标，并把它建立在客户满意的基础上。关于“为合作伙伴创造价值”公司认为客户、供应商、公司股东、公司员工等一切和自身有合作关系的单位和个人都是自己的合作伙伴，并只有通过努力为合作伙伴创造价值，才能体现自身的价值并获得发展和成功。关于“诚实、宽容、创新、服务”公司认为诚信是一切合作的基础，宽容是解决问题的前提，创新是发展事业的利器，服务是创造价值的根本。公司会坚持持续改进、满足顾客期望、 确保品质第一、开拓全球市场。', '100', '0', '0', '1', '0', '0', '1', 'cn', '1551921859', '1551926681');
INSERT INTO `ey_arctype` VALUES ('10', '1', '1', '2', '省内资讯', 'shengnazixun', '/html/fangchanzixun/shengnazixun', '', '1', '', '', 'lists_article.htm', 'view_article.htm', '', '', '', '100', '0', '0', '1', '0', '0', '1', 'cn', '1551921904', '1551928010');
INSERT INTO `ey_arctype` VALUES ('11', '1', '1', '2', '省外资讯', 'shengwaizixun', '/html/fangchanzixun/shengwaizixun', '', '1', '', '', 'lists_article.htm', 'view_article.htm', '', '', '', '100', '0', '0', '1', '0', '0', '1', 'cn', '1551921926', '1551928010');
INSERT INTO `ey_arctype` VALUES ('12', '1', '6', '1', '公司团队', 'gongsituandui', '/html/guanyuwomen/gongsituandui', '', '1', '', '', 'lists_single.htm', '', '', '', '研发管理就是在研发体系结构设计和各种管理理论基础之上，借助信息平台对研发过程中进行的团队建设、流程设计、绩效管理、风险管理、成本管理、项目管理和知识管理等的一系列协调活动。研发管理，是一个较为宽泛的管理范畴。可以从狭义和广义两个方面来进行理解：狭义的定义：是指对研发或技术部门及其工作进行管理，重点是产品开发及测试过程。广义的定义：研发工作实际上不仅仅包含技术开发工作，其范围涵盖新产品的全生命周期，以从产品创意的产生、产品概念形成、产品市场研究、产品设计、产品实现、产品开发、产品中试、产品发布等整个过程。从管理的角度来看，其范围涵盖产品战略与规划、市场分析与产品规划、产品及研发组织结构设计、研发项目管理、研发质量管理、研发团队管理、研发绩效管理、研发人力资源管理、平台开发与技术预研等领域。\r\n', '100', '0', '0', '1', '0', '0', '1', 'cn', '1551923136', '1551926681');
INSERT INTO `ey_arctype` VALUES ('13', '8', '8', '0', '在线留言', 'zaixianliuyan', '/html/zaixianliuyan', '', '0', '', '', 'lists_guestbook.htm', '', '', '', '', '100', '1', '0', '1', '0', '0', '1', 'cn', '1551924631', '1551924631');
INSERT INTO `ey_arctype` VALUES ('14', '2', '2', '3', '精品房源', 'jingpinfangyuan', '/html/ershoufang/jingpinfangyuan', '', '1', '', '', 'lists_product.htm', 'view_product.htm', '', '', '', '100', '0', '0', '1', '0', '0', '1', 'cn', '1551929734', '1551931975');
INSERT INTO `ey_arctype` VALUES ('15', '2', '2', '3', '最新房源', 'zuixinfangyuan', '/html/ershoufang/zuixinfangyuan', '', '1', '', '', 'lists_product.htm', 'view_product.htm', '', '', '', '100', '0', '0', '1', '0', '0', '1', 'cn', '1551929743', '1551931975');
INSERT INTO `ey_arctype` VALUES ('16', '1', '2', '4', '滨海小区', 'binhaixiaoqu', '/html/xiaoqu/binhaixiaoqu', '', '1', '', '', 'lists_product.htm', 'view_product.htm', '', '', '', '100', '0', '0', '1', '0', '0', '1', 'cn', '1551929838', '1551931963');
INSERT INTO `ey_arctype` VALUES ('17', '1', '2', '4', '滨江小区', 'binjiangxiaoqu', '/html/xiaoqu/binjiangxiaoqu', '', '1', '', '', 'lists_product.htm', 'view_product.htm', '', '', '', '100', '0', '0', '1', '0', '0', '1', 'cn', '1551929853', '1551931963');
INSERT INTO `ey_arctype` VALUES ('18', '2', '2', '5', '精品别墅', 'jingpinbieshu', '/html/bieshu/jingpinbieshu', '', '1', '', '', 'lists_product.htm', 'view_product.htm', '', '', '', '100', '0', '0', '1', '0', '0', '1', 'cn', '1551929884', '1551931953');
INSERT INTO `ey_arctype` VALUES ('19', '6', '6', '7', '联系方式', 'lianxifangshi', '/html/lianxiwomen/lianxifangshi', '', '1', '', '', 'lists_single.htm', '', '', '', '', '100', '0', '0', '1', '0', '0', '1', 'cn', '1551929899', '1551929899');

-- -----------------------------
-- Table structure for `ey_article_content`
-- -----------------------------
DROP TABLE IF EXISTS `ey_article_content`;
CREATE TABLE `ey_article_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `aid` int(10) DEFAULT '0' COMMENT '文档ID',
  `content` longtext COMMENT '内容详情',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `news_id` (`aid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='资讯内容表_存储正常内容';

-- -----------------------------
-- Records of `ey_article_content`
-- -----------------------------
INSERT INTO `ey_article_content` VALUES ('1', '6', '&lt;p&gt;相信好多想要购房的朋友都会碰到购房意向书，那什么是购房意向书呢？购房意向书主要出现在下面这种情况中：当一套抢手房源有很多买家竞争的时候，买卖双方会提出签订购房意向书以表示购房的意愿，也能提前预防房源被其他买家买走的情况出现。购房意向书是一种意向性的协议，不包括房屋具体情况和购房合同细节，有助于买家和买家之间有效沟通并达成彼此的需求。&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;/uploads/ueditor/20190307/5c8089440ee99.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;购房意向书在购房流程中是比较重要的一环，但是有不少朋友不了解怎样写购房意向书，下面小编就来教大家如何写意向书的方法：&lt;/p&gt;&lt;p&gt;1.当买家决定购买卖方（开发商）位于某市某路的一套房子时，可以与卖方签订购房意向书并按意向书中的内容签订正式的预售合同，卖方不得将房屋另行出售给他人。&lt;/p&gt;&lt;p&gt;2.意向书中应包含以下内容：房屋具体建筑面积、房屋单价、房屋暂定总款等，并约定房屋面积以房地产测绘机构测定结果为准，且房屋总价以机构测定结果乘以房屋单价的结果为准实行多退少补原则。&lt;/p&gt;&lt;p&gt;3.意向书签订后买方应在项目开盘销售日起的十五日内携带本意向书、确认金收款凭证、本人身份证至售楼处签订正式的预售合同并支付购房款。&lt;/p&gt;&lt;p&gt;4.若买方逾期未与卖方签订正式预售合同的话视为买方自动放弃该套房源，卖方有权将其重新出售给他人。同时如果在售项目停止建设或买房变更购房意向时意向书失效并退回确认金。&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;/uploads/ueditor/20190307/5c8089441b018.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;以上就是小编整理的签订购房意向书的流程、方法和注意事项，好房不等人希望能帮助到置业的朋友能够买到心仪的房子。&lt;/p&gt;&lt;div&gt;&lt;br/&gt;&lt;/div&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1551927649', '1551927649');
INSERT INTO `ey_article_content` VALUES ('2', '7', '&lt;p&gt;对于许多准备置业的买房新手，买房时往往不知道应该从哪儿看起，那么看这儿就对了。买房必须关注的便是五证问题，一个五证齐全的房子能让你在买房后的服务和前期的购买都具有法律保障，那么房地产开发五证是指什么？为什么要选择五证齐全的房子？下面为您一一详解。&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;/uploads/ueditor/20190307/5c8089762cce0.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;五证是什么及其含义：&lt;/p&gt;&lt;p&gt;1、《国有土地使用证》：这是地块开发建设的基础，具备此证说明开发商交了土地出让金，地买了使用土地是合法的。&lt;/p&gt;&lt;p&gt;2、《建设工程规划许可证》：证明建设工程符合要求。&lt;/p&gt;&lt;p&gt;3、《建筑用地规划许可证》：说明开发商的产品设计规划申请通过并决定将要盖的业态，同时证明用地合法，该建筑不是违建。&lt;/p&gt;&lt;p&gt;4、《建设工程施工许可证》：说明该地可以开工盖房，开发商有了此证才能动工。&lt;/p&gt;&lt;p&gt;5、《商品房销售(预售)许可证》：依照规定达到了工程量后房屋可以进入市场正式销售。&lt;/p&gt;&lt;p&gt;小贴士：需要注意的是，对于新买房的置业者们，在进入售楼处的时候一定看五证是否公示、售楼处所公示出来的五证上面的日期一定要看是否到期、您当前所处的售楼处和商品房的预售证是否匹配。&lt;/p&gt;&lt;p&gt;为什么选择五证齐全房子？&lt;/p&gt;&lt;p&gt;1、签订的合同具有法律效应，五证不全以后出了问题很难处理&lt;/p&gt;&lt;p&gt;2、五证不全的房子开发商可能会“偷梁换柱”，会有一房被多售的风险性&lt;/p&gt;&lt;p&gt;3、五证不全无法顺利办理按揭手续和房屋产权&lt;/p&gt;&lt;p&gt;4、五证不全房子有随时被拆除的可能性&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;/uploads/ueditor/20190307/5c80897639123.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;买房毕竟是一生的事，因此切忌贪便宜等原因选择五证不全的房子，买房看准五证齐全让您买的放心住的安心。希望本篇文章能为您置业提供参考，愿您买到理想心仪的房子。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1551927687', '1551927687');
INSERT INTO `ey_article_content` VALUES ('3', '8', '&lt;p&gt;小产权的房子能购买吗？长期困扰在不明真相的购房者们，价格便宜的房屋一般都会有可大可小的问题，有些特殊的房屋是不能办理房产证书的，小产权房屋就在其中，小产权的房屋价格往往比普通商品房的房价还要低，什么叫小产权房子？购买小产权房子需要承受什么风险？&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;/uploads/ueditor/20190307/7bc045439166362b98ad9d032a05dac9.jpg&quot; title=&quot;7bc045439166362b98ad9d032a05dac9.jpg&quot; alt=&quot;7bc045439166362b98ad9d032a05dac9.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;什么叫小产权房子？&lt;/p&gt;&lt;p&gt;用简单、通俗易懂的话来说，就是国家房管部门颁发的产权证、能进行交易的就叫大产权房子，能买到的普通商品房就是属于大产权房子，包含了三种产权就是40年产权、50年产权、70年产权，而小产权房子国家是不发房产证的，土地使用证、预售证都是没有的。&lt;/p&gt;&lt;p&gt;识别小产权房子有三种性质&lt;/p&gt;&lt;p&gt;1、由村名集体建设在集体用地上建成的房子，在宅基地上成功建设的房子，所属权是该村的所有人，邻村、外村的村名是不可以购买的。&lt;/p&gt;&lt;p&gt;2、各种类型的养老院、农业园的别墅：这类型的房屋一旦起冲突、发生纠纷，购买此地房子的业主是得不到任何的赔偿，因之前购买所签的合同在法律上是无效的。&lt;/p&gt;&lt;p&gt;3、集体企业用地、占用耕地违反建设成的房屋。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;购买小产权房子需要承受什么风险？&lt;/p&gt;&lt;p&gt;1、不能办理房产证&lt;/p&gt;&lt;p&gt;对于在集体用地上建设成功的小产权房子，是只有此村的村民才能购买，除此之外城市居民购买了是无法办理房产证的，只能用相关资料来保障自己的权益，如凭借购房合同之类的证明材料。&lt;/p&gt;&lt;p&gt;2、不能获得房屋所有权&lt;/p&gt;&lt;p&gt;不合法、违规的小产权房子不具有销售资格、房屋建设，并且没有去政府部门做备案登记，会很容易出现房屋烂尾、买卖合同无效、一房两卖等情况出现，使得购房者不能获得房屋所有权以及房屋所有权都难以维护。&lt;/p&gt;&lt;p&gt;3、不能办理过户&lt;/p&gt;&lt;p&gt;因购房者无法获得房产证，将不可以办理过户手续，导致购房者的权益无法得到保障。&lt;/p&gt;&lt;p&gt;4、不能受到法律庇护&lt;/p&gt;&lt;p&gt;因购房者无法获得房产证，不能享有与商品房同等的法律保护地位，也无法行驶处分、转让、收益、继承等权益。&lt;/p&gt;&lt;p&gt;5、不能抵押贷款&lt;/p&gt;&lt;p&gt;小产权的房屋产权证是由乡镇政府或者是村委会颁发，不是由国家房管部门颁发的，所以该房屋没有具备上市的条件。对于购买小产权的业主而言，只是拥有了房屋居住权的权益、而不是拥有房屋的所有权，即不能用来抵押贷款了。&lt;/p&gt;&lt;p&gt;6、拆迁补偿难上加难&lt;/p&gt;&lt;p&gt;如果是补偿性质的拆迁房屋，因为不是房屋的合法人，购房者就很难获得补偿政策，如果小产权房子违反国家政策被强制拆迁了，购房者不能取得房屋又不能索回房款的憋屈心情难以言喻。&lt;/p&gt;&lt;p&gt;7、不能保证房屋质量&lt;/p&gt;&lt;p&gt;因小产权房子在建造时缺乏专业、有力的监管，会导致房屋质量的安全系数，会造成购房者的人身财权、居住造成威胁。&lt;/p&gt;&lt;p&gt;8、许多不确定因素出现&lt;/p&gt;&lt;p&gt;因法律上没有相关政策出台的保护事项，让小产权房子的未来充满危险系数，一旦国际全面清理小产权这类型的房子，购房者不但失了财又失了居住的地方。&lt;/p&gt;&lt;p&gt;以上所说的八大风险系数都很高，在购买房子的时候注意是什么性质的房子，买房需要谨慎毕竟是一辈子居住的地方，希望这篇文章能有助于你避免踩到小产权房子地雷。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1551927743', '1551927743');
INSERT INTO `ey_article_content` VALUES ('4', '9', '&lt;p&gt;购房对于普遍人来说算得上是当今社会的一件大事，所以要购买商品房之前也需要谨小慎微，而为了保障购房者的权益《商品房销售管理办法》第十六条规定了地产开发企业和买受人应当订立书面商品房买卖合同。那么签订商品房买卖合同不能忽略哪些需要注意问题呢？&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;/uploads/ueditor/20190307/5c808bde7a850.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;一．一定合同中要注明或明确与开发商谈定的付款方式，是一次性付款还是按揭付款，最好要注明如果按揭付款时申请不到银行的付款方式的处理办法。&lt;/p&gt;&lt;p&gt;二．一定要明确合同中的所购面积是不是自己看中哪个户型的面积（如分摊的公用面积是多少，实际使用是多少），如果将买房子的面积出现了误差超过不是合同约定范围面积购房者有权退房并向开发商追缴利息损失。&lt;/p&gt;&lt;p&gt;三．一定要在合同里确定各居室、客厅、厕所的面积，房屋在建造时候使用的建筑结构、装修及设备的材料、品牌和型号，确保是不是属于合格产品，如果入住发现不是合同中所明确的材质出现伪劣材质可以追究开发商的责任。&lt;/p&gt;&lt;p&gt;四．一定要让开发商在合同里明确房屋的交付使用日期，必须具体到某年某月某日不能在合同里出现棱模两可的交房时间的表达方式，因为这样如果开发商不按照合同规定的交房日期的话我们可以按照此条款追究其违约责任。&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;/uploads/ueditor/20190307/5c808bde87b4c.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;以上就是小编整理出来的四条签订《商品房买卖合同》需要注意的事项，当然你觉得开发商撰稿的合同内容不够详细或者是不平等条约内容，也可以向开发商进行协调，补充内容公正又是双方权利平等的事项等。因为任何正式合同签订之前都可以修改的，明确和牢记以上内容避免粗心大意或者不了解带来不必要的经济损失或民事纠纷。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1551928305', '1551928305');

-- -----------------------------
-- Table structure for `ey_auth_role`
-- -----------------------------
DROP TABLE IF EXISTS `ey_auth_role`;
CREATE TABLE `ey_auth_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '' COMMENT '角色名',
  `pid` int(10) DEFAULT '0' COMMENT '父角色ID',
  `remark` text COMMENT '备注信息',
  `grade` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '级别',
  `language` text COMMENT '多语言权限',
  `online_update` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '在线升级',
  `only_oneself` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '只看自己发布',
  `cud` varchar(255) DEFAULT '' COMMENT '增改删',
  `permission` text COMMENT '已允许的权限',
  `built_in` tinyint(1) DEFAULT '0' COMMENT '内置用户组，1表示内置',
  `sort_order` int(10) DEFAULT '0' COMMENT '排序号',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态(1=正常，0=屏蔽)',
  `admin_id` int(10) DEFAULT '0' COMMENT '操作管理员ID',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理员角色表';

-- -----------------------------
-- Records of `ey_auth_role`
-- -----------------------------
INSERT INTO `ey_auth_role` VALUES ('1', '优化推广员', '0', '', '0', '', '0', '1', 'a:3:{i:0;s:3:\"add\";i:1;s:4:\"edit\";i:2;s:3:\"del\";}', 'a:2:{s:5:\"rules\";a:8:{i:0;s:1:\"1\";i:1;s:1:\"3\";i:2;s:1:\"4\";i:3;s:1:\"8\";i:4;s:1:\"9\";i:5;s:2:\"10\";i:6;s:2:\"14\";i:7;i:2;}s:7:\"arctype\";a:46:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:2:\"33\";i:7;s:2:\"34\";i:8;s:2:\"35\";i:9;s:1:\"8\";i:10;s:2:\"32\";i:11;s:1:\"9\";i:12;s:2:\"30\";i:13;s:2:\"31\";i:14;s:2:\"11\";i:15;s:2:\"12\";i:16;s:2:\"13\";i:17;s:2:\"23\";i:18;s:2:\"20\";i:19;s:2:\"24\";i:20;s:2:\"25\";i:21;s:2:\"21\";i:22;s:2:\"26\";i:23;s:2:\"22\";i:24;s:2:\"27\";i:25;s:2:\"28\";i:26;s:2:\"29\";i:27;s:1:\"1\";i:28;s:1:\"2\";i:29;s:1:\"3\";i:30;s:1:\"4\";i:31;s:1:\"5\";i:32;s:1:\"6\";i:33;s:1:\"7\";i:34;s:1:\"8\";i:35;s:1:\"9\";i:36;s:2:\"10\";i:37;s:2:\"11\";i:38;s:2:\"12\";i:39;s:2:\"13\";i:40;s:2:\"14\";i:41;s:2:\"15\";i:42;s:2:\"16\";i:43;s:2:\"17\";i:44;s:2:\"18\";i:45;s:2:\"19\";}}', '1', '100', '1', '0', '1541058693', '1541058693');
INSERT INTO `ey_auth_role` VALUES ('2', '内容管理员', '0', '', '0', '', '0', '1', 'a:3:{i:0;s:3:\"add\";i:1;s:4:\"edit\";i:2;s:3:\"del\";}', 'a:2:{s:5:\"rules\";a:4:{i:0;s:1:\"1\";i:1;s:2:\"10\";i:2;s:2:\"14\";i:3;i:2;}s:7:\"arctype\";a:46:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:2:\"33\";i:7;s:2:\"34\";i:8;s:2:\"35\";i:9;s:1:\"8\";i:10;s:2:\"32\";i:11;s:1:\"9\";i:12;s:2:\"30\";i:13;s:2:\"31\";i:14;s:2:\"11\";i:15;s:2:\"12\";i:16;s:2:\"13\";i:17;s:2:\"23\";i:18;s:2:\"20\";i:19;s:2:\"24\";i:20;s:2:\"25\";i:21;s:2:\"21\";i:22;s:2:\"26\";i:23;s:2:\"22\";i:24;s:2:\"27\";i:25;s:2:\"28\";i:26;s:2:\"29\";i:27;s:1:\"1\";i:28;s:1:\"2\";i:29;s:1:\"3\";i:30;s:1:\"4\";i:31;s:1:\"5\";i:32;s:1:\"6\";i:33;s:1:\"7\";i:34;s:1:\"8\";i:35;s:1:\"9\";i:36;s:2:\"10\";i:37;s:2:\"11\";i:38;s:2:\"12\";i:39;s:2:\"13\";i:40;s:2:\"14\";i:41;s:2:\"15\";i:42;s:2:\"16\";i:43;s:2:\"17\";i:44;s:2:\"18\";i:45;s:2:\"19\";}}', '1', '100', '1', '0', '1541059290', '1541059290');

-- -----------------------------
-- Table structure for `ey_channelfield`
-- -----------------------------
DROP TABLE IF EXISTS `ey_channelfield`;
CREATE TABLE `ey_channelfield` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '字段名称',
  `channel_id` int(10) NOT NULL DEFAULT '0' COMMENT '所属文档模型id',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '字段标题',
  `dtype` varchar(32) NOT NULL DEFAULT '' COMMENT '字段类型',
  `define` varchar(128) NOT NULL DEFAULT '' COMMENT '字段定义',
  `maxlength` int(10) NOT NULL DEFAULT '0' COMMENT '最大长度，文本数据必须填写，大于255为text类型',
  `dfvalue` varchar(1000) NOT NULL DEFAULT '' COMMENT '默认值',
  `dfvalue_unit` varchar(50) NOT NULL DEFAULT '' COMMENT '数值单位',
  `remark` varchar(256) NOT NULL DEFAULT '' COMMENT '提示说明',
  `ifeditable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否在编辑页显示',
  `ifrequire` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否必填',
  `ifsystem` tinyint(1) NOT NULL DEFAULT '0' COMMENT '字段分类，1=系统(不可修改)，0=自定义',
  `ifmain` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否主表字段',
  `ifcontrol` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态，控制该条数据是否允许被控制，1为不允许控制，0为允许控制',
  `sort_order` int(5) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`channel_id`)
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COMMENT='自定义字段表';

-- -----------------------------
-- Records of `ey_channelfield`
-- -----------------------------
INSERT INTO `ey_channelfield` VALUES ('1', 'add_time', '0', '新增时间', 'datetime', 'int(11)', '250', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533091575', '1533091575');
INSERT INTO `ey_channelfield` VALUES ('2', 'update_time', '0', '更新时间', 'datetime', 'int(11)', '250', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533091601', '1533091601');
INSERT INTO `ey_channelfield` VALUES ('3', 'aid', '0', '文档ID', 'int', 'int(11)', '250', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533091624', '1533091624');
INSERT INTO `ey_channelfield` VALUES ('4', 'typeid', '0', '当前栏目ID', 'int', 'int(11)', '250', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533091930', '1533091930');
INSERT INTO `ey_channelfield` VALUES ('5', 'channel', '0', '模型ID', 'int', 'int(11)', '250', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533092214', '1533092214');
INSERT INTO `ey_channelfield` VALUES ('6', 'is_b', '0', '是否加粗', 'switch', 'tinyint(1)', '250', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533092246', '1533092246');
INSERT INTO `ey_channelfield` VALUES ('7', 'title', '0', '文档标题', 'text', 'varchar(250)', '250', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533092381', '1533092381');
INSERT INTO `ey_channelfield` VALUES ('8', 'litpic', '0', '封面图片', 'img', 'varchar(250)', '250', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533092398', '1533092398');
INSERT INTO `ey_channelfield` VALUES ('9', 'is_head', '0', '是否头条', 'switch', 'tinyint(1)', '250', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533092420', '1533092420');
INSERT INTO `ey_channelfield` VALUES ('10', 'is_special', '0', '是否特荐', 'switch', 'tinyint(1)', '250', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533092439', '1533092439');
INSERT INTO `ey_channelfield` VALUES ('11', 'is_top', '0', '是否置顶', 'switch', 'tinyint(1)', '250', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533092454', '1533092454');
INSERT INTO `ey_channelfield` VALUES ('12', 'is_recom', '0', '是否推荐', 'switch', 'tinyint(1)', '250', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533092468', '1533092468');
INSERT INTO `ey_channelfield` VALUES ('13', 'is_jump', '0', '是否跳转', 'switch', 'tinyint(1)', '250', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533092484', '1533092484');
INSERT INTO `ey_channelfield` VALUES ('14', 'author', '0', '作者', 'text', 'varchar(250)', '250', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533092498', '1533092498');
INSERT INTO `ey_channelfield` VALUES ('15', 'click', '0', '浏览量', 'int', 'int(11)', '250', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533092512', '1533092512');
INSERT INTO `ey_channelfield` VALUES ('16', 'arcrank', '0', '阅读权限', 'select', 'tinyint(1)', '250', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533092534', '1533092534');
INSERT INTO `ey_channelfield` VALUES ('17', 'jumplinks', '0', '跳转链接', 'text', 'varchar(250)', '250', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533092553', '1533092553');
INSERT INTO `ey_channelfield` VALUES ('18', 'ismake', '0', '是否静态页面', 'switch', 'tinyint(1)', '250', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533092698', '1533092698');
INSERT INTO `ey_channelfield` VALUES ('19', 'seo_title', '0', 'SEO标题', 'text', 'varchar(250)', '250', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533092713', '1533092713');
INSERT INTO `ey_channelfield` VALUES ('20', 'seo_keywords', '0', 'SEO关键词', 'text', 'varchar(250)', '250', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533092725', '1533092725');
INSERT INTO `ey_channelfield` VALUES ('21', 'seo_description', '0', 'SEO描述', 'text', 'varchar(250)', '250', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533092739', '1533092739');
INSERT INTO `ey_channelfield` VALUES ('22', 'status', '0', '状态', 'switch', 'tinyint(1)', '250', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533092753', '1533092753');
INSERT INTO `ey_channelfield` VALUES ('23', 'sort_order', '0', '排序号', 'int', 'int(11)', '250', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533092766', '1533092766');
INSERT INTO `ey_channelfield` VALUES ('24', 'content', '2', '内容', 'htmltext', 'longtext', '250', '', '', '', '1', '0', '1', '0', '0', '100', '1', '1533359739', '1533359739');
INSERT INTO `ey_channelfield` VALUES ('25', 'content', '3', '内容详情', 'htmltext', 'longtext', '250', '', '', '', '1', '0', '1', '0', '0', '100', '1', '1533359588', '1533359588');
INSERT INTO `ey_channelfield` VALUES ('26', 'content', '4', '内容详情', 'htmltext', 'longtext', '250', '', '', '', '1', '0', '1', '0', '0', '100', '1', '1533359752', '1533359752');
INSERT INTO `ey_channelfield` VALUES ('27', 'content', '6', '内容详情', 'htmltext', 'longtext', '250', '', '', '', '1', '0', '1', '0', '0', '100', '1', '1533464715', '1533464715');
INSERT INTO `ey_channelfield` VALUES ('29', 'content', '1', '内容详情', 'htmltext', 'longtext', '250', '', '', '', '1', '0', '1', '0', '0', '100', '1', '1533464713', '1533464713');
INSERT INTO `ey_channelfield` VALUES ('30', 'update_time', '-99', '更新时间', 'datetime', 'int(11)', '11', '0', '', '', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('31', 'add_time', '-99', '新增时间', 'datetime', 'int(11)', '11', '0', '', '', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('32', 'status', '-99', '启用 (1=正常，0=屏蔽)', 'switch', 'tinyint(1)', '1', '1', '', '', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('33', 'is_part', '-99', '栏目属性：0=内容栏目，1=外部链接', 'switch', 'tinyint(1)', '1', '0', '', '', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('34', 'is_hidden', '-99', '是否隐藏栏目：0=显示，1=隐藏', 'switch', 'tinyint(1)', '1', '0', '', '', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('35', 'sort_order', '-99', '排序号', 'int', 'int(10)', '10', '0', '', '', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('36', 'seo_description', '-99', 'seo描述', 'multitext', 'text', '0', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('37', 'seo_keywords', '-99', 'seo关键字', 'text', 'varchar(200)', '200', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('38', 'seo_title', '-99', 'SEO标题', 'text', 'varchar(200)', '200', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('39', 'tempview', '-99', '文档模板文件名', 'text', 'varchar(200)', '200', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('40', 'templist', '-99', '列表模板文件名', 'text', 'varchar(200)', '200', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('41', 'litpic', '-99', '栏目图片', 'img', 'varchar(250)', '250', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('42', 'typelink', '-99', '栏目链接', 'text', 'varchar(200)', '200', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('43', 'grade', '-99', '栏目等级', 'switch', 'tinyint(1)', '1', '0', '', '', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('44', 'englist_name', '-99', '栏目英文名', 'text', 'varchar(200)', '200', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('45', 'dirpath', '-99', '目录存放HTML路径', 'text', 'varchar(200)', '200', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('46', 'dirname', '-99', '目录英文名', 'text', 'varchar(200)', '200', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('47', 'typename', '-99', '栏目名称', 'text', 'varchar(200)', '200', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('48', 'parent_id', '-99', '栏目上级ID', 'int', 'int(10)', '10', '0', '', '', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('49', 'current_channel', '-99', '栏目当前模型ID', 'int', 'int(10)', '10', '0', '', '', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('50', 'channeltype', '-99', '栏目顶级模型ID', 'int', 'int(10)', '10', '0', '', '', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('51', 'id', '-99', '栏目ID', 'int', 'int(10)', '10', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('52', 'del_method', '-99', '伪删除状态，1为主动删除，2为跟随上级栏目被动删除', 'switch', 'tinyint(1)', '1', '0', '', '', '1', '0', '1', '1', '1', '100', '1', '1547890773', '1547890773');
INSERT INTO `ey_channelfield` VALUES ('53', 'is_del', '0', '伪删除，1=是，0=否', 'switch', 'tinyint(1)', '250', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1547890773', '1547890773');
INSERT INTO `ey_channelfield` VALUES ('54', 'del_method', '0', '伪删除状态，1为主动删除，2为跟随上级栏目被动删除', 'switch', 'tinyint(1)', '250', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1547890773', '1547890773');
INSERT INTO `ey_channelfield` VALUES ('55', 'admin_id', '0', '管理员ID', 'int', 'int(10)', '250', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1547890773', '1547890773');
INSERT INTO `ey_channelfield` VALUES ('56', 'lang', '0', '语言标识', 'text', 'varchar(250)', '250', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1547890773', '1547890773');
INSERT INTO `ey_channelfield` VALUES ('57', 'update_time', '2', '更新时间', 'datetime', 'int(11)', '11', '0', '', '', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('58', 'add_time', '2', '新增时间', 'datetime', 'int(11)', '11', '0', '', '', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('59', 'del_method', '2', '伪删除状态，1为主动删除，2为跟随上级栏目被动删除', 'switch', 'tinyint(1)', '1', '0', '', '', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('60', 'is_del', '2', '伪删除，1=是，0=否', 'switch', 'tinyint(1)', '1', '0', '', '', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('61', 'admin_id', '2', '管理员ID', 'int', 'int(10)', '10', '0', '', '', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('62', 'lang', '2', '语言标识', 'text', 'varchar(50)', '50', 'cn', '', '', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('63', 'sort_order', '2', '排序号', 'int', 'int(10)', '10', '0', '', '', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('64', 'status', '2', '状态(0=屏蔽，1=正常)', 'switch', 'tinyint(1)', '1', '1', '', '', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('65', 'seo_description', '2', 'SEO描述', 'multitext', 'text', '0', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('66', 'seo_keywords', '2', 'SEO关键词', 'text', 'varchar(200)', '200', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('67', 'seo_title', '2', 'SEO标题', 'text', 'varchar(200)', '200', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('68', 'ismake', '2', '是否静态页面（0=动态，1=静态）', 'switch', 'tinyint(1)', '1', '0', '', '', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('69', 'jumplinks', '2', '外链跳转', 'text', 'varchar(200)', '200', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('70', 'arcrank', '2', '阅读权限：0=开放浏览，-1=待审核稿件', 'switch', 'tinyint(1)', '1', '0', '', '', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('71', 'click', '2', '浏览量', 'int', 'int(10)', '10', '0', '', '', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('72', 'author', '2', '作者', 'text', 'varchar(200)', '200', '', '', '', '1', '0', '1', '1', '0', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('73', 'is_jump', '2', '跳转链接（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('74', 'is_recom', '2', '推荐（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('75', 'is_top', '2', '置顶（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('76', 'is_special', '2', '特荐（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('77', 'is_head', '2', '头条（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('78', 'litpic', '2', '封面图片', 'img', 'varchar(250)', '250', '', '', '', '1', '0', '1', '1', '0', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('79', 'title', '2', '标题', 'text', 'varchar(200)', '200', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('80', 'is_b', '2', '加粗', 'switch', 'tinyint(1)', '1', '0', '', '', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('81', 'channel', '2', '模型ID', 'int', 'int(10)', '10', '0', '', '', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('82', 'typeid', '2', '当前栏目', 'int', 'int(10)', '10', '0', '', '', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('83', 'aid', '2', 'aid', 'int', 'int(10)', '10', '', '', '', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('84', 'shoujia', '2', '售价', 'text', 'varchar(200)', '200', '', '', '', '1', '0', '0', '0', '0', '100', '1', '1551922844', '1551922844');
INSERT INTO `ey_channelfield` VALUES ('85', 'danjia', '2', '单价', 'text', 'varchar(200)', '200', '', '', '', '1', '0', '0', '0', '0', '100', '1', '1551922884', '1551922884');
INSERT INTO `ey_channelfield` VALUES ('86', 'mianji', '2', '面积', 'text', 'varchar(200)', '200', '', '', '', '1', '0', '0', '0', '0', '100', '1', '1551922896', '1551922896');
INSERT INTO `ey_channelfield` VALUES ('87', 'quyu', '2', '区域', 'text', 'varchar(200)', '200', '', '', '', '1', '0', '0', '0', '0', '100', '1', '1551922909', '1551922909');
INSERT INTO `ey_channelfield` VALUES ('88', 'xiaoqumingcheng', '2', '小区名称', 'text', 'varchar(200)', '200', '', '', '', '1', '0', '0', '0', '0', '100', '1', '1551922943', '1551922943');

-- -----------------------------
-- Table structure for `ey_channelfield_bind`
-- -----------------------------
DROP TABLE IF EXISTS `ey_channelfield_bind`;
CREATE TABLE `ey_channelfield_bind` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `typeid` int(10) DEFAULT '0' COMMENT '栏目ID',
  `field_id` int(10) DEFAULT '0' COMMENT '自定义字段ID',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='栏目与自定义字段绑定表';

-- -----------------------------
-- Records of `ey_channelfield_bind`
-- -----------------------------
INSERT INTO `ey_channelfield_bind` VALUES ('1', '0', '24', '1551922603', '1551922603');
INSERT INTO `ey_channelfield_bind` VALUES ('2', '0', '25', '1551922603', '1551922603');
INSERT INTO `ey_channelfield_bind` VALUES ('3', '0', '26', '1551922603', '1551922603');
INSERT INTO `ey_channelfield_bind` VALUES ('4', '0', '27', '1551922603', '1551922603');
INSERT INTO `ey_channelfield_bind` VALUES ('5', '0', '29', '1551922603', '1551922603');
INSERT INTO `ey_channelfield_bind` VALUES ('6', '0', '84', '1551922844', '1551922844');
INSERT INTO `ey_channelfield_bind` VALUES ('7', '0', '85', '1551922884', '1551922884');
INSERT INTO `ey_channelfield_bind` VALUES ('8', '0', '86', '1551922896', '1551922896');
INSERT INTO `ey_channelfield_bind` VALUES ('9', '0', '87', '1551922909', '1551922909');
INSERT INTO `ey_channelfield_bind` VALUES ('10', '0', '88', '1551922943', '1551922943');

-- -----------------------------
-- Table structure for `ey_channeltype`
-- -----------------------------
DROP TABLE IF EXISTS `ey_channeltype`;
CREATE TABLE `ey_channeltype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nid` varchar(50) NOT NULL DEFAULT '' COMMENT '识别id',
  `title` varchar(30) DEFAULT '' COMMENT '名称',
  `ntitle` varchar(30) DEFAULT '' COMMENT '左侧菜单名称',
  `table` varchar(50) DEFAULT '' COMMENT '表名',
  `ctl_name` varchar(50) DEFAULT '' COMMENT '控制器名称（区分大小写）',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态(1=启用，0=屏蔽)',
  `ifsystem` tinyint(1) DEFAULT '0' COMMENT '字段分类，1=系统(不可修改)，0=自定义',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '伪删除，1=是，0=否',
  `sort_order` smallint(6) DEFAULT '50' COMMENT '排序',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idention` (`nid`) USING BTREE,
  UNIQUE KEY `ctl_name` (`ctl_name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='系统模型表';

-- -----------------------------
-- Records of `ey_channeltype`
-- -----------------------------
INSERT INTO `ey_channeltype` VALUES ('1', 'article', '文章模型', '文章', 'article', 'Article', '1', '1', '0', '1', '0', '1551939825');
INSERT INTO `ey_channeltype` VALUES ('4', 'download', '下载模型', '下载', 'download', 'Download', '0', '1', '0', '4', '0', '1551939825');
INSERT INTO `ey_channeltype` VALUES ('2', 'product', '产品模型', '产品', 'product', 'Product', '1', '1', '0', '2', '0', '1551939825');
INSERT INTO `ey_channeltype` VALUES ('8', 'guestbook', '留言模型', '留言', 'guestbook', 'Guestbook', '1', '1', '0', '8', '1509197711', '1551939825');
INSERT INTO `ey_channeltype` VALUES ('6', 'single', '单页模型', '单页', 'single', 'Single', '1', '1', '0', '6', '1523091961', '1551939825');
INSERT INTO `ey_channeltype` VALUES ('3', 'images', '图集模型', '图集', 'images', 'Images', '0', '1', '0', '3', '1523929121', '1551939825');

-- -----------------------------
-- Table structure for `ey_config`
-- -----------------------------
DROP TABLE IF EXISTS `ey_config`;
CREATE TABLE `ey_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '' COMMENT '配置的key键名',
  `value` text,
  `inc_type` varchar(64) DEFAULT '' COMMENT '配置分组',
  `desc` varchar(50) DEFAULT '' COMMENT '描述',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否已删除，0=否，1=是',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- -----------------------------
-- Records of `ey_config`
-- -----------------------------
INSERT INTO `ey_config` VALUES ('1', 'is_mark', '0', 'water', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('2', 'mark_txt', '易优Cms', 'water', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('3', 'mark_img', '/public/upload/water/2018/05/08/93806077e5a4c4e12ceed30df5cde761.png', 'water', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('4', 'mark_width', '200', 'water', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('5', 'mark_height', '50', 'water', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('6', 'mark_degree', '54', 'water', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('7', 'mark_quality', '56', 'water', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('8', 'mark_sel', '9', 'water', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('9', 'sms_time_out', '120', 'sms', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('10', 'theme_style', '1', 'basic', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('11', 'file_size', '500', 'basic', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('12', 'image_type', 'jpg|gif|png|bmp|jpeg|ico', 'basic', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('13', 'file_type', 'zip|gz|rar|iso|doc|xsl|ppt|wps', 'basic', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('14', 'media_type', 'swf|mpg|mp3|rm|rmvb|wmv|wma|wav|mid|mov|mp4', 'basic', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('15', 'web_keywords', '', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('17', 'sms_platform', '1', 'sms', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('18', 'seo_viewtitle_format', '2', 'seo', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('19', 'smtp_server', 'smtp.qq.com', 'smtp', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('20', 'smtp_port', '465', 'smtp', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('21', 'smtp_user', 'xxxxxxxxx@qq.com', 'smtp', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('22', 'smtp_pwd', 'xxxxxxxxxxx', 'smtp', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('23', 'inc_type', 'smtp', 'smtp', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('24', 'mark_type', 'img', 'water', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('25', 'mark_txt_size', '30', 'water', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('26', 'mark_txt_color', '#000000', 'water', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('27', 'oss_switch', '0', 'oss', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('28', 'web_name', '某某房屋租售公司', 'web', '', 'cn', '0', '1551939913');
INSERT INTO `ey_config` VALUES ('29', 'web_logo', '/uploads/allimg/20190307/83775ab6b42b8d806c4e72be2e0b9300.png', 'web', '', 'cn', '0', '1551921403');
INSERT INTO `ey_config` VALUES ('30', 'web_ico', '/favicon.ico', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('31', 'web_basehost', 'http://127.0.0.58', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('32', 'web_description', '', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('79', 'web_recordnum', '琼ICP备xxxxxxxx号', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('33', 'web_copyright', 'Copyright © 2012-2018 某某房屋租售公司 版权所有', 'web', '', 'cn', '0', '1551939913');
INSERT INTO `ey_config` VALUES ('34', 'web_thirdcode_pc', '', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('35', 'web_thirdcode_wap', '', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('39', 'seo_arcdir', '/html', 'seo', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('40', 'seo_pseudo', '1', 'seo', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('41', 'list_symbol', '&gt;', 'basic', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('42', 'sitemap_auto', '1', 'sitemap', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('43', 'sitemap_not1', '0', 'sitemap', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('44', 'sitemap_not2', '1', 'sitemap', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('45', 'sitemap_xml', '1', 'sitemap', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('46', 'sitemap_txt', '0', 'sitemap', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('47', 'sitemap_zzbaidutoken', '', 'sitemap', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('48', 'seo_expires_in', '7200', 'seo', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('55', 'web_title', '响应式房屋租售置业公司网站模板', 'web', '', 'cn', '0', '1551940044');
INSERT INTO `ey_config` VALUES ('56', 'smtp_test_eamil', 'xxxxxxxx@qq.com', 'smtp', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('57', 'web_authortoken', '', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('62', 'seo_inlet', '1', 'seo', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('63', 'web_cmspath', '', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('64', 'web_sqldatapath', '/data/sqldata', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('65', 'web_cmsurl', '', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('66', 'web_templets_dir', '/template', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('67', 'web_templeturl', '/template', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('68', 'web_templets_pc', '/template/pc', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('69', 'web_templets_m', '/template/mobile', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('70', 'web_eyoucms', 'http://www.eyoucms.com', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('78', '_cmscopyright', '1Dpdc6k7vAMAMCzJJ5tE9omL', 'php', '', 'cn', '0', '1551939808');
INSERT INTO `ey_config` VALUES ('76', 'seo_liststitle_format', '2', 'seo', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('77', 'web_status', '0', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('80', 'web_is_authortoken', '-1', 'web', '', 'cn', '0', '1551939825');
INSERT INTO `ey_config` VALUES ('81', 'web_adminbasefile', '/login.php', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('82', 'seo_rewrite_format', '1', 'seo', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('83', 'web_cmsmode', '2', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('84', 'web_htmlcache_expires_in', '7200', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('85', 'web_show_popup_upgrade', '1', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('86', 'web_weapp_switch', '-1', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('88', 'seo_dynamic_format', '1', 'seo', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('89', 'system_sql_mode', 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION', 'system', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('90', 'system_home_default_lang', 'cn', 'system', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('91', 'system_langnum', '1', 'system', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('92', 'web_attr_1', '/uploads/allimg/20190307/f1961e68ba5c5901301f5a37ccb3ce21.jpg', 'web', '', 'cn', '0', '1551925268');
INSERT INTO `ey_config` VALUES ('93', 'web_attr_2', '1234567890', 'web', '', 'cn', '0', '1551925512');
INSERT INTO `ey_config` VALUES ('94', 'web_attr_3', 'https://weibo.com/', 'web', '', 'cn', '0', '1551925547');
INSERT INTO `ey_config` VALUES ('95', 'web_attr_4', '400-123-4567', 'web', '', 'cn', '0', '1551925729');
INSERT INTO `ey_config` VALUES ('96', 'web_attr_5', '广东省广州市天河区88号', 'web', '', 'cn', '0', '1551926026');
INSERT INTO `ey_config` VALUES ('97', 'web_attr_6', 'admin@youweb.com', 'web', '', 'cn', '0', '1551926048');
INSERT INTO `ey_config` VALUES ('98', 'web_attr_7', '+86-123-4567', 'web', '', 'cn', '0', '1551926069');

-- -----------------------------
-- Table structure for `ey_config_attribute`
-- -----------------------------
DROP TABLE IF EXISTS `ey_config_attribute`;
CREATE TABLE `ey_config_attribute` (
  `attr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '表单id',
  `inc_type` varchar(20) DEFAULT '' COMMENT '变量分组',
  `attr_name` varchar(60) DEFAULT '' COMMENT '变量标题',
  `attr_var_name` varchar(50) DEFAULT '' COMMENT '变量名',
  `attr_input_type` tinyint(1) unsigned DEFAULT '0' COMMENT ' 0=文本框，1=下拉框，2=多行文本框，3=上传图片',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`attr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='自定义变量表';

-- -----------------------------
-- Records of `ey_config_attribute`
-- -----------------------------
INSERT INTO `ey_config_attribute` VALUES ('1', 'web', '二维码', 'web_attr_1', '3', 'cn', '1551925268', '1551925268');
INSERT INTO `ey_config_attribute` VALUES ('2', 'web', 'QQ', 'web_attr_2', '0', 'cn', '1551925512', '1551925512');
INSERT INTO `ey_config_attribute` VALUES ('3', 'web', '微博地址', 'web_attr_3', '0', 'cn', '1551925547', '1551925547');
INSERT INTO `ey_config_attribute` VALUES ('4', 'web', '电话', 'web_attr_4', '0', 'cn', '1551925729', '1551925729');
INSERT INTO `ey_config_attribute` VALUES ('5', 'web', '地址', 'web_attr_5', '0', 'cn', '1551926026', '1551926026');
INSERT INTO `ey_config_attribute` VALUES ('6', 'web', '邮箱', 'web_attr_6', '0', 'cn', '1551926048', '1551926048');
INSERT INTO `ey_config_attribute` VALUES ('7', 'web', '传真', 'web_attr_7', '0', 'cn', '1551926069', '1551926069');

-- -----------------------------
-- Table structure for `ey_download_content`
-- -----------------------------
DROP TABLE IF EXISTS `ey_download_content`;
CREATE TABLE `ey_download_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `aid` int(10) DEFAULT '0' COMMENT '文档ID',
  `content` longtext COMMENT '内容详情',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `news_id` (`aid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资讯内容表_存储正常内容';


-- -----------------------------
-- Table structure for `ey_download_file`
-- -----------------------------
DROP TABLE IF EXISTS `ey_download_file`;
CREATE TABLE `ey_download_file` (
  `file_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `aid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '产品ID',
  `title` varchar(200) DEFAULT '' COMMENT '产品标题',
  `file_url` varchar(255) DEFAULT '' COMMENT '文件存储路径',
  `file_size` varchar(255) DEFAULT '' COMMENT '文件大小',
  `file_ext` varchar(50) DEFAULT '' COMMENT '文件后缀名',
  `file_name` varchar(200) DEFAULT '' COMMENT '文件名',
  `file_mime` varchar(200) DEFAULT '' COMMENT '文件类型',
  `uhash` varchar(200) DEFAULT '' COMMENT '自定义的一种加密方式，用于文件下载权限验证',
  `md5file` varchar(200) DEFAULT '' COMMENT 'md5_file加密，可以检测上传/下载的文件包是否损坏',
  `sort_order` smallint(5) DEFAULT '0' COMMENT '排序',
  `add_time` int(10) unsigned DEFAULT '0' COMMENT '上传时间',
  PRIMARY KEY (`file_id`),
  KEY `arcid` (`aid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='下载附件表';


-- -----------------------------
-- Table structure for `ey_field_type`
-- -----------------------------
DROP TABLE IF EXISTS `ey_field_type`;
CREATE TABLE `ey_field_type` (
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '字段类型',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '中文类型名',
  `ifoption` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要设置选项',
  `sort_order` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='字段类型表';

-- -----------------------------
-- Records of `ey_field_type`
-- -----------------------------
INSERT INTO `ey_field_type` VALUES ('text', '单行文本', '0', '1', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('checkbox', '多选项', '1', '5', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('multitext', '多行文本', '0', '2', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('radio', '单选项', '1', '4', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('switch', '开关', '0', '13', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('select', '下拉框', '1', '6', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('img', '单张图', '0', '10', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('int', '整数类型', '0', '7', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('datetime', '日期和时间', '0', '12', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('htmltext', 'HTML文本', '0', '3', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('imgs', '多张图', '0', '11', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('decimal', '金额类型', '0', '9', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('float', '小数类型', '0', '8', '1532485708', '1532485708');

-- -----------------------------
-- Table structure for `ey_guestbook`
-- -----------------------------
DROP TABLE IF EXISTS `ey_guestbook`;
CREATE TABLE `ey_guestbook` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `typeid` int(11) DEFAULT '0' COMMENT '栏目ID',
  `channel` smallint(5) DEFAULT '0' COMMENT '模型ID',
  `ip` varchar(255) DEFAULT '' COMMENT 'ip地址',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='留言主表';


-- -----------------------------
-- Table structure for `ey_guestbook_attr`
-- -----------------------------
DROP TABLE IF EXISTS `ey_guestbook_attr`;
CREATE TABLE `ey_guestbook_attr` (
  `guest_attr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '留言表单id自增',
  `aid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '留言id',
  `attr_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '表单id',
  `attr_value` text COMMENT '表单值',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`guest_attr_id`),
  KEY `attr_id` (`attr_id`) USING BTREE,
  KEY `guest_id` (`aid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='留言表单属性值';


-- -----------------------------
-- Table structure for `ey_guestbook_attribute`
-- -----------------------------
DROP TABLE IF EXISTS `ey_guestbook_attribute`;
CREATE TABLE `ey_guestbook_attribute` (
  `attr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '表单id',
  `attr_name` varchar(60) DEFAULT '' COMMENT '表单名称',
  `typeid` int(11) unsigned DEFAULT '0' COMMENT '栏目ID',
  `attr_input_type` tinyint(1) unsigned DEFAULT '0' COMMENT ' 0=文本框，1=下拉框，2=多行文本框',
  `attr_values` text COMMENT '可选值列表',
  `sort_order` int(11) unsigned DEFAULT '0' COMMENT '表单排序',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否已删除，0=否，1=是',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`attr_id`),
  KEY `guest_id` (`typeid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='留言表单属性';

-- -----------------------------
-- Records of `ey_guestbook_attribute`
-- -----------------------------
INSERT INTO `ey_guestbook_attribute` VALUES ('1', '姓名', '13', '0', '', '100', 'cn', '0', '1551924640', '1551924640');
INSERT INTO `ey_guestbook_attribute` VALUES ('2', '手机', '13', '0', '', '100', 'cn', '0', '1551924646', '1551924646');
INSERT INTO `ey_guestbook_attribute` VALUES ('3', 'QQ/微信', '13', '0', '', '100', 'cn', '0', '1551924653', '1551924653');
INSERT INTO `ey_guestbook_attribute` VALUES ('4', '邮箱', '13', '0', '', '100', 'cn', '0', '1551924657', '1551924657');
INSERT INTO `ey_guestbook_attribute` VALUES ('5', '留言内容', '13', '2', '', '100', 'cn', '0', '1551924677', '1551924677');

-- -----------------------------
-- Table structure for `ey_hooks`
-- -----------------------------
DROP TABLE IF EXISTS `ey_hooks`;
CREATE TABLE `ey_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text COMMENT '描述',
  `module` varchar(50) DEFAULT '' COMMENT '钩子挂载的插件',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态：0=无效，1=有效',
  `add_time` int(10) DEFAULT NULL,
  `update_time` int(10) unsigned DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件钩子表';


-- -----------------------------
-- Table structure for `ey_images_content`
-- -----------------------------
DROP TABLE IF EXISTS `ey_images_content`;
CREATE TABLE `ey_images_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `aid` int(10) DEFAULT '0' COMMENT '文档ID',
  `content` longtext COMMENT '内容详情',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `news_id` (`aid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资讯内容表_存储正常内容';


-- -----------------------------
-- Table structure for `ey_images_upload`
-- -----------------------------
DROP TABLE IF EXISTS `ey_images_upload`;
CREATE TABLE `ey_images_upload` (
  `img_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `aid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '图集ID',
  `title` varchar(200) DEFAULT '' COMMENT '产品标题',
  `image_url` varchar(255) DEFAULT '' COMMENT '文件存储路径',
  `width` int(11) DEFAULT '0' COMMENT '图片宽度',
  `height` int(11) DEFAULT '0' COMMENT '图片高度',
  `filesize` mediumint(8) unsigned DEFAULT '0' COMMENT '文件大小',
  `mime` varchar(50) DEFAULT '' COMMENT '图片类型',
  `sort_order` smallint(5) DEFAULT '0' COMMENT '排序',
  `add_time` int(10) unsigned DEFAULT '0' COMMENT '上传时间',
  PRIMARY KEY (`img_id`),
  KEY `arcid` (`aid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='图集图片表';


-- -----------------------------
-- Table structure for `ey_language`
-- -----------------------------
DROP TABLE IF EXISTS `ey_language`;
CREATE TABLE `ey_language` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '信息ID，自增',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '语言名称',
  `mark` varchar(50) NOT NULL DEFAULT '' COMMENT '语言标识（唯一）',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '单独域名(外部链接)',
  `target` tinyint(1) NOT NULL DEFAULT '0' COMMENT '新窗口打开，0=否，1=是',
  `is_home_default` tinyint(1) DEFAULT '0' COMMENT '默认前台语言，1=是，0=否',
  `is_admin_default` tinyint(1) DEFAULT '0' COMMENT '默认后台语言，1=是，0=否',
  `syn_pack_id` int(10) DEFAULT '0' COMMENT '最后一次同步官方语言包ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '语言状态，0=关闭，1=开启',
  `sort_order` int(10) DEFAULT '0' COMMENT '排序号',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='多语言主表';

-- -----------------------------
-- Records of `ey_language`
-- -----------------------------
INSERT INTO `ey_language` VALUES ('1', '简体中文', 'cn', '', '0', '1', '1', '24', '1', '100', '1541583096', '1543890743');

-- -----------------------------
-- Table structure for `ey_language_attr`
-- -----------------------------
DROP TABLE IF EXISTS `ey_language_attr`;
CREATE TABLE `ey_language_attr` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '信息ID，自增',
  `attr_name` varchar(200) NOT NULL DEFAULT '' COMMENT '来自ey_weapp_language_attr表的attr_name',
  `attr_value` text NOT NULL COMMENT '变量值',
  `attr_group` varchar(50) DEFAULT '' COMMENT '分组，以表名划分（不含表前缀）',
  `lang` varchar(50) NOT NULL DEFAULT '' COMMENT '所属语言',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `attr_value` (`attr_name`,`lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='多语言模板变量关联绑定表';


-- -----------------------------
-- Table structure for `ey_language_attribute`
-- -----------------------------
DROP TABLE IF EXISTS `ey_language_attribute`;
CREATE TABLE `ey_language_attribute` (
  `attr_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '信息ID，自增',
  `attr_title` varchar(200) NOT NULL DEFAULT '' COMMENT '变量标题',
  `attr_name` varchar(200) NOT NULL DEFAULT '' COMMENT '变量名称',
  `attr_group` varchar(50) DEFAULT '' COMMENT '分组，以表名划分（不含表前缀）',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '伪删除，0=否，1=是',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`attr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='多语言模板变量表';


-- -----------------------------
-- Table structure for `ey_language_mark`
-- -----------------------------
DROP TABLE IF EXISTS `ey_language_mark`;
CREATE TABLE `ey_language_mark` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '国家语言名称',
  `cn_title` varchar(50) NOT NULL DEFAULT '' COMMENT '中文名称',
  `mark` varchar(50) DEFAULT '' COMMENT '多语言标识',
  `pinyin` varchar(100) DEFAULT '' COMMENT '拼音',
  `sort_order` int(10) NOT NULL DEFAULT '0' COMMENT '排序号',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='国家语言表';

-- -----------------------------
-- Records of `ey_language_mark`
-- -----------------------------
INSERT INTO `ey_language_mark` VALUES ('1', '简体中文', '简体中文', 'cn', 'zhongwenjianti', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('2', 'Vietnamese', '越南语', 'vi', 'yuenanyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('3', '繁体中文', '繁体中文', 'zh', 'zhongwenfanti', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('4', 'English', '英语', 'en', 'yingyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('5', 'Indonesian', '印尼语', 'id', 'yinniyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('6', 'Urdu', '乌尔都语', 'ur', 'wuerduyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('7', 'Yiddish', '意第绪语', 'yi', 'yidixuyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('8', 'Italian', '意大利语', 'it', 'yidaliyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('9', 'Greek', '希腊语', 'el', 'xilayu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('10', 'Spanish Basque', '西班牙的巴斯克语', 'eu', 'xibanyadebasikeyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('11', 'Spanish', '西班牙语', 'es', 'xibanyayu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('12', 'Hungarian', '匈牙利语', 'hu', 'xiongyaliyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('13', 'Hebrew', '希伯来语', 'iw', 'xibolaiyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('14', 'Ukrainian', '乌克兰语', 'uk', 'wukelanyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('15', 'Welsh', '威尔士语', 'cy', 'weiershiyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('16', 'Thai', '泰语', 'th', 'taiyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('17', 'Turkish', '土耳其语', 'tr', 'tuerqiyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('18', 'Swahili', '斯瓦希里语', 'sw', 'siwaxiliyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('19', 'Japanese', '日语', 'ja', 'riyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('20', 'Swedish', '瑞典语', 'sv', 'ruidianyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('21', 'Serbian', '塞尔维亚语', 'sr', 'saierweiyayu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('22', 'Slovak', '斯洛伐克语', 'sk', 'siluofakeyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('23', 'Slovenian', '斯洛文尼亚语', 'sl', 'siluowenniyayu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('24', 'Portuguese', '葡萄牙语', 'pt', 'putaoyayu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('25', 'Norwegian', '挪威语', 'no', 'nuoweiyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('26', 'Macedonian', '马其顿语', 'mk', 'maqidunyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('27', 'Malay', '马来语', 'ms', 'malaiyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('28', 'Maltese', '马耳他语', 'mt', 'maertayu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('29', 'Romanian', '罗马尼亚语', 'ro', 'luomaniyayu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('30', 'Lithuanian', '立陶宛语', 'lt', 'litaowanyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('31', 'Latvian', '拉脱维亚语', 'lv', 'latuoweiyayu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('32', 'Latin', '拉丁语', 'la', 'ladingyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('33', 'Croatian', '克罗地亚语', 'hr', 'keluodiyayu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('34', 'Czech', '捷克语', 'cs', 'jiekeyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('35', 'Catalan', '加泰罗尼亚语', 'ca', 'jiatailuoniyayu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('36', 'Galician', '加利西亚语', 'gl', 'jialixiyayu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('37', 'Dutch', '荷兰语', 'nl', 'helanyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('38', 'Korean', '韩语', 'ko', 'hanyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('39', 'Haitian Creole', '海地克里奥尔语', 'ht', 'haidikeliaoeryu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('40', 'Finnish', '芬兰语', 'fi', 'fenlanyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('41', 'Filipino', '菲律宾语', 'tl', 'feilvbinyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('42', 'Russian', '俄语', 'ru', 'eyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('43', 'Boolean (Afrikaans)', '布尔语(南非荷兰语)', 'af', 'bueryunanfeihelanyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('44', 'French', '法语', 'fr', 'fayu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('45', 'Danish', '丹麦语', 'da', 'danmaiyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('46', 'German', '德语', 'de', 'deyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('47', 'Azerbaijani', '阿塞拜疆语', 'az', 'asaibaijiangyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('48', 'Irish', '爱尔兰语', 'ga', 'aierlanyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('49', 'Estonian', '爱沙尼亚语', 'et', 'aishaniyayu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('50', 'Belarusian', '白俄罗斯语', 'be', 'baieluosiyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('51', 'Bulgarian', '保加利亚语', 'bg', 'baojialiyayu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('52', 'Icelandic', '冰岛语', 'is', 'bingdaoyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('53', 'Polish', '波兰语', 'pl', 'bolanyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('54', 'Persian', '波斯语', 'fa', 'bosiyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('55', 'Arabic', '阿拉伯语', 'ar', 'alaboyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('56', 'Albanian', '阿尔巴尼亚语', 'sq', 'aerbaniyayu', '100', '0', '1541583096');

-- -----------------------------
-- Table structure for `ey_language_pack`
-- -----------------------------
DROP TABLE IF EXISTS `ey_language_pack`;
CREATE TABLE `ey_language_pack` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '变量名',
  `value` text NOT NULL COMMENT '变量值',
  `is_syn` tinyint(1) DEFAULT '0' COMMENT '同步官方语言包：0=否，1=是',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `sort_order` int(10) DEFAULT '0' COMMENT '排序号',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='模板语言包变量';

-- -----------------------------
-- Records of `ey_language_pack`
-- -----------------------------
INSERT INTO `ey_language_pack` VALUES ('1', 'sys1', '首页', '1', 'cn', '100', '1543890216', '1543890216');
INSERT INTO `ey_language_pack` VALUES ('2', 'sys2', '上一页', '1', 'cn', '100', '1543890216', '1543890216');
INSERT INTO `ey_language_pack` VALUES ('3', 'sys3', '下一页', '1', 'cn', '100', '1543890216', '1543890216');
INSERT INTO `ey_language_pack` VALUES ('4', 'sys4', '末页', '1', 'cn', '100', '1543890216', '1543890216');
INSERT INTO `ey_language_pack` VALUES ('5', 'sys5', '共<strong>%s</strong>页 <strong>%s</strong>条', '1', 'cn', '100', '1543890216', '1543890216');
INSERT INTO `ey_language_pack` VALUES ('6', 'sys6', '全部', '1', 'cn', '100', '1543890216', '1543890216');
INSERT INTO `ey_language_pack` VALUES ('7', 'sys7', '搜索', '1', 'cn', '100', '1543890216', '1543890216');
INSERT INTO `ey_language_pack` VALUES ('8', 'sys8', '查看详情', '1', 'cn', '100', '1543890216', '1543890216');
INSERT INTO `ey_language_pack` VALUES ('9', 'sys9', '网站首页', '1', 'cn', '100', '1543890216', '1543890216');
INSERT INTO `ey_language_pack` VALUES ('10', 'sys10', '暂无', '1', 'cn', '100', '1543890216', '1543890216');
INSERT INTO `ey_language_pack` VALUES ('11', 'sys11', '上一篇', '1', 'cn', '100', '1543890216', '1543890216');
INSERT INTO `ey_language_pack` VALUES ('12', 'sys12', '下一篇', '1', 'cn', '100', '1543890216', '1543890216');

-- -----------------------------
-- Table structure for `ey_links`
-- -----------------------------
DROP TABLE IF EXISTS `ey_links`;
CREATE TABLE `ey_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeid` tinyint(1) DEFAULT '1' COMMENT '类型：1=文字链接，2=图片链接',
  `title` varchar(50) DEFAULT '' COMMENT '网站标题',
  `url` varchar(100) DEFAULT '' COMMENT '网站地址',
  `logo` varchar(255) DEFAULT '' COMMENT '网站LOGO',
  `sort_order` int(11) DEFAULT '0' COMMENT '排序号',
  `target` tinyint(1) DEFAULT '0' COMMENT '是否开启浏览器新窗口',
  `email` varchar(50) DEFAULT NULL,
  `intro` text COMMENT '网站简况',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态(1=显示，0=屏蔽)',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `delete_time` int(11) DEFAULT '0' COMMENT '软删除时间',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- -----------------------------
-- Records of `ey_links`
-- -----------------------------
INSERT INTO `ey_links` VALUES ('1', '1', '百度', 'http://www.baidu.com', '', '100', '1', '', '', '1', 'cn', '0', '1524975826', '1537585074');
INSERT INTO `ey_links` VALUES ('2', '1', '腾讯', 'http://www.qq.com', '', '100', '1', '', '', '1', 'cn', '0', '1524976095', '1537585061');
INSERT INTO `ey_links` VALUES ('3', '1', '新浪', 'http://www.sina.com.cn', '', '100', '1', '', '', '1', 'cn', '0', '1532414285', '1537585047');
INSERT INTO `ey_links` VALUES ('4', '1', '淘宝', 'http://www.taobao.com', '', '100', '1', '', '', '1', 'cn', '0', '1532414529', '1537585013');
INSERT INTO `ey_links` VALUES ('5', '1', '微博', 'http://www.weibo.com', '', '100', '1', '', '', '1', 'cn', '0', '1532414726', '1537585146');

-- -----------------------------
-- Table structure for `ey_product_attr`
-- -----------------------------
DROP TABLE IF EXISTS `ey_product_attr`;
CREATE TABLE `ey_product_attr` (
  `product_attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '产品属性id自增',
  `aid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `attr_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '属性id',
  `attr_value` text COMMENT '属性值',
  `attr_price` varchar(255) DEFAULT '' COMMENT '属性价格',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`product_attr_id`),
  KEY `aid` (`aid`) USING BTREE,
  KEY `attr_id` (`attr_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品表单属性值';


-- -----------------------------
-- Table structure for `ey_product_attribute`
-- -----------------------------
DROP TABLE IF EXISTS `ey_product_attribute`;
CREATE TABLE `ey_product_attribute` (
  `attr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性id',
  `attr_name` varchar(60) DEFAULT '' COMMENT '属性名称',
  `typeid` int(11) unsigned DEFAULT '0' COMMENT '栏目id',
  `attr_index` tinyint(1) unsigned DEFAULT '0' COMMENT '0不需要检索 1关键字检索 2范围检索',
  `attr_input_type` tinyint(1) unsigned DEFAULT '0' COMMENT ' 0=文本框，1=下拉框，2=多行文本框',
  `attr_values` text COMMENT '可选值列表',
  `sort_order` int(11) unsigned DEFAULT '0' COMMENT '属性排序',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否已删除，0=否，1=是',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`attr_id`),
  KEY `cat_id` (`typeid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='产品表单属性表';

-- -----------------------------
-- Records of `ey_product_attribute`
-- -----------------------------
INSERT INTO `ey_product_attribute` VALUES ('1', '1212', '3', '0', '0', '', '100', 'cn', '1', '1551922671', '1551922769');

-- -----------------------------
-- Table structure for `ey_product_content`
-- -----------------------------
DROP TABLE IF EXISTS `ey_product_content`;
CREATE TABLE `ey_product_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `aid` int(10) DEFAULT '0' COMMENT '文档ID',
  `content` longtext COMMENT '内容详情',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  `shoujia` varchar(200) NOT NULL DEFAULT '' COMMENT '售价',
  `danjia` varchar(200) NOT NULL DEFAULT '' COMMENT '单价',
  `mianji` varchar(200) NOT NULL DEFAULT '' COMMENT '面积',
  `quyu` varchar(200) NOT NULL DEFAULT '' COMMENT '区域',
  `xiaoqumingcheng` varchar(200) NOT NULL DEFAULT '' COMMENT '小区名称',
  PRIMARY KEY (`id`),
  KEY `news_id` (`aid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='资讯内容表_存储正常内容';

-- -----------------------------
-- Records of `ey_product_content`
-- -----------------------------
INSERT INTO `ey_product_content` VALUES ('1', '11', '&lt;p&gt;&lt;span style=&quot;overflow: hidden; text-overflow: ellipsis; display: inline-block; width: 1100px; color: rgb(51, 51, 51); vertical-align: top; background-color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px !important;&quot;&gt;&lt;p&gt;恒大御海天下地处海南马袅湾滨海国际旅游区内，项目占地约1665亩，建筑面积约122万，1.37容积率，绿地率46%；项目纵享湾区中央小岛（规划有海岛欢乐世界）、红树林生态湿地、滨海防风森林等三大生态资源，项目内规划有约2833（建筑面积）儿童奇幻王国、约1890（建筑面积）精英幼儿园、约1.07万（建筑面积）风情商业街、约4616（建筑面积）滨海娱乐会所四大缤纷配套，是集旅游观光、娱乐运动、生态休闲于一体的度假大盘。&lt;/p&gt;&lt;p&gt;项目首推产品定位为享受型度假产品：【瞰海高层】建筑面积约51-154（带装修），方正格局，带入户花园、景观阳台，拥河景海景双重享受。【半岛别墅（低层住宅）】建筑面积约42（带装修），一层可享两层，带前庭后院私家亲水花园。项目拥有约12万平米臻美威尼斯式水系，园林内曲径通幽，围绕中心景观种植有造型百余种热带植被。&lt;/p&gt;&lt;/span&gt;&lt;/p&gt;', '1551930369', '1551930369', '800', '12000元/㎡', '(59-90平) 一房至三房', '海口', '恒大御海天下');
INSERT INTO `ey_product_content` VALUES ('2', '12', '&lt;p&gt;&lt;span style=&quot;overflow: hidden; text-overflow: ellipsis; display: inline-block; width: 1100px; color: rgb(51, 51, 51); vertical-align: top; background-color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px !important;&quot;&gt;&lt;p&gt;绿城·桃李春风位于海口市琼山区云龙产业园，项目总占地1100亩，共1278户，是海口千亩千栋纯独栋别墅社区。项目周边交通体系发达，同时具备机场、绕城高速、东线高速、环岛轻轨，城市主干道等立体交通网络，将项目与海南紧密联系在一起。&lt;/p&gt;&lt;p&gt;项目距国兴大道省政府车程约30公里，项目为业主提供汽车租赁、金融购车等服务，有从市区直达项目的免费班车，每天定点定区域在市区内接送客户 。&lt;/p&gt;&lt;p&gt;绿城·桃李春风周边配套完善，设有美兰高尔夫、台达高尔夫、观澜湖高尔夫等近10座球场。&lt;/p&gt;&lt;p&gt;更有鸿洲马会、鸿洲游艇会、奥特莱斯世界名品折扣店、美兰机场离岛免税店等休闲中心，交通和生活配套成熟&amp;nbsp;。&lt;/p&gt;&lt;p&gt;绿城·桃李春风作为海口规模庞大的度假式近郊别墅大盘,由1278户175㎡-359㎡的纯别墅组成，整个社区规划为一处休闲度假小镇。建筑设计风格在保证实用舒适的基础上，力求体现出基于海南本土风格之上简洁雅致的特质。&lt;/p&gt;&lt;p&gt;绿城·桃李春风社区布局以湖、湾水系为景观核心，打造了300亩自然集中式园林。&lt;/p&gt;&lt;p&gt;户户别墅面湖而居，一湖、一湾景观中心发散出5个主要水系，形似人们的手指，将一缕缕活水有序地分布到20个精致的组团里。&lt;/p&gt;&lt;p&gt;在园林设计上，充分考虑别墅客户的生活习惯，缩小各户别墅自有庭院，避免院落无人打理及长期的空置，旨在扩大社区公共院落和园林绿地，为业主提供一个更大更舒适的公共活动区域。&lt;/p&gt;&lt;p&gt;项目考虑到入住业主的便利性及可食用产品的安全性，专门在社区内规划了绿色农场蔬果基地，为业主提供无公害新鲜的瓜果蔬菜。&lt;/p&gt;&lt;/span&gt;&lt;/p&gt;', '1551930551', '1551930551', '1000', '13000元/㎡', '(90-190平) 一房至三房', '海口', '绿城桃李春风别墅');
INSERT INTO `ey_product_content` VALUES ('3', '13', '&lt;p&gt;南国威尼斯城项目位于海南国际旅游岛的省会海口市美兰机场附近。项目用地南临南渡江支流三十六曲溪，西侧与省级云定公路贴邻，南北侧均为种植林地，整个地块南北跨度约990m,东西长约1200m，地块规整。&lt;/p&gt;&lt;p&gt;南国威尼斯城项目用地约1347亩，总建筑面积约82万平方米。项目产品种类丰富，是由公寓、独院别墅（含带商铺）、巴黎公馆、南加别墅、花园洋房等巴洛克风格建筑组合而成的恢宏欧陆城邦。&lt;/p&gt;&lt;p&gt;该项目养生配套设施齐全，商业风情街满足生活所需，植被葱郁、湖光山色、环境优美、景色怡人、美不胜收，是旅游度假产品中的得力之作。&amp;nbsp;南国威尼斯城作为海口规模大的楼盘，拥有78万平方米恢宏城邦，产品物业类型齐全，包括从小户型公寓、花园洋房、叠加别墅、联排别墅、双拼别墅、独立别墅、风情商业街的全系列产品。&lt;/p&gt;&lt;p&gt;南国威尼斯城适用合理的户型设计，一房一厅50多平米，两房一厅60-70平米，两房两厅85平米左右，三房两厅两卫105平米，花园洋房140--150平米，联排别墅180平米，双拼别墅200平米，独栋别墅250--350平米。&lt;/p&gt;&lt;p&gt;所有户型均紧凑合理，项目总户数为8000户，其中二期户数为440户. 南国威尼斯城便捷顺畅的交通。&lt;/p&gt;&lt;p&gt;离市中心28公里，是人居与城市的距离，离尘不离城。距美兰国际机场12公里、距离东线高铁机场站11公里，加上小区多部直达轻轨站、国贸、南方广场和明珠广场的穿梭巴士，构成立体完备的交通系统。南国威尼斯城小区内完善的配套。&lt;/p&gt;&lt;p&gt;小区内有两条风情商业街：餐饮、超市、邮局、银行、诊所、美容美发、咖啡厅等施；&amp;nbsp;三大主题会所：商务会所内有商务中心、酒吧、阅览室、书画室、会议中心、中西餐厅、歌舞厅等；&amp;nbsp;健身会所有健身房、羽毛球馆、乒乓球馆、网球场、高尔夫用品展示中心、游泳池等；健康会所有体检中心、中医理疗中心、水疗SPA、足浴、按摩等； 四大主题公园：老人活动中心、儿童游乐天地、演艺广场和滨江长廊公园；20个泊位的滨江游艇码头、垂钓中心、星级酒店等。&lt;/p&gt;&lt;p&gt;南国威尼斯城打造原生态诗意居所。外江内湖、外临碧波荡漾的南渡江36曲溪、内有烟波淼淼的12000平米人工湖；小区规划设计热带雨林风格的景观，与周边茂密的森林、潺流的溪谷、舒缓的山影构成一幅浑然天成的油画。南国威尼斯城采用原汁原味、典雅自然的欧洲建筑格。&lt;/p&gt;&lt;p&gt;法国城堡式的白领公寓美轮美奂、南加州风格的亲水别墅风华，仿佛置身于风光无限的欧美小镇，必将成为海口城郊一道风景线。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1551930689', '1551930689', '538', '12000元/㎡', '联排别墅（277-307㎡）独栋别墅（424--537㎡）', '海口', '南国威尼斯城别墅');
INSERT INTO `ey_product_content` VALUES ('4', '14', '&lt;p&gt;&lt;span style=&quot;overflow: hidden; text-overflow: ellipsis; display: inline-block; width: 1100px; color: rgb(51, 51, 51); vertical-align: top; background-color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px !important;&quot;&gt;&lt;p&gt;碧桂园中央半岛，是广物地产集团打造的滨海别墅盘。项目总占地约310万平米（4628亩），总建筑面积过100万平米，坐拥数公里城市海岸线。&lt;/p&gt;&lt;p&gt;项目北临琼州海峡，与广东省相隔18海里；西面隔江相望是海甸岛，可共享海甸岛醇熟生活配套；南面是内海湾区，与广物滨海国际隔湾相望；东面则是南渡江出海口的壮丽景观，自然风光好，海南之心是海口可观赏日出日落景观的滨海社区。&lt;/p&gt;&lt;p&gt;项目内规划有1600亩水系，以及江、河、海、湾四景汇聚的风景岸线，由多座风格迥异的桥梁贯穿各个形状各异、大小不同的地块，真正将艺术、生态与滨海居住融合。&lt;/p&gt;&lt;p&gt;项目设计以迈阿密、威尼斯为规划蓝本，以“白色迈阿密”风格结合海南热带风情以及新埠岛的岛屿海景资源，因地布局，汇聚成现代的建筑风格。&lt;/p&gt;&lt;p&gt;项目一共分四期开发，首期开发05/07/10三个地块，产品涵盖独栋，双拼，联排，合院别墅、平层等多种物业类型。&lt;/p&gt;&lt;/span&gt;&lt;/p&gt;', '1551930755', '1551930755', '890', '12000元/㎡', '三居(135㎡ 147㎡)', '海口', '碧桂园中央半岛别墅');
INSERT INTO `ey_product_content` VALUES ('5', '15', '&lt;p&gt;耀江·西岸公馆位项目于享有“高尚居住区”之美称的海口市西海岸，项目用地呈长方形，南北宽241米，东西长586米，总占地面积180亩，总建筑面积约11.59万平方米，项目北临滨海大道，遥望新国宾馆，西邻西海豪园，东北近蔚蓝海岸项目。&lt;/p&gt;&lt;p&gt;距海边300余米，本项目由35栋独立别墅、12栋15-18层纯板式高层住宅及望海空中会所组成.是以高起点.高标准打造的融休闲.度假、居住为一体的滨海度假居住社区。&lt;/p&gt;&lt;p&gt;耀江·西岸公馆项目为东南亚热带融汇简欧建筑风格，建筑立面线条流畅简洁，用材考究，大方细致、端庄典雅，楼宇外立面外墙裙房采用天然石材，主体采用真石漆，外墙以米黄色为主调，局部采用浅棕色，形成端庄典雅的建筑风格,尽显欧陆底蕴的低调奢华，园林景观则对应建筑的简约风格.分组团精雕细琢打造具有浓郁热带风情的大型水景园林，建筑与环境相融，人文与生态相伴。&lt;/p&gt;&lt;p&gt;水系沿景观主轴连通一体，贯穿整个小区.宛若蓝色项链，将独立别墅区与海景公寓区自然分隔。项目绿化率高达50%，容积率仅为0.7，住宅564户，海景公寓的主力户型为81-89㎡两房，107-135㎡三房；独立别墅面积为405-662㎡。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1551930824', '1551930824', '1600', '12000元/㎡', '墅质二居（91.02-101.34㎡）', '海口', '耀江西岸公馆别墅');
INSERT INTO `ey_product_content` VALUES ('6', '16', '&lt;p&gt;富力盈溪谷三期先生的院子，项目位于海口西海岸城市新区，在45万火山岩地貌的肥沃土地上,精心勾勒西班牙的水岸社区，拥享138亩千年那甲古河自然水系、8000原生湖泊、1500风情商业街、2000会所、3大主题公园、3大阳光泳池等丰富配套,逾240种植物近5万棵树遍布全区，是典型低密度、低容积率、高绿化的品质社区。&lt;/p&gt;&lt;p&gt;融合西班牙小镇独有的热情与浪漫，筑就罕见的大花园纯墅庄园，尊享海南美妙风景.220-280㎡独栋双拼别墅，1200生态公园后花园，果树景观，沁心宜人，享大庭院，户户花园，600私家庭院尽享。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1551930906', '1551930906', '880', '12000元/㎡', '五居以上(282㎡- 298㎡)', '海口', '富力盈溪谷');
INSERT INTO `ey_product_content` VALUES ('7', '17', '&lt;p&gt;融创·观澜湖公园壹号为中国地产十强融创在海南省会海口市开发的旅游度假兼自住的综合型项目，项目位于海口市观澜湖旅游度假区内，共享观澜湖成熟配套，项目总占地217亩，总建筑面积33.3万平方米，综合容积率2.3。&lt;/p&gt;&lt;p&gt;项目紧邻观澜湖旅游度假区主入口，延观澜湖2号高尔夫球场顺势排布，纯板式结构，南北通透。楼体坐北朝南，高尔夫果岭、百年荔枝林景观尽收眼底，带来一见倾心的诗意生活。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1551931054', '1551931054', '200', '17300元/㎡', '两居（65平）三居（80-100平）', '海口', '融创观澜湖公园壹号');
INSERT INTO `ey_product_content` VALUES ('8', '18', '&lt;p&gt;景园悦海湾项目是由甘肃商会策划、景园集团倾力打造的房地产项目，位于海南长寿之乡澄迈老城经济开发区。&lt;/p&gt;&lt;p&gt;风景秀丽，碧海、蓝天、沙滩、阳光常年相伴，一年四季微风吹拂，生态环境宜人。&lt;/p&gt;&lt;p&gt;同时尊踞盈滨半岛，粮食作物、水果、蔬菜等含硒量高，是天养生度假的地方。&lt;/p&gt;&lt;p&gt;景园悦海湾项目占地400亩，共建10栋高层住宅外加一栋多功能会所。小区共有2960多户，停车位有2700多个。户型全面，从50多到170多平，从一房到四房均有；项目10层以上少部分楼层可以看到海，120米大楼间距享受视觉效果。&lt;/p&gt;&lt;p&gt;户型南北通透、方方正正、采光好，实用性高，并且提供非毛坯，方便于业主轻松入住的需求.景园悦海湾项目携手景观设计团队，倾力打造一个内湖水景，以此满足人们居住生活中对水的向往和享受，大面积的内湖水景辅以音乐喷泉、泳池、亲水广场、叠水等景观营造，让水景于社区之间自然渗透，彻底浸润人的身心。&lt;/p&gt;&lt;p&gt;小区还将打造浓郁西北特色为主的主题商业街，特别引进了西北特色的餐饮、购物及休闲娱乐配套，让您身处海南也能感受到家乡的味道。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1551931205', '1551931205', '112', '13500元/㎡', '二居(75㎡-81㎡) 三居(113㎡)', '海口', '景园悦海湾');
INSERT INTO `ey_product_content` VALUES ('9', '19', '&lt;p&gt;富力悦海湾位于临高文澜江入海口，紧邻琼州海峡，占据生态富硒地，总规划7800亩，容积率1.6，绿化率40%。富力悦海湾海陆空交通配套一体化，在短程内便可畅行全岛。从项目出发，10公里可到达高铁临高南站，经由环岛西线高速70公里享达海口市区，100公里高速直通美兰国际机场，社区内还将配有业主巴士、观光游览车等出行配套。富力悦海湾全面升级富力红树湾的健康理念及配套，规划以大健康生活体验为主旨的五大健康中心（健康管理中心、爱乐歌剧院、奥林匹克体育中心、悦海生活广场、湾主体验馆），辅以旅游、居住、商业等配套复合发展，是一座国际级全配套的全龄旅居养生目的地。&lt;/p&gt;', '1551931267', '1551931267', '174', '19000元/㎡', '（177平-180平）联排、双拼', '海口', '富力悦海湾');
INSERT INTO `ey_product_content` VALUES ('10', '20', '&lt;p&gt;恒大御海天下地处海南马袅湾滨海国际旅游区内，项目占地约1665亩，建筑面积约122万，1.37容积率，绿地率46%；项目纵享湾区中央小岛（规划有海岛欢乐世界）、红树林生态湿地、滨海防风森林等三大生态资源，项目内规划有约2833（建筑面积）儿童奇幻王国、约1890（建筑面积）精英幼儿园、约1.07万（建筑面积）风情商业街、约4616（建筑面积）滨海娱乐会所四大缤纷配套，是集旅游观光、娱乐运动、生态休闲于一体的度假大盘。&lt;/p&gt;&lt;p&gt;项目首推产品定位为享受型度假产品：【瞰海高层】建筑面积约51-154（带装修），方正格局，带入户花园、景观阳台，拥河景海景双重享受。【半岛别墅（低层住宅）】建筑面积约42（带装修），一层可享两层，带前庭后院私家亲水花园。项目拥有约12万平米臻美威尼斯式水系，园林内曲径通幽，围绕中心景观种植有造型百余种热带植被。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1551931349', '1551931349', '80', '12000元/㎡', '(59-90平) 一房至三房', '海口', '恒大御海天下');
INSERT INTO `ey_product_content` VALUES ('11', '21', '&lt;p&gt;融创·美伦熙语地处“世界长寿之乡”“产业富集地”“海口后花园”之称的澄迈老城。融创以“精品”战略为主，携手海南生态软件园匠心打造，配备国内度假生活配套和一级资质物管服务，把未来社区的美好构想落为现实，打造海南宜居的社区。海口绕城高速、海渝西线、南海大道、滨海大道直通项目。距老城高铁站约5.8公里，距省会海口20公里，距美兰国际机场32公里，57路、59路公交车途经项目，直达海口市区。社区内将规划有业主食堂、咖啡吧、温泉泡池、泳池、业主活动中心、健康跑道等配套，并且配备一级资质物业服务，给您带来度假生活体验。项目一期户型有75㎡两房、80㎡两房和105㎡三房，均以非毛坯交付。板式户型全南向设计，南北通透，通风采光条件好。户户拥有南向景观阳台，南北卧室全部含飘窗，可尽揽湖、河、海景色。融创·美伦熙语的设计，严谨考量每一处细节升级，从实用、舒适、健康、安全等方面为业主打造安心好房。&lt;/p&gt;', '1551931415', '1551931415', '100', '12500元/㎡', '两房（75㎡）三房（105㎡)', '海口', '融创美伦熙语');
INSERT INTO `ey_product_content` VALUES ('12', '22', '&lt;p&gt;星华海岸城项目是由海南星华集团投资有限公司打造的160万平方米滨海项目。&lt;/p&gt;&lt;p&gt;星华.海岸城位于海南省海口市西海岸度假区，北侧22公里海岸线隔路相望，南侧五源河公务员小区，东侧是五源河学校，西侧为海口火车站和动车海口站。&lt;/p&gt;&lt;p&gt;项目离海口市政府新行政中心约1.5公里，离市中心约12公里，离海口火车站约5公里，距海口美兰国际机场约35公里。&lt;/p&gt;&lt;p&gt;星华.海岸城总占地面积约500亩，总建筑面积约200万㎡，一期共1378户，容积率为2.5，绿化率为40％，1183个车位。公寓户型：1+1房（67㎡），2房84-88㎡，3房119-138㎡&lt;/p&gt;&lt;p&gt;星华海岸城二期位于长滨六路4号，与海口五源河学校一路之隔。二期容积率为2.24，绿化率为40％，由10栋21-24层的高层和5栋11层的板式小高层组成，共1072户，1614个车位（地下车位1450个，地上车位164个）。&lt;/p&gt;&lt;p&gt;海南星华集团投资有限公司初创于1992年，本着“与客户共享成功，与员工共求发展，与社会共同进步”的企业宗旨，奉行“诚信、创新、卓越、高效”的企业精神和“科学管理、锐意创新、与时俱进”的发展经营方针，经过二十五年的探索与发展，已成为一家以房地产业和旅游业为**，集房地产、旅游、金融、热带高效农业、高新科技、娱乐等行业为一体的大型现代企业集团。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1551931475', '1551931475', '145', '17300元/㎡', '两房至四房（83-139㎡）', '海口', '星华海岸城');
INSERT INTO `ey_product_content` VALUES ('13', '23', '&lt;p&gt;雅居乐金沙湾，是雅居乐地产地产深耕市场25载，顺应滨海旅居发展潮流，首次登陆海口的匠心巨作。项目位于海口市西海岸金沙湾 ，依托西海岸绝版一线原生海景资源和海口市CBD 千亿配套， 形成“城市与海兼得”的独特区位 。邀请美国AECOME设计公司、广东省建筑研究院联袂担纲规划设计，重金打造国际 ，五星级酒店等 服务配套，全方位满足客户的 ，中短期度假，和长期居住的需求，全新演绎 “都市版第二人生”。&lt;/p&gt;', '1551931586', '1551931586', '171', '13000元/㎡', '（206-270㎡）精装别墅', '海口', '雅居乐金沙湾');
INSERT INTO `ey_product_content` VALUES ('14', '24', '&lt;p&gt;碧桂园剑桥郡，海口城南超越之作，项目位于椰海大道与丘海大道延长线交汇处西南侧，项目为碧桂园2018年在海口重磅打造的大型城市智慧教育住区，是海南一个引入目前国内的SSGF建造技术项目，居住品质将超越目前海南传统社区。项目规划的优质教育。匠心打造17-18层南北纯板式洋房，约101-179㎡三至四房，舒适低密度智能化社区，内部规划五重立体高尔夫园林、成人标准泳池、标准篮球场、羽毛球场、全龄段儿童户外乐园、社区跑道等升级配套。&lt;/p&gt;', '1551931652', '1551931652', '174', '17300元/㎡', '101-171㎡三房至四房', '海口', '碧桂园剑桥郡');
INSERT INTO `ey_product_content` VALUES ('15', '25', '&lt;p&gt;楠滨华庭项目总占地37710.42㎡，总建筑面积135693㎡，有两个地块分两期开发，一期占地13341.34㎡，建筑面积42992.95㎡，容积率：2.5 ，绿化率：37.05%，由一个三层的商场，两栋23层高层公寓组成，有沿街商铺31间，住宅户型分别是86.86㎡ 两房两厅 ，123.86㎡三房两厅，139.82㎡四房两厅。二期占地24369.08㎡，建筑面积92694.98㎡，容积率：3.0，绿化率：35%，由五栋高层公寓组成，沿街商铺83个，住宅户型分别是两房两厅87.89㎡，三房两厅116.77㎡，121.36㎡,123.52㎡,126.34㎡，四房两厅139.85㎡，六房两厅238.79㎡.一期预计2018年12月31前交付使用，二期待定。&lt;/p&gt;', '1551931722', '1551931722', '216', '17500元/㎡', '121平126平', '海口', '楠滨华庭');
INSERT INTO `ey_product_content` VALUES ('16', '26', '&lt;p&gt;中盟·椰海国际打造低建筑密度16%，人车分流，环境安逸，舒适宜居。主推户型板塔结合，全明户型，独具入户花园，方正宽敞大阳台，延景入室，生机盎然，南北通透，静谧一角，风雅静逸。&lt;/p&gt;', '1551931779', '1551931779', '257', '23000元/㎡', '（建面）102-114平', '海口', '中盟椰海国际');
INSERT INTO `ey_product_content` VALUES ('17', '27', '&lt;p&gt;阳光椰风苑位于塔岭新区，是定安鼎泰置业有限公司在定安开发兴建的，以养生度假为主题的大型社区。&lt;/p&gt;&lt;p&gt;阳光椰风苑总占地约86311.55平方米，建筑面积176725平方米，共1784户，是一个集多层、高层、酒店、商业的综合项目。阳光椰风苑分两期开发，一期已经交房使用。二期推出背面临街的一栋17层公寓楼，两梯6户，户型为一房和两房，面积在48到81平米，适合养老、度假及**。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1551931839', '1551931839', '140', '10600元/㎡', '三居（133平）四房（150平）', '海口', '阳光椰风苑');
INSERT INTO `ey_product_content` VALUES ('18', '28', '&lt;p&gt;恩祥·新城位于椰海大道和海榆中线的交汇处，项目分8期开发，一期占地111亩，建面约26万㎡。项目集商业中心、旅游区、创意产业、传统文化及生态资源为一体的商业集群。&lt;/p&gt;&lt;p&gt;恩祥集团将联合北京王府井商业、北京大学附属中学、北京大学附属小学等品牌，打造集健康教育、休闲旅游、休憩商业、宜居生活为一体的项目。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1551931911', '1551931911', '149', '16000元/㎡', '两房至四房（77㎡至117㎡）', '海口', '恩祥新城');

-- -----------------------------
-- Table structure for `ey_product_img`
-- -----------------------------
DROP TABLE IF EXISTS `ey_product_img`;
CREATE TABLE `ey_product_img` (
  `img_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `aid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '产品ID',
  `title` varchar(200) DEFAULT '' COMMENT '产品标题',
  `image_url` varchar(255) DEFAULT '' COMMENT '文件存储路径',
  `width` int(11) DEFAULT '0' COMMENT '图片宽度',
  `height` int(11) DEFAULT '0' COMMENT '图片高度',
  `filesize` varchar(255) DEFAULT '' COMMENT '文件大小',
  `mime` varchar(50) DEFAULT '' COMMENT '图片类型',
  `sort_order` smallint(5) DEFAULT '0' COMMENT '排序',
  `add_time` int(10) unsigned DEFAULT '0' COMMENT '上传时间',
  PRIMARY KEY (`img_id`),
  KEY `arcid` (`aid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COMMENT='产品图片表';

-- -----------------------------
-- Records of `ey_product_img`
-- -----------------------------
INSERT INTO `ey_product_img` VALUES ('1', '11', '恒大御海天下', '/uploads/allimg/20190307/9b619312512425c4cca099500bc7d622.jpg', '700', '430', '0', 'image/jpeg', '1', '1551930369');
INSERT INTO `ey_product_img` VALUES ('2', '11', '恒大御海天下', '/uploads/allimg/20190307/b48587a378c01166f34736cba9c5f50c.jpg', '700', '430', '0', 'image/jpeg', '2', '1551930369');
INSERT INTO `ey_product_img` VALUES ('3', '11', '恒大御海天下', '/uploads/allimg/20190307/b5985ba428e208714913c66514c2042e.jpg', '700', '430', '0', 'image/jpeg', '3', '1551930369');
INSERT INTO `ey_product_img` VALUES ('4', '11', '恒大御海天下', '/uploads/allimg/20190307/5d5734a27ba166915b1df9fe800db227.jpg', '700', '430', '0', 'image/jpeg', '4', '1551930369');
INSERT INTO `ey_product_img` VALUES ('5', '12', '绿城桃李春风别墅', '/uploads/allimg/20190307/e279e0fa1cfcabde04a64fa692aea425.jpg', '700', '430', '0', 'image/jpeg', '1', '1551930551');
INSERT INTO `ey_product_img` VALUES ('6', '12', '绿城桃李春风别墅', '/uploads/allimg/20190307/f63bf5d588ab1c0cba2b52f0d83dbb41.jpg', '700', '430', '0', 'image/jpeg', '2', '1551930551');
INSERT INTO `ey_product_img` VALUES ('7', '12', '绿城桃李春风别墅', '/uploads/allimg/20190307/e17f64145b39a42a4dc01968396b8786.jpg', '700', '430', '0', 'image/jpeg', '3', '1551930551');
INSERT INTO `ey_product_img` VALUES ('8', '12', '绿城桃李春风别墅', '/uploads/allimg/20190307/a325a54eff7266cc96e7045af6ec3dfe.jpg', '700', '430', '0', 'image/jpeg', '4', '1551930551');
INSERT INTO `ey_product_img` VALUES ('16', '13', '南国威尼斯城别墅', '/uploads/allimg/20190307/21e6b232de34661cf0c633a501b2a9ef.jpg', '700', '430', '0', 'image/jpeg', '4', '1551930689');
INSERT INTO `ey_product_img` VALUES ('15', '13', '南国威尼斯城别墅', '/uploads/allimg/20190307/828d54ae8b0ce08d6dbd4e878cd9214c.jpg', '700', '430', '0', 'image/jpeg', '3', '1551930689');
INSERT INTO `ey_product_img` VALUES ('14', '13', '南国威尼斯城别墅', '/uploads/allimg/20190307/75e2a6448206b8983f2a2d352ae8b434.jpg', '700', '430', '0', 'image/jpeg', '2', '1551930689');
INSERT INTO `ey_product_img` VALUES ('13', '13', '南国威尼斯城别墅', '/uploads/allimg/20190307/f32c93ec16aa23fee1ebe881ef2675b8.jpg', '700', '430', '0', 'image/jpeg', '1', '1551930689');
INSERT INTO `ey_product_img` VALUES ('17', '14', '碧桂园中央半岛别墅', '/uploads/allimg/20190307/d95a0071a4eda89925ea781523dd5d75.jpg', '700', '430', '0', 'image/jpeg', '1', '1551930755');
INSERT INTO `ey_product_img` VALUES ('18', '14', '碧桂园中央半岛别墅', '/uploads/allimg/20190307/04ef8081849d913642a3efab6f2292d4.jpg', '700', '430', '0', 'image/jpeg', '2', '1551930755');
INSERT INTO `ey_product_img` VALUES ('19', '14', '碧桂园中央半岛别墅', '/uploads/allimg/20190307/fc7eeecfe64abb6143efc92c6998872b.jpg', '700', '430', '0', 'image/jpeg', '3', '1551930755');
INSERT INTO `ey_product_img` VALUES ('20', '14', '碧桂园中央半岛别墅', '/uploads/allimg/20190307/dbeca713de99e0b4c7042568a779f151.jpg', '700', '430', '0', 'image/jpeg', '4', '1551930755');
INSERT INTO `ey_product_img` VALUES ('28', '15', '耀江西岸公馆别墅', '/uploads/allimg/20190307/1547666f89ddadee42447fe34c9b3bff.jpg', '700', '430', '0', 'image/jpeg', '4', '1551930824');
INSERT INTO `ey_product_img` VALUES ('27', '15', '耀江西岸公馆别墅', '/uploads/allimg/20190307/93575d56f5cc68069d02cfdefb15c5c5.jpg', '700', '430', '0', 'image/jpeg', '3', '1551930824');
INSERT INTO `ey_product_img` VALUES ('26', '15', '耀江西岸公馆别墅', '/uploads/allimg/20190307/2c30d16c7a0005e1b98ac8b39e78c262.jpg', '700', '430', '0', 'image/jpeg', '2', '1551930824');
INSERT INTO `ey_product_img` VALUES ('25', '15', '耀江西岸公馆别墅', '/uploads/allimg/20190307/26e4c9dda1766e1d28a61dd08ada3518.jpg', '700', '430', '0', 'image/jpeg', '1', '1551930824');
INSERT INTO `ey_product_img` VALUES ('29', '16', '富力盈溪谷先生的院子别墅', '/uploads/allimg/20190307/08d1c5a31f54e685c2b1ce2538afe64a.jpg', '700', '430', '0', 'image/jpeg', '1', '1551930906');
INSERT INTO `ey_product_img` VALUES ('30', '16', '富力盈溪谷先生的院子别墅', '/uploads/allimg/20190307/f83ec160c7018cd54308405503fca86c.jpg', '700', '430', '0', 'image/jpeg', '2', '1551930906');
INSERT INTO `ey_product_img` VALUES ('31', '16', '富力盈溪谷先生的院子别墅', '/uploads/allimg/20190307/1f26170a2f466156bb79457d21735a52.jpg', '700', '430', '0', 'image/jpeg', '3', '1551930906');
INSERT INTO `ey_product_img` VALUES ('32', '16', '富力盈溪谷先生的院子别墅', '/uploads/allimg/20190307/46823f388f4d1e1197b071518a07dadf.jpg', '700', '430', '0', 'image/jpeg', '4', '1551930906');
INSERT INTO `ey_product_img` VALUES ('33', '17', '融创观澜湖公园壹号', '/uploads/allimg/20190307/ed156b381578787bc788d3b0c99eba56.jpg', '700', '430', '0', 'image/jpeg', '1', '1551931054');
INSERT INTO `ey_product_img` VALUES ('34', '17', '融创观澜湖公园壹号', '/uploads/allimg/20190307/7da3dd8e5a9c086108ed34405ef98e4c.jpg', '700', '430', '0', 'image/jpeg', '2', '1551931054');
INSERT INTO `ey_product_img` VALUES ('35', '17', '融创观澜湖公园壹号', '/uploads/allimg/20190307/b0bfa125e00ee081a8dd7c2e7cd35d51.jpg', '700', '430', '0', 'image/jpeg', '3', '1551931054');
INSERT INTO `ey_product_img` VALUES ('36', '17', '融创观澜湖公园壹号', '/uploads/allimg/20190307/3473bf197bebdc3fcdf4824baa4cb9d6.jpg', '700', '430', '0', 'image/jpeg', '4', '1551931054');
INSERT INTO `ey_product_img` VALUES ('37', '18', '景园悦海湾 ', '/uploads/allimg/20190307/2cce8faa63fe32b775f8d830e2eb2dc4.jpg', '700', '430', '0', 'image/jpeg', '1', '1551931205');
INSERT INTO `ey_product_img` VALUES ('38', '18', '景园悦海湾 ', '/uploads/allimg/20190307/8ad164a6c2df4542feae2c39bd58039f.jpg', '700', '430', '0', 'image/jpeg', '2', '1551931205');
INSERT INTO `ey_product_img` VALUES ('39', '18', '景园悦海湾 ', '/uploads/allimg/20190307/cb87f607702b241e5a0c32990c769af0.jpg', '700', '430', '0', 'image/jpeg', '3', '1551931205');
INSERT INTO `ey_product_img` VALUES ('40', '18', '景园悦海湾 ', '/uploads/allimg/20190307/503670d22197bdf4bf751e0f60112163.jpg', '700', '430', '0', 'image/jpeg', '4', '1551931205');
INSERT INTO `ey_product_img` VALUES ('41', '19', '富力悦海湾别墅', '/uploads/allimg/20190307/54603ffa98bb220b6b9a76fefb170683.jpg', '700', '430', '0', 'image/jpeg', '1', '1551931267');
INSERT INTO `ey_product_img` VALUES ('42', '19', '富力悦海湾别墅', '/uploads/allimg/20190307/cbef8cbfe233da7b387b3cd64bf0eee1.jpg', '700', '430', '0', 'image/jpeg', '2', '1551931267');
INSERT INTO `ey_product_img` VALUES ('43', '19', '富力悦海湾别墅', '/uploads/allimg/20190307/6152a4feaffb3035623efd31d5586e20.jpg', '700', '430', '0', 'image/jpeg', '3', '1551931267');
INSERT INTO `ey_product_img` VALUES ('44', '19', '富力悦海湾别墅', '/uploads/allimg/20190307/8fc27ee33f53825feccafffa59592aa2.jpg', '700', '430', '0', 'image/jpeg', '4', '1551931267');
INSERT INTO `ey_product_img` VALUES ('45', '20', '恒大御海天下 ', '/uploads/allimg/20190307/ebe14d3d4836fb9c0fe92cc1aa104048.jpg', '700', '430', '0', 'image/jpeg', '1', '1551931349');
INSERT INTO `ey_product_img` VALUES ('46', '20', '恒大御海天下 ', '/uploads/allimg/20190307/8c41e760547e948cf9cde55cb3d07c2d.jpg', '700', '430', '0', 'image/jpeg', '2', '1551931349');
INSERT INTO `ey_product_img` VALUES ('47', '20', '恒大御海天下 ', '/uploads/allimg/20190307/06a044da44396329822bfbb66d453e89.jpg', '700', '430', '0', 'image/jpeg', '3', '1551931349');
INSERT INTO `ey_product_img` VALUES ('48', '20', '恒大御海天下 ', '/uploads/allimg/20190307/c67575fc52067cdfe488051841030e53.jpg', '700', '430', '0', 'image/jpeg', '4', '1551931349');
INSERT INTO `ey_product_img` VALUES ('49', '21', '融创美伦熙语 ', '/uploads/allimg/20190307/6fc5d472eab8ac1440b5245a8f775fd7.jpg', '700', '430', '0', 'image/jpeg', '1', '1551931415');
INSERT INTO `ey_product_img` VALUES ('50', '21', '融创美伦熙语 ', '/uploads/allimg/20190307/cae3ab0d313fbab22bb4fa68f0ac81ef.jpg', '700', '430', '0', 'image/jpeg', '2', '1551931415');
INSERT INTO `ey_product_img` VALUES ('51', '21', '融创美伦熙语 ', '/uploads/allimg/20190307/3f0e0596629be1d38d4a6f23b95a65c3.jpg', '700', '430', '0', 'image/jpeg', '3', '1551931415');
INSERT INTO `ey_product_img` VALUES ('52', '21', '融创美伦熙语 ', '/uploads/allimg/20190307/f81caf8e8f80c92b1ac9686b9a871c50.jpg', '700', '430', '0', 'image/jpeg', '4', '1551931415');
INSERT INTO `ey_product_img` VALUES ('53', '22', '星华海岸城 ', '/uploads/allimg/20190307/0fc139a495099a7ca8d7282d880a7a4f.jpg', '700', '430', '0', 'image/jpeg', '1', '1551931475');
INSERT INTO `ey_product_img` VALUES ('54', '22', '星华海岸城 ', '/uploads/allimg/20190307/ad0935193e0da8001af5484db4b45267.jpg', '700', '430', '0', 'image/jpeg', '2', '1551931475');
INSERT INTO `ey_product_img` VALUES ('55', '22', '星华海岸城 ', '/uploads/allimg/20190307/19c016c4f418d79769a8255c73f72432.jpg', '700', '430', '0', 'image/jpeg', '3', '1551931475');
INSERT INTO `ey_product_img` VALUES ('56', '22', '星华海岸城 ', '/uploads/allimg/20190307/d1bd74f46fec155a2cdae4f524017c69.jpg', '700', '430', '0', 'image/jpeg', '4', '1551931475');
INSERT INTO `ey_product_img` VALUES ('57', '23', '雅居乐金沙湾 ', '/uploads/allimg/20190307/d3358b9d6c9bce8d635ca290e612708e.jpg', '700', '430', '0', 'image/jpeg', '1', '1551931586');
INSERT INTO `ey_product_img` VALUES ('58', '23', '雅居乐金沙湾 ', '/uploads/allimg/20190307/23626bf16445c824566a77c84611b793.jpg', '700', '430', '0', 'image/jpeg', '2', '1551931586');
INSERT INTO `ey_product_img` VALUES ('59', '23', '雅居乐金沙湾 ', '/uploads/allimg/20190307/ec6be341022a7bdf20affff63f06af3c.jpg', '700', '430', '0', 'image/jpeg', '3', '1551931586');
INSERT INTO `ey_product_img` VALUES ('60', '23', '雅居乐金沙湾 ', '/uploads/allimg/20190307/0ce91d276aec1c7b6c7e37c822e0b707.jpg', '700', '430', '0', 'image/jpeg', '4', '1551931586');
INSERT INTO `ey_product_img` VALUES ('61', '24', '碧桂园剑桥郡 ', '/uploads/allimg/20190307/ceb1fa984750d5d6a8c03e600ec1452f.jpg', '700', '430', '0', 'image/jpeg', '1', '1551931652');
INSERT INTO `ey_product_img` VALUES ('62', '24', '碧桂园剑桥郡 ', '/uploads/allimg/20190307/6c16e2d9dfc1a1ae2564f43ee3cb9bdd.jpg', '700', '430', '0', 'image/jpeg', '2', '1551931652');
INSERT INTO `ey_product_img` VALUES ('63', '24', '碧桂园剑桥郡 ', '/uploads/allimg/20190307/d07c34fa905312783cb1b9dca4b76b36.jpg', '700', '430', '0', 'image/jpeg', '3', '1551931652');
INSERT INTO `ey_product_img` VALUES ('64', '24', '碧桂园剑桥郡 ', '/uploads/allimg/20190307/bd97bd1d2dfd703158db00265e31b4fb.jpg', '700', '430', '0', 'image/jpeg', '4', '1551931652');
INSERT INTO `ey_product_img` VALUES ('65', '25', '楠滨华庭', '/uploads/allimg/20190307/6c950ca66c0de49bae7bda5499108471.jpg', '700', '430', '0', 'image/jpeg', '1', '1551931722');
INSERT INTO `ey_product_img` VALUES ('66', '25', '楠滨华庭', '/uploads/allimg/20190307/9f586a74a5b8a5b7373cce0f98872f28.jpg', '700', '430', '0', 'image/jpeg', '2', '1551931722');
INSERT INTO `ey_product_img` VALUES ('67', '25', '楠滨华庭', '/uploads/allimg/20190307/152b19941ce7636dbc000ddf41bb504f.jpg', '700', '430', '0', 'image/jpeg', '3', '1551931722');
INSERT INTO `ey_product_img` VALUES ('68', '25', '楠滨华庭', '/uploads/allimg/20190307/3ad29f95113b7ebe9a8d4484287d83d4.jpg', '700', '430', '0', 'image/jpeg', '4', '1551931722');
INSERT INTO `ey_product_img` VALUES ('69', '26', '中盟椰海国际', '/uploads/allimg/20190307/f3285280d581ca224b09c63018c0870e.jpg', '700', '430', '0', 'image/jpeg', '1', '1551931779');
INSERT INTO `ey_product_img` VALUES ('70', '26', '中盟椰海国际', '/uploads/allimg/20190307/4e9c32d734e29f5f0f7a3744ba82dc05.jpg', '700', '430', '0', 'image/jpeg', '2', '1551931779');
INSERT INTO `ey_product_img` VALUES ('71', '26', '中盟椰海国际', '/uploads/allimg/20190307/461db9b9b715050d44f71b47e887d7ff.jpg', '700', '430', '0', 'image/jpeg', '3', '1551931779');
INSERT INTO `ey_product_img` VALUES ('72', '26', '中盟椰海国际', '/uploads/allimg/20190307/16b9ab37de1548c0bf847ea5afdc0336.jpg', '700', '430', '0', 'image/jpeg', '4', '1551931779');
INSERT INTO `ey_product_img` VALUES ('73', '27', '阳光椰风苑', '/uploads/allimg/20190307/83d3d1fa14e1ffe4a0c58ed38ccb008e.jpg', '700', '430', '0', 'image/jpeg', '1', '1551931839');
INSERT INTO `ey_product_img` VALUES ('74', '27', '阳光椰风苑', '/uploads/allimg/20190307/55d801a2d4f6edc3bf558ab56c843a2f.jpg', '700', '430', '0', 'image/jpeg', '2', '1551931839');
INSERT INTO `ey_product_img` VALUES ('75', '27', '阳光椰风苑', '/uploads/allimg/20190307/84c22f308145ae4d49f9fa22b035c1ca.jpg', '700', '430', '0', 'image/jpeg', '3', '1551931839');
INSERT INTO `ey_product_img` VALUES ('76', '27', '阳光椰风苑', '/uploads/allimg/20190307/c0e19f746d0dbc375892bab65fe874bb.jpg', '700', '430', '0', 'image/jpeg', '4', '1551931839');
INSERT INTO `ey_product_img` VALUES ('77', '28', '恩祥新城 ', '/uploads/allimg/20190307/abb34d4311adeff427b77878cd8a0b1c.jpg', '700', '430', '0', 'image/jpeg', '1', '1551931911');
INSERT INTO `ey_product_img` VALUES ('78', '28', '恩祥新城 ', '/uploads/allimg/20190307/bb29c8ef37810a7fad1afb814d457868.jpg', '700', '430', '0', 'image/jpeg', '2', '1551931911');
INSERT INTO `ey_product_img` VALUES ('79', '28', '恩祥新城 ', '/uploads/allimg/20190307/5ff0338b6ad1aa853e35ef91c996cfa8.jpg', '700', '430', '0', 'image/jpeg', '3', '1551931911');
INSERT INTO `ey_product_img` VALUES ('80', '28', '恩祥新城 ', '/uploads/allimg/20190307/265050b7c1976c38c26578b183372aba.jpg', '700', '430', '0', 'image/jpeg', '4', '1551931911');

-- -----------------------------
-- Table structure for `ey_single_content`
-- -----------------------------
DROP TABLE IF EXISTS `ey_single_content`;
CREATE TABLE `ey_single_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `typeid` int(10) DEFAULT '0' COMMENT '栏目ID',
  `content` longtext COMMENT '内容详情',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `aid` (`aid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ey_single_content`
-- -----------------------------
INSERT INTO `ey_single_content` VALUES ('1', '1', '1', '', '1551926681', '1551926681');
INSERT INTO `ey_single_content` VALUES ('2', '2', '7', '', '1551929680', '1551929680');
INSERT INTO `ey_single_content` VALUES ('3', '3', '8', '&lt;p&gt;某某置业创建于2009年6月，坐落于广东深圳市，主营新房代理销售。专注旅游地产面向全国，借助互联网，成功的将全国旅居地产楼盘信息与购房者进行连接。实现了特有的房地产行业的O20业务模式，并将致力于将线上线下的业务模式做到极致。2018年业务开始面向海南、广西、广东、云南、河南几大省份。未来业务将覆盖全国沿海地区。某某置业是一家专业的旅游地产网络平台。我们坚持以客户需求为核心，面向全国客户提供专业详细的旅游地产市场解读，旅居购房、旅居楼盘咨询等服务。&lt;/p&gt;', '1551923809', '1551923809');
INSERT INTO `ey_single_content` VALUES ('4', '4', '9', '&lt;p&gt;核心价值观：诚信、创新、服务&lt;/p&gt;&lt;p&gt;企业核心： 诚信&amp;nbsp;&lt;/p&gt;&lt;p&gt;企业精神： 团结拼搏、开拓求实、满足用户、科技进步。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;客户：为客户提供高质量和最大价值的专业化产品和服务，以真诚和实力赢得客户的理解、尊重和支持。&lt;/p&gt;&lt;p&gt;市场：为客户降低采购成本和风险，为客户投资提供切实保障。&amp;nbsp;&lt;/p&gt;&lt;p&gt;发展：追求永续发展的目标，并把它建立在客户满意的基础上。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;关于“为合作伙伴创造价值”&lt;/p&gt;&lt;p&gt;公司认为客户、供应商、公司股东、公司员工等一切和自身有合作关系的单位和个人都是自己的合作伙伴，并只有通过努力为合作伙伴创造价值，才能体现自身的价值并获得发展和成功。&lt;/p&gt;&lt;p&gt;关于“诚实、宽容、创新、服务”&lt;/p&gt;&lt;p&gt;公司认为诚信是一切合作的基础，宽容是解决问题的前提，创新是发展事业的利器，服务是创造价值的根本。公司会坚持持续改进、满足顾客期望、 确保品质第一、开拓全球市场。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1551924038', '1551924038');
INSERT INTO `ey_single_content` VALUES ('5', '5', '12', '&lt;p&gt;研发管理就是在研发体系结构设计和各种管理理论基础之上，借助信息平台对研发过程中进行的团队建设、流程设计、绩效管理、风险管理、成本管理、项目管理和知识管理等的一系列协调活动。&lt;br style=&quot;box-sizing: border-box; color: rgb(67, 67, 67); font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;br style=&quot;box-sizing: border-box; color: rgb(67, 67, 67); font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;研发管理，是一个较为宽泛的管理范畴。可以从狭义和广义两个方面来进行理解：&lt;br style=&quot;box-sizing: border-box; color: rgb(67, 67, 67); font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;br style=&quot;box-sizing: border-box; color: rgb(67, 67, 67); font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;狭义的定义：是指对研发或技术部门及其工作进行管理，重点是产品开发及测试过程。&lt;br style=&quot;box-sizing: border-box; color: rgb(67, 67, 67); font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;br style=&quot;box-sizing: border-box; color: rgb(67, 67, 67); font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;广义的定义：研发工作实际上不仅仅包含技术开发工作，其范围涵盖新产品的全生命周期，以从产品创意的产生、产品概念形成、产品市场研究、产品设计、产品实现、产品开发、产品中试、产品发布等整个过程。从管理的角度来看，其范围涵盖产品战略与规划、市场分析与产品规划、产品及研发组织结构设计、研发项目管理、研发质量管理、研发团队管理、研发绩效管理、研发人力资源管理、平台开发与技术预研等领域。&lt;br style=&quot;box-sizing: border-box; color: rgb(67, 67, 67); font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;br style=&quot;box-sizing: border-box; color: rgb(67, 67, 67); font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;基本理念：&lt;br style=&quot;box-sizing: border-box; color: rgb(67, 67, 67); font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;br style=&quot;box-sizing: border-box; color: rgb(67, 67, 67); font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;1、鼓励创新、创建适合研发的企业环境；&lt;br style=&quot;box-sizing: border-box; color: rgb(67, 67, 67); font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;br style=&quot;box-sizing: border-box; color: rgb(67, 67, 67); font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;2、以承诺的、开放平等的企业文化为研发管理的基石；&lt;br style=&quot;box-sizing: border-box; color: rgb(67, 67, 67); font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;br style=&quot;box-sizing: border-box; color: rgb(67, 67, 67); font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;3、以人为本，发挥员工的创造性和主动性；&lt;br style=&quot;box-sizing: border-box; color: rgb(67, 67, 67); font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;br style=&quot;box-sizing: border-box; color: rgb(67, 67, 67); font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;4、将产品开发视为一项投资，以市场为导向，重视产品组合管理与产品管理阶段决策；&lt;br style=&quot;box-sizing: border-box; color: rgb(67, 67, 67); font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;br style=&quot;box-sizing: border-box; color: rgb(67, 67, 67); font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;5、采用基于平台的异步开发模式；&lt;br style=&quot;box-sizing: border-box; color: rgb(67, 67, 67); font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;br style=&quot;box-sizing: border-box; color: rgb(67, 67, 67); font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;6、矩阵式跨部门协同运作；&lt;br style=&quot;box-sizing: border-box; color: rgb(67, 67, 67); font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;br style=&quot;box-sizing: border-box; color: rgb(67, 67, 67); font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;7、结构化的产品开发流程；&lt;br style=&quot;box-sizing: border-box; color: rgb(67, 67, 67); font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;br style=&quot;box-sizing: border-box; color: rgb(67, 67, 67); font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;8、用户需求是驱动研发进步和创新的根源。&lt;/p&gt;', '1551924364', '1551924364');
INSERT INTO `ey_single_content` VALUES ('6', '10', '19', '&lt;p style=&quot;text-align: center;&quot;&gt;电话：400-123-4657&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;手机：138-0000-0000&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;邮箱：admin@youweb.com&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;地址：广东省广州市天河区88号&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;iframe class=&quot;ueditor_baidumap&quot; src=&quot;/public/plugins/Ueditor/dialogs/map/show.html#center=113.372821,23.132086&amp;zoom=14&amp;width=530&amp;height=340&amp;markers=113.373108,23.133681&amp;markerStyles=l,A&quot; frameborder=&quot;0&quot; width=&quot;534&quot; height=&quot;344&quot;&gt;&lt;/iframe&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1551929940', '1551929940');

-- -----------------------------
-- Table structure for `ey_tagindex`
-- -----------------------------
DROP TABLE IF EXISTS `ey_tagindex`;
CREATE TABLE `ey_tagindex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'tagid',
  `tag` varchar(50) NOT NULL DEFAULT '' COMMENT 'tag内容',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `count` int(10) unsigned DEFAULT '0' COMMENT '点击',
  `total` int(10) unsigned DEFAULT '0' COMMENT '文档数',
  `weekcc` int(10) unsigned DEFAULT '0' COMMENT '周统计',
  `monthcc` int(10) unsigned DEFAULT '0' COMMENT '月统计',
  `weekup` int(10) unsigned DEFAULT '0' COMMENT '每周更新',
  `monthup` int(10) unsigned DEFAULT '0' COMMENT '每月更新',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(10) unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `typeid` (`typeid`) USING BTREE,
  KEY `count` (`count`,`total`,`weekcc`,`monthcc`,`weekup`,`monthup`,`add_time`) USING BTREE,
  KEY `tag` (`tag`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标签索引表';


-- -----------------------------
-- Table structure for `ey_taglist`
-- -----------------------------
DROP TABLE IF EXISTS `ey_taglist`;
CREATE TABLE `ey_taglist` (
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'tagid',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `tag` varchar(50) DEFAULT '' COMMENT 'tag内容',
  `arcrank` tinyint(1) DEFAULT '0' COMMENT '阅读权限',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`tid`,`aid`),
  KEY `aid` (`aid`,`typeid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章标签表';


-- -----------------------------
-- Table structure for `ey_ui_config`
-- -----------------------------
DROP TABLE IF EXISTS `ey_ui_config`;
CREATE TABLE `ey_ui_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `md5key` varchar(100) NOT NULL DEFAULT '' COMMENT '唯一键值（由 theme_style、page、name）组成',
  `theme_style` varchar(20) DEFAULT 'pc' COMMENT '模板风格',
  `page` varchar(64) DEFAULT '' COMMENT '页面分组',
  `type` varchar(50) DEFAULT '' COMMENT '编辑类型',
  `name` varchar(50) DEFAULT '' COMMENT '与页面的e-id对应',
  `value` text COMMENT '页面美化的val值',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `md5key` (`md5key`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='可视化参数设置';


-- -----------------------------
-- Table structure for `ey_weapp`
-- -----------------------------
DROP TABLE IF EXISTS `ey_weapp`;
CREATE TABLE `ey_weapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT '' COMMENT '插件标识',
  `name` varchar(55) DEFAULT '' COMMENT '中文名字',
  `config` text COMMENT '配置信息',
  `data` text COMMENT '额外序列化存储数据，简单插件可以不创建表，存储这里即可',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态：0=未安装，1=启用，-1=禁用',
  `tag_weapp` tinyint(1) DEFAULT '1' COMMENT '1=自动绑定，2=手工调用。关联模板标签weapp，自动调用内置的show钩子方法',
  `thorough` tinyint(1) DEFAULT '0' COMMENT '彻底卸载：0=是，1=否',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件应用表';

