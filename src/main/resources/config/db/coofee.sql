/*
Navicat MySQL Data Transfer

Source Server         : Localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : coofee

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-03-10 21:32:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for coo_advertise_carousel
-- ----------------------------
DROP TABLE IF EXISTS `coo_advertise_carousel`;
CREATE TABLE `coo_advertise_carousel` (
  `id` int(11) NOT NULL,
  `number` int(11) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `targeturl` varchar(255) DEFAULT NULL,
  `state` varchar(4) DEFAULT NULL,
  `des` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `type` varchar(4) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of coo_advertise_carousel
-- ----------------------------
INSERT INTO `coo_advertise_carousel` VALUES ('1', '1', 'static/img/carousel/slides/a.PNG', null, '1', '主页轮播图片1', null);
INSERT INTO `coo_advertise_carousel` VALUES ('2', '2', 'static/img/carousel/slides/b.PNG', null, '1', '主页轮播图片2', null);
INSERT INTO `coo_advertise_carousel` VALUES ('3', '3', 'static/img/carousel/slides/c.PNG', null, '1', '主页轮播图片3', null);
INSERT INTO `coo_advertise_carousel` VALUES ('4', '4', 'static/img/carousel/slides/d.PNG', null, '1', '主页轮播图片4', null);
INSERT INTO `coo_advertise_carousel` VALUES ('5', '5', 'static/img/carousel/slides/slide6.jpg', null, '1', '主页轮播图片5', null);

-- ----------------------------
-- Table structure for coo_artdesign_imgresource
-- ----------------------------
DROP TABLE IF EXISTS `coo_artdesign_imgresource`;
CREATE TABLE `coo_artdesign_imgresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordernumber` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `state` varchar(4) DEFAULT '0001',
  `desc` varchar(255) DEFAULT NULL,
  `artdesignid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of coo_artdesign_imgresource
-- ----------------------------
INSERT INTO `coo_artdesign_imgresource` VALUES ('1', '1', 'static/img/artdesignproductimg/test/1.jpg', '1', '艺术画美工设计-1', '1');
INSERT INTO `coo_artdesign_imgresource` VALUES ('2', '1', 'static/img/artdesignproductimg/test/2.jpg', '1', '艺术画美工设计-2', '1');
INSERT INTO `coo_artdesign_imgresource` VALUES ('3', '1', 'static/img/artdesignproductimg/test/3.jpg', '1', '艺术画美工设计-3', '1');
INSERT INTO `coo_artdesign_imgresource` VALUES ('4', '1', 'static/img/artdesignproductimg/test/4.jpg', '1', '艺术画美工设计-4', '1');
INSERT INTO `coo_artdesign_imgresource` VALUES ('5', '1', 'static/img/artdesignproductimg/test/5.jpg', '1', '艺术画美工设计-5', '1');
INSERT INTO `coo_artdesign_imgresource` VALUES ('6', '2', 'static/img/showProd/X1.png', '1', '设计-1', '2');
INSERT INTO `coo_artdesign_imgresource` VALUES ('7', '2', 'static/img/showProd/X7.png', '1', '设计-2', '2');
INSERT INTO `coo_artdesign_imgresource` VALUES ('8', '2', 'static/img/showProd/X8.png', '1', '设计-3', '2');
INSERT INTO `coo_artdesign_imgresource` VALUES ('9', '2', 'static/img/showProd/X9.png', '1', '设计-4', '2');
INSERT INTO `coo_artdesign_imgresource` VALUES ('10', '2', 'static/img/showProd/X10.png', '1', '设计-5', '2');

-- ----------------------------
-- Table structure for coo_order
-- ----------------------------
DROP TABLE IF EXISTS `coo_order`;
CREATE TABLE `coo_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `ordertime` datetime DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `discount` int(255) DEFAULT NULL,
  `realpay` int(11) DEFAULT NULL,
  `state` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of coo_order
-- ----------------------------
INSERT INTO `coo_order` VALUES ('1', '1', '2018-03-21 00:00:00', '5000', '500', '4500', '0');
INSERT INTO `coo_order` VALUES ('8', '1', '2018-05-18 21:11:36', '10000', '400', '9600', '0');
INSERT INTO `coo_order` VALUES ('9', '1', '2018-05-18 21:18:00', '5000', '200', '4800', '0');
INSERT INTO `coo_order` VALUES ('10', '1', '2018-05-20 10:41:26', '10000', '400', '9600', '0');
INSERT INTO `coo_order` VALUES ('11', '1', '2018-05-20 11:03:14', '5000', '200', '4800', '0');
INSERT INTO `coo_order` VALUES ('12', '1', '2018-05-24 13:10:19', '10000', '400', '9600', '0');
INSERT INTO `coo_order` VALUES ('13', '1', '2018-05-24 13:47:01', '15000', '600', '14400', '0');
INSERT INTO `coo_order` VALUES ('14', '1', '2018-06-05 10:16:03', '20000', '800', '19200', '0');
INSERT INTO `coo_order` VALUES ('15', '1', '2018-06-08 17:02:55', '15000', '600', '14400', '0');
INSERT INTO `coo_order` VALUES ('16', '1', '2018-06-10 12:52:05', '15000', '600', '14400', '0');
INSERT INTO `coo_order` VALUES ('17', '1', '2018-06-10 19:41:28', '10000', '400', '9600', '1');
INSERT INTO `coo_order` VALUES ('18', '1', '2018-06-11 08:41:41', '5000', '200', '4800', '1');

-- ----------------------------
-- Table structure for coo_order_flow
-- ----------------------------
DROP TABLE IF EXISTS `coo_order_flow`;
CREATE TABLE `coo_order_flow` (
  `id` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `type` varchar(4) DEFAULT NULL,
  `worth` int(11) DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `state` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of coo_order_flow
-- ----------------------------

-- ----------------------------
-- Table structure for coo_order_prouduct
-- ----------------------------
DROP TABLE IF EXISTS `coo_order_prouduct`;
CREATE TABLE `coo_order_prouduct` (
  `orderid` int(255) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `state` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of coo_order_prouduct
-- ----------------------------
INSERT INTO `coo_order_prouduct` VALUES ('1', '1', '1', '5000', '淘宝玩具店主页设计需求', '1');
INSERT INTO `coo_order_prouduct` VALUES ('1', '1', '2', '5000', '用户订单商品实例生成', '1');
INSERT INTO `coo_order_prouduct` VALUES ('1', '1', '2', '5000', '用户订单商品实例生成', '1');
INSERT INTO `coo_order_prouduct` VALUES ('1', '1', '1', '5000', '用户订单商品实例生成', '1');
INSERT INTO `coo_order_prouduct` VALUES ('1', '1', '2', '5000', '用户订单商品实例生成', '1');
INSERT INTO `coo_order_prouduct` VALUES ('8', '1', '2', '5000', '用户订单商品实例生成', '1');
INSERT INTO `coo_order_prouduct` VALUES ('9', '1', '1', '5000', '用户订单商品实例生成', '1');
INSERT INTO `coo_order_prouduct` VALUES ('10', '1', '2', '5000', '用户订单商品实例生成', '1');
INSERT INTO `coo_order_prouduct` VALUES ('11', '1', '1', '5000', '用户订单商品实例生成', '1');
INSERT INTO `coo_order_prouduct` VALUES ('12', '1', '2', '5000', '用户订单商品实例生成', '1');
INSERT INTO `coo_order_prouduct` VALUES ('13', '1', '1', '5000', '用户订单商品实例生成', '1');
INSERT INTO `coo_order_prouduct` VALUES ('13', '1', '1', '5000', '用户订单商品实例生成', '1');
INSERT INTO `coo_order_prouduct` VALUES ('13', '1', '1', '5000', '用户订单商品实例生成', '1');
INSERT INTO `coo_order_prouduct` VALUES ('14', '1', '2', '5000', '用户订单商品实例生成', '1');
INSERT INTO `coo_order_prouduct` VALUES ('14', '1', '1', '5000', '用户订单商品实例生成', '1');
INSERT INTO `coo_order_prouduct` VALUES ('14', '1', '1', '5000', '用户订单商品实例生成', '1');
INSERT INTO `coo_order_prouduct` VALUES ('15', '1', '2', '5000', '用户订单商品实例生成', '1');
INSERT INTO `coo_order_prouduct` VALUES ('15', '1', '1', '5000', '用户订单商品实例生成', '1');
INSERT INTO `coo_order_prouduct` VALUES ('16', '1', '2', '5000', '用户订单商品实例生成', '1');
INSERT INTO `coo_order_prouduct` VALUES ('16', '1', '1', '5000', '用户订单商品实例生成', '1');
INSERT INTO `coo_order_prouduct` VALUES ('17', '1', '2', '5000', '用户订单商品实例生成', '1');
INSERT INTO `coo_order_prouduct` VALUES ('18', '1', '1', '5000', '用户订单商品实例生成', '1');

-- ----------------------------
-- Table structure for coo_permission
-- ----------------------------
DROP TABLE IF EXISTS `coo_permission`;
CREATE TABLE `coo_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `state` varchar(4) DEFAULT '0001'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of coo_permission
-- ----------------------------
INSERT INTO `coo_permission` VALUES ('1', '登录测试', '/test/login.action', null);
INSERT INTO `coo_permission` VALUES ('2', '主页测试', '/test/index.action', null);
INSERT INTO `coo_permission` VALUES ('3', '管理测试', '/test/admin.action', null);

-- ----------------------------
-- Table structure for coo_product_artdesign
-- ----------------------------
DROP TABLE IF EXISTS `coo_product_artdesign`;
CREATE TABLE `coo_product_artdesign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `tip` varchar(255) DEFAULT NULL,
  `type` varchar(4) DEFAULT NULL,
  `state` varchar(4) DEFAULT '0001',
  `price` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `viewcount` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of coo_product_artdesign
-- ----------------------------
INSERT INTO `coo_product_artdesign` VALUES ('1', '艺术画设计-（测试）', '为淘宝艺术画设计的平面', '0001', '1', '5000', '200', '1');
INSERT INTO `coo_product_artdesign` VALUES ('2', '艺术画设计-（商品测试）', '为显示列表设计', '0001', '0', '6000', '300', '1');

-- ----------------------------
-- Table structure for coo_product_cart
-- ----------------------------
DROP TABLE IF EXISTS `coo_product_cart`;
CREATE TABLE `coo_product_cart` (
  `id` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `removetime` datetime DEFAULT NULL,
  `state` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of coo_product_cart
-- ----------------------------
INSERT INTO `coo_product_cart` VALUES ('1', '1', '1', '2', '2018-04-20 17:12:32', null, '1');
INSERT INTO `coo_product_cart` VALUES ('2', '1', '1', '1', '2018-05-18 21:21:59', null, '0');
INSERT INTO `coo_product_cart` VALUES (null, '1', '1', '1', null, null, '0');
INSERT INTO `coo_product_cart` VALUES (null, '1', '1', '1', null, null, '0');
INSERT INTO `coo_product_cart` VALUES (null, '1', '1', '1', null, null, '0');
INSERT INTO `coo_product_cart` VALUES (null, '1', '1', '1', null, null, '0');
INSERT INTO `coo_product_cart` VALUES (null, '1', '1', '1', null, null, '0');
INSERT INTO `coo_product_cart` VALUES (null, '1', '1', '1', null, null, '1');

-- ----------------------------
-- Table structure for coo_product_collection
-- ----------------------------
DROP TABLE IF EXISTS `coo_product_collection`;
CREATE TABLE `coo_product_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `collectiondate` datetime DEFAULT NULL,
  `state` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of coo_product_collection
-- ----------------------------
INSERT INTO `coo_product_collection` VALUES ('1', '1', '1', null, '0');
INSERT INTO `coo_product_collection` VALUES ('2', '1', '1', null, '0');
INSERT INTO `coo_product_collection` VALUES ('3', '1', '1', null, '0');
INSERT INTO `coo_product_collection` VALUES ('4', '1', '1', null, '0');
INSERT INTO `coo_product_collection` VALUES ('5', '1', '1', null, '0');
INSERT INTO `coo_product_collection` VALUES ('6', '1', '1', null, '0');
INSERT INTO `coo_product_collection` VALUES ('7', '1', '1', '2018-05-20 08:34:53', '0');
INSERT INTO `coo_product_collection` VALUES ('8', '1', '1', '2018-05-20 08:34:53', '0');
INSERT INTO `coo_product_collection` VALUES ('9', '1', '1', null, '0');
INSERT INTO `coo_product_collection` VALUES ('10', '1', '1', null, '0');
INSERT INTO `coo_product_collection` VALUES ('11', '1', '1', '2018-05-20 10:36:58', '0');
INSERT INTO `coo_product_collection` VALUES ('12', '1', '1', null, '0');
INSERT INTO `coo_product_collection` VALUES ('13', '1', '1', '2018-05-20 10:36:58', '0');
INSERT INTO `coo_product_collection` VALUES ('14', '1', '1', '2018-05-20 10:36:58', '0');
INSERT INTO `coo_product_collection` VALUES ('15', '1', '1', '2018-05-23 09:14:45', '0');
INSERT INTO `coo_product_collection` VALUES ('16', '1', '1', '2018-06-08 17:21:28', '0');
INSERT INTO `coo_product_collection` VALUES ('17', '1', '1', '2018-06-07 19:08:14', '0');
INSERT INTO `coo_product_collection` VALUES ('18', '1', '1', '2018-06-08 16:51:22', '0');
INSERT INTO `coo_product_collection` VALUES ('19', '1', '1', '2018-06-08 17:21:28', '1');
INSERT INTO `coo_product_collection` VALUES ('20', '1', '1', '2018-06-10 12:36:23', '0');

-- ----------------------------
-- Table structure for coo_product_recommend
-- ----------------------------
DROP TABLE IF EXISTS `coo_product_recommend`;
CREATE TABLE `coo_product_recommend` (
  `id` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `type` varchar(4) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `state` varchar(4) DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of coo_product_recommend
-- ----------------------------
INSERT INTO `coo_product_recommend` VALUES ('1', '1', '1', '1', '1', null, null);

-- ----------------------------
-- Table structure for coo_product_sort
-- ----------------------------
DROP TABLE IF EXISTS `coo_product_sort`;
CREATE TABLE `coo_product_sort` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `headid` int(11) DEFAULT NULL,
  `type` varchar(4) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `tip` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `state` varchar(4) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of coo_product_sort
-- ----------------------------
INSERT INTO `coo_product_sort` VALUES ('1', '0', '1', 'LOGO', 'LOGO', '1', '1', '一级菜单，LOGO');
INSERT INTO `coo_product_sort` VALUES ('2', '1', '2', 'LOGO', '图文LOGO', '1', '1', '二级菜单，图文LOGO');
INSERT INTO `coo_product_sort` VALUES ('3', '1', '3', 'LOGO', '图形LOGO', '2', '1', '二级菜单，图形LOGO');
INSERT INTO `coo_product_sort` VALUES ('4', '1', '4', 'LOGO', '企业LOGO', '3', '1', '二级菜单，企业LOGO');
INSERT INTO `coo_product_sort` VALUES ('5', '1', '5', 'LOGO', '产品LOGO', '4', '1', '二级菜单，产品LOGO');

-- ----------------------------
-- Table structure for coo_role
-- ----------------------------
DROP TABLE IF EXISTS `coo_role`;
CREATE TABLE `coo_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `state` varchar(4) NOT NULL DEFAULT '0001',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of coo_role
-- ----------------------------
INSERT INTO `coo_role` VALUES ('1', 'admin', '管理员角色', '1');
INSERT INTO `coo_role` VALUES ('2', 'user', '用户角色', '1');
INSERT INTO `coo_role` VALUES ('3', 'visitor', '游客角色', '1');

-- ----------------------------
-- Table structure for coo_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `coo_role_permission`;
CREATE TABLE `coo_role_permission` (
  `id` int(11) NOT NULL,
  `tip` varchar(255) NOT NULL,
  `roleid` int(11) NOT NULL,
  `permissionid` int(11) NOT NULL,
  `state` varchar(4) DEFAULT '0001'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of coo_role_permission
-- ----------------------------
INSERT INTO `coo_role_permission` VALUES ('1', '管理员访问登录页面', '1', '1', null);
INSERT INTO `coo_role_permission` VALUES ('2', '管理员访问主页页面', '1', '2', null);
INSERT INTO `coo_role_permission` VALUES ('3', '管理员访问管理页面', '1', '3', null);
INSERT INTO `coo_role_permission` VALUES ('4', '用户访问登录页面', '2', '1', null);
INSERT INTO `coo_role_permission` VALUES ('5', '用户访问主页页面', '2', '2', null);
INSERT INTO `coo_role_permission` VALUES ('6', '访客访问登录页面', '3', '1', null);

-- ----------------------------
-- Table structure for coo_shop
-- ----------------------------
DROP TABLE IF EXISTS `coo_shop`;
CREATE TABLE `coo_shop` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `focusnum` int(11) DEFAULT NULL,
  `viewsnum` int(11) DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `state` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of coo_shop
-- ----------------------------
INSERT INTO `coo_shop` VALUES ('1', 'lickso工作室', '该数据是用于测试哦', null, '1', '1', '2018-05-21 09:04:43', '1');

-- ----------------------------
-- Table structure for coo_shop_product
-- ----------------------------
DROP TABLE IF EXISTS `coo_shop_product`;
CREATE TABLE `coo_shop_product` (
  `shopid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `state` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of coo_shop_product
-- ----------------------------
INSERT INTO `coo_shop_product` VALUES ('1', '1', '2018-05-21 09:08:27', '2018-05-22 09:08:31', '该条数据用于测试哦', '1');

-- ----------------------------
-- Table structure for coo_user
-- ----------------------------
DROP TABLE IF EXISTS `coo_user`;
CREATE TABLE `coo_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `registertime` datetime DEFAULT NULL,
  `lastlogintime` datetime DEFAULT NULL,
  `state` varchar(4) NOT NULL DEFAULT '0001',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_2` (`name`),
  UNIQUE KEY `name_3` (`name`),
  UNIQUE KEY `name_4` (`name`),
  UNIQUE KEY `name_5` (`name`),
  UNIQUE KEY `name_6` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of coo_user
-- ----------------------------
INSERT INTO `coo_user` VALUES ('1', 'ys', 'ys', 'ys123456', '2018-03-21 00:00:00', null, '1');
INSERT INTO `coo_user` VALUES ('2', 'yz', 'yz', 'yz123456', null, null, '1');
INSERT INTO `coo_user` VALUES ('3', 'yt', 'yt', 'yt123456', null, null, '1');
INSERT INTO `coo_user` VALUES ('4', '12356', null, '0000', null, null, '0');
INSERT INTO `coo_user` VALUES ('5', '123456', null, '0000', null, null, '0');
INSERT INTO `coo_user` VALUES ('6', 'ys0000', null, 'ys0000', null, null, '1');
INSERT INTO `coo_user` VALUES ('7', 'ys00', null, '1234', null, null, '1');

-- ----------------------------
-- Table structure for coo_user_creditsoperate
-- ----------------------------
DROP TABLE IF EXISTS `coo_user_creditsoperate`;
CREATE TABLE `coo_user_creditsoperate` (
  `id` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `operatedate` datetime DEFAULT NULL,
  `operatetype` varchar(4) DEFAULT NULL,
  `operatesum` int(11) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `state` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of coo_user_creditsoperate
-- ----------------------------
INSERT INTO `coo_user_creditsoperate` VALUES ('1', '1', '2018-05-25 09:13:55', '1', '500000', '测试用户初始充值', '1');
INSERT INTO `coo_user_creditsoperate` VALUES ('2', '1', '2018-04-22 21:18:05', '2', '20', '用户签到测试', '1');
INSERT INTO `coo_user_creditsoperate` VALUES ('3', '1', '2018-04-23 21:18:18', '2', '20', '用户签到测试', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-04-25 21:00:33', '2', '20', '用户签到获取积分', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-04-25 21:02:43', '2', '20', '用户签到获取积分', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-04-25 21:07:10', '2', '20', '用户签到获取积分', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-04-25 21:07:20', '2', '20', '用户签到获取积分', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-04-25 21:12:21', '2', '20', '用户签到获取积分', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-04-25 21:54:36', '2', '20', '用户签到获取积分', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-05-01 18:05:04', '2', '20', '用户签到获取积分', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-05-01 18:40:40', '2', '20', '用户签到获取积分', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-05-01 18:40:48', '2', '20', '用户签到获取积分', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-05-13 07:49:28', '2', '20', '用户签到获取积分', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-05-13 08:27:13', '2', '20', '用户签到获取积分', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-05-13 08:27:58', '2', '20', '用户签到获取积分', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-05-13 08:30:50', '2', '20', '用户签到获取积分', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-05-13 08:30:53', '2', '20', '用户签到获取积分', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-05-13 08:31:47', '2', '20', '用户签到获取积分', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-05-13 08:31:51', '2', '20', '用户签到获取积分', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-05-13 08:32:33', '2', '20', '用户签到获取积分', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-05-13 09:53:01', '2', '20', '用户签到获取积分', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '0', null, null, '0', null, null);
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-05-15 18:28:19', '2', '-9600', '用户充值消耗积分9600', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-05-15 18:29:07', '2', '-9600', '用户充值消耗积分9600', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-05-18 09:18:20', '2', '20', '用户签到获取积分', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-05-18 11:22:39', '2', '-9600', '用户充值消耗积分9600', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-05-18 11:26:49', '2', '20', '用户签到获取积分', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-05-18 11:30:59', '2', '-9600', '用户充值消耗积分9600', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-05-18 11:32:57', '2', '-4800', '用户充值消耗积分4800', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-05-18 19:52:23', '2', '-9600', '用户充值消耗积分9600', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-05-18 21:12:05', '2', '-9600', '用户充值消耗积分9600', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-05-18 21:18:06', '2', '-4800', '用户充值消耗积分4800', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-05-18 21:21:27', '2', '20', '用户签到获取积分', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-05-19 11:50:49', '2', '20', '用户签到获取积分', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-05-20 10:41:44', '2', '-9600', '用户充值消耗积分9600', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-05-20 11:03:14', '2', '-4800', '用户充值消耗积分4800', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-05-23 09:15:01', '2', '20', '用户签到获取积分', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-05-24 13:10:19', '2', '-9600', '用户充值消耗积分9600', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-05-24 13:47:01', '2', '-14400', '用户充值消耗积分14400', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-06-05 10:16:03', '2', '-19200', '用户充值消耗积分19200', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-06-08 15:17:04', '2', '20', '用户签到获取积分', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-06-08 17:02:55', '2', '-14400', '用户充值消耗积分14400', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-06-10 12:49:52', '2', '20', '用户签到获取积分', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-06-10 12:52:05', '2', '-14400', '用户充值消耗积分14400', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-06-10 19:41:28', '2', '-9600', '用户充值消耗积分9600', '1');
INSERT INTO `coo_user_creditsoperate` VALUES (null, '1', '2018-06-11 08:41:41', '2', '-4800', '用户充值消耗积分4800', '1');

-- ----------------------------
-- Table structure for coo_user_place
-- ----------------------------
DROP TABLE IF EXISTS `coo_user_place`;
CREATE TABLE `coo_user_place` (
  `id` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `setdate` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `state` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of coo_user_place
-- ----------------------------
INSERT INTO `coo_user_place` VALUES ('1', '1', '2018-04-18 22:43:50', '内蒙古呼和浩特市呼伦贝尔南路5号邮校小区', '1');

-- ----------------------------
-- Table structure for coo_user_role
-- ----------------------------
DROP TABLE IF EXISTS `coo_user_role`;
CREATE TABLE `coo_user_role` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `state` varchar(4) DEFAULT '0001',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of coo_user_role
-- ----------------------------
INSERT INTO `coo_user_role` VALUES ('1', '1', '1', '用户0001是管理员', '1');
INSERT INTO `coo_user_role` VALUES ('2', '2', '2', '用户0002是用户', '1');
INSERT INTO `coo_user_role` VALUES ('3', '3', '3', '用户0003是游客', '1');

-- ----------------------------
-- Table structure for coo_user_session
-- ----------------------------
DROP TABLE IF EXISTS `coo_user_session`;
CREATE TABLE `coo_user_session` (
  `id` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `lastaccess` datetime DEFAULT NULL,
  `timeout` int(11) DEFAULT NULL,
  `state` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of coo_user_session
-- ----------------------------
