-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2020-07-16 01:28:28
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
(2, 'admin@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'admin', '2020-06-17', '0922222222', 'a', '2020-07-08 09:57:45'),
(3, 'ben@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'ben', '2019-01-12', '0944444444', 'b', '2020-07-14 21:01:28'),
(4, 'may@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'may', '2020-07-01', '0943214321', 'g', '2020-07-14 21:40:10'),
(5, 'pete@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'pete', '2020-06-29', '0912121212', 'g', '2020-07-15 20:23:24');

-- --------------------------------------------------------

--
-- 資料表結構 `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `products_no` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `products_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `products_imformation_alc` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `products_imformation` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `products_price` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `products`
--

INSERT INTO `products` (`products_no`, `products_name`, `products_imformation_alc`, `products_imformation`, `products_price`) VALUES
('p01', 'whisky', '48%', '', 2000),
('p02', 'Red Wine', '15%', '', 2000),
('p03', 'Beer', '5%', '', 100),
('p07', '2222', '2222', '', 2222);

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
(5, 'joy@gmail.com', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'joy', '2020-07-07', '0944445555', 'g', '2020-07-12 13:41:30');

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
('r03', 'restaurant_03', 'All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy', 'g', 100000, '2020-07-09 09:38:34');

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
(7, 'r01', 1, '2020-07-23', '聚餐', 'may', '0911112222', 'u', '2020-07-11 19:25:21'),
(19, 'r03', 4, '2020-07-24', '聚餐', 'vicky', '0912345678', 'u', '2020-07-15 20:26:06'),
(20, 'r03', 4, '2020-07-31', '聚餐', 'vicky', '0933445566', 'u', '2020-07-15 20:26:33'),
(21, 'r02', 4, '2020-07-29', '商務會議', 'kk', '0911112222', 'u', '2020-07-15 20:27:01'),
(22, 'r02', 4, '2020-08-01', '畢業舞會', 'qq', '0912121212', 'u', '2020-07-15 20:27:39'),
(23, 'r01', 4, '2020-07-31', '商務會議', 'joe', '0909090909', 'u', '2020-07-15 20:28:19'),
(24, 'r03', 5, '2020-07-16', '聚餐', 'vicky', '0909090909', 'u', '2020-07-15 20:29:10'),
(25, 'r03', 5, '2020-07-29', '商務會議', 'may', '0912121212', 'u', '2020-07-15 20:29:36'),
(26, 'r02', 5, '2020-07-30', '畢業舞會', 'kk', '0912345678', 'u', '2020-07-15 20:30:06'),
(27, 'r01', 5, '2020-07-25', '商務會議', 'kk', '0912345678', 'u', '2020-07-15 20:30:51');

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
('OHullWb6Z7Qn-1WCyNOjcOffHuFW6jZ6', 1596033770, '{\"cookie\":{\"originalMaxAge\":1199999999,\"expires\":\"2020-07-29T14:42:12.790Z\",\"httpOnly\":true,\"path\":\"/\"},\"User\":{\"sid\":2,\"email\":\"admin@gmail.com\",\"password\":\"40bd001563085fc35165329ea1ff5c5ecbdbbeef\",\"name\":\"admin\",\"birthday\":\"2020-06-16T16:00:00.000Z\",\"phone\":\"0922222222\",\"type\":\"a\",\"createtime\":\"2020-07-08T01:57:45.000Z\"}}');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`products_no`);

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
  MODIFY `sid` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `register`
--
ALTER TABLE `register`
  MODIFY `rid` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `restaurant_shoppinglist`
--
ALTER TABLE `restaurant_shoppinglist`
  MODIFY `rslid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
