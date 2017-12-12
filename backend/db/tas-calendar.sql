-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 23 Lis 2017, 14:58
-- Wersja serwera: 10.1.28-MariaDB
-- Wersja PHP: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Zrzut danych tabeli `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"tas-calendar\",\"table\":\"Meetings_Invitations\"},{\"db\":\"tas\",\"table\":\"users\"},{\"db\":\"tas-2\",\"table\":\"users\"},{\"db\":\"TAS-2\",\"table\":\"Meetings_Invitations\"},{\"db\":\"tas-2\",\"table\":\"meetings\"},{\"db\":\"tas-2\",\"table\":\"meetings_invitations\"},{\"db\":\"tas-2\",\"table\":\"meetings_participants\"},{\"db\":\"tas-2\",\"table\":\"tasks\"},{\"db\":\"tas-2\",\"table\":\"tasks_execs\"},{\"db\":\"tas-2\",\"table\":\"tasks_invitations\"}]');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Zrzut danych tabeli `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2017-10-22 17:54:33', '{\"lang\":\"pl\",\"collation_connection\":\"utf8mb4_unicode_ci\"}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Baza danych: `tas-calendar`
--
CREATE DATABASE IF NOT EXISTS `tas-calendar` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `tas-calendar`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `meetings`
--

CREATE TABLE `meetings` (
  `meeting_id` int(11) NOT NULL,
  `meeting_creator` varchar(50) NOT NULL,
  `meeting_name` tinytext NOT NULL,
  `meeting_desc` text,
  `meeting_date` date DEFAULT NULL,
  `meeting_time` time DEFAULT NULL,
  `meeting_place` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `meetings`
--

INSERT INTO `meetings` (`meeting_id`, `meeting_creator`, `meeting_name`, `meeting_desc`, `meeting_date`, `meeting_time`, `meeting_place`) VALUES
(1, 'DarioX23', 'Mecz 5v5', NULL, '2018-02-02', '18:00:00', 'Hala UAM na Młyńskiej koło Sądu'),
(2, 'greg', 'Spotkanie biznesowe', 'Omowienie cech produktu i ceny', '2018-09-05', '12:45:00', 'Firma Grega'),
(3, 'apple', 'Omowienie nowej wersji MacOS', 'Wersja 1.0', '2016-02-02', '16:30:15', 'WMI UAM A1-17'),
(4, 'pancernik', 'Seminarium dyplomowe', 'Grupa C1', '2017-12-02', '11:30:30', 'WMI UAM A2-3'),
(5, 'linuks', 'Wspolne kompilowanie jadra', 'Przed sptkaniem pobrac repo z githuba!', '2017-12-31', '23:30:00', 'Dom linuksa'),
(6, 'radas', 'Przygotowanie przed egzaminem z WRP', 'Dział 2', '2017-01-30', '12:00:00', 'Aula B WMI UAM');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `meetings_invitations`
--

CREATE TABLE `meetings_invitations` (
  `meetingInv_id` int(11) NOT NULL,
  `meeting_inviter` varchar(50) NOT NULL,
  `MI_meeting_id` int(11) NOT NULL,
  `pot_part` varchar(50) NOT NULL,
  `meeting_status` set('accepted','rejected','interested','seen','sent') NOT NULL DEFAULT 'sent'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `meetings_invitations`
--

INSERT INTO `meetings_invitations` (`meetingInv_id`, `meeting_inviter`, `MI_meeting_id`, `pot_part`, `meeting_status`) VALUES
(1, 'DarioX23', 1, 'mareczek123', 'accepted'),
(2, 'DarioX23', 1, 'Mario', 'accepted'),
(3, 'DarioX23', 1, 'login123', 'accepted'),
(4, 'DarioX23', 1, 'apple', 'seen'),
(5, 'DarioX23', 1, 'dell', 'rejected'),
(6, 'greg', 2, 'apple', 'sent'),
(7, 'pancernik', 4, 'radas', 'seen'),
(8, 'radas', 6, 'DarioX23', 'rejected');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `meetings_participants`
--

CREATE TABLE `meetings_participants` (
  `MU_meeting_id` int(11) NOT NULL,
  `meeting_participant` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `meetings_participants`
--

INSERT INTO `meetings_participants` (`MU_meeting_id`, `meeting_participant`) VALUES
(1, 'DarioX23'),
(1, 'login123'),
(1, 'mareczek123'),
(1, 'Mario'),
(2, 'greg'),
(3, 'apple'),
(4, 'pancernik'),
(5, 'linuks'),
(6, 'radas');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tasks`
--

CREATE TABLE `tasks` (
  `task_id` int(11) NOT NULL,
  `task_creator` varchar(50) NOT NULL,
  `task_name` tinytext NOT NULL,
  `task_deadline_day` date DEFAULT NULL,
  `task_deadline_time` time DEFAULT NULL,
  `task_desc` text,
  `task_status` set('TO DO','DOING','DONE') DEFAULT 'TO DO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `tasks`
--

INSERT INTO `tasks` (`task_id`, `task_creator`, `task_name`, `task_deadline_day`, `task_deadline_time`, `task_desc`, `task_status`) VALUES
(1, 'greg', 'Zrobic pranie', '2017-11-22', NULL, 'Wyprac wszystkie ubrania', 'DOING'),
(2, 'mareczek123', 'Kupic pilke', '2017-10-17', '17:00:00', 'Do pilki noznej', 'DONE'),
(3, 'login123', 'Nauczyc sie na egzamin', '2017-11-05', '20:30:00', 'Egzamin z MAD-ów.', 'DONE'),
(4, 'pancernik', 'Zrobic baze w SQL', '2017-05-05', NULL, 'Na projekt z TAS-ów', 'TO DO'),
(5, 'dell', 'Przeniesc komputer', '2017-10-04', NULL, 'Z dolu na gore', 'DONE'),
(6, 'linuks', 'Nauczyc sie dodawac', '2008-04-02', '14:00:00', NULL, 'TO DO'),
(7, 'apple', 'Dodac dane do tabel', '2017-11-30', NULL, 'Tabele A I B', 'DOING'),
(8, 'Mario', 'Usunac dane z wszystkich dysków', '2018-02-14', '06:00:00', 'Na obu dyskach.', 'TO DO'),
(9, 'apple', 'Skoczyc w prawo', '2011-01-08', NULL, 'A nie w lewo!', 'DONE'),
(10, 'greg', 'Podskoczyc dwa razy', '2017-11-22', NULL, 'Skakac tylko w miejscu.', 'TO DO');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tasks_execs`
--

CREATE TABLE `tasks_execs` (
  `TU_task_id` int(11) NOT NULL,
  `task_exec` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `tasks_execs`
--

INSERT INTO `tasks_execs` (`TU_task_id`, `task_exec`) VALUES
(1, 'apple'),
(1, 'greg'),
(1, 'linuks'),
(2, 'mareczek123'),
(3, 'login123'),
(4, 'pancernik'),
(5, 'dell'),
(6, 'dell'),
(6, 'linuks'),
(7, 'apple'),
(8, 'DarioX23'),
(8, 'radas'),
(9, 'apple'),
(10, 'greg');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tasks_invitations`
--

CREATE TABLE `tasks_invitations` (
  `taskInv_id` int(11) NOT NULL,
  `task_inviter` varchar(50) NOT NULL,
  `TI_task_id` int(11) NOT NULL,
  `pot_exec` varchar(50) NOT NULL,
  `taskInv_status` set('accepted','rejected','seen','sent') NOT NULL DEFAULT 'sent'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `tasks_invitations`
--

INSERT INTO `tasks_invitations` (`taskInv_id`, `task_inviter`, `TI_task_id`, `pot_exec`, `taskInv_status`) VALUES
(1, 'login123', 3, 'pancernik', 'sent'),
(2, 'Mario', 8, 'DarioX23', 'accepted'),
(3, 'DarioX23', 8, 'radas', 'accepted'),
(4, 'linuks', 6, 'dell', 'accepted'),
(5, 'greg', 1, 'apple', 'accepted'),
(6, 'greg', 1, 'linuks', 'accepted'),
(7, 'linuks', 6, 'pancernik', 'seen'),
(8, 'login123', 3, 'greg', 'rejected');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `signup_date` datetime NOT NULL,
  `avatar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`login`, `password`, `signup_date`, `avatar`) VALUES
('apple', 'haskell<3', '1995-08-12 13:24:44', 'avatars/apple_64x64.png'),
('DarioX23', 'Polska123', '2016-05-10 17:14:14', 'avatars/DarioX23_64x64.png'),
('dell', 'utf8@sd', '2000-10-24 22:35:12', 'avatars/dell_64x64.png'),
('greg', 'tommy', '2012-01-14 11:06:25', 'avatars/greg_64x64.png'),
('linuks', 'ubuntu', '2012-03-14 19:26:37', 'avatars/linuks_64x64.png'),
('login123', 'haslo321', '2011-04-30 15:48:55', 'avatars/login123_64x64.png'),
('mareczek123', 'WinogradyMCG', '2017-12-10 12:34:54', 'avatars/mareczek123_64x64.png'),
('Mario', 'qazwsx', '2015-10-09 17:14:14', 'avatars/Mario_64x64.png'),
('pancernik', 'lufa123', '2014-02-03 23:32:12', 'avatars/pancernik_64x64.png'),
('radas', 'bradas', '2013-09-22 11:05:03', 'avatars/radas_64x64.png');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `meetings`
--
ALTER TABLE `meetings`
  ADD PRIMARY KEY (`meeting_id`),
  ADD KEY `meeting_creator` (`meeting_creator`);

--
-- Indexes for table `meetings_invitations`
--
ALTER TABLE `meetings_invitations`
  ADD PRIMARY KEY (`meetingInv_id`),
  ADD KEY `MI_meeting_id` (`MI_meeting_id`),
  ADD KEY `pot_part` (`pot_part`),
  ADD KEY `meeting_inviter` (`meeting_inviter`);

--
-- Indexes for table `meetings_participants`
--
ALTER TABLE `meetings_participants`
  ADD PRIMARY KEY (`MU_meeting_id`,`meeting_participant`),
  ADD KEY `meeting_participant` (`meeting_participant`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`task_id`),
  ADD KEY `task_creator` (`task_creator`);

--
-- Indexes for table `tasks_execs`
--
ALTER TABLE `tasks_execs`
  ADD PRIMARY KEY (`TU_task_id`,`task_exec`),
  ADD KEY `task_exec` (`task_exec`);

--
-- Indexes for table `tasks_invitations`
--
ALTER TABLE `tasks_invitations`
  ADD PRIMARY KEY (`taskInv_id`),
  ADD KEY `TI_task_id` (`TI_task_id`),
  ADD KEY `pot_exec` (`pot_exec`),
  ADD KEY `task_inviter` (`task_inviter`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`login`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `meetings`
--
ALTER TABLE `meetings`
  MODIFY `meeting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `meetings_invitations`
--
ALTER TABLE `meetings_invitations`
  MODIFY `meetingInv_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `tasks`
--
ALTER TABLE `tasks`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `tasks_invitations`
--
ALTER TABLE `tasks_invitations`
  MODIFY `taskInv_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `meetings`
--
ALTER TABLE `meetings`
  ADD CONSTRAINT `meetings_ibfk_1` FOREIGN KEY (`meeting_creator`) REFERENCES `users` (`login`);

--
-- Ograniczenia dla tabeli `meetings_invitations`
--
ALTER TABLE `meetings_invitations`
  ADD CONSTRAINT `meetings_invitations_ibfk_1` FOREIGN KEY (`MI_meeting_id`) REFERENCES `meetings` (`meeting_id`),
  ADD CONSTRAINT `meetings_invitations_ibfk_2` FOREIGN KEY (`pot_part`) REFERENCES `users` (`login`),
  ADD CONSTRAINT `meetings_invitations_ibfk_3` FOREIGN KEY (`meeting_inviter`) REFERENCES `users` (`login`);

--
-- Ograniczenia dla tabeli `meetings_participants`
--
ALTER TABLE `meetings_participants`
  ADD CONSTRAINT `meetings_participants_ibfk_1` FOREIGN KEY (`MU_meeting_id`) REFERENCES `meetings` (`meeting_id`),
  ADD CONSTRAINT `meetings_participants_ibfk_2` FOREIGN KEY (`meeting_participant`) REFERENCES `users` (`login`);

--
-- Ograniczenia dla tabeli `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`task_creator`) REFERENCES `users` (`login`);

--
-- Ograniczenia dla tabeli `tasks_execs`
--
ALTER TABLE `tasks_execs`
  ADD CONSTRAINT `tasks_execs_ibfk_1` FOREIGN KEY (`TU_task_id`) REFERENCES `tasks` (`task_id`),
  ADD CONSTRAINT `tasks_execs_ibfk_2` FOREIGN KEY (`task_exec`) REFERENCES `users` (`login`);

--
-- Ograniczenia dla tabeli `tasks_invitations`
--
ALTER TABLE `tasks_invitations`
  ADD CONSTRAINT `tasks_invitations_ibfk_1` FOREIGN KEY (`TI_task_id`) REFERENCES `tasks` (`task_id`),
  ADD CONSTRAINT `tasks_invitations_ibfk_2` FOREIGN KEY (`pot_exec`) REFERENCES `users` (`login`),
  ADD CONSTRAINT `tasks_invitations_ibfk_3` FOREIGN KEY (`task_inviter`) REFERENCES `users` (`login`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
