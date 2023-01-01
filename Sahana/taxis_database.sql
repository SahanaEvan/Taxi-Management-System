-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2022 at 05:50 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taxis_database`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `annualincome_tax` (`monthly_salary` INTEGER) RETURNS VARCHAR(20) CHARSET utf8mb4 DETERMINISTIC BEGIN
IF monthly_salary*12 > 50000 THEN 
RETURN ("Taxable");
ELSE
RETURN ("Non Taxable");
END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `alternate_contact_person_details`
--

CREATE TABLE `alternate_contact_person_details` (
  `u_name` varchar(255) DEFAULT NULL,
  `u_contact` bigint(11) DEFAULT NULL,
  `u_addr` varchar(255) DEFAULT NULL,
  `usr_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `alternate_contact_person_details`
--

INSERT INTO `alternate_contact_person_details` (`u_name`, `u_contact`, `u_addr`, `usr_id`) VALUES
('Harish', 7894561234, 'Koramangala', 1),
('Ravi', 8456123587, 'Jayanagar', 2),
('Tanya', 7596412389, 'Basavanagudi', 3),
('Usha', 7459612358, 'Yeshwantpur', 4),
('Ira', 7456981236, 'JP Nagar', 5),
('Paru', 9564812375, 'Bommanhalli', 6),
('Jay', 9541237845, 'Rajajinagar', 7),
('Nitish', 8451276351, 'Adugodi', 8),
('Banu', 7845692314, 'RR Nagar', 9),
('Kavita', 8456283971, 'Viveknagar', 10);

-- --------------------------------------------------------

--
-- Table structure for table `auto_bike_service`
--

