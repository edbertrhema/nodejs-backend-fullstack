/* Replace with your SQL commands */

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 05, 2023 at 12:25 PM
-- Server version: 11.1.2-MariaDB
-- PHP Version: 8.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `auth_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `uuid`, `name`, `price`, `userId`, `createdAt`, `updatedAt`) VALUES
(5, '89ef9c31-6cc3-41e4-934a-78213ddcc63c', 'Garam dapur', 1000, 9, '2023-10-22 13:41:23', '2023-10-27 04:04:31'),
(6, 'd8d3f81a-843a-4dfe-a9de-8d7fcfeec9d8', 'Merica', 1000, 9, '2023-10-22 13:41:36', '2023-10-22 13:41:36'),
(7, '65b3ae2b-404b-408f-874f-dab40624173b', 'Bumbu Masako', 3000, 1, '2023-10-22 13:46:50', '2023-10-22 13:46:50'),
(8, 'ed2d28a6-6781-4512-9aee-8b60e601ca2d', 'salmon', 98000, 3, '2023-10-22 14:00:14', '2023-10-22 14:41:31'),
(9, 'b9f57647-6ef9-4f6f-9f26-a26bdaa08232', 'sapi', 100000, 3, '2023-10-22 14:00:21', '2023-10-22 14:00:21'),
(12, 'f19e88da-b523-4a5f-b4aa-4e05696d06be', 'Pisang', 6000, 9, '2023-10-27 02:56:32', '2023-10-27 02:56:32'),
(13, '3cf75248-61ef-468d-869c-7f6282050105', 'Apel', 3000, 9, '2023-10-27 02:58:52', '2023-10-27 02:58:52'),
(14, '510ebecf-ea48-4e35-8502-874f41cb85b7', 'wortel', 1000, 9, '2023-10-27 03:49:08', '2023-10-27 03:49:08'),
(15, '3b31148e-1eae-4a65-8875-242469264b46', 'Kecap ABC', 15000, 14, '2023-10-27 17:14:28', '2023-10-27 17:14:57'),
(16, '765cc7de-c5c4-4668-82d3-35bf3df1cfc4', 'Merica', 500, 14, '2023-10-27 17:14:42', '2023-10-27 17:14:42'),
(17, 'cd1806b4-6787-43b9-8bb5-f8fb4f77f4c0', 'apel', 1000, 1, '2023-11-02 03:20:34', '2023-11-02 03:20:34'),
(18, 'a27345f2-84e4-42fb-979f-87aa8a942d44', 'apel fuji', 4000, 1, '2023-11-02 03:39:04', '2023-11-02 03:39:04'),
(19, '1b70027c-28d3-46af-8de4-95e1d15f8d2c', 'Rambutan', 10000, 9, '2023-11-02 04:30:54', '2023-11-02 04:30:59'),
(20, 'cd5a4635-136c-4dbc-bb07-9faf35a70f7a', 'Ember', 8000, 17, '2023-11-03 13:26:24', '2023-11-03 13:26:24');

-- --------------------------------------------------------

--
-- Table structure for table `token_bl`
--

CREATE TABLE `token_bl` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `token_bl`
--

INSERT INTO `token_bl` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImVkYmVydEBnbWFpbC5jb20iLCJpZCI6MSwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjk4Njc2ODQ4LCJleHAiOjE2OTg2ODA0NDh9.hVkHRbIz624BQmdZ2Ojuzxzm82PitfBk6ymleBsgoVg', '2023-10-30 14:52:22', '2023-10-30 14:52:22'),
(2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImVkYmVydEBnbWFpbC5jb20iLCJpZCI6MSwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjk4Njc5MjM3LCJleHAiOjE2OTg2ODI4Mzd9.Pq_bH-hRIWifs-26mx7zVwdZYtnec2Q-Q-CkkW-x4yU', '2023-10-30 15:23:35', '2023-10-30 15:23:35'),
(3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImVkYmVydEBnbWFpbC5jb20iLCJpZCI6MSwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjk4NzMzMDI5LCJleHAiOjE2OTg3MzY2Mjl9.-0pCGbtaMiD3whzIduMKAALBJ2q0-OpHxCgRsGM8tKM', '2023-10-31 06:17:37', '2023-10-31 06:17:37'),
(4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiZDNjNTNjZTctYWU4YS00Mzk0LThkMDktZjk2NGJlMWJkODA5IiwibmFtZSI6InRlbyIsImVtYWlsIjoidGVvQGdtYWlsLmNvbSIsImlkIjo5LCJyb2xlIjoidXNlciIsImlhdCI6MTY5ODg5Nzg1NSwiZXhwIjoxNjk4OTg0MjU1fQ.EtEfmF0e01cSmuBwnNkFEEfQq8sIK63_t-PNGAwQXgM', '2023-11-02 04:16:53', '2023-11-02 04:16:53'),
(5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiZDNjNTNjZTctYWU4YS00Mzk0LThkMDktZjk2NGJlMWJkODA5IiwibmFtZSI6InRlbyIsImVtYWlsIjoidGVvQGdtYWlsLmNvbSIsImlkIjo5LCJyb2xlIjoidXNlciIsImlhdCI6MTY5ODg5OTIwOSwiZXhwIjoxNjk4OTg1NjA5fQ.Z9OW_yo0bverpocSDNA2Cht_vPE_slVHoWshuktHcUg', '2023-11-02 04:26:57', '2023-11-02 04:26:57'),
(6, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiZDNjNTNjZTctYWU4YS00Mzk0LThkMDktZjk2NGJlMWJkODA5IiwibmFtZSI6InRlbyIsImVtYWlsIjoidGVvQGdtYWlsLmNvbSIsImlkIjo5LCJyb2xlIjoidXNlciIsImlhdCI6MTY5ODg5OTQyOCwiZXhwIjoxNjk4OTg1ODI4fQ.ySaLigagDafZB4_uHYHrRb9Tx60LZ2rGpCwn657D2Pw', '2023-11-02 04:38:01', '2023-11-02 04:38:01'),
(7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiNWU3NGVkZWItMDMxNS00MTFlLWIyNTItNGJmZDc0ZDdhY2RjIiwibmFtZSI6ImVkYmVydCIsImVtYWlsIjoiZWRiZXJ0QGdtYWlsLmNvbSIsImlkIjoxLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE2OTg5MDA5MjcsImV4cCI6MTY5ODk4NzMyN30.bHgJ4Y1-u9i3D6XByaj5vlb7HHhPQR321ZpGkTBZ1lA', '2023-11-02 05:02:24', '2023-11-02 05:02:24'),
(8, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiZDNjNTNjZTctYWU4YS00Mzk0LThkMDktZjk2NGJlMWJkODA5IiwibmFtZSI6InRlbyIsImVtYWlsIjoidGVvQGdtYWlsLmNvbSIsImlkIjo5LCJyb2xlIjoidXNlciIsImlhdCI6MTY5ODkwMTM1MiwiZXhwIjoxNjk4OTg3NzUyfQ.dyGO1UidQCRGav67cS9HR_CSwSa1T0Ja_iP0xK-8m5s', '2023-11-02 05:02:37', '2023-11-02 05:02:37'),
(9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiNWU3NGVkZWItMDMxNS00MTFlLWIyNTItNGJmZDc0ZDdhY2RjIiwibmFtZSI6ImVkYmVydCIsImVtYWlsIjoiZWRiZXJ0QGdtYWlsLmNvbSIsImlkIjoxLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE2OTg4OTQzMjUsImV4cCI6MTY5ODk4MDcyNX0.Se114srNUfL0ZnzSN9cnwnzcb7t5LI5xtIgw1ZxAP9E', '2023-11-02 06:18:03', '2023-11-02 06:18:03'),
(10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiNWU3NGVkZWItMDMxNS00MTFlLWIyNTItNGJmZDc0ZDdhY2RjIiwibmFtZSI6ImVkYmVydCIsImVtYWlsIjoiZWRiZXJ0QGdtYWlsLmNvbSIsImlkIjoxLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE2OTg5MDQ3NDksImV4cCI6MTY5ODk5MTE0OX0.vIC981MyBKN0rwZiaG9tQHRIIiAv1_RCVW4Fh4POsIc', '2023-11-02 08:45:26', '2023-11-02 08:45:26'),
(11, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiNWU3NGVkZWItMDMxNS00MTFlLWIyNTItNGJmZDc0ZDdhY2RjIiwibmFtZSI6ImVkYmVydCIsImVtYWlsIjoiZWRiZXJ0QGdtYWlsLmNvbSIsImlkIjoxLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE2OTg5OTc2MTUsImV4cCI6MTY5OTA4NDAxNX0.qTWjXqB0YIdpclW4qF34LCbjHKbmZgr0K5zcFYXI0s0', '2023-11-03 12:27:30', '2023-11-03 12:27:30'),
(12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiNWU3NGVkZWItMDMxNS00MTFlLWIyNTItNGJmZDc0ZDdhY2RjIiwibmFtZSI6ImVkYmVydCIsImVtYWlsIjoiZWRiZXJ0QGdtYWlsLmNvbSIsImlkIjoxLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE2OTkwMTU3ODgsImV4cCI6MTY5OTEwMjE4OH0.KLPM-QtQow6s8Ye9lPwZtmJUCxhDCXxVJtUYtPZhVo4', '2023-11-03 12:50:20', '2023-11-03 12:50:20'),
(13, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiZDNjNTNjZTctYWU4YS00Mzk0LThkMDktZjk2NGJlMWJkODA5IiwibmFtZSI6InRlbyIsImVtYWlsIjoidGVvQGdtYWlsLmNvbSIsImlkIjo5LCJyb2xlIjoidXNlciIsImlhdCI6MTY5OTAxNTg1MiwiZXhwIjoxNjk5MTAyMjUyfQ.RnDRteGRVTeUKcXgtZNakleMbekTaGEMJGBLeYO7new', '2023-11-03 12:51:03', '2023-11-03 12:51:03'),
(14, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiYWQwOTFjNDMtYzUwOC00OWIxLTlkNGQtZmY4ZGNjYzEyMDNmIiwibmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkBhZG1pbi5jb20iLCJpZCI6MTcsInJvbGUiOiJhZG1pbiIsImlhdCI6MTY5OTAxNzk2MiwiZXhwIjoxNjk5MTA0MzYyfQ.dCuAxEH22w75pFP4Pwe0kTCHa1gsJchsuw8sizP7GBs', '2023-11-03 13:36:29', '2023-11-03 13:36:29');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `refresh_token` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uuid`, `name`, `email`, `password`, `role`, `refresh_token`, `createdAt`, `updatedAt`) VALUES
(1, '5e74edeb-0315-411e-b252-4bfd74d7acdc', 'edbert', 'edbert@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$EC+aMcbEfTXEoP6Q6Iin2A$uPGTkceTAYcFP6Idi5RjN3liap1fQYc6yG5V6svDRe4', 'admin', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiNWU3NGVkZWItMDMxNS00MTFlLWIyNTItNGJmZDc0ZDdhY2RjIiwibmFtZSI6ImVkYmVydCIsImVtYWlsIjoiZWRiZXJ0QGdtYWlsLmNvbSIsImlkIjoxLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE2OTkxMjYxOTUsImV4cCI6MTY5OTIxMjU5NX0.6v-L-rpNZ6f8aOARDTqGeaG8c_pRv-Q8dwitJiImMU0', '2023-10-21 14:48:41', '2023-11-04 19:29:55'),
(3, '20ff7e6e-7493-44b3-a74f-a50a7e81fd93', 'niconi2', 'niconi2@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$xgNFm1hRa8G5ldH4KRiu7g$J85DcOG72zdC8JIc83CqTQkEJwq+9zOwlbD1WhYNDMg', 'user', '', '2023-10-22 12:33:58', '2023-11-02 08:35:32'),
(5, 'b39eae7b-bf6f-4dca-8c34-a5ecd0bfa942', 'tamara', 'tamara@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$CEqD6q1f8fC2EW1uQfvteQ$Et4dlFsen6o8u0gco5q1U3HRRy5d+o5WVM8i8HGES1k', 'admin', '', '2023-10-22 12:35:34', '2023-10-22 12:35:34'),
(6, 'c555740b-e822-4fcf-8aa2-13cb7c3a1b15', 'yaya', 'yaya@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$6sCselwoZUdUYLY52r604w$cNzHnFwD5fBhkCwCK82EIK6AG2wZ+Ee0QTXE3ah4BNA', 'admin', '', '2023-10-22 12:44:58', '2023-10-22 12:44:58'),
(7, '83cc4853-9b3d-4209-a287-f4ea22cab039', 'papa', 'papa@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$dPyMcroACR3kqrk1Bsb8rw$PkfK7US5ozB77Jf5ua3p+JgOCyhsZ0j9EIAVDwICwSo', 'admin', '', '2023-10-22 12:46:32', '2023-10-22 12:46:32'),
(8, '78c552d9-b086-4089-aa0e-a44c2bdc3a8e', 'mama', 'mama@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$oakhCtERfgbN6FPUhso2hA$ABWevCpzP87JwIZoVyEz/AXhyxNf4TqBqiyelG29rBg', 'user', '', '2023-10-22 13:06:56', '2023-10-22 13:06:56'),
(9, 'd3c53ce7-ae8a-4394-8d09-f964be1bd809', 'teo', 'teo@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$bAPw/t6oMnIzdQLojYLVDw$cNoflec81QSqC1E8OZkICnHw0uuguCCC+crL5vmTQ6Q', 'user', NULL, '2023-10-22 13:07:15', '2023-11-03 12:51:03'),
(12, '2f77b339-cfdd-40c8-a30a-249a96655b3b', 'user', 'user@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$imeGWMONHi8xu/wWGCoRDQ$wdojcpP+KCqz5Ga16RKBVazX6riiniuFqspZssCLcb8', 'user', '', '2023-10-27 09:24:24', '2023-10-27 09:24:24'),
(14, '4cc8b4da-3be7-426c-a9fe-77cd6505cd9c', 'koko', 'koko@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$deVjy3UHs1nP8XOBBfFG9w$AqYwVwtUytfQQmR0wTH9a9drgxUQeriKi6c5GJQ/NdU', 'user', '', '2023-10-27 17:12:48', '2023-10-27 17:12:48'),
(15, '8bbfa1a4-6e58-459a-94c5-dcc5029b645f', 'jojo', 'jojo@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$bCaWHdHQgtz1qqgYYB/nhQ$C76P/zT2vupTEscVCBIqaajam5qDZjcFt0UD8o8XGi4', 'user', NULL, '2023-11-02 05:55:10', '2023-11-02 05:55:10'),
(16, '9b29eece-010d-4f64-97f3-73116a6ae787', 'jonas', 'jonas@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$1lL/4DR1i2X1oRhuT8MSjw$OYEuoZJXNvdc0pUdBIbK1jrkz0I19Ufnw0JGCZnFC0o', 'user', NULL, '2023-11-02 06:15:36', '2023-11-02 06:15:36'),
(17, 'ad091c43-c508-49b1-9d4d-ff8dccc1203f', 'admin', 'admin@admin.com', '$argon2id$v=19$m=65536,t=3,p=4$veq5eZB3DtgG2KGNFqI0FA$4gI3zKAvGMZwbLkCKHFZJKkyq3TkfHgkCKO80jZKjgM', 'admin', NULL, '2023-11-03 13:20:33', '2023-11-03 13:36:29'),
(18, '7e455fe8-ad57-40cc-b5ea-b2473ee35af4', 'mimin', 'mimin@admin.com', '$argon2id$v=19$m=65536,t=3,p=4$RV4A7iWGDRFd1A36rZydPw$lueQTs00MbxF/5nei7NO60IKlr321zqKyKOabiXs9N4', 'admin', NULL, '2023-11-03 13:27:24', '2023-11-03 13:27:24'),
(19, 'b764952e-5275-4b91-b757-20ecf41e32b8', 'bebek', 'bebek@admin.com', '$argon2id$v=19$m=65536,t=3,p=4$Ty0j4lv2jqGa7wmgSoD+ug$H27KUBzb115eEZkuwD2FVRKJBI7zMohlKuR+hWUZUIc', 'admin', NULL, '2023-11-03 13:32:08', '2023-11-03 13:32:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `token_bl`
--
ALTER TABLE `token_bl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `token_bl`
--
ALTER TABLE `token_bl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;