-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Jul 2023 pada 20.26
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbsekolah`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tablehubungan`
--

CREATE TABLE `tablehubungan` (
  `id` int(10) NOT NULL,
  `siswa_id` int(10) DEFAULT NULL,
  `ortu_id` int(10) DEFAULT NULL,
  `statushubanak` char(10) DEFAULT NULL,
  `keterangan` char(20) DEFAULT NULL,
  `status_ortu` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tablehubungan`
--

INSERT INTO `tablehubungan` (`id`, `siswa_id`, `ortu_id`, `statushubanak`, `keterangan`, `status_ortu`) VALUES
(1, 1, 2, 'true', 'kk', 'ayah');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tablekelas`
--

CREATE TABLE `tablekelas` (
  `id` int(10) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jurusan` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tablekelas`
--

INSERT INTO `tablekelas` (`id`, `nama`, `jurusan`) VALUES
(1, '2A', 'RPL'),
(2, '1A', 'RPL');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tableortu`
--

CREATE TABLE `tableortu` (
  `id` int(10) NOT NULL,
  `nis` char(20) DEFAULT NULL,
  `nama_ortu` varchar(60) DEFAULT NULL,
  `pendidikan` varchar(60) DEFAULT NULL,
  `pekerjaan` varchar(60) DEFAULT NULL,
  `telp` char(15) DEFAULT NULL,
  `alamat` varchar(160) DEFAULT NULL,
  `jk` enum('L','P') DEFAULT NULL,
  `agama` char(20) DEFAULT NULL,
  `id_active` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tableortu`
--

INSERT INTO `tableortu` (`id`, `nis`, `nama_ortu`, `pendidikan`, `pekerjaan`, `telp`, `alamat`, `jk`, `agama`, `id_active`) VALUES
(2, '123', 'wen', 's1', 's', '08', 's', 'L', 'islam', 'true');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tablepoin`
--

CREATE TABLE `tablepoin` (
  `id` int(10) NOT NULL,
  `nama_poin` varchar(160) DEFAULT NULL,
  `bobot` float DEFAULT NULL,
  `jenis` char(20) DEFAULT NULL,
  `status` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tablepoin`
--

INSERT INTO `tablepoin` (`id`, `nama_poin`, `bobot`, `jenis`, `status`) VALUES
(1, 'telat masuk', 5, 'pelanggaran', 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tablesemester`
--

CREATE TABLE `tablesemester` (
  `id` int(10) NOT NULL,
  `siswa_id` int(10) DEFAULT NULL,
  `poin_id` int(10) DEFAULT NULL,
  `wali_id` int(10) DEFAULT NULL,
  `ortu_id` int(10) DEFAULT NULL,
  `kelas_id` int(10) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `semester` char(2) DEFAULT NULL,
  `status` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tablesemester`
--

INSERT INTO `tablesemester` (`id`, `siswa_id`, `poin_id`, `wali_id`, `ortu_id`, `kelas_id`, `tanggal`, `semester`, `status`) VALUES
(2, 1, 1, 4, 2, 2, '0000-00-00', '2', 'true');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tablesiswa`
--

CREATE TABLE `tablesiswa` (
  `id` int(10) NOT NULL,
  `nis` char(20) DEFAULT NULL,
  `nisn` char(20) DEFAULT NULL,
  `nama_siswa` varchar(60) DEFAULT NULL,
  `nik` char(20) DEFAULT NULL,
  `tempat_lahir` char(150) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jk` enum('L','P') DEFAULT NULL,
  `alamat` varchar(160) DEFAULT NULL,
  `telp` char(15) DEFAULT NULL,
  `hp` char(20) DEFAULT NULL,
  `status` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tablesiswa`
--

INSERT INTO `tablesiswa` (`id`, `nis`, `nisn`, `nama_siswa`, `nik`, `tempat_lahir`, `tanggal_lahir`, `jk`, `alamat`, `telp`, `hp`, `status`) VALUES
(1, '123', '123', 'ada', '123', 'bjm', '0000-00-00', 'P', 'bjm', '05', '08', 'true'),
(3, '321', '321', 'isi', '321', 'bjm', '2000-10-10', 'L', 'w', '08', '08', 'true'),
(4, '321', '321', 'd', '321', 'c', '2000-10-10', 'L', 'd', '08', '08', 'true'),
(5, '112', '112', 'ama', '112', 'bjm', '2000-10-10', 'L', 'bjm', '08', '08', 'true'),
(6, '222', '222', 'nm', '222', 'bjm', '2000-01-01', 'L', 'bjm', '08', '08', 'true'),
(7, '777', '777', 'bbi', '777', 'bjm', '0000-00-00', 'P', 'bjm', '08', '08', 'true'),
(8, '777', '777', 'nn', '777', 'bjm', '2000-10-20', 'P', 'bjm', '08', '08', 'true');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tableuser`
--

CREATE TABLE `tableuser` (
  `id` int(10) NOT NULL,
  `username` char(10) DEFAULT NULL,
  `password` char(16) DEFAULT NULL,
  `statushubanak` char(10) DEFAULT NULL,
  `level` char(10) DEFAULT NULL,
  `status` char(10) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `created_userid` int(10) DEFAULT NULL,
  `update_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tableuser`
--

INSERT INTO `tableuser` (`id`, `username`, `password`, `statushubanak`, `level`, `status`, `created_at`, `created_userid`, `update_at`) VALUES
(1, 'as', 'as', 'true', 'admin', 'true', '0000-00-00', 1, '0000-00-00'),
(2, 'sa', 'sa', 'true', 'wali kelas', 'true', '0000-00-00', 2, '0000-00-00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tablewalikelas`
--

CREATE TABLE `tablewalikelas` (
  `id` int(10) NOT NULL,
  `nik` char(20) DEFAULT NULL,
  `nama` varchar(60) DEFAULT NULL,
  `jk` enum('L','P') DEFAULT NULL,
  `pendidikan` char(60) DEFAULT NULL,
  `telp` char(15) DEFAULT NULL,
  `matpel` char(30) DEFAULT NULL,
  `alamat` varchar(160) DEFAULT NULL,
  `status` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tablewalikelas`
--

INSERT INTO `tablewalikelas` (`id`, `nik`, `nama`, `jk`, `pendidikan`, `telp`, `matpel`, `alamat`, `status`) VALUES
(4, '22', 'adita', 'L', 's1', '0899', 'mtk', 'banjarmasin', 'true');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tablehubungan`
--
ALTER TABLE `tablehubungan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_hub_ortu` (`ortu_id`),
  ADD KEY `fk_hub_siswa` (`siswa_id`);

--
-- Indeks untuk tabel `tablekelas`
--
ALTER TABLE `tablekelas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tableortu`
--
ALTER TABLE `tableortu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tablepoin`
--
ALTER TABLE `tablepoin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tablesemester`
--
ALTER TABLE `tablesemester`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_hubungan_ortu` (`ortu_id`),
  ADD KEY `fk_hubungan_siswa` (`siswa_id`),
  ADD KEY `fk_hubungan_kelas` (`kelas_id`),
  ADD KEY `fk_hubungan_poin` (`poin_id`),
  ADD KEY `fk_hubungan_wali` (`wali_id`);

--
-- Indeks untuk tabel `tablesiswa`
--
ALTER TABLE `tablesiswa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tableuser`
--
ALTER TABLE `tableuser`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tablewalikelas`
--
ALTER TABLE `tablewalikelas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tablehubungan`
--
ALTER TABLE `tablehubungan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tablekelas`
--
ALTER TABLE `tablekelas`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tableortu`
--
ALTER TABLE `tableortu`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tablepoin`
--
ALTER TABLE `tablepoin`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tablesemester`
--
ALTER TABLE `tablesemester`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tablesiswa`
--
ALTER TABLE `tablesiswa`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tableuser`
--
ALTER TABLE `tableuser`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tablewalikelas`
--
ALTER TABLE `tablewalikelas`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tablehubungan`
--
ALTER TABLE `tablehubungan`
  ADD CONSTRAINT `fk_hub_ortu` FOREIGN KEY (`ortu_id`) REFERENCES `tableortu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_hub_siswa` FOREIGN KEY (`siswa_id`) REFERENCES `tablesiswa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `tablesemester`
--
ALTER TABLE `tablesemester`
  ADD CONSTRAINT `fk_hubungan_kelas` FOREIGN KEY (`kelas_id`) REFERENCES `tablekelas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_hubungan_ortu` FOREIGN KEY (`ortu_id`) REFERENCES `tableortu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_hubungan_poin` FOREIGN KEY (`poin_id`) REFERENCES `tablepoin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_hubungan_siswa` FOREIGN KEY (`siswa_id`) REFERENCES `tablesiswa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_hubungan_wali` FOREIGN KEY (`wali_id`) REFERENCES `tablewalikelas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
