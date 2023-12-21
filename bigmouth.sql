-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2023 at 08:27 PM
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
-- Database: `bigmouth`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `variation_id` int(11) DEFAULT NULL,
  `product_name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `product_image` varchar(100) NOT NULL,
  `quantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Flame-Grilled Burgers'),
(2, 'Vegie & Plant Base'),
(3, 'Crispy & Tender Chicken'),
(5, 'Sides'),
(6, 'Sweet Treats'),
(7, 'Beverages'),
(8, 'Dips');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `fullname` varchar(150) NOT NULL,
  `contact_no` varchar(11) NOT NULL,
  `user_address` varchar(255) NOT NULL,
  `pay_method` varchar(50) NOT NULL,
  `pay_status` int(11) DEFAULT NULL,
  `order_status` int(11) DEFAULT 0,
  `order_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `fullname`, `contact_no`, `user_address`, `pay_method`, `pay_status`, `order_status`, `order_date`) VALUES
(45, 16, 'daniella', '0932732', 'Brgy. Batang Ligao City', 'cash on delivery', NULL, 0, '2023-12-18'),
(47, 17, 'rang', '09876543211', 'Brgy. Batang Ligao City', 'cash on delivery', NULL, 0, '2023-12-18'),
(48, 18, 'alexis', '09876543212', 'tabaco ', 'cash on delivery', NULL, 0, '2023-12-18'),
(49, 19, 'elton', '09876543213', 'Libon', 'cash on delivery', NULL, 0, '2023-12-19'),
(50, 20, 'christine', '09876543215', 'Polangui ', 'cash on delivery', NULL, 0, '2023-12-19'),
(53, 9, 'pochi', '09876543215', 'Brgy. Batang Ligao City', 'cash on delivery', NULL, 0, '2023-12-21');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `detail_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `variation_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`detail_id`, `order_id`, `variation_id`, `quantity`, `price`) VALUES
(22, 45, 12, 1, 320),
(24, 47, 5, 1, 239),
(25, 47, 6, 1, 186),
(26, 47, 11, 1, 256),
(27, 48, 5, 1, 239),
(28, 48, 7, 1, 423),
(29, 49, 29, 2, 148),
(30, 49, 18, 1, 239),
(31, 50, 11, 1, 256),
(32, 50, 18, 1, 239),
(35, 53, 1, 1, 248);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_status` int(100) NOT NULL DEFAULT 1 COMMENT '1-Active\r\n2-Inactive\r\n',
  `uploaded_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_desc`, `product_image`, `price`, `category_id`, `product_status`, `uploaded_date`) VALUES
