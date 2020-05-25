/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.196_3306
Source Server Version : 80020
Source Host           : 192.168.1.196:3306
Source Database       : dailyfresh

Target Server Type    : MYSQL
Target Server Version : 80020
File Encoding         : 65001

Date: 2020-05-26 03:04:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('17', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('20', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('21', 'Can add 用户', '6', 'add_user');
INSERT INTO `auth_permission` VALUES ('22', 'Can change 用户', '6', 'change_user');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete 用户', '6', 'delete_user');
INSERT INTO `auth_permission` VALUES ('24', 'Can view 用户', '6', 'view_user');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 地址', '7', 'add_address');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 地址', '7', 'change_address');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 地址', '7', 'delete_address');
INSERT INTO `auth_permission` VALUES ('28', 'Can view 地址', '7', 'view_address');
INSERT INTO `auth_permission` VALUES ('29', 'Can add 商品SPU', '8', 'add_goods');
INSERT INTO `auth_permission` VALUES ('30', 'Can change 商品SPU', '8', 'change_goods');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete 商品SPU', '8', 'delete_goods');
INSERT INTO `auth_permission` VALUES ('32', 'Can view 商品SPU', '8', 'view_goods');
INSERT INTO `auth_permission` VALUES ('33', 'Can add 商品', '9', 'add_goodssku');
INSERT INTO `auth_permission` VALUES ('34', 'Can change 商品', '9', 'change_goodssku');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete 商品', '9', 'delete_goodssku');
INSERT INTO `auth_permission` VALUES ('36', 'Can view 商品', '9', 'view_goodssku');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 商品种类', '10', 'add_goodstype');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 商品种类', '10', 'change_goodstype');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 商品种类', '10', 'delete_goodstype');
INSERT INTO `auth_permission` VALUES ('40', 'Can view 商品种类', '10', 'view_goodstype');
INSERT INTO `auth_permission` VALUES ('41', 'Can add 主页促销活动', '11', 'add_indexpromotionbanner');
INSERT INTO `auth_permission` VALUES ('42', 'Can change 主页促销活动', '11', 'change_indexpromotionbanner');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete 主页促销活动', '11', 'delete_indexpromotionbanner');
INSERT INTO `auth_permission` VALUES ('44', 'Can view 主页促销活动', '11', 'view_indexpromotionbanner');
INSERT INTO `auth_permission` VALUES ('45', 'Can add 主页分类展示商品', '12', 'add_indextypegoodsbanner');
INSERT INTO `auth_permission` VALUES ('46', 'Can change 主页分类展示商品', '12', 'change_indextypegoodsbanner');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete 主页分类展示商品', '12', 'delete_indextypegoodsbanner');
INSERT INTO `auth_permission` VALUES ('48', 'Can view 主页分类展示商品', '12', 'view_indextypegoodsbanner');
INSERT INTO `auth_permission` VALUES ('49', 'Can add 首页轮播商品', '13', 'add_indexgoodsbanner');
INSERT INTO `auth_permission` VALUES ('50', 'Can change 首页轮播商品', '13', 'change_indexgoodsbanner');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete 首页轮播商品', '13', 'delete_indexgoodsbanner');
INSERT INTO `auth_permission` VALUES ('52', 'Can view 首页轮播商品', '13', 'view_indexgoodsbanner');
INSERT INTO `auth_permission` VALUES ('53', 'Can add 商品图片', '14', 'add_goodsimage');
INSERT INTO `auth_permission` VALUES ('54', 'Can change 商品图片', '14', 'change_goodsimage');
INSERT INTO `auth_permission` VALUES ('55', 'Can delete 商品图片', '14', 'delete_goodsimage');
INSERT INTO `auth_permission` VALUES ('56', 'Can view 商品图片', '14', 'view_goodsimage');
INSERT INTO `auth_permission` VALUES ('57', 'Can add 订单', '15', 'add_orderinfo');
INSERT INTO `auth_permission` VALUES ('58', 'Can change 订单', '15', 'change_orderinfo');
INSERT INTO `auth_permission` VALUES ('59', 'Can delete 订单', '15', 'delete_orderinfo');
INSERT INTO `auth_permission` VALUES ('60', 'Can view 订单', '15', 'view_orderinfo');
INSERT INTO `auth_permission` VALUES ('61', 'Can add 订单商品', '16', 'add_ordergoods');
INSERT INTO `auth_permission` VALUES ('62', 'Can change 订单商品', '16', 'change_ordergoods');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete 订单商品', '16', 'delete_ordergoods');
INSERT INTO `auth_permission` VALUES ('64', 'Can view 订单商品', '16', 'view_ordergoods');

