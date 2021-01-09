-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 09, 2021 at 10:37 AM
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
(2, 'Memuntahkan semua makanan dan atau minuman'),
(3, 'Pernah atau sedang mengalami kejang ?'),
(4, 'Gelisah ?'),
(5, 'Letargis atau Tidak Sadar ?'),
(6, 'Ada stridor ?'),
(7, 'Tampak Biru(sianosis) ?'),
(8, 'Ujung tangan dan kaki balita pucat dan dingin ?'),
(9, 'Tarikan dinding dada ke dalam'),
(10, 'Saturasi Oksigen < 90%'),
(11, 'Napas cepat'),
(12, 'Tidak ada tanda-tanda Pneumonia Berat maupun Pneumonia'),
(13, 'Mata cekung'),
(14, 'Tidak bisa minum atau malas minum'),
(15, 'Cubitan kulit perut kembali sangat lambat'),
(16, 'Rewel / mudah marah'),
(17, 'Haus, minum Dengan lahap'),
(18, 'Cubitan kulit perut kembali lambat'),
(19, 'Tidak cukup tanda-tanda untuk diklasifikasikan sebagai diare dehidrasi Berat atau ringan/sedang'),
(20, 'Diare 14 hari atau lebih'),
(21, 'Ada darah dalam tinja'),
(22, 'Dengan dehidrasi'),
(23, 'Tanpa dehidrasi'),
(24, 'Ada tanda bahaya umum'),
(25, 'Kaku kuduk'),
(26, 'Demam (pada anamnesis atau teraba panas atau suhu ≥ 37,5 °C)'),
(27, 'Mikroskopis positif atau RDT positif'),
(28, 'Mikroskopis negatif atau RDT negatif'),
(29, 'Ditemukan penyebab lain dari demam'),
(30, 'Usia ≤ 3 bulan'),
(31, 'Tidak ada tanda bahaya umum'),
(32, 'Tidak ada kaku kuduk'),
(33, 'Adanya kekeruhan pada kornea mata'),
(34, 'Ada luka di mulut yang dalam atau luas'),
(35, 'Ada nanah pada mata'),
(36, 'Ada luka pada mulut'),
(37, 'Ada tanda tanda syok'),
(38, 'Nyeri ulu hati'),
(39, 'Muntah-muntah'),
(40, 'Perdarahan (kulit/hidung/BAB)'),
(41, 'Uji torniket positif'),
(42, 'Demam mendadak tinggi dan terus menerus'),
(43, 'Bintik-bintik perdarahan di kulit negatif'),
(44, 'Uji torniket negatif'),
(45, 'Tidak ada satupun gejala di atas'),
(46, 'Campak sekarang atau dalam 3 bulan terakhir'),
(47, 'Pembengkakan yang nyeri di belakang Telinga'),
(48, 'Nyeri Telinga'),
(49, 'Rasa penuh di Telinga'),
(50, 'Tampak cairan/nanah keluar dari Telinga selama kurang dari 14 hari'),
(51, 'Tampak cairan/nanah keluar dari Telinga dan telah terjadi selama 14 hari atau lebih'),
(52, 'Tidak ada nyeri Telinga DAN tidak ada nanah keluar dari Telinga'),
(53, 'Terlihat sangat kurus'),
(54, 'Endema pada kedua punggung kaki'),
(55, 'BB/PP (TB) < -3 SD'),
(56, 'LiLA  < 11,5 cm'),
(57, 'Klasifikasi Berat'),
(58, 'Masalah pemberian ASI pada umur < 6 bulan'),
(59, 'BB/PB (TB) - 3 SD sampai - 2 SD'),
(60, 'LiLA 11,5 cm - 12,5 cm'),
(61, 'BB/PB (TB) ≥ - 2 SD'),
(62, 'LiLA ≥ 12,5 cm'),
(63, 'Telapak tangan sangat pucat'),
(64, 'Telapak tangan agak pucat'),
(65, 'Tidak ditemukan tanda kepucatan pada telapak tangan'),
(66, 'Tes HIV anak positif'),
(67, 'Ibu HIV positif atau riwayat kematian orang tua atau saudara kandung yang didiagnosis HIV atau Dengan gejala klinis AIDS'),
(68, 'Ibu HIV positif'),
(69, 'Anak dari ibu Dengan HIV, masih mendapat ASI'),
(70, 'Anak dari ibu Dengan HIV, status HIV anak tidak diketahui'),
(71, 'Tes HIV pada ibu atau anak negatif');

