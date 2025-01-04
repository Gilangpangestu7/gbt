-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2025 at 06:55 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `daftar_poli`
--

CREATE TABLE `daftar_poli` (
  `id` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `id_jadwal` int(11) NOT NULL,
  `keluhan` text NOT NULL,
  `no_antrian` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `daftar_poli`
--

INSERT INTO `daftar_poli` (`id`, `id_pasien`, `id_jadwal`, `keluhan`, `no_antrian`) VALUES
(1, 1, 1, 'Demam dan pusing', 1),
(2, 2, 3, 'Sakit gigi', 1),
(3, 3, 5, 'Mata berair', 1),
(4, 4, 6, 'Batuk pilek', 1),
(29, 19, 1, 'sakit parah', 2),
(30, 24, 1, 'sakit demam', 3),
(31, 25, 1, 'demam', 4),
(32, 26, 24, 'sakit, demam', 1),
(33, 27, 25, 'panas, demam', 1);

-- --------------------------------------------------------

--
-- Table structure for table `detail_periksa`
--

CREATE TABLE `detail_periksa` (
  `id` int(11) NOT NULL,
  `id_periksa` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `detail_periksa`
--

INSERT INTO `detail_periksa` (`id`, `id_periksa`, `id_obat`) VALUES
(30, 1, 1),
(31, 1, 4),
(32, 2, 2),
(33, 3, 4),
(34, 4, 2),
(35, 4, 4),
(36, 36, 2),
(37, 36, 1),
(38, 37, 2),
(39, 37, 5),
(40, 38, 2),
(41, 39, 2),
(42, 39, 5),
(43, 40, 2),
(44, 40, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id` int(11) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_hp` varchar(13) NOT NULL,
  `id_poli` int(11) NOT NULL,
  `password` varchar(100) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id`, `nama`, `alamat`, `no_hp`, `id_poli`, `password`, `deleted_at`) VALUES
(1, 'Gilang', 'Jl. brebes No. 12', '085329727224', 1, 'dokter123', '2024-12-26 06:02:47'),
(2, 'Dr. Sinta Dewi', 'Jl. Apel No. 15', '08234567890', 2, 'dokter123', NULL),
(3, 'Dr. Budi Santoso', 'Jl. Jeruk No. 20', '08345678901', 3, 'dokter123', '2024-12-26 06:27:00'),
(4, 'Dr. Maya Putri', 'Jl. Anggur No. 25', '08456789012', 4, 'dokter123', NULL),
(43, 'gg', 'smg', '085329727224', 4, '1234', '2024-12-25 12:03:45');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_periksa`
--

CREATE TABLE `jadwal_periksa` (
  `id` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `hari` varchar(10) NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `status` tinyint(1) DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `jadwal_periksa`
--

INSERT INTO `jadwal_periksa` (`id`, `id_dokter`, `hari`, `jam_mulai`, `jam_selesai`, `status`, `deleted_at`) VALUES
(1, 1, 'Senin', '08:00:00', '16:00:00', 0, NULL),
(2, 1, 'Rabu', '08:00:00', '16:00:00', 1, NULL),
(3, 2, 'Selasa', '09:00:00', '17:00:00', 1, NULL),
(4, 2, 'Kamis', '09:00:00', '17:00:00', 0, NULL),
(5, 3, 'Rabu', '10:00:00', '18:00:00', 1, NULL),
(6, 4, 'Jumat', '08:00:00', '16:00:00', 1, NULL),
(24, 1, 'Selasa', '18:24:00', '19:20:00', 0, NULL),
(25, 1, 'Jumat', '17:52:00', '12:57:00', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id` int(11) NOT NULL,
  `nama_obat` varchar(50) NOT NULL,
  `kemasan` varchar(35) DEFAULT NULL,
  `harga` int(10) UNSIGNED DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id`, `nama_obat`, `kemasan`, `harga`, `deleted_at`) VALUES
(1, 'Paracetamol', 'Strip 10 Tablet', 12000, NULL),
(2, 'Amoxicillin', 'Strip 8 Kapsul', 25000, NULL),
(3, 'Omeprazole', 'Strip 6 Tablet', 35000, NULL),
(4, 'Vitamin C', 'Strip 12 Tablet', 15000, NULL),
(5, 'Aspirin', 'Strip 10 Tablet', 12000, NULL),
(16, 'Ibuprofen', 'Strip 10 Tablet', 18000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id` int(11) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_ktp` varchar(20) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `no_rm` char(10) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id`, `nama`, `alamat`, `no_ktp`, `no_hp`, `no_rm`, `deleted_at`) VALUES
(1, 'Rudi Hermawan', 'Jl. Mawar No. 1', '3374123456789001', '081234567890', '202401-001', NULL),
(2, 'Siti Aminah', 'Jl. Melati No. 2', '3374123456789002', '082345678901', '202401-002', NULL),
(3, 'Joko Widodo', 'Jl. Kenanga No. 3', '3374123456789003', '083456789012', '202401-003', NULL),
(4, 'Ani Susilowati', 'Jl. Dahlia No. 4', '3374123456789004', '084567890123', '202401-004', NULL),
(19, 'Aditya Gilang Pangestu', 'Brebes', '12333', '085329727224', '202412-005', NULL),
(24, 'gilanggg', 'semarang', '123456', '085329727224', '202412-006', NULL),
(25, 'dodi', 'Brebes', '123', '085329727224', '202412-007', NULL),
(26, 'fajri', 'brebes', '12345', '085329727224', '202412-008', NULL),
(27, 'dani', 'brebes', '1234', '085329727224', '202412-009', NULL),
(28, 'adi', 'Brebes', '19888', '085329727222', '202501-010', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `periksa`
--

CREATE TABLE `periksa` (
  `id` int(11) NOT NULL,
  `id_daftar_poli` int(11) NOT NULL,
  `tgl_periksa` date NOT NULL,
  `catatan` text NOT NULL,
  `biaya_periksa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `periksa`
--

INSERT INTO `periksa` (`id`, `id_daftar_poli`, `tgl_periksa`, `catatan`, `biaya_periksa`) VALUES
(1, 1, '2024-01-08', 'Flu dan kecapekan', 165000),
(2, 2, '2024-01-09', 'Gigi berlubang', 175000),
(3, 3, '2024-01-10', 'Iritasi mata', 185000),
(4, 4, '2024-01-12', 'ISPA', 170000),
(36, 29, '2024-12-08', 'istirahat yaa', 187000),
(37, 30, '2024-12-12', 'istirahat', 187000),
(38, 31, '2024-12-12', 'istirahat', 175000),
(39, 32, '2024-12-26', 'istirahat ya fajri', 187000),
(40, 33, '2024-12-26', 'istirahat dani', 187000);

-- --------------------------------------------------------

--
-- Table structure for table `poli`
--

CREATE TABLE `poli` (
  `id` int(11) NOT NULL,
  `nama_poli` varchar(25) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `poli`
--

INSERT INTO `poli` (`id`, `nama_poli`, `keterangan`, `deleted_at`) VALUES
(1, 'Poli Umum', 'Menangani masalah kesehatan umum', NULL),
(2, 'Poli Gigi', 'Menangani masalah kesehatan gigi dan mulut', NULL),
(3, 'Poli Mata', 'Menangani masalah kesehatan mata', NULL),
(4, 'Poli Anak', 'Menangani masalah kesehatan anak', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`) USING BTREE;

--
-- Indexes for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id_pasien` (`id_pasien`) USING BTREE,
  ADD KEY `id_jadwal` (`id_jadwal`) USING BTREE;

--
-- Indexes for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id_periksa` (`id_periksa`) USING BTREE,
  ADD KEY `id_obat` (`id_obat`) USING BTREE;

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id_poli` (`id_poli`) USING BTREE;

--
-- Indexes for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id_dokter` (`id_dokter`) USING BTREE;

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `periksa`
--
ALTER TABLE `periksa`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id_daftar_poli` (`id_daftar_poli`) USING BTREE;

--
-- Indexes for table `poli`
--
ALTER TABLE `poli`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `periksa`
--
ALTER TABLE `periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `poli`
--
ALTER TABLE `poli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD CONSTRAINT `daftar_poli_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id`),
  ADD CONSTRAINT `daftar_poli_ibfk_2` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal_periksa` (`id`);

--
-- Constraints for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD CONSTRAINT `detail_periksa_ibfk_1` FOREIGN KEY (`id_periksa`) REFERENCES `periksa` (`id`),
  ADD CONSTRAINT `detail_periksa_ibfk_2` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id`);

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `dokter_ibfk_1` FOREIGN KEY (`id_poli`) REFERENCES `poli` (`id`);

--
-- Constraints for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD CONSTRAINT `jadwal_periksa_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id`);

--
-- Constraints for table `periksa`
--
ALTER TABLE `periksa`
  ADD CONSTRAINT `periksa_ibfk_1` FOREIGN KEY (`id_daftar_poli`) REFERENCES `daftar_poli` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