-- ----------------------------
-- Table structure for `df_address`
-- ----------------------------
DROP TABLE IF EXISTS `df_address`;
CREATE TABLE `df_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `receiver` varchar(20) NOT NULL,
  `addr` varchar(256) NOT NULL,
  `zip_code` varchar(6) DEFAULT NULL,
  `phone` varchar(11) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_address_user_id_5e6a5c8a_fk_df_user_id` (`user_id`),
  CONSTRAINT `df_address_user_id_5e6a5c8a_fk_df_user_id` FOREIGN KEY (`user_id`) REFERENCES `df_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_address
-- ----------------------------
INSERT INTO `df_address` VALUES ('1', '2020-05-01 21:14:13.939763', '2020-05-22 06:13:18.730832', '0', 'zdy', '山东省枣庄市市中区北安路1号枣庄学院', '277160', '17863278888', '0', '1');
INSERT INTO `df_address` VALUES ('2', '2020-05-07 02:15:22.100550', '2020-05-22 06:14:44.145674', '0', 'ssm', '山东省济南市章丘区山东技师学院18号宿舍公寓231', '227013', '18837474732', '1', '1');
INSERT INTO `df_address` VALUES ('3', '2020-05-15 02:31:35.241439', '2020-05-15 02:31:35.241468', '0', 'test1', '山东省济南市天桥区站前街1号', '222777', '13355588868', '1', '2');
INSERT INTO `df_address` VALUES ('4', '2020-05-24 17:47:00.328090', '2020-05-24 17:47:00.328123', '0', '杨理想', '山东省枣庄市枣庄学院19-224-3号床', '121212', '15664574669', '1', '5');

-- ----------------------------
-- Table structure for `df_goods`
-- ----------------------------
DROP TABLE IF EXISTS `df_goods`;
CREATE TABLE `df_goods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `detail` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_goods
-- ----------------------------
INSERT INTO `df_goods` VALUES ('1', '2020-05-04 10:24:09.365757', '2020-05-07 00:43:31.486426', '0', '牛排', '<p>&nbsp;</p>\r\n<p><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; display: block; width: 790px;\" src=\"https://img.alicdn.com/imgextra/i1/2074450097/O1CN01vpnR151CaT0aePDpE_!!2074450097.jpg\" alt=\"\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; display: block; width: 790px;\" src=\"https://img.alicdn.com/imgextra/i2/2074450097/O1CN01YmSRqY1CaT0hS71DW_!!2074450097.jpg\" alt=\"\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; display: block; width: 790px;\" src=\"https://img.alicdn.com/imgextra/i3/2074450097/O1CN01xda7AB1CaT0VwxjMX_!!2074450097.jpg\" alt=\"\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; display: block; width: 790px;\" src=\"https://img.alicdn.com/imgextra/i3/2074450097/O1CN01UjsH1H1CaT0gqiWv6_!!2074450097.jpg\" alt=\"\" /></p>\r\n<p>&nbsp;</p>');
INSERT INTO `df_goods` VALUES ('2', '2020-05-05 00:44:15.555776', '2020-05-22 09:39:58.322739', '0', '香蕉', '<p><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i4/2201471427648/O1CN01ttRsd126MphigtoQ0_!!2201471427648.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i1/2201471427648/O1CN01ortoac26Mphfwb1fd_!!2201471427648.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i1/2201471427648/O1CN01yDKf2h26MpheynKBt_!!2201471427648.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i3/2201471427648/O1CN01DaCFfQ26MphjZq96J_!!2201471427648.jpg\" alt=\"\" align=\"absmiddle\" /></p>');
INSERT INTO `df_goods` VALUES ('3', '2020-05-05 01:19:58.600405', '2020-05-07 00:41:13.875717', '0', '大龙虾', '<p><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; text-align: center;\" src=\"https://img.alicdn.com/imgextra/i2/3191603335/O1CN01YoKA6z1aVTStfopE8_!!3191603335.jpg\" alt=\"\" align=\"absmiddle\" data-spm-anchor-id=\"a220o.1000855.0.i0.224634c6wVltYe\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; text-align: center;\" src=\"https://img.alicdn.com/imgextra/i1/3191603335/O1CN01qp2Ggb1aVTSzLoNHH_!!3191603335.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; text-align: center;\" src=\"https://img.alicdn.com/imgextra/i1/3191603335/O1CN01RxIghq1aVTSwkru4O_!!3191603335.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; text-align: center;\" src=\"https://img.alicdn.com/imgextra/i3/3191603335/O1CN01PoveKm1aVTSwksAgz_!!3191603335.jpg\" alt=\"\" align=\"absmiddle\" /></p>');
INSERT INTO `df_goods` VALUES ('4', '2020-05-05 03:35:45.530233', '2020-05-26 03:03:31.134753', '0', '苹果', '<dl class=\"lemmaWgt-lemmaTitle lemmaWgt-lemmaTitle-\" style=\"margin: 0px 0px 10px; padding: 0px; width: 700px; font-family: arial, tahoma, \'Microsoft Yahei\', 宋体, sans-serif;\"><dd class=\"lemmaWgt-lemmaTitle-title\" style=\"margin: 0px 0px 5px; padding: 0px; line-height: 39px;\">\r\n<div class=\"detail-content clearfix\" style=\"margin: 10px 0px; padding: 0px; position: relative; background: #f7f7f7; color: #666666; font-family: tahoma, arial, \'Microsoft YaHei\', \'Hiragino Sans GB\', u5b8bu4f53, sans-serif; font-size: 12px;\" data-name=\"z-have-detail-nav\">\r\n<div class=\"detail-content-wrap\" style=\"margin: 0px; padding: 0px; width: 990px; float: left; background-color: #ffffff;\">\r\n<div class=\"detail-content-item\" style=\"margin: 0px; padding: 0px; width: 990px;\">\r\n<div id=\"J-detail-content\" style=\"margin: 0px; padding: 0px;\">\r\n<p style=\"margin: 0px; padding: 0px;\"><img style=\"margin: 0px; padding: 0px; vertical-align: middle; width: auto; height: auto; max-width: 100%;\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1/69985/26/16026/253195/5dd88a2bE1bdd932a/42a26f8c43d0d6d8.jpg\" alt=\"\" /><img style=\"margin: 0px; padding: 0px; vertical-align: middle; width: auto; height: auto; max-width: 100%;\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1/48942/11/16446/166549/5dd88a2cEe9d01d9e/b7b9d15bd505fe48.jpg\" alt=\"\" /><img style=\"margin: 0px; padding: 0px; vertical-align: middle; width: auto; height: auto; max-width: 100%;\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1/83493/7/16016/169702/5dd88a2cEd92157fb/e8b2edd330ada61c.jpg\" alt=\"\" /><img style=\"margin: 0px; padding: 0px; vertical-align: middle; width: auto; height: auto; max-width: 100%;\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1/83350/32/15853/302707/5dd88a2dE64c358ac/9fba70527109fca7.jpg\" alt=\"\" /><img style=\"margin: 0px; padding: 0px; vertical-align: middle; width: auto; height: auto; max-width: 100%;\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1/104952/24/2913/335644/5dd88a2eEaf4c802f/803c370bb7783640.jpg\" alt=\"\" /><img style=\"margin: 0px; padding: 0px; vertical-align: middle; width: auto; height: auto; max-width: 100%;\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1/59819/26/15984/163486/5dd88a2eEe833c4cf/7689f73c4d083b53.jpg\" alt=\"\" /><img style=\"margin: 0px; padding: 0px; vertical-align: middle; width: auto; height: auto; max-width: 100%;\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1/85769/38/2884/141816/5dd88a2fEda1d855c/1df859cbaac69256.jpg\" alt=\"\" /><img style=\"margin: 0px; padding: 0px; vertical-align: middle; width: auto; height: auto; max-width: 100%;\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1/65024/24/15581/118050/5dd88a30Ede0781e8/b02da2ded8034896.jpg\" alt=\"\" /><img style=\"margin: 0px; padding: 0px; vertical-align: middle; width: auto; height: auto; max-width: 100%;\" src=\"https://img10.360buyimg.com/imgzone/jfs/t1/100004/34/57/172014/5da67417Ef55f17e0/9ce2e22ff2379991.jpg\" alt=\"\" /></p>\r\n<p style=\"margin: 0px; padding: 0px;\">&nbsp;</p>\r\n</div>\r\n<div id=\"activity_footer\" style=\"margin: 0px; padding: 0px;\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div id=\"J-detail-pop-tpl-bottom-new\" style=\"margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, \'Microsoft YaHei\', \'Hiragino Sans GB\', u5b8bu4f53, sans-serif; font-size: 12px;\">\r\n<div class=\"pcTP\" style=\"margin: 0px; padding: 0px; clear: both; width: 990px;\"><img style=\"margin: 0px; padding: 0px; vertical-align: middle; width: 990px;\" src=\"https://img10.360buyimg.com/imgzone/s990x990_jfs/t1/110436/7/14164/136573/5ea5261aEc7b58b75/bf8557c49450817a.jpg\" alt=\"\" /></div>\r\n<div class=\"pcTP\" style=\"margin: 0px; padding: 0px; clear: both; width: 990px;\">\r\n<div class=\"serve-agree-bd\" style=\"margin: 0px; padding: 20px 20px 20px 62px;\"><dl style=\"margin: 0px; padding: 0px;\"><dt style=\"margin: 0px 0px 0px -42px; padding: 0px; height: 32px; line-height: 32px; font-size: 16px; color: #e4393c; font-family: \'microsoft yahei\';\">&nbsp;<strong style=\"margin: 0px; padding: 8px 0px 3px; display: inline-block;\">卖家服务</strong></dt><dd style=\"margin: 0px; padding: 10px 0px 30px; line-height: 18px;\">&ldquo;优鲜赔&rdquo;：京东平台第三方卖家销售的生鲜商品如出现破损或腐坏等问题，请在商品签收后48小时内提交&ldquo;优鲜赔&rdquo;申请，如客户提交申请时间在商家工作时间内（工作日：9:00-18:00，不包括周六日、春节假期及十一假期），商家100分钟内审核通过后即享补偿，无需返回商品；非鲜活易腐类产品除外，需上门取件。<br />坏果包赔 不支持7天无理由退货</dd><dt style=\"margin: 0px 0px 0px -42px; padding: 0px; height: 32px; line-height: 32px; font-size: 16px; color: #e4393c; font-family: \'microsoft yahei\';\">&nbsp;<strong style=\"margin: 0px; padding: 8px 0px 3px; display: inline-block;\">京东承诺</strong></dt><dd style=\"margin: 0px; padding: 10px 0px 30px; line-height: 18px;\">京东平台卖家销售并发货的商品，由平台卖家提供发票和相应的售后服务。请您放心购买！<br />注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！</dd><dt style=\"margin: 0px 0px 0px -42px; padding: 0px; height: 32px; line-height: 32px; font-size: 16px; color: #e4393c; font-family: \'microsoft yahei\';\"><strong style=\"margin: 0px; padding: 8px 0px 3px; display: inline-block;\">正品行货</strong></dt><dd style=\"margin: 0px; padding: 10px 0px 30px; line-height: 18px;\">京东商城向您保证所售商品均为正品行货，京东自营商品开具机打发票或电子发票。</dd></dl></div>\r\n<div id=\"state\" style=\"margin: 0px; padding: 0px;\"><strong style=\"margin: 0px; padding: 8px 0px 3px; display: inline-block; color: #e4393c;\">权利声明：</strong><br />京东上的所有商品信息、客户评价、商品咨询、网友讨论等内容，是京东重要的经营资源，未经许可，禁止非法转载使用。\r\n<p style=\"margin: 0px; padding: 0px;\"><strong style=\"margin: 0px; padding: 0px;\">注：</strong>本站商品信息均来自于合作方，其真实性、准确性和合法性由信息拥有者（合作方）负责。本站不提供任何保证，并不承担任何法律责任。</p>\r\n<br /><strong style=\"margin: 0px; padding: 8px 0px 3px; display: inline-block; color: #e4393c;\">价格说明：</strong><br />\r\n<p style=\"margin: 0px; padding: 0px;\"><strong style=\"margin: 0px; padding: 0px;\">京东价：</strong>京东价为商品的销售价，是您最终决定是否购买商品的依据。</p>\r\n<p style=\"margin: 0px; padding: 0px;\"><strong style=\"margin: 0px; padding: 0px;\">划线价：</strong>商品展示的划横线价格为参考价，并非原价，该价格可能是品牌专柜标价、商品吊牌价或由品牌供应商提供的正品零售价（如厂商指导价、建议零售价等）或该商品在京东平台上曾经展示过的销售价；由于地区、时间的差异性和市场行情波动，品牌专柜标价、商品吊牌价等可能会与您购物时展示的不一致，该价格仅供您参考。</p>\r\n<p style=\"margin: 0px; padding: 0px;\"><strong style=\"margin: 0px; padding: 0px;\">折扣：</strong>如无特殊说明，折扣指销售商在原价、或划线价（如品牌专柜标价、商品吊牌价、厂商指导价、厂商建议零售价）等某一价格基础上计算出的优惠比例或优惠金额；如有疑问，您可在购买前联系销售商进行咨询。</p>\r\n<p style=\"margin: 0px; padding: 0px;\"><strong style=\"margin: 0px; padding: 0px;\">异常问题：</strong>商品促销信息以商品详情页&ldquo;促销&rdquo;栏中的信息为准；商品的具体售价以订单结算页价格为准；如您发现活动商品售价或促销信息有异常，建议购买前先联系销售商咨询。</p>\r\n</div>\r\n</div>\r\n</div>\r\n</dd></dl>');
INSERT INTO `df_goods` VALUES ('5', '2020-05-07 00:28:59.136197', '2020-05-07 00:28:59.136223', '0', '秋刀鱼', '<p><img style=\"vertical-align: top; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; max-width: 750px;\" src=\"https://img.alicdn.com/imgextra/i3/1704595748/O1CN01b85TS51sKdAqFl6WO_!!1704595748.jpg\" alt=\"\" align=\"absmiddle\" /><img style=\"vertical-align: top; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; max-width: 750px;\" src=\"https://img.alicdn.com/imgextra/i2/1704595748/O1CN01mY51rx1sKdA4xgAiI_!!1704595748.jpg\" alt=\"\" align=\"absmiddle\" /><img style=\"vertical-align: top; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; max-width: 750px;\" src=\"https://img.alicdn.com/imgextra/i3/1704595748/O1CN01RnDnEv1sKdAVuIWO4_!!1704595748.png\" alt=\"\" align=\"absmiddle\" /><img style=\"vertical-align: top; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; max-width: 750px;\" src=\"https://img.alicdn.com/imgextra/i2/1704595748/O1CN01TF2gwW1sKdA0z4tId_!!1704595748.jpg\" alt=\"\" align=\"absmiddle\" /><img style=\"vertical-align: top; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; max-width: 750px;\" src=\"https://img.alicdn.com/imgextra/i1/1704595748/O1CN01MCw28W1sKdA2vaDwR_!!1704595748.jpg\" alt=\"\" align=\"absmiddle\" /></p>');
INSERT INTO `df_goods` VALUES ('6', '2020-05-07 00:36:31.722968', '2020-05-07 00:36:31.723000', '0', '冰激凌', '<p><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i2/3925978726/O1CN01NM2P5Y2EKYfTjhC5i_!!3925978726.jpg\" alt=\"\" align=\"absmiddle\" data-spm-anchor-id=\"a220o.1000855.0.i3.65f02edeI5qOV4\" /></p>\r\n<div id=\"J_DcBottomRight\" class=\"J_DcAsyn tb-shop\" style=\"margin: 0px; padding: 0px; color: #404040; font-family: tahoma, arial, 微软雅黑, sans-serif; font-size: 12px;\">\r\n<div id=\"shop22281186997\" class=\"J_TModule\" style=\"margin: 0px; padding: 0px;\" data-widgetid=\"22281186997\" data-componentid=\"5003\" data-spm=\"110.0.5003-22281186997\" data-title=\"自定义内容区\">\r\n<div class=\"skin-box tb-module tshop-pbsm tshop-pbsm-shop-self-defined\" style=\"margin: 0px 0px 10px; padding: 0px;\">\r\n<div class=\"skin-box-bd clear-fix\" style=\"margin: 0px; padding: 0px; border-color: #e5e5e5; border-width: 0px; border-style: solid; background-image: none; background-position: 0px 0px; background-size: initial; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; color: #2953a6; line-height: 1.2; overflow: hidden; width: 790px;\">\r\n<p style=\"margin: 0px; padding: 0px; line-height: 1.4;\"><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: middle;\" src=\"https://gdp.alicdn.com/imgextra/i1/3925978726/O1CN01vFFiuE2EKYewpibyR_!!3925978726.jpg\" alt=\"2.jpg\" /><br style=\"margin: 0px; padding: 0px;\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: middle;\" src=\"https://gdp.alicdn.com/imgextra/i3/3925978726/O1CN01y9YKjO2EKYfTLtNmF_!!3925978726.jpg\" alt=\"3.jpg\" data-spm-anchor-id=\"a220o.1000855.5003-22281186997.i0.65f02edeI5qOV4\" /></p>\r\n</div>\r\n<s class=\"skin-box-bt\" style=\"margin: 0px; padding: 0px;\"></s></div>\r\n</div>\r\n</div>\r\n<div id=\"J_ZebraPriceDesc\" class=\"j-mdv\" style=\"margin: 0px; padding: 0px; color: #404040; font-family: tahoma, arial, 微软雅黑, sans-serif; font-size: 12px;\"><img style=\"margin: 0px; padding: 0px;\" src=\"https://img.alicdn.com/tfs/TB1.CUdsY9YBuNjy0FgXXcxcXXa-1572-394.png\" alt=\"\" width=\"790\" /></div>');
INSERT INTO `df_goods` VALUES ('7', '2020-05-07 00:49:13.278035', '2020-05-07 00:49:13.278060', '0', '鸡蛋', '<p><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i3/2191938031/O1CN019yVN6O29CFOqKLCQW_!!2191938031.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i1/2191938031/O1CN01rh3r3T29CFOzlPPWT_!!2191938031.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i2/2191938031/O1CN012N8Zkx29CFOypYtCe_!!2191938031.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i2/2191938031/O1CN01GrzVcW29CFP0KomEi_!!2191938031.jpg\" alt=\"\" align=\"absmiddle\" /></p>');
INSERT INTO `df_goods` VALUES ('8', '2020-05-07 00:50:51.188081', '2020-05-07 00:50:51.188106', '0', '芹菜', '<p><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i3/3446548401/O1CN013fvPBg2BvhuzSN6qd_!!3446548401.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i2/3446548401/O1CN01BPeI8p2Bvhuty1SM1_!!3446548401.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i3/3446548401/O1CN01NprLBE2BvhuxRcH50_!!3446548401.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i1/3446548401/O1CN01l7pA3k2BvhuwpOxpw_!!3446548401.jpg\" alt=\"\" align=\"absmiddle\" /></p>');
INSERT INTO `df_goods` VALUES ('9', '2020-05-07 00:53:58.388365', '2020-05-07 00:53:58.388390', '0', '樱桃', '<p><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i3/2003705419/O1CN01dgrMVL1ptwrpiZvXa_!!2003705419.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i1/2003705419/O1CN01WNgKjR1ptwoZz8ZQT_!!2003705419.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i2/2003705419/O1CN014SQHY31ptwobvabbW_!!2003705419.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i4/2003705419/O1CN01heFwP01ptwoZ6Y3Vl_!!2003705419.jpg\" alt=\"\" align=\"absmiddle\" /></p>');
INSERT INTO `df_goods` VALUES ('10', '2020-05-07 01:03:38.350763', '2020-05-07 01:03:38.350788', '0', '鸭蛋', '<p><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; display: block; width: 790px;\" src=\"https://img.alicdn.com/imgextra/i1/2756798479/O1CN01k6L2tQ2CVQpBpoxHL_!!2756798479.jpg\" alt=\"\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; display: block; width: 790px;\" src=\"https://img.alicdn.com/imgextra/i2/2756798479/O1CN01kk9p8L2CVQp8WA9gz_!!2756798479.jpg\" alt=\"\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; display: block; width: 790px;\" src=\"https://img.alicdn.com/imgextra/i2/2756798479/O1CN01twYaBg2CVQp9jGY1p_!!2756798479.jpg\" alt=\"\" /></p>\r\n<p>&nbsp;</p>');
INSERT INTO `df_goods` VALUES ('11', '2020-05-07 01:12:12.776643', '2020-05-07 01:12:12.776669', '0', '草莓', '<p><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i2/2201480643236/O1CN01QSFSiL1Zm8FcEOU0h_!!2201480643236.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i1/2201480643236/O1CN01aoOD2N1Zm8FXpBhgY_!!2201480643236.jpg\" alt=\"\" align=\"absmiddle\" /></p>');
INSERT INTO `df_goods` VALUES ('12', '2020-05-22 06:18:33.488882', '2020-05-22 06:18:33.488909', '0', '娃娃菜', '<div id=\"J_DcTopRightWrap\" style=\"margin: 0px; padding: 0px; width: 790px; position: relative; overflow: hidden; color: #404040; font-family: tahoma, arial, 微软雅黑, sans-serif; font-size: 12px;\">\r\n<div id=\"J_DcTopRight\" class=\"J_DcAsyn tb-shop\" style=\"margin: 0px; padding: 0px;\">\r\n<div id=\"shop22769731909\" class=\"J_TModule\" style=\"margin: 0px; padding: 0px;\" data-widgetid=\"22769731909\" data-componentid=\"5003\" data-spm=\"110.0.5003-22769731909\" data-title=\"自定义内容区\">\r\n<div class=\"skin-box tb-module tshop-pbsm tshop-pbsm-shop-self-defined\" style=\"margin: 0px 0px 10px; padding: 0px;\">\r\n<div class=\"skin-box-bd clear-fix\" style=\"margin: 0px; padding: 0px; border-color: #e5e5e5; border-width: 0px; border-style: solid; background-image: none; background-position: 0px 0px; background-size: initial; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; color: #2953a6; line-height: 1.2; overflow: hidden; width: 790px;\">\r\n<p style=\"margin: 0px; padding: 0px; line-height: 1.4;\"><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: middle;\" src=\"https://gdp.alicdn.com/imgextra/i1/2200831675730/O1CN012wgvE61sCO3e6sZTe_!!2200831675730.jpg\" alt=\"1.jpg\" usemap=\"#Map\" border=\"0\" /><map style=\"margin: 0px; padding: 0px;\" name=\"Map\">\r\n<area style=\"margin: 0px; padding: 0px;\" coords=\"7,206,387,467\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b-s.w4011-22622356990.44.7f0a1bf9YRANz9&amp;id=593321587095&amp;rn=f52e49d6617b8ed31e30cf814ca449ba&amp;abbucket=10&amp;scene=taobao_shop\" target=\"_blank\" />\r\n<area style=\"margin: 0px; padding: 0px;\" coords=\"394,205,785,470\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b-s.w4011-22622356990.46.7ffc1bf9z6VUlj&amp;id=591815436470&amp;rn=8b8518acdf1997c5d0de4cb9ea2076ce&amp;abbucket=10&amp;scene=taobao_shop\" target=\"_blank\" />\r\n<area style=\"margin: 0px; padding: 0px;\" coords=\"6,477,261,743\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b-s.w4011-22622356990.43.45d91bf9WB8wUc&amp;id=592192170514&amp;rn=788b32066fb1027ac6d1e61af53facfe&amp;abbucket=10&amp;scene=taobao_shop\" target=\"_blank\" />\r\n<area style=\"margin: 0px; padding: 0px;\" coords=\"264,477,522,742\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b-s.w4011-22622356990.37.3b021bf9y2chxL&amp;id=612836390763&amp;rn=f912236f02f9f0c8b2cd75446fea3f0f&amp;abbucket=10&amp;scene=taobao_shop\" target=\"_blank\" />\r\n<area style=\"margin: 0px; padding: 0px;\" coords=\"531,476,784,746\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b-s.w4011-22622356990.43.68a11bf9NkNnTv&amp;id=606059745317&amp;rn=3f299d82cc9a408ffcfdaf43908966c0&amp;abbucket=10&amp;scene=taobao_shop\" target=\"_blank\" />\r\n<area style=\"margin: 0px; padding: 0px;\" coords=\"2,747,262,1017\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b-s.w4011-22622356990.41.25241bf9amYxk2&amp;id=592040981094&amp;rn=f1c48dfe965117d8548772d244363b4d&amp;abbucket=10&amp;scene=taobao_shop\" target=\"_blank\" />\r\n<area style=\"margin: 0px; padding: 0px;\" coords=\"264,748,525,1017\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b-s.w4011-22622356990.47.4dfd1bf9e5NIfJ&amp;id=592366671655&amp;rn=936175368a8629ee738167d372db67e1&amp;abbucket=10&amp;scene=taobao_shop\" target=\"_blank\" />\r\n<area style=\"margin: 0px; padding: 0px;\" coords=\"528,748,785,1015\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b-s.w4011-22622356990.42.414a1bf9bOYtXe&amp;id=592467795422&amp;rn=a5422ae30dedfd9fcd016be48cf1f777&amp;abbucket=10&amp;scene=taobao_shop\" target=\"_blank\" />\r\n<area style=\"margin: 0px; padding: 0px;\" coords=\"2,1019,265,1291\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b-s.w4011-22622356990.43.35d01bf9GI785c&amp;id=592369999049&amp;rn=7bac02be6a8a89a4adab893c8d135d3a&amp;abbucket=10&amp;scene=taobao_shop\" target=\"_blank\" />\r\n<area style=\"margin: 0px; padding: 0px;\" coords=\"268,1019,524,1291\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b-s.w4011-22622356990.48.28441bf9CoyFIL&amp;id=617933434846&amp;rn=e2ee40f91627934c6acd45c6b3c9d942&amp;abbucket=10&amp;scene=taobao_shop\" target=\"_blank\" />\r\n<area style=\"margin: 0px; padding: 0px;\" coords=\"529,1020,787,1293\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b-s.w4011-22622356990.43.609c1bf9Xb9Y7h&amp;id=592137169339&amp;rn=5e3f305c762f8c323f29d7e695240e50&amp;abbucket=10&amp;scene=taobao_shop\" target=\"_blank\" />\r\n</map></p>\r\n</div>\r\n<s class=\"skin-box-bt\" style=\"margin: 0px; padding: 0px;\"></s></div>\r\n</div>\r\n</div>\r\n</div>\r\n<div id=\"description\" class=\"J_DetailSection tshop-psm tshop-psm-bdetaildes\" style=\"margin: 0px; padding: 0px; width: auto; color: #404040; font-family: tahoma, arial, 微软雅黑, sans-serif; font-size: 12px;\">\r\n<div class=\"content ke-post\" style=\"margin: 10px 0px 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: 1.5; font-family: tahoma, arial, 宋体, sans-serif; width: 790px; overflow: hidden; height: auto;\">\r\n<p style=\"margin: 1.12em 0px; padding: 0px; line-height: 1.4; text-align: center;\"><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none;\" src=\"https://img.alicdn.com/imgextra/i2/2200831675730/O1CN01ifRefj1sCO2b7lQiL_!!2200831675730.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none;\" src=\"https://img.alicdn.com/imgextra/i3/2200831675730/O1CN01jCzafK1sCO2SrfsKP_!!2200831675730.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none;\" src=\"https://img.alicdn.com/imgextra/i1/2200831675730/O1CN01dVomhA1sCO2elfttD_!!2200831675730.jpg\" alt=\"\" align=\"absmiddle\" /></p>\r\n</div>\r\n</div>');
INSERT INTO `df_goods` VALUES ('13', '2020-05-22 06:28:16.534083', '2020-05-22 06:28:16.534113', '0', '黄瓜', '<p><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i1/1756499933/TB2foTjpqSWBuNjSsrbXXa0mVXa_!!1756499933.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i1/1756499933/O1CN01iVxNRD2NFMeuJljSw_!!1756499933.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i2/1756499933/TB21ErNpr5YBuNjSspoXXbeNFXa_!!1756499933.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i2/1756499933/TB2Cf_rpr1YBuNjSszeXXablFXa_!!1756499933.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i3/1756499933/TB2rdQapxWYBuNjy1zkXXXGGpXa_!!1756499933.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i3/1756499933/TB2s.2jpqSWBuNjSsrbXXa0mVXa_!!1756499933.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i2/1756499933/TB2vcT7pASWBuNjSszdXXbeSpXa_!!1756499933.jpg\" alt=\"\" align=\"absmiddle\" /></p>');
INSERT INTO `df_goods` VALUES ('14', '2020-05-22 06:44:46.666930', '2020-05-22 06:44:46.666959', '0', '鸡肉', '<p><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i2/2200785301801/O1CN01Z3WaEF1PAttJaFqWL_!!2200785301801.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i2/2200785301801/O1CN01acNOBI1PAttDFkBwc_!!2200785301801.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i3/2200785301801/O1CN01gsjtEw1PAttGA7WWj_!!2200785301801.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i3/2200785301801/O1CN01CT8hHm1PAtuhlzooy_!!2200785301801.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i3/2200785301801/O1CN01dQyyje1PAttI7TkzN_!!2200785301801.jpg\" alt=\"\" align=\"absmiddle\" /></p>');
INSERT INTO `df_goods` VALUES ('15', '2020-05-22 09:00:33.916467', '2020-05-22 09:00:33.916516', '0', '鲍鱼', '<div id=\"description\" class=\"J_DetailSection tshop-psm tshop-psm-bdetaildes\" style=\"margin: 0px; padding: 0px; width: auto; color: #404040; font-family: tahoma, arial, 微软雅黑, sans-serif; font-size: 12px;\">\r\n<div class=\"content ke-post\" style=\"margin: 10px 0px 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: 1.5; font-family: tahoma, arial, 宋体, sans-serif; width: 790px; overflow: hidden; height: auto;\">\r\n<p style=\"margin: 1.12em 0px; padding: 0px; line-height: 1.4;\"><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none;\" src=\"https://img.alicdn.com/imgextra/i1/2858538214/O1CN01zsMdB02AY3sk56yb1_!!2858538214.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none;\" src=\"https://img.alicdn.com/imgextra/i2/2858538214/O1CN01yqJ7yi2AY3skX3VhN_!!2858538214.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none;\" src=\"https://img.alicdn.com/imgextra/i3/2858538214/O1CN01k5ZOmz2AY3sncYJyj_!!2858538214.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none;\" src=\"https://img.alicdn.com/imgextra/i1/2858538214/O1CN016J7Gex2AY3spGgiVU_!!2858538214.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none;\" src=\"https://img.alicdn.com/imgextra/i1/2858538214/O1CN015o4n2f2AY3siaKpRM_!!2858538214.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none;\" src=\"https://img.alicdn.com/imgextra/i2/2858538214/O1CN01OCgPdG2AY3smYTAcU_!!2858538214.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none;\" src=\"https://img.alicdn.com/imgextra/i1/2858538214/O1CN01lfw4AT2AY3siCLzxl_!!2858538214.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none;\" src=\"https://img.alicdn.com/imgextra/i1/2858538214/O1CN01KpYkha2AY3scXQD4w_!!2858538214.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none;\" src=\"https://img.alicdn.com/imgextra/i3/2858538214/O1CN01zbBSaQ2AY3skuL2lv_!!2858538214.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none;\" src=\"https://img.alicdn.com/imgextra/i1/2858538214/O1CN01aetpCV2AY3spGgqp4_!!2858538214.jpg\" alt=\"\" align=\"absmiddle\" /></p>\r\n</div>\r\n</div>\r\n<div id=\"J_DcBottomRightWrap\" style=\"margin: 0px; padding: 0px; width: 790px; position: relative; overflow: hidden; color: #404040; font-family: tahoma, arial, 微软雅黑, sans-serif; font-size: 12px;\">\r\n<div id=\"J_ZebraPriceDesc\" class=\"j-mdv\" style=\"margin: 0px; padding: 0px;\"><img style=\"margin: 0px; padding: 0px;\" src=\"https://img.alicdn.com/tfs/TB1.CUdsY9YBuNjy0FgXXcxcXXa-1572-394.png\" alt=\"\" width=\"790\" /></div>\r\n</div>');
INSERT INTO `df_goods` VALUES ('16', '2020-05-22 09:02:19.752897', '2020-05-22 09:02:19.752927', '0', '活珠子', '<p><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i2/3165851409/O1CN01ISADng1MHMcKXfTKE_!!3165851409.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i3/3165851409/O1CN01MINXCF1MHMcLTL7ux_!!3165851409.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i1/3165851409/O1CN01OgHYDL1MHMcJFq7GM_!!3165851409.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i4/3165851409/O1CN01dWW6Yq1MHMcJzsTNm_!!3165851409.jpg\" alt=\"\" align=\"absmiddle\" /></p>');
INSERT INTO `df_goods` VALUES ('17', '2020-05-22 09:04:43.792149', '2020-05-22 09:04:59.319643', '0', '甜牛奶', '<p><span style=\"margin: 0px; padding: 0px; font-weight: bold; font-family: tahoma, arial, 宋体, sans-serif; text-align: center; color: #ff0000; font-size: 48px; line-height: 72px;\"><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; float: none;\" src=\"https://img.alicdn.com/imgextra/i3/3605830807/O1CN011Hpe5uwxn6YodZQ_!!3605830807.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; float: none;\" src=\"https://img.alicdn.com/imgextra/i1/3605830807/O1CN01mlYwDq1Hpe8tdmQO2_!!3605830807.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; float: none;\" src=\"https://img.alicdn.com/imgextra/i1/3605830807/O1CN011Hpe5zldfroTsb3_!!3605830807.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; float: none;\" src=\"https://img.alicdn.com/imgextra/i2/3605830807/O1CN011Hpe62nlRlLDsOm_!!3605830807.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; float: none;\" src=\"https://img.alicdn.com/imgextra/i1/3605830807/O1CN01NzYKGa1Hpe7hjtDyr_!!3605830807.jpg\" alt=\"\" align=\"absmiddle\" /></span></p>');
INSERT INTO `df_goods` VALUES ('18', '2020-05-22 09:12:08.766495', '2020-05-22 09:12:08.766522', '0', '水饺', '<table style=\"margin: 0px auto; padding: 0px; border-spacing: 0px; border-color: #000000; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody style=\"margin: 0px; padding: 0px;\">\r\n<tr style=\"margin: 0px; padding: 0px;\">\r\n<td style=\"margin: 0px; padding: 0px; border-color: #000000;\">\r\n<div class=\"hlg_list_30196765\" style=\"margin: 0px; padding: 0px;\">\r\n<div style=\"margin: 0px; padding: 0px;\"><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; vertical-align: top; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1;\" src=\"https://img.alicdn.com/imgextra/i2/1024740735/O1CN01LnxQUT1HIfhBYHEng_!!1024740735.jpg\" alt=\"\" align=\"absmiddle\" /><map style=\"margin: 0px; padding: 0px;\" name=\"hlgCustomMap_ez330q_1583219552113\"></map></div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style=\"margin: 0px; padding: 0px; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\"><a style=\"margin: 0px; padding: 0px; color: #3355aa; outline: 0px;\" name=\"hlg_list_1_30196765_end\"></a></div>\r\n<p style=\"margin: 1.12em 0px; padding: 0px; line-height: 1.4; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\"><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none;\" src=\"https://img.alicdn.com/imgextra/i3/1024740735/O1CN014PxPWl1HIffkVe9Oh_!!1024740735.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none;\" src=\"https://img.alicdn.com/imgextra/i3/1024740735/O1CN01E6EuEH1HIfhWQYJv7_!!1024740735.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none;\" src=\"https://img.alicdn.com/imgextra/i3/1024740735/O1CN01iUMIeF1HIfhZQhMHa_!!1024740735.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none;\" src=\"https://img.alicdn.com/imgextra/i1/1024740735/O1CN01L0KaX41HIfhWt5Og9_!!1024740735.jpg\" alt=\"\" align=\"absmiddle\" /></p>');
INSERT INTO `df_goods` VALUES ('19', '2020-05-22 09:15:21.497218', '2020-05-22 09:15:21.497248', '0', '汤圆', '<p><img style=\"vertical-align: top; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; max-width: 750px;\" src=\"https://img.alicdn.com/imgextra/i2/2200717935970/O1CN01kLcPy11tyJ5jg5uTR_!!2200717935970.jpg\" alt=\"\" align=\"absmiddle\" data-spm-anchor-id=\"2013.1.0.i0.4bbd6488pQOOex\" /><img style=\"vertical-align: top; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; max-width: 750px;\" src=\"https://img.alicdn.com/imgextra/i4/2200717935970/O1CN01pp54t81tyJ5mOoPFS_!!2200717935970.jpg\" alt=\"\" align=\"absmiddle\" /><img style=\"vertical-align: top; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; max-width: 750px;\" src=\"https://img.alicdn.com/imgextra/i3/2200717935970/O1CN01cn9Wkr1tyJ5i3UqM0_!!2200717935970.jpg\" alt=\"\" align=\"absmiddle\" /><img style=\"vertical-align: top; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; max-width: 750px;\" src=\"https://img.alicdn.com/imgextra/i1/2200717935970/O1CN01MRLjQz1tyJ5kJhl1J_!!2200717935970.jpg\" alt=\"\" align=\"absmiddle\" /><img style=\"vertical-align: top; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; max-width: 750px;\" src=\"https://img.alicdn.com/imgextra/i1/2200717935970/O1CN01RaF6KO1tyJ5mOqgq0_!!2200717935970.jpg\" alt=\"\" align=\"absmiddle\" /></p>');
INSERT INTO `df_goods` VALUES ('20', '2020-05-22 09:17:23.568193', '2020-05-22 09:17:23.568231', '0', '贡菜', '<table style=\"border-collapse: collapse; border-spacing: 0px; color: #000000; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" width=\"750\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td style=\"margin: 0px; padding: 0px;\"><img style=\"vertical-align: top;\" src=\"https://img.alicdn.com/imgextra/i3/71262992/O1CN011XyNUXW0mzQSv3c_!!71262992.jpg\" alt=\"\" width=\"750\" height=\"135\" border=\"0\" /></td>\r\n</tr>\r\n<tr>\r\n<td style=\"margin: 0px; padding: 0px;\"><img style=\"vertical-align: top;\" src=\"https://img.alicdn.com/imgextra/i4/71262992/TB2B2eNCxSYBuNjSsphXXbGvVXa_!!71262992.jpg_q90.jpg\" alt=\"\" width=\"750\" height=\"270\" border=\"0\" /></td>\r\n</tr>\r\n<tr>\r\n<td style=\"margin: 0px; padding: 0px;\"><img style=\"vertical-align: top;\" src=\"https://img.alicdn.com/imgextra/i1/71262992/TB2ma.ziZuYBuNkSmRyXXcA3pXa_!!71262992.jpg\" alt=\"\" width=\"750\" height=\"253\" border=\"0\" /></td>\r\n</tr>\r\n<tr>\r\n<td style=\"margin: 0px; padding: 0px;\"><img style=\"vertical-align: top;\" src=\"https://img.alicdn.com/imgextra/i2/71262992/TB2BqnUrASWBuNjSszdXXbeSpXa_!!71262992.jpg\" alt=\"\" width=\"750\" height=\"430\" border=\"0\" /></td>\r\n</tr>\r\n<tr>\r\n<td style=\"margin: 0px; padding: 0px;\"><img style=\"vertical-align: top;\" src=\"https://img.alicdn.com/imgextra/i3/71262992/TB2_FXZuiCYBuNkSnaVXXcMsVXa_!!71262992.jpg_q90.jpg\" alt=\"\" width=\"750\" height=\"361\" border=\"0\" /></td>\r\n</tr>\r\n<tr>\r\n<td style=\"margin: 0px; padding: 0px;\"><img style=\"vertical-align: top;\" src=\"https://img.alicdn.com/imgextra/i2/71262992/TB21xnQrDJYBeNjy1zeXXahzVXa_!!71262992.jpg_q90.jpg\" alt=\"\" width=\"750\" height=\"40\" border=\"0\" /></td>\r\n</tr>\r\n<tr>\r\n<td style=\"margin: 0px; padding: 0px;\"><img style=\"vertical-align: top;\" src=\"https://img.alicdn.com/imgextra/i1/71262992/TB2_xHrxKuSBuNjSsplXXbe8pXa_!!71262992.jpg_q90.jpg\" alt=\"\" width=\"750\" height=\"931\" border=\"0\" /></td>\r\n</tr>\r\n<tr>\r\n<td style=\"margin: 0px; padding: 0px;\"><img style=\"vertical-align: top;\" src=\"https://img.alicdn.com/imgextra/i3/71262992/TB2LAVRiBjTBKNjSZFNXXasFXXa_!!71262992.jpg_q90.jpg\" alt=\"\" width=\"750\" height=\"462\" border=\"0\" /></td>\r\n</tr>\r\n<tr>\r\n<td style=\"margin: 0px; padding: 0px;\"><img style=\"vertical-align: top;\" src=\"https://img.alicdn.com/imgextra/i2/71262992/TB2UojNxHuWBuNjSszgXXb8jVXa_!!71262992.jpg\" alt=\"\" width=\"750\" height=\"475\" border=\"0\" /></td>\r\n</tr>\r\n<tr>\r\n<td style=\"margin: 0px; padding: 0px;\">\r\n<p style=\"margin: 1.12em 0px; padding: 0px;\" align=\"center\"><img style=\"vertical-align: top;\" src=\"https://img.alicdn.com/imgextra/i1/71262992/O1CN01BGyJAm1XyNXiACZgy_!!71262992.jpg\" alt=\"\" width=\"700\" height=\"700\" border=\"0\" /></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"margin: 0px; padding: 0px;\"><img style=\"vertical-align: top;\" src=\"https://img.alicdn.com/imgextra/i2/71262992/TB2FD1iucyYBuNkSnfoXXcWgVXa_!!71262992.jpg\" alt=\"\" width=\"750\" height=\"164\" border=\"0\" /></td>\r\n</tr>\r\n<tr>\r\n<td style=\"margin: 0px; padding: 0px;\"><img style=\"vertical-align: top;\" src=\"https://img.alicdn.com/imgextra/i4/71262992/TB2nUt9iCcqBKNjSZFgXXX_kXXa_!!71262992.jpg_q90.jpg\" alt=\"\" width=\"750\" height=\"563\" border=\"0\" /></td>\r\n</tr>\r\n</tbody>\r\n</table>');
INSERT INTO `df_goods` VALUES ('21', '2020-05-22 09:19:34.897597', '2020-05-22 09:19:34.897627', '0', '鱿鱼', '<p><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i4/2207423615082/O1CN01M9Nnvx1nPbOrsy21t_!!2207423615082.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i2/2207423615082/O1CN01M1Zcvc1nPbOtx1I9E_!!2207423615082.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i2/2207423615082/O1CN01rudQzM1nPbOuCOCkA_!!2207423615082.jpg\" alt=\"\" align=\"absmiddle\" /></p>');
INSERT INTO `df_goods` VALUES ('22', '2020-05-22 09:24:16.682314', '2020-05-22 09:24:34.175781', '0', '橙子', '<p><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i4/2926862984/O1CN01ZphsDx1XuiSfYSabD_!!2926862984.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i2/2926862984/O1CN01C2a7f71XuiSEofVEC_!!2926862984.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i4/2926862984/O1CN013zvuMk1XuiSE1r9gD_!!2926862984.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i1/2926862984/O1CN01IKDuV11XuiSTK7SGN_!!2926862984.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i4/2926862984/O1CN01qMCMxs1XuiRiWxPSp_!!2926862984.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i2/2926862984/O1CN01dOO15W1XuiRm2UM90_!!2926862984.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i4/2926862984/O1CN01oYMlzt1XuiRkzea69_!!2926862984.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i1/2926862984/O1CN01zBKF5w1XuiRgDMpph_!!2926862984.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i2/2926862984/O1CN01Rudol91XuiQGlNYN5_!!2926862984.jpg\" alt=\"\" align=\"absmiddle\" /></p>');
INSERT INTO `df_goods` VALUES ('23', '2020-05-22 09:29:44.037391', '2020-05-22 09:29:44.037433', '0', '皮蛋', '<p><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i2/3326596597/O1CN01CxIH0O1ybTRT1AzrM_!!3326596597.jpg\" alt=\"\" align=\"absmiddle\" data-spm-anchor-id=\"a220o.1000855.0.i0.6b741ffa9BOnP6\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i2/3326596597/O1CN01w0qHF51ybTLdyxeYM_!!3326596597.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i1/3326596597/O1CN01RV9dPD1ybTLdbAm8S_!!3326596597.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i3/3326596597/O1CN01ApCyMl1ybTLdyxr2K_!!3326596597.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i3/3326596597/O1CN01330kB91ybTQVziazL_!!3326596597.jpg\" alt=\"\" align=\"absmiddle\" /></p>');
INSERT INTO `df_goods` VALUES ('24', '2020-05-22 09:32:04.249661', '2020-05-22 09:32:04.249689', '0', '茄子', '<p><img style=\"vertical-align: top; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; text-align: center; max-width: 750px;\" src=\"https://img.alicdn.com/imgextra/i2/260204593/TB2NTZHfqQoBKNjSZJnXXaw9VXa_!!260204593.jpg\" alt=\"\" align=\"absmiddle\" /><img style=\"vertical-align: top; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; text-align: center; max-width: 750px;\" src=\"https://img.alicdn.com/imgextra/i2/260204593/TB2.GYvrXOWBuNjy0FiXXXFxVXa_!!260204593.jpg\" alt=\"\" align=\"absmiddle\" /><img style=\"vertical-align: top; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; text-align: center; max-width: 750px;\" src=\"https://img.alicdn.com/imgextra/i1/260204593/TB2QjcIrnlYBeNjSszcXXbwhFXa_!!260204593.jpg\" alt=\"\" align=\"absmiddle\" /><img style=\"vertical-align: top; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; text-align: center; max-width: 750px;\" src=\"https://img.alicdn.com/imgextra/i1/260204593/TB2P.wfrhGYBuNjy0FnXXX5lpXa_!!260204593.jpg\" alt=\"\" align=\"absmiddle\" /></p>');
INSERT INTO `df_goods` VALUES ('25', '2020-05-22 09:48:34.219143', '2020-05-22 09:48:34.219172', '0', '荔枝', '<p><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i3/3408811717/O1CN01WUqZIU1OYQdglwh9V_!!3408811717.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i2/3408811717/O1CN01DrTCIx1OYQdjnfHG0_!!3408811717.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i2/3408811717/O1CN01vHXZk71OYQdl73uU7_!!3408811717.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i1/3408811717/O1CN01zWJ7Ks1OYQddVeAbD_!!3408811717.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i1/3408811717/O1CN01uZoXQv1OYQdeT83yj_!!3408811717.jpg\" alt=\"\" align=\"absmiddle\" /></p>');
INSERT INTO `df_goods` VALUES ('26', '2020-05-25 20:56:59.925768', '2020-05-25 20:56:59.925821', '0', '山药', '<p><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i3/2830136561/O1CN01ucG09V1yKz7dLLkwJ_!!2830136561.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i1/2830136561/O1CN01sH21K91yKz7dzhFiQ_!!2830136561.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i4/2830136561/O1CN01rYjwUp1yKz7ehk0xD_!!2830136561.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i3/2830136561/O1CN01Y8b1O91yKz7ZK3q0D_!!2830136561.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i3/2830136561/O1CN01qF1W0V1yKz7UmIWu1_!!2830136561.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; max-width: 100%; float: none; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" src=\"https://img.alicdn.com/imgextra/i1/2830136561/O1CN01Iid1231yKz7brb2Ko_!!2830136561.jpg\" alt=\"\" align=\"absmiddle\" /></p>');
INSERT INTO `df_goods` VALUES ('27', '2020-05-25 21:04:56.028751', '2020-05-25 21:04:56.028789', '0', '西兰花', '<p><a style=\"margin: 0px; padding: 0px; color: #3355aa; outline: 0px; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" href=\"https://tuan.we.app.jae.m.taobao.com/check-security/domainTransform.do?target_url=baoxiangnew.ews.m.jaeapp.com00app00collectionCoupon00index.do&amp;userId=316093&amp;aid=122169\" target=\"_blank\"><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; float: none;\" src=\"https://img.alicdn.com/imgextra/i2/3548737978/O1CN01JWB3hS28nyNMndPWU_!!3548737978.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; float: none;\" src=\"https://img.alicdn.com/imgextra/i1/3548737978/O1CN01CaIjNL28nyNModRTl_!!3548737978.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; float: none;\" src=\"https://img.alicdn.com/imgextra/i1/3548737978/O1CN01MzKgma28nyNSdTUFM_!!3548737978.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; float: none;\" src=\"https://img.alicdn.com/imgextra/i2/3548737978/O1CN01qEXm7328nyNQDGBOF_!!3548737978.jpg\" alt=\"\" align=\"absmiddle\" /><img class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; animation: 350ms linear 0ms 1 normal both running ks-fadeIn; opacity: 1; vertical-align: top; float: none;\" src=\"https://img.alicdn.com/imgextra/i3/3548737978/O1CN01gtZPQ928nyNLcu3Vj_!!3548737978.jpg\" alt=\"\" align=\"absmiddle\" /></a></p>');

