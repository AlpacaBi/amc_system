/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : ams

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 14/06/2018 10:33:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `logincount` int(4) NOT NULL,
  `department` int(4) NOT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `workphone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mobilephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `permission` int(1) NOT NULL,
  `lasttime` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK586034F7C32472F`(`department`) USING BTREE,
  INDEX `FK586034F6E7261AF`(`department`) USING BTREE,
  CONSTRAINT `FK586034F6E7261AF` FOREIGN KEY (`department`) REFERENCES `department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'SuperAdmin', '741258', 'Ryan', 62, 18, 'biguokang@outlook.com', '000', '15622573836', 0, '2017-03-15 16:07:13');
INSERT INTO `admin` VALUES (2, 'Ryanseac', '123456', 'Ryan', 99, 1, 'fengxidadi@163.com', '15465632623', '5656526565523232', 1, '2011-05-06 09:01:32');
INSERT INTO `admin` VALUES (4, 'asdadasd', '111111', 'asdasd', 0, 2, 'asd@df.h', '', '', 1, '2011-04-09 17:26:33');
INSERT INTO `admin` VALUES (5, 'biguokang', '741258', 'biguokang', 1, 18, '111@qq.com', '', '', 1, '2017-03-15 13:36:29');

-- ----------------------------
-- Table structure for assets
-- ----------------------------
DROP TABLE IF EXISTS `assets`;
CREATE TABLE `assets`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `aid` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `assetname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` int(4) NOT NULL,
  `version` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `manufacturer` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `manufacturedate` datetime(0) DEFAULT NULL,
  `buydate` datetime(0) NOT NULL,
  `price` double NOT NULL,
  `usestate` int(1) NOT NULL,
  `deprecition` int(1) NOT NULL,
  `department` int(4) DEFAULT NULL,
  `user` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKAC1073836E7261AF`(`department`) USING BTREE,
  INDEX `FKAC10738349DADDBF`(`type`) USING BTREE,
  INDEX `FKAC10738349DB96E1`(`user`) USING BTREE,
  CONSTRAINT `FKAC10738349DADDBF` FOREIGN KEY (`type`) REFERENCES `type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKAC10738349DB96E1` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKAC1073836E7261AF` FOREIGN KEY (`department`) REFERENCES `department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `assets_department` FOREIGN KEY (`department`) REFERENCES `department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `assets_type` FOREIGN KEY (`type`) REFERENCES `type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `assets_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of assets
-- ----------------------------
INSERT INTO `assets` VALUES (1, 'GHJYIOI', 'Opera测试', 11, '', '', NULL, '2011-04-14 00:00:00', 1000, 1, 1, NULL, NULL);
INSERT INTO `assets` VALUES (2, 'GHJYIOI', 'Opera测试2', 11, '', '', NULL, '2011-04-14 00:00:00', 1000, 1, 2, NULL, NULL);
INSERT INTO `assets` VALUES (3, 'OIYBJGUI', 'IE8测试', 10, 'EB1001', '504', '2011-04-01 00:00:00', '2011-04-12 00:00:00', 1000, 2, 2, 1, 1);
INSERT INTO `assets` VALUES (4, 'HJHUI', 'Price测试', 10, '', '', NULL, '2011-04-12 00:00:00', 2000, 1, 1, NULL, NULL);
INSERT INTO `assets` VALUES (5, 'HJHUI', 'Price测试2', 10, '', '', NULL, '2011-04-12 00:00:00', 2000.1, 1, 1, NULL, NULL);
INSERT INTO `assets` VALUES (6, 'YH7FR9I0', 'WS', 11, '', '', NULL, '2011-04-14 00:00:00', 1000000, 3, 2, NULL, NULL);
INSERT INTO `assets` VALUES (7, 'YH7FR9I0', 'WS', 11, '', '', NULL, '2011-04-14 00:00:00', 1000000, 1, 2, NULL, NULL);
INSERT INTO `assets` VALUES (8, 'YH7FR9I0', 'WS', 11, '', '', NULL, '2011-04-14 00:00:00', 1000000, 1, 2, NULL, NULL);
INSERT INTO `assets` VALUES (9, 'YH7FR9I0', 'WS', 11, '', '', NULL, '2011-04-14 00:00:00', 1000000, 1, 2, NULL, NULL);
INSERT INTO `assets` VALUES (10, 'YH7FR9I0', 'WS', 11, '', '', NULL, '2011-04-14 00:00:00', 1000000, 1, 2, NULL, NULL);
INSERT INTO `assets` VALUES (11, 'YH7FR9I0', 'WS', 11, '', '', NULL, '2011-04-14 00:00:00', 1000000, 1, 2, NULL, NULL);
INSERT INTO `assets` VALUES (12, 'YH7FR9I0', 'WS', 11, '', '', NULL, '2011-04-14 00:00:00', 1000000, 1, 2, NULL, NULL);
INSERT INTO `assets` VALUES (13, 'YH7FR9I0', 'WS', 11, '', '', NULL, '2011-04-14 00:00:00', 1000000, 1, 2, NULL, NULL);
INSERT INTO `assets` VALUES (14, 'YH7FR9I0', 'WS', 11, '', '', NULL, '2011-04-14 00:00:00', 1000000, 1, 2, NULL, NULL);
INSERT INTO `assets` VALUES (15, 'YH7FR9I0', 'WS', 11, '', '', NULL, '2011-04-14 00:00:00', 1000000, 1, 2, NULL, NULL);
INSERT INTO `assets` VALUES (16, 'YH7FR9I0', 'WS', 11, '', '', NULL, '2011-04-14 00:00:00', 1000000, 1, 2, NULL, NULL);

-- ----------------------------
-- Table structure for bsend
-- ----------------------------
DROP TABLE IF EXISTS `bsend`;
CREATE TABLE `bsend`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `aid` int(4) NOT NULL,
  `bSenddate` datetime(0) NOT NULL,
  `cost` double NOT NULL,
  `state` int(11) NOT NULL,
  `bSendperson` int(4) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK59ACEEA510D054A`(`aid`) USING BTREE,
  CONSTRAINT `FK59ACEEA510D054A` FOREIGN KEY (`aid`) REFERENCES `assets` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bsend_assets` FOREIGN KEY (`aid`) REFERENCES `assets` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bsend
-- ----------------------------
INSERT INTO `bsend` VALUES (1, 6, '2011-04-19 00:00:00', 1222, 1, 5, '');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dpname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, 'DIT', NULL);
INSERT INTO `department` VALUES (2, 'TIT', NULL);
INSERT INTO `department` VALUES (5, 'RTTYB', '');
INSERT INTO `department` VALUES (12, 'JAVA', NULL);
INSERT INTO `department` VALUES (18, '系统主管', '系统最高权限管理者');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `testdate` datetime(0) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('2011-02-08 16:25:47', 1, 'ss');
INSERT INTO `test` VALUES ('2011-01-02 16:27:05', 2, 'ss');
INSERT INTO `test` VALUES ('2010-12-10 16:27:16', 3, 'ss');
INSERT INTO `test` VALUES ('2011-03-07 23:25:30', 4, 'ss');
INSERT INTO `test` VALUES ('2011-03-07 23:56:41', 5, 'aaa');
INSERT INTO `test` VALUES ('2011-03-07 23:53:04', 6, 'ss');
INSERT INTO `test` VALUES ('2011-03-07 23:53:21', 7, 'ss');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `typename` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (2, '手机', '');
INSERT INTO `type` VALUES (10, '电脑', '');
INSERT INTO `type` VALUES (11, '生活用品', '');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `department` int(4) NOT NULL,
  `email` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `workphone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mobilephone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK36EBCB6E7261AF`(`department`) USING BTREE,
  CONSTRAINT `FK36EBCB6E7261AF` FOREIGN KEY (`department`) REFERENCES `department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_user` FOREIGN KEY (`department`) REFERENCES `department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'Ryan', 1, 'fengxidadi@163.com', '02783212002', '13469996379');
INSERT INTO `user` VALUES (2, 'Bnuindu', 5, 'sdsd@fdd.j', '164645454', '45487415');
INSERT INTO `user` VALUES (3, 'Bnuindu', 5, 'sdsd@fdd.j', '164645454', '45487415');
INSERT INTO `user` VALUES (4, 'Bnuindu', 5, 'sdsd@fdd.j', '164645454', '45487415');
INSERT INTO `user` VALUES (5, 'Bnuindu', 5, 'sdsd@fdd.j', '164645454', '45487415');
INSERT INTO `user` VALUES (6, 'Bnuindu', 5, 'sdsd@fdd.j', '164645454', '45487415');
INSERT INTO `user` VALUES (7, 'bgk', 12, '1083251760@qq.com', '', '');

SET FOREIGN_KEY_CHECKS = 1;
