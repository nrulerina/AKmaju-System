-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2024 at 06:06 PM
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
-- Database: `db_akmaju2`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `customer_phone` int(11) NOT NULL,
  `customer_type` varchar(255) NOT NULL,
  `customer_address` varchar(255) DEFAULT NULL,
  `customer_city` varchar(255) DEFAULT NULL,
  `customer_state_id` int(11) DEFAULT NULL,
  `customer_postcode` varchar(5) DEFAULT NULL,
  `customer_country` varchar(255) DEFAULT 'Malaysia',
  `customer_status` int(11) NOT NULL DEFAULT 1 COMMENT '1:Active, 0:Inactive',
  `customer_created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `customer_updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `customer_name` varchar(50) NOT NULL,
  `customer_email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_phone`, `customer_type`, `customer_address`, `customer_city`, `customer_state_id`, `customer_postcode`, `customer_country`, `customer_status`, `customer_created_at`, `customer_updated_at`, `customer_name`, `customer_email`) VALUES
(13, 172789819, 'Personal', 'Lot 157G Lorong 5 Kampung Tengah ', 'Puchong', 12, '47150', 'Malaysia', 1, '2024-01-09 16:35:45', '2024-01-09 16:35:45', 'PRINCESS AURORA NATATA DCOCO', 'swayoongmin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `invoice_id` int(11) NOT NULL,
  `invoice_quotation_id` int(11) NOT NULL,
  `invoice_status` int(11) NOT NULL DEFAULT 1,
  `invoice_payment_method` varchar(255) NOT NULL,
  `invoice_payment_delivery_fee` decimal(10,2) NOT NULL,
  `invoice_payment_status` int(11) NOT NULL DEFAULT 0,
  `invoice_payment_created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `invoice_payment_updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `invoice_deleted_at` datetime DEFAULT NULL,
  `invoice_payment_pdf` mediumblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `password_reset_id` int(11) NOT NULL,
  `password_reset_user_id` int(11) NOT NULL,
  `password_reset_token` varchar(255) NOT NULL,
  `password_reset_status` int(11) NOT NULL DEFAULT 1,
  `password_reset_created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`password_reset_id`, `password_reset_user_id`, `password_reset_token`, `password_reset_status`, `password_reset_created_at`) VALUES
(13, 16, 'b161c491db6155915cb081ac44c61363', 0, '2024-01-10 09:22:32');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_category_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_description` text DEFAULT NULL,
  `product_cost_price` decimal(10,2) NOT NULL,
  `product_selling_price` decimal(10,2) NOT NULL,
  `product_tax_code` varchar(255) NOT NULL,
  `product_tax_amount` decimal(10,2) NOT NULL,
  `product_discount_percent` decimal(10,2) NOT NULL,
  `product_discount_amount` decimal(10,2) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_updated_quantity` int(11) NOT NULL,
  `product_status` int(11) NOT NULL DEFAULT 1 COMMENT '1:Active, 0:Inactive',
  `product_created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `product_updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `product_category_id` int(11) NOT NULL,
  `product_category_name` varchar(30) NOT NULL,
  `product_category_status` int(11) NOT NULL DEFAULT 1 COMMENT '1:Active, 0:Inactive',
  `product_category_created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `product_category_updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `quotation_id` int(11) NOT NULL,
  `quotation_customer_id` int(11) NOT NULL,
  `quotation_date` datetime NOT NULL DEFAULT current_timestamp(),
  `quotation_status` int(11) NOT NULL DEFAULT 1,
  `quotation_created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `quotation_updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `quotation_deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_details`
--

CREATE TABLE `quotation_details` (
  `quotation_detail_id` int(11) NOT NULL,
  `quotation_detail_quotation_id` int(11) NOT NULL,
  `quotation_detail_product_id` int(11) NOT NULL,
  `quotation_detail_quantity` int(11) NOT NULL,
  `quotation_detail_selling_price` double NOT NULL,
  `quotation_detail_discount_percent` double NOT NULL,
  `quotation_detail_discount_amount` double NOT NULL,
  `quotation_detail_tax_code` varchar(255) NOT NULL,
  `quotation_detail_total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `state_id` int(11) NOT NULL,
  `state_name` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`state_id`, `state_name`) VALUES
(1, 'Johor'),
(2, 'Kedah'),
(3, 'Kelantan'),
(4, 'Melaka'),
(5, 'Negeri Sembilan'),
(6, 'Pahang'),
(7, 'Perak'),
(8, 'Perlis'),
(9, 'Pulau Pinang'),
(10, 'Sabah'),
(11, 'Sarawak'),
(12, 'Selangor'),
(13, 'Terengganu'),
(14, 'Wilayah Persekutuan Kuala Lumpur'),
(15, 'Wilayah Persekutuan Labuan'),
(16, 'Wilayah Persekutuan Putrajaya');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_ic` varchar(12) NOT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_role` int(11) NOT NULL DEFAULT 1 COMMENT '1:Admin, 2:User',
  `user_status` int(11) NOT NULL DEFAULT 1 COMMENT '1:Active, 0:Inactive',
  `user_created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `user_updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_ic`, `user_password`, `user_role`, `user_status`, `user_created_at`, `user_updated_at`) VALUES
(16, 'NIK ZULAIKHAA BINTI ZURAIDI AFANDI', '2003nikzulaikhaa@gmail.com', '030904141090', '$2y$10$YoZvyXt69URzuHqNPKxFD.98LYMSF/0dipRWJtAxbTxw04pXmHNfy', 1, 1, '2024-01-09 15:45:17', '2024-01-10 09:23:11'),
(17, 'NURUL ERINA BINTI ZAINUDDIN', 'nrulerina@gmail.com', '031111110272', '$2y$10$PmNlDwO8O26PPyjQgKm94.1KXTXgBP2Y6CkV3LKxww0UcQUqJ8djW', 2, 0, '2024-01-10 08:24:57', '2024-01-10 09:25:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `customer_state_id` (`customer_state_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `invoice_quotation_id` (`invoice_quotation_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`password_reset_id`),
  ADD KEY `password_reset_user_id` (`password_reset_user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `product_category_id` (`product_category_id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`product_category_id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`quotation_id`),
  ADD KEY `quotation_customer_id` (`quotation_customer_id`);

--
-- Indexes for table `quotation_details`
--
ALTER TABLE `quotation_details`
  ADD PRIMARY KEY (`quotation_detail_id`),
  ADD KEY `quotation_detail_quotation_id` (`quotation_detail_quotation_id`),
  ADD KEY `quotation_detail_product_id` (`quotation_detail_product_id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD UNIQUE KEY `user_ic` (`user_ic`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `password_reset_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `product_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `quotation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `quotation_details`
--
ALTER TABLE `quotation_details`
  MODIFY `quotation_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`customer_state_id`) REFERENCES `states` (`state_id`);

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`invoice_quotation_id`) REFERENCES `quotations` (`quotation_id`);

--
-- Constraints for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD CONSTRAINT `password_resets_ibfk_1` FOREIGN KEY (`password_reset_user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`product_category_id`);

--
-- Constraints for table `quotations`
--
ALTER TABLE `quotations`
  ADD CONSTRAINT `quotations_ibfk_1` FOREIGN KEY (`quotation_customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `quotation_details`
--
ALTER TABLE `quotation_details`
  ADD CONSTRAINT `quotation_details_ibfk_1` FOREIGN KEY (`quotation_detail_quotation_id`) REFERENCES `quotations` (`quotation_id`),
  ADD CONSTRAINT `quotation_details_ibfk_2` FOREIGN KEY (`quotation_detail_product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
