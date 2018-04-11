-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018-04-09 09:59:51
-- 服务器版本： 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kaiyan`
--
CREATE DATABASE IF NOT EXISTS `kaiyan` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `kaiyan`;

-- --------------------------------------------------------

--
-- 表的结构 `cmessfocus`
--

CREATE TABLE `cmessfocus` (
  `Ufid` int(11) NOT NULL COMMENT '关注号',
  `Xsender` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '发送者账号',
  `Greceiver` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '接收者账号',
  `Qdate` char(16) COLLATE utf8_bin NOT NULL COMMENT '关注日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `cmessfocus`
--

INSERT INTO `cmessfocus` (`Ufid`, `Xsender`, `Greceiver`, `Qdate`) VALUES
(1, '879646527', '879646529', '2018-03-21 14:05'),
(2, '879646528', '879646529', '2017-11-07 08:24');

-- --------------------------------------------------------

--
-- 表的结构 `dmesscomment`
--

CREATE TABLE `dmesscomment` (
  `Ecid` int(11) NOT NULL COMMENT '评论号',
  `Vsender` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '发送者账号',
  `Dreceiver` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '接收者账号',
  `Odate` char(16) COLLATE utf8_bin NOT NULL COMMENT '评论日期',
  `Scontent` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '评论内容',
  `Particle` varchar(22) COLLATE utf8_bin NOT NULL COMMENT '评论文章',
  `Rtype` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '评论类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `dmesscomment`
--

INSERT INTO `dmesscomment` (`Ecid`, `Vsender`, `Dreceiver`, `Odate`, `Scontent`, `Particle`, `Rtype`) VALUES
(1, '879646528', '879646529', '2017-07-13 14：25', '好的，谢谢雷锋', '879646529180325140728', '0');

-- --------------------------------------------------------

--
-- 表的结构 `fuserlike`
--

CREATE TABLE `fuserlike` (
  `Hulid` int(11) NOT NULL COMMENT '用户喜欢号',
  `Taid` varchar(22) COLLATE utf8_bin NOT NULL COMMENT '文章号',
  `Rautaccount` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '作者账号',
  `Vaccount` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '用户账号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `hautfocus`
--

CREATE TABLE `hautfocus` (
  `Yafid` int(11) NOT NULL COMMENT '作者关注号',
  `Tautaccount` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '作者账号',
  `Daccount` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '用户账号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `hautfocus`
--

INSERT INTO `hautfocus` (`Yafid`, `Tautaccount`, `Daccount`) VALUES
(1, '879646528', '879646529');

-- --------------------------------------------------------

--
-- 表的结构 `hmesslike`
--

CREATE TABLE `hmesslike` (
  `Tlid` int(11) NOT NULL COMMENT '喜欢号',
  `Ssender` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '发送者账号',
  `Ireceiver` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '接收者账号',
  `Wdate` char(16) COLLATE utf8_bin NOT NULL COMMENT '喜欢日期',
  `Varticle` varchar(22) COLLATE utf8_bin NOT NULL COMMENT '喜欢文章'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `hsubject`
--

CREATE TABLE `hsubject` (
  `Usid` int(11) NOT NULL COMMENT '专题号',
  `Yname` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '专题名称',
  `Kbrief` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '专题介绍',
  `Uthumbnail` varchar(30) COLLATE utf8_bin DEFAULT '' COMMENT '缩略图',
  `Ebelong` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '所属用户',
  `Hcountarticle` int(11) NOT NULL COMMENT '文章数',
  `Scountfocus` int(11) NOT NULL COMMENT '关注数',
  `Ydate` char(16) COLLATE utf8_bin NOT NULL COMMENT '创建日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `hsubject`
--

INSERT INTO `hsubject` (`Usid`, `Yname`, `Kbrief`, `Uthumbnail`, `Ebelong`, `Hcountarticle`, `Scountfocus`, `Ydate`) VALUES
(1, '旅游', '“旅”是旅行，外出，即为了实现某一目的而在空间上从甲地到乙地的行进过程；“游”是外出游览、观光、娱乐，即为达到这些目的所作的旅行。二者合起来即旅游。所以，旅行偏重于行，旅游不但有“行”，且有观光、娱乐含义。', 'kaiyan/subject/1.jpg', '879646528', 2, 127, ''),
(2, '移动端开发', 'https://www.cnblogs.com/qijunj...  - 百度快照\r\n移动开发_百度百科\r\n移动开发也称为手机开发，或叫做移动互联网开发。是指以手机、PDA、UMPC等便携终端为基础，进行相应的开发工作。', 'kaiyan/subject/2.jpg', '879646529', 3, 84, ''),
(3, '前端开发', '扬我大前端！', 'kaiyan/subject/3.jpg', '879646529', 2, 1041, '');

-- --------------------------------------------------------

--
-- 表的结构 `larticle`
--

CREATE TABLE `larticle` (
  `Xaid` varchar(24) COLLATE utf8_bin NOT NULL COMMENT '文章号',
  `Psid` int(11) DEFAULT '0' COMMENT '专题号',
  `Vaccount` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `Dtitle` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '文章标题',
  `Tcontent` varchar(8192) COLLATE utf8_bin NOT NULL COMMENT '文章内容',
  `Rdate` char(16) COLLATE utf8_bin NOT NULL COMMENT '文章日期',
  `Klike` int(11) DEFAULT '0' COMMENT '喜欢数',
  `Wcomment` int(11) DEFAULT '0' COMMENT '评论数',
  `Oread` int(11) DEFAULT '0' COMMENT '阅读数',
  `Kpicture` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '缩略图'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `larticle`
--

INSERT INTO `larticle` (`Xaid`, `Psid`, `Vaccount`, `Dtitle`, `Tcontent`, `Rdate`, `Klike`, `Wcomment`, `Oread`, `Kpicture`) VALUES
('879646528180306145424', 1, '879646528', '来一场说走就走的旅行', '测试使用', '2018-03-06 14:54', 2541, 7154, 15340, 'kaiyan/thumbnail/879646528180306145424.jpg'),
('879646528180323130437', 1, '879646528', '面朝大海，春暖花开', '测试使用', '2018-03-23 13:04', 5221, 8154, 25340, 'kaiyan/thumbnail/879646528180323130437.jpg'),
('879646529180325140728', 2, '879646529', 'Andorid：这是一份Handler消息传递机制的使用教程', '测试使用', '2018-03-25 18:18', 57, 10, 1456, 'kaiyan/thumbnail/879646529180325140728.jpg'),
('879646529180327182534', 3, '879646529', '浅谈JavaScript中的闭包以及模块机制', '测试使用', '2018-03-27 19:24', 15, 23, 1024, 'kaiyan/thumbnail/879646529180327182534.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `maction`
--

CREATE TABLE `maction` (
  `Eaid` int(11) NOT NULL COMMENT '动态号',
  `Ukey` varchar(22) COLLATE utf8_bin NOT NULL COMMENT '链接',
  `Rvalue` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '内容',
  `Vaccount` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `Htype` int(11) NOT NULL COMMENT '动态类型',
  `Bdate` char(16) COLLATE utf8_bin NOT NULL COMMENT '动态日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `nblacklist`
--

CREATE TABLE `nblacklist` (
  `Tbid` int(11) NOT NULL COMMENT '黑名单号',
  `Hblackaccount` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '黑名单账号',
  `Vaccount` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '用户账号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `nblacklist`
--

INSERT INTO `nblacklist` (`Tbid`, `Hblackaccount`, `Vaccount`) VALUES
(1, '879646527', '879646529');

-- --------------------------------------------------------

--
-- 表的结构 `ohistory`
--

CREATE TABLE `ohistory` (
  `Chid` int(11) NOT NULL COMMENT '历史记录号',
  `Gaid` varchar(22) COLLATE utf8_bin NOT NULL COMMENT '文章号',
  `Aaccount` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `Pdate` char(16) COLLATE utf8_bin NOT NULL COMMENT '阅读日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `rsubfocus`
--

CREATE TABLE `rsubfocus` (
  `Vsfid` int(11) NOT NULL COMMENT '专题关注号',
  `Ksid` int(11) NOT NULL COMMENT '专题号',
  `Saccount` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `lrank` int(11) NOT NULL DEFAULT '0' COMMENT '排列顺序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `rsubfocus`
--

INSERT INTO `rsubfocus` (`Vsfid`, `Ksid`, `Saccount`, `lrank`) VALUES
(1, 1, '879646529', 0),
(2, 2, '879646529', 0),
(3, 3, '879646529', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ruser`
--