-- ----------------------------
-- Table structure for `df_goods_image`
-- ----------------------------
DROP TABLE IF EXISTS `df_goods_image`;
CREATE TABLE `df_goods_image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `image` varchar(100) NOT NULL,
  `sku_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_goods_image_sku_id_f8dc96ea_fk_df_goods_sku_id` (`sku_id`),
  CONSTRAINT `df_goods_image_sku_id_f8dc96ea_fk_df_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `df_goods_sku` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_goods_image
-- ----------------------------

-- ----------------------------
-- Table structure for `df_goods_sku`
-- ----------------------------
DROP TABLE IF EXISTS `df_goods_sku`;
CREATE TABLE `df_goods_sku` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `desc` varchar(256) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `unite` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `stock` int NOT NULL,
  `sales` int NOT NULL,
  `status` smallint NOT NULL,
  `goods_id` int NOT NULL,
  `type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_goods_sku_type_id_576de3b4_fk_df_goods_type_id` (`type_id`),
  KEY `df_goods_sku_goods_id_31622280_fk_df_goods_id` (`goods_id`),
  CONSTRAINT `df_goods_sku_goods_id_31622280_fk_df_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `df_goods` (`id`),
  CONSTRAINT `df_goods_sku_type_id_576de3b4_fk_df_goods_type_id` FOREIGN KEY (`type_id`) REFERENCES `df_goods_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_goods_sku
