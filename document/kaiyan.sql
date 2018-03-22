-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018-03-22 04:35:45
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
  `Ebelong` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '所属用户',
  `Hcountarticle` int(11) NOT NULL COMMENT '文章数',
  `Scountfocus` int(11) NOT NULL COMMENT '关注数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `larticle`
--

CREATE TABLE `larticle` (
  `Xaid` varchar(22) COLLATE utf8_bin NOT NULL COMMENT '文章号',
  `Psid` int(11) DEFAULT '0' COMMENT '专题号',
  `Vaccount` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `Dtitle` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '文章标题',
  `Tcontent` varchar(8192) COLLATE utf8_bin NOT NULL COMMENT '文章内容',
  `Rdate` char(16) COLLATE utf8_bin NOT NULL COMMENT '文章日期',
  `Klike` int(11) DEFAULT '0' COMMENT '喜欢数',
  `Wcomment` int(11) DEFAULT '0' COMMENT '评论数',
  `Oread` int(11) DEFAULT '0' COMMENT '阅读数',
  `Kpicture` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '缩略图'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `maction`
--

CREATE TABLE `maction` (
  `Eaid` int(11) NOT NULL COMMENT '动态号',
  `Ukey` varchar(22) COLLATE utf8_bin NOT NULL COMMENT '链接',
  `Rvalue` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '内容',
  `Vaccount` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `Htype` int(11) NOT NULL COMMENT '动态类型'
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
  `lrank` int(11) NOT NULL COMMENT '排列顺序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
  `Rindexback` int(11) NOT NULL COMMENT '主页背景',
  `Bcountwords` int(11) DEFAULT '0' COMMENT '总文字数',
  `Gcountliked` int(11) DEFAULT '0' COMMENT '被喜欢数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
-- 替换视图以便查看 `view_user`
-- (See below for the actual view)
--
CREATE TABLE `view_user` (
`account` varchar(12)
,`password` varchar(20)
,`nickname` varchar(10)
,`head` varchar(30)
,`brief` varchar(48)
,`countfocus` int(11)
,`countfans` int(11)
,`countlike` int(11)
,`countarticle` int(11)
,`countsubject` int(11)
,`indexback` int(11)
,`countwords` int(11)
,`countliked` int(11)
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
-- 视图结构 `view_blacklist`
--
DROP TABLE IF EXISTS `view_blacklist`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_blacklist`  AS  select `nb`.`Tbid` AS `bid`,`nb`.`Hblackaccount` AS `account`,`u`.`Hnickname` AS `nickname`,`u`.`Uhead` AS `head`,`nb`.`Vaccount` AS `owner` from (`nblacklist` `nb` join `ruser` `u`) where (`nb`.`Hblackaccount` = `u`.`Raccount`) order by `u`.`Hnickname` desc ;

-- --------------------------------------------------------

--
-- 视图结构 `view_user`
--
DROP TABLE IF EXISTS `view_user`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_user`  AS  select `u`.`Raccount` AS `account`,`u`.`Ipassword` AS `password`,`u`.`Hnickname` AS `nickname`,`u`.`Uhead` AS `head`,`u`.`Jbrief` AS `brief`,`u`.`Hcountfocus` AS `countfocus`,`u`.`Kcountfans` AS `countfans`,`u`.`Ycountlike` AS `countlike`,`u`.`Xcountarticle` AS `countarticle`,`u`.`Ecountsubject` AS `countsubject`,`u`.`Rindexback` AS `indexback`,`u`.`Bcountwords` AS `countwords`,`u`.`Gcountliked` AS `countliked` from `ruser` `u` order by `u`.`Gcountliked` desc ;

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
  MODIFY `Ufid` int(11) NOT NULL AUTO_INCREMENT COMMENT '关注号';
--
-- 使用表AUTO_INCREMENT `dmesscomment`
--
ALTER TABLE `dmesscomment`
  MODIFY `Ecid` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论号';
--
-- 使用表AUTO_INCREMENT `fuserlike`
--
ALTER TABLE `fuserlike`
  MODIFY `Hulid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户喜欢号';
--
-- 使用表AUTO_INCREMENT `hautfocus`
--
ALTER TABLE `hautfocus`
  MODIFY `Yafid` int(11) NOT NULL AUTO_INCREMENT COMMENT '作者关注号';
--
-- 使用表AUTO_INCREMENT `hmesslike`
--
ALTER TABLE `hmesslike`
  MODIFY `Tlid` int(11) NOT NULL AUTO_INCREMENT COMMENT '喜欢号';
--
-- 使用表AUTO_INCREMENT `hsubject`
--
ALTER TABLE `hsubject`
  MODIFY `Usid` int(11) NOT NULL AUTO_INCREMENT COMMENT '专题号';
--
-- 使用表AUTO_INCREMENT `maction`
--
ALTER TABLE `maction`
  MODIFY `Eaid` int(11) NOT NULL AUTO_INCREMENT COMMENT '动态号';
--
-- 使用表AUTO_INCREMENT `nblacklist`
--
ALTER TABLE `nblacklist`
  MODIFY `Tbid` int(11) NOT NULL AUTO_INCREMENT COMMENT '黑名单号';
--
-- 使用表AUTO_INCREMENT `ohistory`
--
ALTER TABLE `ohistory`
  MODIFY `Chid` int(11) NOT NULL AUTO_INCREMENT COMMENT '历史记录号';
--
-- 使用表AUTO_INCREMENT `rsubfocus`
--
ALTER TABLE `rsubfocus`
  MODIFY `Vsfid` int(11) NOT NULL AUTO_INCREMENT COMMENT '专题关注号';
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
