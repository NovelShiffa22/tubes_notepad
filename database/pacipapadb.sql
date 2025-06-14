-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Jun 2025 pada 09.39
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pacipapadb`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `accounts`
--

CREATE TABLE `accounts` (
  `username` varchar(50) NOT NULL,
  `fileID` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `isAdmin` tinyint(1) DEFAULT 0,
  `hashedPassword` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `accounts`
--

INSERT INTO `accounts` (`username`, `fileID`, `email`, `firstName`, `lastName`, `isAdmin`, `hashedPassword`, `salt`) VALUES
('admin', NULL, 'admin@gmail.com', 'Admin', 'Notepad', 1, '6406ce46f94a2fa40497f15ec23a9e2566c5fdb06bdf54c8088498dfb40f2e27', 'a6cde268c389cc6dc40310c435edb305'),
('bob_brown', NULL, 'bob@example.com', 'Bob', 'Brown', 0, 'hashed789', 'salt789'),
('jane_smith', NULL, 'jane@example.com', 'Jane', 'Smith', 0, 'hashed456', 'salt456'),
('john_doe', NULL, 'john@example.com', 'John', 'Doe', 0, 'hashed123', 'salt123'),
('madlanh', NULL, 'adlan@email.com', 'Adlan', 'Hafizha', 0, '5131edcd06f6abff359704bc61f5d6ad975876528fd3567d4431f1f7df9b9c2a', 'e81965666c8e619c50c6b0f3118bc9f5'),
('shffoc', NULL, 'shffoct@gmail.com', 'shff', 'oc', 0, '00abc1e651c12681aaef4d702c464ea16ebb1f45ca2411b87da02527e80abbe6', 'd4519337bddecc5fb9b464ad430ac8e7');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bookmarks`
--

