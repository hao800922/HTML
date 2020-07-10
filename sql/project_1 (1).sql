-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2020-07-10 12:01:37
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

-- --------------------------------------------------------

--
-- 資料表結構 `account`
--

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

CREATE TABLE `register` (
  `rid` int UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `birthday` date NOT NULL,
  `phone` varchar(255) NOT NULL,
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `restaurant`
--

CREATE TABLE `restaurant` (
  `restaurant_NO` varchar(2) NOT NULL,
  `restaurant_title` varchar(255) NOT NULL,
  `restaurant_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `restaurant_type` varchar(255) NOT NULL,
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `restaurant`
--

INSERT INTO `restaurant` (`restaurant_NO`, `restaurant_title`, `restaurant_content`, `restaurant_type`, `createtime`) VALUES
('01', 'restaurant_01', 'All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy.', '', '2020-07-08 16:48:06'),
('02', 'restaurant_02', 'All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy.', '', '2020-07-08 16:48:43'),
('03', 'restaurant_03', 'All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy. All work and no play makes jack a dull boy', '', '2020-07-09 09:38:34');

-- --------------------------------------------------------

--
-- 資料表結構 `rest_status`
--

CREATE TABLE `rest_status` (
  `restaurant_NO` varchar(2) NOT NULL,
  `D20200710` int NOT NULL,
  `D20200711` int NOT NULL,
  `D20200712` int NOT NULL,
  `D20200713` int NOT NULL,
  `D20200714` int NOT NULL,
  `D20200715` int NOT NULL,
  `D20200716` int NOT NULL,
  `D20200717` int NOT NULL,
  `D20200718` int NOT NULL,
  `D20200719` int NOT NULL,
  `D20200720` int NOT NULL,
  `D20200721` int NOT NULL,
  `D20200722` int NOT NULL,
  `D20200723` int NOT NULL,
  `D20200724` int NOT NULL,
  `D20200725` int NOT NULL,
  `D20200726` int NOT NULL,
  `D20200727` int NOT NULL,
  `D20200728` int NOT NULL,
  `D20200729` int NOT NULL,
  `D20200730` int NOT NULL,
  `D20200731` int NOT NULL,
  `D20200801` int NOT NULL,
  `D20200802` int NOT NULL,
  `D20200803` int NOT NULL,
  `D20200804` int NOT NULL,
  `D20200805` int NOT NULL,
  `D20200806` int NOT NULL,
  `D20200807` int NOT NULL,
  `D20200808` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `rest_status`
--

INSERT INTO `rest_status` (`restaurant_NO`, `D20200710`, `D20200711`, `D20200712`, `D20200713`, `D20200714`, `D20200715`, `D20200716`, `D20200717`, `D20200718`, `D20200719`, `D20200720`, `D20200721`, `D20200722`, `D20200723`, `D20200724`, `D20200725`, `D20200726`, `D20200727`, `D20200728`, `D20200729`, `D20200730`, `D20200731`, `D20200801`, `D20200802`, `D20200803`, `D20200804`, `D20200805`, `D20200806`, `D20200807`, `D20200808`) VALUES
('01', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('02', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `shoppinglist_rest`
--

CREATE TABLE `shoppinglist_rest` (
  `NO` int UNSIGNED NOT NULL,
  `sid` int NOT NULL,
  `restaurant_NO` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` date NOT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `shoppinglist_rest`
--

INSERT INTO `shoppinglist_rest` (`NO`, `sid`, `restaurant_NO`, `date`, `status`, `createtime`) VALUES
(1, 1, '01', '2020-07-22', 'u', '2020-07-10 08:57:59');

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
-- 資料表索引 `rest_status`
--
ALTER TABLE `rest_status`
  ADD PRIMARY KEY (`restaurant_NO`);

--
-- 資料表索引 `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- 資料表索引 `shoppinglist_rest`
--
ALTER TABLE `shoppinglist_rest`
  ADD PRIMARY KEY (`NO`);

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
  MODIFY `rid` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `shoppinglist_rest`
--
ALTER TABLE `shoppinglist_rest`
  MODIFY `NO` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
