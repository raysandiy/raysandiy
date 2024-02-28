-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 15 Feb 2024 pada 01.48
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eperpus`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id` int(12) NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `penulis` varchar(255) DEFAULT NULL,
  `penerbit` varchar(255) DEFAULT NULL,
  `tahun_terbit` int(12) DEFAULT NULL,
  `sinopsis` varchar(250) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id`, `judul`, `penulis`, `penerbit`, `tahun_terbit`, `sinopsis`, `cover`) VALUES
(9, 'Filosofi Teras', 'Henry Manampiring', 'ISBN', 2024, 'S', 'filosofi_teras_65ca55bdbca37.jpeg'),
(10, 'Laskar Pelangi', 'Andrea Hirata', 'Riri Riza', 2005, 'Perjuangan Bu Muslimah dan Pak Harfan, dua orang guru yang memiliki dedikasi tinggi dalam dunia pendidikan, dimana dengan usaha dan kesungguhannya mereka berdua berhasil memajukan pendidikan di desa Gantong satu desa terpencil di pilau Balitong.', 'laskar_pelangi_65cc2bc68771e.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategoribuku`
--

CREATE TABLE `kategoribuku` (
  `id` int(12) NOT NULL,
  `nama_kategori` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategoribuku`
--

INSERT INTO `kategoribuku` (`id`, `nama_kategori`) VALUES
(32, 'PEMBUNUHAN'),
(30, 'SERU');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategoribuku_relasi`
--

CREATE TABLE `kategoribuku_relasi` (
  `id` int(12) NOT NULL,
  `buku_id` int(12) DEFAULT NULL,
  `kategori_id` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategoribuku_relasi`
--

INSERT INTO `kategoribuku_relasi` (`id`, `buku_id`, `kategori_id`) VALUES
(7, 9, 32),
(8, 10, 30);

-- --------------------------------------------------------

--
-- Struktur dari tabel `koleksi`
--

CREATE TABLE `koleksi` (
  `id` int(11) NOT NULL,
  `userid` int(12) DEFAULT NULL,
  `bukuid` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `koleksi`
--

INSERT INTO `koleksi` (`id`, `userid`, `bukuid`) VALUES
(10, 32, 9),
(12, 32, 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id` int(11) NOT NULL,
  `userid` int(12) DEFAULT NULL,
  `bukuid` int(12) DEFAULT NULL,
  `tanggal_peminjaman` date DEFAULT NULL,
  `tanggal_pengembalian` date DEFAULT NULL,
  `status` enum('sudah dikembalikan','belum dikembalikan') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id`, `userid`, `bukuid`, `tanggal_peminjaman`, `tanggal_pengembalian`, `status`) VALUES
(4, 32, 9, '2024-02-13', '2024-02-16', 'sudah dikembalikan'),
(5, 32, 9, '2024-02-13', '2024-02-13', 'sudah dikembalikan'),
(6, 33, 9, '2024-02-13', '2024-02-16', 'sudah dikembalikan'),
(7, 33, 9, '2024-02-13', '2024-02-18', 'sudah dikembalikan'),
(8, 33, 9, '2024-02-13', '2024-02-19', 'sudah dikembalikan'),
(9, 32, 10, '2024-02-14', '2024-02-14', 'sudah dikembalikan'),
(10, 32, 10, '2024-02-14', '2024-02-14', 'sudah dikembalikan'),
(11, 32, 10, '2024-02-14', '2024-02-14', 'sudah dikembalikan'),
(12, 32, 10, '2024-02-14', '2024-02-14', 'sudah dikembalikan'),
(13, 32, 10, '2024-02-14', '2024-02-14', 'sudah dikembalikan'),
(14, 32, 10, '2024-02-14', '2024-02-14', 'sudah dikembalikan'),
(15, 32, 9, '2024-02-14', '2024-02-14', 'sudah dikembalikan'),
(16, 32, 9, '2024-02-14', '2024-02-14', 'sudah dikembalikan'),
(17, 32, 10, '2024-02-14', '2024-02-14', 'sudah dikembalikan'),
(18, 32, 9, '2024-02-14', '2024-02-14', 'sudah dikembalikan'),
(19, 32, 9, '2024-02-14', '2024-02-14', 'sudah dikembalikan'),
(20, 32, 10, '2024-02-14', '2024-02-14', 'sudah dikembalikan'),
(21, 32, 10, '2024-02-14', '2024-02-14', 'sudah dikembalikan'),
(22, 32, 9, '2024-02-14', '2024-02-14', 'sudah dikembalikan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ulasan`
--

CREATE TABLE `ulasan` (
  `id` int(12) NOT NULL,
  `userid` int(12) DEFAULT NULL,
  `bukuid` int(12) DEFAULT NULL,
  `ulasan` longtext DEFAULT NULL,
  `rating` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ulasan`
--

INSERT INTO `ulasan` (`id`, `userid`, `bukuid`, `ulasan`, `rating`) VALUES
(1, 32, 10, 'asdas', 3),
(2, 32, 9, 'KERENNN', 5),
(3, 32, 9, 'sadsadsa', 2),
(5, 32, 10, 'wow', 5),
(6, 32, 9, 'fs', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(12) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `role` enum('admin','petugas','peminjam') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `fullname`, `alamat`, `role`) VALUES
(31, 'admin', '$2y$10$MTLW1tNRbB3hA58B.N0iPu2DwvrGIoH4GrjepkcdRrwFpLbwTITQS', 'admin@mail.com', 'admin', 'admin', 'admin'),
(32, 'user', '$2y$10$Jb64q37TGvKIzvMrUO06uuZtNb6ApHRFTNuDonnsC8cfdDO/1n3sm', 'user@mail.com', 'user', 'user', 'peminjam'),
(33, 'user2', '$2y$10$1MikqXPFKjaU8dqUC9jQqOiWpcThuc8UbUvANqtrhsiNJ4P10Tmk6', 'user2@mail.com', 'user2', 'user2', 'peminjam'),
(34, 'petugas', '$2y$10$gTItjNjVR2TihEy0KJjzA.IAWhHDSclVLPFgTjQT0NRqpeQZ6Cv3S', 'petugas@mail.com', 'petugas', 'petugas', 'petugas');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategoribuku`
--
ALTER TABLE `kategoribuku`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama_kategori` (`nama_kategori`);

--
-- Indeks untuk tabel `kategoribuku_relasi`
--
ALTER TABLE `kategoribuku_relasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buku_id` (`buku_id`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- Indeks untuk tabel `koleksi`
--
ALTER TABLE `koleksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `bukuid` (`bukuid`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `bukuid` (`bukuid`);

--
-- Indeks untuk tabel `ulasan`
--
ALTER TABLE `ulasan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `bukuid` (`bukuid`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `kategoribuku`
--
ALTER TABLE `kategoribuku`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `kategoribuku_relasi`
--
ALTER TABLE `kategoribuku_relasi`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `koleksi`
--
ALTER TABLE `koleksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `ulasan`
--
ALTER TABLE `ulasan`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kategoribuku_relasi`
--
ALTER TABLE `kategoribuku_relasi`
  ADD CONSTRAINT `kategoribuku_relasi_ibfk_1` FOREIGN KEY (`buku_id`) REFERENCES `buku` (`id`),
  ADD CONSTRAINT `kategoribuku_relasi_ibfk_2` FOREIGN KEY (`kategori_id`) REFERENCES `kategoribuku` (`id`);

--
-- Ketidakleluasaan untuk tabel `koleksi`
--
ALTER TABLE `koleksi`
  ADD CONSTRAINT `koleksi_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `koleksi_ibfk_2` FOREIGN KEY (`bukuid`) REFERENCES `buku` (`id`);

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`bukuid`) REFERENCES `buku` (`id`);

--
-- Ketidakleluasaan untuk tabel `ulasan`
--
ALTER TABLE `ulasan`
  ADD CONSTRAINT `ulasan_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `ulasan_ibfk_2` FOREIGN KEY (`bukuid`) REFERENCES `buku` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