(1, 'The Angus Smokey Steakhouse triple', 'Grilled', './uploads/ASS.png', 248, 1, 1, '2023-12-08'),
(2, 'The Angus Rosti Double', 'Grilled', './uploads/ARD.png', 267, 1, 1, '2023-12-08'),
(3, 'Texas Bacon Lovers Double Beef', 'Grilled', './uploads/TBL.png', 352, 1, 1, '2023-12-08'),
(4, 'Whopper Sandwich', 'Grilled', './uploads/WS.png', 232, 1, 1, '2023-12-08'),
(5, 'Bacon King', 'Grilled', './uploads/BK.png', 239, 1, 1, '2023-12-08'),
(6, 'Cheese Burger', 'Grilled', './uploads/CCBB.png', 186, 1, 1, '2023-12-08'),
(7, 'Long Texas BBQ', 'Grilled', './uploads/LTBBQ.png', 423, 1, 1, '2023-12-08'),
(8, 'Veggie Royale Bacon King', 'Veggies', './uploads/VRBK.png', 398, 2, 1, '2023-12-08'),
(9, 'Veggie Bacon King', 'Grilled', './uploads/VBK.png', 300, 2, 1, '2023-12-08'),
(10, 'Plant-Based Royal', 'Veggies', './uploads/PBR.png', 356, 2, 1, '2023-12-08'),
(11, 'Plant Based Whopper', 'Veggies', './uploads/PBW.png', 256, 2, 1, '2023-12-08'),
(12, 'Texas Bacon Lovers Chicken', 'Chicken', './uploads/TBLC.png', 320, 3, 1, '2023-12-08'),
(13, 'Long Seasoned', 'Chicken', './uploads/LSC.png', 403, 3, 1, '2023-12-08'),
(14, 'Chicken Royale', 'Chicken', './uploads/CR.png', 350, 3, 1, '2023-12-08'),
(15, 'Crispy Chicken', 'Chicken', './uploads/CC.png', 344, 3, 1, '2023-12-08'),
(16, 'Crispy Chicken Bacon King', 'Chicken', './uploads/CCBK.png', 468, 3, 1, '2023-12-08'),
(17, 'Chicken Burger', 'Chicken', './uploads/CB.png', 270, 3, 1, '2023-12-08'),
(18, 'Texas Bacon Fries', 'Fries', './uploads/TBF.png', 239, 5, 1, '2023-12-08'),
(19, 'Crispy Onion Fries', 'Onion Fries', './uploads/COP.png', 190, 5, 1, '2023-12-08'),
(20, 'Chili Cheese Fries', 'Chili Fries', './uploads/CCF.png', 220, 5, 1, '2023-12-08'),
(21, 'Bacon Cheese Fries', 'Bacon Fries', './uploads/BCF.png', 250, 5, 1, '2023-12-08'),
(22, 'Chicken Strips', 'Chicken Strips', './uploads/CSTRIPS.png', 299, 5, 1, '2023-12-08'),
(23, 'Fries', 'Fries', './uploads/FRIES.png', 150, 5, 1, '2023-12-08'),
(24, 'Onion Rings', 'Onion Rings', './uploads/OR.png', 170, 5, 1, '2023-12-08'),
(25, 'Chili Cheese Bites', 'Chili Bites', './uploads/CCN.png', 220, 5, 1, '2023-12-08'),
(26, 'Chicken Fries', 'Fries', './uploads/CF.png', 200, 5, 0, '2023-12-08'),
(27, 'Chicken Nuggets', 'Nuggets', './uploads/CNUGGETS.png', 250, 5, 0, '2023-12-08'),
(28, 'BLT Chicken Wrap', 'Chicken Wrap', './uploads/BLT.png', 180, 5, 0, '2023-12-08'),
(29, 'Oreo Shake', 'Shake', './uploads/OS.png', 148, 6, 0, '2023-12-08'),
(30, 'Chocolate Brownie', 'Brownie', './uploads/CBROWNIE.png', 150, 6, 0, '2023-12-08'),
(31, 'Oreo Fusion', 'Oreo Fusion', './uploads/OF.png', 171, 6, 0, '2023-12-08'),
(32, 'Caramel Sundae', 'Sundae', './uploads/CSUNDAE.png', 120, 6, 0, '2023-12-08'),
(33, 'Chocolate Sundae', 'Sundae', './uploads/CS.png', 120, 6, 0, '2023-12-08'),
(34, 'Strawberry Sundae', 'Sundae', './uploads/SS.png', 120, 6, 0, '2023-12-08'),
(35, 'Belgian Waffle', 'Waffle', './uploads/BW.png', 145, 6, 0, '2023-12-08'),
(36, 'Apple Pie', 'Pie', './uploads/AP.png', 168, 6, 0, '2023-12-08'),
(37, 'Soft Drinks', 'Beverages', './uploads/SD.png', 38, 7, 0, '2023-12-08'),
(38, 'Orange Juice', 'Juice', './uploads/OJ.png', 50, 7, 0, '2023-12-08'),
(39, 'Black Coffe', 'Coffee', './uploads/BC.png', 129, 7, 0, '2023-12-08'),
(40, 'Latte', 'Latte', './uploads/LATTE.png', 145, 7, 0, '2023-12-08'),
(41, 'Cappuccino', 'Coffee', './uploads/CAPPUCCINO.png', 129, 7, 0, '2023-12-08'),
(42, 'Tea', 'Tea', './uploads/TEA.png', 99, 7, 0, '2023-12-08'),
(43, 'Smokey BBQ Dip', 'Dip', './uploads/SBBQ.png', 45, 8, 0, '2023-12-08'),
(44, 'Spicy Mayo', 'Dips', './uploads/SM.png', 45, 8, 0, '2023-12-08'),
(45, 'Sweet Chili', 'Dips', './uploads/SCC.png', 45, 8, 0, '2023-12-08'),
(46, 'Ketchup', 'Ketchup', './uploads/KS.png', 30, 8, 0, '2023-12-08'),
(47, 'Garlic Sauce', 'Dips', './uploads/GS.png', 45, 8, 0, '2023-12-08'),
(48, 'Sour Cream & Chive Sauce', 'Dips', './uploads/SCCS.png', 45, 8, 0, '2023-12-08');

