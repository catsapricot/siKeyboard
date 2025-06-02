-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2025 at 12:05 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sikeyboard`
--

-- --------------------------------------------------------

--
-- Table structure for table `katalog`
--

CREATE TABLE `katalog` (
  `id_katalog` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `harga` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `jenis` enum('Keyboard','Accessories') NOT NULL,
  `layout_keyboard` varchar(100) DEFAULT NULL,
  `switch_type` varchar(100) DEFAULT NULL,
  `url_gambar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `katalog`
--

INSERT INTO `katalog` (`id_katalog`, `nama`, `harga`, `stock`, `jenis`, `layout_keyboard`, `switch_type`, `url_gambar`) VALUES
(1, 'Apollo61 Lite', 512000, 100, 'Keyboard', '60', 'Salmon', 'https://pressplayid.com/cdn/shop/files/Apollo61_Lite_a669500b-2a23-42e1-a66f-dbe25fb0dfba.jpg?v=1730964420'),
(2, 'Vortexseries Vortex Mono Series', 316000, 300, 'Keyboard', '75', 'JX Jade White', 'https://down-id.img.susercontent.com/file/id-11134207-7rasi-m54pccpi45ar82'),
(3, 'AJAZZ AK820 Monochrome', 349000, 200, 'Keyboard', '75', 'Red Switch', 'https://ae01.alicdn.com/kf/Sf557c5e796684d6f86583672b9019e0cZ.jpg'),
(4, 'Ajazz AK680 MAX HE', 514000, 50, 'Keyboard', '65', 'Rapid Trigger', 'https://ajazzbrand.com/cdn/shop/files/AJAZZ-AK680-MAX-Flagship-Edition-68-Key-Top-Structure-Wired-Mechanical-Keyboard-with-8K-Polling-Rate_a4d98892-6411-45a6-8a83-20444a6f751e.webp?v=1745997932'),
(5, 'Fantech Atom63', 286000, 150, 'Keyboard', '75', 'Blue Switch', 'https://down-id.img.susercontent.com/file/id-11134207-7r98u-lstllz8y2w4n2d'),
(6, 'ROVER84 Lightyear Edition', 1489000, 300, 'Keyboard', '75', 'Stardust White', 'https://pressplayid.com/cdn/shop/files/ROVER84_Lightyear.jpg?v=1734498349'),
(7, 'AirKeys', 269000, 700, 'Keyboard', '75', 'Scissor Switch', 'https://images.tokopedia.net/img/cache/700/aphluv/1997/1/1/e10395d515484f6aac008c428ce4a088~.jpeg'),
(8, 'Voyager68', 789000, 500, 'Keyboard', '65', 'KTT Kang White', 'https://pressplayid.com/cdn/shop/files/Voyager68_V2_Lite.jpg?v=1730964657'),
(9, 'Royal Kludge RK R75', 699000, 100, 'Keyboard', '75', 'K Silver Pro', 'https://neomacro.in/cdn/shop/files/R75Phantom_1.png?v=1724309482&width=1445'),
(10, 'Keychron K2 HE 75%', 2749000, 300, 'Keyboard', '75', 'Rapid Trigger', 'https://down-id.img.susercontent.com/file/id-11134207-7rasi-m3t1ytox6fab3a'),
(11, 'KTT Kang White Linear Switch', 3000, 2000, 'Accessories', NULL, NULL, 'https://clstech.com.au/cdn/shop/products/ktt-kang-white-157614.jpg?v=1674218988&width=1000'),
(12, 'GATERON Milky Yellow Pro KS-3', 3000, 5000, 'Accessories', NULL, NULL, 'https://divinikey.com/cdn/shop/products/gateron-ks-3-milky-yellow-pro-linear-switches-504850.jpg?v=1631230716&width=640'),
(13, 'KTT Rose Linear Switch', 3000, 5000, 'Accessories', NULL, NULL, 'https://res.cloudinary.com/kineticlabs/image/upload/q_auto/c_fit,w_1020/f_auto/v1/api-images/products/ktt-rose/DSC03145_oye97n'),
(14, '2in1 Keycap and Switch Puller Tool', 89900, 100, 'Accessories', NULL, NULL, 'https://ae01.alicdn.com/kf/Scb755179043f4d33a37f75ef207e6134F.jpg'),
(15, 'DUROCK V3 Stabilizer Gold Wire Plate Mount Set', 99900, 50, 'Accessories', NULL, NULL, 'https://down-id.img.susercontent.com/file/id-11134201-7rasd-m19ku2jur5yb3e');

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `id_user` int(11) NOT NULL,
  `id_katalog` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `keranjang`
--

INSERT INTO `keranjang` (`id_user`, `id_katalog`, `jumlah`) VALUES
(2, 1, 1),
(2, 10, 2),
(3, 3, 2),
(3, 12, 5),
(4, 7, 1),
(4, 14, 1),
(5, 2, 3),
(5, 5, 1),
(6, 4, 1),
(6, 15, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` bit(1) DEFAULT NULL,
  `security_key` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `nama`, `username`, `password`, `is_admin`, `security_key`) VALUES
(1, '', 'adminJarwo', 'jarwoganteng', b'1', 'jarwopacardewi'),
(2, 'Cantika', 'cantikDariLahir', 'yaudah', b'0', NULL),
(3, 'Meri', 'meriang', 'oke', b'0', NULL),
(4, 'Lana', 'lanang', 'siap', b'0', NULL),
(5, 'Budi', 'budass', 'setia', b'0', NULL),
(6, 'Mala', 'malas', 'banget', b'0', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `katalog`
--
ALTER TABLE `katalog`
  ADD PRIMARY KEY (`id_katalog`);

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_user`,`id_katalog`),
  ADD KEY `id_katalog` (`id_katalog`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `katalog`
--
ALTER TABLE `katalog`
  MODIFY `id_katalog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `keranjang_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE,
  ADD CONSTRAINT `keranjang_ibfk_2` FOREIGN KEY (`id_katalog`) REFERENCES `katalog` (`id_katalog`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
