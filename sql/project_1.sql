-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2020-07-13 10:57:14
-- 伺服器版本： 8.0.20
-- PHP 版本： 7.3.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `project_1`
--
CREATE DATABASE IF NOT EXISTS `project_1` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `project_1`;

-- --------------------------------------------------------

--
-- 資料表結構 `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `sid` int UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `birthday` date NOT NULL,
  `phone` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `account`
--

INSERT INTO `account` (`sid`, `email`, `password`, `name`, `birthday`, `phone`, `type`, `createtime`) VALUES
(1, 'john@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'John', '2020-06-17', '0911111111', 'g', '2020-07-08 09:56:07'),
(2, 'admin@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'admin', '2020-06-17', '0922222222', 'a', '2020-07-08 09:57:45');

-- --------------------------------------------------------

--
-- 資料表結構 `register`
--

DROP TABLE IF EXISTS `register`;
CREATE TABLE `register` (
  `rid` int UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `birthday` date NOT NULL,
  `phone` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `register`
--

INSERT INTO `register` (`rid`, `email`, `password`, `name`, `birthday`, `phone`, `type`, `createtime`) VALUES
(1, 'ken@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'ken', '2020-07-23', '0912341234', 'g', '2020-07-12 12:05:16'),
(3, 'ben@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'ben', '2019-01-12', '0944444444', 'g', '2020-07-12 13:29:10'),
(4, 'may@gmail.com', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'may', '2020-07-01', '0943214321', 'g', '2020-07-12 13:31:36'),
(5, 'joy@gmail.com', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'joy', '2020-07-07', '0944445555', 'g', '2020-07-12 13:41:30'),
(6, 'pete@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'pete', '2020-06-29', '0912121212', 'g', '2020-07-12 13:54:41');

-- --------------------------------------------------------

--
-- 資料表結構 `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
CREATE TABLE `restaurant` (
  `restaurant_NO` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `restaurant_title` varchar(255) NOT NULL,
  `restaurant_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `restaurant_type` varchar(255) NOT NULL,
  `restaurant_price` int NOT NULL,
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `restaurant`
--

INSERT INTO `restaurant` (`restaurant_NO`, `restaurant_title`, `restaurant_content`, `restaurant_type`, `restaurant_price`, `createtime`) VALUES
('r01', 'restaurant_01', 'All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy.', 'g', 100000, '2020-07-08 16:48:06'),
('r02', 'restaurant_02', 'All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy.', 'g', 100000, '2020-07-08 16:48:43'),
('r03', 'restaurant_03', 'All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy', 'g', 100000, '2020-07-09 09:38:34'),
('r04', 'restaurant_04', 'All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy', 'g', 100000, '2020-07-12 23:41:16');

-- --------------------------------------------------------

--
-- 資料表結構 `restaurant_shoppinglist`
--

DROP TABLE IF EXISTS `restaurant_shoppinglist`;
CREATE TABLE `restaurant_shoppinglist` (
  `rslid` int NOT NULL,
  `restaurant_NO` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sid` int NOT NULL,
  `date` date NOT NULL,
  `partyname` varchar(255) NOT NULL,
  `contactperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contactphone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(2) NOT NULL,
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `restaurant_shoppinglist`
--

INSERT INTO `restaurant_shoppinglist` (`rslid`, `restaurant_NO`, `sid`, `date`, `partyname`, `contactperson`, `contactphone`, `status`, `createtime`) VALUES
(4, 'r02', 1, '2020-07-24', '舞會', 'ken', '0922222222', 'u', '2020-07-11 15:55:58'),
(5, 'r01', 1, '2020-07-30', '畢業舞會', 'vicky', '0912345678', 'u', '2020-07-11 16:54:03'),
(7, 'r01', 1, '2020-07-23', '聚餐', 'may', '0911112222', 'u', '2020-07-11 19:25:21');

-- --------------------------------------------------------

--
-- 資料表結構 `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('0JFxsfYQuYpJl7uNq5xNwjGdNqZ3xzM4', 1595830501, '{\"cookie\":{\"originalMaxAge\":1200000000,\"expires\":\"2020-07-27T06:11:42.045Z\",\"httpOnly\":true,\"path\":\"/\"},\"User\":{\"sid\":1,\"email\":\"john@gmail.com\",\"password\":\"40bd001563085fc35165329ea1ff5c5ecbdbbeef\",\"name\":\"John\",\"birthday\":\"2020-06-16T16:00:00.000Z\",\"phone\":\"0911111111\",\"type\":\"g\",\"createtime\":\"2020-07-08T01:56:07.000Z\"}}'),
('OHullWb6Z7Qn-1WCyNOjcOffHuFW6jZ6', 1595773546, '{\"cookie\":{\"originalMaxAge\":1200000000,\"expires\":\"2020-07-26T14:25:11.816Z\",\"httpOnly\":true,\"path\":\"/\"},\"User\":{\"sid\":1,\"email\":\"john@gmail.com\",\"password\":\"40bd001563085fc35165329ea1ff5c5ecbdbbeef\",\"name\":\"John\",\"birthday\":\"2020-06-16T16:00:00.000Z\",\"phone\":\"0911111111\",\"type\":\"g\",\"createtime\":\"2020-07-08T01:56:07.000Z\"}}');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`rid`);

--
-- 資料表索引 `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`restaurant_NO`);

--
-- 資料表索引 `restaurant_shoppinglist`
--
ALTER TABLE `restaurant_shoppinglist`
  ADD PRIMARY KEY (`rslid`);

--
-- 資料表索引 `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `account`
--
ALTER TABLE `account`
  MODIFY `sid` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `register`
--
ALTER TABLE `register`
  MODIFY `rid` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `restaurant_shoppinglist`
--
ALTER TABLE `restaurant_shoppinglist`
  MODIFY `rslid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
