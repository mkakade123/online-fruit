-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2022 at 09:32 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fruit`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categorieId` int(12) NOT NULL,
  `categorieName` varchar(255) NOT NULL,
  `categorieDesc` text NOT NULL,
  `categorieCreateDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categorieId`, `categorieName`, `categorieDesc`, `categorieCreateDate`) VALUES
(10, 'Regular fruits', 'Behold natures goodies!', '2022-03-20 16:34:52'),
(20, 'Spring Season Fruits', 'Spring is the time of plans and fruits.', '2022-03-15 21:44:27'),
(30, 'Winter Season Fruits', 'Winter', '2022-03-20 22:49:56'),
(40, 'Summer Season Fruits', 'Man-go to the beach and tell me that its not pear-fect', '2022-03-19 00:38:23'),
(50, 'Rainy Season Fruits', 'Autumn is the mellower season, and what we lose in flowers we more than gain in fruits.', '2022-03-19 01:52:53'),
(60, 'Fruit Juices', 'A fruit gives healthy mind but a fruit juice gives you a healthy body too ', '2022-03-19 01:59:55'),
(70, 'Fruit Salad', 'A fruit salad is delicious precisely because each fruit maintains its own flavor', '2022-03-19 02:07:56');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contactId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `orderId` int(21) NOT NULL DEFAULT 0 COMMENT 'If problem is not related to the order then order id = 0',
  `message` text NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contactId`, `userId`, `email`, `phoneNo`, `orderId`, `message`, `time`) VALUES
(2, 6, 'mrcloudy@yahoo.in', 9532326897, 18, 'problem', '2022-03-25 08:51:17');

-- --------------------------------------------------------

--
-- Table structure for table `contactreply`
--

CREATE TABLE `contactreply` (
  `id` int(21) NOT NULL,
  `contactId` int(21) NOT NULL,
  `userId` int(23) NOT NULL,
  `message` text NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contactreply`
--

INSERT INTO `contactreply` (`id`, `contactId`, `userId`, `message`, `datetime`) VALUES
(3, 2, 6, 'sorry', '2022-03-25 08:51:58');

-- --------------------------------------------------------

--
-- Table structure for table `deliveryboy`
--

