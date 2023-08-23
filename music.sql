/*
 Navicat Premium Data Transfer

 Source Server         : Asuka
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : localhost:3306
 Source Schema         : music

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 23/08/2023 20:22:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '1');
INSERT INTO `admin` VALUES (2, 'test', '123');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NULL DEFAULT NULL COMMENT '用户id',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '收藏类型0歌曲1歌单',
  `song_id` int(0) NULL DEFAULT NULL COMMENT '评论歌曲id',
  `song_list_id` int(0) NULL DEFAULT NULL COMMENT '评论歌单id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '评论时间',
  `up` int(0) NULL DEFAULT 0 COMMENT '点赞',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (46, 19, 1, NULL, 8, '2023-05-18 23:27:43', 3, '111');
INSERT INTO `comment` VALUES (49, 19, 1, NULL, 8, '2023-05-21 00:04:08', 2, '222');
INSERT INTO `comment` VALUES (50, 35, 1, NULL, 2, '2023-07-11 15:04:36', 0, '及你太美');

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `song_list_id` int(0) NOT NULL COMMENT '歌单id',
  `user_id` int(0) NOT NULL COMMENT '用户id',
  `score` int(0) NULL DEFAULT NULL COMMENT '评分',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `userid`(`song_list_id`, `user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES (1, 2, 18, 6);
INSERT INTO `grade` VALUES (2, 2, 1, 9);
INSERT INTO `grade` VALUES (22, 2, 11, 10);
INSERT INTO `grade` VALUES (23, 2, 19, 4);
INSERT INTO `grade` VALUES (24, 2, 21, 10);
INSERT INTO `grade` VALUES (30, 5, 19, 10);
INSERT INTO `grade` VALUES (33, 6, 19, 10);
INSERT INTO `grade` VALUES (34, 6, 23, 7);
INSERT INTO `grade` VALUES (35, 2, 24, 1);
INSERT INTO `grade` VALUES (37, 2, 26, 10);
INSERT INTO `grade` VALUES (38, 2, 23, 2);
INSERT INTO `grade` VALUES (40, 13, 23, 7);
INSERT INTO `grade` VALUES (41, 2, 27, 10);
INSERT INTO `grade` VALUES (43, 9, 27, 8);
INSERT INTO `grade` VALUES (47, 2, 30, 10);
INSERT INTO `grade` VALUES (54, 2, 32, 1);
INSERT INTO `grade` VALUES (61, 15, 19, 8);
INSERT INTO `grade` VALUES (63, 8, 19, 10);
INSERT INTO `grade` VALUES (67, 8, 34, 3);
INSERT INTO `grade` VALUES (68, 2, 35, 1);

-- ----------------------------
-- Table structure for likes
-- ----------------------------
DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NULL DEFAULT NULL COMMENT '用户id',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '收藏类型0歌曲1歌单',
  `song_id` int(0) NULL DEFAULT NULL COMMENT '歌曲id',
  `song_list_id` int(0) NULL DEFAULT NULL COMMENT '歌单id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_song`(`user_id`, `song_id`) USING BTREE COMMENT '一个用户只能收藏一首歌一次'
) ENGINE = InnoDB AUTO_INCREMENT = 82 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of likes
-- ----------------------------
INSERT INTO `likes` VALUES (17, 19, 0, 17, NULL, '2023-03-10 17:20:27');
INSERT INTO `likes` VALUES (26, 21, 0, 1, NULL, '2023-04-18 16:46:11');
INSERT INTO `likes` VALUES (29, 26, 0, 1, NULL, '2023-05-11 19:25:28');
INSERT INTO `likes` VALUES (31, 23, 0, 31, NULL, '2023-05-11 19:40:19');
INSERT INTO `likes` VALUES (33, 27, 0, 21, NULL, '2023-05-11 19:52:04');
INSERT INTO `likes` VALUES (35, 29, 0, 19, NULL, '2023-05-11 19:59:55');
INSERT INTO `likes` VALUES (39, 30, 0, 18, NULL, '2023-05-11 20:07:58');
INSERT INTO `likes` VALUES (41, 19, 0, 30, NULL, '2023-05-11 20:19:22');
INSERT INTO `likes` VALUES (43, 19, 0, 1, NULL, '2023-05-18 17:51:50');
INSERT INTO `likes` VALUES (54, 32, 0, 16, NULL, '2023-05-18 19:23:49');
INSERT INTO `likes` VALUES (58, 32, 0, 25, NULL, '2023-05-18 21:20:10');
INSERT INTO `likes` VALUES (64, 32, 1, NULL, 6, '2023-05-18 22:24:20');
INSERT INTO `likes` VALUES (65, 32, 1, NULL, 2, '2023-05-18 22:28:09');
INSERT INTO `likes` VALUES (66, 32, 0, 1, NULL, '2023-05-18 22:28:25');
INSERT INTO `likes` VALUES (68, 19, 1, NULL, 2, '2023-05-18 23:00:16');
INSERT INTO `likes` VALUES (69, 19, 1, NULL, 5, '2023-05-18 23:07:37');
INSERT INTO `likes` VALUES (71, 19, 0, 31, NULL, '2023-05-18 23:08:07');
INSERT INTO `likes` VALUES (72, 19, 1, NULL, 15, '2023-05-18 23:12:51');
INSERT INTO `likes` VALUES (75, 19, 0, 21, NULL, '2023-05-18 23:18:38');
INSERT INTO `likes` VALUES (78, 19, 1, NULL, 8, '2023-05-21 00:04:04');
INSERT INTO `likes` VALUES (79, 34, 1, NULL, 8, '2023-05-21 00:05:35');
INSERT INTO `likes` VALUES (80, 34, 0, 26, NULL, '2023-05-21 00:05:44');
INSERT INTO `likes` VALUES (81, 35, 0, 1, NULL, '2023-07-11 15:01:59');
INSERT INTO `likes` VALUES (82, 35, 1, NULL, 8, '2023-07-11 15:07:00');

-- ----------------------------
-- Table structure for list_song
-- ----------------------------
DROP TABLE IF EXISTS `list_song`;
CREATE TABLE `list_song`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `song_id` int(0) NULL DEFAULT NULL COMMENT '歌曲id',
  `song_list_id` int(0) NULL DEFAULT NULL COMMENT '歌单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of list_song
-- ----------------------------
INSERT INTO `list_song` VALUES (11, 1, 2);
INSERT INTO `list_song` VALUES (15, 19, 15);
INSERT INTO `list_song` VALUES (16, 18, 15);
INSERT INTO `list_song` VALUES (17, 17, 15);
INSERT INTO `list_song` VALUES (18, 31, 5);
INSERT INTO `list_song` VALUES (19, 30, 5);
INSERT INTO `list_song` VALUES (20, 16, 6);
INSERT INTO `list_song` VALUES (21, 21, 6);
INSERT INTO `list_song` VALUES (22, 6, 7);
INSERT INTO `list_song` VALUES (23, 24, 7);
INSERT INTO `list_song` VALUES (24, 27, 7);
INSERT INTO `list_song` VALUES (25, 28, 7);
INSERT INTO `list_song` VALUES (26, 29, 7);
INSERT INTO `list_song` VALUES (27, 25, 8);
INSERT INTO `list_song` VALUES (28, 26, 8);
INSERT INTO `list_song` VALUES (29, 32, 9);
INSERT INTO `list_song` VALUES (30, 33, 13);
INSERT INTO `list_song` VALUES (31, 34, 6);
INSERT INTO `list_song` VALUES (32, 35, 6);

-- ----------------------------
-- Table structure for nice
-- ----------------------------
DROP TABLE IF EXISTS `nice`;
CREATE TABLE `nice`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NULL DEFAULT NULL,
  `comment_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `likeOnly`(`user_id`, `comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nice
-- ----------------------------
INSERT INTO `nice` VALUES (94, 19, 43);
INSERT INTO `nice` VALUES (96, 19, 44);
INSERT INTO `nice` VALUES (98, 19, 45);
INSERT INTO `nice` VALUES (100, 19, 46);
INSERT INTO `nice` VALUES (106, 19, 49);
INSERT INTO `nice` VALUES (101, 33, 46);
INSERT INTO `nice` VALUES (108, 34, 46);
INSERT INTO `nice` VALUES (107, 34, 49);

-- ----------------------------
-- Table structure for singer
-- ----------------------------
DROP TABLE IF EXISTS `singer`;
CREATE TABLE `singer`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '歌手名',
  `gender` tinyint(1) NULL DEFAULT NULL COMMENT '性别1男0女2组合3未知',
  `pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `birth` datetime(0) NULL DEFAULT NULL COMMENT '生日',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属地区',
  `introduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简介',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of singer
-- ----------------------------
INSERT INTO `singer` VALUES (4, '蔡徐坤', 1, 'img/singerPic/1678535743315cxk.png', '1998-08-02 00:00:00', '中国', '已塌房');
INSERT INTO `singer` VALUES (13, '周杰伦', 1, 'img/singerPic/1676715046393杰伦.jpeg', '1979-01-18 00:00:00', '中国', '周杰伦（Jay Chou），1979年1月18日出生于台湾省新北市，祖籍福建省泉州市永春县，中国台湾流行乐男歌手、音乐人、演员、导演、编剧，毕业于淡江中学。');
INSERT INTO `singer` VALUES (15, '乃木坂46', 2, 'img/singerPic/1676734594717ngzk.jpg', '2011-08-21 00:00:00', '日本', '乃木坂46（英文：Nogizaka46）成立于2011年8月21日，是日本索尼音乐娱乐旗下的大型女子偶像组合。组合共有成员39名，现任队长为梅泽美波');
INSERT INTO `singer` VALUES (24, 'Taylor Swift', 0, 'img/singerPic/1677166441282taylor swift.jpg', '1989-12-13 00:00:00', '美国', '泰勒·斯威夫特（Taylor Swift），1989年12月13日出生于美国宾夕法尼亚州，美国女歌手、词曲作者、音乐制作人、演员。');
INSERT INTO `singer` VALUES (25, 'Aimer', 0, 'img/singerPic/1677417468261aimer.jpg', '2023-02-01 00:00:00', '日本', '2011年6月至2015年9月隶属于日本索尼音乐娱乐旗下的DefSTAR Records，2015年9月移籍到SME Records，2021年9月移籍到SACRA MUSIC；所属事务所是agehasprings');
INSERT INTO `singer` VALUES (27, 'LiSA', 0, 'img/singerPic/1677417591050LiSA.jpg', '1987-06-23 00:00:00', '日本', '织部里沙');
INSERT INTO `singer` VALUES (32, '嵐', 2, 'img/singerPic/1677418901512岚.jpg', '1999-09-15 00:00:00', '日本', '岚（ARASHI），是1999年出道的杰尼斯事务所旗下的男子偶像歌唱团体，由队长大野智、樱井翔、相叶雅纪、二宫和也、松本润5名成员组成');
INSERT INTO `singer` VALUES (33, '苏打绿', 2, 'img/singerPic/1678539867287苏打绿.jpg', '2001-02-15 00:00:00', '中国', '苏打绿（Sodagreen），中国台湾乐团，由吴青峰、史俊威、谢馨仪、龚钰祺、刘家凯、何景扬组成。');
INSERT INTO `singer` VALUES (34, '五月天', 2, 'img/singerPic/1678540166142五月天.jpg', '1997-03-29 00:00:00', '中国', '五月天（Mayday），中国台湾摇滚乐团，成立于1997年3月29日，由温尚翊（怪兽）、陈信宏（阿信）、石锦航（石头）、蔡升晏（玛莎）、刘谚明（冠佑）五名成员组成。1998年加入滚石唱片，正式开始音乐历程。');
INSERT INTO `singer` VALUES (35, 'Alvaro Soler', 1, 'img/singerPic/1678540233463Alvaro Soler.jpg', '1991-01-09 00:00:00', '西班牙', '阿尔瓦罗·索莱尔（Alvaro Soler），1991年1月9日出生于西班牙巴塞罗那，西班牙歌手、流行音乐作曲家。主要作品有《Sofia》');
INSERT INTO `singer` VALUES (36, 'Troye Sivan', 1, 'img/singerPic/1678540338671Troye Sivan.jpg', '1995-06-05 00:00:00', '其他', '特洛耶·希文（Troye Sivan），1995年6月5日出生于南非共和国约翰内斯堡，澳大利亚流行乐男歌手、演员');
INSERT INTO `singer` VALUES (37, 'Tara', 2, 'img/singerPic/1678540425230T-ara.jpg', '2009-07-29 00:00:00', '韩国', 'T-ara（티아라）是MBK Entertainment于2009年7月29日推出的韩国女子流行演唱组合，出道时由李居丽、咸恩静、朴孝敏、朴智妍、朴昭妍、全宝蓝6人组成，后以李居丽、咸恩静、朴孝敏、朴智妍四人体制进行活动，同时组合设有T-ara N4、T-ara QBS两个小分队。');
INSERT INTO `singer` VALUES (38, '米津玄师', 1, 'img/singerPic/1678540623588米津玄师.jpg', '1991-03-10 00:00:00', '日本', '米津玄师（Yonezu Kenshi），1991年3月10日出生于日本德岛县德岛市，日本男歌手、词曲作者、编曲人、插画家、摄影师、舞者');
INSERT INTO `singer` VALUES (39, '星野源', 1, 'img/singerPic/1678540631587星野源.jpg', '1981-01-28 00:00:00', '日本', '星野源（Hoshino Gen），1981年1月28日出生于日本埼玉县蕨市，日本歌手、演员及作家。经纪公司分属于Amuse（音乐合约）、大人计划（演员合约）。老婆是新垣结衣');
INSERT INTO `singer` VALUES (40, '菅田将晖', 1, 'img/singerPic/1678540641452jtjh.png', '1993-02-21 00:00:00', '日本', '菅田将晖（すだ まさき、Suda Masaki），1993年2月21日出生于日本大阪府。日本男演员、歌手。');
INSERT INTO `singer` VALUES (41, 'YOASOBI', 2, 'img/singerPic/1678542412720yoasobi.png', '2019-10-01 00:00:00', '日本', 'YOASOBI（ヨアソビ），日本音乐组合，由歌曲创作者Ayase、主唱ikura组成');
INSERT INTO `singer` VALUES (42, '欅坂46', 2, 'img/singerPic/1678542635901jv.png', '2015-08-21 00:00:00', '日本', '樱坂46（英文：Sakurazaka46）成立于2020年10月14日，是日本索尼音乐娱乐旗下的大型女子偶像组合，亦是乃木坂46的官方姐妹团体。队长由松田里奈担任。');
INSERT INTO `singer` VALUES (43, '张韶涵', 0, 'img/singerPic/1678543044373zsh.jpg', '1982-01-19 00:00:00', '中国', '张韶涵（Angela Zhang），1982年1月19日出生于中国台湾省桃园市中坜区，拥有四分之一维吾尔族血统 [1]  ，华语流行乐女歌手、影视演员，毕业于加拿大温斯顿爵士丘吉尔中学。');
INSERT INTO `singer` VALUES (44, 'Yeal Naim', 0, 'img/singerPic/1681657523602QQ图片20230416230515.jpg', '1978-02-01 00:00:00', '以色列', '耶尔·内姆，以色列歌手，作曲家。1978年出生于法国巴黎一个犹太家庭，四岁时随全家迁至以色列拉玛特沙龙。');
INSERT INTO `singer` VALUES (45, 'Maroon 5', 2, 'img/singerPic/1681658096637maroon5.jpg', '1994-07-14 00:00:00', '美国', '美国摇滚乐队，成立于1994年，由亚当·莱文、詹姆斯·瓦伦丁、杰西·卡麦可、米基·麦登、马特·弗林、PJ Morton、山姆·法拉耳组成。');
INSERT INTO `singer` VALUES (46, '黄诗扶', 3, 'img/singerPic/default.jpg', '2023-04-06 00:00:00', '中国', '无');
INSERT INTO `singer` VALUES (47, '加拿大电鳗', 3, 'img/singerPic/default.jpg', '2023-04-07 00:00:00', '加拿大', '我会自己进去的');
INSERT INTO `singer` VALUES (48, '林俊杰', 1, 'img/singerPic/default.jpg', '2023-04-12 00:00:00', '新加坡', 'JJ');

-- ----------------------------
-- Table structure for song
-- ----------------------------
DROP TABLE IF EXISTS `song`;
CREATE TABLE `song`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `singer_id` int(0) NULL DEFAULT NULL COMMENT '歌手id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '歌手名字',
  `introduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '歌曲简介',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '歌曲创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '歌曲更新时间',
  `pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '歌曲图片',
  `lyric` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '歌词',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '歌曲地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of song
-- ----------------------------
INSERT INTO `song` VALUES (1, 4, '蔡徐坤-只因你太美', '我不知道', '2023-02-19 01:30:05', '2023-03-11 20:02:59', 'img/songPic/1678536179635default.jpg', '[00:00.00]只因你太美 - SWIN-S\n[00:00.05]词：WILLIUS&RK&邓晶&蔡徐坤\n[00:00.24]曲：WILLIUS\n[00:00.38]编曲：WILLIUS\n[00:00.53]只因你太美 baby 只因你太美 baby\n[00:08.87]只因你实在是太美 baby\n[00:13.86]只因你太美 baby\n[00:18.96]迎面走来的你让我如此蠢蠢欲动\n[00:21.14]这种感觉我从未有\n[00:22.02]Cause I got a crush on you who you\n[00:25.78]你是我的我是你的谁\n[00:28.07]再多一眼看一眼就会爆炸\n[00:30.26]再近一点靠近点快被融化\n[00:32.58]想要把你占为己有 baby bae\n[00:34.68]不管走到哪里\n[00:35.49]都会想起的人是你 you you\n[00:38.03]我应该拿你怎样\n[00:39.78]Uh 所有人都在看着你\n[00:42.56]我的心总是不安\n[00:44.20]Oh 我现在已病入膏肓\n[00:46.82]Eh oh\n[00:48.02]难道真的因你而疯狂吗\n[00:51.49]我本来不是这种人\n[00:53.72]因你变成奇怪的人\n[00:55.79]第一次呀变成这样的我\n[01:01.29]不管我怎么去否认\n[01:03.32]只因你太美 baby 只因你太美 baby\n[01:11.67]只因你实在是太美 baby\n[01:16.72]只因你太美 baby\n[01:20.29]Oh eh oh\n[01:22.84]现在确认地告诉我\n[01:25.15]Oh eh oh\n[01:27.46]你到底属于谁\n[01:29.58]Oh eh oh\n[01:31.81]现在确认地告诉我\n[01:34.39]Oh eh oh\n[01:36.41]你到底属于谁\n[01:37.71]就是现在告诉我\n[01:40.43]跟着那节奏缓缓 make wave\n[01:42.63]甜蜜的奶油 it\'s your birthday cake\n[01:44.77]男人们的 game call me 你恋人\n[01:46.95]别被欺骗愉快的 I wanna play\n[01:49.16]我的脑海每分每秒为你一人沉醉\n[01:51.06]最迷人让我神魂颠倒是你身上香水\n[01:53.28]Oh right baby I\'m fall in love with you\n[01:55.39]我的一切你都拿走\n[01:56.37]只要有你就已足够\n[01:58.34]我到底应该怎样\n[02:00.52]Uh 我心里一直很不安\n[02:03.01]其他男人们的视线\n[02:04.96]Oh 全都只看着你的脸\n[02:07.50]Eh oh\n[02:08.72]难道真的因你而疯狂吗\n[02:11.72]我本来不是这种人\n[02:14.59]因你变成奇怪的人\n[02:16.66]第一次呀变成这样的我\n[02:21.99]不管我怎么去否认\n[02:24.05]只因你太美 baby 只因你太美 baby\n[02:32.41]只因你实在是太美 baby\n[02:37.38]只因你太美 baby\n[02:43.64]我愿意把我的全部都给你\n[02:47.58]我每天在梦里都梦见你\n[02:49.19]还有我闭着眼睛也能看到你\n[02:51.98]现在开始我只准你看我\n[02:56.87]I don\'t wanna wake up in dream\n[02:58.25]我只想看你这是真心话\n[02:59.91]只因你太美 baby 只因你太美 baby\n[03:08.35]只因你实在是太美 baby\n[03:13.31]只因你太美 baby\n[03:17.82]Oh eh oh\n[03:19.53]现在确认的告诉我\n[03:22.10]Oh eh oh\n[03:24.06]你到底属于谁\n[03:26.26]Oh eh oh\n[03:28.48]现在确认的告诉我\n[03:31.08]Oh eh oh\n[03:33.02]你到底属于谁就是现在告诉我', 'song/1676741404777只因你太美.mp3');
INSERT INTO `song` VALUES (6, 15, '乃木坂46-世界中の隣人よ', '世界中の隣人よ', '2023-02-19 20:51:08', '2023-05-11 18:14:08', 'img/songPic/1683800048231rinjin.jpg', '[00:00:00] 暂无歌词', 'song/1676811068277世界中の隣人よ.mp3');
INSERT INTO `song` VALUES (16, 24, 'Taylor Swift-Midnight Rain', 'Midnight', '2023-02-23 23:34:43', '2023-02-26 21:43:09', 'img/songPic/1677418989033taylor swift.jpg', '[00:00:00] 暂无歌词', 'song/1677166483435Taylor Swift - Midnight Rain.mp3');
INSERT INTO `song` VALUES (17, 25, 'Aimer-残響散歌', '残響散歌', '2023-02-26 21:21:11', '2023-02-26 21:21:35', 'img/songPic/1677417682572残響散歌.jpg', '[00:00:00] 暂无歌词', 'song/1677417671414残響散歌-Aimer.128.mp3');
INSERT INTO `song` VALUES (18, 27, 'LiSA-明け星', '明け星', '2023-02-26 21:22:10', '2023-02-26 21:22:18', 'img/songPic/1677417738740明げ星.jpg', '[00:00:00] 暂无歌词', 'song/1677417730259明け星.mp3');
INSERT INTO `song` VALUES (19, 27, 'LiSA-炎', '炎', '2023-02-26 21:22:49', '2023-02-26 21:22:56', 'img/songPic/1677417776347炎.jpg', '[00:00:00] 暂无歌词', 'song/1677417769824炎-LiSA.mp3');
INSERT INTO `song` VALUES (20, 32, '嵐-Daylight', 'I seek', '2023-02-26 21:42:35', '2023-02-26 21:42:47', 'img/songPic/1677418967207daylight 岚.jpg', '[00:00:00] 暂无歌词', 'song/1677418955662daylight-嵐.mp3');
INSERT INTO `song` VALUES (21, 24, 'Taylor Swift-Daylight', 'Lover', '2023-02-26 21:43:33', '2023-02-26 21:43:41', 'img/songPic/1677419021616daylight taylor.jpg', '[00:00:00] 暂无歌词', 'song/1677419013410daylight-taylor swift.mp3');
INSERT INTO `song` VALUES (24, 15, '乃木坂46-いつかできるから今日できる', 'いつかできるから今日できる', '2023-03-11 22:15:07', '2023-05-11 18:14:15', 'img/songPic/1683800055903ituka.jpg', '[00:00:00] 暂无歌词', 'song/1678544107034いつかできるから今日できる.mp3');
INSERT INTO `song` VALUES (25, 33, '苏打绿-我好想你', '秋：故事', '2023-03-11 22:16:20', '2023-05-11 18:11:29', 'img/songPic/1683799889513QQ图片20230511181047.jpg', '[00:00:00] 暂无歌词', 'song/1678544180373我好想你-苏打绿.mp3');
INSERT INTO `song` VALUES (26, 33, '苏打绿-日光', '春：日光', '2023-03-11 22:23:04', '2023-05-11 18:11:35', 'img/songPic/1683799895346QQ图片20230511181043.jpg', '[00:00.00]日光 - 苏打绿 (Sodagreen)\r\n[00:06.16]词：吴青峰\r\n[00:12.33]曲：吴青峰\r\n[00:18.50]编曲：苏打绿\r\n[00:24.67]醒在梦境上 梦在清晨上\r\n[00:31.22]晨在川流上 流在船岛下\r\n[00:40.70]残留的夜蹄在稀薄中消失尽\r\n[00:44.83]游戏的念头在泡影中蔓延起\r\n[00:49.01]美好是因为挑战无私的天真\r\n[00:53.31]罪恶是因为克服背叛的恐惧\r\n[01:00.24]岛在轻浮下 浮在狂热下\r\n[01:06.98]狂在初雷下 雷在白昼上\r\n[01:16.46]泉水的音乐在玫瑰缝中打击\r\n[01:20.52]牧神的笛声在快乐岛中苏醒\r\n[01:24.82]美丽是因为滞留昏迷的倦意\r\n[01:29.13]丑恶是因为无视梦境的逝去\r\n[01:33.94]啦\r\n[01:37.62]啦\r\n[01:54.28]水濂遮蔽  海妖歌吟\r\n[02:00.71]夜燕窜袭  金手抚息\r\n[02:30.03]无私的天真在烟云中消失尽\r\n[02:34.09]梦境的逝去在芦笛中蔓延起\r\n[02:38.34]美好是因为克服美好的恐惧\r\n[02:42.58]美好是因为无视美好的逝去', 'song/1678544584886日光-苏打绿.mp3');
INSERT INTO `song` VALUES (27, 15, '乃木坂46-君の名は希望', '君の名は希望', '2023-03-11 22:26:34', '2023-05-11 18:14:23', 'img/songPic/1683800063401kibou.jpg', '[00:00.000] 作词 : Yasushi Akimoto\r\n[00:01.000] 作曲 : Katsuhiko Sugiyama\r\n[00:13.240]编曲：杉山勝彦/有木竜郎\r\n[00:13.440]\r\n[00:13.990]僕が君を初めて意識したのは\r\n[00:20.200]去年の6月 夏の服に着替えた頃\r\n[00:27.100]転がって来たボールを無視してたら\r\n[00:34.150]僕が拾うまで こっちを見て待っていた\r\n[00:39.980]\r\n[00:41.240]透明人間 そう呼ばれてた\r\n[00:48.040]僕の存在 気づいてくれたんだ\r\n[00:54.120]\r\n[00:54.920]厚い雲の隙間に光が射して\r\n[01:01.440]グラウンドの上 僕にちゃんと影ができた\r\n[01:08.610]いつの日からか孤独に慣れていたけど\r\n[01:15.330]僕が拒否してた この世界は美しい\r\n[01:21.060]\r\n[01:24.850]こんなに誰かを恋しくなる\r\n[01:29.680]自分がいたなんて\r\n[01:33.090]想像もできなかったこと\r\n[01:38.820]未来はいつだって\r\n[01:41.440]新たなときめきと出会いの場\r\n[01:46.810]君の名前は“希望”と今 知った\r\n[01:55.200]\r\n[01:56.930]わざと遠い場所から君を眺めた\r\n[02:03.440]だけど時々 その姿を見失った\r\n[02:10.270]24時間 心が空っぽで\r\n[02:17.000]僕は一人では 生きられなくなったんだ\r\n[02:22.650]\r\n[02:24.250]孤独より居心地がいい\r\n[02:30.870]愛のそばでしあわせを感じた\r\n[02:36.660]\r\n[02:37.890]人の群れに逃げ込み紛れてても\r\n[02:44.160]人生の意味を誰も教えてくれないだろう\r\n[02:51.470]悲しみの雨 打たれて足下を見た\r\n[02:58.040]土のその上に そう確かに僕はいた\r\n[03:04.370]\r\n[03:07.910]こんなに心が切なくなる\r\n[03:12.770]恋ってあるんだね\r\n[03:15.930]キラキラと輝いている\r\n[03:21.510]同(おんな)じ今日だって\r\n[03:24.330]僕らの足跡は続いてる\r\n[03:29.670]君の名前は“希望”と今 知った\r\n[03:38.110]\r\n[03:39.790]もし君が振り向かなくても\r\n[03:46.050]その微笑みを僕は忘れない\r\n[03:53.370]どんな時も君がいることを\r\n[03:59.380]信じて まっすぐ歩いて行こう\r\n[04:05.570]\r\n[04:06.110]何(なん)にもわかっていないんだ\r\n[04:10.860]自分のことなんて\r\n[04:14.170]真実の叫びを聞こう\r\n[04:20.630]さあ\r\n[04:22.750]\r\n[04:23.160]こんなに誰かを恋しくなる\r\n[04:27.950]自分がいたなんて\r\n[04:31.370]想像もできなかったこと\r\n[04:36.980]未来はいつだって\r\n[04:39.920]新たなときめきと出会いの場\r\n[04:45.010]君の名前は“希望”と今 知った\r\n[04:53.810]\r\n[04:54.310]希望とは 明日(あす)の空\r\n[05:02.150]WOW WOW WOW\r\n[05:05.310]\r\n[05:06.030]\r\n[05:24.820]', 'song/1678544794049君の名は希望-乃木坂46.mp3');
INSERT INTO `song` VALUES (28, 15, '乃木坂46-悲しみの忘れ方', '今、はなししたい誰かがいる', '2023-03-11 22:30:56', '2023-05-11 18:18:55', 'img/songPic/1683800335471beishang.jpg', '[00:00.000] 作词 : 秋元康\r\n[00:01.000] 作曲 : 近藤圭一\r\n[00:02.000] 编曲 : 久下真音\r\n[00:20.725]爽やかな風が吹いて\r\n[00:25.592]木々の枝揺らしている\r\n[00:30.922]木漏れ日のその下を歩きながら思う\r\n[00:35.744]どんな道もきっとどこかへ続く\r\n[00:40.830]あの頃の私たちは\r\n[00:45.830]今いる場所もわからずに\r\n[00:50.651]暗くて見えない道星を探すように\r\n[00:56.153]胸の奥の夢を手掛かりにしてた\r\n[01:01.277]辛いこともいっぱいあった\r\n[01:06.129]いくつもの坂上った\r\n[01:10.993]迷ってるのは私だけじゃないんだ\r\n[01:16.09]そばにいつだって誰かいる\r\n[01:21.482]良いことひとつ今日の中に見つけて\r\n[01:25.932]悲しみをひとつ忘れようとしてきた\r\n[01:41.538]突然に鳴り響いた\r\n[01:46.393]雷に逃げ惑って\r\n[01:51.493]夕立に濡れながら雲を見上げ思う\r\n[01:56.594]どんな雨もやがて晴れ間に変わる\r\n[02:01.444]その時のあの彼女は\r\n[02:06.396]自分の居場所無くしてた\r\n[02:11.492]みんなと逸れそうで心配をしたけど\r\n[02:16.748]探す声を聞いて道に戻った\r\n[02:22.346]喧嘩だっていっぱいしたよ\r\n[02:27.314]だから仲間になれたんだ\r\n[02:32.22]悩んでたのは私だけじゃないんだ\r\n[02:36.823]逃げ出そうとした何回も\r\n[02:41.973]諦めかけて今日ちょっと頑張って\r\n[02:46.873]明日はそれ以上頑張るのが希望だ\r\n[03:30.298]迷ってるのは私だけじゃないんだ\r\n[03:34.998]そばにいつだって誰かいる\r\n[03:40.389]良いことひとつ今日の中に見つけて\r\n[03:44.940]悲しみをひとつ忘れようとしてきた\r\n[03:50.994]思い通りに何も何も行かないけれど\r\n[03:55.43]それでも誰もが前を向く\r\n[04:00.239]みんな同じだ迷い悩み傷つく\r\n[04:05.621]悲しくなったらもっともっと泣こうよ', 'song/1678545056347忘记悲伤的方法.mp3');
INSERT INTO `song` VALUES (29, 15, '乃木坂46-サヨナラの意味', 'サヨナラの意味', '2023-03-11 22:32:55', '2023-05-11 18:19:00', 'img/songPic/1683800340044zaijain.jpg', '[00:00.000] 作词 : 秋元康\r\n[00:01.000] 作曲 : 杉山胜彦\r\n[00:02.000] 编曲 : 若田部誠\r\n[00:29.880]電車が近づく気配が好きなんだ\r\n[00:37.190]高架線のその下で耳を澄ましてた\r\n[00:44.930]柱の落書き数字とイニシャルは\r\n[00:52.380]誰が誰に\r\n[00:54.340]何を残そうとしたのだろう\r\n[01:00.170]時の流れ\r\n[01:02.210]時の流れ\r\n[01:03.830]教えてくれる\r\n[01:06.140]教えてくれる\r\n[01:07.940]過ぎ去った普通の日々が\r\n[01:11.100]かけがえのない足跡が\r\n[01:18.020]サヨナラに強くなれ\r\n[01:21.650]この出会いに意味がある\r\n[01:25.210]\r\n[01:26.460]悲しみの先に続く僕たちの未来\r\n[01:33.040]始まりはいつだって\r\n[01:36.770]そう何かが終わること\r\n[01:40.870]\r\n[01:41.640]もう一度君を抱きしめて\r\n[01:45.390]守りたかった愛にかわるもの\r\n[01:51.300]\r\n[01:53.160]電車が通過する轟音と風の中\r\n[02:00.000]\r\n[02:00.520]君の唇が動いたけど聞こえない\r\n[02:08.000]静寂が戻り答えを待つ君に\r\n[02:15.070]\r\n[02:15.570]僕は目を見て微笑みながら頷いた\r\n[02:23.020]大切なもの\r\n[02:26.270]大切なもの\r\n[02:27.380]遠ざかっても\r\n[02:29.380]遠ざかっても\r\n[02:31.160]新しい出会いがまた\r\n[02:34.240]いつかはきっとやってくる\r\n[02:41.160]サヨナラを振り向くな\r\n[02:44.750]追いかけてもしょうがない\r\n[02:49.070]\r\n[02:49.670]思い出は今いる場所に\r\n[02:53.430]置いて行こうよ\r\n[02:56.230]終わること躊躇って\r\n[02:59.900]人は皆立ち止まるけど\r\n[03:04.250]\r\n[03:04.770]僕たちは抱き合ってた\r\n[03:08.440]腕を離してもっと強くなる\r\n[03:14.580]\r\n[03:16.800]躊躇してた間に\r\n[03:19.900]日は沈む切なく\r\n[03:24.620]遠くに見える鉄塔もボヤけてく\r\n[03:30.220]確かな距離\r\n[03:31.210]君が好きだけど\r\n[03:33.900]君が好きだけど\r\n[03:35.570]ちゃんと言わなくちゃいけない\r\n[03:38.710]見つめ合った瞳が星空になる\r\n[03:46.940]\r\n[03:49.240]サヨナラは通過点\r\n[03:52.830]これからだって何度もある\r\n[03:56.580]\r\n[03:57.660]後ろ手でピースしながら\r\n[04:01.300]歩き出せるだろう\r\n[04:04.250]君らしく\r\n[04:07.280]\r\n[04:07.920]サヨナラに強くなれ\r\n[04:11.660]この出会いに意味がある\r\n[04:15.410]\r\n[04:16.560]悲しみの先に続く僕たちの未来\r\n[04:23.090]始まりはいつだって\r\n[04:26.820]そう何かが終わること\r\n[04:31.020]\r\n[04:31.550]もう一度君を抱きしめて\r\n[04:35.400]本当の気持ち問いかけたい\r\n[04:40.220]失いたくない\r\n[04:43.020]守りたかった愛にかわるもの', 'song/1678545175922再见的意义.mp3');
INSERT INTO `song` VALUES (30, 44, 'Yeal Naim-New Soul', 'Yael Naim', '2023-04-16 23:07:46', '2023-04-16 23:09:11', 'img/songPic/1681657751659new soul.jpg', '[00:00.000] 作词 : NAIM, YAEL\r\n[00:01.000] 作曲 : NAIM, YAEL\r\n[00:08.540]I\'m a new soul\r\n[00:10.300]I came to this strange world\r\n[00:12.770]hoping I could learn a bit about\r\n[00:15.270]how to give and take.\r\n[00:18.180]But since\r\n[00:18.200]\r\n[00:19.170]I came here felt the joy\r\n[00:21.200]and the fear finding myself\r\n[00:23.560]making every possible mistake.\r\n[00:27.900]\r\n[00:27.930]la-la-la-la-la-la-la-la\r\n[00:47.129]see I\'m a young soul\r\n[00:48.768]in this very strange world\r\n[00:51.158]hoping I could learn a bit about\r\n[00:53.599]what is true and fake.\r\n[00:55.938]\r\n[00:56.498]But why\r\n[00:58.190]all this hate try to communicate\r\n[01:00.878]finding trust and love is not always easy to make.\r\n[01:06.990]la-la-la-la-la-la-la-la\r\n[01:07.199]\r\n[01:45.999]This is a happy end cause\' you don\'t understand\r\n[01:54.839]everything you have done why is everything so wrong.\r\n[02:05.590]This is a happy end come and give me your hand\r\n[02:09.250]I\'ll take you far away.\r\n[02:13.400]\r\n[02:14.400]I\'m a new soul\r\n[02:15.400]I came to this strange world\r\n[02:17.800]hoping I could learn a bit about\r\n[02:20.570]how to give and take\r\n[02:22.979]but since I came here felt the joy\r\n[02:26.000]and the fear finding myself making\r\n[02:28.990]every possible mistake\r\n[02:32.100]\r\n[02:32.590]la-la-la-la-la-la-la-la\r\n[02:42.340]la-la-la-la-la-la-la-la-la-la\r\n[03:10.600]\r\n[03:15.200]\r\n[03:17.190]', 'song/1681657666105New Soul - Yael Naim.mp3');
INSERT INTO `song` VALUES (31, 45, 'Maroon 5-Maps', 'Maps', '2023-04-16 23:15:42', '2023-04-16 23:15:48', 'img/songPic/1681658148458maps封面.jpg', '[00:00.000]Maps -Maroon 5&Big Sean \r\n[00:00.270]Written by：Adam Levine&Ammar Malik&Benjamin Levin&Noel Zancanella&Ryan Tedder \r\n[00:00.540]I miss the taste of a sweeter life \r\n[00:04.560]I miss the conversation \r\n[00:08.550]I\'m searching for a song tonight \r\n[00:12.540]I\'m changing all of the stations \r\n[00:16.560]I like to think that we had it all \r\n[00:20.490]We drew a map to a better place \r\n[00:24.510]But on that road I took a fall \r\n[00:28.560]Oh baby why did you run away \r\n[00:31.560]I was there for you in your darkest times \r\n[00:35.790]I was there for you in your darkest night \r\n[00:39.600]But I wonder where were you \r\n[00:42.030]When I was at my worst down on my knees \r\n[00:46.050]And you said you had my back so I \r\n[00:47.850]Wonder where were you \r\n[00:50.370]All the roads you took came back to me \r\n[00:53.610]So I\'m following the map that leads to you \r\n[00:57.030]The map that leads to you \r\n[00:59.670]Ain\'t nothing I can do \r\n[01:01.080]The map that leads to you following following following to you \r\n[01:05.069]The map that leads to you \r\n[01:07.200]Ain\'t nothing I can do \r\n[01:09.030]The map that leads to you following following following \r\n[01:12.540]I hear your voice in my sleep at night \r\n[01:16.530]Hard to resist temptation \r\n[01:20.520]Cause something strange has come over me \r\n[01:23.700]And now I can\'t get over you \r\n[01:27.420]No I just can\'t get over you \r\n[01:31.590]I was there for you in your darkest times \r\n[01:35.670]I was there for you in your darkest night \r\n[01:39.630]But I wonder where were you \r\n[01:42.030]When I was at my worst down on my knees \r\n[01:46.050]And you said you had my back so wonder where were you \r\n[01:50.310]All the roads you took came back to me \r\n[01:53.610]So I\'m following the map that leads to you \r\n[01:57.030]The map that leads to you \r\n[01:59.340]Ain\'t nothing I can do \r\n[02:01.050]The map that leads to you following following following to you \r\n[02:05.070]The map that leads to you \r\n[02:06.960]Ain\'t nothing I can do \r\n[02:09.090]The map that leads to you \r\n[02:11.520]Oh oh oh \r\n[02:15.810]Oh oh oh \r\n[02:16.020]Ya ya ya \r\n[02:17.550]Ah ah ah \r\n[02:19.530]Oh I was there for you oh in your darkest time \r\n[02:24.480]Oh I was there for you oh in your darkest night \r\n[02:27.540]Oh I was there for you oh in your darkest time \r\n[02:31.560]Oh I was there for you oh in your darkest night \r\n[02:35.610]But I wonder where were you \r\n[02:38.040]When I was at my worst down on my knees \r\n[02:42.060]And you said you had my back so wonder where were you \r\n[02:46.290]All the roads you took came back to me \r\n[02:49.590]So I\'m following the map that leads to you \r\n[02:52.860]The map that leads to you \r\n[02:55.170]Ain\'t nothing I can do \r\n[02:57.090]The map that leads to you following following following to you \r\n[03:01.080]The map that leads to you \r\n[03:03.180]Ain\'t nothing I can do \r\n[03:04.620]The map that leads to you following following following', 'song/1681658142492maps.mp3');
INSERT INTO `song` VALUES (32, 46, '黄诗扶-人间不值得', '人间不值得', '2023-04-16 23:43:59', '2023-05-11 18:14:33', 'img/songPic/1683800073745haha.jpg', '[00:00.000] 作词 : 迟意\r\n[00:01.000] 作曲 : 黄诗扶\r\n[00:02.000] 编曲 : Mzf小慕\r\n[00:03.000] 策划 : 左木修\r\n[00:04.000] 分轨混音 : Mzf小慕\r\n[00:05.000] 吉他 : 顾雄\r\n[00:06.000] 二胡 : 黄诗扶\r\n[00:07.000] 混音 : 幺唠\r\n[00:08.000] 录音 : 后权宝@行人studio\r\n[00:09.000] 封面 : 梁阿渣\r\n[00:10.000] 封面设计 : 小草清清\r\n[00:11.000] 出品 : 万象凡音\r\n[00:15.14]\r\n[00:22.96]渡口爱上深山 薄雪中意晚莲\r\n[00:28.16]夕阳熬红双眼 想等来晨钟聊聊天\r\n[00:33.22]心上人在梅边柳边 偏不在身边\r\n[00:38.01]小白蛇浇透临安 许仙却没带伞\r\n[00:42.98]\r\n[00:43.44]少女压坏秋千 书生十年落选\r\n[00:48.36]命运总是挑挑拣拣 诸事不成全\r\n[00:53.93]小和尚没化到缘 又路过烧鸭店\r\n[01:00.11]\r\n[01:03.18]拈杯酒眯着眼 说专心看人间\r\n[01:08.67]看长安建安与潘安 都想沾一沾\r\n[01:13.42]神仙掐指算 此去少圆满\r\n[01:18.98]得来失 聚了散 千万莫求全\r\n[01:23.30]\r\n[01:23.58]借泥炉烧碗饭 在檐上种炊烟\r\n[01:29.08]管小寒大寒与心寒 都来暖一暖\r\n[01:33.53]好提胆闯人海 再叩风月关\r\n[01:39.18]兜兜转转八十一难 我们走着看\r\n[01:48.38]\r\n[02:12.80]竹马去寻竹马 青梅意兴阑珊\r\n[02:17.91]伯牙琴弦摔断 叔夜刚绝交山巨源\r\n[02:23.01]知己半路就散 结发总另结新欢\r\n[02:27.84]小情侣恰好遇见 喜鹊没来上班\r\n[02:32.69]\r\n[02:33.38]长生岂能如愿 古稀尚靠垂怜\r\n[02:38.08]老病倒比莺莺燕燕 多陪二十年\r\n[02:43.69]小嫦娥偷吃灵药 却反而羡人间\r\n[02:51.13]\r\n[02:53.02]拈杯酒眯着眼 说专心看人间\r\n[02:58.48]看长安建安与潘安 都想沾一沾\r\n[03:03.22]神仙掐指算 此去少圆满\r\n[03:08.70]得来失 聚了散 千万莫求全\r\n[03:13.03]\r\n[03:13.16]借泥炉烧碗饭 在檐上种炊烟\r\n[03:18.96]管小寒大寒与心寒 都来暖一暖\r\n[03:23.56]好提胆闯人海 再叩风月关\r\n[03:29.18]兜兜转转八十一难 我们走着看\r\n[03:37.50]\r\n[03:39.00]人生在世不称意呀 失眠或失恋\r\n[03:48.81]只劝你来把个盏 侃呀么侃大山\r\n[04:00.38]\r\n[04:01.51]喝完大酒撑条船 说今生不靠岸\r\n[04:07.24]去天涯海角浪个遍 失意当尝鲜\r\n[04:12.22]这一路手握剑 身侧有千帆\r\n[04:17.64]时不时～回头看看 百味是人间\r\n[04:26.80]\r\n[04:27.45]时不时～也睡个懒觉 醒来多加餐！\r\n[04:38.53]\r\n[04:39.40]“人间不值得”系列歌曲\r\n[04:40.71]\r\n[04:43.54]', 'song/1681659839245人间不值得.mp3');
INSERT INTO `song` VALUES (33, 35, 'Alvaro Soler-Volar', 'Volar', '2023-04-16 23:53:33', '2023-04-16 23:53:40', 'img/songPic/1681660420561volar.jpg', '[00:00:00] 暂无歌词', 'song/1681660413359Volar.mp3');
INSERT INTO `song` VALUES (34, 24, 'Taylor Swift-Wildest Dream', '1989', '2023-05-18 22:11:52', '2023-05-18 22:13:09', 'img/songPic/168441912517789.jpg', '[00:00.000] 作词 : Taylor Swift/Shellback/Max Martin\r\n[00:01.000] 作曲 : Taylor Swift/Shellback/Max Martin\r\n[00:02.000] 制作人 : Max Martin/Taylor Swift\r\n[00:13.45]He said, \"Let\'s get out of this town\r\n[00:16.25]Drive out of the city, away from the crowds\"\r\n[00:20.14]I thought, \"Heaven can\'t help me now\"\r\n[00:23.19]Nothing lasts forever\r\n[00:25.78]But this is gonna take me down\r\n[00:27.90]He\'s so tall and handsome as hell\r\n[00:31.22]He\'s so bad, but he does it so well\r\n[00:34.35]I can see the end as it begins\r\n[00:37.52]My one condition is\r\n[00:40.91]Say you\'ll remember me\r\n[00:43.85]Standing in a nice dress\r\n[00:45.52]Staring at the sunset, babe\r\n[00:48.20]Red lips and rosy cheeks\r\n[00:50.62]Say you\'ll see me again\r\n[00:52.31]Even if it\'s just in your\r\n[00:54.96]Wildest dreams, ah-aah, haa\r\n[01:01.59]Wildest dreams, ah-aah, haa\r\n[01:11.93]I said, \"No one has to know what we do\"\r\n[01:14.72]His hands are in my hair, his clothes are in my room\r\n[01:18.45]And his voice is a familiar sound\r\n[01:21.44]Nothing lasts forever\r\n[01:23.77]But this is gettin\' good now\r\n[01:26.36]He\'s so tall and handsome as hell\r\n[01:29.52]He\'s so bad, but he does it so well\r\n[01:32.66]And when we\'ve had our very last kiss\r\n[01:36.19]My last request, it is\r\n[01:39.48]Say you\'ll remember me\r\n[01:42.18]Standing in a nice dress\r\n[01:43.86]Staring at the sunset, babe\r\n[01:46.44]Red lips and rosy cheeks\r\n[01:48.91]Say you\'ll see me again\r\n[01:50.69]Even if it\'s just in your\r\n[01:53.24]Wildest dreams, ah-aah, haa(Ah-ahh, haa)\r\n[02:00.26]Wildest dreams, ah-aah, haa\r\n[02:06.96]You\'ll see me in hindsight, tangled up with you all night\r\n[02:10.51]Burnin\' it down\r\n[02:13.91]Someday when you leave me, I\'d bet these memories\r\n[02:17.60]Follow you around\r\n[02:20.73]You\'ll see me in hindsight, tangled up with you all night\r\n[02:24.23]Burning (Burning) it (It) down (Down)\r\n[02:27.53]Someday when you leave me, I\'ll bet these memories\r\n[02:30.79]Follow (Follow) you (You) around (Around)\r\n[02:34.82](Follow you around)\r\n[02:38.22]Say you\'ll remember me\r\n[02:40.60]Standing in a nice dress\r\n[02:42.28]Staring at the sunset, babe\r\n[02:45.01]Red lips and rosy cheeks\r\n[02:47.33]Say you\'ll see me again\r\n[02:49.01]Even if it\'s just pretend\r\n[02:53.75]Say you\'ll remember me\r\n[02:55.96]Standing in a nice dress\r\n[02:57.84]Staring at the sunset, babe\r\n[03:00.08]Red lips and rosy cheeks\r\n[03:02.65]Say you\'ll see me again\r\n[03:04.53]Even if it\'s just in your (Pretend, just pretend)\r\n[03:07.72]Wildest dreams, ah-aah, ha (Ah-aah-aah-aah-aah-hafhaa)\r\n[03:13.89]In your wildest dreams, ah-aah, haa\r\n[03:18.22]Even if it\'s just in your\r\n[03:20.22]Wildest dreams, ah-aah, haa\r\n[03:27.22]In your wildest dreams, ah-aah, haa', 'song/1684419112552wildest dream.mp3');
INSERT INTO `song` VALUES (35, 24, 'Taylor Swift-Love Story', 'Fearless', '2023-05-18 22:12:52', '2023-05-18 22:12:59', 'img/songPic/1684419179391fl.jpg', '[00:00.000] 作词 : Taylor Swift\r\n[00:01.000] 作曲 : Taylor Swift\r\n[00:15.840]We were both young when I first saw you\r\n[00:19.680]I close my eyes and the flashback starts\r\n[00:23.140]I\'m standing there\r\n[00:26.440]On a balcony in summer air\r\n[00:31.940]See the lights see the party the ball gowns\r\n[00:36.030]see you make your way through the crowd\r\n[00:39.290]And say hello\r\n[00:42.600]Little did I know\r\n[00:47.860]That you were Romeo you were throwing pebbles\r\n[00:51.610]And my daddy said stay away from Juliet\r\n[00:55.410]And I was crying on the staircase\r\n[00:58.200]Begging you please don\'t go\r\n[01:02.710]And I said\r\n[01:04.220]Romeo take me somewhere we can be alone\r\n[01:08.350]I\'ll be waiting all there\'s left to do is run\r\n[01:12.260]You\'ll be the prince and I\'ll be the princess\r\n[01:16.320]It\'s a love story\r\n[01:18.350]Baby just say yes\r\n[01:24.340]So I sneak out to the garden to see you\r\n[01:28.350]We keep quiet cause we\'re dead if they knew\r\n[01:31.610]So close your eyes\r\n[01:34.900]Escape this town for a little while\r\n[01:38.390]Oh oh\r\n[01:40.550]Cause you were Romeo I was  a scarlet letter\r\n[01:44.000]And my daddy said stay away from Juliet\r\n[01:47.820]But you were everything to me\r\n[01:50.090]I was begging you please don\'t go\r\n[01:55.130]And I said\r\n[01:56.720]Romeo take me somewhere we can be alone\r\n[02:00.720]I\'ll be waiting all there\'s left to do is run\r\n[02:04.750]You\'ll be the prince and I\'ll be the princess\r\n[02:08.720]It\'s a love story\r\n[02:10.810]Baby just say yes\r\n[02:12.770]Romeo save me\r\n[02:14.590]They’re trying to tell me how to feel\r\n[02:17.070]This love is difficult but it\'s real\r\n[02:20.890]Don\'t be afraid we\'ll make it out of this mess\r\n[02:24.880]It\'s a love story\r\n[02:26.890]Baby just say yes\r\n[02:31.890]Oh oh\r\n[02:44.080]I got tired of waiting\r\n[02:48.000]Wondering if you were ever coming around\r\n[02:51.910]My faith in you was fading\r\n[02:56.770]When I met you on the outskirts of town\r\n[02:59.980]And I said\r\n[03:01.160]Romeo save me\r\n[03:03.260]I\'ve been feeling so alone\r\n[03:05.240]I keep waiting for you but you never come\r\n[03:09.070]Is this in my head\r\n[03:10.850]I don\'t know what to think\r\n[03:12.810]He knelt to the ground and pulled out a ring\r\n[03:16.600]And said\r\n[03:17.300]Marry me Juliet you\'ll never have to be alone\r\n[03:21.360]I love you and that\'s all I really know\r\n[03:25.440]I talked to your dad\r\n[03:26.940]Go pick out a white dress\r\n[03:29.440]It\'s a love story\r\n[03:31.410]Baby just say yes\r\n[03:36.700]Oh oh oh\r\n[03:40.440]Oh oh oh oh\r\n[03:45.390]\'Cause we were both young when I first saw you', 'song/1684419172961Love Story-Taylor Swift.128.mp3');

-- ----------------------------
-- Table structure for song_list
-- ----------------------------
DROP TABLE IF EXISTS `song_list`;
CREATE TABLE `song_list`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '歌单标题',
  `pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面',
  `introduction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '简介',
  `style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '风格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of song_list
-- ----------------------------
INSERT INTO `song_list` VALUES (2, '是真ikun不是小黑子', 'img/songListPic/1676975396161default.jpg', '不许黑我家坤坤', '华语');
INSERT INTO `song_list` VALUES (5, 'Apple Store | 全球店铺音乐热播', 'img/songListPic/1681658336997QQ图片20230416231846.jpg', 'apple apple 还是tmdapple', '英语');
INSERT INTO `song_list` VALUES (6, 'taylor swift 循环超久的百万收藏', 'img/songListPic/1681658697234QQ图片20230416232441.jpg', '2022年10月21日，taylor swift发布了她的第10张录音室专辑《midnights》。不仅讲述了散落在她生命中13个不眠夜的故事，还与打雷姐Lana Del Rey首次合作！', '英语');
INSERT INTO `song_list` VALUES (7, '努力、感謝、笑顔、うちらは乃木坂46', 'img/songListPic/1681659623904QQ图片20230416234014.jpg', 'やっぱり乃木坂だな', '日语');
INSERT INTO `song_list` VALUES (8, '鱼丁系私藏 | 陪伴人生的复刻记忆', 'img/songListPic/1681659347747QQ图片20230416233540.jpg', '在人生的每个阶段，总有一首歌能成为当下的印记。来听听那些无论对我们6人来说（也可能是你的），无可取代的音乐记忆', '华语');
INSERT INTO `song_list` VALUES (9, '戏腔诉情・余音绕梁', 'img/songListPic/1681659879245QQ图片20230416234432.jpg', '苦酒折柳今相离，无风无月也无你', '古典');
INSERT INTO `song_list` VALUES (13, '这是我学习英语的动力', 'img/songListPic/1681660238357QQ图片20230416235019.jpg', '一定能行的', '流行');
INSERT INTO `song_list` VALUES (14, '助眠辑 | 自然音，伴灵动乐符萦绕耳畔', 'img/songListPic/1681714354881109951163452086313.jpg', '歌单收录以自然声效为背景的纯音乐，海浪、雨水、溪流、虫鸣、鸟叫、车辆川流......带上耳机，愿能此声能将室外噪音减到最低，给你心如止水的平静，体验一场心灵Spa，携这份安稳沉沉入睡。', '纯音乐');
INSERT INTO `song_list` VALUES (15, '鬼灭之刃', 'img/songListPic/1677417916633鬼灭之刃.jpeg', '', '日语');
INSERT INTO `song_list` VALUES (16, '【电子】入耳收藏的经典旋律', 'img/songListPic/16817144452331365593450023866.jpg', '入耳收藏的经典电子音乐\n\n从电子音乐入门的经典\n\n到单曲循环的后起之作', '电子');
INSERT INTO `song_list` VALUES (17, '♬跑步音乐-脚步跟着节奏动起来', 'img/songListPic/16817144796373.jpg', '跑步不是件轻松的事情，我们需要从音乐中获得力量和节奏，给我们的意志力提供精神能量，让脚步跟着节奏动起来， 带给你能量。。。', '华语');
INSERT INTO `song_list` VALUES (18, '用音乐保持你每天的嘴角上扬', 'img/songListPic/16817145619764.jpg', '我已经准备好了好听又欢快的歌曲\n那你准备好今天的嘴角上扬了吗\n\n快来吧 让好听歌曲伴随你一整天的微笑', '摇滚');
INSERT INTO `song_list` VALUES (19, '【R&B】在璀璨星河下微醺 喝杯小酒吧！', 'img/songListPic/16817147147605.jpg', '听之前 请一定要先看一眼歌单评论区噢！\n\n如果没看就听了 我怕你错过这个歌单！\n\n第一首歌是我自己的 希望大家可以听听看 要是不喜欢的话就直接切歌 第二首开始才是歌单的正确打开方式！\n\n都是些适合在夜晚喝酒的时候听的歌.\n\n强烈建议 将灯光调暗 打开香薰 再倒杯小酒 然后就只需要闭上眼睛享受即可.\n\n希望这个歌单可以像个秘密基地.\n\n能让你随时随地的Chill一下.\n\n“别怕美好的一切消失，咱们先来让他它存在。”', '古典');
INSERT INTO `song_list` VALUES (20, '听说把糖放在枕头底下会做一个甜甜的梦', 'img/songListPic/168171482243110.jpg', '生活很苦的话\n你要不要搬进我甜甜的梦里\n你一出现我就变得好甜✿', '日语');
INSERT INTO `song_list` VALUES (21, '后来你哭了，想安慰却忘了早已换了身份', 'img/songListPic/168171487824366.jpg', '我在深夜里唱着你爱听的歌\n但身旁再无依偎着的你\n\n后来\n你哭了\n我却不知道怎么安慰\n因为我知道\n已经换了身份\n\n总有一首，在诉说你的故事\n晚安', '华语');
INSERT INTO `song_list` VALUES (22, '无名', 'img/songListPic/default.jpg', '无', '其他');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `gender` tinyint(1) NULL DEFAULT NULL COMMENT '性别',
  `phone_number` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `birth` datetime(0) NULL DEFAULT NULL COMMENT '生日',
  `introduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简介',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在地区',
  `avator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `register_time` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'w', 'ddd', 1, '2', '2@j.so', '2023-02-10 00:00:00', '', '', 'avatorImg/userPic/1678524923374taylor swift.jpg', NULL, '2023-03-11 16:55:23');
INSERT INTO `user` VALUES (10, '张三', '123', 1, '15115111511', '1511555155@qq.com', '2023-02-02 00:00:00', '', '', 'avatorImg/userPic/user.jpg', '2023-02-22 22:41:11', '2023-02-22 22:41:11');
INSERT INTO `user` VALUES (11, '嘎子', '9964', 0, '11451411451', 'nihao@jaa.caa', '2023-02-04 00:00:00', '泥嚎', '瓦坎达', 'avatorImg/userPic/user.jpg', '2023-02-23 23:21:58', '2023-02-23 23:22:16');
INSERT INTO `user` VALUES (12, '1', '2', 1, '3', '4@q.com', '2023-03-18 00:00:00', '1', '辽宁', 'avatorImg/userPic/user.jpg', '2023-03-05 16:12:56', '2023-03-05 16:12:56');
INSERT INTO `user` VALUES (13, '4', '4', 1, '4', '4@ql.com', '2023-03-01 00:00:00', '1', '上海', 'avatorImg/userPic/user.jpg', '2023-03-05 16:14:22', '2023-03-05 16:14:22');
INSERT INTO `user` VALUES (14, '2', '2', 0, '1', '1@a.com', '2023-03-23 00:00:00', 'f', '天津', 'avatorImg/userPic/user.jpg', '2023-03-05 17:14:05', '2023-03-05 17:14:05');
INSERT INTO `user` VALUES (19, 'Asuka111222', '123', 0, '18373573373', '1428882814@qq.com', '2000-09-23 00:00:00', '努力、感謝、笑顔', '北京', 'avatorImg/userPic/1684598691958daylight taylor.jpg', '2023-03-07 18:20:04', '2023-05-21 00:04:52');
INSERT INTO `user` VALUES (21, '86100', '10086', 0, '10086', '', '2023-04-13 00:00:00', '', '', 'avatorImg/userPic/user.jpg', '2023-04-18 15:39:47', '2023-04-18 15:39:47');
INSERT INTO `user` VALUES (23, 'A002', '002', 0, '002', '', '2023-05-20 00:00:00', 'helo', '云南', 'avatorImg/userPic/1683805256019aimer.jpg', '2023-05-11 18:30:57', '2023-05-11 19:40:56');
INSERT INTO `user` VALUES (24, 'aaaaa', '123', 1, '123', '123@qq.com', '2023-05-16 00:00:00', '', '', 'avatorImg/userPic/user.jpg', '2023-05-11 19:16:25', '2023-05-11 19:16:25');
INSERT INTO `user` VALUES (25, 'A004', '004', 1, '004', '', '2023-05-24 00:00:00', '', '', 'avatorImg/userPic/user.jpg', '2023-05-11 19:19:21', '2023-05-11 19:19:21');
INSERT INTO `user` VALUES (26, 'www', '123', 1, '123456', '', '2023-05-17 00:00:00', '', '', 'avatorImg/userPic/user.jpg', '2023-05-11 19:21:19', '2023-05-11 19:21:19');
INSERT INTO `user` VALUES (27, '123456', '123456', 0, '123654', '', '2023-05-24 00:00:00', '', '', 'avatorImg/userPic/user.jpg', '2023-05-11 19:41:23', '2023-05-11 19:41:23');
INSERT INTO `user` VALUES (28, 'qqq', '111', 0, '123232323', '', '2023-05-31 00:00:00', '', '', 'avatorImg/userPic/user.jpg', '2023-05-11 19:53:27', '2023-05-11 19:53:27');
INSERT INTO `user` VALUES (29, 'qqq', '123', 1, '789987', '', '2023-05-17 00:00:00', '', '', 'avatorImg/userPic/user.jpg', '2023-05-11 19:56:43', '2023-05-11 19:56:43');
INSERT INTO `user` VALUES (30, '123', '111', 1, '111111', '', '2023-05-02 00:00:00', 'hello world', '内蒙古', 'avatorImg/userPic/1683806889582残響散歌.jpg', '2023-05-11 20:07:22', '2023-05-11 20:08:25');
INSERT INTO `user` VALUES (31, '1', '1', 0, '147147', '', '2023-05-16 00:00:00', '', '', 'avatorImg/userPic/user.jpg', '2023-05-11 20:22:02', '2023-05-11 20:22:02');
INSERT INTO `user` VALUES (32, '213', '111', 1, '111111111', '', '2023-05-23 00:00:00', '', '', 'avatorImg/userPic/16844186082381111111.jpg', '2023-05-18 17:53:01', '2023-05-18 22:03:28');
INSERT INTO `user` VALUES (33, '张三', '123', 0, '12345678910', '', '2023-05-23 00:00:00', '', '', 'avatorImg/userPic/user.jpg', '2023-05-20 23:55:52', '2023-05-20 23:55:52');
INSERT INTO `user` VALUES (34, '李四', '123', 1, '12345678999', '', '2023-05-25 00:00:00', '', '', 'avatorImg/userPic/user.jpg', '2023-05-21 00:05:12', '2023-05-21 00:05:12');
INSERT INTO `user` VALUES (35, '111111111111', '123', 1, '12345678900', '', '2023-07-18 00:00:00', '', '', 'avatorImg/userPic/user.jpg', '2023-07-11 15:01:39', '2023-07-11 15:01:39');

SET FOREIGN_KEY_CHECKS = 1;
