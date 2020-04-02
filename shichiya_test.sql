/*
Navicat MySQL Data Transfer

Source Server         : ShiChiYa
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : shichiya_test

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2020-04-02 10:41:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cover` varchar(255) DEFAULT '',
  `file` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `author` varchar(255) DEFAULT '',
  `date` varchar(20) DEFAULT '',
  `press` varchar(255) DEFAULT '',
  `abs` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_book_category_on_cid` (`cid`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', 'http://localhost:8443/api/img/v2bzae.jpg', null, '刀剑神域', '【日】川原砾', '2009年04月10日', '电击文库', '2022年，电子机械制造商“ARGUS”开发“NERvGear”装戴在头上的机器，能够控制人类的脑神经连接虚拟世界，于是人类终于实现了完全的虚拟实境。\r\n身为VRMMORPG（虚拟大规模线上角色扮演游戏）《刀剑神域〈SAO〉》中的其中一名玩家：桐人和其他一万个玩家才刚登入享受此游戏之时，游戏中的管理员对大家宣布了一个令人惊恐的消息──\r\n那就是，现在唯一要登出此游戏的方法只有将这个游戏破关，并且在这个游戏中GAME OVER的话，也就代表了现实世界中的“死亡”。\r\n桐人只能在这混乱的情况下，比其他玩家更早一步接受这个事实，投入了看不见终点的战斗之中…… ', '2');
INSERT INTO `book` VALUES ('2', 'http://localhost:8443/api/img/hhw18o.jpg', 'http://localhost:8443/api/file/v4vvkg.txt', '在地下城寻求邂逅是否搞错了什么', '【日】大森藤野', '2013年1月15日', 'GA文库', '\n正传\n迷宫都市欧拉丽──这是一座拥有雄伟地下迷宫的巨大都市。\n名为未知的兴奋、光辉显赫的荣耀，以及与可爱女孩的罗曼史。\n在这人们的梦想与欲望伺机而动的城市里，少年遇见了一位小小的“神仙”。\n“好，贝尔，跟我来。我来为你举行“眷族”入团的仪式。”\n“是。我会变强的。”\n吃遍所有“眷族”的闭门羹、矢志成为冒险者的少年，与成员零名的神仙，发生了一场命运的邂逅。', '2');
INSERT INTO `book` VALUES ('3', 'http://localhost:8443/api/img/r6o3ue.jpg', null, '麦田里的守望者', '【美】杰罗姆·大卫·塞林格', '1951年', '暂无', '《麦田里的守望者》是美国作家杰罗姆·大卫·塞林格创作的唯一一部长篇小说，首次出版于1951年。塞林格将故事的起止局限于16岁的中学生霍尔顿·考尔菲德从离开学校到纽约游荡的三天时间内，并借鉴了意识流天马行空的写作方法，充分探索了一个十几岁少年的内心世界。\n愤怒与焦虑是此书的两大主题，主人公的经历和思想在青少年中引起强烈共鸣，受到读者，特别是广大中学生的热烈欢迎。', '1');
INSERT INTO `book` VALUES ('4', 'http://localhost:8443/api/img/vjpzp4.jpg', 'http://localhost:8443/api/file/hl0v9c.txt', '钢铁是怎样炼成的', '【前苏联】尼古拉·阿列克谢耶维奇·奥斯特洛夫斯基', '2014年7月1日', '晨光出版社', '《钢铁是怎样炼成的》内容简介：有这么一个年轻人，他少年时就参加革命，拿枪和敌人殊死作战，留下满身伤痕。战争结束后，他拼命工作至全身瘫痪、双目失明。因此，他曾失望地想过自杀，但终于凭借顽强的意志，克服了常人难以想象的困难，花三年时间写出这本长篇小说，证明了自己生命的价值。这就是苏联作家尼古拉·奥斯特洛夫斯基的经历，也是小说的主人公保尔·柯察金的经历。这本书，几乎可以看作是作家的自传。', '1');
INSERT INTO `book` VALUES ('5', 'http://localhost:8443/api/img/j9fof0.jpg', null, '菊与刀', '【美】鲁思·本尼迪克特', '1946年', '暂无', '全文分为十三个部分展开论述，第一章提出问题之后，第二章研究了日本人性格的现象：战争中的日本人。本尼迪克特抓住了日本民族的两大典型性格表现，一是天皇的神最不可侵犯，二是被俘虏的日本人与美军的高度合作。她毫不避讳地谈到了这样的性格对第二次世界大战后的日本处置有参考价值。接下来的章节里，本尼迪克特还讨论日本的等级制度和明治维新对传统等级的冲出和改变，并尖锐地指出日本对等级文化的迷信导致其在侵略外国时也试图输入这种等级观念，而这种日本独特的伦理体系当然难以为他国所接受和消化。然后她分析了日本文化的“负恩”逻辑，并进一步一针见血地指出，日本文化是一种耻感文化，和美国的罪感文化差异极大。为了洗刷耻辱，日本人最极端的行为就是自杀。“按照他们的信条是，用适当的方法自杀，可以洗刷污名并赢得身后好评。美国人谴责自杀，认为它只不过是屈服于绝望而自我毁灭。”在此基础上，本尼迪克特认为，日本极端的道德准则使他们的生活经常处于高度紧张状态，作为补偿，日本文化对感官享乐宽容得令人惊讶。本尼迪克特还探讨了日本人的自我修养和育儿方式，不管具体的方法与形式，其本质上与严格的道德准则是一脉相承的。最后，她分析和评价了投降后的日本人与对日政策。', '3');
INSERT INTO `book` VALUES ('6', 'http://localhost:8443/api/img/p7a2xh.jpg', null, '中国饮食文化', '【中】吴澎', ' 2009-7-1', '化学工业出版社', '内容简介\n本书详细介绍了中国饮食文化的渊源、发展历史及现状；八大菜系的特点及各地、各民族风味代表小吃；中国茶文化、酒文化及相关发展历史；当代宴会饮食礼仪及中国各大节日饮食习俗；通过名人、名吃的典故阐述饮食文化对中国历史、文学、艺术及其它文化的影响。\n本书通俗易懂，学术性与科普性兼顾，主要适用于高等院校食品科学、旅游饭店管理、烹饪专业及其它相关专业师生参考，也可作为中国历史文化及饮食爱好者的参考书。', '3');
INSERT INTO `book` VALUES ('7', 'http://localhost:8443/api/img/o0d5t1.jpg', null, '翻开这本小小的书', '【美】洁西·克劳丝', '2014年7月第1版', '北京联合出版公司·后浪出版公司', '内容简介\n这是一本与孩子产生互动的儿童绘本，独特的装帧设计让孩子自主参与故事的演出。他们会翻开一本套着一本的小书，进入不同的角色，体会阅读如交友的乐趣。\n翻开小红书，一只小瓢虫正在惬意地喝咖啡，他正在翻开一本小绿书；小绿书里跳起一只小青蛙，正准备翻开小橘书；小橘书里跑出一只大白兔，她正准备读一本黄色的小书……彩色的小书一个套着一个，书中的动物也同时一个个进入别人的阅读世界。\n直到最后，当我们把一本本小书合上时，也是书中朋友们一一告别的时候。这时候，孩子们看见了自己，也明白了共读时光的美好和快乐。', '4');
INSERT INTO `book` VALUES ('8', 'http://localhost:8443/api/img/tt3piw.jpg', null, '5:2轻断食', '[英] 蜜雪儿•哈维博士 汤尼•豪威教授', '2014-7-1', '中国商业出版社', '2010年，蜜雪儿·哈维博士的“5:2轻断食法”获英国国家肥胖研究协会最佳疗法奖。2012年，英国BBC根据蜜雪儿·哈维博士的轻断食研究成果制作了电视专题节目，使之成为风行全球的新生活潮流。\n5:2轻断食是什么？一周5天正常吃，只需2天对饮食稍加节制，3个月轻松减掉10公斤。2天轻断食期间，吃正常饮食的1/3左右。轻断食期间不会感觉挨饿，反而头脑更清醒，身心更愉悦。 [2] \n5:2轻断食的惊人效果：和普通节食减肥相比，因为只需每周节食2天，5:2轻断食更有效、更容易坚持。使用5:2轻断食减肥法，三个月平均减重10.5公斤，85%的人能够成功坚持下来；而使用普通节食减肥法，则三个月平均减重6.3公斤，坚持者仅40%，且极易反弹复胖。此数据来自蜜雪儿·哈维博士为验证5:2轻断食的效果所做的临床试验，先后共有1000多位女性参与。', '4');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '文学');
INSERT INTO `category` VALUES ('2', '流行');
INSERT INTO `category` VALUES ('3', '文化');
INSERT INTO `category` VALUES ('4', '生活');
INSERT INTO `category` VALUES ('5', '经管');
INSERT INTO `category` VALUES ('6', '科技');
INSERT INTO `category` VALUES ('7', '其他');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('10', 'test', '088df82edecfe6049edff8d4f6903697', 'JQ/pvhlZIt7DBDB+z+VCmA==');
INSERT INTO `user` VALUES ('11', 'admin', 'dfed8d91595c9bba34773ebeceedda11', 'hAujO/daxNXJTxasY11N3Q==');