-- --------------------------------------------------------

--
-- Table structure for table `mtbs_klasifikasi`
--

CREATE TABLE `mtbs_klasifikasi` (
  `idKlasifikasi` int(11) NOT NULL,
  `namaKlasifikasi` varchar(300) NOT NULL,
  `idPenyakit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mtbs_klasifikasi`
--

INSERT INTO `mtbs_klasifikasi` (`idKlasifikasi`, `namaKlasifikasi`, `idPenyakit`) VALUES
(1, 'Penyakit Sangat Berat', 1),
(2, 'Diare Dehidrasi Berat', 3),
(3, 'Diare Dehidrasi Ringan / Sedang', 3),
(4, 'Diare Tanpa Dehidrasi', 3),
(5, 'Sangat Kurus Dengan Komplikasi', 10),
(6, 'Sangat Kurus Tanpa Komplikasi', 10),
(7, 'Kurus ', 10),
(8, 'Normal', 10),
(9, 'Mastoiditis', 9),
(10, 'Infeksi Telinga Akut', 9),
(11, 'Infeksi Telinga Kronis', 9),
(12, 'Tidak ADA Infeksi Telinga', 9),
(13, 'Pneumonia Berat', 2),
(14, 'Pneumonia', 2),
(15, 'Batuk Bukan Pneumonia', 2),
(16, 'Infeksi HIV Terkonfirmasi', 12),
(17, 'Diduga Terinfeksi HIV', 12),
(18, 'Terpajan HIV', 12),
(19, 'Mungkin Bukan Infeksi HIV', 12),
(20, 'Penyakit Berat Dengan Demam', 6),
(21, 'Malaria', 6),
(22, 'Demam Mungkin Bukan Malaria', 6),
(23, 'Penyakit Berat Dengan Demam', 6),
(24, 'Demam Bukan Malaria', 6),
(25, 'Campak Dengan Komplikasi Berat', 7),
(26, 'Campak Dengan Komplikasi Pada Mata Dan/Atau Mulut', 7),
(27, 'Campak', 7),
(28, 'Anemia Berat', 11),
(29, 'Anemia', 11),
(30, 'Tidak Anemia', 11),
(31, 'Demam Berdarah Dengue (DBD)', 8),
(32, 'Mungkin DBD', 8),
(33, 'Demam Mungkin Bukan DBD', 8),
(34, 'Diare Persisten Berat', 4),
(35, 'Diare Persisten', 4),
(36, 'Disentri', 4);

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
  `pemberian` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mtbs_obat`
--

INSERT INTO `mtbs_obat` (`idObat`, `namaObat`, `pemberian`) VALUES
(1, 'Diazepam', ''),
(2, 'Amoksisilin', '2 X sehari selama 3 hari untuk Pneumonia ATAU 2 X selama 5 hari untuk Pneumonia Dengan klasifikasi HIV merah'),
(3, 'Tetrasiklin', '4 x sehari selama 3 hari'),
(4, 'Kotrimoksasol', '2 X sehari selama 3 hari'),
(5, 'Kotrimoksasol', '4mg/kgBB/kali	2 x sehari selama 5 hari'),
(6, 'Sefiksim', '1,5 - 3 mg/KgB	2x sehari selama 5 hari'),
(7, 'Metronidazol', '3 x sehari selama 10 hari (untuk amuba))'),
(8, 'Parasetamol', 'Setiap 6 jam sampai demam atau nyeri Telinga hilang'),
(9, 'Vitamin A', 'Hari ke 1, dan hari ke 2'),
(10, 'Vitamin A', 'Untuk Pengobatan Defisiensi Vit A, Xerofthalmia dan Gizi Sangat Kurus	Hari ke 1, Hari Ke 2, dan Hari Ke 15'),
(11, 'Vitamin A', 'Untuk Pengobatan Campak TANPA Komplikasi Mata dan / atau Mulut	Hari ke 1'),
(12, 'Amoksisilin', '40mg/kgBB/hari	2 X sehari selama 7 hari untuk Infeksi Telinga Akut'),
(13, 'Zat Besi', '1 X tiap hari selama 4 minggu untuk anak umur 6 bulan sampai 5 tahun');

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

--
-- Dumping data for table `mtbs_penyakit`
--

INSERT INTO `mtbs_penyakit` (`idPenyakit`, `namaPenyakit`) VALUES
(1, 'TandaBahayaUmum'),
(2, 'Batuk'),
(3, 'Diare'),
(4, 'DiareLama'),
(5, 'DiareDarah'),
(6, 'Demam'),
(7, 'Campak'),
(8, 'DBD'),
(9, 'Telinga'),
(10, 'Gizi'),
(11, 'Anemia'),
(12, 'HIV');

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
  `namaTindakan` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mtbs_tindakan`
--

INSERT INTO `mtbs_tindakan` (`idTindakan`, `namaTindakan`) VALUES
(1, 'Bila sedang kejang beri diazepam'),
(2, 'Bila ada stridor pastikan tidak ada sumbatan jalan napas'),
(3, 'Bila ada stridor, sianosis dan ujung tangan dan kaki pucat dan dingin berikan oksigen 3 - 5 liter/menit melalui nasal prong dengan perangkat oksigen standar (Tabung O, dan humidifier)'),
(4, 'Cegah agar gula darah tidak turun'),
(5, 'Jaga anak tetap hangat'),
(6, 'RUJUK SEGERA'),
(7, 'Beri Oksigen maksimal 2-3 liter/menit dengan menggunakan nasal prong'),
(8, 'Beri dosis pertama antibiotik yang sesuai'),
(9, 'Beri amoksilin 2x sehari selama 3 hr atau 5 hr'),
(10, 'Beri pelega tenggorokan dan pereda batuk yang aman'),
(11, 'Obati wheezing bila ada'),
(12, 'RUJUK untuk pemeriksaan lanjutan, karena anak batuk > 14 hari'),
(13, 'Nasihati kapan kembali segera'),
(14, 'Kunjungan ulang 2 hari'),
(15, 'RUJUK untuk pemeriksaan TB dan sebab lain'),
(16, 'Kunjungan ulang 2 hari jika tidak ada perbaikan'),
(17, 'Jika Tidak ada klasifikasi berat lain: Beri cairan untuk dehidrasi berat dan tablet Zinc sesuai rencana terapi C'),
(18, 'Jika anak juga mempunyai klasifikasi berat lain: \r\n -RUJUK SEGERA \r\n -Jika masih bisa minum, berikan ASI dan larutan oralit selama perjalanan'),
(19, 'Jika anak >2 tahun dan ada wabah kolera di daerah tersebut, beri antibiotik untuk kolera'),
(20, 'Beri cairan, tablet Zinc dan makanan sesuai Rencana Terapi B'),
(21, 'Kunjungan ulang 3 hari jika tidak ada perbaikan'),
(22, 'Beri cairan, tablet Zinc dan makanan sesuai Rencana terapi A'),
(23, 'Atasi dehidrasi sebelum dirujuk, kecuali ada klasifikasi berat lain'),
(24, 'RUJUK'),
(25, 'Nasihati pemberian makan untuk Diare Persisten'),
(26, 'Beri tablet zinc selama 10 hari berturut-turut'),
(27, 'Kunjungan ulang 3 hari'),
(28, 'Beri antibiotik yang sesuai'),
(29, 'Beri dosis pertama artemeter injeksi atau kinin injeksi untuk malaria berat'),
(30, 'Beri satu dosis parasetamol untuk demam ≥ 38,5 °C'),
(31, 'Kunjungan ulang 3 hari jika tetap demam'),
(32, 'Beri obat anti malaria oral pilihan pertama'),
(33, 'Jika demam berlanjut lebih dari 7 hari, RUJUK untuk penilaian lebih lanjut'),
(34, 'Obati penyebab lain dari demam'),
(35, 'Beri vitamin A dosis pengobatan'),
(36, 'Kunjungan ulang 2 hari jika tetap demam'),
(37, 'Jika ada kekeruhan pada kornea atau nanah pada mata berikan salep mata antibiotik'),
(38, 'Jika demam tinggi (≥ 38,5° C) beri dosis pertama parasetamol'),
(39, 'Jika ada nanah pada mata, beri salep mata antibiotik'),
(40, 'Jika ada luka pada mulut oleskan antiseptik mulut'),
(41, 'Jika anak Gizi Sangat Kurus beri vitamin A sesuai dosis'),
(42, 'Jika ada syok, beri Oksigen 2-4 liter/menit dan beri segera cairan intravena sesuai petunjuk'),
(43, 'Jika tidak ada syok tapi sering muntah atau malas minum, beri cairan infus Ringer Laktat/Ringer Asetat, jumlah cairan rumatan'),
(44, 'Jika tidak ada syok, tidak muntah dan masih mau minum, beri oralit atau cairan lain sebanyak mungkin dalam perjalanan ke rumah sakit'),
(45, 'Beri dosis pertama parasetamol, jika demam tinggi (≥ 38,5 ° C), tidak boleh golongan salisilat dan ibuprofen'),
(46, 'Nasihati untuk lebih banyak minum: oralit/cairan lain'),
(47, 'Kunjungan ulang 1 hari'),
(48, 'Beri dosis pertama parasetamol untuk mengatasi nyeri'),
(49, 'Beri antibiotik yang sesuai selama 7 hari'),
(50, 'Beri parasetamol untuk mengatasi nyeri'),
(51, 'Keringkan telinga dengan bahan penyerap'),
(52, 'Keringkan telinga dengan bahan penyerap setelah dicuci dengan NaCl 0,9% atau H2O2 3%'),
(53, 'Kunjungan ulang 5 hari'),
(54, 'Beri tetes telinga yang sesuai'),
(55, 'Tangani masalah telinga yang ditemukan'),
(56, 'Beri Vit A dosis pertama'),
(57, 'Cegah gula darah tidak turun'),
(58, 'Hangatkan badan'),
(59, 'Beri antibiotik yang sesuai selama 5 hari'),
(60, 'RUJUK untuk penanganan gizi sangat kurus termasuk kemungkinan adanya penyakit penyerta'),
(61, 'Kunjungan ulang 7 hari'),
(62, 'Lakukan Penilaian Pemberian Makan pada anak dan nasihati sesuai “Anjuran Makan Untuk Anak Sehat Maupun Sakit”. Bila ada masalah pemberian makan, kunjungan ulang 7 hari'),
(63, 'RUJUK untuk penilaianan kemungkinan adanya penyakit penyerta (Infeksi TB dll)'),
(64, 'Kunjungan ulang 30 hari.'),
(65, 'Jika anak berumur kurang dari 2 tahun, lakukan penilaian pemberian makan dan nasihati sesuai “Anjuran Makan untuk Anak Sehat Maupun Sakit”. Bila ada masalah pemberian makan, kunjungan ulang 7 hari'),
(66, 'Anjurkan untuk menimbang berat badan anak setiap bulan'),
(67, 'Bila masih menyusu, teruskan pemberian ASI'),
(68, 'Lakukan Penilaian Pemberian Makan pada anak. Bila ada masalah, beri konseling pemberian makan dan kunjungan ulang 7 hari'),
(69, 'Beri zat besi'),
(70, 'Lakukan pemeriksaan tinja untuk deteksi kecacingan'),
(71, 'Jika daerah Endemis Tinggi Malaria: periksa dan obati malaria terlebih dahulu jika positif.'),
(72, 'Kunjungan ulang 14 hari'),
(73, 'Jika anak < 2 tahun, nilai pemberian makanan pada anak. Jika ada masalah pemberian makan, kunjungan ulang 7 hari'),
(74, 'Rujuk ke puskesmas/RS Rujukan ARV untuk mendapatkan terapi ARV dan Kotrimoksasol profilaksis'),
(75, 'Rujuk ke puskesmas / RS Rujukan ARV untuk mendapatkan pemeriksaan lebih lanjut dan terapi ARV dan Kotrimoksasol profilaksis'),
(76, 'Rujuk ke puskesmas / RS Rujukan ARV untuk mendapatkan pemeriksaan lebih lanjut dan ARV profilaksis serta Kotrimoksasol profilaksis'),
(77, 'Tangani Infeksi yang ada');

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
-- Indexes for table `mtbs_penyakit`
--
ALTER TABLE `mtbs_penyakit`
  ADD PRIMARY KEY (`idPenyakit`);

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
  MODIFY `idGejala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `mtbs_klasifikasi`
--
ALTER TABLE `mtbs_klasifikasi`
  MODIFY `idKlasifikasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `mtbs_obat`
--
ALTER TABLE `mtbs_obat`
  MODIFY `idObat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
-- AUTO_INCREMENT for table `mtbs_penyakit`
--
ALTER TABLE `mtbs_penyakit`
  MODIFY `idPenyakit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  MODIFY `idTindakan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
