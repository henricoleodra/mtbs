-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 09, 2021 at 10:01 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mtbs`
--

-- --------------------------------------------------------

--
-- Table structure for table `mtbs_gejala`
--

CREATE TABLE `mtbs_gejala` (
  `idGejala` int(11) NOT NULL,
  `namaGejala` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mtbs_gejala`
--

INSERT INTO `mtbs_gejala` (`idGejala`, `namaGejala`) VALUES
(1, 'Tidak Bisa Minum Atau Menyusu ?'),
(2, 'Memuntahkan semua makanan dan atau minuman');

-- --------------------------------------------------------

--
-- Table structure for table `mtbs_klasifikasi`
--

CREATE TABLE `mtbs_klasifikasi` (
  `idKlasifikasi` int(11) NOT NULL,
  `namaKlasifikasi` varchar(300) NOT NULL,
  `idPenyakit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mtbs_klasifikasi_obat`
--

CREATE TABLE `mtbs_klasifikasi_obat` (
  `idKlasifikasi` int(11) NOT NULL,
  `idObat` int(11) NOT NULL,
  `dosis` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mtbs_obat`
--

CREATE TABLE `mtbs_obat` (
  `idObat` int(11) NOT NULL,
  `namaObat` varchar(200) NOT NULL,
  `pemberian` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mtbs_pasien`
--

CREATE TABLE `mtbs_pasien` (
  `idPasien` int(11) NOT NULL,
  `namaIbu` varchar(100) NOT NULL,
  `namaAnak` varchar(100) NOT NULL,
  `tanggalLahir` date NOT NULL,
  `provinsi` varchar(50) NOT NULL,
  `kota` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `rt` int(11) NOT NULL,
  `rw` int(11) NOT NULL,
  `kelurahanDesa` varchar(100) NOT NULL,
  `kecamatan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mtbs_pasien`
--

INSERT INTO `mtbs_pasien` (`idPasien`, `namaIbu`, `namaAnak`, `tanggalLahir`, `provinsi`, `kota`, `alamat`, `rt`, `rw`, `kelurahanDesa`, `kecamatan`) VALUES
(1, 'Friska', 'Michael', '2020-12-01', '1', '', 'Coba', 1, 2, 'Contoh Kelurahan Desa', 'Contoh Kota Kecamatan'),
(2, 'Jane Doe', 'John Doe', '2020-12-01', '2', '', 'Alamat', 1, 2, 'Kel Des', 'Kot Kec'),
(3, 'Ibu', 'Anak', '2020-12-01', '4', '', 'Alamat Rumah', 1, 3, 'Kelurahan Desa', 'Kota Kecamatan'),
(4, 'Ibu Haha', 'Anak Haha', '2020-12-08', '7', '', 'Alamat Haha', 4, 7, 'Desa', 'Kecamatan'),
(5, 'Hai', 'Hai', '2018-01-30', '0', 'Bandung', 'Hai', 1, 2, 'Hai', 'Hai');

-- --------------------------------------------------------

--
-- Table structure for table `mtbs_pemeriksaan`
--

CREATE TABLE `mtbs_pemeriksaan` (
  `idPemeriksaan` int(11) NOT NULL,
  `tanggalPemeriksaan` date NOT NULL,
  `suhu` float NOT NULL,
  `beratBadan` int(11) NOT NULL,
  `tinggiBadan` int(11) NOT NULL,
  `kunjungan` int(11) NOT NULL,
  `keluhan` varchar(500) NOT NULL,
  `idPasien` int(11) NOT NULL,
  `idPerawat` int(11) NOT NULL,
  `idPuskesmas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mtbs_pemeriksaan_gejala`
--

CREATE TABLE `mtbs_pemeriksaan_gejala` (
  `idPemeriksaan` int(11) NOT NULL,
  `idGejala` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mtbs_pemeriksaan_klasifikasi`
--

CREATE TABLE `mtbs_pemeriksaan_klasifikasi` (
  `idPemeriksaan` int(11) NOT NULL,
  `idKlasifikasi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mtbs_pemeriksaan_obat`
--

CREATE TABLE `mtbs_pemeriksaan_obat` (
  `idPemeriksaan` int(11) NOT NULL,
  `idObat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mtbs_pemeriksaan_obat`
--

INSERT INTO `mtbs_pemeriksaan_obat` (`idPemeriksaan`, `idObat`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `mtbs_pemeriksaan_tindakan`
--

CREATE TABLE `mtbs_pemeriksaan_tindakan` (
  `idPemeriksaan` int(11) NOT NULL,
  `idTindakan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mtbs_penyakit`
--

CREATE TABLE `mtbs_penyakit` (
  `idPenyakit` int(11) NOT NULL,
  `namaPenyakit` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mtbs_perawat`
--

CREATE TABLE `mtbs_perawat` (
  `idPerawat` int(11) NOT NULL,
  `namaPerawat` varchar(300) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(300) NOT NULL,
  `idPuskesmas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mtbs_perawat`
--

INSERT INTO `mtbs_perawat` (`idPerawat`, `namaPerawat`, `username`, `password`, `idPuskesmas`) VALUES
(6, 'Henrico', 'henrico', '$2y$10$fbB1CQuNnA/XQR8IjdAva.9/80F1wSOJri0XtQqQzWb/uler6IaK6', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mtbs_puskesmas`
--

CREATE TABLE `mtbs_puskesmas` (
  `idPuskesmas` int(11) NOT NULL,
  `namaPuskesmas` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mtbs_tindakan`
--

CREATE TABLE `mtbs_tindakan` (
  `idTindakan` int(11) NOT NULL,
  `namaTindakan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mtbs_gejala`
--
ALTER TABLE `mtbs_gejala`
  ADD PRIMARY KEY (`idGejala`);

--
-- Indexes for table `mtbs_klasifikasi`
--
ALTER TABLE `mtbs_klasifikasi`
  ADD PRIMARY KEY (`idKlasifikasi`);

--
-- Indexes for table `mtbs_obat`
--
ALTER TABLE `mtbs_obat`
  ADD PRIMARY KEY (`idObat`);

--
-- Indexes for table `mtbs_pasien`
--
ALTER TABLE `mtbs_pasien`
  ADD PRIMARY KEY (`idPasien`);

--
-- Indexes for table `mtbs_pemeriksaan`
--
ALTER TABLE `mtbs_pemeriksaan`
  ADD PRIMARY KEY (`idPemeriksaan`);

--
-- Indexes for table `mtbs_perawat`
--
ALTER TABLE `mtbs_perawat`
  ADD PRIMARY KEY (`idPerawat`);

--
-- Indexes for table `mtbs_puskesmas`
--
ALTER TABLE `mtbs_puskesmas`
  ADD PRIMARY KEY (`idPuskesmas`);

--
-- Indexes for table `mtbs_tindakan`
--
ALTER TABLE `mtbs_tindakan`
  ADD PRIMARY KEY (`idTindakan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mtbs_gejala`
--
ALTER TABLE `mtbs_gejala`
  MODIFY `idGejala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mtbs_klasifikasi`
--
ALTER TABLE `mtbs_klasifikasi`
  MODIFY `idKlasifikasi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mtbs_obat`
--
ALTER TABLE `mtbs_obat`
  MODIFY `idObat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mtbs_pasien`
--
ALTER TABLE `mtbs_pasien`
  MODIFY `idPasien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mtbs_pemeriksaan`
--
ALTER TABLE `mtbs_pemeriksaan`
  MODIFY `idPemeriksaan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mtbs_perawat`
--
ALTER TABLE `mtbs_perawat`
  MODIFY `idPerawat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mtbs_puskesmas`
--
ALTER TABLE `mtbs_puskesmas`
  MODIFY `idPuskesmas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mtbs_tindakan`
--
ALTER TABLE `mtbs_tindakan`
  MODIFY `idTindakan` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
