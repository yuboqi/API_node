/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : magiccreative

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 05/03/2023 22:26:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for claims
-- ----------------------------
DROP TABLE IF EXISTS `claims`;
CREATE TABLE `claims`  (
  `claims_id` int(255) NOT NULL,
  `claims_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `claims_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `claims_money` float(255, 2) NULL DEFAULT NULL,
  `claims_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `policies_id` int(255) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`claims_id`) USING BTREE,
  INDEX `policies_id`(`policies_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of claims
-- ----------------------------
INSERT INTO `claims` VALUES (1, '2023040401', '20230404', 15000.00, 'approved', 1, NULL);
INSERT INTO `claims` VALUES (2, '2023040402', '20230404', 20000.00, 'negotiation', 1, NULL);
INSERT INTO `claims` VALUES (3, '2023050501', '20230505', 200000.00, 'blocked', 2, NULL);
INSERT INTO `claims` VALUES (4, '2023060601', '20230606', 50000.00, 'negotiation', 2, NULL);

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `cust_id` int(255) NOT NULL,
  `cust_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `cust_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `cust_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `role` int(1) NULL DEFAULT NULL,
  `cust_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `cust_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `cust_birthday` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `cust_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `cust_sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cust_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, 'test01', '123', '欧阳烨', 3, '湖南省张家界市吉首大学', '13444544444', '20010927', '2247678912@qq.com', '男');
INSERT INTO `customer` VALUES (2, 'test02', '123', '许建胜', 3, '湖北省武汉市', '13888888888', '20010910', '960455454@qq.com', '男');

-- ----------------------------
-- Table structure for insurance_policies
-- ----------------------------
DROP TABLE IF EXISTS `insurance_policies`;
CREATE TABLE `insurance_policies`  (
  `policies_id` int(255) NOT NULL,
  `number` int(255) NOT NULL,
  `start_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `end_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `insurance_cost` float(255, 2) NULL DEFAULT NULL,
  `type_id` int(255) NULL DEFAULT NULL,
  `cust_id` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`policies_id`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE,
  INDEX `cust_id`(`cust_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of insurance_policies
-- ----------------------------
INSERT INTO `insurance_policies` VALUES (1, 2023030401, '202303', '202403', 2000.00, 1, 1);
INSERT INTO `insurance_policies` VALUES (2, 2023030402, '202303', '202503', 5000.00, 4, 2);

-- ----------------------------
-- Table structure for insurance_types
-- ----------------------------
DROP TABLE IF EXISTS `insurance_types`;
CREATE TABLE `insurance_types`  (
  `type_id` int(255) NOT NULL,
  `insuranceName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `upperLimit` float(255, 2) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `rate` float(255, 2) NULL DEFAULT NULL,
  `range` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of insurance_types
-- ----------------------------
INSERT INTO `insurance_types` VALUES (1, '医疗保险', 20000.00, '分为住院医疗险和门诊医疗险。它的主要作用在于解决医疗费用，是社保的重要补充', 2.00, NULL);
INSERT INTO `insurance_types` VALUES (2, '重疾保险', 400000.00, '重大疾病保险，提供如恶性肿瘤、急性心肌梗塞、脑中风后遗症等重大疾病的保障', 2.10, NULL);
INSERT INTO `insurance_types` VALUES (3, '寿险', 100000.00, '寿险保障简单，仅身故责任，杠杆率高，很少的保费可以撬动很大的保额，很少的钱就能获得很高的保障', 3.00, NULL);
INSERT INTO `insurance_types` VALUES (4, '意外险', 500000.00, '意外险杠杆高、提供伤残保障、没有等待期、没有健康告知门槛低。', 10.00, NULL);

-- ----------------------------
-- Table structure for lipei
-- ----------------------------
DROP TABLE IF EXISTS `lipei`;
CREATE TABLE `lipei`  (
  `lipei_id` int(255) NOT NULL,
  `lipei_number` int(255) NULL DEFAULT NULL,
  `lipei_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `lipei_money` float(255, 2) NULL DEFAULT NULL,
  `claims_id` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`lipei_id`) USING BTREE,
  INDEX `claims_id`(`claims_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lipei
-- ----------------------------
INSERT INTO `lipei` VALUES (1, 2023040401, '20230404', 15000.00, 1);
INSERT INTO `lipei` VALUES (2, 2023040402, '20230404', 5000.00, 2);
INSERT INTO `lipei` VALUES (3, 2023060601, '20230606', 30000.00, 3);

-- ----------------------------
-- Table structure for root
-- ----------------------------
DROP TABLE IF EXISTS `root`;
CREATE TABLE `root`  (
  `root_id` int(255) NOT NULL,
  `root_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `role` int(1) NULL DEFAULT NULL,
  `root_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`root_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of root
-- ----------------------------
INSERT INTO `root` VALUES (1, '余博奇', 'admin', '123', 0, '18773611140');
INSERT INTO `root` VALUES (2, '张思维', 'zsw111', '123', 1, '18374938190');

SET FOREIGN_KEY_CHECKS = 1;
