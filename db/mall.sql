
/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50728
Source Host           : localhost:3306
Source Database       : mall

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2020-05-17 22:36:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_area`
-- ----------------------------
DROP TABLE IF EXISTS `tb_area`;
CREATE TABLE `tb_area` (
  `area_id` int(2) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(200) NOT NULL,
  `priority` int(2) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`area_id`),
  UNIQUE KEY `UK_AREA` (`area_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_area
-- ----------------------------
INSERT INTO `tb_area` VALUES ('1', '西苑', '0', '1000-01-01 00:00:01', '1000-01-01 00:00:02');
INSERT INTO `tb_area` VALUES ('2', '东苑', '0', '1000-01-01 00:00:01', '1000-01-01 00:00:02');
INSERT INTO `tb_area` VALUES ('3', '南苑', '0', null, null);
INSERT INTO `tb_area` VALUES ('4', '北苑', '0', null, null);

-- ----------------------------
-- Table structure for `tb_head_line`
-- ----------------------------
DROP TABLE IF EXISTS `tb_head_line`;
CREATE TABLE `tb_head_line` (
  `line_id` int(100) NOT NULL AUTO_INCREMENT,
  `line_name` varchar(1000) DEFAULT NULL,
  `line_link` varchar(2000) NOT NULL,
  `line_img` varchar(2000) NOT NULL,
  `priority` int(2) DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`line_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_head_line
-- ----------------------------
INSERT INTO `tb_head_line` VALUES ('11', '1', '', '/upload/images/item/headtitle/1.jpg', '1', '1', '2020-04-26 20:31:57', '2020-04-26 20:31:57');
INSERT INTO `tb_head_line` VALUES ('12', '2', '', '/upload/images/item/headtitle/2.jpg', '2', '1', '2020-04-26 20:37:17', '2020-04-26 20:37:17');
INSERT INTO `tb_head_line` VALUES ('14', '3', '', '/upload/images/item/headtitle/3.jpg', '3', '1', '2020-04-26 20:39:34', '2020-04-26 20:39:34');
INSERT INTO `tb_head_line` VALUES ('15', '4', '', '/upload/images/item/headtitle/4.jpg', '4', '1', '2020-04-16 20:40:01', '2020-04-26 20:40:01');

-- ----------------------------
-- Table structure for `tb_local_auth`
-- ----------------------------
DROP TABLE IF EXISTS `tb_local_auth`;
CREATE TABLE `tb_local_auth` (
  `local_auth_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`local_auth_id`),
  UNIQUE KEY `uk_local_profile` (`username`),
  KEY `fk_localauth_profile` (`user_id`),
  CONSTRAINT `fk_localauth_profile` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_local_auth
-- ----------------------------
INSERT INTO `tb_local_auth` VALUES ('9', '1', 'test', '555elq65be9q529lq62l52095s562l25', '2020-05-08 14:58:14', '2020-05-08 14:58:14');

-- ----------------------------
-- Table structure for `tb_person_info`
-- ----------------------------
DROP TABLE IF EXISTS `tb_person_info`;
CREATE TABLE `tb_person_info` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `profile_img` varchar(1024) DEFAULT NULL,
  `email` varchar(1024) DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT '0' COMMENT '0',
  `user_type` int(2) NOT NULL DEFAULT '1' COMMENT '1',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_person_info
-- ----------------------------
INSERT INTO `tb_person_info` VALUES ('1', 'test', '', 'email', '男', '1', '2', '2020-05-16 15:11:39', '2020-05-16 15:11:42');
INSERT INTO `tb_person_info` VALUES ('3', '我爱你', null, null, '女', '1', '1', '2020-05-16 08:41:21', '2020-05-16 08:41:21');