CREATE TABLE `deliveryboy` (
  `deliveryboyid` int(12) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `deliveryboydesc` text NOT NULL,
  `Joiningdate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deliveryboy`
--

INSERT INTO `deliveryboy` (`deliveryboyid`, `Name`, `deliveryboydesc`, `Joiningdate`) VALUES
(1, 'Tushar Choudhary', '8888888888', '2022-03-22 00:22:54'),
(2, 'Ketan Jayatkar', '9123546875', '0000-00-00 00:00:00'),
(3, 'Aniket Parker', '9874562135', '2022-03-22 00:23:12');

-- --------------------------------------------------------

--
-- Table structure for table `deliverydetails`
--

CREATE TABLE `deliverydetails` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `deliveryBoyName` varchar(35) NOT NULL,
  `deliveryBoyPhoneNo` bigint(25) NOT NULL,
  `deliveryTime` int(200) NOT NULL COMMENT 'Time in minutes',
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deliverydetails`
--

INSERT INTO `deliverydetails` (`id`, `orderId`, `deliveryBoyName`, `deliveryBoyPhoneNo`, `deliveryTime`, `dateTime`) VALUES
(1, 5, 'Mohit Vilas Kakade', 252525252, 2, '2022-03-17 22:51:11'),
(2, 6, 'Pratik Kakade', 9130556555, 4, '2022-03-22 15:32:42'),
(3, 8, 'mk', 3232323232, 9, '2022-03-19 12:23:01'),
(4, 10, 'Gajanan', 9513145441, 30, '2022-03-20 01:05:24'),
(5, 12, 'mohit', 9130710047, 50, '2022-03-22 10:35:56'),
(6, 18, 'Pratik Kakade', 9527993093, 30, '2022-03-25 08:34:03');

-- --------------------------------------------------------

--
-- Table structure for table `fruit`
--

CREATE TABLE `fruit` (
  `fruitId` int(12) NOT NULL,
  `fruitName` varchar(255) NOT NULL,
  `fruitPrice` int(12) NOT NULL,
  `fruitDesc` text NOT NULL,
  `fruitCategorieId` int(12) NOT NULL,
  `fruitPubDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fruit`
--

INSERT INTO `fruit` (`fruitId`, `fruitName`, `fruitPrice`, `fruitDesc`, `fruitCategorieId`, `fruitPubDate`) VALUES
(2, 'Banana', 40, 'per dozen', 10, '2022-03-15 21:20:58'),
(3, 'Cherries', 170, 'per kg\r\n\r\n\r\n\r\n', 20, '2022-03-15 21:22:07'),
(4, 'Dragon fruit', 80, 'per piece\r\n\r\n', 40, '2022-03-15 21:23:05'),
(5, 'Fig', 200, 'per kg', 30, '2021-03-17 21:23:48'),
(6, 'Guava', 100, 'per kg', 30, '2022-03-15 21:24:38'),
(7, 'Jackfruit', 105, 'per piece', 20, '2022-03-15 21:25:42'),
(8, 'Kiwi', 22, 'per piece', 30, '2022-03-15 21:26:31'),
(9, 'Sweet lime', 30, 'per kg\r\n', 10, '2021-03-17 21:27:21'),
(10, 'Sapodilla(Chikoo)', 40, 'per kg', 30, '2021-03-17 21:28:06'),
(11, 'Orange', 200, 'per kg', 30, '2021-03-17 21:28:49'),
(12, 'Pear', 180, 'per kg\r\n\r\n', 50, '2021-03-17 21:29:41'),
(13, 'Watermelon', 30, 'per piece', 40, '2021-03-17 21:34:37'),
(14, 'Pineapple', 60, 'per kg', 20, '2021-03-17 21:35:31'),
(15, 'Strawberry', 200, 'per kg\r\n\r\n', 20, '2022-03-15 21:36:36'),
(16, 'Grapes', 200, 'per kg', 30, '2022-03-15 21:37:21'),
(17, 'pomegranate', 100, 'per kg', 50, '2022-03-15 21:38:13'),
(18, 'Avocado', 255, '2 pcs approx (500g-700g)', 10, '2022-03-15 21:39:49'),
(19, 'Blackberry', 300, 'per kg', 40, '2022-03-15 21:40:58'),
(20, 'Peach', 225, 'per kg', 50, '2022-03-15 21:41:49'),
(21, 'Coconut', 50, 'per piece', 10, '2022-03-15 21:44:44'),
(22, 'Plum', 325, 'per kg', 40, '2022-03-15 21:45:34'),
(23, 'Custard apple', 120, 'per kg', 50, '2022-03-15 21:46:21'),
(25, 'Papaya', 50, 'per piece', 50, '2022-03-15 21:47:51'),
(69, 'Apple', 170, 'per kg', 10, '2022-03-16 02:14:29'),
(70, 'Mango', 300, 'per kg', 40, '2022-03-19 20:39:52'),
(71, 'Classic fruit Salad', 50, 'per serve(500g)', 70, '2022-03-20 00:30:01'),
(72, 'Strawberry Pineapple Fruit Salsa with Cinnamon Fruit Salad', 250, 'per serve(500g)', 70, '2022-03-20 00:35:08'),
(73, 'Berry Watermelon Fruit Salad', 180, 'per serve(500g)', 70, '2022-03-20 00:36:12'),
(74, 'Winter Fruit Salad', 135, 'per serve(500g)', 70, '2022-03-20 00:37:12'),
(75, 'Honey Lime Rainbow Fruit Salad', 300, 'per serve(500g)', 70, '2022-03-20 00:38:05'),
(76, 'Hawaiian Fresh Fruit Salad', 250, 'per serve(500g)', 70, '2022-03-20 00:38:54'),
(77, 'Melon and Papaya', 99, 'per serve(500g)', 70, '2022-03-20 00:40:04'),
(78, 'Rainbow Fruit Salad', 549, 'Healthy fruit salad per serve(1000g)', 70, '2022-03-20 00:45:28'),
(79, 'Musk melon', 90, 'per kg', 40, '2022-03-20 14:20:57'),
(80, 'Lychee', 60, 'per kg', 20, '2022-03-20 14:23:13'),
(81, 'Dates', 300, 'per kg', 30, '2022-03-20 14:48:27'),
(82, 'Apple Juice', 100, 'Refreshment', 60, '2022-03-20 23:02:21'),
(83, 'Watermelon Juice', 110, 'Refreshment', 60, '2022-03-20 23:03:58'),
(84, 'Orange Juice', 90, 'Refreshment', 60, '2022-03-20 23:05:40'),
(85, 'Banana Shake', 150, 'Refreshment', 60, '2022-03-20 23:06:55'),
(86, 'Mango juice', 99, 'Refreshment', 60, '2022-03-20 23:08:08'),
(87, 'kiwi', 20, 'kiwi', 0, '2022-03-25 08:37:38');

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `fruitId` int(21) NOT NULL,
  `itemQuantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`id`, `orderId`, `fruitId`, `itemQuantity`) VALUES
