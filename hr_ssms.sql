/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : hr_ssms

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 17/06/2022 23:08:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for hr_admin
-- ----------------------------
DROP TABLE IF EXISTS `hr_admin`;
CREATE TABLE `hr_admin`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `shop_id` bigint NULL DEFAULT NULL,
  `role_id` bigint NULL DEFAULT NULL,
  `deleted` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shop_id`(`shop_id` ASC) USING BTREE,
  INDEX `role`(`role_id` ASC) USING BTREE,
  CONSTRAINT `role` FOREIGN KEY (`role_id`) REFERENCES `hr_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `shop_id` FOREIGN KEY (`shop_id`) REFERENCES `hr_shop` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hr_admin
-- ----------------------------
INSERT INTO `hr_admin` VALUES (1, 'admin', '$2a$10$jWaPTQcGz94jo/4ejPAWUeGzCvxTRx.2Q.6jLqc2Iiz9G4GZRLrdO', 1, 1, 0);
INSERT INTO `hr_admin` VALUES (2, '新超市', '$2a$10$jWaPTQcGz94jo/4ejPAWUeGzCvxTRx.2Q.6jLqc2Iiz9G4GZRLrdO', 2, 2, 0);
INSERT INTO `hr_admin` VALUES (3, 'shop_3_admin', '$2a$10$jWaPTQcGz94jo/4ejPAWUeGzCvxTRx.2Q.6jLqc2Iiz9G4GZRLrdO', 3, 2, 0);
INSERT INTO `hr_admin` VALUES (4, 'shop_4_admin', '$2a$10$jWaPTQcGz94jo/4ejPAWUeGzCvxTRx.2Q.6jLqc2Iiz9G4GZRLrdO', 4, 2, 0);
INSERT INTO `hr_admin` VALUES (5, 'shop_5_admin', '$2a$10$jWaPTQcGz94jo/4ejPAWUeGzCvxTRx.2Q.6jLqc2Iiz9G4GZRLrdO', 5, 2, 0);
INSERT INTO `hr_admin` VALUES (8, '超市人', '$2a$10$jWaPTQcGz94jo/4ejPAWUeGzCvxTRx.2Q.6jLqc2Iiz9G4GZRLrdO', 2, 2, 1);

-- ----------------------------
-- Table structure for hr_brand
-- ----------------------------
DROP TABLE IF EXISTS `hr_brand`;
CREATE TABLE `hr_brand`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `deleted` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hr_brand
-- ----------------------------
INSERT INTO `hr_brand` VALUES (1, '可口可乐', 0);
INSERT INTO `hr_brand` VALUES (2, '百事', 0);
INSERT INTO `hr_brand` VALUES (3, '立白', 0);
INSERT INTO `hr_brand` VALUES (4, '百草味', 0);
INSERT INTO `hr_brand` VALUES (5, '舒肤佳', 0);
INSERT INTO `hr_brand` VALUES (6, '德亚', 0);
INSERT INTO `hr_brand` VALUES (7, '蒙牛', 0);
INSERT INTO `hr_brand` VALUES (8, '炫迈', 0);
INSERT INTO `hr_brand` VALUES (9, '清风', 0);
INSERT INTO `hr_brand` VALUES (10, '伊利', 0);
INSERT INTO `hr_brand` VALUES (11, '得力', 0);
INSERT INTO `hr_brand` VALUES (12, '蓝月亮', 0);
INSERT INTO `hr_brand` VALUES (13, '绿箭', 0);
INSERT INTO `hr_brand` VALUES (14, '良品铺子', 0);
INSERT INTO `hr_brand` VALUES (15, '康师傅', 0);
INSERT INTO `hr_brand` VALUES (16, '统一', 0);

-- ----------------------------
-- Table structure for hr_log
-- ----------------------------
DROP TABLE IF EXISTS `hr_log`;
CREATE TABLE `hr_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `operation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `operator` bigint NULL DEFAULT NULL,
  `operation_time` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 152 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hr_log