CREATE TABLE `ruser` (
  `Raccount` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `Ipassword` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '登录密码',
  `Hnickname` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '用户昵称',
  `Uhead` varchar(30) COLLATE utf8_bin DEFAULT 'img' COMMENT '用户头像',
  `Jbrief` varchar(48) COLLATE utf8_bin NOT NULL COMMENT '个人简介',
  `Hcountfocus` int(11) DEFAULT '0' COMMENT '关注数',
  `Kcountfans` int(11) DEFAULT '0' COMMENT '粉丝数',
  `Ycountlike` int(11) DEFAULT '0' COMMENT '喜欢数',
  `Xcountarticle` int(11) DEFAULT '0' COMMENT '文章数',
  `Ecountsubject` int(11) DEFAULT '0' COMMENT '专题数',
  `Rindexback` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '主页背景',
  `Bcountwords` int(11) DEFAULT '0' COMMENT '总文字数',
  `Gcountliked` int(11) DEFAULT '0' COMMENT '被喜欢数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `ruser`
--

INSERT INTO `ruser` (`Raccount`, `Ipassword`, `Hnickname`, `Uhead`, `Jbrief`, `Hcountfocus`, `Kcountfans`, `Ycountlike`, `Xcountarticle`, `Ecountsubject`, `Rindexback`, `Bcountwords`, `Gcountliked`) VALUES
('879646527', 'zxc123aqswd', '测试一号', 'kaiyan/head/879646527.jpg', '测试一号', 0, 0, 0, 0, 0, '', 0, 0),
('879646528', 'zxc456123', '耗子爱骑车', 'kaiyan/head/879646528.jpg', '坏人能够获胜的唯一条件是：好人袖手旁观', 5, 1245, 12, 3, 1, 'kaiyan/back/879646528.jpg', 123056, 2587),
('879646529', 'zxc123456', '游学者、墨槿', 'kaiyan/head/879646529.jpg', '人生不是戏剧，而我亦非主角', 82, 2365, 15, 2, 1, 'kaiyan/back/879646529.jpg', 8452, 4521);

-- --------------------------------------------------------

--
-- 表的结构 `smessage`
--

CREATE TABLE `smessage` (
  `Dmid` int(11) NOT NULL COMMENT '私信号',
  `Esender` varchar(12) COLLATE utf8_bin NOT NULL,
  `Rdate` char(16) COLLATE utf8_bin NOT NULL,
  `Pcontent` varchar(128) COLLATE utf8_bin NOT NULL,
  `Oreceiver` varchar(12) COLLATE utf8_bin NOT NULL,
  `GisRead` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `smessage`
--

INSERT INTO `smessage` (`Dmid`, `Esender`, `Rdate`, `Pcontent`, `Oreceiver`, `GisRead`) VALUES
(1, '879646528', '2018-03-25 18:18', '你好，游学者！', '879646529', '0'),
(2, '879646529', '2018-03-27 19:24', '你好，爱骑车！', '879646528', '0'),
(3, '879646528', '2018-03-27 20:24', '哈哈哈', '879646529', '0');

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_action`
-- (See below for the actual view)
--
CREATE TABLE `view_action` (
`id` int(11)
,`key` varchar(22)
,`value` varchar(32)
,`account` varchar(12)
,`type` int(11)
,`date` char(16)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_article`
-- (See below for the actual view)
--
CREATE TABLE `view_article` (
`id` varchar(24)
,`title` varchar(32)
,`content` varchar(8192)
,`date` char(16)
,`countLike` int(11)
,`countComment` int(11)
,`countRead` int(11)
,`thumbnail` varchar(50)
,`account` varchar(12)
,`nickname` varchar(10)
,`head` varchar(30)
,`sid` int(11)
,`subjectName` varchar(12)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_author_focus`
-- (See below for the actual view)
--
CREATE TABLE `view_author_focus` (
`account` varchar(12)
,`nickname` varchar(10)
,`head` varchar(30)
,`title` text
,`aid` varchar(24)
,`owner` varchar(12)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_blacklist`
-- (See below for the actual view)
--
CREATE TABLE `view_blacklist` (
`bid` int(11)
,`account` varchar(12)
,`nickname` varchar(10)
,`head` varchar(30)
,`owner` varchar(12)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_comment`
-- (See below for the actual view)
--
CREATE TABLE `view_comment` (
`sender` varchar(12)
,`date` char(16)
,`content` varchar(128)
,`nickname` varchar(10)
,`head` varchar(30)
,`article` varchar(24)
,`title` varchar(32)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_message`
-- (See below for the actual view)
--
CREATE TABLE `view_message` (
`id` int(11)
,`sender` varchar(12)
,`date` char(16)
,`head` varchar(30)
,`content` varchar(128)
,`receiver` varchar(12)
,`isRead` char(1)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_message_list`
-- (See below for the actual view)
--
CREATE TABLE `view_message_list` (
`id` int(11)
,`sender` varchar(12)
,`receiver` varchar(12)
,`isRead` char(1)
,`nickname` varchar(10)
,`head` varchar(30)
,`content` text
,`date` text
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_messfocus`
-- (See below for the actual view)
--
CREATE TABLE `view_messfocus` (
`sender` varchar(12)
,`date` char(16)
,`isFocus` varchar(12)
,`account` varchar(12)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_messlike`
-- (See below for the actual view)
--
CREATE TABLE `view_messlike` (
`sender` varchar(12)
,`date` char(16)
,`nickname` varchar(10)
,`head` varchar(30)
,`article` varchar(24)
,`title` varchar(32)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_subject`
-- (See below for the actual view)
--
CREATE TABLE `view_subject` (
`id` int(11)
,`name` varchar(12)
,`brief` varchar(128)
,`thumbnail` varchar(30)
,`nickname` varchar(10)
,`date` char(16)
,`owner` varchar(12)
,`countArticle` int(11)
,`countFocus` int(11)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_subject_focus`
-- (See below for the actual view)
--
CREATE TABLE `view_subject_focus` (
`id` int(11)
,`account` varchar(12)
,`name` varchar(12)
,`brief` varchar(128)
,`thumbnail` varchar(30)
,`countArticle` int(11)
,`countFocus` int(11)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_user`
-- (See below for the actual view)
--
CREATE TABLE `view_user` (
`account` varchar(12)
,`password` varchar(20)
,`nickname` varchar(10)
,`head` varchar(30)
,`brief` varchar(48)
,`countFocus` int(11)
,`countFans` int(11)
,`countLike` int(11)
,`countArticle` int(11)
,`countSubject` int(11)
,`indexback` varchar(30)
,`countWords` int(11)
,`countLiked` int(11)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_userfocus`
-- (See below for the actual view)
--
CREATE TABLE `view_userfocus` (
`account` varchar(12)
,`nickname` varchar(10)
,`head` varchar(30)
,`countwords` int(11)
,`countliked` int(11)
,`owner` varchar(12)
);

-- --------------------------------------------------------

--
-- 视图结构 `view_action`
--
DROP TABLE IF EXISTS `view_action`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_action`  AS  select `ma`.`Eaid` AS `id`,`ma`.`Ukey` AS `key`,`ma`.`Rvalue` AS `value`,`ma`.`Vaccount` AS `account`,`ma`.`Htype` AS `type`,`ma`.`Bdate` AS `date` from `maction` `ma` order by `ma`.`Bdate` desc ;

-- --------------------------------------------------------

--
-- 视图结构 `view_article`
--
DROP TABLE IF EXISTS `view_article`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_article`  AS  select `la`.`Xaid` AS `id`,`la`.`Dtitle` AS `title`,`la`.`Tcontent` AS `content`,`la`.`Rdate` AS `date`,`la`.`Klike` AS `countLike`,`la`.`Wcomment` AS `countComment`,`la`.`Oread` AS `countRead`,`la`.`Kpicture` AS `thumbnail`,`ru`.`Raccount` AS `account`,`ru`.`Hnickname` AS `nickname`,`ru`.`Uhead` AS `head`,`hs`.`Usid` AS `sid`,`hs`.`Yname` AS `subjectName` from ((`larticle` `la` join `ruser` `ru`) join `hsubject` `hs`) where ((`la`.`Psid` = `hs`.`Usid`) and (`la`.`Vaccount` = `ru`.`Raccount`)) order by `la`.`Rdate` desc ;

-- --------------------------------------------------------

--
-- 视图结构 `view_author_focus`
--
DROP TABLE IF EXISTS `view_author_focus`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_author_focus`  AS  select `haf`.`Tautaccount` AS `account`,`ru`.`Hnickname` AS `nickname`,`ru`.`Uhead` AS `head`,substring_index(group_concat(`la`.`Dtitle` order by `la`.`Rdate` DESC separator ','),',',1) AS `title`,`la`.`Xaid` AS `aid`,`haf`.`Daccount` AS `owner` from ((`hautfocus` `haf` left join `larticle` `la` on((`haf`.`Tautaccount` = `la`.`Vaccount`))) left join `ruser` `ru` on((`haf`.`Tautaccount` = `ru`.`Raccount`))) group by `ru`.`Raccount` ;

-- --------------------------------------------------------

--
-- 视图结构 `view_blacklist`
--
DROP TABLE IF EXISTS `view_blacklist`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_blacklist`  AS  select `nb`.`Tbid` AS `bid`,`nb`.`Hblackaccount` AS `account`,`u`.`Hnickname` AS `nickname`,`u`.`Uhead` AS `head`,`nb`.`Vaccount` AS `owner` from (`nblacklist` `nb` join `ruser` `u`) where (`nb`.`Hblackaccount` = `u`.`Raccount`) order by `u`.`Hnickname` desc ;

-- --------------------------------------------------------

--
-- 视图结构 `view_comment`
--
DROP TABLE IF EXISTS `view_comment`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_comment`  AS  select `dmc`.`Vsender` AS `sender`,`dmc`.`Odate` AS `date`,`dmc`.`Scontent` AS `content`,`ru`.`Hnickname` AS `nickname`,`ru`.`Uhead` AS `head`,`la`.`Xaid` AS `article`,`la`.`Dtitle` AS `title` from ((`dmesscomment` `dmc` left join `ruser` `ru` on((`dmc`.`Vsender` = `ru`.`Raccount`))) left join `larticle` `la` on((`dmc`.`Particle` = `la`.`Xaid`))) order by `dmc`.`Odate` desc ;

-- --------------------------------------------------------

--
-- 视图结构 `view_message`
--
DROP TABLE IF EXISTS `view_message`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_message`  AS  select `sm`.`Dmid` AS `id`,`sm`.`Esender` AS `sender`,`sm`.`Rdate` AS `date`,`ru`.`Uhead` AS `head`,`sm`.`Pcontent` AS `content`,`sm`.`Oreceiver` AS `receiver`,`sm`.`GisRead` AS `isRead` from (`smessage` `sm` left join `ruser` `ru` on((`sm`.`Esender` = `ru`.`Raccount`))) order by `sm`.`Rdate` desc ;

-- --------------------------------------------------------

--
-- 视图结构 `view_message_list`
--
DROP TABLE IF EXISTS `view_message_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_message_list`  AS  select `sm`.`Dmid` AS `id`,`sm`.`Esender` AS `sender`,`sm`.`Oreceiver` AS `receiver`,`sm`.`GisRead` AS `isRead`,`ru`.`Hnickname` AS `nickname`,`ru`.`Uhead` AS `head`,substring_index(group_concat(`sm`.`Pcontent` order by `sm`.`Rdate` DESC separator ','),',',1) AS `content`,substring_index(group_concat(`sm`.`Rdate` order by `sm`.`Rdate` DESC separator ','),',',1) AS `date` from (`smessage` `sm` left join `ruser` `ru` on((`sm`.`Esender` = `ru`.`Raccount`))) group by `sm`.`Esender` ;

-- --------------------------------------------------------

--
-- 视图结构 `view_messfocus`
--
DROP TABLE IF EXISTS `view_messfocus`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_messfocus`  AS  select `cmf`.`Xsender` AS `sender`,`cmf`.`Qdate` AS `date`,`haf`.`Tautaccount` AS `isFocus`,`haf`.`Daccount` AS `account` from (`cmessfocus` `cmf` left join `hautfocus` `haf` on((`cmf`.`Xsender` = `haf`.`Tautaccount`))) order by `cmf`.`Qdate` desc ;

-- --------------------------------------------------------

--
-- 视图结构 `view_messlike`
--
DROP TABLE IF EXISTS `view_messlike`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_messlike`  AS  select `hml`.`Ssender` AS `sender`,`hml`.`Wdate` AS `date`,`ru`.`Hnickname` AS `nickname`,`ru`.`Uhead` AS `head`,`la`.`Xaid` AS `article`,`la`.`Dtitle` AS `title` from ((`hmesslike` `hml` left join `ruser` `ru` on((`hml`.`Ssender` = `ru`.`Raccount`))) left join `larticle` `la` on((`hml`.`Varticle` = `la`.`Xaid`))) order by `hml`.`Wdate` desc ;

-- --------------------------------------------------------

--
-- 视图结构 `view_subject`
--
DROP TABLE IF EXISTS `view_subject`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_subject`  AS  select `hs`.`Usid` AS `id`,`hs`.`Yname` AS `name`,`hs`.`Kbrief` AS `brief`,`hs`.`Uthumbnail` AS `thumbnail`,`ru`.`Hnickname` AS `nickname`,`hs`.`Ydate` AS `date`,`hs`.`Ebelong` AS `owner`,`hs`.`Hcountarticle` AS `countArticle`,`hs`.`Scountfocus` AS `countFocus` from (`hsubject` `hs` join `ruser` `ru`) where (`hs`.`Ebelong` = `ru`.`Raccount`) order by `hs`.`Scountfocus` desc ;

-- --------------------------------------------------------

--
-- 视图结构 `view_subject_focus`
--
DROP TABLE IF EXISTS `view_subject_focus`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_subject_focus`  AS  select `rsf`.`Ksid` AS `id`,`rsf`.`Saccount` AS `account`,`hs`.`Yname` AS `name`,`hs`.`Kbrief` AS `brief`,`hs`.`Uthumbnail` AS `thumbnail`,`hs`.`Hcountarticle` AS `countArticle`,`hs`.`Scountfocus` AS `countFocus` from (`rsubfocus` `rsf` left join `hsubject` `hs` on((`rsf`.`Ksid` = `hs`.`Usid`))) ;

-- --------------------------------------------------------

--
-- 视图结构 `view_user`
--
DROP TABLE IF EXISTS `view_user`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_user`  AS  select `u`.`Raccount` AS `account`,`u`.`Ipassword` AS `password`,`u`.`Hnickname` AS `nickname`,`u`.`Uhead` AS `head`,`u`.`Jbrief` AS `brief`,`u`.`Hcountfocus` AS `countFocus`,`u`.`Kcountfans` AS `countFans`,`u`.`Ycountlike` AS `countLike`,`u`.`Xcountarticle` AS `countArticle`,`u`.`Ecountsubject` AS `countSubject`,`u`.`Rindexback` AS `indexback`,`u`.`Bcountwords` AS `countWords`,`u`.`Gcountliked` AS `countLiked` from `ruser` `u` order by `u`.`Gcountliked` desc ;

-- --------------------------------------------------------

--
-- 视图结构 `view_userfocus`
--
DROP TABLE IF EXISTS `view_userfocus`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_userfocus`  AS  select `u`.`Raccount` AS `account`,`u`.`Hnickname` AS `nickname`,`u`.`Uhead` AS `head`,`u`.`Bcountwords` AS `countwords`,`u`.`Gcountliked` AS `countliked`,`af`.`Daccount` AS `owner` from (`ruser` `u` join `hautfocus` `af`) where (`u`.`Raccount` = `af`.`Tautaccount`) order by `u`.`Hnickname` desc ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cmessfocus`
--
ALTER TABLE `cmessfocus`
  ADD PRIMARY KEY (`Ufid`),
  ADD KEY `fk_user_messfocus1` (`Xsender`),
  ADD KEY `fk_user_messfocus2` (`Greceiver`);

--
-- Indexes for table `dmesscomment`
--
ALTER TABLE `dmesscomment`
  ADD PRIMARY KEY (`Ecid`),
  ADD KEY `fk_article_messcomment` (`Particle`),
  ADD KEY `fk_user_messcomment1` (`Vsender`),
  ADD KEY `fk_user_messcomment2` (`Dreceiver`);

--
-- Indexes for table `fuserlike`
--
ALTER TABLE `fuserlike`
  ADD PRIMARY KEY (`Hulid`),
  ADD KEY `fk_article_userlike` (`Taid`),
  ADD KEY `fk_user_userlike1` (`Rautaccount`),
  ADD KEY `fk_user_userlike2` (`Vaccount`);

--
-- Indexes for table `hautfocus`
--
ALTER TABLE `hautfocus`
  ADD PRIMARY KEY (`Yafid`),
  ADD KEY `fk_user_autfocus1` (`Tautaccount`),
  ADD KEY `fk_user_autfocus2` (`Daccount`);

--
-- Indexes for table `hmesslike`
--
ALTER TABLE `hmesslike`
  ADD PRIMARY KEY (`Tlid`),
  ADD KEY `fk_user_messlike1` (`Ssender`),
  ADD KEY `fk_user_messlike2` (`Ireceiver`),
  ADD KEY `fk_article_messlike` (`Varticle`);

--
-- Indexes for table `hsubject`
--
ALTER TABLE `hsubject`
  ADD PRIMARY KEY (`Usid`),
  ADD KEY `fk_user_subject` (`Ebelong`);

--
-- Indexes for table `larticle`
--
ALTER TABLE `larticle`
  ADD PRIMARY KEY (`Xaid`),
  ADD KEY `fk_subject_article` (`Psid`),
  ADD KEY `fk_user_article` (`Vaccount`);

--
-- Indexes for table `maction`
--
ALTER TABLE `maction`
  ADD PRIMARY KEY (`Eaid`),
  ADD KEY `fk_user_maction` (`Vaccount`);

--
-- Indexes for table `nblacklist`
--
ALTER TABLE `nblacklist`
  ADD PRIMARY KEY (`Tbid`),
  ADD KEY `fk_user_blacklist1` (`Vaccount`),
  ADD KEY `fk_user_blacklist2` (`Hblackaccount`);

--
-- Indexes for table `ohistory`
--
ALTER TABLE `ohistory`
  ADD PRIMARY KEY (`Chid`),
  ADD KEY `fk_article_history` (`Gaid`),
  ADD KEY `fk_user_history` (`Aaccount`);

--
-- Indexes for table `rsubfocus`
--
ALTER TABLE `rsubfocus`
  ADD PRIMARY KEY (`Vsfid`),
  ADD KEY `fk_subject_subfocus` (`Ksid`),
  ADD KEY `fk_user_subfocus` (`Saccount`);

--
-- Indexes for table `ruser`
--
ALTER TABLE `ruser`
  ADD PRIMARY KEY (`Raccount`);

--
-- Indexes for table `smessage`
--
ALTER TABLE `smessage`
  ADD PRIMARY KEY (`Dmid`),
  ADD KEY `fk_user_message1` (`Esender`),
  ADD KEY `fk_user_message2` (`Oreceiver`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `cmessfocus`
--
ALTER TABLE `cmessfocus`
  MODIFY `Ufid` int(11) NOT NULL AUTO_INCREMENT COMMENT '关注号', AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `dmesscomment`
--
ALTER TABLE `dmesscomment`
  MODIFY `Ecid` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论号', AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `fuserlike`
--
ALTER TABLE `fuserlike`
  MODIFY `Hulid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户喜欢号';
--
-- 使用表AUTO_INCREMENT `hautfocus`
--
ALTER TABLE `hautfocus`
  MODIFY `Yafid` int(11) NOT NULL AUTO_INCREMENT COMMENT '作者关注号', AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `hmesslike`
--
ALTER TABLE `hmesslike`
  MODIFY `Tlid` int(11) NOT NULL AUTO_INCREMENT COMMENT '喜欢号';
--
-- 使用表AUTO_INCREMENT `hsubject`
--
ALTER TABLE `hsubject`
  MODIFY `Usid` int(11) NOT NULL AUTO_INCREMENT COMMENT '专题号', AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `maction`
--
ALTER TABLE `maction`
  MODIFY `Eaid` int(11) NOT NULL AUTO_INCREMENT COMMENT '动态号';
--
-- 使用表AUTO_INCREMENT `nblacklist`
--
ALTER TABLE `nblacklist`
  MODIFY `Tbid` int(11) NOT NULL AUTO_INCREMENT COMMENT '黑名单号', AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `ohistory`
--
ALTER TABLE `ohistory`
  MODIFY `Chid` int(11) NOT NULL AUTO_INCREMENT COMMENT '历史记录号';
--
-- 使用表AUTO_INCREMENT `rsubfocus`
--
ALTER TABLE `rsubfocus`
  MODIFY `Vsfid` int(11) NOT NULL AUTO_INCREMENT COMMENT '专题关注号', AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `smessage`
--
ALTER TABLE `smessage`
  MODIFY `Dmid` int(11) NOT NULL AUTO_INCREMENT COMMENT '私信号', AUTO_INCREMENT=4;
--
-- 限制导出的表
--

--
-- 限制表 `cmessfocus`
--
ALTER TABLE `cmessfocus`
  ADD CONSTRAINT `fk_user_messfocus1` FOREIGN KEY (`Xsender`) REFERENCES `ruser` (`Raccount`),
  ADD CONSTRAINT `fk_user_messfocus2` FOREIGN KEY (`Greceiver`) REFERENCES `ruser` (`Raccount`);

--
-- 限制表 `dmesscomment`
--
ALTER TABLE `dmesscomment`
  ADD CONSTRAINT `fk_article_messcomment` FOREIGN KEY (`Particle`) REFERENCES `larticle` (`Xaid`),
  ADD CONSTRAINT `fk_user_messcomment1` FOREIGN KEY (`Vsender`) REFERENCES `ruser` (`Raccount`),
  ADD CONSTRAINT `fk_user_messcomment2` FOREIGN KEY (`Dreceiver`) REFERENCES `ruser` (`Raccount`);

--
-- 限制表 `fuserlike`
--
ALTER TABLE `fuserlike`
  ADD CONSTRAINT `fk_article_userlike` FOREIGN KEY (`Taid`) REFERENCES `larticle` (`Xaid`),
  ADD CONSTRAINT `fk_user_userlike1` FOREIGN KEY (`Rautaccount`) REFERENCES `ruser` (`Raccount`),
  ADD CONSTRAINT `fk_user_userlike2` FOREIGN KEY (`Vaccount`) REFERENCES `ruser` (`Raccount`);

--
-- 限制表 `hautfocus`
--
ALTER TABLE `hautfocus`
  ADD CONSTRAINT `fk_user_autfocus1` FOREIGN KEY (`Tautaccount`) REFERENCES `ruser` (`Raccount`),
  ADD CONSTRAINT `fk_user_autfocus2` FOREIGN KEY (`Daccount`) REFERENCES `ruser` (`Raccount`);

--
-- 限制表 `hmesslike`
--
ALTER TABLE `hmesslike`
  ADD CONSTRAINT `fk_article_messlike` FOREIGN KEY (`Varticle`) REFERENCES `larticle` (`Xaid`),
  ADD CONSTRAINT `fk_user_messlike1` FOREIGN KEY (`Ssender`) REFERENCES `ruser` (`Raccount`),
  ADD CONSTRAINT `fk_user_messlike2` FOREIGN KEY (`Ireceiver`) REFERENCES `ruser` (`Raccount`);

--
-- 限制表 `hsubject`
--
ALTER TABLE `hsubject`
  ADD CONSTRAINT `fk_user_subject` FOREIGN KEY (`Ebelong`) REFERENCES `ruser` (`Raccount`);

--
-- 限制表 `larticle`
--
ALTER TABLE `larticle`
  ADD CONSTRAINT `fk_subject_article` FOREIGN KEY (`Psid`) REFERENCES `hsubject` (`Usid`),
  ADD CONSTRAINT `fk_user_article` FOREIGN KEY (`Vaccount`) REFERENCES `ruser` (`Raccount`);

--
-- 限制表 `maction`
--
ALTER TABLE `maction`
  ADD CONSTRAINT `fk_user_maction` FOREIGN KEY (`Vaccount`) REFERENCES `ruser` (`Raccount`);

--
-- 限制表 `nblacklist`
--
ALTER TABLE `nblacklist`
  ADD CONSTRAINT `fk_user_blacklist1` FOREIGN KEY (`Vaccount`) REFERENCES `ruser` (`Raccount`),
  ADD CONSTRAINT `fk_user_blacklist2` FOREIGN KEY (`Hblackaccount`) REFERENCES `ruser` (`Raccount`);

--
-- 限制表 `ohistory`
--
ALTER TABLE `ohistory`
  ADD CONSTRAINT `fk_article_history` FOREIGN KEY (`Gaid`) REFERENCES `larticle` (`Xaid`),
  ADD CONSTRAINT `fk_user_history` FOREIGN KEY (`Aaccount`) REFERENCES `ruser` (`Raccount`);

--
-- 限制表 `rsubfocus`
--
ALTER TABLE `rsubfocus`
  ADD CONSTRAINT `fk_subject_subfocus` FOREIGN KEY (`Ksid`) REFERENCES `hsubject` (`Usid`),
  ADD CONSTRAINT `fk_user_subfocus` FOREIGN KEY (`Saccount`) REFERENCES `ruser` (`Raccount`);

--
-- 限制表 `smessage`
--
ALTER TABLE `smessage`
  ADD CONSTRAINT `fk_user_message1` FOREIGN KEY (`Esender`) REFERENCES `ruser` (`Raccount`),
  ADD CONSTRAINT `fk_user_message2` FOREIGN KEY (`Oreceiver`) REFERENCES `ruser` (`Raccount`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
