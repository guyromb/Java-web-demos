-- phpMyAdmin SQL Dump
-- version 4.6.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 2016-11-02 00:32:09
-- 服务器版本： 5.6.32
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kfmmsdb`
--

-- --------------------------------------------------------

--
-- 表的结构 `tbl_kfmms_channel_inf`
--

CREATE TABLE `tbl_kfmms_channel_inf` (
  `CHANNEL_NO` char(2) NOT NULL,
  `CHANNEL_NM` varchar(50) NOT NULL,
  `SEQ_ID` bigint(20) NOT NULL,
  `CHANNEL_LINK` varbinary(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tbl_kfmms_hot_activity_inf`
--

CREATE TABLE `tbl_kfmms_hot_activity_inf` (
  `SEQ_ID` bigint(20) NOT NULL,
  `ACTIVITY_TITLE` varchar(100) NOT NULL,
  `ACTIVITY_LINK` varchar(300) NOT NULL,
  `ACTIVITY_SEQ` char(1) NOT NULL,
  `REC_ST` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tbl_kfmms_hot_activity_inf`
--

INSERT INTO `tbl_kfmms_hot_activity_inf` (`SEQ_ID`, `ACTIVITY_TITLE`, `ACTIVITY_LINK`, `ACTIVITY_SEQ`, `REC_ST`) VALUES
(10, '百度', 'http://www.baidu.com', '1', '00'),
(11, '腾讯', 'http://www.qq.com', '1', '01'),
(12, '360', 'http://hao.360.cn', '4', '01');

-- --------------------------------------------------------

--
-- 表的结构 `tbl_kfmms_maktg_activity_inf`
--

CREATE TABLE `tbl_kfmms_maktg_activity_inf` (
  `SEQ_ID` bigint(20) NOT NULL,
  `ACTIVITY_NM` varchar(40) NOT NULL,
  `ACTIVITY_CONTENT` varchar(100) NOT NULL,
  `SHORT_LINK` varchar(100) NOT NULL,
  `REMARK` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tbl_kfmms_shortlink_mapping`
--

CREATE TABLE `tbl_kfmms_shortlink_mapping` (
  `SHORT_LINK` varchar(100) NOT NULL,
  `REAL_LINK` varchar(500) NOT NULL,
  `SEQ_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tbl_kfmms_trans_query_criteria`
--

CREATE TABLE `tbl_kfmms_trans_query_criteria` (
  `SEQ_ID` char(32) NOT NULL,
  `MOBILE` char(15) NOT NULL,
  `CARD_NO` char(21) NOT NULL,
  `TRANS_DT` char(8) NOT NULL,
  `CHANNEL_NO` char(2) NOT NULL,
  `SHORT_LINK` varchar(100) NOT NULL,
  `LINK_CRT_TS` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tbl_kfmms_trans_query_log`
--

CREATE TABLE `tbl_kfmms_trans_query_log` (
  `SEQ_ID` bigint(20) NOT NULL,
  `MOBILE` char(15) NOT NULL,
  `CARD_NO` char(21) NOT NULL,
  `TRANS_DT` char(8) NOT NULL,
  `CHANNEL_NO` char(2) NOT NULL,
  `TRANS_AT` char(12) NOT NULL,
  `QUERY_DAY` char(2) NOT NULL,
  `QUERY_MONTH` char(2) NOT NULL,
  `QUERY_YEAR` char(4) NOT NULL,
  `QUERY_TIME` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_kfmms_channel_inf`
--
ALTER TABLE `tbl_kfmms_channel_inf`
  ADD PRIMARY KEY (`SEQ_ID`);

--
-- Indexes for table `tbl_kfmms_hot_activity_inf`
--
ALTER TABLE `tbl_kfmms_hot_activity_inf`
  ADD PRIMARY KEY (`SEQ_ID`);

--
-- Indexes for table `tbl_kfmms_maktg_activity_inf`
--
ALTER TABLE `tbl_kfmms_maktg_activity_inf`
  ADD PRIMARY KEY (`SEQ_ID`);

--
-- Indexes for table `tbl_kfmms_shortlink_mapping`
--
ALTER TABLE `tbl_kfmms_shortlink_mapping`
  ADD PRIMARY KEY (`SHORT_LINK`);

--
-- Indexes for table `tbl_kfmms_trans_query_criteria`
--
ALTER TABLE `tbl_kfmms_trans_query_criteria`
  ADD PRIMARY KEY (`SEQ_ID`);

--
-- Indexes for table `tbl_kfmms_trans_query_log`
--
ALTER TABLE `tbl_kfmms_trans_query_log`
  ADD PRIMARY KEY (`SEQ_ID`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `tbl_kfmms_channel_inf`
--
ALTER TABLE `tbl_kfmms_channel_inf`
  MODIFY `SEQ_ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `tbl_kfmms_hot_activity_inf`
--
ALTER TABLE `tbl_kfmms_hot_activity_inf`
  MODIFY `SEQ_ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- 使用表AUTO_INCREMENT `tbl_kfmms_maktg_activity_inf`
--
ALTER TABLE `tbl_kfmms_maktg_activity_inf`
  MODIFY `SEQ_ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `tbl_kfmms_trans_query_log`
--
ALTER TABLE `tbl_kfmms_trans_query_log`
  MODIFY `SEQ_ID` bigint(20) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
