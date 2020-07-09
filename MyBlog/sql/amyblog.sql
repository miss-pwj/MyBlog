/*
MySQL Data Transfer
Source Host: localhost
Source Database: amyblog
Target Host: localhost
Target Database: amyblog
Date: 2020/6/20 14:04:57
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for admin
-- ----------------------------
CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for article
-- ----------------------------
CREATE TABLE `article` (
  `article_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_user_id` int(10) unsigned DEFAULT '1',
  `article_title` varchar(255) DEFAULT NULL,
  `article_content` mediumtext,
  `article_content_md` mediumtext,
  `article_parent_category_id` int(10) DEFAULT NULL,
  `article_child_category_id` int(10) DEFAULT NULL,
  `article_tag_ids` varchar(50) DEFAULT NULL,
  `article_view_count` int(10) DEFAULT '0',
  `article_comment_count` int(5) DEFAULT '0',
  `article_like_count` int(5) DEFAULT '0',
  `article_post_time` datetime DEFAULT NULL,
  `article_update_time` datetime DEFAULT NULL,
  `article_is_comment` int(2) unsigned DEFAULT NULL,
  `article_status` int(2) unsigned DEFAULT '1',
  `article_order` int(2) unsigned DEFAULT NULL,
  PRIMARY KEY (`article_id`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for category
-- ----------------------------
CREATE TABLE `category` (
  `category_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `category_pid` int(5) DEFAULT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  `category_description` varchar(255) DEFAULT NULL,
  `category_order` int(2) unsigned DEFAULT '1',
  `category_icon` varchar(20) DEFAULT NULL,
  `category_status` int(2) unsigned DEFAULT '1',
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
CREATE TABLE `comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment_pid` int(10) unsigned DEFAULT '0',
  `comment_pname` varchar(255) DEFAULT NULL,
  `comment_article_id` int(10) unsigned DEFAULT NULL,
  `comment_author_name` varchar(50) DEFAULT NULL,
  `comment_author_email` varchar(50) DEFAULT NULL,
  `comment_author_url` varchar(50) DEFAULT NULL,
  `comment_content` varchar(1000) DEFAULT NULL,
  `comment_agent` varchar(200) DEFAULT NULL,
  `comment_ip` varchar(50) DEFAULT NULL,
  `comment_create_time` datetime DEFAULT NULL,
  `comment_role` int(2) DEFAULT NULL,
  `comment_status` int(2) unsigned DEFAULT '1',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for link
-- ----------------------------
CREATE TABLE `link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) DEFAULT NULL,
  `link_name` varchar(255) DEFAULT NULL,
  `link_image` varchar(255) DEFAULT NULL,
  `link_description` varchar(255) DEFAULT NULL,
  `link_owner_nickname` varchar(40) DEFAULT NULL,
  `link_owner_contact` varchar(255) DEFAULT NULL,
  `link_update_time` datetime DEFAULT NULL,
  `link_create_time` datetime DEFAULT NULL,
  `link_order` int(2) unsigned DEFAULT '1',
  `link_status` int(2) unsigned DEFAULT '1',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `link_name` (`link_name`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for log_table
-- ----------------------------
CREATE TABLE `log_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operate` varchar(255) DEFAULT NULL,
  `operateTime` datetime DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `foreign_log_user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
CREATE TABLE `menu` (
  `menu_id` int(5) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) DEFAULT NULL,
  `menu_url` varchar(255) DEFAULT NULL,
  `menu_level` int(2) DEFAULT NULL,
  `menu_icon` varchar(255) DEFAULT NULL,
  `menu_order` int(2) DEFAULT NULL,
  `menu_status` int(2) DEFAULT '1',
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `menu_name` (`menu_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for notice
-- ----------------------------
CREATE TABLE `notice` (
  `notice_id` int(10) NOT NULL AUTO_INCREMENT,
  `notice_title` varchar(255) DEFAULT NULL,
  `notice_content` varchar(10000) DEFAULT NULL,
  `notice_create_time` datetime DEFAULT NULL,
  `notice_update_time` datetime DEFAULT NULL,
  `notice_status` int(2) unsigned DEFAULT '1',
  `notice_order` int(2) DEFAULT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for options
-- ----------------------------
CREATE TABLE `options` (
  `option_id` int(11) NOT NULL,
  `option_site_title` varchar(255) DEFAULT NULL,
  `option_site_descrption` varchar(255) DEFAULT NULL,
  `option_meta_descrption` varchar(255) DEFAULT NULL,
  `option_meta_keyword` varchar(255) DEFAULT NULL,
  `option_aboutsite_avatar` varchar(255) DEFAULT NULL,
  `option_aboutsite_title` varchar(255) DEFAULT NULL,
  `option_aboutsite_content` varchar(255) DEFAULT NULL,
  `option_aboutsite_wechat` varchar(255) DEFAULT NULL,
  `option_aboutsite_qq` varchar(255) DEFAULT NULL,
  `option_aboutsite_github` varchar(255) DEFAULT NULL,
  `option_aboutsite_weibo` varchar(255) DEFAULT NULL,
  `option_tongji` varchar(255) DEFAULT NULL,
  `option_status` int(2) DEFAULT '1',
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for page
-- ----------------------------
CREATE TABLE `page` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_key` varchar(50) DEFAULT NULL,
  `page_title` varchar(50) DEFAULT NULL,
  `page_content` mediumtext,
  `page_create_time` datetime DEFAULT NULL,
  `page_update_time` datetime DEFAULT NULL,
  `page_view_count` int(10) unsigned DEFAULT '0',
  `page_comment_count` int(5) unsigned DEFAULT '0',
  `page_status` int(2) unsigned DEFAULT '1',
  PRIMARY KEY (`page_id`),
  UNIQUE KEY `page_key` (`page_key`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tag
-- ----------------------------
CREATE TABLE `tag` (
  `tag_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(20) DEFAULT NULL,
  `tag_description` varchar(255) DEFAULT NULL,
  `tag_status` int(2) unsigned DEFAULT '1',
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `tag_name` (`tag_name`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL DEFAULT '',
  `user_pass` varchar(255) NOT NULL DEFAULT '',
  `user_nickname` varchar(255) NOT NULL DEFAULT '',
  `user_email` varchar(100) DEFAULT '',
  `user_url` varchar(100) DEFAULT '',
  `user_avatar` varchar(255) DEFAULT NULL,
  `user_last_login_ip` varchar(255) DEFAULT NULL,
  `user_register_time` datetime DEFAULT NULL,
  `user_last_login_time` datetime DEFAULT NULL,
  `user_status` int(2) unsigned DEFAULT '1',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '123456');
INSERT INTO `article` VALUES ('1', '1', '<b>元稹</b>', '寥落古行宫，宫花寂寞红。 白头宫女在，闲坐说玄宗。', '寥落古行宫，宫花寂寞红。 白头宫女在，闲坐说玄宗。', '1', '9', '12', '15', '0', '0', '2020-06-09 09:23:32', '2020-06-08 09:39:33', '1', '1', '1');
INSERT INTO `article` VALUES ('2', '1', '<b>王之涣</b>', '白日依山尽，黄河入海流。 欲穷千里目，更上一层楼。', '白日依山尽，黄河入海流。 欲穷千里目，更上一层楼。', '1', '9', '12', '11', '0', '0', '2020-06-08 02:02:17', '2020-06-11 13:22:52', '1', '1', '1');
INSERT INTO `article` VALUES ('4', '1', '<b>王维</b>', '红豆生南国，春来发几枝。 愿君多采撷，此物最相思。', '红豆生南国，春来发几枝。 愿君多采撷，此物最相思。', '10', '14', '6', '8', '0', '0', '2020-06-04 18:31:41', '2020-06-11 20:19:01', '1', '1', '1');
INSERT INTO `article` VALUES ('3', '1', '<b>王建</b>', '三日入厨下，洗手作羹汤。 未谙姑食性，先遣小姑尝。', '三日入厨下，洗手作羹汤。 未谙姑食性，先遣小姑尝。', '1', '8', '18', '10', '0', '0', '2020-06-07 05:28:50', '2020-06-10 19:58:41', '1', '1', '1');
INSERT INTO `article` VALUES ('5', '1', '<b>王维</b>', '君自故乡来，应知故乡事。 来日绮窗前，寒梅著花未？', '君自故乡来，应知故乡事。 来日绮窗前，寒梅著花未？', '1', '8', '20', '8', '0', '0', '2020-06-03 08:55:38', '2020-06-11 21:35:20', '1', '1', '1');
INSERT INTO `article` VALUES ('6', '1', '<b>王维</b>', '空山不见人，但闻人语响。 返景入深林，复照青苔上。', '空山不见人，但闻人语响。 返景入深林，复照青苔上。', '1', '9', '21', '12', '0', '0', '2020-06-07 16:42:18', '2020-06-11 23:38:53', '1', '1', '1');
INSERT INTO `article` VALUES ('7', '1', '<b>王维</b>', '独坐幽篁里，弹琴复长啸。 深林人不知，明月来相照。', '独坐幽篁里，弹琴复长啸。 深林人不知，明月来相照。', '1', '9', '21', '18', '0', '0', '2020-06-10 03:37:07', '2020-06-09 04:01:02', '1', '1', '1');
INSERT INTO `article` VALUES ('8', '1', '<b>王维</b>', '山中相送罢，日暮掩柴扉。 春草明年绿，王孙归不归？(明年 一作：年年)', '山中相送罢，日暮掩柴扉。 春草明年绿，王孙归不归？(明年 一作：年年)', '1', '9', '13', '35', '2', '0', '2020-06-04 04:14:49', '2020-06-11 21:59:48', '1', '1', '1');
INSERT INTO `article` VALUES ('32', '1', '<b>孟浩然</b>', '春眠不觉晓，处处闻啼鸟。 夜来风雨声，花落知多少。', '春眠不觉晓，处处闻啼鸟。 夜来风雨声，花落知多少。', '1', '9', '11,12,13,20', '27', '0', '0', '2020-06-07 19:40:37', '2020-06-07 19:21:24', '1', '1', '1');
INSERT INTO `article` VALUES ('9', '1', '<b>白居易</b>', '绿蚁新醅酒，红泥小火炉。 晚来天欲雪，能饮一杯无？', '绿蚁新醅酒，红泥小火炉。 晚来天欲雪，能饮一杯无？', '1', '8', '19', '20', '1', '0', '2020-06-06 08:34:21', '2020-06-09 16:11:30', '1', '1', '1');
INSERT INTO `article` VALUES ('10', '1', '<b>西鄙人</b>', '北斗七星高，哥舒夜带刀。 至今窥牧马，不敢过临洮。', '北斗七星高，哥舒夜带刀。 至今窥牧马，不敢过临洮。', '1', '2', '1', '11', '0', '1', '2020-06-10 20:38:14', '2020-06-11 03:20:23', '1', '1', '1');
INSERT INTO `article` VALUES ('11', '1', '<b>李白</b>', '床前明月光，疑是地上霜。 举头望明月，低头思故乡。', '床前明月光，疑是地上霜。 举头望明月，低头思故乡。', '1', '2', '1', '14', '0', '0', '2020-06-08 12:08:01', '2020-06-09 11:43:32', '1', '1', '1');
INSERT INTO `article` VALUES ('12', '1', '<b>李白</b>', '美人卷珠帘，深坐颦蛾眉。(颦 一作：蹙) 但见泪痕湿，不知心恨谁。', '美人卷珠帘，深坐颦蛾眉。(颦 一作：蹙) 但见泪痕湿，不知心恨谁。', '1', '2', '1', '11', '0', '0', '2020-06-09 17:19:49', '2020-06-11 23:09:50', '1', '1', '1');
INSERT INTO `article` VALUES ('13', '1', '<b>李商隐</b>', '向晚意不适，驱车登古原。 夕阳无限好，只是近黄昏。', '向晚意不适，驱车登古原。 夕阳无限好，只是近黄昏。', '10', '13', '9,22', '15', '3', '1', '2020-06-08 15:32:19', '2020-06-11 09:46:29', '1', '1', '1');
INSERT INTO `article` VALUES ('14', '1', '<b>李端</b>', '鸣筝金粟柱，素手玉房前。 欲得周郎顾，时时误拂弦。', '鸣筝金粟柱，素手玉房前。 欲得周郎顾，时时误拂弦。', '1', '8', '20,22', '20', '3', '0', '2020-06-06 05:57:34', '2020-06-07 12:19:13', '1', '1', '1');
INSERT INTO `article` VALUES ('15', '1', '<b>宋之问</b>', '岭外音书断，经冬复历春。 近乡情更怯，不敢问来人。', '岭外音书断，经冬复历春。 近乡情更怯，不敢问来人。', '1', '8', '18', '17', '0', '0', '2020-06-05 14:00:01', '2020-06-08 04:27:55', '1', '1', '1');
INSERT INTO `article` VALUES ('16', '1', '<b>杜甫</b>', '功盖三分国，名成八阵图。（名成 一作：名高） 江流石不转，遗恨失吞吴。', '功盖三分国，名成八阵图。（名成 一作：名高） 江流石不转，遗恨失吞吴。', '1', '2', '1,17', '24', '0', '0', '2020-06-04 04:07:44', '2020-06-07 09:22:36', '1', '1', '1');
INSERT INTO `article` VALUES ('17', '1', '<b>孟浩然</b>', '移舟泊烟渚，日暮客愁新。 野旷天低树，江清月近人。', '移舟泊烟渚，日暮客愁新。 野旷天低树，江清月近人。', '1', '2', '1', '35', '0', '0', '2020-06-04 08:16:22', '2020-06-07 17:47:43', '1', '1', '1');
INSERT INTO `article` VALUES ('33', '1', '<b>金昌绪</b>', '打起黄莺儿，莫教枝上啼。 啼时惊妾梦，不得到辽西。', '打起黄莺儿，莫教枝上啼。 啼时惊妾梦，不得到辽西。', '1', '8', '20', '15', '0', '0', '2020-06-07 06:25:56', '2020-06-11 18:00:29', '1', '1', '1');
INSERT INTO `article` VALUES ('34', '1', '<b>柳宗元</b>', '千山鸟飞绝，万径人踪灭。 孤舟蓑笠翁，独钓寒江雪。', '千山鸟飞绝，万径人踪灭。 孤舟蓑笠翁，独钓寒江雪。', '1', '19', '1,11,12,13,18,20', '24', '0', '0', '2020-06-05 04:34:54', '2020-06-11 03:37:06', '1', '1', '1');
INSERT INTO `article` VALUES ('36', '1', '<b>韦应物</b>', '怀君属秋夜，散步咏凉天。 空山松子落，幽人应未眠。', '怀君属秋夜，散步咏凉天。 空山松子落，幽人应未眠。', '15', '20', '23', '7', '0', '0', '2020-06-10 04:18:25', '2020-06-11 23:46:32', '1', '1', '1');
INSERT INTO `article` VALUES ('37', '1', '<b>祖咏</b>', '终南阴岭秀，积雪浮云端。 林表明霁色，城中增暮寒。', '终南阴岭秀，积雪浮云端。 林表明霁色，城中增暮寒。', '15', '20', '24', '8', '0', '0', '2020-06-03 15:15:43', '2020-06-11 20:04:48', '1', '1', '10');
INSERT INTO `article` VALUES ('38', '1', '<b>张祜</b>', '故国三千里，深宫二十年。 一声何满子，双泪落君前。', '故国三千里，深宫二十年。 一声何满子，双泪落君前。', '1', '3', '1,8,25', '11', '0', '0', '2020-06-06 05:57:34', '2020-06-09 17:39:06', '1', '1', '1');
INSERT INTO `article` VALUES ('39', '1', '<b>贾岛</b>', '松下问童子，言师采药去。 只在此山中，云深不知处。', '松下问童子，言师采药去。 只在此山中，云深不知处。', '1', '3', '1,25', '9', '1', '0', '2020-06-05 14:00:01', '2020-06-11 18:05:12', '1', '1', '1');
INSERT INTO `article` VALUES ('40', '1', '<b>裴迪</b>', '归山深浅去，须尽丘壑美。 莫学武陵人，暂游桃源里。', '归山深浅去，须尽丘壑美。 莫学武陵人，暂游桃源里。', '1', '2', '1,8', '15', '0', '0', '2020-06-04 04:07:44', '2020-06-11 07:40:40', '1', '1', '10');
INSERT INTO `article` VALUES ('41', '1', '<b>刘长卿</b>', '苍苍竹林寺，杳杳钟声晚。 荷笠带斜阳，青山独归远。(斜阳 一作：夕阳)', '苍苍竹林寺，杳杳钟声晚。 荷笠带斜阳，青山独归远。(斜阳 一作：夕阳)', '1', '3', '1,8,25', '19', '0', '0', '2020-06-04 08:16:22', '2020-06-10 06:37:41', '1', '1', '1');
INSERT INTO `article` VALUES ('42', '1', '<b>刘长卿</b>', '泠泠七弦上，静听松风寒。(七弦 一作：七丝) 古调虽自爱，今人多不弹。', '泠泠七弦上，静听松风寒。(七弦 一作：七丝) 古调虽自爱，今人多不弹。', '10', '11', '2', '9', '0', '0', '2020-06-07 06:25:56', '2020-06-08 00:55:25', '1', '1', '1');
INSERT INTO `article` VALUES ('43', '1', '<b>刘长卿</b>', '孤云将野鹤，岂向人间住。 莫买沃洲山，时人已知处。', '孤云将野鹤，岂向人间住。 莫买沃洲山，时人已知处。', '10', '11', '2', '13', '0', '0', '2020-06-05 04:34:54', '2020-06-08 05:43:36', '1', '1', '1');
INSERT INTO `article` VALUES ('44', '1', '<b>权德舆</b>', '昨夜裙带解，今朝蟢子飞。 铅华不可弃，莫是藁砧归。', '昨夜裙带解，今朝蟢子飞。 铅华不可弃，莫是藁砧归。', '10', '11', '2,3', '20', '3', '1', '2020-06-10 04:18:25', '2020-06-10 14:27:08', '1', '1', '10');
INSERT INTO `article` VALUES ('45', '1', '<b>王昌龄</b>', '寒雨连江夜入吴，平明送客楚山孤。 洛阳亲友如相问，一片冰心在玉壶。', '寒雨连江夜入吴，平明送客楚山孤。 洛阳亲友如相问，一片冰心在玉壶。', '10', '11', '2', '12', '0', '0', '2020-06-03 15:15:43', '2020-06-08 12:59:55', '1', '1', '1');
INSERT INTO `article` VALUES ('46', '1', '<b>王昌龄</b>', '闺中少妇不知愁，春日凝妆上翠楼。(不知 一作：不曾) 忽见陌头杨柳色，悔教夫婿觅封侯。', '闺中少妇不知愁，春日凝妆上翠楼。(不知 一作：不曾) 忽见陌头杨柳色，悔教夫婿觅封侯。', '10', '11', '2,3', '9', '0', '0', '2020-06-09 04:20:55', '2018-03-01 15:43:20', '1', '1', '1');
INSERT INTO `article` VALUES ('47', '1', '<b>王昌龄</b>', '昨夜风开露井桃，未央前殿月轮高。 平阳歌舞新承宠，帘外春寒赐锦袍。', '昨夜风开露井桃，未央前殿月轮高。 平阳歌舞新承宠，帘外春寒赐锦袍。', '1', '3', '1,2,3,8,25', '7', '0', '0', '2020-06-08 01:37:02', '2018-03-05 12:11:39', '1', '1', '1');
INSERT INTO `article` VALUES ('48', '1', '<b>王维</b>', '独在异乡为异客，每逢佳节倍思亲。 遥知兄弟登高处，遍插茱萸少一人。', '独在异乡为异客，每逢佳节倍思亲。 遥知兄弟登高处，遍插茱萸少一人。', '1', '2', '1,8', '11', '0', '0', '2020-06-08 06:20:03', '2018-03-05 12:11:23', '1', '1', '1');
INSERT INTO `article` VALUES ('49', '1', '<b>王翰</b>', '葡萄美酒夜光杯，欲饮琵琶马上催。 醉卧沙场君莫笑，古来征战几人回？', '葡萄美酒夜光杯，欲饮琵琶马上催。 醉卧沙场君莫笑，古来征战几人回？', '1', '3', '1,8,15', '22', '0', '0', '2020-06-09 05:37:52', '2018-03-05 12:11:07', '1', '1', '1');
INSERT INTO `article` VALUES ('50', '1', '<b>白居易</b>', '泪湿罗巾梦不成，夜深前殿按歌声。 红颜未老恩先断，斜倚薰笼坐到明。', '泪湿罗巾梦不成，夜深前殿按歌声。 红颜未老恩先断，斜倚薰笼坐到明。', '1', '2', '1,8,18,19', '9', '1', '0', '2020-06-06 05:01:40', '2018-03-05 12:10:52', '1', '1', '2');
INSERT INTO `article` VALUES ('51', '1', '<b>朱庆馀</b>', '寂寂花时闭院门，美人相并立琼轩。 含情欲说宫中事，鹦鹉前头不敢言。', '寂寂花时闭院门，美人相并立琼轩。 含情欲说宫中事，鹦鹉前头不敢言。', '1', '2', '1', '11', '1', '0', '2020-06-03 07:14:18', '2018-03-02 21:50:21', '1', '1', '1');
INSERT INTO `article` VALUES ('105', '1', '早发白帝城', '<p>朝辞白帝彩云间，千里江陵一日还。<br>两岸猿声啼不住，轻舟已过万重山。</p>', '朝辞白帝彩云间，千里江陵一日还。\r\n两岸猿声啼不住，轻舟已过万重山。', '1', '2', '19', '0', '0', '0', '2020-06-13 12:14:19', '2020-06-13 12:14:19', '1', '1', '1');
INSERT INTO `category` VALUES ('1', '0', '楚辞', '唐诗', '1', 'fa fa-coffee', '1');
INSERT INTO `category` VALUES ('2', '1', '乐府', '', '1', '', '1');
INSERT INTO `category` VALUES ('3', '1', '写景', '', '1', '', '1');
INSERT INTO `category` VALUES ('8', '1', '咏物', '', '1', '', '1');
INSERT INTO `category` VALUES ('9', '1', '寒食', '', '1', '', '1');
INSERT INTO `category` VALUES ('10', '0', '清明', '', '1', 'fa fa-cubes', '1');
INSERT INTO `category` VALUES ('11', '10', '离别', '', '1', '', '1');
INSERT INTO `category` VALUES ('12', '10', '爱国', '', '1', '', '1');
INSERT INTO `category` VALUES ('13', '10', '思念', '', '1', '', '1');
INSERT INTO `category` VALUES ('14', '10', '哲理', '', '1', '', '1');
INSERT INTO `category` VALUES ('15', '0', '闺怨', '', '1', 'fa-snowflake-o fa', '1');
INSERT INTO `category` VALUES ('16', '15', '抒情', '', '1', '', '1');
INSERT INTO `category` VALUES ('17', '15', '惜时', '', '1', '', '1');
INSERT INTO `category` VALUES ('18', '15', '豪放', '', '1', '', '1');
INSERT INTO `category` VALUES ('19', '1', '田园', '', '1', '', '1');
INSERT INTO `category` VALUES ('20', '15', '边塞', '', '1', '', '1');
INSERT INTO `comment` VALUES ('3', '0', '', '8', '张三', 'asdfsa@qq.com', '', '今天天气真好', null, '0:0:0:0:0:0:0:1', '2020-06-11 16:08:06', '0', '1');
INSERT INTO `comment` VALUES ('4', '0', '', '8', 'Tom', 'vcvng@126.com', '', '嘻嘻嘻哈哈', null, '0:0:0:0:0:0:0:1', '2020-06-10 16:08:46', '0', '1');
INSERT INTO `comment` VALUES ('5', '0', '', '14', 'Jack', 'jkhkghj@qq.com', '', '叮叮当当', null, '0:0:0:0:0:0:0:1', '2020-06-11 16:09:27', '0', '1');
INSERT INTO `comment` VALUES ('6', '5', 'Jack', '14', 'Jack', 'mn,jhg@qq.com', '', 'Jack回复Jack测试', null, '0:0:0:0:0:0:0:1', '2020-06-11 16:10:10', '0', '1');
INSERT INTO `comment` VALUES ('7', '5', 'Jack', '14', '娜美', 'hgjfyhj6@sina.com', '', '娜美回复Jack测试', null, '0:0:0:0:0:0:0:1', '2020-06-10 16:10:53', '0', '1');
INSERT INTO `comment` VALUES ('8', '0', '', '9', '苏珊', '1212@sina.com', '', '苏珊来过', null, '0:0:0:0:0:0:0:1', '2020-06-11 16:11:36', '0', '1');
INSERT INTO `comment` VALUES ('11', '0', '', '13', '多伦', 'duolun@gmail.com', '', '多伦路过', null, '0:0:0:0:0:0:0:1', '2020-06-11 16:13:09', '0', '1');
INSERT INTO `comment` VALUES ('12', '0', '', '13', '贾克斯', 'jax@sohu.com', '', '我是贾克斯', null, '0:0:0:0:0:0:0:1', '2020-06-11 16:13:44', '0', '1');
INSERT INTO `comment` VALUES ('13', '12', '贾克斯', '13', '瑞克斯', 'ruikou@126.com', '', '贾克斯你好，我是瑞克斯', null, '0:0:0:0:0:0:0:1', '2020-06-11 16:14:32', '0', '1');
INSERT INTO `comment` VALUES ('14', '0', '', '39', '迪迦', 'dijia@qq.com', '', 'test', null, '115.150.178.142', '2020-06-11 16:03:24', '1', '1');
INSERT INTO `comment` VALUES ('15', '0', '', '44', '天下秀', 'zhang@google.com', 'www.tianxiaxiu.com', '哈哈写的不错嘛', null, '0:0:0:0:0:0:0:1', '2020-06-13 04:46:23', '1', '1');
INSERT INTO `comment` VALUES ('16', '0', '', '51', '天下秀', 'zhang@google.com', 'www.tianxiaxiu.com', '今天天气好好', null, '0:0:0:0:0:0:0:1', '2020-06-13 12:08:01', '1', '1');
INSERT INTO `comment` VALUES ('17', '0', '', '50', '123456', 'fad@fda', '', '你真是个小可爱', null, '0:0:0:0:0:0:0:1', '2020-06-13 12:09:03', '1', '1');
INSERT INTO `comment` VALUES ('18', '0', '', '44', 'shilan', 'shilan@gmail.com', '', '挺不错的呢', null, '0:0:0:0:0:0:0:1', '2020-06-20 04:37:39', '1', '1');
INSERT INTO `comment` VALUES ('19', '0', '', '44', 'shilan', 'shilan@gmail.com', '', '今天，你快乐吗', null, '0:0:0:0:0:0:0:1', '2020-06-20 04:38:15', '1', '1');
INSERT INTO `link` VALUES ('1', '', '博客管理', null, '天下秀', null, '', '2020-06-09 00:18:07', '2020-06-08 17:29:35', '1', '1');
INSERT INTO `log_table` VALUES ('1', '用户登录', '2020-06-12 12:29:45', '1');
INSERT INTO `log_table` VALUES ('2', '用户添加', '2020-06-12 12:32:07', '4');
INSERT INTO `log_table` VALUES ('3', '用户添加', '2020-06-12 12:33:44', '5');
INSERT INTO `log_table` VALUES ('4', '用户删除', '2020-06-12 12:34:03', '8');
INSERT INTO `log_table` VALUES ('5', '用户添加', '2020-06-12 12:34:53', '6');
INSERT INTO `log_table` VALUES ('6', '用户修改', '2020-06-12 12:36:34', '3');
INSERT INTO `log_table` VALUES ('7', '用户登录', '2020-06-12 16:35:12', '1');
INSERT INTO `log_table` VALUES ('8', '用户删除', '2020-06-12 16:35:12', '5');
INSERT INTO `log_table` VALUES ('9', '用户修改', '2020-06-12 16:35:12', '4');
INSERT INTO `log_table` VALUES ('10', '用户登录', '2020-06-12 16:35:32', '1');
INSERT INTO `log_table` VALUES ('11', '用户添加', '2020-06-12 16:35:32', '4');
INSERT INTO `log_table` VALUES ('12', '用户删除', '2020-06-12 16:35:32', '8');
INSERT INTO `log_table` VALUES ('13', '用户修改', '2020-06-12 16:35:32', '8');
INSERT INTO `log_table` VALUES ('14', '用户登录', '2020-06-20 04:51:14', '8');
INSERT INTO `log_table` VALUES ('63', '用户登录', '2020-06-20 05:00:31', '8');
INSERT INTO `log_table` VALUES ('64', '用户添加', '2020-06-20 05:15:52', '7');
INSERT INTO `log_table` VALUES ('65', '用户登录', '2020-06-20 05:56:28', '1');
INSERT INTO `log_table` VALUES ('66', '用户登录', '2020-06-20 05:57:20', '8');
INSERT INTO `log_table` VALUES ('67', '用户登录', '2020-06-20 05:58:02', '8');
INSERT INTO `menu` VALUES ('1', '留言板', '/message', '2', 'fa fa-comment', '1', '1');
INSERT INTO `menu` VALUES ('4', '文章归档', '/articleFile', '1', 'fa-list-alt fa', '2', '1');
INSERT INTO `notice` VALUES ('1', '本站下载地址', '博客系统', '2020-06-07 23:44:35', '2020-06-09 00:13:12', '1', '1');
INSERT INTO `notice` VALUES ('2', '博客不定时更新', '博客不定时更新', null, '2020-06-10 17:00:12', '1', '2');
INSERT INTO `options` VALUES ('1', 'MyBlog', '路漫漫其修远兮', 'SSM博客系统', 'SSM博客，MyBlog', '/uploads/2020\\6/timg (21).jpg', '博客管理系统', 'good good study', '', '', '', '', null, '1');
INSERT INTO `page` VALUES ('1', 'map', '站点地图', null, null, null, '0', '0', '2');
INSERT INTO `page` VALUES ('2', 'articleFile', '文章归档', null, null, null, '0', '0', '2');
INSERT INTO `page` VALUES ('3', 'message', '留言板', null, null, null, '0', '0', '2');
INSERT INTO `tag` VALUES ('1', '<b>元稹</b>', '', '1');
INSERT INTO `tag` VALUES ('2', '<b>王之涣</b>', '', '1');
INSERT INTO `tag` VALUES ('3', '<b>王建</b>', '', '1');
INSERT INTO `tag` VALUES ('4', '<b>王维</b>', '', '0');
INSERT INTO `tag` VALUES ('5', '<b>王昌龄</b>', '', '1');
INSERT INTO `tag` VALUES ('6', '<b>王翰</b>', '', '1');
INSERT INTO `tag` VALUES ('8', '<b>白居易</b>', '', '1');
INSERT INTO `tag` VALUES ('9', '<b>朱庆馀</b>', '', '1');
INSERT INTO `tag` VALUES ('10', '<b>岑参</b>', '', '1');
INSERT INTO `tag` VALUES ('11', '<b>李白</b>', '', null);
INSERT INTO `tag` VALUES ('12', '<b>杜甫</b>', '', '1');
INSERT INTO `tag` VALUES ('13', '<b>孟浩然</b>', '', '1');
INSERT INTO `tag` VALUES ('14', '<b>西鄙人</b>', '', '1');
INSERT INTO `tag` VALUES ('15', '<b>金昌绪</b>', '', '1');
INSERT INTO `tag` VALUES ('16', '<b>柳宗元</b>', '', '1');
INSERT INTO `tag` VALUES ('17', '<b>李商隐</b>', '', '1');
INSERT INTO `tag` VALUES ('18', '<b>李端</b>', '', '1');
INSERT INTO `tag` VALUES ('19', '<b>宋之问</b>', '', '1');
INSERT INTO `tag` VALUES ('20', '<b>贾岛</b>', '', '1');
INSERT INTO `tag` VALUES ('21', '<b>裴迪</b>', '', '1');
INSERT INTO `tag` VALUES ('22', '<b>刘长卿</b>', '', '1');
INSERT INTO `tag` VALUES ('23', '<b>刘禹锡</b>', '', '1');
INSERT INTO `tag` VALUES ('24', '<b>杜牧</b>', '', '1');
INSERT INTO `tag` VALUES ('25', '<b>权德舆</b>', '', '1');
INSERT INTO `user` VALUES ('1', 'zhang', '123456', '天下秀', 'zhang@google.com', 'www.tianxiaxiu.com', '/uploads/2020\\6/timg (12).jpg', '0:0:0:0:0:0:0:1', '2020-06-05 21:56:33', '2020-06-18 14:22:34', '1');
INSERT INTO `user` VALUES ('2', 'zhangsan', '123456', '123456', 'fasd@fda', '', '/uploads/2020\\6/timg (11).jpg', null, '2020-06-10 23:15:09', null, '1');
INSERT INTO `user` VALUES ('6', 'tian', '123456', '天天', 'tian@tian.com', '', '/uploads/2020\\6/timg (8)(1).jpg', null, '2020-06-12 07:07:31', null, '1');
INSERT INTO `user` VALUES ('3', 'wang', '123456', '123456', 'fad@fda', '', '/uploads/2020\\6/timg (22).jpg', '0:0:0:0:0:0:0:1', '2020-06-11 00:52:28', '2020-06-20 05:23:48', '1');
INSERT INTO `user` VALUES ('8', 'shilan', '123456', 'shilan', 'shilan@gmail.com', '', '/uploads/2020\\6/img_139.jpg', '0:0:0:0:0:0:0:1', '2020-06-20 04:23:25', '2020-06-20 04:33:34', '1');
INSERT INTO `user` VALUES ('5', 'lala', '123', '啦啦', 'lalala@xiao', '', '/uploads/2020\\6/3E6FDAC049B09E64ADCFA3203D511DDC(1).jpg', null, '2020-06-12 12:33:44', null, '1');
INSERT INTO `user` VALUES ('4', 'admin', '123456', 'manager', 'admin@fdaf', '', '/uploads/2020\\6/3CBC4789EB8BD2862BC27458EE42119E.jpg', '0:0:0:0:0:0:0:1', '2020-06-12 15:50:04', '2020-06-20 05:55:01', '1');