-- --------------------------------------------------------

--
-- Table structure for table `product_size_variation`
--

CREATE TABLE `product_size_variation` (
  `variation_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `quantity_in_stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_size_variation`
--

INSERT INTO `product_size_variation` (`variation_id`, `product_id`, `product_name`, `status_id`, `quantity_in_stock`) VALUES
(1, 1, 'The Angus Smokey Steakhouse triple', 1, 5),
(2, 2, 'The Angus Rosti Double', 1, 9),
(3, 3, 'Texas Bacon Lovers Double Beef', 1, 6),
(4, 4, 'Whopper Sandwich', 1, 8),
(5, 5, 'Bacon King', 1, 8),
(6, 6, 'Cheese Burger', 2, 10),
(7, 7, 'Long Texas BBQ', 2, 10),
(8, 8, 'Veggie Royale Bacon King', 1, 65),
(9, 9, 'Veggie Bacon King', 2, 3),
(10, 10, 'Plant-Based Royal', 1, 65),
(11, 11, 'Plant Based Whopper', 1, 76),
(12, 12, 'Texas Bacon Lovers Chicken', 1, 77),
(13, 13, 'Long Seasoned', 1, 8),
(14, 14, 'Chicken Royale', 1, 6),
(15, 15, 'Crispy Chicken', 1, 6),
(16, 16, 'Crispy Chicken Bacon King', 1, 2),
(17, 17, 'Chicken Burger', 1, 4),
(18, 18, 'Texas Bacon Fries', 1, 7),
(19, 19, 'Crispy Onion Fries', 1, 32),
(20, 20, 'Chili Cheese Fries', 1, 6),
(21, 21, 'Bacon Cheese Fries', 1, 8),
(22, 22, 'Chicken Strips', 1, 43),
(23, 23, 'Fries', 1, 8),
(24, 24, 'Onion Rings', 1, 34),
(25, 25, 'Chili Cheese Bites', 1, 21),
(26, 26, 'Chicken Fries', 1, 23),
(27, 27, 'Chicken Nuggets', 1, 23),
(28, 28, 'BLT Chicken Wrap', 1, 66),
(29, 29, 'Oreo Shake', 1, 45),
(30, 30, 'Chocolate Brownie', 1, 54),
(31, 31, 'Oreo Fusion', 1, 3),
(32, 32, 'Caramel Sundae', 1, 23),
(33, 33, 'Chocolate Sundae', 1, 22),
(34, 34, 'Strawberry Sundae', 1, 66),
(35, 35, 'Belgian Waffle', 1, 66),
(36, 36, 'Apple Pie', 1, 8),
(37, 37, 'Soft Drinks', 1, 55),
(38, 38, 'Orange Juice', 1, 33),
(39, 39, 'Black Coffe', 1, 23),
(40, 40, 'Latte', 1, 222),
(41, 41, 'Cappuccino', 1, 7),
(42, 42, 'Tea', 1, 77),
(43, 43, 'Smokey BBQ Dip', 1, 66),
(44, 44, 'Spicy Mayo', 1, 7),
(45, 45, 'Sweet Chili', 1, 1),
(46, 46, 'Ketchup', 1, 44),
(47, 47, 'Garlic Sauce', 1, 777),
(48, 48, 'Sour Cream & Chive Sauce', 1, 71);

-- --------------------------------------------------------

--
-- Table structure for table `product_status`
--

CREATE TABLE `product_status` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_status`
--

INSERT INTO `product_status` (`status_id`, `status_name`) VALUES
(1, 'Active\r\n'),
(2, 'Inactive');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `review_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`review_id`, `user_id`, `product_id`, `review_desc`) VALUES
(1, 2, 2, 'Comfortable and stylish. I loved it.'),
(2, 2, 5, 'Perfect dress for summer.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(150) NOT NULL,
  `contact_no` varchar(11) NOT NULL,
  `registered_at` date NOT NULL DEFAULT current_timestamp(),
  `user_type` varchar(11) NOT NULL DEFAULT 'U' COMMENT 'A-admin\r\nU-user\r\n',
  `user_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `fullname`, `email`, `username`, `password`, `contact_no`, `registered_at`, `user_type`, `user_address`) VALUES