(1, 1, 1, 1),
(2, 2, 42, 1),
(3, 7, 2, 1),
(4, 8, 2, 1),
(5, 9, 2, 399),
(6, 10, 2, 5),
(7, 10, 78, 1),
(8, 11, 7, 200),
(9, 12, 2, 15),
(10, 12, 7, 1),
(11, 12, 19, 12),
(12, 13, 2, 3),
(13, 14, 2, 5),
(14, 15, 3, 9),
(15, 16, 2, 9),
(16, 17, 4, 1),
(17, 17, 15, 1),
(18, 18, 82, 9),
(19, 18, 83, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipCode` int(21) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `amount` int(200) NOT NULL,
  `paymentMode` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=cash on delivery, \r\n1=online ',
  `orderStatus` enum('0','1','2','3','4','5','6') NOT NULL DEFAULT '0' COMMENT '0=Order Placed.\r\n1=Order Confirmed.\r\n2=Preparing your Order.\r\n3=Your order is on the way!\r\n4=Order Delivered.\r\n5=Order Denied.\r\n6=Order Cancelled.',
  `orderDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderId`, `userId`, `address`, `zipCode`, `phoneNo`, `amount`, `paymentMode`, `orderStatus`, `orderDate`) VALUES
(5, 2, '302 Rutuvihar near Sagar Investments, ', 421503, 9527993093, 1319, '0', '3', '2022-03-16 22:31:29'),
(17, 9, '302 Rutuvihar near Sagar Investments, ', 421503, 9130710047, 280, '0', '0', '2022-03-25 01:51:44'),
(18, 6, '302 Rutuvihar near Sagar Investments, ', 421503, 9527993093, 1010, '0', '3', '2022-03-25 08:32:45');

-- --------------------------------------------------------

--
-- Table structure for table `sitedetail`
--

CREATE TABLE `sitedetail` (
  `tempId` int(11) NOT NULL,
  `systemName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `contact1` bigint(21) NOT NULL,
  `contact2` bigint(21) DEFAULT NULL COMMENT 'Optional',
  `address` text NOT NULL,
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sitedetail`
--

INSERT INTO `sitedetail` (`tempId`, `systemName`, `email`, `contact1`, `contact2`, `address`, `dateTime`) VALUES
(1, 'FruitoPia', 'mohitkakade2001@gmail.com', 9130710047, 9323111687, '302,Rutu Vihar, Gaondevi , Badlapur(East)', '2022-03-16 19:56:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(21) NOT NULL,
  `username` varchar(21) NOT NULL,
  `firstName` varchar(21) NOT NULL,
  `lastName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `userType` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=user\r\n1=admin',
  `password` varchar(255) NOT NULL,
  `joinDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstName`, `lastName`, `email`, `phone`, `userType`, `password`, `joinDate`) VALUES
