-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2022 at 09:05 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bharat_admin`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `landmark` text DEFAULT NULL,
  `city` text DEFAULT NULL,
  `district` text DEFAULT NULL,
  `pincode` text DEFAULT NULL,
  `state` text DEFAULT NULL,
  `country` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `address`, `landmark`, `city`, `district`, `pincode`, `state`, `country`) VALUES
(1, 1, 'nandanapuram', 'Post office', 'Junction', 'Trichy', '624535', 'Tamilnadu', 'India');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `mobile` text DEFAULT NULL,
  `age` text DEFAULT NULL,
  `disease` text DEFAULT NULL,
  `place` text DEFAULT NULL,
  `history` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `appointment_date` varchar(255) DEFAULT NULL,
  `appointment_time` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `user_id`, `doctor_id`, `name`, `mobile`, `age`, `disease`, `place`, `history`, `description`, `appointment_date`, `appointment_time`) VALUES
(1, NULL, 1, 'kerant', '8847474844', '45', 'Bacterial Disease', 'Trichy', NULL, 'last one weeks i am injured by this', NULL, NULL),
(2, 5, 1, 'prasad', NULL, '25', 'sugar', 'sholapuram', 'nothing', 'prasad am patient', NULL, NULL),
(3, 10, 1, 'pradf', NULL, '25', 'vvvvv', 'tvvv', 'gghh', 'vvh', NULL, NULL),
(4, 11, 1, 'Prasas', NULL, '25', 'disease', 'kumbajb', 'bsjjsbsvs', 'hsyshbs', NULL, NULL),
(5, 9, 1, 'lala', NULL, '40', 'diabeties', 'delhi', 'heart attack', 'about to die.', NULL, NULL),
(6, 7, 1, 'harsh', NULL, '55', 'feve', 'Ghaziabad', 'hh', 'gbxbx', NULL, NULL),
(7, 11, 1, 'ghh', NULL, '808', 'cv', 'vvv', 'gg', 'ggg', NULL, NULL),
(8, 11, 1, 'ffgggh', NULL, '88', 'vvbbbv', 'vvvvv', 'vvvv', 'vvvv', NULL, NULL),
(9, 11, 1, 'ghhhhh', NULL, '25', 'cvbbbvg bhh', 'kumbakonqm', 'gbb', 'vbb', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `brand` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `brand`) VALUES
(1, 'John Phillips'),
(2, 'Safe 2 shine'),
(3, 'Him Herbal'),
(4, 'Pioneer'),
(5, 'Sarju\'s'),
(6, 'Meenal'),
(7, 'Alto'),
(8, 'Krishi Gaurav'),
(9, 'Pheasant Bio'),
(10, 'Shyama'),
(11, 'Comfomax');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`, `date_created`) VALUES
(12, 10, 1, 2, '2022-09-12 13:24:01'),
(14, 7, 1, 1, '2022-09-14 06:08:56'),
(15, 5, 1, 2, '2022-09-15 11:27:05'),
(17, 12, 1, 1, '2022-09-16 06:03:19'),
(18, 5, 3, 1, '2022-11-04 19:17:31');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `status` tinyint(11) DEFAULT NULL,
  `last_updated` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `status`, `last_updated`, `date_created`) VALUES
(1, 'Daily Needs ', 'upload/images/1663412150.2429.jpg', 1, '2022-09-17 10:55:50', '2022-09-02 04:36:07'),
(2, 'Health Care', 'upload/images/1662994580.2559.jpg', 0, '2022-09-12 14:56:20', '2022-09-09 07:27:24'),
(3, 'Fintech', 'upload/images/1663412206.5938.jpg', 1, '2022-09-17 10:56:46', '2022-09-09 07:28:57'),
(4, 'Agriculture ', 'upload/images/9708-2022-09-17.jpg', 0, NULL, '2022-09-17 10:57:13');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_charges`
--

CREATE TABLE `delivery_charges` (
  `id` int(11) NOT NULL,
  `from` int(11) DEFAULT 0,
  `to` int(11) DEFAULT 0,
  `delivery_charge` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `delivery_charges`
--

INSERT INTO `delivery_charges` (`id`, `from`, `to`, `delivery_charge`) VALUES
(1, 500, 1000, 100),
(2, 1001, 1500, 150);

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `role` text DEFAULT NULL,
  `experience` text DEFAULT NULL,
  `fees` int(11) DEFAULT NULL,
  `image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `name`, `role`, `experience`, `fees`, `image`) VALUES
(1, 'James', 'Physician ', '14 Years', 500, 'upload/doctors/1662113175.0499.jpg'),
(2, 'Tom', 'Cardiologist', '12 Years', 600, 'upload/doctors/2171-2022-09-17.jpg'),
(3, 'Brad', 'Orthopedic ', '13 Years', 600, 'upload/doctors/0313-2022-09-17.jpg'),
(4, 'Sarah', 'Gynecologist', '18 Years', 600, 'upload/doctors/4249-2022-09-17.jpg'),
(5, 'test', 'test', '3', 344, 'upload/doctors/7776-2022-10-06.png');

