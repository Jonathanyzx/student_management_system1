-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2025 at 07:01 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `students_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrators`
--

CREATE TABLE `administrators` (
  `id` int(11) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `name` varchar(100) NOT NULL,
  `admin_id` varchar(20) NOT NULL,
  `pin` varchar(4) NOT NULL,
  `role` enum('Super Admin','Admin','Staff') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `administrators`
--

INSERT INTO `administrators` (`id`, `phone_number`, `name`, `admin_id`, `pin`, `role`, `created_at`) VALUES
(1, '0782806477', 'NSENGIMANA Jonathan', '10', '1234', 'Admin', '2025-05-01 09:52:49');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` enum('Present','Absent') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `student_id`, `date`, `status`, `created_at`) VALUES
(1, 1, '2024-01-01', 'Present', '2025-05-01 09:46:49'),
(2, 1, '2024-01-02', 'Present', '2025-05-01 09:46:49'),
(3, 1, '2024-01-03', 'Absent', '2025-05-01 09:46:49'),
(4, 2, '2024-01-01', 'Present', '2025-05-01 09:46:49'),
(5, 2, '2024-01-02', 'Present', '2025-05-01 09:46:49'),
(6, 2, '2024-01-03', 'Present', '2025-05-01 09:46:49');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `code`, `name`, `description`, `created_at`) VALUES
(1, 'MATH101', 'Mathematics', 'Basic Mathematics Course', '2025-05-01 09:46:49'),
(2, 'ENG101', 'English', 'English Language Course', '2025-05-01 09:46:49'),
(3, 'SCI101', 'Science', 'General Science Course', '2025-05-01 09:46:49'),
(4, 'HIS101', 'History', 'World History Course', '2025-05-01 09:46:49');

-- --------------------------------------------------------

--
-- Table structure for table `exam_results`
--

CREATE TABLE `exam_results` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `score` decimal(5,2) NOT NULL,
  `exam_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exam_results`
--

INSERT INTO `exam_results` (`id`, `student_id`, `course_id`, `score`, `exam_date`, `created_at`) VALUES
(1, 1, 1, 85.50, '2024-01-15', '2025-05-01 09:46:49'),
(2, 1, 2, 78.00, '2024-01-15', '2025-05-01 09:46:49'),
(3, 2, 1, 92.00, '2024-01-15', '2025-05-01 09:46:49'),
(4, 2, 2, 88.50, '2024-01-15', '2025-05-01 09:46:49');

-- --------------------------------------------------------

--
-- Table structure for table `fee_payments`
--

CREATE TABLE `fee_payments` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `reference_number` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fee_payments`
--

INSERT INTO `fee_payments` (`id`, `student_id`, `amount`, `payment_date`, `payment_method`, `reference_number`, `created_at`) VALUES
(1, 1, 5000.00, '2024-01-01', 'USSD', 'PAY001', '2025-05-01 09:46:50'),
(2, 1, 3000.00, '2024-01-15', 'USSD', 'PAY002', '2025-05-01 09:46:50'),
(3, 2, 5000.00, '2024-01-01', 'USSD', 'PAY003', '2025-05-01 09:46:50'),
(4, 4, 50000.00, '2025-05-01', 'USSD', 'PAY68135e860c9ad', '2025-05-01 11:44:06'),
(5, 3, 50000.00, '2025-05-05', 'USSD', 'PAY68186f6c8eb83', '2025-05-05 07:57:32');

-- --------------------------------------------------------

--
-- Table structure for table `parents`
--

CREATE TABLE `parents` (
  `id` int(11) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `name` varchar(100) NOT NULL,
  `pin` varchar(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parents`
--

INSERT INTO `parents` (`id`, `phone_number`, `name`, `pin`, `created_at`) VALUES
(1, '254700000004', 'Robert Doe', '4321', '2025-05-01 09:46:49'),
(2, '254700000005', 'Mary Smith', '8765', '2025-05-01 09:46:49'),
(3, '0782806477', 'Mugabo alex', '1234', '2025-05-01 09:48:44'),
(4, '0782806474', 'BIZIMANA Benny', '1234', '2025-05-01 10:09:09');

-- --------------------------------------------------------

--
-- Table structure for table `parent_students`
--

CREATE TABLE `parent_students` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `relationship` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parent_students`
--

INSERT INTO `parent_students` (`id`, `parent_id`, `student_id`, `relationship`, `created_at`) VALUES
(1, 1, 1, 'Father', '2025-05-01 09:46:49'),
(2, 2, 2, 'Mother', '2025-05-01 09:46:49'),
(3, 4, 4, 'Father', '2025-05-01 10:27:22');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `name` varchar(100) NOT NULL,
  `registration_number` varchar(20) NOT NULL,
  `pin` varchar(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `phone_number`, `name`, `registration_number`, `pin`, `created_at`) VALUES
(1, '254700000001', 'John Doe', 'REG001', '1234', '2025-05-01 09:46:49'),
(2, '254700000002', 'Jane Smith', 'REG002', '5678', '2025-05-01 09:46:49'),
(3, '254700000003', 'Mike Johnson', 'REG003', '9012', '2025-05-01 09:46:49'),
(4, '0782806473', 'NSENGIMANA Jonny', 'REG004', '1234', '2025-05-01 10:06:44'),
(5, '250782806472', 'HAR BEE', 'REG005', '1234', '2025-05-01 11:48:04');

-- --------------------------------------------------------

--
-- Table structure for table `student_courses`
--

CREATE TABLE `student_courses` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `enrollment_date` date NOT NULL,
  `status` enum('Active','Completed','Dropped') DEFAULT 'Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_courses`
--

INSERT INTO `student_courses` (`id`, `student_id`, `course_id`, `enrollment_date`, `status`, `created_at`) VALUES
(1, 1, 1, '2024-01-01', 'Active', '2025-05-01 09:46:49'),
(2, 1, 2, '2024-01-01', 'Active', '2025-05-01 09:46:49'),
(3, 2, 1, '2024-01-01', 'Active', '2025-05-01 09:46:49'),
(4, 2, 2, '2024-01-01', 'Active', '2025-05-01 09:46:49'),
(5, 2, 4, '2025-05-01', 'Active', '2025-05-01 10:01:07'),
(6, 3, 2, '2025-05-05', 'Active', '2025-05-05 08:51:56');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `name` varchar(100) NOT NULL,
  `teacher_id` varchar(20) NOT NULL,
  `pin` varchar(4) NOT NULL,
  `department` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `phone_number`, `name`, `teacher_id`, `pin`, `department`, `created_at`) VALUES
(1, '0782806477', 'KALIZA Noella', '1', '1234', NULL, '2025-05-01 09:50:22');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_attendance`
--

CREATE TABLE `teacher_attendance` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` enum('Present','Absent') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher_attendance`
--

INSERT INTO `teacher_attendance` (`id`, `teacher_id`, `date`, `status`, `created_at`) VALUES
(1, 1, '2025-05-01', 'Present', '2025-05-01 09:51:08'),
(2, 1, '2025-05-01', 'Present', '2025-05-01 10:41:25'),
(3, 1, '2025-05-01', 'Present', '2025-05-01 11:40:54');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_courses`
--

CREATE TABLE `teacher_courses` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `academic_year` varchar(9) NOT NULL,
  `semester` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher_courses`
--

INSERT INTO `teacher_courses` (`id`, `teacher_id`, `course_id`, `academic_year`, `semester`, `created_at`) VALUES
(1, 1, 3, '2025', '1', '2025-05-01 10:38:37');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_payments`
--

CREATE TABLE `teacher_payments` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `reference_number` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher_payments`
--

INSERT INTO `teacher_payments` (`id`, `teacher_id`, `amount`, `payment_date`, `payment_method`, `reference_number`, `created_at`) VALUES
(1, 1, 50000.00, '2025-05-13', 'USD', '222222222222', '2025-05-14 11:33:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrators`
--
ALTER TABLE `administrators`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_number` (`phone_number`),
  ADD UNIQUE KEY `admin_id` (`admin_id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `exam_results`
--
ALTER TABLE `exam_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `fee_payments`
--
ALTER TABLE `fee_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_number` (`phone_number`);

--
-- Indexes for table `parent_students`
--
ALTER TABLE `parent_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_number` (`phone_number`),
  ADD UNIQUE KEY `registration_number` (`registration_number`);

--
-- Indexes for table `student_courses`
--
ALTER TABLE `student_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_number` (`phone_number`),
  ADD UNIQUE KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `teacher_attendance`
--
ALTER TABLE `teacher_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `teacher_courses`
--
ALTER TABLE `teacher_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `teacher_payments`
--
ALTER TABLE `teacher_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrators`
--
ALTER TABLE `administrators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `exam_results`
--
ALTER TABLE `exam_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fee_payments`
--
ALTER TABLE `fee_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `parents`
--
ALTER TABLE `parents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `parent_students`
--
ALTER TABLE `parent_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `student_courses`
--
ALTER TABLE `student_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `teacher_attendance`
--
ALTER TABLE `teacher_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `teacher_courses`
--
ALTER TABLE `teacher_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `teacher_payments`
--
ALTER TABLE `teacher_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `exam_results`
--
ALTER TABLE `exam_results`
  ADD CONSTRAINT `exam_results_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `exam_results_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `fee_payments`
--
ALTER TABLE `fee_payments`
  ADD CONSTRAINT `fee_payments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `parent_students`
--
ALTER TABLE `parent_students`
  ADD CONSTRAINT `parent_students_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `parents` (`id`),
  ADD CONSTRAINT `parent_students_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `student_courses`
--
ALTER TABLE `student_courses`
  ADD CONSTRAINT `student_courses_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `student_courses_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `teacher_attendance`
--
ALTER TABLE `teacher_attendance`
  ADD CONSTRAINT `teacher_attendance_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);

--
-- Constraints for table `teacher_courses`
--
ALTER TABLE `teacher_courses`
  ADD CONSTRAINT `teacher_courses_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`),
  ADD CONSTRAINT `teacher_courses_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `teacher_payments`
--
ALTER TABLE `teacher_payments`
  ADD CONSTRAINT `teacher_payments_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
