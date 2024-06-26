/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80034
 Source Host           : localhost:3306
 Source Schema         : easychat

 Target Server Type    : MySQL
 Target Server Version : 80034
 File Encoding         : 65001

 Date: 26/06/2024 19:13:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_update
-- ----------------------------
DROP TABLE IF EXISTS `app_update`;
CREATE TABLE `app_update`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `version` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本号',
  `update_desc` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新描述',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '0:未发布 1:灰度发布 2:全网发布',
  `grayscale_uid` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '灰度uid',
  `file_type` tinyint(1) NULL DEFAULT NULL COMMENT '文件类型0:本地文件 1:外链',
  `outer_link` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外链地址',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_key`(`version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'app发布' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_update
-- ----------------------------

-- ----------------------------
-- Table structure for chat_message
-- ----------------------------
DROP TABLE IF EXISTS `chat_message`;
CREATE TABLE `chat_message`  (
  `message_id` bigint NOT NULL AUTO_INCREMENT COMMENT '消息自增ID',
  `session_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会话ID',
  `message_type` tinyint(1) NOT NULL COMMENT '消息类型',
  `message_content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息内容',
  `send_user_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送人ID',
  `send_user_nick_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送人昵称',
  `send_time` bigint NULL DEFAULT NULL COMMENT '发送时间',
  `contact_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接收联系人ID',
  `contact_type` tinyint(1) NULL DEFAULT NULL COMMENT '联系人类型 0:单聊 1:群聊',
  `file_size` bigint NULL DEFAULT NULL COMMENT '文件大小',
  `file_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `file_type` tinyint(1) NULL DEFAULT NULL COMMENT '文件类型',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态 0:正在发送 1:已发送',
  PRIMARY KEY (`message_id`) USING BTREE,
  INDEX `idx_session_id`(`session_id`) USING BTREE,
  INDEX `idx_send_user_id`(`send_user_id`) USING BTREE,
  INDEX `idx_receive_contact_id`(`contact_id`) USING BTREE,
  INDEX `idx_send_time`(`send_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1825 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '聊天消息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of chat_message
-- ----------------------------
INSERT INTO `chat_message` VALUES (1775, '394b04d7613ef2e0a51311f37b98ea38', 2, '欢迎使用EasyChat', 'Urobot', 'EasyChat', 1716370455152, 'U95480874449', 0, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1776, '323bb755fe82fce6987ec66596563366', 2, '欢迎使用EasyChat', 'Urobot', 'EasyChat', 1716370574647, 'U76247672849', 0, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1777, '99b6137c11a5b780c187cbb7d515f4f5', 2, '欢迎使用EasyChat', 'Urobot', 'EasyChat', 1716371168403, 'U02849765806', 0, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1778, '95c8488e2ff9f5dca6d67ba4a25930ed', 2, '欢迎使用EasyChat', 'Urobot', 'EasyChat', 1716379402709, 'U86771349716', 0, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1779, '264e8b51481dd68e54ff5a771809e873', 1, '我是undefined', 'U95480874449', 'test001', 1718781995287, 'U86771349716', 0, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1780, '757eb6d4f36a9d4de8f55aeac6e5d8df', 1, '我是test001', 'U95480874449', 'test001', 1718867706077, 'U76247672849', 0, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1781, 'eadc6aa02b53981eca821fdab38e9c43', 1, '我是test001', 'U95480874449', 'test001', 1718868843465, 'U02849765806', 0, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1782, 'eadc6aa02b53981eca821fdab38e9c43', 1, '我是test001', 'U95480874449', 'test001', 1718868844995, 'U02849765806', 0, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1783, 'eadc6aa02b53981eca821fdab38e9c43', 1, '我是test001', 'U95480874449', 'test001', 1718868847909, 'U02849765806', 0, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1784, 'eadc6aa02b53981eca821fdab38e9c43', 1, '我是test001', 'U95480874449', 'test001', 1718869181918, 'U02849765806', 0, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1785, '757eb6d4f36a9d4de8f55aeac6e5d8df', 1, '我是test001', 'U95480874449', 'test001', 1718869249017, 'U76247672849', 0, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1786, '264e8b51481dd68e54ff5a771809e873', 1, '我是test001', 'U95480874449', 'test001', 1718869533395, 'U86771349716', 0, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1787, '264e8b51481dd68e54ff5a771809e873', 1, '我是test001', 'U95480874449', 'test001', 1718869584099, 'U86771349716', 0, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1788, '757eb6d4f36a9d4de8f55aeac6e5d8df', 1, '我是test001', 'U95480874449', 'test001', 1718869589455, 'U76247672849', 0, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1789, 'eadc6aa02b53981eca821fdab38e9c43', 1, '我是test001', 'U95480874449', 'test001', 1718869596634, 'U02849765806', 0, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1790, 'eadc6aa02b53981eca821fdab38e9c43', 1, '我是test001', 'U95480874449', 'test001', 1718869645899, 'U02849765806', 0, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1791, '757eb6d4f36a9d4de8f55aeac6e5d8df', 1, '我是test001', 'U95480874449', 'test001', 1718869657233, 'U76247672849', 0, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1792, '264e8b51481dd68e54ff5a771809e873', 1, '我是test001', 'U95480874449', 'test001', 1718869693031, 'U86771349716', 0, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1793, '264e8b51481dd68e54ff5a771809e873', 1, '我是test001', 'U95480874449', 'test001', 1718869731778, 'U86771349716', 0, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1794, '757eb6d4f36a9d4de8f55aeac6e5d8df', 1, '我是test001', 'U95480874449', 'test001', 1718869743096, 'U76247672849', 0, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1795, 'eadc6aa02b53981eca821fdab38e9c43', 1, '我是test001', 'U95480874449', 'test001', 1718869873401, 'U02849765806', 0, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1796, 'eadc6aa02b53981eca821fdab38e9c43', 1, '我是test001', 'U95480874449', 'test001', 1718869898735, 'U02849765806', 0, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1797, 'eadc6aa02b53981eca821fdab38e9c43', 1, '我是test001', 'U95480874449', 'test001', 1718869926385, 'U02849765806', 0, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1798, '757eb6d4f36a9d4de8f55aeac6e5d8df', 1, '我是test001', 'U95480874449', 'test001', 1718869934344, 'U76247672849', 0, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1799, '1dce7674d0ae238778b5cd7018f9f2ad', 1, '我是test001', 'U95480874449', 'test001', 1718870097480, 'U93684588793', 0, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1800, '264e8b51481dd68e54ff5a771809e873', 1, '我是test001', 'U95480874449', 'test001', 1718870963367, 'U86771349716', 0, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1801, '757eb6d4f36a9d4de8f55aeac6e5d8df', 1, '我是test001', 'U95480874449', 'test001', 1718871013986, 'U76247672849', 0, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1802, 'eadc6aa02b53981eca821fdab38e9c43', 1, '我是test001', 'U95480874449', 'test001', 1718871365168, 'U02849765806', 0, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1803, '757eb6d4f36a9d4de8f55aeac6e5d8df', 1, '我是test001', 'U95480874449', 'test001', 1718871370589, 'U76247672849', 0, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1804, '264e8b51481dd68e54ff5a771809e873', 1, '我是test001', 'U95480874449', 'test001', 1718871376438, 'U86771349716', 0, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1805, '1dce7674d0ae238778b5cd7018f9f2ad', 1, '我是test001', 'U95480874449', 'test001', 1718871382655, 'U93684588793', 0, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1806, '03145edea7a2194b4618e8df8383f825', 3, '群组已经创建好，可以和好友一起畅聊了', NULL, NULL, 1718933381786, 'G49451146381', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1807, '8508c4c0dcbbaf3729b309aefa0212d8', 3, '群组已经创建好，可以和好友一起畅聊了', NULL, NULL, 1718933577202, 'G24088636587', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1808, '18685227d84bb56faa9b3b51a832667f', 3, '群组已经创建好，可以和好友一起畅聊了', NULL, NULL, 1719152621084, 'G24984189367', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1809, '18685227d84bb56faa9b3b51a832667f', 8, '群聊已解散', NULL, NULL, 1719218887245, 'G24984189367', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1810, '8508c4c0dcbbaf3729b309aefa0212d8', 8, '群聊已解散', NULL, NULL, 1719224187584, 'G24088636587', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1811, 'e208d9762dc020d7524f8cfc6108f6e5', 3, '群组已经创建好，可以和好友一起畅聊了', NULL, NULL, 1719225010828, 'G42537732345', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1812, '56cc5a614f154afa92a10c29fc160d5e', 3, '群组已经创建好，可以和好友一起畅聊了', NULL, NULL, 1719225511561, 'G02761093382', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1813, '1082cd33dbd88592cd1555b193e4e6cc', 3, '群组已经创建好，可以和好友一起畅聊了', NULL, NULL, 1719225651195, 'G74340539818', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1814, 'cfe31e21c882f7c20ec00cfcd77c4228', 3, '群组已经创建好，可以和好友一起畅聊了', NULL, NULL, 1719225672818, 'G74293589177', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1815, '29385531097cba5497c192ac425f74dd', 3, '群组已经创建好，可以和好友一起畅聊了', NULL, NULL, 1719225766135, 'G75712643135', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1816, '69b342c546fbc91cc07967e1cf4d544a', 3, '群组已经创建好，可以和好友一起畅聊了', NULL, NULL, 1719226038538, 'G16971486108', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1817, '69b342c546fbc91cc07967e1cf4d544a', 8, '群聊已解散', NULL, NULL, 1719226052585, 'G16971486108', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1818, '29385531097cba5497c192ac425f74dd', 8, '群聊已解散', NULL, NULL, 1719226064139, 'G75712643135', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1819, 'fdf102758210dda9414a311aa1740884', 3, '群组已经创建好，可以和好友一起畅聊了', NULL, NULL, 1719226391530, 'G87430180747', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1820, 'fdf102758210dda9414a311aa1740884', 8, '群聊已解散', NULL, NULL, 1719226507811, 'G87430180747', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1821, 'ffbac171ee52984f49ebc4e0b85aeca3', 3, '群组已经创建好，可以和好友一起畅聊了', NULL, NULL, 1719226762491, 'G38730576424', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1822, 'ffbac171ee52984f49ebc4e0b85aeca3', 8, '群聊已解散', NULL, NULL, 1719226770817, 'G38730576424', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1823, '3a2ed0cc8047dea15498a55d6bfc3840', 3, '群组已经创建好，可以和好友一起畅聊了', NULL, NULL, 1719226799206, 'G64789067841', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1824, '3a2ed0cc8047dea15498a55d6bfc3840', 8, '群聊已解散', NULL, NULL, 1719372924117, 'G64789067841', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1825, '2cf612a7f3cb29deb7afa1a807c81a45', 3, '群组已经创建好，可以和好友一起畅聊了', NULL, NULL, 1719373056636, 'G66166420204', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1826, 'b65ef58fce07b7190532efd8b1b14c97', 3, '群组已经创建好，可以和好友一起畅聊了', NULL, NULL, 1719373228505, 'G50008330503', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1827, 'b65ef58fce07b7190532efd8b1b14c97', 8, '群聊已解散', NULL, NULL, 1719373239911, 'G50008330503', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1828, '3452b7e650a4515f36dedeb1b89197a0', 3, '群组已经创建好，可以和好友一起畅聊了', NULL, NULL, 1719373286341, 'G87091168741', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1829, '757eb6d4f36a9d4de8f55aeac6e5d8df', 1, '我是test001', 'U95480874449', 'test001', 1719373511022, 'U76247672849', 0, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1830, '40bab0ced08f79d008af34ad111ef3af', 3, '群组已经创建好，可以和好友一起畅聊了', NULL, NULL, 1719373610570, 'G28327686633', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1831, '3452b7e650a4515f36dedeb1b89197a0', 8, '群聊已解散', NULL, NULL, 1719373652336, 'G87091168741', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1832, '40bab0ced08f79d008af34ad111ef3af', 8, '群聊已解散', NULL, NULL, 1719373672746, 'G28327686633', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1833, 'b275925a88531e4798baef09a2378dd4', 3, '群组已经创建好，可以和好友一起畅聊了', NULL, NULL, 1719373724404, 'G12382712924', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1834, 'b7dfc21b453bd49e76a6b2599c1637f0', 3, '群组已经创建好，可以和好友一起畅聊了', NULL, NULL, 1719373759833, 'G29309426350', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1835, 'b7dfc21b453bd49e76a6b2599c1637f0', 8, '群聊已解散', NULL, NULL, 1719373766513, 'G29309426350', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1836, '6f5a9811d56d8d190291353ce13a89d4', 3, '群组已经创建好，可以和好友一起畅聊了', NULL, NULL, 1719373783551, 'G82886905380', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1837, '6f5a9811d56d8d190291353ce13a89d4', 8, '群聊已解散', NULL, NULL, 1719373788364, 'G82886905380', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1838, '75ae07a15f6b72414cf003daac719fa0', 3, '群组已经创建好，可以和好友一起畅聊了', NULL, NULL, 1719373847486, 'G84086580184', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1839, '26d8297ca64a1dc30adde3673be73325', 3, '群组已经创建好，可以和好友一起畅聊了', NULL, NULL, 1719373861889, 'G33590172110', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1840, 'f13a98cef9c592da8d437832499ec728', 3, '群组已经创建好，可以和好友一起畅聊了', NULL, NULL, 1719373877145, 'G43765384670', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1841, 'f13a98cef9c592da8d437832499ec728', 8, '群聊已解散', NULL, NULL, 1719373886053, 'G43765384670', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1842, '75ae07a15f6b72414cf003daac719fa0', 8, '群聊已解散', NULL, NULL, 1719373944852, 'G84086580184', 1, NULL, NULL, NULL, 1);
INSERT INTO `chat_message` VALUES (1843, '26d8297ca64a1dc30adde3673be73325', 8, '群聊已解散', NULL, NULL, 1719373948661, 'G33590172110', 1, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for chat_session
-- ----------------------------
DROP TABLE IF EXISTS `chat_session`;
CREATE TABLE `chat_session`  (
  `session_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会话ID',
  `last_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后接受的消息',
  `last_receive_time` bigint NULL DEFAULT NULL COMMENT '最后接受消息时间毫秒',
  PRIMARY KEY (`session_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会话信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of chat_session
-- ----------------------------
INSERT INTO `chat_session` VALUES ('03145edea7a2194b4618e8df8383f825', '群组已经创建好，可以和好友一起畅聊了', 1718933381786);
INSERT INTO `chat_session` VALUES ('1082cd33dbd88592cd1555b193e4e6cc', '群组已经创建好，可以和好友一起畅聊了', 1719225651195);
INSERT INTO `chat_session` VALUES ('18685227d84bb56faa9b3b51a832667f', '群聊已解散', 1719218887245);
INSERT INTO `chat_session` VALUES ('1dce7674d0ae238778b5cd7018f9f2ad', '我是test001', 1718871382655);
INSERT INTO `chat_session` VALUES ('264e8b51481dd68e54ff5a771809e873', '我是test001', 1718871376438);
INSERT INTO `chat_session` VALUES ('26d8297ca64a1dc30adde3673be73325', '群聊已解散', 1719373948661);
INSERT INTO `chat_session` VALUES ('29385531097cba5497c192ac425f74dd', '群聊已解散', 1719226064139);
INSERT INTO `chat_session` VALUES ('2cf612a7f3cb29deb7afa1a807c81a45', '群组已经创建好，可以和好友一起畅聊了', 1719373056636);
INSERT INTO `chat_session` VALUES ('323bb755fe82fce6987ec66596563366', '欢迎使用EasyChat', 1716370574647);
INSERT INTO `chat_session` VALUES ('3452b7e650a4515f36dedeb1b89197a0', '群聊已解散', 1719373652336);
INSERT INTO `chat_session` VALUES ('394b04d7613ef2e0a51311f37b98ea38', '欢迎使用EasyChat', 1716370455152);
INSERT INTO `chat_session` VALUES ('3a2ed0cc8047dea15498a55d6bfc3840', '群聊已解散', 1719372924117);
INSERT INTO `chat_session` VALUES ('40bab0ced08f79d008af34ad111ef3af', '群聊已解散', 1719373672746);
INSERT INTO `chat_session` VALUES ('56cc5a614f154afa92a10c29fc160d5e', '群组已经创建好，可以和好友一起畅聊了', 1719225511561);
INSERT INTO `chat_session` VALUES ('69b342c546fbc91cc07967e1cf4d544a', '群聊已解散', 1719226052585);
INSERT INTO `chat_session` VALUES ('6f5a9811d56d8d190291353ce13a89d4', '群聊已解散', 1719373788364);
INSERT INTO `chat_session` VALUES ('757eb6d4f36a9d4de8f55aeac6e5d8df', '我是test001', 1719373511022);
INSERT INTO `chat_session` VALUES ('75ae07a15f6b72414cf003daac719fa0', '群聊已解散', 1719373944852);
INSERT INTO `chat_session` VALUES ('8508c4c0dcbbaf3729b309aefa0212d8', '群聊已解散', 1719224187584);
INSERT INTO `chat_session` VALUES ('95c8488e2ff9f5dca6d67ba4a25930ed', '欢迎使用EasyChat', 1716379402709);
INSERT INTO `chat_session` VALUES ('99b6137c11a5b780c187cbb7d515f4f5', '欢迎使用EasyChat', 1716371168403);
INSERT INTO `chat_session` VALUES ('b275925a88531e4798baef09a2378dd4', '群组已经创建好，可以和好友一起畅聊了', 1719373724404);
INSERT INTO `chat_session` VALUES ('b65ef58fce07b7190532efd8b1b14c97', '群聊已解散', 1719373239911);
INSERT INTO `chat_session` VALUES ('b7dfc21b453bd49e76a6b2599c1637f0', '群聊已解散', 1719373766513);
INSERT INTO `chat_session` VALUES ('cfe31e21c882f7c20ec00cfcd77c4228', '群组已经创建好，可以和好友一起畅聊了', 1719225672818);
INSERT INTO `chat_session` VALUES ('e208d9762dc020d7524f8cfc6108f6e5', '群组已经创建好，可以和好友一起畅聊了', 1719225010828);
INSERT INTO `chat_session` VALUES ('eadc6aa02b53981eca821fdab38e9c43', '我是test001', 1718871365168);
INSERT INTO `chat_session` VALUES ('f13a98cef9c592da8d437832499ec728', '群聊已解散', 1719373886053);
INSERT INTO `chat_session` VALUES ('fdf102758210dda9414a311aa1740884', '群聊已解散', 1719226507811);
INSERT INTO `chat_session` VALUES ('ffbac171ee52984f49ebc4e0b85aeca3', '群聊已解散', 1719226770817);

-- ----------------------------
-- Table structure for chat_session_user
-- ----------------------------
DROP TABLE IF EXISTS `chat_session_user`;
CREATE TABLE `chat_session_user`  (
  `user_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `contact_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系人ID',
  `session_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会话ID',
  `contact_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人名称',
  PRIMARY KEY (`user_id`, `contact_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_session_id`(`session_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会话用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of chat_session_user
-- ----------------------------
INSERT INTO `chat_session_user` VALUES ('U02849765806', 'U95480874449', 'eadc6aa02b53981eca821fdab38e9c43', 'test001');
INSERT INTO `chat_session_user` VALUES ('U02849765806', 'Urobot', '99b6137c11a5b780c187cbb7d515f4f5', 'EasyChat');
INSERT INTO `chat_session_user` VALUES ('U76247672849', 'U95480874449', '757eb6d4f36a9d4de8f55aeac6e5d8df', 'test001');
INSERT INTO `chat_session_user` VALUES ('U76247672849', 'Urobot', '323bb755fe82fce6987ec66596563366', 'EasyChat');
INSERT INTO `chat_session_user` VALUES ('U86771349716', 'U95480874449', '264e8b51481dd68e54ff5a771809e873', 'test001');
INSERT INTO `chat_session_user` VALUES ('U86771349716', 'Urobot', '95c8488e2ff9f5dca6d67ba4a25930ed', 'EasyChat');
INSERT INTO `chat_session_user` VALUES ('U93684588793', 'U95480874449', '1dce7674d0ae238778b5cd7018f9f2ad', 'test001');
INSERT INTO `chat_session_user` VALUES ('U95480874449', 'G02761093382', '56cc5a614f154afa92a10c29fc160d5e', '测试群聊03');
INSERT INTO `chat_session_user` VALUES ('U95480874449', 'G12382712924', 'b275925a88531e4798baef09a2378dd4', '测试群聊04');
INSERT INTO `chat_session_user` VALUES ('U95480874449', 'G16971486108', '69b342c546fbc91cc07967e1cf4d544a', '测试群聊03');
INSERT INTO `chat_session_user` VALUES ('U95480874449', 'G24088636587', '8508c4c0dcbbaf3729b309aefa0212d8', '测试群聊02');
INSERT INTO `chat_session_user` VALUES ('U95480874449', 'G24984189367', '18685227d84bb56faa9b3b51a832667f', '测试群聊003');
INSERT INTO `chat_session_user` VALUES ('U95480874449', 'G28327686633', '40bab0ced08f79d008af34ad111ef3af', '测试群聊04');
INSERT INTO `chat_session_user` VALUES ('U95480874449', 'G29309426350', 'b7dfc21b453bd49e76a6b2599c1637f0', '测试群聊03');
INSERT INTO `chat_session_user` VALUES ('U95480874449', 'G33590172110', '26d8297ca64a1dc30adde3673be73325', '测试群聊04');
INSERT INTO `chat_session_user` VALUES ('U95480874449', 'G38730576424', 'ffbac171ee52984f49ebc4e0b85aeca3', '测试群聊03');
INSERT INTO `chat_session_user` VALUES ('U95480874449', 'G42537732345', 'e208d9762dc020d7524f8cfc6108f6e5', '测试群聊02');
INSERT INTO `chat_session_user` VALUES ('U95480874449', 'G43765384670', 'f13a98cef9c592da8d437832499ec728', '测试群聊02');
INSERT INTO `chat_session_user` VALUES ('U95480874449', 'G49451146381', '03145edea7a2194b4618e8df8383f825', '测试群聊');
INSERT INTO `chat_session_user` VALUES ('U95480874449', 'G50008330503', 'b65ef58fce07b7190532efd8b1b14c97', '测试群聊04');
INSERT INTO `chat_session_user` VALUES ('U95480874449', 'G64789067841', '3a2ed0cc8047dea15498a55d6bfc3840', '测试群聊03');
INSERT INTO `chat_session_user` VALUES ('U95480874449', 'G66166420204', '2cf612a7f3cb29deb7afa1a807c81a45', '测试群聊03');
INSERT INTO `chat_session_user` VALUES ('U95480874449', 'G74293589177', 'cfe31e21c882f7c20ec00cfcd77c4228', '测试群聊05');
INSERT INTO `chat_session_user` VALUES ('U95480874449', 'G74340539818', '1082cd33dbd88592cd1555b193e4e6cc', '测试群聊04');
INSERT INTO `chat_session_user` VALUES ('U95480874449', 'G75712643135', '29385531097cba5497c192ac425f74dd', '测试群聊02');
INSERT INTO `chat_session_user` VALUES ('U95480874449', 'G82886905380', '6f5a9811d56d8d190291353ce13a89d4', '测试群聊03');
INSERT INTO `chat_session_user` VALUES ('U95480874449', 'G84086580184', '75ae07a15f6b72414cf003daac719fa0', '测试群聊03');
INSERT INTO `chat_session_user` VALUES ('U95480874449', 'G87091168741', '3452b7e650a4515f36dedeb1b89197a0', '测试群聊03');
INSERT INTO `chat_session_user` VALUES ('U95480874449', 'G87430180747', 'fdf102758210dda9414a311aa1740884', '测试群聊03');
INSERT INTO `chat_session_user` VALUES ('U95480874449', 'U02849765806', 'eadc6aa02b53981eca821fdab38e9c43', 'test003');
INSERT INTO `chat_session_user` VALUES ('U95480874449', 'U76247672849', '757eb6d4f36a9d4de8f55aeac6e5d8df', 'test002');
INSERT INTO `chat_session_user` VALUES ('U95480874449', 'U86771349716', '264e8b51481dd68e54ff5a771809e873', 'test004');
INSERT INTO `chat_session_user` VALUES ('U95480874449', 'U93684588793', '1dce7674d0ae238778b5cd7018f9f2ad', 'test005');
INSERT INTO `chat_session_user` VALUES ('U95480874449', 'Urobot', '394b04d7613ef2e0a51311f37b98ea38', 'EasyChat');

-- ----------------------------
-- Table structure for group_info
-- ----------------------------
DROP TABLE IF EXISTS `group_info`;
CREATE TABLE `group_info`  (
  `group_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '群ID',
  `group_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '群组名',
  `group_owner_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '群主id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `group_notice` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '群公告',
  `join_type` tinyint(1) NULL DEFAULT NULL COMMENT '0:直接加入 1:管理员同意后加入',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态 1:正常 0:解散',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of group_info
-- ----------------------------
INSERT INTO `group_info` VALUES ('G33590172110', '测试群聊04', 'U95480874449', '2024-06-26 11:51:02', '测试群聊04', 1, 0);
INSERT INTO `group_info` VALUES ('G43765384670', '测试群聊02', 'U95480874449', '2024-06-26 11:51:17', '测试群聊02', 1, 0);
INSERT INTO `group_info` VALUES ('G49451146381', '测试群聊', 'U95480874449', '2024-06-21 09:29:42', '测试群聊', 1, 1);
INSERT INTO `group_info` VALUES ('G84086580184', '测试群聊03', 'U95480874449', '2024-06-26 11:50:47', '测试群聊03', 1, 0);

-- ----------------------------
-- Table structure for user_contact
-- ----------------------------
DROP TABLE IF EXISTS `user_contact`;
CREATE TABLE `user_contact`  (
  `user_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `contact_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系人ID或者群组ID',
  `contact_type` tinyint(1) NULL DEFAULT NULL COMMENT '联系人类型 0:好友 1:群组',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态 0:非好友 1:好友 2:已删除好友 3:被好友删除 4:已拉黑好友 5:被好友拉黑',
  `last_update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`user_id`, `contact_id`) USING BTREE,
  INDEX `idx_contact_id`(`contact_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '联系人' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_contact
-- ----------------------------
INSERT INTO `user_contact` VALUES ('U02849765806', 'U95480874449', 0, '2024-06-20 15:34:03', 3, '2024-06-21 11:10:17');
INSERT INTO `user_contact` VALUES ('U02849765806', 'Urobot', 0, '2024-05-22 17:46:08', 1, '2024-05-22 17:46:08');
INSERT INTO `user_contact` VALUES ('U76247672849', 'U95480874449', 0, '2024-06-20 15:15:06', 1, '2024-06-26 11:45:11');
INSERT INTO `user_contact` VALUES ('U76247672849', 'Urobot', 0, '2024-05-22 17:36:15', 1, '2024-05-22 17:36:15');
INSERT INTO `user_contact` VALUES ('U86771349716', 'U95480874449', 0, '2024-06-19 15:26:35', 1, '2024-06-20 16:16:16');
INSERT INTO `user_contact` VALUES ('U86771349716', 'Urobot', 0, '2024-05-22 20:03:23', 1, '2024-05-22 20:03:23');
INSERT INTO `user_contact` VALUES ('U93684588793', 'U95480874449', 0, '2024-06-20 15:54:57', 1, '2024-06-20 16:16:23');
INSERT INTO `user_contact` VALUES ('U95480874449', 'G02761093382', 1, '2024-06-24 18:38:32', 1, '2024-06-24 18:38:32');
INSERT INTO `user_contact` VALUES ('U95480874449', 'G12382712924', 1, '2024-06-26 11:48:44', 1, '2024-06-26 11:48:44');
INSERT INTO `user_contact` VALUES ('U95480874449', 'G16971486108', 1, '2024-06-24 18:47:19', 2, '2024-06-24 18:47:32');
INSERT INTO `user_contact` VALUES ('U95480874449', 'G24088636587', 1, '2024-06-21 09:32:57', 2, '2024-06-24 18:16:27');
INSERT INTO `user_contact` VALUES ('U95480874449', 'G24984189367', 1, '2024-06-23 22:23:41', 2, '2024-06-24 16:48:07');
INSERT INTO `user_contact` VALUES ('U95480874449', 'G28327686633', 1, '2024-06-26 11:46:51', 2, '2024-06-26 11:47:52');
INSERT INTO `user_contact` VALUES ('U95480874449', 'G29309426350', 1, '2024-06-26 11:49:20', 2, '2024-06-26 11:49:26');
INSERT INTO `user_contact` VALUES ('U95480874449', 'G33590172110', 1, '2024-06-26 11:51:02', 2, '2024-06-26 11:52:28');
INSERT INTO `user_contact` VALUES ('U95480874449', 'G38730576424', 1, '2024-06-24 18:59:22', 2, '2024-06-24 18:59:30');
INSERT INTO `user_contact` VALUES ('U95480874449', 'G42537732345', 1, '2024-06-24 18:30:11', 1, '2024-06-24 18:30:11');
INSERT INTO `user_contact` VALUES ('U95480874449', 'G43765384670', 1, '2024-06-26 11:51:17', 2, '2024-06-26 11:51:26');
INSERT INTO `user_contact` VALUES ('U95480874449', 'G49451146381', 1, '2024-06-21 09:29:42', 1, '2024-06-21 09:29:42');
INSERT INTO `user_contact` VALUES ('U95480874449', 'G50008330503', 1, '2024-06-26 11:40:29', 2, '2024-06-26 11:40:39');
INSERT INTO `user_contact` VALUES ('U95480874449', 'G64789067841', 1, '2024-06-24 18:59:59', 2, '2024-06-26 11:35:24');
INSERT INTO `user_contact` VALUES ('U95480874449', 'G66166420204', 1, '2024-06-26 11:37:37', 1, '2024-06-26 11:37:37');
INSERT INTO `user_contact` VALUES ('U95480874449', 'G74293589177', 1, '2024-06-24 18:41:13', 1, '2024-06-24 18:41:13');
INSERT INTO `user_contact` VALUES ('U95480874449', 'G74340539818', 1, '2024-06-24 18:40:51', 1, '2024-06-24 18:40:51');
INSERT INTO `user_contact` VALUES ('U95480874449', 'G75712643135', 1, '2024-06-24 18:42:46', 2, '2024-06-24 18:47:44');
INSERT INTO `user_contact` VALUES ('U95480874449', 'G82886905380', 1, '2024-06-26 11:49:44', 2, '2024-06-26 11:49:48');
INSERT INTO `user_contact` VALUES ('U95480874449', 'G84086580184', 1, '2024-06-26 11:50:47', 2, '2024-06-26 11:52:24');
INSERT INTO `user_contact` VALUES ('U95480874449', 'G87091168741', 1, '2024-06-26 11:41:26', 2, '2024-06-26 11:47:32');
INSERT INTO `user_contact` VALUES ('U95480874449', 'G87430180747', 1, '2024-06-24 18:53:12', 2, '2024-06-24 18:55:07');
INSERT INTO `user_contact` VALUES ('U95480874449', 'U02849765806', 0, '2024-06-20 16:16:05', 2, '2024-06-21 11:10:17');
INSERT INTO `user_contact` VALUES ('U95480874449', 'U76247672849', 0, '2024-06-20 16:16:11', 1, '2024-06-26 11:45:11');
INSERT INTO `user_contact` VALUES ('U95480874449', 'U86771349716', 0, '2024-06-20 16:16:16', 1, '2024-06-20 16:16:16');
INSERT INTO `user_contact` VALUES ('U95480874449', 'U93684588793', 0, '2024-06-20 16:16:23', 1, '2024-06-20 16:16:23');
INSERT INTO `user_contact` VALUES ('U95480874449', 'Urobot', 0, '2024-05-22 17:34:15', 1, '2024-05-22 17:34:15');

-- ----------------------------
-- Table structure for user_contact_apply
-- ----------------------------
DROP TABLE IF EXISTS `user_contact_apply`;
CREATE TABLE `user_contact_apply`  (
  `apply_id` int NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `apply_user_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '申请人id',
  `receive_user_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接收人ID',
  `contact_type` tinyint(1) NOT NULL COMMENT '联系人类型 0:好友 1:群组',
  `contact_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人群组ID',
  `last_apply_time` bigint NULL DEFAULT NULL COMMENT '最后申请时间',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态0:待处理 1:已同意  2:已拒绝 3:已拉黑',
  `apply_info` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请信息',
  PRIMARY KEY (`apply_id`) USING BTREE,
  UNIQUE INDEX `idx_key`(`apply_user_id`, `receive_user_id`, `contact_id`) USING BTREE,
  INDEX `idx_last_apply_time`(`last_apply_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 136924 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '联系人申请' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_contact_apply
-- ----------------------------
INSERT INTO `user_contact_apply` VALUES (136923, 'U95480874449', 'U86771349716', 0, 'U86771349716', 1718781975943, 0, '我是undefined');
INSERT INTO `user_contact_apply` VALUES (136924, 'U95480874449', 'U02849765806', 0, 'U02849765806', 1718868833335, 0, '我是test001');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `nick_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `join_type` tinyint(1) NULL DEFAULT NULL COMMENT '0:直接加入  1:同意后加好友',
  `sex` tinyint(1) NULL DEFAULT NULL COMMENT '性别 0:女 1:男',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `personal_signature` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个性签名',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `area_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地区',
  `area_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地区编号',
  `last_off_time` bigint NULL DEFAULT NULL COMMENT '最后离开时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `idx_key_email`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('U02849765806', 'test003@qq.com', 'test003', 0, 1, '47ec2dd791e31e2ef2076caf64ed9b3d', '哈哈哈哈哈哈', 1, '2024-05-22 17:46:08', NULL, '四川省，成都市', NULL, 1716371168397);
INSERT INTO `user_info` VALUES ('U76247672849', 'test002@qq.com', 'test002', 0, 0, '47ec2dd791e31e2ef2076caf64ed9b3d', '嘻嘻嘻嘻', 1, '2024-05-22 17:36:15', NULL, '湖北省，武汉市', NULL, 1716370574642);
INSERT INTO `user_info` VALUES ('U86771349716', 'test004@qq.com', 'test004', 0, 1, '47ec2dd791e31e2ef2076caf64ed9b3d', '虎虎虎虎虎虎', 1, '2024-05-22 20:03:23', NULL, '广东省，广州市', NULL, 1716379402702);
INSERT INTO `user_info` VALUES ('U93684588793', 'test005@qq.com', 'test005', 0, 0, '47ec2dd791e31e2ef2076caf64ed9b3d', '啦啦啦啦啦', 1, '2024-06-20 17:34:15', NULL, '北京', NULL, NULL);
INSERT INTO `user_info` VALUES ('U95480874449', 'test001@qq.com', 'test001', NULL, 1, '47ec2dd791e31e2ef2076caf64ed9b3d', '哗哗哗', 1, '2024-05-22 17:34:15', NULL, '香港', NULL, 1716370454917);

-- ----------------------------
-- Table structure for user_info_beauty
-- ----------------------------
DROP TABLE IF EXISTS `user_info_beauty`;
CREATE TABLE `user_info_beauty`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邮箱',
  `user_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '0：未使用 1：已使用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_key_user_id`(`user_id`) USING BTREE,
  UNIQUE INDEX `idx_key_email`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '靓号表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_info_beauty
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