-- ----------------------------
INSERT INTO `df_goods_sku` VALUES ('1', '2020-05-04 10:35:07.412854', '2020-05-25 15:13:06.162691', '0', '西冷牛排', '西冷牛排（Sirloin)，主要是由上腰部的脊肉构成，西冷牛排按质量的不同又可分为小块西冷牛排（entrecte）和大块西冷牛排', '71.25', '500g', 'images/goods/niupai.jpg', '867', '70', '1', '1', '3');
INSERT INTO `df_goods_sku` VALUES ('2', '2020-05-05 00:47:05.970105', '2020-05-26 02:52:36.397680', '0', '海南芭蕉', '海南芭蕉口感好，甜度高，专注海南新鲜水果，欢迎进店选购购买海南金都一号红心火龙果点击这里', '9.80', '500g', 'images/goods/goods009.jpg', '995', '59', '1', '2', '4');
INSERT INTO `df_goods_sku` VALUES ('3', '2020-05-05 01:25:47.725848', '2020-05-12 01:25:02.939593', '0', '鲜活加拿大进口波士顿龙虾', '【活鲜】味库 鲜活加拿大进口波士顿龙虾 400-500g 1只 日料食材 烧烤食材 海鲜水产', '129.00', '只', 'images/goods/longxia.jpg', '6', '56', '1', '3', '5');
INSERT INTO `df_goods_sku` VALUES ('4', '2020-05-05 03:52:36.142499', '2020-05-05 03:52:36.142530', '0', '红富士', '脆甜爽口 可带皮吃 坏果包赔 收藏优先发货', '39.90', '5kg', 'images/goods/goods101.jpg', '2013', '524', '1', '4', '4');
INSERT INTO `df_goods_sku` VALUES ('5', '2020-05-05 04:21:21.011661', '2020-05-05 05:51:55.070529', '0', '青苹果', '青苹果含有大量的维生素、矿物质和丰富的膳食纤维', '32.90', '5kg', 'images/goods/goods010.jpg', '1557', '32', '1', '4', '4');
INSERT INTO `df_goods_sku` VALUES ('6', '2020-05-05 06:02:15.001388', '2020-05-05 06:02:15.001416', '0', '黄金帅', '粉面香甜 10-12个左右 75#15个左右', '16.80', '2.5kg', 'images/goods/huangjinshuai.jpg', '8445', '342', '1', '4', '4');
INSERT INTO `df_goods_sku` VALUES ('7', '2020-05-05 00:47:05.970105', '2020-05-05 00:47:05.970134', '0', '海南芭蕉(整箱)', '海南芭蕉口感好，甜度高，专注海南新鲜水果，欢迎进店选购购买海南金都一号红心火龙果点击这里', '98.00', '5kg', 'images/goods/goods009.jpg', '324', '17', '1', '2', '4');
INSERT INTO `df_goods_sku` VALUES ('8', '2020-05-07 00:30:47.463621', '2020-05-07 00:30:47.463649', '0', '秋刀鱼2kg', '秋刀鱼（Cololabis saira）又称竹刀鱼，由于其体形修长如刀，生产季节在秋天，故名秋刀鱼', '28.90', '2kg', 'images/goods/goods020.jpg', '325', '26', '1', '5', '5');
INSERT INTO `df_goods_sku` VALUES ('9', '2020-05-07 00:39:14.299813', '2020-05-07 00:39:14.299843', '0', '无蔗糖冰激凌', '一个都不能少多口味系列 5种口味10片装冰淇淋雪糕冰激凌', '138.00', '箱', 'images/goods/bingjiling.jpg', '3992', '355', '1', '6', '8');
INSERT INTO `df_goods_sku` VALUES ('10', '2020-05-07 00:49:27.233335', '2020-05-07 00:49:27.233367', '0', '柴鸡蛋', '德青源鸡蛋到家思想谷物新鲜鸡蛋30枚装非柴鸡蛋土鸡蛋', '35.00', '500g', 'images/goods/jidan.jpg', '3878', '2127', '1', '7', '6');
INSERT INTO `df_goods_sku` VALUES ('11', '2020-05-07 00:52:39.979007', '2020-05-07 00:52:39.979031', '0', '空心芹菜', '青岛平度特产马家沟芹菜嫩芯 新鲜蔬菜 空心芹菜芯2斤装包邮', '32.90', '1kg', 'images/goods/qincai.jpg', '3240', '224', '1', '8', '7');
INSERT INTO `df_goods_sku` VALUES ('12', '2020-05-07 00:56:12.320358', '2020-05-10 03:54:31.147164', '0', '黑珍珠大樱桃', '山东烟台大樱桃车厘子5斤10新鲜水果包邮当季整箱黑珍珠大樱桃 自家果园，现摘现发，烟台福山大樱桃', '79.00', '500g', 'images/goods/yingtao.jpg', '4438', '241', '1', '9', '4');
INSERT INTO `df_goods_sku` VALUES ('13', '2020-05-07 01:00:57.217581', '2020-05-25 15:13:17.554788', '0', '菲力牛排', '【专区299-150】大希地整切菲力牛排新鲜牛肉冷冻牛扒500g赠酱包 整切菲力牛排', '159.00', '500g', 'images/goods/feiliniupai.jpg', '988', '33', '1', '1', '3');
INSERT INTO `df_goods_sku` VALUES ('14', '2020-05-07 01:04:48.437478', '2020-05-07 01:04:48.437503', '0', '烤海鸭蛋', '广西烤海鸭蛋20枚北部湾红树林原产地特产咸蛋正宗流油咸鸭蛋整箱', '31.80', '3kg', 'images/goods/kaohaiyadan.jpg', '5534', '223', '1', '10', '6');
INSERT INTO `df_goods_sku` VALUES ('15', '2020-05-07 01:06:12.639185', '2020-05-07 01:06:12.639213', '0', '草鸡蛋', '乡公馆鸡蛋土鸡蛋农家散养新鲜初生蛋鲜鸡蛋草鸡蛋初产蛋30枚', '29.90', '1kg', 'images/goods/caojidao.jpg', '553', '23', '1', '7', '6');
INSERT INTO `df_goods_sku` VALUES ('16', '2020-05-07 01:07:47.088114', '2020-05-22 06:56:26.333125', '0', '网红冰淇淋', 'tiptop网红冰淇淋大桶装新西兰进口冰激凌冷饮香草巧克力三色雪糕', '188.00', '盒', 'images/goods/wanghongbingjilin.jpg', '1343', '123', '1', '6', '8');
INSERT INTO `df_goods_sku` VALUES ('17', '2020-05-07 01:13:37.888237', '2020-05-12 01:24:52.907486', '0', '东库草莓', '东酷 丹东99草莓 新鲜3斤整箱应季当季水果孕妇 大草莓 顺丰包邮 精选优质大果 现摘三斤 空运包邮 秸秆', '59.00', '1.5kg', 'images/goods/dandongcaomei.jpg', '3329', '25', '1', '11', '4');
INSERT INTO `df_goods_sku` VALUES ('18', '2020-05-22 06:20:08.709566', '2020-05-22 06:20:08.709597', '0', '娃娃菜', '新鲜娃娃菜650g 新鲜蔬菜黄心小白菜火锅食材 江浙沪皖5件包邮', '8.80', '500g', 'images/goods/wwc.jpg', '9934', '22', '1', '12', '7');
INSERT INTO `df_goods_sku` VALUES ('19', '2020-05-22 06:22:11.318399', '2020-05-22 06:22:11.318432', '0', '娃娃菜 整箱', '新鲜娃娃菜650g 新鲜蔬菜黄心小白菜火锅食材 江浙沪皖5件包邮', '29.00', '2kg', 'images/goods/wwczx.jpg', '999', '34', '1', '12', '7');
INSERT INTO `df_goods_sku` VALUES ('20', '2020-05-22 06:29:15.030166', '2020-05-22 06:57:22.116306', '0', '水果黄瓜', '生态种植亦果亦蔬产地直供水果小黄瓜', '19.88', '2.5kg', 'images/goods/sghg.jpg', '6744', '322', '1', '13', '7');
INSERT INTO `df_goods_sku` VALUES ('21', '2020-05-22 06:45:38.775137', '2020-05-22 06:52:38.478719', '0', '白条鸡', '2只正宗土鸡三黄鸡新鲜整只草鸡冷冻白条鸡非农村农家散养老母鸡', '39.00', '1600g', 'images/goods/btj.jpg', '788', '23', '1', '14', '3');
INSERT INTO `df_goods_sku` VALUES ('22', '2020-05-22 09:00:53.122966', '2020-05-22 09:00:53.123004', '0', '连江小鲍鱼', '新鲜活鲍鱼大个连江小鲍鱼贝类海鲜水产500g顺丰包邮超大福建鲍鱼', '69.00', '500g', 'images/goods/baoyu.jpg', '542', '33', '1', '15', '5');
INSERT INTO `df_goods_sku` VALUES ('23', '2020-05-22 09:03:36.471872', '2020-05-22 09:03:36.471902', '0', '活珠子新鲜13天鸡胚蛋', '邮缘活珠子新鲜13天鸡胚蛋五香即食毛蛋凤凰熟钢化蛋20只非毛鸡蛋', '27.80', '800g', 'images/goods/huozhuzi.jpg', '433', '12', '1', '16', '6');
INSERT INTO `df_goods_sku` VALUES ('24', '2020-05-22 09:05:46.879617', '2020-05-22 09:05:46.879648', '0', '李子园甜牛奶 整箱', '李子园甜牛奶儿童早餐奶整箱225ml小瓶甜奶原味草莓含乳饮料特价', '44.00', '箱', 'images/goods/tianniunai.jpg', '553', '2', '1', '17', '6');
INSERT INTO `df_goods_sku` VALUES ('25', '2020-05-22 09:13:04.397217', '2020-05-22 09:13:04.397255', '0', '必品阁王饺子', '蒸煮煎炸 多种吃法 4种口味任意选择', '46.50', '1470g', 'images/goods/sudongshuijiao.jpg', '6642', '123', '1', '18', '8');
INSERT INTO `df_goods_sku` VALUES ('26', '2020-05-22 09:16:12.326771', '2020-05-22 09:16:12.326837', '0', '迪雀大黄米汤圆', '汤圆400克黑芝麻花生口味网红汤圆元宵2袋', '25.50', '500g', 'images/goods/tangyuan.jpg', '776', '23', '1', '19', '8');
INSERT INTO `df_goods_sku` VALUES ('27', '2020-05-22 09:18:03.661829', '2020-05-22 09:18:03.661863', '0', '特级无叶贡菜', '500g包邮特级无叶贡菜干新鲜苔干苔菜农家土特产干货脱水蔬菜响菜', '29.90', '500g', 'images/goods/gongcai.jpg', '4421', '142', '1', '20', '7');
INSERT INTO `df_goods_sku` VALUES ('28', '2020-05-22 09:20:18.363701', '2020-05-22 09:20:18.363730', '0', '新鲜深海鱿鱼须', '深海鱿鱼 去眼去牙去脖 不挂冰', '75.00', '1.5kg', 'images/goods/youyu.jpg', '6332', '234', '1', '21', '5');
INSERT INTO `df_goods_sku` VALUES ('29', '2020-05-22 09:25:34.209628', '2020-05-22 09:25:34.209657', '0', '中华红橙', '血橙新鲜水果秭归橙子9斤中华红橙当季整箱', '45.90', '箱（4.5kg）', 'images/goods/xuecheng.jpg', '7429', '354', '1', '22', '4');
INSERT INTO `df_goods_sku` VALUES ('30', '2020-05-22 09:30:53.979024', '2020-05-22 09:30:53.979053', '0', '丞贡园松花蛋', '丞贡园松花蛋皮蛋10枚溏心鸭蛋湖北特产无铅工艺农家散养变蛋', '29.90', '10枚', 'images/goods/pidan.jpg', '2365', '133', '1', '23', '6');
INSERT INTO `df_goods_sku` VALUES ('31', '2020-05-22 09:32:38.351114', '2020-05-22 09:32:38.351145', '0', '黑贵人长茄', '寿光蔬菜种子黑贵人长茄蔬菜种孑种籽春季秋冬四季茄子种籽特大苗', '6.00', '500g', 'images/goods/qiezi.jpg', '8346', '553', '1', '24', '7');
INSERT INTO `df_goods_sku` VALUES ('32', '2020-05-22 09:49:12.953805', '2020-05-22 09:49:12.953836', '0', '海南妃子笑荔枝', '现货海南妃子笑荔枝新鲜水果4斤带箱批发顺丰包邮净重3斤孕妇桂花', '56.80', '1.5kg', 'images/goods/lizhi.jpg', '7674', '234', '1', '25', '4');
INSERT INTO `df_goods_sku` VALUES ('33', '2020-05-22 09:57:27.106221', '2020-05-23 20:58:50.919419', '0', '波士顿龙虾', '龙虾波士顿大龙虾澳洲澳龙鲜活特大波龙奥龙波斯顿海鲜水产大活虾', '139.99', '只', 'images/goods/boshidunlongxia.jpg', '3311', '32', '1', '3', '5');
INSERT INTO `df_goods_sku` VALUES ('34', '2020-05-25 20:57:48.180966', '2020-05-25 20:57:48.181016', '0', '铁棍山药', '新鲜铁棍山药5斤装当季蔬菜小白嘴垆土紫色淮山药麻山药片', '29.80', '2.5kg', 'images/goods/shanyao.jpg', '996', '23', '1', '26', '7');
INSERT INTO `df_goods_sku` VALUES ('35', '2020-05-25 20:59:43.833194', '2020-05-25 20:59:43.833238', '0', '淮山药', '山药新鲜5斤小白嘴铁棍铁杆淮山药片 非河南焦作温县垆土蔬菜', '19.90', '2.5kg', 'images/goods/huaishanyao.jpg', '1993', '26', '1', '26', '7');
INSERT INTO `df_goods_sku` VALUES ('36', '2020-05-25 21:06:14.478271', '2020-05-25 21:06:14.478317', '0', '西兰花 5斤装', '山东农家自种西兰花新鲜5斤装花菜包邮当季西蓝青绿花现摘蔬菜椰', '33.90', '2.5kg', 'images/goods/xilanhua.jpg', '573', '21', '1', '27', '7');
INSERT INTO `df_goods_sku` VALUES ('37', '2020-05-25 21:33:02.562021', '2020-05-25 21:33:02.562055', '0', '西兰花 10斤装', '山东农家自种西兰花新鲜10斤装花菜包邮当季西蓝青绿花现摘蔬菜椰', '59.90', '5kg', 'images/goods/xilanhua2.jpg', '999', '34', '1', '27', '7');