CREATE TABLE `auto_bike_service` (
  `vehicle_id` int(11) DEFAULT NULL,
  `vehicle_type` varchar(255) DEFAULT NULL,
  `reg_no` varchar(255) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `usr_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auto_bike_service`
--

INSERT INTO `auto_bike_service` (`vehicle_id`, `vehicle_type`, `reg_no`, `driver_id`, `usr_id`) VALUES
(201, 'bike_A', 'KA512345', 3, 6),
(202, 'bike_B', 'KA512765', 2, 9),
(203, 'auto', 'KA285362', 4, 5),
(204, 'auto', 'KA561234', 2, 9),
(205, 'bike_C', 'KA457899', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `billing_detail`
--

CREATE TABLE `billing_detail` (
  `bill_no` int(11) NOT NULL,
  `bill_date` date DEFAULT NULL,
  `total_amt` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `usr_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `billing_detail`
--

INSERT INTO `billing_detail` (`bill_no`, `bill_date`, `total_amt`, `discount`, `usr_id`) VALUES
(2022101, '2022-10-09', 203, 32, 1),
(2022102, '2022-10-18', 130, 23, 3),
(2022103, '2022-10-15', 560, 34, 2),
(2022105, '2022-07-10', 193, 5, 5),
(2022109, '2022-08-09', 90, 22, 4),
(2022110, '2022-10-17', 150, 9, 7),
(2022117, '2022-10-09', 293, 28, 6),
(2022118, '2022-10-09', 200, 33, 8);

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(11) NOT NULL,
  `driver_fname` varchar(255) DEFAULT NULL,
  `driver_lname` varchar(255) DEFAULT NULL,
  `driver_phone` bigint(11) DEFAULT NULL,
  `d_salary` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`driver_id`, `driver_fname`, `driver_lname`, `driver_phone`, `d_salary`) VALUES
(1, 'Shiv', 'Kutty', 7528459612, 10000),
(2, 'Ram', 'Jose', 7524459612, 12000),
(3, 'Jeev', 'Jobs', 9875392223, 11000),
(4, 'Steve', 'Jobs', 9875342223, 14000),
(5, 'Bill', 'Gates', 9875342213, 15000);

-- --------------------------------------------------------

--
-- Table structure for table `driver_bike_auto`
--

CREATE TABLE `driver_bike_auto` (
  `driver_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `driver_bike_auto`
--

INSERT INTO `driver_bike_auto` (`driver_id`, `vehicle_id`) VALUES
(1, 2),
(1, 3),
(2, 3),
(1, 4),
(3, 4),
(2, 5),
(4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `driver_taxi`
--

CREATE TABLE `driver_taxi` (
  `driver_id` int(11) NOT NULL,
  `taxi_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `driver_taxi`
--

INSERT INTO `driver_taxi` (`driver_id`, `taxi_id`) VALUES
(1, 2),
(1, 3),
(1, 4),
(2, 3),
(2, 5),
(3, 4),
(4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `taxi`
--

CREATE TABLE `taxi` (
  `taxi_id` int(11) DEFAULT NULL,
  `taxi_type` varchar(255) DEFAULT NULL,
  `reg_no` varchar(255) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `usr_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `taxi`
--

INSERT INTO `taxi` (`taxi_id`, `taxi_type`, `reg_no`, `driver_id`, `usr_id`) VALUES
(101, 'premium delux', 'KA011234', 2, 3),
(102, 'XL', 'KA023454', 1, 2),
(103, 'delux', 'KA021234', 3, 5),
(104, 'go sedan', 'KA011233', 1, 4),
(101, 'premium delux', 'KA011234', 5, 6),
(104, 'go sedan', 'KA011233', 2, 7),
(102, 'XL', 'KA023454', 2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `trip_detail`
--

CREATE TABLE `trip_detail` (
  `trip_id` int(11) NOT NULL,
  `fare` int(11) DEFAULT NULL,
  `trip_date` date DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `usr_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trip_detail`
--

INSERT INTO `trip_detail` (`trip_id`, `fare`, `trip_date`, `start_time`, `end_time`, `usr_id`) VALUES
(1, 50, '2022-10-09', '2022-10-09 15:07:36', '2022-10-09 16:07:36', 1),
(2, 100, '2022-10-18', '2022-10-18 11:07:36', '2022-10-18 15:07:36', 2),
(3, 310, '2022-11-01', '2022-11-01 14:02:20', '2022-11-01 16:02:20', 5),
(4, 290, '2022-11-02', '2022-11-02 09:02:20', '2022-11-02 11:02:20', 7),
(5, 100, '2022-11-03', '2022-11-03 14:02:20', '2022-11-01 16:02:20', 5),
(6, 230, '2022-11-03', '2022-11-03 09:02:20', '2022-11-02 11:02:20', 7),
(7, 130, '2022-11-04', '2022-11-04 14:02:20', '2022-11-01 16:02:20', 2),
(8, 250, '2022-11-05', '2022-11-05 09:02:20', '2022-11-02 11:02:20', 7);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `usr_id` int(11) NOT NULL,
  `u_fname` varchar(255) DEFAULT NULL,
  `u_lname` varchar(255) DEFAULT NULL,
  `u_phone` bigint(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`usr_id`, `u_fname`, `u_lname`, `u_phone`) VALUES
(1, 'Aksh', 'Mallo', 7894662336),
(2, 'Kevin', 'Smith', 9784512533),
(3, 'Harry', 'Potter', 7894662336),
(4, 'Ron', 'Weasley', 9784512533),
(5, 'fred', 'george', 7675344223),
(6, 'hermione', 'granger', 7675344223),
(7, 'arthur', 'weasley', 7675344223),
(8, 'deeps', 'geroge', 7675344223),
(9, 'Sahana', 'Evan', 7975391114),
(10, 'Raaghu', 'AK', 87945612345);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alternate_contact_person_details`
--
ALTER TABLE `alternate_contact_person_details`
  ADD KEY `usr_id` (`usr_id`);

--
-- Indexes for table `auto_bike_service`
--
ALTER TABLE `auto_bike_service`
  ADD KEY `driver_id` (`driver_id`),
  ADD KEY `usr_id` (`usr_id`);

--
-- Indexes for table `billing_detail`
--
ALTER TABLE `billing_detail`
  ADD PRIMARY KEY (`bill_no`),
  ADD KEY `usr_id` (`usr_id`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indexes for table `driver_bike_auto`
--
ALTER TABLE `driver_bike_auto`
  ADD PRIMARY KEY (`vehicle_id`,`driver_id`);

--
-- Indexes for table `driver_taxi`
--
ALTER TABLE `driver_taxi`
  ADD PRIMARY KEY (`driver_id`,`taxi_id`);

--
-- Indexes for table `taxi`
--
ALTER TABLE `taxi`
  ADD KEY `usr_id` (`usr_id`);

--
-- Indexes for table `trip_detail`
--
ALTER TABLE `trip_detail`
  ADD PRIMARY KEY (`trip_id`),
  ADD KEY `usr_id` (`usr_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`usr_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alternate_contact_person_details`
--
ALTER TABLE `alternate_contact_person_details`
  ADD CONSTRAINT `alternate_contact_person_details_ibfk_1` FOREIGN KEY (`usr_id`) REFERENCES `users` (`usr_id`);

--
-- Constraints for table `auto_bike_service`
--
ALTER TABLE `auto_bike_service`
  ADD CONSTRAINT `auto_bike_service_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`driver_id`),
  ADD CONSTRAINT `auto_bike_service_ibfk_2` FOREIGN KEY (`usr_id`) REFERENCES `users` (`usr_id`);

--
-- Constraints for table `billing_detail`
--
ALTER TABLE `billing_detail`
  ADD CONSTRAINT `billing_detail_ibfk_1` FOREIGN KEY (`usr_id`) REFERENCES `users` (`usr_id`);

--
-- Constraints for table `taxi`
--
ALTER TABLE `taxi`
  ADD CONSTRAINT `taxi_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`driver_id`),
  ADD CONSTRAINT `taxi_ibfk_2` FOREIGN KEY (`usr_id`) REFERENCES `users` (`usr_id`);

--
-- Constraints for table `trip_detail`
--
ALTER TABLE `trip_detail`
  ADD CONSTRAINT `trip_detail_ibfk_1` FOREIGN KEY (`usr_id`) REFERENCES `users` (`usr_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
