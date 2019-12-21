-- --------------------------------------------------------
-- Сервер:                       127.0.0.1
-- Версія сервера:               10.3.13-MariaDB-log - mariadb.org binary distribution
-- ОС сервера:                   Win64
-- HeidiSQL Версія:              10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for ha
CREATE DATABASE IF NOT EXISTS `ha` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ha`;

-- Dumping structure for таблиця ha.access_log
CREATE TABLE IF NOT EXISTS `access_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `access_point_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ha.access_log: ~3 rows (приблизно)
/*!40000 ALTER TABLE `access_log` DISABLE KEYS */;
INSERT IGNORE INTO `access_log` (`id`, `user_id`, `type_id`, `access_point_id`, `created_at`) VALUES
	(1, 2, 1, 1, '2019-12-01 19:34:46'),
	(2, 2, 2, 1, '2019-12-01 19:35:04'),
	(3, 2, 1, 1, '2019-12-01 19:35:37');
/*!40000 ALTER TABLE `access_log` ENABLE KEYS */;

-- Dumping structure for таблиця ha.access_point
CREATE TABLE IF NOT EXISTS `access_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ha.access_point: ~2 rows (приблизно)
/*!40000 ALTER TABLE `access_point` DISABLE KEYS */;
INSERT IGNORE INTO `access_point` (`id`, `title`, `status`) VALUES
	(1, 'Hostel 1', 0),
	(2, 'Hostel 2', 0),
	(3, 'Hostel 3', 0);
/*!40000 ALTER TABLE `access_point` ENABLE KEYS */;

-- Dumping structure for таблиця ha.access_rules
CREATE TABLE IF NOT EXISTS `access_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `access_point_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_valid_from` date NOT NULL,
  `date_valid_till` date NOT NULL,
  `time_valid_from` time NOT NULL,
  `time_valid_till` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ha.access_rules: ~0 rows (приблизно)
/*!40000 ALTER TABLE `access_rules` DISABLE KEYS */;
INSERT IGNORE INTO `access_rules` (`id`, `user_id`, `access_point_id`, `status`, `date_valid_from`, `date_valid_till`, `time_valid_from`, `time_valid_till`) VALUES
	(1, 2, 1, 0, '2019-01-01', '2020-01-01', '06:00:00', '23:00:00'),
	(2, 5, 1, 0, '2019-12-08', '2019-12-08', '08:00:00', '23:00:00');
/*!40000 ALTER TABLE `access_rules` ENABLE KEYS */;

-- Dumping structure for таблиця ha.department
CREATE TABLE IF NOT EXISTS `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ha.department: ~0 rows (приблизно)
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;

-- Dumping structure for таблиця ha.migration_versions
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ha.migration_versions: ~0 rows (приблизно)
/*!40000 ALTER TABLE `migration_versions` DISABLE KEYS */;
INSERT IGNORE INTO `migration_versions` (`version`, `executed_at`) VALUES
	('20191130194906', '2019-11-30 20:14:28');
/*!40000 ALTER TABLE `migration_versions` ENABLE KEYS */;

-- Dumping structure for таблиця ha.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `father_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `type` tinyint(3) NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ha.user: ~2 rows (приблизно)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT IGNORE INTO `user` (`id`, `first_name`, `surname`, `father_name`, `department`, `status`, `type`, `login`, `password`, `created_at`) VALUES
	(1, 'test', 'test', 'test', 1, 0, 2, 'test1', '202cb962ac59075b964b07152d234b70', '2019-11-30 22:51:54'),
	(2, 'student', 'student', 'student', 1, 0, 1, 'student1', '202cb962ac59075b964b07152d234b70', '2019-12-01 13:44:26'),
	(3, 'qwe', 'qwe', 'qwe', 0, 0, 4, 'qwe', '76d80224611fc919a5d54f0ff9fba446', '2019-12-08 00:46:22'),
	(4, 'asd', 'asd', 'asd', 0, 0, 4, 'asd', '7815696ecbf1c96e6894b779456d330e', '2019-12-08 00:46:38'),
	(5, 'zxc', 'zxc', 'zxc', 0, 0, 4, 'zxc', '5fa72358f0b4fb4f2c5d7de8c9a41846', '2019-12-08 00:56:53');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Dumping structure for таблиця ha.user_guest
CREATE TABLE IF NOT EXISTS `user_guest` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `guest_user_id` int(11) unsigned NOT NULL,
  `guest_owner_id` int(11) unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table ha.user_guest: ~2 rows (приблизно)
/*!40000 ALTER TABLE `user_guest` DISABLE KEYS */;
INSERT IGNORE INTO `user_guest` (`id`, `guest_user_id`, `guest_owner_id`, `created_at`) VALUES
	(1, 0, 2, '2019-12-07 16:38:42'),
	(2, 0, 2, '2019-12-08 00:43:42'),
	(3, 3, 2, '2019-12-08 00:46:22'),
	(4, 4, 2, '2019-12-08 00:46:38'),
	(5, 5, 2, '2019-12-08 00:56:53');
/*!40000 ALTER TABLE `user_guest` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
