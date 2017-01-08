create database zhiye;
use zhiye;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: zhiye
-- ------------------------------------------------------
-- Server version	5.7.11-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL COMMENT '回复的评论id(可为空)',
  `question_id` int(11) NOT NULL COMMENT '回答的问题id',
  `author_id` int(11) NOT NULL COMMENT '回答者id',
  `author_name` varchar(20) NOT NULL COMMENT '回答者昵称(不变)',
  `reply_id` int(11) DEFAULT NULL COMMENT '回复者id',
  `reply_name` varchar(20) DEFAULT NULL COMMENT '回复者昵称',
  `thread` varchar(255) NOT NULL DEFAULT '/' COMMENT '用于表示嵌套关系',
  `summary` varchar(255) NOT NULL COMMENT '回答内容摘要',
  `time` datetime NOT NULL COMMENT '回答时间',
  `num_of_support` int(11) NOT NULL DEFAULT '0' COMMENT '点赞人数',
  `num_of_answer` int(11) NOT NULL DEFAULT '0' COMMENT '评论人数',
  `type` int(1) NOT NULL DEFAULT '0' COMMENT '内容长度是否大于255，默认为不大于（0）',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `question_id` (`question_id`),
  KEY `author_id` (`author_id`),
  KEY `reply_id` (`reply_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comment_ibfk_4` FOREIGN KEY (`reply_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,NULL,2,2,'小明',NULL,NULL,'/','上周就看到了这个问题，一直想答却欲言又止，趁着今天周末外面下雪，继续答答。\n----------------------\n到了这个阶段应该怎么继续学下去呢，是我基础知识不足的问题吗？\n关于基础知识 @寇云已经回答了，去年有幸和寇云一起分享前端技术，寇大大对于前端的认识是非常深刻的，我再狗尾续貂一下。\n\n你说到“各种配置命令行根本看不懂，仿佛到了另一个世界”，又说道：“这些不敢说精通，但也熟练掌握，','2017-01-08 15:39:16',3,3,1),(3,1,2,3,'小红',2,'小明','/1/','有道理','2017-01-08 15:42:51',0,0,0),(4,NULL,2,3,'小红',NULL,NULL,'/','我刚看的时候我也懵逼，你不是一个人。但是看着看着就不懵逼了，同理这样的人也不是一个人。\n\n年轻的时候多掌握学习方法和自学技巧，老了才不怕老本不够吃。','2017-01-08 15:43:17',2,1,0),(5,NULL,3,3,'小红',NULL,NULL,'/','谢熊猫君翻译的那篇文章主要是把库兹韦尔的《奇点临近》阐述了一遍，这本书我看过，是科普预言性质的，当作科幻小说看也不为过。如果他预言对了，自然很厉害，如果预言不对那也无可厚非。真正的人工智能的研究还得看那些巨头公司谷歌脸书微软以及百度，还有顶级高校斯坦福麻省牛津哈佛等，真正的发明发现一定是由实践者主导的，而不是预言家。\n\n如果大家对库兹韦尔感兴趣，可以看他的个人网站Kurzweil Accelera','2017-01-08 15:44:41',1,1,1),(6,NULL,4,3,'小红',NULL,NULL,'/','我们也是','2017-01-08 15:45:08',0,0,0),(7,1,2,4,'小伟',2,'小明','/1/','同意','2017-01-08 15:46:34',0,0,0),(8,3,2,4,'小伟',3,'小红','/1/3/','good','2017-01-08 15:47:01',0,0,0),(9,NULL,3,4,'小伟',NULL,NULL,'/','作者：Summer Clover\n链接：https://www.zhihu.com/question/28024550/answer/39334994\n来源：知乎\n著作权归作者所有，转载请联系作者获得授权。\n\n的评价：论据不堪一击，结论却言之凿凿。读起来的感觉就是一篇以煽动为目的的文章。\n\n我十分怀疑这篇文章的原作者并不真的关心他的结论对不对，而只关心这种言论给他带来的利益有多少。\n（甚至可能只是','2017-01-08 15:48:24',0,0,1),(10,5,3,4,'小伟',3,'小红','/5/','可以的。','2017-01-08 15:49:07',0,0,0),(11,4,2,4,'小伟',3,'小红','/4/','说的好','2017-01-08 15:51:55',1,0,0),(12,NULL,2,1,'dragon',NULL,NULL,'/','我是14年末开始接触前端，之前一直是windows下的java，没用过linux，没用过命令行。连rm命令都不知道。\n\n14年末我实习完到了一家公司，呆了半个月，居然没事做。然后我就开始了前端自动化之旅，当时是grunt.js走向没落，gulp新型崛起，webpack还在萌芽，backbone和angular让前端的人重新认识了前端。14年，可以说是前端快速发展的一年。而当时，ES6标准并没有定下','2017-01-08 15:53:21',1,0,1),(13,NULL,4,1,'dragon',NULL,NULL,'/','我老家的人根本不知道我是程序员，他们还以为我是造激光炮的。。。我丈人每次见到我都会问：你们激光炮做好了没？未来跟美日必有一战你们要努力啊！（老丈人退伍前是大校，北海机场就他修的，听说了我的工作就拍板把女儿嫁了，要不然就我这收入他真是看不上）\n每次我都不好意思的回答：在努力，在努力。。。\n\n他要是知道我一心扑在做游戏上不知道会不会打我。。。','2017-01-08 15:55:07',0,0,0);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_content`
--

DROP TABLE IF EXISTS `comment_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `content` text COMMENT '回答内容',
  PRIMARY KEY (`id`),
  KEY `comment_id` (`comment_id`),
  CONSTRAINT `comment_content_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_content`
--

LOCK TABLES `comment_content` WRITE;
/*!40000 ALTER TABLE `comment_content` DISABLE KEYS */;
INSERT INTO `comment_content` VALUES (1,1,'上周就看到了这个问题，一直想答却欲言又止，趁着今天周末外面下雪，继续答答。\n----------------------\n到了这个阶段应该怎么继续学下去呢，是我基础知识不足的问题吗？\n关于基础知识 @寇云已经回答了，去年有幸和寇云一起分享前端技术，寇大大对于前端的认识是非常深刻的，我再狗尾续貂一下。\n\n你说到“各种配置命令行根本看不懂，仿佛到了另一个世界”，又说道：“这些不敢说精通，但也熟练掌握，项目也做了不少”。这也是很多前端初学者的一个常态吧。\n\n造成这种现象的原因有一种就是，大部分人觉得前端简单，入门容易，开箱即用。而前端也一直由非程序员（非贬义）来完成。可以回想一下你写的第一个 C 语言，第一个 Java 语言是怎么编译运行起来的。\n\n我们可以拿后端做对比。后端语言鄙视链的最底层应该算是 PHP 了吧，巧合的是 PHP 和 javascript 一样也是一种脚本语言，入门容易，开箱即用。当 composer 等构建工具出现后，大部分 PHP 程序员也觉得仿佛到了另一个世界。\n\n\n究其原因，这些“程序员”（我加了引号，因为在我的评价体系中，这些人中大部分不能称之为真正的程序员）中，大部分都是在“写代码”，而不是“编程序”，更不是“做软件”。他们喜欢使用 jquery，bootstrap，但是当他们真正遇到工业界生产力框架react时，就进入了另一个世界，另一个陌生的世界。\n\n唯有进入这个世界，才能成为前端工程师，因为这个世界是前端现代化的世界，前端工程化的世界，是前端工业化的世界。\n\n我们可以网购一个几百块前的家用面包机，操作简单，甚至不用看说明书，就可以每天早上做可口的面包。但是，这么简单易用的面包机，即使你买几百个，也无法开一个面包工厂。而真正工厂使用的面包机器要比这个难用几十几百倍，以至于聘用的面包工人都要经过特殊的上岗培训才能正确操作。为什么工厂不使用简单易用的家用面包机呢？\n\n言归正传，你才大二，你学前端才大半年，前端对于你来说，就像一个家用面包机，甚至前端只是乐高积木，你可以使用它搭建高楼或城堡，俨然你自己就是个小小工程师。但是你却建不出真正的高楼大厦，甚至搭一个狗窝都会不尽人意。\n\n对于工程化的定义：\n软件工程是一门研究用工程化方法构建和维护有效的、实用的和高质量的软件的学科。\n而前端工程化的第一步就是构建，自动化构建。如果你看过一些性能优化的知识就会知道有一条是减少请求数据的大小，对 js 和 css 文件进行压缩，一般初学者大概都是这么完成的：百度一下在线压缩，如果是一个用心的初学者就会把这个链接加入收藏夹，然后把代码 copy 过去，压缩，压缩完成后再 copy 回来。第一个问题来了，copy 回来的压缩完的代码，不能覆盖之前的文件，因为以后需要修改的时候，还得在未压缩的文件中修改，只能复制出来一份，命名为 name.min.js，之前 html 都是引入的为压缩版，还得去查找替换，把 name.js 换成 name.min.js。而这一整套工作，都应该交给工具去完成，而且还得是自动完成。\n\n除了打包构建、还有部署、平滑的升级、静态资源管理、代码规范、性能……\n\n所以走出自己的舒适区，去学习新的技能和知识，探索新的世界。'),(2,5,'谢熊猫君翻译的那篇文章主要是把库兹韦尔的《奇点临近》阐述了一遍，这本书我看过，是科普预言性质的，当作科幻小说看也不为过。如果他预言对了，自然很厉害，如果预言不对那也无可厚非。真正的人工智能的研究还得看那些巨头公司谷歌脸书微软以及百度，还有顶级高校斯坦福麻省牛津哈佛等，真正的发明发现一定是由实践者主导的，而不是预言家。\n\n如果大家对库兹韦尔感兴趣，可以看他的个人网站Kurzweil Accelerating Intelligence\n\n如果更想知道学术界和工业界的进展，可以在这个网站上看到点端倪FLI - Future of Life Institute，这个网站的发起人有大学教授、工业巨子以及影视明星，最近还搞了一封公开信，呼吁各路AI研究者携手促进AI对人类有利而不是有害，已经有很多大学教授签名了，你也可以去签名哦\n\n斯坦福在AI研究中算是先驱，他们也成立了一个长达百年的委员会来研究AI对人类社会的影响Stanford to host 100-year study on artificial intelligence\n\n对我来说，要保护好身体，争取活到2080年，看到人工智能时代的真正到来，说不定真的能永生呢'),(3,9,'作者：Summer Clover\n链接：https://www.zhihu.com/question/28024550/answer/39334994\n来源：知乎\n著作权归作者所有，转载请联系作者获得授权。\n\n的评价：论据不堪一击，结论却言之凿凿。读起来的感觉就是一篇以煽动为目的的文章。\n\n我十分怀疑这篇文章的原作者并不真的关心他的结论对不对，而只关心这种言论给他带来的利益有多少。\n（甚至可能只是硅谷为人工智能相关企业的炒高估值，吸引投资？）\n毕竟，小孩子才看对错，大人只关心利弊嘛。\n\n很难相信一个聪明正直且利益无关的人会在仔细思考后作出此等盲目自信的结论。\n\n\n我的观点很简单，人类根本没有足够的能力对技术奇点到来的时间做出可靠的预测。\n\n1）人类没有能力复杂系统做出长期预测。\n天气预报就是典型的复杂系统长期预测。一周以后预测都不可信了。\n能预测一周也是因为有强烈的“趋势”出现。什么卫星发现一股寒潮/一个热带风暴在5天后要到来了。\n\n人工智能领域现在没有半分的趋势可以显示奇点到来。更别说言之凿凿的2050年。\n我敢赌五毛钱，就算允许他正负20%的误差，奇点会在2043年-2057年这段时间到来的概率低于1%。（满嘴跑火车，输了也就五毛钱而已。）\n\n还记得40年前有多少预言么。\n40年后，人工智能奇点来临。\n40年后，可控核聚变来临。【高估核能研究发展】\n40年后，太空电梯来临。【高估材料科学发展】\n40年后，星际旅行来临。【高估航天科技发展】\n40年后，飞行汽车。【高估汽车工业发展】\n还有一个我的研究领域的：\n40年后，量子计算机来临。\n现在的观点是，再要40年吧。\n\n也有另一类预测。\nIBM总裁说的，个人电脑永远不会普及。\n\n被扇耳光的技术预测太多了。而且一点都不奇怪，因为我们根本没有能力对未来新技术的发展做长期预测。\n这种准确率跟抽签一样的预测，真的要当真？\n\n我们能做的可靠预测大概是，\n40年后，我们吃饭还用筷子。因为用了几千年筷子了。\n40年后，我们还要坐汽车。因为已经坐了两百年汽车了。\n40年后，我们还要看书。因为我们看来几千年书了。\n40年后，我们还需要椅子。因为已经用了上千年椅子了。\n还有衣服、毛巾、铅笔、床。\n\n那些伴随我们最久，那些最古老的发明往往会更长期的存在。\n\n相反，40年后，我们不一定还要用手机，不一定还要平板。\n这些新的技术发明，则容易在40年内消失。还记得传呼机吗？\n\n\n\n反倒是摩尔定律才是特例，所以显得那么有名。再说，芯片现在已经小到什么程度了？摩尔定律还有十年寿命是业界普遍观点。'),(4,12,'我是14年末开始接触前端，之前一直是windows下的java，没用过linux，没用过命令行。连rm命令都不知道。\n\n14年末我实习完到了一家公司，呆了半个月，居然没事做。然后我就开始了前端自动化之旅，当时是grunt.js走向没落，gulp新型崛起，webpack还在萌芽，backbone和angular让前端的人重新认识了前端。14年，可以说是前端快速发展的一年。而当时，ES6标准并没有定下......\n\n14年末我在新公司蹲了1个半月，公司的html、css、js、php写在一个页面，没有模板嵌套，没有分层。作为一个前端新人，我是特别崩溃的，并且只有我自己一个前端，当你说要重构的时候，应届生的话语权是比较轻的，而且耽误进度，索性我就修修补补，但对于一个代码洁癖的人来说那是不可忍的。当时我还记得配grunt的时候，第一眼真的是很懵逼，而且不是在Mac下面配，而是windows。当时我学习的顺序还是记得的：\n\n1、先让grunt跑起来，比如将一个文件复制到另一个地方；\n\n2、让两个js文件合并后产出到某个目录下；\n\n3、将合并的js文件压缩也就是混淆。\n\n当时我就这么干了三件事情，干了一周时间，总算配好了，但还有一个问题，就是html文件的引入js/css文件路径替换，当时我是完全不明白原理。\n\n14年末在那家公司待了之后我跳槽到一家创业公司，这家公司也是我真正前端之路的开始。公司以php做view层（当时node刚出不久，老大怕坑多，所以选了php作为view层），fis作为前端构建工具。当时看到fis的时候感觉特别神奇，一行命令，编译，打包，发布一条龙。然后在公司期间用fis相当顺手，当时fis它的原理、干了什么事情，我一概不知。然后gulp与webpack这两个工具不断的刷着前端圈。然后我开始去了解。\n\n之前配置grunt的时候（也就配置了一次），感觉特别繁琐，每一个task都要手写，并且当时grunt的思想就是传统前端的思想。之后在不断一步步了解gulp之后，回头去看fis也就明白市面上的各式前端工具其实原理都是差不多的 。就是合并、压缩代码、模块化。\n\n在15年，我的老大走了，前端由我来负责，fis也升级为fis3，这次升级收获很大，踩了很多坑，成功将公司的前端自动化工具升级了一遍。\n\n16年，不甘寂寞的我在我的个人项目中玩起了react，这次我没选择fis，而是直接用gulp+webpack。从node，到webpack，再到react，业余时间把整条前端自动化配置好了，当然这都是在其他前辈项目中看他们的源码一步步去实现的。然后也尝试react服务端渲染，这过程艰辛万苦，还有CSS Modules等等，一系列技术都玩了一遍。最后也把它上线了，就两个页面(http://www.weizongqi.com)，并且也挺粗糙的，但是很开心，很有成就感。年底的时候，我负责公司前端的移动web，我用了fis+react，目前只有我一个人在开发这个项目，说实话，是我拖了项目的进度，所有的下拉、弹框、时间选择器都手写一遍。\n\n今年我打算把fis替换成webpack。目前已经在干这事了，坑不少，但为了以后更好的开发。\n\n说那么多，我也是从一脸懵逼过来的。我大致看了各个楼层的大神，也都是一脸懵逼过来的。所以如果你喜欢前端，那就坚持下去，了解它们的原理，多试，多踩坑，同类型库多比较。最重要的是基础，所有新的技术都是建立在基础之上。\n\n\n有说的不好的欢迎各位大神指点一二。');
/*!40000 ALTER TABLE `comment_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `author_name` varchar(20) NOT NULL COMMENT '提出者昵称',
  `title` varchar(255) NOT NULL COMMENT '问题标题',
  `summary` varchar(255) NOT NULL COMMENT '问题内容摘要',
  `num_of_answer` int(11) NOT NULL DEFAULT '0' COMMENT '回答数',
  `type` int(1) NOT NULL DEFAULT '0' COMMENT '内容长度是否大于255，默认为不大于（0）',
  `time` datetime NOT NULL COMMENT '提出时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (2,1,'dragon','前端新人的迷茫？','大二，学前端大半年了，html，css，js，jq，less，bootstrap这些不敢说精通，但也熟练掌握，项目也做了不少。最近学react的时候开始感觉力不从心了，之后再去了解webpack，npm，node等简直一脸懵逼，各种配置命令行根本看不懂，仿佛到了另一个世界。<br/>到了这个阶段应该怎么继续学下去呢，是我基础知识不足的问题吗？',3,0,'2017-01-08 15:32:32'),(3,1,'dragon','如何看待这篇关于人工智能的译文？','我个人觉得文中将人理解超人工智能的行为与猩猩理解人的行为相类比太过简单粗暴。<br/>1猩猩也并非完全无法理解人，很多实验也证明猩猩能学会不少手语，会做饭菜，会表达情感，智力并不低于四岁的孩子。<br/>2这种智力差异对理解难度的影响不一定是线性增加。指数相关也不可能，否则一般人和高智商人的差别将会导致教育无法进行，而反例是目前我们接受的初等教育中很多知识都是在过去称之为“高端”的东西，恰好是由当时人类智力最高的',2,1,'2017-01-08 15:35:45'),(4,2,'小明','你们老家的人是怎么看待程序员这个职业的？','我们老家人反正说了也不懂 只知道赚的多 修电脑技术也不好 不如公务员稳定',2,0,'2017-01-08 15:41:40'),(5,4,'小伟','有哪些学习算法的网站推荐？','想提高算法水平。有哪些题库类型，可以在线提交代码的优质网站。求推荐。',0,0,'2017-01-08 15:51:13');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_content`
--

DROP TABLE IF EXISTS `question_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `content` text COMMENT '提问内容',
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `question_content_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_content`
--

LOCK TABLES `question_content` WRITE;
/*!40000 ALTER TABLE `question_content` DISABLE KEYS */;
INSERT INTO `question_content` VALUES (1,3,'我个人觉得文中将人理解超人工智能的行为与猩猩理解人的行为相类比太过简单粗暴。\n1猩猩也并非完全无法理解人，很多实验也证明猩猩能学会不少手语，会做饭菜，会表达情感，智力并不低于四岁的孩子。\n2这种智力差异对理解难度的影响不一定是线性增加。指数相关也不可能，否则一般人和高智商人的差别将会导致教育无法进行，而反例是目前我们接受的初等教育中很多知识都是在过去称之为“高端”的东西，恰好是由当时人类智力最高的一批人才能理解的，所以不可能是指数相关的。\n我更相信智力差异对理解难度的影响是一种对数相关的增加，智力差异对理解难度的影响在两者的智力达到某一程度后变得可以微小而忽略不计。\n\n各位还有什么看法可以谈谈吗？');
/*!40000 ALTER TABLE `question_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support`
--

DROP TABLE IF EXISTS `support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `support` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '点赞用户id',
  `comment_id` int(11) NOT NULL COMMENT '被点赞的评论id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`comment_id`),
  KEY `comment_id` (`comment_id`),
  CONSTRAINT `support_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `support_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support`
--

LOCK TABLES `support` WRITE;
/*!40000 ALTER TABLE `support` DISABLE KEYS */;
INSERT INTO `support` VALUES (7,1,1),(8,1,4),(9,1,11),(10,1,12),(2,3,1),(3,4,1),(6,4,4),(4,4,5);
/*!40000 ALTER TABLE `support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `email` varchar(255) NOT NULL COMMENT '用户邮箱',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '用户密码md5加密',
  `sex` int(1) NOT NULL DEFAULT '1' COMMENT '0表示女，1表示男',
  `integral` int(11) NOT NULL DEFAULT '0' COMMENT '用户经验',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'1803240383@qq.com','dragon','e10adc3949ba59abbe56e057f20f883e',1,0),(2,'111112@qq.com','小明','e10adc3949ba59abbe56e057f20f883e',1,0),(3,'222222@qq.com','小红','e10adc3949ba59abbe56e057f20f883e',1,0),(4,'222223@qq.com','小伟','e10adc3949ba59abbe56e057f20f883e',1,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-08 15:56:52
