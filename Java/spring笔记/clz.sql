/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : clz

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 20/03/2020 10:32:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BALANCE` int(11) NULL DEFAULT 2000,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (1, '车亮召', 2000);
INSERT INTO `account` VALUES (2, '陈诗琪', 4000);

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseName` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for emp
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `age` int(11) NULL DEFAULT 18,
  `gender` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '男',
  `salary` int(11) NULL DEFAULT 8000,
  `password` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '123456',
  `account` int(11) NULL DEFAULT 1000,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of emp
-- ----------------------------
INSERT INTO `emp` VALUES (1, '车亮召', 22, '男', 8000, '123456', 4000);
INSERT INTO `emp` VALUES (2, '陈诗琦', 22, '女', 8000, '123456', 3000);
INSERT INTO `emp` VALUES (14, '小红', 18, '男', 8000, '123456', 3000);
INSERT INTO `emp` VALUES (15, '小黑', 18, '男', 8000, '123456', 3000);
INSERT INTO `emp` VALUES (23, '小明', 21, '男', 8000, '123456', 1000);
INSERT INTO `emp` VALUES (24, '小陈', 12, '男', 8000, '123456', 1000);
INSERT INTO `emp` VALUES (25, '小黑', 18, '男', 8000, '123456', 1000);
INSERT INTO `emp` VALUES (26, '小黑', 18, '男', 8000, '123456', 1000);
INSERT INTO `emp` VALUES (27, '小黑', 18, '男', 8000, '123456', 1000);
INSERT INTO `emp` VALUES (28, '小黑', 18, '男', 8000, '123456', 1000);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for studentcourse
-- ----------------------------
DROP TABLE IF EXISTS `studentcourse`;
CREATE TABLE `studentcourse`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `course_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NUM` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (2, '车', '亮召');
INSERT INTO `user` VALUES (3, '陈', '诗琪');
INSERT INTO `user` VALUES (4, '车', '亮召');
INSERT INTO `user` VALUES (5, '陈', '诗琪');

-- ----------------------------
-- View structure for i_emp
-- ----------------------------
DROP VIEW IF EXISTS `i_emp`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `i_emp` AS select `emp`.`name` AS `NAME`,`emp`.`age` AS `AGE`,`emp`.`account` AS `ACCOUNT` from `emp`;

SET FOREIGN_KEY_CHECKS = 1;