-- ----------------------------
-- Table structure for `df_goods_type`
-- ----------------------------
DROP TABLE IF EXISTS `df_goods_type`;
CREATE TABLE `df_goods_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `logo` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `index` smallint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_goods_type
-- ----------------------------
INSERT INTO `df_goods_type` VALUES ('3', '2020-05-04 08:59:33.852434', '2020-05-05 01:00:20.539716', '0', '猪牛羊肉', 'meet', 'images/type/banner03.jpg', '2');
INSERT INTO `df_goods_type` VALUES ('4', '2020-05-05 00:43:48.603184', '2020-05-05 01:00:16.041958', '0', '新鲜水果', 'fruit', 'images/type/banner01.jpg', '0');
INSERT INTO `df_goods_type` VALUES ('5', '2020-05-05 00:57:21.251747', '2020-05-05 01:00:12.497870', '0', '海鲜水产', 'seafood', 'images/type/banner02.jpg', '1');
INSERT INTO `df_goods_type` VALUES ('6', '2020-05-07 00:24:48.332658', '2020-05-22 09:07:14.712695', '0', '禽类蛋奶', 'egg', 'images/type/banner04.jpg', '3');
INSERT INTO `df_goods_type` VALUES ('7', '2020-05-07 00:25:11.817205', '2020-05-07 00:25:11.817234', '0', '新鲜蔬菜', 'vegetables', 'images/type/banner05.jpg', '4');
INSERT INTO `df_goods_type` VALUES ('8', '2020-05-07 00:25:35.514523', '2020-05-07 00:25:35.514549', '0', '速冻食品', 'ice', 'images/type/banner06.jpg', '5');

-- ----------------------------
-- Table structure for `df_index_banner`
-- ----------------------------
DROP TABLE IF EXISTS `df_index_banner`;
CREATE TABLE `df_index_banner` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `image` varchar(100) NOT NULL,
  `index` smallint NOT NULL,
  `sku_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_index_banner_sku_id_57f2798e_fk_df_goods_sku_id` (`sku_id`),
  CONSTRAINT `df_index_banner_sku_id_57f2798e_fk_df_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `df_goods_sku` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_index_banner
-- ----------------------------
INSERT INTO `df_index_banner` VALUES ('2', '2020-05-04 10:44:08.926365', '2020-05-04 13:43:09.131579', '0', 'images/banner/slide03.jpg', '0', '1');
INSERT INTO `df_index_banner` VALUES ('3', '2020-05-05 00:47:59.399049', '2020-05-25 17:35:23.211659', '0', 'images/banner/slide.jpg', '2', '2');
INSERT INTO `df_index_banner` VALUES ('4', '2020-05-25 16:30:06.578116', '2020-05-25 17:33:11.640592', '0', 'images/banner/slide02.jpg', '1', '19');

-- ----------------------------
-- Table structure for `df_index_promotion`
-- ----------------------------
DROP TABLE IF EXISTS `df_index_promotion`;
CREATE TABLE `df_index_promotion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(256) NOT NULL,
  `image` varchar(100) NOT NULL,
  `index` smallint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_index_promotion
-- ----------------------------
INSERT INTO `df_index_promotion` VALUES ('2', '2020-05-03 22:04:52.467905', '2020-05-25 13:57:07.178007', '0', '盛夏尝鲜季', 'http://www.baidu.com/', 'images/banner/adv02.jpg', '0');
INSERT INTO `df_index_promotion` VALUES ('3', '2020-05-04 14:23:47.448018', '2020-05-25 15:52:55.954046', '0', '吃货暑假趴', 'http://www.taobao.com/', 'images/banner/adv01.jpg', '1');

-- ----------------------------
-- Table structure for `df_index_type_goods`
-- ----------------------------
DROP TABLE IF EXISTS `df_index_type_goods`;
CREATE TABLE `df_index_type_goods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `display_type` smallint NOT NULL,
  `index` smallint NOT NULL,
  `sku_id` int NOT NULL,
  `type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_index_type_goods_sku_id_0a8a17db_fk_df_goods_sku_id` (`sku_id`),
  KEY `df_index_type_goods_type_id_35192ffd_fk_df_goods_type_id` (`type_id`),
  CONSTRAINT `df_index_type_goods_sku_id_0a8a17db_fk_df_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `df_goods_sku` (`id`),
  CONSTRAINT `df_index_type_goods_type_id_35192ffd_fk_df_goods_type_id` FOREIGN KEY (`type_id`) REFERENCES `df_goods_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_index_type_goods
-- ----------------------------
INSERT INTO `df_index_type_goods` VALUES ('3', '2020-05-04 15:48:09.351691', '2020-05-05 00:56:18.380528', '0', '0', '1', '1', '3');
INSERT INTO `df_index_type_goods` VALUES ('4', '2020-05-05 00:38:00.029572', '2020-05-05 00:38:00.029601', '0', '1', '0', '1', '3');
INSERT INTO `df_index_type_goods` VALUES ('5', '2020-05-05 01:17:13.637395', '2020-05-05 01:17:13.637426', '0', '1', '0', '2', '4');
INSERT INTO `df_index_type_goods` VALUES ('6', '2020-05-05 01:18:41.462700', '2020-05-05 01:25:59.610555', '0', '1', '0', '3', '5');
INSERT INTO `df_index_type_goods` VALUES ('7', '2020-05-07 00:44:38.093324', '2020-05-07 00:46:32.337319', '0', '1', '1', '8', '5');
INSERT INTO `df_index_type_goods` VALUES ('8', '2020-05-07 00:44:49.829765', '2020-05-22 09:21:43.620310', '0', '1', '3', '9', '8');
INSERT INTO `df_index_type_goods` VALUES ('9', '2020-05-07 00:56:43.569283', '2020-05-07 00:56:43.569310', '0', '1', '1', '12', '4');
INSERT INTO `df_index_type_goods` VALUES ('10', '2020-05-07 00:56:57.362090', '2020-05-07 00:56:57.362121', '0', '1', '2', '4', '4');
INSERT INTO `df_index_type_goods` VALUES ('11', '2020-05-07 01:01:09.390215', '2020-05-07 01:01:09.390244', '0', '1', '1', '13', '3');
INSERT INTO `df_index_type_goods` VALUES ('12', '2020-05-07 01:01:36.921262', '2020-05-22 08:57:41.650271', '0', '1', '3', '1', '3');
INSERT INTO `df_index_type_goods` VALUES ('13', '2020-05-07 01:02:09.891538', '2020-05-07 01:02:09.891568', '0', '1', '0', '10', '6');
INSERT INTO `df_index_type_goods` VALUES ('14', '2020-05-07 01:08:24.299879', '2020-05-22 09:21:50.767269', '0', '1', '0', '16', '8');
INSERT INTO `df_index_type_goods` VALUES ('15', '2020-05-07 01:08:41.678602', '2020-05-07 01:08:41.678630', '0', '1', '0', '11', '7');
INSERT INTO `df_index_type_goods` VALUES ('16', '2020-05-07 01:13:57.384672', '2020-05-07 01:13:57.384701', '0', '1', '3', '17', '4');
INSERT INTO `df_index_type_goods` VALUES ('17', '2020-05-22 06:39:05.766730', '2020-05-22 06:39:05.766773', '0', '1', '0', '18', '7');
INSERT INTO `df_index_type_goods` VALUES ('18', '2020-05-22 06:39:10.740398', '2020-05-22 06:39:10.740430', '0', '1', '0', '20', '7');
INSERT INTO `df_index_type_goods` VALUES ('19', '2020-05-22 08:57:09.627654', '2020-05-22 08:57:09.627688', '0', '1', '2', '21', '3');
INSERT INTO `df_index_type_goods` VALUES ('20', '2020-05-22 09:06:10.372492', '2020-05-22 09:06:10.372523', '0', '1', '1', '23', '6');
INSERT INTO `df_index_type_goods` VALUES ('21', '2020-05-22 09:07:29.395153', '2020-05-22 09:07:29.395184', '0', '1', '2', '24', '6');
INSERT INTO `df_index_type_goods` VALUES ('22', '2020-05-22 09:08:00.781851', '2020-05-22 09:08:00.781885', '0', '1', '2', '22', '5');
INSERT INTO `df_index_type_goods` VALUES ('23', '2020-05-22 09:09:41.551778', '2020-05-22 09:09:41.551809', '0', '1', '3', '14', '6');
INSERT INTO `df_index_type_goods` VALUES ('25', '2020-05-22 09:13:16.456292', '2020-05-22 09:13:16.456321', '0', '1', '2', '25', '8');
INSERT INTO `df_index_type_goods` VALUES ('26', '2020-05-22 09:16:19.018955', '2020-05-22 09:21:56.831372', '0', '1', '1', '26', '8');
INSERT INTO `df_index_type_goods` VALUES ('27', '2020-05-22 09:18:13.790604', '2020-05-22 09:18:13.790633', '0', '1', '3', '27', '7');
INSERT INTO `df_index_type_goods` VALUES ('28', '2020-05-22 09:20:21.510259', '2020-05-22 09:20:21.510289', '0', '1', '3', '28', '5');
INSERT INTO `df_index_type_goods` VALUES ('29', '2020-05-22 09:22:37.027264', '2020-05-22 09:22:45.700611', '0', '0', '1', '13', '3');
INSERT INTO `df_index_type_goods` VALUES ('31', '2020-05-22 09:26:08.696265', '2020-05-22 09:26:08.696294', '0', '0', '0', '29', '4');
INSERT INTO `df_index_type_goods` VALUES ('32', '2020-05-22 09:26:20.857009', '2020-05-22 09:26:20.857039', '0', '0', '1', '5', '4');
INSERT INTO `df_index_type_goods` VALUES ('33', '2020-05-22 09:27:23.972385', '2020-05-25 20:10:08.582815', '0', '0', '0', '28', '5');
INSERT INTO `df_index_type_goods` VALUES ('34', '2020-05-22 09:27:45.787059', '2020-05-25 17:39:50.182903', '0', '0', '0', '15', '6');
INSERT INTO `df_index_type_goods` VALUES ('35', '2020-05-22 09:31:01.983744', '2020-05-22 09:31:01.983783', '0', '0', '0', '30', '6');
INSERT INTO `df_index_type_goods` VALUES ('36', '2020-05-22 09:32:43.941506', '2020-05-25 17:39:17.497908', '0', '0', '0', '31', '7');
INSERT INTO `df_index_type_goods` VALUES ('37', '2020-05-22 09:32:54.116894', '2020-05-25 20:10:55.976271', '0', '0', '0', '25', '8');