-- --------------------------------------------------------

--
-- Table structure for table `months`
--

CREATE TABLE `months` (
  `id` int(11) NOT NULL,
  `month` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `months`
--

INSERT INTO `months` (`id`, `month`) VALUES
(1, 'January'),
(2, 'February'),
(3, 'March'),
(4, 'April'),
(5, 'May'),
(6, 'June'),
(7, 'July'),
(8, 'August'),
(9, 'September'),
(10, 'October'),
(11, 'November'),
(12, 'December');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `description`) VALUES
(1, 'Payments', 'Hi Divakar how i help you'),
(2, 'Hi', 'new offer availble'),
(3, 'Discounted Health Checkup ', 'Avail the discount on Basic/Specific test packages at our Pathology Centres '),
(4, 'test', 'etetete');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `delivery_charges` int(11) DEFAULT NULL,
  `order_date` varchar(255) DEFAULT NULL,
  `status` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `product_id`, `method`, `total`, `quantity`, `address`, `mobile`, `delivery_charges`, `order_date`, `status`) VALUES
(6, 5, 1, 'UPI', 2000, 3, '50', '9898989898', 50, '01-11-2000', 'Ordered'),
(7, 5, 1, 'Wallet', 2000, 1, '50', '9898989898', 50, '2022-09-11', 'Ordered'),
(8, 5, 1, 'Wallet', 2000, 1, '50', '9898989898', 50, '2022-09-11', 'Ordered'),
(9, 11, 1, 'COD', 2000, 2, '60', '9797979797', 60, '2022-09-12', 'Ordered'),
(10, 12, 1, 'COD', 2000, 1, '60', '8709095817', 60, '2022-09-16', 'Ordered'),
(11, 14, 2, 'COD', 5000, 1, '60', '9191919191', 60, '2022-09-17', 'Ordered'),
(12, 14, 3, 'COD', 280, 1, '60', '9191919191', 60, '2022-09-17', 'Ordered'),
(13, 14, 3, 'COD', 280, 1, '58', '9191919191', 58, '2022-09-20', '2'),
(14, 1, 1, 'cod', 500, 3, 'chenai', '9765435567', 20, '2022-11-30', '0');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_name` text DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `mrp` text DEFAULT NULL,
  `discount_percentage` int(200) DEFAULT 0,
  `brand` text DEFAULT NULL,
  `measurement` int(200) DEFAULT 0,
  `unit` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `product_name`, `price`, `mrp`, `discount_percentage`, `brand`, `measurement`, `unit`, `description`, `image`) VALUES
(1, 3, 'NPK Fertilizer', 500, '900', 56, 'Safe 2 shine', 2, 'Gm', 'By using this product we can protect the crop field from insects', 'upload/products/6503-2022-11-09.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `mobile` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `linkedin` text DEFAULT NULL,
  `facebook` text DEFAULT NULL,
  `twitter` text DEFAULT NULL,
  `instagram` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `mobile`, `email`, `address`, `linkedin`, `facebook`, `twitter`, `instagram`) VALUES
(1, 'Admin', '9875689344', 'admin344@gmail.com', 'Tamilnadu,India', 'https://www.googledd', 'https://www.google.com/', 'https://www.google.com/', 'https://www.google.com/');

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `name`, `image`, `status`) VALUES
(4, 'Accessibility ', 'upload/slides/6441-2022-09-17.jpg', 1),
(5, 'Daily Needs ', 'upload/slides/5950-2022-09-17.jpg', 1),
(11, 'HealthCare', 'upload/slides/5033-2022-09-17.jpg', 1),
(12, 'Agriculture ', 'upload/slides/6177-2022-09-17.jpg', 1),
(13, 'Fintech ', 'upload/slides/6598-2022-09-17.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `mobile` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `aadhaar_num` text DEFAULT NULL,
  `occupation` text DEFAULT NULL,
  `gender` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `village` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `registered_date` text DEFAULT NULL,
  `image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `mobile`, `password`, `aadhaar_num`, `occupation`, `gender`, `email`, `address`, `village`, `pincode`, `district`, `balance`, `registered_date`, `image`) VALUES
