-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Jun 2023 pada 00.59
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `epresensi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cabang`
--

CREATE TABLE `cabang` (
  `kode_cabang` char(3) NOT NULL,
  `nama_cabang` varchar(50) NOT NULL,
  `lokasi_cabang` varchar(255) NOT NULL,
  `radius` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `cabang`
--

INSERT INTO `cabang` (`kode_cabang`, `nama_cabang`, `lokasi_cabang`, `radius`) VALUES
('DV1', 'Divisi Satu', '-0.277005,101.457203', 20),
('DV2', 'Divisi Dua', '-0.303376,101.454769', 20),
('DV3', 'Divisi Tiga', '-0.294790,101.450597', 20),
('PT', 'PT Wanasari', '-0.2864155,101.4696525', 100),
('TES', 'Tes Absen', '-0.2864155,101.4696525', 100000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `departemen`
--

CREATE TABLE `departemen` (
  `kode_dept` char(3) NOT NULL,
  `nama_dept` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `departemen`
--

INSERT INTO `departemen` (`kode_dept`, `nama_dept`) VALUES
('ACC', 'Accounting'),
('HRD', 'Human Resources Department'),
('IT', 'Information & Teknologi'),
('PUR', 'Purchasing'),
('WAR', 'Warehouse');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jam_kerja`
--

CREATE TABLE `jam_kerja` (
  `kode_jamkerja` char(4) NOT NULL,
  `nama_jamkerja` varchar(15) NOT NULL,
  `awal_jammasuk` time NOT NULL,
  `jam_masuk` time NOT NULL,
  `akhir_jammasuk` time NOT NULL,
  `jam_pulang` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jam_kerja`
--

INSERT INTO `jam_kerja` (`kode_jamkerja`, `nama_jamkerja`, `awal_jammasuk`, `jam_masuk`, `akhir_jammasuk`, `jam_pulang`) VALUES
('JK01', 'REGULER', '08:00:00', '09:00:09', '10:00:00', '16:00:00'),
('JK02', 'SHIF 1', '06:00:00', '07:00:00', '08:00:08', '16:00:09'),
('JK03', 'SHIF 2', '07:00:00', '07:15:00', '08:00:00', '14:00:00'),
('JK04', 'FULL TIME', '06:00:00', '07:15:00', '08:00:00', '16:00:00'),
('JK05', 'Jam Bebas', '05:00:00', '11:00:00', '20:00:00', '09:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `nik` char(16) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `jabatan` varchar(30) NOT NULL,
  `kode_dept` char(3) NOT NULL,
  `kode_cabang` char(3) NOT NULL,
  `no_hp` varchar(14) NOT NULL,
  `foto` varchar(30) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`nik`, `nama_lengkap`, `jabatan`, `kode_dept`, `kode_cabang`, `no_hp`, `foto`, `password`, `remember_token`) VALUES
('20200001', 'Rendy Sumantri', 'HRD', 'ACC', 'TES', '089933838', '20200001.jpg', '$2y$10$pkfD1pwHSAsJo0EUVvccJOmkHaSNMZQ.GDTwVMH5AkKEEHPk3zG0.', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `konfigurasi_jamkerja`
--

CREATE TABLE `konfigurasi_jamkerja` (
  `nik` char(16) DEFAULT NULL,
  `hari` varchar(15) DEFAULT NULL,
  `kode_jamkerja` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `konfigurasi_jamkerja`
--

INSERT INTO `konfigurasi_jamkerja` (`nik`, `hari`, `kode_jamkerja`) VALUES
('20200001', 'senin', 'JK05'),
('20200001', 'selasa', 'JK05'),
('20200001', 'rabu', 'JK05'),
('20200001', 'kamis', 'JK05'),
('20200001', 'jumat', 'JK05'),
('20200001', 'sabtu', 'JK05'),
('2223', 'senin', NULL),
('2223', 'selasa', NULL),
('2223', 'rabu', NULL),
('2223', 'kamis', NULL),
('2223', 'jumat', NULL),
('2223', 'sabtu', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `konfig_lokasi`
--

CREATE TABLE `konfig_lokasi` (
  `id` int(11) NOT NULL,
  `lokasi_kantor` varchar(255) NOT NULL,
  `radius` smallint(6) NOT NULL,
  `keterangan` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `konfig_lokasi`
--

INSERT INTO `konfig_lokasi` (`id`, `lokasi_kantor`, `radius`, `keterangan`) VALUES
(1, '0.4617509719834601,101.38362943023748', 10, 'lokasi kos'),
(2, '0.4637914,101.3828082', 20, 'lokasi amik'),
(3, '-0.2864155,101.4696525', 100, 'lokasi pt wanasari'),
(4, '-0.277005,101.457203', 20, 'div 1'),
(5, '-0.303376,101.454769', 20, 'div 2'),
(6, '-0.294790,101.450597', 20, 'div 3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengajuan_izin`
--

CREATE TABLE `pengajuan_izin` (
  `id` int(11) NOT NULL,
  `nik` char(16) NOT NULL,
  `status` char(1) NOT NULL,
  `file` varchar(100) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `status_approved` char(1) DEFAULT '0',
  `tgl_pengajuan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `presensi`
--

CREATE TABLE `presensi` (
  `id` int(11) NOT NULL,
  `nik` char(16) NOT NULL,
  `tgl_presensi` date NOT NULL,
  `jam_in` time NOT NULL,
  `jam_out` time DEFAULT NULL,
  `foto_in` varchar(255) NOT NULL,
  `foto_out` varchar(255) DEFAULT NULL,
  `lokasi_in` text NOT NULL,
  `lokasi_out` text DEFAULT NULL,
  `kode_jamkerja` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `presensi`
--

INSERT INTO `presensi` (`id`, `nik`, `tgl_presensi`, `jam_in`, `jam_out`, `foto_in`, `foto_out`, `lokasi_in`, `lokasi_out`, `kode_jamkerja`) VALUES
(31, '20200001', '2023-06-22', '10:44:14', '18:03:09', '20200001-2023-06-22-in.png', '20200001-2023-06-22-out.png', '0.4691554, 101.3771607', '0.4691554, 101.3771607', 'JK05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Rendi Nouyes', 'ren@gmail.com', NULL, '$2a$04$OxJGTaqEmRkYnvuuTexbO.R7PdgjJmfRGanrQAOMXLRwctZq6siLm', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cabang`
--
ALTER TABLE `cabang`
  ADD PRIMARY KEY (`kode_cabang`);

--
-- Indeks untuk tabel `departemen`
--
ALTER TABLE `departemen`
  ADD PRIMARY KEY (`kode_dept`);

--
-- Indeks untuk tabel `jam_kerja`
--
ALTER TABLE `jam_kerja`
  ADD PRIMARY KEY (`kode_jamkerja`);

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`nik`);

--
-- Indeks untuk tabel `konfig_lokasi`
--
ALTER TABLE `konfig_lokasi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pengajuan_izin`
--
ALTER TABLE `pengajuan_izin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `presensi`
--
ALTER TABLE `presensi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `konfig_lokasi`
--
ALTER TABLE `konfig_lokasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `pengajuan_izin`
--
ALTER TABLE `pengajuan_izin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `presensi`
--
ALTER TABLE `presensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