-- ----------------------------
-- Table structure for `df_order_goods`
-- ----------------------------
DROP TABLE IF EXISTS `df_order_goods`;
CREATE TABLE `df_order_goods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `count` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `comment` varchar(256) NOT NULL,
  `order_id` varchar(128) NOT NULL,
  `sku_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_order_goods_order_id_6958ee23_fk_df_order_info_order_id` (`order_id`),
  KEY `df_order_goods_sku_id_b7d6e04e_fk_df_goods_sku_id` (`sku_id`),
  CONSTRAINT `df_order_goods_order_id_6958ee23_fk_df_order_info_order_id` FOREIGN KEY (`order_id`) REFERENCES `df_order_info` (`order_id`),
  CONSTRAINT `df_order_goods_sku_id_b7d6e04e_fk_df_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `df_goods_sku` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_order_goods
-- ----------------------------
INSERT INTO `df_order_goods` VALUES ('8', '2020-05-12 01:24:52.906656', '2020-05-12 01:24:52.906684', '0', '3', '177.00', '', '202005120124428990691', '17');
INSERT INTO `df_order_goods` VALUES ('9', '2020-05-12 01:25:02.938851', '2020-05-12 01:25:02.938879', '0', '5', '142.50', '', '202005120124428990691', '3');
INSERT INTO `df_order_goods` VALUES ('10', '2020-05-15 02:40:26.885582', '2020-05-15 02:40:26.885614', '0', '2', '258.00', '', '202005150240168626592', '3');
INSERT INTO `df_order_goods` VALUES ('11', '2020-05-15 02:51:59.942304', '2020-05-15 02:51:59.942331', '0', '2', '142.50', '', '202005150251599330372', '1');
INSERT INTO `df_order_goods` VALUES ('12', '2020-05-15 02:54:14.195728', '2020-05-21 11:25:45.682381', '0', '2', '142.50', 'test comment', '202005150254041788652', '1');
INSERT INTO `df_order_goods` VALUES ('13', '2020-05-15 02:55:28.845782', '2020-05-15 02:55:28.845809', '0', '2', '142.50', '', '202005150255188330642', '1');
INSERT INTO `df_order_goods` VALUES ('14', '2020-05-15 02:55:40.034235', '2020-05-15 02:55:40.034308', '0', '2', '142.50', '', '202005150255200003651', '1');
INSERT INTO `df_order_goods` VALUES ('15', '2020-05-15 02:57:50.405962', '2020-05-15 02:57:50.405992', '0', '3', '29.40', '', '202005150257403842452', '2');
INSERT INTO `df_order_goods` VALUES ('16', '2020-05-15 03:39:11.569882', '2020-05-15 03:39:11.569910', '0', '4', '316.00', '', '202005150339115493892', '12');
INSERT INTO `df_order_goods` VALUES ('17', '2020-05-15 07:05:23.166710', '2020-05-15 07:05:23.166736', '0', '2', '57.80', '', '202005150705231366852', '8');
INSERT INTO `df_order_goods` VALUES ('18', '2020-05-15 07:05:23.171190', '2020-05-15 07:05:23.171219', '0', '3', '177.00', '', '202005150705231366852', '17');
INSERT INTO `df_order_goods` VALUES ('19', '2020-05-15 08:40:42.661313', '2020-05-15 08:40:42.661342', '0', '3', '177.00', '', '202005150840426473432', '17');
INSERT INTO `df_order_goods` VALUES ('20', '2020-05-21 10:54:57.181262', '2020-05-21 10:54:57.181297', '0', '1', '28.90', '', '202005211054571618562', '8');
INSERT INTO `df_order_goods` VALUES ('21', '2020-05-21 11:27:09.711004', '2020-05-21 11:27:09.711036', '0', '1', '32.90', '', '202005211127097005192', '11');
INSERT INTO `df_order_goods` VALUES ('22', '2020-05-21 11:27:09.715281', '2020-05-21 11:27:09.715313', '0', '1', '35.00', '', '202005211127097005192', '10');
INSERT INTO `df_order_goods` VALUES ('23', '2020-05-21 11:28:51.772222', '2020-05-22 05:17:31.151054', '0', '1', '35.00', '柴鸡蛋不错，价格实惠，超值~！', '202005211128517669712', '10');
INSERT INTO `df_order_goods` VALUES ('24', '2020-05-21 11:28:51.775017', '2020-05-22 05:17:31.173569', '0', '1', '9.80', '', '202005211128517669712', '2');
INSERT INTO `df_order_goods` VALUES ('25', '2020-05-22 05:46:14.257764', '2020-05-22 05:48:45.817520', '0', '1', '79.00', '这樱桃味道不错，吃完考虑回购', '202005220546142477821', '12');
INSERT INTO `df_order_goods` VALUES ('26', '2020-05-22 05:46:14.266800', '2020-05-22 05:48:45.826173', '0', '2', '70.00', '大家都说你家柴鸡蛋好吃，买来果然名不虚传，大家别犹豫了，过几天要涨价啊~', '202005220546142477821', '10');
INSERT INTO `df_order_goods` VALUES ('27', '2020-05-24 17:47:54.728396', '2020-05-24 17:50:21.448637', '0', '2', '91.80', '橙子很好吃，么么哒', '202005241747547228865', '29');