-- ----------------------------
-- Table structure for `tb_product`
-- ----------------------------
DROP TABLE IF EXISTS `tb_product`;
CREATE TABLE `tb_product` (
  `product_id` int(100) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `product_desc` varchar(2000) DEFAULT NULL,
  `img_addr` varchar(2000) DEFAULT '',
  `normal_price` varchar(100) DEFAULT NULL,
  `promotion_price` varchar(100) DEFAULT NULL,
  `priority` int(2) NOT NULL DEFAULT '0',
  `point` int(10) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  `enable_status` int(20) NOT NULL DEFAULT '0',
  `product_category_id` int(11) DEFAULT NULL,
  `shop_id` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`),
  KEY `fk_product_productcate` (`product_category_id`),
  KEY `fk_product_shop` (`shop_id`),
  CONSTRAINT `fk_product_productcate` FOREIGN KEY (`product_category_id`) REFERENCES `tb_product_category` (`product_category_id`),
  CONSTRAINT `fk_product_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_product
-- ----------------------------
INSERT INTO `tb_product` VALUES ('1', '四季奶青', '四季春茶搭配特选植脂末，清香顺口，带有淡淡茉莉花香，回味无穷', '/upload/images/item/shop/1/四季奶青.jpg', '10', '7', '100', '0', '2020-04-27 01:20:40', '2020-04-27 01:20:40', '1', '3', '1');
INSERT INTO `tb_product` VALUES ('2', '乌龙玛奇朵', '乌龙茶与淡奶油的美妙搭配，淡奶油伴着茶汤入口，惊喜不已', '/upload/images/item/shop/1/乌龙玛奇朵.jpg', '12', '9', '90', '0', '2020-04-27 01:22:00', '2020-04-27 01:22:00', '1', '3', '1');
INSERT INTO `tb_product` VALUES ('3', '珍珠奶茶', '奶茶搭配珍珠。口感滑溜顺畅', '/upload/images/item/shop/1/珍珠奶茶.jpg', '10', null, '100', '0', '2020-04-27 19:56:35', '2020-04-27 19:56:38', '1', '2', '1');
INSERT INTO `tb_product` VALUES ('4', '波霸奶茶', '奶茶搭配波霸，口感软Q', '/upload/images/item/shop/1/波霸奶茶.jpg', '10', null, '90', '0', '2020-04-27 14:23:52', '2020-04-27 14:23:55', '1', '2', '1');
INSERT INTO `tb_product` VALUES ('5', '阿萨姆红茶', '味甘温和略有果香', '/upload/images/item/shop/1/阿萨姆红茶.jpg', '7', null, '100', '0', '2020-04-27 19:47:56', '2020-04-27 19:47:59', '1', '1', '1');
INSERT INTO `tb_product` VALUES ('6', '翡翠柠檬', '青柠檬酸甜香味调配茉莉绿茶，清新爽口', '/upload/images/item/shop/1/翡翠柠檬.jpg', '12', null, '90', '0', '2020-04-27 19:50:20', '2020-04-27 19:50:23', '1', '1', '1');
INSERT INTO `tb_product` VALUES ('7', '柠檬汁', '鲜榨柠檬汁，新鲜纯正', '/upload/images/item/shop/1/柠檬汁.jpg', '12', null, '100', '0', '2020-04-27 19:57:57', '2020-04-27 19:57:59', '1', '4', '1');
INSERT INTO `tb_product` VALUES ('8', '柠檬养乐多', '纯正养乐多加上黄金比例的柠檬汁调制而成，纯正风味儿', '/upload/images/item/shop/1/柠檬养乐多.jpg', '15', null, '90', '0', '2020-04-27 20:01:05', '2020-04-27 20:01:08', '1', '4', '1');
INSERT INTO `tb_product` VALUES ('9', '抹茶奶茶', '抹茶搭配特选植脂末，香醇丝滑', '/upload/images/item/shop/1/抹茶奶茶.jpg', '13', null, '0', '0', '2020-04-27 21:10:24', '2020-04-27 21:10:26', '1', '3', '1');
INSERT INTO `tb_product` VALUES ('10', '可可芭蕾', '进口自法国的巧克力粉，经由比例调配，更加香浓顺滑', '/upload/images/item/shop/1/可可芭蕾.jpg', '14', null, '80', '0', '2020-04-27 21:07:28', '2020-04-27 21:07:31', '1', '3', '1');
INSERT INTO `tb_product` VALUES ('11', '红茶拿铁', '锡兰红茶搭配牛乳，柔和顺滑', '/upload/images/item/shop/1/红茶拿铁.jpg', '14', null, '80', '0', '2020-04-27 21:13:58', '2020-04-27 21:14:01', '1', '5', '1');
INSERT INTO `tb_product` VALUES ('12', '抹茶拿铁', '抹茶搭配牛乳，滴滴香浓', '/upload/images/item/shop/1/抹茶拿铁.jpg', '16', null, '90', '0', '2020-04-27 21:15:37', '2020-04-27 21:15:34', '1', '5', '1');
INSERT INTO `tb_product` VALUES ('13', '烤肉', '各种肉，随便烤', '/upload/images/item/shop/5/肉.jpg', '以菜单为准', null, '100', '0', '2020-04-27 21:41:50', '2020-04-27 21:41:53', '1', '6', '5');
INSERT INTO `tb_product` VALUES ('14', '烤蔬菜', '各种菜都能烤', '/upload/images/item/shop/5/蔬菜.jpg', '以菜单为准', null, '90', '0', '2020-04-27 21:55:53', '2020-04-27 21:55:50', '1', '7', '5');
INSERT INTO `tb_product` VALUES ('15', '烤水果', '各种瓜果，随便烤', '/upload/images/item/shop/5/水果.jpg', '以菜单为准', null, '80', '0', '2020-04-27 21:55:55', '2020-04-27 21:55:58', '1', '8', '5');
INSERT INTO `tb_product` VALUES ('17', '油焖大虾', '用油，各种卤料一起焖', '/upload/images/item/shop/6/油焖大虾.jpg', '128(小份)168(中份)198(大份)', null, '90', '0', '2020-04-27 22:38:21', '2020-04-27 22:38:18', '1', '9', '6');
INSERT INTO `tb_product` VALUES ('18', '蒜蓉大虾', '蒜蓉调和，爽口的很', '/upload/images/item/shop/6/蒜蓉大虾.jpg', '128(小份)168(中份)198(大份)', null, '80', '0', '2020-04-27 22:44:01', '2020-04-27 22:44:03', '1', '10', '6');
INSERT INTO `tb_product` VALUES ('19', '清蒸老龙虾', '精选老龙虾，原汁原味', '/upload/images/item/shop/6/清蒸老龙虾.jpg', '168(小份)198(中份)268(大份)', null, '100', '0', '2020-04-27 22:45:38', '2020-04-27 22:45:40', '1', '11', '6');

-- ----------------------------
-- Table structure for `tb_product_category`
-- ----------------------------
DROP TABLE IF EXISTS `tb_product_category`;
CREATE TABLE `tb_product_category` (
  `product_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_category_name` varchar(100) NOT NULL,
  `priority` int(2) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `shop_id` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_category_id`),
  KEY `fk_procategory_shop` (`shop_id`),
  CONSTRAINT `fk_procategory_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_product_category
-- ----------------------------
INSERT INTO `tb_product_category` VALUES ('1', '找好茶', '1', '2020-04-27 19:43:19', '1');
INSERT INTO `tb_product_category` VALUES ('2', '找口感', '2', '2020-04-27 19:43:23', '1');
INSERT INTO `tb_product_category` VALUES ('3', '找奶茶', '3', '2020-04-27 19:43:25', '1');
INSERT INTO `tb_product_category` VALUES ('4', '找新鲜', '4', '2020-04-27 19:43:27', '1');
INSERT INTO `tb_product_category` VALUES ('5', '找拿铁', '5', '2020-04-27 19:43:32', '1');
INSERT INTO `tb_product_category` VALUES ('6', '肉类', '6', '2020-04-27 21:45:43', '5');
INSERT INTO `tb_product_category` VALUES ('7', '蔬菜类', '7', '2020-04-27 21:53:47', '5');
INSERT INTO `tb_product_category` VALUES ('8', '水果类', '8', '2020-04-27 21:54:24', '5');
INSERT INTO `tb_product_category` VALUES ('9', '油焖', '9', '2020-04-27 22:33:52', '6');
INSERT INTO `tb_product_category` VALUES ('10', '蒜蓉', '10', '2020-04-27 22:35:11', '6');
INSERT INTO `tb_product_category` VALUES ('11', '清蒸', '11', '2020-04-27 22:35:42', '6');

-- ----------------------------
-- Table structure for `tb_product_img`
-- ----------------------------
DROP TABLE IF EXISTS `tb_product_img`;
CREATE TABLE `tb_product_img` (
  `product_img_id` int(20) NOT NULL AUTO_INCREMENT,
  `img_addr` varchar(2000) NOT NULL,
  `img_desc` varchar(2000) DEFAULT NULL,
  `priority` int(2) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `product_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`product_img_id`),
  KEY `fk_productimg_product` (`product_id`),
  CONSTRAINT `fk_productimg_product` FOREIGN KEY (`product_id`) REFERENCES `tb_product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_product_img
-- ----------------------------
INSERT INTO `tb_product_img` VALUES ('1', '/upload/images/item/shop/5/鸡爪.jpg', '烤鸡爪', '80', '2020-04-27 22:00:46', '13');
INSERT INTO `tb_product_img` VALUES ('2', '/upload/images/item/shop/5/脆骨.jpg', '烤脆骨', '100', '2020-04-27 21:59:39', '13');
INSERT INTO `tb_product_img` VALUES ('3', '/upload/images/item/shop/5/鸡翅.jpg', '烤鸡翅', '90', '2020-04-27 22:00:49', '13');
INSERT INTO `tb_product_img` VALUES ('4', '/upload/images/item/shop/5/羊肉串.jpg', '烤羊肉串', '70', '2020-04-27 22:01:10', '13');
INSERT INTO `tb_product_img` VALUES ('5', '/upload/images/item/shop/5/面筋.jpg', '烤面筋', '60', '2020-04-27 22:02:44', '13');
INSERT INTO `tb_product_img` VALUES ('6', '/upload/images/item/shop/5/烤生蚝.jpg', '烤生蚝', '50', '2020-04-27 22:03:21', '13');

-- ----------------------------
-- Table structure for `tb_shop`
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop`;
CREATE TABLE `tb_shop` (
  `shop_id` int(10) NOT NULL AUTO_INCREMENT,
  `owner_id` int(10) NOT NULL COMMENT '店铺创始人',
  `area_id` int(5) DEFAULT NULL,
  `shop_category_id` int(11) DEFAULT NULL,
  `shop_name` varchar(256) NOT NULL,
  `shop_desc` varchar(1024) DEFAULT NULL,
  `shop_addr` varchar(200) DEFAULT NULL,
  `phone` varchar(128) DEFAULT NULL,
  `shop_img` varchar(1024) DEFAULT NULL,
  `priority` int(3) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT '0',
  `advice` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`shop_id`),
  KEY `fk_shop_area` (`area_id`),
  KEY `fk_shop_profile` (`owner_id`),
  KEY `fk_shop_category` (`shop_category_id`),
  CONSTRAINT `fk_shop_area` FOREIGN KEY (`area_id`) REFERENCES `tb_area` (`area_id`),
  CONSTRAINT `fk_shop_category` FOREIGN KEY (`shop_category_id`) REFERENCES `tb_shop_category` (`shop_category_id`),
  CONSTRAINT `fk_shop_profile` FOREIGN KEY (`owner_id`) REFERENCES `tb_person_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_shop
-- ----------------------------
INSERT INTO `tb_shop` VALUES ('1', '1', '2', '22', '一点点', '当咖啡冻遇见奶茶', '石头街2号', null, '/upload/images/item/shop/1/海报.jpg', '50', '2020-04-27 19:41:55', '2020-04-27 19:41:59', '1', null);
INSERT INTO `tb_shop` VALUES ('2', '1', '3', '22', 'coco', '都市茶饮，总有你爱的', '美食城33号', '', '/upload/images/item/shop/2/coco.jpg', '40', '2020-04-27 01:05:49', '2020-04-27 01:05:49', '1', null);
INSERT INTO `tb_shop` VALUES ('3', '1', '3', '19', '太平洋咖啡', '都市白领的最爱', '洞庭街1号', '', '/upload/images/item/shop/3/太平洋咖啡.jpg', '10', '2020-04-27 13:04:21', '2020-04-27 13:04:24', '1', null);
INSERT INTO `tb_shop` VALUES ('4', '1', '3', '19', '星巴克', '各种咖啡等你来', '八仙路1号', '', '/upload/images/item/shop/4/星巴克.jpg', '49', '2020-04-27 11:23:28', '2020-04-27 11:23:31', '1', null);
INSERT INTO `tb_shop` VALUES ('5', '1', '2', '20', '老五烧烤', '特色烧烤，夜宵，小龙虾', '拐角街5号', '', '/upload/images/item/shop/5/老五烧烤.jpg', '30', '2020-04-27 01:06:37', '2020-04-27 01:06:37', '1', null);
INSERT INTO `tb_shop` VALUES ('6', '1', '2', '20', '小亮蒸虾', '好吃的不得了', '胡同街7号', '', '/upload/images/item/shop/6/小亮蒸虾.jpg', '20', '2020-04-27 01:07:21', '2020-04-27 01:07:21', '1', null);

-- ----------------------------
-- Table structure for `tb_shop_category`
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_category`;
CREATE TABLE `tb_shop_category` (
  `shop_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_category_name` varchar(100) NOT NULL DEFAULT '',
  `shop_category_desc` varchar(1000) DEFAULT '',
  `shop_category_img` varchar(2000) DEFAULT NULL,
  `priority` int(2) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`shop_category_id`),
  KEY `fk_shop_category_self` (`parent_id`),
  CONSTRAINT `fk_shop_category_self` FOREIGN KEY (`parent_id`) REFERENCES `tb_shop_category` (`shop_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_shop_category
-- ----------------------------
INSERT INTO `tb_shop_category` VALUES ('10', '二手市场', '二手商品交易', '/upload/images/item/shopcategory/1.png', '100', '2020-04-23 20:10:58', '2020-04-26 12:27:22', null);
INSERT INTO `tb_shop_category` VALUES ('11', '美容美发', '美容美发', '/upload/images/item/shopcategory/2.png', '99', '2020-04-23 20:10:58', '2020-04-26 12:27:22', null);
INSERT INTO `tb_shop_category` VALUES ('12', '美食饮品', '美食饮品', '/upload/images/item/shopcategory/3.png', '98', '2020-04-23 20:10:58', '2020-04-26 12:27:22', null);
INSERT INTO `tb_shop_category` VALUES ('13', '休闲娱乐', '休闲娱乐', '/upload/images/item/shopcategory/4.png', '97', '2020-04-23 20:10:58', '2020-04-26 12:27:22', null);
INSERT INTO `tb_shop_category` VALUES ('14', '旧车', '旧车', '/upload/images/item/shopcategory/5.png', '80', '2020-04-23 20:10:58', '2020-04-26 12:27:22', '10');
INSERT INTO `tb_shop_category` VALUES ('15', '二手书籍', '二手书籍', '/upload/images/item/shopcategory/6.png', '79', '2020-04-23 20:10:58', '2020-04-26 12:27:22', '10');
INSERT INTO `tb_shop_category` VALUES ('17', '护理', '护理', '/upload/images/item/shopcategory/7.png', '76', '2020-04-23 20:10:58', '2020-04-26 12:27:22', '11');
INSERT INTO `tb_shop_category` VALUES ('18', '理发', '理发', '/upload/images/item/shopcategory/8.png', '74', '2020-04-23 20:10:58', '2020-04-26 12:27:22', '11');
INSERT INTO `tb_shop_category` VALUES ('19', '咖啡', '美式，意大利，糕点', '/upload/images/item/shopcategory/shop-category-咖啡.jpg', '61', '2020-04-27 11:13:10', '2020-04-27 11:13:12', '12');
INSERT INTO `tb_shop_category` VALUES ('20', '烧烤', '烧烤，小龙虾，beer', '/upload/images/item/shopcategory/shop-category-烧烤.jpg', '59', '2020-04-23 20:10:58', '2020-04-26 12:27:22', '12');
INSERT INTO `tb_shop_category` VALUES ('22', '奶茶', '奶饮，茶饮', '/upload/images/item/shopcategory/shop-category-奶茶.jpg', '58', '2020-04-23 20:10:58', '2020-04-26 12:27:22', '12');
INSERT INTO `tb_shop_category` VALUES ('23', '火锅', '牛羊肉，海鲜, 聚餐', '/upload/images/item/shopcategory/shop-category-火锅.jpg', '60', '2020-04-27 11:12:06', '2020-04-27 11:12:10', '12');
INSERT INTO `tb_shop_category` VALUES ('24', '密室逃生', '密室逃生', '/upload/images/item/shopcategory/shop-category-密室逃脱.jpg', '56', '2020-04-23 20:10:58', '2020-04-26 12:27:22', '13');
INSERT INTO `tb_shop_category` VALUES ('25', 'KTV', 'KTV', '/upload/images/item/shopcategory/shop-category-KTV.jpg', '57', '2020-04-23 20:10:58', '2020-04-26 12:27:22', '13');
INSERT INTO `tb_shop_category` VALUES ('27', '培训教育', '培训教育', '/upload/images/item/shopcategory/13.png', '96', '2020-04-23 20:10:58', '2020-04-26 12:27:22', null);
INSERT INTO `tb_shop_category` VALUES ('28', '租赁市场', '租赁市场', '/upload/images/item/shopcategory/14.png', '95', '2020-04-23 20:10:58', '2020-04-26 12:27:22', null);
INSERT INTO `tb_shop_category` VALUES ('29', '程序设计', '程序设计', '/upload/images/item/shopcategory/15.png', '50', '2020-04-23 20:10:58', '2020-04-26 12:27:22', '27');
INSERT INTO `tb_shop_category` VALUES ('30', '声乐舞蹈', '声乐舞蹈', '/upload/images/item/shopcategory/16.png', '49', '2020-04-23 20:10:58', '2020-04-26 12:27:22', '27');
INSERT INTO `tb_shop_category` VALUES ('31', '演出道具', '演出道具', '/upload/images/item/shopcategory/17.png', '45', '2020-04-23 20:10:58', '2020-04-26 12:27:22', '28');
INSERT INTO `tb_shop_category` VALUES ('32', '交通工具', '交通工具', '/upload/images/item/shopcategory/18.png', '44', '2020-04-23 20:10:58', '2020-04-26 12:27:22', '28');

-- ----------------------------
-- Table structure for `tb_wechat_auth`
-- ----------------------------
DROP TABLE IF EXISTS `tb_wechat_auth`;
CREATE TABLE `tb_wechat_auth` (
  `wechat_auth_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `open_id` varchar(1024) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`wechat_auth_id`),
  UNIQUE KEY `open_id` (`open_id`),
  KEY `fk_wechatauth_profile` (`user_id`),
  CONSTRAINT `fk_wechatauth_profile` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_wechat_auth
-- ----------------------------