CREATE TABLE `bookmarks` (
  `username` varchar(50) NOT NULL,
  `moduleID` int(11) NOT NULL,
  `dateBookmarked` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `bookmarks`
--

INSERT INTO `bookmarks` (`username`, `moduleID`, `dateBookmarked`) VALUES
('shffoc', 1, '2025-06-14 00:00:00'),
('shffoc', 6, '2025-06-14 00:00:00'),
('shffoc', 7, '2025-06-14 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `files`
--

CREATE TABLE `files` (
  `fileID` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `path` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `files`
--

INSERT INTO `files` (`fileID`, `name`, `type`, `size`, `path`) VALUES
(1, 'note1.pdf', 'application/pdf', 1024, '/uploads/note1.pdf'),
(2, 'note2.pdf', 'application/pdf', 2048, '/uploads/note2.pdf'),
(3, 'note3.pdf', 'application/pdf', 3072, '/uploads/note3.pdf'),
(4, '1749875689566_01 - Introduction to OOP (1).pdf', 'application/pdf', 6369362, 'uploads/pdf/1749875689566_01 - Introduction to OOP (1).pdf'),
(5, '1749877763140_04 - Inheritance (1).pdf', 'application/pdf', 3879469, 'uploads/pdf/1749877763140_04 - Inheritance (1).pdf'),
(6, '1749879114793_05 - Abstract Class and Interface (1).pdf', 'application/pdf', 2650801, 'uploads/pdf/1749879114793_05 - Abstract Class and Interface (1).pdf');

-- --------------------------------------------------------

--
-- Struktur dari tabel `notes`
--

CREATE TABLE `notes` (
  `moduleID` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `fileID` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `major` varchar(100) DEFAULT NULL,
  `dateUploaded` datetime DEFAULT NULL,
  `visibility` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `notes`
--

INSERT INTO `notes` (`moduleID`, `username`, `fileID`, `name`, `description`, `course`, `major`, `dateUploaded`, `visibility`) VALUES
(1, 'john_doe', 1, 'Pemrograman Dasar', 'Pengenalan algoritma dan pemrograman', 'CS101', 'Computer Science', '2025-06-14 08:53:27', 1),
(2, 'jane_smith', 2, 'Struktur Data', 'Array, Linked List, dan Tree', 'CS201', 'Computer Science', '2025-06-14 08:53:27', 1),
(3, 'bob_brown', 3, 'Basis Data', 'Konsep database dan SQL', 'CS301', 'Information Systems', '2025-06-14 08:53:27', 1),
(4, 'john_doe', 1, 'Kalkulus', 'Limit, turunan, dan integral', 'MATH101', 'Mathematics', '2025-06-14 08:53:27', 1),
(5, 'jane_smith', 2, 'Fisika Dasar', 'Mekanika klasik', 'PHY101', 'Physics', '2025-06-14 08:53:27', 0),
(6, 'shffoc', 4, 'Introduction OOP (1)', '-', 'Pemrograman Berorientasi Objek', 'S1 Informatika', '2025-06-14 00:00:00', 0),
(7, 'shffoc', 5, 'Inheritance - PBO', 'Mata Kuliah semester 4, S1 Informatika Telkom University', 'Pemrograman Berorientasi Objek', 'S1 Informatika', '2025-06-14 00:00:00', 1),
(8, 'shffoc', 6, 'Abstract Class and Interface', 'Untuk Mahasiswa Fakultas Informatika', 'Pemrograman Berorientasi Objek', 'S1 Informatika', '2025-06-14 00:00:00', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ratings`
--

CREATE TABLE `ratings` (
  `username` varchar(50) NOT NULL,
  `moduleID` int(11) NOT NULL,
  `dateRated` datetime DEFAULT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `ratings`
--

INSERT INTO `ratings` (`username`, `moduleID`, `dateRated`, `rating`) VALUES
('shffoc', 6, '2025-06-14 00:00:00', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `sessionID` varchar(100) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `IPAddress` varchar(45) DEFAULT NULL,
  `userAgent` text DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`sessionID`, `username`, `IPAddress`, `userAgent`, `dateCreated`) VALUES
('EB1144E433F41DF4A284E295E5FB9BE2', 'admin', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-14 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `userdetails`
--

CREATE TABLE `userdetails` (
  `username` varchar(50) NOT NULL,
  `aboutMe` text DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `linkedin` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `userdetails`
--

INSERT INTO `userdetails` (`username`, `aboutMe`, `instagram`, `linkedin`) VALUES
('admin', '', '', ''),
('madlanh', '', '', 'www.linkedin.com'),
('shffoc', '', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `views`
--

CREATE TABLE `views` (
  `viewID` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `moduleID` int(11) DEFAULT NULL,
  `dateViewed` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `views`
--

INSERT INTO `views` (`viewID`, `username`, `moduleID`, `dateViewed`) VALUES
(1, 'madlanh', 1, '2025-06-14 00:00:00'),
(2, 'shffoc', 1, '2025-06-14 00:00:00'),
(3, 'shffoc', 2, '2025-06-14 00:00:00'),
(4, 'shffoc', 3, '2025-06-14 00:00:00'),
(5, 'shffoc', 4, '2025-06-14 00:00:00'),
(6, 'shffoc', 6, '2025-06-14 00:00:00'),
(7, 'shffoc', 6, '2025-06-14 00:00:00'),
(8, 'shffoc', 6, '2025-06-14 00:00:00'),
(9, 'shffoc', 6, '2025-06-14 00:00:00'),
(10, 'shffoc', 6, '2025-06-14 00:00:00'),
(11, 'shffoc', 1, '2025-06-14 00:00:00'),
(12, 'shffoc', 8, '2025-06-14 00:00:00'),
(13, 'shffoc', 1, '2025-06-14 00:00:00'),
(14, 'shffoc', 7, '2025-06-14 00:00:00'),
(15, 'shffoc', 8, '2025-06-14 00:00:00'),
(16, 'admin', 1, '2025-06-14 00:00:00'),
(17, 'admin', 1, '2025-06-14 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`username`),
  ADD KEY `fileID` (`fileID`);

--
-- Indeks untuk tabel `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`username`,`moduleID`),
  ADD KEY `moduleID` (`moduleID`);

--
-- Indeks untuk tabel `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`fileID`);

--
-- Indeks untuk tabel `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`moduleID`),
  ADD KEY `username` (`username`),
  ADD KEY `fileID` (`fileID`);

--
-- Indeks untuk tabel `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`username`,`moduleID`),
  ADD KEY `moduleID` (`moduleID`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`sessionID`),
  ADD KEY `username` (`username`);

--
-- Indeks untuk tabel `userdetails`
--
ALTER TABLE `userdetails`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `views`
--
ALTER TABLE `views`
  ADD PRIMARY KEY (`viewID`),
  ADD KEY `username` (`username`),
  ADD KEY `moduleID` (`moduleID`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `files`
--
ALTER TABLE `files`
  MODIFY `fileID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `notes`
--
ALTER TABLE `notes`
  MODIFY `moduleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `views`
--
ALTER TABLE `views`
  MODIFY `viewID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`fileID`) REFERENCES `files` (`fileID`);

--
-- Ketidakleluasaan untuk tabel `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD CONSTRAINT `bookmarks_ibfk_1` FOREIGN KEY (`username`) REFERENCES `accounts` (`username`),
  ADD CONSTRAINT `bookmarks_ibfk_2` FOREIGN KEY (`moduleID`) REFERENCES `notes` (`moduleID`);

--
-- Ketidakleluasaan untuk tabel `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`username`) REFERENCES `accounts` (`username`),
  ADD CONSTRAINT `notes_ibfk_2` FOREIGN KEY (`fileID`) REFERENCES `files` (`fileID`);

--
-- Ketidakleluasaan untuk tabel `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`username`) REFERENCES `accounts` (`username`),
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`moduleID`) REFERENCES `notes` (`moduleID`);

--
-- Ketidakleluasaan untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`username`) REFERENCES `accounts` (`username`);

--
-- Ketidakleluasaan untuk tabel `userdetails`
--
ALTER TABLE `userdetails`
  ADD CONSTRAINT `userdetails_ibfk_1` FOREIGN KEY (`username`) REFERENCES `accounts` (`username`);

--
-- Ketidakleluasaan untuk tabel `views`
--
ALTER TABLE `views`
  ADD CONSTRAINT `views_ibfk_1` FOREIGN KEY (`username`) REFERENCES `accounts` (`username`),
  ADD CONSTRAINT `views_ibfk_2` FOREIGN KEY (`moduleID`) REFERENCES `notes` (`moduleID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
