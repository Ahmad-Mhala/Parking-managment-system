-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 26, 2020 at 02:06 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `parking`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(500) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(500) NOT NULL,
  `gender` varchar(500) NOT NULL,
  `dob` text NOT NULL,
  `contact` text NOT NULL,
  `addr` varchar(500) NOT NULL,
  `notes` varchar(200) NOT NULL,
  `image` varchar(2000) NOT NULL,
  `created_on` date NOT NULL,
  `updated_on` date NOT NULL,
  `role_id` int(11) NOT NULL,
  `last_login` date NOT NULL,
  `delete_status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password`, `fname`, `lname`, `gender`, `dob`, `contact`, `addr`, `notes`, `image`, `created_on`, `updated_on`, `role_id`, `last_login`, `delete_status`) VALUES
(1, 'Ahmad', 'ahmad@gmail.com', 'ahmad', 'Ahmad', 'Mhala', 'male', '2018-11-26', '9999999999', '<p>Maharashtra, India</p>\r\n', '<p>admin panel</p>\r\n', '133.jpeg', '2018-04-30', '2019-10-15', 1, '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `manage_website`
--

CREATE TABLE `manage_website` (
  `id` int(11) NOT NULL,
  `business_name` varchar(600) NOT NULL,
  `business_email` varchar(600) NOT NULL,
  `business_web` varchar(500) NOT NULL,
  `portal_addr` varchar(500) NOT NULL,
  `addr` varchar(600) NOT NULL,
  `curr_sym` varchar(600) NOT NULL,
  `curr_position` varchar(500) NOT NULL,
  `front_end_en` varchar(500) NOT NULL,
  `date_format` date NOT NULL,
  `def_tax` varchar(500) NOT NULL,
  `logo` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manage_website`
--

INSERT INTO `manage_website` (`id`, `business_name`, `business_email`, `business_web`, `portal_addr`, `addr`, `curr_sym`, `curr_position`, `front_end_en`, `date_format`, `def_tax`, `logo`) VALUES
(1, 'LAGOS PARKER', 'mayuri.infospace@gmail.com', '#', '#', '<p>Maharashtra, India</p>\r\n', 'NGN', 'right', '0', '0000-00-00', '0.20', 'Logo13.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `ID` int(10) NOT NULL,
  `VehicleCat` varchar(120) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`ID`, `VehicleCat`, `CreationDate`) VALUES
(1, 'Four Wheeler Vehicle', '2019-07-05 11:06:50'),
(2, 'Two Wheeler Vehicle', '2019-07-05 11:07:09'),
(8, 'Bicycle', '2020-08-21 08:43:53');

-- --------------------------------------------------------

--
-- Table structure for table `tblvehicle`
--

CREATE TABLE `tblvehicle` (
  `ID` int(10) NOT NULL,
  `ParkingNumber` varchar(120) DEFAULT NULL,
  `VehicleCategory` varchar(120) NOT NULL,
  `VehicleCompanyname` varchar(120) DEFAULT NULL,
  `RegistrationNumber` varchar(120) DEFAULT NULL,
  `OwnerName` varchar(120) DEFAULT NULL,
  `OwnerContactNumber` bigint(10) DEFAULT NULL,
  `InTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `OutTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ParkingCharge` varchar(120) NOT NULL,
  `Remark` mediumtext NOT NULL,
  `Status` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblvehicle`
--

INSERT INTO `tblvehicle` (`ID`, `ParkingNumber`, `VehicleCategory`, `VehicleCompanyname`, `RegistrationNumber`, `OwnerName`, `OwnerContactNumber`, `InTime`, `OutTime`, `ParkingCharge`, `Remark`, `Status`) VALUES
(11, '311967592', 'Four Wheeler Vehicle', 'Tata ', 'MH 12 DE 1433', 'Atul', 1234567890, '2020-08-21 08:27:10', '2020-08-21 08:30:06', '30', 'vehicle out', 'Out'),
(12, '273061937', 'Four Wheeler Vehicle', 'Tata Indica', 'MH 14 GS 9286', 'Suraj Nathe', 1234567890, '2020-08-21 08:45:24', '2020-08-21 08:52:10', '50', 'Vehicle OUT', 'Out'),
(13, '913984655', 'Two Wheeler Vehicle', 'Activa', 'MH 12 NJ 8196', 'Mayuri', 1234567890, '2020-08-21 08:46:54', NULL, '', '', ''),
(14, '975434674', 'Four Wheeler Vehicle', 'Maruti', 'MH 15 GX 4812', 'Raghav', 1234567890, '2020-08-21 08:50:04', NULL, '', '', ''),
(15, '384903562', 'Two Wheeler Vehicle', 'Pulsur', 'MH 13 DN 3597', 'Akash', 1234567890, '2020-08-21 08:51:03', NULL, '', '', ''),
(16, '520029772', 'Bicycle', 'Hercules', 'MH 13 DN 3598', 'Rajesh', 1234567890, '2020-08-25 11:10:59', '2020-08-25 12:16:19', '', '', ''),
(17, '522378554', 'Four Wheeler Vehicle', 'Tata Nano', 'MH 15 GX 3245', 'Suraj', 1234567890, '2020-08-25 11:11:45', NULL, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_email_config`
--



--
-- Table structure for table `tbl_permission`
--

CREATE TABLE `tbl_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `display_name` varchar(200) NOT NULL,
  `operation` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_permission`
--

INSERT INTO `tbl_permission` (`id`, `name`, `display_name`, `operation`) VALUES
(1, 'repairs', 'Repairs', 'repairs'),
(2, 'create_repair', 'Create Repair	', 'create_repair	'),
(3, 'edit_repair', 'Edit Repair', 'edit_repair'),
(4, 'delete_repair', 'Delete Repair', 'delete_repair'),
(5, 'manage_category', 'Manage Category', 'manage_category'),
(6, 'sales', 'Sales', 'sales'),
(7, 'invoices', 'Invoices', 'invoices'),
(8, 'edit_invoice', 'Edit Invoice', 'edit_invoice'),
(9, 'add_payment', 'Add Payment', 'add_payment'),
(10, 'custom_reports', 'Custom Reports', 'custom_reports'),
(11, 'financial_overview', 'Financial Overview', 'financial_overview'),
(12, 'manage_expense', 'Manage Expense', 'manage_expense'),
(13, 'create_expense', 'Create Expense', 'create_expense'),
(14, 'edit_expense', 'Edit Expense', 'edit_expense'),
(15, 'delete_expense', 'Delete Expense', 'delete_expense'),
(16, 'generate_invoice', 'Generate Invoice', 'generate_invoice'),
(17, 'products', 'Products', 'products'),
(18, 'create_product', 'Create Product', 'create_product'),
(19, 'edit_product', 'Edit Product', 'edit_product'),
(20, 'delete_product', 'Delete Product', 'delete_product'),
(21, 'users', 'Users', 'users'),
(22, 'create_user', 'Create User', 'create_user'),
(23, 'edit_user', 'Edit User', 'edit_user'),
(24, 'delete_user', 'Delete User', 'delete_user'),
(25, 'manage_roles', 'Manage Roles', 'manage_roles'),
(26, 'settings', 'Settings', 'settings'),
(27, 'communication', 'Communication', 'communication'),
(28, 'create_communication', 'Create Communication', 'create_communication'),
(29, 'delete_communication', 'Delete Communication', 'delete_communication'),
(30, 'payroll', 'Payroll', 'payroll'),
(31, 'create_payroll', 'Create Payroll', 'create_payroll'),
(32, 'edit_payroll', 'Edit Payroll', 'edit_payroll'),
(33, 'delete_payroll', 'Delete Payroll', 'delete_payroll'),
(34, 'departments', 'Departments', 'departments'),
(35, 'saved_items', 'Saved Item', 'saved_items'),
(36, 'create_saved_item', 'Create Saved Item', 'create_saved_item'),
(37, 'edit_saved_item', 'Edit Saved Item', 'edit_saved_item'),
(38, 'delete_saved_item', 'Delete Saved Item', 'delete_saved_item'),
(39, 'dashboard', 'Dashboard', 'dashboard'),
(40, 'clients_statistics', 'Clients Statistics', 'clients_statistics'),
(41, 'invoices_statistics', 'Invoices Statistics', 'invoices_statistics'),
(42, 'repairs_statistics', 'Repairs Statistics', 'repairs_statistics'),
(43, 'financial_overview_graph', 'Financial Overview Graph', 'financial_overview_graph'),
(44, 'calendar', 'Calendar', 'calendar');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_permission_role`
--

CREATE TABLE `tbl_permission_role` (
  `id` int(30) NOT NULL,
  `permission_id` int(30) NOT NULL,
  `role_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_permission_role`
--

INSERT INTO `tbl_permission_role` (`id`, `permission_id`, `role_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 1),
(12, 12, 1),
(13, 13, 1),
(14, 14, 1),
(15, 15, 1),
(16, 16, 1),
(17, 17, 1),
(18, 18, 1),
(19, 19, 1),
(20, 20, 1),
(21, 21, 1),
(22, 22, 1),
(23, 23, 1),
(24, 24, 1),
(25, 25, 1),
(26, 26, 1),
(27, 27, 1),
(28, 28, 1),
(29, 29, 1),
(30, 30, 1),
(31, 31, 1),
(32, 32, 1),
(33, 33, 1),
(34, 34, 1),
(35, 35, 1),
(36, 36, 1),
(37, 37, 1),
(38, 38, 1),
(39, 39, 1),
(40, 40, 1),
(41, 41, 1),
(42, 42, 1),
(43, 43, 1),
(44, 44, 1),
(45, 1, 2),
(46, 2, 2),
(47, 6, 2),
(48, 9, 2),
(49, 12, 2),
(50, 17, 2),
(51, 35, 2),
(52, 39, 2),
(53, 40, 2),
(54, 41, 2),
(55, 42, 2),
(56, 43, 2),
(57, 44, 2),
(236, 34, 4),
(237, 1, 3),
(238, 2, 3),
(239, 3, 3),
(240, 4, 3),
(241, 5, 3),
(242, 6, 3),
(243, 7, 3),
(244, 8, 3),
(245, 9, 3),
(246, 10, 3),
(247, 13, 3),
(248, 14, 3),
(249, 17, 3),
(250, 18, 3),
(251, 26, 3),
(252, 27, 3),
(253, 28, 3),
(254, 29, 3),
(255, 34, 3),
(256, 35, 3),
(257, 36, 3),
(258, 37, 3),
(259, 38, 3),
(260, 39, 3),
(261, 40, 3),
(262, 41, 3),
(263, 42, 3),
(264, 43, 3),
(265, 44, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_role`
--

CREATE TABLE `tbl_role` (
  `id` int(11) NOT NULL,
  `role_name` varchar(200) NOT NULL,
  `slug` varchar(500) NOT NULL,
  `delete_status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_role`
--

INSERT INTO `tbl_role` (`id`, `role_name`, `slug`, `delete_status`) VALUES
(1, 'Admin', 'admin', 0),


-- --------------------------------------------------------


--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manage_website`
--
ALTER TABLE `manage_website`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblvehicle`
--
ALTER TABLE `tblvehicle`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_email_config`
--
ALTER TABLE `tbl_email_config`
  ADD PRIMARY KEY (`e_id`);

--
-- Indexes for table `tbl_permission`
--
ALTER TABLE `tbl_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_permission_role`
--
ALTER TABLE `tbl_permission_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_role`
--
ALTER TABLE `tbl_role`
  ADD PRIMARY KEY (`id`);


--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `manage_website`
--
ALTER TABLE `manage_website`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblvehicle`
--
ALTER TABLE `tblvehicle`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_email_config`
--
ALTER TABLE `tbl_email_config`
  MODIFY `e_id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_permission`
--
ALTER TABLE `tbl_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tbl_permission_role`
--
ALTER TABLE `tbl_permission_role`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=266;

--
-- AUTO_INCREMENT for table `tbl_role`
--
ALTER TABLE `tbl_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
