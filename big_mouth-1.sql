-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2023 at 02:33 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `big mouth`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`) VALUES
(1, 'side'),
(2, 'sweet treat'),
(3, 'drink & caffee');

-- --------------------------------------------------------

--
-- Table structure for table `components suppier`
--

CREATE TABLE `components suppier` (
  `co_id` int(100) NOT NULL,
  `componet_name` varchar(100) NOT NULL,
  `suppier_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `components suppier`
--

INSERT INTO `components suppier` (`co_id`, `componet_name`, `suppier_id`) VALUES
(1, 'patties and other', 1),
(2, 'bread', 2),
(3, 'veggis', 3);

-- --------------------------------------------------------

--
-- Table structure for table `courier_id`
--

CREATE TABLE `courier_id` (
  `courier_id` int(100) NOT NULL,
  `courier_name` varchar(100) NOT NULL,
  `contact_no.` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courier_id`
--

INSERT INTO `courier_id` (`courier_id`, `courier_name`, `contact_no.`) VALUES
(1, 'food pandax', 954637285),
(2, 'Mr. speedy', 999847210),
(3, 'food hub', 927054386);

-- --------------------------------------------------------

--
-- Table structure for table `item list`
--

CREATE TABLE `item list` (
  `item_id` int(100) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `item_desc` varchar(100) NOT NULL,
  `status` varchar(1) NOT NULL COMMENT '1',
  `cat_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item list`
--

INSERT INTO `item list` (`item_id`, `item_name`, `item_desc`, `status`, `cat_id`) VALUES
(1, 'fries', 'side', '1', '1'),
(2, 'oreo shake', 'sweet', '1', '2'),
(3, 'orange juice', 'beverage', '1', '3');

-- --------------------------------------------------------

--
-- Table structure for table `item_status`
--

CREATE TABLE `item_status` (
  `status_id` int(100) NOT NULL,
  `status_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item_status`
--

INSERT INTO `item_status` (`status_id`, `status_name`) VALUES
(1, 'active'),
(2, 'inactive');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `order_date` datetime(6) NOT NULL,
  `total_amount` int(100) NOT NULL,
  `peyment_method` int(100) NOT NULL COMMENT '0-online\r\n1-cod'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`order_id`, `user_id`, `order_date`, `total_amount`, `peyment_method`) VALUES
(1, 1, '2023-10-06 13:18:18.268268', 260, 0),
(2, 2, '2023-10-25 06:16:16.298318', 96, 0),
(3, 3, '2023-10-27 06:16:16.288229', 68, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order details`
--

CREATE TABLE `order details` (
  `od_id` int(100) NOT NULL,
  `order_id` int(100) NOT NULL,
  `item_id` int(100) NOT NULL,
  `quantity` varchar(100) NOT NULL,
  `subtotal` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order details`
--

INSERT INTO `order details` (`od_id`, `order_id`, `item_id`, `quantity`, `subtotal`) VALUES
(1, 1, 1, '5', 260),
(2, 2, 2, '2', 96),
(3, 3, 3, '2', 68);

-- --------------------------------------------------------

--
-- Table structure for table `prices`
--

CREATE TABLE `prices` (
  `prices_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `item_id` int(100) NOT NULL,
  `start_date` int(100) DEFAULT NULL,
  `end_date` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prices`
--

INSERT INTO `prices` (`prices_id`, `price`, `item_id`, `start_date`, `end_date`) VALUES
(1, 52, 1, NULL, NULL),
(2, 48, 2, NULL, NULL),
(3, 34, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_update`
--

CREATE TABLE `product_update` (
  `update_id` int(100) NOT NULL,
  `product_id` int(100) NOT NULL,
  `updated_field(price)` int(100) DEFAULT NULL,
  `old_value` int(100) DEFAULT NULL,
  `new_value` int(100) DEFAULT NULL,
  `upd_date` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_update`
--

INSERT INTO `product_update` (`update_id`, `product_id`, `updated_field(price)`, `old_value`, `new_value`, `upd_date`) VALUES
(1, 1, NULL, NULL, NULL, NULL),
(2, 2, NULL, NULL, NULL, NULL),
(3, 3, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `report_id` int(100) NOT NULL,
  `report_name` varchar(100) NOT NULL,
  `report_type` varchar(100) NOT NULL,
  `report_date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`report_id`, `report_name`, `report_type`, `report_date`) VALUES
(1, 'monthly sale report', 'sales', '2022-09-31');

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `stock_id` int(100) NOT NULL,
  `item_id` int(100) NOT NULL,
  `current_stock` int(100) DEFAULT NULL,
  `update` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`stock_id`, `item_id`, `current_stock`, `update`) VALUES
(1, 1, 50, 45),
(2, 2, 50, 48),
(3, 3, 50, 48);

-- --------------------------------------------------------

--
-- Table structure for table `suppier`
--

CREATE TABLE `suppier` (
  `suppier_id` int(100) NOT NULL,
  `suppier_name` varchar(100) DEFAULT NULL,
  `cantact no` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppier`
--

INSERT INTO `suppier` (`suppier_id`, `suppier_name`, `cantact no`) VALUES
(1, 'meaty corp.', 937475767),
(2, 'cake walk bakery', 912345678),
(3, 'anastasia grey', 964566236);

-- --------------------------------------------------------

--
-- Table structure for table `user info`
--

CREATE TABLE `user info` (
  `user_id` int(100) NOT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `address` varchar(110) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `password` int(100) DEFAULT NULL,
  `user_type` varchar(1) DEFAULT NULL COMMENT 'U-user\r\nA-admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user info`
--

INSERT INTO `user info` (`user_id`, `firstname`, `lastname`, `address`, `user_name`, `password`, `user_type`) VALUES
(1, 'anna', 'williams', 'quezon city', 'anna1', 12345, 'U'),
(2, 'nina', 'williams', 'taguig city', 'nana2', 123456, 'U'),
(3, 'layla', 'scots', 'makati city', 'lyla3', 1234567, 'U');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `components suppier`
--
ALTER TABLE `components suppier`
  ADD PRIMARY KEY (`co_id`);

--
-- Indexes for table `courier_id`
--
ALTER TABLE `courier_id`
  ADD PRIMARY KEY (`courier_id`);

--
-- Indexes for table `item list`
--
ALTER TABLE `item list`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `item_status`
--
ALTER TABLE `item_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order details`
--
ALTER TABLE `order details`
  ADD PRIMARY KEY (`od_id`);

--
-- Indexes for table `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`prices_id`);

--
-- Indexes for table `product_update`
--
ALTER TABLE `product_update`
  ADD PRIMARY KEY (`update_id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `suppier`
--
ALTER TABLE `suppier`
  ADD PRIMARY KEY (`suppier_id`);

--
-- Indexes for table `user info`
--
ALTER TABLE `user info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `components suppier`
--
ALTER TABLE `components suppier`
  MODIFY `co_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `courier_id`
--
ALTER TABLE `courier_id`
  MODIFY `courier_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `item list`
--
ALTER TABLE `item list`
  MODIFY `item_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `item_status`
--
ALTER TABLE `item_status`
  MODIFY `status_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order details`
--
ALTER TABLE `order details`
  MODIFY `od_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `prices`
--
ALTER TABLE `prices`
  MODIFY `prices_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_update`
--
ALTER TABLE `product_update`
  MODIFY `update_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `report_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `stock_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `suppier`
--
ALTER TABLE `suppier`
  MODIFY `suppier_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user info`
--
ALTER TABLE `user info`
  MODIFY `user_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
