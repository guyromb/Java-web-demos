-- phpMyAdmin SQL Dump
-- version 4.6.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 2016-10-08 19:13:11
-- 服务器版本： 5.6.32
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student`
--

-- --------------------------------------------------------

--
-- 表的结构 `newstudent`
--

CREATE TABLE `newstudent` (
  `name` varchar(40) NOT NULL,
  `age` int(3) NOT NULL,
  `phone` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `newstudent`
--

INSERT INTO `newstudent` (`name`, `age`, `phone`) VALUES
('小明', 15, '111111111111'),
('小红', 16, '222222222222'),
('小王', 17, '333333333333');

-- --------------------------------------------------------

--
-- 表的结构 `newstudent2`
--

CREATE TABLE `newstudent2` (
  `id` int(3) NOT NULL,
  `name` varchar(40) NOT NULL,
  `phone` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `newstudent2`
--

INSERT INTO `newstudent2` (`id`, `name`, `phone`) VALUES
(1, '小红', '111111'),
(2, '小明', '222222');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