(1, 'Nehan', '9876543210', 'admin123', NULL, 'Farmer', 'Male', 'sridahar12@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, NULL),
(2, 'Sanjay', '6544678899', 'admin123', NULL, 'Farmer', 'Male', 'sanjay123@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, NULL),
(3, 'Sanjay', '6555678899', '123445', NULL, 'Farmer', 'Male', 'sanjay123@gmail.com', 'ewew', 'ewew', 'dswewe', NULL, 0, NULL, NULL),
(4, 'Sanjay', '6995678899', 'sanjay123', NULL, 'Farmer', 'Male', 'sanjay123@gmail.com', 'ewew', 'ewew', 'dswewe', 'dsds', 0, NULL, NULL),
(5, 'prasad jp', '9898989898', 'jp123', NULL, 'Farmer', 'Male', 'jayaprasad356@gmail.com', 'ghahs', 'jaja', '613279', 'hsbsbs', 650, NULL, NULL),
(6, 'huhhh', '9999999999', 'sweswe', NULL, 'Business', 'Female', 'jayaprasad.s@care.ac.in', 'fgg', 'hhh', 'gy', 'vh', 0, NULL, NULL),
(7, 'harsh Vardhan', '9717723876', 'Harsh@3434', NULL, 'Farmer', 'Male', 'Vardhan1109@gmail.com', 'H.n 343 balu Pura', 'gha', '201001', 'Ghaziabad', 600, NULL, NULL),
(8, 'Deepak Sharma', '9254447828', 'Dabbu@15', NULL, 'Others', 'Male', 'deepaksharma015@gmail.com', 'Narnaul', 'Narnaul', '123001', 'Mahendergarh', 0, '2022-09-12', NULL),
(9, 'prabal pratap singh', '9716332976', '781974', NULL, 'Others', 'Male', 'hiprabal@gmail.com', '232/30 E, new kot gaon, G T road', 'new kot gaon', '201001', 'ghaziabad', 0, NULL, NULL),
(10, 'Surya', '8080808080', '12345678', NULL, 'business', 'Male', 'surya@gmail.com', 'East street', 'Nehru Nagar (Ghaziabad)', '201001', 'Ghaziabad', 0, NULL, NULL),
(11, 'sundar', '9797979797', 'jp123', NULL, 'software', 'Male', 'sundar@gmail.com', 'East Street', 'Manambadi', '612503', 'Thanjavur', 500, NULL, NULL),
(12, 'pankaj', '8709095817', '8709095817', NULL, 'Business', 'Male', 'singh4384@gmail.com', 'Bibiganj', 'Bampali', '802312', 'Bhojpur', 0, NULL, NULL),
(13, 'harry', '9717723878', 'Harsh@3434', NULL, 'Business', 'Male', 'vardhan1109@gmail.com', 'hhh', 'Ashok Nagar (Ghaziabad)', '201001', 'Ghaziabad', 0, NULL, NULL),
(14, 'testID', '9191919191', 'abc123', NULL, 'Distributor', 'Male', 'abc@xyz.com', 'n/a', 'New Friends Colony', '110025', 'South Delhi', 0, NULL, NULL),
(15, 'Nirali', '9650472984', 'qwert6789', NULL, 'business', 'Female', 'niralisingh24@gmail.com', 'Uninav heights', 'Raj Nagar Extension', '201017', 'Ghaziabad', 0, NULL, NULL),
(16, 'Sanjai', '7358832695', 'admin@r8374', NULL, 'Farmer', 'Male', 'sanjai12@gmail.com', 'Trichy', 'manndaram', '621313', 'Tamilnadu', 0, NULL, 'upload/users/6209-2022-11-09.jpg'),
(17, 'Senthilganesh', '9876543234', 'deen123', '866823410975', 'Farmer', 'Male', 'senthi65@gmail.com', 'Nellur', 'kadappa', '654889', 'Retanalr', 0, '2022-12-26', 'upload/users/4081-2022-11-23.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wallet_transactions`
--

INSERT INTO `wallet_transactions` (`id`, `user_id`, `date`, `amount`, `type`) VALUES
(1, 5, '2022-09-11', 100, 'credit'),
(2, 5, '2022-09-11', 500, 'debit'),
(3, 5, '2022-09-11', 100, 'credit'),
(4, 5, '2022-09-11', 500, 'credit'),
(5, 5, '2022-09-11', 100, 'credit'),
(6, 5, '2022-09-11', 2000, 'credit'),
(7, 11, '2022-09-12', 500, 'credit'),
(8, 7, '2022-09-14', 100, 'credit'),
(9, 7, '2022-09-14', 500, 'credit');

-- --------------------------------------------------------

--
-- Table structure for table `years`
--

CREATE TABLE `years` (
  `id` int(11) NOT NULL,
  `year` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `years`
--

INSERT INTO `years` (`id`, `year`) VALUES
(1, '2021'),
(2, '2022'),
(3, '2023'),
(4, '2024'),
(5, '2025'),
(6, '2026');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_charges`
--
ALTER TABLE `delivery_charges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `months`
--
ALTER TABLE `months`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `years`
--
ALTER TABLE `years`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `delivery_charges`
--
ALTER TABLE `delivery_charges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `months`
--
ALTER TABLE `months`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `years`
--
ALTER TABLE `years`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
