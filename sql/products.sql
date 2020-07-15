-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2020-07-15 11:19:39
-- 伺服器版本： 8.0.20
-- PHP 版本： 7.4.7

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

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`products_no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