-- ----------------------------
INSERT INTO `hr_log` VALUES (1, '管理员.获取管理员列表request method:{}com.huangrui.hr_smms.controller.AdminController.getAllAdmin()params:{}{\"currentPage\":1,\"pageSize\":10}ip:{}127.0.0.1', 1, 1655355445105);
INSERT INTO `hr_log` VALUES (2, '管理员.获取管理员列表request method:{}com.huangrui.hr_smms.controller.AdminController.getAllAdmin()params:{}{\"currentPage\":1,\"pageSize\":10}ip:{}127.0.0.1', 1, 1655355587941);
INSERT INTO `hr_log` VALUES (3, '管理员.获取管理员列表request method:{}com.huangrui.hr_smms.controller.AdminController.getAllAdmin()params:{}{\"currentPage\":1,\"pageSize\":10}ip:{}127.0.0.1', 1, 1655355590585);
INSERT INTO `hr_log` VALUES (4, '管理员.获取管理员列表request method:{}com.huangrui.hr_smms.controller.AdminController.getAllAdmin()params:{}{\"currentPage\":1,\"pageSize\":10}ip:{}127.0.0.1', 1, 1655355628293);
INSERT INTO `hr_log` VALUES (5, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":10}', 1, 1655355961181);
INSERT INTO `hr_log` VALUES (6, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":10}', 1, 1655357839469);
INSERT INTO `hr_log` VALUES (7, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":10}', 1, 1655358057729);
INSERT INTO `hr_log` VALUES (8, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":10}', 1, 1655359246556);
INSERT INTO `hr_log` VALUES (9, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":10}', 1, 1655359332368);
INSERT INTO `hr_log` VALUES (10, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":10}', 1, 1655366500052);
INSERT INTO `hr_log` VALUES (11, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":10}', 1, 1655366613229);
INSERT INTO `hr_log` VALUES (12, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":10}', 1, 1655366672222);
INSERT INTO `hr_log` VALUES (13, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":2}', 1, 1655367864476);
INSERT INTO `hr_log` VALUES (14, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":2}', 1, 1655367914047);
INSERT INTO `hr_log` VALUES (15, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":2}', 1, 1655368173994);
INSERT INTO `hr_log` VALUES (16, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":2}', 1, 1655368363632);
INSERT INTO `hr_log` VALUES (17, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":2}', 1, 1655368394113);
INSERT INTO `hr_log` VALUES (18, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":2}', 1, 1655368421234);
INSERT INTO `hr_log` VALUES (19, '管理员.获取管理员列表.{\"currentPage\":2,\"pageSize\":2}', 1, 1655368426503);
INSERT INTO `hr_log` VALUES (20, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":2}', 1, 1655368436682);
INSERT INTO `hr_log` VALUES (21, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":2}', 1, 1655368826413);
INSERT INTO `hr_log` VALUES (22, '管理员.获取管理员列表.{\"currentPage\":2,\"pageSize\":2}', 1, 1655368828221);
INSERT INTO `hr_log` VALUES (23, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":2}', 1, 1655368829760);
INSERT INTO `hr_log` VALUES (24, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655368899233);
INSERT INTO `hr_log` VALUES (25, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655369270286);
INSERT INTO `hr_log` VALUES (26, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655369270286);
INSERT INTO `hr_log` VALUES (27, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655369275451);
INSERT INTO `hr_log` VALUES (28, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655369377852);
INSERT INTO `hr_log` VALUES (29, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655369377947);
INSERT INTO `hr_log` VALUES (30, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655369413607);
INSERT INTO `hr_log` VALUES (31, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655369415795);
INSERT INTO `hr_log` VALUES (32, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655369419235);
INSERT INTO `hr_log` VALUES (33, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655369423370);
INSERT INTO `hr_log` VALUES (34, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655369611779);
INSERT INTO `hr_log` VALUES (35, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655369613357);
INSERT INTO `hr_log` VALUES (36, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655369647465);
INSERT INTO `hr_log` VALUES (37, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655369647465);
INSERT INTO `hr_log` VALUES (38, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655369650568);
INSERT INTO `hr_log` VALUES (39, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655369652989);
INSERT INTO `hr_log` VALUES (40, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655369653943);
INSERT INTO `hr_log` VALUES (41, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655369656085);
INSERT INTO `hr_log` VALUES (42, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655369658434);
INSERT INTO `hr_log` VALUES (43, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655369738690);
INSERT INTO `hr_log` VALUES (44, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655369738690);
INSERT INTO `hr_log` VALUES (45, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655369740289);
INSERT INTO `hr_log` VALUES (46, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655369742487);
INSERT INTO `hr_log` VALUES (47, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655369817753);
INSERT INTO `hr_log` VALUES (48, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655369822239);
INSERT INTO `hr_log` VALUES (49, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655369868481);
INSERT INTO `hr_log` VALUES (50, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655369868481);
INSERT INTO `hr_log` VALUES (51, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655369998647);
INSERT INTO `hr_log` VALUES (52, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655369998647);
INSERT INTO `hr_log` VALUES (53, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655370041253);
INSERT INTO `hr_log` VALUES (54, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655370041598);
INSERT INTO `hr_log` VALUES (55, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655370042663);
INSERT INTO `hr_log` VALUES (56, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655370425140);
INSERT INTO `hr_log` VALUES (57, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655370426292);
INSERT INTO `hr_log` VALUES (58, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655385660878);
INSERT INTO `hr_log` VALUES (59, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655385812840);
INSERT INTO `hr_log` VALUES (60, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655385878051);
INSERT INTO `hr_log` VALUES (61, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655387540852);
INSERT INTO `hr_log` VALUES (62, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655387557333);
INSERT INTO `hr_log` VALUES (63, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655388014241);
INSERT INTO `hr_log` VALUES (64, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655393819212);
INSERT INTO `hr_log` VALUES (65, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655393829344);
INSERT INTO `hr_log` VALUES (66, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655393832008);
INSERT INTO `hr_log` VALUES (67, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655393886601);
INSERT INTO `hr_log` VALUES (68, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655394445916);
INSERT INTO `hr_log` VALUES (69, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655394987341);
INSERT INTO `hr_log` VALUES (70, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655395004696);
INSERT INTO `hr_log` VALUES (71, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655396342629);
INSERT INTO `hr_log` VALUES (72, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655429916670);
INSERT INTO `hr_log` VALUES (73, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655432293520);
INSERT INTO `hr_log` VALUES (74, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655432667541);
INSERT INTO `hr_log` VALUES (75, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655432799421);
INSERT INTO `hr_log` VALUES (76, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655432805254);
INSERT INTO `hr_log` VALUES (77, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655432863205);
INSERT INTO `hr_log` VALUES (78, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655432907896);
INSERT INTO `hr_log` VALUES (79, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655432910792);
INSERT INTO `hr_log` VALUES (80, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655433015688);
INSERT INTO `hr_log` VALUES (81, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655433048381);
INSERT INTO `hr_log` VALUES (82, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655433176236);
INSERT INTO `hr_log` VALUES (83, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655433207627);
INSERT INTO `hr_log` VALUES (84, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655433256766);
INSERT INTO `hr_log` VALUES (85, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655433350973);
INSERT INTO `hr_log` VALUES (86, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655434132528);
INSERT INTO `hr_log` VALUES (87, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655434153405);
INSERT INTO `hr_log` VALUES (88, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655434224147);
INSERT INTO `hr_log` VALUES (89, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655434312617);
INSERT INTO `hr_log` VALUES (90, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655434335224);
INSERT INTO `hr_log` VALUES (91, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655434350318);
INSERT INTO `hr_log` VALUES (92, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655434798307);
INSERT INTO `hr_log` VALUES (93, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655434860493);
INSERT INTO `hr_log` VALUES (94, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655434905127);
INSERT INTO `hr_log` VALUES (95, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655434996775);
INSERT INTO `hr_log` VALUES (96, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655435000683);
INSERT INTO `hr_log` VALUES (97, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655435057101);
INSERT INTO `hr_log` VALUES (98, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655435158891);
INSERT INTO `hr_log` VALUES (99, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655435204992);
INSERT INTO `hr_log` VALUES (100, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655435218688);
INSERT INTO `hr_log` VALUES (101, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655435360505);
INSERT INTO `hr_log` VALUES (102, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655435590113);
INSERT INTO `hr_log` VALUES (103, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655435653266);
INSERT INTO `hr_log` VALUES (104, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655435749915);
INSERT INTO `hr_log` VALUES (105, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655435871147);
INSERT INTO `hr_log` VALUES (106, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655435970646);
INSERT INTO `hr_log` VALUES (107, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655436186441);
INSERT INTO `hr_log` VALUES (108, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655436347569);
INSERT INTO `hr_log` VALUES (109, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655436440948);
INSERT INTO `hr_log` VALUES (110, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655436484705);
INSERT INTO `hr_log` VALUES (111, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655436546629);
INSERT INTO `hr_log` VALUES (112, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655436611601);
INSERT INTO `hr_log` VALUES (113, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655436657816);
INSERT INTO `hr_log` VALUES (114, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655436815527);
INSERT INTO `hr_log` VALUES (115, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655446544765);
INSERT INTO `hr_log` VALUES (116, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655447743993);
INSERT INTO `hr_log` VALUES (117, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655447786473);
INSERT INTO `hr_log` VALUES (118, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655448156244);
INSERT INTO `hr_log` VALUES (119, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655448397247);
INSERT INTO `hr_log` VALUES (120, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655448490353);
INSERT INTO `hr_log` VALUES (121, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655449371641);
INSERT INTO `hr_log` VALUES (122, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655449618739);
INSERT INTO `hr_log` VALUES (123, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655449903919);
INSERT INTO `hr_log` VALUES (124, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655450161095);
INSERT INTO `hr_log` VALUES (125, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655450403812);
INSERT INTO `hr_log` VALUES (126, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655450545751);
INSERT INTO `hr_log` VALUES (127, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655451790703);
INSERT INTO `hr_log` VALUES (128, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655451903685);
INSERT INTO `hr_log` VALUES (129, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655452054897);
INSERT INTO `hr_log` VALUES (130, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655452276122);
INSERT INTO `hr_log` VALUES (131, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655452322080);
INSERT INTO `hr_log` VALUES (132, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655452422368);
INSERT INTO `hr_log` VALUES (133, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655452570356);
INSERT INTO `hr_log` VALUES (134, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655455872252);
INSERT INTO `hr_log` VALUES (135, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655456038196);
INSERT INTO `hr_log` VALUES (136, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655456244295);
INSERT INTO `hr_log` VALUES (137, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655456289781);
INSERT INTO `hr_log` VALUES (138, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655456932136);
INSERT INTO `hr_log` VALUES (139, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655457211695);
INSERT INTO `hr_log` VALUES (140, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655460758137);
INSERT INTO `hr_log` VALUES (141, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655460874251);
INSERT INTO `hr_log` VALUES (142, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655461105653);
INSERT INTO `hr_log` VALUES (143, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655461220314);
INSERT INTO `hr_log` VALUES (144, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655461553755);
INSERT INTO `hr_log` VALUES (145, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655462292641);
INSERT INTO `hr_log` VALUES (146, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655462680904);
INSERT INTO `hr_log` VALUES (147, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655463162083);
INSERT INTO `hr_log` VALUES (148, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655463178281);
INSERT INTO `hr_log` VALUES (149, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655463260521);
INSERT INTO `hr_log` VALUES (150, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655463360313);
INSERT INTO `hr_log` VALUES (151, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655463393037);
INSERT INTO `hr_log` VALUES (152, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655464583758);
INSERT INTO `hr_log` VALUES (153, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655465655304);
INSERT INTO `hr_log` VALUES (154, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655465762182);
INSERT INTO `hr_log` VALUES (155, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655465776337);
INSERT INTO `hr_log` VALUES (156, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655465783346);
INSERT INTO `hr_log` VALUES (157, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655465811228);
INSERT INTO `hr_log` VALUES (158, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655465963248);
INSERT INTO `hr_log` VALUES (159, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655465977323);
INSERT INTO `hr_log` VALUES (160, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655466096876);
INSERT INTO `hr_log` VALUES (161, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655466156597);
INSERT INTO `hr_log` VALUES (162, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655466241345);
INSERT INTO `hr_log` VALUES (163, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655466336509);
INSERT INTO `hr_log` VALUES (164, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655466637213);
INSERT INTO `hr_log` VALUES (165, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655466671350);
INSERT INTO `hr_log` VALUES (166, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655475632016);
INSERT INTO `hr_log` VALUES (167, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655475879146);
INSERT INTO `hr_log` VALUES (168, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655476017480);
INSERT INTO `hr_log` VALUES (169, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655476335636);
INSERT INTO `hr_log` VALUES (170, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655476565766);
INSERT INTO `hr_log` VALUES (171, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655477177426);
INSERT INTO `hr_log` VALUES (172, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655477240181);
INSERT INTO `hr_log` VALUES (173, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655478023256);
INSERT INTO `hr_log` VALUES (174, '店铺.获取店铺列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655478025864);
INSERT INTO `hr_log` VALUES (175, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655478026870);
INSERT INTO `hr_log` VALUES (176, '仓库.获取销售排行.{\"currentPage\":1,\"pageSize\":10,\"valueMonth\":1655478028000}', 1, 1655478028678);
INSERT INTO `hr_log` VALUES (177, '仓库.获取地区排行.{\"currentPage\":1,\"pageSize\":10,\"valueMonth\":1655478031000}', 1, 1655478031894);
INSERT INTO `hr_log` VALUES (178, '产品.获取产品列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655478035879);
INSERT INTO `hr_log` VALUES (179, '产品.获取产品列表.{\"currentPage\":5,\"pageSize\":5}', 1, 1655478037886);
INSERT INTO `hr_log` VALUES (180, '仓库.获取仓库列表.{\"currentPage\":1,\"pageSize\":10,\"valueMonth\":1655478040000}', 1, 1655478040341);
INSERT INTO `hr_log` VALUES (181, '仓库.获取仓库列表.{\"currentPage\":2,\"pageSize\":10,\"valueMonth\":1655478040000}', 1, 1655478042605);
INSERT INTO `hr_log` VALUES (182, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655478108719);
INSERT INTO `hr_log` VALUES (183, '订单.获取已处理订单列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655478110978);
INSERT INTO `hr_log` VALUES (184, '订单.获取未处理订单列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655478112576);
INSERT INTO `hr_log` VALUES (185, '仓库.获取仓库列表.{\"currentPage\":1,\"pageSize\":10,\"valueMonth\":1655478115000}', 1, 1655478115620);
INSERT INTO `hr_log` VALUES (186, '管理员.获取管理员列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655478162778);
INSERT INTO `hr_log` VALUES (187, '订单.获取未处理订单列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655478165133);
INSERT INTO `hr_log` VALUES (188, '订单.获取已处理订单列表.{\"currentPage\":1,\"pageSize\":5}', 1, 1655478165948);
INSERT INTO `hr_log` VALUES (189, '仓库.获取仓库列表.{\"currentPage\":1,\"pageSize\":10,\"valueMonth\":1655478167000}', 1, 1655478167848);
INSERT INTO `hr_log` VALUES (190, '产品.获取产品列表.{\"currentPage\":1,\"pageSize\":5}', 2, 1655478183408);
INSERT INTO `hr_log` VALUES (191, '产品.获取产品列表.{\"currentPage\":2,\"pageSize\":5}', 2, 1655478190721);
INSERT INTO `hr_log` VALUES (192, '产品.获取产品列表.{\"currentPage\":3,\"pageSize\":5}', 2, 1655478191174);
INSERT INTO `hr_log` VALUES (193, '产品.获取产品列表.{\"currentPage\":5,\"pageSize\":5}', 2, 1655478191651);
INSERT INTO `hr_log` VALUES (194, '仓库.获取仓库列表.{\"currentPage\":1,\"pageSize\":10,\"valueMonth\":1655478194000}', 2, 1655478194273);
INSERT INTO `hr_log` VALUES (195, '订单.获取未处理订单列表.{\"currentPage\":1,\"pageSize\":5}', 2, 1655478198495);
INSERT INTO `hr_log` VALUES (196, '订单.获取已处理订单列表.{\"currentPage\":1,\"pageSize\":5}', 2, 1655478199261);

-- ----------------------------
-- Table structure for hr_order
-- ----------------------------
DROP TABLE IF EXISTS `hr_order`;
CREATE TABLE `hr_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `shop_id` bigint NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  `product_id` bigint NULL DEFAULT NULL,
  `create_date` bigint NULL DEFAULT NULL,
  `is_payed` int NULL DEFAULT 0,
  `is_handled` int NULL DEFAULT 0,
  `quantity` int NULL DEFAULT NULL,
  `deleted` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  INDEX `order_shop_id`(`shop_id` ASC) USING BTREE,
  CONSTRAINT `order_shop_id` FOREIGN KEY (`shop_id`) REFERENCES `hr_shop` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `hr_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `hr_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hr_order
-- ----------------------------
INSERT INTO `hr_order` VALUES (1, 1, 1, 11, 1655467938451, 1, 0, 2, 0);
INSERT INTO `hr_order` VALUES (2, 1, 1, 12, 1655467938790, 1, 0, 2, 0);
INSERT INTO `hr_order` VALUES (3, 1, 1, 5, 1655467938796, 1, 0, 5, 0);
INSERT INTO `hr_order` VALUES (4, 1, 1, 12, 1655467938804, 1, 0, 3, 0);
INSERT INTO `hr_order` VALUES (5, 1, 1, 6, 1655467938810, 1, 0, 5, 0);
INSERT INTO `hr_order` VALUES (6, 1, 2, 4, 1655467938816, 1, 0, 4, 0);
INSERT INTO `hr_order` VALUES (7, 1, 2, 10, 1655467938824, 1, 0, 3, 0);
INSERT INTO `hr_order` VALUES (8, 1, 2, 7, 1655467938829, 1, 0, 5, 0);
INSERT INTO `hr_order` VALUES (9, 1, 2, 5, 1655467938835, 1, 1, 1, 0);
INSERT INTO `hr_order` VALUES (10, 1, 2, 17, 1655467938841, 1, 0, 4, 1);
INSERT INTO `hr_order` VALUES (11, 2, 1, 6, 1655467938846, 1, 0, 1, 0);
INSERT INTO `hr_order` VALUES (12, 2, 1, 8, 1655467938853, 1, 0, 5, 0);
INSERT INTO `hr_order` VALUES (13, 2, 1, 5, 1655467938858, 1, 0, 2, 0);
INSERT INTO `hr_order` VALUES (14, 2, 1, 13, 1655467938865, 1, 0, 1, 0);
INSERT INTO `hr_order` VALUES (15, 2, 1, 19, 1655467938870, 1, 0, 1, 0);
INSERT INTO `hr_order` VALUES (16, 2, 1, 11, 1655467938875, 1, 0, 3, 0);
INSERT INTO `hr_order` VALUES (17, 2, 1, 10, 1655467938886, 1, 0, 3, 0);
INSERT INTO `hr_order` VALUES (18, 2, 2, 13, 1655467938889, 1, 0, 3, 0);
INSERT INTO `hr_order` VALUES (19, 2, 2, 4, 1655467938893, 1, 0, 3, 0);
INSERT INTO `hr_order` VALUES (20, 2, 2, 10, 1655467938902, 1, 0, 1, 0);
INSERT INTO `hr_order` VALUES (21, 2, 2, 5, 1655467938906, 1, 0, 1, 0);
INSERT INTO `hr_order` VALUES (22, 2, 2, 14, 1655467938909, 1, 0, 5, 0);
INSERT INTO `hr_order` VALUES (23, 2, 2, 16, 1655467938916, 1, 0, 1, 0);
INSERT INTO `hr_order` VALUES (24, 2, 2, 1, 1655467938921, 1, 0, 1, 0);
INSERT INTO `hr_order` VALUES (25, 3, 1, 11, 1655467938927, 1, 0, 4, 0);
INSERT INTO `hr_order` VALUES (26, 3, 1, 19, 1655467938931, 1, 0, 4, 0);
INSERT INTO `hr_order` VALUES (27, 3, 1, 18, 1655467938937, 1, 0, 5, 0);
INSERT INTO `hr_order` VALUES (28, 3, 1, 16, 1655467938941, 1, 0, 4, 0);
INSERT INTO `hr_order` VALUES (29, 3, 2, 21, 1655467938946, 1, 0, 4, 0);
INSERT INTO `hr_order` VALUES (30, 3, 2, 5, 1655467938952, 1, 0, 5, 0);
INSERT INTO `hr_order` VALUES (31, 3, 2, 11, 1655467938957, 1, 0, 4, 0);
INSERT INTO `hr_order` VALUES (32, 3, 2, 20, 1655467938963, 1, 0, 4, 0);
INSERT INTO `hr_order` VALUES (33, 4, 1, 20, 1655467938969, 1, 0, 5, 0);
INSERT INTO `hr_order` VALUES (34, 4, 1, 20, 1655467938973, 1, 0, 3, 0);
INSERT INTO `hr_order` VALUES (35, 4, 2, 10, 1655467938978, 1, 0, 3, 0);
INSERT INTO `hr_order` VALUES (36, 4, 2, 2, 1655467938983, 1, 0, 4, 0);
INSERT INTO `hr_order` VALUES (37, 5, 1, 9, 1655467938989, 1, 0, 5, 0);
INSERT INTO `hr_order` VALUES (38, 5, 1, 14, 1655467938993, 1, 0, 4, 0);
INSERT INTO `hr_order` VALUES (39, 5, 1, 7, 1655467938998, 1, 0, 4, 0);
INSERT INTO `hr_order` VALUES (40, 5, 2, 6, 1655467939004, 1, 0, 4, 0);
INSERT INTO `hr_order` VALUES (41, 5, 2, 10, 1655467939009, 1, 0, 5, 0);
INSERT INTO `hr_order` VALUES (42, 5, 2, 1, 1655467939012, 1, 0, 2, 0);
INSERT INTO `hr_order` VALUES (43, 6, 1, 3, 1655467939022, 1, 0, 4, 0);
INSERT INTO `hr_order` VALUES (44, 6, 1, 14, 1655467939026, 1, 0, 3, 0);
INSERT INTO `hr_order` VALUES (45, 6, 1, 5, 1655467939032, 1, 0, 3, 0);
INSERT INTO `hr_order` VALUES (46, 6, 1, 13, 1655467939036, 1, 0, 2, 0);
INSERT INTO `hr_order` VALUES (47, 6, 1, 20, 1655467939040, 1, 0, 2, 0);
INSERT INTO `hr_order` VALUES (48, 6, 2, 7, 1655467939043, 1, 0, 2, 0);
INSERT INTO `hr_order` VALUES (49, 6, 2, 19, 1655467939048, 1, 0, 5, 0);
INSERT INTO `hr_order` VALUES (50, 6, 2, 14, 1655467939055, 1, 0, 5, 0);
INSERT INTO `hr_order` VALUES (51, 6, 2, 13, 1655467939058, 1, 0, 4, 0);
INSERT INTO `hr_order` VALUES (52, 6, 2, 3, 1655467939063, 1, 0, 4, 0);

-- ----------------------------
-- Table structure for hr_packing_way
-- ----------------------------
DROP TABLE IF EXISTS `hr_packing_way`;
CREATE TABLE `hr_packing_way`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `packing_way` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `deleted` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hr_packing_way
-- ----------------------------
INSERT INTO `hr_packing_way` VALUES (1, '袋装', 0);
INSERT INTO `hr_packing_way` VALUES (2, '罐装', 0);
INSERT INTO `hr_packing_way` VALUES (3, '瓶装', 0);
INSERT INTO `hr_packing_way` VALUES (4, '真空包装', 0);
INSERT INTO `hr_packing_way` VALUES (5, '桶装', 0);
INSERT INTO `hr_packing_way` VALUES (6, '简易包装', 0);
INSERT INTO `hr_packing_way` VALUES (7, '箱装', 0);

-- ----------------------------
-- Table structure for hr_product
-- ----------------------------
DROP TABLE IF EXISTS `hr_product`;
CREATE TABLE `hr_product`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `packing_way_id` bigint NULL DEFAULT NULL,
  `size` int NULL DEFAULT NULL,
  `brand_id` bigint NULL DEFAULT NULL,
  `types_id` bigint NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `upc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `deleted` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `packing_way_id`(`packing_way_id` ASC) USING BTREE,
  INDEX `brand_id`(`brand_id` ASC) USING BTREE,
  INDEX `types_id`(`types_id` ASC) USING BTREE,
  CONSTRAINT `brand_id` FOREIGN KEY (`brand_id`) REFERENCES `hr_brand` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `packing_way_id` FOREIGN KEY (`packing_way_id`) REFERENCES `hr_packing_way` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `types_id` FOREIGN KEY (`types_id`) REFERENCES `hr_types` (`product_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hr_product
-- ----------------------------
INSERT INTO `hr_product` VALUES (1, '可口可乐', 2, 1, 1, 1, 3.00, '/img/upc/1.png', 0);
INSERT INTO `hr_product` VALUES (2, '百事可乐', 2, 1, 2, 2, 3.00, '/img/upc/2.png', 0);
INSERT INTO `hr_product` VALUES (3, '立白洗衣液', 1, 1, 3, 3, 30.00, '/img/upc/3.png', 0);
INSERT INTO `hr_product` VALUES (4, '百草味果干', 1, 1, 4, 4, 20.00, '/img/upc/4.png', 0);
INSERT INTO `hr_product` VALUES (5, '舒肤佳肥皂', 6, 1, 5, 5, 10.00, '/img/upc/5.png', 0);
INSERT INTO `hr_product` VALUES (6, '德亚牛奶', 7, 1, 6, 6, 60.00, '/img/upc/6.png', 0);
INSERT INTO `hr_product` VALUES (7, '蒙牛牛奶', 7, 1, 7, 7, 60.00, '/img/upc/7.png', 0);
INSERT INTO `hr_product` VALUES (8, '炫迈口香糖', 2, 1, 8, 8, 10.00, '/img/upc/8.png', 0);
INSERT INTO `hr_product` VALUES (9, '清风抽纸', 6, 1, 9, 9, 20.00, '/img/upc/9.png', 0);
INSERT INTO `hr_product` VALUES (10, '伊利牛奶', 7, 1, 10, 10, 60.00, '/img/upc/10.png', 0);
INSERT INTO `hr_product` VALUES (11, '得力订书机', 6, 1, 11, 11, 10.00, '/img/upc/11.png', 0);
INSERT INTO `hr_product` VALUES (12, '蓝月亮洗衣液', 5, 1, 12, 12, 30.00, '/img/upc/12.png', 0);
INSERT INTO `hr_product` VALUES (13, '绿箭口香糖', 2, 1, 13, 13, 10.00, '/img/upc/13.png', 0);
INSERT INTO `hr_product` VALUES (14, '良品铺装果干', 1, 1, 14, 14, 20.00, '/img/upc/14.png', 0);
INSERT INTO `hr_product` VALUES (15, '百草味猪肉脯', 1, 1, 4, 15, 20.00, '/img/upc/15.png', 0);
INSERT INTO `hr_product` VALUES (16, '康师傅红烧牛肉面', 1, 1, 15, 16, 3.00, '/img/upc/16.png', 0);
INSERT INTO `hr_product` VALUES (17, '康师傅老谭酸菜牛肉面', 1, 1, 15, 17, 3.00, '/img/upc/17.png', 0);
INSERT INTO `hr_product` VALUES (18, '康师傅藤椒牛肉面', 1, 1, 15, 18, 3.00, '/img/upc/18.png', 0);
INSERT INTO `hr_product` VALUES (19, '统一红烧牛肉面', 1, 1, 16, 19, 3.00, '/img/upc/19.png', 0);
INSERT INTO `hr_product` VALUES (20, '统一老谭酸菜牛肉面', 1, 1, 16, 20, 3.00, '/img/upc/20.png', 0);
INSERT INTO `hr_product` VALUES (21, '立白洗洁精', 3, 1, 3, 21, 3.00, '/img/upc/21.png', 0);
INSERT INTO `hr_product` VALUES (1537694550666100739, '雪碧', NULL, 1, 1, 1537694550666100739, 4.00, 'http://rdcbe3frv.hn-bkt.clouddn.com/1537694550666100739.png', 0);

-- ----------------------------
-- Table structure for hr_role
-- ----------------------------
DROP TABLE IF EXISTS `hr_role`;
CREATE TABLE `hr_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hr_role
-- ----------------------------
INSERT INTO `hr_role` VALUES (1, '\"superAdmin\"');
INSERT INTO `hr_role` VALUES (2, '\"admin\"');
INSERT INTO `hr_role` VALUES (3, '\"user\"');

-- ----------------------------
-- Table structure for hr_shop
-- ----------------------------
DROP TABLE IF EXISTS `hr_shop`;
CREATE TABLE `hr_shop`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `shop_address_province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `shop_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `bussiness_hours_start` bigint NULL DEFAULT NULL,
  `shop_supplier` bigint NULL DEFAULT NULL,
  `bussiness_hours_stop` bigint NULL DEFAULT NULL,
  `deleted` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shop_supplier`(`shop_supplier` ASC) USING BTREE,
  CONSTRAINT `shop_supplier` FOREIGN KEY (`shop_supplier`) REFERENCES `hr_supplier` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hr_shop
-- ----------------------------
INSERT INTO `hr_shop` VALUES (1, '南岸超一', '重庆', '南岸区崇文路', 8, 1, 22, 0);
INSERT INTO `hr_shop` VALUES (2, '江北超一', '重庆', '江北区x路', 9, 2, 23, 0);
INSERT INTO `hr_shop` VALUES (3, '朝阳超一', '北京', '朝阳区z路', 10, 3, 22, 0);
INSERT INTO `hr_shop` VALUES (4, '汉口超一', '湖北', '汉口k路', 8, 4, 22, 0);
INSERT INTO `hr_shop` VALUES (5, '西湖超一', '浙江', '西湖s路', 8, 5, 22, 0);
INSERT INTO `hr_shop` VALUES (6, '南岸', '重庆', '重庆市南岸区', 7, 2, 22, 1);

-- ----------------------------
-- Table structure for hr_supplier
-- ----------------------------
DROP TABLE IF EXISTS `hr_supplier`;
CREATE TABLE `hr_supplier`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` bigint NULL DEFAULT NULL,
  `deleted` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hr_supplier
-- ----------------------------
INSERT INTO `hr_supplier` VALUES (1, '重庆南岸批发市场', '重庆市南岸区', '122345@zjs.com', 124657, 0);
INSERT INTO `hr_supplier` VALUES (2, '重庆市江北批发市场', '重庆市江北区', '1259843@sh.com', 7854321, 0);
INSERT INTO `hr_supplier` VALUES (3, '河北省石家庄批发市场', '河北省石家庄', '4757987@aad.com', 5784542, 0);
INSERT INTO `hr_supplier` VALUES (4, '湖北省武汉市汉口批发市场', '湖北省汉口', '7545sa@az.com', 4655968, 0);
INSERT INTO `hr_supplier` VALUES (5, '浙江省杭州批发市场', '浙江省杭州市', '757saaa@ks.com', 7874485, 0);

-- ----------------------------
-- Table structure for hr_type
-- ----------------------------
DROP TABLE IF EXISTS `hr_type`;
CREATE TABLE `hr_type`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `deleted` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hr_type
-- ----------------------------
INSERT INTO `hr_type` VALUES (1, '乳饮酒水', 0);
INSERT INTO `hr_type` VALUES (2, '零食速食', 0);
INSERT INTO `hr_type` VALUES (3, '生活用品', 0);
INSERT INTO `hr_type` VALUES (4, '方便食品', 0);
INSERT INTO `hr_type` VALUES (5, '办公用品', 0);
INSERT INTO `hr_type` VALUES (6, '健康食品', 0);

-- ----------------------------
-- Table structure for hr_types
-- ----------------------------
DROP TABLE IF EXISTS `hr_types`;
CREATE TABLE `hr_types`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_type_id` bigint NULL DEFAULT NULL,
  `type_id` bigint NULL DEFAULT NULL,
  `deleted` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_type_id`(`product_type_id` ASC) USING BTREE,
  INDEX `type_id`(`type_id` ASC) USING BTREE,
  CONSTRAINT `type_id` FOREIGN KEY (`type_id`) REFERENCES `hr_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hr_types
-- ----------------------------
INSERT INTO `hr_types` VALUES (1, 1, 1, 0);
INSERT INTO `hr_types` VALUES (2, 2, 1, 0);
INSERT INTO `hr_types` VALUES (3, 3, 3, 0);
INSERT INTO `hr_types` VALUES (4, 4, 2, 0);
INSERT INTO `hr_types` VALUES (5, 4, 6, 0);
INSERT INTO `hr_types` VALUES (6, 5, 3, 0);
INSERT INTO `hr_types` VALUES (7, 6, 1, 0);
INSERT INTO `hr_types` VALUES (8, 7, 1, 0);
INSERT INTO `hr_types` VALUES (9, 8, 2, 0);
INSERT INTO `hr_types` VALUES (10, 9, 3, 0);
INSERT INTO `hr_types` VALUES (11, 10, 1, 0);
INSERT INTO `hr_types` VALUES (12, 11, 5, 0);
INSERT INTO `hr_types` VALUES (13, 12, 3, 0);
INSERT INTO `hr_types` VALUES (14, 13, 2, 0);
INSERT INTO `hr_types` VALUES (15, 14, 2, 0);
INSERT INTO `hr_types` VALUES (16, 14, 6, 0);
INSERT INTO `hr_types` VALUES (17, 15, 2, 0);
INSERT INTO `hr_types` VALUES (18, 15, 6, 0);
INSERT INTO `hr_types` VALUES (19, 16, 4, 0);
INSERT INTO `hr_types` VALUES (20, 17, 4, 0);
INSERT INTO `hr_types` VALUES (21, 18, 4, 0);
INSERT INTO `hr_types` VALUES (22, 19, 4, 0);
INSERT INTO `hr_types` VALUES (23, 20, 4, 0);
INSERT INTO `hr_types` VALUES (24, 21, 3, 0);
INSERT INTO `hr_types` VALUES (31, 1537694550666100739, 1, 1);
INSERT INTO `hr_types` VALUES (32, 1537694550666100739, 3, 1);
INSERT INTO `hr_types` VALUES (33, 1537694550666100739, 1, 0);

-- ----------------------------
-- Table structure for hr_user
-- ----------------------------
DROP TABLE IF EXISTS `hr_user`;
CREATE TABLE `hr_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gender` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `role` bigint NULL DEFAULT NULL,
  `deleted` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_role_id`(`role` ASC) USING BTREE,
  CONSTRAINT `user_role_id` FOREIGN KEY (`role`) REFERENCES `hr_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hr_user
-- ----------------------------
INSERT INTO `hr_user` VALUES (1, '廖杰', '南岸区崇文路', '123456789@qq.com', '1314520789', '$2a$10$jWaPTQcGz94jo/4ejPAWUeGzCvxTRx.2Q.6jLqc2Iiz9G4GZRLrdO', '廖杰', '男', 3, 0);
INSERT INTO `hr_user` VALUES (2, 'abc', '南岸区崇文路', '245687844', '135468745', '$2a$10$jWaPTQcGz94jo/4ejPAWUeGzCvxTRx.2Q.6jLqc2Iiz9G4GZRLrdO', 'abc', '男', 3, 0);

-- ----------------------------
-- Table structure for hr_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `hr_warehouse`;
CREATE TABLE `hr_warehouse`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `shop_id` bigint NULL DEFAULT NULL,
  `product_id` bigint NULL DEFAULT NULL,
  `statistical_time` bigint NULL DEFAULT NULL,
  `inventory` int NULL DEFAULT NULL,
  `sales` bigint NULL DEFAULT NULL,
  `deleted` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `products_id`(`product_id` ASC) USING BTREE,
  INDEX `shop_id`(`shop_id` ASC) USING BTREE,
  CONSTRAINT `products_id` FOREIGN KEY (`product_id`) REFERENCES `hr_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `warehouse_shop_id` FOREIGN KEY (`shop_id`) REFERENCES `hr_shop` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 302 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hr_warehouse
-- ----------------------------
INSERT INTO `hr_warehouse` VALUES (21, 1, 1, 1655294400000, 144, 66, 0);
INSERT INTO `hr_warehouse` VALUES (22, 1, 2, 1655294400000, 196, 66, 0);
INSERT INTO `hr_warehouse` VALUES (23, 1, 5, 1655294400000, 154, 76, 0);
INSERT INTO `hr_warehouse` VALUES (24, 1, 6, 1655294400000, 137, 89, 0);
INSERT INTO `hr_warehouse` VALUES (25, 1, 7, 1655294400000, 148, 79, 0);
INSERT INTO `hr_warehouse` VALUES (26, 1, 8, 1655294400000, 136, 96, 0);
INSERT INTO `hr_warehouse` VALUES (27, 1, 9, 1655294400000, 120, 66, 0);
INSERT INTO `hr_warehouse` VALUES (28, 1, 10, 1655294400000, 155, 50, 0);
INSERT INTO `hr_warehouse` VALUES (29, 1, 11, 1655294400000, 102, 66, 0);
INSERT INTO `hr_warehouse` VALUES (30, 1, 12, 1655294400000, 115, 67, 0);
INSERT INTO `hr_warehouse` VALUES (31, 1, 13, 1655294400000, 149, 63, 0);
INSERT INTO `hr_warehouse` VALUES (32, 1, 14, 1655294400000, 163, 82, 0);
INSERT INTO `hr_warehouse` VALUES (33, 1, 15, 1655294400000, 126, 52, 0);
INSERT INTO `hr_warehouse` VALUES (34, 1, 16, 1655294400000, 150, 84, 0);
INSERT INTO `hr_warehouse` VALUES (35, 1, 17, 1655294400000, 195, 52, 0);
INSERT INTO `hr_warehouse` VALUES (36, 1, 18, 1655294400000, 171, 78, 0);
INSERT INTO `hr_warehouse` VALUES (37, 1, 19, 1655294400000, 114, 63, 0);
INSERT INTO `hr_warehouse` VALUES (38, 1, 20, 1655294400000, 168, 95, 0);
INSERT INTO `hr_warehouse` VALUES (39, 1, 21, 1655294400000, 167, 90, 0);
INSERT INTO `hr_warehouse` VALUES (40, 2, 1, 1655294400000, 126, 74, 0);
INSERT INTO `hr_warehouse` VALUES (41, 2, 2, 1655294400000, 141, 63, 0);
INSERT INTO `hr_warehouse` VALUES (42, 2, 3, 1655294400000, 127, 91, 0);
INSERT INTO `hr_warehouse` VALUES (43, 2, 4, 1655294400000, 109, 89, 0);
INSERT INTO `hr_warehouse` VALUES (44, 2, 5, 1655294400000, 110, 62, 0);
INSERT INTO `hr_warehouse` VALUES (45, 2, 6, 1655294400000, 119, 72, 0);
INSERT INTO `hr_warehouse` VALUES (46, 2, 7, 1655294400000, 139, 51, 0);
INSERT INTO `hr_warehouse` VALUES (47, 2, 8, 1655294400000, 140, 71, 0);
INSERT INTO `hr_warehouse` VALUES (48, 2, 9, 1655294400000, 126, 60, 0);
INSERT INTO `hr_warehouse` VALUES (49, 2, 11, 1655294400000, 146, 78, 0);
INSERT INTO `hr_warehouse` VALUES (50, 2, 12, 1655294400000, 130, 61, 0);
INSERT INTO `hr_warehouse` VALUES (51, 2, 13, 1655294400000, 109, 70, 0);
INSERT INTO `hr_warehouse` VALUES (52, 2, 14, 1655294400000, 107, 76, 0);
INSERT INTO `hr_warehouse` VALUES (53, 2, 15, 1655294400000, 100, 84, 0);
INSERT INTO `hr_warehouse` VALUES (54, 2, 16, 1655294400000, 149, 61, 0);
INSERT INTO `hr_warehouse` VALUES (55, 2, 18, 1655294400000, 177, 59, 0);
INSERT INTO `hr_warehouse` VALUES (56, 2, 19, 1655294400000, 113, 97, 0);
INSERT INTO `hr_warehouse` VALUES (57, 2, 20, 1655294400000, 154, 79, 0);
INSERT INTO `hr_warehouse` VALUES (58, 2, 21, 1655294400000, 190, 60, 0);
INSERT INTO `hr_warehouse` VALUES (59, 3, 1, 1655294400000, 149, 83, 0);
INSERT INTO `hr_warehouse` VALUES (60, 3, 2, 1655294400000, 126, 86, 0);
INSERT INTO `hr_warehouse` VALUES (61, 3, 3, 1655294400000, 100, 84, 0);
INSERT INTO `hr_warehouse` VALUES (62, 3, 4, 1655294400000, 196, 52, 0);
INSERT INTO `hr_warehouse` VALUES (63, 3, 5, 1655294400000, 198, 97, 0);
INSERT INTO `hr_warehouse` VALUES (64, 3, 6, 1655294400000, 121, 89, 0);
INSERT INTO `hr_warehouse` VALUES (65, 3, 7, 1655294400000, 171, 56, 0);
INSERT INTO `hr_warehouse` VALUES (66, 3, 8, 1655294400000, 101, 90, 0);
INSERT INTO `hr_warehouse` VALUES (67, 3, 9, 1655294400000, 124, 61, 0);
INSERT INTO `hr_warehouse` VALUES (68, 3, 10, 1655294400000, 108, 57, 0);
INSERT INTO `hr_warehouse` VALUES (69, 3, 11, 1655294400000, 190, 79, 0);
INSERT INTO `hr_warehouse` VALUES (70, 3, 13, 1655294400000, 179, 78, 0);
INSERT INTO `hr_warehouse` VALUES (71, 3, 14, 1655294400000, 148, 86, 0);
INSERT INTO `hr_warehouse` VALUES (72, 3, 15, 1655294400000, 178, 98, 0);
INSERT INTO `hr_warehouse` VALUES (73, 3, 17, 1655294400000, 161, 52, 0);
INSERT INTO `hr_warehouse` VALUES (74, 3, 18, 1655294400000, 127, 98, 0);
INSERT INTO `hr_warehouse` VALUES (75, 3, 19, 1655294400000, 199, 54, 0);
INSERT INTO `hr_warehouse` VALUES (76, 3, 20, 1655294400000, 142, 76, 0);
INSERT INTO `hr_warehouse` VALUES (77, 3, 21, 1655294400000, 146, 58, 0);
INSERT INTO `hr_warehouse` VALUES (78, 4, 2, 1655294400000, 167, 73, 0);
INSERT INTO `hr_warehouse` VALUES (79, 4, 3, 1655294400000, 196, 92, 0);
INSERT INTO `hr_warehouse` VALUES (80, 4, 4, 1655294400000, 131, 66, 0);
INSERT INTO `hr_warehouse` VALUES (81, 4, 5, 1655294400000, 111, 63, 0);
INSERT INTO `hr_warehouse` VALUES (82, 4, 6, 1655294400000, 182, 80, 0);
INSERT INTO `hr_warehouse` VALUES (83, 4, 7, 1655294400000, 198, 58, 0);
INSERT INTO `hr_warehouse` VALUES (84, 4, 8, 1655294400000, 104, 81, 0);
INSERT INTO `hr_warehouse` VALUES (85, 4, 9, 1655294400000, 112, 76, 0);
INSERT INTO `hr_warehouse` VALUES (86, 4, 11, 1655294400000, 169, 97, 0);
INSERT INTO `hr_warehouse` VALUES (87, 4, 12, 1655294400000, 152, 62, 0);
INSERT INTO `hr_warehouse` VALUES (88, 4, 13, 1655294400000, 180, 91, 0);
INSERT INTO `hr_warehouse` VALUES (89, 4, 14, 1655294400000, 192, 93, 0);
INSERT INTO `hr_warehouse` VALUES (90, 4, 15, 1655294400000, 112, 55, 0);
INSERT INTO `hr_warehouse` VALUES (91, 4, 16, 1655294400000, 145, 81, 0);
INSERT INTO `hr_warehouse` VALUES (92, 4, 17, 1655294400000, 120, 50, 0);
INSERT INTO `hr_warehouse` VALUES (93, 4, 18, 1655294400000, 104, 56, 0);
INSERT INTO `hr_warehouse` VALUES (94, 4, 19, 1655294400000, 106, 69, 0);
INSERT INTO `hr_warehouse` VALUES (95, 4, 20, 1655294400000, 183, 78, 0);
INSERT INTO `hr_warehouse` VALUES (96, 4, 21, 1655294400000, 138, 88, 0);
INSERT INTO `hr_warehouse` VALUES (97, 5, 1, 1655294400000, 183, 59, 0);
INSERT INTO `hr_warehouse` VALUES (98, 5, 2, 1655294400000, 104, 78, 0);
INSERT INTO `hr_warehouse` VALUES (99, 5, 3, 1655294400000, 143, 62, 0);
INSERT INTO `hr_warehouse` VALUES (100, 5, 4, 1655294400000, 150, 97, 0);
INSERT INTO `hr_warehouse` VALUES (101, 5, 6, 1655294400000, 147, 53, 0);
INSERT INTO `hr_warehouse` VALUES (102, 5, 7, 1655294400000, 167, 59, 0);
INSERT INTO `hr_warehouse` VALUES (103, 5, 8, 1655294400000, 137, 96, 0);
INSERT INTO `hr_warehouse` VALUES (104, 5, 9, 1655294400000, 128, 92, 0);
INSERT INTO `hr_warehouse` VALUES (105, 5, 10, 1655294400000, 118, 50, 0);
INSERT INTO `hr_warehouse` VALUES (106, 5, 11, 1655294400000, 196, 81, 0);
INSERT INTO `hr_warehouse` VALUES (107, 5, 12, 1655294400000, 125, 79, 0);
INSERT INTO `hr_warehouse` VALUES (108, 5, 13, 1655294400000, 168, 82, 0);
INSERT INTO `hr_warehouse` VALUES (109, 5, 14, 1655294400000, 108, 83, 0);
INSERT INTO `hr_warehouse` VALUES (110, 5, 15, 1655294400000, 173, 53, 0);
INSERT INTO `hr_warehouse` VALUES (111, 5, 16, 1655294400000, 124, 53, 0);
INSERT INTO `hr_warehouse` VALUES (112, 5, 17, 1655294400000, 180, 91, 0);
INSERT INTO `hr_warehouse` VALUES (113, 5, 18, 1655294400000, 118, 78, 0);
INSERT INTO `hr_warehouse` VALUES (114, 5, 19, 1655294400000, 187, 77, 0);
INSERT INTO `hr_warehouse` VALUES (115, 5, 20, 1655294400000, 154, 67, 0);
INSERT INTO `hr_warehouse` VALUES (116, 1, 1, 1650024000000, 196, 83, 0);
INSERT INTO `hr_warehouse` VALUES (117, 1, 2, 1650024000000, 147, 69, 0);
INSERT INTO `hr_warehouse` VALUES (118, 1, 4, 1650024000000, 116, 71, 0);
INSERT INTO `hr_warehouse` VALUES (119, 1, 5, 1650024000000, 172, 55, 0);
INSERT INTO `hr_warehouse` VALUES (120, 1, 6, 1650024000000, 118, 91, 0);
INSERT INTO `hr_warehouse` VALUES (121, 1, 7, 1650024000000, 123, 67, 0);
INSERT INTO `hr_warehouse` VALUES (122, 1, 9, 1650024000000, 126, 55, 0);
INSERT INTO `hr_warehouse` VALUES (123, 1, 10, 1650024000000, 183, 96, 0);
INSERT INTO `hr_warehouse` VALUES (124, 1, 11, 1650024000000, 183, 99, 0);
INSERT INTO `hr_warehouse` VALUES (125, 1, 12, 1650024000000, 180, 84, 0);
INSERT INTO `hr_warehouse` VALUES (126, 1, 13, 1650024000000, 117, 56, 0);
INSERT INTO `hr_warehouse` VALUES (127, 1, 14, 1650024000000, 119, 76, 0);
INSERT INTO `hr_warehouse` VALUES (128, 1, 15, 1650024000000, 174, 81, 0);
INSERT INTO `hr_warehouse` VALUES (129, 1, 16, 1650024000000, 149, 80, 0);
INSERT INTO `hr_warehouse` VALUES (130, 1, 17, 1650024000000, 103, 70, 0);
INSERT INTO `hr_warehouse` VALUES (131, 1, 18, 1650024000000, 164, 66, 0);
INSERT INTO `hr_warehouse` VALUES (132, 1, 19, 1650024000000, 117, 82, 0);
INSERT INTO `hr_warehouse` VALUES (133, 1, 20, 1650024000000, 113, 74, 0);
INSERT INTO `hr_warehouse` VALUES (134, 1, 21, 1650024000000, 104, 85, 0);
INSERT INTO `hr_warehouse` VALUES (135, 2, 1, 1650024000000, 143, 93, 0);
INSERT INTO `hr_warehouse` VALUES (136, 2, 2, 1650024000000, 180, 55, 0);
INSERT INTO `hr_warehouse` VALUES (137, 2, 3, 1650024000000, 157, 59, 0);
INSERT INTO `hr_warehouse` VALUES (138, 2, 5, 1650024000000, 147, 96, 0);
INSERT INTO `hr_warehouse` VALUES (139, 2, 6, 1650024000000, 152, 82, 0);
INSERT INTO `hr_warehouse` VALUES (140, 2, 7, 1650024000000, 129, 98, 0);
INSERT INTO `hr_warehouse` VALUES (141, 2, 8, 1650024000000, 108, 89, 0);
INSERT INTO `hr_warehouse` VALUES (142, 2, 10, 1650024000000, 144, 54, 0);
INSERT INTO `hr_warehouse` VALUES (143, 2, 11, 1650024000000, 151, 95, 0);
INSERT INTO `hr_warehouse` VALUES (144, 2, 12, 1650024000000, 140, 73, 0);
INSERT INTO `hr_warehouse` VALUES (145, 2, 13, 1650024000000, 161, 55, 0);
INSERT INTO `hr_warehouse` VALUES (146, 2, 14, 1650024000000, 180, 54, 0);
INSERT INTO `hr_warehouse` VALUES (147, 2, 15, 1650024000000, 121, 73, 0);
INSERT INTO `hr_warehouse` VALUES (148, 2, 16, 1650024000000, 155, 98, 0);
INSERT INTO `hr_warehouse` VALUES (149, 2, 17, 1650024000000, 130, 77, 0);
INSERT INTO `hr_warehouse` VALUES (150, 2, 18, 1650024000000, 109, 89, 0);
INSERT INTO `hr_warehouse` VALUES (151, 2, 19, 1650024000000, 200, 65, 0);
INSERT INTO `hr_warehouse` VALUES (152, 2, 20, 1650024000000, 161, 55, 0);
INSERT INTO `hr_warehouse` VALUES (153, 2, 21, 1650024000000, 100, 83, 0);
INSERT INTO `hr_warehouse` VALUES (154, 3, 1, 1650024000000, 175, 53, 0);
INSERT INTO `hr_warehouse` VALUES (155, 3, 2, 1650024000000, 162, 55, 0);
INSERT INTO `hr_warehouse` VALUES (156, 3, 3, 1650024000000, 144, 57, 0);
INSERT INTO `hr_warehouse` VALUES (157, 3, 4, 1650024000000, 110, 78, 0);
INSERT INTO `hr_warehouse` VALUES (158, 3, 5, 1650024000000, 101, 94, 0);
INSERT INTO `hr_warehouse` VALUES (159, 3, 6, 1650024000000, 168, 78, 0);
INSERT INTO `hr_warehouse` VALUES (160, 3, 7, 1650024000000, 163, 75, 0);
INSERT INTO `hr_warehouse` VALUES (161, 3, 8, 1650024000000, 183, 52, 0);
INSERT INTO `hr_warehouse` VALUES (162, 3, 10, 1650024000000, 120, 70, 0);
INSERT INTO `hr_warehouse` VALUES (163, 3, 11, 1650024000000, 116, 74, 0);
INSERT INTO `hr_warehouse` VALUES (164, 3, 12, 1650024000000, 167, 77, 0);
INSERT INTO `hr_warehouse` VALUES (165, 3, 14, 1650024000000, 173, 79, 0);
INSERT INTO `hr_warehouse` VALUES (166, 3, 15, 1650024000000, 154, 77, 0);
INSERT INTO `hr_warehouse` VALUES (167, 3, 16, 1650024000000, 170, 97, 0);
INSERT INTO `hr_warehouse` VALUES (168, 3, 17, 1650024000000, 189, 81, 0);
INSERT INTO `hr_warehouse` VALUES (169, 3, 18, 1650024000000, 176, 64, 0);
INSERT INTO `hr_warehouse` VALUES (170, 3, 19, 1650024000000, 172, 67, 0);
INSERT INTO `hr_warehouse` VALUES (171, 3, 20, 1650024000000, 188, 84, 0);
INSERT INTO `hr_warehouse` VALUES (172, 3, 21, 1650024000000, 112, 83, 0);
INSERT INTO `hr_warehouse` VALUES (173, 4, 1, 1650024000000, 193, 87, 0);
INSERT INTO `hr_warehouse` VALUES (174, 4, 2, 1650024000000, 136, 94, 0);
INSERT INTO `hr_warehouse` VALUES (175, 4, 3, 1650024000000, 180, 96, 0);
INSERT INTO `hr_warehouse` VALUES (176, 4, 4, 1650024000000, 152, 83, 0);
INSERT INTO `hr_warehouse` VALUES (177, 4, 5, 1650024000000, 169, 50, 0);
INSERT INTO `hr_warehouse` VALUES (178, 4, 7, 1650024000000, 195, 59, 0);
INSERT INTO `hr_warehouse` VALUES (179, 4, 8, 1650024000000, 185, 58, 0);
INSERT INTO `hr_warehouse` VALUES (180, 4, 10, 1650024000000, 144, 58, 0);
INSERT INTO `hr_warehouse` VALUES (181, 4, 11, 1650024000000, 181, 68, 0);
INSERT INTO `hr_warehouse` VALUES (182, 4, 12, 1650024000000, 103, 80, 0);
INSERT INTO `hr_warehouse` VALUES (183, 4, 14, 1650024000000, 193, 81, 0);
INSERT INTO `hr_warehouse` VALUES (184, 4, 15, 1650024000000, 169, 94, 0);
INSERT INTO `hr_warehouse` VALUES (185, 4, 16, 1650024000000, 167, 96, 0);
INSERT INTO `hr_warehouse` VALUES (186, 4, 17, 1650024000000, 162, 58, 0);
INSERT INTO `hr_warehouse` VALUES (187, 4, 18, 1650024000000, 142, 62, 0);
INSERT INTO `hr_warehouse` VALUES (188, 4, 19, 1650024000000, 127, 50, 0);
INSERT INTO `hr_warehouse` VALUES (189, 4, 20, 1650024000000, 196, 64, 0);
INSERT INTO `hr_warehouse` VALUES (190, 4, 21, 1650024000000, 117, 55, 0);
INSERT INTO `hr_warehouse` VALUES (191, 5, 1, 1650024000000, 162, 77, 0);
INSERT INTO `hr_warehouse` VALUES (192, 5, 2, 1650024000000, 158, 86, 0);
INSERT INTO `hr_warehouse` VALUES (193, 5, 3, 1650024000000, 180, 79, 0);
INSERT INTO `hr_warehouse` VALUES (194, 5, 5, 1650024000000, 168, 80, 0);
INSERT INTO `hr_warehouse` VALUES (195, 5, 7, 1650024000000, 156, 57, 0);
INSERT INTO `hr_warehouse` VALUES (196, 5, 8, 1650024000000, 190, 59, 0);
INSERT INTO `hr_warehouse` VALUES (197, 5, 10, 1650024000000, 136, 59, 0);
INSERT INTO `hr_warehouse` VALUES (198, 5, 11, 1650024000000, 165, 65, 0);
INSERT INTO `hr_warehouse` VALUES (199, 5, 12, 1650024000000, 171, 60, 0);
INSERT INTO `hr_warehouse` VALUES (200, 5, 13, 1650024000000, 150, 66, 0);
INSERT INTO `hr_warehouse` VALUES (201, 5, 14, 1650024000000, 194, 94, 0);
INSERT INTO `hr_warehouse` VALUES (202, 5, 15, 1650024000000, 108, 79, 0);
INSERT INTO `hr_warehouse` VALUES (203, 5, 16, 1650024000000, 107, 80, 0);
INSERT INTO `hr_warehouse` VALUES (204, 5, 17, 1650024000000, 159, 97, 0);
INSERT INTO `hr_warehouse` VALUES (205, 5, 18, 1650024000000, 185, 97, 0);
INSERT INTO `hr_warehouse` VALUES (206, 5, 19, 1650024000000, 114, 54, 0);
INSERT INTO `hr_warehouse` VALUES (207, 5, 20, 1650024000000, 150, 59, 0);
INSERT INTO `hr_warehouse` VALUES (208, 5, 21, 1650024000000, 127, 78, 0);
INSERT INTO `hr_warehouse` VALUES (209, 1, 1, 1652616000000, 106, 73, 0);
INSERT INTO `hr_warehouse` VALUES (210, 1, 2, 1652616000000, 117, 61, 0);
INSERT INTO `hr_warehouse` VALUES (211, 1, 3, 1652616000000, 132, 98, 0);
INSERT INTO `hr_warehouse` VALUES (212, 1, 4, 1652616000000, 175, 60, 0);
INSERT INTO `hr_warehouse` VALUES (213, 1, 5, 1652616000000, 110, 80, 0);
INSERT INTO `hr_warehouse` VALUES (214, 1, 6, 1652616000000, 148, 78, 0);
INSERT INTO `hr_warehouse` VALUES (215, 1, 8, 1652616000000, 129, 84, 0);
INSERT INTO `hr_warehouse` VALUES (216, 1, 9, 1652616000000, 192, 80, 0);
INSERT INTO `hr_warehouse` VALUES (217, 1, 11, 1652616000000, 165, 96, 0);
INSERT INTO `hr_warehouse` VALUES (218, 1, 12, 1652616000000, 170, 82, 0);
INSERT INTO `hr_warehouse` VALUES (219, 1, 13, 1652616000000, 177, 59, 0);
INSERT INTO `hr_warehouse` VALUES (220, 1, 14, 1652616000000, 149, 84, 0);
INSERT INTO `hr_warehouse` VALUES (221, 1, 15, 1652616000000, 175, 59, 0);
INSERT INTO `hr_warehouse` VALUES (222, 1, 16, 1652616000000, 166, 78, 0);
INSERT INTO `hr_warehouse` VALUES (223, 1, 17, 1652616000000, 139, 87, 0);
INSERT INTO `hr_warehouse` VALUES (224, 1, 19, 1652616000000, 174, 83, 0);
INSERT INTO `hr_warehouse` VALUES (225, 1, 20, 1652616000000, 150, 87, 0);
INSERT INTO `hr_warehouse` VALUES (226, 1, 21, 1652616000000, 172, 65, 0);
INSERT INTO `hr_warehouse` VALUES (227, 2, 1, 1652616000000, 114, 74, 0);
INSERT INTO `hr_warehouse` VALUES (228, 2, 2, 1652616000000, 200, 56, 0);
INSERT INTO `hr_warehouse` VALUES (229, 2, 3, 1652616000000, 154, 71, 0);
INSERT INTO `hr_warehouse` VALUES (230, 2, 4, 1652616000000, 128, 86, 0);
INSERT INTO `hr_warehouse` VALUES (231, 2, 6, 1652616000000, 166, 64, 0);
INSERT INTO `hr_warehouse` VALUES (232, 2, 7, 1652616000000, 187, 61, 0);
INSERT INTO `hr_warehouse` VALUES (233, 2, 9, 1652616000000, 185, 93, 0);
INSERT INTO `hr_warehouse` VALUES (234, 2, 10, 1652616000000, 170, 55, 0);
INSERT INTO `hr_warehouse` VALUES (235, 2, 11, 1652616000000, 142, 84, 0);
INSERT INTO `hr_warehouse` VALUES (236, 2, 12, 1652616000000, 168, 54, 0);
INSERT INTO `hr_warehouse` VALUES (237, 2, 13, 1652616000000, 175, 98, 0);
INSERT INTO `hr_warehouse` VALUES (238, 2, 14, 1652616000000, 128, 76, 0);
INSERT INTO `hr_warehouse` VALUES (239, 2, 15, 1652616000000, 136, 84, 0);
INSERT INTO `hr_warehouse` VALUES (240, 2, 16, 1652616000000, 158, 81, 0);
INSERT INTO `hr_warehouse` VALUES (241, 2, 17, 1652616000000, 106, 78, 0);
INSERT INTO `hr_warehouse` VALUES (242, 2, 18, 1652616000000, 198, 83, 0);
INSERT INTO `hr_warehouse` VALUES (243, 2, 20, 1652616000000, 108, 86, 0);
INSERT INTO `hr_warehouse` VALUES (244, 2, 21, 1652616000000, 111, 60, 0);
INSERT INTO `hr_warehouse` VALUES (245, 3, 2, 1652616000000, 165, 92, 0);
INSERT INTO `hr_warehouse` VALUES (246, 3, 4, 1652616000000, 155, 57, 0);
INSERT INTO `hr_warehouse` VALUES (247, 3, 5, 1652616000000, 130, 99, 0);
INSERT INTO `hr_warehouse` VALUES (248, 3, 6, 1652616000000, 179, 65, 0);
INSERT INTO `hr_warehouse` VALUES (249, 3, 7, 1652616000000, 189, 95, 0);
INSERT INTO `hr_warehouse` VALUES (250, 3, 8, 1652616000000, 132, 96, 0);
INSERT INTO `hr_warehouse` VALUES (251, 3, 9, 1652616000000, 142, 57, 0);
INSERT INTO `hr_warehouse` VALUES (252, 3, 10, 1652616000000, 179, 64, 0);
INSERT INTO `hr_warehouse` VALUES (253, 3, 11, 1652616000000, 193, 52, 0);
INSERT INTO `hr_warehouse` VALUES (254, 3, 12, 1652616000000, 175, 64, 0);
INSERT INTO `hr_warehouse` VALUES (255, 3, 13, 1652616000000, 137, 80, 0);
INSERT INTO `hr_warehouse` VALUES (256, 3, 14, 1652616000000, 131, 95, 0);
INSERT INTO `hr_warehouse` VALUES (257, 3, 16, 1652616000000, 199, 98, 0);
INSERT INTO `hr_warehouse` VALUES (258, 3, 17, 1652616000000, 171, 51, 0);
INSERT INTO `hr_warehouse` VALUES (259, 3, 18, 1652616000000, 123, 95, 0);
INSERT INTO `hr_warehouse` VALUES (260, 3, 19, 1652616000000, 125, 66, 0);
INSERT INTO `hr_warehouse` VALUES (261, 3, 20, 1652616000000, 157, 80, 0);
INSERT INTO `hr_warehouse` VALUES (262, 3, 21, 1652616000000, 154, 87, 0);
INSERT INTO `hr_warehouse` VALUES (263, 4, 1, 1652616000000, 135, 68, 0);
INSERT INTO `hr_warehouse` VALUES (264, 4, 3, 1652616000000, 114, 84, 0);
INSERT INTO `hr_warehouse` VALUES (265, 4, 4, 1652616000000, 138, 55, 0);
INSERT INTO `hr_warehouse` VALUES (266, 4, 5, 1652616000000, 159, 90, 0);
INSERT INTO `hr_warehouse` VALUES (267, 4, 6, 1652616000000, 135, 65, 0);
INSERT INTO `hr_warehouse` VALUES (268, 4, 7, 1652616000000, 115, 67, 0);
INSERT INTO `hr_warehouse` VALUES (269, 4, 8, 1652616000000, 132, 62, 0);
INSERT INTO `hr_warehouse` VALUES (270, 4, 10, 1652616000000, 167, 74, 0);
INSERT INTO `hr_warehouse` VALUES (271, 4, 11, 1652616000000, 138, 66, 0);
INSERT INTO `hr_warehouse` VALUES (272, 4, 12, 1652616000000, 131, 67, 0);
INSERT INTO `hr_warehouse` VALUES (273, 4, 13, 1652616000000, 140, 75, 0);
INSERT INTO `hr_warehouse` VALUES (274, 4, 15, 1652616000000, 171, 93, 0);
INSERT INTO `hr_warehouse` VALUES (275, 4, 16, 1652616000000, 162, 69, 0);
INSERT INTO `hr_warehouse` VALUES (276, 4, 17, 1652616000000, 107, 64, 0);
INSERT INTO `hr_warehouse` VALUES (277, 4, 18, 1652616000000, 136, 55, 0);
INSERT INTO `hr_warehouse` VALUES (278, 4, 19, 1652616000000, 182, 71, 0);
INSERT INTO `hr_warehouse` VALUES (279, 4, 20, 1652616000000, 145, 63, 0);
INSERT INTO `hr_warehouse` VALUES (280, 4, 21, 1652616000000, 137, 63, 0);
INSERT INTO `hr_warehouse` VALUES (281, 5, 1, 1652616000000, 150, 90, 0);
INSERT INTO `hr_warehouse` VALUES (282, 5, 2, 1652616000000, 117, 69, 0);
INSERT INTO `hr_warehouse` VALUES (283, 5, 3, 1652616000000, 118, 59, 0);
INSERT INTO `hr_warehouse` VALUES (284, 5, 4, 1652616000000, 134, 77, 0);
INSERT INTO `hr_warehouse` VALUES (285, 5, 5, 1652616000000, 196, 94, 0);
INSERT INTO `hr_warehouse` VALUES (286, 5, 6, 1652616000000, 174, 63, 0);
INSERT INTO `hr_warehouse` VALUES (287, 5, 8, 1652616000000, 116, 65, 0);
INSERT INTO `hr_warehouse` VALUES (288, 5, 9, 1652616000000, 119, 64, 0);
INSERT INTO `hr_warehouse` VALUES (289, 5, 10, 1652616000000, 192, 67, 0);
INSERT INTO `hr_warehouse` VALUES (290, 5, 12, 1652616000000, 126, 99, 0);
INSERT INTO `hr_warehouse` VALUES (291, 5, 14, 1652616000000, 167, 70, 0);
INSERT INTO `hr_warehouse` VALUES (292, 5, 15, 1652616000000, 171, 55, 0);
INSERT INTO `hr_warehouse` VALUES (293, 5, 16, 1652616000000, 159, 84, 0);
INSERT INTO `hr_warehouse` VALUES (294, 5, 17, 1652616000000, 161, 53, 0);
INSERT INTO `hr_warehouse` VALUES (295, 5, 18, 1652616000000, 135, 74, 0);
INSERT INTO `hr_warehouse` VALUES (296, 5, 19, 1652616000000, 152, 82, 0);
INSERT INTO `hr_warehouse` VALUES (297, 5, 20, 1652616000000, 151, 70, 0);
INSERT INTO `hr_warehouse` VALUES (298, 5, 21, 1652616000000, 170, 85, 0);

SET FOREIGN_KEY_CHECKS = 1;