-- ----------------------------
-- Table structure for `df_order_info`
-- ----------------------------
DROP TABLE IF EXISTS `df_order_info`;
CREATE TABLE `df_order_info` (
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `order_id` varchar(128) NOT NULL,
  `pay_method` smallint NOT NULL,
  `total_count` int NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `transit_price` decimal(10,2) NOT NULL,
  `order_status` smallint NOT NULL,
  `trade_no` varchar(128) NOT NULL,
  `addr_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `df_order_info_addr_id_70c3726e_fk_df_address_id` (`addr_id`),
  KEY `df_order_info_user_id_ac1e5bf5_fk_df_user_id` (`user_id`),
  CONSTRAINT `df_order_info_addr_id_70c3726e_fk_df_address_id` FOREIGN KEY (`addr_id`) REFERENCES `df_address` (`id`),
  CONSTRAINT `df_order_info_user_id_ac1e5bf5_fk_df_user_id` FOREIGN KEY (`user_id`) REFERENCES `df_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_order_info
-- ----------------------------
INSERT INTO `df_order_info` VALUES ('2020-05-12 01:24:42.899347', '2020-05-12 01:25:03.183410', '0', '202005120124428990691', '3', '8', '822.00', '10.00', '1', '', '1', '1');
INSERT INTO `df_order_info` VALUES ('2020-05-15 02:40:16.863528', '2020-05-15 02:40:26.895329', '0', '202005150240168626592', '3', '2', '258.00', '10.00', '4', '', '3', '2');
INSERT INTO `df_order_info` VALUES ('2020-05-15 02:51:59.933846', '2020-05-15 02:51:59.943362', '0', '202005150251599330372', '3', '2', '142.50', '10.00', '4', '', '3', '2');
INSERT INTO `df_order_info` VALUES ('2020-05-15 02:54:04.179531', '2020-05-21 11:25:45.705402', '0', '202005150254041788652', '3', '2', '142.50', '10.00', '4', '2020052122001478390504921675', '3', '2');
INSERT INTO `df_order_info` VALUES ('2020-05-15 02:55:18.833689', '2020-05-15 02:55:28.846690', '0', '202005150255188330642', '3', '2', '142.50', '10.00', '4', '', '3', '2');
INSERT INTO `df_order_info` VALUES ('2020-05-15 02:55:20.000950', '2020-05-15 02:55:40.034960', '0', '202005150255200003651', '3', '2', '142.50', '10.00', '1', '', '1', '1');
INSERT INTO `df_order_info` VALUES ('2020-05-15 02:57:40.384960', '2020-05-15 02:57:50.407243', '0', '202005150257403842452', '3', '3', '29.40', '10.00', '4', '', '3', '2');
INSERT INTO `df_order_info` VALUES ('2020-05-15 03:39:11.550070', '2020-05-15 03:39:11.571552', '0', '202005150339115493892', '3', '4', '316.00', '10.00', '1', '', '3', '2');
INSERT INTO `df_order_info` VALUES ('2020-05-15 07:05:23.146766', '2020-05-15 07:05:23.171877', '0', '202005150705231366852', '3', '5', '234.80', '10.00', '1', '', '3', '2');
INSERT INTO `df_order_info` VALUES ('2020-05-15 08:40:42.647988', '2020-05-15 08:40:42.662148', '0', '202005150840426473432', '3', '3', '177.00', '10.00', '3', '', '3', '2');
INSERT INTO `df_order_info` VALUES ('2020-05-21 10:54:57.163622', '2020-05-21 10:55:38.196139', '0', '202005211054571618562', '3', '1', '28.90', '10.00', '4', '2020052122001478390504921999', '3', '2');
INSERT INTO `df_order_info` VALUES ('2020-05-21 11:27:09.701988', '2020-05-21 11:27:57.373157', '0', '202005211127097005192', '3', '2', '67.90', '10.00', '4', '2020052122001478390504921676', '3', '2');
INSERT INTO `df_order_info` VALUES ('2020-05-21 11:28:51.767586', '2020-05-22 05:17:31.179883', '0', '202005211128517669712', '3', '2', '44.80', '10.00', '4', '2020052122001478390504922191', '3', '2');
INSERT INTO `df_order_info` VALUES ('2020-05-22 05:46:14.249137', '2020-05-22 05:48:45.831753', '0', '202005220546142477821', '3', '3', '149.00', '10.00', '5', '2020052222001478390504922947', '1', '1');
INSERT INTO `df_order_info` VALUES ('2020-05-24 17:47:54.723521', '2020-05-24 17:50:21.455361', '0', '202005241747547228865', '3', '2', '91.80', '10.00', '5', '2020052422001478390504924575', '4', '5');

-- ----------------------------
-- Table structure for `df_user`
-- ----------------------------
DROP TABLE IF EXISTS `df_user`;
CREATE TABLE `df_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_user
-- ----------------------------
INSERT INTO `df_user` VALUES ('1', 'pbkdf2_sha256$180000$VbZAzYameyoD$j0vBcrSNC+t/ZU4l8e75c9vfff0XhoalEyMBa9WQWvQ=', '2020-05-23 20:55:41.350862', '0', 'smart', '', '', 'smart@zdy.com', '0', '1', '2020-05-01 18:21:49.948845', '2020-05-01 18:21:50.062119', '2020-05-01 18:21:50.077607', '0');
INSERT INTO `df_user` VALUES ('2', 'pbkdf2_sha256$180000$6h4HAQ9WHTFT$yTQpWm3qlPCpLxvkMWxEHvi7UneqBwEw+jzRXregCD0=', '2020-05-25 20:17:16.385583', '0', 'test1', '', '', '1844064995@qq.com', '0', '1', '2020-05-01 18:55:08.938400', '2020-05-01 18:55:09.054835', '2020-05-01 18:55:09.074154', '0');
INSERT INTO `df_user` VALUES ('3', 'pbkdf2_sha256$180000$SzZhZn9oLLnl$aqwGMFMkAB0CKx6BtBEPvLxHlJAoUOmFyvKAFM0hAx4=', '2020-05-26 00:24:23.126785', '1', 'admin', '', '', '1844064995@qq.com', '1', '1', '2020-05-03 13:14:38.123688', '2020-05-03 13:14:38.237854', '2020-05-03 13:14:38.237871', '0');
INSERT INTO `df_user` VALUES ('4', 'pbkdf2_sha256$180000$0l44YUQsyvVX$K5olpSYj3SwZLR+L/fZMlwziVDEWNPYBufe+cYv37fg=', null, '0', 'test2', '', '', '1844064995@qq.com', '0', '0', '2020-05-03 18:54:11.484953', '2020-05-03 18:54:11.604921', '2020-05-03 18:54:11.642087', '0');
INSERT INTO `df_user` VALUES ('5', 'pbkdf2_sha256$180000$NBe9FcUnucKw$kiGsckiY9DQYCUFGT9xCvGqH/ZzY8yWoOeqbhnhndmQ=', '2020-05-24 17:55:17.181529', '0', 'yanglixiang', '', '', '1158525969@qq.com', '0', '1', '2020-05-23 21:01:07.469363', '2020-05-23 21:01:07.583211', '2020-05-24 17:45:34.684524', '0');
INSERT INTO `df_user` VALUES ('6', 'pbkdf2_sha256$180000$SWcZRqIbtMGv$LOkrlGVUZyMo/nTPAI9caZlC4sEh7XZhPTpkFdKRJq4=', null, '1', 'yang', '', '', '1158525969@qq.com', '0', '0', '2020-05-23 21:42:04.469650', '2020-05-23 21:42:04.610721', '2020-05-24 14:49:49.426826', '0');

-- ----------------------------
-- Table structure for `df_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `df_user_groups`;
CREATE TABLE `df_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `df_user_groups_user_id_group_id_80e5ab91_uniq` (`user_id`,`group_id`),
  KEY `df_user_groups_group_id_36f24e94_fk_auth_group_id` (`group_id`),
  CONSTRAINT `df_user_groups_group_id_36f24e94_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `df_user_groups_user_id_a816b098_fk_df_user_id` FOREIGN KEY (`user_id`) REFERENCES `df_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `df_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `df_user_user_permissions`;
CREATE TABLE `df_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `df_user_user_permissions_user_id_permission_id_b22997de_uniq` (`user_id`,`permission_id`),
  KEY `df_user_user_permiss_permission_id_40a6cb2d_fk_auth_perm` (`permission_id`),
  CONSTRAINT `df_user_user_permiss_permission_id_40a6cb2d_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `df_user_user_permissions_user_id_b5f6551b_fk_df_user_id` FOREIGN KEY (`user_id`) REFERENCES `df_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_df_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_df_user_id` FOREIGN KEY (`user_id`) REFERENCES `df_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2020-05-03 14:54:29.774795', '1', '猪牛羊肉', '1', '[{\"added\": {}}]', '10', '3');
INSERT INTO `django_admin_log` VALUES ('2', '2020-05-03 14:57:27.003749', '1', '猪牛羊肉', '2', '[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u7c7b\\u578b\\u56fe\\u7247\"]}}]', '10', '3');
INSERT INTO `django_admin_log` VALUES ('3', '2020-05-03 14:58:33.250018', '1', '猪牛羊肉', '2', '[]', '10', '3');
INSERT INTO `django_admin_log` VALUES ('4', '2020-05-03 21:52:26.592196', '1', '猪牛羊肉', '2', '[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u7c7b\\u578b\\u56fe\\u7247\"]}}]', '10', '3');
INSERT INTO `django_admin_log` VALUES ('5', '2020-05-03 21:53:56.743238', '1', '猪牛羊肉', '3', '', '10', '3');
INSERT INTO `django_admin_log` VALUES ('6', '2020-05-03 21:55:38.133042', '2', '猪牛羊肉', '1', '[{\"added\": {}}]', '10', '3');
INSERT INTO `django_admin_log` VALUES ('7', '2020-05-03 22:04:52.544055', '2', 'IndexPromotionBanner object (2)', '1', '[{\"added\": {}}]', '11', '3');
INSERT INTO `django_admin_log` VALUES ('9', '2020-05-04 08:58:42.586149', '2', '猪牛羊肉', '3', '', '10', '3');
INSERT INTO `django_admin_log` VALUES ('10', '2020-05-04 08:59:33.857146', '3', '猪牛羊肉', '1', '[{\"added\": {}}]', '10', '3');
INSERT INTO `django_admin_log` VALUES ('11', '2020-05-04 09:16:20.300062', '2', 'IndexPromotionBanner object (2)', '2', '[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u987a\\u5e8f\"]}}]', '11', '3');
INSERT INTO `django_admin_log` VALUES ('12', '2020-05-04 09:21:01.609075', '2', 'IndexPromotionBanner object (2)', '2', '[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u987a\\u5e8f\"]}}]', '11', '3');
INSERT INTO `django_admin_log` VALUES ('13', '2020-05-04 10:24:09.498049', '1', 'Goods object (1)', '1', '[{\"added\": {}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('14', '2020-05-04 10:26:57.751193', '1', '精品牛排', '2', '[{\"changed\": {\"fields\": [\"\\u5546\\u54c1SPU\\u540d\\u79f0\"]}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('15', '2020-05-04 10:35:07.425280', '1', '西冷牛排', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('16', '2020-05-04 10:44:09.140812', '2', '西冷牛排', '1', '[{\"added\": {}}]', '13', '3');
INSERT INTO `django_admin_log` VALUES ('17', '2020-05-04 12:59:06.970817', '2', '西冷牛排', '2', '[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u94fe\\u63a5\"]}}]', '13', '3');
INSERT INTO `django_admin_log` VALUES ('18', '2020-05-04 13:01:35.022512', '2', '西冷牛排', '2', '[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u987a\\u5e8f\"]}}]', '13', '3');
INSERT INTO `django_admin_log` VALUES ('19', '2020-05-04 13:06:29.480646', '2', '西冷牛排', '2', '[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u987a\\u5e8f\"]}}]', '13', '3');
INSERT INTO `django_admin_log` VALUES ('20', '2020-05-04 13:43:09.208473', '2', '西冷牛排', '2', '[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u94fe\\u63a5\"]}}]', '13', '3');
INSERT INTO `django_admin_log` VALUES ('21', '2020-05-04 13:55:49.027716', '3', '猪牛羊肉', '2', '[{\"changed\": {\"fields\": [\"\\u6807\\u8bc6\"]}}]', '10', '3');
INSERT INTO `django_admin_log` VALUES ('22', '2020-05-04 14:10:19.202170', '3', '猪牛羊肉', '2', '[{\"changed\": {\"fields\": [\"\\u6807\\u8bc6\"]}}]', '10', '3');
INSERT INTO `django_admin_log` VALUES ('23', '2020-05-04 14:10:28.281202', '3', '猪牛羊肉', '2', '[{\"changed\": {\"fields\": [\"\\u6807\\u8bc6\"]}}]', '10', '3');
INSERT INTO `django_admin_log` VALUES ('24', '2020-05-04 14:23:47.549393', '3', '吃货暑假趴', '1', '[{\"added\": {}}]', '11', '3');
INSERT INTO `django_admin_log` VALUES ('25', '2020-05-04 14:31:07.525774', '3', '吃货暑假趴', '2', '[{\"changed\": {\"fields\": [\"\\u6d3b\\u52a8\\u56fe\\u7247\"]}}]', '11', '3');
INSERT INTO `django_admin_log` VALUES ('26', '2020-05-04 14:33:41.934360', '3', '吃货暑假趴', '2', '[{\"changed\": {\"fields\": [\"\\u6d3b\\u52a8\\u56fe\\u7247\"]}}]', '11', '3');
INSERT INTO `django_admin_log` VALUES ('27', '2020-05-04 14:34:38.411704', '2', '盛夏尝鲜季', '2', '[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u987a\\u5e8f\"]}}]', '11', '3');
INSERT INTO `django_admin_log` VALUES ('28', '2020-05-04 14:34:58.100507', '2', '盛夏尝鲜季', '2', '[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u987a\\u5e8f\"]}}]', '11', '3');
INSERT INTO `django_admin_log` VALUES ('29', '2020-05-04 15:31:58.572788', '2', '西冷牛排', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('30', '2020-05-04 15:46:52.103172', '2', '猪牛羊肉——西冷牛排', '2', '[]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('31', '2020-05-04 15:47:25.241079', '2', '猪牛羊肉——西冷牛排', '2', '[{\"changed\": {\"fields\": [\"\\u5220\\u9664\\u6807\\u8bb0\"]}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('32', '2020-05-04 15:47:28.264265', '2', '猪牛羊肉——西冷牛排', '2', '[{\"changed\": {\"fields\": [\"\\u5220\\u9664\\u6807\\u8bb0\"]}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('33', '2020-05-04 15:47:51.995553', '2', '猪牛羊肉——西冷牛排', '3', '', '12', '3');
INSERT INTO `django_admin_log` VALUES ('34', '2020-05-04 15:48:09.355336', '3', '猪牛羊肉——西冷牛排', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('35', '2020-05-04 16:07:47.744852', '3', '猪牛羊肉——西冷牛排', '2', '[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u987a\\u5e8f\"]}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('36', '2020-05-04 16:08:02.146222', '3', '猪牛羊肉——西冷牛排', '2', '[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u987a\\u5e8f\"]}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('37', '2020-05-04 16:08:54.457747', '3', '猪牛羊肉——西冷牛排', '2', '[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u987a\\u5e8f\"]}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('38', '2020-05-04 16:14:33.750491', '3', '猪牛羊肉——西冷牛排', '2', '[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u987a\\u5e8f\"]}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('39', '2020-05-04 16:14:45.137090', '3', '猪牛羊肉——西冷牛排', '2', '[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u987a\\u5e8f\"]}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('40', '2020-05-05 00:28:07.497729', '3', '猪牛羊肉——西冷牛排', '2', '[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u987a\\u5e8f\"]}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('41', '2020-05-05 00:38:00.043795', '4', '猪牛羊肉——西冷牛排', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('42', '2020-05-05 00:38:55.207920', '1', '西冷牛排', '2', '[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u56fe\\u7247\"]}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('43', '2020-05-05 00:43:48.606911', '4', '新鲜水果', '1', '[{\"added\": {}}]', '10', '3');
INSERT INTO `django_admin_log` VALUES ('44', '2020-05-05 00:44:15.557877', '2', '香蕉', '1', '[{\"added\": {}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('45', '2020-05-05 00:47:05.974243', '2', '海南芭蕉', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('46', '2020-05-05 00:47:59.402646', '3', '海南芭蕉', '1', '[{\"added\": {}}]', '13', '3');
INSERT INTO `django_admin_log` VALUES ('47', '2020-05-05 00:56:18.382548', '3', '猪牛羊肉——西冷牛排', '2', '[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u987a\\u5e8f\"]}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('48', '2020-05-05 00:57:21.255275', '5', '海鲜水产', '1', '[{\"added\": {}}]', '10', '3');
INSERT INTO `django_admin_log` VALUES ('49', '2020-05-05 01:00:12.610091', '5', '海鲜水产', '2', '[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u987a\\u5e8f\"]}}]', '10', '3');
INSERT INTO `django_admin_log` VALUES ('50', '2020-05-05 01:00:16.044404', '4', '新鲜水果', '2', '[]', '10', '3');
INSERT INTO `django_admin_log` VALUES ('51', '2020-05-05 01:00:20.542010', '3', '猪牛羊肉', '2', '[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u987a\\u5e8f\"]}}]', '10', '3');
INSERT INTO `django_admin_log` VALUES ('52', '2020-05-05 01:17:13.765615', '5', '新鲜水果——海南芭蕉——图片', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('53', '2020-05-05 01:18:41.466544', '6', '海鲜水产——西冷牛排——图片', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('54', '2020-05-05 01:19:16.770082', '6', '海鲜水产——西冷牛排——图片', '2', '[{\"changed\": {\"fields\": [\"\\u5220\\u9664\\u6807\\u8bb0\"]}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('55', '2020-05-05 01:19:30.316625', '6', '海鲜水产——西冷牛排——图片', '2', '[{\"changed\": {\"fields\": [\"\\u5220\\u9664\\u6807\\u8bb0\"]}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('56', '2020-05-05 01:19:58.603094', '3', '大虾', '1', '[{\"added\": {}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('57', '2020-05-05 01:25:47.736257', '3', '鲜活加拿大进口波士顿龙虾', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('58', '2020-05-05 01:25:59.622703', '6', '海鲜水产——鲜活加拿大进口波士顿龙虾——图片', '2', '[{\"changed\": {\"fields\": [\"\\u5546\\u54c1SKU\"]}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('59', '2020-05-05 03:35:45.666868', '4', '苹果', '1', '[{\"added\": {}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('60', '2020-05-05 03:52:36.303694', '4', '红富士', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('61', '2020-05-05 04:21:21.015569', '5', '青苹果', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('62', '2020-05-05 05:45:18.938336', '4', '苹果', '2', '[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u8be6\\u60c5\"]}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('63', '2020-05-05 05:51:55.076252', '5', '青苹果', '2', '[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u7b80\\u4ecb\"]}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('64', '2020-05-05 06:02:15.007876', '6', '黄金帅', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('65', '2020-05-07 00:24:48.385546', '6', '禽类蛋品', '1', '[{\"added\": {}}]', '10', '3');
INSERT INTO `django_admin_log` VALUES ('66', '2020-05-07 00:25:11.819678', '7', '新鲜蔬菜', '1', '[{\"added\": {}}]', '10', '3');
INSERT INTO `django_admin_log` VALUES ('67', '2020-05-07 00:25:35.517097', '8', '速冻食品', '1', '[{\"added\": {}}]', '10', '3');
INSERT INTO `django_admin_log` VALUES ('68', '2020-05-07 00:28:59.139382', '5', '秋刀鱼', '1', '[{\"added\": {}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('69', '2020-05-07 00:30:48.069016', '8', '秋刀鱼2kg', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('70', '2020-05-07 00:36:31.727583', '6', '冰激凌', '1', '[{\"added\": {}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('71', '2020-05-07 00:39:14.328875', '9', '无蔗糖冰激凌', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('72', '2020-05-07 00:41:13.880290', '3', '大龙虾', '2', '[{\"changed\": {\"fields\": [\"\\u5546\\u54c1SPU\\u540d\\u79f0\", \"\\u5546\\u54c1\\u8be6\\u60c5\"]}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('73', '2020-05-07 00:43:31.490327', '1', '牛排', '2', '[{\"changed\": {\"fields\": [\"\\u5546\\u54c1SPU\\u540d\\u79f0\", \"\\u5546\\u54c1\\u8be6\\u60c5\"]}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('74', '2020-05-07 00:43:57.642256', '1', '西冷牛排', '2', '[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u56fe\\u7247\", \"\\u5546\\u54c1\\u5e93\\u5b58\", \"\\u5546\\u54c1\\u9500\\u91cf\"]}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('75', '2020-05-07 00:44:38.098100', '7', '海鲜水产——秋刀鱼2kg——图片', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('76', '2020-05-07 00:44:49.833886', '8', '速冻食品——无蔗糖冰激凌——图片', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('77', '2020-05-07 00:46:32.340528', '7', '海鲜水产——秋刀鱼2kg——图片', '2', '[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u987a\\u5e8f\"]}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('78', '2020-05-07 00:49:13.281307', '7', '鸡蛋', '1', '[{\"added\": {}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('79', '2020-05-07 00:49:27.254868', '10', '柴鸡蛋', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('80', '2020-05-07 00:50:51.191469', '8', '芹菜', '1', '[{\"added\": {}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('81', '2020-05-07 00:52:40.184161', '11', '空心芹菜', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('82', '2020-05-07 00:53:58.391467', '9', '樱桃', '1', '[{\"added\": {}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('83', '2020-05-07 00:56:12.341151', '12', '黑珍珠大樱桃', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('84', '2020-05-07 00:56:43.572474', '9', '新鲜水果——黑珍珠大樱桃——图片', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('85', '2020-05-07 00:56:57.365550', '10', '新鲜水果——红富士——图片', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('86', '2020-05-07 01:00:57.238183', '13', '菲力牛排', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('87', '2020-05-07 01:01:09.393479', '11', '猪牛羊肉——菲力牛排——图片', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('88', '2020-05-07 01:01:36.924283', '12', '猪牛羊肉——西冷牛排——图片', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('89', '2020-05-07 01:02:09.895680', '13', '禽类蛋品——柴鸡蛋——图片', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('90', '2020-05-07 01:03:38.353770', '10', '鸭蛋', '1', '[{\"added\": {}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('91', '2020-05-07 01:04:48.457756', '14', '烤海鸭蛋', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('92', '2020-05-07 01:06:12.660758', '15', '草鸡蛋', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('93', '2020-05-07 01:07:47.321003', '16', '网红冰淇淋', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('94', '2020-05-07 01:08:24.302427', '14', '速冻食品——网红冰淇淋——图片', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('95', '2020-05-07 01:08:41.680620', '15', '新鲜蔬菜——空心芹菜——图片', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('96', '2020-05-07 01:12:12.780573', '11', '草莓', '1', '[{\"added\": {}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('97', '2020-05-07 01:13:37.908153', '17', '东库草莓', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('98', '2020-05-07 01:13:57.387980', '16', '新鲜水果——东库草莓——图片', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('99', '2020-05-22 06:13:15.352479', '2', 'smart  :  睡什么睡所木所所所所木', '2', '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u9ed8\\u8ba4\"]}}]', '7', '3');
INSERT INTO `django_admin_log` VALUES ('100', '2020-05-22 06:13:18.733598', '1', 'smart  :  山东省枣庄市市中区北安路1号枣庄学院', '2', '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u9ed8\\u8ba4\"]}}]', '7', '3');
INSERT INTO `django_admin_log` VALUES ('101', '2020-05-22 06:14:05.341680', '2', 'smart  :  山东省济南市天桥区站前街3号', '2', '[{\"changed\": {\"fields\": [\"\\u6536\\u4ef6\\u5730\\u5740\"]}}]', '7', '3');
INSERT INTO `django_admin_log` VALUES ('102', '2020-05-22 06:14:44.149761', '2', 'smart  :  山东省济南市章丘区山东技师学院18号宿舍公寓231', '2', '[{\"changed\": {\"fields\": [\"\\u6536\\u4ef6\\u5730\\u5740\"]}}]', '7', '3');
INSERT INTO `django_admin_log` VALUES ('103', '2020-05-22 06:18:33.555615', '12', '娃娃菜', '1', '[{\"added\": {}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('104', '2020-05-22 06:20:09.676207', '18', '娃娃菜', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('105', '2020-05-22 06:22:11.370498', '19', '娃娃菜 整箱', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('106', '2020-05-22 06:28:16.545848', '13', '黄瓜', '1', '[{\"added\": {}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('107', '2020-05-22 06:29:15.070519', '20', '水果黄瓜', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('108', '2020-05-22 06:36:31.612985', '20', '水果黄瓜', '2', '[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u4ef7\\u683c\"]}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('109', '2020-05-22 06:39:05.774487', '17', '新鲜蔬菜——娃娃菜——图片', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('110', '2020-05-22 06:39:10.745387', '18', '新鲜蔬菜——水果黄瓜——图片', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('111', '2020-05-22 06:44:46.716796', '14', '鸡肉', '1', '[{\"added\": {}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('112', '2020-05-22 06:45:40.001187', '21', '白条鸡', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('113', '2020-05-22 06:46:50.752662', '21', '白条鸡', '2', '[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u4ef7\\u683c\"]}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('114', '2020-05-22 06:47:31.253134', '21', '白条鸡', '2', '[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u4ef7\\u683c\"]}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('115', '2020-05-22 06:47:50.434823', '21', '白条鸡', '2', '[]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('116', '2020-05-22 06:49:45.104315', '21', '白条鸡', '2', '[]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('117', '2020-05-22 06:51:03.184014', '21', '白条鸡', '2', '[]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('118', '2020-05-22 06:52:39.138122', '21', '白条鸡', '2', '[]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('119', '2020-05-22 06:56:26.365857', '16', '网红冰淇淋', '2', '[]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('120', '2020-05-22 06:57:22.861752', '20', '水果黄瓜', '2', '[]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('121', '2020-05-22 08:57:09.632057', '19', '猪牛羊肉——白条鸡——图片', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('122', '2020-05-22 08:57:41.654081', '12', '猪牛羊肉——西冷牛排——图片', '2', '[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u987a\\u5e8f\"]}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('123', '2020-05-22 09:00:33.922212', '15', '鲍鱼', '1', '[{\"added\": {}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('124', '2020-05-22 09:00:53.158581', '22', '连江小鲍鱼', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('125', '2020-05-22 09:02:19.760319', '16', '活珠子', '1', '[{\"added\": {}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('126', '2020-05-22 09:03:36.770890', '23', '活珠子新鲜13天鸡胚蛋', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('127', '2020-05-22 09:04:43.797047', '17', '甜牛奶', '1', '[{\"added\": {}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('128', '2020-05-22 09:04:59.324370', '17', '甜牛奶', '2', '[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u8be6\\u60c5\"]}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('129', '2020-05-22 09:05:46.910510', '24', '李子园甜牛奶 整箱', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('130', '2020-05-22 09:06:10.386733', '20', '禽类蛋品——活珠子新鲜13天鸡胚蛋——图片', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('131', '2020-05-22 09:07:14.717144', '6', '禽类蛋奶', '2', '[{\"changed\": {\"fields\": [\"\\u79cd\\u7c7b\\u540d\\u79f0\"]}}]', '10', '3');
INSERT INTO `django_admin_log` VALUES ('132', '2020-05-22 09:07:29.398711', '21', '禽类蛋奶——李子园甜牛奶 整箱——图片', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('133', '2020-05-22 09:08:00.792708', '22', '海鲜水产——连江小鲍鱼——图片', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('134', '2020-05-22 09:09:41.556776', '23', '禽类蛋奶——烤海鸭蛋——图片', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('135', '2020-05-22 09:09:55.251125', '24', '禽类蛋奶——草鸡蛋——图片', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('136', '2020-05-22 09:10:08.043822', '24', '禽类蛋奶——草鸡蛋——图片', '3', '', '12', '3');
INSERT INTO `django_admin_log` VALUES ('137', '2020-05-22 09:12:08.770221', '18', '水饺', '1', '[{\"added\": {}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('138', '2020-05-22 09:13:04.423395', '25', '必品阁王饺子', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('139', '2020-05-22 09:13:16.460464', '25', '速冻食品——必品阁王饺子——图片', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('140', '2020-05-22 09:15:21.506012', '19', '汤圆', '1', '[{\"added\": {}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('141', '2020-05-22 09:16:12.363358', '26', '迪雀大黄米汤圆', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('142', '2020-05-22 09:16:19.022632', '26', '速冻食品——迪雀大黄米汤圆——图片', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('143', '2020-05-22 09:17:23.573745', '20', '贡菜', '1', '[{\"added\": {}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('144', '2020-05-22 09:18:03.695461', '27', '特级无叶贡菜', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('145', '2020-05-22 09:18:13.794746', '27', '新鲜蔬菜——特级无叶贡菜——图片', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('146', '2020-05-22 09:19:34.901773', '21', '鱿鱼', '1', '[{\"added\": {}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('147', '2020-05-22 09:20:18.659673', '28', '新鲜深海鱿鱼须', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('148', '2020-05-22 09:20:21.513790', '28', '海鲜水产——新鲜深海鱿鱼须——图片', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('149', '2020-05-22 09:21:43.633080', '8', '速冻食品——无蔗糖冰激凌——图片', '2', '[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u987a\\u5e8f\"]}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('150', '2020-05-22 09:21:50.779493', '14', '速冻食品——网红冰淇淋——图片', '2', '[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u987a\\u5e8f\"]}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('151', '2020-05-22 09:21:56.840702', '26', '速冻食品——迪雀大黄米汤圆——图片', '2', '[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u987a\\u5e8f\"]}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('152', '2020-05-22 09:22:37.039093', '29', '猪牛羊肉——菲力牛排——标题', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('153', '2020-05-22 09:22:45.703881', '29', '猪牛羊肉——菲力牛排——标题', '2', '[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u987a\\u5e8f\"]}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('154', '2020-05-22 09:23:14.594022', '30', '新鲜水果——东库草莓——图片', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('155', '2020-05-22 09:24:16.686809', '22', '血橙', '1', '[{\"added\": {}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('156', '2020-05-22 09:24:34.180678', '22', '橙子', '2', '[{\"changed\": {\"fields\": [\"\\u5546\\u54c1SPU\\u540d\\u79f0\"]}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('157', '2020-05-22 09:25:34.234905', '29', '中华红橙', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('158', '2020-05-22 09:26:08.700180', '31', '新鲜水果——中华红橙——标题', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('159', '2020-05-22 09:26:20.868908', '32', '新鲜水果——青苹果——标题', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('160', '2020-05-22 09:26:43.834375', '30', '新鲜水果——东库草莓——图片', '3', '', '12', '3');
INSERT INTO `django_admin_log` VALUES ('161', '2020-05-22 09:27:23.984634', '33', '海鲜水产——新鲜深海鱿鱼须——图片', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('162', '2020-05-22 09:27:30.519659', '33', '海鲜水产——新鲜深海鱿鱼须——标题', '2', '[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u7c7b\\u578b\"]}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('163', '2020-05-22 09:27:45.798376', '34', '禽类蛋奶——草鸡蛋——标题', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('164', '2020-05-22 09:29:44.041637', '23', '皮蛋', '1', '[{\"added\": {}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('165', '2020-05-22 09:30:54.003300', '30', '丞贡园松花蛋', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('166', '2020-05-22 09:31:01.994079', '35', '禽类蛋奶——丞贡园松花蛋——标题', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('167', '2020-05-22 09:32:04.256846', '24', '茄子', '1', '[{\"added\": {}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('168', '2020-05-22 09:32:38.372400', '31', '黑贵人长茄', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('169', '2020-05-22 09:32:43.945930', '36', '新鲜蔬菜——黑贵人长茄——标题', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('170', '2020-05-22 09:32:54.127892', '37', '速冻食品——必品阁王饺子——标题', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('171', '2020-05-22 09:39:58.329734', '2', '香蕉', '2', '[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u8be6\\u60c5\"]}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('172', '2020-05-22 09:48:34.280659', '25', '荔枝', '1', '[{\"added\": {}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('173', '2020-05-22 09:49:13.665946', '32', '海南妃子笑荔枝', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('174', '2020-05-22 09:57:28.483391', '33', '波士顿龙虾', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('175', '2020-05-23 20:56:18.388325', '3', '吃货暑假趴', '2', '[]', '11', '3');
INSERT INTO `django_admin_log` VALUES ('176', '2020-05-23 20:56:28.933507', '37', '速冻食品——必品阁王饺子——标题', '2', '[]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('177', '2020-05-23 20:58:51.901066', '33', '波士顿龙虾', '2', '[]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('178', '2020-05-24 14:55:35.967007', '37', '速冻食品——必品阁王饺子——标题', '2', '[]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('179', '2020-05-25 13:42:54.888438', '37', '速冻食品——必品阁王饺子——标题', '2', '[]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('180', '2020-05-25 13:47:03.720459', '37', '速冻食品——必品阁王饺子——标题', '2', '[]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('181', '2020-05-25 13:49:58.957060', '3', '吃货暑假趴', '2', '[]', '11', '3');
INSERT INTO `django_admin_log` VALUES ('182', '2020-05-25 13:51:23.501896', '3', '吃货暑假趴', '2', '[]', '11', '3');
INSERT INTO `django_admin_log` VALUES ('183', '2020-05-25 13:57:07.229580', '2', '盛夏尝鲜季', '2', '[]', '11', '3');
INSERT INTO `django_admin_log` VALUES ('184', '2020-05-25 13:59:42.797956', '3', '吃货暑假趴', '2', '[]', '11', '3');
INSERT INTO `django_admin_log` VALUES ('185', '2020-05-25 14:14:26.612208', '3', '吃货暑假趴', '2', '[]', '11', '3');
INSERT INTO `django_admin_log` VALUES ('186', '2020-05-25 14:23:36.940950', '3', '吃货暑假趴', '2', '[]', '11', '3');
INSERT INTO `django_admin_log` VALUES ('187', '2020-05-25 14:58:19.434169', '3', '吃货暑假趴', '2', '[]', '11', '3');
INSERT INTO `django_admin_log` VALUES ('188', '2020-05-25 15:13:07.592926', '1', '西冷牛排', '2', '[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u5e93\\u5b58\"]}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('189', '2020-05-25 15:13:18.478594', '13', '菲力牛排', '2', '[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u5e93\\u5b58\"]}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('190', '2020-05-25 15:21:59.030319', '3', '吃货暑假趴', '2', '[]', '11', '3');
INSERT INTO `django_admin_log` VALUES ('191', '2020-05-25 15:24:05.537114', '3', '吃货暑假趴', '2', '[]', '11', '3');
INSERT INTO `django_admin_log` VALUES ('192', '2020-05-25 15:25:49.832534', '3', '吃货暑假趴', '2', '[]', '11', '3');
INSERT INTO `django_admin_log` VALUES ('193', '2020-05-25 15:27:35.159505', '3', '吃货暑假趴', '2', '[]', '11', '3');
INSERT INTO `django_admin_log` VALUES ('194', '2020-05-25 15:33:37.155335', '3', '吃货暑假趴', '2', '[]', '11', '3');
INSERT INTO `django_admin_log` VALUES ('195', '2020-05-25 15:37:35.734989', '3', '吃货暑假趴', '2', '[]', '11', '3');
INSERT INTO `django_admin_log` VALUES ('196', '2020-05-25 15:46:39.079510', '3', '吃货暑假趴', '2', '[]', '11', '3');
INSERT INTO `django_admin_log` VALUES ('197', '2020-05-25 15:50:58.334411', '3', '吃货暑假趴', '2', '[]', '11', '3');
INSERT INTO `django_admin_log` VALUES ('198', '2020-05-25 15:52:55.961059', '3', '吃货暑假趴', '2', '[]', '11', '3');
INSERT INTO `django_admin_log` VALUES ('199', '2020-05-25 16:30:06.649355', '4', '娃娃菜 整箱', '1', '[{\"added\": {}}]', '13', '3');
INSERT INTO `django_admin_log` VALUES ('200', '2020-05-25 16:35:25.267429', '4', '娃娃菜 整箱', '2', '[{\"changed\": {\"fields\": [\"\\u56fe\\u7247\"]}}]', '13', '3');
INSERT INTO `django_admin_log` VALUES ('201', '2020-05-25 16:36:30.512949', '4', '娃娃菜 整箱', '2', '[{\"changed\": {\"fields\": [\"\\u56fe\\u7247\"]}}]', '13', '3');
INSERT INTO `django_admin_log` VALUES ('202', '2020-05-25 17:09:21.552206', '4', '娃娃菜 整箱', '2', '[{\"changed\": {\"fields\": [\"\\u56fe\\u7247\"]}}]', '13', '3');
INSERT INTO `django_admin_log` VALUES ('203', '2020-05-25 17:30:04.385490', '4', '娃娃菜 整箱', '2', '[]', '13', '3');
INSERT INTO `django_admin_log` VALUES ('204', '2020-05-25 17:33:02.888765', '4', '娃娃菜 整箱', '2', '[]', '13', '3');
INSERT INTO `django_admin_log` VALUES ('205', '2020-05-25 17:33:11.646062', '4', '娃娃菜 整箱', '2', '[]', '13', '3');
INSERT INTO `django_admin_log` VALUES ('206', '2020-05-25 17:35:23.264427', '3', '海南芭蕉', '2', '[]', '13', '3');
INSERT INTO `django_admin_log` VALUES ('207', '2020-05-25 17:37:59.856438', '37', '速冻食品——必品阁王饺子——标题', '2', '[]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('208', '2020-05-25 17:39:17.542610', '36', '新鲜蔬菜——黑贵人长茄——标题', '2', '[]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('209', '2020-05-25 17:39:50.186248', '34', '禽类蛋奶——草鸡蛋——标题', '2', '[]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('210', '2020-05-25 20:09:26.657756', '37', '速冻食品——必品阁王饺子——标题', '2', '[]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('211', '2020-05-25 20:10:08.659670', '33', '海鲜水产——新鲜深海鱿鱼须——标题', '2', '[]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('212', '2020-05-25 20:10:56.027923', '37', '速冻食品——必品阁王饺子——标题', '2', '[]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('213', '2020-05-25 20:56:59.950606', '26', '山药', '1', '[{\"added\": {}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('214', '2020-05-25 20:57:49.248032', '34', '铁棍山药', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('215', '2020-05-25 20:59:45.227543', '35', '淮山药', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('216', '2020-05-25 21:04:56.099453', '27', '西兰花', '1', '[{\"added\": {}}]', '8', '3');
INSERT INTO `django_admin_log` VALUES ('217', '2020-05-25 21:06:15.572473', '36', '西兰花 5斤装', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('218', '2020-05-25 21:33:02.602760', '37', '西兰花 10斤装', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('219', '2020-05-26 02:52:37.397489', '2', '海南芭蕉', '2', '[]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('220', '2020-05-26 03:03:31.143284', '4', '苹果', '2', '[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u8be6\\u60c5\"]}}]', '8', '3');

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('8', 'goods', 'goods');
INSERT INTO `django_content_type` VALUES ('14', 'goods', 'goodsimage');
INSERT INTO `django_content_type` VALUES ('9', 'goods', 'goodssku');
INSERT INTO `django_content_type` VALUES ('10', 'goods', 'goodstype');
INSERT INTO `django_content_type` VALUES ('13', 'goods', 'indexgoodsbanner');
INSERT INTO `django_content_type` VALUES ('11', 'goods', 'indexpromotionbanner');
INSERT INTO `django_content_type` VALUES ('12', 'goods', 'indextypegoodsbanner');
INSERT INTO `django_content_type` VALUES ('16', 'order', 'ordergoods');
INSERT INTO `django_content_type` VALUES ('15', 'order', 'orderinfo');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('7', 'user', 'address');
INSERT INTO `django_content_type` VALUES ('6', 'user', 'user');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2020-05-01 18:10:05.516804');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2020-05-01 18:10:05.577737');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2020-05-01 18:10:05.662731');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2020-05-01 18:10:05.810384');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2020-05-01 18:10:05.818696');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2020-05-01 18:10:05.826868');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2020-05-01 18:10:05.834961');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2020-05-01 18:10:05.839229');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2020-05-01 18:10:05.849916');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2020-05-01 18:10:05.858023');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0009_alter_user_last_name_max_length', '2020-05-01 18:10:05.870593');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0010_alter_group_name_max_length', '2020-05-01 18:10:05.914810');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0011_update_proxy_permissions', '2020-05-01 18:10:05.923277');
INSERT INTO `django_migrations` VALUES ('14', 'user', '0001_initial', '2020-05-01 18:10:06.033095');
INSERT INTO `django_migrations` VALUES ('15', 'admin', '0001_initial', '2020-05-01 18:10:06.235996');
INSERT INTO `django_migrations` VALUES ('16', 'admin', '0002_logentry_remove_auto_add', '2020-05-01 18:10:06.314310');
INSERT INTO `django_migrations` VALUES ('17', 'admin', '0003_logentry_add_action_flag_choices', '2020-05-01 18:10:06.324890');
INSERT INTO `django_migrations` VALUES ('18', 'goods', '0001_initial', '2020-05-01 18:10:06.532059');
INSERT INTO `django_migrations` VALUES ('19', 'sessions', '0001_initial', '2020-05-01 18:10:06.716961');
INSERT INTO `django_migrations` VALUES ('20', 'goods', '0002_auto_20200503_2338', '2020-05-03 15:38:23.763787');
INSERT INTO `django_migrations` VALUES ('21', 'order', '0001_initial', '2020-05-03 15:38:23.936313');
INSERT INTO `django_migrations` VALUES ('22', 'goods', '0003_auto_20200504_0603', '2020-05-03 22:03:59.267050');
INSERT INTO `django_migrations` VALUES ('23', 'goods', '0004_auto_20200504_1746', '2020-05-04 09:46:50.750386');
INSERT INTO `django_migrations` VALUES ('24', 'goods', '0005_indexgoodsbanner_url', '2020-05-04 12:35:32.854747');
INSERT INTO `django_migrations` VALUES ('25', 'goods', '0006_auto_20200504_2325', '2020-05-04 15:25:09.492160');
INSERT INTO `django_migrations` VALUES ('26', 'goods', '0007_goodstype_index', '2020-05-05 00:59:15.722581');
INSERT INTO `django_migrations` VALUES ('27', 'goods', '0008_remove_goodssku_url', '2020-05-05 03:36:22.078735');
INSERT INTO `django_migrations` VALUES ('28', 'order', '0002_auto_20200515_0719', '2020-05-15 07:20:20.213366');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
