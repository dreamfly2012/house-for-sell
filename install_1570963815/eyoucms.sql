-- ----------------------------------------
-- EyouCms MySQL Data Transfer 
-- 
-- Server         : 127.0.0.1_3306
-- Server Version : 5.6.44-log
-- Host           : 127.0.0.1:3306
-- Database       : eyoucms
-- 
-- Part : #1
-- Version : #v1.3.9
-- Date : 2020-05-19 15:26:38
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
  `title` varchar(60) NOT NULL DEFAULT '' COMMENT '广告位置名称',
  `width` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '广告位宽度',
  `height` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '广告位高度',
  `intro` text NOT NULL COMMENT '广告描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0关闭1开启',
  `lang` varchar(50) NOT NULL DEFAULT 'cn' COMMENT '多语言',
  `admin_id` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '伪删除，1=是，0=否',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
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
  `head_pic` varchar(255) DEFAULT '' COMMENT '头像',
  `last_login` int(11) DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` varchar(15) DEFAULT '' COMMENT '最后登录ip',
  `login_cnt` int(11) DEFAULT '0' COMMENT '登录次数',
  `session_id` varchar(50) DEFAULT '' COMMENT 'session_id',
  `parent_id` int(10) DEFAULT '0' COMMENT '父管理员ID',
  `role_id` int(10) NOT NULL DEFAULT '-1' COMMENT '角色组ID（-1表示超级管理员）',
  `mark_lang` varchar(50) DEFAULT 'cn' COMMENT '当前语言标识',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态(0=屏蔽，1=正常)',
  `syn_users_id` int(10) DEFAULT '0' COMMENT '同步注册到会员表',
  `add_time` int(11) DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`admin_id`),
  KEY `user_name` (`user_name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- -----------------------------
-- Records of `ey_admin`
-- -----------------------------
INSERT INTO `ey_admin` VALUES ('1', 'admin', '梦回故里', 'admin', '15044025583', '', 'bb4e36398fa7f4f12ed12c22a3533170', '', '1589873172', '59.109.209.176', '6', '0s7g8rgdbqpll05pbjs16tg3l0', '0', '-1', 'cn', '1', '1', '1570963815', '1570976346');

-- -----------------------------
-- Table structure for `ey_admin_log`
-- -----------------------------
DROP TABLE IF EXISTS `ey_admin_log`;
CREATE TABLE `ey_admin_log` (
  `log_id` bigint(16) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `admin_id` int(10) NOT NULL DEFAULT '-1' COMMENT '管理员id',
  `log_info` text COMMENT '日志描述',
  `log_ip` varchar(30) DEFAULT '' COMMENT 'ip地址',
  `log_url` varchar(255) DEFAULT '' COMMENT 'url',
  `log_time` int(11) DEFAULT '0' COMMENT '日志时间',
  PRIMARY KEY (`log_id`),
  KEY `admin_id` (`admin_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COMMENT='管理员操作日志表';

-- -----------------------------
-- Records of `ey_admin_log`
-- -----------------------------
INSERT INTO `ey_admin_log` VALUES ('102', '1', '后台登录', '59.109.209.176', '/login.php', '1589873172');
INSERT INTO `ey_admin_log` VALUES ('101', '-1', '自动退出', '59.109.209.176', '/login.php', '1589873162');
INSERT INTO `ey_admin_log` VALUES ('100', '1', '安全退出', '59.109.209.176', '/login.php', '1589873159');
INSERT INTO `ey_admin_log` VALUES ('98', '-1', '自动退出', '59.109.209.176', '/login.php', '1589872884');
INSERT INTO `ey_admin_log` VALUES ('99', '1', '后台登录', '59.109.209.176', '/login.php', '1589873131');

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
  `litpic` varchar(250) DEFAULT '' COMMENT '缩略图',
  `is_head` tinyint(1) DEFAULT '0' COMMENT '头条（0=否，1=是）',
  `is_special` tinyint(1) DEFAULT '0' COMMENT '特荐（0=否，1=是）',
  `is_top` tinyint(1) DEFAULT '0' COMMENT '置顶（0=否，1=是）',
  `is_recom` tinyint(1) DEFAULT '0' COMMENT '推荐（0=否，1=是）',
  `is_jump` tinyint(1) DEFAULT '0' COMMENT '跳转链接（0=否，1=是）',
  `is_litpic` tinyint(1) DEFAULT '0' COMMENT '图片（0=否，1=是）',
  `author` varchar(200) DEFAULT '' COMMENT '作者',
  `click` int(10) DEFAULT '0' COMMENT '浏览量',
  `arcrank` int(10) DEFAULT '0' COMMENT '阅读权限：0=开放浏览，-1=待审核稿件',
  `jumplinks` varchar(200) DEFAULT '' COMMENT '外链跳转',
  `ismake` tinyint(1) DEFAULT '0' COMMENT '是否静态页面（0=动态，1=静态）',
  `seo_title` varchar(200) DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` varchar(200) DEFAULT '' COMMENT 'SEO关键词',
  `seo_description` text COMMENT 'SEO描述',
  `users_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '会员价',
  `old_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '产品旧价',
  `stock_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品库存量',
  `stock_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '商品库存在产品详情页是否显示，1为显示，0为不显示',
  `prom_type` tinyint(1) unsigned DEFAULT '0' COMMENT '产品类型：0普通产品，1虚拟产品',
  `tempview` varchar(200) DEFAULT '' COMMENT '文档模板文件名',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态(0=屏蔽，1=正常)',
  `sort_order` int(10) DEFAULT '0' COMMENT '排序号',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `admin_id` int(10) DEFAULT '0' COMMENT '管理员ID',
  `users_id` int(10) DEFAULT '0' COMMENT '会员ID',
  `arc_level_id` int(10) DEFAULT '0' COMMENT '文档会员权限ID',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '伪删除，1=是，0=否',
  `del_method` tinyint(1) DEFAULT '0' COMMENT '伪删除状态，1为主动删除，2为跟随上级栏目被动删除',
  `joinaid` int(10) DEFAULT '0' COMMENT '关联文档ID',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`aid`),
  KEY `aid` (`typeid`,`channel`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='文档主表';

-- -----------------------------
-- Records of `ey_archives`
-- -----------------------------
INSERT INTO `ey_archives` VALUES ('1', '1', '6', '0', '关于我们 ', '', '0', '0', '0', '0', '0', '1', '', '0', '0', '', '0', '', '', '', '0.00', '0.00', '99999', '1', '0', '', '1', '100', 'cn', '0', '0', '0', '0', '0', '0', '1551921767', '1551926681');
INSERT INTO `ey_archives` VALUES ('2', '7', '6', '0', '联系我们', '', '0', '0', '0', '0', '0', '1', '', '0', '0', '', '0', '', '', '', '0.00', '0.00', '99999', '1', '0', '', '1', '100', 'cn', '0', '0', '0', '0', '0', '0', '1551921816', '1551929680');
INSERT INTO `ey_archives` VALUES ('3', '8', '6', '0', '公司简介', '', '0', '0', '0', '0', '0', '1', '', '0', '0', '', '0', '', '', '', '0.00', '0.00', '99999', '1', '0', '', '1', '100', 'cn', '0', '0', '0', '0', '0', '0', '1551921847', '1551923809');
INSERT INTO `ey_archives` VALUES ('4', '9', '6', '0', '企业文化', '', '0', '0', '0', '0', '0', '1', '', '0', '0', '', '0', '', '', '', '0.00', '0.00', '99999', '1', '0', '', '1', '100', 'cn', '0', '0', '0', '0', '0', '0', '1551921859', '1551924038');
INSERT INTO `ey_archives` VALUES ('5', '12', '6', '0', '公司团队', '', '0', '0', '0', '0', '0', '1', '', '0', '0', '', '0', '', '', '', '0.00', '0.00', '99999', '1', '0', '', '1', '100', 'cn', '0', '0', '0', '0', '0', '0', '1551923136', '1551924364');
INSERT INTO `ey_archives` VALUES ('6', '10', '1', '0', '如何填写购房意向书？几招教您搞定', '/uploads/ueditor/20190307/5c8089440ee99.png', '0', '0', '0', '0', '0', '1', '', '232', '0', '', '0', '', '', '相信好多想要购房的朋友都会碰到购房意向书，那什么是购房意向书呢？购房意向书主要出现在下面这种情况中：当一套抢手房源有很多买家竞争的时候，买卖双方会提出签订购房意向书以表示购房的意愿，也能提前预防房源被其他买家买走的情况出现。购房意向书是一种意向性的协议，不包括房屋具体情况和购房合同细节，有助于买家和买家之间有效沟通并达成彼此的需求。购房意向书在购房流程中是比较重要的一环，但是有不少朋友不了解怎样写购房意向书，下面小编就来教大家如何写意向书的方法：1.当买家决定购买卖方（开发商）位于某市某路的一套房子时，可以与卖方签订购房意向书并按意向书中的内容签订正式的预售合同，卖方不得将房屋另行出售给他人。2.意向书中应包含以下内容：房屋具体建筑面积、房屋单价、房屋暂定总款等，并约定房屋面积以房地产测绘机构测定结果为准，且房屋总价以机构测定结果乘以房屋单价的结果为准实行多退少补原则。3.意向书签订后买方应在项目开盘销售日起的十五日内携带本意向书、确认金收款凭证、本人身份证至售楼处签订正式的预售合同并支付购房款。4.若买方逾期未与卖方签订正式预售合同的话视为买方自动放弃该套房源，卖方有权将其重新出售给', '0.00', '0.00', '99999', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '1551927611', '1551927611');
INSERT INTO `ey_archives` VALUES ('7', '10', '1', '0', '房地产开发五证是指什么？为什么要选择五证齐全的房子？', '/uploads/ueditor/20190307/5c8089762cce0.png', '0', '0', '0', '0', '0', '1', '', '249', '0', '', '0', '', '', '对于许多准备置业的买房新手，买房时往往不知道应该从哪儿看起，那么看这儿就对了。买房必须关注的便是五证问题，一个五证齐全的房子能让你在买房后的服务和前期的购买都具有法律保障，那么房地产开发五证是指什么？为什么要选择五证齐全的房子？下面为您一一详解。五证是什么及其含义：1、《国有土地使用证》：这是地块开发建设的基础，具备此证说明开发商交了土地出让金，地买了使用土地是合法的。2、《建设工程规划许可证》：证明建设工程符合要求。3、《建筑用地规划许可证》：说明开发商的产品设计规划申请通过并决定将要盖的业态，同时证明用地合法，该建筑不是违建。4、《建设工程施工许可证》：说明该地可以开工盖房，开发商有了此证才能动工。5、《商品房销售(预售)许可证》：依照规定达到了工程量后房屋可以进入市场正式销售。小贴士：需要注意的是，对于新买房的置业者们，在进入售楼处的时候一定看五证是否公示、售楼处所公示出来的五证上面的日期一定要看是否到期、您当前所处的售楼处和商品房的预售证是否匹配。为什么选择五证齐全房子？1、签订的合同具有法律效应，五证不全以后出了问题很难处理2、五证不全的房子开发商可能会“偷梁换柱”，会有一房', '0.00', '0.00', '99999', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '1551927652', '1551927652');
INSERT INTO `ey_archives` VALUES ('8', '10', '1', '0', '什么叫小产权房子？购买小产权房子需要承受什么风险？', '/uploads/ueditor/20190307/7bc045439166362b98ad9d032a05dac9.jpg', '0', '0', '0', '0', '0', '1', '', '215', '0', '', '0', '', '', '小产权的房子能购买吗？长期困扰在不明真相的购房者们，价格便宜的房屋一般都会有可大可小的问题，有些特殊的房屋是不能办理房产证书的，小产权房屋就在其中，小产权的房屋价格往往比普通商品房的房价还要低，什么叫小产权房子？购买小产权房子需要承受什么风险？什么叫小产权房子？用简单、通俗易懂的话来说，就是国家房管部门颁发的产权证、能进行交易的就叫大产权房子，能买到的普通商品房就是属于大产权房子，包含了三种产权就是40年产权、50年产权、70年产权，而小产权房子国家是不发房产证的，土地使用证、预售证都是没有的。识别小产权房子有三种性质1、由村名集体建设在集体用地上建成的房子，在宅基地上成功建设的房子，所属权是该村的所有人，邻村、外村的村名是不可以购买的。2、各种类型的养老院、农业园的别墅：这类型的房屋一旦起冲突、发生纠纷，购买此地房子的业主是得不到任何的赔偿，因之前购买所签的合同在法律上是无效的。3、集体企业用地、占用耕地违反建设成的房屋。购买小产权房子需要承受什么风险？1、不能办理房产证对于在集体用地上建设成功的小产权房子，是只有此村的村民才能购买，除此之外城市居民购买了是无法办理房产证的，只能用相', '0.00', '0.00', '99999', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '1551927690', '1551927690');
INSERT INTO `ey_archives` VALUES ('9', '10', '1', '0', '签订商品房买卖合同需要注意哪些问题和哪些盲区？', '/uploads/ueditor/20190307/5c808bde7a850.png', '0', '0', '0', '0', '0', '1', '', '133', '0', '', '0', '', '', '购房对于普遍人来说算得上是当今社会的一件大事，所以要购买商品房之前也需要谨小慎微，而为了保障购房者的权益《商品房销售管理办法》第十六条规定了地产开发企业和买受人应当订立书面商品房买卖合同。那么签订商品房买卖合同不能忽略哪些需要注意问题呢？一．一定合同中要注明或明确与开发商谈定的付款方式，是一次性付款还是按揭付款，最好要注明如果按揭付款时申请不到银行的付款方式的处理办法。二．一定要明确合同中的所购面积是不是自己看中哪个户型的面积（如分摊的公用面积是多少，实际使用是多少），如果将买房子的面积出现了误差超过不是合同约定范围面积购房者有权退房并向开发商追缴利息损失。三．一定要在合同里确定各居室、客厅、厕所的面积，房屋在建造时候使用的建筑结构、装修及设备的材料、品牌和型号，确保是不是属于合格产品，如果入住发现不是合同中所明确的材质出现伪劣材质可以追究开发商的责任。四．一定要让开发商在合同里明确房屋的交付使用日期，必须具体到某年某月某日不能在合同里出现棱模两可的交房时间的表达方式，因为这样如果开发商不按照合同规定的交房日期的话我们可以按照此条款追究其违约责任。以上就是小编整理出来的四条签订《商品房', '0.00', '0.00', '99999', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '1551928275', '1551928275');
INSERT INTO `ey_archives` VALUES ('10', '19', '6', '0', '联系方式', '', '0', '0', '0', '0', '0', '1', '', '0', '0', '', '0', '', '', '', '0.00', '0.00', '99999', '1', '0', '', '1', '100', 'cn', '0', '0', '0', '0', '0', '0', '1551929899', '0');
INSERT INTO `ey_archives` VALUES ('11', '18', '2', '0', '恒大御海天下', '/uploads/allimg/20190307/61469d6bec5fdca367c9eec28797ad53.jpg', '0', '0', '0', '0', '0', '1', '', '149', '0', '', '0', '', '', '恒大御海天下地处海南马袅湾滨海国际旅游区内，项目占地约1665亩，建筑面积约122万，1.37容积率，绿地率46%；项目纵享湾区中央小岛（规划有海岛欢乐世界）、红树林生态湿地、滨海防风森林等三大生态资源，项目内规划有约2833（建筑面积）儿童奇幻王国、约1890（建筑面积）精英幼儿园、约1.07万（建筑面积）风情商业街、约4616（建筑面积）滨海娱乐会所四大缤纷配套，是集旅游观光、娱乐运动、生态休闲于一体的度假大盘。项目首推产品定位为享受型度假产品：【瞰海高层】建筑面积约51-154（带装修），方正格局，带入户花园、景观阳台，拥河景海景双重享受。【半岛别墅（低层住宅）】建筑面积约42（带装修），一层可享两层，带前庭后院私家亲水花园。项目拥有约12万平米臻美威尼斯式水系，园林内曲径通幽，围绕中心景观种植有造型百余种热带植被。', '0.00', '0.00', '99999', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '1551930231', '1551930369');
INSERT INTO `ey_archives` VALUES ('12', '18', '2', '0', '绿城桃李春风别墅', '/uploads/allimg/20190307/ef1d66460d6799320cf09109e5f3df8a.jpg', '0', '0', '0', '0', '0', '1', '', '269', '0', '', '0', '', '', '绿城·桃李春风位于海口市琼山区云龙产业园，项目总占地1100亩，共1278户，是海口千亩千栋纯独栋别墅社区。项目周边交通体系发达，同时具备机场、绕城高速、东线高速、环岛轻轨，城市主干道等立体交通网络，将项目与海南紧密联系在一起。项目距国兴大道省政府车程约30公里，项目为业主提供汽车租赁、金融购车等服务，有从市区直达项目的免费班车，每天定点定区域在市区内接送客户 。绿城·桃李春风周边配套完善，设有美兰高尔夫、台达高尔夫、观澜湖高尔夫等近10座球场。更有鸿洲马会、鸿洲游艇会、奥特莱斯世界名品折扣店、美兰机场离岛免税店等休闲中心，交通和生活配套成熟&nbsp;。绿城·桃李春风作为海口规模庞大的度假式近郊别墅大盘,由1278户175㎡-359㎡的纯别墅组成，整个社区规划为一处休闲度假小镇。建筑设计风格在保证实用舒适的基础上，力求体现出基于海南本土风格之上简洁雅致的特质。绿城·桃李春风社区布局以湖、湾水系为景观核心，打造了300亩自然集中式园林。户户别墅面湖而居，一湖、一湾景观中心发散出5个主要水系，形似人们的手指，将一缕缕活水有序地分布到20个精致的组团里。在园林设计上，充分考虑别墅客户的生活', '0.00', '0.00', '99999', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '1551930486', '1551930551');
INSERT INTO `ey_archives` VALUES ('13', '18', '2', '0', '南国威尼斯城别墅', '/uploads/allimg/20190307/fd1bf7f3dce24907927b619f287f388d.jpg', '0', '0', '0', '0', '0', '1', '', '223', '0', '', '0', '', '', '南国威尼斯城项目位于海南国际旅游岛的省会海口市美兰机场附近。项目用地南临南渡江支流三十六曲溪，西侧与省级云定公路贴邻，南北侧均为种植林地，整个地块南北跨度约990m,东西长约1200m，地块规整。南国威尼斯城项目用地约1347亩，总建筑面积约82万平方米。项目产品种类丰富，是由公寓、独院别墅（含带商铺）、巴黎公馆、南加别墅、花园洋房等巴洛克风格建筑组合而成的恢宏欧陆城邦。该项目养生配套设施齐全，商业风情街满足生活所需，植被葱郁、湖光山色、环境优美、景色怡人、美不胜收，是旅游度假产品中的得力之作。 南国威尼斯城作为海口规模大的楼盘，拥有78万平方米恢宏城邦，产品物业类型齐全，包括从小户型公寓、花园洋房、叠加别墅、联排别墅、双拼别墅、独立别墅、风情商业街的全系列产品。南国威尼斯城适用合理的户型设计，一房一厅50多平米，两房一厅60-70平米，两房两厅85平米左右，三房两厅两卫105平米，花园洋房140--150平米，联排别墅180平米，双拼别墅200平米，独栋别墅250--350平米。所有户型均紧凑合理，项目总户数为8000户，其中二期户数为440户. 南国威尼斯城便捷顺畅的交通', '0.00', '0.00', '99999', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '1551930577', '1551930689');
INSERT INTO `ey_archives` VALUES ('14', '18', '2', '0', '碧桂园中央半岛别墅', '/uploads/allimg/20190307/26f7851ad3647e3ba37c2eac49dfa3c8.jpg', '0', '0', '0', '0', '0', '1', '', '193', '0', '', '0', '', '', '碧桂园中央半岛，是广物地产集团打造的滨海别墅盘。项目总占地约310万平米（4628亩），总建筑面积过100万平米，坐拥数公里城市海岸线。项目北临琼州海峡，与广东省相隔18海里；西面隔江相望是海甸岛，可共享海甸岛醇熟生活配套；南面是内海湾区，与广物滨海国际隔湾相望；东面则是南渡江出海口的壮丽景观，自然风光好，海南之心是海口可观赏日出日落景观的滨海社区。项目内规划有1600亩水系，以及江、河、海、湾四景汇聚的风景岸线，由多座风格迥异的桥梁贯穿各个形状各异、大小不同的地块，真正将艺术、生态与滨海居住融合。项目设计以迈阿密、威尼斯为规划蓝本，以“白色迈阿密”风格结合海南热带风情以及新埠岛的岛屿海景资源，因地布局，汇聚成现代的建筑风格。项目一共分四期开发，首期开发05/07/10三个地块，产品涵盖独栋，双拼，联排，合院别墅、平层等多种物业类型。', '0.00', '0.00', '99999', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '1551930705', '1551930755');
INSERT INTO `ey_archives` VALUES ('15', '18', '2', '0', '耀江西岸公馆别墅', '/uploads/allimg/20190307/2ca3678d782b39c58985013df1d8fdd5.jpg', '0', '0', '0', '0', '0', '1', '', '146', '0', '', '0', '', '', '耀江·西岸公馆位项目于享有“高尚居住区”之美称的海口市西海岸，项目用地呈长方形，南北宽241米，东西长586米，总占地面积180亩，总建筑面积约11.59万平方米，项目北临滨海大道，遥望新国宾馆，西邻西海豪园，东北近蔚蓝海岸项目。距海边300余米，本项目由35栋独立别墅、12栋15-18层纯板式高层住宅及望海空中会所组成.是以高起点.高标准打造的融休闲.度假、居住为一体的滨海度假居住社区。耀江·西岸公馆项目为东南亚热带融汇简欧建筑风格，建筑立面线条流畅简洁，用材考究，大方细致、端庄典雅，楼宇外立面外墙裙房采用天然石材，主体采用真石漆，外墙以米黄色为主调，局部采用浅棕色，形成端庄典雅的建筑风格,尽显欧陆底蕴的低调奢华，园林景观则对应建筑的简约风格.分组团精雕细琢打造具有浓郁热带风情的大型水景园林，建筑与环境相融，人文与生态相伴。水系沿景观主轴连通一体，贯穿整个小区.宛若蓝色项链，将独立别墅区与海景公寓区自然分隔。项目绿化率高达50%，容积率仅为0.7，住宅564户，海景公寓的主力户型为81-89㎡两房，107-135㎡三房；独立别墅面积为405-662㎡。', '0.00', '0.00', '99999', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '1551930760', '1551930824');
INSERT INTO `ey_archives` VALUES ('16', '18', '2', '0', '富力盈溪谷先生的院子别墅', '/uploads/allimg/20190307/f434743d6e3b58c841bba1733ca16cf2.jpg', '0', '0', '0', '0', '0', '1', '', '117', '0', '', '0', '', '', '富力盈溪谷三期先生的院子，项目位于海口西海岸城市新区，在45万火山岩地貌的肥沃土地上,精心勾勒西班牙的水岸社区，拥享138亩千年那甲古河自然水系、8000原生湖泊、1500风情商业街、2000会所、3大主题公园、3大阳光泳池等丰富配套,逾240种植物近5万棵树遍布全区，是典型低密度、低容积率、高绿化的品质社区。融合西班牙小镇独有的热情与浪漫，筑就罕见的大花园纯墅庄园，尊享海南美妙风景.220-280㎡独栋双拼别墅，1200生态公园后花园，果树景观，沁心宜人，享大庭院，户户花园，600私家庭院尽享。', '0.00', '0.00', '99999', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '1551930832', '1551930906');
INSERT INTO `ey_archives` VALUES ('17', '16', '2', '0', '融创观澜湖公园壹号', '/uploads/allimg/20190307/c32b4d1bead94719c6524b4dbf10f385.jpg', '0', '0', '0', '0', '0', '1', '', '292', '0', '', '0', '', '', '融创·观澜湖公园壹号为中国地产十强融创在海南省会海口市开发的旅游度假兼自住的综合型项目，项目位于海口市观澜湖旅游度假区内，共享观澜湖成熟配套，项目总占地217亩，总建筑面积33.3万平方米，综合容积率2.3。项目紧邻观澜湖旅游度假区主入口，延观澜湖2号高尔夫球场顺势排布，纯板式结构，南北通透。楼体坐北朝南，高尔夫果岭、百年荔枝林景观尽收眼底，带来一见倾心的诗意生活。', '0.00', '0.00', '99999', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '1551930963', '1551931054');
INSERT INTO `ey_archives` VALUES ('18', '16', '2', '0', '景园悦海湾 ', '/uploads/allimg/20190307/be3b89b7d684538499c603b73e4165dd.jpg', '0', '0', '0', '0', '0', '1', '', '114', '0', '', '0', '', '', '景园悦海湾项目是由甘肃商会策划、景园集团倾力打造的房地产项目，位于海南长寿之乡澄迈老城经济开发区。风景秀丽，碧海、蓝天、沙滩、阳光常年相伴，一年四季微风吹拂，生态环境宜人。同时尊踞盈滨半岛，粮食作物、水果、蔬菜等含硒量高，是天养生度假的地方。景园悦海湾项目占地400亩，共建10栋高层住宅外加一栋多功能会所。小区共有2960多户，停车位有2700多个。户型全面，从50多到170多平，从一房到四房均有；项目10层以上少部分楼层可以看到海，120米大楼间距享受视觉效果。户型南北通透、方方正正、采光好，实用性高，并且提供非毛坯，方便于业主轻松入住的需求.景园悦海湾项目携手景观设计团队，倾力打造一个内湖水景，以此满足人们居住生活中对水的向往和享受，大面积的内湖水景辅以音乐喷泉、泳池、亲水广场、叠水等景观营造，让水景于社区之间自然渗透，彻底浸润人的身心。小区还将打造浓郁西北特色为主的主题商业街，特别引进了西北特色的餐饮、购物及休闲娱乐配套，让您身处海南也能感受到家乡的味道。', '0.00', '0.00', '99999', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '1551931139', '1551931205');
INSERT INTO `ey_archives` VALUES ('19', '16', '2', '0', '富力悦海湾别墅', '/uploads/allimg/20190307/dbdcfa9a63892dc1c8f2b194b01451f7.jpg', '0', '0', '0', '0', '0', '1', '', '139', '0', '', '0', '', '', '富力悦海湾位于临高文澜江入海口，紧邻琼州海峡，占据生态富硒地，总规划7800亩，容积率1.6，绿化率40%。富力悦海湾海陆空交通配套一体化，在短程内便可畅行全岛。从项目出发，10公里可到达高铁临高南站，经由环岛西线高速70公里享达海口市区，100公里高速直通美兰国际机场，社区内还将配有业主巴士、观光游览车等出行配套。富力悦海湾全面升级富力红树湾的健康理念及配套，规划以大健康生活体验为主旨的五大健康中心（健康管理中心、爱乐歌剧院、奥林匹克体育中心、悦海生活广场、湾主体验馆），辅以旅游、居住、商业等配套复合发展，是一座国际级全配套的全龄旅居养生目的地。', '0.00', '0.00', '99999', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '1551931207', '1551931267');
INSERT INTO `ey_archives` VALUES ('20', '16', '2', '0', '恒大御海天下 ', '/uploads/allimg/20190307/cc17fb57274d54249b3e790c265dd792.jpg', '0', '0', '0', '0', '0', '1', '', '171', '0', '', '0', '', '', '恒大御海天下地处海南马袅湾滨海国际旅游区内，项目占地约1665亩，建筑面积约122万，1.37容积率，绿地率46%；项目纵享湾区中央小岛（规划有海岛欢乐世界）、红树林生态湿地、滨海防风森林等三大生态资源，项目内规划有约2833（建筑面积）儿童奇幻王国、约1890（建筑面积）精英幼儿园、约1.07万（建筑面积）风情商业街、约4616（建筑面积）滨海娱乐会所四大缤纷配套，是集旅游观光、娱乐运动、生态休闲于一体的度假大盘。项目首推产品定位为享受型度假产品：【瞰海高层】建筑面积约51-154（带装修），方正格局，带入户花园、景观阳台，拥河景海景双重享受。【半岛别墅（低层住宅）】建筑面积约42（带装修），一层可享两层，带前庭后院私家亲水花园。项目拥有约12万平米臻美威尼斯式水系，园林内曲径通幽，围绕中心景观种植有造型百余种热带植被。', '0.00', '0.00', '99999', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '1551931282', '1551931349');
INSERT INTO `ey_archives` VALUES ('21', '16', '2', '0', '融创美伦熙语 ', '/uploads/allimg/20190307/196a485e7e86b79ee41201dcfae56993.jpg', '0', '0', '0', '0', '0', '1', '', '187', '0', '', '0', '', '', '融创·美伦熙语地处“世界长寿之乡”“产业富集地”“海口后花园”之称的澄迈老城。融创以“精品”战略为主，携手海南生态软件园匠心打造，配备国内度假生活配套和一级资质物管服务，把未来社区的美好构想落为现实，打造海南宜居的社区。海口绕城高速、海渝西线、南海大道、滨海大道直通项目。距老城高铁站约5.8公里，距省会海口20公里，距美兰国际机场32公里，57路、59路公交车途经项目，直达海口市区。社区内将规划有业主食堂、咖啡吧、温泉泡池、泳池、业主活动中心、健康跑道等配套，并且配备一级资质物业服务，给您带来度假生活体验。项目一期户型有75㎡两房、80㎡两房和105㎡三房，均以非毛坯交付。板式户型全南向设计，南北通透，通风采光条件好。户户拥有南向景观阳台，南北卧室全部含飘窗，可尽揽湖、河、海景色。融创·美伦熙语的设计，严谨考量每一处细节升级，从实用、舒适、健康、安全等方面为业主打造安心好房。', '0.00', '0.00', '99999', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '1551931351', '1551931415');
INSERT INTO `ey_archives` VALUES ('22', '16', '2', '0', '星华海岸城 ', '/uploads/allimg/20190307/8e7cf5bdc40fc48c9f05965ce0eb6059.jpg', '0', '0', '0', '0', '0', '1', '', '272', '0', '', '0', '', '', '星华海岸城项目是由海南星华集团投资有限公司打造的160万平方米滨海项目。星华.海岸城位于海南省海口市西海岸度假区，北侧22公里海岸线隔路相望，南侧五源河公务员小区，东侧是五源河学校，西侧为海口火车站和动车海口站。项目离海口市政府新行政中心约1.5公里，离市中心约12公里，离海口火车站约5公里，距海口美兰国际机场约35公里。星华.海岸城总占地面积约500亩，总建筑面积约200万㎡，一期共1378户，容积率为2.5，绿化率为40％，1183个车位。公寓户型：1+1房（67㎡），2房84-88㎡，3房119-138㎡星华海岸城二期位于长滨六路4号，与海口五源河学校一路之隔。二期容积率为2.24，绿化率为40％，由10栋21-24层的高层和5栋11层的板式小高层组成，共1072户，1614个车位（地下车位1450个，地上车位164个）。海南星华集团投资有限公司初创于1992年，本着“与客户共享成功，与员工共求发展，与社会共同进步”的企业宗旨，奉行“诚信、创新、卓越、高效”的企业精神和“科学管理、锐意创新、与时俱进”的发展经营方针，经过二十五年的探索与发展，已成为一家以房地产业和旅游业为**，集', '0.00', '0.00', '99999', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '1551931420', '1551931475');
INSERT INTO `ey_archives` VALUES ('23', '14', '2', '0', '雅居乐金沙湾 ', '/uploads/allimg/20190307/b3561a011ed66bfbd450df2a7d221d03.jpg', '0', '0', '0', '0', '0', '1', '', '180', '0', '', '0', '', '', '雅居乐金沙湾，是雅居乐地产地产深耕市场25载，顺应滨海旅居发展潮流，首次登陆海口的匠心巨作。项目位于海口市西海岸金沙湾 ，依托西海岸绝版一线原生海景资源和海口市CBD 千亿配套， 形成“城市与海兼得”的独特区位 。邀请美国AECOME设计公司、广东省建筑研究院联袂担纲规划设计，重金打造国际 ，五星级酒店等 服务配套，全方位满足客户的 ，中短期度假，和长期居住的需求，全新演绎 “都市版第二人生”。', '0.00', '0.00', '99999', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '1551931489', '1551931586');
INSERT INTO `ey_archives` VALUES ('24', '14', '2', '0', '碧桂园剑桥郡 ', '/uploads/allimg/20190307/d7e3a1c6ac9a0d25bf38ab6de3114435.jpg', '0', '0', '0', '0', '0', '1', '', '273', '0', '', '0', '', '', '碧桂园剑桥郡，海口城南超越之作，项目位于椰海大道与丘海大道延长线交汇处西南侧，项目为碧桂园2018年在海口重磅打造的大型城市智慧教育住区，是海南一个引入目前国内的SSGF建造技术项目，居住品质将超越目前海南传统社区。项目规划的优质教育。匠心打造17-18层南北纯板式洋房，约101-179㎡三至四房，舒适低密度智能化社区，内部规划五重立体高尔夫园林、成人标准泳池、标准篮球场、羽毛球场、全龄段儿童户外乐园、社区跑道等升级配套。', '0.00', '0.00', '99999', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '1551931601', '1551931652');
INSERT INTO `ey_archives` VALUES ('25', '14', '2', '0', '楠滨华庭', '/uploads/allimg/20190307/8fe6e6478474f1b01d5d942345ed3343.jpg', '0', '0', '0', '0', '0', '1', '', '116', '0', '', '0', '', '', '楠滨华庭项目总占地37710.42㎡，总建筑面积135693㎡，有两个地块分两期开发，一期占地13341.34㎡，建筑面积42992.95㎡，容积率：2.5 ，绿化率：37.05%，由一个三层的商场，两栋23层高层公寓组成，有沿街商铺31间，住宅户型分别是86.86㎡ 两房两厅 ，123.86㎡三房两厅，139.82㎡四房两厅。二期占地24369.08㎡，建筑面积92694.98㎡，容积率：3.0，绿化率：35%，由五栋高层公寓组成，沿街商铺83个，住宅户型分别是两房两厅87.89㎡，三房两厅116.77㎡，121.36㎡,123.52㎡,126.34㎡，四房两厅139.85㎡，六房两厅238.79㎡.一期预计2018年12月31前交付使用，二期待定。', '0.00', '0.00', '99999', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '1551931654', '1551931722');
INSERT INTO `ey_archives` VALUES ('26', '14', '2', '0', '中盟椰海国际', '/uploads/allimg/20190307/af445cbaa62e71b780328efc26d768ba.jpg', '0', '0', '0', '0', '0', '1', '', '201', '0', '', '0', '', '', '中盟·椰海国际打造低建筑密度16%，人车分流，环境安逸，舒适宜居。主推户型板塔结合，全明户型，独具入户花园，方正宽敞大阳台，延景入室，生机盎然，南北通透，静谧一角，风雅静逸。', '0.00', '0.00', '99999', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '1551931724', '1551931779');
INSERT INTO `ey_archives` VALUES ('27', '14', '2', '0', '阳光椰风苑', '/uploads/allimg/20190307/fc5bd2b6fe16fe914d51317e182fa62b.jpg', '0', '0', '0', '0', '0', '1', '', '100', '0', '', '0', '', '', '阳光椰风苑位于塔岭新区，是定安鼎泰置业有限公司在定安开发兴建的，以养生度假为主题的大型社区。阳光椰风苑总占地约86311.55平方米，建筑面积176725平方米，共1784户，是一个集多层、高层、酒店、商业的综合项目。阳光椰风苑分两期开发，一期已经交房使用。二期推出背面临街的一栋17层公寓楼，两梯6户，户型为一房和两房，面积在48到81平米，适合养老、度假及**。', '0.00', '0.00', '99999', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '1551931782', '1551931839');
INSERT INTO `ey_archives` VALUES ('28', '14', '2', '0', '恩祥新城 ', '/uploads/allimg/20190307/e81c31f4bd06dbe96c4c7be663a20add.jpg', '0', '0', '0', '0', '0', '1', '', '115', '0', '', '0', '', '', '恩祥·新城位于椰海大道和海榆中线的交汇处，项目分8期开发，一期占地111亩，建面约26万㎡。项目集商业中心、旅游区、创意产业、传统文化及生态资源为一体的商业集群。恩祥集团将联合北京王府井商业、北京大学附属中学、北京大学附属小学等品牌，打造集健康教育、休闲旅游、休憩商业、宜居生活为一体的项目。', '0.00', '0.00', '99999', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '1551931841', '1551931911');

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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='多页标记存储数据表';

-- -----------------------------
-- Records of `ey_arcmulti`
-- -----------------------------
INSERT INTO `ey_arcmulti` VALUES ('1', 'arclista2eb60d7f86d7508668169b51bf67d19', 'arclist', '', '6', 'SELECT `b`.*,`a`.* FROM `ey_archives` `a` LEFT JOIN `ey_arctype` `b` ON `b`.`id`=`a`.`typeid` WHERE  (  a.typeid IN (3,3) AND a.channel IN (2) AND a.arcrank > -1 AND a.status = 1 AND a.is_del = 0 )  AND `a`.`lang` = \'cn\' ORDER BY a.sort_order asc, a.aid desc LIMIT 6', 'a.sort_order asc, a.aid desc', '', '', 'a:2:{s:3:\\\"row\\\";s:1:\\\"6\\\";s:8:\\\"titlelen\\\";s:2:\\\"40\\\";}', '1551923104', '1551928595');
INSERT INTO `ey_arcmulti` VALUES ('2', 'arclistfa72fce6d186fe89c2cc2c1c8c054625', 'arclist', '', '6', 'SELECT `b`.*,`a`.* FROM `ey_archives` `a` LEFT JOIN `ey_arctype` `b` ON `b`.`id`=`a`.`typeid` WHERE  (  a.typeid IN (4,4) AND a.channel IN (2) AND a.arcrank > -1 AND a.status = 1 AND a.is_del = 0 )  AND `a`.`lang` = \'cn\' ORDER BY a.sort_order asc, a.aid desc LIMIT 6', 'a.sort_order asc, a.aid desc', '', '', 'a:2:{s:3:\\\"row\\\";s:1:\\\"6\\\";s:8:\\\"titlelen\\\";s:2:\\\"40\\\";}', '1551923104', '1551928595');
INSERT INTO `ey_arcmulti` VALUES ('3', 'arclista365d69309049b9658c64ab5fc4e4eb3', 'arclist', '', '6', 'SELECT `b`.*,`a`.* FROM `ey_archives` `a` LEFT JOIN `ey_arctype` `b` ON `b`.`id`=`a`.`typeid` WHERE  (  a.typeid IN (5,5) AND a.channel IN (2) AND a.arcrank > -1 AND a.status = 1 AND a.is_del = 0 )  AND `a`.`lang` = \'cn\' ORDER BY a.sort_order asc, a.aid desc LIMIT 6', 'a.sort_order asc, a.aid desc', '', '', 'a:2:{s:3:\\\"row\\\";s:1:\\\"6\\\";s:8:\\\"titlelen\\\";s:2:\\\"40\\\";}', '1551923104', '1551928595');
INSERT INTO `ey_arcmulti` VALUES ('4', 'arclist92aa33fcbf8a9d57347258119cbc087a', 'arclist', '', '3', 'SELECT `b`.*,`a`.* FROM `ey_archives` `a` LEFT JOIN `ey_arctype` `b` ON `b`.`id`=`a`.`typeid` WHERE  (  a.typeid IN (2,10,11,2) AND a.channel IN (1) AND a.arcrank > -1 AND a.status = 1 AND a.is_del = 0 )  AND `a`.`lang` = \'cn\' ORDER BY a.sort_order asc, a.aid desc LIMIT 3', 'a.sort_order asc, a.aid desc', '', '', 'a:3:{s:3:\\\"row\\\";s:1:\\\"3\\\";s:8:\\\"titlelen\\\";s:2:\\\"40\\\";s:6:\\\"typeid\\\";s:9:\\\"2,10,11,2\\\";}', '1551923464', '1570964011');
INSERT INTO `ey_arcmulti` VALUES ('5', 'arclistfd79b28932e1a429cc28a5d0900cc0c2', 'arclist', '', '6', 'SELECT `b`.*,`a`.* FROM `ey_archives` `a` LEFT JOIN `ey_arctype` `b` ON `b`.`id`=`a`.`typeid` WHERE  (  a.typeid IN (3,14,15,3) AND a.channel IN (2) AND a.arcrank > -1 AND a.status = 1 AND a.is_del = 0 )  AND `a`.`lang` = \'cn\' ORDER BY a.sort_order asc, a.aid desc LIMIT 6', 'a.sort_order asc, a.aid desc', '', '', 'a:3:{s:3:\\\"row\\\";s:1:\\\"6\\\";s:8:\\\"titlelen\\\";s:2:\\\"40\\\";s:6:\\\"typeid\\\";s:9:\\\"3,14,15,3\\\";}', '1551930910', '1570964010');
INSERT INTO `ey_arcmulti` VALUES ('6', 'arclist629ac9afa5643d21ecd09dd769243bfc', 'arclist', '', '6', 'SELECT `b`.*,`a`.* FROM `ey_archives` `a` LEFT JOIN `ey_arctype` `b` ON `b`.`id`=`a`.`typeid` WHERE  (  a.typeid IN (4,16,17,4) AND a.channel IN (2) AND a.arcrank > -1 AND a.status = 1 AND a.is_del = 0 )  AND `a`.`lang` = \'cn\' ORDER BY a.sort_order asc, a.aid desc LIMIT 6', 'a.sort_order asc, a.aid desc', '', '', 'a:3:{s:3:\\\"row\\\";s:1:\\\"6\\\";s:8:\\\"titlelen\\\";s:2:\\\"40\\\";s:6:\\\"typeid\\\";s:9:\\\"4,16,17,4\\\";}', '1551930910', '1570964010');
INSERT INTO `ey_arcmulti` VALUES ('7', 'arclistbc030373e7b9b01a1233b0fd689faa5f', 'arclist', '', '6', 'SELECT `b`.*,`a`.* FROM `ey_archives` `a` LEFT JOIN `ey_arctype` `b` ON `b`.`id`=`a`.`typeid` WHERE  (  a.typeid IN (5,18,5) AND a.channel IN (2) AND a.arcrank > -1 AND a.status = 1 AND a.is_del = 0 )  AND `a`.`lang` = \'cn\' ORDER BY a.sort_order asc, a.aid desc LIMIT 6', 'a.sort_order asc, a.aid desc', '', '', 'a:3:{s:3:\\\"row\\\";s:1:\\\"6\\\";s:8:\\\"titlelen\\\";s:2:\\\"40\\\";s:6:\\\"typeid\\\";s:6:\\\"5,18,5\\\";}', '1551930910', '1570964011');
INSERT INTO `ey_arcmulti` VALUES ('8', 'arclist_69fa802f07ec58ee6a48177f487854a5', 'arclist', '', '6', 'SELECT `b`.*,`a`.* FROM `ey_archives` `a` LEFT JOIN `ey_arctype` `b` ON `b`.`id`=`a`.`typeid` WHERE  (  a.typeid IN (3,14,15,3) AND a.channel IN (2) AND a.arcrank > -1 AND a.status = 1 AND a.is_del = 0 )  AND `a`.`lang` = \'cn\' ORDER BY a.sort_order asc, a.aid desc LIMIT 6', 'a.sort_order asc, a.aid desc', '', '', 'a:4:{s:3:\\\"row\\\";s:1:\\\"6\\\";s:8:\\\"titlelen\\\";s:2:\\\"40\\\";s:6:\\\"typeid\\\";s:9:\\\"3,14,15,3\\\";s:7:\\\"channel\\\";i:2;}', '1570964230', '1589872864');
INSERT INTO `ey_arcmulti` VALUES ('9', 'arclist_9e6f95de397289001899acd5bbd43c03', 'arclist', '', '6', 'SELECT `b`.*,`a`.* FROM `ey_archives` `a` LEFT JOIN `ey_arctype` `b` ON `b`.`id`=`a`.`typeid` WHERE  (  a.typeid IN (4,16,17,4) AND a.channel IN (2) AND a.arcrank > -1 AND a.status = 1 AND a.is_del = 0 )  AND `a`.`lang` = \'cn\' ORDER BY a.sort_order asc, a.aid desc LIMIT 6', 'a.sort_order asc, a.aid desc', '', '', 'a:4:{s:3:\\\"row\\\";s:1:\\\"6\\\";s:8:\\\"titlelen\\\";s:2:\\\"40\\\";s:6:\\\"typeid\\\";s:9:\\\"4,16,17,4\\\";s:7:\\\"channel\\\";i:2;}', '1570964230', '1589872864');
INSERT INTO `ey_arcmulti` VALUES ('10', 'arclist_23c35bf6b5f9571d1da0ce9d99fcf347', 'arclist', '', '6', 'SELECT `b`.*,`a`.* FROM `ey_archives` `a` LEFT JOIN `ey_arctype` `b` ON `b`.`id`=`a`.`typeid` WHERE  (  a.typeid IN (5,18,5) AND a.channel IN (2) AND a.arcrank > -1 AND a.status = 1 AND a.is_del = 0 )  AND `a`.`lang` = \'cn\' ORDER BY a.sort_order asc, a.aid desc LIMIT 6', 'a.sort_order asc, a.aid desc', '', '', 'a:4:{s:3:\\\"row\\\";s:1:\\\"6\\\";s:8:\\\"titlelen\\\";s:2:\\\"40\\\";s:6:\\\"typeid\\\";s:6:\\\"5,18,5\\\";s:7:\\\"channel\\\";i:2;}', '1570964231', '1589872864');
INSERT INTO `ey_arcmulti` VALUES ('11', 'arclist_3df780dc2caa5869228751d4aef55667', 'arclist', '', '3', 'SELECT `b`.*,`a`.* FROM `ey_archives` `a` LEFT JOIN `ey_arctype` `b` ON `b`.`id`=`a`.`typeid` WHERE  (  a.typeid IN (2,10,11,2) AND a.channel IN (1) AND a.arcrank > -1 AND a.status = 1 AND a.is_del = 0 )  AND `a`.`lang` = \'cn\' ORDER BY a.sort_order asc, a.aid desc LIMIT 3', 'a.sort_order asc, a.aid desc', '', '', 'a:4:{s:3:\\\"row\\\";s:1:\\\"3\\\";s:8:\\\"titlelen\\\";s:2:\\\"40\\\";s:6:\\\"typeid\\\";s:9:\\\"2,10,11,2\\\";s:7:\\\"channel\\\";i:1;}', '1570964231', '1589872864');

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
INSERT INTO `ey_arcrank` VALUES ('1', '0', '开放浏览', 'cn', '0', '1552376880');
INSERT INTO `ey_arcrank` VALUES ('2', '-1', '待审核稿件', 'cn', '0', '1552376880');

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
  `is_release` tinyint(1) DEFAULT '0' COMMENT '栏目是否应用于会员投稿发布，1是，0否',
  `weapp_code` varchar(50) DEFAULT '' COMMENT '插件栏目唯一标识',
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
INSERT INTO `ey_arctype` VALUES ('1', '1', '6', '0', '关于我们 ', 'guanyuwomen', '/guanyuwomen', 'ABOUT US', '0', '', '/uploads/allimg/20190307/92bab331c320a810c3bf29d5ba7a9264.jpg', 'lists_single.htm', '', '', '', '', '100', '0', '0', '1', '0', '0', '1', '0', '', 'cn', '1551921761', '1570976417');
INSERT INTO `ey_arctype` VALUES ('2', '1', '1', '0', '房产资讯 ', 'fangchanzixun', '/fangchanzixun', 'Real estate information', '0', '', '/uploads/allimg/20190307/4f2fc433a32c0b2b067b6f78684be994.jpg', 'lists_article.htm', 'view_article.htm', '', '', '', '100', '0', '0', '1', '0', '0', '1', '1', '', 'cn', '1551921776', '1570976417');
INSERT INTO `ey_arctype` VALUES ('3', '2', '2', '0', '二手房 ', 'ershoufang', '/ershoufang', 'Quality second-hand house', '0', '', '/uploads/allimg/20190307/657692ad1d4fa71d0ca3106196d20004.jpg', 'lists_product.htm', 'view_product.htm', '', '', '', '100', '0', '0', '1', '0', '0', '1', '0', '', 'cn', '1551921783', '1570976417');
INSERT INTO `ey_arctype` VALUES ('4', '1', '2', '0', '小区 ', 'xiaoqu', '/xiaoqu', 'Elegant district', '0', '', '/uploads/allimg/20190307/28a4ec821ad4d398ec4aaae41657336b.jpg', 'lists_product.htm', 'view_product.htm', '', '', '', '100', '0', '0', '1', '0', '0', '1', '0', '', 'cn', '1551921789', '1570976417');
INSERT INTO `ey_arctype` VALUES ('5', '2', '2', '0', '别墅 ', 'bieshu', '/bieshu', 'Boutique villa', '0', '', '/uploads/allimg/20190307/167eed1baa058b27846930ee031e50f7.jpg', 'lists_product.htm', 'view_product.htm', '', '', '', '100', '0', '0', '1', '0', '0', '1', '0', '', 'cn', '1551921803', '1570976417');
INSERT INTO `ey_arctype` VALUES ('6', '2', '2', '0', '出售 ', 'chushou', '/chushou', '', '0', '', '', 'lists_product.htm', 'view_product.htm', '', '', '', '100', '0', '0', '1', '1', '1', '1', '0', '', 'cn', '1551921811', '1570976417');
INSERT INTO `ey_arctype` VALUES ('7', '6', '6', '0', '联系我们', 'lianxiwomen', '/lianxiwomen', '', '0', '', '/uploads/allimg/20190307/1b488dd54c29cd0843e90f4ddab01a6e.jpg', 'lists_single.htm', '', '', '', '', '100', '0', '0', '1', '0', '0', '1', '0', '', 'cn', '1551921816', '1570976417');
INSERT INTO `ey_arctype` VALUES ('8', '1', '6', '1', '公司简介', 'gongsijianjie', '/guanyuwomen/gongsijianjie', 'ABOUT US', '1', '', '/uploads/allimg/20190307/41955ca9a436f4f42aece6978d22c60d.jpg', 'lists_single.htm', '', '', '', '某某置业创建于2009年6月，坐落于广东深圳市，主营新房代理销售。专注旅游地产面向全国，借助互联网，成功的将全国旅居地产楼盘信息与购房者进行连接。实现了特有的房地产行业的O20业务模式，并将致力于将线上线下的业务模式做到极致。2018年业务开始面向海南、广西、广东、云南、河南几大省份。未来业务将覆盖全国沿海地区。某某置业是一家专业的旅游地产网络平台。我们坚持以客户需求为核心，面向全国客户提供专业详细的旅游地产市场解读，旅居购房、旅居楼盘咨询等服务。', '100', '0', '0', '1', '0', '0', '1', '0', '', 'cn', '1551921847', '1570976417');
INSERT INTO `ey_arctype` VALUES ('9', '1', '6', '1', '企业文化', 'qiyewenhua', '/guanyuwomen/qiyewenhua', '', '1', '', '/uploads/allimg/20190307/41d49088a1ddd48195f48e94ad7c2d15.jpg', 'lists_single.htm', '', '', '', '核心价值观：诚信、创新、服务，企业核心： 诚信，企业精神： 团结拼搏、开拓求实、满足用户、科技进步。客户：为客户提供高质量和最大价值的专业化产品和服务，以真诚和实力赢得客户的理解、尊重和支持。市场：为客户降低采购成本和风险，为客户投资提供切实保障。发展：追求永续发展的目标，并把它建立在客户满意的基础上。关于“为合作伙伴创造价值”公司认为客户、供应商、公司股东、公司员工等一切和自身有合作关系的单位和个人都是自己的合作伙伴，并只有通过努力为合作伙伴创造价值，才能体现自身的价值并获得发展和成功。关于“诚实、宽容、创新、服务”公司认为诚信是一切合作的基础，宽容是解决问题的前提，创新是发展事业的利器，服务是创造价值的根本。公司会坚持持续改进、满足顾客期望、 确保品质第一、开拓全球市场。', '100', '0', '0', '1', '0', '0', '1', '0', '', 'cn', '1551921859', '1570976417');
INSERT INTO `ey_arctype` VALUES ('10', '1', '1', '2', '省内资讯', 'shengnazixun', '/fangchanzixun/shengnazixun', '', '1', '', '', 'lists_article.htm', 'view_article.htm', '', '', '', '100', '0', '0', '1', '0', '0', '1', '1', '', 'cn', '1551921904', '1570976417');
INSERT INTO `ey_arctype` VALUES ('11', '1', '1', '2', '省外资讯', 'shengwaizixun', '/fangchanzixun/shengwaizixun', '', '1', '', '', 'lists_article.htm', 'view_article.htm', '', '', '', '100', '0', '0', '1', '0', '0', '1', '1', '', 'cn', '1551921926', '1570976417');
INSERT INTO `ey_arctype` VALUES ('12', '1', '6', '1', '公司团队', 'gongsituandui', '/guanyuwomen/gongsituandui', '', '1', '', '', 'lists_single.htm', '', '', '', '研发管理就是在研发体系结构设计和各种管理理论基础之上，借助信息平台对研发过程中进行的团队建设、流程设计、绩效管理、风险管理、成本管理、项目管理和知识管理等的一系列协调活动。研发管理，是一个较为宽泛的管理范畴。可以从狭义和广义两个方面来进行理解：狭义的定义：是指对研发或技术部门及其工作进行管理，重点是产品开发及测试过程。广义的定义：研发工作实际上不仅仅包含技术开发工作，其范围涵盖新产品的全生命周期，以从产品创意的产生、产品概念形成、产品市场研究、产品设计、产品实现、产品开发、产品中试、产品发布等整个过程。从管理的角度来看，其范围涵盖产品战略与规划、市场分析与产品规划、产品及研发组织结构设计、研发项目管理、研发质量管理、研发团队管理、研发绩效管理、研发人力资源管理、平台开发与技术预研等领域。\r\n', '100', '0', '0', '1', '0', '0', '1', '0', '', 'cn', '1551923136', '1570976417');
INSERT INTO `ey_arctype` VALUES ('13', '8', '8', '0', '在线留言', 'zaixianliuyan', '/zaixianliuyan', '', '0', '', '', 'lists_guestbook.htm', '', '', '', '', '100', '1', '0', '1', '0', '0', '1', '0', '', 'cn', '1551924631', '1570976417');
INSERT INTO `ey_arctype` VALUES ('14', '2', '2', '3', '精品房源', 'jingpinfangyuan', '/ershoufang/jingpinfangyuan', '', '1', '', '', 'lists_product.htm', 'view_product.htm', '', '', '', '100', '0', '0', '1', '0', '0', '1', '0', '', 'cn', '1551929734', '1570976417');
INSERT INTO `ey_arctype` VALUES ('15', '2', '2', '3', '最新房源', 'zuixinfangyuan', '/ershoufang/zuixinfangyuan', '', '1', '', '', 'lists_product.htm', 'view_product.htm', '', '', '', '100', '0', '0', '1', '0', '0', '1', '0', '', 'cn', '1551929743', '1570976417');
INSERT INTO `ey_arctype` VALUES ('16', '1', '2', '4', '滨海小区', 'binhaixiaoqu', '/xiaoqu/binhaixiaoqu', '', '1', '', '', 'lists_product.htm', 'view_product.htm', '', '', '', '100', '0', '0', '1', '0', '0', '1', '0', '', 'cn', '1551929838', '1570976417');
INSERT INTO `ey_arctype` VALUES ('17', '1', '2', '4', '滨江小区', 'binjiangxiaoqu', '/xiaoqu/binjiangxiaoqu', '', '1', '', '', 'lists_product.htm', 'view_product.htm', '', '', '', '100', '0', '0', '1', '0', '0', '1', '0', '', 'cn', '1551929853', '1570976417');
INSERT INTO `ey_arctype` VALUES ('18', '2', '2', '5', '精品别墅', 'jingpinbieshu', '/bieshu/jingpinbieshu', '', '1', '', '', 'lists_product.htm', 'view_product.htm', '', '', '', '100', '0', '0', '1', '0', '0', '1', '0', '', 'cn', '1551929884', '1570976417');
INSERT INTO `ey_arctype` VALUES ('19', '6', '6', '7', '联系方式', 'lianxifangshi', '/lianxiwomen/lianxifangshi', '', '1', '', '', 'lists_single.htm', '', '', '', '', '100', '0', '0', '1', '0', '0', '1', '0', '', 'cn', '1551929899', '1570976417');

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
  `define` text NOT NULL COMMENT '字段定义',
  `maxlength` int(10) NOT NULL DEFAULT '0' COMMENT '最大长度，文本数据必须填写，大于255为text类型',
  `dfvalue` varchar(1000) NOT NULL DEFAULT '' COMMENT '默认值',
  `dfvalue_unit` varchar(50) NOT NULL DEFAULT '' COMMENT '数值单位',
  `remark` varchar(256) NOT NULL DEFAULT '' COMMENT '提示说明',
  `is_screening` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否应用于条件筛选',
  `is_release` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否应用于会员投稿发布',
  `ifeditable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否在编辑页显示',
  `ifrequire` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否必填',
  `ifsystem` tinyint(1) NOT NULL DEFAULT '0' COMMENT '字段分类，1=系统(不可修改)，0=自定义',
  `ifmain` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否主表字段',
  `ifcontrol` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态，控制该条数据是否允许被控制，1为不允许控制，0为允许控制',
  `sort_order` int(5) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 COMMENT='自定义字段表';

-- -----------------------------
-- Records of `ey_channelfield`
-- -----------------------------
INSERT INTO `ey_channelfield` VALUES ('1', 'add_time', '0', '新增时间', 'datetime', 'int(11)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533091575', '1533091575');
INSERT INTO `ey_channelfield` VALUES ('2', 'update_time', '0', '更新时间', 'datetime', 'int(11)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533091601', '1533091601');
INSERT INTO `ey_channelfield` VALUES ('3', 'aid', '0', '文档ID', 'int', 'int(11)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533091624', '1533091624');
INSERT INTO `ey_channelfield` VALUES ('4', 'typeid', '0', '当前栏目ID', 'int', 'int(11)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533091930', '1533091930');
INSERT INTO `ey_channelfield` VALUES ('5', 'channel', '0', '模型ID', 'int', 'int(11)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092214', '1533092214');
INSERT INTO `ey_channelfield` VALUES ('6', 'is_b', '0', '是否加粗', 'switch', 'tinyint(1)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092246', '1533092246');
INSERT INTO `ey_channelfield` VALUES ('7', 'title', '0', '文档标题', 'text', 'varchar(250)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092381', '1533092381');
INSERT INTO `ey_channelfield` VALUES ('8', 'litpic', '0', '缩略图', 'img', 'varchar(250)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092398', '1533092398');
INSERT INTO `ey_channelfield` VALUES ('9', 'is_head', '0', '是否头条', 'switch', 'tinyint(1)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092420', '1533092420');
INSERT INTO `ey_channelfield` VALUES ('10', 'is_special', '0', '是否特荐', 'switch', 'tinyint(1)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092439', '1533092439');
INSERT INTO `ey_channelfield` VALUES ('11', 'is_top', '0', '是否置顶', 'switch', 'tinyint(1)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092454', '1533092454');
INSERT INTO `ey_channelfield` VALUES ('12', 'is_recom', '0', '是否推荐', 'switch', 'tinyint(1)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092468', '1533092468');
INSERT INTO `ey_channelfield` VALUES ('13', 'is_jump', '0', '是否跳转', 'switch', 'tinyint(1)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092484', '1533092484');
INSERT INTO `ey_channelfield` VALUES ('14', 'author', '0', '作者', 'text', 'varchar(250)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092498', '1533092498');
INSERT INTO `ey_channelfield` VALUES ('15', 'click', '0', '浏览量', 'int', 'int(11)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092512', '1533092512');
INSERT INTO `ey_channelfield` VALUES ('16', 'arcrank', '0', '阅读权限', 'select', 'tinyint(1)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092534', '1533092534');
INSERT INTO `ey_channelfield` VALUES ('17', 'jumplinks', '0', '跳转链接', 'text', 'varchar(250)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092553', '1533092553');
INSERT INTO `ey_channelfield` VALUES ('18', 'ismake', '0', '是否静态页面', 'switch', 'tinyint(1)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092698', '1533092698');
INSERT INTO `ey_channelfield` VALUES ('19', 'seo_title', '0', 'SEO标题', 'text', 'varchar(250)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092713', '1533092713');
INSERT INTO `ey_channelfield` VALUES ('20', 'seo_keywords', '0', 'SEO关键词', 'text', 'varchar(250)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092725', '1533092725');
INSERT INTO `ey_channelfield` VALUES ('21', 'seo_description', '0', 'SEO描述', 'text', 'varchar(250)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092739', '1533092739');
INSERT INTO `ey_channelfield` VALUES ('22', 'status', '0', '状态', 'switch', 'tinyint(1)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092753', '1533092753');
INSERT INTO `ey_channelfield` VALUES ('23', 'sort_order', '0', '排序号', 'int', 'int(11)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092766', '1533092766');
INSERT INTO `ey_channelfield` VALUES ('24', 'content', '2', '内容详情', 'htmltext', 'longtext', '250', '', '', '', '0', '1', '1', '0', '1', '0', '0', '100', '1', '1533359739', '1533359739');
INSERT INTO `ey_channelfield` VALUES ('25', 'content', '3', '内容详情', 'htmltext', 'longtext', '250', '', '', '', '0', '1', '1', '0', '1', '0', '0', '100', '1', '1533359588', '1533359588');
INSERT INTO `ey_channelfield` VALUES ('26', 'content', '4', '内容详情', 'htmltext', 'longtext', '250', '', '', '', '0', '1', '1', '0', '1', '0', '0', '100', '1', '1533359752', '1533359752');
INSERT INTO `ey_channelfield` VALUES ('27', 'content', '6', '内容详情', 'htmltext', 'longtext', '250', '', '', '', '0', '1', '1', '0', '1', '0', '0', '100', '1', '1533464715', '1533464715');
INSERT INTO `ey_channelfield` VALUES ('29', 'content', '1', '内容详情', 'htmltext', 'longtext', '250', '', '', '', '0', '1', '1', '0', '1', '0', '0', '100', '1', '1533464713', '1533464713');
INSERT INTO `ey_channelfield` VALUES ('30', 'update_time', '-99', '更新时间', 'datetime', 'int(11)', '11', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('31', 'add_time', '-99', '新增时间', 'datetime', 'int(11)', '11', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('32', 'status', '-99', '启用 (1=正常，0=屏蔽)', 'switch', 'tinyint(1)', '1', '1', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('33', 'is_part', '-99', '栏目属性：0=内容栏目，1=外部链接', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('34', 'is_hidden', '-99', '是否隐藏栏目：0=显示，1=隐藏', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('35', 'sort_order', '-99', '排序号', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('36', 'seo_description', '-99', 'seo描述', 'multitext', 'text', '0', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('37', 'seo_keywords', '-99', 'seo关键字', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('38', 'seo_title', '-99', 'SEO标题', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('39', 'tempview', '-99', '文档模板文件名', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('40', 'templist', '-99', '列表模板文件名', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('41', 'litpic', '-99', '栏目图片', 'img', 'varchar(250)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('42', 'typelink', '-99', '栏目链接', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('43', 'grade', '-99', '栏目等级', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('44', 'englist_name', '-99', '栏目英文名', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('45', 'dirpath', '-99', '目录存放HTML路径', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('46', 'dirname', '-99', '目录英文名', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('47', 'typename', '-99', '栏目名称', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('48', 'parent_id', '-99', '栏目上级ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('49', 'current_channel', '-99', '栏目当前模型ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('50', 'channeltype', '-99', '栏目顶级模型ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('51', 'id', '-99', '栏目ID', 'int', 'int(10)', '10', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('52', 'del_method', '-99', '伪删除状态，1为主动删除，2为跟随上级栏目被动删除', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1547890773', '1547890773');
INSERT INTO `ey_channelfield` VALUES ('53', 'is_del', '0', '伪删除，1=是，0=否', 'switch', 'tinyint(1)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1547890773', '1547890773');
INSERT INTO `ey_channelfield` VALUES ('54', 'del_method', '0', '伪删除状态，1为主动删除，2为跟随上级栏目被动删除', 'switch', 'tinyint(1)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1547890773', '1547890773');
INSERT INTO `ey_channelfield` VALUES ('55', 'admin_id', '0', '管理员ID', 'int', 'int(10)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1547890773', '1547890773');
INSERT INTO `ey_channelfield` VALUES ('56', 'lang', '0', '语言标识', 'text', 'varchar(250)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1547890773', '1547890773');
INSERT INTO `ey_channelfield` VALUES ('57', 'update_time', '2', '更新时间', 'datetime', 'int(11)', '11', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('58', 'add_time', '2', '新增时间', 'datetime', 'int(11)', '11', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('59', 'del_method', '2', '伪删除状态，1为主动删除，2为跟随上级栏目被动删除', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('60', 'is_del', '2', '伪删除，1=是，0=否', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('61', 'admin_id', '2', '管理员ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('62', 'lang', '2', '语言标识', 'text', 'varchar(50)', '50', 'cn', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('63', 'sort_order', '2', '排序号', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('64', 'status', '2', '状态(0=屏蔽，1=正常)', 'switch', 'tinyint(1)', '1', '1', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('65', 'seo_description', '2', 'SEO描述', 'multitext', 'text', '0', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('66', 'seo_keywords', '2', 'SEO关键词', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('67', 'seo_title', '2', 'SEO标题', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('68', 'ismake', '2', '是否静态页面（0=动态，1=静态）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('69', 'jumplinks', '2', '外链跳转', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('70', 'arcrank', '2', '阅读权限：0=开放浏览，-1=待审核稿件', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('71', 'click', '2', '浏览量', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('72', 'author', '2', '作者', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('73', 'is_jump', '2', '跳转链接（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('74', 'is_recom', '2', '推荐（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('75', 'is_top', '2', '置顶（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('76', 'is_special', '2', '特荐（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('77', 'is_head', '2', '头条（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('78', 'litpic', '2', '缩略图', 'img', 'varchar(250)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('79', 'title', '2', '标题', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('80', 'is_b', '2', '加粗', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('81', 'channel', '2', '模型ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('82', 'typeid', '2', '当前栏目', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('83', 'aid', '2', 'aid', 'int', 'int(10)', '10', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1551922603', '1551922603');
INSERT INTO `ey_channelfield` VALUES ('84', 'shoujia', '2', '售价', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '0', '0', '0', '100', '1', '1551922844', '1551922844');
INSERT INTO `ey_channelfield` VALUES ('85', 'danjia', '2', '单价', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '0', '0', '0', '100', '1', '1551922884', '1551922884');
INSERT INTO `ey_channelfield` VALUES ('86', 'mianji', '2', '面积', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '0', '0', '0', '100', '1', '1551922896', '1551922896');
INSERT INTO `ey_channelfield` VALUES ('87', 'quyu', '2', '区域', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '0', '0', '0', '100', '1', '1551922909', '1551922909');
INSERT INTO `ey_channelfield` VALUES ('88', 'xiaoqumingcheng', '2', '小区名称', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '0', '0', '0', '100', '1', '1551922943', '1551922943');
INSERT INTO `ey_channelfield` VALUES ('89', 'prom_type', '0', '产品类型：0普通产品，1虚拟产品', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('90', 'users_price', '0', '价格', 'decimal', 'decimal(10,2)', '10', '0.00', '', '', '0', '0', '1', '0', '1', '1', '0', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('91', 'prom_type', '2', '产品类型：0普通产品，1虚拟产品', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('92', 'users_price', '2', '价格', 'decimal', 'decimal(10,2)', '10', '0.00', '', '', '0', '0', '1', '0', '1', '1', '0', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('93', 'users_id', '0', '会员ID', 'int', 'int(11)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('94', 'arc_level_id', '0', '文档会员权限ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('95', 'arc_level_id', '4', '文档会员权限ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('96', 'weapp_code', '-99', '插件栏目唯一标识', 'text', 'varchar(200)', '200', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('97', 'is_release', '-99', '栏目是否应用于会员投稿发布，1是，0否', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('98', 'old_price', '0', '产品旧价', 'decimal', 'decimal(10,2)', '10', '0.00', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('99', 'stock_count', '0', '商品库存量', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('100', 'stock_show', '0', '商品库存在产品详情页是否显示，1为显示，0为不显示', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('101', 'joinaid', '0', '关联文档ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('102', 'update_time', '1', '更新时间', 'datetime', 'int(11)', '11', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('103', 'add_time', '1', '新增时间', 'datetime', 'int(11)', '11', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('104', 'joinaid', '1', '关联文档ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('105', 'del_method', '1', '伪删除状态，1为主动删除，2为跟随上级栏目被动删除', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('106', 'is_del', '1', '伪删除，1=是，0=否', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('107', 'arc_level_id', '1', '文档会员权限ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('108', 'users_id', '1', '会员ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('109', 'admin_id', '1', '管理员ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('110', 'lang', '1', '语言标识', 'text', 'varchar(50)', '50', 'cn', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('111', 'sort_order', '1', '排序号', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('112', 'status', '1', '状态(0=屏蔽，1=正常)', 'switch', 'tinyint(1)', '1', '1', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('113', 'tempview', '1', '文档模板文件名', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('114', 'prom_type', '1', '产品类型：0普通产品，1虚拟产品', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('115', 'stock_show', '1', '商品库存在产品详情页是否显示，1为显示，0为不显示', 'switch', 'tinyint(1) unsigned', '1', '1', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('116', 'stock_count', '1', '商品库存量', 'int', 'int(10) unsigned', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('117', 'old_price', '1', '产品旧价', 'decimal', 'decimal(10,2)', '10', '0.00', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('118', 'users_price', '1', '会员价', 'decimal', 'decimal(10,2)', '10', '0.00', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('119', 'seo_description', '1', 'SEO描述', 'multitext', 'text', '0', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('120', 'seo_keywords', '1', 'SEO关键词', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('121', 'seo_title', '1', 'SEO标题', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('122', 'ismake', '1', '是否静态页面（0=动态，1=静态）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('123', 'jumplinks', '1', '外链跳转', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('124', 'arcrank', '1', '阅读权限：0=开放浏览，-1=待审核稿件', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('125', 'click', '1', '浏览量', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('126', 'author', '1', '作者', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('127', 'is_litpic', '1', '图片（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('128', 'is_jump', '1', '跳转链接（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('129', 'is_recom', '1', '推荐（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('130', 'is_top', '1', '置顶（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('131', 'is_special', '1', '特荐（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('132', 'is_head', '1', '头条（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('133', 'litpic', '1', '缩略图', 'img', 'varchar(250)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('134', 'title', '1', '标题', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('135', 'is_b', '1', '加粗', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('136', 'channel', '1', '模型ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('137', 'typeid', '1', '当前栏目', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');
INSERT INTO `ey_channelfield` VALUES ('138', 'aid', '1', 'aid', 'int', 'int(10)', '10', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1570976468', '1570976468');

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
  `is_repeat_title` tinyint(1) DEFAULT '1' COMMENT '文档标题重复，1=允许，0=不允许',
  `is_release` tinyint(1) DEFAULT '0' COMMENT '模型是否允许应用于会员投稿发布，1是，0否',
  `is_litpic_users_release` tinyint(1) DEFAULT '1' COMMENT '缩略图是否应用于会员投稿，1=允许，0=不允许',
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
INSERT INTO `ey_channeltype` VALUES ('1', 'article', '文章模型', '文章', 'article', 'Article', '1', '1', '1', '1', '1', '0', '1', '0', '1570964003');
INSERT INTO `ey_channeltype` VALUES ('4', 'download', '下载模型', '下载', 'download', 'Download', '0', '1', '1', '0', '1', '0', '4', '0', '1570964003');
INSERT INTO `ey_channeltype` VALUES ('2', 'product', '产品模型', '产品', 'product', 'Product', '1', '1', '1', '0', '1', '0', '2', '0', '1570964003');
INSERT INTO `ey_channeltype` VALUES ('8', 'guestbook', '留言模型', '留言', 'guestbook', 'Guestbook', '1', '1', '1', '0', '1', '0', '8', '1509197711', '1570964003');
INSERT INTO `ey_channeltype` VALUES ('6', 'single', '单页模型', '单页', 'single', 'Single', '1', '1', '1', '0', '1', '0', '6', '1523091961', '1570964003');
INSERT INTO `ey_channeltype` VALUES ('3', 'images', '图集模型', '图集', 'images', 'Images', '0', '1', '1', '0', '1', '0', '3', '1523929121', '1570964003');

-- -----------------------------
-- Table structure for `ey_common_pic`
-- -----------------------------
DROP TABLE IF EXISTS `ey_common_pic`;
CREATE TABLE `ey_common_pic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '常用图片ID',
  `pic_path` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `lang` varchar(50) NOT NULL DEFAULT 'cn' COMMENT '多语言',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='常用图片';


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
) ENGINE=MyISAM AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

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
INSERT INTO `ey_config` VALUES ('31', 'web_basehost', 'http://fangwu.80shihua.com', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('32', 'web_description', '', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('79', 'web_recordnum', '琼ICP备xxxxxxxx号', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('33', 'web_copyright', 'Copyright © 2010-2019 某某房屋租售公司 版权所有', 'web', '', 'cn', '0', '1570976539');
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
INSERT INTO `ey_config` VALUES ('62', 'seo_inlet', '0', 'seo', '', 'cn', '0', '1570963843');
INSERT INTO `ey_config` VALUES ('63', 'web_cmspath', '', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('64', 'web_sqldatapath', '/data/sqldata', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('65', 'web_cmsurl', '', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('66', 'web_templets_dir', '/template', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('67', 'web_templeturl', '/template', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('68', 'web_templets_pc', '/template/pc', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('69', 'web_templets_m', '/template/mobile', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('70', 'web_eyoucms', 'http://www.eyoucms.com', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('78', '_cmscopyright', 'rvGMMF8sLLA9jkDdvc89A58r', 'php', '', 'cn', '0', '1589872864');
INSERT INTO `ey_config` VALUES ('76', 'seo_liststitle_format', '2', 'seo', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('77', 'web_status', '0', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('80', 'web_is_authortoken', '-1', 'web', '', 'cn', '0', '1589873173');
INSERT INTO `ey_config` VALUES ('81', 'web_adminbasefile', '/login.php', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('82', 'seo_rewrite_format', '1', 'seo', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('83', 'web_cmsmode', '2', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('84', 'web_htmlcache_expires_in', '7200', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('85', 'web_show_popup_upgrade', '-1', 'web', '', 'cn', '0', '1589873145');
INSERT INTO `ey_config` VALUES ('86', 'web_weapp_switch', '-1', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('88', 'seo_dynamic_format', '1', 'seo', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('89', 'system_sql_mode', 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION', 'system', '', 'cn', '0', '1589872883');
INSERT INTO `ey_config` VALUES ('90', 'system_home_default_lang', 'cn', 'system', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('91', 'system_langnum', '1', 'system', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('92', 'web_attr_1', '/uploads/allimg/20190307/f1961e68ba5c5901301f5a37ccb3ce21.jpg', 'web', '', 'cn', '0', '1551925268');
INSERT INTO `ey_config` VALUES ('93', 'web_attr_2', '1234567890', 'web', '', 'cn', '0', '1551925512');
INSERT INTO `ey_config` VALUES ('94', 'web_attr_3', 'https://weibo.com/', 'web', '', 'cn', '0', '1551925547');
INSERT INTO `ey_config` VALUES ('95', 'web_attr_4', '400-123-4567', 'web', '', 'cn', '0', '1551925729');
INSERT INTO `ey_config` VALUES ('96', 'web_attr_5', '广东省广州市天河区88号', 'web', '', 'cn', '0', '1551926026');
INSERT INTO `ey_config` VALUES ('97', 'web_attr_6', 'admin@qq.com', 'web', '', 'cn', '0', '1570976539');
INSERT INTO `ey_config` VALUES ('98', 'web_attr_7', '+86-123-4567', 'web', '', 'cn', '0', '1551926069');
INSERT INTO `ey_config` VALUES ('99', 'system_version', 'v1.3.9', 'system', '', 'cn', '0', '1570964022');
INSERT INTO `ey_config` VALUES ('100', 'system_upgrade_filelist', 'YXBwbGljYXRpb24vcGx1Z2lucy9odG1sLnBocDxicj5hcHBsaWNhdGlvbi9jb21tb24vbG9naWMvQXJjdHlwZUxvZ2ljLnBocA==', 'system', '', 'cn', '0', '1589873137');
INSERT INTO `ey_config` VALUES ('101', 'smtp_syn_weapp', '1', 'smtp', '', 'cn', '0', '1570963932');
INSERT INTO `ey_config` VALUES ('102', 'php_eyou_blacklist', '', 'php', '', 'cn', '0', '1570963997');
INSERT INTO `ey_config` VALUES ('103', 'system_auth_code', '!*&^eyoucms<>|?', 'system', '', 'cn', '0', '1570964003');
INSERT INTO `ey_config` VALUES ('104', 'system_robots_edit', '1', 'system', '', 'cn', '0', '1570964230');
INSERT INTO `ey_config` VALUES ('105', 'system_synleveldata', '1', 'system', '', 'cn', '0', '1570964230');
INSERT INTO `ey_config` VALUES ('106', 'system_correctarctypedirpath', '1', 'system', '', 'cn', '0', '1570976417');
INSERT INTO `ey_config` VALUES ('107', 'sitemap_changefreq_index', 'always', 'sitemap', '', 'cn', '0', '1570976437');
INSERT INTO `ey_config` VALUES ('108', 'sitemap_changefreq_list', 'hourly', 'sitemap', '', 'cn', '0', '1570976437');
INSERT INTO `ey_config` VALUES ('109', 'sitemap_changefreq_view', 'daily', 'sitemap', '', 'cn', '0', '1570976437');
INSERT INTO `ey_config` VALUES ('110', 'sitemap_priority_index', '1.0', 'sitemap', '', 'cn', '0', '1570976437');
INSERT INTO `ey_config` VALUES ('111', 'sitemap_priority_list', '0.8', 'sitemap', '', 'cn', '0', '1570976437');
INSERT INTO `ey_config` VALUES ('112', 'sitemap_priority_view', '0.5', 'sitemap', '', 'cn', '0', '1570976437');

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
-- Table structure for `ey_download_attr_field`
-- -----------------------------
DROP TABLE IF EXISTS `ey_download_attr_field`;
CREATE TABLE `ey_download_attr_field` (
  `field_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `field_name` varchar(32) DEFAULT '' COMMENT '字段名称',
  `field_title` varchar(32) DEFAULT '' COMMENT '字段标题',
  `field_use` tinyint(1) DEFAULT '0' COMMENT '字段是否使用，0未使用，1为使用',
  `sort_order` smallint(5) DEFAULT '0' COMMENT '排序',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) unsigned DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='上传文件属性表';

-- -----------------------------
-- Records of `ey_download_attr_field`
-- -----------------------------
INSERT INTO `ey_download_attr_field` VALUES ('1', 'extract_code', '提取码', '1', '1', 'cn', '1561001807', '1561024954');
INSERT INTO `ey_download_attr_field` VALUES ('2', 'server_name', '服务器名称', '1', '2', 'cn', '1561001807', '1561078673');

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
  `extract_code` varchar(20) DEFAULT '' COMMENT '文件提取码',
  `file_size` varchar(255) DEFAULT '' COMMENT '文件大小',
  `file_ext` varchar(50) DEFAULT '' COMMENT '文件后缀名',
  `file_name` varchar(200) DEFAULT '' COMMENT '文件名',
  `file_mime` varchar(200) DEFAULT '' COMMENT '文件类型',
  `uhash` varchar(200) DEFAULT '' COMMENT '自定义的一种加密方式，用于文件下载权限验证',
  `md5file` varchar(200) DEFAULT '' COMMENT 'md5_file加密，可以检测上传/下载的文件包是否损坏',
  `is_remote` tinyint(1) DEFAULT '0' COMMENT '是否远程',
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
INSERT INTO `ey_field_type` VALUES ('region', '区域类型', '1', '6', '1532485708', '1532485708');

-- -----------------------------
-- Table structure for `ey_guestbook`
-- -----------------------------
DROP TABLE IF EXISTS `ey_guestbook`;
CREATE TABLE `ey_guestbook` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `typeid` int(11) DEFAULT '0' COMMENT '栏目ID',
  `channel` smallint(5) DEFAULT '0' COMMENT '模型ID',
  `md5data` varchar(50) DEFAULT '' COMMENT '数据序列化之后的MD5加密，提交内容的唯一性',
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
  `intro` varchar(2000) DEFAULT '' COMMENT '图集描述',
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
  `intro` varchar(2000) DEFAULT '' COMMENT '图集描述',
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
INSERT INTO `ey_product_img` VALUES ('1', '11', '恒大御海天下', '/uploads/allimg/20190307/9b619312512425c4cca099500bc7d622.jpg', '', '700', '430', '0', 'image/jpeg', '1', '1551930369');
INSERT INTO `ey_product_img` VALUES ('2', '11', '恒大御海天下', '/uploads/allimg/20190307/b48587a378c01166f34736cba9c5f50c.jpg', '', '700', '430', '0', 'image/jpeg', '2', '1551930369');
INSERT INTO `ey_product_img` VALUES ('3', '11', '恒大御海天下', '/uploads/allimg/20190307/b5985ba428e208714913c66514c2042e.jpg', '', '700', '430', '0', 'image/jpeg', '3', '1551930369');
INSERT INTO `ey_product_img` VALUES ('4', '11', '恒大御海天下', '/uploads/allimg/20190307/5d5734a27ba166915b1df9fe800db227.jpg', '', '700', '430', '0', 'image/jpeg', '4', '1551930369');
INSERT INTO `ey_product_img` VALUES ('5', '12', '绿城桃李春风别墅', '/uploads/allimg/20190307/e279e0fa1cfcabde04a64fa692aea425.jpg', '', '700', '430', '0', 'image/jpeg', '1', '1551930551');
INSERT INTO `ey_product_img` VALUES ('6', '12', '绿城桃李春风别墅', '/uploads/allimg/20190307/f63bf5d588ab1c0cba2b52f0d83dbb41.jpg', '', '700', '430', '0', 'image/jpeg', '2', '1551930551');
INSERT INTO `ey_product_img` VALUES ('7', '12', '绿城桃李春风别墅', '/uploads/allimg/20190307/e17f64145b39a42a4dc01968396b8786.jpg', '', '700', '430', '0', 'image/jpeg', '3', '1551930551');
INSERT INTO `ey_product_img` VALUES ('8', '12', '绿城桃李春风别墅', '/uploads/allimg/20190307/a325a54eff7266cc96e7045af6ec3dfe.jpg', '', '700', '430', '0', 'image/jpeg', '4', '1551930551');
INSERT INTO `ey_product_img` VALUES ('16', '13', '南国威尼斯城别墅', '/uploads/allimg/20190307/21e6b232de34661cf0c633a501b2a9ef.jpg', '', '700', '430', '0', 'image/jpeg', '4', '1551930689');
INSERT INTO `ey_product_img` VALUES ('15', '13', '南国威尼斯城别墅', '/uploads/allimg/20190307/828d54ae8b0ce08d6dbd4e878cd9214c.jpg', '', '700', '430', '0', 'image/jpeg', '3', '1551930689');
INSERT INTO `ey_product_img` VALUES ('14', '13', '南国威尼斯城别墅', '/uploads/allimg/20190307/75e2a6448206b8983f2a2d352ae8b434.jpg', '', '700', '430', '0', 'image/jpeg', '2', '1551930689');
INSERT INTO `ey_product_img` VALUES ('13', '13', '南国威尼斯城别墅', '/uploads/allimg/20190307/f32c93ec16aa23fee1ebe881ef2675b8.jpg', '', '700', '430', '0', 'image/jpeg', '1', '1551930689');
INSERT INTO `ey_product_img` VALUES ('17', '14', '碧桂园中央半岛别墅', '/uploads/allimg/20190307/d95a0071a4eda89925ea781523dd5d75.jpg', '', '700', '430', '0', 'image/jpeg', '1', '1551930755');
INSERT INTO `ey_product_img` VALUES ('18', '14', '碧桂园中央半岛别墅', '/uploads/allimg/20190307/04ef8081849d913642a3efab6f2292d4.jpg', '', '700', '430', '0', 'image/jpeg', '2', '1551930755');
INSERT INTO `ey_product_img` VALUES ('19', '14', '碧桂园中央半岛别墅', '/uploads/allimg/20190307/fc7eeecfe64abb6143efc92c6998872b.jpg', '', '700', '430', '0', 'image/jpeg', '3', '1551930755');
INSERT INTO `ey_product_img` VALUES ('20', '14', '碧桂园中央半岛别墅', '/uploads/allimg/20190307/dbeca713de99e0b4c7042568a779f151.jpg', '', '700', '430', '0', 'image/jpeg', '4', '1551930755');
INSERT INTO `ey_product_img` VALUES ('28', '15', '耀江西岸公馆别墅', '/uploads/allimg/20190307/1547666f89ddadee42447fe34c9b3bff.jpg', '', '700', '430', '0', 'image/jpeg', '4', '1551930824');
INSERT INTO `ey_product_img` VALUES ('27', '15', '耀江西岸公馆别墅', '/uploads/allimg/20190307/93575d56f5cc68069d02cfdefb15c5c5.jpg', '', '700', '430', '0', 'image/jpeg', '3', '1551930824');
INSERT INTO `ey_product_img` VALUES ('26', '15', '耀江西岸公馆别墅', '/uploads/allimg/20190307/2c30d16c7a0005e1b98ac8b39e78c262.jpg', '', '700', '430', '0', 'image/jpeg', '2', '1551930824');
INSERT INTO `ey_product_img` VALUES ('25', '15', '耀江西岸公馆别墅', '/uploads/allimg/20190307/26e4c9dda1766e1d28a61dd08ada3518.jpg', '', '700', '430', '0', 'image/jpeg', '1', '1551930824');
INSERT INTO `ey_product_img` VALUES ('29', '16', '富力盈溪谷先生的院子别墅', '/uploads/allimg/20190307/08d1c5a31f54e685c2b1ce2538afe64a.jpg', '', '700', '430', '0', 'image/jpeg', '1', '1551930906');
INSERT INTO `ey_product_img` VALUES ('30', '16', '富力盈溪谷先生的院子别墅', '/uploads/allimg/20190307/f83ec160c7018cd54308405503fca86c.jpg', '', '700', '430', '0', 'image/jpeg', '2', '1551930906');
INSERT INTO `ey_product_img` VALUES ('31', '16', '富力盈溪谷先生的院子别墅', '/uploads/allimg/20190307/1f26170a2f466156bb79457d21735a52.jpg', '', '700', '430', '0', 'image/jpeg', '3', '1551930906');
INSERT INTO `ey_product_img` VALUES ('32', '16', '富力盈溪谷先生的院子别墅', '/uploads/allimg/20190307/46823f388f4d1e1197b071518a07dadf.jpg', '', '700', '430', '0', 'image/jpeg', '4', '1551930906');
INSERT INTO `ey_product_img` VALUES ('33', '17', '融创观澜湖公园壹号', '/uploads/allimg/20190307/ed156b381578787bc788d3b0c99eba56.jpg', '', '700', '430', '0', 'image/jpeg', '1', '1551931054');
INSERT INTO `ey_product_img` VALUES ('34', '17', '融创观澜湖公园壹号', '/uploads/allimg/20190307/7da3dd8e5a9c086108ed34405ef98e4c.jpg', '', '700', '430', '0', 'image/jpeg', '2', '1551931054');
INSERT INTO `ey_product_img` VALUES ('35', '17', '融创观澜湖公园壹号', '/uploads/allimg/20190307/b0bfa125e00ee081a8dd7c2e7cd35d51.jpg', '', '700', '430', '0', 'image/jpeg', '3', '1551931054');
INSERT INTO `ey_product_img` VALUES ('36', '17', '融创观澜湖公园壹号', '/uploads/allimg/20190307/3473bf197bebdc3fcdf4824baa4cb9d6.jpg', '', '700', '430', '0', 'image/jpeg', '4', '1551931054');
INSERT INTO `ey_product_img` VALUES ('37', '18', '景园悦海湾 ', '/uploads/allimg/20190307/2cce8faa63fe32b775f8d830e2eb2dc4.jpg', '', '700', '430', '0', 'image/jpeg', '1', '1551931205');
INSERT INTO `ey_product_img` VALUES ('38', '18', '景园悦海湾 ', '/uploads/allimg/20190307/8ad164a6c2df4542feae2c39bd58039f.jpg', '', '700', '430', '0', 'image/jpeg', '2', '1551931205');
INSERT INTO `ey_product_img` VALUES ('39', '18', '景园悦海湾 ', '/uploads/allimg/20190307/cb87f607702b241e5a0c32990c769af0.jpg', '', '700', '430', '0', 'image/jpeg', '3', '1551931205');
INSERT INTO `ey_product_img` VALUES ('40', '18', '景园悦海湾 ', '/uploads/allimg/20190307/503670d22197bdf4bf751e0f60112163.jpg', '', '700', '430', '0', 'image/jpeg', '4', '1551931205');
INSERT INTO `ey_product_img` VALUES ('41', '19', '富力悦海湾别墅', '/uploads/allimg/20190307/54603ffa98bb220b6b9a76fefb170683.jpg', '', '700', '430', '0', 'image/jpeg', '1', '1551931267');
INSERT INTO `ey_product_img` VALUES ('42', '19', '富力悦海湾别墅', '/uploads/allimg/20190307/cbef8cbfe233da7b387b3cd64bf0eee1.jpg', '', '700', '430', '0', 'image/jpeg', '2', '1551931267');
INSERT INTO `ey_product_img` VALUES ('43', '19', '富力悦海湾别墅', '/uploads/allimg/20190307/6152a4feaffb3035623efd31d5586e20.jpg', '', '700', '430', '0', 'image/jpeg', '3', '1551931267');
INSERT INTO `ey_product_img` VALUES ('44', '19', '富力悦海湾别墅', '/uploads/allimg/20190307/8fc27ee33f53825feccafffa59592aa2.jpg', '', '700', '430', '0', 'image/jpeg', '4', '1551931267');
INSERT INTO `ey_product_img` VALUES ('45', '20', '恒大御海天下 ', '/uploads/allimg/20190307/ebe14d3d4836fb9c0fe92cc1aa104048.jpg', '', '700', '430', '0', 'image/jpeg', '1', '1551931349');
INSERT INTO `ey_product_img` VALUES ('46', '20', '恒大御海天下 ', '/uploads/allimg/20190307/8c41e760547e948cf9cde55cb3d07c2d.jpg', '', '700', '430', '0', 'image/jpeg', '2', '1551931349');
INSERT INTO `ey_product_img` VALUES ('47', '20', '恒大御海天下 ', '/uploads/allimg/20190307/06a044da44396329822bfbb66d453e89.jpg', '', '700', '430', '0', 'image/jpeg', '3', '1551931349');
INSERT INTO `ey_product_img` VALUES ('48', '20', '恒大御海天下 ', '/uploads/allimg/20190307/c67575fc52067cdfe488051841030e53.jpg', '', '700', '430', '0', 'image/jpeg', '4', '1551931349');
INSERT INTO `ey_product_img` VALUES ('49', '21', '融创美伦熙语 ', '/uploads/allimg/20190307/6fc5d472eab8ac1440b5245a8f775fd7.jpg', '', '700', '430', '0', 'image/jpeg', '1', '1551931415');
INSERT INTO `ey_product_img` VALUES ('50', '21', '融创美伦熙语 ', '/uploads/allimg/20190307/cae3ab0d313fbab22bb4fa68f0ac81ef.jpg', '', '700', '430', '0', 'image/jpeg', '2', '1551931415');
INSERT INTO `ey_product_img` VALUES ('51', '21', '融创美伦熙语 ', '/uploads/allimg/20190307/3f0e0596629be1d38d4a6f23b95a65c3.jpg', '', '700', '430', '0', 'image/jpeg', '3', '1551931415');
INSERT INTO `ey_product_img` VALUES ('52', '21', '融创美伦熙语 ', '/uploads/allimg/20190307/f81caf8e8f80c92b1ac9686b9a871c50.jpg', '', '700', '430', '0', 'image/jpeg', '4', '1551931415');
INSERT INTO `ey_product_img` VALUES ('53', '22', '星华海岸城 ', '/uploads/allimg/20190307/0fc139a495099a7ca8d7282d880a7a4f.jpg', '', '700', '430', '0', 'image/jpeg', '1', '1551931475');
INSERT INTO `ey_product_img` VALUES ('54', '22', '星华海岸城 ', '/uploads/allimg/20190307/ad0935193e0da8001af5484db4b45267.jpg', '', '700', '430', '0', 'image/jpeg', '2', '1551931475');
INSERT INTO `ey_product_img` VALUES ('55', '22', '星华海岸城 ', '/uploads/allimg/20190307/19c016c4f418d79769a8255c73f72432.jpg', '', '700', '430', '0', 'image/jpeg', '3', '1551931475');
INSERT INTO `ey_product_img` VALUES ('56', '22', '星华海岸城 ', '/uploads/allimg/20190307/d1bd74f46fec155a2cdae4f524017c69.jpg', '', '700', '430', '0', 'image/jpeg', '4', '1551931475');
INSERT INTO `ey_product_img` VALUES ('57', '23', '雅居乐金沙湾 ', '/uploads/allimg/20190307/d3358b9d6c9bce8d635ca290e612708e.jpg', '', '700', '430', '0', 'image/jpeg', '1', '1551931586');
INSERT INTO `ey_product_img` VALUES ('58', '23', '雅居乐金沙湾 ', '/uploads/allimg/20190307/23626bf16445c824566a77c84611b793.jpg', '', '700', '430', '0', 'image/jpeg', '2', '1551931586');
INSERT INTO `ey_product_img` VALUES ('59', '23', '雅居乐金沙湾 ', '/uploads/allimg/20190307/ec6be341022a7bdf20affff63f06af3c.jpg', '', '700', '430', '0', 'image/jpeg', '3', '1551931586');
INSERT INTO `ey_product_img` VALUES ('60', '23', '雅居乐金沙湾 ', '/uploads/allimg/20190307/0ce91d276aec1c7b6c7e37c822e0b707.jpg', '', '700', '430', '0', 'image/jpeg', '4', '1551931586');
INSERT INTO `ey_product_img` VALUES ('61', '24', '碧桂园剑桥郡 ', '/uploads/allimg/20190307/ceb1fa984750d5d6a8c03e600ec1452f.jpg', '', '700', '430', '0', 'image/jpeg', '1', '1551931652');
INSERT INTO `ey_product_img` VALUES ('62', '24', '碧桂园剑桥郡 ', '/uploads/allimg/20190307/6c16e2d9dfc1a1ae2564f43ee3cb9bdd.jpg', '', '700', '430', '0', 'image/jpeg', '2', '1551931652');
INSERT INTO `ey_product_img` VALUES ('63', '24', '碧桂园剑桥郡 ', '/uploads/allimg/20190307/d07c34fa905312783cb1b9dca4b76b36.jpg', '', '700', '430', '0', 'image/jpeg', '3', '1551931652');
INSERT INTO `ey_product_img` VALUES ('64', '24', '碧桂园剑桥郡 ', '/uploads/allimg/20190307/bd97bd1d2dfd703158db00265e31b4fb.jpg', '', '700', '430', '0', 'image/jpeg', '4', '1551931652');
INSERT INTO `ey_product_img` VALUES ('65', '25', '楠滨华庭', '/uploads/allimg/20190307/6c950ca66c0de49bae7bda5499108471.jpg', '', '700', '430', '0', 'image/jpeg', '1', '1551931722');
INSERT INTO `ey_product_img` VALUES ('66', '25', '楠滨华庭', '/uploads/allimg/20190307/9f586a74a5b8a5b7373cce0f98872f28.jpg', '', '700', '430', '0', 'image/jpeg', '2', '1551931722');
INSERT INTO `ey_product_img` VALUES ('67', '25', '楠滨华庭', '/uploads/allimg/20190307/152b19941ce7636dbc000ddf41bb504f.jpg', '', '700', '430', '0', 'image/jpeg', '3', '1551931722');
INSERT INTO `ey_product_img` VALUES ('68', '25', '楠滨华庭', '/uploads/allimg/20190307/3ad29f95113b7ebe9a8d4484287d83d4.jpg', '', '700', '430', '0', 'image/jpeg', '4', '1551931722');
INSERT INTO `ey_product_img` VALUES ('69', '26', '中盟椰海国际', '/uploads/allimg/20190307/f3285280d581ca224b09c63018c0870e.jpg', '', '700', '430', '0', 'image/jpeg', '1', '1551931779');
INSERT INTO `ey_product_img` VALUES ('70', '26', '中盟椰海国际', '/uploads/allimg/20190307/4e9c32d734e29f5f0f7a3744ba82dc05.jpg', '', '700', '430', '0', 'image/jpeg', '2', '1551931779');
INSERT INTO `ey_product_img` VALUES ('71', '26', '中盟椰海国际', '/uploads/allimg/20190307/461db9b9b715050d44f71b47e887d7ff.jpg', '', '700', '430', '0', 'image/jpeg', '3', '1551931779');
INSERT INTO `ey_product_img` VALUES ('72', '26', '中盟椰海国际', '/uploads/allimg/20190307/16b9ab37de1548c0bf847ea5afdc0336.jpg', '', '700', '430', '0', 'image/jpeg', '4', '1551931779');
INSERT INTO `ey_product_img` VALUES ('73', '27', '阳光椰风苑', '/uploads/allimg/20190307/83d3d1fa14e1ffe4a0c58ed38ccb008e.jpg', '', '700', '430', '0', 'image/jpeg', '1', '1551931839');
INSERT INTO `ey_product_img` VALUES ('74', '27', '阳光椰风苑', '/uploads/allimg/20190307/55d801a2d4f6edc3bf558ab56c843a2f.jpg', '', '700', '430', '0', 'image/jpeg', '2', '1551931839');
INSERT INTO `ey_product_img` VALUES ('75', '27', '阳光椰风苑', '/uploads/allimg/20190307/84c22f308145ae4d49f9fa22b035c1ca.jpg', '', '700', '430', '0', 'image/jpeg', '3', '1551931839');
INSERT INTO `ey_product_img` VALUES ('76', '27', '阳光椰风苑', '/uploads/allimg/20190307/c0e19f746d0dbc375892bab65fe874bb.jpg', '', '700', '430', '0', 'image/jpeg', '4', '1551931839');
INSERT INTO `ey_product_img` VALUES ('77', '28', '恩祥新城 ', '/uploads/allimg/20190307/abb34d4311adeff427b77878cd8a0b1c.jpg', '', '700', '430', '0', 'image/jpeg', '1', '1551931911');
INSERT INTO `ey_product_img` VALUES ('78', '28', '恩祥新城 ', '/uploads/allimg/20190307/bb29c8ef37810a7fad1afb814d457868.jpg', '', '700', '430', '0', 'image/jpeg', '2', '1551931911');
INSERT INTO `ey_product_img` VALUES ('79', '28', '恩祥新城 ', '/uploads/allimg/20190307/5ff0338b6ad1aa853e35ef91c996cfa8.jpg', '', '700', '430', '0', 'image/jpeg', '3', '1551931911');
INSERT INTO `ey_product_img` VALUES ('80', '28', '恩祥新城 ', '/uploads/allimg/20190307/265050b7c1976c38c26578b183372aba.jpg', '', '700', '430', '0', 'image/jpeg', '4', '1551931911');

-- -----------------------------
-- Table structure for `ey_product_spec_data`
-- -----------------------------
DROP TABLE IF EXISTS `ey_product_spec_data`;
CREATE TABLE `ey_product_spec_data` (
  `spec_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `aid` int(10) DEFAULT '0' COMMENT '产品ID',
  `spec_mark_id` int(10) DEFAULT '0' COMMENT '规格标记ID',
  `spec_name` varchar(100) DEFAULT '' COMMENT '规格名称',
  `spec_value_id` int(10) DEFAULT '0' COMMENT '规格值ID',
  `spec_value` varchar(100) DEFAULT '' COMMENT '规格值',
  `spec_is_select` tinyint(1) DEFAULT '0' COMMENT '是否选中（0=否，1=是）',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`spec_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品规格数据表';


-- -----------------------------
-- Table structure for `ey_product_spec_preset`
-- -----------------------------
DROP TABLE IF EXISTS `ey_product_spec_preset`;
CREATE TABLE `ey_product_spec_preset` (
  `preset_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `preset_mark_id` int(10) DEFAULT '0' COMMENT '预设参数标记ID',
  `preset_name` varchar(100) DEFAULT '' COMMENT '规格名称',
  `preset_value` varchar(100) DEFAULT '' COMMENT '规格值',
  `sort_order` int(10) DEFAULT '100' COMMENT '排序号',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`preset_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='产品规格预设表';

-- -----------------------------
-- Records of `ey_product_spec_preset`
-- -----------------------------
INSERT INTO `ey_product_spec_preset` VALUES ('1', '1', '产品颜色', '红', '100', 'cn', '1565752372', '1565752623');
INSERT INTO `ey_product_spec_preset` VALUES ('2', '1', '产品颜色', '蓝', '100', 'cn', '1565752372', '1565752623');
INSERT INTO `ey_product_spec_preset` VALUES ('3', '1', '产品颜色', '黄', '100', 'cn', '1565752372', '1565752623');

-- -----------------------------
-- Table structure for `ey_product_spec_value`
-- -----------------------------
DROP TABLE IF EXISTS `ey_product_spec_value`;
CREATE TABLE `ey_product_spec_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `aid` int(10) NOT NULL DEFAULT '0' COMMENT '产品ID',
  `spec_value_id` varchar(100) NOT NULL DEFAULT '' COMMENT '规格值ID',
  `spec_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '规格价格',
  `spec_stock` int(10) NOT NULL DEFAULT '0' COMMENT '规格库存',
  `spec_sales_num` int(10) NOT NULL DEFAULT '0' COMMENT '销售量',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品多规格组装表';


-- -----------------------------
-- Table structure for `ey_region`
-- -----------------------------
DROP TABLE IF EXISTS `ey_region`;
CREATE TABLE `ey_region` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `name` varchar(32) DEFAULT '' COMMENT '地区名称',
  `level` tinyint(4) DEFAULT '0' COMMENT '地区等级 分省市县区',
  `parent_id` int(10) DEFAULT '0' COMMENT '父id',
  `initial` varchar(5) DEFAULT '' COMMENT '首字母',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `level` (`level`) USING BTREE,
  KEY `initial` (`initial`)
) ENGINE=MyISAM AUTO_INCREMENT=47929 DEFAULT CHARSET=utf8 COMMENT='区域表';

-- -----------------------------
-- Records of `ey_region`
-- -----------------------------
INSERT INTO `ey_region` VALUES ('1', '北京市', '1', '0', 'B');
INSERT INTO `ey_region` VALUES ('2', '市辖区', '2', '1', 'S');
INSERT INTO `ey_region` VALUES ('3', '东城区', '3', '2', 'D');
INSERT INTO `ey_region` VALUES ('14', '西城区', '3', '2', 'X');
INSERT INTO `ey_region` VALUES ('22', '崇文区', '3', '2', 'C');
INSERT INTO `ey_region` VALUES ('30', '宣武区', '3', '2', 'X');
INSERT INTO `ey_region` VALUES ('39', '朝阳区', '3', '2', 'C');
INSERT INTO `ey_region` VALUES ('83', '丰台区', '3', '2', 'F');
INSERT INTO `ey_region` VALUES ('105', '石景山区', '3', '2', 'S');
INSERT INTO `ey_region` VALUES ('115', '海淀区', '3', '2', 'H');
INSERT INTO `ey_region` VALUES ('145', '门头沟区', '3', '2', 'M');
INSERT INTO `ey_region` VALUES ('159', '房山区', '3', '2', 'F');
INSERT INTO `ey_region` VALUES ('188', '通州区', '3', '2', 'T');
INSERT INTO `ey_region` VALUES ('204', '顺义区', '3', '2', 'S');
INSERT INTO `ey_region` VALUES ('227', '昌平区', '3', '2', 'C');
INSERT INTO `ey_region` VALUES ('245', '大兴区', '3', '2', 'D');
INSERT INTO `ey_region` VALUES ('264', '怀柔区', '3', '2', 'H');
INSERT INTO `ey_region` VALUES ('281', '平谷区', '3', '2', 'P');
INSERT INTO `ey_region` VALUES ('300', '县', '2', '1', 'X');
INSERT INTO `ey_region` VALUES ('301', '密云县', '3', '300', 'M');
INSERT INTO `ey_region` VALUES ('322', '延庆县', '3', '300', 'Y');
INSERT INTO `ey_region` VALUES ('338', '天津市', '1', '0', 'T');
INSERT INTO `ey_region` VALUES ('339', '市辖区', '2', '338', 'S');
INSERT INTO `ey_region` VALUES ('340', '和平区', '3', '339', 'H');
INSERT INTO `ey_region` VALUES ('347', '河东区', '3', '339', 'H');
INSERT INTO `ey_region` VALUES ('361', '河西区', '3', '339', 'H');
INSERT INTO `ey_region` VALUES ('375', '南开区', '3', '339', 'N');
INSERT INTO `ey_region` VALUES ('388', '河北区', '3', '339', 'H');
INSERT INTO `ey_region` VALUES ('399', '红桥区', '3', '339', 'H');
INSERT INTO `ey_region` VALUES ('410', '塘沽区', '3', '339', 'T');
INSERT INTO `ey_region` VALUES ('425', '汉沽区', '3', '339', 'H');
INSERT INTO `ey_region` VALUES ('435', '大港区', '3', '339', 'D');
INSERT INTO `ey_region` VALUES ('445', '东丽区', '3', '339', 'D');
INSERT INTO `ey_region` VALUES ('460', '西青区', '3', '339', 'X');
INSERT INTO `ey_region` VALUES ('473', '津南区', '3', '339', 'J');
INSERT INTO `ey_region` VALUES ('488', '北辰区', '3', '339', 'B');
INSERT INTO `ey_region` VALUES ('504', '武清区', '3', '339', 'W');
INSERT INTO `ey_region` VALUES ('538', '宝坻区', '3', '339', 'B');
INSERT INTO `ey_region` VALUES ('569', '市辖县', '2', '338', 'S');
INSERT INTO `ey_region` VALUES ('570', '宁河县', '3', '569', 'N');
INSERT INTO `ey_region` VALUES ('586', '静海县', '3', '569', 'J');
INSERT INTO `ey_region` VALUES ('608', '蓟县', '3', '569', 'J');
INSERT INTO `ey_region` VALUES ('636', '河北省', '1', '0', 'H');
INSERT INTO `ey_region` VALUES ('637', '石家庄市', '2', '636', 'S');
INSERT INTO `ey_region` VALUES ('638', '市辖区', '3', '637', 'S');
INSERT INTO `ey_region` VALUES ('639', '长安区', '3', '637', 'C');
INSERT INTO `ey_region` VALUES ('651', '桥东区', '3', '637', 'Q');
INSERT INTO `ey_region` VALUES ('662', '桥西区', '3', '637', 'Q');
INSERT INTO `ey_region` VALUES ('675', '新华区', '3', '637', 'X');
INSERT INTO `ey_region` VALUES ('691', '井陉矿区', '3', '637', 'J');
INSERT INTO `ey_region` VALUES ('697', '裕华区', '3', '637', 'Y');
INSERT INTO `ey_region` VALUES ('708', '井陉县', '3', '637', 'J');
INSERT INTO `ey_region` VALUES ('726', '正定县', '3', '637', 'Z');
INSERT INTO `ey_region` VALUES ('736', '栾城县', '3', '637', 'L');
INSERT INTO `ey_region` VALUES ('745', '行唐县', '3', '637', 'X');
INSERT INTO `ey_region` VALUES ('761', '灵寿县', '3', '637', 'L');
INSERT INTO `ey_region` VALUES ('777', '高邑县', '3', '637', 'G');
INSERT INTO `ey_region` VALUES ('783', '深泽县', '3', '637', 'S');
INSERT INTO `ey_region` VALUES ('790', '赞皇县', '3', '637', 'Z');
INSERT INTO `ey_region` VALUES ('802', '无极县', '3', '637', 'W');
INSERT INTO `ey_region` VALUES ('814', '平山县', '3', '637', 'P');
INSERT INTO `ey_region` VALUES ('838', '元氏县', '3', '637', 'Y');
INSERT INTO `ey_region` VALUES ('854', '赵县', '3', '637', 'Z');
INSERT INTO `ey_region` VALUES ('866', '辛集市', '3', '637', 'X');
INSERT INTO `ey_region` VALUES ('882', '藁城市', '3', '637', 'G');
INSERT INTO `ey_region` VALUES ('898', '晋州市', '3', '637', 'J');
INSERT INTO `ey_region` VALUES ('909', '新乐市', '3', '637', 'X');
INSERT INTO `ey_region` VALUES ('922', '鹿泉市', '3', '637', 'L');
INSERT INTO `ey_region` VALUES ('936', '唐山市', '2', '636', 'T');
INSERT INTO `ey_region` VALUES ('937', '市辖区', '3', '936', 'S');
INSERT INTO `ey_region` VALUES ('938', '路南区', '3', '936', 'L');
INSERT INTO `ey_region` VALUES ('952', '路北区', '3', '936', 'L');
INSERT INTO `ey_region` VALUES ('965', '古冶区', '3', '936', 'G');
INSERT INTO `ey_region` VALUES ('977', '开平区', '3', '936', 'K');
INSERT INTO `ey_region` VALUES ('989', '丰南区', '3', '936', 'F');
INSERT INTO `ey_region` VALUES ('1007', '丰润区', '3', '936', 'F');
INSERT INTO `ey_region` VALUES ('1034', '滦县', '3', '936', 'L');
INSERT INTO `ey_region` VALUES ('1048', '滦南县', '3', '936', 'L');
INSERT INTO `ey_region` VALUES ('1067', '乐亭县', '3', '936', 'L');
INSERT INTO `ey_region` VALUES ('1085', '迁西县', '3', '936', 'Q');
INSERT INTO `ey_region` VALUES ('1104', '玉田县', '3', '936', 'Y');
INSERT INTO `ey_region` VALUES ('1125', '唐海县', '3', '936', 'T');
INSERT INTO `ey_region` VALUES ('1140', '遵化市', '3', '936', 'Z');
INSERT INTO `ey_region` VALUES ('1168', '迁安市', '3', '936', 'Q');
INSERT INTO `ey_region` VALUES ('1188', '秦皇岛市', '2', '636', 'Q');
INSERT INTO `ey_region` VALUES ('1189', '市辖区', '3', '1188', 'S');
INSERT INTO `ey_region` VALUES ('1190', '海港区', '3', '1188', 'H');
INSERT INTO `ey_region` VALUES ('1208', '山海关区', '3', '1188', 'S');
INSERT INTO `ey_region` VALUES ('1218', '北戴河区', '3', '1188', 'B');
INSERT INTO `ey_region` VALUES ('1223', '青龙县', '3', '1188', 'Q');
INSERT INTO `ey_region` VALUES ('1249', '昌黎县', '3', '1188', 'C');
INSERT INTO `ey_region` VALUES ('1266', '抚宁县', '3', '1188', 'F');
INSERT INTO `ey_region` VALUES ('1278', '卢龙县', '3', '1188', 'L');
INSERT INTO `ey_region` VALUES ('1291', '邯郸市', '2', '636', 'H');
INSERT INTO `ey_region` VALUES ('1292', '市辖区', '3', '1291', 'S');
INSERT INTO `ey_region` VALUES ('1293', '邯山区', '3', '1291', 'H');
INSERT INTO `ey_region` VALUES ('1307', '丛台区', '3', '1291', 'C');
INSERT INTO `ey_region` VALUES ('1319', '复兴区', '3', '1291', 'F');
INSERT INTO `ey_region` VALUES ('1329', '峰峰矿区', '3', '1291', 'F');
INSERT INTO `ey_region` VALUES ('1339', '邯郸县', '3', '1291', 'H');
INSERT INTO `ey_region` VALUES ('1350', '临漳县', '3', '1291', 'L');
INSERT INTO `ey_region` VALUES ('1365', '成安县', '3', '1291', 'C');
INSERT INTO `ey_region` VALUES ('1375', '大名县', '3', '1291', 'D');
INSERT INTO `ey_region` VALUES ('1396', '涉县', '3', '1291', 'S');
INSERT INTO `ey_region` VALUES ('1414', '磁县', '3', '1291', 'C');
INSERT INTO `ey_region` VALUES ('1434', '肥乡县', '3', '1291', 'F');
INSERT INTO `ey_region` VALUES ('1444', '永年县', '3', '1291', 'Y');
INSERT INTO `ey_region` VALUES ('1465', '邱县', '3', '1291', 'Q');
INSERT INTO `ey_region` VALUES ('1473', '鸡泽县', '3', '1291', 'J');
INSERT INTO `ey_region` VALUES ('1481', '广平县', '3', '1291', 'G');
INSERT INTO `ey_region` VALUES ('1489', '馆陶县', '3', '1291', 'G');
INSERT INTO `ey_region` VALUES ('1498', '魏县', '3', '1291', 'W');
INSERT INTO `ey_region` VALUES ('1520', '曲周县', '3', '1291', 'Q');
INSERT INTO `ey_region` VALUES ('1531', '武安市', '3', '1291', 'W');
INSERT INTO `ey_region` VALUES ('1554', '邢台市', '2', '636', 'X');
INSERT INTO `ey_region` VALUES ('1555', '市辖区', '3', '1554', 'S');
INSERT INTO `ey_region` VALUES ('1556', '桥东区', '3', '1554', 'Q');
INSERT INTO `ey_region` VALUES ('1564', '桥西区', '3', '1554', 'Q');
INSERT INTO `ey_region` VALUES ('1572', '邢台县', '3', '1554', 'X');
INSERT INTO `ey_region` VALUES ('1593', '临城县', '3', '1554', 'L');
INSERT INTO `ey_region` VALUES ('1602', '内邱县', '3', '1554', 'N');
INSERT INTO `ey_region` VALUES ('1612', '柏乡县', '3', '1554', 'B');
INSERT INTO `ey_region` VALUES ('1619', '隆尧县', '3', '1554', 'L');
INSERT INTO `ey_region` VALUES ('1633', '任县', '3', '1554', 'R');
INSERT INTO `ey_region` VALUES ('1642', '南和县', '3', '1554', 'N');
INSERT INTO `ey_region` VALUES ('1651', '宁晋县', '3', '1554', 'N');
INSERT INTO `ey_region` VALUES ('1669', '巨鹿县', '3', '1554', 'J');
INSERT INTO `ey_region` VALUES ('1680', '新河县', '3', '1554', 'X');
INSERT INTO `ey_region` VALUES ('1687', '广宗县', '3', '1554', 'G');
INSERT INTO `ey_region` VALUES ('1696', '平乡县', '3', '1554', 'P');
INSERT INTO `ey_region` VALUES ('1704', '威县', '3', '1554', 'W');
INSERT INTO `ey_region` VALUES ('1721', '清河县', '3', '1554', 'Q');
INSERT INTO `ey_region` VALUES ('1728', '临西县', '3', '1554', 'L');
INSERT INTO `ey_region` VALUES ('1738', '南宫市', '3', '1554', 'N');
INSERT INTO `ey_region` VALUES ('1754', '沙河市', '3', '1554', 'S');
INSERT INTO `ey_region` VALUES ('1772', '保定市', '2', '636', 'B');
INSERT INTO `ey_region` VALUES ('1773', '市辖区', '3', '1772', 'S');
INSERT INTO `ey_region` VALUES ('1774', '新市区', '3', '1772', 'X');
INSERT INTO `ey_region` VALUES ('1787', '北市区', '3', '1772', 'B');
INSERT INTO `ey_region` VALUES ('1796', '南市区', '3', '1772', 'N');
INSERT INTO `ey_region` VALUES ('1806', '满城县', '3', '1772', 'M');
INSERT INTO `ey_region` VALUES ('1820', '清苑县', '3', '1772', 'Q');
INSERT INTO `ey_region` VALUES ('1839', '涞水县', '3', '1772', 'L');
INSERT INTO `ey_region` VALUES ('1856', '阜平县', '3', '1772', 'F');
INSERT INTO `ey_region` VALUES ('1870', '徐水县', '3', '1772', 'X');
INSERT INTO `ey_region` VALUES ('1885', '定兴县', '3', '1772', 'D');
INSERT INTO `ey_region` VALUES ('1902', '唐县', '3', '1772', 'T');
INSERT INTO `ey_region` VALUES ('1923', '高阳县', '3', '1772', 'G');
INSERT INTO `ey_region` VALUES ('1933', '容城县', '3', '1772', 'R');
INSERT INTO `ey_region` VALUES ('1942', '涞源县', '3', '1772', 'L');
INSERT INTO `ey_region` VALUES ('1960', '望都县', '3', '1772', 'W');
INSERT INTO `ey_region` VALUES ('1969', '安新县', '3', '1772', 'A');
INSERT INTO `ey_region` VALUES ('1982', '易县', '3', '1772', 'Y');
INSERT INTO `ey_region` VALUES ('2010', '曲阳县', '3', '1772', 'Q');
INSERT INTO `ey_region` VALUES ('2029', '蠡县', '3', '1772', 'L');
INSERT INTO `ey_region` VALUES ('2043', '顺平县', '3', '1772', 'S');
INSERT INTO `ey_region` VALUES ('2054', '博野县', '3', '1772', 'B');
INSERT INTO `ey_region` VALUES ('2062', '雄县', '3', '1772', 'X');
INSERT INTO `ey_region` VALUES ('2072', '涿州市', '3', '1772', 'Z');
INSERT INTO `ey_region` VALUES ('2088', '定州市', '3', '1772', 'D');
INSERT INTO `ey_region` VALUES ('2114', '安国市', '3', '1772', 'A');
INSERT INTO `ey_region` VALUES ('2126', '高碑店市', '3', '1772', 'G');
INSERT INTO `ey_region` VALUES ('2142', '张家口市', '2', '636', 'Z');
INSERT INTO `ey_region` VALUES ('2143', '市辖区', '3', '2142', 'S');
INSERT INTO `ey_region` VALUES ('2144', '桥东区', '3', '2142', 'Q');
INSERT INTO `ey_region` VALUES ('2154', '桥西区', '3', '2142', 'Q');
INSERT INTO `ey_region` VALUES ('2164', '宣化区', '3', '2142', 'X');
INSERT INTO `ey_region` VALUES ('2176', '下花园区', '3', '2142', 'X');
INSERT INTO `ey_region` VALUES ('2183', '宣化县', '3', '2142', 'X');
INSERT INTO `ey_region` VALUES ('2198', '张北县', '3', '2142', 'Z');
INSERT INTO `ey_region` VALUES ('2220', '康保县', '3', '2142', 'K');
INSERT INTO `ey_region` VALUES ('2237', '沽源县', '3', '2142', 'G');
INSERT INTO `ey_region` VALUES ('2256', '尚义县', '3', '2142', 'S');
INSERT INTO `ey_region` VALUES ('2271', '蔚县', '3', '2142', 'W');
INSERT INTO `ey_region` VALUES ('2294', '阳原县', '3', '2142', 'Y');
INSERT INTO `ey_region` VALUES ('2309', '怀安县', '3', '2142', 'H');
INSERT INTO `ey_region` VALUES ('2321', '万全县', '3', '2142', 'W');
INSERT INTO `ey_region` VALUES ('2333', '怀来县', '3', '2142', 'H');
INSERT INTO `ey_region` VALUES ('2351', '涿鹿县', '3', '2142', 'Z');
INSERT INTO `ey_region` VALUES ('2369', '赤城县', '3', '2142', 'C');
INSERT INTO `ey_region` VALUES ('2388', '崇礼县', '3', '2142', 'C');
INSERT INTO `ey_region` VALUES ('2400', '承德市', '2', '636', 'C');
INSERT INTO `ey_region` VALUES ('2401', '市辖区', '3', '2400', 'S');
INSERT INTO `ey_region` VALUES ('2402', '双桥区', '3', '2400', 'S');
INSERT INTO `ey_region` VALUES ('2415', '双滦区', '3', '2400', 'S');
INSERT INTO `ey_region` VALUES ('2422', '鹰手营子矿区', '3', '2400', 'Y');
INSERT INTO `ey_region` VALUES ('2427', '承德县', '3', '2400', 'C');
INSERT INTO `ey_region` VALUES ('2453', '兴隆县', '3', '2400', 'X');
INSERT INTO `ey_region` VALUES ('2474', '平泉县', '3', '2400', 'P');
INSERT INTO `ey_region` VALUES ('2494', '滦平县', '3', '2400', 'L');
INSERT INTO `ey_region` VALUES ('2517', '隆化县', '3', '2400', 'L');
INSERT INTO `ey_region` VALUES ('2543', '丰宁县', '3', '2400', 'F');
INSERT INTO `ey_region` VALUES ('2570', '宽城县', '3', '2400', 'K');
INSERT INTO `ey_region` VALUES ('2589', '围场县', '3', '2400', 'W');
INSERT INTO `ey_region` VALUES ('2629', '沧州市', '2', '636', 'C');
INSERT INTO `ey_region` VALUES ('2630', '市辖区', '3', '2629', 'S');
INSERT INTO `ey_region` VALUES ('2631', '新华区', '3', '2629', 'X');
INSERT INTO `ey_region` VALUES ('2639', '运河区', '3', '2629', 'Y');
INSERT INTO `ey_region` VALUES ('2648', '沧县', '3', '2629', 'C');
INSERT INTO `ey_region` VALUES ('2668', '青县', '3', '2629', 'Q');
INSERT INTO `ey_region` VALUES ('2680', '东光县', '3', '2629', 'D');
INSERT INTO `ey_region` VALUES ('2690', '海兴县', '3', '2629', 'H');
INSERT INTO `ey_region` VALUES ('2701', '盐山县', '3', '2629', 'Y');
INSERT INTO `ey_region` VALUES ('2714', '肃宁县', '3', '2629', 'S');
INSERT INTO `ey_region` VALUES ('2724', '南皮县', '3', '2629', 'N');
INSERT INTO `ey_region` VALUES ('2734', '吴桥县', '3', '2629', 'W');
INSERT INTO `ey_region` VALUES ('2745', '献县', '3', '2629', 'X');
INSERT INTO `ey_region` VALUES ('2765', '孟村县', '3', '2629', 'M');
INSERT INTO `ey_region` VALUES ('2772', '泊头市', '3', '2629', 'B');
INSERT INTO `ey_region` VALUES ('2788', '任邱市', '3', '2629', 'R');
INSERT INTO `ey_region` VALUES ('2809', '黄骅市', '3', '2629', 'H');
INSERT INTO `ey_region` VALUES ('2828', '河间市', '3', '2629', 'H');
INSERT INTO `ey_region` VALUES ('2849', '廊坊市', '2', '636', 'L');
INSERT INTO `ey_region` VALUES ('2850', '市辖区', '3', '2849', 'S');
INSERT INTO `ey_region` VALUES ('2851', '安次区', '3', '2849', 'A');
INSERT INTO `ey_region` VALUES ('2862', '广阳区', '3', '2849', 'G');
INSERT INTO `ey_region` VALUES ('2873', '固安县', '3', '2849', 'G');
INSERT INTO `ey_region` VALUES ('2883', '永清县', '3', '2849', 'Y');
INSERT INTO `ey_region` VALUES ('2895', '香河县', '3', '2849', 'X');
INSERT INTO `ey_region` VALUES ('2906', '大城县', '3', '2849', 'D');
INSERT INTO `ey_region` VALUES ('2918', '文安县', '3', '2849', 'W');
INSERT INTO `ey_region` VALUES ('2932', '大厂县', '3', '2849', 'D');
INSERT INTO `ey_region` VALUES ('2939', '霸州市', '3', '2849', 'B');
INSERT INTO `ey_region` VALUES ('2953', '三河市', '3', '2849', 'S');
INSERT INTO `ey_region` VALUES ('2968', '衡水市', '2', '636', 'H');
INSERT INTO `ey_region` VALUES ('2969', '市辖区', '3', '2968', 'S');
INSERT INTO `ey_region` VALUES ('2970', '桃城区', '3', '2968', 'T');
INSERT INTO `ey_region` VALUES ('2983', '枣强县', '3', '2968', 'Z');
INSERT INTO `ey_region` VALUES ('2995', '武邑县', '3', '2968', 'W');
INSERT INTO `ey_region` VALUES ('3005', '武强县', '3', '2968', 'W');
INSERT INTO `ey_region` VALUES ('3012', '饶阳县', '3', '2968', 'R');
INSERT INTO `ey_region` VALUES ('3020', '安平县', '3', '2968', 'A');
INSERT INTO `ey_region` VALUES ('3029', '故城县', '3', '2968', 'G');
INSERT INTO `ey_region` VALUES ('3043', '景县', '3', '2968', 'J');
INSERT INTO `ey_region` VALUES ('3060', '阜城县', '3', '2968', 'F');
INSERT INTO `ey_region` VALUES ('3071', '冀州市', '3', '2968', 'J');
INSERT INTO `ey_region` VALUES ('3083', '深州市', '3', '2968', 'S');
INSERT INTO `ey_region` VALUES ('3102', '山西', '1', '0', 'S');
INSERT INTO `ey_region` VALUES ('3103', '太原市', '2', '3102', 'T');
INSERT INTO `ey_region` VALUES ('3104', '市辖区', '3', '3103', 'S');
INSERT INTO `ey_region` VALUES ('3105', '小店区(人口含高新经济区)', '3', '3103', 'X');
INSERT INTO `ey_region` VALUES ('3117', '迎泽区', '3', '3103', 'Y');
INSERT INTO `ey_region` VALUES ('3126', '杏花岭区', '3', '3103', 'X');
INSERT INTO `ey_region` VALUES ('3140', '尖草坪区', '3', '3103', 'J');
INSERT INTO `ey_region` VALUES ('3155', '万柏林区', '3', '3103', 'W');
INSERT INTO `ey_region` VALUES ('3171', '晋源区', '3', '3103', 'J');
INSERT INTO `ey_region` VALUES ('3178', '清徐县', '3', '3103', 'Q');
INSERT INTO `ey_region` VALUES ('3188', '阳曲县', '3', '3103', 'Y');
INSERT INTO `ey_region` VALUES ('3200', '娄烦县', '3', '3103', 'L');
INSERT INTO `ey_region` VALUES ('3209', '古交市', '3', '3103', 'G');
INSERT INTO `ey_region` VALUES ('3224', '大同市', '2', '3102', 'D');
INSERT INTO `ey_region` VALUES ('3225', '市辖区', '3', '3224', 'S');
INSERT INTO `ey_region` VALUES ('3226', '大同市城区', '3', '3224', 'D');
INSERT INTO `ey_region` VALUES ('3241', '矿区', '3', '3224', 'K');
INSERT INTO `ey_region` VALUES ('3266', '南郊区', '3', '3224', 'N');
INSERT INTO `ey_region` VALUES ('3277', '新荣区', '3', '3224', 'X');
INSERT INTO `ey_region` VALUES ('3286', '阳高县', '3', '3224', 'Y');
INSERT INTO `ey_region` VALUES ('3300', '天镇县', '3', '3224', 'T');
INSERT INTO `ey_region` VALUES ('3312', '广灵县', '3', '3224', 'G');
INSERT INTO `ey_region` VALUES ('3322', '灵丘县', '3', '3224', 'L');
INSERT INTO `ey_region` VALUES ('3335', '浑源县', '3', '3224', 'H');
INSERT INTO `ey_region` VALUES ('3354', '左云县', '3', '3224', 'Z');
INSERT INTO `ey_region` VALUES ('3364', '大同县', '3', '3224', 'D');
INSERT INTO `ey_region` VALUES ('3379', '阳泉市', '2', '3102', 'Y');
INSERT INTO `ey_region` VALUES ('3380', '市辖区', '3', '3379', 'S');
INSERT INTO `ey_region` VALUES ('3381', '城区', '3', '3379', 'C');
INSERT INTO `ey_region` VALUES ('3388', '矿区', '3', '3379', 'K');
INSERT INTO `ey_region` VALUES ('3395', '郊区', '3', '3379', 'J');
INSERT INTO `ey_region` VALUES ('3405', '平定县', '3', '3379', 'P');
INSERT INTO `ey_region` VALUES ('3416', '盂县', '3', '3379', 'Y');
INSERT INTO `ey_region` VALUES ('3431', '长治市', '2', '3102', 'C');
INSERT INTO `ey_region` VALUES ('3432', '市辖区', '3', '3431', 'S');
INSERT INTO `ey_region` VALUES ('3433', '长治市城区', '3', '3431', 'C');
INSERT INTO `ey_region` VALUES ('3445', '长治市郊区', '3', '3431', 'C');
INSERT INTO `ey_region` VALUES ('3454', '长治县', '3', '3431', 'C');
INSERT INTO `ey_region` VALUES ('3466', '襄垣县', '3', '3431', 'X');
INSERT INTO `ey_region` VALUES ('3478', '屯留县', '3', '3431', 'T');
INSERT INTO `ey_region` VALUES ('3493', '平顺县', '3', '3431', 'P');
INSERT INTO `ey_region` VALUES ('3506', '黎城县', '3', '3431', 'L');
INSERT INTO `ey_region` VALUES ('3516', '壶关县', '3', '3431', 'H');
INSERT INTO `ey_region` VALUES ('3530', '长子县', '3', '3431', 'C');
INSERT INTO `ey_region` VALUES ('3543', '武乡县', '3', '3431', 'W');
INSERT INTO `ey_region` VALUES ('3558', '沁县', '3', '3431', 'Q');
INSERT INTO `ey_region` VALUES ('3572', '沁源县', '3', '3431', 'Q');
INSERT INTO `ey_region` VALUES ('3587', '潞城市', '3', '3431', 'L');
INSERT INTO `ey_region` VALUES ('3597', '晋城市', '2', '3102', 'J');
INSERT INTO `ey_region` VALUES ('3598', '市辖区', '3', '3597', 'S');
INSERT INTO `ey_region` VALUES ('3599', '晋城市城区', '3', '3597', 'J');
INSERT INTO `ey_region` VALUES ('3608', '沁水县', '3', '3597', 'Q');
INSERT INTO `ey_region` VALUES ('3623', '阳城县', '3', '3597', 'Y');
INSERT INTO `ey_region` VALUES ('3642', '陵川县', '3', '3597', 'L');
INSERT INTO `ey_region` VALUES ('3655', '泽州县', '3', '3597', 'Z');
INSERT INTO `ey_region` VALUES ('3673', '高平市', '3', '3597', 'G');
INSERT INTO `ey_region` VALUES ('3690', '朔州市', '2', '3102', 'S');
INSERT INTO `ey_region` VALUES ('3691', '市辖区', '3', '3690', 'S');
INSERT INTO `ey_region` VALUES ('3692', '朔城区', '3', '3690', 'S');
INSERT INTO `ey_region` VALUES ('3709', '平鲁区', '3', '3690', 'P');
INSERT INTO `ey_region` VALUES ('3723', '山阴县', '3', '3690', 'S');
INSERT INTO `ey_region` VALUES ('3739', '应县', '3', '3690', 'Y');
INSERT INTO `ey_region` VALUES ('3752', '右玉县', '3', '3690', 'Y');
INSERT INTO `ey_region` VALUES ('3763', '怀仁县', '3', '3690', 'H');
INSERT INTO `ey_region` VALUES ('3776', '晋中市', '2', '3102', 'J');
INSERT INTO `ey_region` VALUES ('3777', '市辖区', '3', '3776', 'S');
INSERT INTO `ey_region` VALUES ('3778', '榆次区', '3', '3776', 'Y');
INSERT INTO `ey_region` VALUES ('3799', '榆社县', '3', '3776', 'Y');
INSERT INTO `ey_region` VALUES ('3810', '左权县', '3', '3776', 'Z');
INSERT INTO `ey_region` VALUES ('3822', '和顺县', '3', '3776', 'H');
INSERT INTO `ey_region` VALUES ('3833', '昔阳县', '3', '3776', 'X');
INSERT INTO `ey_region` VALUES ('3846', '寿阳县', '3', '3776', 'S');
INSERT INTO `ey_region` VALUES ('3861', '太谷县', '3', '3776', 'T');
INSERT INTO `ey_region` VALUES ('3871', '祁县', '3', '3776', 'Q');
INSERT INTO `ey_region` VALUES ('3880', '平遥县', '3', '3776', 'P');
INSERT INTO `ey_region` VALUES ('3895', '灵石县', '3', '3776', 'L');
INSERT INTO `ey_region` VALUES ('3908', '介休市', '3', '3776', 'J');
INSERT INTO `ey_region` VALUES ('3925', '运城市', '2', '3102', 'Y');
INSERT INTO `ey_region` VALUES ('3926', '市辖区', '3', '3925', 'S');
INSERT INTO `ey_region` VALUES ('3927', '盐湖区', '3', '3925', 'Y');
INSERT INTO `ey_region` VALUES ('3950', '临猗县', '3', '3925', 'L');
INSERT INTO `ey_region` VALUES ('3967', '万荣县', '3', '3925', 'W');
INSERT INTO `ey_region` VALUES ('3982', '闻喜县', '3', '3925', 'W');
INSERT INTO `ey_region` VALUES ('3996', '稷山县', '3', '3925', 'J');
INSERT INTO `ey_region` VALUES ('4004', '新绛县', '3', '3925', 'X');
INSERT INTO `ey_region` VALUES ('4013', '绛县', '3', '3925', 'J');
INSERT INTO `ey_region` VALUES ('4024', '垣曲县', '3', '3925', 'Y');
INSERT INTO `ey_region` VALUES ('4036', '夏县', '3', '3925', 'X');
INSERT INTO `ey_region` VALUES ('4048', '平陆县', '3', '3925', 'P');
INSERT INTO `ey_region` VALUES ('4059', '芮城县', '3', '3925', 'R');
INSERT INTO `ey_region` VALUES ('4070', '永济市', '3', '3925', 'Y');
INSERT INTO `ey_region` VALUES ('4082', '河津市', '3', '3925', 'H');
INSERT INTO `ey_region` VALUES ('4093', '忻州市', '2', '3102', 'X');
INSERT INTO `ey_region` VALUES ('4094', '市辖区', '3', '4093', 'S');
INSERT INTO `ey_region` VALUES ('4095', '忻府区', '3', '4093', 'X');
INSERT INTO `ey_region` VALUES ('4116', '定襄县', '3', '4093', 'D');
INSERT INTO `ey_region` VALUES ('4126', '五台县', '3', '4093', 'W');
INSERT INTO `ey_region` VALUES ('4146', '代县', '3', '4093', 'D');
INSERT INTO `ey_region` VALUES ('4158', '繁峙县', '3', '4093', 'F');
INSERT INTO `ey_region` VALUES ('4172', '宁武县', '3', '4093', 'N');
INSERT INTO `ey_region` VALUES ('4189', '静乐县', '3', '4093', 'J');
INSERT INTO `ey_region` VALUES ('4204', '神池县', '3', '4093', 'S');
INSERT INTO `ey_region` VALUES ('4215', '五寨县', '3', '4093', 'W');
INSERT INTO `ey_region` VALUES ('4228', '岢岚县', '3', '4093', 'K');
INSERT INTO `ey_region` VALUES ('4241', '河曲县', '3', '4093', 'H');
INSERT INTO `ey_region` VALUES ('4255', '保德县', '3', '4093', 'B');
INSERT INTO `ey_region` VALUES ('4269', '偏关县', '3', '4093', 'P');
INSERT INTO `ey_region` VALUES ('4280', '原平市', '3', '4093', 'Y');
INSERT INTO `ey_region` VALUES ('4304', '临汾市', '2', '3102', 'L');
INSERT INTO `ey_region` VALUES ('4305', '市辖区', '3', '4304', 'S');
INSERT INTO `ey_region` VALUES ('4306', '尧都区', '3', '4304', 'Y');
INSERT INTO `ey_region` VALUES ('4333', '曲沃县', '3', '4304', 'Q');
INSERT INTO `ey_region` VALUES ('4341', '翼城县', '3', '4304', 'Y');
INSERT INTO `ey_region` VALUES ('4352', '襄汾县', '3', '4304', 'X');
INSERT INTO `ey_region` VALUES ('4366', '洪洞县', '3', '4304', 'H');
INSERT INTO `ey_region` VALUES ('4383', '古县', '3', '4304', 'G');
INSERT INTO `ey_region` VALUES ('4391', '安泽县', '3', '4304', 'A');
INSERT INTO `ey_region` VALUES ('4399', '浮山县', '3', '4304', 'F');
INSERT INTO `ey_region` VALUES ('4409', '吉县', '3', '4304', 'J');
INSERT INTO `ey_region` VALUES ('4418', '乡宁县', '3', '4304', 'X');
INSERT INTO `ey_region` VALUES ('4429', '大宁县', '3', '4304', 'D');
INSERT INTO `ey_region` VALUES ('4436', '隰县', '3', '4304', 'X');
INSERT INTO `ey_region` VALUES ('4445', '永和县', '3', '4304', 'Y');
INSERT INTO `ey_region` VALUES ('4453', '蒲县', '3', '4304', 'P');
INSERT INTO `ey_region` VALUES ('4463', '汾西县', '3', '4304', 'F');
INSERT INTO `ey_region` VALUES ('4472', '侯马市', '3', '4304', 'H');
INSERT INTO `ey_region` VALUES ('4481', '霍州市', '3', '4304', 'H');
INSERT INTO `ey_region` VALUES ('4494', '吕梁市', '2', '3102', 'L');
INSERT INTO `ey_region` VALUES ('4495', '市辖区', '3', '4494', 'S');
INSERT INTO `ey_region` VALUES ('4496', '离石区', '3', '4494', 'L');
INSERT INTO `ey_region` VALUES ('4509', '文水县', '3', '4494', 'W');
INSERT INTO `ey_region` VALUES ('4522', '交城县', '3', '4494', 'J');
INSERT INTO `ey_region` VALUES ('4533', '兴县', '3', '4494', 'X');
INSERT INTO `ey_region` VALUES ('4551', '临县', '3', '4494', 'L');
INSERT INTO `ey_region` VALUES ('4575', '柳林县', '3', '4494', 'L');
INSERT INTO `ey_region` VALUES ('4591', '石楼县', '3', '4494', 'S');
INSERT INTO `ey_region` VALUES ('4601', '岚县', '3', '4494', 'L');
INSERT INTO `ey_region` VALUES ('4614', '方山县', '3', '4494', 'F');
INSERT INTO `ey_region` VALUES ('4622', '中阳县', '3', '4494', 'Z');
INSERT INTO `ey_region` VALUES ('4630', '交口县', '3', '4494', 'J');
INSERT INTO `ey_region` VALUES ('4638', '孝义市', '3', '4494', 'X');
INSERT INTO `ey_region` VALUES ('4655', '汾阳市', '3', '4494', 'F');
INSERT INTO `ey_region` VALUES ('4670', '内蒙古', '1', '0', 'N');
INSERT INTO `ey_region` VALUES ('4671', '呼和浩特市', '2', '4670', 'H');
INSERT INTO `ey_region` VALUES ('4672', '市辖区', '3', '4671', 'S');
INSERT INTO `ey_region` VALUES ('4673', '新城区', '3', '4671', 'X');
INSERT INTO `ey_region` VALUES ('4684', '回民区', '3', '4671', 'H');
INSERT INTO `ey_region` VALUES ('4693', '玉泉区', '3', '4671', 'Y');
INSERT INTO `ey_region` VALUES ('4702', '赛罕区', '3', '4671', 'S');
INSERT INTO `ey_region` VALUES ('4715', '土左旗', '3', '4671', 'T');
INSERT INTO `ey_region` VALUES ('4727', '托克托县', '3', '4671', 'T');
INSERT INTO `ey_region` VALUES ('4733', '和林格尔县', '3', '4671', 'H');
INSERT INTO `ey_region` VALUES ('4742', '清水河县', '3', '4671', 'Q');
INSERT INTO `ey_region` VALUES ('4749', '武川县', '3', '4671', 'W');
INSERT INTO `ey_region` VALUES ('4759', '包头市', '2', '4670', 'B');
INSERT INTO `ey_region` VALUES ('4760', '市辖区', '3', '4759', 'S');
INSERT INTO `ey_region` VALUES ('4761', '东河区', '3', '4759', 'D');
INSERT INTO `ey_region` VALUES ('4775', '昆都仑区', '3', '4759', 'K');
INSERT INTO `ey_region` VALUES ('4791', '青山区', '3', '4759', 'Q');
INSERT INTO `ey_region` VALUES ('4803', '石拐区', '3', '4759', 'S');
INSERT INTO `ey_region` VALUES ('4810', '白云鄂博矿区', '3', '4759', 'B');
INSERT INTO `ey_region` VALUES ('4813', '九原区', '3', '4759', 'J');
INSERT INTO `ey_region` VALUES ('4823', '土默特右旗', '3', '4759', 'T');
INSERT INTO `ey_region` VALUES ('4833', '固阳县', '3', '4759', 'G');
INSERT INTO `ey_region` VALUES ('4840', '达茂联合旗', '3', '4759', 'D');
INSERT INTO `ey_region` VALUES ('4849', '乌海市', '2', '4670', 'W');
INSERT INTO `ey_region` VALUES ('4850', '乌海市辖区', '3', '4849', 'W');
INSERT INTO `ey_region` VALUES ('4851', '海勃湾区', '3', '4849', 'H');
INSERT INTO `ey_region` VALUES ('4859', '海南区', '3', '4849', 'H');
INSERT INTO `ey_region` VALUES ('4865', '乌达区', '3', '4849', 'W');
INSERT INTO `ey_region` VALUES ('4874', '赤峰市', '2', '4670', 'C');
INSERT INTO `ey_region` VALUES ('4875', '市辖区', '3', '4874', 'S');
INSERT INTO `ey_region` VALUES ('4876', '红山区', '3', '4874', 'H');
INSERT INTO `ey_region` VALUES ('4888', '元宝山区', '3', '4874', 'Y');
INSERT INTO `ey_region` VALUES ('4896', '松山区', '3', '4874', 'S');
INSERT INTO `ey_region` VALUES ('4919', '阿鲁科尔沁旗', '3', '4874', 'A');
INSERT INTO `ey_region` VALUES ('4932', '巴林左旗', '3', '4874', 'B');
INSERT INTO `ey_region` VALUES ('4944', '巴林右旗', '3', '4874', 'B');
INSERT INTO `ey_region` VALUES ('4953', '林西县', '3', '4874', 'L');
INSERT INTO `ey_region` VALUES ('4963', '克什克腾旗', '3', '4874', 'K');
INSERT INTO `ey_region` VALUES ('4975', '翁牛特旗', '3', '4874', 'W');
INSERT INTO `ey_region` VALUES ('4988', '喀喇沁旗', '3', '4874', 'K');
INSERT INTO `ey_region` VALUES ('4999', '宁城县', '3', '4874', 'N');
INSERT INTO `ey_region` VALUES ('5013', '敖汉旗', '3', '4874', 'A');
INSERT INTO `ey_region` VALUES ('5029', '通辽市', '2', '4670', 'T');
INSERT INTO `ey_region` VALUES ('5030', '市辖区', '3', '5029', 'S');
INSERT INTO `ey_region` VALUES ('5031', '科尔沁区', '3', '5029', 'K');
INSERT INTO `ey_region` VALUES ('5062', '科尔沁左翼中旗', '3', '5029', 'K');
INSERT INTO `ey_region` VALUES ('5079', '科左后旗', '3', '5029', 'K');
INSERT INTO `ey_region` VALUES ('5104', '开鲁县', '3', '5029', 'K');
INSERT INTO `ey_region` VALUES ('5118', '库伦旗', '3', '5029', 'K');
INSERT INTO `ey_region` VALUES ('5125', '奈曼旗', '3', '5029', 'N');
INSERT INTO `ey_region` VALUES ('5139', '扎鲁特旗', '3', '5029', 'Z');
INSERT INTO `ey_region` VALUES ('5155', '霍林郭勒市', '3', '5029', 'H');
INSERT INTO `ey_region` VALUES ('5162', '鄂尔多斯市', '2', '4670', 'E');
INSERT INTO `ey_region` VALUES ('5163', '东胜区', '3', '5162', 'D');
INSERT INTO `ey_region` VALUES ('5176', '达拉特旗', '3', '5162', 'D');
INSERT INTO `ey_region` VALUES ('5185', '准格尔旗', '3', '5162', 'Z');
INSERT INTO `ey_region` VALUES ('5195', '鄂托克前旗', '3', '5162', 'E');
INSERT INTO `ey_region` VALUES ('5201', '鄂托克旗', '3', '5162', 'E');
INSERT INTO `ey_region` VALUES ('5210', '杭锦旗', '3', '5162', 'H');
INSERT INTO `ey_region` VALUES ('5219', '乌审旗', '3', '5162', 'W');
INSERT INTO `ey_region` VALUES ('5228', '伊金霍洛旗', '3', '5162', 'Y');
INSERT INTO `ey_region` VALUES ('5236', '呼伦贝尔市', '2', '4670', 'H');
INSERT INTO `ey_region` VALUES ('5237', '市辖区', '3', '5236', 'S');
INSERT INTO `ey_region` VALUES ('5238', '海拉尔区', '3', '5236', 'H');
INSERT INTO `ey_region` VALUES ('5249', '阿荣旗', '3', '5236', 'A');
INSERT INTO `ey_region` VALUES ('5262', '莫力达瓦旗', '3', '5236', 'M');
INSERT INTO `ey_region` VALUES ('5277', '鄂伦春旗', '3', '5236', 'E');
INSERT INTO `ey_region` VALUES ('5303', '鄂温旗', '3', '5236', 'E');
INSERT INTO `ey_region` VALUES ('5314', '陈巴尔虎旗镇', '3', '5236', 'C');
INSERT INTO `ey_region` VALUES ('5323', '新巴尔虎左旗', '3', '5236', 'X');
INSERT INTO `ey_region` VALUES ('5330', '新巴尔虎右旗', '3', '5236', 'X');
INSERT INTO `ey_region` VALUES ('5337', '满洲里市', '3', '5236', 'M');
INSERT INTO `ey_region` VALUES ('5354', '牙克石市', '3', '5236', 'Y');
INSERT INTO `ey_region` VALUES ('5371', '扎兰屯市', '3', '5236', 'Z');
INSERT INTO `ey_region` VALUES ('5397', '额尔古纳市', '3', '5236', 'E');
INSERT INTO `ey_region` VALUES ('5410', '根河市', '3', '5236', 'G');
INSERT INTO `ey_region` VALUES ('5418', '巴彦淖尔市', '2', '4670', 'B');
INSERT INTO `ey_region` VALUES ('5419', '市辖区', '3', '5418', 'S');
INSERT INTO `ey_region` VALUES ('5420', '临河区', '3', '5418', 'L');
INSERT INTO `ey_region` VALUES ('5440', '五原县', '3', '5418', 'W');
INSERT INTO `ey_region` VALUES ('5450', '磴口县', '3', '5418', 'D');
INSERT INTO `ey_region` VALUES ('5461', '乌拉特前旗', '3', '5418', 'W');
INSERT INTO `ey_region` VALUES ('5477', '乌拉特中旗', '3', '5418', 'W');
INSERT INTO `ey_region` VALUES ('5489', '乌拉特后旗', '3', '5418', 'W');
INSERT INTO `ey_region` VALUES ('5495', '杭锦后旗', '3', '5418', 'H');
INSERT INTO `ey_region` VALUES ('5505', '乌兰察布市', '2', '4670', 'W');
INSERT INTO `ey_region` VALUES ('5506', '市辖区', '3', '5505', 'S');
INSERT INTO `ey_region` VALUES ('5507', '集宁区', '3', '5505', 'J');
INSERT INTO `ey_region` VALUES ('5518', '卓资县', '3', '5505', 'Z');
INSERT INTO `ey_region` VALUES ('5526', '化德县', '3', '5505', 'H');
INSERT INTO `ey_region` VALUES ('5532', '商都县', '3', '5505', 'S');
INSERT INTO `ey_region` VALUES ('5542', '兴和县', '3', '5505', 'X');
INSERT INTO `ey_region` VALUES ('5551', '凉城县', '3', '5505', 'L');
INSERT INTO `ey_region` VALUES ('5562', '察哈尔右翼前旗', '3', '5505', 'C');
INSERT INTO `ey_region` VALUES ('5571', '察右中旗', '3', '5505', 'C');
INSERT INTO `ey_region` VALUES ('5582', '察哈尔右翼后旗', '3', '5505', 'C');
INSERT INTO `ey_region` VALUES ('5590', '四子王旗', '3', '5505', 'S');
INSERT INTO `ey_region` VALUES ('5603', '丰镇市', '3', '5505', 'F');
INSERT INTO `ey_region` VALUES ('5616', '兴安盟', '2', '4670', 'X');
INSERT INTO `ey_region` VALUES ('5617', '乌兰浩特市', '3', '5616', 'W');
INSERT INTO `ey_region` VALUES ('5629', '阿尔山市', '3', '5616', 'A');
INSERT INTO `ey_region` VALUES ('5636', '科右前旗', '3', '5616', 'K');
INSERT INTO `ey_region` VALUES ('5655', '科右中旗', '3', '5616', 'K');
INSERT INTO `ey_region` VALUES ('5677', '扎赉特旗', '3', '5616', 'Z');
INSERT INTO `ey_region` VALUES ('5692', '突泉县', '3', '5616', 'T');
INSERT INTO `ey_region` VALUES ('5702', '锡林郭勒盟', '2', '4670', 'X');
INSERT INTO `ey_region` VALUES ('5703', '二连浩特市', '3', '5702', 'E');
INSERT INTO `ey_region` VALUES ('5709', '锡林浩特市', '3', '5702', 'X');
INSERT INTO `ey_region` VALUES ('5723', '阿巴嘎旗', '3', '5702', 'A');
INSERT INTO `ey_region` VALUES ('5731', '苏尼特左旗', '3', '5702', 'S');
INSERT INTO `ey_region` VALUES ('5738', '苏尼特右旗', '3', '5702', 'S');
INSERT INTO `ey_region` VALUES ('5745', '东乌珠穆沁旗', '3', '5702', 'D');
INSERT INTO `ey_region` VALUES ('5758', '西乌珠穆沁旗', '3', '5702', 'X');
INSERT INTO `ey_region` VALUES ('5766', '太仆寺旗', '3', '5702', 'T');
INSERT INTO `ey_region` VALUES ('5774', '镶黄旗', '3', '5702', 'X');
INSERT INTO `ey_region` VALUES ('5778', '正镶白旗', '3', '5702', 'Z');
INSERT INTO `ey_region` VALUES ('5785', '正蓝旗', '3', '5702', 'Z');
INSERT INTO `ey_region` VALUES ('5794', '多伦县', '3', '5702', 'D');
INSERT INTO `ey_region` VALUES ('5799', '阿拉善盟', '2', '4670', 'A');
INSERT INTO `ey_region` VALUES ('5800', '阿拉善左旗', '3', '5799', 'A');
INSERT INTO `ey_region` VALUES ('5814', '阿拉善右旗', '3', '5799', 'A');
INSERT INTO `ey_region` VALUES ('5820', '额济纳旗', '3', '5799', 'E');
INSERT INTO `ey_region` VALUES ('5827', '辽宁省', '1', '0', 'L');
INSERT INTO `ey_region` VALUES ('5828', '沈阳市', '2', '5827', 'S');
INSERT INTO `ey_region` VALUES ('5829', '市辖区', '3', '5828', 'S');
INSERT INTO `ey_region` VALUES ('5830', '和平区', '3', '5828', 'H');
INSERT INTO `ey_region` VALUES ('5848', '沈河区', '3', '5828', 'S');
INSERT INTO `ey_region` VALUES ('5859', '大东区', '3', '5828', 'D');
INSERT INTO `ey_region` VALUES ('5873', '皇姑区', '3', '5828', 'H');
INSERT INTO `ey_region` VALUES ('5894', '铁西区', '3', '5828', 'T');
INSERT INTO `ey_region` VALUES ('5909', '苏家屯区', '3', '5828', 'S');
INSERT INTO `ey_region` VALUES ('5934', '东陵区', '3', '5828', 'D');
INSERT INTO `ey_region` VALUES ('5954', '新城子区', '3', '5828', 'X');
INSERT INTO `ey_region` VALUES ('5975', '于洪区', '3', '5828', 'Y');
INSERT INTO `ey_region` VALUES ('5998', '辽中县', '3', '5828', 'L');
INSERT INTO `ey_region` VALUES ('6020', '康平县', '3', '5828', 'K');
INSERT INTO `ey_region` VALUES ('6038', '法库县', '3', '5828', 'F');
INSERT INTO `ey_region` VALUES ('6058', '新民市', '3', '5828', 'X');
INSERT INTO `ey_region` VALUES ('6088', '大连市', '2', '5827', 'D');
INSERT INTO `ey_region` VALUES ('6089', '市辖区', '3', '6088', 'S');
INSERT INTO `ey_region` VALUES ('6090', '中山区', '3', '6088', 'Z');
INSERT INTO `ey_region` VALUES ('6099', '西岗区', '3', '6088', 'X');
INSERT INTO `ey_region` VALUES ('6107', '沙河口区', '3', '6088', 'S');
INSERT INTO `ey_region` VALUES ('6117', '甘井子区', '3', '6088', 'G');
INSERT INTO `ey_region` VALUES ('6137', '旅顺口区', '3', '6088', 'L');
INSERT INTO `ey_region` VALUES ('6153', '金州区', '3', '6088', 'J');
INSERT INTO `ey_region` VALUES ('6178', '长海县', '3', '6088', 'C');
INSERT INTO `ey_region` VALUES ('6184', '瓦房店市', '3', '6088', 'W');
INSERT INTO `ey_region` VALUES ('6217', '普兰店市', '3', '6088', 'P');
INSERT INTO `ey_region` VALUES ('6239', '庄河市', '3', '6088', 'Z');
INSERT INTO `ey_region` VALUES ('6266', '鞍山市', '2', '5827', 'A');
INSERT INTO `ey_region` VALUES ('6267', '市辖区', '3', '6266', 'S');
INSERT INTO `ey_region` VALUES ('6268', '铁东区', '3', '6266', 'T');
INSERT INTO `ey_region` VALUES ('6282', '铁西区', '3', '6266', 'T');
INSERT INTO `ey_region` VALUES ('6293', '立山区', '3', '6266', 'L');
INSERT INTO `ey_region` VALUES ('6303', '千山区', '3', '6266', 'Q');
INSERT INTO `ey_region` VALUES ('6316', '台安县', '3', '6266', 'T');
INSERT INTO `ey_region` VALUES ('6331', '岫岩县', '3', '6266', 'X');
INSERT INTO `ey_region` VALUES ('6354', '海城市', '3', '6266', 'H');
INSERT INTO `ey_region` VALUES ('6384', '抚顺市', '2', '5827', 'F');
INSERT INTO `ey_region` VALUES ('6385', '市辖区', '3', '6384', 'S');
INSERT INTO `ey_region` VALUES ('6386', '新抚区', '3', '6384', 'X');
INSERT INTO `ey_region` VALUES ('6395', '东洲区', '3', '6384', 'D');
INSERT INTO `ey_region` VALUES ('6409', '望花区', '3', '6384', 'W');
INSERT INTO `ey_region` VALUES ('6422', '顺城区', '3', '6384', 'S');
INSERT INTO `ey_region` VALUES ('6432', '抚顺县', '3', '6384', 'F');
INSERT INTO `ey_region` VALUES ('6445', '新宾县', '3', '6384', 'X');
INSERT INTO `ey_region` VALUES ('6461', '清原县', '3', '6384', 'Q');
INSERT INTO `ey_region` VALUES ('6476', '本溪市', '2', '5827', 'B');
INSERT INTO `ey_region` VALUES ('6477', '市辖区', '3', '6476', 'S');
INSERT INTO `ey_region` VALUES ('6478', '平山区', '3', '6476', 'P');
INSERT INTO `ey_region` VALUES ('6488', '溪湖区', '3', '6476', 'X');
INSERT INTO `ey_region` VALUES ('6499', '明山区', '3', '6476', 'M');
INSERT INTO `ey_region` VALUES ('6509', '南芬区', '3', '6476', 'N');
INSERT INTO `ey_region` VALUES ('6515', '本溪县', '3', '6476', 'B');
INSERT INTO `ey_region` VALUES ('6528', '桓仁县', '3', '6476', 'H');
INSERT INTO `ey_region` VALUES ('6542', '丹东市', '2', '5827', 'D');
INSERT INTO `ey_region` VALUES ('6543', '市辖区', '3', '6542', 'S');
INSERT INTO `ey_region` VALUES ('6544', '元宝区', '3', '6542', 'Y');
INSERT INTO `ey_region` VALUES ('6552', '振兴区', '3', '6542', 'Z');
INSERT INTO `ey_region` VALUES ('6563', '振安区', '3', '6542', 'Z');
INSERT INTO `ey_region` VALUES ('6573', '宽甸县', '3', '6542', 'K');
INSERT INTO `ey_region` VALUES ('6596', '东港市', '3', '6542', 'D');
INSERT INTO `ey_region` VALUES ('6621', '凤城市', '3', '6542', 'F');
INSERT INTO `ey_region` VALUES ('6643', '锦州市', '2', '5827', 'J');
INSERT INTO `ey_region` VALUES ('6644', '市辖区', '3', '6643', 'S');
INSERT INTO `ey_region` VALUES ('6645', '古塔区', '3', '6643', 'G');
INSERT INTO `ey_region` VALUES ('6655', '凌河区', '3', '6643', 'L');
INSERT INTO `ey_region` VALUES ('6668', '太和区', '3', '6643', 'T');
INSERT INTO `ey_region` VALUES ('6683', '黑山县', '3', '6643', 'H');
INSERT INTO `ey_region` VALUES ('6706', '义县', '3', '6643', 'Y');
INSERT INTO `ey_region` VALUES ('6725', '凌海市', '3', '6643', 'L');
INSERT INTO `ey_region` VALUES ('6750', '北镇市', '3', '6643', 'B');
INSERT INTO `ey_region` VALUES ('6771', '营口市', '2', '5827', 'Y');
INSERT INTO `ey_region` VALUES ('6772', '市辖区', '3', '6771', 'S');
INSERT INTO `ey_region` VALUES ('6773', '站前区', '3', '6771', 'Z');
INSERT INTO `ey_region` VALUES ('6781', '西市区', '3', '6771', 'X');
INSERT INTO `ey_region` VALUES ('6789', '鲅鱼圈区', '3', '6771', 'B');
INSERT INTO `ey_region` VALUES ('6797', '老边区', '3', '6771', 'L');
INSERT INTO `ey_region` VALUES ('6804', '盖州市', '3', '6771', 'G');
INSERT INTO `ey_region` VALUES ('6832', '大石桥市', '3', '6771', 'D');
INSERT INTO `ey_region` VALUES ('6851', '阜新市', '2', '5827', 'F');
INSERT INTO `ey_region` VALUES ('6852', '市辖区', '3', '6851', 'S');
INSERT INTO `ey_region` VALUES ('6853', '海州区', '3', '6851', 'H');
INSERT INTO `ey_region` VALUES ('6865', '新邱区', '3', '6851', 'X');
INSERT INTO `ey_region` VALUES ('6871', '太平区', '3', '6851', 'T');
INSERT INTO `ey_region` VALUES ('6878', '清河门区', '3', '6851', 'Q');
INSERT INTO `ey_region` VALUES ('6885', '细河区', '3', '6851', 'X');
INSERT INTO `ey_region` VALUES ('6893', '阜新县', '3', '6851', 'F');
INSERT INTO `ey_region` VALUES ('6930', '彰武县', '3', '6851', 'Z');
INSERT INTO `ey_region` VALUES ('6955', '辽阳市', '2', '5827', 'L');
INSERT INTO `ey_region` VALUES ('6956', '市辖区', '3', '6955', 'S');
INSERT INTO `ey_region` VALUES ('6957', '白塔区', '3', '6955', 'B');
INSERT INTO `ey_region` VALUES ('6964', '文圣区', '3', '6955', 'W');
INSERT INTO `ey_region` VALUES ('6971', '宏伟区', '3', '6955', 'H');
INSERT INTO `ey_region` VALUES ('6977', '弓长岭区', '3', '6955', 'G');
INSERT INTO `ey_region` VALUES ('6983', '太子河区', '3', '6955', 'T');
INSERT INTO `ey_region` VALUES ('6989', '辽阳县', '3', '6955', 'L');
INSERT INTO `ey_region` VALUES ('7007', '灯塔市', '3', '6955', 'D');
INSERT INTO `ey_region` VALUES ('7024', '盘锦市', '2', '5827', 'P');
INSERT INTO `ey_region` VALUES ('7025', '市辖区', '3', '7024', 'S');
INSERT INTO `ey_region` VALUES ('7026', '双台子区', '3', '7024', 'S');
INSERT INTO `ey_region` VALUES ('7036', '兴隆台区', '3', '7024', 'X');
INSERT INTO `ey_region` VALUES ('7055', '大洼县', '3', '7024', 'D');
INSERT INTO `ey_region` VALUES ('7072', '盘山县', '3', '7024', 'P');
INSERT INTO `ey_region` VALUES ('7088', '铁岭市', '2', '5827', 'T');
INSERT INTO `ey_region` VALUES ('7089', '市辖区', '3', '7088', 'S');
INSERT INTO `ey_region` VALUES ('7090', '银州区', '3', '7088', 'Y');
INSERT INTO `ey_region` VALUES ('7099', '清河区', '3', '7088', 'Q');
INSERT INTO `ey_region` VALUES ('7105', '铁岭县', '3', '7088', 'T');
INSERT INTO `ey_region` VALUES ('7121', '西丰县', '3', '7088', 'X');
INSERT INTO `ey_region` VALUES ('7140', '昌图县', '3', '7088', 'C');
INSERT INTO `ey_region` VALUES ('7180', '调兵山市', '3', '7088', 'D');
INSERT INTO `ey_region` VALUES ('7186', '开原市', '3', '7088', 'K');
INSERT INTO `ey_region` VALUES ('7208', '朝阳市', '2', '5827', 'C');
INSERT INTO `ey_region` VALUES ('7209', '市辖区', '3', '7208', 'S');
INSERT INTO `ey_region` VALUES ('7210', '双塔区', '3', '7208', 'S');
INSERT INTO `ey_region` VALUES ('7225', '龙城区', '3', '7208', 'L');
INSERT INTO `ey_region` VALUES ('7238', '朝阳县', '3', '7208', 'C');
INSERT INTO `ey_region` VALUES ('7267', '建平县', '3', '7208', 'J');
INSERT INTO `ey_region` VALUES ('7299', '喀喇沁左翼县', '3', '7208', 'K');
INSERT INTO `ey_region` VALUES ('7322', '北票市', '3', '7208', 'B');
INSERT INTO `ey_region` VALUES ('7360', '凌源市', '3', '7208', 'L');
INSERT INTO `ey_region` VALUES ('7391', '葫芦岛市', '2', '5827', 'H');
INSERT INTO `ey_region` VALUES ('7392', '市辖区', '3', '7391', 'S');
INSERT INTO `ey_region` VALUES ('7393', '连山区', '3', '7391', 'L');
INSERT INTO `ey_region` VALUES ('7419', '龙港区', '3', '7391', 'L');
INSERT INTO `ey_region` VALUES ('7433', '南票区', '3', '7391', 'N');
INSERT INTO `ey_region` VALUES ('7446', '绥中县', '3', '7391', 'S');
INSERT INTO `ey_region` VALUES ('7474', '建昌县', '3', '7391', 'J');
INSERT INTO `ey_region` VALUES ('7503', '兴城市', '3', '7391', 'X');
INSERT INTO `ey_region` VALUES ('7531', '吉林省', '1', '0', 'J');
INSERT INTO `ey_region` VALUES ('7532', '长春市', '2', '7531', 'C');
INSERT INTO `ey_region` VALUES ('7533', '长春市辖区', '3', '7532', 'C');
INSERT INTO `ey_region` VALUES ('7534', '南关区', '3', '7532', 'N');
INSERT INTO `ey_region` VALUES ('7552', '宽城区', '3', '7532', 'K');
INSERT INTO `ey_region` VALUES ('7569', '朝阳区', '3', '7532', 'C');
INSERT INTO `ey_region` VALUES ('7582', '二道区', '3', '7532', 'E');
INSERT INTO `ey_region` VALUES ('7597', '绿园区', '3', '7532', 'L');
INSERT INTO `ey_region` VALUES ('7610', '双阳区', '3', '7532', 'S');
INSERT INTO `ey_region` VALUES ('7619', '农安县', '3', '7532', 'N');
INSERT INTO `ey_region` VALUES ('7642', '九台市', '3', '7532', 'J');
INSERT INTO `ey_region` VALUES ('7658', '榆树市', '3', '7532', 'Y');
INSERT INTO `ey_region` VALUES ('7687', '德惠市', '3', '7532', 'D');
INSERT INTO `ey_region` VALUES ('7706', '吉林市', '2', '7531', 'J');
INSERT INTO `ey_region` VALUES ('7707', '吉林市辖区', '3', '7706', 'J');
INSERT INTO `ey_region` VALUES ('7708', '昌邑区', '3', '7706', 'C');
INSERT INTO `ey_region` VALUES ('7731', '龙潭区', '3', '7706', 'L');
INSERT INTO `ey_region` VALUES ('7752', '船营区', '3', '7706', 'C');
INSERT INTO `ey_region` VALUES ('7768', '丰满区', '3', '7706', 'F');
INSERT INTO `ey_region` VALUES ('7781', '永吉县', '3', '7706', 'Y');
INSERT INTO `ey_region` VALUES ('7792', '蛟河市', '3', '7706', 'J');
INSERT INTO `ey_region` VALUES ('7810', '桦甸市', '3', '7706', 'H');
INSERT INTO `ey_region` VALUES ('7828', '舒兰市', '3', '7706', 'S');
INSERT INTO `ey_region` VALUES ('7849', '磐石市', '3', '7706', 'P');
INSERT INTO `ey_region` VALUES ('7868', '四平市', '2', '7531', 'S');
INSERT INTO `ey_region` VALUES ('7869', '四平市辖区', '3', '7868', 'S');
INSERT INTO `ey_region` VALUES ('7870', '铁西区', '3', '7868', 'T');
INSERT INTO `ey_region` VALUES ('7878', '铁东区', '3', '7868', 'T');
INSERT INTO `ey_region` VALUES ('7892', '梨树县', '3', '7868', 'L');
INSERT INTO `ey_region` VALUES ('7916', '伊通县', '3', '7868', 'Y');
INSERT INTO `ey_region` VALUES ('7933', '公主岭市', '3', '7868', 'G');
INSERT INTO `ey_region` VALUES ('7964', '双辽市', '3', '7868', 'S');
INSERT INTO `ey_region` VALUES ('7986', '辽源市', '2', '7531', 'L');
INSERT INTO `ey_region` VALUES ('7987', '辽源市辖区', '3', '7986', 'L');
INSERT INTO `ey_region` VALUES ('7988', '龙山区', '3', '7986', 'L');
INSERT INTO `ey_region` VALUES ('8000', '西安区', '3', '7986', 'X');
INSERT INTO `ey_region` VALUES ('8008', '东丰县', '3', '7986', 'D');
INSERT INTO `ey_region` VALUES ('8023', '东辽县', '3', '7986', 'D');
INSERT INTO `ey_region` VALUES ('8037', '通化市', '2', '7531', 'T');
INSERT INTO `ey_region` VALUES ('8038', '通化市辖区', '3', '8037', 'T');
INSERT INTO `ey_region` VALUES ('8039', '东昌区', '3', '8037', 'D');
INSERT INTO `ey_region` VALUES ('8051', '二道江区', '3', '8037', 'E');
INSERT INTO `ey_region` VALUES ('8058', '通化县', '3', '8037', 'T');
INSERT INTO `ey_region` VALUES ('8076', '辉南县', '3', '8037', 'H');
INSERT INTO `ey_region` VALUES ('8088', '柳河县', '3', '8037', 'L');
INSERT INTO `ey_region` VALUES ('8104', '梅河口市', '3', '8037', 'M');
INSERT INTO `ey_region` VALUES ('8129', '集安市', '3', '8037', 'J');
INSERT INTO `ey_region` VALUES ('8144', '白山市', '2', '7531', 'B');
INSERT INTO `ey_region` VALUES ('8145', '白山市辖区', '3', '8144', 'B');
INSERT INTO `ey_region` VALUES ('8146', '八道江区', '3', '8144', 'B');
INSERT INTO `ey_region` VALUES ('8159', '江源区', '3', '8144', 'J');
INSERT INTO `ey_region` VALUES ('8168', '抚松县', '3', '8144', 'F');
INSERT INTO `ey_region` VALUES ('8183', '靖宇县', '3', '8144', 'J');
INSERT INTO `ey_region` VALUES ('8192', '长白县', '3', '8144', 'C');
INSERT INTO `ey_region` VALUES ('8202', '临江市', '3', '8144', 'L');
INSERT INTO `ey_region` VALUES ('8216', '松原市', '2', '7531', 'S');
INSERT INTO `ey_region` VALUES ('8217', '松原市辖区', '3', '8216', 'S');
INSERT INTO `ey_region` VALUES ('8218', '宁江区', '3', '8216', 'N');
INSERT INTO `ey_region` VALUES ('8239', '前郭县', '3', '8216', 'Q');
INSERT INTO `ey_region` VALUES ('8266', '长岭县', '3', '8216', 'C');
INSERT INTO `ey_region` VALUES ('8300', '乾安县', '3', '8216', 'Q');
INSERT INTO `ey_region` VALUES ('8311', '扶余县', '3', '8216', 'F');
INSERT INTO `ey_region` VALUES ('8333', '白城市', '2', '7531', 'B');
INSERT INTO `ey_region` VALUES ('8334', '白城市辖区', '3', '8333', 'B');
INSERT INTO `ey_region` VALUES ('8335', '洮北区', '3', '8333', 'T');
INSERT INTO `ey_region` VALUES ('8362', '镇赉县', '3', '8333', 'Z');
INSERT INTO `ey_region` VALUES ('8375', '通榆县', '3', '8333', 'T');
INSERT INTO `ey_region` VALUES ('8393', '洮南市', '3', '8333', 'T');
INSERT INTO `ey_region` VALUES ('8420', '大安市', '3', '8333', 'D');
INSERT INTO `ey_region` VALUES ('8445', '延边州', '2', '7531', 'Y');
INSERT INTO `ey_region` VALUES ('8446', '延吉市', '3', '8445', 'Y');
INSERT INTO `ey_region` VALUES ('8456', '图们市', '3', '8445', 'T');
INSERT INTO `ey_region` VALUES ('8464', '敦化市', '3', '8445', 'D');
INSERT INTO `ey_region` VALUES ('8489', '珲春市', '3', '8445', 'H');
INSERT INTO `ey_region` VALUES ('8504', '龙井市', '3', '8445', 'L');
INSERT INTO `ey_region` VALUES ('8515', '和龙市', '3', '8445', 'H');
INSERT INTO `ey_region` VALUES ('8530', '汪清县', '3', '8445', 'W');
INSERT INTO `ey_region` VALUES ('8545', '安图县', '3', '8445', 'A');
INSERT INTO `ey_region` VALUES ('8558', '黑龙江省', '1', '0', 'H');
INSERT INTO `ey_region` VALUES ('8559', '哈尔滨市', '2', '8558', 'H');
INSERT INTO `ey_region` VALUES ('8560', '市辖区', '3', '8559', 'S');
INSERT INTO `ey_region` VALUES ('8561', '道里区', '3', '8559', 'D');
INSERT INTO `ey_region` VALUES ('8585', '南岗区', '3', '8559', 'N');
INSERT INTO `ey_region` VALUES ('8606', '道外区', '3', '8559', 'D');
INSERT INTO `ey_region` VALUES ('8633', '平房区', '3', '8559', 'P');
INSERT INTO `ey_region` VALUES ('8642', '松北区', '3', '8559', 'S');
INSERT INTO `ey_region` VALUES ('8650', '香坊区', '3', '8559', 'X');
INSERT INTO `ey_region` VALUES ('8676', '呼兰区', '3', '8559', 'H');
INSERT INTO `ey_region` VALUES ('8694', '阿城区', '3', '8559', 'A');
INSERT INTO `ey_region` VALUES ('8714', '依兰县', '3', '8559', 'Y');
INSERT INTO `ey_region` VALUES ('8729', '方正县', '3', '8559', 'F');
INSERT INTO `ey_region` VALUES ('8740', '宾县', '3', '8559', 'B');
INSERT INTO `ey_region` VALUES ('8758', '巴彦县', '3', '8559', 'B');
INSERT INTO `ey_region` VALUES ('8778', '木兰县', '3', '8559', 'M');
INSERT INTO `ey_region` VALUES ('8788', '通河县', '3', '8559', 'T');
INSERT INTO `ey_region` VALUES ('8800', '延寿县', '3', '8559', 'Y');
INSERT INTO `ey_region` VALUES ('8812', '双城市', '3', '8559', 'S');
INSERT INTO `ey_region` VALUES ('8838', '尚志市', '3', '8559', 'S');
INSERT INTO `ey_region` VALUES ('8858', '五常市', '3', '8559', 'W');
INSERT INTO `ey_region` VALUES ('8884', '齐齐哈尔市', '2', '8558', 'Q');
INSERT INTO `ey_region` VALUES ('8885', '市辖区', '3', '8884', 'S');
INSERT INTO `ey_region` VALUES ('8886', '龙沙区', '3', '8884', 'L');
INSERT INTO `ey_region` VALUES ('8894', '建华区', '3', '8884', 'J');
INSERT INTO `ey_region` VALUES ('8901', '铁锋区', '3', '8884', 'T');
INSERT INTO `ey_region` VALUES ('8911', '昂昂溪区', '3', '8884', 'A');
INSERT INTO `ey_region` VALUES ('8918', '富拉尔基区', '3', '8884', 'F');
INSERT INTO `ey_region` VALUES ('8928', '碾子山区', '3', '8884', 'N');
INSERT INTO `ey_region` VALUES ('8934', '梅里斯达斡尔族区', '3', '8884', 'M');
INSERT INTO `ey_region` VALUES ('8943', '龙江县', '3', '8884', 'L');
INSERT INTO `ey_region` VALUES ('8958', '依安县', '3', '8884', 'Y');
INSERT INTO `ey_region` VALUES ('8976', '泰来县', '3', '8884', 'T');
INSERT INTO `ey_region` VALUES ('8998', '甘南县', '3', '8884', 'G');
INSERT INTO `ey_region` VALUES ('9011', '富裕县', '3', '8884', 'F');
INSERT INTO `ey_region` VALUES ('9024', '克山县', '3', '8884', 'K');
INSERT INTO `ey_region` VALUES ('9048', '克东县', '3', '8884', 'K');
INSERT INTO `ey_region` VALUES ('9067', '拜泉县', '3', '8884', 'B');
INSERT INTO `ey_region` VALUES ('9084', '讷河市', '3', '8884', 'N');
INSERT INTO `ey_region` VALUES ('9117', '鸡西市', '2', '8558', 'J');
INSERT INTO `ey_region` VALUES ('9118', '市辖区', '3', '9117', 'S');
INSERT INTO `ey_region` VALUES ('9119', '鸡冠区', '3', '9117', 'J');
INSERT INTO `ey_region` VALUES ('9129', '恒山区', '3', '9117', 'H');
INSERT INTO `ey_region` VALUES ('9139', '滴道区', '3', '9117', 'D');
INSERT INTO `ey_region` VALUES ('9146', '梨树区', '3', '9117', 'L');
INSERT INTO `ey_region` VALUES ('9153', '城子河区', '3', '9117', 'C');
INSERT INTO `ey_region` VALUES ('9161', '麻山区', '3', '9117', 'M');
INSERT INTO `ey_region` VALUES ('9164', '鸡东县', '3', '9117', 'J');
INSERT INTO `ey_region` VALUES ('9178', '虎林市', '3', '9117', 'H');
INSERT INTO `ey_region` VALUES ('9199', '密山市', '3', '9117', 'M');
INSERT INTO `ey_region` VALUES ('9222', '鹤岗市', '2', '8558', 'H');
INSERT INTO `ey_region` VALUES ('9223', '市辖区', '3', '9222', 'S');
INSERT INTO `ey_region` VALUES ('9224', '向阳区', '3', '9222', 'X');
INSERT INTO `ey_region` VALUES ('9230', '工农区', '3', '9222', 'G');
INSERT INTO `ey_region` VALUES ('9237', '南山区', '3', '9222', 'N');
INSERT INTO `ey_region` VALUES ('9244', '兴安区', '3', '9222', 'X');
INSERT INTO `ey_region` VALUES ('9250', '东山区', '3', '9222', 'D');
INSERT INTO `ey_region` VALUES ('9261', '兴山区', '3', '9222', 'X');
INSERT INTO `ey_region` VALUES ('9266', '萝北县', '3', '9222', 'L');
INSERT INTO `ey_region` VALUES ('9283', '绥滨县', '3', '9222', 'S');
INSERT INTO `ey_region` VALUES ('9296', '双鸭山市', '2', '8558', 'S');
INSERT INTO `ey_region` VALUES ('9297', '市辖区', '3', '9296', 'S');
INSERT INTO `ey_region` VALUES ('9298', '尖山区', '3', '9296', 'J');
INSERT INTO `ey_region` VALUES ('9307', '岭东区', '3', '9296', 'L');
INSERT INTO `ey_region` VALUES ('9317', '四方台区', '3', '9296', 'S');
INSERT INTO `ey_region` VALUES ('9323', '宝山区', '3', '9296', 'B');
INSERT INTO `ey_region` VALUES ('9335', '集贤县', '3', '9296', 'J');
INSERT INTO `ey_region` VALUES ('9356', '友谊县', '3', '9296', 'Y');
INSERT INTO `ey_region` VALUES ('9370', '宝清县', '3', '9296', 'B');
INSERT INTO `ey_region` VALUES ('9393', '饶河县', '3', '9296', 'R');
INSERT INTO `ey_region` VALUES ('9419', '大庆市', '2', '8558', 'D');
INSERT INTO `ey_region` VALUES ('9420', '市辖区', '3', '9419', 'S');
INSERT INTO `ey_region` VALUES ('9421', '萨尔图区', '3', '9419', 'S');
INSERT INTO `ey_region` VALUES ('9431', '龙凤区', '3', '9419', 'L');
INSERT INTO `ey_region` VALUES ('9440', '让胡路区', '3', '9419', 'R');
INSERT INTO `ey_region` VALUES ('9451', '红岗区', '3', '9419', 'H');
INSERT INTO `ey_region` VALUES ('9458', '大同区', '3', '9419', 'D');
INSERT INTO `ey_region` VALUES ('9474', '肇州县', '3', '9419', 'Z');
INSERT INTO `ey_region` VALUES ('9489', '肇源县', '3', '9419', 'Z');
INSERT INTO `ey_region` VALUES ('9514', '林甸县', '3', '9419', 'L');
INSERT INTO `ey_region` VALUES ('9527', '杜尔伯特县', '3', '9419', 'D');
INSERT INTO `ey_region` VALUES ('9553', '伊春市', '2', '8558', 'Y');
INSERT INTO `ey_region` VALUES ('9554', '市辖区', '3', '9553', 'S');
INSERT INTO `ey_region` VALUES ('9555', '伊春区', '3', '9553', 'Y');
INSERT INTO `ey_region` VALUES ('9561', '南岔区', '3', '9553', 'N');
INSERT INTO `ey_region` VALUES ('9581', '友好区', '3', '9553', 'Y');
INSERT INTO `ey_region` VALUES ('9599', '西林区', '3', '9553', 'X');
INSERT INTO `ey_region` VALUES ('9603', '翠峦区', '3', '9553', 'C');
INSERT INTO `ey_region` VALUES ('9614', '新青区', '3', '9553', 'X');
INSERT INTO `ey_region` VALUES ('9631', '美溪区', '3', '9553', 'M');
INSERT INTO `ey_region` VALUES ('9647', '金山屯区', '3', '9553', 'J');
INSERT INTO `ey_region` VALUES ('9660', '五营区', '3', '9553', 'W');
INSERT INTO `ey_region` VALUES ('9671', '乌马河区', '3', '9553', 'W');
INSERT INTO `ey_region` VALUES ('9685', '汤旺河区', '3', '9553', 'T');
INSERT INTO `ey_region` VALUES ('9702', '带岭区', '3', '9553', 'D');
INSERT INTO `ey_region` VALUES ('9715', '乌伊岭区', '3', '9553', 'W');
INSERT INTO `ey_region` VALUES ('9729', '红星区', '3', '9553', 'H');
INSERT INTO `ey_region` VALUES ('9742', '上甘岭区', '3', '9553', 'S');
INSERT INTO `ey_region` VALUES ('9756', '嘉荫县', '3', '9553', 'J');
INSERT INTO `ey_region` VALUES ('9772', '铁力市', '3', '9553', 'T');
INSERT INTO `ey_region` VALUES ('9785', '佳木斯市', '2', '8558', 'J');
INSERT INTO `ey_region` VALUES ('9786', '市辖区', '3', '9785', 'S');
INSERT INTO `ey_region` VALUES ('9787', '向阳区', '3', '9785', 'X');
INSERT INTO `ey_region` VALUES ('9795', '前进区', '3', '9785', 'Q');
INSERT INTO `ey_region` VALUES ('9802', '东风区', '3', '9785', 'D');
INSERT INTO `ey_region` VALUES ('9810', '郊区', '3', '9785', 'J');
INSERT INTO `ey_region` VALUES ('9825', '桦南县', '3', '9785', 'H');
INSERT INTO `ey_region` VALUES ('9839', '桦川县', '3', '9785', 'H');
INSERT INTO `ey_region` VALUES ('9851', '汤原县', '3', '9785', 'T');
INSERT INTO `ey_region` VALUES ('9866', '抚远县', '3', '9785', 'F');
INSERT INTO `ey_region` VALUES ('9879', '同江市', '3', '9785', 'T');
INSERT INTO `ey_region` VALUES ('9907', '富锦市', '3', '9785', 'F');
INSERT INTO `ey_region` VALUES ('9930', '七台河市', '2', '8558', 'Q');
INSERT INTO `ey_region` VALUES ('9931', '市辖区', '3', '9930', 'S');
INSERT INTO `ey_region` VALUES ('9932', '新兴区', '3', '9930', 'X');
INSERT INTO `ey_region` VALUES ('9944', '桃山区', '3', '9930', 'T');
INSERT INTO `ey_region` VALUES ('9952', '茄子河区', '3', '9930', 'Q');
INSERT INTO `ey_region` VALUES ('9962', '勃利县', '3', '9930', 'B');
INSERT INTO `ey_region` VALUES ('9981', '牡丹江市', '2', '8558', 'M');
INSERT INTO `ey_region` VALUES ('9982', '市辖区', '3', '9981', 'S');
INSERT INTO `ey_region` VALUES ('9983', '东安区', '3', '9981', 'D');
INSERT INTO `ey_region` VALUES ('9989', '阳明区', '3', '9981', 'Y');
INSERT INTO `ey_region` VALUES ('9996', '爱民区', '3', '9981', 'A');
INSERT INTO `ey_region` VALUES ('10005', '西安区', '3', '9981', 'X');
INSERT INTO `ey_region` VALUES ('10014', '东宁县', '3', '9981', 'D');
INSERT INTO `ey_region` VALUES ('10022', '林口县', '3', '9981', 'L');
INSERT INTO `ey_region` VALUES ('10036', '绥芬河市', '3', '9981', 'S');
INSERT INTO `ey_region` VALUES ('10039', '海林市', '3', '9981', 'H');
INSERT INTO `ey_region` VALUES ('10056', '宁安市', '3', '9981', 'N');
INSERT INTO `ey_region` VALUES ('10072', '穆棱市', '3', '9981', 'M');
INSERT INTO `ey_region` VALUES ('10084', '黑河市', '2', '8558', 'H');
INSERT INTO `ey_region` VALUES ('10085', '市辖区', '3', '10084', 'S');
INSERT INTO `ey_region` VALUES ('10086', '爱辉区', '3', '10084', 'A');
INSERT INTO `ey_region` VALUES ('10122', '嫩江县', '3', '10084', 'N');
INSERT INTO `ey_region` VALUES ('10150', '逊克县', '3', '10084', 'X');
INSERT INTO `ey_region` VALUES ('10168', '孙吴县', '3', '10084', 'S');
INSERT INTO `ey_region` VALUES ('10192', '北安市', '3', '10084', 'B');
INSERT INTO `ey_region` VALUES ('10214', '五大连池市', '3', '10084', 'W');
INSERT INTO `ey_region` VALUES ('10252', '绥化市', '2', '8558', 'S');
INSERT INTO `ey_region` VALUES ('10253', '市辖区', '3', '10252', 'S');
INSERT INTO `ey_region` VALUES ('10254', '北林区', '3', '10252', 'B');
INSERT INTO `ey_region` VALUES ('10281', '望奎县', '3', '10252', 'W');
INSERT INTO `ey_region` VALUES ('10301', '兰西县', '3', '10252', 'L');
INSERT INTO `ey_region` VALUES ('10320', '青冈县', '3', '10252', 'Q');
INSERT INTO `ey_region` VALUES ('10342', '庆安县', '3', '10252', 'Q');
INSERT INTO `ey_region` VALUES ('10360', '明水县', '3', '10252', 'M');
INSERT INTO `ey_region` VALUES ('10380', '绥棱县', '3', '10252', 'S');
INSERT INTO `ey_region` VALUES ('10401', '安达市', '3', '10252', 'A');
INSERT INTO `ey_region` VALUES ('10425', '肇东市', '3', '10252', 'Z');
INSERT INTO `ey_region` VALUES ('10452', '海伦市', '3', '10252', 'H');
INSERT INTO `ey_region` VALUES ('10483', '大兴安岭地区', '2', '8558', 'D');
INSERT INTO `ey_region` VALUES ('10484', '加格达奇区', '3', '10483', 'J');
INSERT INTO `ey_region` VALUES ('10495', '松岭区', '3', '10483', 'S');
INSERT INTO `ey_region` VALUES ('10500', '新林区', '3', '10483', 'X');
INSERT INTO `ey_region` VALUES ('10509', '呼中区', '3', '10483', 'H');
INSERT INTO `ey_region` VALUES ('10515', '呼玛县', '3', '10483', 'H');
INSERT INTO `ey_region` VALUES ('10525', '塔河县', '3', '10483', 'T');
INSERT INTO `ey_region` VALUES ('10534', '漠河县', '3', '10483', 'M');
INSERT INTO `ey_region` VALUES ('10543', '上海市', '1', '0', 'S');
INSERT INTO `ey_region` VALUES ('10544', '市辖区', '2', '10543', 'S');
INSERT INTO `ey_region` VALUES ('10545', '黄浦区', '3', '10544', 'H');
INSERT INTO `ey_region` VALUES ('10555', '卢湾区', '3', '10544', 'L');
INSERT INTO `ey_region` VALUES ('10560', '徐汇区', '3', '10544', 'X');
INSERT INTO `ey_region` VALUES ('10575', '长宁区', '3', '10544', 'C');
INSERT INTO `ey_region` VALUES ('10586', '静安区', '3', '10544', 'J');
INSERT INTO `ey_region` VALUES ('10592', '普陀区', '3', '10544', 'P');
INSERT INTO `ey_region` VALUES ('10602', '闸北区', '3', '10544', 'Z');
INSERT INTO `ey_region` VALUES ('10612', '虹口区', '3', '10544', 'H');
INSERT INTO `ey_region` VALUES ('10623', '杨浦区', '3', '10544', 'Y');
INSERT INTO `ey_region` VALUES ('10636', '闵行区', '3', '10544', 'M');
INSERT INTO `ey_region` VALUES ('10650', '宝山区', '3', '10544', 'B');
INSERT INTO `ey_region` VALUES ('10664', '嘉定区', '3', '10544', 'J');
INSERT INTO `ey_region` VALUES ('10678', '浦东新区', '3', '10544', 'P');
INSERT INTO `ey_region` VALUES ('10704', '金山区', '3', '10544', 'J');
INSERT INTO `ey_region` VALUES ('10715', '松江区', '3', '10544', 'S');
INSERT INTO `ey_region` VALUES ('10735', '青浦区', '3', '10544', 'Q');
INSERT INTO `ey_region` VALUES ('10747', '南汇区', '3', '10544', 'N');
INSERT INTO `ey_region` VALUES ('10765', '奉贤区', '3', '10544', 'F');
INSERT INTO `ey_region` VALUES ('10779', '县', '2', '10543', 'X');
INSERT INTO `ey_region` VALUES ('10780', '崇明县', '3', '10779', 'C');
INSERT INTO `ey_region` VALUES ('10808', '江苏省', '1', '0', 'J');
INSERT INTO `ey_region` VALUES ('10809', '南京市', '2', '10808', 'N');
INSERT INTO `ey_region` VALUES ('10810', '市辖区', '3', '10809', 'S');
INSERT INTO `ey_region` VALUES ('10811', '玄武区', '3', '10809', 'X');
INSERT INTO `ey_region` VALUES ('10820', '白下区', '3', '10809', 'B');
INSERT INTO `ey_region` VALUES ('10831', '秦淮区', '3', '10809', 'Q');
INSERT INTO `ey_region` VALUES ('10837', '建邺区', '3', '10809', 'J');
INSERT INTO `ey_region` VALUES ('10845', '鼓楼区', '3', '10809', 'G');
INSERT INTO `ey_region` VALUES ('10853', '下关区', '3', '10809', 'X');
INSERT INTO `ey_region` VALUES ('10860', '浦口区', '3', '10809', 'P');
INSERT INTO `ey_region` VALUES ('10876', '栖霞区', '3', '10809', 'Q');
INSERT INTO `ey_region` VALUES ('10894', '雨花台区', '3', '10809', 'Y');
INSERT INTO `ey_region` VALUES ('10903', '江宁区', '3', '10809', 'J');
INSERT INTO `ey_region` VALUES ('10916', '六合区', '3', '10809', 'L');
INSERT INTO `ey_region` VALUES ('10937', '溧水县', '3', '10809', 'L');
INSERT INTO `ey_region` VALUES ('10947', '高淳县', '3', '10809', 'G');
INSERT INTO `ey_region` VALUES ('10960', '无锡市', '2', '10808', 'W');
INSERT INTO `ey_region` VALUES ('10961', '市辖区', '3', '10960', 'S');
INSERT INTO `ey_region` VALUES ('10962', '崇安区', '3', '10960', 'C');
INSERT INTO `ey_region` VALUES ('10969', '南长区', '3', '10960', 'N');
INSERT INTO `ey_region` VALUES ('10976', '北塘区', '3', '10960', 'B');
INSERT INTO `ey_region` VALUES ('10981', '锡山区', '3', '10960', 'X');
INSERT INTO `ey_region` VALUES ('10990', '惠山区', '3', '10960', 'H');
INSERT INTO `ey_region` VALUES ('10999', '滨湖区', '3', '10960', 'B');
INSERT INTO `ey_region` VALUES ('11018', '江阴市', '3', '10960', 'J');
INSERT INTO `ey_region` VALUES ('11039', '宜兴市', '3', '10960', 'Y');
INSERT INTO `ey_region` VALUES ('11067', '徐州市', '2', '10808', 'X');
INSERT INTO `ey_region` VALUES ('11068', '市辖区', '3', '11067', 'S');
INSERT INTO `ey_region` VALUES ('11069', '鼓楼区', '3', '11067', 'G');
INSERT INTO `ey_region` VALUES ('11081', '云龙区', '3', '11067', 'Y');
INSERT INTO `ey_region` VALUES ('11089', '九里区', '3', '11067', 'J');
INSERT INTO `ey_region` VALUES ('11103', '贾汪区', '3', '11067', 'J');
INSERT INTO `ey_region` VALUES ('11115', '泉山区', '3', '11067', 'Q');
INSERT INTO `ey_region` VALUES ('11126', '丰县', '3', '11067', 'F');
INSERT INTO `ey_region` VALUES ('11142', '沛县', '3', '11067', 'P');
INSERT INTO `ey_region` VALUES ('11160', '铜山县', '3', '11067', 'T');
INSERT INTO `ey_region` VALUES ('11182', '睢宁县', '3', '11067', 'S');
INSERT INTO `ey_region` VALUES ('11200', '新沂市', '3', '11067', 'X');
INSERT INTO `ey_region` VALUES ('11218', '邳州市', '3', '11067', 'P');
INSERT INTO `ey_region` VALUES ('11245', '常州市', '2', '10808', 'C');
INSERT INTO `ey_region` VALUES ('11246', '常州市区', '3', '11245', 'C');
INSERT INTO `ey_region` VALUES ('11247', '天宁区', '3', '11245', 'T');
INSERT INTO `ey_region` VALUES ('11254', '钟楼区', '3', '11245', 'Z');
INSERT INTO `ey_region` VALUES ('11262', '戚墅堰区', '3', '11245', 'Q');
INSERT INTO `ey_region` VALUES ('11266', '新北区', '3', '11245', 'X');
INSERT INTO `ey_region` VALUES ('11276', '武进区', '3', '11245', 'W');
INSERT INTO `ey_region` VALUES ('11311', '溧阳市', '3', '11245', 'L');
INSERT INTO `ey_region` VALUES ('11331', '金坛市', '3', '11245', 'J');
INSERT INTO `ey_region` VALUES ('11348', '苏州市', '2', '10808', 'S');
INSERT INTO `ey_region` VALUES ('11349', '市辖区', '3', '11348', 'S');
INSERT INTO `ey_region` VALUES ('11350', '沧浪区', '3', '11348', 'C');
INSERT INTO `ey_region` VALUES ('11357', '平江区', '3', '11348', 'P');
INSERT INTO `ey_region` VALUES ('11368', '金阊区', '3', '11348', 'J');
INSERT INTO `ey_region` VALUES ('11374', '苏州高新区虎丘区', '3', '11348', 'S');
INSERT INTO `ey_region` VALUES ('11387', '吴中区', '3', '11348', 'W');
INSERT INTO `ey_region` VALUES ('11409', '相城区', '3', '11348', 'X');
INSERT INTO `ey_region` VALUES ('11419', '常熟市', '3', '11348', 'C');
INSERT INTO `ey_region` VALUES ('11433', '张家港市', '3', '11348', 'Z');
INSERT INTO `ey_region` VALUES ('11448', '昆山市', '3', '11348', 'K');
INSERT INTO `ey_region` VALUES ('11460', '吴江市', '3', '11348', 'W');
INSERT INTO `ey_region` VALUES ('11472', '太仓市', '3', '11348', 'T');
INSERT INTO `ey_region` VALUES ('11482', '南通市', '2', '10808', 'N');
INSERT INTO `ey_region` VALUES ('11483', '市辖区', '3', '11482', 'S');
INSERT INTO `ey_region` VALUES ('11484', '崇川区', '3', '11482', 'C');
INSERT INTO `ey_region` VALUES ('11502', '港闸区', '3', '11482', 'G');
INSERT INTO `ey_region` VALUES ('11510', '海安县', '3', '11482', 'H');
INSERT INTO `ey_region` VALUES ('11526', '如东', '3', '11482', 'R');
INSERT INTO `ey_region` VALUES ('11542', '启东市', '3', '11482', 'Q');
INSERT INTO `ey_region` VALUES ('11568', '如皋市', '3', '11482', 'R');
INSERT INTO `ey_region` VALUES ('11600', '通州市', '3', '11482', 'T');
INSERT INTO `ey_region` VALUES ('11627', '海门市', '3', '11482', 'H');
INSERT INTO `ey_region` VALUES ('11663', '连云港市', '2', '10808', 'L');
INSERT INTO `ey_region` VALUES ('11664', '市辖区', '3', '11663', 'S');
INSERT INTO `ey_region` VALUES ('11665', '连云区', '3', '11663', 'L');
INSERT INTO `ey_region` VALUES ('11678', '新浦区', '3', '11663', 'X');
INSERT INTO `ey_region` VALUES ('11692', '海州区', '3', '11663', 'H');
INSERT INTO `ey_region` VALUES ('11699', '赣榆县', '3', '11663', 'G');
INSERT INTO `ey_region` VALUES ('11722', '东海县', '3', '11663', 'D');
INSERT INTO `ey_region` VALUES ('11747', '灌云县', '3', '11663', 'G');
INSERT INTO `ey_region` VALUES ('11771', '灌南县', '3', '11663', 'G');
INSERT INTO `ey_region` VALUES ('11786', '淮安市', '2', '10808', 'H');
INSERT INTO `ey_region` VALUES ('11787', '市辖区', '3', '11786', 'S');
INSERT INTO `ey_region` VALUES ('11788', '清河区', '3', '11786', 'Q');
INSERT INTO `ey_region` VALUES ('11801', '楚州区', '3', '11786', 'C');
INSERT INTO `ey_region` VALUES ('11830', '淮阴区', '3', '11786', 'H');
INSERT INTO `ey_region` VALUES ('11853', '清浦区', '3', '11786', 'Q');
INSERT INTO `ey_region` VALUES ('11863', '涟水县', '3', '11786', 'L');
INSERT INTO `ey_region` VALUES ('11896', '洪泽县', '3', '11786', 'H');
INSERT INTO `ey_region` VALUES ('11909', '盱眙县', '3', '11786', 'X');
INSERT INTO `ey_region` VALUES ('11931', '金湖县', '3', '11786', 'J');
INSERT INTO `ey_region` VALUES ('11947', '盐城市', '2', '10808', 'Y');
INSERT INTO `ey_region` VALUES ('11948', '市辖区', '3', '11947', 'S');
INSERT INTO `ey_region` VALUES ('11949', '亭湖区', '3', '11947', 'T');
INSERT INTO `ey_region` VALUES ('11967', '盐都区', '3', '11947', 'Y');
INSERT INTO `ey_region` VALUES ('11982', '响水县', '3', '11947', 'X');
INSERT INTO `ey_region` VALUES ('11998', '滨海县', '3', '11947', 'B');
INSERT INTO `ey_region` VALUES ('12017', '阜宁县', '3', '11947', 'F');
INSERT INTO `ey_region` VALUES ('12040', '射阳县', '3', '11947', 'S');
INSERT INTO `ey_region` VALUES ('12066', '建湖县', '3', '11947', 'J');
INSERT INTO `ey_region` VALUES ('12083', '东台市', '3', '11947', 'D');
INSERT INTO `ey_region` VALUES ('12117', '大丰市', '3', '11947', 'D');
INSERT INTO `ey_region` VALUES ('12135', '扬州市', '2', '10808', 'Y');
INSERT INTO `ey_region` VALUES ('12136', '市辖区', '3', '12135', 'S');
INSERT INTO `ey_region` VALUES ('12137', '广陵区', '3', '12135', 'G');
INSERT INTO `ey_region` VALUES ('12144', '邗江区', '3', '12135', 'H');
INSERT INTO `ey_region` VALUES ('12160', '维扬区', '3', '12135', 'W');
INSERT INTO `ey_region` VALUES ('12175', '宝应县', '3', '12135', 'B');
INSERT INTO `ey_region` VALUES ('12191', '仪征市', '3', '12135', 'Y');
INSERT INTO `ey_region` VALUES ('12212', '高邮市', '3', '12135', 'G');
INSERT INTO `ey_region` VALUES ('12235', '江都市', '3', '12135', 'J');
INSERT INTO `ey_region` VALUES ('12249', '镇江市', '2', '10808', 'Z');
INSERT INTO `ey_region` VALUES ('12250', '市区', '3', '12249', 'S');
INSERT INTO `ey_region` VALUES ('12251', '京口区', '3', '12249', 'J');
INSERT INTO `ey_region` VALUES ('12265', '润州区', '3', '12249', 'R');
INSERT INTO `ey_region` VALUES ('12273', '丹徒区', '3', '12249', 'D');
INSERT INTO `ey_region` VALUES ('12282', '丹阳市', '3', '12249', 'D');
INSERT INTO `ey_region` VALUES ('12300', '扬中市', '3', '12249', 'Y');
INSERT INTO `ey_region` VALUES ('12312', '句容市', '3', '12249', 'J');
INSERT INTO `ey_region` VALUES ('12343', '泰州市', '2', '10808', 'T');
INSERT INTO `ey_region` VALUES ('12344', '市辖区', '3', '12343', 'S');
INSERT INTO `ey_region` VALUES ('12345', '海陵区', '3', '12343', 'H');
INSERT INTO `ey_region` VALUES ('12362', '高港区', '3', '12343', 'G');
INSERT INTO `ey_region` VALUES ('12370', '兴化市', '3', '12343', 'X');
INSERT INTO `ey_region` VALUES ('12407', '靖江市', '3', '12343', 'J');
INSERT INTO `ey_region` VALUES ('12423', '泰兴市', '3', '12343', 'T');
INSERT INTO `ey_region` VALUES ('12450', '姜堰市', '3', '12343', 'J');
INSERT INTO `ey_region` VALUES ('12475', '宿迁市', '2', '10808', 'S');
INSERT INTO `ey_region` VALUES ('12476', '市辖区', '3', '12475', 'S');
INSERT INTO `ey_region` VALUES ('12477', '宿城区', '3', '12475', 'S');
INSERT INTO `ey_region` VALUES ('12496', '宿豫区', '3', '12475', 'S');
INSERT INTO `ey_region` VALUES ('12515', '沭阳县', '3', '12475', 'S');
INSERT INTO `ey_region` VALUES ('12551', '泗阳县', '3', '12475', 'S');
INSERT INTO `ey_region` VALUES ('12570', '泗洪县', '3', '12475', 'S');
INSERT INTO `ey_region` VALUES ('12596', '浙江省', '1', '0', 'Z');
INSERT INTO `ey_region` VALUES ('12597', '杭州市', '2', '12596', 'H');
INSERT INTO `ey_region` VALUES ('12598', '市辖区', '3', '12597', 'S');
INSERT INTO `ey_region` VALUES ('12599', '上城区', '3', '12597', 'S');
INSERT INTO `ey_region` VALUES ('12606', '下城区', '3', '12597', 'X');
INSERT INTO `ey_region` VALUES ('12615', '江干区', '3', '12597', 'J');
INSERT INTO `ey_region` VALUES ('12626', '拱墅区', '3', '12597', 'G');
INSERT INTO `ey_region` VALUES ('12637', '西湖区', '3', '12597', 'X');
INSERT INTO `ey_region` VALUES ('12652', '滨江区', '3', '12597', 'B');
INSERT INTO `ey_region` VALUES ('12656', '萧山区', '3', '12597', 'X');
INSERT INTO `ey_region` VALUES ('12685', '余杭区', '3', '12597', 'Y');
INSERT INTO `ey_region` VALUES ('12705', '桐庐县', '3', '12597', 'T');
INSERT INTO `ey_region` VALUES ('12719', '淳安县', '3', '12597', 'C');
INSERT INTO `ey_region` VALUES ('12743', '建德市', '3', '12597', 'J');
INSERT INTO `ey_region` VALUES ('12760', '富阳市', '3', '12597', 'F');
INSERT INTO `ey_region` VALUES ('12786', '临安市', '3', '12597', 'L');
INSERT INTO `ey_region` VALUES ('12813', '宁波市', '2', '12596', 'N');
INSERT INTO `ey_region` VALUES ('12814', '市辖区', '3', '12813', 'S');
INSERT INTO `ey_region` VALUES ('12815', '海曙区', '3', '12813', 'H');
INSERT INTO `ey_region` VALUES ('12824', '江东区', '3', '12813', 'J');
INSERT INTO `ey_region` VALUES ('12832', '江北区', '3', '12813', 'J');
INSERT INTO `ey_region` VALUES ('12841', '北仑区', '3', '12813', 'B');
INSERT INTO `ey_region` VALUES ('12851', '镇海区', '3', '12813', 'Z');
INSERT INTO `ey_region` VALUES ('12858', '鄞州区', '3', '12813', 'Y');
INSERT INTO `ey_region` VALUES ('12881', '象山县', '3', '12813', 'X');
INSERT INTO `ey_region` VALUES ('12900', '宁海县', '3', '12813', 'N');
INSERT INTO `ey_region` VALUES ('12919', '余姚市', '3', '12813', 'Y');
INSERT INTO `ey_region` VALUES ('12941', '慈溪市', '3', '12813', 'C');
INSERT INTO `ey_region` VALUES ('12962', '奉化市', '3', '12813', 'F');
INSERT INTO `ey_region` VALUES ('12974', '温州市', '2', '12596', 'W');
INSERT INTO `ey_region` VALUES ('12975', '市辖区', '3', '12974', 'S');
INSERT INTO `ey_region` VALUES ('12976', '鹿城区', '3', '12974', 'L');
INSERT INTO `ey_region` VALUES ('12998', '龙湾区', '3', '12974', 'L');
INSERT INTO `ey_region` VALUES ('13009', '瓯海区', '3', '12974', 'O');
INSERT INTO `ey_region` VALUES ('13023', '洞头县', '3', '12974', 'D');
INSERT INTO `ey_region` VALUES ('13030', '永嘉县', '3', '12974', 'Y');
INSERT INTO `ey_region` VALUES ('13069', '平阳县', '3', '12974', 'P');
INSERT INTO `ey_region` VALUES ('13101', '苍南县', '3', '12974', 'C');
INSERT INTO `ey_region` VALUES ('13138', '文成县', '3', '12974', 'W');
INSERT INTO `ey_region` VALUES ('13172', '泰顺县', '3', '12974', 'T');
INSERT INTO `ey_region` VALUES ('13209', '瑞安市', '3', '12974', 'R');
INSERT INTO `ey_region` VALUES ('13248', '乐清市', '3', '12974', 'L');
INSERT INTO `ey_region` VALUES ('13280', '嘉兴市', '2', '12596', 'J');
INSERT INTO `ey_region` VALUES ('13281', '市辖区', '3', '13280', 'S');
INSERT INTO `ey_region` VALUES ('13282', '南湖区', '3', '13280', 'N');
INSERT INTO `ey_region` VALUES ('13295', '秀洲区', '3', '13280', 'X');
INSERT INTO `ey_region` VALUES ('13304', '嘉善县', '3', '13280', 'J');
INSERT INTO `ey_region` VALUES ('13316', '海盐县', '3', '13280', 'H');
INSERT INTO `ey_region` VALUES ('13325', '海宁市', '3', '13280', 'H');
INSERT INTO `ey_region` VALUES ('13339', '平湖市', '3', '13280', 'P');
INSERT INTO `ey_region` VALUES ('13350', '桐乡市', '3', '13280', 'T');
INSERT INTO `ey_region` VALUES ('13364', '湖州市', '2', '12596', 'H');
INSERT INTO `ey_region` VALUES ('13365', '市辖区', '3', '13364', 'S');
INSERT INTO `ey_region` VALUES ('13366', '吴兴区', '3', '13364', 'W');
INSERT INTO `ey_region` VALUES ('13382', '南浔区', '3', '13364', 'N');
INSERT INTO `ey_region` VALUES ('13392', '德清县', '3', '13364', 'D');
INSERT INTO `ey_region` VALUES ('13404', '长兴县', '3', '13364', 'C');
INSERT INTO `ey_region` VALUES ('13421', '安吉县', '3', '13364', 'A');
INSERT INTO `ey_region` VALUES ('13437', '绍兴市', '2', '12596', 'S');
INSERT INTO `ey_region` VALUES ('13438', '市辖区', '3', '13437', 'S');
INSERT INTO `ey_region` VALUES ('13439', '越城区', '3', '13437', 'Y');
INSERT INTO `ey_region` VALUES ('13453', '绍兴县', '3', '13437', 'S');
INSERT INTO `ey_region` VALUES ('13473', '新昌县', '3', '13437', 'X');
INSERT INTO `ey_region` VALUES ('13490', '诸暨市', '3', '13437', 'Z');
INSERT INTO `ey_region` VALUES ('13518', '上虞市', '3', '13437', 'S');
INSERT INTO `ey_region` VALUES ('13542', '嵊州市', '3', '13437', 'S');
INSERT INTO `ey_region` VALUES ('13564', '金华市', '2', '12596', 'J');
INSERT INTO `ey_region` VALUES ('13565', '市辖区', '3', '13564', 'S');
INSERT INTO `ey_region` VALUES ('13566', '婺城区', '3', '13564', 'W');
INSERT INTO `ey_region` VALUES ('13594', '金东区', '3', '13564', 'J');
INSERT INTO `ey_region` VALUES ('13606', '武义县', '3', '13564', 'W');
INSERT INTO `ey_region` VALUES ('13625', '浦江县', '3', '13564', 'P');
INSERT INTO `ey_region` VALUES ('13641', '磐安县', '3', '13564', 'P');
INSERT INTO `ey_region` VALUES ('13662', '兰溪市', '3', '13564', 'L');
INSERT INTO `ey_region` VALUES ('13678', '义乌市', '3', '13564', 'Y');
INSERT INTO `ey_region` VALUES ('13692', '东阳市', '3', '13564', 'D');
INSERT INTO `ey_region` VALUES ('13711', '永康市', '3', '13564', 'Y');
INSERT INTO `ey_region` VALUES ('13726', '衢州市', '2', '12596', 'Q');
INSERT INTO `ey_region` VALUES ('13727', '市辖区', '3', '13726', 'S');
INSERT INTO `ey_region` VALUES ('13728', '柯城区', '3', '13726', 'K');
INSERT INTO `ey_region` VALUES ('13746', '衢江区', '3', '13726', 'Q');
INSERT INTO `ey_region` VALUES ('13768', '常山县', '3', '13726', 'C');
INSERT INTO `ey_region` VALUES ('13783', '开化县', '3', '13726', 'K');
INSERT INTO `ey_region` VALUES ('13802', '龙游县', '3', '13726', 'L');
INSERT INTO `ey_region` VALUES ('13818', '江山市', '3', '13726', 'J');
INSERT INTO `ey_region` VALUES ('13840', '舟山市', '2', '12596', 'Z');
INSERT INTO `ey_region` VALUES ('13841', '市辖区', '3', '13840', 'S');
INSERT INTO `ey_region` VALUES ('13842', '定海区', '3', '13840', 'D');
INSERT INTO `ey_region` VALUES ('13859', '普陀区', '3', '13840', 'P');
INSERT INTO `ey_region` VALUES ('13874', '岱山县', '3', '13840', 'D');
INSERT INTO `ey_region` VALUES ('13882', '嵊泗县', '3', '13840', 'S');
INSERT INTO `ey_region` VALUES ('13890', '台州市', '2', '12596', 'T');
INSERT INTO `ey_region` VALUES ('13891', '市辖区', '3', '13890', 'S');
INSERT INTO `ey_region` VALUES ('13892', '椒江区', '3', '13890', 'J');
INSERT INTO `ey_region` VALUES ('13903', '黄岩区', '3', '13890', 'H');
INSERT INTO `ey_region` VALUES ('13923', '路桥区', '3', '13890', 'L');
INSERT INTO `ey_region` VALUES ('13934', '玉环县', '3', '13890', 'Y');
INSERT INTO `ey_region` VALUES ('13944', '三门县', '3', '13890', 'S');
INSERT INTO `ey_region` VALUES ('13959', '天台县', '3', '13890', 'T');
INSERT INTO `ey_region` VALUES ('13975', '仙居县', '3', '13890', 'X');
INSERT INTO `ey_region` VALUES ('13996', '温岭市', '3', '13890', 'W');
INSERT INTO `ey_region` VALUES ('14013', '临海市', '3', '13890', 'L');
INSERT INTO `ey_region` VALUES ('14033', '丽水市', '2', '12596', 'L');
INSERT INTO `ey_region` VALUES ('14034', '市辖区', '3', '14033', 'S');
INSERT INTO `ey_region` VALUES ('14035', '莲都区', '3', '14033', 'L');
INSERT INTO `ey_region` VALUES ('14054', '青田县', '3', '14033', 'Q');
INSERT INTO `ey_region` VALUES ('14086', '缙云县', '3', '14033', 'J');
INSERT INTO `ey_region` VALUES ('14111', '遂昌县', '3', '14033', 'S');
INSERT INTO `ey_region` VALUES ('14132', '松阳县', '3', '14033', 'S');
INSERT INTO `ey_region` VALUES ('14153', '云和县', '3', '14033', 'Y');
INSERT INTO `ey_region` VALUES ('14168', '庆元县', '3', '14033', 'Q');
INSERT INTO `ey_region` VALUES ('14189', '景宁县', '3', '14033', 'J');
INSERT INTO `ey_region` VALUES ('14214', '龙泉市', '3', '14033', 'L');
INSERT INTO `ey_region` VALUES ('14234', '安徽省', '1', '0', 'A');
INSERT INTO `ey_region` VALUES ('14235', '合肥市', '2', '14234', 'H');
INSERT INTO `ey_region` VALUES ('14236', '市辖区', '3', '14235', 'S');
INSERT INTO `ey_region` VALUES ('14237', '瑶海区', '3', '14235', 'Y');
INSERT INTO `ey_region` VALUES ('14254', '庐阳区', '3', '14235', 'L');
INSERT INTO `ey_region` VALUES ('14269', '蜀山区', '3', '14235', 'S');
INSERT INTO `ey_region` VALUES ('14286', '包河区', '3', '14235', 'B');
INSERT INTO `ey_region` VALUES ('14297', '长丰县', '3', '14235', 'C');
INSERT INTO `ey_region` VALUES ('14314', '肥东县', '3', '14235', 'F');
INSERT INTO `ey_region` VALUES ('14334', '肥西县', '3', '14235', 'F');
INSERT INTO `ey_region` VALUES ('14351', '芜湖市', '2', '14234', 'W');
INSERT INTO `ey_region` VALUES ('14352', '市辖区', '3', '14351', 'S');
INSERT INTO `ey_region` VALUES ('14353', '镜湖区', '3', '14351', 'J');
INSERT INTO `ey_region` VALUES ('14366', '弋江区', '3', '14351', 'Y');
INSERT INTO `ey_region` VALUES ('14374', '鸠江区', '3', '14351', 'J');
INSERT INTO `ey_region` VALUES ('14382', '三山区', '3', '14351', 'S');
INSERT INTO `ey_region` VALUES ('14387', '芜湖县', '3', '14351', 'W');
INSERT INTO `ey_region` VALUES ('14394', '繁昌县', '3', '14351', 'F');
INSERT INTO `ey_region` VALUES ('14401', '南陵县', '3', '14351', 'N');
INSERT INTO `ey_region` VALUES ('14410', '蚌埠市', '2', '14234', 'B');
INSERT INTO `ey_region` VALUES ('14411', '市辖区', '3', '14410', 'S');
INSERT INTO `ey_region` VALUES ('14412', '龙子湖区', '3', '14410', 'L');
INSERT INTO `ey_region` VALUES ('14422', '蚌山区', '3', '14410', 'B');
INSERT INTO `ey_region` VALUES ('14434', '禹会区', '3', '14410', 'Y');
INSERT INTO `ey_region` VALUES ('14443', '淮上区', '3', '14410', 'H');
INSERT INTO `ey_region` VALUES ('14449', '怀远县', '3', '14410', 'H');
INSERT INTO `ey_region` VALUES ('14471', '五河县', '3', '14410', 'W');
INSERT INTO `ey_region` VALUES ('14487', '固镇县', '3', '14410', 'G');
INSERT INTO `ey_region` VALUES ('14500', '淮南市', '2', '14234', 'H');
INSERT INTO `ey_region` VALUES ('14501', '市辖区', '3', '14500', 'S');
INSERT INTO `ey_region` VALUES ('14502', '大通区', '3', '14500', 'D');
INSERT INTO `ey_region` VALUES ('14508', '田家庵区', '3', '14500', 'T');
INSERT INTO `ey_region` VALUES ('14523', '谢家集区', '3', '14500', 'X');
INSERT INTO `ey_region` VALUES ('14535', '八公山区', '3', '14500', 'B');
INSERT INTO `ey_region` VALUES ('14542', '潘集区', '3', '14500', 'P');
INSERT INTO `ey_region` VALUES ('14554', '凤台县', '3', '14500', 'F');
INSERT INTO `ey_region` VALUES ('14575', '马鞍山市', '2', '14234', 'M');
INSERT INTO `ey_region` VALUES ('14576', '市辖区', '3', '14575', 'S');
INSERT INTO `ey_region` VALUES ('14577', '金家庄区', '3', '14575', 'J');
INSERT INTO `ey_region` VALUES ('14583', '花山区', '3', '14575', 'H');
INSERT INTO `ey_region` VALUES ('14589', '雨山区', '3', '14575', 'Y');
INSERT INTO `ey_region` VALUES ('14597', '当涂县', '3', '14575', 'D');
INSERT INTO `ey_region` VALUES ('14612', '淮北市', '2', '14234', 'H');
INSERT INTO `ey_region` VALUES ('14613', '市辖区', '3', '14612', 'S');
INSERT INTO `ey_region` VALUES ('14614', '杜集区', '3', '14612', 'D');
INSERT INTO `ey_region` VALUES ('14620', '相山区', '3', '14612', 'X');
INSERT INTO `ey_region` VALUES ('14632', '烈山区', '3', '14612', 'L');
INSERT INTO `ey_region` VALUES ('14641', '濉溪县', '3', '14612', 'S');
INSERT INTO `ey_region` VALUES ('14653', '铜陵市', '2', '14234', 'T');
INSERT INTO `ey_region` VALUES ('14654', '市辖区', '3', '14653', 'S');
INSERT INTO `ey_region` VALUES ('14655', '铜官山区', '3', '14653', 'T');
INSERT INTO `ey_region` VALUES ('14663', '狮子山区', '3', '14653', 'S');
INSERT INTO `ey_region` VALUES ('14671', '铜陵市郊区', '3', '14653', 'T');
INSERT INTO `ey_region` VALUES ('14678', '铜陵县', '3', '14653', 'T');
INSERT INTO `ey_region` VALUES ('14687', '安庆市', '2', '14234', 'A');
INSERT INTO `ey_region` VALUES ('14688', '市辖区', '3', '14687', 'S');
INSERT INTO `ey_region` VALUES ('14689', '迎江区', '3', '14687', 'Y');
INSERT INTO `ey_region` VALUES ('14700', '大观区', '3', '14687', 'D');
INSERT INTO `ey_region` VALUES ('14712', '宜秀区', '3', '14687', 'Y');
INSERT INTO `ey_region` VALUES ('14720', '怀宁县', '3', '14687', 'H');
INSERT INTO `ey_region` VALUES ('14741', '枞阳县', '3', '14687', 'C');
INSERT INTO `ey_region` VALUES ('14764', '潜山县', '3', '14687', 'Q');
INSERT INTO `ey_region` VALUES ('14782', '太湖县', '3', '14687', 'T');
INSERT INTO `ey_region` VALUES ('14798', '宿松县', '3', '14687', 'S');
INSERT INTO `ey_region` VALUES ('14823', '望江县', '3', '14687', 'W');
INSERT INTO `ey_region` VALUES ('14834', '岳西县', '3', '14687', 'Y');
INSERT INTO `ey_region` VALUES ('14859', '桐城市', '3', '14687', 'T');
INSERT INTO `ey_region` VALUES ('14887', '黄山市', '2', '14234', 'H');
INSERT INTO `ey_region` VALUES ('14888', '市辖区', '3', '14887', 'S');
INSERT INTO `ey_region` VALUES ('14889', '屯溪区', '3', '14887', 'T');
INSERT INTO `ey_region` VALUES ('14900', '黄山区', '3', '14887', 'H');
INSERT INTO `ey_region` VALUES ('14917', '徽州区', '3', '14887', 'H');
INSERT INTO `ey_region` VALUES ('14926', '歙县', '3', '14887', 'S');
INSERT INTO `ey_region` VALUES ('14955', '休宁县', '3', '14887', 'X');
INSERT INTO `ey_region` VALUES ('14977', '黟县', '3', '14887', 'Y');
INSERT INTO `ey_region` VALUES ('14986', '祁门县', '3', '14887', 'Q');
INSERT INTO `ey_region` VALUES ('15005', '滁州市', '2', '14234', 'C');
INSERT INTO `ey_region` VALUES ('15006', '市辖区', '3', '15005', 'S');
INSERT INTO `ey_region` VALUES ('15007', '琅琊区', '3', '15005', 'L');
INSERT INTO `ey_region` VALUES ('15016', '南谯区', '3', '15005', 'N');
INSERT INTO `ey_region` VALUES ('15034', '来安县', '3', '15005', 'L');
INSERT INTO `ey_region` VALUES ('15053', '全椒县', '3', '15005', 'Q');
INSERT INTO `ey_region` VALUES ('15071', '定远县', '3', '15005', 'D');
INSERT INTO `ey_region` VALUES ('15109', '凤阳县', '3', '15005', 'F');
INSERT INTO `ey_region` VALUES ('15136', '天长市', '3', '15005', 'T');
INSERT INTO `ey_region` VALUES ('15166', '明光市', '3', '15005', 'M');
INSERT INTO `ey_region` VALUES ('15194', '阜阳市', '2', '14234', 'F');
INSERT INTO `ey_region` VALUES ('15195', '市辖区', '3', '15194', 'S');
INSERT INTO `ey_region` VALUES ('15196', '颍州区', '3', '15194', 'Y');
INSERT INTO `ey_region` VALUES ('15211', '颍东区', '3', '15194', 'Y');
INSERT INTO `ey_region` VALUES ('15224', '颍泉区', '3', '15194', 'Y');
INSERT INTO `ey_region` VALUES ('15231', '临泉县', '3', '15194', 'L');
INSERT INTO `ey_region` VALUES ('15264', '太和县', '3', '15194', 'T');
INSERT INTO `ey_region` VALUES ('15296', '阜南县', '3', '15194', 'F');
INSERT INTO `ey_region` VALUES ('15328', '颍上县', '3', '15194', 'Y');
INSERT INTO `ey_region` VALUES ('15359', '界首市', '3', '15194', 'J');
INSERT INTO `ey_region` VALUES ('15378', '宿州市', '2', '14234', 'S');
INSERT INTO `ey_region` VALUES ('15379', '市辖区', '3', '15378', 'S');
INSERT INTO `ey_region` VALUES ('15380', '墉桥区', '3', '15378', 'Y');
INSERT INTO `ey_region` VALUES ('15417', '砀山县', '3', '15378', 'D');
INSERT INTO `ey_region` VALUES ('15437', '萧县', '3', '15378', 'X');
INSERT INTO `ey_region` VALUES ('15461', '灵璧县', '3', '15378', 'L');
INSERT INTO `ey_region` VALUES ('15482', '泗县', '3', '15378', 'S');
INSERT INTO `ey_region` VALUES ('15499', '巢湖市', '2', '14234', 'C');
INSERT INTO `ey_region` VALUES ('15500', '市辖区', '3', '15499', 'S');
INSERT INTO `ey_region` VALUES ('15501', '居巢区', '3', '15499', 'J');
INSERT INTO `ey_region` VALUES ('15520', '庐江县', '3', '15499', 'L');
INSERT INTO `ey_region` VALUES ('15542', '无为县', '3', '15499', 'W');
INSERT INTO `ey_region` VALUES ('15566', '含山县', '3', '15499', 'H');
INSERT INTO `ey_region` VALUES ('15575', '和县', '3', '15499', 'H');
INSERT INTO `ey_region` VALUES ('15586', '六安市', '2', '14234', 'L');
INSERT INTO `ey_region` VALUES ('15587', '市辖区', '3', '15586', 'S');
INSERT INTO `ey_region` VALUES ('15588', '金安区', '3', '15586', 'J');
INSERT INTO `ey_region` VALUES ('15612', '裕安区', '3', '15586', 'Y');
INSERT INTO `ey_region` VALUES ('15635', '寿县', '3', '15586', 'S');
INSERT INTO `ey_region` VALUES ('15662', '霍邱县', '3', '15586', 'H');
INSERT INTO `ey_region` VALUES ('15698', '舒城县', '3', '15586', 'S');
INSERT INTO `ey_region` VALUES ('15720', '金寨县', '3', '15586', 'J');
INSERT INTO `ey_region` VALUES ('15747', '霍山县', '3', '15586', 'H');
INSERT INTO `ey_region` VALUES ('15764', '亳州市', '2', '14234', 'H');
INSERT INTO `ey_region` VALUES ('15765', '市辖区', '3', '15764', 'S');
INSERT INTO `ey_region` VALUES ('15766', '谯城区', '3', '15764', 'Q');
INSERT INTO `ey_region` VALUES ('15795', '涡阳县', '3', '15764', 'W');
INSERT INTO `ey_region` VALUES ('15823', '蒙城县', '3', '15764', 'M');
INSERT INTO `ey_region` VALUES ('15843', '利辛县', '3', '15764', 'L');
INSERT INTO `ey_region` VALUES ('15871', '池州市', '2', '14234', 'C');
INSERT INTO `ey_region` VALUES ('15872', '市辖区', '3', '15871', 'S');
INSERT INTO `ey_region` VALUES ('15873', '贵池区', '3', '15871', 'G');
INSERT INTO `ey_region` VALUES ('15900', '东至县', '3', '15871', 'D');
INSERT INTO `ey_region` VALUES ('15930', '石台县', '3', '15871', 'S');
INSERT INTO `ey_region` VALUES ('15944', '青阳县', '3', '15871', 'Q');
INSERT INTO `ey_region` VALUES ('15958', '宣城市', '2', '14234', 'X');
INSERT INTO `ey_region` VALUES ('15959', '市辖区', '3', '15958', 'S');
INSERT INTO `ey_region` VALUES ('15960', '宣州区', '3', '15958', 'X');
INSERT INTO `ey_region` VALUES ('15987', '郎溪县', '3', '15958', 'L');
INSERT INTO `ey_region` VALUES ('16001', '广德县', '3', '15958', 'G');
INSERT INTO `ey_region` VALUES ('16013', '泾县', '3', '15958', 'J');
INSERT INTO `ey_region` VALUES ('16025', '绩溪县', '3', '15958', 'J');
INSERT INTO `ey_region` VALUES ('16037', '旌德县', '3', '15958', 'J');
INSERT INTO `ey_region` VALUES ('16048', '宁国市', '3', '15958', 'N');
INSERT INTO `ey_region` VALUES ('16068', '福建省', '1', '0', 'F');
INSERT INTO `ey_region` VALUES ('16069', '福州市', '2', '16068', 'F');
INSERT INTO `ey_region` VALUES ('16070', '市辖区', '3', '16069', 'S');
INSERT INTO `ey_region` VALUES ('16071', '鼓楼区', '3', '16069', 'G');
INSERT INTO `ey_region` VALUES ('16082', '台江区', '3', '16069', 'T');
INSERT INTO `ey_region` VALUES ('16093', '仓山区', '3', '16069', 'C');
INSERT INTO `ey_region` VALUES ('16108', '马尾区', '3', '16069', 'M');
INSERT INTO `ey_region` VALUES ('16113', '晋安区', '3', '16069', 'J');
INSERT INTO `ey_region` VALUES ('16123', '闽侯县', '3', '16069', 'M');
INSERT INTO `ey_region` VALUES ('16140', '连江县', '3', '16069', 'L');
INSERT INTO `ey_region` VALUES ('16164', '罗源县', '3', '16069', 'L');
INSERT INTO `ey_region` VALUES ('16177', '闽清县', '3', '16069', 'M');
INSERT INTO `ey_region` VALUES ('16194', '永泰县', '3', '16069', 'Y');
INSERT INTO `ey_region` VALUES ('16216', '平潭县', '3', '16069', 'P');
INSERT INTO `ey_region` VALUES ('16232', '福清市', '3', '16069', 'F');
INSERT INTO `ey_region` VALUES ('16259', '长乐市', '3', '16069', 'C');
INSERT INTO `ey_region` VALUES ('16278', '厦门市', '2', '16068', 'X');
INSERT INTO `ey_region` VALUES ('16279', '市辖区', '3', '16278', 'S');
INSERT INTO `ey_region` VALUES ('16280', '思明区', '3', '16278', 'S');
INSERT INTO `ey_region` VALUES ('16294', '海沧区', '3', '16278', 'H');
INSERT INTO `ey_region` VALUES ('16303', '湖里区', '3', '16278', 'H');
INSERT INTO `ey_region` VALUES ('16315', '集美区', '3', '16278', 'J');
INSERT INTO `ey_region` VALUES ('16326', '同安区', '3', '16278', 'T');
INSERT INTO `ey_region` VALUES ('16341', '翔安区', '3', '16278', 'X');
INSERT INTO `ey_region` VALUES ('16348', '莆田市', '2', '16068', 'P');
INSERT INTO `ey_region` VALUES ('16349', '市辖区', '3', '16348', 'S');
INSERT INTO `ey_region` VALUES ('16350', '城厢区', '3', '16348', 'C');
INSERT INTO `ey_region` VALUES ('16358', '涵江区', '3', '16348', 'H');
INSERT INTO `ey_region` VALUES ('16372', '荔城区', '3', '16348', 'L');
INSERT INTO `ey_region` VALUES ('16379', '秀屿区', '3', '16348', 'X');
INSERT INTO `ey_region` VALUES ('16393', '仙游县', '3', '16348', 'X');
INSERT INTO `ey_region` VALUES ('16412', '三明市', '2', '16068', 'S');
INSERT INTO `ey_region` VALUES ('16413', '市辖区', '3', '16412', 'S');
INSERT INTO `ey_region` VALUES ('16414', '梅列区', '3', '16412', 'M');
INSERT INTO `ey_region` VALUES ('16421', '三元区', '3', '16412', 'S');
INSERT INTO `ey_region` VALUES ('16430', '明溪县', '3', '16412', 'M');
INSERT INTO `ey_region` VALUES ('16440', '清流县', '3', '16412', 'Q');
INSERT INTO `ey_region` VALUES ('16455', '宁化县', '3', '16412', 'N');
INSERT INTO `ey_region` VALUES ('16472', '大田县', '3', '16412', 'D');
INSERT INTO `ey_region` VALUES ('16492', '尤溪县', '3', '16412', 'Y');
INSERT INTO `ey_region` VALUES ('16508', '沙县', '3', '16412', 'S');
INSERT INTO `ey_region` VALUES ('16521', '将乐县', '3', '16412', 'J');
INSERT INTO `ey_region` VALUES ('16535', '泰宁县', '3', '16412', 'T');
INSERT INTO `ey_region` VALUES ('16545', '建宁县', '3', '16412', 'J');
INSERT INTO `ey_region` VALUES ('16556', '永安市', '3', '16412', 'Y');
INSERT INTO `ey_region` VALUES ('16572', '泉州市', '2', '16068', 'Q');
INSERT INTO `ey_region` VALUES ('16573', '市辖区', '3', '16572', 'S');
INSERT INTO `ey_region` VALUES ('16574', '鲤城区', '3', '16572', 'L');
INSERT INTO `ey_region` VALUES ('16584', '丰泽区', '3', '16572', 'F');
INSERT INTO `ey_region` VALUES ('16593', '洛江区', '3', '16572', 'L');
INSERT INTO `ey_region` VALUES ('16600', '泉港区', '3', '16572', 'Q');
INSERT INTO `ey_region` VALUES ('16608', '惠安县', '3', '16572', 'H');
INSERT INTO `ey_region` VALUES ('16625', '安溪县', '3', '16572', 'A');
INSERT INTO `ey_region` VALUES ('16650', '永春县', '3', '16572', 'Y');
INSERT INTO `ey_region` VALUES ('16673', '德化县', '3', '16572', 'D');
INSERT INTO `ey_region` VALUES ('16692', '金门县', '3', '16572', 'J');
INSERT INTO `ey_region` VALUES ('16693', '石狮市', '3', '16572', 'S');
INSERT INTO `ey_region` VALUES ('16703', '晋江市', '3', '16572', 'J');
INSERT INTO `ey_region` VALUES ('16726', '南安市', '3', '16572', 'N');
INSERT INTO `ey_region` VALUES ('16754', '漳州市', '2', '16068', 'Z');
INSERT INTO `ey_region` VALUES ('16755', '市辖区', '3', '16754', 'S');
INSERT INTO `ey_region` VALUES ('16756', '芗城区', '3', '16754', 'X');
INSERT INTO `ey_region` VALUES ('16772', '龙文区', '3', '16754', 'L');
INSERT INTO `ey_region` VALUES ('16778', '云霄县', '3', '16754', 'Y');
INSERT INTO `ey_region` VALUES ('16790', '漳浦县', '3', '16754', 'Z');
INSERT INTO `ey_region` VALUES ('16821', '诏安县', '3', '16754', 'Z');
INSERT INTO `ey_region` VALUES ('16842', '长泰县', '3', '16754', 'C');
INSERT INTO `ey_region` VALUES ('16852', '东山县', '3', '16754', 'D');
INSERT INTO `ey_region` VALUES ('16860', '南靖县', '3', '16754', 'N');
INSERT INTO `ey_region` VALUES ('16872', '平和县', '3', '16754', 'P');
INSERT INTO `ey_region` VALUES ('16889', '华安县', '3', '16754', 'H');
INSERT INTO `ey_region` VALUES ('16899', '龙海市', '3', '16754', 'L');
INSERT INTO `ey_region` VALUES ('16924', '南平市', '2', '16068', 'N');
INSERT INTO `ey_region` VALUES ('16925', '市辖区', '3', '16924', 'S');
INSERT INTO `ey_region` VALUES ('16926', '延平区', '3', '16924', 'Y');
INSERT INTO `ey_region` VALUES ('16948', '顺昌县', '3', '16924', 'S');
INSERT INTO `ey_region` VALUES ('16961', '浦城县', '3', '16924', 'P');
INSERT INTO `ey_region` VALUES ('16982', '光泽县', '3', '16924', 'G');
INSERT INTO `ey_region` VALUES ('16991', '松溪县', '3', '16924', 'S');
INSERT INTO `ey_region` VALUES ('17001', '政和县', '3', '16924', 'Z');
INSERT INTO `ey_region` VALUES ('17012', '邵武市', '3', '16924', 'S');
INSERT INTO `ey_region` VALUES ('17033', '武夷山市', '3', '16924', 'W');
INSERT INTO `ey_region` VALUES ('17044', '建瓯市', '3', '16924', 'J');
INSERT INTO `ey_region` VALUES ('17063', '建阳市', '3', '16924', 'J');
INSERT INTO `ey_region` VALUES ('17077', '龙岩市', '2', '16068', 'L');
INSERT INTO `ey_region` VALUES ('17078', '市辖区', '3', '17077', 'S');
INSERT INTO `ey_region` VALUES ('17079', '新罗区', '3', '17077', 'X');
INSERT INTO `ey_region` VALUES ('17099', '长汀县', '3', '17077', 'C');
INSERT INTO `ey_region` VALUES ('17118', '永定县', '3', '17077', 'Y');
INSERT INTO `ey_region` VALUES ('17143', '上杭县', '3', '17077', 'S');
INSERT INTO `ey_region` VALUES ('17166', '武平县', '3', '17077', 'W');
INSERT INTO `ey_region` VALUES ('17184', '连城县', '3', '17077', 'L');
INSERT INTO `ey_region` VALUES ('17202', '漳平市', '3', '17077', 'Z');
INSERT INTO `ey_region` VALUES ('17219', '宁德市　', '2', '16068', 'N');
INSERT INTO `ey_region` VALUES ('17220', '市辖区', '3', '17219', 'S');
INSERT INTO `ey_region` VALUES ('17221', '蕉城区', '3', '17219', 'J');
INSERT INTO `ey_region` VALUES ('17239', '霞浦县', '3', '17219', 'X');
INSERT INTO `ey_region` VALUES ('17254', '古田县', '3', '17219', 'G');
INSERT INTO `ey_region` VALUES ('17269', '屏南县', '3', '17219', 'P');
INSERT INTO `ey_region` VALUES ('17281', '寿宁县', '3', '17219', 'S');
INSERT INTO `ey_region` VALUES ('17296', '周宁县', '3', '17219', 'Z');
INSERT INTO `ey_region` VALUES ('17306', '柘荣县', '3', '17219', 'Z');
INSERT INTO `ey_region` VALUES ('17316', '福安市', '3', '17219', 'F');
INSERT INTO `ey_region` VALUES ('17341', '福鼎市', '3', '17219', 'F');
INSERT INTO `ey_region` VALUES ('17359', '江西省', '1', '0', 'J');
INSERT INTO `ey_region` VALUES ('17360', '南昌市', '2', '17359', 'N');
INSERT INTO `ey_region` VALUES ('17361', '市辖区', '3', '17360', 'S');
INSERT INTO `ey_region` VALUES ('17362', '东湖区', '3', '17360', 'D');
INSERT INTO `ey_region` VALUES ('17374', '西湖区', '3', '17360', 'X');
INSERT INTO `ey_region` VALUES ('17387', '青云谱区', '3', '17360', 'Q');
INSERT INTO `ey_region` VALUES ('17395', '湾里区', '3', '17360', 'W');
INSERT INTO `ey_region` VALUES ('17402', '青山湖区', '3', '17360', 'Q');
INSERT INTO `ey_region` VALUES ('17420', '南昌县', '3', '17360', 'N');
INSERT INTO `ey_region` VALUES ('17443', '新建县', '3', '17360', 'X');
INSERT INTO `ey_region` VALUES ('17471', '安义县', '3', '17360', 'A');
INSERT INTO `ey_region` VALUES ('17485', '进贤县', '3', '17360', 'J');
INSERT INTO `ey_region` VALUES ('17508', '景德镇市', '2', '17359', 'J');
INSERT INTO `ey_region` VALUES ('17509', '市辖区', '3', '17508', 'S');
INSERT INTO `ey_region` VALUES ('17510', '昌江区', '3', '17508', 'C');
INSERT INTO `ey_region` VALUES ('17534', '珠山区', '3', '17508', 'Z');
INSERT INTO `ey_region` VALUES ('17545', '浮梁县', '3', '17508', 'F');
INSERT INTO `ey_region` VALUES ('17568', '乐平市', '3', '17508', 'L');
INSERT INTO `ey_region` VALUES ('17589', '萍乡市', '2', '17359', 'P');
INSERT INTO `ey_region` VALUES ('17590', '市辖区', '3', '17589', 'S');
INSERT INTO `ey_region` VALUES ('17591', '安源区', '3', '17589', 'A');
INSERT INTO `ey_region` VALUES ('17604', '湘东区', '3', '17589', 'X');
INSERT INTO `ey_region` VALUES ('17616', '莲花县', '3', '17589', 'L');
INSERT INTO `ey_region` VALUES ('17630', '上栗县', '3', '17589', 'S');
INSERT INTO `ey_region` VALUES ('17640', '芦溪县', '3', '17589', 'L');
INSERT INTO `ey_region` VALUES ('17651', '九江市', '2', '17359', 'J');
INSERT INTO `ey_region` VALUES ('17652', '市辖区', '3', '17651', 'S');
INSERT INTO `ey_region` VALUES ('17653', '庐山区', '3', '17651', 'L');
INSERT INTO `ey_region` VALUES ('17667', '浔阳区', '3', '17651', 'X');
INSERT INTO `ey_region` VALUES ('17676', '九江县', '3', '17651', 'J');
INSERT INTO `ey_region` VALUES ('17693', '武宁县', '3', '17651', 'W');
INSERT INTO `ey_region` VALUES ('17714', '修水县', '3', '17651', 'X');
INSERT INTO `ey_region` VALUES ('17751', '永修县', '3', '17651', 'Y');
INSERT INTO `ey_region` VALUES ('17773', '德安县', '3', '17651', 'D');
INSERT INTO `ey_region` VALUES ('17792', '星子县', '3', '17651', 'X');
INSERT INTO `ey_region` VALUES ('17807', '都昌县', '3', '17651', 'D');
INSERT INTO `ey_region` VALUES ('17834', '湖口县', '3', '17651', 'H');
INSERT INTO `ey_region` VALUES ('17849', '彭泽县', '3', '17651', 'P');
INSERT INTO `ey_region` VALUES ('17872', '瑞昌市', '3', '17651', 'R');
INSERT INTO `ey_region` VALUES ('17894', '新余市', '2', '17359', 'X');
INSERT INTO `ey_region` VALUES ('17895', '市辖区', '3', '17894', 'S');
INSERT INTO `ey_region` VALUES ('17896', '渝水区', '3', '17894', 'Y');
INSERT INTO `ey_region` VALUES ('17917', '分宜县', '3', '17894', 'F');
INSERT INTO `ey_region` VALUES ('17934', '鹰潭市', '2', '17359', 'Y');
INSERT INTO `ey_region` VALUES ('17935', '市辖区', '3', '17934', 'S');
INSERT INTO `ey_region` VALUES ('17936', '月湖区', '3', '17934', 'Y');
INSERT INTO `ey_region` VALUES ('17945', '余江县', '3', '17934', 'Y');
INSERT INTO `ey_region` VALUES ('17966', '贵溪市', '3', '17934', 'G');
INSERT INTO `ey_region` VALUES ('17999', '赣州市', '2', '17359', 'G');
INSERT INTO `ey_region` VALUES ('18000', '市辖区', '3', '17999', 'S');
INSERT INTO `ey_region` VALUES ('18001', '章贡区', '3', '17999', 'Z');
INSERT INTO `ey_region` VALUES ('18016', '赣县', '3', '17999', 'G');
INSERT INTO `ey_region` VALUES ('18037', '信丰县', '3', '17999', 'X');
INSERT INTO `ey_region` VALUES ('18055', '大余县', '3', '17999', 'D');
INSERT INTO `ey_region` VALUES ('18068', '上犹县', '3', '17999', 'S');
INSERT INTO `ey_region` VALUES ('18084', '崇义县', '3', '17999', 'C');
INSERT INTO `ey_region` VALUES ('18102', '安远县', '3', '17999', 'A');
INSERT INTO `ey_region` VALUES ('18122', '龙南县', '3', '17999', 'L');
INSERT INTO `ey_region` VALUES ('18139', '定南县', '3', '17999', 'D');
INSERT INTO `ey_region` VALUES ('18148', '全南县', '3', '17999', 'Q');
INSERT INTO `ey_region` VALUES ('18161', '宁都县', '3', '17999', 'N');
INSERT INTO `ey_region` VALUES ('18187', '于都县', '3', '17999', 'Y');
INSERT INTO `ey_region` VALUES ('18212', '兴国县', '3', '17999', 'X');
INSERT INTO `ey_region` VALUES ('18239', '会昌县', '3', '17999', 'H');
INSERT INTO `ey_region` VALUES ('18260', '寻乌县', '3', '17999', 'X');
INSERT INTO `ey_region` VALUES ('18276', '石城县', '3', '17999', 'S');
INSERT INTO `ey_region` VALUES ('18287', '瑞金市', '3', '17999', 'R');
INSERT INTO `ey_region` VALUES ('18306', '南康市', '3', '17999', 'N');
INSERT INTO `ey_region` VALUES ('18330', '吉安市', '2', '17359', 'J');
INSERT INTO `ey_region` VALUES ('18331', '市辖区', '3', '18330', 'S');
INSERT INTO `ey_region` VALUES ('18332', '吉州区', '3', '18330', 'J');
INSERT INTO `ey_region` VALUES ('18345', '青原区', '3', '18330', 'Q');
INSERT INTO `ey_region` VALUES ('18356', '吉安县', '3', '18330', 'J');
INSERT INTO `ey_region` VALUES ('18378', '吉水县', '3', '18330', 'J');
INSERT INTO `ey_region` VALUES ('18398', '峡江县', '3', '18330', 'X');
INSERT INTO `ey_region` VALUES ('18411', '新干县', '3', '18330', 'X');
INSERT INTO `ey_region` VALUES ('18429', '永丰县', '3', '18330', 'Y');
INSERT INTO `ey_region` VALUES ('18454', '泰和县', '3', '18330', 'T');
INSERT INTO `ey_region` VALUES ('18483', '遂川县', '3', '18330', 'S');
INSERT INTO `ey_region` VALUES ('18510', '万安县', '3', '18330', 'W');
INSERT INTO `ey_region` VALUES ('18529', '安福县', '3', '18330', 'A');
INSERT INTO `ey_region` VALUES ('18550', '永新县', '3', '18330', 'Y');
INSERT INTO `ey_region` VALUES ('18575', '井冈山市', '3', '18330', 'J');
INSERT INTO `ey_region` VALUES ('18598', '宜春市', '2', '17359', 'Y');
INSERT INTO `ey_region` VALUES ('18599', '市辖区', '3', '18598', 'S');
INSERT INTO `ey_region` VALUES ('18600', '袁州区', '3', '18598', 'Y');
INSERT INTO `ey_region` VALUES ('18639', '奉新县', '3', '18598', 'F');
INSERT INTO `ey_region` VALUES ('18659', '万载县', '3', '18598', 'W');
INSERT INTO `ey_region` VALUES ('18678', '上高县', '3', '18598', 'S');
INSERT INTO `ey_region` VALUES ('18696', '宜丰县', '3', '18598', 'Y');
INSERT INTO `ey_region` VALUES ('18714', '靖安县', '3', '18598', 'J');
INSERT INTO `ey_region` VALUES ('18727', '铜鼓县', '3', '18598', 'T');
INSERT INTO `ey_region` VALUES ('18741', '丰城市', '3', '18598', 'F');
INSERT INTO `ey_region` VALUES ('18777', '樟树市', '3', '18598', 'Z');
INSERT INTO `ey_region` VALUES ('18799', '高安市', '3', '18598', 'G');
INSERT INTO `ey_region` VALUES ('18829', '抚州市', '2', '17359', 'F');
INSERT INTO `ey_region` VALUES ('18830', '市辖区', '3', '18829', 'S');
INSERT INTO `ey_region` VALUES ('18831', '临川区', '3', '18829', 'L');
INSERT INTO `ey_region` VALUES ('18869', '南城县', '3', '18829', 'N');
INSERT INTO `ey_region` VALUES ('18882', '黎川县', '3', '18829', 'L');
INSERT INTO `ey_region` VALUES ('18900', '南丰县', '3', '18829', 'N');
INSERT INTO `ey_region` VALUES ('18915', '崇仁县', '3', '18829', 'C');
INSERT INTO `ey_region` VALUES ('18931', '乐安县', '3', '18829', 'L');
INSERT INTO `ey_region` VALUES ('18949', '宜黄县', '3', '18829', 'Y');
INSERT INTO `ey_region` VALUES ('18965', '金溪县', '3', '18829', 'J');
INSERT INTO `ey_region` VALUES ('18980', '资溪县', '3', '18829', 'Z');
INSERT INTO `ey_region` VALUES ('18988', '东乡县', '3', '18829', 'D');
INSERT INTO `ey_region` VALUES ('19010', '广昌县', '3', '18829', 'G');
INSERT INTO `ey_region` VALUES ('19024', '上饶市', '2', '17359', 'S');
INSERT INTO `ey_region` VALUES ('19025', '市辖区', '3', '19024', 'S');
INSERT INTO `ey_region` VALUES ('19026', '信州区', '3', '19024', 'X');
INSERT INTO `ey_region` VALUES ('19038', '上饶县', '3', '19024', 'S');
INSERT INTO `ey_region` VALUES ('19062', '广丰县', '3', '19024', 'G');
INSERT INTO `ey_region` VALUES ('19088', '玉山县', '3', '19024', 'Y');
INSERT INTO `ey_region` VALUES ('19108', '铅山县', '3', '19024', 'Q');
INSERT INTO `ey_region` VALUES ('19136', '横峰县', '3', '19024', 'H');
INSERT INTO `ey_region` VALUES ('19151', '弋阳县', '3', '19024', 'Y');
INSERT INTO `ey_region` VALUES ('19171', '余干县', '3', '19024', 'Y');
INSERT INTO `ey_region` VALUES ('19202', '鄱阳县', '3', '19024', 'P');
INSERT INTO `ey_region` VALUES ('19234', '万年县', '3', '19024', 'W');
INSERT INTO `ey_region` VALUES ('19248', '婺源县', '3', '19024', 'W');
INSERT INTO `ey_region` VALUES ('19265', '德兴市', '3', '19024', 'D');
INSERT INTO `ey_region` VALUES ('19280', '山东省', '1', '0', 'S');
INSERT INTO `ey_region` VALUES ('19281', '济南市', '2', '19280', 'J');
INSERT INTO `ey_region` VALUES ('19282', '市辖区', '3', '19281', 'S');
INSERT INTO `ey_region` VALUES ('19283', '历下区', '3', '19281', 'L');
INSERT INTO `ey_region` VALUES ('19295', '市中区', '3', '19281', 'S');
INSERT INTO `ey_region` VALUES ('19311', '槐荫区', '3', '19281', 'H');
INSERT INTO `ey_region` VALUES ('19326', '天桥区', '3', '19281', 'T');
INSERT INTO `ey_region` VALUES ('19342', '历城区', '3', '19281', 'L');
INSERT INTO `ey_region` VALUES ('19359', '长清区', '3', '19281', 'C');
INSERT INTO `ey_region` VALUES ('19370', '平阴县', '3', '19281', 'P');
INSERT INTO `ey_region` VALUES ('19378', '济阳县', '3', '19281', 'J');
INSERT INTO `ey_region` VALUES ('19387', '商河县', '3', '19281', 'S');
INSERT INTO `ey_region` VALUES ('19400', '章丘市', '3', '19281', 'Z');
INSERT INTO `ey_region` VALUES ('19421', '青岛市', '2', '19280', 'Q');
INSERT INTO `ey_region` VALUES ('19422', '市辖区', '3', '19421', 'S');
INSERT INTO `ey_region` VALUES ('19423', '市南区', '3', '19421', 'S');
INSERT INTO `ey_region` VALUES ('19438', '市北区', '3', '19421', 'S');
INSERT INTO `ey_region` VALUES ('19456', '四方区', '3', '19421', 'S');
INSERT INTO `ey_region` VALUES ('19464', '黄岛区', '3', '19421', 'H');
INSERT INTO `ey_region` VALUES ('19471', '崂山区', '3', '19421', 'L');
INSERT INTO `ey_region` VALUES ('19476', '李沧区', '3', '19421', 'L');
INSERT INTO `ey_region` VALUES ('19488', '城阳区', '3', '19421', 'C');
INSERT INTO `ey_region` VALUES ('19497', '胶州市', '3', '19421', 'J');
INSERT INTO `ey_region` VALUES ('19516', '即墨市', '3', '19421', 'J');
INSERT INTO `ey_region` VALUES ('19540', '平度市', '3', '19421', 'P');
INSERT INTO `ey_region` VALUES ('19572', '胶南市', '3', '19421', 'J');
INSERT INTO `ey_region` VALUES ('19590', '莱西市', '3', '19421', 'L');
INSERT INTO `ey_region` VALUES ('19608', '淄博市', '2', '19280', 'Z');
INSERT INTO `ey_region` VALUES ('19609', '市辖区', '3', '19608', 'S');
INSERT INTO `ey_region` VALUES ('19610', '淄川区', '3', '19608', 'Z');
INSERT INTO `ey_region` VALUES ('19632', '张店区', '3', '19608', 'Z');
INSERT INTO `ey_region` VALUES ('19649', '博山区', '3', '19608', 'B');
INSERT INTO `ey_region` VALUES ('19663', '临淄区', '3', '19608', 'L');
INSERT INTO `ey_region` VALUES ('19678', '周村区', '3', '19608', 'Z');
INSERT INTO `ey_region` VALUES ('19688', '桓台县', '3', '19608', 'H');
INSERT INTO `ey_region` VALUES ('19700', '高青县', '3', '19608', 'G');
INSERT INTO `ey_region` VALUES ('19710', '沂源县', '3', '19608', 'Y');
INSERT INTO `ey_region` VALUES ('19724', '枣庄市', '2', '19280', 'Z');
INSERT INTO `ey_region` VALUES ('19725', '市辖区', '3', '19724', 'S');
INSERT INTO `ey_region` VALUES ('19726', '市中区', '3', '19724', 'S');
INSERT INTO `ey_region` VALUES ('19738', '薛城区', '3', '19724', 'X');
INSERT INTO `ey_region` VALUES ('19748', '峄城区', '3', '19724', 'Y');
INSERT INTO `ey_region` VALUES ('19756', '台儿庄区', '3', '19724', 'T');
INSERT INTO `ey_region` VALUES ('19763', '山亭区', '3', '19724', 'S');
INSERT INTO `ey_region` VALUES ('19774', '滕州市', '3', '19724', 'T');
INSERT INTO `ey_region` VALUES ('19796', '东营市', '2', '19280', 'D');
INSERT INTO `ey_region` VALUES ('19797', '市辖区', '3', '19796', 'S');
INSERT INTO `ey_region` VALUES ('19798', '东营区', '3', '19796', 'D');
INSERT INTO `ey_region` VALUES ('19809', '河口区', '3', '19796', 'H');
INSERT INTO `ey_region` VALUES ('19817', '垦利县', '3', '19796', 'K');
INSERT INTO `ey_region` VALUES ('19825', '利津县', '3', '19796', 'L');
INSERT INTO `ey_region` VALUES ('19835', '广饶县', '3', '19796', 'G');
INSERT INTO `ey_region` VALUES ('19846', '烟台市', '2', '19280', 'Y');
INSERT INTO `ey_region` VALUES ('19847', '市辖区', '3', '19846', 'S');
INSERT INTO `ey_region` VALUES ('19848', '芝罘区', '3', '19846', 'Z');
INSERT INTO `ey_region` VALUES ('19861', '福山区', '3', '19846', 'F');
INSERT INTO `ey_region` VALUES ('19873', '牟平区', '3', '19846', 'M');
INSERT INTO `ey_region` VALUES ('19887', '莱山区', '3', '19846', 'L');
INSERT INTO `ey_region` VALUES ('19893', '长岛县', '3', '19846', 'C');
INSERT INTO `ey_region` VALUES ('19902', '龙口市', '3', '19846', 'L');
INSERT INTO `ey_region` VALUES ('19916', '莱阳市', '3', '19846', 'L');
INSERT INTO `ey_region` VALUES ('19935', '莱州市', '3', '19846', 'L');
INSERT INTO `ey_region` VALUES ('19952', '蓬莱市', '3', '19846', 'P');
INSERT INTO `ey_region` VALUES ('19965', '招远市', '3', '19846', 'Z');
INSERT INTO `ey_region` VALUES ('19980', '栖霞市', '3', '19846', 'Q');
INSERT INTO `ey_region` VALUES ('19996', '海阳市', '3', '19846', 'H');
INSERT INTO `ey_region` VALUES ('20012', '潍坊市', '2', '19280', 'W');
INSERT INTO `ey_region` VALUES ('20013', '市辖区', '3', '20012', 'S');
INSERT INTO `ey_region` VALUES ('20014', '潍城区', '3', '20012', 'W');
INSERT INTO `ey_region` VALUES ('20023', '寒亭区', '3', '20012', 'H');
INSERT INTO `ey_region` VALUES ('20034', '坊子区', '3', '20012', 'F');
INSERT INTO `ey_region` VALUES ('20043', '奎文区', '3', '20012', 'K');
INSERT INTO `ey_region` VALUES ('20055', '临朐县', '3', '20012', 'L');
INSERT INTO `ey_region` VALUES ('20074', '昌乐县', '3', '20012', 'C');
INSERT INTO `ey_region` VALUES ('20091', '青州市', '3', '20012', 'Q');
INSERT INTO `ey_region` VALUES ('20113', '诸城市', '3', '20012', 'Z');
INSERT INTO `ey_region` VALUES ('20137', '寿光市', '3', '20012', 'S');
INSERT INTO `ey_region` VALUES ('20155', '安丘市', '3', '20012', 'A');
INSERT INTO `ey_region` VALUES ('20179', '高密市', '3', '20012', 'G');
INSERT INTO `ey_region` VALUES ('20200', '昌邑市', '3', '20012', 'C');
INSERT INTO `ey_region` VALUES ('20216', '济宁市', '2', '19280', 'J');
INSERT INTO `ey_region` VALUES ('20217', '市辖区', '3', '20216', 'S');
INSERT INTO `ey_region` VALUES ('20218', '市中区', '3', '20216', 'S');
INSERT INTO `ey_region` VALUES ('20227', '任城区', '3', '20216', 'R');
INSERT INTO `ey_region` VALUES ('20257', '鱼台县', '3', '20216', 'Y');
INSERT INTO `ey_region` VALUES ('20268', '金乡县', '3', '20216', 'J');
INSERT INTO `ey_region` VALUES ('20282', '嘉祥县', '3', '20216', 'J');
INSERT INTO `ey_region` VALUES ('20298', '汶上县', '3', '20216', 'W');
INSERT INTO `ey_region` VALUES ('20313', '泗水县', '3', '20216', 'S');
INSERT INTO `ey_region` VALUES ('20327', '梁山县', '3', '20216', 'L');
INSERT INTO `ey_region` VALUES ('20342', '曲阜市', '3', '20216', 'Q');
INSERT INTO `ey_region` VALUES ('20355', '兖州市', '3', '20216', 'Y');
INSERT INTO `ey_region` VALUES ('20368', '邹城市', '3', '20216', 'Z');
INSERT INTO `ey_region` VALUES ('20386', '泰安市', '2', '19280', 'T');
INSERT INTO `ey_region` VALUES ('20387', '市辖区', '3', '20386', 'S');
INSERT INTO `ey_region` VALUES ('20388', '泰山区', '3', '20386', 'T');
INSERT INTO `ey_region` VALUES ('20397', '岱岳区', '3', '20386', 'D');
INSERT INTO `ey_region` VALUES ('20416', '宁阳县', '3', '20386', 'N');
INSERT INTO `ey_region` VALUES ('20429', '东平县', '3', '20386', 'D');
INSERT INTO `ey_region` VALUES ('20444', '新泰市', '3', '20386', 'X');
INSERT INTO `ey_region` VALUES ('20465', '肥城市', '3', '20386', 'F');
INSERT INTO `ey_region` VALUES ('20480', '威海市', '2', '19280', 'W');
INSERT INTO `ey_region` VALUES ('20481', '市辖区', '3', '20480', 'S');
INSERT INTO `ey_region` VALUES ('20482', '环翠区', '3', '20480', 'H');
INSERT INTO `ey_region` VALUES ('20500', '文登市', '3', '20480', 'W');
INSERT INTO `ey_region` VALUES ('20519', '荣成市', '3', '20480', 'R');
INSERT INTO `ey_region` VALUES ('20542', '乳山市', '3', '20480', 'R');
INSERT INTO `ey_region` VALUES ('20558', '日照市', '2', '19280', 'R');
INSERT INTO `ey_region` VALUES ('20559', '市辖区', '3', '20558', 'S');
INSERT INTO `ey_region` VALUES ('20560', '东港区', '3', '20558', 'D');
INSERT INTO `ey_region` VALUES ('20573', '岚山区', '3', '20558', 'L');
INSERT INTO `ey_region` VALUES ('20583', '五莲县', '3', '20558', 'W');
INSERT INTO `ey_region` VALUES ('20596', '莒县', '3', '20558', 'J');
INSERT INTO `ey_region` VALUES ('20618', '莱芜市', '2', '19280', 'L');
INSERT INTO `ey_region` VALUES ('20619', '市辖区', '3', '20618', 'S');
INSERT INTO `ey_region` VALUES ('20620', '莱城区', '3', '20618', 'L');
INSERT INTO `ey_region` VALUES ('20636', '钢城区', '3', '20618', 'G');
INSERT INTO `ey_region` VALUES ('20642', '临沂市', '2', '19280', 'L');
INSERT INTO `ey_region` VALUES ('20643', '临沂市辖区', '3', '20642', 'L');
INSERT INTO `ey_region` VALUES ('20644', '兰山区', '3', '20642', 'L');
INSERT INTO `ey_region` VALUES ('20656', '罗庄区', '3', '20642', 'L');
INSERT INTO `ey_region` VALUES ('20665', '河东区', '3', '20642', 'H');
INSERT INTO `ey_region` VALUES ('20678', '沂南县', '3', '20642', 'Y');
INSERT INTO `ey_region` VALUES ('20696', '郯城县', '3', '20642', 'T');
INSERT INTO `ey_region` VALUES ('20714', '沂水县', '3', '20642', 'Y');
INSERT INTO `ey_region` VALUES ('20734', '苍山县', '3', '20642', 'C');
INSERT INTO `ey_region` VALUES ('20756', '费县', '3', '20642', 'F');
INSERT INTO `ey_region` VALUES ('20775', '平邑县', '3', '20642', 'P');
INSERT INTO `ey_region` VALUES ('20792', '莒南县', '3', '20642', 'J');
INSERT INTO `ey_region` VALUES ('20811', '蒙阴县', '3', '20642', 'M');
INSERT INTO `ey_region` VALUES ('20823', '临沭县', '3', '20642', 'L');
INSERT INTO `ey_region` VALUES ('20836', '德州市', '2', '19280', 'D');
INSERT INTO `ey_region` VALUES ('20837', '市辖区', '3', '20836', 'S');
INSERT INTO `ey_region` VALUES ('20838', '德城区', '3', '20836', 'D');
INSERT INTO `ey_region` VALUES ('20850', '陵县', '3', '20836', 'L');
INSERT INTO `ey_region` VALUES ('20864', '宁津县', '3', '20836', 'N');
INSERT INTO `ey_region` VALUES ('20876', '庆云县', '3', '20836', 'Q');
INSERT INTO `ey_region` VALUES ('20886', '临邑县', '3', '20836', 'L');
INSERT INTO `ey_region` VALUES ('20899', '齐河县', '3', '20836', 'Q');
INSERT INTO `ey_region` VALUES ('20914', '平原县', '3', '20836', 'P');
INSERT INTO `ey_region` VALUES ('20927', '夏津县', '3', '20836', 'X');
INSERT INTO `ey_region` VALUES ('20942', '武城县', '3', '20836', 'W');
INSERT INTO `ey_region` VALUES ('20952', '乐陵市', '3', '20836', 'L');
INSERT INTO `ey_region` VALUES ('20969', '禹城市', '3', '20836', 'Y');
INSERT INTO `ey_region` VALUES ('20981', '聊城市', '2', '19280', 'L');
INSERT INTO `ey_region` VALUES ('20982', '市辖区', '3', '20981', 'S');
INSERT INTO `ey_region` VALUES ('20983', '东昌府区', '3', '20981', 'D');
INSERT INTO `ey_region` VALUES ('21004', '阳谷县', '3', '20981', 'Y');
INSERT INTO `ey_region` VALUES ('21023', '莘县', '3', '20981', 'S');
INSERT INTO `ey_region` VALUES ('21046', '茌平县', '3', '20981', 'C');
INSERT INTO `ey_region` VALUES ('21063', '东阿县', '3', '20981', 'D');
INSERT INTO `ey_region` VALUES ('21075', '冠县', '3', '20981', 'G');
INSERT INTO `ey_region` VALUES ('21093', '高唐县', '3', '20981', 'G');
INSERT INTO `ey_region` VALUES ('21106', '临清市', '3', '20981', 'L');
INSERT INTO `ey_region` VALUES ('21123', '滨州市', '2', '19280', 'B');
INSERT INTO `ey_region` VALUES ('21124', '市辖区', '3', '21123', 'S');
INSERT INTO `ey_region` VALUES ('21125', '滨城区', '3', '21123', 'B');
INSERT INTO `ey_region` VALUES ('21141', '惠民县', '3', '21123', 'H');
INSERT INTO `ey_region` VALUES ('21156', '阳信县', '3', '21123', 'Y');
INSERT INTO `ey_region` VALUES ('21166', '无棣县', '3', '21123', 'W');
INSERT INTO `ey_region` VALUES ('21178', '沾化县', '3', '21123', 'Z');
INSERT INTO `ey_region` VALUES ('21190', '博兴县', '3', '21123', 'B');
INSERT INTO `ey_region` VALUES ('21201', '邹平县', '3', '21123', 'Z');
INSERT INTO `ey_region` VALUES ('21218', '菏泽市', '2', '19280', 'H');
INSERT INTO `ey_region` VALUES ('21219', '市辖区', '3', '21218', 'S');
INSERT INTO `ey_region` VALUES ('21220', '牡丹区', '3', '21218', 'M');
INSERT INTO `ey_region` VALUES ('21245', '曹县', '3', '21218', 'C');
INSERT INTO `ey_region` VALUES ('21271', '单县', '3', '21218', 'D');
INSERT INTO `ey_region` VALUES ('21292', '成武县', '3', '21218', 'C');
INSERT INTO `ey_region` VALUES ('21305', '巨野县', '3', '21218', 'J');
INSERT INTO `ey_region` VALUES ('21322', '郓城县', '3', '21218', 'Y');
INSERT INTO `ey_region` VALUES ('21344', '鄄城县', '3', '21218', 'J');
INSERT INTO `ey_region` VALUES ('21361', '定陶县', '3', '21218', 'D');
INSERT INTO `ey_region` VALUES ('21373', '东明县', '3', '21218', 'D');
INSERT INTO `ey_region` VALUES ('21387', '河南省', '1', '0', 'H');
INSERT INTO `ey_region` VALUES ('21388', '郑州市', '2', '21387', 'Z');
INSERT INTO `ey_region` VALUES ('21389', '市辖区', '3', '21388', 'S');
INSERT INTO `ey_region` VALUES ('21390', '中原区', '3', '21388', 'Z');
INSERT INTO `ey_region` VALUES ('21404', '二七区', '3', '21388', 'E');
INSERT INTO `ey_region` VALUES ('21420', '管城回族区', '3', '21388', 'G');
INSERT INTO `ey_region` VALUES ('21435', '金水区', '3', '21388', 'J');
INSERT INTO `ey_region` VALUES ('21453', '上街区', '3', '21388', 'S');
INSERT INTO `ey_region` VALUES ('21460', '惠济区', '3', '21388', 'H');
INSERT INTO `ey_region` VALUES ('21469', '中牟县', '3', '21388', 'Z');
INSERT INTO `ey_region` VALUES ('21487', '巩义市', '3', '21388', 'G');
INSERT INTO `ey_region` VALUES ('21508', '荥阳市', '3', '21388', 'X');
INSERT INTO `ey_region` VALUES ('21523', '新密市', '3', '21388', 'X');
INSERT INTO `ey_region` VALUES ('21542', '新郑市', '3', '21388', 'X');
INSERT INTO `ey_region` VALUES ('21558', '登封市', '3', '21388', 'D');
INSERT INTO `ey_region` VALUES ('21575', '开封市', '2', '21387', 'K');
INSERT INTO `ey_region` VALUES ('21576', '市辖区', '3', '21575', 'S');
INSERT INTO `ey_region` VALUES ('21577', '龙亭区', '3', '21575', 'L');
INSERT INTO `ey_region` VALUES ('21584', '顺河区', '3', '21575', 'S');
INSERT INTO `ey_region` VALUES ('21593', '鼓楼区', '3', '21575', 'G');
INSERT INTO `ey_region` VALUES ('21602', '禹王台区', '3', '21575', 'Y');
INSERT INTO `ey_region` VALUES ('21610', '金明区', '3', '21575', 'J');
INSERT INTO `ey_region` VALUES ('21618', '杞县', '3', '21575', 'Q');
INSERT INTO `ey_region` VALUES ('21640', '通许县', '3', '21575', 'T');
INSERT INTO `ey_region` VALUES ('21653', '尉氏县', '3', '21575', 'W');
INSERT INTO `ey_region` VALUES ('21671', '开封县', '3', '21575', 'K');
INSERT INTO `ey_region` VALUES ('21687', '兰考县', '3', '21575', 'L');
INSERT INTO `ey_region` VALUES ('21711', '洛阳市', '2', '21387', 'L');
INSERT INTO `ey_region` VALUES ('21712', '市辖区', '3', '21711', 'S');
INSERT INTO `ey_region` VALUES ('21713', '老城区', '3', '21711', 'L');
INSERT INTO `ey_region` VALUES ('21722', '西工区', '3', '21711', 'X');
INSERT INTO `ey_region` VALUES ('21733', '廛河回族区', '3', '21711', 'C');
INSERT INTO `ey_region` VALUES ('21742', '涧西区', '3', '21711', 'J');
INSERT INTO `ey_region` VALUES ('21758', '吉利区', '3', '21711', 'J');
INSERT INTO `ey_region` VALUES ('21761', '洛龙区', '3', '21711', 'L');
INSERT INTO `ey_region` VALUES ('21770', '孟津县', '3', '21711', 'M');
INSERT INTO `ey_region` VALUES ('21781', '新安县', '3', '21711', 'X');
INSERT INTO `ey_region` VALUES ('21794', '栾川县', '3', '21711', 'L');
INSERT INTO `ey_region` VALUES ('21809', '嵩县', '3', '21711', 'S');
INSERT INTO `ey_region` VALUES ('21829', '汝阳县', '3', '21711', 'R');
INSERT INTO `ey_region` VALUES ('21844', '宜阳县', '3', '21711', 'Y');
INSERT INTO `ey_region` VALUES ('21862', '洛宁县', '3', '21711', 'L');
INSERT INTO `ey_region` VALUES ('21881', '伊川县', '3', '21711', 'Y');
INSERT INTO `ey_region` VALUES ('21896', '偃师市', '3', '21711', 'Y');
INSERT INTO `ey_region` VALUES ('21913', '平顶山市', '2', '21387', 'P');
INSERT INTO `ey_region` VALUES ('21914', '市辖区', '3', '21913', 'S');
INSERT INTO `ey_region` VALUES ('21915', '新华区', '3', '21913', 'X');
INSERT INTO `ey_region` VALUES ('21928', '卫东区', '3', '21913', 'W');
INSERT INTO `ey_region` VALUES ('21940', '石龙区', '3', '21913', 'S');
INSERT INTO `ey_region` VALUES ('21945', '湛河区', '3', '21913', 'Z');
INSERT INTO `ey_region` VALUES ('21954', '宝丰县', '3', '21913', 'B');
INSERT INTO `ey_region` VALUES ('21968', '叶  县', '3', '21913', 'Y');
INSERT INTO `ey_region` VALUES ('21987', '鲁山县', '3', '21913', 'L');
INSERT INTO `ey_region` VALUES ('22009', '郏  县', '3', '21913', 'J');
INSERT INTO `ey_region` VALUES ('22024', '舞钢市', '3', '21913', 'W');
INSERT INTO `ey_region` VALUES ('22037', '汝州市', '3', '21913', 'R');
INSERT INTO `ey_region` VALUES ('22058', '安阳市', '2', '21387', 'A');
INSERT INTO `ey_region` VALUES ('22059', '市辖区', '3', '22058', 'S');
INSERT INTO `ey_region` VALUES ('22060', '文峰区', '3', '22058', 'W');
INSERT INTO `ey_region` VALUES ('22080', '北关区', '3', '22058', 'B');
INSERT INTO `ey_region` VALUES ('22090', '殷都区', '3', '22058', 'Y');
INSERT INTO `ey_region` VALUES ('22101', '龙安区', '3', '22058', 'L');
INSERT INTO `ey_region` VALUES ('22111', '安阳县', '3', '22058', 'A');
INSERT INTO `ey_region` VALUES ('22133', '汤阴县', '3', '22058', 'T');
INSERT INTO `ey_region` VALUES ('22144', '滑县', '3', '22058', 'H');
INSERT INTO `ey_region` VALUES ('22167', '内黄县', '3', '22058', 'N');
INSERT INTO `ey_region` VALUES ('22185', '林州市', '3', '22058', 'L');
INSERT INTO `ey_region` VALUES ('22206', '鹤壁市', '2', '21387', 'H');
INSERT INTO `ey_region` VALUES ('22207', '市辖区', '3', '22206', 'S');
INSERT INTO `ey_region` VALUES ('22208', '鹤山区', '3', '22206', 'H');
INSERT INTO `ey_region` VALUES ('22216', '山城区', '3', '22206', 'S');
INSERT INTO `ey_region` VALUES ('22224', '淇滨区', '3', '22206', 'Q');
INSERT INTO `ey_region` VALUES ('22232', '浚县', '3', '22206', 'J');
INSERT INTO `ey_region` VALUES ('22243', '淇县', '3', '22206', 'Q');
INSERT INTO `ey_region` VALUES ('22251', '新乡市', '2', '21387', 'X');
INSERT INTO `ey_region` VALUES ('22252', '市辖区', '3', '22251', 'S');
INSERT INTO `ey_region` VALUES ('22253', '红旗区', '3', '22251', 'H');
INSERT INTO `ey_region` VALUES ('22264', '卫滨区', '3', '22251', 'W');
INSERT INTO `ey_region` VALUES ('22273', '凤泉区', '3', '22251', 'F');
INSERT INTO `ey_region` VALUES ('22279', '牧野区', '3', '22251', 'M');
INSERT INTO `ey_region` VALUES ('22290', '新乡县', '3', '22251', 'X');
INSERT INTO `ey_region` VALUES ('22299', '获嘉县', '3', '22251', 'H');
INSERT INTO `ey_region` VALUES ('22312', '原阳县', '3', '22251', 'Y');
INSERT INTO `ey_region` VALUES ('22330', '延津县', '3', '22251', 'Y');
INSERT INTO `ey_region` VALUES ('22347', '封丘县', '3', '22251', 'F');
INSERT INTO `ey_region` VALUES ('22367', '长垣县', '3', '22251', 'C');
INSERT INTO `ey_region` VALUES ('22386', '卫辉市', '3', '22251', 'W');
INSERT INTO `ey_region` VALUES ('22400', '辉县市', '3', '22251', 'H');
INSERT INTO `ey_region` VALUES ('22423', '焦作市', '2', '21387', 'J');
INSERT INTO `ey_region` VALUES ('22424', '市辖区', '3', '22423', 'S');
INSERT INTO `ey_region` VALUES ('22425', '解放区', '3', '22423', 'J');
INSERT INTO `ey_region` VALUES ('22435', '中站区', '3', '22423', 'Z');
INSERT INTO `ey_region` VALUES ('22446', '马村区', '3', '22423', 'M');
INSERT INTO `ey_region` VALUES ('22454', '山阳区', '3', '22423', 'S');
INSERT INTO `ey_region` VALUES ('22465', '修武县', '3', '22423', 'X');
INSERT INTO `ey_region` VALUES ('22475', '博爱县', '3', '22423', 'B');
INSERT INTO `ey_region` VALUES ('22487', '武陟县', '3', '22423', 'W');
INSERT INTO `ey_region` VALUES ('22503', '温县', '3', '22423', 'W');
INSERT INTO `ey_region` VALUES ('22515', '济源市', '3', '22423', 'J');
INSERT INTO `ey_region` VALUES ('22532', '沁阳市', '3', '22423', 'Q');
INSERT INTO `ey_region` VALUES ('22546', '孟州市', '3', '22423', 'M');
INSERT INTO `ey_region` VALUES ('22558', '濮阳市', '2', '21387', 'P');
INSERT INTO `ey_region` VALUES ('22559', '市辖区', '3', '22558', 'S');
INSERT INTO `ey_region` VALUES ('22560', '华龙区', '3', '22558', 'H');
INSERT INTO `ey_region` VALUES ('22578', '清丰县', '3', '22558', 'Q');
INSERT INTO `ey_region` VALUES ('22596', '南乐县', '3', '22558', 'N');
INSERT INTO `ey_region` VALUES ('22609', '范县', '3', '22558', 'F');
INSERT INTO `ey_region` VALUES ('22622', '台前县', '3', '22558', 'T');
INSERT INTO `ey_region` VALUES ('22632', '濮阳县', '3', '22558', 'P');
INSERT INTO `ey_region` VALUES ('22655', '许昌市', '2', '21387', 'X');
INSERT INTO `ey_region` VALUES ('22656', '市辖区', '3', '22655', 'S');
INSERT INTO `ey_region` VALUES ('22657', '魏都区', '3', '22655', 'W');
INSERT INTO `ey_region` VALUES ('22671', '许昌县', '3', '22655', 'X');
INSERT INTO `ey_region` VALUES ('22688', '鄢陵县', '3', '22655', 'Y');
INSERT INTO `ey_region` VALUES ('22701', '襄城县', '3', '22655', 'X');
INSERT INTO `ey_region` VALUES ('22718', '禹州市', '3', '22655', 'Y');
INSERT INTO `ey_region` VALUES ('22745', '长葛市', '3', '22655', 'C');
INSERT INTO `ey_region` VALUES ('22762', '漯河市', '2', '21387', 'L');
INSERT INTO `ey_region` VALUES ('22763', '市辖区', '3', '22762', 'S');
INSERT INTO `ey_region` VALUES ('22764', '源汇区', '3', '22762', 'Y');
INSERT INTO `ey_region` VALUES ('22773', '郾城区', '3', '22762', 'Y');
INSERT INTO `ey_region` VALUES ('22783', '召陵区', '3', '22762', 'Z');
INSERT INTO `ey_region` VALUES ('22793', '舞阳县', '3', '22762', 'W');
INSERT INTO `ey_region` VALUES ('22808', '临颖县', '3', '22762', 'L');
INSERT INTO `ey_region` VALUES ('22824', '三门峡市', '2', '21387', 'S');
INSERT INTO `ey_region` VALUES ('22825', '市辖区', '3', '22824', 'S');
INSERT INTO `ey_region` VALUES ('22826', '湖滨区', '3', '22824', 'H');
INSERT INTO `ey_region` VALUES ('22838', '渑池县', '3', '22824', 'M');
INSERT INTO `ey_region` VALUES ('22851', '陕县', '3', '22824', 'S');
INSERT INTO `ey_region` VALUES ('22865', '卢氏县', '3', '22824', 'L');
INSERT INTO `ey_region` VALUES ('22885', '义马市', '3', '22824', 'Y');
INSERT INTO `ey_region` VALUES ('22893', '灵宝市', '3', '22824', 'L');
INSERT INTO `ey_region` VALUES ('22910', '南阳市', '2', '21387', 'N');
INSERT INTO `ey_region` VALUES ('22911', '市辖区', '3', '22910', 'S');
INSERT INTO `ey_region` VALUES ('22912', '宛城区', '3', '22910', 'W');
INSERT INTO `ey_region` VALUES ('22930', '卧龙区', '3', '22910', 'W');
INSERT INTO `ey_region` VALUES ('22951', '南召县', '3', '22910', 'N');
INSERT INTO `ey_region` VALUES ('22973', '方城县', '3', '22910', 'F');
INSERT INTO `ey_region` VALUES ('22992', '西峡县', '3', '22910', 'X');
INSERT INTO `ey_region` VALUES ('23013', '镇平县', '3', '22910', 'Z');
INSERT INTO `ey_region` VALUES ('23036', '内乡县', '3', '22910', 'N');
INSERT INTO `ey_region` VALUES ('23053', '淅川县', '3', '22910', 'X');
INSERT INTO `ey_region` VALUES ('23071', '社旗县', '3', '22910', 'S');
INSERT INTO `ey_region` VALUES ('23087', '唐河县', '3', '22910', 'T');
INSERT INTO `ey_region` VALUES ('23108', '新野县', '3', '22910', 'X');
INSERT INTO `ey_region` VALUES ('23123', '桐柏县', '3', '22910', 'T');
INSERT INTO `ey_region` VALUES ('23140', '邓州市', '3', '22910', 'D');
INSERT INTO `ey_region` VALUES ('23170', '商丘市', '2', '21387', 'S');
INSERT INTO `ey_region` VALUES ('23171', '市辖区', '3', '23170', 'S');
INSERT INTO `ey_region` VALUES ('23172', '梁园区', '3', '23170', 'L');
INSERT INTO `ey_region` VALUES ('23192', '睢阳区', '3', '23170', 'S');
INSERT INTO `ey_region` VALUES ('23211', '民权县', '3', '23170', 'M');
INSERT INTO `ey_region` VALUES ('23232', '睢县', '3', '23170', 'S');
INSERT INTO `ey_region` VALUES ('23253', '宁陵县', '3', '23170', 'N');
INSERT INTO `ey_region` VALUES ('23268', '柘城县', '3', '23170', 'Z');
INSERT INTO `ey_region` VALUES ('23290', '虞城县', '3', '23170', 'Y');
INSERT INTO `ey_region` VALUES ('23317', '夏邑县', '3', '23170', 'X');
INSERT INTO `ey_region` VALUES ('23342', '永城市', '3', '23170', 'Y');
INSERT INTO `ey_region` VALUES ('23372', '信阳市', '2', '21387', 'X');
INSERT INTO `ey_region` VALUES ('23373', '市辖区', '3', '23372', 'S');
INSERT INTO `ey_region` VALUES ('23374', '浉河区', '3', '23372', 'S');
INSERT INTO `ey_region` VALUES ('23393', '平桥区', '3', '23372', 'P');
INSERT INTO `ey_region` VALUES ('23414', '罗山县', '3', '23372', 'L');
INSERT INTO `ey_region` VALUES ('23435', '光山县', '3', '23372', 'G');
INSERT INTO `ey_region` VALUES ('23455', '新县', '3', '23372', 'X');
INSERT INTO `ey_region` VALUES ('23471', '商城县', '3', '23372', 'S');
INSERT INTO `ey_region` VALUES ('23492', '固始县', '3', '23372', 'G');
INSERT INTO `ey_region` VALUES ('23525', '潢川县', '3', '23372', 'H');
INSERT INTO `ey_region` VALUES ('23549', '淮滨县', '3', '23372', 'H');
INSERT INTO `ey_region` VALUES ('23567', '息县', '3', '23372', 'X');
INSERT INTO `ey_region` VALUES ('23589', '周口市', '2', '21387', 'Z');
INSERT INTO `ey_region` VALUES ('23590', '市辖区', '3', '23589', 'S');
INSERT INTO `ey_region` VALUES ('23591', '川汇区', '3', '23589', 'C');
INSERT INTO `ey_region` VALUES ('23604', '扶沟县', '3', '23589', 'F');
INSERT INTO `ey_region` VALUES ('23621', '西华县', '3', '23589', 'X');
INSERT INTO `ey_region` VALUES ('23647', '商水县', '3', '23589', 'S');
INSERT INTO `ey_region` VALUES ('23672', '沈丘县', '3', '23589', 'S');
INSERT INTO `ey_region` VALUES ('23695', '郸城县', '3', '23589', 'D');
INSERT INTO `ey_region` VALUES ('23716', '淮阳县', '3', '23589', 'H');
INSERT INTO `ey_region` VALUES ('23736', '太康县', '3', '23589', 'T');
INSERT INTO `ey_region` VALUES ('23766', '鹿邑县', '3', '23589', 'L');
INSERT INTO `ey_region` VALUES ('23796', '项城市', '3', '23589', 'X');
INSERT INTO `ey_region` VALUES ('23818', '驻马店市', '2', '21387', 'Z');
INSERT INTO `ey_region` VALUES ('23819', '市辖区', '3', '23818', 'S');
INSERT INTO `ey_region` VALUES ('23820', '驿城区', '3', '23818', 'Y');
INSERT INTO `ey_region` VALUES ('23840', '西平县', '3', '23818', 'X');
INSERT INTO `ey_region` VALUES ('23861', '上蔡县', '3', '23818', 'S');
INSERT INTO `ey_region` VALUES ('23886', '平舆县', '3', '23818', 'P');
INSERT INTO `ey_region` VALUES ('23905', '正阳县', '3', '23818', 'Z');
INSERT INTO `ey_region` VALUES ('23926', '确山县', '3', '23818', 'Q');
INSERT INTO `ey_region` VALUES ('23940', '泌阳县', '3', '23818', 'M');
INSERT INTO `ey_region` VALUES ('23965', '汝南县', '3', '23818', 'R');
INSERT INTO `ey_region` VALUES ('23983', '遂平县', '3', '23818', 'S');
INSERT INTO `ey_region` VALUES ('23999', '新蔡县', '3', '23818', 'X');
INSERT INTO `ey_region` VALUES ('24022', '湖北省', '1', '0', 'H');
INSERT INTO `ey_region` VALUES ('24023', '武汉市', '2', '24022', 'W');
INSERT INTO `ey_region` VALUES ('24024', '市辖区', '3', '24023', 'S');
INSERT INTO `ey_region` VALUES ('24025', '江岸区', '3', '24023', 'J');
INSERT INTO `ey_region` VALUES ('24043', '江汉区', '3', '24023', 'J');
INSERT INTO `ey_region` VALUES ('24057', '硚口区', '3', '24023', 'Q');
INSERT INTO `ey_region` VALUES ('24069', '汉阳区', '3', '24023', 'H');
INSERT INTO `ey_region` VALUES ('24082', '武昌区', '3', '24023', 'W');
INSERT INTO `ey_region` VALUES ('24098', '青山区', '3', '24023', 'Q');
INSERT INTO `ey_region` VALUES ('24111', '洪山区', '3', '24023', 'H');
INSERT INTO `ey_region` VALUES ('24129', '东西湖区', '3', '24023', 'D');
INSERT INTO `ey_region` VALUES ('24142', '汉南区', '3', '24023', 'H');
INSERT INTO `ey_region` VALUES ('24150', '蔡甸区', '3', '24023', 'C');
INSERT INTO `ey_region` VALUES ('24165', '江夏区', '3', '24023', 'J');
INSERT INTO `ey_region` VALUES ('24185', '黄陂区', '3', '24023', 'H');
INSERT INTO `ey_region` VALUES ('24205', '武汉市新洲区', '3', '24023', 'W');
INSERT INTO `ey_region` VALUES ('24224', '黄石市', '2', '24022', 'H');
INSERT INTO `ey_region` VALUES ('24225', '市辖区', '3', '24224', 'S');
INSERT INTO `ey_region` VALUES ('24226', '黄石港区', '3', '24224', 'H');
INSERT INTO `ey_region` VALUES ('24233', '西塞山区', '3', '24224', 'X');
INSERT INTO `ey_region` VALUES ('24242', '下陆区', '3', '24224', 'X');
INSERT INTO `ey_region` VALUES ('24247', '铁山区', '3', '24224', 'T');
INSERT INTO `ey_region` VALUES ('24250', '阳新县', '3', '24224', 'Y');
INSERT INTO `ey_region` VALUES ('24273', '大冶市', '3', '24224', 'D');
INSERT INTO `ey_region` VALUES ('24291', '十堰市', '2', '24022', 'S');
INSERT INTO `ey_region` VALUES ('24292', '市辖区', '3', '24291', 'S');
INSERT INTO `ey_region` VALUES ('24293', '茅箭区', '3', '24291', 'M');
INSERT INTO `ey_region` VALUES ('24302', '张湾区', '3', '24291', 'Z');
INSERT INTO `ey_region` VALUES ('24314', '郧县', '3', '24291', 'Y');
INSERT INTO `ey_region` VALUES ('24335', '郧西县', '3', '24291', 'Y');
INSERT INTO `ey_region` VALUES ('24354', '竹山县', '3', '24291', 'Z');
INSERT INTO `ey_region` VALUES ('24374', '竹溪县', '3', '24291', 'Z');
INSERT INTO `ey_region` VALUES ('24405', '房县', '3', '24291', 'F');
INSERT INTO `ey_region` VALUES ('24435', '丹江口市', '3', '24291', 'D');
INSERT INTO `ey_region` VALUES ('24453', '宜昌市', '2', '24022', 'Y');
INSERT INTO `ey_region` VALUES ('24454', '市辖区', '3', '24453', 'S');
INSERT INTO `ey_region` VALUES ('24455', '西陵区', '3', '24453', 'X');
INSERT INTO `ey_region` VALUES ('24465', '伍家岗区', '3', '24453', 'W');
INSERT INTO `ey_region` VALUES ('24471', '点军区', '3', '24453', 'D');
INSERT INTO `ey_region` VALUES ('24477', '猇亭区', '3', '24453', 'X');
INSERT INTO `ey_region` VALUES ('24481', '夷陵区', '3', '24453', 'Y');
INSERT INTO `ey_region` VALUES ('24495', '远安县', '3', '24453', 'Y');
INSERT INTO `ey_region` VALUES ('24503', '兴山县', '3', '24453', 'X');
INSERT INTO `ey_region` VALUES ('24512', '秭归县', '3', '24453', 'Z');
INSERT INTO `ey_region` VALUES ('24525', '长阳县', '3', '24453', 'C');
INSERT INTO `ey_region` VALUES ('24537', '五峰县', '3', '24453', 'W');
INSERT INTO `ey_region` VALUES ('24546', '宜都市', '3', '24453', 'Y');
INSERT INTO `ey_region` VALUES ('24559', '当阳市', '3', '24453', 'D');
INSERT INTO `ey_region` VALUES ('24570', '枝江市', '3', '24453', 'Z');
INSERT INTO `ey_region` VALUES ('24580', '襄樊市', '2', '24022', 'X');
INSERT INTO `ey_region` VALUES ('24581', '市辖区', '3', '24580', 'S');
INSERT INTO `ey_region` VALUES ('24582', '襄城区', '3', '24580', 'X');
INSERT INTO `ey_region` VALUES ('24591', '樊城区', '3', '24580', 'F');
INSERT INTO `ey_region` VALUES ('24608', '襄阳区', '3', '24580', 'X');
INSERT INTO `ey_region` VALUES ('24623', '南漳县', '3', '24580', 'N');
INSERT INTO `ey_region` VALUES ('24635', '谷城县', '3', '24580', 'G');
INSERT INTO `ey_region` VALUES ('24647', '保康县', '3', '24580', 'B');
INSERT INTO `ey_region` VALUES ('24659', '老河口市', '3', '24580', 'L');
INSERT INTO `ey_region` VALUES ('24674', '枣阳市', '3', '24580', 'Z');
INSERT INTO `ey_region` VALUES ('24692', '宜城市', '3', '24580', 'Y');
INSERT INTO `ey_region` VALUES ('24706', '鄂州市', '2', '24022', 'E');
INSERT INTO `ey_region` VALUES ('24707', '市辖区', '3', '24706', 'S');
INSERT INTO `ey_region` VALUES ('24708', '粱子湖区', '3', '24706', 'L');
INSERT INTO `ey_region` VALUES ('24714', '华容区', '3', '24706', 'H');
INSERT INTO `ey_region` VALUES ('24722', '鄂城区', '3', '24706', 'E');
INSERT INTO `ey_region` VALUES ('24737', '荆门市', '2', '24022', 'J');
INSERT INTO `ey_region` VALUES ('24738', '市辖区', '3', '24737', 'S');
INSERT INTO `ey_region` VALUES ('24739', '东宝区', '3', '24737', 'D');
INSERT INTO `ey_region` VALUES ('24749', '掇刀区', '3', '24737', 'D');
INSERT INTO `ey_region` VALUES ('24755', '京山县', '3', '24737', 'J');
INSERT INTO `ey_region` VALUES ('24778', '沙洋县', '3', '24737', 'S');
INSERT INTO `ey_region` VALUES ('24794', '钟祥市', '3', '24737', 'Z');
INSERT INTO `ey_region` VALUES ('24816', '孝感市', '2', '24022', 'X');
INSERT INTO `ey_region` VALUES ('24817', '市辖区', '3', '24816', 'S');
INSERT INTO `ey_region` VALUES ('24818', '孝南区', '3', '24816', 'X');
INSERT INTO `ey_region` VALUES ('24838', '孝昌县', '3', '24816', 'X');
INSERT INTO `ey_region` VALUES ('24853', '大悟县', '3', '24816', 'D');
INSERT INTO `ey_region` VALUES ('24871', '云梦县', '3', '24816', 'Y');
INSERT INTO `ey_region` VALUES ('24885', '应城市', '3', '24816', 'Y');
INSERT INTO `ey_region` VALUES ('24903', '安陆市', '3', '24816', 'A');
INSERT INTO `ey_region` VALUES ('24920', '汉川市', '3', '24816', 'H');
INSERT INTO `ey_region` VALUES ('24949', '荆州市', '2', '24022', 'J');
INSERT INTO `ey_region` VALUES ('24950', '市辖区', '3', '24949', 'S');
INSERT INTO `ey_region` VALUES ('24951', '沙市区', '3', '24949', 'S');
INSERT INTO `ey_region` VALUES ('24965', '荆州区', '3', '24949', 'J');
INSERT INTO `ey_region` VALUES ('24978', '公安县', '3', '24949', 'G');
INSERT INTO `ey_region` VALUES ('24995', '监利县', '3', '24949', 'J');
INSERT INTO `ey_region` VALUES ('25019', '江陵县', '3', '24949', 'J');
INSERT INTO `ey_region` VALUES ('25032', '石首市', '3', '24949', 'S');
INSERT INTO `ey_region` VALUES ('25048', '洪湖市', '3', '24949', 'H');
INSERT INTO `ey_region` VALUES ('25069', '松滋市', '3', '24949', 'S');
INSERT INTO `ey_region` VALUES ('25086', '黄冈市', '2', '24022', 'H');
INSERT INTO `ey_region` VALUES ('25087', '市辖区', '3', '25086', 'S');
INSERT INTO `ey_region` VALUES ('25088', '黄州区', '3', '25086', 'H');
INSERT INTO `ey_region` VALUES ('25099', '团风县', '3', '25086', 'T');
INSERT INTO `ey_region` VALUES ('25112', '红安县', '3', '25086', 'H');
INSERT INTO `ey_region` VALUES ('25126', '罗田县', '3', '25086', 'L');
INSERT INTO `ey_region` VALUES ('25143', '英山县', '3', '25086', 'Y');
INSERT INTO `ey_region` VALUES ('25158', '浠水县', '3', '25086', 'X');
INSERT INTO `ey_region` VALUES ('25175', '蕲春县', '3', '25086', 'Q');
INSERT INTO `ey_region` VALUES ('25192', '黄梅县', '3', '25086', 'H');
INSERT INTO `ey_region` VALUES ('25211', '麻城市', '3', '25086', 'M');
INSERT INTO `ey_region` VALUES ('25235', '武穴市', '3', '25086', 'W');
INSERT INTO `ey_region` VALUES ('25249', '咸宁市', '2', '24022', 'X');
INSERT INTO `ey_region` VALUES ('25250', '市辖区', '3', '25249', 'S');
INSERT INTO `ey_region` VALUES ('25251', '咸安区', '3', '25249', 'X');
INSERT INTO `ey_region` VALUES ('25266', '嘉鱼县', '3', '25249', 'J');
INSERT INTO `ey_region` VALUES ('25276', '通城县', '3', '25249', 'T');
INSERT INTO `ey_region` VALUES ('25290', '崇阳县', '3', '25249', 'C');
INSERT INTO `ey_region` VALUES ('25303', '通山县', '3', '25249', 'T');
INSERT INTO `ey_region` VALUES ('25317', '赤壁市', '3', '25249', 'C');
INSERT INTO `ey_region` VALUES ('25335', '随州市', '2', '24022', 'S');
INSERT INTO `ey_region` VALUES ('25336', '市辖区', '3', '25335', 'S');
INSERT INTO `ey_region` VALUES ('25337', '曾都区', '3', '25335', 'Z');
INSERT INTO `ey_region` VALUES ('25367', '广水市', '3', '25335', 'G');
INSERT INTO `ey_region` VALUES ('25388', '恩施州', '2', '24022', 'E');
INSERT INTO `ey_region` VALUES ('25389', '恩施市', '3', '25388', 'E');
INSERT INTO `ey_region` VALUES ('25406', '利川市', '3', '25388', 'L');
INSERT INTO `ey_region` VALUES ('25422', '建始县', '3', '25388', 'J');
INSERT INTO `ey_region` VALUES ('25433', '巴东县', '3', '25388', 'B');
INSERT INTO `ey_region` VALUES ('25446', '宣恩县', '3', '25388', 'X');
INSERT INTO `ey_region` VALUES ('25456', '咸丰县', '3', '25388', 'X');
INSERT INTO `ey_region` VALUES ('25467', '来凤县', '3', '25388', 'L');
INSERT INTO `ey_region` VALUES ('25476', '鹤峰县', '3', '25388', 'H');
INSERT INTO `ey_region` VALUES ('25487', '省直辖行政单位', '2', '24022', 'S');
INSERT INTO `ey_region` VALUES ('25488', '仙桃市', '3', '25487', 'X');
INSERT INTO `ey_region` VALUES ('25516', '潜江市', '3', '25487', 'Q');
INSERT INTO `ey_region` VALUES ('25541', '天门市', '3', '25487', 'T');
INSERT INTO `ey_region` VALUES ('25570', '神农架林区', '3', '25487', 'S');
INSERT INTO `ey_region` VALUES ('25579', '湖南省', '1', '0', 'H');
INSERT INTO `ey_region` VALUES ('25580', '长沙市', '2', '25579', 'C');
INSERT INTO `ey_region` VALUES ('25581', '市辖区', '3', '25580', 'S');
INSERT INTO `ey_region` VALUES ('25582', '芙蓉区', '3', '25580', 'F');
INSERT INTO `ey_region` VALUES ('25596', '天心区', '3', '25580', 'T');
INSERT INTO `ey_region` VALUES ('25607', '岳麓区', '3', '25580', 'Y');
INSERT INTO `ey_region` VALUES ('25620', '开福区', '3', '25580', 'K');
INSERT INTO `ey_region` VALUES ('25634', '雨花区', '3', '25580', 'Y');
INSERT INTO `ey_region` VALUES ('25645', '长沙县', '3', '25580', 'C');
INSERT INTO `ey_region` VALUES ('25666', '望城县', '3', '25580', 'W');
INSERT INTO `ey_region` VALUES ('25686', '宁乡县', '3', '25580', 'N');
INSERT INTO `ey_region` VALUES ('25720', '浏阳市', '3', '25580', 'L');
INSERT INTO `ey_region` VALUES ('25758', '株洲市', '2', '25579', 'Z');
INSERT INTO `ey_region` VALUES ('25759', '市辖区', '3', '25758', 'S');
INSERT INTO `ey_region` VALUES ('25760', '荷塘区', '3', '25758', 'H');
INSERT INTO `ey_region` VALUES ('25768', '芦淞区', '3', '25758', 'L');
INSERT INTO `ey_region` VALUES ('25777', '石峰区', '3', '25758', 'S');
INSERT INTO `ey_region` VALUES ('25785', '天元区', '3', '25758', 'T');
INSERT INTO `ey_region` VALUES ('25791', '株洲县', '3', '25758', 'Z');
INSERT INTO `ey_region` VALUES ('25810', '攸县', '3', '25758', 'Y');
INSERT INTO `ey_region` VALUES ('25836', '茶陵县', '3', '25758', 'C');
INSERT INTO `ey_region` VALUES ('25863', '炎陵县', '3', '25758', 'Y');
INSERT INTO `ey_region` VALUES ('25881', '醴陵市', '3', '25758', 'L');
INSERT INTO `ey_region` VALUES ('25912', '湘潭市', '2', '25579', 'X');
INSERT INTO `ey_region` VALUES ('25913', '市辖区', '3', '25912', 'S');
INSERT INTO `ey_region` VALUES ('25914', '雨湖区', '3', '25912', 'Y');
INSERT INTO `ey_region` VALUES ('25929', '岳塘区', '3', '25912', 'Y');
INSERT INTO `ey_region` VALUES ('25947', '湘潭县', '3', '25912', 'X');
INSERT INTO `ey_region` VALUES ('25970', '湘乡市', '3', '25912', 'X');
INSERT INTO `ey_region` VALUES ('25993', '韶山市', '3', '25912', 'S');
INSERT INTO `ey_region` VALUES ('26001', '衡阳市', '2', '25579', 'H');
INSERT INTO `ey_region` VALUES ('26002', '市辖区', '3', '26001', 'S');
INSERT INTO `ey_region` VALUES ('26003', '珠晖区', '3', '26001', 'Z');
INSERT INTO `ey_region` VALUES ('26019', '雁峰区', '3', '26001', 'Y');
INSERT INTO `ey_region` VALUES ('26028', '石鼓区', '3', '26001', 'S');
INSERT INTO `ey_region` VALUES ('26037', '蒸湘区', '3', '26001', 'Z');
INSERT INTO `ey_region` VALUES ('26045', '南岳区', '3', '26001', 'N');
INSERT INTO `ey_region` VALUES ('26051', '衡阳县', '3', '26001', 'H');
INSERT INTO `ey_region` VALUES ('26080', '衡南县', '3', '26001', 'H');
INSERT INTO `ey_region` VALUES ('26112', '衡山县', '3', '26001', 'H');
INSERT INTO `ey_region` VALUES ('26130', '衡东县', '3', '26001', 'H');
INSERT INTO `ey_region` VALUES ('26155', '祁东县', '3', '26001', 'Q');
INSERT INTO `ey_region` VALUES ('26179', '耒阳市', '3', '26001', 'L');
INSERT INTO `ey_region` VALUES ('26215', '常宁市', '3', '26001', 'C');
INSERT INTO `ey_region` VALUES ('26242', '邵阳市', '2', '25579', 'S');
INSERT INTO `ey_region` VALUES ('26243', '市辖区', '3', '26242', 'S');
INSERT INTO `ey_region` VALUES ('26244', '双清区', '3', '26242', 'S');
INSERT INTO `ey_region` VALUES ('26257', '大祥区', '3', '26242', 'D');
INSERT INTO `ey_region` VALUES ('26272', '北塔区', '3', '26242', 'B');
INSERT INTO `ey_region` VALUES ('26279', '邵东县', '3', '26242', 'S');
INSERT INTO `ey_region` VALUES ('26306', '新邵县', '3', '26242', 'X');
INSERT INTO `ey_region` VALUES ('26322', '邵阳县', '3', '26242', 'S');
INSERT INTO `ey_region` VALUES ('26348', '隆回县', '3', '26242', 'L');
INSERT INTO `ey_region` VALUES ('26375', '洞口县', '3', '26242', 'D');
INSERT INTO `ey_region` VALUES ('26399', '绥宁县', '3', '26242', 'S');
INSERT INTO `ey_region` VALUES ('26425', '新宁县', '3', '26242', 'X');
INSERT INTO `ey_region` VALUES ('26444', '城步县', '3', '26242', 'C');
INSERT INTO `ey_region` VALUES ('26465', '武冈市', '3', '26242', 'W');
INSERT INTO `ey_region` VALUES ('26485', '岳阳市', '2', '25579', 'Y');
INSERT INTO `ey_region` VALUES ('26486', '市辖区', '3', '26485', 'S');
INSERT INTO `ey_region` VALUES ('26487', '岳阳楼区', '3', '26485', 'Y');
INSERT INTO `ey_region` VALUES ('26511', '云溪区', '3', '26485', 'Y');
INSERT INTO `ey_region` VALUES ('26521', '君山区', '3', '26485', 'J');
INSERT INTO `ey_region` VALUES ('26529', '岳阳县', '3', '26485', 'Y');
INSERT INTO `ey_region` VALUES ('26551', '华容县', '3', '26485', 'H');
INSERT INTO `ey_region` VALUES ('26572', '湘阴县', '3', '26485', 'X');
INSERT INTO `ey_region` VALUES ('26592', '平江县', '3', '26485', 'P');
INSERT INTO `ey_region` VALUES ('26620', '汩罗市', '3', '26485', 'G');
INSERT INTO `ey_region` VALUES ('26657', '临湘市', '3', '26485', 'L');
INSERT INTO `ey_region` VALUES ('26683', '常德市', '2', '25579', 'C');
INSERT INTO `ey_region` VALUES ('26684', '市辖区', '3', '26683', 'S');
INSERT INTO `ey_region` VALUES ('26685', '武陵区', '3', '26683', 'W');
INSERT INTO `ey_region` VALUES ('26702', '鼎城区', '3', '26683', 'D');
INSERT INTO `ey_region` VALUES ('26741', '安乡县', '3', '26683', 'A');
INSERT INTO `ey_region` VALUES ('26762', '汉寿县', '3', '26683', 'H');
INSERT INTO `ey_region` VALUES ('26793', '澧县', '3', '26683', 'L');
INSERT INTO `ey_region` VALUES ('26826', '临澧县', '3', '26683', 'L');
INSERT INTO `ey_region` VALUES ('26844', '桃源县', '3', '26683', 'T');
INSERT INTO `ey_region` VALUES ('26885', '石门县', '3', '26683', 'S');
INSERT INTO `ey_region` VALUES ('26912', '津市市', '3', '26683', 'J');
INSERT INTO `ey_region` VALUES ('26925', '张家界市', '2', '25579', 'Z');
INSERT INTO `ey_region` VALUES ('26926', '市辖区', '3', '26925', 'S');
INSERT INTO `ey_region` VALUES ('26927', '永定区', '3', '26925', 'Y');
INSERT INTO `ey_region` VALUES ('26959', '武陵源区', '3', '26925', 'W');
INSERT INTO `ey_region` VALUES ('26966', '慈利县', '3', '26925', 'C');
INSERT INTO `ey_region` VALUES ('26998', '桑植县', '3', '26925', 'S');
INSERT INTO `ey_region` VALUES ('27038', '益阳市', '2', '25579', 'Y');
INSERT INTO `ey_region` VALUES ('27039', '市辖区', '3', '27038', 'S');
INSERT INTO `ey_region` VALUES ('27040', '资阳区', '3', '27038', 'Z');
INSERT INTO `ey_region` VALUES ('27049', '赫山区', '3', '27038', 'H');
INSERT INTO `ey_region` VALUES ('27069', '南县', '3', '27038', 'N');
INSERT INTO `ey_region` VALUES ('27087', '桃江县', '3', '27038', 'T');
INSERT INTO `ey_region` VALUES ('27106', '安化县', '3', '27038', 'A');
INSERT INTO `ey_region` VALUES ('27130', '沅江市', '3', '27038', 'Y');
INSERT INTO `ey_region` VALUES ('27147', '郴州市', '2', '25579', 'C');
INSERT INTO `ey_region` VALUES ('27148', '市辖区', '3', '27147', 'S');
INSERT INTO `ey_region` VALUES ('27149', '北湖区', '3', '27147', 'B');
INSERT INTO `ey_region` VALUES ('27168', '苏仙区', '3', '27147', 'S');
INSERT INTO `ey_region` VALUES ('27188', '桂阳县', '3', '27147', 'G');
INSERT INTO `ey_region` VALUES ('27228', '宜章县', '3', '27147', 'Y');
INSERT INTO `ey_region` VALUES ('27256', '永兴县', '3', '27147', 'Y');
INSERT INTO `ey_region` VALUES ('27282', '嘉禾县', '3', '27147', 'J');
INSERT INTO `ey_region` VALUES ('27300', '临武县', '3', '27147', 'L');
INSERT INTO `ey_region` VALUES ('27323', '汝城县', '3', '27147', 'R');
INSERT INTO `ey_region` VALUES ('27347', '桂东县', '3', '27147', 'G');
INSERT INTO `ey_region` VALUES ('27367', '安仁县', '3', '27147', 'A');
INSERT INTO `ey_region` VALUES ('27389', '资兴市', '3', '27147', 'Z');
INSERT INTO `ey_region` VALUES ('27418', '永州市', '2', '25579', 'Y');
INSERT INTO `ey_region` VALUES ('27419', '市辖区', '3', '27418', 'S');
INSERT INTO `ey_region` VALUES ('27420', '零陵区', '3', '27418', 'L');
INSERT INTO `ey_region` VALUES ('27437', '冷水滩区', '3', '27418', 'L');
INSERT INTO `ey_region` VALUES ('27459', '祁阳县', '3', '27418', 'Q');
INSERT INTO `ey_region` VALUES ('27492', '东安县', '3', '27418', 'D');
INSERT INTO `ey_region` VALUES ('27511', '双牌县', '3', '27418', 'S');
INSERT INTO `ey_region` VALUES ('27527', '道县', '3', '27418', 'D');
INSERT INTO `ey_region` VALUES ('27554', '江永县', '3', '27418', 'J');
INSERT INTO `ey_region` VALUES ('27567', '宁远县', '3', '27418', 'N');
INSERT INTO `ey_region` VALUES ('27585', '蓝山县', '3', '27418', 'L');
INSERT INTO `ey_region` VALUES ('27606', '新田县', '3', '27418', 'X');
INSERT INTO `ey_region` VALUES ('27626', '江华县', '3', '27418', 'J');
INSERT INTO `ey_region` VALUES ('27650', '怀化市', '2', '25579', 'H');
INSERT INTO `ey_region` VALUES ('27651', '市辖区', '3', '27650', 'S');
INSERT INTO `ey_region` VALUES ('27652', '鹤城区', '3', '27650', 'H');
INSERT INTO `ey_region` VALUES ('27667', '中方县', '3', '27650', 'Z');
INSERT INTO `ey_region` VALUES ('27690', '沅陵县', '3', '27650', 'Y');
INSERT INTO `ey_region` VALUES ('27714', '辰溪县', '3', '27650', 'C');
INSERT INTO `ey_region` VALUES ('27745', '溆浦县', '3', '27650', 'X');
INSERT INTO `ey_region` VALUES ('27789', '会同县', '3', '27650', 'H');
INSERT INTO `ey_region` VALUES ('27815', '麻阳县', '3', '27650', 'M');
INSERT INTO `ey_region` VALUES ('27839', '新晃县', '3', '27650', 'X');
INSERT INTO `ey_region` VALUES ('27863', '芷江县', '3', '27650', 'Z');
INSERT INTO `ey_region` VALUES ('27892', '靖州苗族侗族县', '3', '27650', 'J');
INSERT INTO `ey_region` VALUES ('27906', '通道县', '3', '27650', 'T');
INSERT INTO `ey_region` VALUES ('27930', '洪江市', '3', '27650', 'H');
INSERT INTO `ey_region` VALUES ('27963', '娄底市', '2', '25579', 'L');
INSERT INTO `ey_region` VALUES ('27964', '市辖区', '3', '27963', 'S');
INSERT INTO `ey_region` VALUES ('27965', '娄星区', '3', '27963', 'L');
INSERT INTO `ey_region` VALUES ('27980', '双峰县', '3', '27963', 'S');
INSERT INTO `ey_region` VALUES ('27997', '新化县', '3', '27963', 'X');
INSERT INTO `ey_region` VALUES ('28027', '冷水江市', '3', '27963', 'L');
INSERT INTO `ey_region` VALUES ('28044', '涟源市', '3', '27963', 'L');
INSERT INTO `ey_region` VALUES ('28065', '湘西州', '2', '25579', 'X');
INSERT INTO `ey_region` VALUES ('28066', '吉首市', '3', '28065', 'J');
INSERT INTO `ey_region` VALUES ('28082', '泸溪县', '3', '28065', 'L');
INSERT INTO `ey_region` VALUES ('28099', '凤凰县', '3', '28065', 'F');
INSERT INTO `ey_region` VALUES ('28124', '花垣县', '3', '28065', 'H');
INSERT INTO `ey_region` VALUES ('28143', '保靖县', '3', '28065', 'B');
INSERT INTO `ey_region` VALUES ('28161', '古丈县', '3', '28065', 'G');
INSERT INTO `ey_region` VALUES ('28174', '永顺县', '3', '28065', 'Y');
INSERT INTO `ey_region` VALUES ('28205', '龙山县', '3', '28065', 'L');
INSERT INTO `ey_region` VALUES ('28240', '广东省', '1', '0', 'G');
INSERT INTO `ey_region` VALUES ('28241', '广州市', '2', '28240', 'G');
INSERT INTO `ey_region` VALUES ('28242', '市辖区', '3', '28241', 'S');
INSERT INTO `ey_region` VALUES ('28243', '荔湾区', '3', '28241', 'L');
INSERT INTO `ey_region` VALUES ('28266', '越秀区', '3', '28241', 'Y');
INSERT INTO `ey_region` VALUES ('28289', '海珠区', '3', '28241', 'H');
INSERT INTO `ey_region` VALUES ('28308', '天河区', '3', '28241', 'T');
INSERT INTO `ey_region` VALUES ('28330', '白云区', '3', '28241', 'B');
INSERT INTO `ey_region` VALUES ('28349', '黄埔区', '3', '28241', 'H');
INSERT INTO `ey_region` VALUES ('28359', '番禺区', '3', '28241', 'F');
INSERT INTO `ey_region` VALUES ('28377', '花都区', '3', '28241', 'H');
INSERT INTO `ey_region` VALUES ('28386', '南沙区', '3', '28241', 'N');
INSERT INTO `ey_region` VALUES ('28392', '萝岗区', '3', '28241', 'L');
INSERT INTO `ey_region` VALUES ('28399', '增城市', '3', '28241', 'Z');
INSERT INTO `ey_region` VALUES ('28409', '从化市', '3', '28241', 'C');
INSERT INTO `ey_region` VALUES ('28421', '韶关市', '2', '28240', 'S');
INSERT INTO `ey_region` VALUES ('28422', '市辖区', '3', '28421', 'S');
INSERT INTO `ey_region` VALUES ('28423', '武江区', '3', '28421', 'W');
INSERT INTO `ey_region` VALUES ('28431', '浈江区', '3', '28421', 'Z');
INSERT INTO `ey_region` VALUES ('28448', '曲江区', '3', '28421', 'Q');
INSERT INTO `ey_region` VALUES ('28463', '始兴县', '3', '28421', 'S');
INSERT INTO `ey_region` VALUES ('28475', '仁化县', '3', '28421', 'R');
INSERT INTO `ey_region` VALUES ('28488', '翁源县', '3', '28421', 'W');
INSERT INTO `ey_region` VALUES ('28497', '乳源县', '3', '28421', 'R');
INSERT INTO `ey_region` VALUES ('28509', '新丰县', '3', '28421', 'X');
INSERT INTO `ey_region` VALUES ('28517', '乐昌市', '3', '28421', 'L');
INSERT INTO `ey_region` VALUES ('28539', '南雄市', '3', '28421', 'N');
INSERT INTO `ey_region` VALUES ('28558', '深圳市', '2', '28240', 'S');
INSERT INTO `ey_region` VALUES ('28559', '市辖区', '3', '28558', 'S');
INSERT INTO `ey_region` VALUES ('28560', '罗湖区', '3', '28558', 'L');
INSERT INTO `ey_region` VALUES ('28571', '福田区', '3', '28558', 'F');
INSERT INTO `ey_region` VALUES ('28581', '南山区', '3', '28558', 'N');
INSERT INTO `ey_region` VALUES ('28590', '宝安区', '3', '28558', 'B');
INSERT INTO `ey_region` VALUES ('28604', '龙岗区', '3', '28558', 'L');
INSERT INTO `ey_region` VALUES ('28619', '盐田区', '3', '28558', 'Y');
INSERT INTO `ey_region` VALUES ('28626', '珠海市', '2', '28240', 'Z');
INSERT INTO `ey_region` VALUES ('28627', '市辖区', '3', '28626', 'S');
INSERT INTO `ey_region` VALUES ('28628', '香洲区', '3', '28626', 'X');
INSERT INTO `ey_region` VALUES ('28646', '斗门区', '3', '28626', 'D');
INSERT INTO `ey_region` VALUES ('28654', '金湾区', '3', '28626', 'J');
INSERT INTO `ey_region` VALUES ('28659', '汕头市', '2', '28240', 'S');
INSERT INTO `ey_region` VALUES ('28660', '市辖区', '3', '28659', 'S');
INSERT INTO `ey_region` VALUES ('28661', '龙湖区', '3', '28659', 'L');
INSERT INTO `ey_region` VALUES ('28669', '金平区', '3', '28659', 'J');
INSERT INTO `ey_region` VALUES ('28687', '濠江区', '3', '28659', 'H');
INSERT INTO `ey_region` VALUES ('28695', '潮阳区', '3', '28659', 'C');
INSERT INTO `ey_region` VALUES ('28709', '潮南区', '3', '28659', 'C');
INSERT INTO `ey_region` VALUES ('28721', '澄海区', '3', '28659', 'C');
INSERT INTO `ey_region` VALUES ('28733', '南澳县', '3', '28659', 'N');
INSERT INTO `ey_region` VALUES ('28737', '佛山市', '2', '28240', 'F');
INSERT INTO `ey_region` VALUES ('28738', '市辖区', '3', '28737', 'S');
INSERT INTO `ey_region` VALUES ('28739', '禅城区', '3', '28737', 'C');
INSERT INTO `ey_region` VALUES ('28744', '南海区', '3', '28737', 'N');
INSERT INTO `ey_region` VALUES ('28753', '顺德区', '3', '28737', 'S');
INSERT INTO `ey_region` VALUES ('28764', '三水区', '3', '28737', 'S');
INSERT INTO `ey_region` VALUES ('28776', '高明区', '3', '28737', 'G');
INSERT INTO `ey_region` VALUES ('28785', '江门市', '2', '28240', 'J');
INSERT INTO `ey_region` VALUES ('28786', '市辖区', '3', '28785', 'S');
INSERT INTO `ey_region` VALUES ('28787', '蓬江区', '3', '28785', 'P');
INSERT INTO `ey_region` VALUES ('28797', '江海区', '3', '28785', 'J');
INSERT INTO `ey_region` VALUES ('28803', '新会区', '3', '28785', 'X');
INSERT INTO `ey_region` VALUES ('28818', '台山市', '3', '28785', 'T');
INSERT INTO `ey_region` VALUES ('28837', '开平市', '3', '28785', 'K');
INSERT INTO `ey_region` VALUES ('28853', '鹤山市', '3', '28785', 'H');
INSERT INTO `ey_region` VALUES ('28867', '恩平市', '3', '28785', 'E');
INSERT INTO `ey_region` VALUES ('28880', '湛江市', '2', '28240', 'Z');
INSERT INTO `ey_region` VALUES ('28881', '市辖区', '3', '28880', 'S');
INSERT INTO `ey_region` VALUES ('28882', '湛江市赤坎区', '3', '28880', 'Z');
INSERT INTO `ey_region` VALUES ('28891', '湛江市霞山区', '3', '28880', 'Z');
INSERT INTO `ey_region` VALUES ('28904', '湛江市坡头区', '3', '28880', 'Z');
INSERT INTO `ey_region` VALUES ('28914', '湛江市麻章区', '3', '28880', 'Z');
INSERT INTO `ey_region` VALUES ('28923', '遂溪县', '3', '28880', 'S');
INSERT INTO `ey_region` VALUES ('28941', '徐闻县', '3', '28880', 'X');
INSERT INTO `ey_region` VALUES ('28962', '廉江市', '3', '28880', 'L');
INSERT INTO `ey_region` VALUES ('28984', '雷州市', '3', '28880', 'L');
INSERT INTO `ey_region` VALUES ('29010', '吴川市', '3', '28880', 'W');
INSERT INTO `ey_region` VALUES ('29026', '茂名市', '2', '28240', 'M');
INSERT INTO `ey_region` VALUES ('29027', '市辖区', '3', '29026', 'S');
INSERT INTO `ey_region` VALUES ('29028', '茂南区', '3', '29026', 'M');
INSERT INTO `ey_region` VALUES ('29045', '茂港区', '3', '29026', 'M');
INSERT INTO `ey_region` VALUES ('29053', '电白县', '3', '29026', 'D');
INSERT INTO `ey_region` VALUES ('29075', '高州市', '3', '29026', 'G');
INSERT INTO `ey_region` VALUES ('29107', '化州市', '3', '29026', 'H');
INSERT INTO `ey_region` VALUES ('29138', '信宜市', '3', '29026', 'X');
INSERT INTO `ey_region` VALUES ('29159', '肇庆市', '2', '28240', 'Z');
INSERT INTO `ey_region` VALUES ('29160', '市辖区', '3', '29159', 'S');
INSERT INTO `ey_region` VALUES ('29161', '端州区', '3', '29159', 'D');
INSERT INTO `ey_region` VALUES ('29169', '鼎湖区', '3', '29159', 'D');
INSERT INTO `ey_region` VALUES ('29178', '广宁县', '3', '29159', 'G');
INSERT INTO `ey_region` VALUES ('29196', '怀集县', '3', '29159', 'H');
INSERT INTO `ey_region` VALUES ('29217', '封开县', '3', '29159', 'F');
INSERT INTO `ey_region` VALUES ('29234', '德庆县', '3', '29159', 'D');
INSERT INTO `ey_region` VALUES ('29248', '高要市', '3', '29159', 'G');
INSERT INTO `ey_region` VALUES ('29266', '四会市', '3', '29159', 'S');
INSERT INTO `ey_region` VALUES ('29282', '惠州市', '2', '28240', 'H');
INSERT INTO `ey_region` VALUES ('29283', '市辖区', '3', '29282', 'S');
INSERT INTO `ey_region` VALUES ('29284', '惠城区', '3', '29282', 'H');
INSERT INTO `ey_region` VALUES ('29304', '惠阳区', '3', '29282', 'H');
INSERT INTO `ey_region` VALUES ('29317', '博罗县', '3', '29282', 'B');
INSERT INTO `ey_region` VALUES ('29335', '惠东县', '3', '29282', 'H');
INSERT INTO `ey_region` VALUES ('29355', '龙门县', '3', '29282', 'L');
INSERT INTO `ey_region` VALUES ('29371', '梅州市', '2', '28240', 'M');
INSERT INTO `ey_region` VALUES ('29372', '市辖区', '3', '29371', 'S');
INSERT INTO `ey_region` VALUES ('29373', '梅江区', '3', '29371', 'M');
INSERT INTO `ey_region` VALUES ('29380', '梅县', '3', '29371', 'M');
INSERT INTO `ey_region` VALUES ('29400', '大埔县', '3', '29371', 'D');
INSERT INTO `ey_region` VALUES ('29418', '丰顺县', '3', '29371', 'F');
INSERT INTO `ey_region` VALUES ('29436', '五华县', '3', '29371', 'W');
INSERT INTO `ey_region` VALUES ('29453', '平远县', '3', '29371', 'P');
INSERT INTO `ey_region` VALUES ('29466', '蕉岭县', '3', '29371', 'J');
INSERT INTO `ey_region` VALUES ('29477', '兴宁市', '3', '29371', 'X');
INSERT INTO `ey_region` VALUES ('29498', '汕尾市', '2', '28240', 'S');
INSERT INTO `ey_region` VALUES ('29499', '市辖区', '3', '29498', 'S');
INSERT INTO `ey_region` VALUES ('29500', '城区', '3', '29498', 'C');
INSERT INTO `ey_region` VALUES ('29511', '海丰县', '3', '29498', 'H');
INSERT INTO `ey_region` VALUES ('29529', '陆河县', '3', '29498', 'L');
INSERT INTO `ey_region` VALUES ('29538', '陆丰市', '3', '29498', 'L');
INSERT INTO `ey_region` VALUES ('29568', '河源市', '2', '28240', 'H');
INSERT INTO `ey_region` VALUES ('29569', '市辖区', '3', '29568', 'S');
INSERT INTO `ey_region` VALUES ('29570', '源城区', '3', '29568', 'Y');
INSERT INTO `ey_region` VALUES ('29578', '紫金县', '3', '29568', 'Z');
INSERT INTO `ey_region` VALUES ('29599', '龙川县', '3', '29568', 'L');
INSERT INTO `ey_region` VALUES ('29625', '连平县', '3', '29568', 'L');
INSERT INTO `ey_region` VALUES ('29639', '和平县', '3', '29568', 'H');
INSERT INTO `ey_region` VALUES ('29657', '东源县', '3', '29568', 'D');
INSERT INTO `ey_region` VALUES ('29679', '阳江市', '2', '28240', 'Y');
INSERT INTO `ey_region` VALUES ('29680', '市辖区', '3', '29679', 'S');
INSERT INTO `ey_region` VALUES ('29681', '江城区', '3', '29679', 'J');
INSERT INTO `ey_region` VALUES ('29698', '阳西县', '3', '29679', 'Y');
INSERT INTO `ey_region` VALUES ('29709', '阳东县', '3', '29679', 'Y');
INSERT INTO `ey_region` VALUES ('29729', '阳春市', '3', '29679', 'Y');
INSERT INTO `ey_region` VALUES ('29755', '清远市', '2', '28240', 'Q');
INSERT INTO `ey_region` VALUES ('29756', '市辖区', '3', '29755', 'S');
INSERT INTO `ey_region` VALUES ('29757', '清城区', '3', '29755', 'Q');
INSERT INTO `ey_region` VALUES ('29766', '佛冈县', '3', '29755', 'F');
INSERT INTO `ey_region` VALUES ('29773', '阳山县', '3', '29755', 'Y');
INSERT INTO `ey_region` VALUES ('29787', '连山县', '3', '29755', 'L');
INSERT INTO `ey_region` VALUES ('29797', '连南县', '3', '29755', 'L');
INSERT INTO `ey_region` VALUES ('29805', '清新县', '3', '29755', 'Q');
INSERT INTO `ey_region` VALUES ('29816', '英德市', '3', '29755', 'Y');
INSERT INTO `ey_region` VALUES ('29842', '连州市', '3', '29755', 'L');
INSERT INTO `ey_region` VALUES ('29855', '东莞市', '2', '28240', 'D');
INSERT INTO `ey_region` VALUES ('29890', '中山市', '2', '28240', 'Z');
INSERT INTO `ey_region` VALUES ('29915', '潮州市', '2', '28240', 'C');
INSERT INTO `ey_region` VALUES ('29916', '市辖区', '3', '29915', 'S');
INSERT INTO `ey_region` VALUES ('29917', '潮州市湘桥区', '3', '29915', 'C');
INSERT INTO `ey_region` VALUES ('29930', '潮州市潮安县', '3', '29915', 'C');
INSERT INTO `ey_region` VALUES ('29954', '潮州市饶平县', '3', '29915', 'C');
INSERT INTO `ey_region` VALUES ('29977', '揭阳市', '2', '28240', 'J');
INSERT INTO `ey_region` VALUES ('29978', '市辖区', '3', '29977', 'S');
INSERT INTO `ey_region` VALUES ('29979', '榕城区', '3', '29977', 'R');
INSERT INTO `ey_region` VALUES ('29990', '揭东县', '3', '29977', 'J');
INSERT INTO `ey_region` VALUES ('30008', '揭西县', '3', '29977', 'J');
INSERT INTO `ey_region` VALUES ('30032', '惠来县', '3', '29977', 'H');
INSERT INTO `ey_region` VALUES ('30054', '普宁市', '3', '29977', 'P');
INSERT INTO `ey_region` VALUES ('30086', '云浮市', '2', '28240', 'Y');
INSERT INTO `ey_region` VALUES ('30087', '市辖区', '3', '30086', 'S');
INSERT INTO `ey_region` VALUES ('30088', '云城区', '3', '30086', 'Y');
INSERT INTO `ey_region` VALUES ('30096', '新兴县', '3', '30086', 'X');
INSERT INTO `ey_region` VALUES ('30112', '郁南县', '3', '30086', 'Y');
INSERT INTO `ey_region` VALUES ('30132', '云安县', '3', '30086', 'Y');
INSERT INTO `ey_region` VALUES ('30141', '罗定市', '3', '30086', 'L');
INSERT INTO `ey_region` VALUES ('30164', '广西', '1', '0', 'G');
INSERT INTO `ey_region` VALUES ('30165', '南宁市', '2', '30164', 'N');
INSERT INTO `ey_region` VALUES ('30166', '市辖区', '3', '30165', 'S');
INSERT INTO `ey_region` VALUES ('30167', '兴宁区', '3', '30165', 'X');
INSERT INTO `ey_region` VALUES ('30174', '青秀区', '3', '30165', 'Q');
INSERT INTO `ey_region` VALUES ('30186', '江南区', '3', '30165', 'J');
INSERT INTO `ey_region` VALUES ('30196', '西乡塘区', '3', '30165', 'X');
INSERT INTO `ey_region` VALUES ('30214', '良庆区', '3', '30165', 'L');
INSERT INTO `ey_region` VALUES ('30222', '邕宁区', '3', '30165', 'Y');
INSERT INTO `ey_region` VALUES ('30228', '武鸣县', '3', '30165', 'W');
INSERT INTO `ey_region` VALUES ('30245', '隆安县', '3', '30165', 'L');
INSERT INTO `ey_region` VALUES ('30257', '马山县', '3', '30165', 'M');
INSERT INTO `ey_region` VALUES ('30270', '上林县', '3', '30165', 'S');
INSERT INTO `ey_region` VALUES ('30282', '宾阳县', '3', '30165', 'B');
INSERT INTO `ey_region` VALUES ('30300', '横县', '3', '30165', 'H');
INSERT INTO `ey_region` VALUES ('30319', '柳州市', '2', '30164', 'L');
INSERT INTO `ey_region` VALUES ('30320', '市辖区', '3', '30319', 'S');
INSERT INTO `ey_region` VALUES ('30321', '城中区', '3', '30319', 'C');
INSERT INTO `ey_region` VALUES ('30329', '鱼峰区', '3', '30319', 'Y');
INSERT INTO `ey_region` VALUES ('30338', '柳南区', '3', '30319', 'L');
INSERT INTO `ey_region` VALUES ('30348', '柳北区', '3', '30319', 'L');
INSERT INTO `ey_region` VALUES ('30361', '柳江县', '3', '30319', 'L');
INSERT INTO `ey_region` VALUES ('30374', '柳城县', '3', '30319', 'L');
INSERT INTO `ey_region` VALUES ('30387', '鹿寨县', '3', '30319', 'L');
INSERT INTO `ey_region` VALUES ('30398', '融安县', '3', '30319', 'R');
INSERT INTO `ey_region` VALUES ('30411', '融水县', '3', '30319', 'R');
INSERT INTO `ey_region` VALUES ('30432', '三江县', '3', '30319', 'S');
INSERT INTO `ey_region` VALUES ('30448', '桂林市', '2', '30164', 'G');
INSERT INTO `ey_region` VALUES ('30449', '市辖区', '3', '30448', 'S');
INSERT INTO `ey_region` VALUES ('30450', '秀峰区', '3', '30448', 'X');
INSERT INTO `ey_region` VALUES ('30454', '叠彩区', '3', '30448', 'D');
INSERT INTO `ey_region` VALUES ('30458', '象山区', '3', '30448', 'X');
INSERT INTO `ey_region` VALUES ('30463', '七星区', '3', '30448', 'Q');
INSERT INTO `ey_region` VALUES ('30469', '雁山区', '3', '30448', 'Y');
INSERT INTO `ey_region` VALUES ('30475', '阳朔县', '3', '30448', 'Y');
INSERT INTO `ey_region` VALUES ('30485', '临桂县', '3', '30448', 'L');
INSERT INTO `ey_region` VALUES ('30497', '灵川县', '3', '30448', 'L');
INSERT INTO `ey_region` VALUES ('30509', '全州县', '3', '30448', 'Q');
INSERT INTO `ey_region` VALUES ('30528', '兴安县', '3', '30448', 'X');
INSERT INTO `ey_region` VALUES ('30539', '永福县', '3', '30448', 'Y');
INSERT INTO `ey_region` VALUES ('30549', '灌阳县', '3', '30448', 'G');
INSERT INTO `ey_region` VALUES ('30559', '龙胜县', '3', '30448', 'L');
INSERT INTO `ey_region` VALUES ('30570', '资源县', '3', '30448', 'Z');
INSERT INTO `ey_region` VALUES ('30578', '平乐县', '3', '30448', 'P');
INSERT INTO `ey_region` VALUES ('30589', '荔浦县', '3', '30448', 'L');
INSERT INTO `ey_region` VALUES ('30603', '恭城县', '3', '30448', 'G');
INSERT INTO `ey_region` VALUES ('30613', '梧州市', '2', '30164', 'W');
INSERT INTO `ey_region` VALUES ('30614', '市辖区', '3', '30613', 'S');
INSERT INTO `ey_region` VALUES ('30615', '万秀区', '3', '30613', 'W');
INSERT INTO `ey_region` VALUES ('30622', '蝶山区', '3', '30613', 'D');
INSERT INTO `ey_region` VALUES ('30628', '长洲区', '3', '30613', 'C');
INSERT INTO `ey_region` VALUES ('30633', '苍梧县', '3', '30613', 'C');
INSERT INTO `ey_region` VALUES ('30646', '藤县', '3', '30613', 'T');
INSERT INTO `ey_region` VALUES ('30663', '蒙山县', '3', '30613', 'M');
INSERT INTO `ey_region` VALUES ('30673', '岑溪市', '3', '30613', 'C');
INSERT INTO `ey_region` VALUES ('30688', '北海市', '2', '30164', 'B');
INSERT INTO `ey_region` VALUES ('30689', '市辖区', '3', '30688', 'S');
INSERT INTO `ey_region` VALUES ('30690', '海城区', '3', '30688', 'H');
INSERT INTO `ey_region` VALUES ('30699', '银海区', '3', '30688', 'Y');
INSERT INTO `ey_region` VALUES ('30704', '铁山港区', '3', '30688', 'T');
INSERT INTO `ey_region` VALUES ('30708', '合浦县', '3', '30688', 'H');
INSERT INTO `ey_region` VALUES ('30724', '防城港市', '2', '30164', 'F');
INSERT INTO `ey_region` VALUES ('30725', '市辖区', '3', '30724', 'S');
INSERT INTO `ey_region` VALUES ('30726', '港口区', '3', '30724', 'G');
INSERT INTO `ey_region` VALUES ('30732', '防城区', '3', '30724', 'F');
INSERT INTO `ey_region` VALUES ('30748', '上思县', '3', '30724', 'S');
INSERT INTO `ey_region` VALUES ('30758', '东兴市', '3', '30724', 'D');
INSERT INTO `ey_region` VALUES ('30762', '钦州市', '2', '30164', 'Q');
INSERT INTO `ey_region` VALUES ('30763', '市辖区', '3', '30762', 'S');
INSERT INTO `ey_region` VALUES ('30764', '钦南区', '3', '30762', 'Q');
INSERT INTO `ey_region` VALUES ('30783', '钦北区', '3', '30762', 'Q');
INSERT INTO `ey_region` VALUES ('30796', '灵山县', '3', '30762', 'L');
INSERT INTO `ey_region` VALUES ('30817', '浦北县', '3', '30762', 'P');
INSERT INTO `ey_region` VALUES ('30834', '贵港市', '2', '30164', 'G');
INSERT INTO `ey_region` VALUES ('30835', '市辖区', '3', '30834', 'S');
INSERT INTO `ey_region` VALUES ('30836', '港北区', '3', '30834', 'G');
INSERT INTO `ey_region` VALUES ('30845', '港南区', '3', '30834', 'G');
INSERT INTO `ey_region` VALUES ('30855', '覃塘区', '3', '30834', 'Q');
INSERT INTO `ey_region` VALUES ('30866', '平南县', '3', '30834', 'P');
INSERT INTO `ey_region` VALUES ('30888', '桂平市', '3', '30834', 'G');
INSERT INTO `ey_region` VALUES ('30915', '玉林市', '2', '30164', 'Y');
INSERT INTO `ey_region` VALUES ('30916', '市辖区', '3', '30915', 'S');
INSERT INTO `ey_region` VALUES ('30917', '玉州区', '3', '30915', 'Y');
INSERT INTO `ey_region` VALUES ('30933', '容县', '3', '30915', 'R');
INSERT INTO `ey_region` VALUES ('30949', '陆川县', '3', '30915', 'L');
INSERT INTO `ey_region` VALUES ('30964', '博白县', '3', '30915', 'B');
INSERT INTO `ey_region` VALUES ('30993', '兴业县', '3', '30915', 'X');
INSERT INTO `ey_region` VALUES ('31007', '北流市', '3', '30915', 'B');
INSERT INTO `ey_region` VALUES ('31033', '百色市', '2', '30164', 'B');
INSERT INTO `ey_region` VALUES ('31034', '市辖区', '3', '31033', 'S');
INSERT INTO `ey_region` VALUES ('31035', '右江区', '3', '31033', 'Y');
INSERT INTO `ey_region` VALUES ('31045', '田阳县', '3', '31033', 'T');
INSERT INTO `ey_region` VALUES ('31056', '田东县', '3', '31033', 'T');
INSERT INTO `ey_region` VALUES ('31067', '平果县', '3', '31033', 'P');
INSERT INTO `ey_region` VALUES ('31081', '德保县', '3', '31033', 'D');
INSERT INTO `ey_region` VALUES ('31095', '靖西县', '3', '31033', 'J');
INSERT INTO `ey_region` VALUES ('31115', '那坡县', '3', '31033', 'N');
INSERT INTO `ey_region` VALUES ('31125', '凌云县', '3', '31033', 'L');
INSERT INTO `ey_region` VALUES ('31134', '乐业县', '3', '31033', 'L');
INSERT INTO `ey_region` VALUES ('31143', '田林县', '3', '31033', 'T');
INSERT INTO `ey_region` VALUES ('31158', '西林县', '3', '31033', 'X');
INSERT INTO `ey_region` VALUES ('31167', '隆林县', '3', '31033', 'L');
INSERT INTO `ey_region` VALUES ('31184', '贺州市', '2', '30164', 'H');
INSERT INTO `ey_region` VALUES ('31185', '市辖区', '3', '31184', 'S');
INSERT INTO `ey_region` VALUES ('31186', '八步区', '3', '31184', 'B');
INSERT INTO `ey_region` VALUES ('31208', '昭平县', '3', '31184', 'Z');
INSERT INTO `ey_region` VALUES ('31221', '钟山县', '3', '31184', 'Z');
INSERT INTO `ey_region` VALUES ('31236', '富川县', '3', '31184', 'F');
INSERT INTO `ey_region` VALUES ('31249', '河池市', '2', '30164', 'H');
INSERT INTO `ey_region` VALUES ('31250', '市辖区', '3', '31249', 'S');
INSERT INTO `ey_region` VALUES ('31251', '金城江区', '3', '31249', 'J');
INSERT INTO `ey_region` VALUES ('31264', '南丹县', '3', '31249', 'N');
INSERT INTO `ey_region` VALUES ('31276', '天峨县', '3', '31249', 'T');
INSERT INTO `ey_region` VALUES ('31286', '凤山县', '3', '31249', 'F');
INSERT INTO `ey_region` VALUES ('31296', '东兰县', '3', '31249', 'D');
INSERT INTO `ey_region` VALUES ('31311', '罗城县', '3', '31249', 'L');
INSERT INTO `ey_region` VALUES ('31323', '环江县', '3', '31249', 'H');
INSERT INTO `ey_region` VALUES ('31336', '巴马县', '3', '31249', 'B');
INSERT INTO `ey_region` VALUES ('31347', '都安县', '3', '31249', 'D');
INSERT INTO `ey_region` VALUES ('31367', '大化县', '3', '31249', 'D');
INSERT INTO `ey_region` VALUES ('31384', '宜州市', '3', '31249', 'Y');
INSERT INTO `ey_region` VALUES ('31401', '来宾市', '2', '30164', 'L');
INSERT INTO `ey_region` VALUES ('31402', '市辖区', '3', '31401', 'S');
INSERT INTO `ey_region` VALUES ('31403', '兴宾区', '3', '31401', 'X');
INSERT INTO `ey_region` VALUES ('31427', '忻城县', '3', '31401', 'X');
INSERT INTO `ey_region` VALUES ('31440', '象州县', '3', '31401', 'X');
INSERT INTO `ey_region` VALUES ('31452', '武宣县', '3', '31401', 'W');
INSERT INTO `ey_region` VALUES ('31463', '金秀县', '3', '31401', 'J');
INSERT INTO `ey_region` VALUES ('31474', '合山市', '3', '31401', 'H');
INSERT INTO `ey_region` VALUES ('31478', '崇左市', '2', '30164', 'C');
INSERT INTO `ey_region` VALUES ('31479', '市辖区', '3', '31478', 'S');
INSERT INTO `ey_region` VALUES ('31480', '江州区', '3', '31478', 'J');
INSERT INTO `ey_region` VALUES ('31490', '扶绥县', '3', '31478', 'F');
INSERT INTO `ey_region` VALUES ('31502', '宁明县', '3', '31478', 'N');
INSERT INTO `ey_region` VALUES ('31516', '龙州县', '3', '31478', 'L');
INSERT INTO `ey_region` VALUES ('31529', '大新县', '3', '31478', 'D');
INSERT INTO `ey_region` VALUES ('31544', '天等县', '3', '31478', 'T');
INSERT INTO `ey_region` VALUES ('31558', '凭祥市', '3', '31478', 'P');
INSERT INTO `ey_region` VALUES ('31563', '海南省', '1', '0', 'H');
INSERT INTO `ey_region` VALUES ('31564', '海口市', '2', '31563', 'H');
INSERT INTO `ey_region` VALUES ('31565', '市辖区', '3', '31564', 'S');
INSERT INTO `ey_region` VALUES ('31566', '秀英区', '3', '31564', 'X');
INSERT INTO `ey_region` VALUES ('31575', '龙华区', '3', '31564', 'L');
INSERT INTO `ey_region` VALUES ('31587', '琼山区', '3', '31564', 'Q');
INSERT INTO `ey_region` VALUES ('31601', '美兰区', '3', '31564', 'M');
INSERT INTO `ey_region` VALUES ('31618', '三亚市', '2', '31563', 'S');
INSERT INTO `ey_region` VALUES ('31619', '市辖区', '3', '31618', 'S');
INSERT INTO `ey_region` VALUES ('31634', '五指山市', '2', '31563', 'W');
INSERT INTO `ey_region` VALUES ('31635', '冲山镇', '3', '31634', 'C');
INSERT INTO `ey_region` VALUES ('31636', '南圣镇', '3', '31634', 'N');
INSERT INTO `ey_region` VALUES ('31637', '毛阳镇', '3', '31634', 'M');
INSERT INTO `ey_region` VALUES ('31638', '番阳镇', '3', '31634', 'F');
INSERT INTO `ey_region` VALUES ('31639', '畅好乡', '3', '31634', 'C');
INSERT INTO `ey_region` VALUES ('31640', '毛道乡', '3', '31634', 'M');
INSERT INTO `ey_region` VALUES ('31641', '水满乡', '3', '31634', 'S');
INSERT INTO `ey_region` VALUES ('31642', '国营畅好农场', '3', '31634', 'G');
INSERT INTO `ey_region` VALUES ('31643', '琼海市', '2', '31563', 'Q');
INSERT INTO `ey_region` VALUES ('31644', '嘉积镇', '3', '31643', 'J');
INSERT INTO `ey_region` VALUES ('31645', '万泉镇', '3', '31643', 'W');
INSERT INTO `ey_region` VALUES ('31646', '石壁镇', '3', '31643', 'S');
INSERT INTO `ey_region` VALUES ('31647', '中原镇', '3', '31643', 'Z');
INSERT INTO `ey_region` VALUES ('31648', '博敖镇', '3', '31643', 'B');
INSERT INTO `ey_region` VALUES ('31649', '阳江镇', '3', '31643', 'Y');
INSERT INTO `ey_region` VALUES ('31650', '龙江镇', '3', '31643', 'L');
INSERT INTO `ey_region` VALUES ('31651', '潭门镇', '3', '31643', 'T');
INSERT INTO `ey_region` VALUES ('31652', '塔洋镇', '3', '31643', 'T');
INSERT INTO `ey_region` VALUES ('31653', '长坡镇', '3', '31643', 'C');
INSERT INTO `ey_region` VALUES ('31654', '大路镇', '3', '31643', 'D');
INSERT INTO `ey_region` VALUES ('31655', '会山镇', '3', '31643', 'H');
INSERT INTO `ey_region` VALUES ('31656', '国营东太农场', '3', '31643', 'G');
INSERT INTO `ey_region` VALUES ('31657', '国营东平农场', '3', '31643', 'G');
INSERT INTO `ey_region` VALUES ('31658', '国营东红农场', '3', '31643', 'G');
INSERT INTO `ey_region` VALUES ('31659', '国营东升农场', '3', '31643', 'G');
INSERT INTO `ey_region` VALUES ('31660', '国营南俸农场', '3', '31643', 'G');
INSERT INTO `ey_region` VALUES ('31661', '彬村山华侨农场', '3', '31643', 'B');
INSERT INTO `ey_region` VALUES ('31662', '儋州市', '2', '31563', 'D');
INSERT INTO `ey_region` VALUES ('31663', '那大镇', '3', '31662', 'N');
INSERT INTO `ey_region` VALUES ('31664', '和庆镇', '3', '31662', 'H');
INSERT INTO `ey_region` VALUES ('31665', '南丰镇', '3', '31662', 'N');
INSERT INTO `ey_region` VALUES ('31666', '大成镇', '3', '31662', 'D');
INSERT INTO `ey_region` VALUES ('31667', '雅星镇', '3', '31662', 'Y');
INSERT INTO `ey_region` VALUES ('31668', '兰洋镇', '3', '31662', 'L');
INSERT INTO `ey_region` VALUES ('31669', '光村镇', '3', '31662', 'G');
INSERT INTO `ey_region` VALUES ('31670', '木棠镇', '3', '31662', 'M');
INSERT INTO `ey_region` VALUES ('31671', '海头镇', '3', '31662', 'H');
INSERT INTO `ey_region` VALUES ('31672', '峨蔓镇', '3', '31662', 'E');
INSERT INTO `ey_region` VALUES ('31673', '三都镇', '3', '31662', 'S');
INSERT INTO `ey_region` VALUES ('31674', '王五镇', '3', '31662', 'W');
INSERT INTO `ey_region` VALUES ('31675', '白马井镇', '3', '31662', 'B');
INSERT INTO `ey_region` VALUES ('31676', '中和镇', '3', '31662', 'Z');
INSERT INTO `ey_region` VALUES ('31677', '排浦镇', '3', '31662', 'P');
INSERT INTO `ey_region` VALUES ('31678', '东成镇', '3', '31662', 'D');
INSERT INTO `ey_region` VALUES ('31679', '新州镇', '3', '31662', 'X');
INSERT INTO `ey_region` VALUES ('31680', '国营西培农场', '3', '31662', 'G');
INSERT INTO `ey_region` VALUES ('31681', '国营西华农场', '3', '31662', 'G');
INSERT INTO `ey_region` VALUES ('31682', '国营西庆农场', '3', '31662', 'G');
INSERT INTO `ey_region` VALUES ('31683', '国营西流农场', '3', '31662', 'G');
INSERT INTO `ey_region` VALUES ('31684', '国营西联农场', '3', '31662', 'G');
INSERT INTO `ey_region` VALUES ('31685', '国营蓝洋农场', '3', '31662', 'G');
INSERT INTO `ey_region` VALUES ('31686', '国营新盈农场', '3', '31662', 'G');
INSERT INTO `ey_region` VALUES ('31687', '国营八一农场东山分场', '3', '31662', 'G');
INSERT INTO `ey_region` VALUES ('31688', '国营八一农场金川分场', '3', '31662', 'G');
INSERT INTO `ey_region` VALUES ('31689', '国营八一农场长岭分场', '3', '31662', 'G');
INSERT INTO `ey_region` VALUES ('31690', '国营八一农场英岛分场', '3', '31662', 'G');
INSERT INTO `ey_region` VALUES ('31691', '国营八一农场春江分场', '3', '31662', 'G');
INSERT INTO `ey_region` VALUES ('31692', '国营八一农场强打管区', '3', '31662', 'G');
INSERT INTO `ey_region` VALUES ('31693', '国营龙山农场', '3', '31662', 'G');
INSERT INTO `ey_region` VALUES ('31694', '国营红岭农场', '3', '31662', 'G');
INSERT INTO `ey_region` VALUES ('31695', '洋浦经济开发区', '3', '31662', 'Y');
INSERT INTO `ey_region` VALUES ('31696', '华南热作学院', '3', '31662', 'H');
INSERT INTO `ey_region` VALUES ('31697', '文昌市', '2', '31563', 'W');
INSERT INTO `ey_region` VALUES ('31698', '文城镇', '3', '31697', 'W');
INSERT INTO `ey_region` VALUES ('31699', '重兴镇', '3', '31697', 'Z');
INSERT INTO `ey_region` VALUES ('31700', '蓬莱镇', '3', '31697', 'P');
INSERT INTO `ey_region` VALUES ('31701', '会文镇', '3', '31697', 'H');
INSERT INTO `ey_region` VALUES ('31702', '东路镇', '3', '31697', 'D');
INSERT INTO `ey_region` VALUES ('31703', '潭牛镇', '3', '31697', 'T');
INSERT INTO `ey_region` VALUES ('31704', '东阁镇', '3', '31697', 'D');
INSERT INTO `ey_region` VALUES ('31705', '文教镇', '3', '31697', 'W');
INSERT INTO `ey_region` VALUES ('31706', '东郊镇', '3', '31697', 'D');
INSERT INTO `ey_region` VALUES ('31707', '龙楼镇', '3', '31697', 'L');
INSERT INTO `ey_region` VALUES ('31708', '昌洒镇', '3', '31697', 'C');
INSERT INTO `ey_region` VALUES ('31709', '翁田镇', '3', '31697', 'W');
INSERT INTO `ey_region` VALUES ('31710', '抱罗镇', '3', '31697', 'B');
INSERT INTO `ey_region` VALUES ('31711', '冯坡镇', '3', '31697', 'F');
INSERT INTO `ey_region` VALUES ('31712', '锦山镇', '3', '31697', 'J');
INSERT INTO `ey_region` VALUES ('31713', '铺前镇', '3', '31697', 'P');
INSERT INTO `ey_region` VALUES ('31714', '国营东路农场', '3', '31697', 'G');
INSERT INTO `ey_region` VALUES ('31715', '国营南阳农场', '3', '31697', 'G');
INSERT INTO `ey_region` VALUES ('31716', '国营罗豆农场', '3', '31697', 'G');
INSERT INTO `ey_region` VALUES ('31717', '国营文昌橡胶研究所', '3', '31697', 'G');
INSERT INTO `ey_region` VALUES ('31718', '万宁市', '2', '31563', 'W');
INSERT INTO `ey_region` VALUES ('31719', '万城镇', '3', '31718', 'W');
INSERT INTO `ey_region` VALUES ('31720', '龙滚镇', '3', '31718', 'L');
INSERT INTO `ey_region` VALUES ('31721', '和乐镇', '3', '31718', 'H');
INSERT INTO `ey_region` VALUES ('31722', '后安镇', '3', '31718', 'H');
INSERT INTO `ey_region` VALUES ('31723', '大茂镇', '3', '31718', 'D');
INSERT INTO `ey_region` VALUES ('31724', '东澳镇', '3', '31718', 'D');
INSERT INTO `ey_region` VALUES ('31725', '礼纪镇', '3', '31718', 'L');
INSERT INTO `ey_region` VALUES ('31726', '长丰镇', '3', '31718', 'C');
INSERT INTO `ey_region` VALUES ('31727', '山根镇', '3', '31718', 'S');
INSERT INTO `ey_region` VALUES ('31728', '北大镇', '3', '31718', 'B');
INSERT INTO `ey_region` VALUES ('31729', '南桥镇', '3', '31718', 'N');
INSERT INTO `ey_region` VALUES ('31730', '三更罗镇', '3', '31718', 'S');
INSERT INTO `ey_region` VALUES ('31731', '国营东兴农场', '3', '31718', 'G');
INSERT INTO `ey_region` VALUES ('31732', '国营东和农场', '3', '31718', 'G');
INSERT INTO `ey_region` VALUES ('31733', '国营东岭农场', '3', '31718', 'G');
INSERT INTO `ey_region` VALUES ('31734', '国营南林农场', '3', '31718', 'G');
INSERT INTO `ey_region` VALUES ('31735', '国营新中农场', '3', '31718', 'G');
INSERT INTO `ey_region` VALUES ('31736', '兴隆华侨农场', '3', '31718', 'X');
INSERT INTO `ey_region` VALUES ('31737', '地方国营六连林场', '3', '31718', 'D');
INSERT INTO `ey_region` VALUES ('31738', '东方市', '2', '31563', 'D');
INSERT INTO `ey_region` VALUES ('31739', '八所镇', '3', '31738', 'B');
INSERT INTO `ey_region` VALUES ('31740', '东河镇', '3', '31738', 'D');
INSERT INTO `ey_region` VALUES ('31741', '大田镇', '3', '31738', 'D');
INSERT INTO `ey_region` VALUES ('31742', '感城镇', '3', '31738', 'G');
INSERT INTO `ey_region` VALUES ('31743', '板桥镇', '3', '31738', 'B');
INSERT INTO `ey_region` VALUES ('31744', '三家镇', '3', '31738', 'S');
INSERT INTO `ey_region` VALUES ('31745', '四更镇', '3', '31738', 'S');
INSERT INTO `ey_region` VALUES ('31746', '新龙镇', '3', '31738', 'X');
INSERT INTO `ey_region` VALUES ('31747', '天安乡', '3', '31738', 'T');
INSERT INTO `ey_region` VALUES ('31748', '江边乡', '3', '31738', 'J');
INSERT INTO `ey_region` VALUES ('31749', '国营广坝农场', '3', '31738', 'G');
INSERT INTO `ey_region` VALUES ('31750', '国营公爱农场', '3', '31738', 'G');
INSERT INTO `ey_region` VALUES ('31751', '国营红泉农场', '3', '31738', 'G');
INSERT INTO `ey_region` VALUES ('31752', '省国营东方华侨农场', '3', '31738', 'S');
INSERT INTO `ey_region` VALUES ('31753', '定安县', '2', '31563', 'D');
INSERT INTO `ey_region` VALUES ('31754', '定城镇', '3', '31753', 'D');
INSERT INTO `ey_region` VALUES ('31755', '新竹镇', '3', '31753', 'X');
INSERT INTO `ey_region` VALUES ('31756', '龙湖镇', '3', '31753', 'L');
INSERT INTO `ey_region` VALUES ('31757', '黄竹镇', '3', '31753', 'H');
INSERT INTO `ey_region` VALUES ('31758', '雷鸣镇', '3', '31753', 'L');
INSERT INTO `ey_region` VALUES ('31759', '龙门镇', '3', '31753', 'L');
INSERT INTO `ey_region` VALUES ('31760', '龙河镇', '3', '31753', 'L');
INSERT INTO `ey_region` VALUES ('31761', '岭口镇', '3', '31753', 'L');
INSERT INTO `ey_region` VALUES ('31762', '翰林镇', '3', '31753', 'H');
INSERT INTO `ey_region` VALUES ('31763', '富文镇', '3', '31753', 'F');
INSERT INTO `ey_region` VALUES ('31764', '国营中瑞农场', '3', '31753', 'G');
INSERT INTO `ey_region` VALUES ('31765', '国营南海农场', '3', '31753', 'G');
INSERT INTO `ey_region` VALUES ('31766', '国营金鸡岭农场', '3', '31753', 'G');
INSERT INTO `ey_region` VALUES ('31767', '定安热作研究所', '3', '31753', 'D');
INSERT INTO `ey_region` VALUES ('31768', '屯昌县', '2', '31563', 'T');
INSERT INTO `ey_region` VALUES ('31769', '屯城镇', '3', '31768', 'T');
INSERT INTO `ey_region` VALUES ('31770', '新兴镇', '3', '31768', 'X');
INSERT INTO `ey_region` VALUES ('31771', '枫木镇', '3', '31768', 'F');
INSERT INTO `ey_region` VALUES ('31772', '乌坡镇', '3', '31768', 'W');
INSERT INTO `ey_region` VALUES ('31773', '南吕镇', '3', '31768', 'N');
INSERT INTO `ey_region` VALUES ('31774', '南坤镇', '3', '31768', 'N');
INSERT INTO `ey_region` VALUES ('31775', '坡心镇', '3', '31768', 'P');
INSERT INTO `ey_region` VALUES ('31776', '西昌镇', '3', '31768', 'X');
INSERT INTO `ey_region` VALUES ('31777', '国营中建农场', '3', '31768', 'G');
INSERT INTO `ey_region` VALUES ('31778', '国营中坤农场', '3', '31768', 'G');
INSERT INTO `ey_region` VALUES ('31779', '国营黄岭农场', '3', '31768', 'G');
INSERT INTO `ey_region` VALUES ('31780', '国营南吕农场', '3', '31768', 'G');
INSERT INTO `ey_region` VALUES ('31781', '国营广青农场', '3', '31768', 'G');
INSERT INTO `ey_region` VALUES ('31782', '国营晨星农场', '3', '31768', 'G');
INSERT INTO `ey_region` VALUES ('31783', '澄迈县', '2', '31563', 'C');
INSERT INTO `ey_region` VALUES ('31784', '金江镇', '3', '31783', 'J');
INSERT INTO `ey_region` VALUES ('31785', '老城镇', '3', '31783', 'L');
INSERT INTO `ey_region` VALUES ('31786', '瑞溪镇', '3', '31783', 'R');
INSERT INTO `ey_region` VALUES ('31787', '永发镇', '3', '31783', 'Y');
INSERT INTO `ey_region` VALUES ('31788', '加乐镇', '3', '31783', 'J');
INSERT INTO `ey_region` VALUES ('31789', '文儒镇', '3', '31783', 'W');
INSERT INTO `ey_region` VALUES ('31790', '中兴镇', '3', '31783', 'Z');
INSERT INTO `ey_region` VALUES ('31791', '仁兴镇', '3', '31783', 'R');
INSERT INTO `ey_region` VALUES ('31792', '福山镇', '3', '31783', 'F');
INSERT INTO `ey_region` VALUES ('31793', '桥头镇', '3', '31783', 'Q');
INSERT INTO `ey_region` VALUES ('31794', '国营红光农场', '3', '31783', 'G');
INSERT INTO `ey_region` VALUES ('31795', '国营红岗农场', '3', '31783', 'G');
INSERT INTO `ey_region` VALUES ('31796', '国营西达农场', '3', '31783', 'G');
INSERT INTO `ey_region` VALUES ('31797', '国营昆仑农场', '3', '31783', 'G');
INSERT INTO `ey_region` VALUES ('31798', '国营和岭农场', '3', '31783', 'G');
INSERT INTO `ey_region` VALUES ('31799', '国营金安农场', '3', '31783', 'G');
INSERT INTO `ey_region` VALUES ('31800', '澄迈县华侨农场', '3', '31783', 'C');
INSERT INTO `ey_region` VALUES ('31801', '临高县', '2', '31563', 'L');
INSERT INTO `ey_region` VALUES ('31802', '临城镇', '3', '31801', 'L');
INSERT INTO `ey_region` VALUES ('31803', '波莲镇', '3', '31801', 'B');
INSERT INTO `ey_region` VALUES ('31804', '东英镇', '3', '31801', 'D');
INSERT INTO `ey_region` VALUES ('31805', '博厚镇', '3', '31801', 'B');
INSERT INTO `ey_region` VALUES ('31806', '皇桐镇', '3', '31801', 'H');
INSERT INTO `ey_region` VALUES ('31807', '多文镇', '3', '31801', 'D');
INSERT INTO `ey_region` VALUES ('31808', '和舍镇', '3', '31801', 'H');
INSERT INTO `ey_region` VALUES ('31809', '南宝镇', '3', '31801', 'N');
INSERT INTO `ey_region` VALUES ('31810', '新盈镇', '3', '31801', 'X');
INSERT INTO `ey_region` VALUES ('31811', '调楼镇', '3', '31801', 'D');
INSERT INTO `ey_region` VALUES ('31812', '国营红华农场', '3', '31801', 'G');
INSERT INTO `ey_region` VALUES ('31813', '国营加来农场', '3', '31801', 'G');
INSERT INTO `ey_region` VALUES ('31814', '白沙县', '2', '31563', 'B');
INSERT INTO `ey_region` VALUES ('31815', '牙叉镇', '3', '31814', 'Y');
INSERT INTO `ey_region` VALUES ('31816', '七坊镇', '3', '31814', 'Q');
INSERT INTO `ey_region` VALUES ('31817', '邦溪镇', '3', '31814', 'B');
INSERT INTO `ey_region` VALUES ('31818', '打安镇', '3', '31814', 'D');
INSERT INTO `ey_region` VALUES ('31819', '细水乡', '3', '31814', 'X');
INSERT INTO `ey_region` VALUES ('31820', '元门乡', '3', '31814', 'Y');
INSERT INTO `ey_region` VALUES ('31821', '南开乡', '3', '31814', 'N');
INSERT INTO `ey_region` VALUES ('31822', '阜龙乡', '3', '31814', 'F');
INSERT INTO `ey_region` VALUES ('31823', '青松乡', '3', '31814', 'Q');
INSERT INTO `ey_region` VALUES ('31824', '金波乡', '3', '31814', 'J');
INSERT INTO `ey_region` VALUES ('31825', '荣邦乡', '3', '31814', 'R');
INSERT INTO `ey_region` VALUES ('31826', '国营金波农场', '3', '31814', 'G');
INSERT INTO `ey_region` VALUES ('31827', '国营白沙农场', '3', '31814', 'G');
INSERT INTO `ey_region` VALUES ('31828', '国营牙叉农场', '3', '31814', 'G');
INSERT INTO `ey_region` VALUES ('31829', '国营卫星农场', '3', '31814', 'G');
INSERT INTO `ey_region` VALUES ('31830', '国营龙江农场', '3', '31814', 'G');
INSERT INTO `ey_region` VALUES ('31831', '国营珠碧江农场', '3', '31814', 'G');
INSERT INTO `ey_region` VALUES ('31832', '国营芙蓉田农场', '3', '31814', 'G');
INSERT INTO `ey_region` VALUES ('31833', '国营大岭农场', '3', '31814', 'G');
INSERT INTO `ey_region` VALUES ('31834', '国营邦溪农场', '3', '31814', 'G');
INSERT INTO `ey_region` VALUES ('31835', '昌江县', '2', '31563', 'C');
INSERT INTO `ey_region` VALUES ('31836', '石碌镇', '3', '31835', 'S');
INSERT INTO `ey_region` VALUES ('31837', '叉河镇', '3', '31835', 'C');
INSERT INTO `ey_region` VALUES ('31838', '十月田镇', '3', '31835', 'S');
INSERT INTO `ey_region` VALUES ('31839', '乌烈镇', '3', '31835', 'W');
INSERT INTO `ey_region` VALUES ('31840', '昌化镇', '3', '31835', 'C');
INSERT INTO `ey_region` VALUES ('31841', '海尾镇', '3', '31835', 'H');
INSERT INTO `ey_region` VALUES ('31842', '七叉镇', '3', '31835', 'Q');
INSERT INTO `ey_region` VALUES ('31843', '王下乡', '3', '31835', 'W');
INSERT INTO `ey_region` VALUES ('31844', '国营红田农场', '3', '31835', 'G');
INSERT INTO `ey_region` VALUES ('31845', '国营红林农场', '3', '31835', 'G');
INSERT INTO `ey_region` VALUES ('31846', '国营坝王岭林场', '3', '31835', 'G');
INSERT INTO `ey_region` VALUES ('31847', '海南钢铁公司', '3', '31835', 'H');
INSERT INTO `ey_region` VALUES ('31848', '乐东县', '2', '31563', 'L');
INSERT INTO `ey_region` VALUES ('31849', '抱由镇', '3', '31848', 'B');
INSERT INTO `ey_region` VALUES ('31850', '万冲镇', '3', '31848', 'W');
INSERT INTO `ey_region` VALUES ('31851', '大安镇', '3', '31848', 'D');
INSERT INTO `ey_region` VALUES ('31852', '志仲镇', '3', '31848', 'Z');
INSERT INTO `ey_region` VALUES ('31853', '千家镇', '3', '31848', 'Q');
INSERT INTO `ey_region` VALUES ('31854', '九所镇', '3', '31848', 'J');
INSERT INTO `ey_region` VALUES ('31855', '利国镇', '3', '31848', 'L');
INSERT INTO `ey_region` VALUES ('31856', '黄流镇', '3', '31848', 'H');
INSERT INTO `ey_region` VALUES ('31857', '佛罗镇', '3', '31848', 'F');
INSERT INTO `ey_region` VALUES ('31858', '尖峰镇', '3', '31848', 'J');
INSERT INTO `ey_region` VALUES ('31859', '莺歌海镇', '3', '31848', 'Y');
INSERT INTO `ey_region` VALUES ('31860', '国营乐中农场', '3', '31848', 'G');
INSERT INTO `ey_region` VALUES ('31861', '国营山荣农场', '3', '31848', 'G');
INSERT INTO `ey_region` VALUES ('31862', '国营乐光农场', '3', '31848', 'G');
INSERT INTO `ey_region` VALUES ('31863', '国营报伦农场', '3', '31848', 'G');
INSERT INTO `ey_region` VALUES ('31864', '国营福报农场', '3', '31848', 'G');
INSERT INTO `ey_region` VALUES ('31865', '国营保国农场', '3', '31848', 'G');
INSERT INTO `ey_region` VALUES ('31866', '国营保显农场', '3', '31848', 'G');
INSERT INTO `ey_region` VALUES ('31867', '国营尖峰岭林业公司', '3', '31848', 'G');
INSERT INTO `ey_region` VALUES ('31868', '国营莺歌海盐场', '3', '31848', 'G');
INSERT INTO `ey_region` VALUES ('31869', '陵水县', '2', '31563', 'L');
INSERT INTO `ey_region` VALUES ('31870', '椰林镇', '3', '31869', 'Y');
INSERT INTO `ey_region` VALUES ('31871', '光坡镇', '3', '31869', 'G');
INSERT INTO `ey_region` VALUES ('31872', '三才镇', '3', '31869', 'S');
INSERT INTO `ey_region` VALUES ('31873', '英州镇', '3', '31869', 'Y');
INSERT INTO `ey_region` VALUES ('31874', '隆广镇', '3', '31869', 'L');
INSERT INTO `ey_region` VALUES ('31875', '文罗镇', '3', '31869', 'W');
INSERT INTO `ey_region` VALUES ('31876', '本号镇', '3', '31869', 'B');
INSERT INTO `ey_region` VALUES ('31877', '新村镇', '3', '31869', 'X');
INSERT INTO `ey_region` VALUES ('31878', '黎安镇', '3', '31869', 'L');
INSERT INTO `ey_region` VALUES ('31879', '提蒙乡', '3', '31869', 'T');
INSERT INTO `ey_region` VALUES ('31880', '群英乡', '3', '31869', 'Q');
INSERT INTO `ey_region` VALUES ('31881', '国营岭门农场', '3', '31869', 'G');
INSERT INTO `ey_region` VALUES ('31882', '国营南平农场', '3', '31869', 'G');
INSERT INTO `ey_region` VALUES ('31883', '国营吊罗山林业公司', '3', '31869', 'G');
INSERT INTO `ey_region` VALUES ('31884', '保亭县', '2', '31563', 'B');
INSERT INTO `ey_region` VALUES ('31885', '保城镇', '3', '31884', 'B');
INSERT INTO `ey_region` VALUES ('31886', '什玲镇', '3', '31884', 'S');
INSERT INTO `ey_region` VALUES ('31887', '加茂镇', '3', '31884', 'J');
INSERT INTO `ey_region` VALUES ('31888', '响水镇', '3', '31884', 'X');
INSERT INTO `ey_region` VALUES ('31889', '新政镇', '3', '31884', 'X');
INSERT INTO `ey_region` VALUES ('31890', '三道镇', '3', '31884', 'S');
INSERT INTO `ey_region` VALUES ('31891', '六弓乡', '3', '31884', 'L');
INSERT INTO `ey_region` VALUES ('31892', '南林乡', '3', '31884', 'N');
INSERT INTO `ey_region` VALUES ('31893', '毛感乡', '3', '31884', 'M');
INSERT INTO `ey_region` VALUES ('31894', '国营五指山茶场', '3', '31884', 'G');
INSERT INTO `ey_region` VALUES ('31895', '国营新星农场', '3', '31884', 'G');
INSERT INTO `ey_region` VALUES ('31896', '国营保亭热作所', '3', '31884', 'G');
INSERT INTO `ey_region` VALUES ('31897', '国营金江农场', '3', '31884', 'G');
INSERT INTO `ey_region` VALUES ('31898', '国营南茂农场', '3', '31884', 'G');
INSERT INTO `ey_region` VALUES ('31899', '国营三道农场', '3', '31884', 'G');
INSERT INTO `ey_region` VALUES ('31900', '琼中县', '2', '31563', 'Q');
INSERT INTO `ey_region` VALUES ('31901', '营根镇', '3', '31900', 'Y');
INSERT INTO `ey_region` VALUES ('31902', '湾岭镇', '3', '31900', 'W');
INSERT INTO `ey_region` VALUES ('31903', '黎母山镇', '3', '31900', 'L');
INSERT INTO `ey_region` VALUES ('31904', '和平镇', '3', '31900', 'H');
INSERT INTO `ey_region` VALUES ('31905', '长征镇', '3', '31900', 'C');
INSERT INTO `ey_region` VALUES ('31906', '红毛镇', '3', '31900', 'H');
INSERT INTO `ey_region` VALUES ('31907', '中平镇', '3', '31900', 'Z');
INSERT INTO `ey_region` VALUES ('31908', '吊罗山乡', '3', '31900', 'D');
INSERT INTO `ey_region` VALUES ('31909', '上安乡', '3', '31900', 'S');
INSERT INTO `ey_region` VALUES ('31910', '什运乡', '3', '31900', 'S');
INSERT INTO `ey_region` VALUES ('31911', '国营新进农场', '3', '31900', 'G');
INSERT INTO `ey_region` VALUES ('31912', '国营大丰农场', '3', '31900', 'G');
INSERT INTO `ey_region` VALUES ('31913', '国营阳江农场', '3', '31900', 'G');
INSERT INTO `ey_region` VALUES ('31914', '国营乌石农场', '3', '31900', 'G');
INSERT INTO `ey_region` VALUES ('31915', '国营南方农场', '3', '31900', 'G');
INSERT INTO `ey_region` VALUES ('31916', '国营岭头农场', '3', '31900', 'G');
INSERT INTO `ey_region` VALUES ('31917', '国营加钗农场', '3', '31900', 'G');
INSERT INTO `ey_region` VALUES ('31918', '国营长征农场', '3', '31900', 'G');
INSERT INTO `ey_region` VALUES ('31919', '国营乘坡农场', '3', '31900', 'G');
INSERT INTO `ey_region` VALUES ('31920', '国营太平农场', '3', '31900', 'G');
INSERT INTO `ey_region` VALUES ('31921', '国营新伟农场', '3', '31900', 'G');
INSERT INTO `ey_region` VALUES ('31922', '国营黎母山林业公司', '3', '31900', 'G');
INSERT INTO `ey_region` VALUES ('31923', '西沙群岛', '3', '31924', 'X');
INSERT INTO `ey_region` VALUES ('31924', '三沙市', '2', '31563', 'S');
INSERT INTO `ey_region` VALUES ('31925', '南沙群岛', '3', '31924', 'N');
INSERT INTO `ey_region` VALUES ('47499', '香港岛', '2', '47494', 'X');
INSERT INTO `ey_region` VALUES ('31927', '中沙群岛的岛礁及其海域', '3', '31924', 'Z');
INSERT INTO `ey_region` VALUES ('47498', '九龙', '2', '47494', 'J');
INSERT INTO `ey_region` VALUES ('31929', '重庆市', '1', '0', 'Z');
INSERT INTO `ey_region` VALUES ('31930', '市辖区', '2', '31929', 'S');
INSERT INTO `ey_region` VALUES ('31931', '万州区', '3', '31930', 'W');
INSERT INTO `ey_region` VALUES ('31984', '涪陵区', '3', '31930', 'F');
INSERT INTO `ey_region` VALUES ('32031', '渝中区', '3', '31930', 'Y');
INSERT INTO `ey_region` VALUES ('32044', '大渡口区', '3', '31930', 'D');
INSERT INTO `ey_region` VALUES ('32053', '江北区', '3', '31930', 'J');
INSERT INTO `ey_region` VALUES ('32066', '沙坪坝区', '3', '31930', 'S');
INSERT INTO `ey_region` VALUES ('32093', '九龙坡区', '3', '31930', 'J');
INSERT INTO `ey_region` VALUES ('32112', '南岸区', '3', '31930', 'N');
INSERT INTO `ey_region` VALUES ('32127', '北碚区', '3', '31930', 'B');
INSERT INTO `ey_region` VALUES ('32145', '万盛区', '3', '31930', 'W');
INSERT INTO `ey_region` VALUES ('32156', '双桥区', '3', '31930', 'S');
INSERT INTO `ey_region` VALUES ('32160', '渝北区', '3', '31930', 'Y');
INSERT INTO `ey_region` VALUES ('32191', '巴南区', '3', '31930', 'B');
INSERT INTO `ey_region` VALUES ('32213', '黔江区', '3', '31930', 'Q');
INSERT INTO `ey_region` VALUES ('32244', '长寿区', '3', '31930', 'C');
INSERT INTO `ey_region` VALUES ('32263', '江津区', '3', '31930', 'J');
INSERT INTO `ey_region` VALUES ('32291', '合川区', '3', '31930', 'H');
INSERT INTO `ey_region` VALUES ('32322', '永川区', '3', '31930', 'Y');
INSERT INTO `ey_region` VALUES ('32345', '南川区', '3', '31930', 'N');
INSERT INTO `ey_region` VALUES ('32380', '县', '2', '31929', 'X');
INSERT INTO `ey_region` VALUES ('32381', '綦江县', '3', '32380', 'Q');
INSERT INTO `ey_region` VALUES ('32401', '潼南县', '3', '32380', 'T');
INSERT INTO `ey_region` VALUES ('32424', '铜梁县', '3', '32380', 'T');
INSERT INTO `ey_region` VALUES ('32453', '大足县', '3', '32380', 'D');
INSERT INTO `ey_region` VALUES ('32478', '荣昌县', '3', '32380', 'R');
INSERT INTO `ey_region` VALUES ('32499', '璧山县', '3', '32380', 'B');
INSERT INTO `ey_region` VALUES ('32513', '梁平县', '3', '32380', 'L');
INSERT INTO `ey_region` VALUES ('32549', '城口县', '3', '32380', 'C');
INSERT INTO `ey_region` VALUES ('32574', '丰都县', '3', '32380', 'F');
INSERT INTO `ey_region` VALUES ('32606', '垫江县', '3', '32380', 'D');
INSERT INTO `ey_region` VALUES ('32632', '武隆县', '3', '32380', 'W');
INSERT INTO `ey_region` VALUES ('32659', '忠县', '3', '32380', 'Z');
INSERT INTO `ey_region` VALUES ('32688', '开县', '3', '32380', 'K');
INSERT INTO `ey_region` VALUES ('32727', '云阳县', '3', '32380', 'Y');
INSERT INTO `ey_region` VALUES ('32771', '奉节县', '3', '32380', 'F');
INSERT INTO `ey_region` VALUES ('32802', '巫山县', '3', '32380', 'W');
INSERT INTO `ey_region` VALUES ('32829', '巫溪县', '3', '32380', 'W');
INSERT INTO `ey_region` VALUES ('32861', '石柱县', '3', '32380', 'S');
INSERT INTO `ey_region` VALUES ('32894', '秀山县', '3', '32380', 'X');
INSERT INTO `ey_region` VALUES ('32927', '酉阳县', '3', '32380', 'Y');
INSERT INTO `ey_region` VALUES ('32967', '彭水县', '3', '32380', 'P');
INSERT INTO `ey_region` VALUES ('33007', '四川省', '1', '0', 'S');
INSERT INTO `ey_region` VALUES ('33008', '成都市', '2', '33007', 'C');
INSERT INTO `ey_region` VALUES ('33009', '市辖区', '3', '33008', 'S');
INSERT INTO `ey_region` VALUES ('33010', '锦江区', '3', '33008', 'J');
INSERT INTO `ey_region` VALUES ('33027', '青羊区', '3', '33008', 'Q');
INSERT INTO `ey_region` VALUES ('33042', '金牛区', '3', '33008', 'J');
INSERT INTO `ey_region` VALUES ('33058', '武侯区', '3', '33008', 'W');
INSERT INTO `ey_region` VALUES ('33076', '成华区', '3', '33008', 'C');
INSERT INTO `ey_region` VALUES ('33091', '龙泉驿区', '3', '33008', 'L');
INSERT INTO `ey_region` VALUES ('33104', '青白江区', '3', '33008', 'Q');
INSERT INTO `ey_region` VALUES ('33116', '新都区', '3', '33008', 'X');
INSERT INTO `ey_region` VALUES ('33130', '温江区', '3', '33008', 'W');
INSERT INTO `ey_region` VALUES ('33141', '金堂县', '3', '33008', 'J');
INSERT INTO `ey_region` VALUES ('33163', '双流县', '3', '33008', 'S');
INSERT INTO `ey_region` VALUES ('33189', '郫县', '3', '33008', 'P');
INSERT INTO `ey_region` VALUES ('33205', '大邑县', '3', '33008', 'D');
INSERT INTO `ey_region` VALUES ('33226', '蒲江县', '3', '33008', 'P');
INSERT INTO `ey_region` VALUES ('33239', '新津县', '3', '33008', 'X');
INSERT INTO `ey_region` VALUES ('33252', '都江堰市', '3', '33008', 'D');
INSERT INTO `ey_region` VALUES ('33272', '彭州市', '3', '33008', 'P');
INSERT INTO `ey_region` VALUES ('33293', '邛崃市', '3', '33008', 'Q');
INSERT INTO `ey_region` VALUES ('33318', '崇州市', '3', '33008', 'C');
INSERT INTO `ey_region` VALUES ('33344', '自贡市', '2', '33007', 'Z');
INSERT INTO `ey_region` VALUES ('33345', '市辖区', '3', '33344', 'S');
INSERT INTO `ey_region` VALUES ('33346', '自流井区', '3', '33344', 'Z');
INSERT INTO `ey_region` VALUES ('33360', '贡井区', '3', '33344', 'G');
INSERT INTO `ey_region` VALUES ('33374', '大安区', '3', '33344', 'D');
INSERT INTO `ey_region` VALUES ('33391', '沿滩区', '3', '33344', 'Y');
INSERT INTO `ey_region` VALUES ('33405', '荣县', '3', '33344', 'R');
INSERT INTO `ey_region` VALUES ('33433', '富顺县', '3', '33344', 'F');
INSERT INTO `ey_region` VALUES ('33460', '攀枝花市', '2', '33007', 'P');
INSERT INTO `ey_region` VALUES ('33461', '市辖区', '3', '33460', 'S');
INSERT INTO `ey_region` VALUES ('33462', '攀枝花东区', '3', '33460', 'P');
INSERT INTO `ey_region` VALUES ('33473', '西区', '3', '33460', 'X');
INSERT INTO `ey_region` VALUES ('33481', '仁和区', '3', '33460', 'R');
INSERT INTO `ey_region` VALUES ('33497', '米易县', '3', '33460', 'M');
INSERT INTO `ey_region` VALUES ('33511', '盐边县', '3', '33460', 'Y');
INSERT INTO `ey_region` VALUES ('33528', '泸州市', '2', '33007', 'L');
INSERT INTO `ey_region` VALUES ('33529', '市辖区', '3', '33528', 'S');
INSERT INTO `ey_region` VALUES ('33530', '江阳区', '3', '33528', 'J');
INSERT INTO `ey_region` VALUES ('33548', '纳溪区', '3', '33528', 'N');
INSERT INTO `ey_region` VALUES ('33563', '龙马潭区', '3', '33528', 'L');
INSERT INTO `ey_region` VALUES ('33577', '泸县', '3', '33528', 'L');
INSERT INTO `ey_region` VALUES ('33597', '合江县', '3', '33528', 'H');
INSERT INTO `ey_region` VALUES ('33625', '叙永县', '3', '33528', 'X');
INSERT INTO `ey_region` VALUES ('33654', '古蔺县', '3', '33528', 'G');
INSERT INTO `ey_region` VALUES ('33681', '德阳市', '2', '33007', 'D');
INSERT INTO `ey_region` VALUES ('33682', '市辖区', '3', '33681', 'S');
INSERT INTO `ey_region` VALUES ('33683', '旌阳区', '3', '33681', 'J');
INSERT INTO `ey_region` VALUES ('33701', '中江县', '3', '33681', 'Z');
INSERT INTO `ey_region` VALUES ('33747', '罗江县', '3', '33681', 'L');
INSERT INTO `ey_region` VALUES ('33758', '广汉市', '3', '33681', 'G');
INSERT INTO `ey_region` VALUES ('33778', '什邡市', '3', '33681', 'S');
INSERT INTO `ey_region` VALUES ('33795', '绵竹市', '3', '33681', 'M');
INSERT INTO `ey_region` VALUES ('33817', '绵阳市', '2', '33007', 'M');
INSERT INTO `ey_region` VALUES ('33818', '市辖区', '3', '33817', 'S');
INSERT INTO `ey_region` VALUES ('33819', '涪城区', '3', '33817', 'F');
INSERT INTO `ey_region` VALUES ('33844', '游仙区', '3', '33817', 'Y');
INSERT INTO `ey_region` VALUES ('33873', '三台县', '3', '33817', 'S');
INSERT INTO `ey_region` VALUES ('33937', '盐亭县', '3', '33817', 'Y');
INSERT INTO `ey_region` VALUES ('33974', '安县', '3', '33817', 'A');
INSERT INTO `ey_region` VALUES ('33995', '梓潼县', '3', '33817', 'Z');
INSERT INTO `ey_region` VALUES ('34028', '北川县', '3', '33817', 'B');
INSERT INTO `ey_region` VALUES ('34049', '平武县', '3', '33817', 'P');
INSERT INTO `ey_region` VALUES ('34075', '江油市', '3', '33817', 'J');
INSERT INTO `ey_region` VALUES ('34120', '广元市', '2', '33007', 'G');
INSERT INTO `ey_region` VALUES ('34121', '市辖区', '3', '34120', 'S');
INSERT INTO `ey_region` VALUES ('34122', '市中区', '3', '34120', 'S');
INSERT INTO `ey_region` VALUES ('34143', '元坝区', '3', '34120', 'Y');
INSERT INTO `ey_region` VALUES ('34173', '朝天区', '3', '34120', 'C');
INSERT INTO `ey_region` VALUES ('34199', '旺苍县', '3', '34120', 'W');
INSERT INTO `ey_region` VALUES ('34238', '青川县', '3', '34120', 'Q');
INSERT INTO `ey_region` VALUES ('34276', '剑阁县', '3', '34120', 'J');
INSERT INTO `ey_region` VALUES ('34334', '苍溪县', '3', '34120', 'C');
INSERT INTO `ey_region` VALUES ('34376', '遂宁市', '2', '33007', 'S');
INSERT INTO `ey_region` VALUES ('34377', '市辖区', '3', '34376', 'S');
INSERT INTO `ey_region` VALUES ('34378', '船山区', '3', '34376', 'C');
INSERT INTO `ey_region` VALUES ('34404', '安居区', '3', '34376', 'A');
INSERT INTO `ey_region` VALUES ('34426', '蓬溪县', '3', '34376', 'P');
INSERT INTO `ey_region` VALUES ('34458', '射洪县', '3', '34376', 'S');
INSERT INTO `ey_region` VALUES ('34489', '大英县', '3', '34376', 'D');
INSERT INTO `ey_region` VALUES ('34501', '内江市', '2', '33007', 'N');
INSERT INTO `ey_region` VALUES ('34502', '市辖区', '3', '34501', 'S');
INSERT INTO `ey_region` VALUES ('34503', '市中区', '3', '34501', 'S');
INSERT INTO `ey_region` VALUES ('34524', '东兴区', '3', '34501', 'D');
INSERT INTO `ey_region` VALUES ('34554', '威远县', '3', '34501', 'W');
INSERT INTO `ey_region` VALUES ('34575', '资中县', '3', '34501', 'Z');
INSERT INTO `ey_region` VALUES ('34609', '隆昌县', '3', '34501', 'L');
INSERT INTO `ey_region` VALUES ('34628', '乐山市', '2', '33007', 'L');
INSERT INTO `ey_region` VALUES ('34629', '市辖区', '3', '34628', 'S');
INSERT INTO `ey_region` VALUES ('34630', '市中区', '3', '34628', 'S');
INSERT INTO `ey_region` VALUES ('34661', '沙湾区', '3', '34628', 'S');
INSERT INTO `ey_region` VALUES ('34676', '五通桥区', '3', '34628', 'W');
INSERT INTO `ey_region` VALUES ('34689', '金口河区', '3', '34628', 'J');
INSERT INTO `ey_region` VALUES ('34696', '犍为县', '3', '34628', 'Q');
INSERT INTO `ey_region` VALUES ('34727', '井研县', '3', '34628', 'J');
INSERT INTO `ey_region` VALUES ('34755', '夹江县', '3', '34628', 'J');
INSERT INTO `ey_region` VALUES ('34778', '沐川县', '3', '34628', 'M');
INSERT INTO `ey_region` VALUES ('34799', '峨边县', '3', '34628', 'E');
INSERT INTO `ey_region` VALUES ('34819', '马边县', '3', '34628', 'M');
INSERT INTO `ey_region` VALUES ('34840', '峨眉山市', '3', '34628', 'E');
INSERT INTO `ey_region` VALUES ('34859', '南充市', '2', '33007', 'N');
INSERT INTO `ey_region` VALUES ('34860', '市辖区', '3', '34859', 'S');
INSERT INTO `ey_region` VALUES ('34861', '顺庆区', '3', '34859', 'S');
INSERT INTO `ey_region` VALUES ('34890', '高坪区', '3', '34859', 'G');
INSERT INTO `ey_region` VALUES ('34923', '嘉陵区', '3', '34859', 'J');
INSERT INTO `ey_region` VALUES ('34967', '南部县', '3', '34859', 'N');
INSERT INTO `ey_region` VALUES ('35040', '营山县', '3', '34859', 'Y');
INSERT INTO `ey_region` VALUES ('35094', '蓬安县', '3', '34859', 'P');
INSERT INTO `ey_region` VALUES ('35134', '仪陇县', '3', '34859', 'Y');
INSERT INTO `ey_region` VALUES ('35193', '西充县', '3', '34859', 'X');
INSERT INTO `ey_region` VALUES ('35238', '阆中市', '3', '34859', 'L');
INSERT INTO `ey_region` VALUES ('35288', '眉山市', '2', '33007', 'M');
INSERT INTO `ey_region` VALUES ('35289', '市辖区', '3', '35288', 'S');
INSERT INTO `ey_region` VALUES ('35290', '东坡区', '3', '35288', 'D');
INSERT INTO `ey_region` VALUES ('35317', '仁寿县', '3', '35288', 'R');
INSERT INTO `ey_region` VALUES ('35378', '彭山县', '3', '35288', 'P');
INSERT INTO `ey_region` VALUES ('35392', '洪雅县', '3', '35288', 'H');
INSERT INTO `ey_region` VALUES ('35408', '丹棱县', '3', '35288', 'D');
INSERT INTO `ey_region` VALUES ('35416', '青神县', '3', '35288', 'Q');
INSERT INTO `ey_region` VALUES ('35427', '宜宾市', '2', '33007', 'Y');
INSERT INTO `ey_region` VALUES ('35428', '市辖区', '3', '35427', 'S');
INSERT INTO `ey_region` VALUES ('35429', '翠屏区', '3', '35427', 'C');
INSERT INTO `ey_region` VALUES ('35454', '宜宾县', '3', '35427', 'Y');
INSERT INTO `ey_region` VALUES ('35481', '南溪县', '3', '35427', 'N');
INSERT INTO `ey_region` VALUES ('35497', '江安县', '3', '35427', 'J');
INSERT INTO `ey_region` VALUES ('35516', '长宁县', '3', '35427', 'C');
INSERT INTO `ey_region` VALUES ('35535', '高县', '3', '35427', 'G');
INSERT INTO `ey_region` VALUES ('35555', '珙县', '3', '35427', 'G');
INSERT INTO `ey_region` VALUES ('35573', '筠连县', '3', '35427', 'J');
INSERT INTO `ey_region` VALUES ('35592', '兴文县', '3', '35427', 'X');
INSERT INTO `ey_region` VALUES ('35608', '屏山县', '3', '35427', 'P');
INSERT INTO `ey_region` VALUES ('35625', '广安市', '2', '33007', 'G');
INSERT INTO `ey_region` VALUES ('35626', '市辖区', '3', '35625', 'S');
INSERT INTO `ey_region` VALUES ('35627', '广安区', '3', '35625', 'G');
INSERT INTO `ey_region` VALUES ('35677', '岳池县', '3', '35625', 'Y');
INSERT INTO `ey_region` VALUES ('35721', '武胜县', '3', '35625', 'W');
INSERT INTO `ey_region` VALUES ('35753', '邻水县', '3', '35625', 'L');
INSERT INTO `ey_region` VALUES ('35799', '华蓥市', '3', '35625', 'H');
INSERT INTO `ey_region` VALUES ('35813', '达州市', '2', '33007', 'D');
INSERT INTO `ey_region` VALUES ('35814', '市辖区', '3', '35813', 'S');
INSERT INTO `ey_region` VALUES ('35815', '通川区', '3', '35813', 'T');
INSERT INTO `ey_region` VALUES ('35829', '达县', '3', '35813', 'D');
INSERT INTO `ey_region` VALUES ('35894', '宣汉县', '3', '35813', 'X');
INSERT INTO `ey_region` VALUES ('35949', '开江县', '3', '35813', 'K');
INSERT INTO `ey_region` VALUES ('35970', '大竹县', '3', '35813', 'D');
INSERT INTO `ey_region` VALUES ('36021', '渠县', '3', '35813', 'Q');
INSERT INTO `ey_region` VALUES ('36082', '万源市', '3', '35813', 'W');
INSERT INTO `ey_region` VALUES ('36136', '雅安市', '2', '33007', 'Y');
INSERT INTO `ey_region` VALUES ('36137', '市辖区', '3', '36136', 'S');
INSERT INTO `ey_region` VALUES ('36138', '雨城区', '3', '36136', 'Y');
INSERT INTO `ey_region` VALUES ('36161', '名山县', '3', '36136', 'M');
INSERT INTO `ey_region` VALUES ('36182', '荥经县', '3', '36136', 'Y');
INSERT INTO `ey_region` VALUES ('36204', '汉源县', '3', '36136', 'H');
INSERT INTO `ey_region` VALUES ('36245', '石棉县', '3', '36136', 'S');
INSERT INTO `ey_region` VALUES ('36263', '天全县', '3', '36136', 'T');
INSERT INTO `ey_region` VALUES ('36279', '芦山县', '3', '36136', 'L');
INSERT INTO `ey_region` VALUES ('36289', '宝兴县', '3', '36136', 'B');
INSERT INTO `ey_region` VALUES ('36299', '巴中市', '2', '33007', 'B');
INSERT INTO `ey_region` VALUES ('36300', '市辖区', '3', '36299', 'S');
INSERT INTO `ey_region` VALUES ('36301', '巴州区', '3', '36299', 'B');
INSERT INTO `ey_region` VALUES ('36354', '通江县', '3', '36299', 'T');
INSERT INTO `ey_region` VALUES ('36404', '南江县', '3', '36299', 'N');
INSERT INTO `ey_region` VALUES ('36453', '平昌县', '3', '36299', 'P');
INSERT INTO `ey_region` VALUES ('36497', '资阳市', '2', '33007', 'Z');
INSERT INTO `ey_region` VALUES ('36498', '市辖区', '3', '36497', 'S');
INSERT INTO `ey_region` VALUES ('36499', '雁江区', '3', '36497', 'Y');
INSERT INTO `ey_region` VALUES ('36527', '安岳县', '3', '36497', 'A');
INSERT INTO `ey_region` VALUES ('36597', '乐至县', '3', '36497', 'L');
INSERT INTO `ey_region` VALUES ('36623', '简阳市', '3', '36497', 'J');
INSERT INTO `ey_region` VALUES ('36679', '阿坝州', '2', '33007', 'A');
INSERT INTO `ey_region` VALUES ('36680', '汶川县', '3', '36679', 'W');
INSERT INTO `ey_region` VALUES ('36694', '理县', '3', '36679', 'L');
INSERT INTO `ey_region` VALUES ('36708', '茂县', '3', '36679', 'M');
INSERT INTO `ey_region` VALUES ('36731', '松潘县', '3', '36679', 'S');
INSERT INTO `ey_region` VALUES ('36759', '九寨沟县', '3', '36679', 'J');
INSERT INTO `ey_region` VALUES ('36778', '金川县', '3', '36679', 'J');
INSERT INTO `ey_region` VALUES ('36802', '小金县', '3', '36679', 'X');
INSERT INTO `ey_region` VALUES ('36824', '黑水县', '3', '36679', 'H');
INSERT INTO `ey_region` VALUES ('36842', '马尔康县', '3', '36679', 'M');
INSERT INTO `ey_region` VALUES ('36858', '壤塘县', '3', '36679', 'R');
INSERT INTO `ey_region` VALUES ('36871', '阿坝县', '3', '36679', 'A');
INSERT INTO `ey_region` VALUES ('36893', '若尔盖县', '3', '36679', 'R');
INSERT INTO `ey_region` VALUES ('36914', '红原县', '3', '36679', 'H');
INSERT INTO `ey_region` VALUES ('36926', '甘孜州', '2', '33007', 'G');
INSERT INTO `ey_region` VALUES ('36927', '康定县', '3', '36926', 'K');
INSERT INTO `ey_region` VALUES ('36949', '泸定县', '3', '36926', 'L');
INSERT INTO `ey_region` VALUES ('36962', '丹巴县', '3', '36926', 'D');
INSERT INTO `ey_region` VALUES ('36978', '九龙县', '3', '36926', 'J');
INSERT INTO `ey_region` VALUES ('36997', '雅江县', '3', '36926', 'Y');
INSERT INTO `ey_region` VALUES ('37015', '道孚县', '3', '36926', 'D');
INSERT INTO `ey_region` VALUES ('37038', '炉霍县', '3', '36926', 'L');
INSERT INTO `ey_region` VALUES ('37055', '甘孜县', '3', '36926', 'G');
INSERT INTO `ey_region` VALUES ('37078', '新龙县', '3', '36926', 'X');
INSERT INTO `ey_region` VALUES ('37098', '德格县', '3', '36926', 'D');
INSERT INTO `ey_region` VALUES ('37125', '白玉县', '3', '36926', 'B');
INSERT INTO `ey_region` VALUES ('37143', '石渠县', '3', '36926', 'S');
INSERT INTO `ey_region` VALUES ('37166', '色达县', '3', '36926', 'S');
INSERT INTO `ey_region` VALUES ('37184', '理塘县', '3', '36926', 'L');
INSERT INTO `ey_region` VALUES ('37209', '巴塘县', '3', '36926', 'B');
INSERT INTO `ey_region` VALUES ('37229', '乡城县', '3', '36926', 'X');
INSERT INTO `ey_region` VALUES ('37242', '稻城县', '3', '36926', 'D');
INSERT INTO `ey_region` VALUES ('37257', '得荣县', '3', '36926', 'D');
INSERT INTO `ey_region` VALUES ('37270', '凉山州', '2', '33007', 'L');
INSERT INTO `ey_region` VALUES ('37271', '西昌市', '3', '37270', 'X');
INSERT INTO `ey_region` VALUES ('37315', '木里县', '3', '37270', 'M');
INSERT INTO `ey_region` VALUES ('37345', '盐源县', '3', '37270', 'Y');
INSERT INTO `ey_region` VALUES ('37380', '德昌', '3', '37270', 'D');
INSERT INTO `ey_region` VALUES ('37404', '会理县', '3', '37270', 'H');
INSERT INTO `ey_region` VALUES ('37455', '会东县', '3', '37270', 'H');
INSERT INTO `ey_region` VALUES ('37509', '宁南县', '3', '37270', 'N');
INSERT INTO `ey_region` VALUES ('37535', '普格县', '3', '37270', 'P');
INSERT INTO `ey_region` VALUES ('37570', '布拖县', '3', '37270', 'B');
INSERT INTO `ey_region` VALUES ('37601', '金阳县', '3', '37270', 'J');
INSERT INTO `ey_region` VALUES ('37636', '昭觉县', '3', '37270', 'Z');
INSERT INTO `ey_region` VALUES ('37684', '喜德县', '3', '37270', 'X');
INSERT INTO `ey_region` VALUES ('37709', '冕宁县', '3', '37270', 'M');
INSERT INTO `ey_region` VALUES ('37748', '越西县', '3', '37270', 'Y');
INSERT INTO `ey_region` VALUES ('37790', '甘洛县', '3', '37270', 'G');
INSERT INTO `ey_region` VALUES ('37819', '美姑县', '3', '37270', 'M');
INSERT INTO `ey_region` VALUES ('37856', '雷波县', '3', '37270', 'L');
INSERT INTO `ey_region` VALUES ('37906', '贵州省', '1', '0', 'G');
INSERT INTO `ey_region` VALUES ('37907', '贵阳市', '2', '37906', 'G');
INSERT INTO `ey_region` VALUES ('37908', '市辖区', '3', '37907', 'S');
INSERT INTO `ey_region` VALUES ('37909', '南明区', '3', '37907', 'N');
INSERT INTO `ey_region` VALUES ('37927', '云岩区', '3', '37907', 'Y');
INSERT INTO `ey_region` VALUES ('37944', '花溪区', '3', '37907', 'H');
INSERT INTO `ey_region` VALUES ('37961', '乌当区', '3', '37907', 'W');
INSERT INTO `ey_region` VALUES ('37977', '白云区', '3', '37907', 'B');
INSERT INTO `ey_region` VALUES ('37987', '小河区', '3', '37907', 'X');
INSERT INTO `ey_region` VALUES ('37991', '开阳县', '3', '37907', 'K');
INSERT INTO `ey_region` VALUES ('38008', '息烽县', '3', '37907', 'X');
INSERT INTO `ey_region` VALUES ('38019', '修文县', '3', '37907', 'X');
INSERT INTO `ey_region` VALUES ('38030', '清镇市', '3', '37907', 'Q');
INSERT INTO `ey_region` VALUES ('38042', '六盘水市', '2', '37906', 'L');
INSERT INTO `ey_region` VALUES ('38043', '钟山区', '3', '38042', 'Z');
INSERT INTO `ey_region` VALUES ('38053', '六枝特区', '3', '38042', 'L');
INSERT INTO `ey_region` VALUES ('38073', '水城县', '3', '38042', 'S');
INSERT INTO `ey_region` VALUES ('38107', '盘县', '3', '38042', 'P');
INSERT INTO `ey_region` VALUES ('38145', '遵义市', '2', '37906', 'Z');
INSERT INTO `ey_region` VALUES ('38146', '市辖区', '3', '38145', 'S');
INSERT INTO `ey_region` VALUES ('38147', '红花岗区', '3', '38145', 'H');
INSERT INTO `ey_region` VALUES ('38164', '汇川区', '3', '38145', 'H');
INSERT INTO `ey_region` VALUES ('38174', '遵义县', '3', '38145', 'Z');
INSERT INTO `ey_region` VALUES ('38206', '桐梓县', '3', '38145', 'T');
INSERT INTO `ey_region` VALUES ('38231', '绥阳县', '3', '38145', 'S');
INSERT INTO `ey_region` VALUES ('38247', '正安县', '3', '38145', 'Z');
INSERT INTO `ey_region` VALUES ('38267', '道真县', '3', '38145', 'D');
INSERT INTO `ey_region` VALUES ('38282', '务川县', '3', '38145', 'W');
INSERT INTO `ey_region` VALUES ('38298', '凤冈县', '3', '38145', 'F');
INSERT INTO `ey_region` VALUES ('38313', '湄潭县', '3', '38145', 'M');
INSERT INTO `ey_region` VALUES ('38329', '余庆县', '3', '38145', 'Y');
INSERT INTO `ey_region` VALUES ('38340', '习水县', '3', '38145', 'X');
INSERT INTO `ey_region` VALUES ('38364', '赤水市', '3', '38145', 'C');
INSERT INTO `ey_region` VALUES ('38382', '仁怀市', '3', '38145', 'R');
INSERT INTO `ey_region` VALUES ('38402', '安顺市', '2', '37906', 'A');
INSERT INTO `ey_region` VALUES ('38403', '市辖区', '3', '38402', 'S');
INSERT INTO `ey_region` VALUES ('38404', '西秀区', '3', '38402', 'X');
INSERT INTO `ey_region` VALUES ('38429', '平坝县', '3', '38402', 'P');
INSERT INTO `ey_region` VALUES ('38440', '普定县', '3', '38402', 'P');
INSERT INTO `ey_region` VALUES ('38452', '镇宁县', '3', '38402', 'Z');
INSERT INTO `ey_region` VALUES ('38469', '关岭县', '3', '38402', 'G');
INSERT INTO `ey_region` VALUES ('38484', '紫云县', '3', '38402', 'Z');
INSERT INTO `ey_region` VALUES ('38497', '铜仁地区', '2', '37906', 'T');
INSERT INTO `ey_region` VALUES ('38498', '铜仁市', '3', '38497', 'T');
INSERT INTO `ey_region` VALUES ('38516', '江口县', '3', '38497', 'J');
INSERT INTO `ey_region` VALUES ('38526', '玉屏县', '3', '38497', 'Y');
INSERT INTO `ey_region` VALUES ('38533', '石阡县', '3', '38497', 'S');
INSERT INTO `ey_region` VALUES ('38552', '思南县　', '3', '38497', 'S');
INSERT INTO `ey_region` VALUES ('38580', '印江县', '3', '38497', 'Y');
INSERT INTO `ey_region` VALUES ('38598', '德江县', '3', '38497', 'D');
INSERT INTO `ey_region` VALUES ('38619', '沿河县', '3', '38497', 'Y');
INSERT INTO `ey_region` VALUES ('38642', '松桃县', '3', '38497', 'S');
INSERT INTO `ey_region` VALUES ('38671', '万山特区', '3', '38497', 'W');
INSERT INTO `ey_region` VALUES ('38677', '黔西南州', '2', '37906', 'Q');
INSERT INTO `ey_region` VALUES ('38678', '兴义市', '3', '38677', 'X');
INSERT INTO `ey_region` VALUES ('38705', '兴仁县', '3', '38677', 'X');
INSERT INTO `ey_region` VALUES ('38722', '普安县', '3', '38677', 'P');
INSERT INTO `ey_region` VALUES ('38737', '晴隆县', '3', '38677', 'Q');
INSERT INTO `ey_region` VALUES ('38752', '贞丰县', '3', '38677', 'Z');
INSERT INTO `ey_region` VALUES ('38766', '望谟县', '3', '38677', 'W');
INSERT INTO `ey_region` VALUES ('38784', '册亨县', '3', '38677', 'C');
INSERT INTO `ey_region` VALUES ('38799', '安龙县', '3', '38677', 'A');
INSERT INTO `ey_region` VALUES ('38816', '毕节地区', '2', '37906', 'B');
INSERT INTO `ey_region` VALUES ('38817', '毕节市', '3', '38816', 'B');
INSERT INTO `ey_region` VALUES ('38859', '大方县', '3', '38816', 'D');
INSERT INTO `ey_region` VALUES ('38896', '黔西县', '3', '38816', 'Q');
INSERT INTO `ey_region` VALUES ('38925', '金沙县', '3', '38816', 'J');
INSERT INTO `ey_region` VALUES ('38952', '织金县', '3', '38816', 'Z');
INSERT INTO `ey_region` VALUES ('38985', '纳雍县', '3', '38816', 'N');
INSERT INTO `ey_region` VALUES ('39011', '威宁县', '3', '38816', 'W');
INSERT INTO `ey_region` VALUES ('39047', '赫章县', '3', '38816', 'H');
INSERT INTO `ey_region` VALUES ('39075', '黔东南州', '2', '37906', 'Q');
INSERT INTO `ey_region` VALUES ('39076', '凯里市', '3', '39075', 'K');
INSERT INTO `ey_region` VALUES ('39092', '黄平县', '3', '39075', 'H');
INSERT INTO `ey_region` VALUES ('39107', '施秉县', '3', '39075', 'S');
INSERT INTO `ey_region` VALUES ('39116', '三穗县', '3', '39075', 'S');
INSERT INTO `ey_region` VALUES ('39126', '镇远县', '3', '39075', 'Z');
INSERT INTO `ey_region` VALUES ('39139', '岑巩县', '3', '39075', 'C');
INSERT INTO `ey_region` VALUES ('39151', '天柱县', '3', '39075', 'T');
INSERT INTO `ey_region` VALUES ('39168', '锦屏县', '3', '39075', 'J');
INSERT INTO `ey_region` VALUES ('39184', '剑河县', '3', '39075', 'J');
INSERT INTO `ey_region` VALUES ('39197', '台江县', '3', '39075', 'T');
INSERT INTO `ey_region` VALUES ('39206', '黎平县', '3', '39075', 'L');
INSERT INTO `ey_region` VALUES ('39232', '榕江县', '3', '39075', 'R');
INSERT INTO `ey_region` VALUES ('39252', '从江县', '3', '39075', 'C');
INSERT INTO `ey_region` VALUES ('39274', '雷山县', '3', '39075', 'L');
INSERT INTO `ey_region` VALUES ('39284', '麻江县', '3', '39075', 'M');
INSERT INTO `ey_region` VALUES ('39294', '丹寨县', '3', '39075', 'D');
INSERT INTO `ey_region` VALUES ('39302', '黔南州', '2', '37906', 'Q');
INSERT INTO `ey_region` VALUES ('39303', '都匀市', '3', '39302', 'D');
INSERT INTO `ey_region` VALUES ('39327', '福泉市', '3', '39302', 'F');
INSERT INTO `ey_region` VALUES ('39345', '荔波县', '3', '39302', 'L');
INSERT INTO `ey_region` VALUES ('39363', '贵定县', '3', '39302', 'G');
INSERT INTO `ey_region` VALUES ('39384', '瓮安县', '3', '39302', 'W');
INSERT INTO `ey_region` VALUES ('39408', '独山县', '3', '39302', 'D');
INSERT INTO `ey_region` VALUES ('39427', '平塘县', '3', '39302', 'P');
INSERT INTO `ey_region` VALUES ('39447', '罗甸县', '3', '39302', 'L');
INSERT INTO `ey_region` VALUES ('39474', '长顺县', '3', '39302', 'C');
INSERT INTO `ey_region` VALUES ('39493', '龙里县', '3', '39302', 'L');
INSERT INTO `ey_region` VALUES ('39508', '惠水县', '3', '39302', 'H');
INSERT INTO `ey_region` VALUES ('39534', '三都县', '3', '39302', 'S');
INSERT INTO `ey_region` VALUES ('39556', '云南省', '1', '0', 'Y');
INSERT INTO `ey_region` VALUES ('39557', '昆明市', '2', '39556', 'K');
INSERT INTO `ey_region` VALUES ('39558', '市辖区', '3', '39557', 'S');
INSERT INTO `ey_region` VALUES ('39559', '五华区', '3', '39557', 'W');
INSERT INTO `ey_region` VALUES ('39571', '盘龙区', '3', '39557', 'P');
INSERT INTO `ey_region` VALUES ('39582', '官渡区', '3', '39557', 'G');
INSERT INTO `ey_region` VALUES ('39594', '西山区', '3', '39557', 'X');
INSERT INTO `ey_region` VALUES ('39605', '东川区', '3', '39557', 'D');
INSERT INTO `ey_region` VALUES ('39614', '呈贡县', '3', '39557', 'C');
INSERT INTO `ey_region` VALUES ('39622', '晋宁县', '3', '39557', 'J');
INSERT INTO `ey_region` VALUES ('39632', '富民县', '3', '39557', 'F');
INSERT INTO `ey_region` VALUES ('39640', '宜良县', '3', '39557', 'Y');
INSERT INTO `ey_region` VALUES ('39650', '石林县', '3', '39557', 'S');
INSERT INTO `ey_region` VALUES ('39659', '嵩明县', '3', '39557', 'S');
INSERT INTO `ey_region` VALUES ('39667', '禄劝县', '3', '39557', 'L');
INSERT INTO `ey_region` VALUES ('39684', '寻甸县', '3', '39557', 'X');
INSERT INTO `ey_region` VALUES ('39701', '安宁市', '3', '39557', 'A');
INSERT INTO `ey_region` VALUES ('39710', '曲靖市', '2', '39556', 'Q');
INSERT INTO `ey_region` VALUES ('39711', '市辖区', '3', '39710', 'S');
INSERT INTO `ey_region` VALUES ('39712', '麒麟区', '3', '39710', 'Q');
INSERT INTO `ey_region` VALUES ('39724', '马龙县', '3', '39710', 'M');
INSERT INTO `ey_region` VALUES ('39733', '陆良县', '3', '39710', 'L');
INSERT INTO `ey_region` VALUES ('39744', '师宗县', '3', '39710', 'S');
INSERT INTO `ey_region` VALUES ('39753', '罗平县', '3', '39710', 'L');
INSERT INTO `ey_region` VALUES ('39766', '富源县', '3', '39710', 'F');
INSERT INTO `ey_region` VALUES ('39778', '会泽县', '3', '39710', 'H');
INSERT INTO `ey_region` VALUES ('39800', '沾益县', '3', '39710', 'Z');
INSERT INTO `ey_region` VALUES ('39809', '宣威市', '3', '39710', 'X');
INSERT INTO `ey_region` VALUES ('39836', '玉溪市', '2', '39556', 'Y');
INSERT INTO `ey_region` VALUES ('39837', '市辖区', '3', '39836', 'S');
INSERT INTO `ey_region` VALUES ('39838', '红塔区', '3', '39836', 'H');
INSERT INTO `ey_region` VALUES ('39850', '江川县', '3', '39836', 'J');
INSERT INTO `ey_region` VALUES ('39858', '澄江县', '3', '39836', 'C');
INSERT INTO `ey_region` VALUES ('39865', '通海县', '3', '39836', 'T');
INSERT INTO `ey_region` VALUES ('39875', '华宁县', '3', '39836', 'H');
INSERT INTO `ey_region` VALUES ('39881', '易门县', '3', '39836', 'Y');
INSERT INTO `ey_region` VALUES ('39889', '峨山县', '3', '39836', 'E');
INSERT INTO `ey_region` VALUES ('39899', '新平县', '3', '39836', 'X');
INSERT INTO `ey_region` VALUES ('39912', '元江县', '3', '39836', 'Y');
INSERT INTO `ey_region` VALUES ('39923', '保山市', '2', '39556', 'B');
INSERT INTO `ey_region` VALUES ('39924', '市辖区', '3', '39923', 'S');
INSERT INTO `ey_region` VALUES ('39925', '隆阳区', '3', '39923', 'L');
INSERT INTO `ey_region` VALUES ('39946', '施甸县', '3', '39923', 'S');
INSERT INTO `ey_region` VALUES ('39960', '腾冲县', '3', '39923', 'T');
INSERT INTO `ey_region` VALUES ('39979', '龙陵县', '3', '39923', 'L');
INSERT INTO `ey_region` VALUES ('39990', '昌宁县', '3', '39923', 'C');
INSERT INTO `ey_region` VALUES ('40004', '昭通市', '2', '39556', 'Z');
INSERT INTO `ey_region` VALUES ('40005', '市辖区', '3', '40004', 'S');
INSERT INTO `ey_region` VALUES ('40006', '昭阳区', '3', '40004', 'Z');
INSERT INTO `ey_region` VALUES ('40027', '鲁甸县', '3', '40004', 'L');
INSERT INTO `ey_region` VALUES ('40040', '巧家县', '3', '40004', 'Q');
INSERT INTO `ey_region` VALUES ('40057', '盐津县', '3', '40004', 'Y');
INSERT INTO `ey_region` VALUES ('40068', '大关县', '3', '40004', 'D');
INSERT INTO `ey_region` VALUES ('40078', '永善县', '3', '40004', 'Y');
INSERT INTO `ey_region` VALUES ('40094', '绥江县', '3', '40004', 'S');
INSERT INTO `ey_region` VALUES ('40100', '镇雄县', '3', '40004', 'Z');
INSERT INTO `ey_region` VALUES ('40129', '彝良县', '3', '40004', 'Y');
INSERT INTO `ey_region` VALUES ('40145', '威信县', '3', '40004', 'W');
INSERT INTO `ey_region` VALUES ('40156', '水富县', '3', '40004', 'S');
INSERT INTO `ey_region` VALUES ('40160', '丽江市', '2', '39556', 'L');
INSERT INTO `ey_region` VALUES ('40161', '市辖区', '3', '40160', 'S');
INSERT INTO `ey_region` VALUES ('40162', '古城区', '3', '40160', 'G');
INSERT INTO `ey_region` VALUES ('40172', '玉龙县', '3', '40160', 'Y');
INSERT INTO `ey_region` VALUES ('40189', '永胜县', '3', '40160', 'Y');
INSERT INTO `ey_region` VALUES ('40205', '华坪县', '3', '40160', 'H');
INSERT INTO `ey_region` VALUES ('40214', '宁蒗县', '3', '40160', 'N');
INSERT INTO `ey_region` VALUES ('40230', '思茅市', '2', '39556', 'S');
INSERT INTO `ey_region` VALUES ('40231', '市辖区', '3', '40230', 'S');
INSERT INTO `ey_region` VALUES ('40232', '翠云区', '3', '40230', 'C');
INSERT INTO `ey_region` VALUES ('40240', '普洱县', '3', '40230', 'P');
INSERT INTO `ey_region` VALUES ('40250', '墨江县', '3', '40230', 'M');
INSERT INTO `ey_region` VALUES ('40266', '景东县', '3', '40230', 'J');
INSERT INTO `ey_region` VALUES ('40280', '景谷县', '3', '40230', 'J');
INSERT INTO `ey_region` VALUES ('40291', '镇沅县', '3', '40230', 'Z');
INSERT INTO `ey_region` VALUES ('40301', '江城县', '3', '40230', 'J');
INSERT INTO `ey_region` VALUES ('40310', '孟连县', '3', '40230', 'M');
INSERT INTO `ey_region` VALUES ('40318', '澜沧县', '3', '40230', 'L');
INSERT INTO `ey_region` VALUES ('40340', '西盟县', '3', '40230', 'X');
INSERT INTO `ey_region` VALUES ('40348', '临沧市', '2', '39556', 'L');
INSERT INTO `ey_region` VALUES ('40349', '市辖区', '3', '40348', 'S');
INSERT INTO `ey_region` VALUES ('40350', '临翔区', '3', '40348', 'L');
INSERT INTO `ey_region` VALUES ('40361', '凤庆县', '3', '40348', 'F');
INSERT INTO `ey_region` VALUES ('40375', '云县', '3', '40348', 'Y');
INSERT INTO `ey_region` VALUES ('40388', '永德县', '3', '40348', 'Y');
INSERT INTO `ey_region` VALUES ('40400', '镇康县', '3', '40348', 'Z');
INSERT INTO `ey_region` VALUES ('40408', '双江县', '3', '40348', 'S');
INSERT INTO `ey_region` VALUES ('40417', '耿马县', '3', '40348', 'G');
INSERT INTO `ey_region` VALUES ('40429', '沧源县', '3', '40348', 'C');
INSERT INTO `ey_region` VALUES ('40441', '楚雄州', '2', '39556', 'C');
INSERT INTO `ey_region` VALUES ('40442', '楚雄市', '3', '40441', 'C');
INSERT INTO `ey_region` VALUES ('40458', '双柏县', '3', '40441', 'S');
INSERT INTO `ey_region` VALUES ('40467', '牟定县', '3', '40441', 'M');
INSERT INTO `ey_region` VALUES ('40475', '南华县', '3', '40441', 'N');
INSERT INTO `ey_region` VALUES ('40486', '姚安县', '3', '40441', 'Y');
INSERT INTO `ey_region` VALUES ('40496', '大姚县', '3', '40441', 'D');
INSERT INTO `ey_region` VALUES ('40509', '永仁县', '3', '40441', 'Y');
INSERT INTO `ey_region` VALUES ('40517', '元谋县', '3', '40441', 'Y');
INSERT INTO `ey_region` VALUES ('40528', '武定县', '3', '40441', 'W');
INSERT INTO `ey_region` VALUES ('40540', '禄丰县', '3', '40441', 'L');
INSERT INTO `ey_region` VALUES ('40555', '红河州', '2', '39556', 'H');
INSERT INTO `ey_region` VALUES ('40556', '个旧市', '3', '40555', 'G');
INSERT INTO `ey_region` VALUES ('40567', '开远市', '3', '40555', 'K');
INSERT INTO `ey_region` VALUES ('40576', '蒙自县', '3', '40555', 'M');
INSERT INTO `ey_region` VALUES ('40588', '屏边县', '3', '40555', 'P');
INSERT INTO `ey_region` VALUES ('40596', '建水县', '3', '40555', 'J');
INSERT INTO `ey_region` VALUES ('40611', '石屏县', '3', '40555', 'S');
INSERT INTO `ey_region` VALUES ('40621', '弥勒县', '3', '40555', 'M');
INSERT INTO `ey_region` VALUES ('40635', '泸西县', '3', '40555', 'L');
INSERT INTO `ey_region` VALUES ('40644', '元阳县', '3', '40555', 'Y');
INSERT INTO `ey_region` VALUES ('40659', '红河县', '3', '40555', 'H');
INSERT INTO `ey_region` VALUES ('40673', '金平县', '3', '40555', 'J');
INSERT INTO `ey_region` VALUES ('40688', '绿春县', '3', '40555', 'L');
INSERT INTO `ey_region` VALUES ('40698', '河口县', '3', '40555', 'H');
INSERT INTO `ey_region` VALUES ('40705', '文山州', '2', '39556', 'W');
INSERT INTO `ey_region` VALUES ('40706', '文山县', '3', '40705', 'W');
INSERT INTO `ey_region` VALUES ('40722', '砚山县', '3', '40705', 'Y');
INSERT INTO `ey_region` VALUES ('40734', '西畴县', '3', '40705', 'X');
INSERT INTO `ey_region` VALUES ('40744', '麻栗坡县', '3', '40705', 'M');
INSERT INTO `ey_region` VALUES ('40756', '马关县', '3', '40705', 'M');
INSERT INTO `ey_region` VALUES ('40770', '丘北县', '3', '40705', 'Q');
INSERT INTO `ey_region` VALUES ('40783', '广南县', '3', '40705', 'G');
INSERT INTO `ey_region` VALUES ('40802', '富宁县', '3', '40705', 'F');
INSERT INTO `ey_region` VALUES ('40816', '西双版纳州', '2', '39556', 'X');
INSERT INTO `ey_region` VALUES ('40817', '景洪市', '3', '40816', 'J');
INSERT INTO `ey_region` VALUES ('40829', '勐海县', '3', '40816', 'M');
INSERT INTO `ey_region` VALUES ('40841', '勐腊县', '3', '40816', 'M');
INSERT INTO `ey_region` VALUES ('40852', '大理州', '2', '39556', 'D');
INSERT INTO `ey_region` VALUES ('40853', '大理市', '3', '40852', 'D');
INSERT INTO `ey_region` VALUES ('40866', '漾濞县', '3', '40852', 'Y');
INSERT INTO `ey_region` VALUES ('40876', '祥云县', '3', '40852', 'X');
INSERT INTO `ey_region` VALUES ('40887', '宾川县', '3', '40852', 'B');
INSERT INTO `ey_region` VALUES ('40901', '弥渡县', '3', '40852', 'M');
INSERT INTO `ey_region` VALUES ('40910', '南涧县', '3', '40852', 'N');
INSERT INTO `ey_region` VALUES ('40919', '巍山县', '3', '40852', 'W');
INSERT INTO `ey_region` VALUES ('40930', '永平县', '3', '40852', 'Y');
INSERT INTO `ey_region` VALUES ('40938', '云龙县', '3', '40852', 'Y');
INSERT INTO `ey_region` VALUES ('40950', '洱源县', '3', '40852', 'E');
INSERT INTO `ey_region` VALUES ('40960', '剑川县', '3', '40852', 'J');
INSERT INTO `ey_region` VALUES ('40969', '鹤庆县', '3', '40852', 'H');
INSERT INTO `ey_region` VALUES ('40979', '德宏州', '2', '39556', 'D');
INSERT INTO `ey_region` VALUES ('40980', '瑞丽市', '3', '40979', 'R');
INSERT INTO `ey_region` VALUES ('40988', '潞西市', '3', '40979', 'L');
INSERT INTO `ey_region` VALUES ('41000', '梁河县', '3', '40979', 'L');
INSERT INTO `ey_region` VALUES ('41010', '盈江县', '3', '40979', 'Y');
INSERT INTO `ey_region` VALUES ('41026', '陇川县', '3', '40979', 'L');
INSERT INTO `ey_region` VALUES ('41036', '怒江州', '2', '39556', 'N');
INSERT INTO `ey_region` VALUES ('41037', '泸水县', '3', '41036', 'L');
INSERT INTO `ey_region` VALUES ('41047', '福贡县', '3', '41036', 'F');
INSERT INTO `ey_region` VALUES ('41055', '贡山县', '3', '41036', 'G');
INSERT INTO `ey_region` VALUES ('41061', '兰坪县', '3', '41036', 'L');
INSERT INTO `ey_region` VALUES ('41070', '迪庆州', '2', '39556', 'D');
INSERT INTO `ey_region` VALUES ('41071', '香格里拉县', '3', '41070', 'X');
INSERT INTO `ey_region` VALUES ('41083', '德钦县', '3', '41070', 'D');
INSERT INTO `ey_region` VALUES ('41092', '维西县', '3', '41070', 'W');
INSERT INTO `ey_region` VALUES ('41103', '西藏', '1', '0', 'X');
INSERT INTO `ey_region` VALUES ('41104', '拉萨市', '2', '41103', 'L');
INSERT INTO `ey_region` VALUES ('41105', '市辖区', '3', '41104', 'S');
INSERT INTO `ey_region` VALUES ('41106', '城关区', '3', '41104', 'C');
INSERT INTO `ey_region` VALUES ('41118', '林周县', '3', '41104', 'L');
INSERT INTO `ey_region` VALUES ('41129', '当雄县', '3', '41104', 'D');
INSERT INTO `ey_region` VALUES ('41138', '尼木县', '3', '41104', 'N');
INSERT INTO `ey_region` VALUES ('41147', '曲水县', '3', '41104', 'Q');
INSERT INTO `ey_region` VALUES ('41154', '堆龙德庆', '3', '41104', 'D');
INSERT INTO `ey_region` VALUES ('41162', '达孜县', '3', '41104', 'D');
INSERT INTO `ey_region` VALUES ('41169', '墨竹工卡县', '3', '41104', 'M');
INSERT INTO `ey_region` VALUES ('41178', '昌都地区', '2', '41103', 'C');
INSERT INTO `ey_region` VALUES ('41179', '昌都县', '3', '41178', 'C');
INSERT INTO `ey_region` VALUES ('41195', '江达县', '3', '41178', 'J');
INSERT INTO `ey_region` VALUES ('41209', '贡觉县', '3', '41178', 'G');
INSERT INTO `ey_region` VALUES ('41222', '类乌齐县', '3', '41178', 'L');
INSERT INTO `ey_region` VALUES ('41233', '丁青县', '3', '41178', 'D');
INSERT INTO `ey_region` VALUES ('41247', '察亚县', '3', '41178', 'C');
INSERT INTO `ey_region` VALUES ('41261', '八宿县', '3', '41178', 'B');
INSERT INTO `ey_region` VALUES ('41276', '左贡县', '3', '41178', 'Z');
INSERT INTO `ey_region` VALUES ('41287', '芒康县', '3', '41178', 'M');
INSERT INTO `ey_region` VALUES ('41304', '洛隆县', '3', '41178', 'L');
INSERT INTO `ey_region` VALUES ('41316', '边坝县', '3', '41178', 'B');
INSERT INTO `ey_region` VALUES ('41328', '山南地区', '2', '41103', 'S');
INSERT INTO `ey_region` VALUES ('41329', '乃东县', '3', '41328', 'N');
INSERT INTO `ey_region` VALUES ('41337', '扎囊县', '3', '41328', 'Z');
INSERT INTO `ey_region` VALUES ('41343', '贡嘎县', '3', '41328', 'G');
INSERT INTO `ey_region` VALUES ('41352', '桑日县', '3', '41328', 'S');
INSERT INTO `ey_region` VALUES ('41357', '琼结县', '3', '41328', 'Q');
INSERT INTO `ey_region` VALUES ('41362', '曲松县', '3', '41328', 'Q');
INSERT INTO `ey_region` VALUES ('41368', '措美县', '3', '41328', 'C');
INSERT INTO `ey_region` VALUES ('41373', '洛扎县', '3', '41328', 'L');
INSERT INTO `ey_region` VALUES ('41381', '加查县', '3', '41328', 'J');
INSERT INTO `ey_region` VALUES ('41389', '隆子县', '3', '41328', 'L');
INSERT INTO `ey_region` VALUES ('41401', '错那县', '3', '41328', 'C');
INSERT INTO `ey_region` VALUES ('41412', '浪卡子县', '3', '41328', 'L');
INSERT INTO `ey_region` VALUES ('41423', '日喀则地区', '2', '41103', 'R');
INSERT INTO `ey_region` VALUES ('41424', '日喀则市', '3', '41423', 'R');
INSERT INTO `ey_region` VALUES ('41437', '南木林县', '3', '41423', 'N');
INSERT INTO `ey_region` VALUES ('41455', '江孜县', '3', '41423', 'J');
INSERT INTO `ey_region` VALUES ('41475', '定日县', '3', '41423', 'D');
INSERT INTO `ey_region` VALUES ('41489', '萨迦县', '3', '41423', 'S');
INSERT INTO `ey_region` VALUES ('41501', '拉孜县', '3', '41423', 'L');
INSERT INTO `ey_region` VALUES ('41513', '昂仁县', '3', '41423', 'A');
INSERT INTO `ey_region` VALUES ('41531', '谢通门县', '3', '41423', 'X');
INSERT INTO `ey_region` VALUES ('41551', '白朗县', '3', '41423', 'B');
INSERT INTO `ey_region` VALUES ('41563', '仁布县', '3', '41423', 'R');
INSERT INTO `ey_region` VALUES ('41573', '康马县', '3', '41423', 'K');
INSERT INTO `ey_region` VALUES ('41583', '定结县', '3', '41423', 'D');
INSERT INTO `ey_region` VALUES ('41594', '仲巴县', '3', '41423', 'Z');
INSERT INTO `ey_region` VALUES ('41608', '亚东县', '3', '41423', 'Y');
INSERT INTO `ey_region` VALUES ('41616', '吉隆县', '3', '41423', 'J');
INSERT INTO `ey_region` VALUES ('41622', '聂拉木县', '3', '41423', 'N');
INSERT INTO `ey_region` VALUES ('41630', '萨嘎县', '3', '41423', 'S');
INSERT INTO `ey_region` VALUES ('41639', '岗巴县', '3', '41423', 'G');
INSERT INTO `ey_region` VALUES ('41645', '那曲地区', '2', '41103', 'N');
INSERT INTO `ey_region` VALUES ('41646', '那曲县', '3', '41645', 'N');
INSERT INTO `ey_region` VALUES ('41659', '嘉黎县', '3', '41645', 'J');
INSERT INTO `ey_region` VALUES ('41670', '比如县', '3', '41645', 'B');
INSERT INTO `ey_region` VALUES ('41681', '聂荣县', '3', '41645', 'N');
INSERT INTO `ey_region` VALUES ('41692', '安多县', '3', '41645', 'A');
INSERT INTO `ey_region` VALUES ('41706', '申扎县', '3', '41645', 'S');
INSERT INTO `ey_region` VALUES ('41715', '索县', '3', '41645', 'S');
INSERT INTO `ey_region` VALUES ('41726', '班戈县', '3', '41645', 'B');
INSERT INTO `ey_region` VALUES ('41737', '巴青县', '3', '41645', 'B');
INSERT INTO `ey_region` VALUES ('41748', '尼玛县', '3', '41645', 'N');
INSERT INTO `ey_region` VALUES ('41770', '阿里地区', '2', '41103', 'A');
INSERT INTO `ey_region` VALUES ('41771', '普兰县', '3', '41770', 'P');
INSERT INTO `ey_region` VALUES ('41775', '札达县', '3', '41770', 'Z');
INSERT INTO `ey_region` VALUES ('41782', '噶尔县', '3', '41770', 'G');
INSERT INTO `ey_region` VALUES ('41788', '日土县', '3', '41770', 'R');
INSERT INTO `ey_region` VALUES ('41794', '革吉县', '3', '41770', 'G');
INSERT INTO `ey_region` VALUES ('41800', '改则县', '3', '41770', 'G');
INSERT INTO `ey_region` VALUES ('41808', '措勤县', '3', '41770', 'C');
INSERT INTO `ey_region` VALUES ('41814', '林芝地区', '2', '41103', 'L');
INSERT INTO `ey_region` VALUES ('41815', '林芝县', '3', '41814', 'L');
INSERT INTO `ey_region` VALUES ('41823', '工布江达县', '3', '41814', 'G');
INSERT INTO `ey_region` VALUES ('41833', '米林县', '3', '41814', 'M');
INSERT INTO `ey_region` VALUES ('41842', '墨脱县', '3', '41814', 'M');
INSERT INTO `ey_region` VALUES ('41851', '波密县', '3', '41814', 'B');
INSERT INTO `ey_region` VALUES ('41863', '察隅县', '3', '41814', 'C');
INSERT INTO `ey_region` VALUES ('41870', '朗县', '3', '41814', 'L');
INSERT INTO `ey_region` VALUES ('41877', '陕西省', '1', '0', 'S');
INSERT INTO `ey_region` VALUES ('41878', '西安市', '2', '41877', 'X');
INSERT INTO `ey_region` VALUES ('41879', '市辖区', '3', '41878', 'S');
INSERT INTO `ey_region` VALUES ('41880', '新城区', '3', '41878', 'X');
INSERT INTO `ey_region` VALUES ('41890', '碑林区', '3', '41878', 'B');
INSERT INTO `ey_region` VALUES ('41899', '莲湖区', '3', '41878', 'L');
INSERT INTO `ey_region` VALUES ('41909', '灞桥区', '3', '41878', 'B');
INSERT INTO `ey_region` VALUES ('41919', '未央区', '3', '41878', 'W');
INSERT INTO `ey_region` VALUES ('41930', '雁塔区', '3', '41878', 'Y');
INSERT INTO `ey_region` VALUES ('41939', '阎良区', '3', '41878', 'Y');
INSERT INTO `ey_region` VALUES ('41947', '临潼区', '3', '41878', 'L');
INSERT INTO `ey_region` VALUES ('41971', '长安区', '3', '41878', 'C');
INSERT INTO `ey_region` VALUES ('41997', '蓝田县', '3', '41878', 'L');
INSERT INTO `ey_region` VALUES ('42020', '周至县', '3', '41878', 'Z');
INSERT INTO `ey_region` VALUES ('42043', '户县', '3', '41878', 'H');
INSERT INTO `ey_region` VALUES ('42060', '高陵县', '3', '41878', 'G');
INSERT INTO `ey_region` VALUES ('42069', '铜川市', '2', '41877', 'T');
INSERT INTO `ey_region` VALUES ('42070', '市辖区', '3', '42069', 'S');
INSERT INTO `ey_region` VALUES ('42071', '王益区', '3', '42069', 'W');
INSERT INTO `ey_region` VALUES ('42079', '印台区', '3', '42069', 'Y');
INSERT INTO `ey_region` VALUES ('42091', '耀州区', '3', '42069', 'Y');
INSERT INTO `ey_region` VALUES ('42108', '宜君县', '3', '42069', 'Y');
INSERT INTO `ey_region` VALUES ('42119', '宝鸡市', '2', '41877', 'B');
INSERT INTO `ey_region` VALUES ('42120', '市辖区', '3', '42119', 'S');
INSERT INTO `ey_region` VALUES ('42121', '渭滨区', '3', '42119', 'W');
INSERT INTO `ey_region` VALUES ('42133', '金台区', '3', '42119', 'J');
INSERT INTO `ey_region` VALUES ('42146', '陈仓区', '3', '42119', 'C');
INSERT INTO `ey_region` VALUES ('42165', '凤翔县', '3', '42119', 'F');
INSERT INTO `ey_region` VALUES ('42183', '岐山县', '3', '42119', 'Q');
INSERT INTO `ey_region` VALUES ('42198', '扶风县', '3', '42119', 'F');
INSERT INTO `ey_region` VALUES ('42211', '眉县', '3', '42119', 'M');
INSERT INTO `ey_region` VALUES ('42224', '陇县', '3', '42119', 'L');
INSERT INTO `ey_region` VALUES ('42240', '千阳县', '3', '42119', 'Q');
INSERT INTO `ey_region` VALUES ('42252', '麟游县', '3', '42119', 'L');
INSERT INTO `ey_region` VALUES ('42263', '凤县', '3', '42119', 'F');
INSERT INTO `ey_region` VALUES ('42278', '太白县', '3', '42119', 'T');
INSERT INTO `ey_region` VALUES ('42287', '咸阳市', '2', '41877', 'X');
INSERT INTO `ey_region` VALUES ('42288', '市辖区', '3', '42287', 'S');
INSERT INTO `ey_region` VALUES ('42289', '秦都区', '3', '42287', 'Q');
INSERT INTO `ey_region` VALUES ('42302', '杨凌区', '3', '42287', 'Y');
INSERT INTO `ey_region` VALUES ('42308', '渭城区', '3', '42287', 'W');
INSERT INTO `ey_region` VALUES ('42319', '三原县', '3', '42287', 'S');
INSERT INTO `ey_region` VALUES ('42334', '泾阳县', '3', '42287', 'J');
INSERT INTO `ey_region` VALUES ('42351', '乾县', '3', '42287', 'Q');
INSERT INTO `ey_region` VALUES ('42372', '礼泉县', '3', '42287', 'L');
INSERT INTO `ey_region` VALUES ('42388', '永寿县', '3', '42287', 'Y');
INSERT INTO `ey_region` VALUES ('42402', '彬县', '3', '42287', 'B');
INSERT INTO `ey_region` VALUES ('42419', '长武县', '3', '42287', 'C');
INSERT INTO `ey_region` VALUES ('42431', '旬邑县', '3', '42287', 'X');
INSERT INTO `ey_region` VALUES ('42446', '淳化县', '3', '42287', 'C');
INSERT INTO `ey_region` VALUES ('42462', '武功县', '3', '42287', 'W');
INSERT INTO `ey_region` VALUES ('42475', '兴平市', '3', '42287', 'X');
INSERT INTO `ey_region` VALUES ('42490', '渭南市', '2', '41877', 'W');
INSERT INTO `ey_region` VALUES ('42491', '市辖区', '3', '42490', 'S');
INSERT INTO `ey_region` VALUES ('42492', '临渭区', '3', '42490', 'L');
INSERT INTO `ey_region` VALUES ('42523', '华县', '3', '42490', 'H');
INSERT INTO `ey_region` VALUES ('42538', '潼关县', '3', '42490', 'T');
INSERT INTO `ey_region` VALUES ('42547', '大荔县', '3', '42490', 'D');
INSERT INTO `ey_region` VALUES ('42577', '合阳县', '3', '42490', 'H');
INSERT INTO `ey_region` VALUES ('42594', '澄城县', '3', '42490', 'C');
INSERT INTO `ey_region` VALUES ('42609', '蒲城县', '3', '42490', 'P');
INSERT INTO `ey_region` VALUES ('42634', '白水县', '3', '42490', 'B');
INSERT INTO `ey_region` VALUES ('42649', '富平县', '3', '42490', 'F');
INSERT INTO `ey_region` VALUES ('42674', '韩城市', '3', '42490', 'H');
INSERT INTO `ey_region` VALUES ('42691', '华阴市', '3', '42490', 'H');
INSERT INTO `ey_region` VALUES ('42703', '延安市', '2', '41877', 'Y');
INSERT INTO `ey_region` VALUES ('42704', '市辖区', '3', '42703', 'S');
INSERT INTO `ey_region` VALUES ('42705', '宝塔区', '3', '42703', 'B');
INSERT INTO `ey_region` VALUES ('42729', '延长县', '3', '42703', 'Y');
INSERT INTO `ey_region` VALUES ('42742', '延川县', '3', '42703', 'Y');
INSERT INTO `ey_region` VALUES ('42757', '子长县', '3', '42703', 'Z');
INSERT INTO `ey_region` VALUES ('42771', '安塞县', '3', '42703', 'A');
INSERT INTO `ey_region` VALUES ('42784', '志丹县', '3', '42703', 'Z');
INSERT INTO `ey_region` VALUES ('42796', '吴起县', '3', '42703', 'W');
INSERT INTO `ey_region` VALUES ('42809', '甘泉县', '3', '42703', 'G');
INSERT INTO `ey_region` VALUES ('42818', '富县', '3', '42703', 'F');
INSERT INTO `ey_region` VALUES ('42833', '洛川县', '3', '42703', 'L');
INSERT INTO `ey_region` VALUES ('42850', '宜川县', '3', '42703', 'Y');
INSERT INTO `ey_region` VALUES ('42863', '黄龙县', '3', '42703', 'H');
INSERT INTO `ey_region` VALUES ('42874', '黄陵县', '3', '42703', 'H');
INSERT INTO `ey_region` VALUES ('42888', '汉中市', '2', '41877', 'H');
INSERT INTO `ey_region` VALUES ('42889', '市辖区', '3', '42888', 'S');
INSERT INTO `ey_region` VALUES ('42890', '汉台区', '3', '42888', 'H');
INSERT INTO `ey_region` VALUES ('42908', '南郑县', '3', '42888', 'N');
INSERT INTO `ey_region` VALUES ('42939', '城固县', '3', '42888', 'C');
INSERT INTO `ey_region` VALUES ('42965', '洋县', '3', '42888', 'Y');
INSERT INTO `ey_region` VALUES ('42992', '西乡县', '3', '42888', 'X');
INSERT INTO `ey_region` VALUES ('43016', '勉县', '3', '42888', 'M');
INSERT INTO `ey_region` VALUES ('43042', '宁强县', '3', '42888', 'N');
INSERT INTO `ey_region` VALUES ('43069', '略阳县', '3', '42888', 'L');
INSERT INTO `ey_region` VALUES ('43091', '镇巴县', '3', '42888', 'Z');
INSERT INTO `ey_region` VALUES ('43116', '留坝县', '3', '42888', 'L');
INSERT INTO `ey_region` VALUES ('43126', '佛坪县', '3', '42888', 'F');
INSERT INTO `ey_region` VALUES ('43136', '榆林市', '2', '41877', 'Y');
INSERT INTO `ey_region` VALUES ('43137', '市辖区', '3', '43136', 'S');
INSERT INTO `ey_region` VALUES ('43138', '榆阳区', '3', '43136', 'Y');
INSERT INTO `ey_region` VALUES ('43170', '神木县', '3', '43136', 'S');
INSERT INTO `ey_region` VALUES ('43190', '府谷县', '3', '43136', 'F');
INSERT INTO `ey_region` VALUES ('43211', '横山县', '3', '43136', 'H');
INSERT INTO `ey_region` VALUES ('43230', '靖边县', '3', '43136', 'J');
INSERT INTO `ey_region` VALUES ('43253', '定边县', '3', '43136', 'D');
INSERT INTO `ey_region` VALUES ('43279', '绥德县', '3', '43136', 'S');
INSERT INTO `ey_region` VALUES ('43300', '米脂县', '3', '43136', 'M');
INSERT INTO `ey_region` VALUES ('43314', '佳县', '3', '43136', 'J');
INSERT INTO `ey_region` VALUES ('43335', '吴堡县', '3', '43136', 'W');
INSERT INTO `ey_region` VALUES ('43344', '清涧县', '3', '43136', 'Q');
INSERT INTO `ey_region` VALUES ('43360', '子洲县', '3', '43136', 'Z');
INSERT INTO `ey_region` VALUES ('43379', '安康市', '2', '41877', 'A');
INSERT INTO `ey_region` VALUES ('43380', '市辖区', '3', '43379', 'S');
INSERT INTO `ey_region` VALUES ('43381', '汉滨区', '3', '43379', 'H');
INSERT INTO `ey_region` VALUES ('43428', '汉阴县', '3', '43379', 'H');
INSERT INTO `ey_region` VALUES ('43447', '石泉县', '3', '43379', 'S');
INSERT INTO `ey_region` VALUES ('43463', '宁陕县', '3', '43379', 'N');
INSERT INTO `ey_region` VALUES ('43478', '紫阳县', '3', '43379', 'Z');
INSERT INTO `ey_region` VALUES ('43504', '岚皋县', '3', '43379', 'L');
INSERT INTO `ey_region` VALUES ('43522', '平利县', '3', '43379', 'P');
INSERT INTO `ey_region` VALUES ('43535', '镇坪县', '3', '43379', 'Z');
INSERT INTO `ey_region` VALUES ('43546', '旬阳县', '3', '43379', 'X');
INSERT INTO `ey_region` VALUES ('43575', '白河县', '3', '43379', 'B');
INSERT INTO `ey_region` VALUES ('43592', '商洛市', '2', '41877', 'S');
INSERT INTO `ey_region` VALUES ('43593', '市辖区', '3', '43592', 'S');
INSERT INTO `ey_region` VALUES ('43594', '商州区', '3', '43592', 'S');
INSERT INTO `ey_region` VALUES ('43628', '洛南县', '3', '43592', 'L');
INSERT INTO `ey_region` VALUES ('43654', '丹凤县', '3', '43592', 'D');
INSERT INTO `ey_region` VALUES ('43676', '商南县', '3', '43592', 'S');
INSERT INTO `ey_region` VALUES ('43699', '山阳县', '3', '43592', 'S');
INSERT INTO `ey_region` VALUES ('43730', '镇安县', '3', '43592', 'Z');
INSERT INTO `ey_region` VALUES ('43759', '柞水县', '3', '43592', 'Z');
INSERT INTO `ey_region` VALUES ('43776', '甘肃省', '1', '0', 'G');
INSERT INTO `ey_region` VALUES ('43777', '兰州市', '2', '43776', 'L');
INSERT INTO `ey_region` VALUES ('43778', '市辖区', '3', '43777', 'S');
INSERT INTO `ey_region` VALUES ('43779', '城关区', '3', '43777', 'C');
INSERT INTO `ey_region` VALUES ('43804', '七里河区', '3', '43777', 'Q');
INSERT INTO `ey_region` VALUES ('43820', '兰州市西固区', '3', '43777', 'L');
INSERT INTO `ey_region` VALUES ('43836', '安宁区', '3', '43777', 'A');
INSERT INTO `ey_region` VALUES ('43845', '红古区', '3', '43777', 'H');
INSERT INTO `ey_region` VALUES ('43853', '永登县', '3', '43777', 'Y');
INSERT INTO `ey_region` VALUES ('43872', '皋兰县', '3', '43777', 'G');
INSERT INTO `ey_region` VALUES ('43880', '榆中县', '3', '43777', 'Y');
INSERT INTO `ey_region` VALUES ('43904', '嘉峪关市', '2', '43776', 'J');
INSERT INTO `ey_region` VALUES ('43905', '市辖', '3', '43904', 'S');
INSERT INTO `ey_region` VALUES ('43914', '金昌市', '2', '43776', 'J');
INSERT INTO `ey_region` VALUES ('43915', '市辖区', '3', '43914', 'S');
INSERT INTO `ey_region` VALUES ('43916', '金川区', '3', '43914', 'J');
INSERT INTO `ey_region` VALUES ('43925', '永昌县', '3', '43914', 'Y');
INSERT INTO `ey_region` VALUES ('43936', '白银市', '2', '43776', 'B');
INSERT INTO `ey_region` VALUES ('43937', '市辖区', '3', '43936', 'S');
INSERT INTO `ey_region` VALUES ('43938', '白银区', '3', '43936', 'B');
INSERT INTO `ey_region` VALUES ('43949', '平川区', '3', '43936', 'P');
INSERT INTO `ey_region` VALUES ('43961', '靖远县', '3', '43936', 'J');
INSERT INTO `ey_region` VALUES ('43980', '会宁县', '3', '43936', 'H');
INSERT INTO `ey_region` VALUES ('44009', '景泰县', '3', '43936', 'J');
INSERT INTO `ey_region` VALUES ('44022', '天水市', '2', '43776', 'T');
INSERT INTO `ey_region` VALUES ('44023', '市辖区', '3', '44022', 'S');
INSERT INTO `ey_region` VALUES ('44024', '秦州区', '3', '44022', 'Q');
INSERT INTO `ey_region` VALUES ('44048', '麦积区', '3', '44022', 'M');
INSERT INTO `ey_region` VALUES ('44069', '清水县', '3', '44022', 'Q');
INSERT INTO `ey_region` VALUES ('44088', '秦安县', '3', '44022', 'Q');
INSERT INTO `ey_region` VALUES ('44106', '甘谷县', '3', '44022', 'G');
INSERT INTO `ey_region` VALUES ('44122', '武山县', '3', '44022', 'W');
INSERT INTO `ey_region` VALUES ('44138', '张家川县', '3', '44022', 'Z');
INSERT INTO `ey_region` VALUES ('44154', '武威市', '2', '43776', 'W');
INSERT INTO `ey_region` VALUES ('44155', '市辖区', '3', '44154', 'S');
INSERT INTO `ey_region` VALUES ('44156', '凉州区', '3', '44154', 'L');
INSERT INTO `ey_region` VALUES ('44202', '民勤县', '3', '44154', 'M');
INSERT INTO `ey_region` VALUES ('44221', '古浪县', '3', '44154', 'G');
INSERT INTO `ey_region` VALUES ('44242', '天祝县', '3', '44154', 'T');
INSERT INTO `ey_region` VALUES ('44265', '张掖市', '2', '43776', 'Z');
INSERT INTO `ey_region` VALUES ('44266', '市辖区', '3', '44265', 'S');
INSERT INTO `ey_region` VALUES ('44267', '甘州区', '3', '44265', 'G');
INSERT INTO `ey_region` VALUES ('44294', '肃南县', '3', '44265', 'S');
INSERT INTO `ey_region` VALUES ('44305', '民乐县', '3', '44265', 'M');
INSERT INTO `ey_region` VALUES ('44317', '临泽县', '3', '44265', 'L');
INSERT INTO `ey_region` VALUES ('44331', '高台县', '3', '44265', 'G');
INSERT INTO `ey_region` VALUES ('44341', '山丹县', '3', '44265', 'S');
INSERT INTO `ey_region` VALUES ('44352', '平凉市', '2', '43776', 'P');
INSERT INTO `ey_region` VALUES ('44353', '市辖区', '3', '44352', 'S');
INSERT INTO `ey_region` VALUES ('44354', '崆峒区', '3', '44352', 'K');
INSERT INTO `ey_region` VALUES ('44375', '泾川县', '3', '44352', 'J');
INSERT INTO `ey_region` VALUES ('44392', '灵台县', '3', '44352', 'L');
INSERT INTO `ey_region` VALUES ('44408', '崇信县', '3', '44352', 'C');
INSERT INTO `ey_region` VALUES ('44418', '华亭县', '3', '44352', 'H');
INSERT INTO `ey_region` VALUES ('44431', '庄浪县', '3', '44352', 'Z');
INSERT INTO `ey_region` VALUES ('44451', '静宁县', '3', '44352', 'J');
INSERT INTO `ey_region` VALUES ('44477', '酒泉市', '2', '43776', 'J');
INSERT INTO `ey_region` VALUES ('44478', '市辖区', '3', '44477', 'S');
INSERT INTO `ey_region` VALUES ('44479', '肃州区', '3', '44477', 'S');
INSERT INTO `ey_region` VALUES ('44504', '金塔县', '3', '44477', 'J');
INSERT INTO `ey_region` VALUES ('44516', '瓜州县', '3', '44477', 'G');
INSERT INTO `ey_region` VALUES ('44531', '肃北县', '3', '44477', 'S');
INSERT INTO `ey_region` VALUES ('44535', '阿克塞县', '3', '44477', 'A');
INSERT INTO `ey_region` VALUES ('44539', '玉门市', '3', '44477', 'Y');
INSERT INTO `ey_region` VALUES ('44557', '敦煌市', '3', '44477', 'D');
INSERT INTO `ey_region` VALUES ('44569', '庆阳市', '2', '43776', 'Q');
INSERT INTO `ey_region` VALUES ('44570', '市辖区', '3', '44569', 'S');
INSERT INTO `ey_region` VALUES ('44571', '西峰区', '3', '44569', 'X');
INSERT INTO `ey_region` VALUES ('44582', '庆城县', '3', '44569', 'Q');
INSERT INTO `ey_region` VALUES ('44598', '环县', '3', '44569', 'H');
INSERT INTO `ey_region` VALUES ('44620', '华池县', '3', '44569', 'H');
INSERT INTO `ey_region` VALUES ('44636', '合水县', '3', '44569', 'H');
INSERT INTO `ey_region` VALUES ('44649', '正宁县', '3', '44569', 'Z');
INSERT INTO `ey_region` VALUES ('44660', '宁县', '3', '44569', 'N');
INSERT INTO `ey_region` VALUES ('44679', '镇原县', '3', '44569', 'Z');
INSERT INTO `ey_region` VALUES ('44699', '定西市', '2', '43776', 'D');
INSERT INTO `ey_region` VALUES ('44700', '市辖区', '3', '44699', 'S');
INSERT INTO `ey_region` VALUES ('44701', '安定区', '3', '44699', 'A');
INSERT INTO `ey_region` VALUES ('44723', '通渭县', '3', '44699', 'T');
INSERT INTO `ey_region` VALUES ('44742', '陇西县', '3', '44699', 'L');
INSERT INTO `ey_region` VALUES ('44760', '渭源县', '3', '44699', 'W');
INSERT INTO `ey_region` VALUES ('44777', '临洮县', '3', '44699', 'L');
INSERT INTO `ey_region` VALUES ('44796', '漳县', '3', '44699', 'Z');
INSERT INTO `ey_region` VALUES ('44810', '岷县', '3', '44699', 'M');
INSERT INTO `ey_region` VALUES ('44829', '陇南市', '2', '43776', 'L');
INSERT INTO `ey_region` VALUES ('44830', '市辖区', '3', '44829', 'S');
INSERT INTO `ey_region` VALUES ('44831', '武都区', '3', '44829', 'W');
INSERT INTO `ey_region` VALUES ('44868', '成县', '3', '44829', 'C');
INSERT INTO `ey_region` VALUES ('44886', '文县', '3', '44829', 'W');
INSERT INTO `ey_region` VALUES ('44907', '宕昌县', '3', '44829', 'D');
INSERT INTO `ey_region` VALUES ('44933', '康县', '3', '44829', 'K');
INSERT INTO `ey_region` VALUES ('44955', '西和县', '3', '44829', 'X');
INSERT INTO `ey_region` VALUES ('44976', '礼县', '3', '44829', 'L');
INSERT INTO `ey_region` VALUES ('45006', '徽县', '3', '44829', 'H');
INSERT INTO `ey_region` VALUES ('45022', '两当县', '3', '44829', 'L');
INSERT INTO `ey_region` VALUES ('45035', '临夏州', '2', '43776', 'L');
INSERT INTO `ey_region` VALUES ('45036', '临夏市', '3', '45035', 'L');
INSERT INTO `ey_region` VALUES ('45047', '临夏县', '3', '45035', 'L');
INSERT INTO `ey_region` VALUES ('45073', '康乐县', '3', '45035', 'K');
INSERT INTO `ey_region` VALUES ('45089', '永靖县', '3', '45035', 'Y');
INSERT INTO `ey_region` VALUES ('45107', '广河县', '3', '45035', 'G');
INSERT INTO `ey_region` VALUES ('45117', '和政县', '3', '45035', 'H');
INSERT INTO `ey_region` VALUES ('45131', '东乡县', '3', '45035', 'D');
INSERT INTO `ey_region` VALUES ('45156', '积石山县', '3', '45035', 'J');
INSERT INTO `ey_region` VALUES ('45174', '甘南州', '2', '43776', 'G');
INSERT INTO `ey_region` VALUES ('45175', '合作市', '3', '45174', 'H');
INSERT INTO `ey_region` VALUES ('45186', '临潭县', '3', '45174', 'L');
INSERT INTO `ey_region` VALUES ('45203', '卓尼县', '3', '45174', 'Z');
INSERT INTO `ey_region` VALUES ('45219', '舟曲县', '3', '45174', 'Z');
INSERT INTO `ey_region` VALUES ('45239', '迭部县', '3', '45174', 'D');
INSERT INTO `ey_region` VALUES ('45251', '玛曲县', '3', '45174', 'M');
INSERT INTO `ey_region` VALUES ('45263', '碌曲县', '3', '45174', 'L');
INSERT INTO `ey_region` VALUES ('45272', '夏河县', '3', '45174', 'X');
INSERT INTO `ey_region` VALUES ('45286', '青海省', '1', '0', 'Q');
INSERT INTO `ey_region` VALUES ('45287', '西宁市', '2', '45286', 'X');
INSERT INTO `ey_region` VALUES ('45288', '市辖区', '3', '45287', 'S');
INSERT INTO `ey_region` VALUES ('45289', '城东区', '3', '45287', 'C');
INSERT INTO `ey_region` VALUES ('45299', '城中区', '3', '45287', 'C');
INSERT INTO `ey_region` VALUES ('45306', '城西区', '3', '45287', 'C');
INSERT INTO `ey_region` VALUES ('45314', '城北区', '3', '45287', 'C');
INSERT INTO `ey_region` VALUES ('45320', '大通县', '3', '45287', 'D');
INSERT INTO `ey_region` VALUES ('45341', '湟中县', '3', '45287', 'H');
INSERT INTO `ey_region` VALUES ('45358', '湟源县', '3', '45287', 'H');
INSERT INTO `ey_region` VALUES ('45368', '海东地区', '2', '45286', 'H');
INSERT INTO `ey_region` VALUES ('45369', '平安县', '3', '45368', 'P');
INSERT INTO `ey_region` VALUES ('45378', '民和县', '3', '45368', 'M');
INSERT INTO `ey_region` VALUES ('45401', '乐都县', '3', '45368', 'L');
INSERT INTO `ey_region` VALUES ('45421', '互助县', '3', '45368', 'H');
INSERT INTO `ey_region` VALUES ('45441', '化隆县', '3', '45368', 'H');
INSERT INTO `ey_region` VALUES ('45461', '循化县', '3', '45368', 'X');
INSERT INTO `ey_region` VALUES ('45471', '海北州', '2', '45286', 'H');
INSERT INTO `ey_region` VALUES ('45472', '门源县', '3', '45471', 'M');
INSERT INTO `ey_region` VALUES ('45487', '祁连县', '3', '45471', 'Q');
INSERT INTO `ey_region` VALUES ('45495', '海晏县', '3', '45471', 'H');
INSERT INTO `ey_region` VALUES ('45502', '刚察县', '3', '45471', 'G');
INSERT INTO `ey_region` VALUES ('45510', '黄南州', '2', '45286', 'H');
INSERT INTO `ey_region` VALUES ('45511', '同仁县', '3', '45510', 'T');
INSERT INTO `ey_region` VALUES ('45523', '尖扎县', '3', '45510', 'J');
INSERT INTO `ey_region` VALUES ('45533', '泽库县', '3', '45510', 'Z');
INSERT INTO `ey_region` VALUES ('45542', '河南县', '3', '45510', 'H');
INSERT INTO `ey_region` VALUES ('45548', '海南州', '2', '45286', 'H');
INSERT INTO `ey_region` VALUES ('45549', '共和县', '3', '45548', 'G');
INSERT INTO `ey_region` VALUES ('45566', '同德县', '3', '45548', 'T');
INSERT INTO `ey_region` VALUES ('45573', '贵德县', '3', '45548', 'G');
INSERT INTO `ey_region` VALUES ('45581', '兴海县', '3', '45548', 'X');
INSERT INTO `ey_region` VALUES ('45589', '贵南县', '3', '45548', 'G');
INSERT INTO `ey_region` VALUES ('45597', '果洛州', '2', '45286', 'G');
INSERT INTO `ey_region` VALUES ('45598', '玛沁县', '3', '45597', 'M');
INSERT INTO `ey_region` VALUES ('45607', '班玛县', '3', '45597', 'B');
INSERT INTO `ey_region` VALUES ('45617', '甘德县', '3', '45597', 'G');
INSERT INTO `ey_region` VALUES ('45625', '达日县', '3', '45597', 'D');
INSERT INTO `ey_region` VALUES ('45636', '久治县', '3', '45597', 'J');
INSERT INTO `ey_region` VALUES ('45643', '玛多县', '3', '45597', 'M');
INSERT INTO `ey_region` VALUES ('45648', '玉树州', '2', '45286', 'Y');
INSERT INTO `ey_region` VALUES ('45649', '玉树县', '3', '45648', 'Y');
INSERT INTO `ey_region` VALUES ('45659', '杂多县', '3', '45648', 'Z');
INSERT INTO `ey_region` VALUES ('45668', '称多县', '3', '45648', 'C');
INSERT INTO `ey_region` VALUES ('45676', '治多县', '3', '45648', 'Z');
INSERT INTO `ey_region` VALUES ('45683', '囊谦县', '3', '45648', 'N');
INSERT INTO `ey_region` VALUES ('45694', '曲麻莱县', '3', '45648', 'Q');
INSERT INTO `ey_region` VALUES ('45701', '海西州', '2', '45286', 'H');
INSERT INTO `ey_region` VALUES ('45702', '格尔木市', '3', '45701', 'G');
INSERT INTO `ey_region` VALUES ('45714', '德令哈市', '3', '45701', 'D');
INSERT INTO `ey_region` VALUES ('45727', '乌兰县', '3', '45701', 'W');
INSERT INTO `ey_region` VALUES ('45733', '都兰县', '3', '45701', 'D');
INSERT INTO `ey_region` VALUES ('45742', '天峻县', '3', '45701', 'T');
INSERT INTO `ey_region` VALUES ('45753', '宁夏', '1', '0', 'N');
INSERT INTO `ey_region` VALUES ('45754', '银川市', '2', '45753', 'Y');
INSERT INTO `ey_region` VALUES ('45755', '市辖区', '3', '45754', 'S');
INSERT INTO `ey_region` VALUES ('45756', '兴庆区', '3', '45754', 'X');
INSERT INTO `ey_region` VALUES ('45772', '西夏区', '3', '45754', 'X');
INSERT INTO `ey_region` VALUES ('45784', '金凤区', '3', '45754', 'J');
INSERT INTO `ey_region` VALUES ('45794', '永宁县', '3', '45754', 'Y');
INSERT INTO `ey_region` VALUES ('45803', '贺兰县', '3', '45754', 'H');
INSERT INTO `ey_region` VALUES ('45813', '灵武市', '3', '45754', 'L');
INSERT INTO `ey_region` VALUES ('45825', '石嘴山市', '2', '45753', 'S');
INSERT INTO `ey_region` VALUES ('45826', '市辖区', '3', '45825', 'S');
INSERT INTO `ey_region` VALUES ('45827', '大武口区', '3', '45825', 'D');
INSERT INTO `ey_region` VALUES ('45839', '惠农区', '3', '45825', 'H');
INSERT INTO `ey_region` VALUES ('45856', '平罗县', '3', '45825', 'P');
INSERT INTO `ey_region` VALUES ('45871', '吴忠市', '2', '45753', 'W');
INSERT INTO `ey_region` VALUES ('45872', '市辖区', '3', '45871', 'S');
INSERT INTO `ey_region` VALUES ('45877', '利通区', '3', '45871', 'L');
INSERT INTO `ey_region` VALUES ('45892', '盐池县', '3', '45871', 'Y');
INSERT INTO `ey_region` VALUES ('45903', '同心县', '3', '45871', 'T');
INSERT INTO `ey_region` VALUES ('45914', '青铜峡市', '3', '45871', 'Q');
INSERT INTO `ey_region` VALUES ('45926', '固原市', '2', '45753', 'G');
INSERT INTO `ey_region` VALUES ('45927', '市辖区', '3', '45926', 'S');
INSERT INTO `ey_region` VALUES ('45928', '原州区', '3', '45926', 'Y');
INSERT INTO `ey_region` VALUES ('45944', '西吉县', '3', '45926', 'X');
INSERT INTO `ey_region` VALUES ('45964', '隆德县', '3', '45926', 'L');
INSERT INTO `ey_region` VALUES ('45978', '泾源县', '3', '45926', 'J');
INSERT INTO `ey_region` VALUES ('45986', '彭阳县', '3', '45926', 'P');
INSERT INTO `ey_region` VALUES ('45999', '中卫市', '2', '45753', 'Z');
INSERT INTO `ey_region` VALUES ('46000', '市辖区', '3', '45999', 'S');
INSERT INTO `ey_region` VALUES ('46012', '沙坡头区', '3', '45999', 'S');
INSERT INTO `ey_region` VALUES ('46013', '中宁县', '3', '45999', 'Z');
INSERT INTO `ey_region` VALUES ('46026', '海原县', '3', '45999', 'H');
INSERT INTO `ey_region` VALUES ('46047', '新疆', '1', '0', 'X');
INSERT INTO `ey_region` VALUES ('46048', '乌鲁木齐市', '2', '46047', 'W');
INSERT INTO `ey_region` VALUES ('46049', '市辖区', '3', '46048', 'S');
INSERT INTO `ey_region` VALUES ('46050', '天山区', '3', '46048', 'T');
INSERT INTO `ey_region` VALUES ('46065', '沙依巴克区', '3', '46048', 'S');
INSERT INTO `ey_region` VALUES ('46079', '新市区', '3', '46048', 'X');
INSERT INTO `ey_region` VALUES ('46095', '水磨沟区', '3', '46048', 'S');
INSERT INTO `ey_region` VALUES ('46104', '头屯河区', '3', '46048', 'T');
INSERT INTO `ey_region` VALUES ('46114', '达坂城区', '3', '46048', 'D');
INSERT INTO `ey_region` VALUES ('46123', '东山区', '3', '46048', 'D');
INSERT INTO `ey_region` VALUES ('46128', '乌鲁木齐县', '3', '46048', 'W');
INSERT INTO `ey_region` VALUES ('46138', '克拉玛依市', '2', '46047', 'K');
INSERT INTO `ey_region` VALUES ('46139', '市辖区', '3', '46138', 'S');
INSERT INTO `ey_region` VALUES ('46140', '独山子区', '3', '46138', 'D');
INSERT INTO `ey_region` VALUES ('46144', '克拉玛依区', '3', '46138', 'K');
INSERT INTO `ey_region` VALUES ('46155', '白碱滩区', '3', '46138', 'B');
INSERT INTO `ey_region` VALUES ('46158', '乌尔禾区', '3', '46138', 'W');
INSERT INTO `ey_region` VALUES ('46162', '吐鲁番地区', '2', '46047', 'T');
INSERT INTO `ey_region` VALUES ('46163', '吐鲁番市', '3', '46162', 'T');
INSERT INTO `ey_region` VALUES ('46178', '鄯善县', '3', '46162', 'S');
INSERT INTO `ey_region` VALUES ('46189', '托克逊县', '3', '46162', 'T');
INSERT INTO `ey_region` VALUES ('46197', '哈密地区', '2', '46047', 'H');
INSERT INTO `ey_region` VALUES ('46198', '哈密市', '3', '46197', 'H');
INSERT INTO `ey_region` VALUES ('46230', '巴里坤县', '3', '46197', 'B');
INSERT INTO `ey_region` VALUES ('46246', '伊吾县', '3', '46197', 'Y');
INSERT INTO `ey_region` VALUES ('46255', '昌吉州', '2', '46047', 'C');
INSERT INTO `ey_region` VALUES ('46256', '昌吉市', '3', '46255', 'C');
INSERT INTO `ey_region` VALUES ('46275', '阜康市', '3', '46255', 'F');
INSERT INTO `ey_region` VALUES ('46289', '米泉市', '3', '46255', 'M');
INSERT INTO `ey_region` VALUES ('46299', '呼图壁县', '3', '46255', 'H');
INSERT INTO `ey_region` VALUES ('46316', '玛纳斯', '3', '46255', 'M');
INSERT INTO `ey_region` VALUES ('46337', '奇台县', '3', '46255', 'Q');
INSERT INTO `ey_region` VALUES ('46355', '吉木萨尔县', '3', '46255', 'J');
INSERT INTO `ey_region` VALUES ('46366', '木垒县', '3', '46255', 'M');
INSERT INTO `ey_region` VALUES ('46380', '博州', '2', '46047', 'B');
INSERT INTO `ey_region` VALUES ('46381', '博乐市', '3', '46380', 'B');
INSERT INTO `ey_region` VALUES ('46399', '精河县', '3', '46380', 'J');
INSERT INTO `ey_region` VALUES ('46410', '温泉县', '3', '46380', 'W');
INSERT INTO `ey_region` VALUES ('46422', '巴州', '2', '46047', 'B');
INSERT INTO `ey_region` VALUES ('46423', '库尔勒市', '3', '46422', 'K');
INSERT INTO `ey_region` VALUES ('46451', '轮台县', '3', '46422', 'L');
INSERT INTO `ey_region` VALUES ('46463', '尉犁县', '3', '46422', 'W');
INSERT INTO `ey_region` VALUES ('46476', '若羌县', '3', '46422', 'R');
INSERT INTO `ey_region` VALUES ('46486', '且末县', '3', '46422', 'Q');
INSERT INTO `ey_region` VALUES ('46500', '焉耆县', '3', '46422', 'Y');
INSERT INTO `ey_region` VALUES ('46512', '和静县', '3', '46422', 'H');
INSERT INTO `ey_region` VALUES ('46531', '和硕县', '3', '46422', 'H');
INSERT INTO `ey_region` VALUES ('46542', '博湖县', '3', '46422', 'B');
INSERT INTO `ey_region` VALUES ('46551', '阿克苏地区', '2', '46047', 'A');
INSERT INTO `ey_region` VALUES ('46552', '阿克苏市', '3', '46551', 'A');
INSERT INTO `ey_region` VALUES ('46571', '温宿县', '3', '46551', 'W');
INSERT INTO `ey_region` VALUES ('46592', '库车县', '3', '46551', 'K');
INSERT INTO `ey_region` VALUES ('46617', '沙雅县', '3', '46551', 'S');
INSERT INTO `ey_region` VALUES ('46630', '新和县', '3', '46551', 'X');
INSERT INTO `ey_region` VALUES ('46640', '拜城县', '3', '46551', 'B');
INSERT INTO `ey_region` VALUES ('46657', '乌什县', '3', '46551', 'W');
INSERT INTO `ey_region` VALUES ('46668', '阿瓦提县', '3', '46551', 'A');
INSERT INTO `ey_region` VALUES ('46682', '柯坪县', '3', '46551', 'K');
INSERT INTO `ey_region` VALUES ('46688', '克州', '2', '46047', 'K');
INSERT INTO `ey_region` VALUES ('46689', '阿图什市', '3', '46688', 'A');
INSERT INTO `ey_region` VALUES ('46704', '阿克陶县', '3', '46688', 'A');
INSERT INTO `ey_region` VALUES ('46723', '阿合奇县', '3', '46688', 'A');
INSERT INTO `ey_region` VALUES ('46733', '乌恰县', '3', '46688', 'W');
INSERT INTO `ey_region` VALUES ('46747', '喀什地区', '2', '46047', 'K');
INSERT INTO `ey_region` VALUES ('46748', '喀什市', '3', '46747', 'K');
INSERT INTO `ey_region` VALUES ('46761', '疏附县', '3', '46747', 'S');
INSERT INTO `ey_region` VALUES ('46780', '疏勒县', '3', '46747', 'S');
INSERT INTO `ey_region` VALUES ('46797', '英吉沙县', '3', '46747', 'Y');
INSERT INTO `ey_region` VALUES ('46813', '泽普县', '3', '46747', 'Z');
INSERT INTO `ey_region` VALUES ('46830', '莎车县', '3', '46747', 'S');
INSERT INTO `ey_region` VALUES ('46863', '叶城县', '3', '46747', 'Y');
INSERT INTO `ey_region` VALUES ('46885', '麦盖提县', '3', '46747', 'M');
INSERT INTO `ey_region` VALUES ('46902', '岳普湖县', '3', '46747', 'Y');
INSERT INTO `ey_region` VALUES ('46913', '伽师县', '3', '46747', 'Q');
INSERT INTO `ey_region` VALUES ('46928', '巴楚县', '3', '46747', 'B');
INSERT INTO `ey_region` VALUES ('46942', '塔什库尔干县', '3', '46747', 'T');
INSERT INTO `ey_region` VALUES ('46957', '和田地区', '2', '46047', 'H');
INSERT INTO `ey_region` VALUES ('46958', '和田市', '3', '46957', 'H');
INSERT INTO `ey_region` VALUES ('46971', '和田县', '3', '46957', 'H');
INSERT INTO `ey_region` VALUES ('46983', '墨玉县', '3', '46957', 'M');
INSERT INTO `ey_region` VALUES ('47002', '皮山县', '3', '46957', 'P');
INSERT INTO `ey_region` VALUES ('47020', '洛浦县', '3', '46957', 'L');
INSERT INTO `ey_region` VALUES ('47032', '策勒县', '3', '46957', 'C');
INSERT INTO `ey_region` VALUES ('47042', '于田县', '3', '46957', 'Y');
INSERT INTO `ey_region` VALUES ('47061', '民丰县', '3', '46957', 'M');
INSERT INTO `ey_region` VALUES ('47069', '伊犁州', '2', '46047', 'Y');
INSERT INTO `ey_region` VALUES ('47070', '伊宁市', '3', '47069', 'Y');
INSERT INTO `ey_region` VALUES ('47091', '奎屯市', '3', '47069', 'K');
INSERT INTO `ey_region` VALUES ('47099', '伊宁县', '3', '47069', 'Y');
INSERT INTO `ey_region` VALUES ('47121', '察布查尔县', '3', '47069', 'C');
INSERT INTO `ey_region` VALUES ('47143', '霍城县', '3', '47069', 'H');
INSERT INTO `ey_region` VALUES ('47164', '巩留县', '3', '47069', 'G');
INSERT INTO `ey_region` VALUES ('47180', '新源县', '3', '47069', 'X');
INSERT INTO `ey_region` VALUES ('47196', '昭苏县', '3', '47069', 'Z');
INSERT INTO `ey_region` VALUES ('47214', '特克斯县', '3', '47069', 'T');
INSERT INTO `ey_region` VALUES ('47226', '尼勒克县', '3', '47069', 'N');
INSERT INTO `ey_region` VALUES ('47241', '塔城地区', '2', '46047', 'T');
INSERT INTO `ey_region` VALUES ('47242', '塔城市', '3', '47241', 'T');
INSERT INTO `ey_region` VALUES ('47258', '乌苏市', '3', '47241', 'W');
INSERT INTO `ey_region` VALUES ('47291', '额敏县', '3', '47241', 'E');
INSERT INTO `ey_region` VALUES ('47315', '沙湾县', '3', '47241', 'S');
INSERT INTO `ey_region` VALUES ('47338', '托里县', '3', '47241', 'T');
INSERT INTO `ey_region` VALUES ('47351', '裕民县', '3', '47241', 'Y');
INSERT INTO `ey_region` VALUES ('47360', '和布县', '3', '47241', 'H');
INSERT INTO `ey_region` VALUES ('47374', '阿勒泰地区', '2', '46047', 'A');
INSERT INTO `ey_region` VALUES ('47375', '阿勒泰市', '3', '47374', 'A');
INSERT INTO `ey_region` VALUES ('47393', '布尔津县', '3', '47374', 'B');
INSERT INTO `ey_region` VALUES ('47401', '富蕴县', '3', '47374', 'F');
INSERT INTO `ey_region` VALUES ('47411', '福海县', '3', '47374', 'F');
INSERT INTO `ey_region` VALUES ('47424', '哈巴河县', '3', '47374', 'H');
INSERT INTO `ey_region` VALUES ('47433', '青河县', '3', '47374', 'Q');
INSERT INTO `ey_region` VALUES ('47441', '吉木乃县', '3', '47374', 'J');
INSERT INTO `ey_region` VALUES ('47450', '省直辖行政单位', '2', '46047', 'S');
INSERT INTO `ey_region` VALUES ('47451', '石河子市', '3', '47450', 'S');
INSERT INTO `ey_region` VALUES ('47460', '阿拉尔市', '3', '47450', 'A');
INSERT INTO `ey_region` VALUES ('47477', '图木舒克市', '3', '47450', 'T');
INSERT INTO `ey_region` VALUES ('47486', '五家渠市', '3', '47450', 'W');
INSERT INTO `ey_region` VALUES ('47493', '台湾', '1', '0', 'T');
INSERT INTO `ey_region` VALUES ('47494', '香港', '1', '0', 'X');
INSERT INTO `ey_region` VALUES ('47495', '澳门', '1', '0', 'A');
INSERT INTO `ey_region` VALUES ('47496', '龙华新区', '3', '28558', 'L');
INSERT INTO `ey_region` VALUES ('47497', '光明新区', '3', '28558', 'G');
INSERT INTO `ey_region` VALUES ('47500', '新界', '2', '47494', 'X');
INSERT INTO `ey_region` VALUES ('47501', '观塘区', '3', '47498', 'G');
INSERT INTO `ey_region` VALUES ('47502', '黄大仙区', '3', '47498', 'H');
INSERT INTO `ey_region` VALUES ('47503', '九龙城区', '3', '47498', 'J');
INSERT INTO `ey_region` VALUES ('47504', '深水埗区', '3', '47498', 'S');
INSERT INTO `ey_region` VALUES ('47505', '油尖旺区', '3', '47498', 'Y');
INSERT INTO `ey_region` VALUES ('47506', '东区', '3', '47499', 'D');
INSERT INTO `ey_region` VALUES ('47507', '南区', '3', '47499', 'N');
INSERT INTO `ey_region` VALUES ('47508', '湾仔', '3', '47499', 'W');
INSERT INTO `ey_region` VALUES ('47509', '中西区', '3', '47499', 'Z');
INSERT INTO `ey_region` VALUES ('47510', '北区', '3', '47500', 'B');
INSERT INTO `ey_region` VALUES ('47511', '大埔区', '3', '47500', 'D');
INSERT INTO `ey_region` VALUES ('47512', '葵青区', '3', '47500', 'K');
INSERT INTO `ey_region` VALUES ('47513', '离岛区', '3', '47500', 'L');
INSERT INTO `ey_region` VALUES ('47514', '荃湾区', '3', '47500', 'Q');
INSERT INTO `ey_region` VALUES ('47515', '沙田区', '3', '47500', 'S');
INSERT INTO `ey_region` VALUES ('47516', '屯门区', '3', '47500', 'T');
INSERT INTO `ey_region` VALUES ('47517', '西贡区', '3', '47500', 'X');
INSERT INTO `ey_region` VALUES ('47518', '元朗区', '3', '47500', 'Y');
INSERT INTO `ey_region` VALUES ('47519', '澳门半岛', '2', '47495', 'A');
INSERT INTO `ey_region` VALUES ('47520', '离岛', '2', '47495', 'L');
INSERT INTO `ey_region` VALUES ('47521', '大堂区', '3', '47519', 'D');
INSERT INTO `ey_region` VALUES ('47522', '风顺堂区', '3', '47519', 'F');
INSERT INTO `ey_region` VALUES ('47523', '花地玛堂区', '3', '47519', 'H');
INSERT INTO `ey_region` VALUES ('47524', '花王堂区', '3', '47519', 'H');
INSERT INTO `ey_region` VALUES ('47525', '望德堂区', '3', '47519', 'W');
INSERT INTO `ey_region` VALUES ('47526', '嘉模堂区', '3', '47520', 'J');
INSERT INTO `ey_region` VALUES ('47527', '路氹填海区', '3', '47520', 'L');
INSERT INTO `ey_region` VALUES ('47528', '圣方济各堂区', '3', '47520', 'S');
INSERT INTO `ey_region` VALUES ('47529', '高雄市', '2', '47493', 'G');
INSERT INTO `ey_region` VALUES ('47530', '花莲县', '2', '47493', 'H');
INSERT INTO `ey_region` VALUES ('47531', '基隆市', '2', '47493', 'J');
INSERT INTO `ey_region` VALUES ('47532', '嘉义市', '2', '47493', 'J');
INSERT INTO `ey_region` VALUES ('47533', '嘉义县', '2', '47493', 'J');
INSERT INTO `ey_region` VALUES ('47534', '金门县', '2', '47493', 'J');
INSERT INTO `ey_region` VALUES ('47535', '连江县', '2', '47493', 'L');
INSERT INTO `ey_region` VALUES ('47536', '苗栗县', '2', '47493', 'M');
INSERT INTO `ey_region` VALUES ('47537', '南投县', '2', '47493', 'N');
INSERT INTO `ey_region` VALUES ('47538', '澎湖县', '2', '47493', 'P');
INSERT INTO `ey_region` VALUES ('47539', '屏东县', '2', '47493', 'P');
INSERT INTO `ey_region` VALUES ('47540', '台北市', '2', '47493', 'T');
INSERT INTO `ey_region` VALUES ('47541', '台东县', '2', '47493', 'T');
INSERT INTO `ey_region` VALUES ('47542', '台南市', '2', '47493', 'T');
INSERT INTO `ey_region` VALUES ('47543', '台中市', '2', '47493', 'T');
INSERT INTO `ey_region` VALUES ('47544', '桃园市', '2', '47493', 'T');
INSERT INTO `ey_region` VALUES ('47545', '新北市', '2', '47493', 'X');
INSERT INTO `ey_region` VALUES ('47546', '新竹市', '2', '47493', 'X');
INSERT INTO `ey_region` VALUES ('47547', '新竹县', '2', '47493', 'X');
INSERT INTO `ey_region` VALUES ('47548', '宜兰县', '2', '47493', 'Y');
INSERT INTO `ey_region` VALUES ('47549', '云林县', '2', '47493', 'Y');
INSERT INTO `ey_region` VALUES ('47550', '彰化县', '2', '47493', 'Z');
INSERT INTO `ey_region` VALUES ('47551', '阿莲区', '3', '47529', 'A');
INSERT INTO `ey_region` VALUES ('47552', '大寮区', '3', '47529', 'D');
INSERT INTO `ey_region` VALUES ('47553', '大社区', '3', '47529', 'D');
INSERT INTO `ey_region` VALUES ('47554', '大树区', '3', '47529', 'D');
INSERT INTO `ey_region` VALUES ('47555', '凤山区', '3', '47529', 'F');
INSERT INTO `ey_region` VALUES ('47556', '冈山区', '3', '47529', 'G');
INSERT INTO `ey_region` VALUES ('47557', '鼓山区', '3', '47529', 'G');
INSERT INTO `ey_region` VALUES ('47558', '湖内区', '3', '47529', 'H');
INSERT INTO `ey_region` VALUES ('47559', '甲仙区', '3', '47529', 'J');
INSERT INTO `ey_region` VALUES ('47560', '林园区', '3', '47529', 'L');
INSERT INTO `ey_region` VALUES ('47561', '苓雅区', '3', '47529', 'L');
INSERT INTO `ey_region` VALUES ('47562', '六龟区', '3', '47529', 'L');
INSERT INTO `ey_region` VALUES ('47563', '路竹区', '3', '47529', 'L');
INSERT INTO `ey_region` VALUES ('47564', '茂林区', '3', '47529', 'M');
INSERT INTO `ey_region` VALUES ('47565', '美浓区', '3', '47529', 'M');
INSERT INTO `ey_region` VALUES ('47566', '弥陀区', '3', '47529', 'M');
INSERT INTO `ey_region` VALUES ('47567', '楠梓区', '3', '47529', 'N');
INSERT INTO `ey_region` VALUES ('47568', '那玛夏区', '3', '47529', 'N');
INSERT INTO `ey_region` VALUES ('47569', '内门区', '3', '47529', 'N');
INSERT INTO `ey_region` VALUES ('47570', '鸟松区', '3', '47529', 'N');
INSERT INTO `ey_region` VALUES ('47571', '旗津区', '3', '47529', 'Q');
INSERT INTO `ey_region` VALUES ('47572', '旗门区', '3', '47529', 'Q');
INSERT INTO `ey_region` VALUES ('47573', '其它区', '3', '47529', 'Q');
INSERT INTO `ey_region` VALUES ('47574', '前金区', '3', '47529', 'Q');
INSERT INTO `ey_region` VALUES ('47575', '前镇区', '3', '47529', 'Q');
INSERT INTO `ey_region` VALUES ('47576', '桥头区', '3', '47529', 'Q');
INSERT INTO `ey_region` VALUES ('47577', '茄萣区', '3', '47529', 'Q');
INSERT INTO `ey_region` VALUES ('47578', '芩雅区', '3', '47529', 'Q');
INSERT INTO `ey_region` VALUES ('47579', '仁武区', '3', '47529', 'R');
INSERT INTO `ey_region` VALUES ('47580', '三民区', '3', '47529', 'S');
INSERT INTO `ey_region` VALUES ('47581', '杉林区', '3', '47529', 'S');
INSERT INTO `ey_region` VALUES ('47582', '桃源区', '3', '47529', 'T');
INSERT INTO `ey_region` VALUES ('47583', '田寮区', '3', '47529', 'T');
INSERT INTO `ey_region` VALUES ('47584', '小港区', '3', '47529', 'X');
INSERT INTO `ey_region` VALUES ('47585', '新兴区', '3', '47529', 'X');
INSERT INTO `ey_region` VALUES ('47586', '燕巢区', '3', '47529', 'Y');
INSERT INTO `ey_region` VALUES ('47587', '盐埕区', '3', '47529', 'Y');
INSERT INTO `ey_region` VALUES ('47588', '永安区', '3', '47529', 'Y');
INSERT INTO `ey_region` VALUES ('47589', '梓官区', '3', '47529', 'Z');
INSERT INTO `ey_region` VALUES ('47590', '左营区', '3', '47529', 'Z');
INSERT INTO `ey_region` VALUES ('47591', '丰滨乡', '3', '47530', 'F');
INSERT INTO `ey_region` VALUES ('47592', '凤林镇', '3', '47530', 'F');
INSERT INTO `ey_region` VALUES ('47593', '富里乡', '3', '47530', 'F');
INSERT INTO `ey_region` VALUES ('47594', '光复乡', '3', '47530', 'G');
INSERT INTO `ey_region` VALUES ('47595', '花莲市', '3', '47530', 'H');
INSERT INTO `ey_region` VALUES ('47596', '吉安乡', '3', '47530', 'J');
INSERT INTO `ey_region` VALUES ('47597', '瑞穗乡', '3', '47530', 'R');
INSERT INTO `ey_region` VALUES ('47598', '寿丰乡', '3', '47530', 'S');
INSERT INTO `ey_region` VALUES ('47599', '太鲁阁', '3', '47530', 'T');
INSERT INTO `ey_region` VALUES ('47600', '万荣乡', '3', '47530', 'W');
INSERT INTO `ey_region` VALUES ('47601', '新城乡', '3', '47530', 'X');
INSERT INTO `ey_region` VALUES ('47602', '秀林乡', '3', '47530', 'X');
INSERT INTO `ey_region` VALUES ('47603', '玉里镇', '3', '47530', 'Y');
INSERT INTO `ey_region` VALUES ('47604', '卓溪乡', '3', '47530', 'Z');
INSERT INTO `ey_region` VALUES ('47605', '安乐区', '3', '47531', 'A');
INSERT INTO `ey_region` VALUES ('47606', '暖暖区', '3', '47531', 'N');
INSERT INTO `ey_region` VALUES ('47607', '七堵区', '3', '47531', 'Q');
INSERT INTO `ey_region` VALUES ('47608', '其它区', '3', '47531', 'Q');
INSERT INTO `ey_region` VALUES ('47609', '仁爱区', '3', '47531', 'R');
INSERT INTO `ey_region` VALUES ('47610', '信义区', '3', '47531', 'X');
INSERT INTO `ey_region` VALUES ('47611', '中山区', '3', '47531', 'Z');
INSERT INTO `ey_region` VALUES ('47612', '中正区', '3', '47531', 'Z');
INSERT INTO `ey_region` VALUES ('47613', '东区', '3', '47532', 'D');
INSERT INTO `ey_region` VALUES ('47614', '西区', '3', '47532', 'X');
INSERT INTO `ey_region` VALUES ('47615', '其它区', '3', '47532', 'Q');
INSERT INTO `ey_region` VALUES ('47616', '阿里山乡', '3', '47533', 'A');
INSERT INTO `ey_region` VALUES ('47617', '布袋镇', '3', '47533', 'B');
INSERT INTO `ey_region` VALUES ('47618', '大林镇', '3', '47533', 'D');
INSERT INTO `ey_region` VALUES ('47619', '大埔乡', '3', '47533', 'D');
INSERT INTO `ey_region` VALUES ('47620', '东石乡', '3', '47533', 'D');
INSERT INTO `ey_region` VALUES ('47621', '番路乡', '3', '47533', 'F');
INSERT INTO `ey_region` VALUES ('47622', '六脚乡', '3', '47533', 'L');
INSERT INTO `ey_region` VALUES ('47623', '鹿草乡', '3', '47533', 'L');
INSERT INTO `ey_region` VALUES ('47624', '梅山乡', '3', '47533', 'M');
INSERT INTO `ey_region` VALUES ('47625', '民雄乡', '3', '47533', 'M');
INSERT INTO `ey_region` VALUES ('47626', '朴子市', '3', '47533', 'P');
INSERT INTO `ey_region` VALUES ('47627', '水上乡', '3', '47533', 'S');
INSERT INTO `ey_region` VALUES ('47628', '太保市', '3', '47533', 'T');
INSERT INTO `ey_region` VALUES ('47629', '溪口乡', '3', '47533', 'X');
INSERT INTO `ey_region` VALUES ('47630', '新港乡', '3', '47533', 'X');
INSERT INTO `ey_region` VALUES ('47631', '义竹乡', '3', '47533', 'Y');
INSERT INTO `ey_region` VALUES ('47632', '中埔乡', '3', '47533', 'Z');
INSERT INTO `ey_region` VALUES ('47633', '竹崎乡', '3', '47533', 'Z');
INSERT INTO `ey_region` VALUES ('47634', '金城镇', '3', '47534', 'J');
INSERT INTO `ey_region` VALUES ('47635', '金湖镇', '3', '47534', 'J');
INSERT INTO `ey_region` VALUES ('47636', '金宁乡', '3', '47534', 'J');
INSERT INTO `ey_region` VALUES ('47637', '金沙镇', '3', '47534', 'J');
INSERT INTO `ey_region` VALUES ('47638', '烈屿乡', '3', '47534', 'L');
INSERT INTO `ey_region` VALUES ('47639', '乌邱乡', '3', '47534', 'W');
INSERT INTO `ey_region` VALUES ('47640', '北竿乡', '3', '47535', 'B');
INSERT INTO `ey_region` VALUES ('47641', '东引乡', '3', '47535', 'D');
INSERT INTO `ey_region` VALUES ('47642', '莒光乡', '3', '47535', 'J');
INSERT INTO `ey_region` VALUES ('47643', '南竿乡', '3', '47535', 'N');
INSERT INTO `ey_region` VALUES ('47644', '大湖乡', '3', '47536', 'D');
INSERT INTO `ey_region` VALUES ('47645', '公馆乡', '3', '47536', 'G');
INSERT INTO `ey_region` VALUES ('47646', '后龙镇', '3', '47536', 'H');
INSERT INTO `ey_region` VALUES ('47647', '苗栗市', '3', '47536', 'M');
INSERT INTO `ey_region` VALUES ('47648', '南庄乡', '3', '47536', 'N');
INSERT INTO `ey_region` VALUES ('47649', '三湾乡', '3', '47536', 'S');
INSERT INTO `ey_region` VALUES ('47650', '三义乡', '3', '47536', 'S');
INSERT INTO `ey_region` VALUES ('47651', '狮潭乡', '3', '47536', 'S');
INSERT INTO `ey_region` VALUES ('47652', '泰安乡', '3', '47536', 'T');
INSERT INTO `ey_region` VALUES ('47653', '铜锣乡', '3', '47536', 'T');
INSERT INTO `ey_region` VALUES ('47654', '通宵镇', '3', '47536', 'T');
INSERT INTO `ey_region` VALUES ('47655', '头份镇', '3', '47536', 'T');
INSERT INTO `ey_region` VALUES ('47656', '头屋乡', '3', '47536', 'T');
INSERT INTO `ey_region` VALUES ('47657', '西湖乡', '3', '47536', 'X');
INSERT INTO `ey_region` VALUES ('47658', '苑里镇', '3', '47536', 'Y');
INSERT INTO `ey_region` VALUES ('47659', '造桥乡', '3', '47536', 'Z');
INSERT INTO `ey_region` VALUES ('47660', '竹南镇', '3', '47536', 'Z');
INSERT INTO `ey_region` VALUES ('47661', '卓兰镇', '3', '47536', 'Z');
INSERT INTO `ey_region` VALUES ('47662', '草屯镇', '3', '47537', 'C');
INSERT INTO `ey_region` VALUES ('47663', '国姓乡', '3', '47537', 'G');
INSERT INTO `ey_region` VALUES ('47664', '集集镇', '3', '47537', 'J');
INSERT INTO `ey_region` VALUES ('47665', '鹿谷乡', '3', '47537', 'L');
INSERT INTO `ey_region` VALUES ('47666', '名间乡', '3', '47537', 'M');
INSERT INTO `ey_region` VALUES ('47667', '南投市', '3', '47537', 'N');
INSERT INTO `ey_region` VALUES ('47668', '埔里镇', '3', '47537', 'P');
INSERT INTO `ey_region` VALUES ('47669', '仁爱乡', '3', '47537', 'R');
INSERT INTO `ey_region` VALUES ('47670', '水里乡', '3', '47537', 'S');
INSERT INTO `ey_region` VALUES ('47671', '信义乡', '3', '47537', 'X');
INSERT INTO `ey_region` VALUES ('47672', '鱼池乡', '3', '47537', 'Y');
INSERT INTO `ey_region` VALUES ('47673', '中寮乡', '3', '47537', 'Z');
INSERT INTO `ey_region` VALUES ('47674', '竹山镇', '3', '47537', 'Z');
INSERT INTO `ey_region` VALUES ('47675', '白沙乡', '3', '47538', 'B');
INSERT INTO `ey_region` VALUES ('47676', '湖西乡', '3', '47538', 'H');
INSERT INTO `ey_region` VALUES ('47677', '马公市', '3', '47538', 'M');
INSERT INTO `ey_region` VALUES ('47678', '七美乡', '3', '47538', 'Q');
INSERT INTO `ey_region` VALUES ('47679', '望安乡', '3', '47538', 'W');
INSERT INTO `ey_region` VALUES ('47680', '西屿乡', '3', '47538', 'X');
INSERT INTO `ey_region` VALUES ('47681', '长治乡', '3', '47539', 'C');
INSERT INTO `ey_region` VALUES ('47682', '潮州镇', '3', '47539', 'C');
INSERT INTO `ey_region` VALUES ('47683', '车城乡', '3', '47539', 'C');
INSERT INTO `ey_region` VALUES ('47684', '春日乡', '3', '47539', 'C');
INSERT INTO `ey_region` VALUES ('47685', '东港镇', '3', '47539', 'D');
INSERT INTO `ey_region` VALUES ('47686', '枋寮乡', '3', '47539', 'F');
INSERT INTO `ey_region` VALUES ('47687', '枋山乡', '3', '47539', 'F');
INSERT INTO `ey_region` VALUES ('47688', '高树乡', '3', '47539', 'G');
INSERT INTO `ey_region` VALUES ('47689', '恒春镇', '3', '47539', 'H');
INSERT INTO `ey_region` VALUES ('47690', '佳冬乡', '3', '47539', 'J');
INSERT INTO `ey_region` VALUES ('47691', '九如乡', '3', '47539', 'J');
INSERT INTO `ey_region` VALUES ('47692', '崁顶乡', '3', '47539', 'K');
INSERT INTO `ey_region` VALUES ('47693', '来义乡', '3', '47539', 'L');
INSERT INTO `ey_region` VALUES ('47694', '里港乡', '3', '47539', 'L');
INSERT INTO `ey_region` VALUES ('47695', '林边乡', '3', '47539', 'L');
INSERT INTO `ey_region` VALUES ('47696', '麟洛乡', '3', '47539', 'L');
INSERT INTO `ey_region` VALUES ('47697', '琉球乡', '3', '47539', 'L');
INSERT INTO `ey_region` VALUES ('47698', '玛家乡', '3', '47539', 'M');
INSERT INTO `ey_region` VALUES ('47699', '满州乡', '3', '47539', 'M');
INSERT INTO `ey_region` VALUES ('47700', '牡丹乡', '3', '47539', 'M');
INSERT INTO `ey_region` VALUES ('47701', '南州乡', '3', '47539', 'N');
INSERT INTO `ey_region` VALUES ('47702', '内埔乡', '3', '47539', 'N');
INSERT INTO `ey_region` VALUES ('47703', '屏东市', '3', '47539', 'P');
INSERT INTO `ey_region` VALUES ('47704', '三地门乡', '3', '47539', 'S');
INSERT INTO `ey_region` VALUES ('47705', '狮子乡', '3', '47539', 'S');
INSERT INTO `ey_region` VALUES ('47706', '泰武乡', '3', '47539', 'T');
INSERT INTO `ey_region` VALUES ('47707', '万丹乡', '3', '47539', 'W');
INSERT INTO `ey_region` VALUES ('47708', '万峦乡', '3', '47539', 'W');
INSERT INTO `ey_region` VALUES ('47709', '雾台乡', '3', '47539', 'W');
INSERT INTO `ey_region` VALUES ('47710', '新埤乡', '3', '47539', 'X');
INSERT INTO `ey_region` VALUES ('47711', '新园乡', '3', '47539', 'X');
INSERT INTO `ey_region` VALUES ('47712', '盐埔乡', '3', '47539', 'Y');
INSERT INTO `ey_region` VALUES ('47713', '竹田乡', '3', '47539', 'Z');
INSERT INTO `ey_region` VALUES ('47714', '北投区', '3', '47540', 'B');
INSERT INTO `ey_region` VALUES ('47715', '大安区', '3', '47540', 'D');
INSERT INTO `ey_region` VALUES ('47716', '大同区', '3', '47540', 'D');
INSERT INTO `ey_region` VALUES ('47717', '南港区', '3', '47540', 'N');
INSERT INTO `ey_region` VALUES ('47718', '内湖区', '3', '47540', 'N');
INSERT INTO `ey_region` VALUES ('47719', '士林区', '3', '47540', 'S');
INSERT INTO `ey_region` VALUES ('47720', '松山区', '3', '47540', 'S');
INSERT INTO `ey_region` VALUES ('47721', '万华区', '3', '47540', 'W');
INSERT INTO `ey_region` VALUES ('47722', '文山区', '3', '47540', 'W');
INSERT INTO `ey_region` VALUES ('47723', '信义区', '3', '47540', 'X');
INSERT INTO `ey_region` VALUES ('47724', '中山区', '3', '47540', 'Z');
INSERT INTO `ey_region` VALUES ('47725', '中正区', '3', '47540', 'Z');
INSERT INTO `ey_region` VALUES ('47726', '其它区', '3', '47540', 'Q');
INSERT INTO `ey_region` VALUES ('47727', '卑南乡', '3', '47541', 'B');
INSERT INTO `ey_region` VALUES ('47728', '长滨乡', '3', '47541', 'C');
INSERT INTO `ey_region` VALUES ('47729', '成功镇', '3', '47541', 'C');
INSERT INTO `ey_region` VALUES ('47730', '池上乡', '3', '47541', 'C');
INSERT INTO `ey_region` VALUES ('47731', '达仁乡', '3', '47541', 'D');
INSERT INTO `ey_region` VALUES ('47732', '大武乡', '3', '47541', 'D');
INSERT INTO `ey_region` VALUES ('47733', '东河乡', '3', '47541', 'D');
INSERT INTO `ey_region` VALUES ('47734', '关山镇', '3', '47541', 'G');
INSERT INTO `ey_region` VALUES ('47735', '海端乡', '3', '47541', 'H');
INSERT INTO `ey_region` VALUES ('47736', '金峰乡', '3', '47541', 'J');
INSERT INTO `ey_region` VALUES ('47737', '兰屿乡', '3', '47541', 'L');
INSERT INTO `ey_region` VALUES ('47738', '鹿野乡', '3', '47541', 'L');
INSERT INTO `ey_region` VALUES ('47739', '绿岛乡', '3', '47541', 'L');
INSERT INTO `ey_region` VALUES ('47740', '台东市', '3', '47541', 'T');
INSERT INTO `ey_region` VALUES ('47741', '太麻里乡', '3', '47541', 'T');
INSERT INTO `ey_region` VALUES ('47742', '延平乡', '3', '47541', 'Y');
INSERT INTO `ey_region` VALUES ('47743', '中西区', '3', '47542', 'Z');
INSERT INTO `ey_region` VALUES ('47744', '东区', '3', '47542', 'D');
INSERT INTO `ey_region` VALUES ('47745', '南区', '3', '47542', 'N');
INSERT INTO `ey_region` VALUES ('47746', '北区', '3', '47542', 'B');
INSERT INTO `ey_region` VALUES ('47747', '安平区', '3', '47542', 'A');
INSERT INTO `ey_region` VALUES ('47748', '安南区', '3', '47542', 'A');
INSERT INTO `ey_region` VALUES ('47749', '其它区', '3', '47542', 'Q');
INSERT INTO `ey_region` VALUES ('47750', '永康区', '3', '47542', 'Y');
INSERT INTO `ey_region` VALUES ('47751', '归仁区', '3', '47542', 'G');
INSERT INTO `ey_region` VALUES ('47752', '新化区', '3', '47542', 'X');
INSERT INTO `ey_region` VALUES ('47753', '左镇区', '3', '47542', 'Z');
INSERT INTO `ey_region` VALUES ('47754', '玉井区', '3', '47542', 'Y');
INSERT INTO `ey_region` VALUES ('47755', '楠西区', '3', '47542', 'N');
INSERT INTO `ey_region` VALUES ('47756', '南化区', '3', '47542', 'N');
INSERT INTO `ey_region` VALUES ('47757', '仁德区', '3', '47542', 'R');
INSERT INTO `ey_region` VALUES ('47758', '关庙区', '3', '47542', 'G');
INSERT INTO `ey_region` VALUES ('47759', '龙崎区', '3', '47542', 'L');
INSERT INTO `ey_region` VALUES ('47760', '官田区', '3', '47542', 'G');
INSERT INTO `ey_region` VALUES ('47761', '麻豆区', '3', '47542', 'M');
INSERT INTO `ey_region` VALUES ('47762', '佳里区', '3', '47542', 'J');
INSERT INTO `ey_region` VALUES ('47763', '西港区', '3', '47542', 'X');
INSERT INTO `ey_region` VALUES ('47764', '七股区', '3', '47542', 'Q');
INSERT INTO `ey_region` VALUES ('47765', '将军区', '3', '47542', 'J');
INSERT INTO `ey_region` VALUES ('47766', '学甲区', '3', '47542', 'X');
INSERT INTO `ey_region` VALUES ('47767', '北门区', '3', '47542', 'B');
INSERT INTO `ey_region` VALUES ('47768', '新营区', '3', '47542', 'X');
INSERT INTO `ey_region` VALUES ('47769', '后壁区', '3', '47542', 'H');
INSERT INTO `ey_region` VALUES ('47770', '白河区', '3', '47542', 'B');
INSERT INTO `ey_region` VALUES ('47771', '东山区', '3', '47542', 'D');
INSERT INTO `ey_region` VALUES ('47772', '六甲区', '3', '47542', 'L');
INSERT INTO `ey_region` VALUES ('47773', '下营区', '3', '47542', 'X');
INSERT INTO `ey_region` VALUES ('47774', '柳营区', '3', '47542', 'L');
INSERT INTO `ey_region` VALUES ('47775', '盐水区', '3', '47542', 'Y');
INSERT INTO `ey_region` VALUES ('47776', '善化区', '3', '47542', 'S');
INSERT INTO `ey_region` VALUES ('47777', '大内区', '3', '47542', 'D');
INSERT INTO `ey_region` VALUES ('47778', '山上区', '3', '47542', 'S');
INSERT INTO `ey_region` VALUES ('47779', '新市区', '3', '47542', 'X');
INSERT INTO `ey_region` VALUES ('47780', '安定区', '3', '47542', 'A');
INSERT INTO `ey_region` VALUES ('47781', '中区', '3', '47543', 'Z');
INSERT INTO `ey_region` VALUES ('47782', '东区', '3', '47543', 'D');
INSERT INTO `ey_region` VALUES ('47783', '南区', '3', '47543', 'N');
INSERT INTO `ey_region` VALUES ('47784', '西区', '3', '47543', 'X');
INSERT INTO `ey_region` VALUES ('47785', '北区', '3', '47543', 'B');
INSERT INTO `ey_region` VALUES ('47786', '北屯区', '3', '47543', 'B');
INSERT INTO `ey_region` VALUES ('47787', '西屯区', '3', '47543', 'X');
INSERT INTO `ey_region` VALUES ('47788', '南屯区', '3', '47543', 'N');
INSERT INTO `ey_region` VALUES ('47789', '其它区', '3', '47543', 'Q');
INSERT INTO `ey_region` VALUES ('47790', '太平区', '3', '47543', 'T');
INSERT INTO `ey_region` VALUES ('47791', '大里区', '3', '47543', 'D');
INSERT INTO `ey_region` VALUES ('47792', '雾峰区', '3', '47543', 'W');
INSERT INTO `ey_region` VALUES ('47793', '乌日区', '3', '47543', 'W');
INSERT INTO `ey_region` VALUES ('47794', '丰原区', '3', '47543', 'F');
INSERT INTO `ey_region` VALUES ('47795', '后里区', '3', '47543', 'H');
INSERT INTO `ey_region` VALUES ('47796', '石冈区', '3', '47543', 'S');
INSERT INTO `ey_region` VALUES ('47797', '东势区', '3', '47543', 'D');
INSERT INTO `ey_region` VALUES ('47798', '和平区', '3', '47543', 'H');
INSERT INTO `ey_region` VALUES ('47799', '新社区', '3', '47543', 'X');
INSERT INTO `ey_region` VALUES ('47800', '潭子区', '3', '47543', 'T');
INSERT INTO `ey_region` VALUES ('47801', '大雅区', '3', '47543', 'D');
INSERT INTO `ey_region` VALUES ('47802', '神冈区', '3', '47543', 'S');
INSERT INTO `ey_region` VALUES ('47803', '大肚区', '3', '47543', 'D');
INSERT INTO `ey_region` VALUES ('47804', '沙鹿区', '3', '47543', 'S');
INSERT INTO `ey_region` VALUES ('47805', '龙井区', '3', '47543', 'L');
INSERT INTO `ey_region` VALUES ('47806', '梧栖区', '3', '47543', 'W');
INSERT INTO `ey_region` VALUES ('47807', '清水区', '3', '47543', 'Q');
INSERT INTO `ey_region` VALUES ('47808', '大甲区', '3', '47543', 'D');
INSERT INTO `ey_region` VALUES ('47809', '外埔区', '3', '47543', 'W');
INSERT INTO `ey_region` VALUES ('47810', '大安区', '3', '47543', 'D');
INSERT INTO `ey_region` VALUES ('47811', '中坜区', '3', '47544', 'Z');
INSERT INTO `ey_region` VALUES ('47812', '平镇区', '3', '47544', 'P');
INSERT INTO `ey_region` VALUES ('47813', '龙潭区', '3', '47544', 'L');
INSERT INTO `ey_region` VALUES ('47814', '杨梅区', '3', '47544', 'Y');
INSERT INTO `ey_region` VALUES ('47815', '新屋区', '3', '47544', 'X');
INSERT INTO `ey_region` VALUES ('47816', '观音区', '3', '47544', 'G');
INSERT INTO `ey_region` VALUES ('47817', '桃园区', '3', '47544', 'T');
INSERT INTO `ey_region` VALUES ('47818', '龟山区', '3', '47544', 'G');
INSERT INTO `ey_region` VALUES ('47819', '八德区', '3', '47544', 'B');
INSERT INTO `ey_region` VALUES ('47820', '大溪区', '3', '47544', 'D');
INSERT INTO `ey_region` VALUES ('47821', '复兴区', '3', '47544', 'F');
INSERT INTO `ey_region` VALUES ('47822', '大园区', '3', '47544', 'D');
INSERT INTO `ey_region` VALUES ('47823', '芦竹区', '3', '47544', 'L');
INSERT INTO `ey_region` VALUES ('47824', '万里区', '3', '47545', 'W');
INSERT INTO `ey_region` VALUES ('47825', '金山区', '3', '47545', 'J');
INSERT INTO `ey_region` VALUES ('47826', '板桥区', '3', '47545', 'B');
INSERT INTO `ey_region` VALUES ('47827', '汐止区', '3', '47545', 'X');
INSERT INTO `ey_region` VALUES ('47828', '深坑区', '3', '47545', 'S');
INSERT INTO `ey_region` VALUES ('47829', '石碇区', '3', '47545', 'S');
INSERT INTO `ey_region` VALUES ('47830', '瑞芳区', '3', '47545', 'R');
INSERT INTO `ey_region` VALUES ('47831', '平溪区', '3', '47545', 'P');
INSERT INTO `ey_region` VALUES ('47832', '双溪区', '3', '47545', 'S');
INSERT INTO `ey_region` VALUES ('47833', '贡寮区', '3', '47545', 'G');
INSERT INTO `ey_region` VALUES ('47834', '新店区', '3', '47545', 'X');
INSERT INTO `ey_region` VALUES ('47835', '坪林区', '3', '47545', 'P');
INSERT INTO `ey_region` VALUES ('47836', '乌来区', '3', '47545', 'W');
INSERT INTO `ey_region` VALUES ('47837', '永和区', '3', '47545', 'Y');
INSERT INTO `ey_region` VALUES ('47838', '中和区', '3', '47545', 'Z');
INSERT INTO `ey_region` VALUES ('47839', '土城区', '3', '47545', 'T');
INSERT INTO `ey_region` VALUES ('47840', '三峡区', '3', '47545', 'S');
INSERT INTO `ey_region` VALUES ('47841', '树林区', '3', '47545', 'S');
INSERT INTO `ey_region` VALUES ('47842', '莺歌区', '3', '47545', 'Y');
INSERT INTO `ey_region` VALUES ('47843', '三重区', '3', '47545', 'S');
INSERT INTO `ey_region` VALUES ('47844', '新庄区', '3', '47545', 'X');
INSERT INTO `ey_region` VALUES ('47845', '泰山区', '3', '47545', 'T');
INSERT INTO `ey_region` VALUES ('47846', '林口区', '3', '47545', 'L');
INSERT INTO `ey_region` VALUES ('47847', '芦洲区', '3', '47545', 'L');
INSERT INTO `ey_region` VALUES ('47848', '五股区', '3', '47545', 'W');
INSERT INTO `ey_region` VALUES ('47849', '八里区', '3', '47545', 'B');
INSERT INTO `ey_region` VALUES ('47850', '淡水区', '3', '47545', 'D');
INSERT INTO `ey_region` VALUES ('47851', '三芝区', '3', '47545', 'S');
INSERT INTO `ey_region` VALUES ('47852', '石门区', '3', '47545', 'S');
INSERT INTO `ey_region` VALUES ('47853', '东区', '3', '47546', 'D');
INSERT INTO `ey_region` VALUES ('47854', '北区', '3', '47546', 'B');
INSERT INTO `ey_region` VALUES ('47855', '香山区', '3', '47546', 'X');
INSERT INTO `ey_region` VALUES ('47856', '其它区', '3', '47546', 'Q');
INSERT INTO `ey_region` VALUES ('47857', '竹北市', '3', '47547', 'Z');
INSERT INTO `ey_region` VALUES ('47858', '湖口乡', '3', '47547', 'H');
INSERT INTO `ey_region` VALUES ('47859', '新丰乡', '3', '47547', 'X');
INSERT INTO `ey_region` VALUES ('47860', '新埔镇', '3', '47547', 'X');
INSERT INTO `ey_region` VALUES ('47861', '关西镇', '3', '47547', 'G');
INSERT INTO `ey_region` VALUES ('47862', '芎林乡', '3', '47547', 'X');
INSERT INTO `ey_region` VALUES ('47863', '宝山乡', '3', '47547', 'B');
INSERT INTO `ey_region` VALUES ('47864', '竹东镇', '3', '47547', 'Z');
INSERT INTO `ey_region` VALUES ('47865', '五峰乡', '3', '47547', 'W');
INSERT INTO `ey_region` VALUES ('47866', '横山乡', '3', '47547', 'H');
INSERT INTO `ey_region` VALUES ('47867', '尖石乡', '3', '47547', 'J');
INSERT INTO `ey_region` VALUES ('47868', '北埔乡', '3', '47547', 'B');
INSERT INTO `ey_region` VALUES ('47869', '峨眉乡', '3', '47547', 'E');
INSERT INTO `ey_region` VALUES ('47870', '宜兰市', '3', '47548', 'Y');
INSERT INTO `ey_region` VALUES ('47871', '头城镇', '3', '47548', 'T');
INSERT INTO `ey_region` VALUES ('47872', '礁溪乡', '3', '47548', 'J');
INSERT INTO `ey_region` VALUES ('47873', '壮围乡', '3', '47548', 'Z');
INSERT INTO `ey_region` VALUES ('47874', '员山乡', '3', '47548', 'Y');
INSERT INTO `ey_region` VALUES ('47875', '罗东镇', '3', '47548', 'L');
INSERT INTO `ey_region` VALUES ('47876', '三星乡', '3', '47548', 'S');
INSERT INTO `ey_region` VALUES ('47877', '大同乡', '3', '47548', 'D');
INSERT INTO `ey_region` VALUES ('47878', '五结乡', '3', '47548', 'W');
INSERT INTO `ey_region` VALUES ('47879', '冬山乡', '3', '47548', 'D');
INSERT INTO `ey_region` VALUES ('47880', '苏澳镇', '3', '47548', 'S');
INSERT INTO `ey_region` VALUES ('47881', '南澳乡', '3', '47548', 'N');
INSERT INTO `ey_region` VALUES ('47882', '钓鱼台', '3', '47548', 'D');
INSERT INTO `ey_region` VALUES ('47883', '斗南镇', '3', '47549', 'D');
INSERT INTO `ey_region` VALUES ('47884', '大埤乡', '3', '47549', 'D');
INSERT INTO `ey_region` VALUES ('47885', '虎尾镇', '3', '47549', 'H');
INSERT INTO `ey_region` VALUES ('47886', '土库镇', '3', '47549', 'T');
INSERT INTO `ey_region` VALUES ('47887', '褒忠乡', '3', '47549', 'B');
INSERT INTO `ey_region` VALUES ('47888', '东势乡', '3', '47549', 'D');
INSERT INTO `ey_region` VALUES ('47889', '台西乡', '3', '47549', 'T');
INSERT INTO `ey_region` VALUES ('47890', '仑背乡', '3', '47549', 'L');
INSERT INTO `ey_region` VALUES ('47891', '麦寮乡', '3', '47549', 'M');
INSERT INTO `ey_region` VALUES ('47892', '斗六市', '3', '47549', 'D');
INSERT INTO `ey_region` VALUES ('47893', '林内乡', '3', '47549', 'L');
INSERT INTO `ey_region` VALUES ('47894', '古坑乡', '3', '47549', 'G');
INSERT INTO `ey_region` VALUES ('47895', '莿桐乡', '3', '47549', 'C');
INSERT INTO `ey_region` VALUES ('47896', '西螺镇', '3', '47549', 'X');
INSERT INTO `ey_region` VALUES ('47897', '二仑乡', '3', '47549', 'E');
INSERT INTO `ey_region` VALUES ('47898', '北港镇', '3', '47549', 'B');
INSERT INTO `ey_region` VALUES ('47899', '水林乡', '3', '47549', 'S');
INSERT INTO `ey_region` VALUES ('47900', '口湖乡', '3', '47549', 'K');
INSERT INTO `ey_region` VALUES ('47901', '四湖乡', '3', '47549', 'S');
INSERT INTO `ey_region` VALUES ('47902', '元长乡', '3', '47549', 'Y');
INSERT INTO `ey_region` VALUES ('47903', '彰化市', '3', '47550', 'Z');
INSERT INTO `ey_region` VALUES ('47904', '芬园乡', '3', '47550', 'F');
INSERT INTO `ey_region` VALUES ('47905', '花坛乡', '3', '47550', 'H');
INSERT INTO `ey_region` VALUES ('47906', '秀水乡', '3', '47550', 'X');
INSERT INTO `ey_region` VALUES ('47907', '鹿港镇', '3', '47550', 'L');
INSERT INTO `ey_region` VALUES ('47908', '福兴乡', '3', '47550', 'F');
INSERT INTO `ey_region` VALUES ('47909', '线西乡', '3', '47550', 'X');
INSERT INTO `ey_region` VALUES ('47910', '和美镇', '3', '47550', 'H');
INSERT INTO `ey_region` VALUES ('47911', '伸港乡', '3', '47550', 'S');
INSERT INTO `ey_region` VALUES ('47912', '员林镇', '3', '47550', 'Y');
INSERT INTO `ey_region` VALUES ('47913', '社头乡', '3', '47550', 'S');
INSERT INTO `ey_region` VALUES ('47914', '永靖乡', '3', '47550', 'Y');
INSERT INTO `ey_region` VALUES ('47915', '埔心乡', '3', '47550', 'P');
INSERT INTO `ey_region` VALUES ('47916', '溪湖镇', '3', '47550', 'X');
INSERT INTO `ey_region` VALUES ('47917', '大村乡', '3', '47550', 'D');
INSERT INTO `ey_region` VALUES ('47918', '埔盐乡', '3', '47550', 'P');
INSERT INTO `ey_region` VALUES ('47919', '田中镇', '3', '47550', 'T');
INSERT INTO `ey_region` VALUES ('47920', '北斗镇', '3', '47550', 'B');
INSERT INTO `ey_region` VALUES ('47921', '田尾乡', '3', '47550', 'T');
INSERT INTO `ey_region` VALUES ('47922', '埤头乡', '3', '47550', 'P');
INSERT INTO `ey_region` VALUES ('47923', '溪州乡', '3', '47550', 'X');
INSERT INTO `ey_region` VALUES ('47924', '竹塘乡', '3', '47550', 'Z');
INSERT INTO `ey_region` VALUES ('47925', '二林镇', '3', '47550', 'E');
INSERT INTO `ey_region` VALUES ('47926', '大城乡', '3', '47550', 'D');
INSERT INTO `ey_region` VALUES ('47927', '芳苑乡', '3', '47550', 'F');
INSERT INTO `ey_region` VALUES ('47928', '二水乡', '3', '47550', 'E');

-- -----------------------------
-- Table structure for `ey_search_word`
-- -----------------------------
DROP TABLE IF EXISTS `ey_search_word`;
CREATE TABLE `ey_search_word` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `word` varchar(50) DEFAULT '' COMMENT '关键词',
  `searchNum` int(10) DEFAULT '1' COMMENT '搜索次数',
  `sort_order` int(10) DEFAULT '0' COMMENT '排序号',
  `lang` varchar(30) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索词统计表';


-- -----------------------------
-- Table structure for `ey_shop_address`
-- -----------------------------
DROP TABLE IF EXISTS `ey_shop_address`;
CREATE TABLE `ey_shop_address` (
  `addr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '地址id',
  `users_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `consignee` varchar(60) NOT NULL DEFAULT '' COMMENT '收货人',
  `country` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '国家',
  `province` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '省份',
  `city` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '城市',
  `district` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '县区',
  `address` varchar(500) NOT NULL DEFAULT '' COMMENT '详细地址',
  `zipcode` varchar(10) NOT NULL DEFAULT '' COMMENT '邮政编码',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '是否默认，0否，1是。',
  `lang` varchar(30) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`addr_id`),
  KEY `users_id` (`users_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='收货地址表';


-- -----------------------------
-- Table structure for `ey_shop_cart`
-- -----------------------------
DROP TABLE IF EXISTS `ey_shop_cart`;
CREATE TABLE `ey_shop_cart` (
  `cart_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '购物车表',
  `users_id` int(10) unsigned DEFAULT '0' COMMENT '会员id',
  `product_id` int(10) unsigned DEFAULT '0' COMMENT '产品id',
  `product_num` int(10) unsigned DEFAULT '0' COMMENT '购买数量',
  `spec_value_id` varchar(100) DEFAULT '' COMMENT '规格值ID',
  `selected` tinyint(1) DEFAULT '1' COMMENT '购物车选中状态：0未选中，1选中',
  `lang` varchar(30) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '加入购物车的时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`cart_id`),
  KEY `users_id` (`users_id`,`product_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车表';


-- -----------------------------
-- Table structure for `ey_shop_express`
-- -----------------------------
DROP TABLE IF EXISTS `ey_shop_express`;
CREATE TABLE `ey_shop_express` (
  `express_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `express_code` varchar(32) NOT NULL DEFAULT '' COMMENT '物流code',
  `express_name` varchar(32) NOT NULL DEFAULT '' COMMENT '物流名称',
  `express_lnitials` varchar(5) DEFAULT '' COMMENT '首字母',
  `sort_order` int(10) DEFAULT '0' COMMENT '排序号',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) unsigned DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`express_id`)
) ENGINE=MyISAM AUTO_INCREMENT=596 DEFAULT CHARSET=utf8 COMMENT='快递公司表';

-- -----------------------------
-- Records of `ey_shop_express`
-- -----------------------------
INSERT INTO `ey_shop_express` VALUES ('1', 'yuantong', '圆通快递', 'Y', '97', '1553911076', '1554974797');
INSERT INTO `ey_shop_express` VALUES ('2', 'shentong', '申通快递', 'S', '98', '1553911076', '1554974707');
INSERT INTO `ey_shop_express` VALUES ('3', 'shunfeng', '顺丰快递', 'S', '98', '1553911076', '1554974710');
INSERT INTO `ey_shop_express` VALUES ('4', 'yunda', '韵达快递', 'Y', '99', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('5', 'debangwuliu', '德邦快递', 'D', '99', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('6', 'zhongtong', '中通快递', 'Z', '99', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('7', 'huitongkuaidi', '百世快递', 'B', '99', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('8', 'youzhengguonei', '邮政包裹', 'Y', '99', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('9', 'ems', 'EMS', 'E', '99', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('10', 'youzhengguoji', '邮政国际', 'Y', '99', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('11', 'aolau', 'AOL澳通速递', 'A', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('12', 'a2u', 'A2U速递', 'A', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('13', 'aae', 'AAE快递', 'A', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('14', 'annengwuliu', '安能物流', 'A', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('15', 'anxl', '安迅物流', 'A', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('16', 'auexpress', '澳邮中国快运', 'A', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('17', 'exfresh', '安鲜达', 'A', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('18', 'anjie88', '安捷物流', 'A', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('19', 'adodoxm', '澳多多国际速递', 'A', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('20', 'ariesfar', '艾瑞斯远', 'A', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('21', 'qdants', 'ANTS EXPRESS', 'A', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('22', 'astexpress', '安世通快递', 'A', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('23', 'gda', '安的快递', 'A', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('24', 'ausexpress', '澳世速递', 'A', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('25', 'ibuy8', '爱拜物流', 'A', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('26', 'aplusex', 'Aplus物流', 'A', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('27', 'adapost', '安达速递', 'A', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('28', 'adiexpress', '安达易国际速递', 'A', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('29', 'maxeedexpress', '澳洲迈速快递', 'A', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('30', 'onway', '昂威物流', 'A', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('31', 'bcwelt', 'BCWELT', 'B', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('32', 'balunzhi', '巴伦支快递', 'B', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('33', 'xiaohongmao', '北青小红帽', 'B', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('34', 'bfdf', '百福东方物流', 'B', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('35', 'bangsongwuliu', '邦送物流', 'B', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('36', 'lbbk', '宝凯物流', 'B', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('37', 'bqcwl', '百千诚物流', 'B', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('38', 'idada', '百成大达物流', 'B', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('39', 'baishiwuliu', '百世快运', 'B', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('40', 'baitengwuliu', '百腾物流', 'B', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('41', 'birdex', '笨鸟海淘', 'B', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('42', 'bsht', '百事亨通', 'B', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('43', 'benteng', '奔腾物流', 'B', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('44', 'cuckooexpess', '布谷鸟速递', 'B', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('45', 'bgky100', '邦工快运', 'B', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('46', 'bosind', '堡昕德速递', 'B', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('47', 'banma', '斑马物联网', 'B', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('48', 'polarisexpress', '北极星快运', 'B', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('49', 'beijingfengyue', '北京丰越供应链', 'B', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('50', 'europe8', '败欧洲', 'B', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('51', 'bmlchina', '标杆物流', 'B', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('52', 'comexpress', '邦通国际', 'B', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('53', 'baotongkd', '宝通快递', 'B', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('54', 'beckygo', '佰麒快递', 'B', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('55', 'boyol', '贝业物流', 'B', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('56', 'bdatong', '八达通快递', 'B', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('57', 'bangbangpost', '帮帮发', 'B', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('58', 'baoxianda', '报通快递', 'B', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('59', 'coe', '中国东方(COE)', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('60', 'cloudexpress', 'CE易欧通国际速递', 'C', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('61', 'city100', '城市100', 'C', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('62', 'chuanxiwuliu', '传喜物流', 'C', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('63', 'chengjisudi', '城际速递', 'C', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('64', 'lijisong', '立即送', 'L', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('65', 'chukou1', '出口易', 'C', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('66', 'nanjingshengbang', '晟邦物流', 'C', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('67', 'flyway', '程光快递', 'C', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('68', 'cbo56', '钏博物流', 'C', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('69', 'cex', '城铁速递', 'C', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('70', 'cnup', 'CNUP 中联邮', 'C', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('71', 'clsp', 'CL日中速运', 'C', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('72', 'cnair', 'CNAIR', 'C', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('73', 'cangspeed', '仓鼠快递', 'C', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('74', 'spring56', '春风物流', 'C', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('75', 'cunto', '村通快递', 'C', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('76', 'longvast', '长风物流', 'C', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('77', 'changjiang', '长江国际速递', 'C', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('78', 'cncexp', 'C&C国际速递', 'C', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('79', 'parcelchina', '诚一物流', 'C', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('80', 'chengtong', '城通物流', 'C', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('81', 'otpexpress', '承诺达', 'C', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('82', 'sfpost', '曹操到', 'C', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('83', 'changwooair', '昌宇国际', 'C', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('84', 'dhl', 'DHL快递（中国件）', 'D', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('85', 'dhlen', 'DHL（国际件）', 'D', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('86', 'dhlde', 'DHL（德国件）', 'D', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('87', 'dtwl', '大田物流', 'D', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('88', 'disifang', '递四方', 'D', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('89', 'dayangwuliu', '大洋物流', 'D', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('90', 'dechuangwuliu', '德创物流', 'D', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('91', 'dskd', 'D速物流', 'D', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('92', 'donghanwl', '东瀚物流', 'D', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('93', 'dfpost', '达方物流', 'D', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('94', 'dongjun', '东骏快捷物流', 'D', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('95', 'dindon', '叮咚澳洲转运', 'D', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('96', 'dazhong', '大众佐川急便', 'D', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('97', 'ahdf', '德方物流', 'D', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('98', 'dehaoyi', '德豪驿', 'D', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('99', 'dhlpaket', 'DHL Paket', 'D', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('100', 'ubuy', '德国优拜物流', 'D', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('101', 'adlerlogi', '德国雄鹰速递', 'D', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('102', 'yunexpress', '德国云快递', 'D', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('103', 'di5pll', '递五方云仓', 'D', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('104', 'deguo8elog', '德国八易转运', 'D', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('105', 'camekong', '到了港', 'D', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('106', 'dbstation', 'db-station', 'D', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('107', 'dadaoex', '大道物流', 'D', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('108', 'dekuncn', '德坤物流', 'D', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('109', 'twkd56', '缔惠盛合', 'D', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('110', 'gslexpress', '德尚国际速递', 'D', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('111', 'eucpost', '德国 EUC POST', 'D', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('112', 'est365', '东方汇', 'D', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('113', 'ecotransite', '东西E全运', 'D', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('114', 'euexpress', 'EU-EXPRESS', 'E', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('115', 'emsguoji', 'EMS国际快递查询', 'E', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('116', 'eshunda', '俄顺达', 'E', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('117', 'ewe', 'EWE全球快递', 'E', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('118', 'easyexpress', 'EASYEXPRESS国际速递', 'E', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('119', 'edtexpress', 'e直运', 'E', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('120', 'ecallturn', 'E跨通', 'E', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('121', 'fedex', 'FedEx快递查询', 'F', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('122', 'fedexus', 'FedEx（美国）', 'F', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('123', 'fox', 'FOX国际速递', 'F', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('124', 'rufengda', '如风达快递', 'R', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('125', 'fkd', '飞康达物流', 'F', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('126', 'feibaokuaidi', '飞豹快递', 'F', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('127', 'fandaguoji', '颿达国际', 'F', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('128', 'feiyuanvipshop', '飞远配送', 'F', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('129', 'hnfy', '飞鹰物流', 'F', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('130', 'fengxingtianxia', '风行天下', 'F', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('131', 'flysman', '飞力士物流', 'F', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('132', 'fbkd', '飞邦快递', 'F', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('133', 'sccod', '丰程物流', 'F', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('134', 'crazyexpress', '疯狂快递', 'F', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('135', 'ftlexpress', '法翔速运', 'F', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('136', 'ftd', '富腾达快递', 'F', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('137', 'arkexpress', '方舟国际速递', 'F', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('138', 'fedroad', 'FedRoad 联邦转运', 'F', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('139', 'freakyquick', 'FQ狂派速递', 'F', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('140', 'fecobv', '丰客物流', 'F', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('141', 'fyex', '飞云快递系统', 'F', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('142', 'beebird', '锋鸟物流', 'F', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('143', 'shipgce', '飞洋快递', 'F', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('144', 'koali', '番薯国际货运', 'F', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('145', 'epanex', '泛捷国际速递', 'F', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('146', 'gaticn', 'GATI快递', 'G', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('147', 'gts', 'GTS快递', 'G', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('148', 'guotongkuaidi', '国通快递', 'G', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('149', 'ndkd', '能达速递', 'N', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('150', 'gongsuda', '共速达', 'G', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('151', 'gtongsudi', '广通速递（山东）', 'G', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('152', 'suteng', '速腾物流', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('153', 'gdkd', '港快速递', 'G', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('154', 'hre', '高铁速递', 'G', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('155', 'gscq365', '哥士传奇速递', 'G', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('156', 'gjwl', '冠捷物流', 'G', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('157', 'xdshipping', '国晶物流', 'G', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('158', 'ge2d', 'GE2D跨境物流', 'G', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('159', 'gaotieex', '高铁快运', 'G', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('160', 'gansuandi', '甘肃安的快递', 'G', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('161', 'gdct56', '广东诚通物流', 'G', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('162', 'ghtexpress', 'GHT物流', 'G', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('163', 'goldjet', '高捷快运', 'G', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('164', 'gtgogo', 'GT国际快运', 'G', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('165', 'gxwl', '光线速递', 'G', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('166', 'tdhy', '华宇物流', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('167', 'hl', '恒路物流', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('168', 'hlyex', '好来运快递', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('169', 'hebeijianhua', '河北建华', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('170', 'huaqikuaiyun', '华企快运', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('171', 'haosheng', '昊盛物流', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('172', 'hutongwuliu', '户通物流', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('173', 'hzpl', '华航快递', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('174', 'huangmajia', '黄马甲快递', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('175', 'ucs', '合众速递（UCS）', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('176', 'pfcexpress', '皇家物流', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('177', 'huoban', '伙伴物流', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('178', 'nedahm', '红马速递', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('179', 'huiwen', '汇文配送', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('180', 'nmhuahe', '华赫物流', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('181', 'hjs', '猴急送', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('182', 'hangyu', '航宇快递', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('183', 'huilian', '辉联物流', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('184', 'huanqiu', '环球速运', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('185', 'htwd', '华通务达物流', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('186', 'hipito', '海派通', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('187', 'hqtd', '环球通达', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('188', 'airgtc', '航空快递', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('189', 'haoyoukuai', '好又快物流', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('190', 'ccd', '河南次晨达', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('191', 'hfwuxi', '和丰同城', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('192', 'higo', '黑狗物流', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('193', 'hyytes', '恒宇运通', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('194', 'hengrui56', '恒瑞物流', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('195', 'hangrui', '上海航瑞货运', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('196', 'ghl', '环创物流', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('197', 'hnqst', '河南全速通', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('198', 'hitaoe', 'Hi淘易快递', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('199', 'hhair56', '华瀚快递', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('200', 'haimibuy', '海米派物流', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('201', 'ht22', '海淘物流', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('202', 'hivewms', '海沧无忧', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('203', 'hnht56', '鸿泰物流', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('204', 'hsgtsd', '海硕高铁速递', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('205', 'hltop', '海联快递', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('206', 'hlkytj', '互联快运', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('207', 'haidaibao', '海带宝转运', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('208', 'flowerkd', '花瓣转运', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('209', 'heimao56', '黑猫速运', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('210', 'logistics', '華信物流WTO', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('211', 'hgy56', '环国运物流', 'H', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('212', 'iparcel', 'i-parcel', 'I', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('213', 'jjwl', '佳吉物流', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('214', 'jywl', '佳怡物流', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('215', 'jymwl', '加运美快递', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('216', 'jxd', '急先达物流', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('217', 'jgsd', '京广速递快件', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('218', 'jykd', '晋越快递', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('219', 'jd', '京东物流', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('220', 'jietekuaidi', '捷特快递', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('221', 'jiuyicn', '久易快递', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('222', 'jiuyescm', '九曳供应链', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('223', 'junfengguoji', '骏丰国际速递', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('224', 'jiajiatong56', '佳家通', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('225', 'jrypex', '吉日优派', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('226', 'jinchengwuliu', '锦程国际物流', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('227', 'jgwl', '景光物流', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('228', 'pzhjst', '急顺通', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('229', 'ruexp', '捷网俄全通', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('230', 'jialidatong', '嘉里大通', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('231', 'jmjss', '金马甲', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('232', 'jiacheng', '佳成快递', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('233', 'jsexpress', '骏绅物流', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('234', 'hrex', '锦程快递', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('235', 'jieanda', '捷安达国际速递', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('236', 'newsway', '家家通快递', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('237', 'mapleexpress', '今枫国际快运', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('238', 'jixiangyouau', '吉祥邮（澳洲）', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('239', 'jjx888', '佳捷翔物流', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('240', 'polarexpress', '极地快递', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('241', 'jiazhoumao', '加州猫速递', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('242', 'juzhongda', '聚中大', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('243', 'jieborne', '捷邦物流', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('244', 'jxfex', '集先锋速递', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('245', 'jiugong', '九宫物流', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('246', 'jiujiuwl', '久久物流', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('247', 'jintongkd', '劲通快递', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('248', 'jcsuda', '嘉诚速达', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('249', 'jingshun', '景顺物流', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('250', 'fastontime', '加拿大联通快运', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('251', 'khzto', '柬埔寨中通', 'J', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('252', 'kjkd', '快捷快递', 'K', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('253', 'kangliwuliu', '康力物流', 'K', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('254', 'kuayue', '跨越速运', 'K', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('255', 'kuaiyouda', '快优达速递', 'K', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('256', 'happylink', '开心快递', 'K', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('257', 'ksudi', '快速递', 'K', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('258', 'kyue', '跨跃国际', 'K', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('259', 'kfwnet', '快服务', 'K', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('260', 'kuai8', '快8速运', 'K', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('261', 'kuaidawuliu', '快达物流', 'K', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('262', 'lianb', '联邦快递（国内）', 'L', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('263', 'lhtwl', '联昊通物流', 'L', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('264', 'lb', '龙邦速递', 'L', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('265', 'lejiedi', '乐捷递', 'L', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('266', 'lanhukuaidi', '蓝弧快递', 'L', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('267', 'ltexp', '乐天速递', 'L', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('268', 'lutong', '鲁通快运', 'L', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('269', 'ledii', '乐递供应链', 'L', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('270', 'lundao', '论道国际物流', 'L', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('271', 'lasy56', '林安物流', 'L', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('272', 'lsexpress', '6LS EXPRESS', 'L', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('273', 'szuem', '联运通物流', 'L', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('274', 'blueskyexpress', '蓝天国际航空快递', 'L', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('275', 'lfexpress', '龙枫国际速递', 'L', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('276', 'gslhkd', '联合快递', 'L', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('277', 'longfx', '龙飞祥快递', 'L', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('278', 'luben', '陆本速递 LUBEN EXPRESS', 'L', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('279', 'unitedex', '联合速运', 'L', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('280', 'lbex', '龙邦物流', 'L', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('281', 'ltparcel', '联通快递', 'L', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('282', 'macroexpressco', 'ME物流', 'M', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('283', 'mh', '民航快递', 'M', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('284', 'meiguokuaidi', '美国快递', 'M', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('285', 'menduimen', '门对门', 'M', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('286', 'mingliangwuliu', '明亮物流', 'M', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('287', 'minbangsudi', '民邦速递', 'M', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('288', 'minshengkuaidi', '闽盛快递', 'M', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('289', 'yundaexus', '美国韵达', 'M', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('290', 'mchy', '木春货运', 'M', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('291', 'meiquick', '美快国际物流', 'M', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('292', 'valueway', '美通快递', 'M', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('293', 'cnmcpl', '马珂博逻', 'M', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('294', 'mailongdy', '迈隆递运', 'M', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('295', 'zsmhwl', '明辉物流', 'M', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('296', 'mosuda', '魔速达', 'M', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('297', 'meibang', '美邦国际快递', 'M', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('298', 'nuoyaao', '偌亚奥国际', 'N', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('299', 'nuoer', '诺尔国际物流', 'N', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('300', 'nell', '尼尔快递', 'N', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('301', 'ndwl', '南方传媒物流', 'N', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('302', 'canhold', '能装能送', 'N', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('303', 'wanjiatong', '宁夏万家通', 'N', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('304', 'nlebv', '欧亚专线', 'O', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('305', 'oborexpress', 'OBOR Express', 'O', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('306', 'pcaexpress', 'PCA Express', 'P', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('307', 'pingandatengfei', '平安达腾飞', 'P', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('308', 'peixingwuliu', '陪行物流', 'P', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('309', 'pengyuanexpress', '鹏远国际速递', 'P', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('310', 'postelbe', 'PostElbe', 'P', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('311', 'papascm', '啪啪供应链', 'P', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('312', 'bazirim', '皮牙子快递', 'P', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('313', 'qfkd', '全峰快递', 'Q', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('314', 'qy', '全一快递', 'Q', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('315', 'qrt', '全日通快递', 'Q', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('316', 'qckd', '全晨快递', 'Q', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('317', 'sevendays', '7天连锁物流', 'Q', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('318', 'qbexpress', '秦邦快运', 'Q', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('319', 'quanxintong', '全信通快递', 'Q', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('320', 'quansutong', '全速通国际快递', 'Q', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('321', 'qinyuan', '秦远物流', 'Q', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('322', 'qichen', '启辰国际物流', 'Q', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('323', 'quansu', '全速快运', 'Q', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('324', 'qzx56', '全之鑫物流', 'Q', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('325', 'qskdyxgs', '千顺快递', 'Q', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('326', 'zqlwl', '青旅物流', 'Q', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('327', 'quanchuan56', '全川物流', 'Q', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('328', 'quantwl', '全通快运', 'Q', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('329', 'yatexpress', '乾坤物流', 'Q', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('330', 'guexp', '全联速运', 'Q', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('331', 'bjqywl', '青云物流', 'Q', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('332', 'signedexpress', '签收快递', 'Q', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('333', 'express7th', '7号速递', 'Q', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('334', 'riyuwuliu', '日昱物流', 'R', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('335', 'rfsd', '瑞丰速递', 'R', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('336', 'rrs', '日日顺物流', 'R', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('337', 'rytsd', '日益通速递', 'R', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('338', 'rrskx', '日日顺快线', 'R', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('339', 'gdrz58', '容智快运', 'R', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('340', 'rrthk', '日日通国际', 'R', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('341', 'homecourier', '如家国际快递', 'R', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('342', 'sewl', '速尔快递', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('343', 'haihongwangsong', '山东海红', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('344', 'sh', '盛辉物流', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('345', 'sfwl', '盛丰物流', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('346', 'shiyunkuaidi', '世运快递', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('347', 'shangda', '上大物流', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('348', 'stsd', '三态速递', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('349', 'saiaodi', '赛澳递', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('350', 'ewl', '申通E物流', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('351', 'shenganwuliu', '圣安物流', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('352', 'sxhongmajia', '山西红马甲', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('353', 'suijiawuliu', '穗佳物流', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('354', 'syjiahuier', '沈阳佳惠尔', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('355', 'shlindao', '上海林道货运', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('356', 'sfift', '十方通物流', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('357', 'shunjiefengda', '顺捷丰达', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('358', 'subida', '速必达物流', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('359', 'stcd', '速通成达物流', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('360', 'stkd', '顺通快递', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('361', 'sendtochina', '速递中国', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('362', 'sihaiet', '四海快递', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('363', 'staky', '首通快运', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('364', 'hnssd56', '顺时达物流', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('365', 'superb', 'Superb Grace', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('366', 'sfjhd', '圣飞捷快递', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('367', 'sofast56', '嗖一下同城快递', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('368', 's2c', 'S2C', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('369', 'chinasqk', 'SQK国际速递', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('370', 'shunshid', '顺士达速运', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('371', 'synship', 'SYNSHIP快递', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('372', 'shandiantu', '闪电兔', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('373', 'sdsy888', '首达速运', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('374', 'sczpds', '速呈宅配', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('375', 'sureline', 'Sureline冠泰', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('376', 'stosolution', '申通国际', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('377', 'sycawl', '狮爱高铁物流', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('378', 'sxexpress', '三象速递', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('379', 'shangqiao56', '商桥物流', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('380', 'shd56', '商海德物流', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('381', 'shenma', '神马快递', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('382', 'sihiexpress', '四海捷运', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('383', 'superoz', '速配鸥翼', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('384', 'fastgoexpress', '速派快递', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('385', 'zjstky', '苏通快运', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('386', 'suning', '苏宁物流', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('387', 'shaoke', '捎客物流', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('388', 'sdto', '速达通跨境物流', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('389', 'sut56', '速通物流', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('390', 'sundarexpress', '顺达快递', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('391', 'sxjdfreight', '顺心捷达', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('392', 'shengtongscm', '盛通快递', 'S', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('393', 'tnt', 'TNT快递', 'T', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('394', 'tt', '天天快递', 'T', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('395', 'tianzong', '天纵物流', 'T', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('396', 'chinatzx', '同舟行物流', 'T', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('397', 'nntengda', '腾达速递', 'T', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('398', 'sd138', '泰国138', 'T', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('399', 'tongdaxing', '通达兴物流', 'T', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('400', 'tlky', '天联快运', 'T', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('401', 'ibenben', '途鲜物流', 'T', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('402', 'krtao', '淘韩国际快递', 'T', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('403', 'lntjs', '特急送', 'T', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('404', 'tny', 'TNY物流', 'T', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('405', 'djy56', '天翔东捷运', 'T', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('406', 'guoeryue', '天天快物流', 'T', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('407', 'tianma', '天马迅达', 'T', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('408', 'surpassgo', '天越物流', 'T', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('409', 'tianxiang', '天翔快递', 'T', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('410', 'tywl99', '天翼物流', 'T', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('411', 'shpost', '同城快寄', 'T', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('412', 'humpline', '驼峰国际', 'T', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('413', 'transrush', 'TransRush', 'T', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('414', 'tstexp', 'TST速运通', 'T', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('415', 'ctoexp', '泰国中通CTO', 'T', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('416', 'thaizto', '泰国中通ZTO', 'T', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('417', 'tswlcloud', '天使物流云', 'T', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('418', 'tzky', '铁中快运', 'T', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('419', 'tcxbthai', 'TCXB国际物流', 'T', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('420', 'taimek', '天美快递', 'T', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('421', 'taoplus', '淘布斯国际物流', 'T', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('422', 'ups', 'UPS快递查询', 'U', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('423', 'yskd', '优速快递', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('424', 'usps', 'USPS美国邮政', 'U', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('425', 'ueq', 'UEQ快递', 'U', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('426', 'uex', 'UEX国际物流', 'U', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('427', 'utaoscm', 'UTAO 优到', 'U', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('428', 'wxwl', '万象物流', 'W', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('429', 'weitepai', '微特派', 'W', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('430', 'wjwl', '万家物流', 'W', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('431', 'wanboex', '万博快递', 'W', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('432', 'wtdchina', '威时沛运', 'W', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('433', 'wzhaunyun', '微转运', 'W', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('434', 'gswtkd', '万通快递', 'W', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('435', 'wandougongzhu', '豌豆物流', 'W', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('436', 'wjkwl', '万家康物流', 'W', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('437', 'vps', '维普恩物流', 'W', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('438', 'wykjt', '51跨境通', 'W', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('439', 'wherexpess', '威盛快递', 'W', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('440', 'weilaimingtian', '未来明天快递', 'W', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('441', 'wdm', '万达美', 'W', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('442', 'wto56kj', '温通物流', 'W', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('443', '56kuaiyun', '五六快运', 'W', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('444', 'wowvip', '沃埃家', 'W', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('445', 'grivertek', '潍鸿', 'W', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('446', 'xbwl', '新邦物流', 'X', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('447', 'xfwl', '信丰物流', 'X', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('448', 'newegg', '新蛋物流', 'X', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('449', 'xianglongyuntong', '祥龙运通物流', 'X', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('450', 'xianchengliansudi', '西安城联速递', 'X', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('451', 'xilaikd', '喜来快递', 'X', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('452', 'xsrd', '鑫世锐达', 'X', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('453', 'xtb', '鑫通宝物流', 'X', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('454', 'xintianjie', '信天捷快递', 'X', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('455', 'xaetc', '西安胜峰', 'X', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('456', 'xianfeng', '先锋快递', 'X', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('457', 'sunspeedy', '新速航', 'X', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('458', 'xipost', '西邮寄', 'X', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('459', 'sinatone', '信联通', 'X', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('460', 'sunjex', '新杰物流', 'X', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('461', 'alog', '心怡物流', 'X', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('462', 'csxss', '新时速物流', 'X', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('463', 'xiangteng', '翔腾物流', 'X', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('464', 'westwing', '西翼物流', 'X', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('465', 'littlebearbear', '小熊物流', 'X', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('466', 'huanqiuabc', '中国香港环球快运', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('467', 'xinning', '新宁物流', 'X', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('468', 'wlwex', '星空国际', 'X', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('469', 'yyexp', '西安运逸快递', 'X', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('470', 'xiyoug', '西游寄', 'X', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('471', 'xlobo', 'xLobo', 'X', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('472', 'xunsuexpress', '迅速快递', 'X', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('473', 'whgjkd', '香港伟豪国际物流', 'X', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('474', 'xyd666', '鑫远东速运', 'X', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('475', 'xdexpress', '迅达速递', 'X', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('476', 'ytkd', '运通快递', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('477', 'ycwl', '远成物流', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('478', 'yfsd', '亚风速递', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('479', 'yishunhang', '亿顺航', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('480', 'yfwl', '越丰物流', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('481', 'yad', '源安达快递', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('482', 'yfh', '原飞航物流', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('483', 'yinjiesudi', '银捷速递', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('484', 'yitongfeihong', '一统飞鸿', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('485', 'yuxinwuliu', '宇鑫物流', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('486', 'yitongda', '易通达', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('487', 'youbijia', '邮必佳', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('488', 'yiqiguojiwuliu', '一柒物流', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('489', 'yinsu', '音素快运', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('490', 'yilingsuyun', '亿领速运', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('491', 'yujiawuliu', '煜嘉物流', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('492', 'gml', '英脉物流', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('493', 'leopard', '云豹国际货运', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('494', 'czwlyn', '云南中诚', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('495', 'sdyoupei', '优配速运', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('496', 'yongchang', '永昌物流', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('497', 'yufeng', '御风速运', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('498', 'yousutongda', '优速通达', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('499', 'yongwangda', '永旺达快递', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('500', 'yingchao', '英超物流', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('501', 'edlogistics', '益递物流', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('502', 'yjxlm', '宜家行', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('503', 'onehcang', '一号仓', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('504', 'ycgky', '远成快运', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('505', 'yunfeng56', '韵丰物流', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('506', 'iyoungspeed', '驿扬国际速运', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('507', 'zgyzt', '一站通快递', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('508', 'eupackage', '易优包裹', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('509', 'ydglobe', '云达通', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('510', 'el56', 'YLTD', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('511', 'yundx', '运东西', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('512', 'yangbaoguo', '洋包裹', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('513', 'uluckex', '优联吉运', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('514', 'ecmscn', '易客满', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('515', 'ubonex', '优邦速运', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('516', 'yue777', '玥玛速运', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('517', 'ywexpress', '远为快递', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('518', 'ezhuanyuan', '易转运', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('519', 'yiqisong', '一起送', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('520', 'yongbangwuliu', '永邦国际物流', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('521', 'yyox', '邮客全球速递', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('522', 'yihangmall', '易航物流', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('523', 'yiouzhou', '易欧洲国际物流', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('524', 'ykouan', '洋口岸', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('525', 'youyou', '优优速递', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('526', 'ytky168', '运通快运', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('527', 'sixroad', '易普递', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('528', 'yourscm', '雅澳物流', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('529', 'euguoji', '易邮国际', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('530', 'uscbexpress', '易境达国际物流', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('531', 'yfsuyun', '驭丰速运', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('532', 'yimidida', '壹米滴答', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('533', 'ugoexpress', '邮鸽速运', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('534', 'youban', '邮邦国际', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('535', 'hkems', '云邮跨境快递', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('536', 'youlai', '邮来速递', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('537', 'eta100', '易达国际速递', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('538', 'yatfai', '一辉物流', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('539', 'yzswuliu', '亚洲顺物流', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('540', 'yifankd', '艺凡快递', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('541', 'mantoo', '优能物流', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('542', 'vctrans', '越中国际物流', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('543', 'yhtlogistics', '宇航通物流', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('544', 'ycgglobal', 'YCG物流', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('545', 'yidihui', '驿递汇速递', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('546', 'yuanhhk', '远航国际快运', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('547', 'yiyou', '易邮速运', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('548', 'eusacn', '优莎速运', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('549', 'uhi', '优海国际速递', 'Y', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('550', 'zjs', '宅急送', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('551', 'ztky', '中铁快运', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('552', 'ztwl', '中铁物流', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('553', 'zywl', '中邮物流', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('554', 'zhimakaimen', '芝麻开门', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('555', 'zhengzhoujianhua', '郑州建华', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('556', 'zhongsukuaidi', '中速快件', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('557', 'zhongtianwanyun', '中天万运', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('558', 'zhongruisudi', '中睿速递', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('559', 'zhongwaiyun', '中外运速递', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('560', 'zengyisudi', '增益速递', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('561', 'sujievip', '郑州速捷', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('562', 'ztong', '智通物流', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('563', 'zhichengtongda', '至诚通达快递', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('564', 'zhdwl', '众辉达物流', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('565', 'kuachangwuliu', '直邮易', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('566', 'topspeedex', '中运全速', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('567', 'otobv', '中欧快运', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('568', 'zsky123', '准实快运', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('569', 'cnws', '中国翼', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('570', 'zytdscm', '中宇天地', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('571', 'zhuanyunsifang', '转运四方', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('572', 'hrbzykd', '卓烨快递', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('573', 'zhuoshikuaiyun', '卓实快运', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('574', 'chinaicip', '卓志速运', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('575', 'ynztsy', '纵通速运', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('576', 'zdepost', '直德邮', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('577', 'chinapostcb', '中邮电商', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('578', 'chunghwa56', '中骅物流', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('579', 'cosco', '中远e环球', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('580', 'zf365', '珠峰速运', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('581', 'zhongtongkuaiyun', '中通快运', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('582', 'eucnrail', '中欧国际物流', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('583', 'chnexp', '中翼国际物流', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('584', 'cccc58', '中集冷云', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('585', 'auvanda', '中联速递', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('586', 'zyzoom', '增速跨境', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('587', 'zhpex', '众派速递', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('588', 'byht', '展勤快递', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('589', 'zhongchuan', '众川国际', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('590', 'zhonghuanus', '中环转运', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('591', 'zhonghuan', '中环快递', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('592', 'uszcn', '转运中国', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('593', 'zhitengwuliu', '志腾物流', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('594', 'zsda56', '转瞬达集运', 'Z', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('595', 'zjgj56', '振捷国际货运', 'Z', '100', '1553911076', '1553911076');

-- -----------------------------
-- Table structure for `ey_shop_order`
-- -----------------------------
DROP TABLE IF EXISTS `ey_shop_order`;
CREATE TABLE `ey_shop_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_code` varchar(20) NOT NULL DEFAULT '' COMMENT '订单编号',
  `users_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `order_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单状态：0未付款(已下单)，1已付款(待发货)，2已发货(待收货)，3已完成(确认收货)，-1订单取消(已关闭)，4订单过期',
  `payment_method` tinyint(1) DEFAULT '0' COMMENT '订单支付方式，0为在线支付，1为货到付款，默认0',
  `pay_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `pay_name` varchar(20) NOT NULL DEFAULT '' COMMENT '支付方式名称',
  `wechat_pay_type` varchar(20) NOT NULL DEFAULT '' COMMENT '微信支付时，标记使用的支付类型（扫码支付，微信内部，微信H5页面）',
  `pay_details` text COMMENT '支付时返回的数据，以serialize序列化后存入，用于后续查询。',
  `express_order` varchar(32) DEFAULT '' COMMENT '发货物流单号',
  `express_name` varchar(32) DEFAULT '' COMMENT '发货物流名称',
  `express_code` varchar(32) DEFAULT '' COMMENT '发货物流code',
  `express_time` int(11) DEFAULT '0' COMMENT '发货时间',
  `consignee` varchar(30) NOT NULL DEFAULT '' COMMENT '收货人',
  `confirm_time` int(11) DEFAULT '0' COMMENT '收货确认时间',
  `shipping_fee` decimal(10,2) DEFAULT '0.00' COMMENT '订单运费',
  `order_total_amount` decimal(10,2) DEFAULT '0.00' COMMENT '订单总价',
  `order_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '应付款金额',
  `order_total_num` int(10) DEFAULT '0' COMMENT '订单总数',
  `country` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '国家',
  `province` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '省份',
  `city` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '城市',
  `district` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '县区',
  `address` varchar(500) NOT NULL DEFAULT '' COMMENT '收货地址',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机',
  `prom_type` tinyint(1) unsigned DEFAULT '0' COMMENT '订单类型：0普通订单，1虚拟订单',
  `virtual_delivery` text COMMENT '虚拟订单时，卖家发货给买家的回复',
  `admin_note` text COMMENT '管理员操作备注',
  `user_note` text COMMENT '会员备注',
  `lang` varchar(30) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) unsigned DEFAULT '0' COMMENT '下单时间',
  `update_time` int(11) unsigned DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_code` (`order_code`),
  KEY `users_id` (`users_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单主表';


-- -----------------------------
-- Table structure for `ey_shop_order_details`
-- -----------------------------
DROP TABLE IF EXISTS `ey_shop_order_details`;
CREATE TABLE `ey_shop_order_details` (
  `details_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int(10) DEFAULT '0' COMMENT '订单ID',
  `users_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `product_name` varchar(100) DEFAULT '' COMMENT '产品名称',
  `num` int(10) DEFAULT '0' COMMENT '单个产品数量',
  `data` text COMMENT '序列化额外数据',
  `product_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '产品单价',
  `prom_type` tinyint(1) unsigned DEFAULT '0' COMMENT '产品类型：0普通产品，1虚拟产品',
  `litpic` varchar(500) DEFAULT '' COMMENT '封面图片',
  `lang` varchar(30) NOT NULL DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '下单时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`details_id`),
  KEY `users_id` (`users_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单详情表';


-- -----------------------------
-- Table structure for `ey_shop_order_log`
-- -----------------------------
DROP TABLE IF EXISTS `ey_shop_order_log`;
CREATE TABLE `ey_shop_order_log` (
  `action_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID',
  `users_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `action_user` int(10) DEFAULT '0' COMMENT '操作人；0:用户操作；1以上:管理员id',
  `order_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单状态，单条记录状态',
  `express_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '物流状态，0:未发货，1:已发货',
  `pay_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付状态，0:未支付，1:已支付',
  `action_desc` varchar(255) DEFAULT '' COMMENT '状态描述',
  `action_note` varchar(255) NOT NULL DEFAULT '' COMMENT '操作备注',
  `lang` varchar(30) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`action_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单操作记录表';


-- -----------------------------
-- Table structure for `ey_shop_shipping_template`
-- -----------------------------
DROP TABLE IF EXISTS `ey_shop_shipping_template`;
CREATE TABLE `ey_shop_shipping_template` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '运费模板ID',
  `template_region` varchar(255) NOT NULL DEFAULT '' COMMENT '模板运送区域',
  `template_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '模板运费',
  `province_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'region表id',
  `lang` varchar(30) DEFAULT 'cn' COMMENT '语言标识',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`template_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='运费模板表';

-- -----------------------------
-- Records of `ey_shop_shipping_template`
-- -----------------------------
INSERT INTO `ey_shop_shipping_template` VALUES ('1', '北京市', '0.00', '1', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('2', '天津市', '0.00', '338', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('3', '河北省', '0.00', '636', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('4', '山西省', '0.00', '3102', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('5', '内蒙古自治区', '0.00', '4670', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('6', '辽宁省', '0.00', '5827', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('7', '吉林省', '0.00', '7531', 'cn', '1554775921');
INSERT INTO `ey_shop_shipping_template` VALUES ('8', '黑龙江省', '0.00', '8558', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('9', '上海市', '0.00', '10543', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('10', '江苏省', '0.00', '10808', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('11', '浙江省', '0.00', '12596', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('12', '安徽省', '0.00', '14234', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('13', '福建省', '0.00', '16068', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('14', '江西省', '0.00', '17359', 'cn', '1554775962');
INSERT INTO `ey_shop_shipping_template` VALUES ('15', '山东省', '0.00', '19280', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('16', '河南省', '0.00', '21387', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('17', '湖北省', '0.00', '24022', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('18', '湖南省', '0.00', '25579', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('19', '广东省', '0.00', '28240', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('20', '广西壮族自治区', '0.00', '30164', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('21', '海南省', '0.00', '31563', 'cn', '1555483193');
INSERT INTO `ey_shop_shipping_template` VALUES ('22', '重庆市', '0.00', '31929', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('23', '四川省', '0.00', '33007', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('24', '贵州省', '0.00', '37906', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('25', '云南省', '0.00', '39556', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('26', '西藏自治区', '0.00', '41103', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('27', '陕西省', '0.00', '41877', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('28', '甘肃省', '0.00', '43776', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('29', '青海省', '0.00', '45286', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('30', '宁夏回族自治区', '0.00', '45753', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('31', '新疆维吾尔自治区', '0.00', '46047', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('32', '台湾省', '0.00', '47493', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('33', '香港特别行政区', '0.00', '47494', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('34', '澳门特别行政区', '0.00', '47495', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('35', '统一配送价格', '0.00', '100000', 'cn', '1556618311');

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
-- Table structure for `ey_smtp_record`
-- -----------------------------
DROP TABLE IF EXISTS `ey_smtp_record`;
CREATE TABLE `ey_smtp_record` (
  `record_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `source` tinyint(1) DEFAULT '0' COMMENT '来源，与场景ID对应：0=默认，2=注册，3=绑定邮箱，4=找回密码',
  `email` varchar(50) DEFAULT '' COMMENT '邮件地址',
  `users_id` int(10) DEFAULT '0' COMMENT '用户ID',
  `code` varchar(20) DEFAULT '' COMMENT '发送邮件内容',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否使用，默认0，0为未使用，1为使用',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`record_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邮件发送记录表';


-- -----------------------------
-- Table structure for `ey_smtp_tpl`
-- -----------------------------
DROP TABLE IF EXISTS `ey_smtp_tpl`;
CREATE TABLE `ey_smtp_tpl` (
  `tpl_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `tpl_name` varchar(200) DEFAULT '' COMMENT '模板名称',
  `tpl_title` varchar(200) DEFAULT '' COMMENT '邮件标题',
  `tpl_content` text COMMENT '发送邮件内容',
  `send_scene` tinyint(1) DEFAULT '0' COMMENT '邮件发送场景(1=留言表单）',
  `is_open` tinyint(1) DEFAULT '0' COMMENT '是否开启使用这个模板，1为是，0为否。',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`tpl_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='邮件模板表';

-- -----------------------------
-- Records of `ey_smtp_tpl`
-- -----------------------------
INSERT INTO `ey_smtp_tpl` VALUES ('1', '留言表单', '您有新的留言消息，请查收！', '${content}', '1', '1', 'cn', '1544763495', '1552638302');
INSERT INTO `ey_smtp_tpl` VALUES ('2', '会员注册', '验证码已发送至您的邮箱，请登录邮箱查看验证码！', '${content}', '2', '1', 'cn', '1544763495', '1552667056');
INSERT INTO `ey_smtp_tpl` VALUES ('3', '绑定邮箱', '验证码已发送至您的邮箱，请登录邮箱查看验证码！', '${content}', '3', '1', 'cn', '1544763495', '1552667400');
INSERT INTO `ey_smtp_tpl` VALUES ('4', '找回密码', '验证码已发送至您的邮箱，请登录邮箱查看验证码！', '${content}', '4', '1', 'cn', '1544763495', '1552663577');

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
-- Table structure for `ey_users`
-- -----------------------------
DROP TABLE IF EXISTS `ey_users`;
CREATE TABLE `ey_users` (
  `users_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '登录密码',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `is_mobile` tinyint(1) DEFAULT '0' COMMENT '绑定手机号，0为不绑定，1为绑定',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号码（仅用于登录）',
  `is_email` tinyint(1) DEFAULT '0' COMMENT '绑定邮箱，0为不绑定，1为绑定',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '电子邮件（仅用于登录）',
  `paypwd` varchar(50) DEFAULT '' COMMENT '支付密码，暂时未用到，可保留。',
  `users_money` decimal(10,2) DEFAULT '0.00' COMMENT '用户金额',
  `frozen_money` decimal(10,2) DEFAULT '0.00' COMMENT '冻结金额',
  `reg_time` int(11) unsigned DEFAULT '0' COMMENT '注册时间',
  `last_login` int(11) unsigned DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` varchar(15) DEFAULT '' COMMENT '最后登录ip',
  `login_count` int(11) DEFAULT '0' COMMENT '登陆次数',
  `head_pic` varchar(255) DEFAULT '' COMMENT '头像',
  `province` int(6) DEFAULT '0' COMMENT '省份',
  `city` int(6) DEFAULT '0' COMMENT '市区',
  `district` int(6) DEFAULT '0' COMMENT '县',
  `level` smallint(5) DEFAULT '0' COMMENT '会员等级',
  `open_level_time` int(11) unsigned DEFAULT '0' COMMENT '开通会员级别时间',
  `level_maturity_days` varchar(20) DEFAULT '' COMMENT '会员级别到期天数',
  `discount` decimal(10,2) DEFAULT '1.00' COMMENT '会员折扣，默认1不享受',
  `total_amount` decimal(10,2) DEFAULT '0.00' COMMENT '消费累计额度',
  `is_activation` tinyint(1) DEFAULT '1' COMMENT '是否激活，0否，1是。\r\n后台注册默认为1激活。\r\n前台注册时，当会员功能设置选择后台审核，需后台激活才可以登陆。',
  `register_place` tinyint(1) DEFAULT '2' COMMENT '注册位置。后台注册不受注册验证影响，1为后台注册，2为前台注册。默认为2。',
  `open_id` varchar(30) NOT NULL DEFAULT '' COMMENT '微信唯一标识openid',
  `is_lock` tinyint(1) DEFAULT '0' COMMENT '是否被锁定冻结',
  `admin_id` int(10) DEFAULT '0' COMMENT '关联管理员ID',
  `lang` varchar(20) DEFAULT 'cn' COMMENT '语言标识',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '伪删除，1=是，0=否',
  `update_time` int(11) unsigned DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`users_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员信息表';

-- -----------------------------
-- Records of `ey_users`
-- -----------------------------
INSERT INTO `ey_users` VALUES ('1', 'admin', 'db821f57dde967a6d5b669d2d52d653b', 'admin', '0', '', '0', '', '', '0.00', '0.00', '1570976289', '1589873172', '', '0', '/public/static/common/images/dfboy.png', '0', '0', '0', '1', '0', '', '1.00', '0.00', '1', '1', '', '0', '1', 'cn', '0', '1589873172');

-- -----------------------------
-- Table structure for `ey_users_config`
-- -----------------------------
DROP TABLE IF EXISTS `ey_users_config`;
CREATE TABLE `ey_users_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员功能配置表ID',
  `name` varchar(50) DEFAULT '' COMMENT '配置的key键名',
  `value` text COMMENT '配置的value值',
  `desc` varchar(100) DEFAULT '' COMMENT '键名说明',
  `inc_type` varchar(64) DEFAULT '' COMMENT '配置分组',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员功能配置表';

-- -----------------------------
-- Records of `ey_users_config`
-- -----------------------------
INSERT INTO `ey_users_config` VALUES ('1', 'users_reg_notallow', 'www,bbs,ftp,mail,user,users,admin,administrator,eyoucms', '不允许注册的会员名', 'users', 'cn', '1547890773');

-- -----------------------------
-- Table structure for `ey_users_level`
-- -----------------------------
DROP TABLE IF EXISTS `ey_users_level`;
CREATE TABLE `ey_users_level` (
  `level_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `level_name` varchar(30) DEFAULT '' COMMENT '级别名称',
  `level_value` int(10) DEFAULT '0' COMMENT '会员等级值',
  `is_system` tinyint(1) DEFAULT '0' COMMENT '类型，1=系统，0=用户',
  `amount` decimal(10,2) DEFAULT '0.00' COMMENT '消费额度',
  `discount` int(10) DEFAULT '100' COMMENT '折扣率，初始值为100即100%，无折扣',
  `posts_count` int(10) DEFAULT '5' COMMENT '会员投稿次数限制',
  `ask_is_release` tinyint(1) DEFAULT '1' COMMENT '允许在问答中发布问题，1=是，0=否',
  `ask_is_review` tinyint(1) DEFAULT '0' COMMENT '在问答中发布问题或回答是否需要审核，1=是，0=否',
  `lang` varchar(20) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`level_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='会员级别表';

-- -----------------------------
-- Records of `ey_users_level`
-- -----------------------------
INSERT INTO `ey_users_level` VALUES ('1', '注册会员', '10', '1', '0.00', '100', '5', '1', '0', 'cn', '0', '1551151513');
INSERT INTO `ey_users_level` VALUES ('2', '中级会员', '50', '0', '0.00', '100', '10', '1', '0', 'cn', '1570964230', '1570964230');
INSERT INTO `ey_users_level` VALUES ('3', '高级会员', '100', '0', '0.00', '100', '20', '1', '0', 'cn', '1570964230', '1570964230');

-- -----------------------------
-- Table structure for `ey_users_list`
-- -----------------------------
DROP TABLE IF EXISTS `ey_users_list`;
CREATE TABLE `ey_users_list` (
  `list_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `users_id` int(10) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `para_id` int(10) NOT NULL DEFAULT '0' COMMENT '属性ID',
  `info` text COMMENT '属性值',
  `lang` varchar(50) NOT NULL DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`list_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员属性表(信息）';


-- -----------------------------
-- Table structure for `ey_users_menu`
-- -----------------------------
DROP TABLE IF EXISTS `ey_users_menu`;
CREATE TABLE `ey_users_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(30) DEFAULT '' COMMENT '导航名称',
  `mca` varchar(50) DEFAULT '' COMMENT '分组/控制器/操作名',
  `is_userpage` tinyint(1) DEFAULT '0' COMMENT '默认会员首页',
  `sort_order` int(10) DEFAULT '0' COMMENT '排序号',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1=显示，0=隐藏',
  `lang` varchar(20) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='会员菜单表';

-- -----------------------------
-- Records of `ey_users_menu`
-- -----------------------------
INSERT INTO `ey_users_menu` VALUES ('1', '个人信息', 'user/Users/index', '1', '100', '1', 'cn', '1555904190', '1555917737');
INSERT INTO `ey_users_menu` VALUES ('2', '账户充值', 'user/Pay/pay_consumer_details', '0', '100', '1', 'cn', '1555904190', '1555917761');
INSERT INTO `ey_users_menu` VALUES ('3', '商城中心', 'user/Shop/shop_centre', '0', '100', '0', 'cn', '1555904190', '1555917761');
INSERT INTO `ey_users_menu` VALUES ('4', '会员升级', 'user/Level/level_centre', '0', '100', '0', 'cn', '1555904190', '1555917761');
INSERT INTO `ey_users_menu` VALUES ('5', '会员投稿', 'user/UsersRelease/release_centre', '0', '100', '0', 'cn', '1555904190', '1555917761');

-- -----------------------------
-- Table structure for `ey_users_money`
-- -----------------------------
DROP TABLE IF EXISTS `ey_users_money`;
CREATE TABLE `ey_users_money` (
  `moneyid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '金额明细表ID',
  `users_id` int(10) DEFAULT '0' COMMENT '会员表ID',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '金额',
  `users_money` decimal(10,2) DEFAULT '0.00' COMMENT '此条记录的账户金额',
  `cause` text COMMENT '事由，暂时在升级消费中使用到，以serialize序列化后存入，用于后续查询。',
  `cause_type` tinyint(1) DEFAULT '0' COMMENT '数据类型，0为消费，1为充值。其余后续添加。',
  `status` tinyint(1) DEFAULT '1' COMMENT '是否成功，默认1，0失败，1未付款，2已付款，3已完成，4订单取消。',
  `pay_method` varchar(10) DEFAULT '' COMMENT '支付方式，wechat为微信支付，alipay为支付宝支付',
  `wechat_pay_type` varchar(20) NOT NULL DEFAULT '' COMMENT '微信支付时，标记使用的支付类型（扫码支付，微信内部，微信H5页面）',
  `pay_details` text COMMENT '支付时返回的数据，以serialize序列化后存入，用于后续查询。',
  `order_number` varchar(30) DEFAULT '' COMMENT '订单号',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`moneyid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='金额明细表';


-- -----------------------------
-- Table structure for `ey_users_parameter`
-- -----------------------------
DROP TABLE IF EXISTS `ey_users_parameter`;
CREATE TABLE `ey_users_parameter` (
  `para_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `dtype` varchar(32) NOT NULL DEFAULT '' COMMENT '字段类型',
  `dfvalue` varchar(1000) NOT NULL DEFAULT '' COMMENT '默认值',
  `is_system` tinyint(1) DEFAULT '0' COMMENT '是否为系统属性，系统属性不可删除，1为是，0为否，默认0。',
  `is_hidden` tinyint(1) DEFAULT '0' COMMENT '是否禁用属性，1为是，0为否',
  `is_required` tinyint(1) DEFAULT '0' COMMENT '是否为必填属性，1为是，0为否，默认0。',
  `sort_order` smallint(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `lang` varchar(50) NOT NULL DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`para_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='会员属性表(字段)';

-- -----------------------------
-- Records of `ey_users_parameter`
-- -----------------------------
INSERT INTO `ey_users_parameter` VALUES ('1', '手机号码', 'mobile_1', 'mobile', '', '1', '0', '0', '1', 'cn', '0', '1551238026');
INSERT INTO `ey_users_parameter` VALUES ('2', '邮箱地址', 'email_2', 'email', '', '1', '0', '1', '1', 'cn', '0', '1551238549');

-- -----------------------------
-- Table structure for `ey_users_type_manage`
-- -----------------------------
DROP TABLE IF EXISTS `ey_users_type_manage`;
CREATE TABLE `ey_users_type_manage` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `type_name` varchar(30) DEFAULT '' COMMENT '类型名称',
  `level_id` int(10) DEFAULT '0' COMMENT '会员等级ID',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `limit_id` int(10) DEFAULT '0' COMMENT '会员期限限制，存储ID，值对应常量表的admin_member_limit_arr数组',
  `sort_order` smallint(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `lang` varchar(20) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='会员产品类型表';

-- -----------------------------
-- Records of `ey_users_type_manage`
-- -----------------------------
INSERT INTO `ey_users_type_manage` VALUES ('1', '升级为本站中级会员', '2', '100.00', '2', '100', 'cn', '1570964230', '1570964230');
INSERT INTO `ey_users_type_manage` VALUES ('2', '升级为本站高级会员', '3', '200.00', '3', '100', 'cn', '1570964230', '1570964230');

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
  `position` varchar(30) DEFAULT 'default' COMMENT '插件位置',
  `sort_order` int(10) DEFAULT '100' COMMENT '排序号',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件应用表';

