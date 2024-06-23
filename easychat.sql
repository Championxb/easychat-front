/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80036
 Source Host           : localhost:3306
 Source Schema         : easychat

 Target Server Type    : MySQL
 Target Server Version : 80036
 File Encoding         : 65001

 Date: 23/06/2024 21:04:03
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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'app发布' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1808 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '聊天消息表' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `chat_session` VALUES ('1dce7674d0ae238778b5cd7018f9f2ad', '我是test001', 1718871382655);
INSERT INTO `chat_session` VALUES ('264e8b51481dd68e54ff5a771809e873', '我是test001', 1718871376438);
INSERT INTO `chat_session` VALUES ('323bb755fe82fce6987ec66596563366', '欢迎使用EasyChat', 1716370574647);
INSERT INTO `chat_session` VALUES ('394b04d7613ef2e0a51311f37b98ea38', '欢迎使用EasyChat', 1716370455152);
INSERT INTO `chat_session` VALUES ('757eb6d4f36a9d4de8f55aeac6e5d8df', '我是test001', 1718871370589);
INSERT INTO `chat_session` VALUES ('8508c4c0dcbbaf3729b309aefa0212d8', '群组已经创建好，可以和好友一起畅聊了', 1718933577202);
INSERT INTO `chat_session` VALUES ('95c8488e2ff9f5dca6d67ba4a25930ed', '欢迎使用EasyChat', 1716379402709);
INSERT INTO `chat_session` VALUES ('99b6137c11a5b780c187cbb7d515f4f5', '欢迎使用EasyChat', 1716371168403);
INSERT INTO `chat_session` VALUES ('eadc6aa02b53981eca821fdab38e9c43', '我是test001', 1718871365168);

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
INSERT INTO `chat_session_user` VALUES ('U95480874449', 'G24088636587', '8508c4c0dcbbaf3729b309aefa0212d8', '测试群聊02');
INSERT INTO `chat_session_user` VALUES ('U95480874449', 'G49451146381', '03145edea7a2194b4618e8df8383f825', '测试群聊');
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
INSERT INTO `group_info` VALUES ('G24088636587', '测试群聊02', 'U95480874449', '2024-06-21 09:32:57', '测试群聊02', 0, 1);
INSERT INTO `group_info` VALUES ('G49451146381', '测试群聊', 'U95480874449', '2024-06-21 09:29:42', '测试群聊', 1, 1);

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
INSERT INTO `user_contact` VALUES ('U76247672849', 'U95480874449', 0, '2024-06-20 15:15:06', 1, '2024-06-20 16:16:11');
INSERT INTO `user_contact` VALUES ('U76247672849', 'Urobot', 0, '2024-05-22 17:36:15', 1, '2024-05-22 17:36:15');
INSERT INTO `user_contact` VALUES ('U86771349716', 'U95480874449', 0, '2024-06-19 15:26:35', 1, '2024-06-20 16:16:16');
INSERT INTO `user_contact` VALUES ('U86771349716', 'Urobot', 0, '2024-05-22 20:03:23', 1, '2024-05-22 20:03:23');
INSERT INTO `user_contact` VALUES ('U93684588793', 'U95480874449', 0, '2024-06-20 15:54:57', 1, '2024-06-20 16:16:23');
INSERT INTO `user_contact` VALUES ('U95480874449', 'G24088636587', 1, '2024-06-21 09:32:57', 1, '2024-06-21 09:32:57');
INSERT INTO `user_contact` VALUES ('U95480874449', 'G49451146381', 1, '2024-06-21 09:29:42', 1, '2024-06-21 09:29:42');
INSERT INTO `user_contact` VALUES ('U95480874449', 'U02849765806', 0, '2024-06-20 16:16:05', 2, '2024-06-21 11:10:17');
INSERT INTO `user_contact` VALUES ('U95480874449', 'U76247672849', 0, '2024-06-20 16:16:11', 1, '2024-06-20 16:16:11');
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
) ENGINE = InnoDB AUTO_INCREMENT = 136925 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '联系人申请' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '靓号表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_info_beauty
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