(1, 'Mohit', 'Mohit', 'Kakade', 'mohitkakade2001@gmail.com', 9130710047, '1', '$2y$10$AAfxRFOYbl7FdN17rN3fgeiPu/xQrx6MnvRGzqjVHlGqHAM4d9T1i', '2022-04-19 11:40:58'),
(6, 'Cloudy', 'Cloudy', 'Sangal', 'mrcloudy@yahoo.in', 9532326897, '0', '$2y$10$SmDZqd7DtM6JDHm1uCRryeoZJC7idr3ozXvE7HVTPQUO0.3H0YOAG', '2022-03-20 01:02:44'),
(7, 'admin', 'admin', 'admin', 'admin@gmail.com', 1111111111, '1', '$2y$10$7xLEL4sW08PUvLCr27Rqa.0KN.LYeLY2EpdLPft6b9Yl8x9mUscEC', '2022-03-20 22:32:34'),
(9, 'Stonecold82', 'Pratik', 'Kakade', 'pratikkakade.sitmech@gmail.com', 9527993093, '0', '$2y$10$9Qp2N9pguUeE2Wv6P2Lv1e16nOvTlLSys9HB5S5Pd3G80fEKp4Bxe', '2022-03-25 00:22:26');

-- --------------------------------------------------------

--
-- Table structure for table `viewcart`
--

CREATE TABLE `viewcart` (
  `cartItemId` int(11) NOT NULL,
  `fruitId` int(11) NOT NULL,
  `itemQuantity` int(100) NOT NULL,
  `userId` int(11) NOT NULL,
  `addedDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `viewcart`
--

INSERT INTO `viewcart` (`cartItemId`, `fruitId`, `itemQuantity`, `userId`, `addedDate`) VALUES
(15, 2, 1000, 3, '2022-03-19 21:28:35'),
(16, 13, 3, 3, '2022-03-19 23:57:13'),
(17, 78, 2, 3, '2022-03-20 00:46:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categorieId`);
ALTER TABLE `categories` ADD FULLTEXT KEY `categorieName` (`categorieName`,`categorieDesc`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contactId`);

--
-- Indexes for table `contactreply`
--
ALTER TABLE `contactreply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveryboy`
--
ALTER TABLE `deliveryboy`
  ADD PRIMARY KEY (`deliveryboyid`) USING BTREE;
ALTER TABLE `deliveryboy` ADD FULLTEXT KEY `Name` (`Name`,`deliveryboydesc`);

--
-- Indexes for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orderId` (`orderId`);

--
-- Indexes for table `fruit`
--
ALTER TABLE `fruit`
  ADD PRIMARY KEY (`fruitId`);
ALTER TABLE `fruit` ADD FULLTEXT KEY `fruitName` (`fruitName`,`fruitDesc`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`);

--
-- Indexes for table `sitedetail`
--
ALTER TABLE `sitedetail`
  ADD PRIMARY KEY (`tempId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `viewcart`
--
ALTER TABLE `viewcart`
  ADD PRIMARY KEY (`cartItemId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contactId` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contactreply`
--
ALTER TABLE `contactreply`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `deliveryboy`
--
ALTER TABLE `deliveryboy`
  MODIFY `deliveryboyid` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fruit`
--
ALTER TABLE `fruit`
  MODIFY `fruitId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `sitedetail`
--
ALTER TABLE `sitedetail`
  MODIFY `tempId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `viewcart`
--
ALTER TABLE `viewcart`
  MODIFY `cartItemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