(9, 'pochi', 'pochi@gmail.com', 'pochi123', '$2y$10$ErBztm8f.A5QabtIp9hp.erd0kre9rg/7DIe.LLlzqQ70J6DD6EWa', '09678884563', '2023-12-10', 'U', 'Ligao City'),
(10, 'champi', 'champi@gmail.com', 'champi123', '$2y$10$v/85agdiqf4pww7LfMvp6uG7O8edsiYXIE0lpS/n67.4X169yCzAu', '09664556362', '2023-12-10', 'A', 'Ligao City'),
(14, 'Arabela Bonayon', 'arabelabonayon@gmail.com', 'arabela123', '$2y$10$7Wy7FzfyVIc4ev//u73JkuWNIn88XqdxZJsh2k/Qvnoc.tXl8XL3m', '09270543862', '2023-12-17', 'U', 'Batang Ligao City'),
(15, 'glenysse leoncito', 'glen@gmail.com', 'glen123', '$2y$10$nJSjh85DqMSV8D2zXbu1zu.QWrYoiYcWzozXjyU0hC72AortjK5oW', '09876543211', '2023-12-18', 'U', 'Polangui'),
(16, 'daniella', 'daniella@gmail.com', 'daniella123', '$2y$10$.Y0eETPU1OYaNC5RdcHy5.GmMA5JBcDj1KZDg3UbOe0o.YLDwuc5e', '09382837828', '2023-12-18', 'U', 'Ligao City'),
(17, 'rang', 'rang@gmail.com', 'rang123', '$2y$10$NKpVRfZFQAHY.UolXnc0AuyzfSZJiveDD4NSC7UMncS1j9Qc570hK', '09387762326', '2023-12-18', 'U', 'Ligao City'),
(18, 'alexis', 'alesix@gmail.com', 'alex123', '$2y$10$LgOvp4A9U.l6rBJ/QH9.3upOFyDMBNA8CH/HtY/UWtuqTS54jYOOm', '09832736232', '2023-12-18', 'U', 'Tabaco City'),
(19, 'elton', 'elton@gmail.com', 'elton123', '$2y$10$P1ZnneAhnVg5ArXKgTjItubvTTJNrIbdWtiXFK0WApdsEzxhX2WWm', '09876543213', '2023-12-19', 'U', 'Libon'),
(20, 'christine', 'christine@gmail.com', 'christine123', '$2y$10$.YBjBUTwYOuyx.JZ6fHWqeiYTWhsD8FB9hu4g0b.9oi4fc0c1VzhO', '09876543214', '2023-12-19', 'U', 'polangui');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `variation_id` (`variation_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_size_variation`
--
ALTER TABLE `product_size_variation`
  ADD PRIMARY KEY (`variation_id`),
  ADD UNIQUE KEY `uc_ps` (`product_id`,`status_id`);

--
-- Indexes for table `product_status`
--
ALTER TABLE `product_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `product_size_variation`
--
ALTER TABLE `product_size_variation`
  MODIFY `variation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `product_status`
--
ALTER TABLE `product_status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`variation_id`) REFERENCES `product_size_variation` (`variation_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
