/*
Navicat MySQL Data Transfer

Source Server         : zhai
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : dianying

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2024-03-25 11:48:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminid` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `adminaccount` varchar(20) DEFAULT NULL COMMENT '管理员账号',
  `adminpassword` varchar(50) DEFAULT NULL COMMENT '管理员密码',
  `adminrole` varchar(50) DEFAULT NULL COMMENT '身份',
  PRIMARY KEY (`adminid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('4', 'admin', '1', '超级管理员');
INSERT INTO `admin` VALUES ('5', 'aaaaaa', '123456', '管理员');

-- ----------------------------
-- Table structure for `assess`
-- ----------------------------
DROP TABLE IF EXISTS `assess`;
CREATE TABLE `assess` (
  `aid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `mid` int(11) DEFAULT NULL COMMENT '电影',
  `meid` int(11) DEFAULT NULL COMMENT '用户id',
  `ascore` int(11) DEFAULT NULL COMMENT '评分',
  `amemo` text COMMENT '评语',
  `atime` datetime DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assess
-- ----------------------------
INSERT INTO `assess` VALUES ('5', '5', '6', '9', '很好看很励志的一部电影推荐观看', '2024-03-24 10:23:06');
INSERT INTO `assess` VALUES ('6', '7', '7', '10', '1', '2024-03-25 11:37:31');
INSERT INTO `assess` VALUES ('7', '6', '7', '10', '123', '2024-03-25 11:45:24');

-- ----------------------------
-- Table structure for `collects`
-- ----------------------------
DROP TABLE IF EXISTS `collects`;
CREATE TABLE `collects` (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `mid` int(11) DEFAULT NULL COMMENT '电影id',
  `meid` int(11) DEFAULT NULL COMMENT '用户id',
  `atime` datetime DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collects
-- ----------------------------
INSERT INTO `collects` VALUES ('11', '4', '6', '2024-03-24 10:18:23');
INSERT INTO `collects` VALUES ('13', '7', '6', '2024-03-24 17:16:06');
INSERT INTO `collects` VALUES ('14', '5', '6', '2024-03-24 18:27:28');
INSERT INTO `collects` VALUES ('15', '7', '7', '2024-03-25 11:39:58');
INSERT INTO `collects` VALUES ('16', '6', '7', '2024-03-25 11:45:20');

-- ----------------------------
-- Table structure for `members`
-- ----------------------------
DROP TABLE IF EXISTS `members`;
CREATE TABLE `members` (
  `meid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `mname` varchar(50) DEFAULT NULL COMMENT '微信昵称',
  `photo` varchar(200) DEFAULT NULL COMMENT '头像',
  `sname` varchar(50) DEFAULT NULL COMMENT '姓名',
  `tel` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `address` varchar(100) DEFAULT NULL COMMENT '联系地址',
  `qq` varchar(50) DEFAULT NULL COMMENT 'QQ',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  `matime` datetime DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`meid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of members
-- ----------------------------
INSERT INTO `members` VALUES ('6', '古道西风', 'https://thirdwx.qlogo.cn/mmopen/vi_32/lAyoU2ibJxRLLXtDEwRAu0Wweq52K2KibVEeMiaTcQHVtEBCa0ia8bU0libqbWy5nicFhvFgqOPOYJE9U8RUl3Pqa2JA/132', '王小宝', '13626263099', '河南省郑州市二七区淮北街14-2号', '23823921', '13626263099@163.com', '2024-03-24 10:07:11');
INSERT INTO `members` VALUES ('7', '凡尘清心', 'https://thirdwx.qlogo.cn/mmopen/vi_32/O4nKr2vFxUQy4bIF8AV3NQmiazZHukratFKK5xlneFzNfGK8GnqUfSvFosYHwO3myVY99fIUlwJbsOB8vDjSZiag/132', null, null, null, null, null, '2024-03-25 11:36:54');

-- ----------------------------
-- Table structure for `movies`
-- ----------------------------
DROP TABLE IF EXISTS `movies`;
CREATE TABLE `movies` (
  `mid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tid` int(11) DEFAULT NULL COMMENT '影片分类',
  `title` varchar(100) DEFAULT NULL COMMENT '电影名称',
  `pic` varchar(100) DEFAULT NULL COMMENT '图片',
  `daoy` varchar(100) DEFAULT NULL COMMENT '导演',
  `zhuy` varchar(200) DEFAULT NULL COMMENT '主演',
  `shic` varchar(50) DEFAULT NULL COMMENT '时长',
  `memo` text COMMENT '电影简介',
  `matime` datetime DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movies
-- ----------------------------
INSERT INTO `movies` VALUES ('4', '6', '飞驰人生2', '/upload/1709825740684.jpg', '韩寒', '沈腾 / 范丞丞 / 尹正 / 张本煜', '121分钟', '<p style=\"text-indent:2em;\">\r\n	昔日冠军车手张驰（沈腾 饰）沦为落魄驾校教练，过着靠脸吃饭勉强度日的生活。不料天上掉馅饼，濒临停产的老头乐车厂厂长（贾冰 饰）主动提出赞助张驰组建车队再闯最后一届巴音布鲁克拉力赛。面对这泼天的富贵，张驰蠢蠢欲动，而厂长背后真实的目的无人知晓……带资进队的车手厉小海（范丞丞 饰），看似单纯善良却为何有着与之身份毫不相符的超强天赋？\r\n　　张驰召集老朋友孙宇强（尹正 饰）和记星（张本煜 饰），与天才车手厉小海和总是考不过科目二的菜鸟驾校学员刘显德（孙艺洲 饰）组成了一个苦中作乐、鸡飞狗跳的草台班子，克服重重困难，笑料百出地奔赴赛场。这一次他将超越无数次出现在梦中的终点线……\r\n</p>', '2024-03-24 23:36:15');
INSERT INTO `movies` VALUES ('5', '6', '热辣滚烫', '/upload/1709825816017.jpg', '贾玲', '贾玲 / 雷佳音 / 张小斐', '128分钟', '<p style=\"text-indent:2em;\">\r\n	乐莹（贾玲 饰）宅家多年，无所事事。大学毕业工作了一段时间后，乐莹选择脱离社会，封闭社交圈层，这是她认为与自己“和解”的最好方式。一日，在命运的几番“捉弄”下，她决定要换一种方式生活。在与外面的世界小心翼翼的接触中，乐莹结识了拳击教练昊坤（雷佳音 饰）。当她以为生活即将 步入正轨时，接踵而至的考验却远超她的想像，滚烫的人生才刚刚开始……\r\n</p>', '2024-03-24 23:37:12');
INSERT INTO `movies` VALUES ('6', '9', '熊出没逆转时空', '/upload/1709825865244.jpg', '林汇达', '动画', '108分钟', '<p style=\"text-indent:2em;\">\r\n	光头强是一名普通程序员，却常梦见陌生的森林和两头狗熊。直到他跟上司出访大客户，终于想起：他原是森林的小导游，偶然得到一次重新选择人生的机会。为了挽救旧时间线里的熊大熊二，光头强开始一场奇妙的时空冒险。\r\n</p>', '2024-03-24 23:38:03');
INSERT INTO `movies` VALUES ('7', '4', '沙丘2', '/upload/1709825911346.jpg', '丹尼斯·维伦纽瓦', '提莫西·查拉梅 / 赞达亚 / 丽贝卡·弗格森', '166分钟', '<p style=\"text-indent:2em;\">\r\n	《沙丘2》将探索保罗·厄崔迪（提莫西·查拉梅 Timothée Chalamet 饰）的传奇之旅，他与契妮（赞达亚 Zendaya 饰）和弗雷曼人联手，踏上对致其家毁人亡的阴谋者的复仇之路。当面对一生挚爱和已知宇宙命运之间的抉择时，他必须努力阻止只有他能预见的可怕的未来。\r\n</p>', '2024-03-24 23:38:51');

-- ----------------------------
-- Table structure for `mtype`
-- ----------------------------
DROP TABLE IF EXISTS `mtype`;
CREATE TABLE `mtype` (
  `tid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tname` varchar(50) DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mtype
-- ----------------------------
INSERT INTO `mtype` VALUES ('4', '动作');
INSERT INTO `mtype` VALUES ('5', '爱情');
INSERT INTO `mtype` VALUES ('6', '喜剧');
INSERT INTO `mtype` VALUES ('7', '科幻');
INSERT INTO `mtype` VALUES ('8', '恐怖');
INSERT INTO `mtype` VALUES ('9', '动画');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `nid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `photo` varchar(100) DEFAULT NULL COMMENT '资讯图片',
  `memo` text COMMENT '资讯内容',
  `ntime` datetime DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`nid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('4', '《灿烂的她》温暖催泪', '/upload/1709825600177.jpg', '<p style=\"text-indent:2em;\">\r\n	由惠英红、刘浩存领衔主演的温暖催泪亲情力作《灿烂的她》发布“用爱治愈”祖孙特辑及泪目版海报。奶奶江秀枝（惠英红 饰）与孙女徐嘉怡（刘浩存 饰）失散12年，经过漫长找寻后终于重逢。本以为两人可以回归平静温馨的生活时，奶奶却发现沉重的过往在嘉怡心中留下满是残酷与痛苦的灰暗记忆。在祖孙之间小心翼翼相处的过程中，奶奶用爱驱散嘉怡心中的阴霾，将她破碎的人生逐渐填满。祖孙两人“双向奔赴”彼此救赎的温情故事将于3月15日感动献映。\r\n</p>\r\n<p>\r\n	<img src=\"http://upload.mnw.cn/2024/0226/1708939406618.jpg\" border=\"0\" alt=\"《灿烂的她》温暖催泪 惠英红刘浩存对手戏触动人心\" style=\"height:auto;\" /> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	惠英红刘浩存对手戏彼此触动\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	情感共鸣默契配合诠释祖孙情\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	在特辑中，惠英红与刘浩存的首次搭档合作展现出默契十足的配合。镜头前，二人是久别重逢的祖孙，惠英红用饱满的情绪与精湛的表演勾勒出慈爱温暖又坚韧的奶奶形象，举手投足间都流露着对孙女的关心与爱护；刘浩存以充满细节的把控展现出孙女嘉怡从经历伤痛后充满防备到放下过去、鼓起勇气去拥抱生活的过程。\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	镜头后两人则亦师亦友，一场祖孙对话的对手戏中，惠英红饰演的奶奶询问面对刚刚回到家的嘉怡难以抑制住心中的激动，眼中噙满泪水，一句充满心痛与想念的“你为什么不回来找奶奶”让对戏的刘浩存内心被触动，不自觉地落泪抽泣，直言“我特别难受，看到你就想哭。”面对细节处理的请教，惠英红从“奶奶”变身“老师”，将自己的经验技巧毫无保留地告诉刘浩存。而在另一场对手戏中，刘浩存顺着角色的情绪与剧情发挥，一个亲吻奶奶额头的动作让惠英红眼眶湿润，夸赞她“这个动作演得好。”两人的情感共振与彼此触动将奶奶与嘉怡携手跨越黑暗迎来灿烂的祖孙亲情诠释得淋漓尽致。\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	祖孙以爱疗愈双向救赎\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	暖泪交织获赞抚慰人心\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	影片随特辑同步释出2张“泪目版”海报。海报中，奶奶江秀枝饱含泪水的双眼凝视着前方，眼神中既写满与孙女重逢的激动，也流露出对嘉怡曾备受生活折磨的心痛；而孙女嘉怡脸上有着大面积的伤口，代表着她过往令人心碎的经历，但嘉怡眼神中尽是坚定无畏，预示着她被奶奶的爱疗愈，产生出直面黑暗、跨越苦痛的勇气。\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	“用爱治愈”特辑中，展示出奶奶与嘉怡之间从稍显疏离到彼此依偎、双向救赎的过程，令许多网友动容，称：“真情如一缕阳光刺破黑暗，让祖孙两人心中枯萎的花重新绽放。”而惠英红与刘浩存两人亦师亦友的相处以及对角色的解读，不仅丰富了角色的厚度，也为祖孙亲情在温暖治愈之外，更增添一份轻松欢乐的气氛。不少看完特辑的网友直呼：“两位演员都太可爱了，好像真正的祖孙相处。”也有网友设想起奶奶与嘉怡在影片中的故事，表示：“祖孙俩在经历黑暗之后一定会迎来这样平静又幸福的生活。”\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	观众透过特辑释出的片段，体验奶奶与嘉怡相处的过程同时，也联想起自身与奶奶的相处，表示“近来被困难揉皱的心情，在这份欢笑与泪水中得到了抚慰”。\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	电影《灿烂的她》由徐亚辉监制，徐伟执导，张莉编剧，惠英红、刘浩存领衔主演，张子贤、刘欢、苇青、刘奕铁、胡宝森、廖银玥主演，葛四、鄂靖文特别出演，荣梓杉、余皑磊友情出演。影片将于3月15日全国上映。\r\n</p>', '2024-03-24 23:33:37');
INSERT INTO `news` VALUES ('5', '《被我弄丢的你》发布预告', '/upload/1709825639071.jpg', '<p style=\"text-indent:2em;\">\r\n	2月28日，电影《被我弄丢的你》发布“爱的苦衷”预告，围绕白晓宇与王斤斤的争吵展开。爱情之外，生活中的他们在各自的工作中有不同的境遇，也有不同的人生选择；天台上的谈话是苦闷的酝酿，走廊里爆发的争吵则是积压已久的情绪。白晓宇会再一次弄丢王斤斤吗？弄丢的人，我们敢不敢找回来？\r\n</p>\r\n<p>\r\n	<img src=\"http://upload.mnw.cn/2024/0228/1709120319872.jpg\" border=\"0\" alt=\"《被我弄丢的你》发布预告 檀健次张婧仪激烈争吵\" style=\"height:auto;\" /> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	预告中展示了男女主人公丰富的生活故事线。白晓宇的工作不尽如人意选择离职，而与此同时王斤斤在自己的职业发展上似乎迎来了新的转机。或许是出于压力，或许是出于为了“两个人共同的生活”的目标，白晓宇向王斤斤隐瞒了辞职计划。\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	王斤斤在饭局上意外得知白晓宇离职，一句“你现在是什么都不跟我讲了是吧”透露出她的失望，也道出了两人隐秘的分歧与走向的岔路。矛盾最终爆发，互相伤害的话语脱口而出，口不择言之后，两人的关系会面临怎样的转折？\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	影片同时发布了一张全新海报，展示了白晓宇和王斤斤二人面对分歧时内心的纠葛与苦痛。走廊窗口的沉默长久，裂痕却震耳欲聋。演员檀健次、张婧仪之间伤痛氛围感拉满，充满故事感的状态让观众对剧情产生无数联想。\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	电影《被我弄丢的你》由韩琰执导、郑执编剧，改编自郑执原著小说《被我弄丢两次的王斤斤》，檀健次、张婧仪领衔主演，蒋龙、刘恋主演，影片定档3月8日全国上映，预售现已全面开启。\r\n</p>', '2024-03-24 23:34:09');
INSERT INTO `news` VALUES ('6', '《热辣滚烫》北美3月8日上映', '/upload/1709825674213.jpg', '<p style=\"text-indent:2em;\">\r\n	由贾玲导演的新作《热辣滚烫》宣布北美定档，将于3月8日在选定影院上映。\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	据了解，索尼影业此前已购买《热辣滚烫》全球发行权，这是索尼影业首次不参与出品但购买全球发行权的影片，也是索尼影业时隔9年再次全球发行的国产影片。\r\n</p>\r\n<p>\r\n	<img src=\"http://upload.mnw.cn/2024/0303/1709436878465.jpg\" border=\"0\" alt=\"《热辣滚烫》北美3月8日上映 目前该片票房33.93亿元\" style=\"height:auto;\" />\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	《热辣滚烫》于2月10日在中国内地上映，灯塔专业版显示，目前该片票房33.93亿元。\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	该片翻拍自《百元之恋》，讲述一个脱离社会的“宅女”决定寻找新的人生，开始了拳击训练的故事。\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	贾玲表示，这部电影拍了整整一年，开机了五次，“我也成功减了100斤，并且练成了拳击手的样子。”\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	《热辣滚烫》由贾玲、雷佳音领衔主演，张小斐、赵海燕、张琪、许君聪、卜钰、朱天福、刘宏禄主演，杨紫、沙溢、魏翔、李雪琴、沈春阳、沈涛友情出演，马丽、乔杉特别出演。\r\n</p>', '2024-03-24 23:34:42');
INSERT INTO `news` VALUES ('7', '《周处除三害》电影连续三日斩获单日票房冠军', '/upload/1709825703980.jpg', '<p style=\"text-indent:2em;\">\r\n	日前，电影《周处除三害》发布“泪点高能”正片片段。片段中，陈桂林（阮经天 饰）与小美（王净饰）在监狱重逢，小美再一次为陈桂林剃须。这一次，生命即将走到终点的“猛男”陈桂林流下了饱含万千思绪的泪水，最后二人的相视一笑也为这场双向救赎之旅画下句号。\r\n</p>\r\n<p>\r\n	<img src=\"http://upload.mnw.cn/2024/0307/1709803122479.jpg\" border=\"0\" alt=\"《周处除三害》电影连续三日斩获单日票房冠军\" style=\"height:auto;\" /> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	《周处除三害》由黄精甫执导，阮经天、袁富华、陈以文、王净主演。影片讲述通缉犯陈桂林生命将尽，却发现自己在通缉榜上只排名第三，他决心查出前两名通缉犯的下落，并将他们一一除掉。陈桂林以为自己已成为当代的周处除三害，却没想到永远参不透的贪嗔痴，才是人生终要面对的罪与罚。\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	《周处除三害》于3月1日在中国内地院线上映，口碑不俗，豆瓣评分8.2。截至发稿，累计收获1.92亿元票房，并已连续三日斩获单日票房冠军。\r\n</p>', '2024-03-24 23:35:15');

-- ----------------------------
-- Table structure for `omore`
-- ----------------------------
DROP TABLE IF EXISTS `omore`;
CREATE TABLE `omore` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `oid` int(11) DEFAULT NULL COMMENT '订单编号',
  `sid` int(11) DEFAULT NULL COMMENT '座位编号',
  `pid` int(11) DEFAULT NULL COMMENT '计划ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of omore
-- ----------------------------
INSERT INTO `omore` VALUES ('4', '4', '366', '8');
INSERT INTO `omore` VALUES ('5', '4', '365', '8');
INSERT INTO `omore` VALUES ('6', '4', '367', '8');
INSERT INTO `omore` VALUES ('7', '4', '368', '8');
INSERT INTO `omore` VALUES ('8', '5', '115', '5');
INSERT INTO `omore` VALUES ('9', '5', '126', '5');
INSERT INTO `omore` VALUES ('10', '5', '116', '5');
INSERT INTO `omore` VALUES ('11', '6', '563', '10');
INSERT INTO `omore` VALUES ('12', '6', '564', '10');
INSERT INTO `omore` VALUES ('13', '6', '565', '10');
INSERT INTO `omore` VALUES ('14', '6', '562', '10');
INSERT INTO `omore` VALUES ('15', '7', '483', '10');
INSERT INTO `omore` VALUES ('16', '7', '484', '10');
INSERT INTO `omore` VALUES ('17', '8', '682', '11');
INSERT INTO `omore` VALUES ('18', '9', '439', '10');
INSERT INTO `omore` VALUES ('19', '9', '440', '10');
INSERT INTO `omore` VALUES ('20', '9', '441', '10');
INSERT INTO `omore` VALUES ('21', '9', '442', '10');
INSERT INTO `omore` VALUES ('22', '9', '443', '10');
INSERT INTO `omore` VALUES ('23', '9', '445', '10');
INSERT INTO `omore` VALUES ('24', '9', '444', '10');
INSERT INTO `omore` VALUES ('25', '9', '446', '10');
INSERT INTO `omore` VALUES ('26', '9', '447', '10');
INSERT INTO `omore` VALUES ('27', '9', '448', '10');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `mid` int(11) DEFAULT NULL COMMENT '影片',
  `rid` int(11) DEFAULT NULL COMMENT '放映厅',
  `rdate` varchar(50) DEFAULT NULL COMMENT '日期',
  `quan` int(11) DEFAULT NULL COMMENT '数量',
  `smoney` double DEFAULT '0' COMMENT '总金额',
  `meid` int(11) DEFAULT NULL COMMENT '用户id',
  `atime` datetime DEFAULT NULL COMMENT '购票时间',
  `ostext` varchar(500) DEFAULT NULL COMMENT '座位',
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('5', '4', '1', '2024-03-24', '3', '150', '6', '2024-03-24 17:49:10', '12排-5号,13排-6号,12排-6号', '5');
INSERT INTO `orders` VALUES ('6', '6', '3', '2024-03-24', '4', '212', '6', '2024-03-24 18:27:50', '13排-5号,13排-6号,13排-7号,13排-4号', '10');
INSERT INTO `orders` VALUES ('7', '6', '3', '2024-03-24', '2', '106', '6', '2024-03-24 18:28:22', '5排-5号,5排-6号', '10');
INSERT INTO `orders` VALUES ('8', '7', '4', '2024-03-25', '1', '60', '7', '2024-03-25 11:38:56', '10排-4号', '11');
INSERT INTO `orders` VALUES ('9', '6', '3', '2024-03-25', '10', '530', '7', '2024-03-25 11:45:37', '1排-1号,1排-2号,1排-3号,1排-4号,1排-5号,1排-7号,1排-6号,1排-8号,1排-9号,1排-10号', '10');

-- ----------------------------
-- Table structure for `plans`
-- ----------------------------
DROP TABLE IF EXISTS `plans`;
CREATE TABLE `plans` (
  `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `mid` int(11) DEFAULT NULL COMMENT '影片',
  `rid` int(11) DEFAULT NULL COMMENT '放映厅',
  `ptime` varchar(50) DEFAULT NULL COMMENT '时间',
  `banb` varchar(50) DEFAULT NULL COMMENT '版本',
  `price` double DEFAULT '0' COMMENT '价格',
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plans
-- ----------------------------
INSERT INTO `plans` VALUES ('4', '4', '1', '13:00', '2D', '50');
INSERT INTO `plans` VALUES ('5', '4', '1', '16:00:', '2D', '50');
INSERT INTO `plans` VALUES ('6', '4', '1', '20:00', '2D', '50');
INSERT INTO `plans` VALUES ('7', '5', '2', '13:30', '2D', '55');
INSERT INTO `plans` VALUES ('8', '5', '2', '19:10', '2D', '55');
INSERT INTO `plans` VALUES ('9', '6', '3', '15:00', '3D', '53');
INSERT INTO `plans` VALUES ('10', '6', '3', '17:40', '3D', '53');
INSERT INTO `plans` VALUES ('11', '7', '4', '17:20', '3D', '60');

-- ----------------------------
-- Table structure for `rooms`
-- ----------------------------
DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms` (
  `rid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `rname` varchar(50) DEFAULT NULL COMMENT '放映厅名称',
  PRIMARY KEY (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rooms
-- ----------------------------
INSERT INTO `rooms` VALUES ('1', '1号放映厅');
INSERT INTO `rooms` VALUES ('2', '2号放映厅');
INSERT INTO `rooms` VALUES ('3', '3号放映厅');
INSERT INTO `rooms` VALUES ('4', '4号放映厅');

-- ----------------------------
-- Table structure for `seats`
-- ----------------------------
DROP TABLE IF EXISTS `seats`;
CREATE TABLE `seats` (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `rid` int(11) DEFAULT NULL COMMENT '放映厅',
  `pai` int(11) DEFAULT NULL COMMENT '排',
  `hao` int(11) DEFAULT NULL COMMENT '号',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=739 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seats
-- ----------------------------
INSERT INTO `seats` VALUES ('1', '1', '1', '1');
INSERT INTO `seats` VALUES ('2', '1', '1', '2');
INSERT INTO `seats` VALUES ('3', '1', '1', '3');
INSERT INTO `seats` VALUES ('4', '1', '1', '4');
INSERT INTO `seats` VALUES ('5', '1', '1', '5');
INSERT INTO `seats` VALUES ('6', '1', '1', '6');
INSERT INTO `seats` VALUES ('7', '1', '1', '7');
INSERT INTO `seats` VALUES ('8', '1', '1', '8');
INSERT INTO `seats` VALUES ('9', '1', '1', '9');
INSERT INTO `seats` VALUES ('10', '1', '1', '10');
INSERT INTO `seats` VALUES ('11', '1', '2', '1');
INSERT INTO `seats` VALUES ('12', '1', '2', '2');
INSERT INTO `seats` VALUES ('13', '1', '2', '3');
INSERT INTO `seats` VALUES ('14', '1', '2', '4');
INSERT INTO `seats` VALUES ('15', '1', '2', '5');
INSERT INTO `seats` VALUES ('16', '1', '2', '6');
INSERT INTO `seats` VALUES ('17', '1', '2', '7');
INSERT INTO `seats` VALUES ('18', '1', '2', '8');
INSERT INTO `seats` VALUES ('19', '1', '2', '9');
INSERT INTO `seats` VALUES ('20', '1', '2', '10');
INSERT INTO `seats` VALUES ('21', '1', '3', '1');
INSERT INTO `seats` VALUES ('22', '1', '3', '2');
INSERT INTO `seats` VALUES ('23', '1', '3', '3');
INSERT INTO `seats` VALUES ('24', '1', '3', '4');
INSERT INTO `seats` VALUES ('25', '1', '3', '5');
INSERT INTO `seats` VALUES ('26', '1', '3', '6');
INSERT INTO `seats` VALUES ('27', '1', '3', '7');
INSERT INTO `seats` VALUES ('28', '1', '3', '8');
INSERT INTO `seats` VALUES ('29', '1', '3', '9');
INSERT INTO `seats` VALUES ('30', '1', '3', '10');
INSERT INTO `seats` VALUES ('31', '1', '4', '1');
INSERT INTO `seats` VALUES ('32', '1', '4', '2');
INSERT INTO `seats` VALUES ('33', '1', '4', '3');
INSERT INTO `seats` VALUES ('34', '1', '4', '4');
INSERT INTO `seats` VALUES ('35', '1', '4', '5');
INSERT INTO `seats` VALUES ('36', '1', '4', '6');
INSERT INTO `seats` VALUES ('37', '1', '4', '7');
INSERT INTO `seats` VALUES ('38', '1', '4', '8');
INSERT INTO `seats` VALUES ('39', '1', '4', '9');
INSERT INTO `seats` VALUES ('40', '1', '4', '10');
INSERT INTO `seats` VALUES ('41', '1', '5', '1');
INSERT INTO `seats` VALUES ('42', '1', '5', '2');
INSERT INTO `seats` VALUES ('43', '1', '5', '3');
INSERT INTO `seats` VALUES ('44', '1', '5', '4');
INSERT INTO `seats` VALUES ('45', '1', '5', '5');
INSERT INTO `seats` VALUES ('46', '1', '5', '6');
INSERT INTO `seats` VALUES ('47', '1', '5', '7');
INSERT INTO `seats` VALUES ('48', '1', '5', '8');
INSERT INTO `seats` VALUES ('49', '1', '5', '9');
INSERT INTO `seats` VALUES ('50', '1', '5', '10');
INSERT INTO `seats` VALUES ('51', '1', '6', '1');
INSERT INTO `seats` VALUES ('52', '1', '6', '2');
INSERT INTO `seats` VALUES ('53', '1', '6', '3');
INSERT INTO `seats` VALUES ('54', '1', '6', '4');
INSERT INTO `seats` VALUES ('55', '1', '6', '5');
INSERT INTO `seats` VALUES ('56', '1', '6', '6');
INSERT INTO `seats` VALUES ('57', '1', '6', '7');
INSERT INTO `seats` VALUES ('58', '1', '6', '8');
INSERT INTO `seats` VALUES ('59', '1', '6', '9');
INSERT INTO `seats` VALUES ('60', '1', '6', '10');
INSERT INTO `seats` VALUES ('61', '1', '7', '1');
INSERT INTO `seats` VALUES ('62', '1', '7', '2');
INSERT INTO `seats` VALUES ('63', '1', '7', '3');
INSERT INTO `seats` VALUES ('64', '1', '7', '4');
INSERT INTO `seats` VALUES ('65', '1', '7', '5');
INSERT INTO `seats` VALUES ('66', '1', '7', '6');
INSERT INTO `seats` VALUES ('67', '1', '7', '7');
INSERT INTO `seats` VALUES ('68', '1', '7', '8');
INSERT INTO `seats` VALUES ('69', '1', '7', '9');
INSERT INTO `seats` VALUES ('70', '1', '7', '10');
INSERT INTO `seats` VALUES ('71', '1', '8', '1');
INSERT INTO `seats` VALUES ('72', '1', '8', '2');
INSERT INTO `seats` VALUES ('73', '1', '8', '3');
INSERT INTO `seats` VALUES ('74', '1', '8', '4');
INSERT INTO `seats` VALUES ('75', '1', '8', '5');
INSERT INTO `seats` VALUES ('76', '1', '8', '6');
INSERT INTO `seats` VALUES ('77', '1', '8', '7');
INSERT INTO `seats` VALUES ('78', '1', '8', '8');
INSERT INTO `seats` VALUES ('79', '1', '8', '9');
INSERT INTO `seats` VALUES ('80', '1', '8', '10');
INSERT INTO `seats` VALUES ('81', '1', '9', '1');
INSERT INTO `seats` VALUES ('82', '1', '9', '2');
INSERT INTO `seats` VALUES ('83', '1', '9', '3');
INSERT INTO `seats` VALUES ('84', '1', '9', '4');
INSERT INTO `seats` VALUES ('85', '1', '9', '5');
INSERT INTO `seats` VALUES ('86', '1', '9', '6');
INSERT INTO `seats` VALUES ('87', '1', '9', '7');
INSERT INTO `seats` VALUES ('88', '1', '9', '8');
INSERT INTO `seats` VALUES ('89', '1', '9', '9');
INSERT INTO `seats` VALUES ('90', '1', '9', '10');
INSERT INTO `seats` VALUES ('91', '1', '10', '1');
INSERT INTO `seats` VALUES ('92', '1', '10', '2');
INSERT INTO `seats` VALUES ('93', '1', '10', '3');
INSERT INTO `seats` VALUES ('94', '1', '10', '4');
INSERT INTO `seats` VALUES ('95', '1', '10', '5');
INSERT INTO `seats` VALUES ('96', '1', '10', '6');
INSERT INTO `seats` VALUES ('97', '1', '10', '7');
INSERT INTO `seats` VALUES ('98', '1', '10', '8');
INSERT INTO `seats` VALUES ('99', '1', '10', '9');
INSERT INTO `seats` VALUES ('100', '1', '10', '10');
INSERT INTO `seats` VALUES ('101', '1', '11', '1');
INSERT INTO `seats` VALUES ('102', '1', '11', '2');
INSERT INTO `seats` VALUES ('103', '1', '11', '3');
INSERT INTO `seats` VALUES ('104', '1', '11', '4');
INSERT INTO `seats` VALUES ('105', '1', '11', '5');
INSERT INTO `seats` VALUES ('106', '1', '11', '6');
INSERT INTO `seats` VALUES ('107', '1', '11', '7');
INSERT INTO `seats` VALUES ('108', '1', '11', '8');
INSERT INTO `seats` VALUES ('109', '1', '11', '9');
INSERT INTO `seats` VALUES ('110', '1', '11', '10');
INSERT INTO `seats` VALUES ('111', '1', '12', '1');
INSERT INTO `seats` VALUES ('112', '1', '12', '2');
INSERT INTO `seats` VALUES ('113', '1', '12', '3');
INSERT INTO `seats` VALUES ('114', '1', '12', '4');
INSERT INTO `seats` VALUES ('115', '1', '12', '5');
INSERT INTO `seats` VALUES ('116', '1', '12', '6');
INSERT INTO `seats` VALUES ('117', '1', '12', '7');
INSERT INTO `seats` VALUES ('118', '1', '12', '8');
INSERT INTO `seats` VALUES ('119', '1', '12', '9');
INSERT INTO `seats` VALUES ('120', '1', '12', '10');
INSERT INTO `seats` VALUES ('121', '1', '13', '1');
INSERT INTO `seats` VALUES ('122', '1', '13', '2');
INSERT INTO `seats` VALUES ('123', '1', '13', '3');
INSERT INTO `seats` VALUES ('124', '1', '13', '4');
INSERT INTO `seats` VALUES ('125', '1', '13', '5');
INSERT INTO `seats` VALUES ('126', '1', '13', '6');
INSERT INTO `seats` VALUES ('127', '1', '13', '7');
INSERT INTO `seats` VALUES ('128', '1', '13', '8');
INSERT INTO `seats` VALUES ('129', '1', '13', '9');
INSERT INTO `seats` VALUES ('130', '1', '13', '10');
INSERT INTO `seats` VALUES ('131', '1', '14', '1');
INSERT INTO `seats` VALUES ('132', '1', '14', '2');
INSERT INTO `seats` VALUES ('133', '1', '14', '3');
INSERT INTO `seats` VALUES ('134', '1', '14', '4');
INSERT INTO `seats` VALUES ('135', '1', '14', '5');
INSERT INTO `seats` VALUES ('136', '1', '14', '6');
INSERT INTO `seats` VALUES ('137', '1', '14', '7');
INSERT INTO `seats` VALUES ('138', '1', '14', '8');
INSERT INTO `seats` VALUES ('139', '1', '14', '9');
INSERT INTO `seats` VALUES ('140', '1', '14', '10');
INSERT INTO `seats` VALUES ('141', '1', '15', '1');
INSERT INTO `seats` VALUES ('142', '1', '15', '2');
INSERT INTO `seats` VALUES ('143', '1', '15', '3');
INSERT INTO `seats` VALUES ('144', '1', '15', '4');
INSERT INTO `seats` VALUES ('145', '1', '15', '5');
INSERT INTO `seats` VALUES ('146', '1', '15', '6');
INSERT INTO `seats` VALUES ('147', '1', '15', '7');
INSERT INTO `seats` VALUES ('148', '1', '15', '8');
INSERT INTO `seats` VALUES ('149', '1', '15', '9');
INSERT INTO `seats` VALUES ('150', '1', '15', '10');
INSERT INTO `seats` VALUES ('151', '2', '1', '1');
INSERT INTO `seats` VALUES ('152', '2', '1', '2');
INSERT INTO `seats` VALUES ('153', '2', '1', '3');
INSERT INTO `seats` VALUES ('154', '2', '1', '4');
INSERT INTO `seats` VALUES ('155', '2', '1', '5');
INSERT INTO `seats` VALUES ('156', '2', '1', '6');
INSERT INTO `seats` VALUES ('157', '2', '1', '7');
INSERT INTO `seats` VALUES ('158', '2', '1', '8');
INSERT INTO `seats` VALUES ('159', '2', '1', '9');
INSERT INTO `seats` VALUES ('160', '2', '1', '10');
INSERT INTO `seats` VALUES ('161', '2', '1', '11');
INSERT INTO `seats` VALUES ('162', '2', '1', '12');
INSERT INTO `seats` VALUES ('163', '2', '1', '13');
INSERT INTO `seats` VALUES ('164', '2', '1', '14');
INSERT INTO `seats` VALUES ('165', '2', '1', '15');
INSERT INTO `seats` VALUES ('166', '2', '1', '16');
INSERT INTO `seats` VALUES ('167', '2', '2', '1');
INSERT INTO `seats` VALUES ('168', '2', '2', '2');
INSERT INTO `seats` VALUES ('169', '2', '2', '3');
INSERT INTO `seats` VALUES ('170', '2', '2', '4');
INSERT INTO `seats` VALUES ('171', '2', '2', '5');
INSERT INTO `seats` VALUES ('172', '2', '2', '6');
INSERT INTO `seats` VALUES ('173', '2', '2', '7');
INSERT INTO `seats` VALUES ('174', '2', '2', '8');
INSERT INTO `seats` VALUES ('175', '2', '2', '9');
INSERT INTO `seats` VALUES ('176', '2', '2', '10');
INSERT INTO `seats` VALUES ('177', '2', '2', '11');
INSERT INTO `seats` VALUES ('178', '2', '2', '12');
INSERT INTO `seats` VALUES ('179', '2', '2', '13');
INSERT INTO `seats` VALUES ('180', '2', '2', '14');
INSERT INTO `seats` VALUES ('181', '2', '2', '15');
INSERT INTO `seats` VALUES ('182', '2', '2', '16');
INSERT INTO `seats` VALUES ('183', '2', '3', '1');
INSERT INTO `seats` VALUES ('184', '2', '3', '2');
INSERT INTO `seats` VALUES ('185', '2', '3', '3');
INSERT INTO `seats` VALUES ('186', '2', '3', '4');
INSERT INTO `seats` VALUES ('187', '2', '3', '5');
INSERT INTO `seats` VALUES ('188', '2', '3', '6');
INSERT INTO `seats` VALUES ('189', '2', '3', '7');
INSERT INTO `seats` VALUES ('190', '2', '3', '8');
INSERT INTO `seats` VALUES ('191', '2', '3', '9');
INSERT INTO `seats` VALUES ('192', '2', '3', '10');
INSERT INTO `seats` VALUES ('193', '2', '3', '11');
INSERT INTO `seats` VALUES ('194', '2', '3', '12');
INSERT INTO `seats` VALUES ('195', '2', '3', '13');
INSERT INTO `seats` VALUES ('196', '2', '3', '14');
INSERT INTO `seats` VALUES ('197', '2', '3', '15');
INSERT INTO `seats` VALUES ('198', '2', '3', '16');
INSERT INTO `seats` VALUES ('199', '2', '4', '1');
INSERT INTO `seats` VALUES ('200', '2', '4', '2');
INSERT INTO `seats` VALUES ('201', '2', '4', '3');
INSERT INTO `seats` VALUES ('202', '2', '4', '4');
INSERT INTO `seats` VALUES ('203', '2', '4', '5');
INSERT INTO `seats` VALUES ('204', '2', '4', '6');
INSERT INTO `seats` VALUES ('205', '2', '4', '7');
INSERT INTO `seats` VALUES ('206', '2', '4', '8');
INSERT INTO `seats` VALUES ('207', '2', '4', '9');
INSERT INTO `seats` VALUES ('208', '2', '4', '10');
INSERT INTO `seats` VALUES ('209', '2', '4', '11');
INSERT INTO `seats` VALUES ('210', '2', '4', '12');
INSERT INTO `seats` VALUES ('211', '2', '4', '13');
INSERT INTO `seats` VALUES ('212', '2', '4', '14');
INSERT INTO `seats` VALUES ('213', '2', '4', '15');
INSERT INTO `seats` VALUES ('214', '2', '4', '16');
INSERT INTO `seats` VALUES ('215', '2', '5', '1');
INSERT INTO `seats` VALUES ('216', '2', '5', '2');
INSERT INTO `seats` VALUES ('217', '2', '5', '3');
INSERT INTO `seats` VALUES ('218', '2', '5', '4');
INSERT INTO `seats` VALUES ('219', '2', '5', '5');
INSERT INTO `seats` VALUES ('220', '2', '5', '6');
INSERT INTO `seats` VALUES ('221', '2', '5', '7');
INSERT INTO `seats` VALUES ('222', '2', '5', '8');
INSERT INTO `seats` VALUES ('223', '2', '5', '9');
INSERT INTO `seats` VALUES ('224', '2', '5', '10');
INSERT INTO `seats` VALUES ('225', '2', '5', '11');
INSERT INTO `seats` VALUES ('226', '2', '5', '12');
INSERT INTO `seats` VALUES ('227', '2', '5', '13');
INSERT INTO `seats` VALUES ('228', '2', '5', '14');
INSERT INTO `seats` VALUES ('229', '2', '5', '15');
INSERT INTO `seats` VALUES ('230', '2', '5', '16');
INSERT INTO `seats` VALUES ('231', '2', '6', '1');
INSERT INTO `seats` VALUES ('232', '2', '6', '2');
INSERT INTO `seats` VALUES ('233', '2', '6', '3');
INSERT INTO `seats` VALUES ('234', '2', '6', '4');
INSERT INTO `seats` VALUES ('235', '2', '6', '5');
INSERT INTO `seats` VALUES ('236', '2', '6', '6');
INSERT INTO `seats` VALUES ('237', '2', '6', '7');
INSERT INTO `seats` VALUES ('238', '2', '6', '8');
INSERT INTO `seats` VALUES ('239', '2', '6', '9');
INSERT INTO `seats` VALUES ('240', '2', '6', '10');
INSERT INTO `seats` VALUES ('241', '2', '6', '11');
INSERT INTO `seats` VALUES ('242', '2', '6', '12');
INSERT INTO `seats` VALUES ('243', '2', '6', '13');
INSERT INTO `seats` VALUES ('244', '2', '6', '14');
INSERT INTO `seats` VALUES ('245', '2', '6', '15');
INSERT INTO `seats` VALUES ('246', '2', '6', '16');
INSERT INTO `seats` VALUES ('247', '2', '7', '1');
INSERT INTO `seats` VALUES ('248', '2', '7', '2');
INSERT INTO `seats` VALUES ('249', '2', '7', '3');
INSERT INTO `seats` VALUES ('250', '2', '7', '4');
INSERT INTO `seats` VALUES ('251', '2', '7', '5');
INSERT INTO `seats` VALUES ('252', '2', '7', '6');
INSERT INTO `seats` VALUES ('253', '2', '7', '7');
INSERT INTO `seats` VALUES ('254', '2', '7', '8');
INSERT INTO `seats` VALUES ('255', '2', '7', '9');
INSERT INTO `seats` VALUES ('256', '2', '7', '10');
INSERT INTO `seats` VALUES ('257', '2', '7', '11');
INSERT INTO `seats` VALUES ('258', '2', '7', '12');
INSERT INTO `seats` VALUES ('259', '2', '7', '13');
INSERT INTO `seats` VALUES ('260', '2', '7', '14');
INSERT INTO `seats` VALUES ('261', '2', '7', '15');
INSERT INTO `seats` VALUES ('262', '2', '7', '16');
INSERT INTO `seats` VALUES ('263', '2', '8', '1');
INSERT INTO `seats` VALUES ('264', '2', '8', '2');
INSERT INTO `seats` VALUES ('265', '2', '8', '3');
INSERT INTO `seats` VALUES ('266', '2', '8', '4');
INSERT INTO `seats` VALUES ('267', '2', '8', '5');
INSERT INTO `seats` VALUES ('268', '2', '8', '6');
INSERT INTO `seats` VALUES ('269', '2', '8', '7');
INSERT INTO `seats` VALUES ('270', '2', '8', '8');
INSERT INTO `seats` VALUES ('271', '2', '8', '9');
INSERT INTO `seats` VALUES ('272', '2', '8', '10');
INSERT INTO `seats` VALUES ('273', '2', '8', '11');
INSERT INTO `seats` VALUES ('274', '2', '8', '12');
INSERT INTO `seats` VALUES ('275', '2', '8', '13');
INSERT INTO `seats` VALUES ('276', '2', '8', '14');
INSERT INTO `seats` VALUES ('277', '2', '8', '15');
INSERT INTO `seats` VALUES ('278', '2', '8', '16');
INSERT INTO `seats` VALUES ('279', '2', '9', '1');
INSERT INTO `seats` VALUES ('280', '2', '9', '2');
INSERT INTO `seats` VALUES ('281', '2', '9', '3');
INSERT INTO `seats` VALUES ('282', '2', '9', '4');
INSERT INTO `seats` VALUES ('283', '2', '9', '5');
INSERT INTO `seats` VALUES ('284', '2', '9', '6');
INSERT INTO `seats` VALUES ('285', '2', '9', '7');
INSERT INTO `seats` VALUES ('286', '2', '9', '8');
INSERT INTO `seats` VALUES ('287', '2', '9', '9');
INSERT INTO `seats` VALUES ('288', '2', '9', '10');
INSERT INTO `seats` VALUES ('289', '2', '9', '11');
INSERT INTO `seats` VALUES ('290', '2', '9', '12');
INSERT INTO `seats` VALUES ('291', '2', '9', '13');
INSERT INTO `seats` VALUES ('292', '2', '9', '14');
INSERT INTO `seats` VALUES ('293', '2', '9', '15');
INSERT INTO `seats` VALUES ('294', '2', '9', '16');
INSERT INTO `seats` VALUES ('295', '2', '10', '1');
INSERT INTO `seats` VALUES ('296', '2', '10', '2');
INSERT INTO `seats` VALUES ('297', '2', '10', '3');
INSERT INTO `seats` VALUES ('298', '2', '10', '4');
INSERT INTO `seats` VALUES ('299', '2', '10', '5');
INSERT INTO `seats` VALUES ('300', '2', '10', '6');
INSERT INTO `seats` VALUES ('301', '2', '10', '7');
INSERT INTO `seats` VALUES ('302', '2', '10', '8');
INSERT INTO `seats` VALUES ('303', '2', '10', '9');
INSERT INTO `seats` VALUES ('304', '2', '10', '10');
INSERT INTO `seats` VALUES ('305', '2', '10', '11');
INSERT INTO `seats` VALUES ('306', '2', '10', '12');
INSERT INTO `seats` VALUES ('307', '2', '10', '13');
INSERT INTO `seats` VALUES ('308', '2', '10', '14');
INSERT INTO `seats` VALUES ('309', '2', '10', '15');
INSERT INTO `seats` VALUES ('310', '2', '10', '16');
INSERT INTO `seats` VALUES ('311', '2', '11', '1');
INSERT INTO `seats` VALUES ('312', '2', '11', '2');
INSERT INTO `seats` VALUES ('313', '2', '11', '3');
INSERT INTO `seats` VALUES ('314', '2', '11', '4');
INSERT INTO `seats` VALUES ('315', '2', '11', '5');
INSERT INTO `seats` VALUES ('316', '2', '11', '6');
INSERT INTO `seats` VALUES ('317', '2', '11', '7');
INSERT INTO `seats` VALUES ('318', '2', '11', '8');
INSERT INTO `seats` VALUES ('319', '2', '11', '9');
INSERT INTO `seats` VALUES ('320', '2', '11', '10');
INSERT INTO `seats` VALUES ('321', '2', '11', '11');
INSERT INTO `seats` VALUES ('322', '2', '11', '12');
INSERT INTO `seats` VALUES ('323', '2', '11', '13');
INSERT INTO `seats` VALUES ('324', '2', '11', '14');
INSERT INTO `seats` VALUES ('325', '2', '11', '15');
INSERT INTO `seats` VALUES ('326', '2', '11', '16');
INSERT INTO `seats` VALUES ('327', '2', '12', '1');
INSERT INTO `seats` VALUES ('328', '2', '12', '2');
INSERT INTO `seats` VALUES ('329', '2', '12', '3');
INSERT INTO `seats` VALUES ('330', '2', '12', '4');
INSERT INTO `seats` VALUES ('331', '2', '12', '5');
INSERT INTO `seats` VALUES ('332', '2', '12', '6');
INSERT INTO `seats` VALUES ('333', '2', '12', '7');
INSERT INTO `seats` VALUES ('334', '2', '12', '8');
INSERT INTO `seats` VALUES ('335', '2', '12', '9');
INSERT INTO `seats` VALUES ('336', '2', '12', '10');
INSERT INTO `seats` VALUES ('337', '2', '12', '11');
INSERT INTO `seats` VALUES ('338', '2', '12', '12');
INSERT INTO `seats` VALUES ('339', '2', '12', '13');
INSERT INTO `seats` VALUES ('340', '2', '12', '14');
INSERT INTO `seats` VALUES ('341', '2', '12', '15');
INSERT INTO `seats` VALUES ('342', '2', '12', '16');
INSERT INTO `seats` VALUES ('343', '2', '13', '1');
INSERT INTO `seats` VALUES ('344', '2', '13', '2');
INSERT INTO `seats` VALUES ('345', '2', '13', '3');
INSERT INTO `seats` VALUES ('346', '2', '13', '4');
INSERT INTO `seats` VALUES ('347', '2', '13', '5');
INSERT INTO `seats` VALUES ('348', '2', '13', '6');
INSERT INTO `seats` VALUES ('349', '2', '13', '7');
INSERT INTO `seats` VALUES ('350', '2', '13', '8');
INSERT INTO `seats` VALUES ('351', '2', '13', '9');
INSERT INTO `seats` VALUES ('352', '2', '13', '10');
INSERT INTO `seats` VALUES ('353', '2', '13', '11');
INSERT INTO `seats` VALUES ('354', '2', '13', '12');
INSERT INTO `seats` VALUES ('355', '2', '13', '13');
INSERT INTO `seats` VALUES ('356', '2', '13', '14');
INSERT INTO `seats` VALUES ('357', '2', '13', '15');
INSERT INTO `seats` VALUES ('358', '2', '13', '16');
INSERT INTO `seats` VALUES ('359', '2', '14', '1');
INSERT INTO `seats` VALUES ('360', '2', '14', '2');
INSERT INTO `seats` VALUES ('361', '2', '14', '3');
INSERT INTO `seats` VALUES ('362', '2', '14', '4');
INSERT INTO `seats` VALUES ('363', '2', '14', '5');
INSERT INTO `seats` VALUES ('364', '2', '14', '6');
INSERT INTO `seats` VALUES ('365', '2', '14', '7');
INSERT INTO `seats` VALUES ('366', '2', '14', '8');
INSERT INTO `seats` VALUES ('367', '2', '14', '9');
INSERT INTO `seats` VALUES ('368', '2', '14', '10');
INSERT INTO `seats` VALUES ('369', '2', '14', '11');
INSERT INTO `seats` VALUES ('370', '2', '14', '12');
INSERT INTO `seats` VALUES ('371', '2', '14', '13');
INSERT INTO `seats` VALUES ('372', '2', '14', '14');
INSERT INTO `seats` VALUES ('373', '2', '14', '15');
INSERT INTO `seats` VALUES ('374', '2', '14', '16');
INSERT INTO `seats` VALUES ('375', '2', '15', '1');
INSERT INTO `seats` VALUES ('376', '2', '15', '2');
INSERT INTO `seats` VALUES ('377', '2', '15', '3');
INSERT INTO `seats` VALUES ('378', '2', '15', '4');
INSERT INTO `seats` VALUES ('379', '2', '15', '5');
INSERT INTO `seats` VALUES ('380', '2', '15', '6');
INSERT INTO `seats` VALUES ('381', '2', '15', '7');
INSERT INTO `seats` VALUES ('382', '2', '15', '8');
INSERT INTO `seats` VALUES ('383', '2', '15', '9');
INSERT INTO `seats` VALUES ('384', '2', '15', '10');
INSERT INTO `seats` VALUES ('385', '2', '15', '11');
INSERT INTO `seats` VALUES ('386', '2', '15', '12');
INSERT INTO `seats` VALUES ('387', '2', '15', '13');
INSERT INTO `seats` VALUES ('388', '2', '15', '14');
INSERT INTO `seats` VALUES ('389', '2', '15', '15');
INSERT INTO `seats` VALUES ('390', '2', '15', '16');
INSERT INTO `seats` VALUES ('391', '2', '16', '1');
INSERT INTO `seats` VALUES ('392', '2', '16', '2');
INSERT INTO `seats` VALUES ('393', '2', '16', '3');
INSERT INTO `seats` VALUES ('394', '2', '16', '4');
INSERT INTO `seats` VALUES ('395', '2', '16', '5');
INSERT INTO `seats` VALUES ('396', '2', '16', '6');
INSERT INTO `seats` VALUES ('397', '2', '16', '7');
INSERT INTO `seats` VALUES ('398', '2', '16', '8');
INSERT INTO `seats` VALUES ('399', '2', '16', '9');
INSERT INTO `seats` VALUES ('400', '2', '16', '10');
INSERT INTO `seats` VALUES ('401', '2', '16', '11');
INSERT INTO `seats` VALUES ('402', '2', '16', '12');
INSERT INTO `seats` VALUES ('403', '2', '16', '13');
INSERT INTO `seats` VALUES ('404', '2', '16', '14');
INSERT INTO `seats` VALUES ('405', '2', '16', '15');
INSERT INTO `seats` VALUES ('406', '2', '16', '16');
INSERT INTO `seats` VALUES ('407', '2', '17', '1');
INSERT INTO `seats` VALUES ('408', '2', '17', '2');
INSERT INTO `seats` VALUES ('409', '2', '17', '3');
INSERT INTO `seats` VALUES ('410', '2', '17', '4');
INSERT INTO `seats` VALUES ('411', '2', '17', '5');
INSERT INTO `seats` VALUES ('412', '2', '17', '6');
INSERT INTO `seats` VALUES ('413', '2', '17', '7');
INSERT INTO `seats` VALUES ('414', '2', '17', '8');
INSERT INTO `seats` VALUES ('415', '2', '17', '9');
INSERT INTO `seats` VALUES ('416', '2', '17', '10');
INSERT INTO `seats` VALUES ('417', '2', '17', '11');
INSERT INTO `seats` VALUES ('418', '2', '17', '12');
INSERT INTO `seats` VALUES ('419', '2', '17', '13');
INSERT INTO `seats` VALUES ('420', '2', '17', '14');
INSERT INTO `seats` VALUES ('421', '2', '17', '15');
INSERT INTO `seats` VALUES ('422', '2', '17', '16');
INSERT INTO `seats` VALUES ('423', '2', '18', '1');
INSERT INTO `seats` VALUES ('424', '2', '18', '2');
INSERT INTO `seats` VALUES ('425', '2', '18', '3');
INSERT INTO `seats` VALUES ('426', '2', '18', '4');
INSERT INTO `seats` VALUES ('427', '2', '18', '5');
INSERT INTO `seats` VALUES ('428', '2', '18', '6');
INSERT INTO `seats` VALUES ('429', '2', '18', '7');
INSERT INTO `seats` VALUES ('430', '2', '18', '8');
INSERT INTO `seats` VALUES ('431', '2', '18', '9');
INSERT INTO `seats` VALUES ('432', '2', '18', '10');
INSERT INTO `seats` VALUES ('433', '2', '18', '11');
INSERT INTO `seats` VALUES ('434', '2', '18', '12');
INSERT INTO `seats` VALUES ('435', '2', '18', '13');
INSERT INTO `seats` VALUES ('436', '2', '18', '14');
INSERT INTO `seats` VALUES ('437', '2', '18', '15');
INSERT INTO `seats` VALUES ('438', '2', '18', '16');
INSERT INTO `seats` VALUES ('439', '3', '1', '1');
INSERT INTO `seats` VALUES ('440', '3', '1', '2');
INSERT INTO `seats` VALUES ('441', '3', '1', '3');
INSERT INTO `seats` VALUES ('442', '3', '1', '4');
INSERT INTO `seats` VALUES ('443', '3', '1', '5');
INSERT INTO `seats` VALUES ('444', '3', '1', '6');
INSERT INTO `seats` VALUES ('445', '3', '1', '7');
INSERT INTO `seats` VALUES ('446', '3', '1', '8');
INSERT INTO `seats` VALUES ('447', '3', '1', '9');
INSERT INTO `seats` VALUES ('448', '3', '1', '10');
INSERT INTO `seats` VALUES ('449', '3', '2', '1');
INSERT INTO `seats` VALUES ('450', '3', '2', '2');
INSERT INTO `seats` VALUES ('451', '3', '2', '3');
INSERT INTO `seats` VALUES ('452', '3', '2', '4');
INSERT INTO `seats` VALUES ('453', '3', '2', '5');
INSERT INTO `seats` VALUES ('454', '3', '2', '6');
INSERT INTO `seats` VALUES ('455', '3', '2', '7');
INSERT INTO `seats` VALUES ('456', '3', '2', '8');
INSERT INTO `seats` VALUES ('457', '3', '2', '9');
INSERT INTO `seats` VALUES ('458', '3', '2', '10');
INSERT INTO `seats` VALUES ('459', '3', '3', '1');
INSERT INTO `seats` VALUES ('460', '3', '3', '2');
INSERT INTO `seats` VALUES ('461', '3', '3', '3');
INSERT INTO `seats` VALUES ('462', '3', '3', '4');
INSERT INTO `seats` VALUES ('463', '3', '3', '5');
INSERT INTO `seats` VALUES ('464', '3', '3', '6');
INSERT INTO `seats` VALUES ('465', '3', '3', '7');
INSERT INTO `seats` VALUES ('466', '3', '3', '8');
INSERT INTO `seats` VALUES ('467', '3', '3', '9');
INSERT INTO `seats` VALUES ('468', '3', '3', '10');
INSERT INTO `seats` VALUES ('469', '3', '4', '1');
INSERT INTO `seats` VALUES ('470', '3', '4', '2');
INSERT INTO `seats` VALUES ('471', '3', '4', '3');
INSERT INTO `seats` VALUES ('472', '3', '4', '4');
INSERT INTO `seats` VALUES ('473', '3', '4', '5');
INSERT INTO `seats` VALUES ('474', '3', '4', '6');
INSERT INTO `seats` VALUES ('475', '3', '4', '7');
INSERT INTO `seats` VALUES ('476', '3', '4', '8');
INSERT INTO `seats` VALUES ('477', '3', '4', '9');
INSERT INTO `seats` VALUES ('478', '3', '4', '10');
INSERT INTO `seats` VALUES ('479', '3', '5', '1');
INSERT INTO `seats` VALUES ('480', '3', '5', '2');
INSERT INTO `seats` VALUES ('481', '3', '5', '3');
INSERT INTO `seats` VALUES ('482', '3', '5', '4');
INSERT INTO `seats` VALUES ('483', '3', '5', '5');
INSERT INTO `seats` VALUES ('484', '3', '5', '6');
INSERT INTO `seats` VALUES ('485', '3', '5', '7');
INSERT INTO `seats` VALUES ('486', '3', '5', '8');
INSERT INTO `seats` VALUES ('487', '3', '5', '9');
INSERT INTO `seats` VALUES ('488', '3', '5', '10');
INSERT INTO `seats` VALUES ('489', '3', '6', '1');
INSERT INTO `seats` VALUES ('490', '3', '6', '2');
INSERT INTO `seats` VALUES ('491', '3', '6', '3');
INSERT INTO `seats` VALUES ('492', '3', '6', '4');
INSERT INTO `seats` VALUES ('493', '3', '6', '5');
INSERT INTO `seats` VALUES ('494', '3', '6', '6');
INSERT INTO `seats` VALUES ('495', '3', '6', '7');
INSERT INTO `seats` VALUES ('496', '3', '6', '8');
INSERT INTO `seats` VALUES ('497', '3', '6', '9');
INSERT INTO `seats` VALUES ('498', '3', '6', '10');
INSERT INTO `seats` VALUES ('499', '3', '7', '1');
INSERT INTO `seats` VALUES ('500', '3', '7', '2');
INSERT INTO `seats` VALUES ('501', '3', '7', '3');
INSERT INTO `seats` VALUES ('502', '3', '7', '4');
INSERT INTO `seats` VALUES ('503', '3', '7', '5');
INSERT INTO `seats` VALUES ('504', '3', '7', '6');
INSERT INTO `seats` VALUES ('505', '3', '7', '7');
INSERT INTO `seats` VALUES ('506', '3', '7', '8');
INSERT INTO `seats` VALUES ('507', '3', '7', '9');
INSERT INTO `seats` VALUES ('508', '3', '7', '10');
INSERT INTO `seats` VALUES ('509', '3', '8', '1');
INSERT INTO `seats` VALUES ('510', '3', '8', '2');
INSERT INTO `seats` VALUES ('511', '3', '8', '3');
INSERT INTO `seats` VALUES ('512', '3', '8', '4');
INSERT INTO `seats` VALUES ('513', '3', '8', '5');
INSERT INTO `seats` VALUES ('514', '3', '8', '6');
INSERT INTO `seats` VALUES ('515', '3', '8', '7');
INSERT INTO `seats` VALUES ('516', '3', '8', '8');
INSERT INTO `seats` VALUES ('517', '3', '8', '9');
INSERT INTO `seats` VALUES ('518', '3', '8', '10');
INSERT INTO `seats` VALUES ('519', '3', '9', '1');
INSERT INTO `seats` VALUES ('520', '3', '9', '2');
INSERT INTO `seats` VALUES ('521', '3', '9', '3');
INSERT INTO `seats` VALUES ('522', '3', '9', '4');
INSERT INTO `seats` VALUES ('523', '3', '9', '5');
INSERT INTO `seats` VALUES ('524', '3', '9', '6');
INSERT INTO `seats` VALUES ('525', '3', '9', '7');
INSERT INTO `seats` VALUES ('526', '3', '9', '8');
INSERT INTO `seats` VALUES ('527', '3', '9', '9');
INSERT INTO `seats` VALUES ('528', '3', '9', '10');
INSERT INTO `seats` VALUES ('529', '3', '10', '1');
INSERT INTO `seats` VALUES ('530', '3', '10', '2');
INSERT INTO `seats` VALUES ('531', '3', '10', '3');
INSERT INTO `seats` VALUES ('532', '3', '10', '4');
INSERT INTO `seats` VALUES ('533', '3', '10', '5');
INSERT INTO `seats` VALUES ('534', '3', '10', '6');
INSERT INTO `seats` VALUES ('535', '3', '10', '7');
INSERT INTO `seats` VALUES ('536', '3', '10', '8');
INSERT INTO `seats` VALUES ('537', '3', '10', '9');
INSERT INTO `seats` VALUES ('538', '3', '10', '10');
INSERT INTO `seats` VALUES ('539', '3', '11', '1');
INSERT INTO `seats` VALUES ('540', '3', '11', '2');
INSERT INTO `seats` VALUES ('541', '3', '11', '3');
INSERT INTO `seats` VALUES ('542', '3', '11', '4');
INSERT INTO `seats` VALUES ('543', '3', '11', '5');
INSERT INTO `seats` VALUES ('544', '3', '11', '6');
INSERT INTO `seats` VALUES ('545', '3', '11', '7');
INSERT INTO `seats` VALUES ('546', '3', '11', '8');
INSERT INTO `seats` VALUES ('547', '3', '11', '9');
INSERT INTO `seats` VALUES ('548', '3', '11', '10');
INSERT INTO `seats` VALUES ('549', '3', '12', '1');
INSERT INTO `seats` VALUES ('550', '3', '12', '2');
INSERT INTO `seats` VALUES ('551', '3', '12', '3');
INSERT INTO `seats` VALUES ('552', '3', '12', '4');
INSERT INTO `seats` VALUES ('553', '3', '12', '5');
INSERT INTO `seats` VALUES ('554', '3', '12', '6');
INSERT INTO `seats` VALUES ('555', '3', '12', '7');
INSERT INTO `seats` VALUES ('556', '3', '12', '8');
INSERT INTO `seats` VALUES ('557', '3', '12', '9');
INSERT INTO `seats` VALUES ('558', '3', '12', '10');
INSERT INTO `seats` VALUES ('559', '3', '13', '1');
INSERT INTO `seats` VALUES ('560', '3', '13', '2');
INSERT INTO `seats` VALUES ('561', '3', '13', '3');
INSERT INTO `seats` VALUES ('562', '3', '13', '4');
INSERT INTO `seats` VALUES ('563', '3', '13', '5');
INSERT INTO `seats` VALUES ('564', '3', '13', '6');
INSERT INTO `seats` VALUES ('565', '3', '13', '7');
INSERT INTO `seats` VALUES ('566', '3', '13', '8');
INSERT INTO `seats` VALUES ('567', '3', '13', '9');
INSERT INTO `seats` VALUES ('568', '3', '13', '10');
INSERT INTO `seats` VALUES ('569', '3', '14', '1');
INSERT INTO `seats` VALUES ('570', '3', '14', '2');
INSERT INTO `seats` VALUES ('571', '3', '14', '3');
INSERT INTO `seats` VALUES ('572', '3', '14', '4');
INSERT INTO `seats` VALUES ('573', '3', '14', '5');
INSERT INTO `seats` VALUES ('574', '3', '14', '6');
INSERT INTO `seats` VALUES ('575', '3', '14', '7');
INSERT INTO `seats` VALUES ('576', '3', '14', '8');
INSERT INTO `seats` VALUES ('577', '3', '14', '9');
INSERT INTO `seats` VALUES ('578', '3', '14', '10');
INSERT INTO `seats` VALUES ('579', '3', '15', '1');
INSERT INTO `seats` VALUES ('580', '3', '15', '2');
INSERT INTO `seats` VALUES ('581', '3', '15', '3');
INSERT INTO `seats` VALUES ('582', '3', '15', '4');
INSERT INTO `seats` VALUES ('583', '3', '15', '5');
INSERT INTO `seats` VALUES ('584', '3', '15', '6');
INSERT INTO `seats` VALUES ('585', '3', '15', '7');
INSERT INTO `seats` VALUES ('586', '3', '15', '8');
INSERT INTO `seats` VALUES ('587', '3', '15', '9');
INSERT INTO `seats` VALUES ('588', '3', '15', '10');
INSERT INTO `seats` VALUES ('589', '4', '1', '1');
INSERT INTO `seats` VALUES ('590', '4', '1', '2');
INSERT INTO `seats` VALUES ('591', '4', '1', '3');
INSERT INTO `seats` VALUES ('592', '4', '1', '4');
INSERT INTO `seats` VALUES ('593', '4', '1', '5');
INSERT INTO `seats` VALUES ('594', '4', '1', '6');
INSERT INTO `seats` VALUES ('595', '4', '1', '7');
INSERT INTO `seats` VALUES ('596', '4', '1', '8');
INSERT INTO `seats` VALUES ('597', '4', '1', '9');
INSERT INTO `seats` VALUES ('598', '4', '1', '10');
INSERT INTO `seats` VALUES ('599', '4', '2', '1');
INSERT INTO `seats` VALUES ('600', '4', '2', '2');
INSERT INTO `seats` VALUES ('601', '4', '2', '3');
INSERT INTO `seats` VALUES ('602', '4', '2', '4');
INSERT INTO `seats` VALUES ('603', '4', '2', '5');
INSERT INTO `seats` VALUES ('604', '4', '2', '6');
INSERT INTO `seats` VALUES ('605', '4', '2', '7');
INSERT INTO `seats` VALUES ('606', '4', '2', '8');
INSERT INTO `seats` VALUES ('607', '4', '2', '9');
INSERT INTO `seats` VALUES ('608', '4', '2', '10');
INSERT INTO `seats` VALUES ('609', '4', '3', '1');
INSERT INTO `seats` VALUES ('610', '4', '3', '2');
INSERT INTO `seats` VALUES ('611', '4', '3', '3');
INSERT INTO `seats` VALUES ('612', '4', '3', '4');
INSERT INTO `seats` VALUES ('613', '4', '3', '5');
INSERT INTO `seats` VALUES ('614', '4', '3', '6');
INSERT INTO `seats` VALUES ('615', '4', '3', '7');
INSERT INTO `seats` VALUES ('616', '4', '3', '8');
INSERT INTO `seats` VALUES ('617', '4', '3', '9');
INSERT INTO `seats` VALUES ('618', '4', '3', '10');
INSERT INTO `seats` VALUES ('619', '4', '4', '1');
INSERT INTO `seats` VALUES ('620', '4', '4', '2');
INSERT INTO `seats` VALUES ('621', '4', '4', '3');
INSERT INTO `seats` VALUES ('622', '4', '4', '4');
INSERT INTO `seats` VALUES ('623', '4', '4', '5');
INSERT INTO `seats` VALUES ('624', '4', '4', '6');
INSERT INTO `seats` VALUES ('625', '4', '4', '7');
INSERT INTO `seats` VALUES ('626', '4', '4', '8');
INSERT INTO `seats` VALUES ('627', '4', '4', '9');
INSERT INTO `seats` VALUES ('628', '4', '4', '10');
INSERT INTO `seats` VALUES ('629', '4', '5', '1');
INSERT INTO `seats` VALUES ('630', '4', '5', '2');
INSERT INTO `seats` VALUES ('631', '4', '5', '3');
INSERT INTO `seats` VALUES ('632', '4', '5', '4');
INSERT INTO `seats` VALUES ('633', '4', '5', '5');
INSERT INTO `seats` VALUES ('634', '4', '5', '6');
INSERT INTO `seats` VALUES ('635', '4', '5', '7');
INSERT INTO `seats` VALUES ('636', '4', '5', '8');
INSERT INTO `seats` VALUES ('637', '4', '5', '9');
INSERT INTO `seats` VALUES ('638', '4', '5', '10');
INSERT INTO `seats` VALUES ('639', '4', '6', '1');
INSERT INTO `seats` VALUES ('640', '4', '6', '2');
INSERT INTO `seats` VALUES ('641', '4', '6', '3');
INSERT INTO `seats` VALUES ('642', '4', '6', '4');
INSERT INTO `seats` VALUES ('643', '4', '6', '5');
INSERT INTO `seats` VALUES ('644', '4', '6', '6');
INSERT INTO `seats` VALUES ('645', '4', '6', '7');
INSERT INTO `seats` VALUES ('646', '4', '6', '8');
INSERT INTO `seats` VALUES ('647', '4', '6', '9');
INSERT INTO `seats` VALUES ('648', '4', '6', '10');
INSERT INTO `seats` VALUES ('649', '4', '7', '1');
INSERT INTO `seats` VALUES ('650', '4', '7', '2');
INSERT INTO `seats` VALUES ('651', '4', '7', '3');
INSERT INTO `seats` VALUES ('652', '4', '7', '4');
INSERT INTO `seats` VALUES ('653', '4', '7', '5');
INSERT INTO `seats` VALUES ('654', '4', '7', '6');
INSERT INTO `seats` VALUES ('655', '4', '7', '7');
INSERT INTO `seats` VALUES ('656', '4', '7', '8');
INSERT INTO `seats` VALUES ('657', '4', '7', '9');
INSERT INTO `seats` VALUES ('658', '4', '7', '10');
INSERT INTO `seats` VALUES ('659', '4', '8', '1');
INSERT INTO `seats` VALUES ('660', '4', '8', '2');
INSERT INTO `seats` VALUES ('661', '4', '8', '3');
INSERT INTO `seats` VALUES ('662', '4', '8', '4');
INSERT INTO `seats` VALUES ('663', '4', '8', '5');
INSERT INTO `seats` VALUES ('664', '4', '8', '6');
INSERT INTO `seats` VALUES ('665', '4', '8', '7');
INSERT INTO `seats` VALUES ('666', '4', '8', '8');
INSERT INTO `seats` VALUES ('667', '4', '8', '9');
INSERT INTO `seats` VALUES ('668', '4', '8', '10');
INSERT INTO `seats` VALUES ('669', '4', '9', '1');
INSERT INTO `seats` VALUES ('670', '4', '9', '2');
INSERT INTO `seats` VALUES ('671', '4', '9', '3');
INSERT INTO `seats` VALUES ('672', '4', '9', '4');
INSERT INTO `seats` VALUES ('673', '4', '9', '5');
INSERT INTO `seats` VALUES ('674', '4', '9', '6');
INSERT INTO `seats` VALUES ('675', '4', '9', '7');
INSERT INTO `seats` VALUES ('676', '4', '9', '8');
INSERT INTO `seats` VALUES ('677', '4', '9', '9');
INSERT INTO `seats` VALUES ('678', '4', '9', '10');
INSERT INTO `seats` VALUES ('679', '4', '10', '1');
INSERT INTO `seats` VALUES ('680', '4', '10', '2');
INSERT INTO `seats` VALUES ('681', '4', '10', '3');
INSERT INTO `seats` VALUES ('682', '4', '10', '4');
INSERT INTO `seats` VALUES ('683', '4', '10', '5');
INSERT INTO `seats` VALUES ('684', '4', '10', '6');
INSERT INTO `seats` VALUES ('685', '4', '10', '7');
INSERT INTO `seats` VALUES ('686', '4', '10', '8');
INSERT INTO `seats` VALUES ('687', '4', '10', '9');
INSERT INTO `seats` VALUES ('688', '4', '10', '10');
INSERT INTO `seats` VALUES ('689', '4', '11', '1');
INSERT INTO `seats` VALUES ('690', '4', '11', '2');
INSERT INTO `seats` VALUES ('691', '4', '11', '3');
INSERT INTO `seats` VALUES ('692', '4', '11', '4');
INSERT INTO `seats` VALUES ('693', '4', '11', '5');
INSERT INTO `seats` VALUES ('694', '4', '11', '6');
INSERT INTO `seats` VALUES ('695', '4', '11', '7');
INSERT INTO `seats` VALUES ('696', '4', '11', '8');
INSERT INTO `seats` VALUES ('697', '4', '11', '9');
INSERT INTO `seats` VALUES ('698', '4', '11', '10');
INSERT INTO `seats` VALUES ('699', '4', '12', '1');
INSERT INTO `seats` VALUES ('700', '4', '12', '2');
INSERT INTO `seats` VALUES ('701', '4', '12', '3');
INSERT INTO `seats` VALUES ('702', '4', '12', '4');
INSERT INTO `seats` VALUES ('703', '4', '12', '5');
INSERT INTO `seats` VALUES ('704', '4', '12', '6');
INSERT INTO `seats` VALUES ('705', '4', '12', '7');
INSERT INTO `seats` VALUES ('706', '4', '12', '8');
INSERT INTO `seats` VALUES ('707', '4', '12', '9');
INSERT INTO `seats` VALUES ('708', '4', '12', '10');
INSERT INTO `seats` VALUES ('709', '4', '13', '1');
INSERT INTO `seats` VALUES ('710', '4', '13', '2');
INSERT INTO `seats` VALUES ('711', '4', '13', '3');
INSERT INTO `seats` VALUES ('712', '4', '13', '4');
INSERT INTO `seats` VALUES ('713', '4', '13', '5');
INSERT INTO `seats` VALUES ('714', '4', '13', '6');
INSERT INTO `seats` VALUES ('715', '4', '13', '7');
INSERT INTO `seats` VALUES ('716', '4', '13', '8');
INSERT INTO `seats` VALUES ('717', '4', '13', '9');
INSERT INTO `seats` VALUES ('718', '4', '13', '10');
INSERT INTO `seats` VALUES ('719', '4', '14', '1');
INSERT INTO `seats` VALUES ('720', '4', '14', '2');
INSERT INTO `seats` VALUES ('721', '4', '14', '3');
INSERT INTO `seats` VALUES ('722', '4', '14', '4');
INSERT INTO `seats` VALUES ('723', '4', '14', '5');
INSERT INTO `seats` VALUES ('724', '4', '14', '6');
INSERT INTO `seats` VALUES ('725', '4', '14', '7');
INSERT INTO `seats` VALUES ('726', '4', '14', '8');
INSERT INTO `seats` VALUES ('727', '4', '14', '9');
INSERT INTO `seats` VALUES ('728', '4', '14', '10');
INSERT INTO `seats` VALUES ('729', '4', '15', '1');
INSERT INTO `seats` VALUES ('730', '4', '15', '2');
INSERT INTO `seats` VALUES ('731', '4', '15', '3');
INSERT INTO `seats` VALUES ('732', '4', '15', '4');
INSERT INTO `seats` VALUES ('733', '4', '15', '5');
INSERT INTO `seats` VALUES ('734', '4', '15', '6');
INSERT INTO `seats` VALUES ('735', '4', '15', '7');
INSERT INTO `seats` VALUES ('736', '4', '15', '8');
INSERT INTO `seats` VALUES ('737', '4', '15', '9');
INSERT INTO `seats` VALUES ('738', '4', '15', '10');
