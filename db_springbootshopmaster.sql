/*
Navicat MySQL Data Transfer

Source Server         : 115.159.219.190
Source Server Version : 50720
Source Host           : 115.159.219.190:3306
Source Database       : db_shopmaster

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2019-05-13 11:44:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `activityId` int(12) NOT NULL AUTO_INCREMENT,
  `activityName` varchar(50) NOT NULL,
  `activityDes` varchar(500) NOT NULL,
  `discount` float DEFAULT '1',
  `fullPrice` int(12) DEFAULT NULL,
  `reducePrice` int(12) DEFAULT NULL,
  `fullNum` int(12) DEFAULT NULL,
  `reduceNum` int(12) DEFAULT NULL,
  PRIMARY KEY (`activityId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('1', '测试活动', '1231', '1', '123', '123', '1231', '12');
INSERT INTO `activity` VALUES ('2', '开业大酬宾', '开业大酬宾，全场9折。', '9.2', '100', '8', '200', '20');

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `addressID` int(12) NOT NULL AUTO_INCREMENT,
  `userId` int(12) NOT NULL,
  `province` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `county` varchar(50) NOT NULL,
  `detailAddr` varchar(50) NOT NULL,
  `conName` varchar(50) NOT NULL,
  `conTel` varchar(50) NOT NULL,
  PRIMARY KEY (`addressID`),
  KEY `addressID` (`addressID`),
  KEY `userId` (`userId`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('7', '1', '北京市', '北京市市辖区', '东城区', '12312', '123123', '2131231321');
INSERT INTO `address` VALUES ('8', '3', '湖南省', '长沙市', '雨花区', '长沙理工大学', '张鑫', '18229189406');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminId` int(12) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '25d55ad283aa400af464c76d713c07ad');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cateId` int(12) NOT NULL AUTO_INCREMENT,
  `cateName` varchar(50) NOT NULL,
  PRIMARY KEY (`cateId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '数码');
INSERT INTO `category` VALUES ('2', '服饰');
INSERT INTO `category` VALUES ('3', '家电');
INSERT INTO `category` VALUES ('4', '书籍');
INSERT INTO `category` VALUES ('5', '其他');

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `userId` int(12) NOT NULL,
  `goodsId` int(12) NOT NULL,
  `collectTime` datetime NOT NULL,
  PRIMARY KEY (`userId`,`goodsId`),
  KEY `collection_ibfk_2` (`goodsId`),
  CONSTRAINT `collection_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `collection_ibfk_2` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES ('3', '93', '2019-05-13 10:47:26');
INSERT INTO `collection` VALUES ('3', '94', '2019-05-13 10:16:11');
INSERT INTO `collection` VALUES ('3', '95', '2019-05-13 10:37:35');
INSERT INTO `collection` VALUES ('3', '97', '2019-05-13 10:23:11');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `commentId` int(12) NOT NULL AUTO_INCREMENT,
  `userId` int(12) NOT NULL,
  `goodsId` int(12) NOT NULL,
  `point` int(8) NOT NULL,
  `content` varchar(255) NOT NULL,
  `commentTime` datetime NOT NULL,
  PRIMARY KEY (`commentId`),
  KEY `userId` (`userId`),
  KEY `goodsId` (`goodsId`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('2', '3', '93', '4', '商品特别好，我非常喜欢', '2019-05-13 10:48:51');

-- ----------------------------
-- Table structure for deliver
-- ----------------------------
DROP TABLE IF EXISTS `deliver`;
CREATE TABLE `deliver` (
  `deliverId` int(12) NOT NULL AUTO_INCREMENT,
  `orderId` int(12) NOT NULL,
  `sendId` int(12) NOT NULL,
  PRIMARY KEY (`deliverId`),
  KEY `orderId` (`orderId`),
  CONSTRAINT `deliver_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `indent` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deliver
-- ----------------------------

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goodsId` int(12) NOT NULL AUTO_INCREMENT,
  `goodsName` varchar(50) NOT NULL,
  `price` int(12) NOT NULL,
  `num` int(12) NOT NULL,
  `upTime` datetime NOT NULL,
  `category` int(12) NOT NULL,
  `detailCate` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `activityId` int(12) NOT NULL DEFAULT '1',
  PRIMARY KEY (`goodsId`),
  KEY `activityId` (`activityId`),
  KEY `category` (`category`),
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`activityId`) REFERENCES `activity` (`activityId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `goods_ibfk_2` FOREIGN KEY (`category`) REFERENCES `category` (`cateId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('93', '测试商品1', '10', '29', '2019-05-10 19:43:04', '1', '测试', '这是测试商品1', '1');
INSERT INTO `goods` VALUES ('94', '测试商品2', '23', '34', '2019-05-10 19:44:28', '2', '测试', '这是测试商品2', '1');
INSERT INTO `goods` VALUES ('95', '这是测试商品', '123', '1231', '2019-05-11 11:41:24', '1', '测试', '测试商品', '1');
INSERT INTO `goods` VALUES ('96', '测试商品4', '213', '222', '2019-05-11 11:42:00', '1', '12321', '这是一个测试商品4', '1');
INSERT INTO `goods` VALUES ('97', '测试商品5', '213', '212', '2019-05-13 10:22:58', '1', '测试', '这是测试商品', '1');

-- ----------------------------
-- Table structure for imagepath
-- ----------------------------
DROP TABLE IF EXISTS `imagepath`;
CREATE TABLE `imagepath` (
  `pathId` int(12) NOT NULL AUTO_INCREMENT,
  `goodId` int(12) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`pathId`),
  KEY `goodid` (`goodId`),
  CONSTRAINT `imagepath_ibfk_1` FOREIGN KEY (`goodId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imagepath
-- ----------------------------
INSERT INTO `imagepath` VALUES ('114', '93', '3a25测试商品1新公司录用offer.png');
INSERT INTO `imagepath` VALUES ('115', '93', '6a7b测试商品1原公司解约通知.png');
INSERT INTO `imagepath` VALUES ('116', '94', 'c1a9测试商品2user3.png');
INSERT INTO `imagepath` VALUES ('117', '95', 'bd30这是测试商品QQ浏览器截图20181120200039.png');
INSERT INTO `imagepath` VALUES ('118', '96', '94e9123QQ浏览器截图20180925163930.png');
INSERT INTO `imagepath` VALUES ('119', '96', '7c68123QQ浏览器截图20181120200033.png');
INSERT INTO `imagepath` VALUES ('120', '96', '669e123QQ浏览器截图20181120200038.png');
INSERT INTO `imagepath` VALUES ('121', '97', 'c2e5测试商品5QQ浏览器截图20180628082816.png');
INSERT INTO `imagepath` VALUES ('122', '97', '61dd测试商品5QQ浏览器截图20180910091336.png');
INSERT INTO `imagepath` VALUES ('123', '97', '0f0b测试商品5QQ浏览器截图20180917082049.png');
INSERT INTO `imagepath` VALUES ('124', '97', '8020测试商品5QQ浏览器截图20180925163930.png');
INSERT INTO `imagepath` VALUES ('125', '97', 'd8f2测试商品5QQ浏览器截图20181120200033.png');
INSERT INTO `imagepath` VALUES ('126', '97', '776b测试商品5QQ浏览器截图20181120200038.png');
INSERT INTO `imagepath` VALUES ('127', '97', '65be测试商品5QQ浏览器截图20181120200039.png');
INSERT INTO `imagepath` VALUES ('128', '97', 'c2a3测试商品5QQ浏览器截图20190307101645.png');

-- ----------------------------
-- Table structure for indent
-- ----------------------------
DROP TABLE IF EXISTS `indent`;
CREATE TABLE `indent` (
  `orderId` int(12) NOT NULL AUTO_INCREMENT,
  `userId` int(12) NOT NULL,
  `orderTime` datetime NOT NULL,
  `oldPrice` float NOT NULL,
  `newPrice` float NOT NULL,
  `isPay` tinyint(1) NOT NULL,
  `isSend` tinyint(1) NOT NULL,
  `isReceive` tinyint(1) NOT NULL,
  `isComplete` tinyint(1) NOT NULL,
  `addressId` int(12) NOT NULL,
  PRIMARY KEY (`orderId`),
  KEY `userId` (`userId`),
  KEY `orderGoods` (`orderTime`),
  KEY `addressId` (`addressId`),
  CONSTRAINT `indent_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `indent_ibfk_2` FOREIGN KEY (`addressId`) REFERENCES `address` (`addressID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of indent
-- ----------------------------
INSERT INTO `indent` VALUES ('28', '3', '2019-05-11 11:33:10', '10', '10', '1', '1', '1', '1', '8');
INSERT INTO `indent` VALUES ('29', '3', '2019-05-11 11:39:39', '125', '125', '1', '1', '1', '1', '8');
INSERT INTO `indent` VALUES ('30', '3', '2019-05-13 10:16:19', '109', '109', '1', '1', '1', '1', '8');
INSERT INTO `indent` VALUES ('31', '3', '2019-05-13 10:37:59', '10', '10', '0', '1', '1', '1', '8');
INSERT INTO `indent` VALUES ('32', '3', '2019-05-13 10:43:05', '10', '10', '1', '1', '0', '0', '8');
INSERT INTO `indent` VALUES ('33', '3', '2019-05-13 10:47:42', '40', '40', '1', '1', '1', '1', '8');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `itemId` int(12) NOT NULL AUTO_INCREMENT,
  `orderId` int(12) NOT NULL,
  `goodsId` int(12) NOT NULL,
  `num` int(12) NOT NULL,
  PRIMARY KEY (`itemId`),
  KEY `orderId` (`orderId`),
  KEY `goodsId` (`goodsId`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `indent` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('14', '28', '93', '1');
INSERT INTO `orderitem` VALUES ('15', '29', '93', '1');
INSERT INTO `orderitem` VALUES ('16', '29', '94', '5');
INSERT INTO `orderitem` VALUES ('17', '30', '93', '4');
INSERT INTO `orderitem` VALUES ('18', '30', '94', '3');
INSERT INTO `orderitem` VALUES ('19', '31', '93', '1');
INSERT INTO `orderitem` VALUES ('20', '32', '93', '1');
INSERT INTO `orderitem` VALUES ('21', '33', '93', '4');

-- ----------------------------
-- Table structure for shopcart
-- ----------------------------
DROP TABLE IF EXISTS `shopcart`;
CREATE TABLE `shopcart` (
  `userId` int(12) NOT NULL,
  `goodsid` int(12) NOT NULL,
  `cateDate` datetime NOT NULL,
  `goodsNum` int(12) NOT NULL,
  PRIMARY KEY (`userId`,`goodsid`),
  KEY `userId` (`userId`),
  KEY `goodsid` (`goodsid`),
  CONSTRAINT `shopcart_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shopcart_ibfk_2` FOREIGN KEY (`goodsid`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopcart
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(12) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `regTime` datetime NOT NULL,
  `email` varchar(50) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  PRIMARY KEY (`userId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'root', '12345678', '2019-04-18 17:16:34', '916877983@qq.com', '18229819406');
INSERT INTO `user` VALUES ('2', 'zhangxin', '19402600297a305197962a5633e7711e', '2019-04-22 15:29:12', '994683607@qq.com', '18229819406');
INSERT INTO `user` VALUES ('3', 'admin', '25d55ad283aa400af464c76d713c07ad', '2019-05-16 10:46:46', '123123', '1231321');
