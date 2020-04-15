-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2020 年 04 月 15 日 13:55
-- 伺服器版本： 10.4.10-MariaDB
-- PHP 版本： 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `logistics_302`
--

-- --------------------------------------------------------

--
-- 資料表結構 `delivery`
--

CREATE TABLE `delivery` (
  `id` int(11) NOT NULL,
  `created_date` date NOT NULL DEFAULT current_timestamp(),
  `ds_order_id` varchar(20) NOT NULL,
  `ds_customer_id` varchar(20) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contact_no` varchar(8) NOT NULL,
  `cash_on_delivery` enum('yes','no') NOT NULL,
  `payment_amount` float DEFAULT NULL,
  `delivered_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `delivery`
--

INSERT INTO `delivery` (`id`, `created_date`, `ds_order_id`, `ds_customer_id`, `customer_name`, `address`, `contact_no`, `cash_on_delivery`, `payment_amount`, `delivered_date`) VALUES
(1, '2020-03-07', '103', '1', 'Sofie', 'abc, abc, def', '12341234', 'yes', 1900, NULL),
(2, '2020-03-07', '104', '1', 'Sofie', 'abc, abc, def', '12341234', 'yes', 1900, NULL),
(3, '2020-03-07', '105', '1', 'Sofie', 'abc, abc, def', '12341234', 'yes', 1900, NULL),
(4, '2020-03-07', '96', '1', 'Sofie', 'abc, abc, def', '12341234', 'yes', 1900, NULL),
(5, '2020-03-07', '96', '1', 'Sofie', 'abc, abc, def', '12341234', 'yes', 1900, NULL),
(6, '2020-03-07', '96', '1', 'Sofie', 'abc, abc, def', '12341234', 'yes', 1900, NULL),
(7, '2020-03-07', '96', '1', 'Sofie', 'abc, abc, def', '12341234', 'yes', 1900, NULL),
(8, '2020-03-07', '96', '1', 'Sofie', 'abc, abc, def', '12341234', 'yes', 1900, NULL),
(9, '2020-03-07', '96', '1', 'Sofie', 'abc, abc, def', '12341234', 'yes', 1900, NULL),
(10, '2020-03-07', '96', '1', 'Sofie', 'abc, abc, def', '12341234', 'yes', 1900, NULL),
(11, '2020-03-07', '96', '1', 'Sofie', 'abc, abc, def', '12341234', 'yes', 1900, NULL),
(12, '2020-03-07', '96', '1', 'Sofie', 'abc, abc, def', '12341234', 'yes', 1900, NULL),
(13, '2020-03-07', '96', '1', 'Sofie', 'abc, abc, def', '12341234', 'yes', 1900, NULL),
(14, '2020-03-07', '106', '1', 'Sofie', 'abc, abc, def', '12341234', 'yes', 1900, NULL),
(15, '2020-03-07', '107', '1', 'Sofie', 'abc, abc, def', '12341234', 'yes', 1900, NULL),
(16, '2020-03-07', '108', '1', 'Sofie', 'abc, abc, def', '12341234', 'yes', 1900, NULL),
(17, '2020-03-07', '109', '1', 'Sofie', 'abc, abc, def', '12341234', 'yes', 1900, NULL),
(18, '2020-03-07', '110', '1', 'Sofie', 'abc, abc, def', '12341234', 'yes', 1900, NULL),
(19, '2020-03-07', '111', '1', 'Sofie', 'abc, abc, def', '12341234', 'yes', 1900, NULL),
(20, '2020-03-07', '112', '1', 'Sofie', 'abc, abc, def', '12341234', 'yes', 1900, NULL),
(21, '2020-03-07', '113', '1', 'Sofie', 'abc, abc, def', '12341234', 'yes', 1900, NULL),
(22, '2020-03-07', '114', '1', 'Sofie', 'abc, abc, def', '12341234', 'yes', 1900, NULL),
(23, '2020-03-07', '115', '1', 'Sofie', 'abc, abc, def', '12341234', 'yes', 1900, NULL),
(24, '2020-03-07', '116', '1', 'Sofie', 'abc, abc, def', '12341234', 'yes', 1900, NULL),
(25, '2020-03-07', '117', '1', 'Sofie', 'abc, abc, def', '12341234', 'yes', 1900, NULL),
(26, '2020-03-11', '118', '1', 'Sofie', 'abc, abc, def', '12341234', 'yes', 1900, NULL),
(27, '2020-03-11', '121', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 3900, NULL),
(28, '2020-03-11', '122', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4200, NULL),
(29, '2020-03-17', '123', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(30, '2020-03-17', '125', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(31, '2020-03-21', '126', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(32, '2020-03-21', '127', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(33, '2020-03-21', '128', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(34, '2020-03-21', '129', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(35, '2020-03-21', '130', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(36, '2020-03-21', '131', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(37, '2020-03-21', '132', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(38, '2020-03-22', '134', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(39, '2020-03-22', '135', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(40, '2020-03-22', '136', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(41, '2020-03-22', '137', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(42, '2020-03-22', '138', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(43, '2020-03-22', '139', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(44, '2020-03-22', '140', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(45, '2020-03-22', '141', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(46, '2020-03-22', '142', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(47, '2020-03-22', '143', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(48, '2020-03-22', '144', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(49, '2020-03-22', '145', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(50, '2020-03-22', '146', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(51, '2020-03-22', '147', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(52, '2020-03-22', '148', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(53, '2020-03-22', '149', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(54, '2020-03-22', '150', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(55, '2020-03-22', '151', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(56, '2020-03-22', '152', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(57, '2020-03-22', '153', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(58, '2020-03-22', '154', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(59, '2020-03-22', '155', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(60, '2020-03-22', '156', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(61, '2020-03-22', '157', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(62, '2020-03-22', '158', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(63, '2020-03-22', '159', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(64, '2020-03-22', '160', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(65, '2020-03-22', '161', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(66, '2020-03-22', '162', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, '2020-04-02'),
(67, '2020-03-25', '163', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(68, '2020-03-25', '164', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 4400, NULL),
(69, '2020-03-25', '165', '3', 'Ken', 'abcd,123', '63635252', 'yes', 5250, NULL),
(70, '2020-03-26', '166', '3', 'Ken', 'abcd,123', '63635252', 'yes', 5250, NULL),
(71, '2020-04-02', '167', '3', 'Ken', 'abcd,123', '63635252', 'yes', 5250, NULL),
(72, '2020-04-02', '168', '3', 'Ken', 'abcd,123', '63635252', 'yes', 5250, NULL),
(73, '2020-04-02', '169', '3', 'Ken', 'abcd,123', '63635252', 'yes', 5250, NULL),
(74, '2020-04-02', '170', '3', 'Ken', 'abcd,123', '63635252', 'yes', 5250, NULL),
(75, '2020-04-02', '171', '3', 'Ken', 'abcd,123', '63635252', 'yes', 5250, NULL),
(76, '2020-04-02', '172', '3', 'Ken', 'abcd,123', '63635252', 'yes', 5250, NULL),
(77, '2020-04-02', '173', '3', 'Ken', 'abcd,123', '63635252', 'yes', 5250, NULL),
(78, '2020-04-02', '174', '3', 'Ken', 'abcd,123', '63635252', 'yes', 5250, NULL),
(79, '2020-04-02', '175', '3', 'Ken', 'abcd,123', '63635252', 'yes', 5250, NULL),
(80, '2020-04-02', '176', '3', 'Ken', 'abcd,123', '63635252', 'yes', 5250, NULL),
(81, '2020-04-02', '177', '3', 'Ken', 'abcd,123', '63635252', 'yes', 5250, NULL),
(82, '2020-04-02', '178', '3', 'Ken', 'abcd,123', '63635252', 'yes', 5250, NULL),
(83, '2020-04-02', '179', '3', 'Ken', 'abcd,123', '63635252', 'yes', 5250, NULL),
(84, '2020-04-02', '180', '3', 'Ken', 'abcd,123', '63635252', 'yes', 5250, NULL),
(85, '2020-04-02', '181', '3', 'Ken', 'abcd,123', '63635252', 'yes', 5250, NULL),
(86, '2020-04-02', '182', '3', 'Ken', 'abcd,123', '63635252', 'yes', 5250, NULL),
(87, '2020-04-02', '183', '3', 'Ken', 'abcd,123', '63635252', 'yes', 5250, NULL),
(88, '2020-04-02', '184', '3', 'Ken', 'abcd,123', '63635252', 'yes', 5250, NULL),
(89, '2020-04-02', '185', '3', 'Ken', 'abcd,123', '63635252', 'yes', 5250, NULL),
(90, '2020-04-02', '186', '3', 'Ken', 'abcd,123', '63635252', 'yes', 5250, NULL),
(91, '2020-04-02', '187', '3', 'Ken', 'abcd,123', '63635252', 'yes', 5250, NULL),
(92, '2020-04-02', '188', '3', 'Ken', 'abcd,123', '63635252', 'yes', 5250, NULL),
(93, '2020-04-15', '189', '3', 'Ken', 'abcd,123', '63635252', 'yes', 5250, '2020-04-15'),
(94, '2020-04-15', '190', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 5410, '2020-04-15'),
(95, '2020-04-15', '191', '2', 'Daisy', 'aaa,bbb,ccc', '23121231', 'yes', 5490, '2020-04-15');

-- --------------------------------------------------------

--
-- 資料表結構 `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `delivery_id` int(11) NOT NULL,
  `ds_product_id` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `delivery_status` enum('delivering','delivered','rejected','cancelled') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `item`
--

INSERT INTO `item` (`id`, `delivery_id`, `ds_product_id`, `quantity`, `delivery_status`) VALUES
(1, 2, '1', 1, 'delivering'),
(2, 2, '2', 2, 'delivering'),
(3, 3, '1', 1, 'delivering'),
(4, 3, '2', 2, 'delivering'),
(5, 4, '1', 1, 'delivering'),
(6, 4, '2', 2, 'delivering'),
(7, 5, '1', 1, 'delivering'),
(8, 5, '2', 2, 'delivering'),
(9, 6, '1', 1, 'delivering'),
(10, 6, '2', 2, 'delivering'),
(11, 7, '1', 1, 'delivering'),
(12, 7, '2', 2, 'delivering'),
(13, 8, '1', 1, 'delivering'),
(14, 8, '2', 2, 'delivering'),
(15, 9, '1', 1, 'delivering'),
(16, 9, '2', 2, 'delivering'),
(17, 10, '1', 1, 'delivering'),
(18, 10, '2', 2, 'delivering'),
(19, 11, '1', 1, 'delivering'),
(20, 11, '2', 2, 'delivering'),
(21, 12, '1', 1, 'delivering'),
(22, 12, '2', 2, 'delivering'),
(23, 13, '1', 1, 'delivering'),
(24, 13, '2', 2, 'delivering'),
(25, 14, '1', 1, 'delivering'),
(26, 14, '2', 2, 'delivering'),
(27, 15, '1', 1, 'delivering'),
(28, 15, '2', 2, 'delivering'),
(29, 16, '1', 1, 'delivering'),
(30, 16, '2', 2, 'delivering'),
(31, 17, '1', 1, 'delivering'),
(32, 17, '2', 2, 'delivering'),
(33, 18, '1', 1, 'delivering'),
(34, 18, '2', 2, 'delivering'),
(35, 19, '1', 1, 'delivering'),
(36, 19, '2', 2, 'delivering'),
(37, 20, '1', 1, 'delivering'),
(38, 20, '2', 2, 'delivering'),
(39, 21, '1', 1, 'delivering'),
(40, 21, '2', 2, 'delivering'),
(41, 22, '1', 1, 'delivering'),
(42, 22, '2', 2, 'delivering'),
(43, 23, '1', 1, 'delivering'),
(44, 23, '2', 2, 'delivering'),
(45, 24, '1', 1, 'delivering'),
(46, 24, '2', 2, 'delivering'),
(47, 25, '1', 1, 'delivering'),
(48, 25, '2', 2, 'delivering'),
(49, 26, '1', 1, 'delivering'),
(50, 26, '2', 2, 'delivering'),
(51, 27, '1', 5, 'delivering'),
(52, 27, '2', 3, 'delivering'),
(53, 28, '1', 6, 'delivering'),
(54, 28, '2', 3, 'delivering'),
(55, 29, '1', 6, 'delivering'),
(56, 29, '2', 3, 'delivering'),
(57, 29, '3', 2, 'delivering'),
(58, 30, '1', 6, 'delivering'),
(59, 30, '2', 3, 'delivering'),
(60, 30, '3', 2, 'delivering'),
(61, 31, '1', 6, 'delivering'),
(62, 31, '2', 3, 'delivering'),
(63, 31, '3', 2, 'delivering'),
(64, 32, '1', 6, 'delivering'),
(65, 32, '2', 3, 'delivering'),
(66, 32, '3', 2, 'delivered'),
(67, 33, '1', 6, 'delivering'),
(68, 33, '2', 3, 'delivering'),
(69, 33, '3', 2, 'delivering'),
(70, 34, '1', 6, 'delivering'),
(71, 34, '2', 3, 'delivering'),
(72, 34, '3', 2, 'delivering'),
(73, 35, '1', 6, 'delivering'),
(74, 35, '2', 3, 'delivering'),
(75, 35, '3', 2, 'delivering'),
(76, 36, '1', 6, 'delivering'),
(77, 36, '2', 3, 'delivering'),
(78, 36, '3', 2, 'delivering'),
(79, 37, '1', 6, 'delivering'),
(80, 37, '2', 3, 'delivering'),
(81, 37, '3', 2, 'delivering'),
(82, 38, '1', 6, 'delivering'),
(83, 38, '2', 3, 'delivering'),
(84, 38, '3', 2, 'delivering'),
(85, 39, '1', 6, 'delivering'),
(86, 39, '2', 3, 'delivering'),
(87, 39, '3', 2, 'delivering'),
(88, 40, '1', 6, 'delivering'),
(89, 40, '2', 3, 'delivering'),
(90, 40, '3', 2, 'delivering'),
(91, 41, '1', 6, 'delivering'),
(92, 41, '2', 3, 'delivering'),
(93, 41, '3', 2, 'delivering'),
(94, 42, '1', 6, 'delivering'),
(95, 42, '2', 3, 'delivering'),
(96, 42, '3', 2, 'delivering'),
(97, 43, '1', 6, 'delivering'),
(98, 43, '2', 3, 'delivering'),
(99, 43, '3', 2, 'delivering'),
(100, 44, '1', 6, 'delivering'),
(101, 44, '2', 3, 'delivering'),
(102, 44, '3', 2, 'delivering'),
(103, 45, '1', 6, 'delivering'),
(104, 45, '2', 3, 'delivering'),
(105, 45, '3', 2, 'delivering'),
(106, 46, '1', 6, 'delivering'),
(107, 46, '2', 3, 'delivering'),
(108, 46, '3', 2, 'delivering'),
(109, 47, '1', 6, 'delivering'),
(110, 47, '2', 3, 'delivering'),
(111, 47, '3', 2, 'delivering'),
(112, 48, '1', 6, 'delivering'),
(113, 48, '2', 3, 'delivering'),
(114, 48, '3', 2, 'delivering'),
(115, 49, '1', 6, 'delivering'),
(116, 49, '2', 3, 'delivering'),
(117, 49, '3', 2, 'delivering'),
(118, 50, '1', 6, 'delivering'),
(119, 50, '2', 3, 'delivering'),
(120, 50, '3', 2, 'delivering'),
(121, 51, '1', 6, 'delivering'),
(122, 51, '2', 3, 'delivering'),
(123, 51, '3', 2, 'delivering'),
(124, 52, '1', 6, 'delivering'),
(125, 52, '2', 3, 'delivering'),
(126, 52, '3', 2, 'delivering'),
(127, 53, '1', 6, 'delivering'),
(128, 53, '2', 3, 'delivering'),
(129, 53, '3', 2, 'delivering'),
(130, 54, '1', 6, 'delivering'),
(131, 54, '2', 3, 'delivering'),
(132, 54, '3', 2, 'delivering'),
(133, 55, '1', 6, 'delivering'),
(134, 55, '2', 3, 'delivering'),
(135, 55, '3', 2, 'delivering'),
(136, 56, '1', 6, 'delivering'),
(137, 56, '2', 3, 'delivering'),
(138, 56, '3', 2, 'delivering'),
(139, 57, '1', 6, 'delivering'),
(140, 57, '2', 3, 'delivering'),
(141, 57, '3', 2, 'delivering'),
(142, 58, '1', 6, 'delivering'),
(143, 58, '2', 3, 'delivering'),
(144, 58, '3', 2, 'delivering'),
(145, 59, '1', 6, 'delivering'),
(146, 59, '2', 3, 'delivering'),
(147, 59, '3', 2, 'delivering'),
(148, 60, '1', 6, 'delivering'),
(149, 60, '2', 3, 'delivering'),
(150, 60, '3', 2, 'delivering'),
(151, 61, '1', 6, 'delivering'),
(152, 61, '2', 3, 'delivering'),
(153, 61, '3', 2, 'delivering'),
(154, 62, '1', 6, 'delivering'),
(155, 62, '2', 3, 'delivering'),
(156, 62, '3', 2, 'delivering'),
(157, 63, '1', 6, 'delivering'),
(158, 63, '2', 3, 'delivering'),
(159, 63, '3', 2, 'delivering'),
(160, 64, '1', 6, 'delivering'),
(161, 64, '2', 3, 'delivering'),
(162, 64, '3', 2, 'delivering'),
(163, 65, '1', 6, 'delivering'),
(164, 65, '2', 3, 'delivering'),
(165, 65, '3', 2, 'delivering'),
(166, 66, '1', 6, 'delivered'),
(167, 66, '2', 3, 'delivered'),
(168, 66, '3', 2, 'delivered'),
(169, 67, '1', 6, 'delivering'),
(170, 67, '2', 3, 'delivering'),
(171, 67, '3', 2, 'delivering'),
(172, 68, '1', 6, 'delivering'),
(173, 68, '2', 3, 'delivering'),
(174, 68, '3', 2, 'delivering'),
(175, 69, '1', 2, 'delivering'),
(176, 69, '2', 4, 'delivering'),
(177, 69, '3', 2, 'delivering'),
(178, 69, '5', 5, 'delivering'),
(179, 70, '1', 2, 'delivering'),
(180, 70, '2', 4, 'delivering'),
(181, 70, '3', 2, 'delivering'),
(182, 70, '5', 5, 'delivering'),
(183, 71, '1', 2, 'delivering'),
(184, 71, '2', 4, 'delivering'),
(185, 71, '3', 2, 'delivering'),
(186, 71, '5', 5, 'delivering'),
(187, 72, '1', 2, 'delivering'),
(188, 72, '2', 4, 'delivering'),
(189, 72, '3', 2, 'delivering'),
(190, 72, '5', 5, 'delivering'),
(191, 73, '1', 2, 'delivering'),
(192, 73, '2', 4, 'delivering'),
(193, 73, '3', 2, 'delivering'),
(194, 73, '5', 5, 'delivering'),
(195, 74, '1', 2, 'delivering'),
(196, 74, '2', 4, 'delivering'),
(197, 74, '3', 2, 'delivering'),
(198, 74, '5', 5, 'delivering'),
(199, 75, '1', 2, 'delivering'),
(200, 75, '2', 4, 'delivering'),
(201, 75, '3', 2, 'delivering'),
(202, 75, '5', 5, 'delivering'),
(203, 76, '1', 2, 'delivering'),
(204, 76, '2', 4, 'delivering'),
(205, 76, '3', 2, 'delivering'),
(206, 76, '5', 5, 'delivering'),
(207, 77, '1', 2, 'delivering'),
(208, 77, '2', 4, 'delivering'),
(209, 77, '3', 2, 'delivering'),
(210, 77, '5', 5, 'delivering'),
(211, 78, '1', 2, 'delivering'),
(212, 78, '2', 4, 'delivering'),
(213, 78, '3', 2, 'delivering'),
(214, 78, '5', 5, 'delivering'),
(215, 79, '1', 2, 'delivering'),
(216, 79, '2', 4, 'delivering'),
(217, 79, '3', 2, 'delivering'),
(218, 79, '5', 5, 'delivering'),
(219, 80, '1', 2, 'delivering'),
(220, 80, '2', 4, 'delivering'),
(221, 80, '3', 2, 'delivering'),
(222, 80, '5', 5, 'delivering'),
(223, 81, '1', 2, 'delivering'),
(224, 81, '2', 4, 'delivering'),
(225, 81, '3', 2, 'delivering'),
(226, 81, '5', 5, 'delivering'),
(227, 82, '1', 2, 'delivering'),
(228, 82, '2', 4, 'delivering'),
(229, 82, '3', 2, 'delivering'),
(230, 82, '5', 5, 'delivering'),
(231, 83, '1', 2, 'delivering'),
(232, 83, '2', 4, 'delivering'),
(233, 83, '3', 2, 'delivering'),
(234, 83, '5', 5, 'delivering'),
(235, 84, '1', 2, 'delivering'),
(236, 84, '2', 4, 'delivering'),
(237, 84, '3', 2, 'delivering'),
(238, 84, '5', 5, 'delivering'),
(239, 85, '1', 2, 'delivering'),
(240, 85, '2', 4, 'delivering'),
(241, 85, '3', 2, 'delivering'),
(242, 85, '5', 5, 'delivering'),
(243, 86, '1', 2, 'delivering'),
(244, 86, '2', 4, 'delivering'),
(245, 86, '3', 2, 'delivering'),
(246, 86, '5', 5, 'delivering'),
(247, 87, '1', 2, 'delivering'),
(248, 87, '2', 4, 'delivering'),
(249, 87, '3', 2, 'delivering'),
(250, 87, '5', 5, 'delivering'),
(251, 88, '1', 2, 'delivering'),
(252, 88, '2', 4, 'delivering'),
(253, 88, '3', 2, 'delivering'),
(254, 88, '5', 5, 'delivering'),
(255, 89, '1', 2, 'delivering'),
(256, 89, '2', 4, 'delivering'),
(257, 89, '3', 2, 'delivering'),
(258, 89, '5', 5, 'delivering'),
(259, 90, '1', 2, 'delivering'),
(260, 90, '2', 4, 'delivering'),
(261, 90, '3', 2, 'delivering'),
(262, 90, '5', 5, 'delivering'),
(263, 91, '1', 2, 'delivering'),
(264, 91, '2', 4, 'delivering'),
(265, 91, '3', 2, 'delivering'),
(266, 91, '5', 5, 'delivering'),
(267, 92, '1', 2, 'delivering'),
(268, 92, '2', 4, 'delivering'),
(269, 92, '3', 2, 'delivering'),
(270, 92, '5', 5, 'delivering'),
(271, 93, '1', 2, 'delivered'),
(272, 93, '2', 4, 'delivered'),
(273, 93, '3', 2, 'delivered'),
(274, 93, '5', 5, 'delivered'),
(275, 94, '1', 2, 'delivered'),
(276, 94, '2', 4, 'delivered'),
(277, 94, '3', 2, 'delivered'),
(278, 94, '4', 2, 'delivered'),
(279, 94, '5', 5, 'delivered'),
(280, 95, '1', 2, 'delivered'),
(281, 95, '2', 4, 'delivered'),
(282, 95, '3', 2, 'delivered'),
(283, 95, '4', 3, 'delivered'),
(284, 95, '5', 5, 'delivered');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_id` (`delivery_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `delivery`
--
ALTER TABLE `delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=285;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`delivery_id`) REFERENCES `delivery` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
