-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 21, 2017 at 10:52 PM
-- Server version: 5.6.33-0ubuntu0.14.04.1
-- PHP Version: 5.5.37-1+deprecated+dontuse+deb.sury.org~trusty+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pashotel`
--
CREATE DATABASE IF NOT EXISTS `pashotel` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pashotel`;

-- --------------------------------------------------------

--
-- Table structure for table `pm_activity`
--

DROP TABLE IF EXISTS `pm_activity`;
CREATE TABLE IF NOT EXISTS `pm_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `hotels` varchar(250) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `max_children` int(11) DEFAULT '1',
  `max_adults` int(11) DEFAULT '1',
  `max_people` int(11) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `subtitle` varchar(250) DEFAULT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `descr` longtext,
  `duration` float DEFAULT '0',
  `duration_unit` varchar(50) DEFAULT NULL,
  `price` double DEFAULT '0',
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `home` int(11) DEFAULT '0',
  `checked` int(11) DEFAULT '0',
  `rank` int(11) DEFAULT '0',
  PRIMARY KEY (`id`,`lang`),
  KEY `activity_lang_fkey` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pm_activity_file`
--

DROP TABLE IF EXISTS `pm_activity_file`;
CREATE TABLE IF NOT EXISTS `pm_activity_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `home` int(11) DEFAULT '0',
  `checked` int(11) DEFAULT '1',
  `rank` int(11) DEFAULT '0',
  `file` varchar(250) DEFAULT NULL,
  `label` varchar(250) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  KEY `activity_file_fkey` (`id_item`,`lang`),
  KEY `activity_file_lang_fkey` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pm_activity_session`
--

DROP TABLE IF EXISTS `pm_activity_session`;
CREATE TABLE IF NOT EXISTS `pm_activity_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_activity` int(11) NOT NULL,
  `days` varchar(20) DEFAULT NULL,
  `start_date` int(11) DEFAULT NULL,
  `end_date` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `price` double DEFAULT '0',
  `price_child` double DEFAULT '0',
  `discount` double DEFAULT '0',
  `vat_rate` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_session_fkey` (`id_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pm_activity_session_hour`
--

DROP TABLE IF EXISTS `pm_activity_session_hour`;
CREATE TABLE IF NOT EXISTS `pm_activity_session_hour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_activity_session` int(11) NOT NULL,
  `start_h` int(11) DEFAULT NULL,
  `start_m` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_session_hour_fkey` (`id_activity_session`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pm_article`
--

DROP TABLE IF EXISTS `pm_article`;
CREATE TABLE IF NOT EXISTS `pm_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `subtitle` varchar(250) DEFAULT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `text` longtext,
  `url` varchar(250) DEFAULT NULL,
  `tags` varchar(250) DEFAULT NULL,
  `id_page` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `home` int(11) DEFAULT '0',
  `checked` int(11) DEFAULT '0',
  `rank` int(11) DEFAULT '0',
  `add_date` int(11) DEFAULT NULL,
  `edit_date` int(11) DEFAULT NULL,
  `publish_date` int(11) DEFAULT NULL,
  `unpublish_date` int(11) DEFAULT NULL,
  `comment` int(11) DEFAULT '0',
  `rating` int(11) DEFAULT '0',
  PRIMARY KEY (`id`,`lang`),
  KEY `article_lang_fkey` (`lang`),
  KEY `article_page_fkey` (`id_page`,`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `pm_article`
--

INSERT INTO `pm_article` (`id`, `lang`, `title`, `subtitle`, `alias`, `text`, `url`, `tags`, `id_page`, `id_user`, `home`, `checked`, `rank`, `add_date`, `edit_date`, `publish_date`, `unpublish_date`, `comment`, `rating`) VALUES
(1, 1, 'Plongez dans des eaux inconnues !', '', 'plongee', '', '', '', 27, 1, 1, 1, 1, 1486145284, 1486401326, NULL, NULL, 1, 0),
(1, 2, 'Dive into unknown waters!', '', 'scuba-diving', '<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Nullam molestie, nunc eu consequat varius, nisi metus iaculis nulla, nec ornare odio leo quis eros. Donec gravida eget velit eget pulvinar. Phasellus eget est quis est faucibus condimentum. Morbi tellus turpis, posuere vel tincidunt non, varius ac ante. Suspendisse in sem neque. Donec et faucibus justo. Nulla vitae nisl lacus. Fusce tincidunt quam nec vestibulum vestibulum. Vivamus vulputate, nunc non ullamcorper mattis, nunc orci imperdiet nulla, at laoreet ipsum nisl non leo. Aenean dapibus aliquet sem, ut lacinia magna mattis in.</p>\r\n\r\n<p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempor arcu eu sapien ullamcorper sodales. Aenean eu massa in ante commodo scelerisque vitae sed sapien. Aenean eu dictum arcu. Mauris ultricies dolor eu molestie egestas.<br />\r\nProin feugiat, nunc at pellentesque fringilla, ex purus efficitur dolor, ac pretium odio lacus id leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse eu ipsum viverra dolor tempus vehicula eu eu risus. Praesent rutrum dapibus odio, nec accumsan justo fermentum in. Ut quis neque a ante facilisis bibendum.</p>\r\n', '', '', 27, 1, 1, 1, 1, 1486145284, 1486401326, NULL, NULL, 1, 0),
(1, 3, 'Dive into unknown waters!', '', 'scuba-diving', '', '', '', 27, 1, 1, 1, 1, 1486145284, 1486401326, NULL, NULL, 1, 0),
(1, 4, 'Dive into unknown waters!', '', 'scuba-diving', '<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Nullam molestie, nunc eu consequat varius, nisi metus iaculis nulla, nec ornare odio leo quis eros. Donec gravida eget velit eget pulvinar. Phasellus eget est quis est faucibus condimentum. Morbi tellus turpis, posuere vel tincidunt non, varius ac ante. Suspendisse in sem neque. Donec et faucibus justo. Nulla vitae nisl lacus. Fusce tincidunt quam nec vestibulum vestibulum. Vivamus vulputate, nunc non ullamcorper mattis, nunc orci imperdiet nulla, at laoreet ipsum nisl non leo. Aenean dapibus aliquet sem, ut lacinia magna mattis in.</p>\r\n\r\n<p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempor arcu eu sapien ullamcorper sodales. Aenean eu massa in ante commodo scelerisque vitae sed sapien. Aenean eu dictum arcu. Mauris ultricies dolor eu molestie egestas.<br />\r\nProin feugiat, nunc at pellentesque fringilla, ex purus efficitur dolor, ac pretium odio lacus id leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse eu ipsum viverra dolor tempus vehicula eu eu risus. Praesent rutrum dapibus odio, nec accumsan justo fermentum in. Ut quis neque a ante facilisis bibendum.</p>\r\n', '', '', 27, 1, 1, 1, 1, 1486145284, 1486401326, NULL, NULL, 1, 0),
(4, 1, 'Première gallery', '', 'premiere-gallery', '', '', '', 7, 1, 0, 1, 4, 1486145284, 1487266608, NULL, NULL, 0, 0),
(4, 2, 'First gallery', '', 'first-gallery', '<p><a href="https://www.airyrooms.com/promo/25">https://www.airyrooms.com/promo/25</a></p>\r\n', 'https://www.airyrooms.com/promo/25', '', 7, 1, 0, 1, 4, 1486145284, 1487266608, NULL, NULL, 0, 0),
(4, 3, 'First gallery', '', 'first-gallery', '', '', '', 7, 1, 0, 1, 4, 1486145284, 1487266608, NULL, NULL, 0, 0),
(4, 4, 'First gallery', '', 'first-gallery', '<p><a href="https://www.airyrooms.com/promo/25">https://www.airyrooms.com/promo/25</a></p>\r\n', 'https://www.airyrooms.com/promo/25', '', 7, 1, 0, 1, 4, 1486145284, 1487266608, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pm_article_file`
--

DROP TABLE IF EXISTS `pm_article_file`;
CREATE TABLE IF NOT EXISTS `pm_article_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `home` int(11) DEFAULT '0',
  `checked` int(11) DEFAULT '1',
  `rank` int(11) DEFAULT '0',
  `file` varchar(250) DEFAULT NULL,
  `label` varchar(250) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  KEY `article_file_fkey` (`id_item`,`lang`),
  KEY `article_file_lang_fkey` (`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `pm_article_file`
--

INSERT INTO `pm_article_file` (`id`, `lang`, `id_item`, `home`, `checked`, `rank`, `file`, `label`, `type`) VALUES
(4, 1, 4, 0, 1, 1, 'sample4.jpg', '', 'image'),
(4, 2, 4, 0, 1, 1, 'sample4.jpg', '', 'image'),
(4, 3, 4, 0, 1, 1, 'sample4.jpg', '', 'image'),
(4, 4, 4, 0, 1, 1, 'sample4.jpg', '', 'image'),
(5, 1, 1, 0, 1, 5, 'diving.jpg', '', 'image'),
(5, 2, 1, 0, 1, 5, 'diving.jpg', '', 'image'),
(5, 3, 1, 0, 1, 5, 'diving.jpg', '', 'image'),
(5, 4, 1, 0, 1, 5, 'diving.jpg', '', 'image');

-- --------------------------------------------------------

--
-- Table structure for table `pm_booking`
--

DROP TABLE IF EXISTS `pm_booking`;
CREATE TABLE IF NOT EXISTS `pm_booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_room` int(11) NOT NULL,
  `room` varchar(100) DEFAULT NULL,
  `add_date` datetime DEFAULT NULL,
  `edit_date` datetime DEFAULT NULL,
  `from_date` datetime DEFAULT NULL,
  `to_date` int(11) DEFAULT NULL,
  `nights` int(11) DEFAULT '1',
  `adults` int(11) DEFAULT '1',
  `children` int(11) DEFAULT '1',
  `amount` float DEFAULT NULL,
  `tourist_tax` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `down_payment` float DEFAULT NULL,
  `extra_services` text,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `country` varchar(100) NOT NULL,
  `comments` text,
  `status` int(11) DEFAULT '1',
  `trans` varchar(50) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_method` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `pm_booking`
--

INSERT INTO `pm_booking` (`id`, `id_room`, `room`, `add_date`, `edit_date`, `from_date`, `to_date`, `nights`, `adults`, `children`, `amount`, `tourist_tax`, `total`, `down_payment`, `extra_services`, `firstname`, `lastname`, `email`, `company`, `address`, `postcode`, `city`, `phone`, `mobile`, `country`, `comments`, `status`, `trans`, `payment_date`, `payment_method`) VALUES
(1, 5, 'SULTAN Hotel - Deluxe Room', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', 1487955600, 2, 1, NULL, 1296000, 0, 1296000, 0, '', 'Santoso', 'Novan', 'santoso.novan@gmail.com', 'siwarga', 'mampang prapatan', '12760', 'Jakarta', '082114958177', '082114958177', 'Indonesia', '', 1, NULL, NULL, 'Credit card (2Checkout.com)'),
(2, 5, 'SULTAN Hotel - Deluxe Room', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', 1487955600, 2, 1, NULL, 1296000, 0, 1296000, 0, '', 'Santoso', 'Novan', 'santoso.novan@gmail.com', 'siwarga', 'mampang prapatan', '12760', 'Jakarta', '082114958177', '082114958177', 'Indonesia', '', 1, NULL, NULL, 'PayPal'),
(3, 5, 'SULTAN Hotel - Deluxe Room', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1487264400, 1, 1, 0, 648000, 0, 648000, 0, '', 'Choir', 'Nur', 'nurchoir6@gmail.com', 'ahloo', 'Jl h samali', '57782', 'Karanganyar', '09878687675775', '09878687675775', 'Indonesia', '', 4, 'ID ', '0000-00-00 00:00:00', 'On arrival'),
(4, 5, 'SULTAN Hotel - Deluxe Room', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', 1487264400, 1, 1, NULL, 648000, 0, 648000, 0, '', 'Choir', 'Nur', 'nurchoir6@gmail.com', 'ahloo', 'Jl h samali', '57782', 'Karanganyar', '09878687675775', '09878687675775', 'Åland', '', 1, NULL, NULL, 'PayPal'),
(5, 5, 'SULTAN Hotel - Deluxe Room', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', 1488128400, 1, 1, NULL, 648000, 0, 648000, 0, '', 'Novan ', 'Santoso', 'santoso.novan@gmail.com', '', 'mampang prapatan', '12760', 'Jakarta', '082114958177', ')82114958177', 'Indonesia', '', 1, NULL, NULL, 'Credit card (2Checkout.com)'),
(6, 4, 'Ibis Budget Daan Mogot - Double Bed', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', 1488128400, 1, 1, NULL, 218500, 0, 218500, 0, '', 'Yuda', 'Pratama', 'Yuda.pratama7007@gmail.com', 'Siwarga indo media', 'Kemang raya', '12170', 'Jakarta', '085720455424', '', 'Indonesia', '', 1, NULL, NULL, 'Credit card (2Checkout.com)'),
(7, 5, 'SULTAN Hotel - Deluxe Room', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', 1488214800, 1, 1, NULL, 648000, 0, 648000, 0, '', 'Novan', 'Santoso', 'santoso.novan@gmail.com', 'siwarga', 'mampang', '12760', 'Jakarta', '082114958177', '082114958177', 'Indonesia', '', 1, NULL, NULL, 'Credit card (2Checkout.com)'),
(8, 5, 'SULTAN Hotel - Deluxe Room', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', 1488214800, 1, 1, NULL, 648000, 0, 648000, 0, '', 'Novan', 'Santoso', 'santoso.novan@gmail.com', 'siwarga', 'mampang', '12760', 'Jakarta', '082114958177', '082114958177', 'Indonesia', '', 1, NULL, NULL, 'Credit card (2Checkout.com)'),
(9, 5, 'SULTAN Hotel - Deluxe Room', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', 1488214800, 1, 1, NULL, 648000, 0, 648000, 0, '', 'Novan', 'Santoso', 'santoso.novan@gmail.com', 'siwarga', 'mampang', '12760', 'Jakarta', '082114958177', '082114958177', 'Indonesia', '', 1, NULL, NULL, 'Credit card (2Checkout.com)'),
(10, 3, 'Hotel Amaris Kuningan - Standart Room', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', 1488214800, 1, 1, NULL, 400000, 0, 400000, 0, '', 'Novan', 'Santoso', 'santoso.novan@gmail.com', 'siwarga', 'mampang', '12760', 'Jakarta', '082114958177', '082114958177', 'Indonesia', '', 1, NULL, NULL, 'Credit card (2Checkout.com)'),
(11, 8, 'Bamboo Inn Hotel - Superior Room', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', 1488936361, 1, 2, NULL, 290000, 0, 290000, 0, '', 'Novan', 'Santoso', 'santoso.novan@gmail.com', 'Siwarga Indomedia', 'Samali 49', '12740', 'Jakarta', '082114958177', '082114958177', 'Indonesia', '', 1, NULL, NULL, 'Credit card (2Checkout.com)'),
(12, 5, 'SULTAN Hotel - Deluxe Room', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', 1489508628, 1, 2, NULL, 648000, 0, 648000, 0, '', 'Novan', 'Santoso', 'santoso.novan@gmail.com', 'siwarga', 'mampang prapatan', '12670', 'jakarta', '021 27007002', '082114958177', 'Indonesia', 'Handuk', 1, NULL, NULL, 'Credit card (2Checkout.com)'),
(13, 5, 'SULTAN Hotel - Deluxe Room', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', 1489597200, 1, 1, NULL, 648000, 0, 648000, 0, '', 'Novan', 'Santoso', 'santoso.novan@gmail.com', 'Siwarga Indomedia', 'Mampang Prapatan', '12760', 'Jakarta', '082114958177', '082114958177', 'Indonesia', '', 1, NULL, NULL, 'Credit card (2Checkout.com)'),
(14, 5, 'SULTAN Hotel - Deluxe Room', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', 1489648637, 1, 1, NULL, 648000, 0, 648000, 0, '', 'Novan', 'Santoso', 'santoso.novan@gmail.com', 'Siwarga Indomedia', 'Mampang Prapatan', '12760', 'jakarta', '082114958177', '082114958177', 'Indonesia', '', 1, NULL, NULL, 'Credit card (2Checkout.com)'),
(15, 3, 'Hotel Amaris Kuningan - Standart Room', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', 1489656548, 1, 1, NULL, 400000, 0, 400000, 0, '', 'Novan', 'Santoso', 'santoso.novan@gmail.com', 'Siwarga Indomedia', 'Mampang Prapatan', '12670', 'jakarta', '021 27007002', '082114958177', 'Indonesia', '', 1, NULL, NULL, 'Credit card (2Checkout.com)'),
(16, 5, 'SULTAN Hotel - Deluxe Room', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', 1503213882, 1, 2, NULL, 648000, 0, 648000, 0, '', 'novan', 'asadada', 'info@pashotel.com', 'adkjakd', 'sdadad', '12567', 'jakarta', '0821111', '191868138', 'Indonesia', '', 1, NULL, NULL, 'Credit card (2Checkout.com)'),
(17, 5, 'SULTAN Hotel - Deluxe Room', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', 1503213882, 1, 2, NULL, 648000, 0, 648000, 0, '', 'TEst masuk', 'ajak', 'test@pashotel.com', 'adkjakd', 'sdadad', '12567', 'jakarta', '0821111', '191868138', 'Indonesia', '', 1, NULL, NULL, 'Credit card (2Checkout.com)'),
(18, 3, 'Hotel Amaris Kuningan - Standart Room', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', 1503213882, 1, 2, NULL, 400000, 0, 400000, 0, '', 'TEst masuk 2', 'ajak', 'test@pashotel.com', 'adkjakd', 'sdadad', '12567', 'jakarta', '0821111', '191868138', 'Indonesia', '', 1, NULL, NULL, 'Credit card (2Checkout.com)');

-- --------------------------------------------------------

--
-- Table structure for table `pm_booking_activity`
--

DROP TABLE IF EXISTS `pm_booking_activity`;
CREATE TABLE IF NOT EXISTS `pm_booking_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_booking` int(11) NOT NULL,
  `id_activity` int(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `children` int(11) DEFAULT '0',
  `adults` int(11) DEFAULT '0',
  `duration` varchar(50) DEFAULT NULL,
  `amount` double DEFAULT '0',
  `date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_activity_fkey` (`id_booking`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pm_comment`
--

DROP TABLE IF EXISTS `pm_comment`;
CREATE TABLE IF NOT EXISTS `pm_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_type` varchar(30) DEFAULT NULL,
  `id_item` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `checked` int(11) DEFAULT '0',
  `add_date` int(11) DEFAULT NULL,
  `edit_date` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `msg` longtext,
  `ip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pm_country`
--

DROP TABLE IF EXISTS `pm_country`;
CREATE TABLE IF NOT EXISTS `pm_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=251 ;

--
-- Dumping data for table `pm_country`
--

INSERT INTO `pm_country` (`id`, `name`, `code`) VALUES
(1, 'Afghanistan', 'AF'),
(2, 'Åland', 'AX'),
(3, 'Albania', 'AL'),
(4, 'Algeria', 'DZ'),
(5, 'American Samoa', 'AS'),
(6, 'Andorra', 'AD'),
(7, 'Angola', 'AO'),
(8, 'Anguilla', 'AI'),
(9, 'Antarctica', 'AQ'),
(10, 'Antigua and Barbuda', 'AG'),
(11, 'Argentina', 'AR'),
(12, 'Armenia', 'AM'),
(13, 'Aruba', 'AW'),
(14, 'Australia', 'AU'),
(15, 'Austria', 'AT'),
(16, 'Azerbaijan', 'AZ'),
(17, 'Bahamas', 'BS'),
(18, 'Bahrain', 'BH'),
(19, 'Bangladesh', 'BD'),
(20, 'Barbados', 'BB'),
(21, 'Belarus', 'BY'),
(22, 'Belgium', 'BE'),
(23, 'Belize', 'BZ'),
(24, 'Benin', 'BJ'),
(25, 'Bermuda', 'BM'),
(26, 'Bhutan', 'BT'),
(27, 'Bolivia', 'BO'),
(28, 'Bonaire', 'BQ'),
(29, 'Bosnia and Herzegovina', 'BA'),
(30, 'Botswana', 'BW'),
(31, 'Bouvet Island', 'BV'),
(32, 'Brazil', 'BR'),
(33, 'British Indian Ocean Territory', 'IO'),
(34, 'British Virgin Islands', 'VG'),
(35, 'Brunei', 'BN'),
(36, 'Bulgaria', 'BG'),
(37, 'Burkina Faso', 'BF'),
(38, 'Burundi', 'BI'),
(39, 'Cambodia', 'KH'),
(40, 'Cameroon', 'CM'),
(41, 'Canada', 'CA'),
(42, 'Cape Verde', 'CV'),
(43, 'Cayman Islands', 'KY'),
(44, 'Central African Republic', 'CF'),
(45, 'Chad', 'TD'),
(46, 'Chile', 'CL'),
(47, 'China', 'CN'),
(48, 'Christmas Island', 'CX'),
(49, 'Cocos [Keeling] Islands', 'CC'),
(50, 'Colombia', 'CO'),
(51, 'Comoros', 'KM'),
(52, 'Cook Islands', 'CK'),
(53, 'Costa Rica', 'CR'),
(54, 'Croatia', 'HR'),
(55, 'Cuba', 'CU'),
(56, 'Curacao', 'CW'),
(57, 'Cyprus', 'CY'),
(58, 'Czech Republic', 'CZ'),
(59, 'Democratic Republic of the Congo', 'CD'),
(60, 'Denmark', 'DK'),
(61, 'Djibouti', 'DJ'),
(62, 'Dominica', 'DM'),
(63, 'Dominican Republic', 'DO'),
(64, 'East Timor', 'TL'),
(65, 'Ecuador', 'EC'),
(66, 'Egypt', 'EG'),
(67, 'El Salvador', 'SV'),
(68, 'Equatorial Guinea', 'GQ'),
(69, 'Eritrea', 'ER'),
(70, 'Estonia', 'EE'),
(71, 'Ethiopia', 'ET'),
(72, 'Falkland Islands', 'FK'),
(73, 'Faroe Islands', 'FO'),
(74, 'Fiji', 'FJ'),
(75, 'Finland', 'FI'),
(76, 'France', 'FR'),
(77, 'French Guiana', 'GF'),
(78, 'French Polynesia', 'PF'),
(79, 'French Southern Territories', 'TF'),
(80, 'Gabon', 'GA'),
(81, 'Gambia', 'GM'),
(82, 'Georgia', 'GE'),
(83, 'Germany', 'DE'),
(84, 'Ghana', 'GH'),
(85, 'Gibraltar', 'GI'),
(86, 'Greece', 'GR'),
(87, 'Greenland', 'GL'),
(88, 'Grenada', 'GD'),
(89, 'Guadeloupe', 'GP'),
(90, 'Guam', 'GU'),
(91, 'Guatemala', 'GT'),
(92, 'Guernsey', 'GG'),
(93, 'Guinea', 'GN'),
(94, 'Guinea-Bissau', 'GW'),
(95, 'Guyana', 'GY'),
(96, 'Haiti', 'HT'),
(97, 'Heard Island and McDonald Islands', 'HM'),
(98, 'Honduras', 'HN'),
(99, 'Hong Kong', 'HK'),
(100, 'Hungary', 'HU'),
(101, 'Iceland', 'IS'),
(102, 'India', 'IN'),
(103, 'Indonesia', 'ID'),
(104, 'Iran', 'IR'),
(105, 'Iraq', 'IQ'),
(106, 'Ireland', 'IE'),
(107, 'Isle of Man', 'IM'),
(108, 'Israel', 'IL'),
(109, 'Italy', 'IT'),
(110, 'Ivory Coast', 'CI'),
(111, 'Jamaica', 'JM'),
(112, 'Japan', 'JP'),
(113, 'Jersey', 'JE'),
(114, 'Jordan', 'JO'),
(115, 'Kazakhstan', 'KZ'),
(116, 'Kenya', 'KE'),
(117, 'Kiribati', 'KI'),
(118, 'Kosovo', 'XK'),
(119, 'Kuwait', 'KW'),
(120, 'Kyrgyzstan', 'KG'),
(121, 'Laos', 'LA'),
(122, 'Latvia', 'LV'),
(123, 'Lebanon', 'LB'),
(124, 'Lesotho', 'LS'),
(125, 'Liberia', 'LR'),
(126, 'Libya', 'LY'),
(127, 'Liechtenstein', 'LI'),
(128, 'Lithuania', 'LT'),
(129, 'Luxembourg', 'LU'),
(130, 'Macao', 'MO'),
(131, 'Macedonia', 'MK'),
(132, 'Madagascar', 'MG'),
(133, 'Malawi', 'MW'),
(134, 'Malaysia', 'MY'),
(135, 'Maldives', 'MV'),
(136, 'Mali', 'ML'),
(137, 'Malta', 'MT'),
(138, 'Marshall Islands', 'MH'),
(139, 'Martinique', 'MQ'),
(140, 'Mauritania', 'MR'),
(141, 'Mauritius', 'MU'),
(142, 'Mayotte', 'YT'),
(143, 'Mexico', 'MX'),
(144, 'Micronesia', 'FM'),
(145, 'Moldova', 'MD'),
(146, 'Monaco', 'MC'),
(147, 'Mongolia', 'MN'),
(148, 'Montenegro', 'ME'),
(149, 'Montserrat', 'MS'),
(150, 'Morocco', 'MA'),
(151, 'Mozambique', 'MZ'),
(152, 'Myanmar [Burma]', 'MM'),
(153, 'Namibia', 'NA'),
(154, 'Nauru', 'NR'),
(155, 'Nepal', 'NP'),
(156, 'Netherlands', 'NL'),
(157, 'New Caledonia', 'NC'),
(158, 'New Zealand', 'NZ'),
(159, 'Nicaragua', 'NI'),
(160, 'Niger', 'NE'),
(161, 'Nigeria', 'NG'),
(162, 'Niue', 'NU'),
(163, 'Norfolk Island', 'NF'),
(164, 'North Korea', 'KP'),
(165, 'Northern Mariana Islands', 'MP'),
(166, 'Norway', 'NO'),
(167, 'Oman', 'OM'),
(168, 'Pakistan', 'PK'),
(169, 'Palau', 'PW'),
(170, 'Palestine', 'PS'),
(171, 'Panama', 'PA'),
(172, 'Papua New Guinea', 'PG'),
(173, 'Paraguay', 'PY'),
(174, 'Peru', 'PE'),
(175, 'Philippines', 'PH'),
(176, 'Pitcairn Islands', 'PN'),
(177, 'Poland', 'PL'),
(178, 'Portugal', 'PT'),
(179, 'Puerto Rico', 'PR'),
(180, 'Qatar', 'QA'),
(181, 'Republic of the Congo', 'CG'),
(182, 'Réunion', 'RE'),
(183, 'Romania', 'RO'),
(184, 'Russia', 'RU'),
(185, 'Rwanda', 'RW'),
(186, 'Saint Barthélemy', 'BL'),
(187, 'Saint Helena', 'SH'),
(188, 'Saint Kitts and Nevis', 'KN'),
(189, 'Saint Lucia', 'LC'),
(190, 'Saint Martin', 'MF'),
(191, 'Saint Pierre and Miquelon', 'PM'),
(192, 'Saint Vincent and the Grenadines', 'VC'),
(193, 'Samoa', 'WS'),
(194, 'San Marino', 'SM'),
(195, 'São Tomé and Príncipe', 'ST'),
(196, 'Saudi Arabia', 'SA'),
(197, 'Senegal', 'SN'),
(198, 'Serbia', 'RS'),
(199, 'Seychelles', 'SC'),
(200, 'Sierra Leone', 'SL'),
(201, 'Singapore', 'SG'),
(202, 'Sint Maarten', 'SX'),
(203, 'Slovakia', 'SK'),
(204, 'Slovenia', 'SI'),
(205, 'Solomon Islands', 'SB'),
(206, 'Somalia', 'SO'),
(207, 'South Africa', 'ZA'),
(208, 'South Georgia and the South Sandwich Islands', 'GS'),
(209, 'South Korea', 'KR'),
(210, 'South Sudan', 'SS'),
(211, 'Spain', 'ES'),
(212, 'Sri Lanka', 'LK'),
(213, 'Sudan', 'SD'),
(214, 'Suriname', 'SR'),
(215, 'Svalbard and Jan Mayen', 'SJ'),
(216, 'Swaziland', 'SZ'),
(217, 'Sweden', 'SE'),
(218, 'Switzerland', 'CH'),
(219, 'Syria', 'SY'),
(220, 'Taiwan', 'TW'),
(221, 'Tajikistan', 'TJ'),
(222, 'Tanzania', 'TZ'),
(223, 'Thailand', 'TH'),
(224, 'Togo', 'TG'),
(225, 'Tokelau', 'TK'),
(226, 'Tonga', 'TO'),
(227, 'Trinidad and Tobago', 'TT'),
(228, 'Tunisia', 'TN'),
(229, 'Turkey', 'TR'),
(230, 'Turkmenistan', 'TM'),
(231, 'Turks and Caicos Islands', 'TC'),
(232, 'Tuvalu', 'TV'),
(233, 'U.S. Minor Outlying Islands', 'UM'),
(234, 'U.S. Virgin Islands', 'VI'),
(235, 'Uganda', 'UG'),
(236, 'Ukraine', 'UA'),
(237, 'United Arab Emirates', 'AE'),
(238, 'United Kingdom', 'GB'),
(239, 'United States', 'US'),
(240, 'Uruguay', 'UY'),
(241, 'Uzbekistan', 'UZ'),
(242, 'Vanuatu', 'VU'),
(243, 'Vatican City', 'VA'),
(244, 'Venezuela', 'VE'),
(245, 'Vietnam', 'VN'),
(246, 'Wallis and Futuna', 'WF'),
(247, 'Western Sahara', 'EH'),
(248, 'Yemen', 'YE'),
(249, 'Zambia', 'ZM'),
(250, 'Zimbabwe', 'ZW');

-- --------------------------------------------------------

--
-- Table structure for table `pm_currency`
--

DROP TABLE IF EXISTS `pm_currency`;
CREATE TABLE IF NOT EXISTS `pm_currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(5) DEFAULT NULL,
  `sign` varchar(5) DEFAULT NULL,
  `main` int(11) DEFAULT '0',
  `rank` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `pm_currency`
--

INSERT INTO `pm_currency` (`id`, `code`, `sign`, `main`, `rank`) VALUES
(1, 'USD', '$', 0, 1),
(9, 'IDR', 'Rp', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pm_destination`
--

DROP TABLE IF EXISTS `pm_destination`;
CREATE TABLE IF NOT EXISTS `pm_destination` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `checked` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `pm_destination`
--

INSERT INTO `pm_destination` (`id`, `name`, `checked`) VALUES
(1, 'Jakarta', 1),
(2, 'Bandung', 1),
(6, 'Yogyakarta', 1),
(7, 'Bali', 1),
(8, 'Bogor', 1),
(9, 'Surabaya', 1),
(10, 'Makassar', 1),
(11, 'Solo', 1),
(12, 'Semarang', 1),
(13, 'Medan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pm_facility`
--

DROP TABLE IF EXISTS `pm_facility`;
CREATE TABLE IF NOT EXISTS `pm_facility` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `rank` int(11) DEFAULT '0',
  PRIMARY KEY (`id`,`lang`),
  KEY `facility_lang_fkey` (`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `pm_facility`
--

INSERT INTO `pm_facility` (`id`, `lang`, `name`, `rank`) VALUES
(1, 1, 'Climatisation', 1),
(1, 2, 'Air conditioning', 1),
(1, 4, 'Air conditioning', 1),
(2, 1, 'Lit bébé', 2),
(2, 2, 'Baby cot', 2),
(2, 4, 'Baby cot', 2),
(3, 1, 'Balcon', 3),
(3, 2, 'Balcony', 3),
(3, 4, 'Balcony', 3),
(4, 1, 'Barbecue', 4),
(4, 2, 'Barbecue', 4),
(4, 4, 'Barbecue', 4),
(5, 1, 'Salle de bain', 5),
(5, 2, 'Bathroom', 5),
(5, 4, 'Bathroom', 5),
(6, 1, 'Cafetière', 6),
(6, 2, 'Coffeemaker', 6),
(6, 4, 'Coffeemaker', 6),
(7, 1, 'Plaque de cuisson', 7),
(7, 2, 'Cooktop', 7),
(7, 4, 'Cooktop', 7),
(8, 1, 'Bureau', 8),
(8, 2, 'Desk', 8),
(8, 4, 'Desk', 8),
(9, 1, 'Lave vaisselle', 9),
(9, 2, 'Dishwasher', 9),
(9, 4, 'Dishwasher', 9),
(10, 1, 'Ventilateur', 10),
(10, 2, 'Fan', 10),
(10, 4, 'Fan', 10),
(11, 1, 'Parking gratuit', 11),
(11, 2, 'Free parking', 11),
(11, 4, 'Free parking', 11),
(12, 1, 'Réfrigérateur', 12),
(12, 2, 'Fridge', 12),
(12, 4, 'Fridge', 12),
(13, 1, 'Sèche-cheveux', 13),
(13, 2, 'Hairdryer', 13),
(13, 4, 'Hairdryer', 13),
(14, 1, 'Internet', 14),
(14, 2, 'Internet', 14),
(14, 4, 'Internet', 14),
(15, 1, 'Fer à repasser', 15),
(15, 2, 'Iron', 15),
(15, 4, 'Iron', 15),
(16, 1, 'Micro-ondes', 16),
(16, 2, 'Microwave', 16),
(16, 4, 'Microwave', 16),
(17, 1, 'Mini-bar', 17),
(17, 2, 'Mini-bar', 17),
(17, 4, 'Mini-bar', 17),
(18, 1, 'Non-fumeurs', 18),
(18, 2, 'Non-smoking', 18),
(18, 4, 'Non-smoking', 18),
(19, 1, 'Parking payant', 19),
(19, 2, 'Paid parking', 19),
(19, 4, 'Paid parking', 19),
(20, 1, 'Animaux acceptés', 20),
(20, 2, 'Pets allowed', 20),
(20, 4, 'Pets allowed', 20),
(21, 1, 'Animaux interdits', 21),
(21, 2, 'Pets not allowed', 21),
(21, 4, 'Pets not allowed', 21),
(22, 1, 'Radio', 22),
(22, 2, 'Radio', 22),
(22, 4, 'Radio', 22),
(23, 1, 'Coffre-fort', 23),
(23, 2, 'Safe', 23),
(23, 4, 'Safe', 23),
(24, 1, 'Chaines satellite', 24),
(24, 2, 'Satellite chanels', 24),
(24, 4, 'Satellite chanels', 24),
(25, 1, 'Salle d''eau', 25),
(25, 2, 'Shower-room', 25),
(25, 4, 'Shower-room', 25),
(26, 1, 'Coin salon', 26),
(26, 2, 'Small lounge', 26),
(26, 4, 'Small lounge', 26),
(27, 1, 'Telephone', 27),
(27, 2, 'Telephone', 27),
(27, 4, 'Telephone', 27),
(28, 1, 'Téléviseur', 28),
(28, 2, 'Television', 28),
(28, 4, 'Television', 28),
(29, 1, 'Terrasse', 29),
(29, 2, 'Terrasse', 29),
(29, 4, 'Terrasse', 29),
(30, 1, 'Machine à laver', 30),
(30, 2, 'Washing machine', 30),
(30, 4, 'Washing machine', 30),
(31, 1, 'Accès handicapés', 31),
(31, 2, 'Wheelchair accessible', 31),
(31, 4, 'Wheelchair accessible', 31),
(32, 1, 'Wi-Fi', 31),
(32, 2, 'WiFi', 31),
(32, 4, 'WiFi', 31),
(33, 1, 'Chaine hifi', 32),
(33, 2, 'Hi-fi system', 32),
(33, 4, 'Hi-fi system', 32),
(34, 1, 'Lecteur DVD', 33),
(34, 2, 'DVD player', 33),
(34, 4, 'DVD player', 33),
(36, 1, 'Coin salon', 35),
(36, 2, 'Lounge', 35),
(36, 4, 'Lounge', 35),
(37, 1, 'Restaurant', 36),
(37, 2, 'Restaurant', 36),
(37, 4, 'Restaurant', 36),
(38, 1, 'Service de chambre', 37),
(38, 2, 'Room service', 37),
(38, 4, 'Room service', 37);

-- --------------------------------------------------------

--
-- Table structure for table `pm_facility_file`
--

DROP TABLE IF EXISTS `pm_facility_file`;
CREATE TABLE IF NOT EXISTS `pm_facility_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `home` int(11) DEFAULT '0',
  `checked` int(11) DEFAULT '1',
  `rank` int(11) DEFAULT '0',
  `file` varchar(250) DEFAULT NULL,
  `label` varchar(250) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  KEY `facility_file_fkey` (`id_item`,`lang`),
  KEY `facility_file_lang_fkey` (`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

--
-- Dumping data for table `pm_facility_file`
--

INSERT INTO `pm_facility_file` (`id`, `lang`, `id_item`, `home`, `checked`, `rank`, `file`, `label`, `type`) VALUES
(1, 2, 31, 0, 1, 1, 'wheelchair.png', '', 'image'),
(1, 4, 31, 0, 1, 1, 'wheelchair.png', '', 'image'),
(2, 2, 20, 0, 1, 2, 'pet-allowed.png', '', 'image'),
(2, 4, 20, 0, 1, 2, 'pet-allowed.png', '', 'image'),
(3, 2, 21, 0, 1, 3, 'pet-not-allowed.png', '', 'image'),
(3, 4, 21, 0, 1, 3, 'pet-not-allowed.png', '', 'image'),
(4, 2, 3, 0, 1, 4, 'balcony.png', '', 'image'),
(4, 4, 3, 0, 1, 4, 'balcony.png', '', 'image'),
(5, 2, 4, 0, 1, 5, 'barbecue.png', '', 'image'),
(5, 4, 4, 0, 1, 5, 'barbecue.png', '', 'image'),
(6, 2, 8, 0, 1, 6, 'desk.png', '', 'image'),
(6, 4, 8, 0, 1, 6, 'desk.png', '', 'image'),
(7, 2, 6, 0, 1, 7, 'coffee.png', '', 'image'),
(7, 4, 6, 0, 1, 7, 'coffee.png', '', 'image'),
(8, 2, 24, 0, 1, 8, 'satellite.png', '', 'image'),
(8, 4, 24, 0, 1, 8, 'satellite.png', '', 'image'),
(9, 2, 1, 0, 1, 9, 'air-conditioning.png', '', 'image'),
(9, 4, 1, 0, 1, 9, 'air-conditioning.png', '', 'image'),
(10, 2, 23, 0, 1, 10, 'safe.png', '', 'image'),
(10, 4, 23, 0, 1, 10, 'safe.png', '', 'image'),
(11, 2, 26, 0, 1, 11, 'lounge.png', '', 'image'),
(11, 4, 26, 0, 1, 11, 'lounge.png', '', 'image'),
(12, 2, 15, 0, 1, 12, 'iron.png', '', 'image'),
(12, 4, 15, 0, 1, 12, 'iron.png', '', 'image'),
(13, 2, 14, 0, 1, 13, 'adsl.png', '', 'image'),
(13, 4, 14, 0, 1, 13, 'adsl.png', '', 'image'),
(14, 2, 9, 0, 1, 14, 'dishwasher.png', '', 'image'),
(14, 4, 9, 0, 1, 14, 'dishwasher.png', '', 'image'),
(15, 2, 2, 0, 1, 15, 'baby-cot.png', '', 'image'),
(15, 4, 2, 0, 1, 15, 'baby-cot.png', '', 'image'),
(16, 2, 30, 0, 1, 16, 'washing-machine.png', '', 'image'),
(16, 4, 30, 0, 1, 16, 'washing-machine.png', '', 'image'),
(17, 2, 16, 0, 1, 17, 'microwaves.png', '', 'image'),
(17, 4, 16, 0, 1, 17, 'microwaves.png', '', 'image'),
(18, 2, 17, 0, 1, 18, 'mini-bar.png', '', 'image'),
(18, 4, 17, 0, 1, 18, 'mini-bar.png', '', 'image'),
(19, 2, 18, 0, 1, 19, 'non-smoking.png', '', 'image'),
(19, 4, 18, 0, 1, 19, 'non-smoking.png', '', 'image'),
(20, 2, 11, 0, 1, 20, 'free-parking.png', '', 'image'),
(20, 4, 11, 0, 1, 20, 'free-parking.png', '', 'image'),
(21, 2, 19, 0, 1, 21, 'paid-parking.png', '', 'image'),
(21, 4, 19, 0, 1, 21, 'paid-parking.png', '', 'image'),
(22, 2, 7, 0, 1, 22, 'cooktop.png', '', 'image'),
(22, 4, 7, 0, 1, 22, 'cooktop.png', '', 'image'),
(23, 2, 22, 0, 1, 23, 'radio.png', '', 'image'),
(23, 4, 22, 0, 1, 23, 'radio.png', '', 'image'),
(24, 2, 12, 0, 1, 24, 'fridge.png', '', 'image'),
(24, 4, 12, 0, 1, 24, 'fridge.png', '', 'image'),
(25, 2, 25, 0, 1, 25, 'shower.png', '', 'image'),
(25, 4, 25, 0, 1, 25, 'shower.png', '', 'image'),
(26, 2, 5, 0, 1, 26, 'bath.png', '', 'image'),
(26, 4, 5, 0, 1, 26, 'bath.png', '', 'image'),
(27, 2, 13, 0, 1, 27, 'hairdryer.png', '', 'image'),
(27, 4, 13, 0, 1, 27, 'hairdryer.png', '', 'image'),
(28, 2, 27, 0, 1, 28, 'phone.png', '', 'image'),
(28, 4, 27, 0, 1, 28, 'phone.png', '', 'image'),
(29, 2, 28, 0, 1, 29, 'tv.png', '', 'image'),
(29, 4, 28, 0, 1, 29, 'tv.png', '', 'image'),
(30, 2, 29, 0, 1, 30, 'terrasse.png', '', 'image'),
(30, 4, 29, 0, 1, 30, 'terrasse.png', '', 'image'),
(31, 2, 10, 0, 1, 31, 'fan.png', '', 'image'),
(31, 4, 10, 0, 1, 31, 'fan.png', '', 'image'),
(32, 2, 32, 0, 1, 32, 'wifi.png', '', 'image'),
(32, 4, 32, 0, 1, 32, 'wifi.png', '', 'image'),
(33, 2, 33, 0, 1, 33, 'hifi.png', '', 'image'),
(33, 4, 33, 0, 1, 33, 'hifi.png', '', 'image'),
(34, 2, 34, 0, 1, 34, 'dvd.png', '', 'image'),
(34, 4, 34, 0, 1, 34, 'dvd.png', '', 'image'),
(35, 2, 33, 0, 1, 33, 'elevator.png', '', 'image'),
(35, 4, 33, 0, 1, 33, 'elevator.png', '', 'image'),
(36, 2, 33, 0, 1, 33, 'lounge.png', '', 'image'),
(36, 4, 33, 0, 1, 33, 'lounge.png', '', 'image'),
(37, 2, 33, 0, 1, 33, 'restaurant.png', '', 'image'),
(37, 4, 33, 0, 1, 33, 'restaurant.png', '', 'image'),
(38, 2, 33, 0, 1, 33, 'room-service.png', '', 'image'),
(38, 4, 33, 0, 1, 33, 'room-service.png', '', 'image'),
(39, 2, 33, 0, 1, 33, 'cloakroom.png', '', 'image'),
(39, 4, 33, 0, 1, 33, 'cloakroom.png', '', 'image');

-- --------------------------------------------------------

--
-- Table structure for table `pm_hotel`
--

DROP TABLE IF EXISTS `pm_hotel`;
CREATE TABLE IF NOT EXISTS `pm_hotel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `subtitle` varchar(250) DEFAULT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `web` varchar(250) DEFAULT NULL,
  `descr` longtext,
  `facilities` varchar(250) DEFAULT NULL,
  `id_destination` int(11) DEFAULT NULL,
  `home` int(11) DEFAULT '0',
  `checked` int(11) DEFAULT '0',
  `rank` int(11) DEFAULT '0',
  PRIMARY KEY (`id`,`lang`),
  KEY `hotel_lang_fkey` (`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `pm_hotel`
--

INSERT INTO `pm_hotel` (`id`, `lang`, `id_user`, `title`, `subtitle`, `alias`, `address`, `lat`, `lng`, `email`, `phone`, `web`, `descr`, `facilities`, `id_destination`, `home`, `checked`, `rank`) VALUES
(2, 1, 1, '', '', '', 'Jalan Gatot Subroto, Tanah Abang, 10270 Jakarta, Indonesia', -6.2180392, 106.8109469, 'sultanhotel@gmail.com', '+62 21 5703600', 'sultanhotel.com', '', '1,4,3,6,9,34', 1, 1, 1, 1),
(2, 2, 1, 'SULTAN Hotel', 'Luxurious Place to Relax', 'sultan-hotel', 'Jalan Gatot Subroto, Tanah Abang, 10270 Jakarta, Indonesia', -6.2180392, 106.8109469, 'sultanhotel@gmail.com', '+62 21 5703600', 'sultanhotel.com', '<p>In central Senayan, The Sultan Hotel Jakarta is only a 5-minute drive from Senayan City Mall & Plaza Senayan. Spread across 23 acres of lush tropical gardens, the hotel features an outdoor swimming pool and six dining options. Free Wi-Fi is accessible in all areas.</p>\r\n\r\n<p>The elegantly furnished bedrooms are fitted with a flat-screen cable TV, a personal safe, a minibar with a refrigerator, a desk and a sitting area. The private bathroom has hot shower facilities.</p>\r\n\r\n<p>The Sultan Hotel Jakarta is a 5-minute walk to Jakarta Convention Centre and is a 15-minute drive to Gambir Train Station.</p>\r\n\r\n<p>Guests can enjoy soothing spa and massage therapies in the hotel. The hotel also has tennis courts, a business center and an ATM for guests’ conveniences. Laundry and dry cleaning services are available upon request.</p>\r\n\r\n<p>Lagoon Café serves international dishes and Nippon Kan serves Japanese cuisine in the hotel. Nan Xiang Steamed Bun serves Chinese favorites. </p>\r\n\r\n<p>Tanah Abang is a great choice for travelers interested in shopping, businessand clothes shopping.</p>\r\n\r\n<p>We speak your language!</p>\r\n', '1,4,3,6,9,34', 1, 1, 1, 1),
(2, 3, 1, '', '', '', 'Jalan Gatot Subroto, Tanah Abang, 10270 Jakarta, Indonesia', -6.2180392, 106.8109469, 'sultanhotel@gmail.com', '+62 21 5703600', 'sultanhotel.com', '', '1,4,3,6,9,34', 1, 1, 1, 1),
(2, 4, 1, 'SULTAN Hotel', 'Luxurious Place to Relax', 'sultan-hotel', 'Jalan Gatot Subroto, Tanah Abang, 10270 Jakarta, Indonesia', -6.2180392, 106.8109469, 'sultanhotel@gmail.com', '+62 21 5703600', 'sultanhotel.com', '<p>In central Senayan, The Sultan Hotel Jakarta is only a 5-minute drive from Senayan City Mall & Plaza Senayan. Spread across 23 acres of lush tropical gardens, the hotel features an outdoor swimming pool and six dining options. Free Wi-Fi is accessible in all areas.</p>\r\n\r\n<p>The elegantly furnished bedrooms are fitted with a flat-screen cable TV, a personal safe, a minibar with a refrigerator, a desk and a sitting area. The private bathroom has hot shower facilities.</p>\r\n\r\n<p>The Sultan Hotel Jakarta is a 5-minute walk to Jakarta Convention Centre and is a 15-minute drive to Gambir Train Station.</p>\r\n\r\n<p>Guests can enjoy soothing spa and massage therapies in the hotel. The hotel also has tennis courts, a business center and an ATM for guests’ conveniences. Laundry and dry cleaning services are available upon request.</p>\r\n\r\n<p>Lagoon Café serves international dishes and Nippon Kan serves Japanese cuisine in the hotel. Nan Xiang Steamed Bun serves Chinese favorites. </p>\r\n\r\n<p>Tanah Abang is a great choice for travelers interested in shopping, businessand clothes shopping.</p>\r\n\r\n<p>We speak your language!</p>\r\n', '1,4,3,6,9,34', 1, 1, 1, 1),
(3, 1, 5, '', '', '', 'Jl. Prof. Dr. Satrio No. 23 Kuningan Blok C4 Kav 11, Setiabudi, 12950 Jakarta, Indonesia', -6.2254534, 106.8274302, '', '', '', '', '', 1, 1, 1, 2),
(3, 2, 5, 'Hotel Amaris Kuningan', 'Stay in the heart of Jakarta', 'amaris-satrio', 'Jl. Prof. Dr. Satrio No. 23 Kuningan Blok C4 Kav 11, Setiabudi, 12950 Jakarta, Indonesia', -6.2254534, 106.8274302, '', '', '', '<p> </span></p>\r\n\r\n<p>Amaris Hotel Satrio Kuningan - Jakarta is located in the Setiabudi neighborhood in Jakarta, just 3.5 km from Bundaran HI. Free private parking is available on site.</p>\r\n\r\n<p>Every room at this hotel is air conditioned and is equipped with a flat-screen TV with cable channels. Some units have a sitting area where you can relax. All rooms have a private bathroom equipped with a shower. For your comfort, you will find slippers and free toiletries.</p>\r\n\r\n<p>You will find a 24-hour front desk at the property.</p>\r\n\r\n<p>Sarinah is 4.3 km from Amaris Hotel Satrio Kuningan - Jakarta, and Tanah Abang Grocery & Textile Center is 4.7 km away. The nearest airport is Halim Perdanakusuma Airport, 8 km from Amaris Hotel Satrio Kuningan - Jakarta.</p>\r\n\r\n<p class="hp_district_endorsements hp_district_endorsements_lowercase">Setiabudi is a great choice for travelers interested in <span class="hp_district_endorsement_item">friendly locals</span>, <span class="hp_district_endorsement_item">luxury-brand shopping</span> and <span class="hp_district_endorsement_item">business</span>.</p>\r\n\r\n<p><span data-cke-marker="1"> </p>\r\n', '', 1, 1, 1, 2),
(3, 3, 5, '', '', '', 'Jl. Prof. Dr. Satrio No. 23 Kuningan Blok C4 Kav 11, Setiabudi, 12950 Jakarta, Indonesia', -6.2254534, 106.8274302, '', '', '', '', '', 1, 1, 1, 2),
(3, 4, 5, 'Hotel Amaris Kuningan', 'Stay in the heart of Jakarta', 'amaris-satrio', 'Jl. Prof. Dr. Satrio No. 23 Kuningan Blok C4 Kav 11, Setiabudi, 12950 Jakarta, Indonesia', -6.2254534, 106.8274302, '', '', '', '<p> </span></p>\r\n\r\n<p>Amaris Hotel Satrio Kuningan - Jakarta is located in the Setiabudi neighborhood in Jakarta, just 3.5 km from Bundaran HI. Free private parking is available on site.</p>\r\n\r\n<p>Every room at this hotel is air conditioned and is equipped with a flat-screen TV with cable channels. Some units have a sitting area where you can relax. All rooms have a private bathroom equipped with a shower. For your comfort, you will find slippers and free toiletries.</p>\r\n\r\n<p>You will find a 24-hour front desk at the property.</p>\r\n\r\n<p>Sarinah is 4.3 km from Amaris Hotel Satrio Kuningan - Jakarta, and Tanah Abang Grocery & Textile Center is 4.7 km away. The nearest airport is Halim Perdanakusuma Airport, 8 km from Amaris Hotel Satrio Kuningan - Jakarta.</p>\r\n\r\n<p class="hp_district_endorsements hp_district_endorsements_lowercase">Setiabudi is a great choice for travelers interested in <span class="hp_district_endorsement_item">friendly locals</span>, <span class="hp_district_endorsement_item">luxury-brand shopping</span> and <span class="hp_district_endorsement_item">business</span>.</p>\r\n\r\n<p><span data-cke-marker="1"> </p>\r\n', '', 1, 1, 1, 2),
(4, 1, 5, '', '', '', 'Jl Daan Mogot 50B, Grogol, 11460 Jakarta, Indonesia', -6.1615885, 106.769558, 'ibis-daanmogot@ibishotel.com', '021 58176668', 'ibishotel.com', '', '1,5,6,33,14,36,37,38,25,26,27,28,32', 1, 1, 1, 3),
(4, 2, 5, 'Ibis Budget Daan Mogot', 'Pleasure to stay comfort in Jakarta', 'ibis-budget-daanmogot', 'Jl Daan Mogot 50B, Grogol, 11460 Jakarta, Indonesia', -6.1615885, 106.769558, 'ibis-daanmogot@ibishotel.com', '021 58176668', 'ibishotel.com', '<p> </span></p>\r\n\r\n<p>Featuring a restaurant and meeting facilities, Ibis Budget Jakarta Daan Mogot offers accommodations in Jakarta. Free WiFi access is available. Soekarno Hatta International Airport is a 30-minute drive away.</p>\r\n\r\n<p>Each room at Ibis Budget Jakarta Daan Mogot features a modern décor, views of the city, air conditioning and a flat-screen TV. They are all fitted with a desk and a radio. Bathroom facilities are private and include a shower. Towels, linens and toiletries are provided.</p>\r\n\r\n<p>The buffet at Ibis Budget Jakarta Daan Mogot serves an intercontinental buffet breakfast. Services offered by the hotel include a 24-hour front desk and luggage storage. Airport shuttles can be arranged for a surcharge.</p>\r\n\r\n<p>Ibis Budget Jakarta Daan Mogot is 2 km from Taman Anggrek Shopping Mall, 5.4 km from Tanah Abang Grocery & Textile Center, 5.7 km from National Museum of Indonesia and 6.3 km from National Monument Park. Gambir Train Station is 14 km away.</p>\r\n\r\n<p><span data-cke-marker="1"> </p>\r\n', '1,5,6,33,14,36,37,38,25,26,27,28,32', 1, 1, 1, 3),
(4, 3, 5, '', '', '', 'Jl Daan Mogot 50B, Grogol, 11460 Jakarta, Indonesia', -6.1615885, 106.769558, 'ibis-daanmogot@ibishotel.com', '021 58176668', 'ibishotel.com', '', '1,5,6,33,14,36,37,38,25,26,27,28,32', 1, 1, 1, 3),
(4, 4, 5, 'Ibis Budget Daan Mogot', 'Pleasure to stay comfort in Jakarta', 'ibis-budget-daanmogot', 'Jl Daan Mogot 50B, Grogol, 11460 Jakarta, Indonesia', -6.1615885, 106.769558, 'ibis-daanmogot@ibishotel.com', '021 58176668', 'ibishotel.com', '<p> </span></p>\r\n\r\n<p>Featuring a restaurant and meeting facilities, Ibis Budget Jakarta Daan Mogot offers accommodations in Jakarta. Free WiFi access is available. Soekarno Hatta International Airport is a 30-minute drive away.</p>\r\n\r\n<p>Each room at Ibis Budget Jakarta Daan Mogot features a modern décor, views of the city, air conditioning and a flat-screen TV. They are all fitted with a desk and a radio. Bathroom facilities are private and include a shower. Towels, linens and toiletries are provided.</p>\r\n\r\n<p>The buffet at Ibis Budget Jakarta Daan Mogot serves an intercontinental buffet breakfast. Services offered by the hotel include a 24-hour front desk and luggage storage. Airport shuttles can be arranged for a surcharge.</p>\r\n\r\n<p>Ibis Budget Jakarta Daan Mogot is 2 km from Taman Anggrek Shopping Mall, 5.4 km from Tanah Abang Grocery & Textile Center, 5.7 km from National Museum of Indonesia and 6.3 km from National Monument Park. Gambir Train Station is 14 km away.</p>\r\n\r\n<p><span data-cke-marker="1"> </p>\r\n', '1,5,6,33,14,36,37,38,25,26,27,28,32', 1, 1, 1, 3),
(5, 1, 5, '', '', '', 'Jl. Kota Bambu Selatan no.9 , Palmerah, 11420 Jakarta, Indonesia', -6.1859699, 106.7984372, 'info@bambooinn.co.id', '021 597654729', 'www.bambooinn.co.id', '', '1,5,6,14,37,38,27,28,32', 1, 1, 1, 4),
(5, 2, 5, 'Bamboo Inn Hotel', 'Serving breakfast buffet daily', 'bamboo-inn', 'Jl. Kota Bambu Selatan no.9 , Palmerah, 11420 Jakarta, Indonesia', -6.1859699, 106.7984372, 'info@bambooinn.co.id', '021 597654729', 'www.bambooinn.co.id', '<p> </span></p>\r\n\r\n<p>All rooms in Bamboo Inn Hotel & Café come fitted with air conditioning, flat-screen cable TV and a seating area. A sofa and a dining area are available in select rooms. Equipped with free bath amenities, all en suite bathrooms provide shower facilities.</p>\r\n\r\n<p>Bamboo Inn Hotel & Café is a 5-minute walk from Central Park and Citraland Mall. It takes 15 minutes to drive to Jakarta Convention Centre and Jakarta Design Centre, while Soekarno-Hatta International Airport is reachable by a 30-minute car ride from the property.</p>\r\n\r\n<p>Luggage storage and safety deposit boxes are available at the 24-hour front desk. For guests’ travel and professional needs, the hotel has a tour desk and a business centre. Laundry, car rental and airport shuttle services are offered at an additional charge.</p>\r\n\r\n<p>Serving breakfast buffet daily, Bamboo Inn Café offers Indonesian, Asian and Western specialties. Guests can also enjoy breakfast and other meals in the comfort of their rooms.</p>\r\n\r\n<p><span data-cke-marker="1"> </p>\r\n', '1,5,6,14,37,38,27,28,32', 1, 1, 1, 4),
(5, 3, 5, '', '', '', 'Jl. Kota Bambu Selatan no.9 , Palmerah, 11420 Jakarta, Indonesia', -6.1859699, 106.7984372, 'info@bambooinn.co.id', '021 597654729', 'www.bambooinn.co.id', '', '1,5,6,14,37,38,27,28,32', 1, 1, 1, 4),
(5, 4, 5, 'Bamboo Inn Hotel', 'Serving breakfast buffet daily', 'bamboo-inn', 'Jl. Kota Bambu Selatan no.9 , Palmerah, 11420 Jakarta, Indonesia', -6.1859699, 106.7984372, 'info@bambooinn.co.id', '021 597654729', 'www.bambooinn.co.id', '<p> </span></p>\r\n\r\n<p>All rooms in Bamboo Inn Hotel & Café come fitted with air conditioning, flat-screen cable TV and a seating area. A sofa and a dining area are available in select rooms. Equipped with free bath amenities, all en suite bathrooms provide shower facilities.</p>\r\n\r\n<p>Bamboo Inn Hotel & Café is a 5-minute walk from Central Park and Citraland Mall. It takes 15 minutes to drive to Jakarta Convention Centre and Jakarta Design Centre, while Soekarno-Hatta International Airport is reachable by a 30-minute car ride from the property.</p>\r\n\r\n<p>Luggage storage and safety deposit boxes are available at the 24-hour front desk. For guests’ travel and professional needs, the hotel has a tour desk and a business centre. Laundry, car rental and airport shuttle services are offered at an additional charge.</p>\r\n\r\n<p>Serving breakfast buffet daily, Bamboo Inn Café offers Indonesian, Asian and Western specialties. Guests can also enjoy breakfast and other meals in the comfort of their rooms.</p>\r\n\r\n<p><span data-cke-marker="1"> </p>\r\n', '1,5,6,14,37,38,27,28,32', 1, 1, 1, 4),
(6, 1, 5, '', '', '', 'Jl. Terusan Jakarta Utara No.7, Bandung, Indonesia', -6.9118564, 107.6511773, '', '', '', '', '1,5,11,14,38,25,28,32', 2, 1, 1, 5),
(6, 2, 5, 'ALQUEBY Hotel', 'Pelayanan bintang 5 harga kaki lima', 'alqueby', 'Jl. Terusan Jakarta Utara No.7, Bandung, Indonesia', -6.9118564, 107.6511773, '', '', '', '<p> </span></p>\r\n\r\n<p style="box-sizing: border-box; outline: none !important; margin: 0px 0px 10px; color: rgb(51, 51, 51); font-family: arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">Terletak di jantung kota Bandung, Alqueby Hotel adalah tempat ideal untuk memulai eksplorasi di Bdg</p>\r\n\r\n<p style="box-sizing: border-box; outline: none !important; margin: 0px 0px 10px; color: rgb(51, 51, 51); font-family: arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">Terletak di jantung kota Bandung, Alqueby Hotel adalah tempat ideal untuk memulai eksplorasi di Bandung. Hanya 9 km dari hotel bintang-2 ini dapat dengan mudah diakses dari Bandara. Yang tidak ketinggalan adalah akses mudah dari hotel ke sejumlah atraksi dan markah tanah seperti Saung Angklung Mang Udjo, Pusat komputer Bandung, Bandung Supermall kota.</p>\r\n\r\n<p><span data-cke-marker="1"> </p>\r\n', '1,5,11,14,38,25,28,32', 2, 1, 1, 5),
(6, 3, 5, '', '', '', 'Jl. Terusan Jakarta Utara No.7, Bandung, Indonesia', -6.9118564, 107.6511773, '', '', '', '', '1,5,11,14,38,25,28,32', 2, 1, 1, 5),
(6, 4, 5, 'ALQUEBY Hotel', 'Pelayanan bintang 5 harga kaki lima', 'alqueby', 'Jl. Terusan Jakarta Utara No.7, Bandung, Indonesia', -6.9118564, 107.6511773, '', '', '', '<p> </span></p>\r\n\r\n<p style="box-sizing: border-box; outline: none !important; margin: 0px 0px 10px; color: rgb(51, 51, 51); font-family: arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">Terletak di jantung kota Bandung, Alqueby Hotel adalah tempat ideal untuk memulai eksplorasi di Bdg</p>\r\n\r\n<p style="box-sizing: border-box; outline: none !important; margin: 0px 0px 10px; color: rgb(51, 51, 51); font-family: arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">Terletak di jantung kota Bandung, Alqueby Hotel adalah tempat ideal untuk memulai eksplorasi di Bandung. Hanya 9 km dari hotel bintang-2 ini dapat dengan mudah diakses dari Bandara. Yang tidak ketinggalan adalah akses mudah dari hotel ke sejumlah atraksi dan markah tanah seperti Saung Angklung Mang Udjo, Pusat komputer Bandung, Bandung Supermall kota.</p>\r\n\r\n<p><span data-cke-marker="1"> </p>\r\n', '1,5,11,14,38,25,28,32', 2, 1, 1, 5),
(7, 1, 5, '', '', '', 'Jl.Sersan Bajuri No.55 Cihideung, Lembang-Bandung', -6.8151641, 107.5948087, '', '', '', '', '1,3,5,6,14,38,25,27,28,29,32', 2, 1, 1, 6),
(7, 2, 5, 'Villa Chocolate', 'Rasa nyaman kesejukan kota Bandung', 'villa-chocholate', 'Jl.Sersan Bajuri No.55 Cihideung, Lembang-Bandung', -6.8151641, 107.5948087, '', '', '', '<p> </span> <span style="color: rgb(51, 51, 51); font-family: arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">Villa Chocolate adalah hotel yang terletak di Jl. Sersan Bajuri, Parongpong, Bandung yang memiliki udara yang sejuk dengan pemandangan pegunungan. Villa Chocolate juga terletak dekat dengan Kampung Gajah, Kampung Daun, Sapulidi, Dusun Bambu, dan berbagai tempat wisata lainnya. Hotel ini merupakan tempat yang cocok untuk menyegarkan diri dari keramaian dan kebisingan kota.</span> <span data-cke-marker="1"> </p>\r\n', '1,3,5,6,14,38,25,27,28,29,32', 2, 1, 1, 6),
(7, 3, 5, '', '', '', 'Jl.Sersan Bajuri No.55 Cihideung, Lembang-Bandung', -6.8151641, 107.5948087, '', '', '', '', '1,3,5,6,14,38,25,27,28,29,32', 2, 1, 1, 6),
(7, 4, 5, 'Villa Chocolate', 'Rasa nyaman kesejukan kota Bandung', 'villa-chocholate', 'Jl.Sersan Bajuri No.55 Cihideung, Lembang-Bandung', -6.8151641, 107.5948087, '', '', '', '<p> </span> <span style="color: rgb(51, 51, 51); font-family: arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">Villa Chocolate adalah hotel yang terletak di Jl. Sersan Bajuri, Parongpong, Bandung yang memiliki udara yang sejuk dengan pemandangan pegunungan. Villa Chocolate juga terletak dekat dengan Kampung Gajah, Kampung Daun, Sapulidi, Dusun Bambu, dan berbagai tempat wisata lainnya. Hotel ini merupakan tempat yang cocok untuk menyegarkan diri dari keramaian dan kebisingan kota.</span> <span data-cke-marker="1"> </p>\r\n', '1,3,5,6,14,38,25,27,28,29,32', 2, 1, 1, 6),
(8, 1, 5, '', '', '', 'Jl. Dr. Djunjunan No.96, Pasteur, Bandung, Jawa Barat, Indonesia ', -6.8960021, 107.5886588, '', '', '', '', '1,5,11,13,37,38,25,27,28,32', 2, 1, 1, 7),
(8, 2, 5, 'Holiday Inn Pasteur', 'Best stay at Bandung', 'holiday-inn-pasteur', 'Jl. Dr. Djunjunan No.96, Pasteur, Bandung, Jawa Barat, Indonesia ', -6.8960021, 107.5886588, '', '', '', '<p> </span></p>\r\n\r\n<div class="content" itemprop="description">\r\n<p>Holiday Inn Bandung Pasteur adalah hotel kontemporer modern dengan 278 kamar luas yang nyaman</p>\r\n\r\n<p>Holiday Inn Bandung Pasteur adalah hotel kontemporer modern yang menawarkan nilai yang tak tertandingi dan berbagai macam fasilitas untuk memberikan pengalaman yang berbeda dengan lokasi hotel yang strategis tak lama setelah gerbang tol Cipularang - Purbaleunyi di Jalan Pasteur adalah pintu gerbang yang ideal ke Bandung dengan akses mudah menuju area perbelanjaan kota.</p>\r\n</div>\r\n\r\n<p><span data-cke-marker="1"> </p>\r\n', '1,5,11,13,37,38,25,27,28,32', 2, 1, 1, 7),
(8, 3, 5, '', '', '', 'Jl. Dr. Djunjunan No.96, Pasteur, Bandung, Jawa Barat, Indonesia ', -6.8960021, 107.5886588, '', '', '', '', '1,5,11,13,37,38,25,27,28,32', 2, 1, 1, 7),
(8, 4, 5, 'Holiday Inn Pasteur', 'Best stay at Bandung', 'holiday-inn-pasteur', 'Jl. Dr. Djunjunan No.96, Pasteur, Bandung, Jawa Barat, Indonesia ', -6.8960021, 107.5886588, '', '', '', '<p> </span></p>\r\n\r\n<div class="content" itemprop="description">\r\n<p>Holiday Inn Bandung Pasteur adalah hotel kontemporer modern dengan 278 kamar luas yang nyaman</p>\r\n\r\n<p>Holiday Inn Bandung Pasteur adalah hotel kontemporer modern yang menawarkan nilai yang tak tertandingi dan berbagai macam fasilitas untuk memberikan pengalaman yang berbeda dengan lokasi hotel yang strategis tak lama setelah gerbang tol Cipularang - Purbaleunyi di Jalan Pasteur adalah pintu gerbang yang ideal ke Bandung dengan akses mudah menuju area perbelanjaan kota.</p>\r\n</div>\r\n\r\n<p><span data-cke-marker="1"> </p>\r\n', '1,5,11,13,37,38,25,27,28,32', 2, 1, 1, 7),
(9, 1, 5, '', '', '', 'Jl. Moh. Toha No. 42, Bandung, Jawa Barat, Indonesia', -6.8959103, 107.5558277, '', '', '', '', '1,3,5,6,11,14,37,38,25,26,28,32', 2, 0, 1, 8),
(9, 2, 5, 'Bantal Guling Alun-alun', '', 'bantal-guling-alun-bdg', 'Jl. Moh. Toha No. 42, Bandung, Jawa Barat, Indonesia', -6.8959103, 107.5558277, '', '', '', '<p> </span></p>\r\n\r\n<div class="content" itemprop="description">\r\n<p>Sebuah guest house yang nyaman, lengkap, dan terjangkau di Bandung</p>\r\n\r\n<p>Terletak di Bandung, Bantal Guling M. Toha menyediakan pelayanan yang ramah dan fasilitas modern. Kami menjamin masa menginap yang menyenangkan bagi para tamu dengan layanan kami yang personal dan berbagai macam fasilitas modern yang tersedia. Penginapan ini cocok bagi Anda yang ingin berbisnis dan berlibur bersama keluarga, teman dan kerabat.</p>\r\n</div>\r\n\r\n<p><span data-cke-marker="1"> </p>\r\n', '1,3,5,6,11,14,37,38,25,26,28,32', 2, 0, 1, 8),
(9, 3, 5, '', '', '', 'Jl. Moh. Toha No. 42, Bandung, Jawa Barat, Indonesia', -6.8959103, 107.5558277, '', '', '', '', '1,3,5,6,11,14,37,38,25,26,28,32', 2, 0, 1, 8),
(9, 4, 5, 'Bantal Guling Alun-alun', '', 'bantal-guling-alun-bdg', 'Jl. Moh. Toha No. 42, Bandung, Jawa Barat, Indonesia', -6.8959103, 107.5558277, '', '', '', '<p> </span></p>\r\n\r\n<div class="content" itemprop="description">\r\n<p>Sebuah guest house yang nyaman, lengkap, dan terjangkau di Bandung</p>\r\n\r\n<p>Terletak di Bandung, Bantal Guling M. Toha menyediakan pelayanan yang ramah dan fasilitas modern. Kami menjamin masa menginap yang menyenangkan bagi para tamu dengan layanan kami yang personal dan berbagai macam fasilitas modern yang tersedia. Penginapan ini cocok bagi Anda yang ingin berbisnis dan berlibur bersama keluarga, teman dan kerabat.</p>\r\n</div>\r\n\r\n<p><span data-cke-marker="1"> </p>\r\n', '1,3,5,6,11,14,37,38,25,26,28,32', 2, 0, 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `pm_hotel_file`
--

DROP TABLE IF EXISTS `pm_hotel_file`;
CREATE TABLE IF NOT EXISTS `pm_hotel_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `home` int(11) DEFAULT '0',
  `checked` int(11) DEFAULT '1',
  `rank` int(11) DEFAULT '0',
  `file` varchar(250) DEFAULT NULL,
  `label` varchar(250) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  KEY `hotel_file_fkey` (`id_item`,`lang`),
  KEY `hotel_file_lang_fkey` (`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `pm_hotel_file`
--

INSERT INTO `pm_hotel_file` (`id`, `lang`, `id_item`, `home`, `checked`, `rank`, `file`, `label`, `type`) VALUES
(2, 1, 2, NULL, 1, 2, '27235649.jpg', NULL, 'image'),
(2, 2, 2, NULL, 1, 2, '27235649.jpg', NULL, 'image'),
(2, 3, 2, NULL, 1, 2, '27235649.jpg', NULL, 'image'),
(2, 4, 2, NULL, 1, 2, '27235649.jpg', NULL, 'image'),
(3, 1, 2, NULL, 1, 3, '21233997.jpg', NULL, 'image'),
(3, 2, 2, NULL, 1, 3, '21233997.jpg', NULL, 'image'),
(3, 3, 2, NULL, 1, 3, '21233997.jpg', NULL, 'image'),
(3, 4, 2, NULL, 1, 3, '21233997.jpg', NULL, 'image'),
(4, 1, 3, NULL, 1, 4, '64462900.jpg', NULL, 'image'),
(4, 2, 3, NULL, 1, 4, '64462900.jpg', NULL, 'image'),
(4, 3, 3, NULL, 1, 4, '64462900.jpg', NULL, 'image'),
(4, 4, 3, NULL, 1, 4, '64462900.jpg', NULL, 'image'),
(5, 1, 3, NULL, 1, 5, '64462896.jpg', NULL, 'image'),
(5, 2, 3, NULL, 1, 5, '64462896.jpg', NULL, 'image'),
(5, 3, 3, NULL, 1, 5, '64462896.jpg', NULL, 'image'),
(5, 4, 3, NULL, 1, 5, '64462896.jpg', NULL, 'image'),
(6, 1, 3, NULL, 1, 6, '70454994.jpg', NULL, 'image'),
(6, 2, 3, NULL, 1, 6, '70454994.jpg', NULL, 'image'),
(6, 3, 3, NULL, 1, 6, '70454994.jpg', NULL, 'image'),
(6, 4, 3, NULL, 1, 6, '70454994.jpg', NULL, 'image'),
(7, 1, 3, NULL, 1, 7, '70455015.jpg', NULL, 'image'),
(7, 2, 3, NULL, 1, 7, '70455015.jpg', NULL, 'image'),
(7, 3, 3, NULL, 1, 7, '70455015.jpg', NULL, 'image'),
(7, 4, 3, NULL, 1, 7, '70455015.jpg', NULL, 'image'),
(8, 1, 3, NULL, 1, 8, '70455044.jpg', NULL, 'image'),
(8, 2, 3, NULL, 1, 8, '70455044.jpg', NULL, 'image'),
(8, 3, 3, NULL, 1, 8, '70455044.jpg', NULL, 'image'),
(8, 4, 3, NULL, 1, 8, '70455044.jpg', NULL, 'image'),
(9, 1, 4, NULL, 1, 2, '45308298.jpg', '', 'image'),
(9, 2, 4, NULL, 1, 2, '45308298.jpg', '', 'image'),
(9, 3, 4, NULL, 1, 2, '45308298.jpg', '', 'image'),
(9, 4, 4, NULL, 1, 2, '45308298.jpg', '', 'image'),
(10, 1, 4, NULL, 1, 3, '45308314.jpg', '', 'image'),
(10, 2, 4, NULL, 1, 3, '45308314.jpg', '', 'image'),
(10, 3, 4, NULL, 1, 3, '45308314.jpg', '', 'image'),
(10, 4, 4, NULL, 1, 3, '45308314.jpg', '', 'image'),
(11, 1, 4, NULL, 1, 4, '45308315.jpg', '', 'image'),
(11, 2, 4, NULL, 1, 4, '45308315.jpg', '', 'image'),
(11, 3, 4, NULL, 1, 4, '45308315.jpg', '', 'image'),
(11, 4, 4, NULL, 1, 4, '45308315.jpg', '', 'image'),
(12, 1, 4, NULL, 1, 5, '45308312.jpg', '', 'image'),
(12, 2, 4, NULL, 1, 5, '45308312.jpg', '', 'image'),
(12, 3, 4, NULL, 1, 5, '45308312.jpg', '', 'image'),
(12, 4, 4, NULL, 1, 5, '45308312.jpg', '', 'image'),
(13, 1, 4, NULL, 1, 6, '45308394.jpg', '', 'image'),
(13, 2, 4, NULL, 1, 6, '45308394.jpg', '', 'image'),
(13, 3, 4, NULL, 1, 6, '45308394.jpg', '', 'image'),
(13, 4, 4, NULL, 1, 6, '45308394.jpg', '', 'image'),
(14, 1, 4, NULL, 1, 1, '45308386.jpg', '', 'image'),
(14, 2, 4, NULL, 1, 1, '45308386.jpg', '', 'image'),
(14, 3, 4, NULL, 1, 1, '45308386.jpg', '', 'image'),
(14, 4, 4, NULL, 1, 1, '45308386.jpg', '', 'image'),
(15, 1, 4, NULL, 1, 7, '45308261.jpg', '', 'image'),
(15, 2, 4, NULL, 1, 7, '45308261.jpg', '', 'image'),
(15, 3, 4, NULL, 1, 7, '45308261.jpg', '', 'image'),
(15, 4, 4, NULL, 1, 7, '45308261.jpg', '', 'image'),
(16, 1, 4, NULL, 1, 8, '45308342.jpg', '', 'image'),
(16, 2, 4, NULL, 1, 8, '45308342.jpg', '', 'image'),
(16, 3, 4, NULL, 1, 8, '45308342.jpg', '', 'image'),
(16, 4, 4, NULL, 1, 8, '45308342.jpg', '', 'image'),
(17, 1, 4, NULL, 1, 9, '45308313.jpg', '', 'image'),
(17, 2, 4, NULL, 1, 9, '45308313.jpg', '', 'image'),
(17, 3, 4, NULL, 1, 9, '45308313.jpg', '', 'image'),
(17, 4, 4, NULL, 1, 9, '45308313.jpg', '', 'image'),
(18, 1, 5, NULL, 1, 5, '12568584.jpg', '', 'image'),
(18, 2, 5, NULL, 1, 5, '12568584.jpg', '', 'image'),
(18, 3, 5, NULL, 1, 5, '12568584.jpg', '', 'image'),
(18, 4, 5, NULL, 1, 5, '12568584.jpg', '', 'image'),
(19, 1, 5, NULL, 1, 2, '12568570.jpg', '', 'image'),
(19, 2, 5, NULL, 1, 2, '12568570.jpg', '', 'image'),
(19, 3, 5, NULL, 1, 2, '12568570.jpg', '', 'image'),
(19, 4, 5, NULL, 1, 2, '12568570.jpg', '', 'image'),
(20, 1, 5, NULL, 1, 6, '12568547.jpg', '', 'image'),
(20, 2, 5, NULL, 1, 6, '12568547.jpg', '', 'image'),
(20, 3, 5, NULL, 1, 6, '12568547.jpg', '', 'image'),
(20, 4, 5, NULL, 1, 6, '12568547.jpg', '', 'image'),
(21, 1, 5, NULL, 1, 7, '12568578.jpg', '', 'image'),
(21, 2, 5, NULL, 1, 7, '12568578.jpg', '', 'image'),
(21, 3, 5, NULL, 1, 7, '12568578.jpg', '', 'image'),
(21, 4, 5, NULL, 1, 7, '12568578.jpg', '', 'image'),
(22, 1, 5, NULL, 1, 8, '12568546.jpg', '', 'image'),
(22, 2, 5, NULL, 1, 8, '12568546.jpg', '', 'image'),
(22, 3, 5, NULL, 1, 8, '12568546.jpg', '', 'image'),
(22, 4, 5, NULL, 1, 8, '12568546.jpg', '', 'image'),
(23, 1, 5, NULL, 1, 3, '12568577.jpg', '', 'image'),
(23, 2, 5, NULL, 1, 3, '12568577.jpg', '', 'image'),
(23, 3, 5, NULL, 1, 3, '12568577.jpg', '', 'image'),
(23, 4, 5, NULL, 1, 3, '12568577.jpg', '', 'image'),
(24, 1, 5, NULL, 1, 9, '19394335.jpg', '', 'image'),
(24, 2, 5, NULL, 1, 9, '19394335.jpg', '', 'image'),
(24, 3, 5, NULL, 1, 9, '19394335.jpg', '', 'image'),
(24, 4, 5, NULL, 1, 9, '19394335.jpg', '', 'image'),
(25, 1, 5, NULL, 1, 4, '12568576.jpg', '', 'image'),
(25, 2, 5, NULL, 1, 4, '12568576.jpg', '', 'image'),
(25, 3, 5, NULL, 1, 4, '12568576.jpg', '', 'image'),
(25, 4, 5, NULL, 1, 4, '12568576.jpg', '', 'image'),
(26, 1, 6, NULL, 1, 18, 'y969606024.jpg', NULL, 'image'),
(26, 2, 6, NULL, 1, 18, 'y969606024.jpg', NULL, 'image'),
(26, 3, 6, NULL, 1, 18, 'y969606024.jpg', NULL, 'image'),
(26, 4, 6, NULL, 1, 18, 'y969606024.jpg', NULL, 'image'),
(27, 1, 6, NULL, 1, 19, 'y969606038.jpg', NULL, 'image'),
(27, 2, 6, NULL, 1, 19, 'y969606038.jpg', NULL, 'image'),
(27, 3, 6, NULL, 1, 19, 'y969606038.jpg', NULL, 'image'),
(27, 4, 6, NULL, 1, 19, 'y969606038.jpg', NULL, 'image'),
(28, 1, 6, NULL, 1, 20, 'y969606018.jpg', NULL, 'image'),
(28, 2, 6, NULL, 1, 20, 'y969606018.jpg', NULL, 'image'),
(28, 3, 6, NULL, 1, 20, 'y969606018.jpg', NULL, 'image'),
(28, 4, 6, NULL, 1, 20, 'y969606018.jpg', NULL, 'image'),
(29, 1, 6, NULL, 1, 21, 'y969606030.jpg', NULL, 'image'),
(29, 2, 6, NULL, 1, 21, 'y969606030.jpg', NULL, 'image'),
(29, 3, 6, NULL, 1, 21, 'y969606030.jpg', NULL, 'image'),
(29, 4, 6, NULL, 1, 21, 'y969606030.jpg', NULL, 'image'),
(30, 1, 6, NULL, 1, 22, 'y969606016.jpg', NULL, 'image'),
(30, 2, 6, NULL, 1, 22, 'y969606016.jpg', NULL, 'image'),
(30, 3, 6, NULL, 1, 22, 'y969606016.jpg', NULL, 'image'),
(30, 4, 6, NULL, 1, 22, 'y969606016.jpg', NULL, 'image'),
(31, 1, 6, NULL, 1, 23, 'y969606025.jpg', NULL, 'image'),
(31, 2, 6, NULL, 1, 23, 'y969606025.jpg', NULL, 'image'),
(31, 3, 6, NULL, 1, 23, 'y969606025.jpg', NULL, 'image'),
(31, 4, 6, NULL, 1, 23, 'y969606025.jpg', NULL, 'image'),
(32, 1, 6, NULL, 1, 24, 'y969606015.jpg', NULL, 'image'),
(32, 2, 6, NULL, 1, 24, 'y969606015.jpg', NULL, 'image'),
(32, 3, 6, NULL, 1, 24, 'y969606015.jpg', NULL, 'image'),
(32, 4, 6, NULL, 1, 24, 'y969606015.jpg', NULL, 'image'),
(33, 1, 6, NULL, 1, 25, 'y969606039.jpg', NULL, 'image'),
(33, 2, 6, NULL, 1, 25, 'y969606039.jpg', NULL, 'image'),
(33, 3, 6, NULL, 1, 25, 'y969606039.jpg', NULL, 'image'),
(33, 4, 6, NULL, 1, 25, 'y969606039.jpg', NULL, 'image'),
(34, 1, 7, NULL, 1, 26, 'y990522030.jpg', NULL, 'image'),
(34, 2, 7, NULL, 1, 26, 'y990522030.jpg', NULL, 'image'),
(34, 3, 7, NULL, 1, 26, 'y990522030.jpg', NULL, 'image'),
(34, 4, 7, NULL, 1, 26, 'y990522030.jpg', NULL, 'image'),
(35, 1, 7, NULL, 1, 27, 'y990522032.jpg', NULL, 'image'),
(35, 2, 7, NULL, 1, 27, 'y990522032.jpg', NULL, 'image'),
(35, 3, 7, NULL, 1, 27, 'y990522032.jpg', NULL, 'image'),
(35, 4, 7, NULL, 1, 27, 'y990522032.jpg', NULL, 'image'),
(36, 1, 7, NULL, 1, 28, 'y990522001.jpg', NULL, 'image'),
(36, 2, 7, NULL, 1, 28, 'y990522001.jpg', NULL, 'image'),
(36, 3, 7, NULL, 1, 28, 'y990522001.jpg', NULL, 'image'),
(36, 4, 7, NULL, 1, 28, 'y990522001.jpg', NULL, 'image'),
(37, 1, 7, NULL, 1, 29, 'y990522005.jpg', NULL, 'image'),
(37, 2, 7, NULL, 1, 29, 'y990522005.jpg', NULL, 'image'),
(37, 3, 7, NULL, 1, 29, 'y990522005.jpg', NULL, 'image'),
(37, 4, 7, NULL, 1, 29, 'y990522005.jpg', NULL, 'image'),
(38, 1, 7, NULL, 1, 30, 'y990522011.jpg', NULL, 'image'),
(38, 2, 7, NULL, 1, 30, 'y990522011.jpg', NULL, 'image'),
(38, 3, 7, NULL, 1, 30, 'y990522011.jpg', NULL, 'image'),
(38, 4, 7, NULL, 1, 30, 'y990522011.jpg', NULL, 'image'),
(39, 1, 7, NULL, 1, 31, 'y990522035.jpg', NULL, 'image'),
(39, 2, 7, NULL, 1, 31, 'y990522035.jpg', NULL, 'image'),
(39, 3, 7, NULL, 1, 31, 'y990522035.jpg', NULL, 'image'),
(39, 4, 7, NULL, 1, 31, 'y990522035.jpg', NULL, 'image'),
(40, 1, 8, NULL, 1, 2, 'y979038002.jpg', '', 'image'),
(40, 2, 8, NULL, 1, 2, 'y979038002.jpg', '', 'image'),
(40, 3, 8, NULL, 1, 2, 'y979038002.jpg', '', 'image'),
(40, 4, 8, NULL, 1, 2, 'y979038002.jpg', '', 'image'),
(41, 1, 8, NULL, 1, 1, 'y979038021.jpg', '', 'image'),
(41, 2, 8, NULL, 1, 1, 'y979038021.jpg', '', 'image'),
(41, 3, 8, NULL, 1, 1, 'y979038021.jpg', '', 'image'),
(41, 4, 8, NULL, 1, 1, 'y979038021.jpg', '', 'image'),
(42, 1, 8, NULL, 1, 3, 'y979038024.jpg', '', 'image'),
(42, 2, 8, NULL, 1, 3, 'y979038024.jpg', '', 'image'),
(42, 3, 8, NULL, 1, 3, 'y979038024.jpg', '', 'image'),
(42, 4, 8, NULL, 1, 3, 'y979038024.jpg', '', 'image'),
(43, 1, 8, NULL, 1, 4, 'y979038007.jpg', '', 'image'),
(43, 2, 8, NULL, 1, 4, 'y979038007.jpg', '', 'image'),
(43, 3, 8, NULL, 1, 4, 'y979038007.jpg', '', 'image'),
(43, 4, 8, NULL, 1, 4, 'y979038007.jpg', '', 'image'),
(44, 1, 9, NULL, 1, 2, 'y955840010.jpg', '', 'image'),
(44, 2, 9, NULL, 1, 2, 'y955840010.jpg', '', 'image'),
(44, 3, 9, NULL, 1, 2, 'y955840010.jpg', '', 'image'),
(44, 4, 9, NULL, 1, 2, 'y955840010.jpg', '', 'image'),
(45, 1, 9, NULL, 1, 1, 'y955840012.jpg', '', 'image'),
(45, 2, 9, NULL, 1, 1, 'y955840012.jpg', '', 'image'),
(45, 3, 9, NULL, 1, 1, 'y955840012.jpg', '', 'image'),
(45, 4, 9, NULL, 1, 1, 'y955840012.jpg', '', 'image'),
(46, 1, 9, NULL, 1, 3, 'y955840013.jpg', '', 'image'),
(46, 2, 9, NULL, 1, 3, 'y955840013.jpg', '', 'image'),
(46, 3, 9, NULL, 1, 3, 'y955840013.jpg', '', 'image'),
(46, 4, 9, NULL, 1, 3, 'y955840013.jpg', '', 'image'),
(47, 1, 9, NULL, 1, 4, 'y955840002.jpg', '', 'image'),
(47, 2, 9, NULL, 1, 4, 'y955840002.jpg', '', 'image'),
(47, 3, 9, NULL, 1, 4, 'y955840002.jpg', '', 'image'),
(47, 4, 9, NULL, 1, 4, 'y955840002.jpg', '', 'image'),
(48, 1, 9, NULL, 1, 5, 'y955840004.jpg', '', 'image'),
(48, 2, 9, NULL, 1, 5, 'y955840004.jpg', '', 'image'),
(48, 3, 9, NULL, 1, 5, 'y955840004.jpg', '', 'image'),
(48, 4, 9, NULL, 1, 5, 'y955840004.jpg', '', 'image'),
(49, 1, 9, NULL, 1, 6, 'y955840005.jpg', '', 'image'),
(49, 2, 9, NULL, 1, 6, 'y955840005.jpg', '', 'image'),
(49, 3, 9, NULL, 1, 6, 'y955840005.jpg', '', 'image'),
(49, 4, 9, NULL, 1, 6, 'y955840005.jpg', '', 'image'),
(50, 1, 5, NULL, 1, 1, '70454994.jpg', '', 'image'),
(50, 2, 5, NULL, 1, 1, '70454994.jpg', '', 'image'),
(50, 3, 5, NULL, 1, 1, '70454994.jpg', '', 'image'),
(50, 4, 5, NULL, 1, 1, '70454994.jpg', '', 'image');

-- --------------------------------------------------------

--
-- Table structure for table `pm_lang`
--

DROP TABLE IF EXISTS `pm_lang`;
CREATE TABLE IF NOT EXISTS `pm_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) DEFAULT NULL,
  `locale` varchar(20) DEFAULT NULL,
  `main` int(11) DEFAULT '0',
  `checked` int(11) DEFAULT '0',
  `rank` int(11) DEFAULT '0',
  `tag` varchar(20) DEFAULT NULL,
  `rtl` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `pm_lang`
--

INSERT INTO `pm_lang` (`id`, `title`, `locale`, `main`, `checked`, `rank`, `tag`, `rtl`) VALUES
(1, 'Français', 'fr_FR', 0, 1, 2, 'fr', 0),
(2, 'English', 'en_GB', 1, 1, 1, 'en', 0),
(3, 'عربي', 'ar_MA', 0, 1, 3, 'ar', 1),
(4, 'Indonesia', 'ID', NULL, 0, 4, 'ID', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pm_lang_file`
--

DROP TABLE IF EXISTS `pm_lang_file`;
CREATE TABLE IF NOT EXISTS `pm_lang_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_item` int(11) NOT NULL,
  `home` int(11) DEFAULT '0',
  `checked` int(11) DEFAULT '1',
  `rank` int(11) DEFAULT '0',
  `file` varchar(250) DEFAULT NULL,
  `label` varchar(250) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lang_file_fkey` (`id_item`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `pm_lang_file`
--

INSERT INTO `pm_lang_file` (`id`, `id_item`, `home`, `checked`, `rank`, `file`, `label`, `type`) VALUES
(1, 1, 0, 1, 2, 'fr.png', '', 'image'),
(2, 2, 0, 1, 1, 'gb.png', '', 'image'),
(3, 3, 0, 1, 3, 'ar.png', '', 'image');

-- --------------------------------------------------------

--
-- Table structure for table `pm_location`
--

DROP TABLE IF EXISTS `pm_location`;
CREATE TABLE IF NOT EXISTS `pm_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `checked` int(11) DEFAULT '0',
  `pages` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `pm_location`
--

INSERT INTO `pm_location` (`id`, `name`, `address`, `lat`, `lng`, `checked`, `pages`) VALUES
(2, 'Jakarta', 'Jakarta, Indonesia', -6.229385, 106.6890863, 1, '17,2'),
(3, 'Bandung', 'Bandung , Jawa Barat', -6.9032739, 107.5729449, 1, '18'),
(4, 'Bali', 'Bali , Indonesia', -8.6726769, 115.1542217, 1, '19'),
(5, 'Yogyakarta', 'DI Yogyakarta', -7.803249, 110.3398252, 1, '20'),
(6, 'Bogor', 'Bogor, Indonesia', -6.5951886, 106.7218509, 1, '21'),
(7, 'Surabaya', 'Surabaya, Indonesia', -7.2756368, 112.6416433, 1, '22'),
(8, 'Makassar', 'Makassar, Indonesia', -5.1397987, 119.3912289, 1, '23'),
(9, 'Solo', 'Surakarta, Indonesia', -7.5592076, 110.7837924, 1, '24'),
(10, 'Semarang', 'Semarang, Jawa Tengah', -7.0247703, 110.3488072, 1, '25'),
(11, 'Medan', 'Medan, Indonesia', 3.6422756, 98.5294048, 1, '26');

-- --------------------------------------------------------

--
-- Table structure for table `pm_media`
--

DROP TABLE IF EXISTS `pm_media`;
CREATE TABLE IF NOT EXISTS `pm_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pm_media_file`
--

DROP TABLE IF EXISTS `pm_media_file`;
CREATE TABLE IF NOT EXISTS `pm_media_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_item` int(11) NOT NULL,
  `home` int(11) DEFAULT '0',
  `checked` int(11) DEFAULT '1',
  `rank` int(11) DEFAULT '0',
  `file` varchar(250) DEFAULT NULL,
  `label` varchar(250) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_file_fkey` (`id_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pm_message`
--

DROP TABLE IF EXISTS `pm_message`;
CREATE TABLE IF NOT EXISTS `pm_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_date` int(11) DEFAULT NULL,
  `edit_date` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` longtext,
  `phone` varchar(100) DEFAULT NULL,
  `subject` varchar(250) DEFAULT NULL,
  `msg` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pm_page`
--

DROP TABLE IF EXISTS `pm_page`;
CREATE TABLE IF NOT EXISTS `pm_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `subtitle` varchar(250) DEFAULT NULL,
  `title_tag` varchar(250) DEFAULT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `descr` longtext,
  `robots` varchar(20) DEFAULT NULL,
  `keywords` varchar(250) DEFAULT NULL,
  `intro` longtext,
  `text` longtext,
  `text2` longtext,
  `id_parent` int(11) DEFAULT NULL,
  `page_model` varchar(50) DEFAULT NULL,
  `article_model` varchar(50) DEFAULT NULL,
  `main` int(11) DEFAULT '1',
  `footer` int(11) DEFAULT '0',
  `home` int(11) DEFAULT '0',
  `checked` int(11) DEFAULT '0',
  `rank` int(11) DEFAULT '0',
  `add_date` int(11) DEFAULT NULL,
  `edit_date` int(11) DEFAULT NULL,
  `comment` int(11) DEFAULT '0',
  `rating` int(11) DEFAULT '0',
  `system` int(11) DEFAULT '0',
  PRIMARY KEY (`id`,`lang`),
  KEY `page_lang_fkey` (`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `pm_page`
--

INSERT INTO `pm_page` (`id`, `lang`, `name`, `title`, `subtitle`, `title_tag`, `alias`, `descr`, `robots`, `keywords`, `intro`, `text`, `text2`, `id_parent`, `page_model`, `article_model`, `main`, `footer`, `home`, `checked`, `rank`, `add_date`, `edit_date`, `comment`, `rating`, `system`) VALUES
(1, 1, 'Accueil', 'Lorem ipsum dolor sit amet', 'Consectetur adipiscing elit', 'Accueil', '', '', 'index,follow', '', '', '', '', NULL, 'home', '', 1, 0, 1, 1, 1, 1486145284, 1487001019, 0, 0, 0),
(1, 2, 'Home', 'Eat, Sleep & Fun', '', 'Eat, Sleep & Fun', '', '', 'index,follow', '', '', '<blockquote>\r\n<p style="text-align: center;">Find a Pleasure to travel Indonesia</span></p>\r\n</blockquote>\r\n', '', NULL, 'home', '', 1, 0, 1, 1, 1, 1486145284, 1487001019, 0, 0, 0),
(1, 3, 'ترحيب', 'هو سقطت الساحلية ذات, أن.', 'غير بمعارضة وهولندا، الإقتصادية قد, فقد الفرنسي المعاهدات قد من.', 'ترحيب', '', '', 'index,follow', '', '', '', '', NULL, 'home', '', 1, 0, 1, 1, 1, 1486145284, 1487001019, 0, 0, 0),
(1, 4, 'Home', 'Eat, Sleep & Fun', '', 'Eat, Sleep & Fun', '', '', 'index,follow', '', '', '<blockquote>\r\n<p style="text-align: center;">Find a Pleasure to travel Indonesia</span></p>\r\n</blockquote>\r\n', '', NULL, 'home', '', 1, 0, 1, 1, 1, 1486145284, 1487001019, 0, 0, 0),
(2, 1, 'Contact', 'Contact', '', 'Contact', 'contact', '', 'index,follow', '', '', '', '', NULL, 'contact', '', 0, 1, 0, 1, 11, 1486145284, 1486184566, 0, 0, 0),
(2, 2, 'Contact', 'Contact', '', 'Contact', 'contact', '', 'index,follow', '', '', '', '', NULL, 'contact', '', 0, 1, 0, 1, 11, 1486145284, 1486184566, 0, 0, 0),
(2, 3, 'جهة الاتصال', 'جهة الاتصال', '', 'جهة الاتصال', 'contact', '', 'index,follow', '', '', '', '', NULL, 'contact', '', 0, 1, 0, 1, 11, 1486145284, 1486184566, 0, 0, 0),
(2, 4, 'Contact', 'Contact', '', 'Contact', 'contact', '', 'index,follow', '', '', '', '', NULL, 'contact', '', 0, 1, 0, 1, 11, 1486145284, 1486184566, 0, 0, 0),
(3, 1, 'Mentions légales', 'Mentions légales', '', 'Mentions légales', 'mentions-legales', '', 'index,follow', '', '', '', '', NULL, 'page', '', 0, 1, 0, 1, 12, 1486145284, 1486145284, 0, 0, 0),
(3, 2, 'Legal notices', 'Legal notices', '', 'Legal notices', 'legal-notices', '', 'index,follow', '', '', '', '', NULL, 'page', '', 0, 1, 0, 1, 12, 1486145284, 1486145284, 0, 0, 0),
(3, 3, 'يذكر القانونية', 'يذكر القانونية', '', 'يذكر القانونية', 'legal-notices', '', 'index,follow', '', '', '', '', NULL, 'page', '', 0, 1, 0, 1, 12, 1486145284, 1486145284, 0, 0, 0),
(3, 4, 'Legal notices', 'Legal notices', '', 'Legal notices', 'legal-notices', '', 'index,follow', '', '', '', '', NULL, 'page', '', 0, 1, 0, 1, 12, 1486145284, 1486145284, 0, 0, 0),
(4, 1, 'Plan du site', 'Plan du site', '', 'Plan du site', 'plan-site', '', 'index,follow', '', '', '', '', NULL, 'sitemap', '', 0, 1, 0, 1, 13, 1486145284, 1486145284, 0, 0, 0),
(4, 2, 'Sitemap', 'Sitemap', '', 'Sitemap', 'sitemap', '', 'index,follow', '', '', '', '', NULL, 'sitemap', '', 0, 1, 0, 1, 13, 1486145284, 1486145284, 0, 0, 0),
(4, 3, 'خريطة الموقع', 'خريطة الموقع', '', 'خريطة الموقع', 'sitemap', '', 'index,follow', '', '', '', '', NULL, 'sitemap', '', 0, 1, 0, 1, 13, 1486145284, 1486145284, 0, 0, 0),
(4, 4, 'Sitemap', 'Sitemap', '', 'Sitemap', 'sitemap', '', 'index,follow', '', '', '', '', NULL, 'sitemap', '', 0, 1, 0, 1, 13, 1486145284, 1486145284, 0, 0, 0),
(5, 1, 'Qui sommes-nous ?', 'Qui sommes-nous ?', '', 'Qui sommes-nous ?', 'qui-sommes-nous', '', 'index,follow', '', '', '', '', NULL, 'page', '', 0, 1, 0, 1, 2, 1486145284, 1486999857, 0, 0, 0),
(5, 2, 'About Us', 'About Us', '', 'About us', 'about-us', '', 'index,follow', '', '', '<p>Pashotel adalah situs penyedia layanan pemesanan kamar dan tempat tinggal yang tersebar diseluruh kota-kota besar di Indonesia dengan harga murah. Temukan kemudahan dan layanan serta fasilitas yang lengkap disetiap tempat yang Anda singgahi.</p>\r\n', '<p>Pashotel adalah situs penyedia layanan pemesanan kamar dan tempat tinggal yang tersebar diseluruh kota-kota besar di Indonesia dengan harga murah. Temukan kemudahan dan layanan serta fasilitas yang lengkap disetiap tempat yang Anda singgahi.</p>\r\n', NULL, 'page', '', 0, 1, 0, 1, 2, 1486145284, 1486999857, 0, 0, 0),
(5, 3, 'معلومات عنا', 'معلومات عنا', '', 'معلومات عنا', 'about-us', '', 'index,follow', '', '', '', '', NULL, 'page', '', 0, 1, 0, 1, 2, 1486145284, 1486999857, 0, 0, 0),
(5, 4, 'About Us', 'About Us', '', 'About us', 'about-us', '', 'index,follow', '', '', '<p>Pashotel adalah situs penyedia layanan pemesanan kamar dan tempat tinggal yang tersebar diseluruh kota-kota besar di Indonesia dengan harga murah. Temukan kemudahan dan layanan serta fasilitas yang lengkap disetiap tempat yang Anda singgahi.</p>\r\n', '<p>Pashotel adalah situs penyedia layanan pemesanan kamar dan tempat tinggal yang tersebar diseluruh kota-kota besar di Indonesia dengan harga murah. Temukan kemudahan dan layanan serta fasilitas yang lengkap disetiap tempat yang Anda singgahi.</p>\r\n', NULL, 'page', '', 0, 1, 0, 1, 2, 1486145284, 1486999857, 0, 0, 0),
(6, 1, 'Recherche', 'Recherche', '', 'Recherche', 'search', '', 'noindex,nofollow', '', '', '', '', NULL, 'search', '', 0, 0, 0, 2, 14, 1486145284, 1486145284, 0, 0, 1),
(6, 2, 'Search', 'Search', '', 'Search', 'search', '', 'noindex,nofollow', '', '', '', '', NULL, 'search', '', 0, 0, 0, 2, 14, 1486145284, 1486145284, 0, 0, 1),
(6, 3, 'بحث', 'بحث', '', 'بحث', 'search', '', 'noindex,nofollow', '', '', '', '', NULL, 'search', '', 0, 0, 0, 2, 14, 1486145284, 1486145284, 0, 0, 1),
(6, 4, 'Search', 'Search', '', 'Search', 'search', '', 'noindex,nofollow', '', '', '', '', NULL, 'search', '', 0, 0, 0, 2, 14, 1486145284, 1486145284, 0, 0, 1),
(7, 1, 'Galerie', 'Galerie', '', 'Galerie', 'galerie', '', 'index,follow', '', '', '', '', NULL, 'page', 'gallery', 0, 0, 0, 1, 5, 1486145284, 1487261869, 0, 0, 0),
(7, 2, 'Gallery', 'Gallery', '', 'Gallery', 'gallery', '', 'index,follow', '', '', '', '', NULL, 'page', 'gallery', 0, 0, 0, 1, 5, 1486145284, 1487261869, 0, 0, 0),
(7, 3, 'صور معرض', 'صور معرض', '', 'صور معرض', 'gallery', '', 'index,follow', '', '', '', '', NULL, 'page', 'gallery', 0, 0, 0, 1, 5, 1486145284, 1487261869, 0, 0, 0),
(7, 4, 'Gallery', 'Gallery', '', 'Gallery', 'gallery', '', 'index,follow', '', '', '', '', NULL, 'page', 'gallery', 0, 0, 0, 1, 5, 1486145284, 1487261869, 0, 0, 0),
(8, 1, '404', 'Erreur 404 : Page introuvable !', '', '404 Page introuvable', '404', '', 'noindex,nofollow', '', '', '<p>L''URL demandée n''a pas été trouvée sur ce serveur.<br />\r\nLa page que vous voulez afficher n''existe pas, ou est temporairement indisponible.</p>\r\n\r\n<p>Merci d''essayer les actions suivantes :</p>\r\n\r\n<ul>\r\n	<li>Assurez-vous que l''URL dans la barre d''adresse de votre navigateur est correctement orthographiée et formatée.</li>\r\n	<li>Si vous avez atteint cette page en cliquant sur un lien ou si vous pensez que cela concerne une erreur du serveur, contactez l''administrateur pour l''alerter.</li>\r\n</ul>\r\n', '', NULL, '404', '', 0, 0, 0, 1, 15, 1486145284, 1486145284, 0, 0, 1),
(8, 2, '404', '404 Error: Page not found!', '', '404 Not Found', '404', '', 'noindex,nofollow', '', '', '<p>The wanted URL was not found on this server.<br />\r\nThe page you wish to display does not exist, or is temporarily unavailable.</p>\r\n\r\n<p>Thank you for trying the following actions :</p>\r\n\r\n<ul>\r\n	<li>Be sure the URL in the address bar of your browser is correctly spelt and formated.</li>\r\n	<li>If you reached this page by clicking a link or if you think that it is about an error of the server, contact the administrator to alert him.</li>\r\n</ul>\r\n', '', NULL, '404', '', 0, 0, 0, 1, 15, 1486145284, 1486145284, 0, 0, 1),
(8, 3, '404', '404 Error: Page not found!', '', '404 Not Found', '404', '', 'noindex,nofollow', '', '', '', '', NULL, '404', '', 0, 0, 0, 1, 15, 1486145284, 1486145284, 0, 0, 1),
(8, 4, '404', '404 Error: Page not found!', '', '404 Not Found', '404', '', 'noindex,nofollow', '', '', '<p>The wanted URL was not found on this server.<br />\r\nThe page you wish to display does not exist, or is temporarily unavailable.</p>\r\n\r\n<p>Thank you for trying the following actions :</p>\r\n\r\n<ul>\r\n	<li>Be sure the URL in the address bar of your browser is correctly spelt and formated.</li>\r\n	<li>If you reached this page by clicking a link or if you think that it is about an error of the server, contact the administrator to alert him.</li>\r\n</ul>\r\n', '', NULL, '404', '', 0, 0, 0, 1, 15, 1486145284, 1486145284, 0, 0, 1),
(9, 1, 'Hôtels', 'Hôtels', '', 'Hôtels', 'hotels', '', 'index,follow', '', '', '', '', NULL, 'hotels', 'hotel', 1, 0, 0, 1, 3, 1486145284, 1488482864, 0, 0, 1),
(9, 2, 'Hotels', 'Our Partner Hotel', '', 'Hotels', 'hotels', '', 'index,follow', '', '', '', '', NULL, 'hotels', 'hotel', 1, 0, 0, 1, 3, 1486145284, 1488482864, 0, 0, 1),
(9, 3, 'الفنادق', 'الفنادق', '', 'الفنادق', 'hotels', '', 'index,follow', '', '', '', '', NULL, 'hotels', 'hotel', 1, 0, 0, 1, 3, 1486145284, 1488482864, 0, 0, 1),
(9, 4, 'Hotels', 'Our Partner Hotel', '', 'Hotels', 'hotels', '', 'index,follow', '', '', '', '', NULL, 'hotels', 'hotel', 0, 0, 0, 1, 3, 1486145284, 1487267053, 0, 0, 1),
(10, 1, 'Réserver', 'Réserver', '', 'Réserver', 'reserver', '', 'noindex,nofollow', '', '', '', '', NULL, 'booking', 'gallery', 0, 0, 0, 1, 6, 1486145284, 1488482837, 0, 0, 1),
(10, 2, 'Booking', 'Booking', '', 'Booking', 'booking', '', 'noindex,nofollow', '', '', '', '', NULL, 'booking', 'gallery', 0, 0, 0, 1, 6, 1486145284, 1488482837, 0, 0, 1),
(10, 3, 'الحجز', 'الحجز', '', 'الحجز', 'booking', '', 'noindex,nofollow', '', '', '', '', NULL, 'booking', 'gallery', 0, 0, 0, 1, 6, 1486145284, 1488482837, 0, 0, 1),
(10, 4, 'Booking', 'Booking', '', 'Booking', 'booking', '', 'noindex,nofollow', '', '', '', '', NULL, 'booking', 'gallery', 1, 0, 0, 1, 6, 1486145284, 1486657299, 0, 0, 1),
(11, 1, 'Coordonnées', 'Coordonnées', '', 'Coordonnées', 'coordonnees', '', 'noindex,nofollow', '', '', '', '', 10, 'details', '', 0, 0, 0, 1, 8, 1486145284, 1486145284, 0, 0, 1),
(11, 2, 'Details', 'Booking details', '', 'Booking details', 'booking-details', '', 'noindex,nofollow', '', '', '', '', 10, 'details', '', 0, 0, 0, 1, 8, 1486145284, 1486145284, 0, 0, 1),
(11, 3, 'تفاصيل الحجز', 'تفاصيل الحجز', '', 'تفاصيل الحجز', 'booking-details', '', 'noindex,nofollow', '', '', '', '', 10, 'details', '', 0, 0, 0, 1, 8, 1486145284, 1486145284, 0, 0, 1),
(11, 4, 'Details', 'Booking details', '', 'Booking details', 'booking-details', '', 'noindex,nofollow', '', '', '', '', 10, 'details', '', 0, 0, 0, 1, 8, 1486145284, 1486145284, 0, 0, 1),
(12, 1, 'Paiement', 'Paiement', '', 'Paiement', 'paiement', '', 'noindex,nofollow', '', '', '', '', 13, 'payment', '', 0, 0, 0, 1, 10, 1486145284, 1486145284, 0, 0, 1),
(12, 2, 'Payment', 'Payment', '', 'Payment', 'payment', '', 'noindex,nofollow', '', '', '', '', 13, 'payment', '', 0, 0, 0, 1, 10, 1486145284, 1486145284, 0, 0, 1),
(12, 3, 'دفع', 'دفع', '', 'دفع', 'payment', '', 'noindex,nofollow', '', '', '', '', 13, 'payment', '', 0, 0, 0, 1, 10, 1486145284, 1486145284, 0, 0, 1),
(12, 4, 'Payment', 'Payment', '', 'Payment', 'payment', '', 'noindex,nofollow', '', '', '', '', 13, 'payment', '', 0, 0, 0, 1, 10, 1486145284, 1486145284, 0, 0, 1),
(13, 1, 'Résumé de la réservation', 'Résumé de la réservation', '', 'Résumé de la réservation', 'resume-reservation', '', 'noindex,nofollow', '', '', '', '', 11, 'summary', '', 0, 0, 0, 1, 9, 1486145284, 1486145284, 0, 0, 1),
(13, 2, 'Summary', 'Booking summary', '', 'Booking summary', 'booking-summary', '', 'noindex,nofollow', '', '', '', '', 11, 'summary', '', 0, 0, 0, 1, 9, 1486145284, 1486145284, 0, 0, 1),
(13, 3, 'ملخص الحجز', 'ملخص الحجز', '', 'ملخص الحجز', 'booking-summary', '', 'noindex,nofollow', '', '', '', '', 11, 'summary', '', 0, 0, 0, 1, 9, 1486145284, 1486145284, 0, 0, 1),
(13, 4, 'Summary', 'Booking summary', '', 'Booking summary', 'booking-summary', '', 'noindex,nofollow', '', '', '', '', 11, 'summary', '', 0, 0, 0, 1, 9, 1486145284, 1486145284, 0, 0, 1),
(14, 1, 'Espace client', 'Espace client', '', 'Espace client', 'espace-client', '', 'noindex,nofollow', '', '', '', '', NULL, 'account', '', 0, 0, 0, 1, 16, 1486145284, 1486145284, 0, 0, 1),
(14, 2, 'Account', 'Account', '', 'Account', 'account', '', 'noindex,nofollow', '', '', '', '', NULL, 'account', '', 0, 0, 0, 1, 16, 1486145284, 1486145284, 0, 0, 1),
(14, 3, 'Account', 'Account', '', 'Account', 'account', '', 'noindex,nofollow', '', '', '', '', NULL, 'account', '', 0, 0, 0, 1, 16, 1486145284, 1486145284, 0, 0, 1),
(14, 4, 'Account', 'Account', '', 'Account', 'account', '', 'noindex,nofollow', '', '', '', '', NULL, 'account', '', 0, 0, 0, 1, 16, 1486145284, 1486145284, 0, 0, 1),
(15, 1, 'Activités', 'Activités', '', 'Activités', 'reservation-activitees', '', 'noindex,nofollow', '', '', '', '', 10, 'booking-activities', '', 1, 0, 0, 1, 7, 1486145284, 1486145284, 0, 0, 1),
(15, 2, 'Activities', 'Activities', '', 'Activities', 'booking-activities', '', 'noindex,nofollow', '', '', '', '', 10, 'booking-activities', '', 1, 0, 0, 1, 7, 1486145284, 1486145284, 0, 0, 1),
(15, 3, 'Activities', 'Activities', '', 'Activities', 'booking-activities', '', 'noindex,nofollow', '', '', '', '', 10, 'booking-activities', '', 1, 0, 0, 1, 7, 1486145284, 1486145284, 0, 0, 1),
(15, 4, 'Activities', 'Activities', '', 'Activities', 'booking-activities', '', 'noindex,nofollow', '', '', '', '', 10, 'booking-activities', '', 1, 0, 0, 1, 7, 1486145284, 1486145284, 0, 0, 1),
(16, 1, 'Activités', 'Activités', '', 'Activités', 'activitees', '', 'noindex,nofollow', '', '', '', '', NULL, 'activities', 'activity', 0, 0, 0, 1, 4, 1486145284, 1486184542, 0, 0, 1),
(16, 2, 'Activities', 'Activities', '', 'Activities', 'activities', '', 'noindex,nofollow', '', '', '', '', NULL, 'activities', 'activity', 0, 0, 0, 1, 4, 1486145284, 1486184542, 0, 0, 1),
(16, 3, 'Activities', 'Activities', '', 'Activities', 'activities', '', 'noindex,nofollow', '', '', '', '', NULL, 'activities', 'activity', 0, 0, 0, 1, 4, 1486145284, 1486184542, 0, 0, 1),
(16, 4, 'Activities', 'Activities', '', 'Activities', 'activities', '', 'noindex,nofollow', '', '', '', '', NULL, 'activities', 'activity', 0, 0, 0, 1, 4, 1486145284, 1486184542, 0, 0, 1),
(17, 1, '', '', '', '', '', '', '', NULL, '', '', '', NULL, 'jakarta', '', 0, 0, 0, 1, 17, 1486183009, 1486656745, 0, NULL, NULL),
(17, 2, 'Jakarta', 'Find hotel in Jakarta', '', 'Find hotel in Jakarta', 'jakarta', '', '', NULL, '', '', '', NULL, 'jakarta', '', 0, 0, 0, 1, 17, 1486183009, 1486656745, 0, NULL, NULL),
(17, 3, '', '', '', '', '', '', '', NULL, '', '', '', NULL, 'jakarta', '', 0, 0, 0, 1, 17, 1486183009, 1486656745, 0, NULL, NULL),
(17, 4, 'Jakarta', 'Find hotel in Jakarta', '', 'Find hotel in Jakarta', 'jakarta', '', '', NULL, '', '', '', NULL, 'jakarta', '', 0, 0, 0, 1, 17, 1486183009, 1486656745, 0, NULL, NULL),
(18, 1, '', '', '', '', '', '', '', NULL, '', '', '', NULL, 'bandung', '', 0, 0, 0, 1, 18, 1486183167, 1486183592, 0, NULL, NULL),
(18, 2, 'Bandung', 'Find hotel in Bandung', '', 'Find hotel in Bandung', 'bandung', '', '', NULL, '', '', '', NULL, 'bandung', '', 0, 0, 0, 1, 18, 1486183167, 1486183592, 0, NULL, NULL),
(18, 3, '', '', '', '', '', '', '', NULL, '', '', '', NULL, 'bandung', '', 0, 0, 0, 1, 18, 1486183167, 1486183592, 0, NULL, NULL),
(18, 4, 'Bandung', 'Find hotel in Bandung', '', 'Find hotel in Bandung', 'bandung', '', '', NULL, '', '', '', NULL, 'bandung', '', 0, 0, 0, 1, 18, 1486183167, 1486183592, 0, NULL, NULL),
(19, 1, '', '', '', '', '', '', '', NULL, '', '', '', NULL, 'bali', '', 0, 0, 0, 1, 19, 1486184401, 1486184401, 0, NULL, NULL),
(19, 2, 'Bali', 'Find hotel in Bali', '', 'Find hotel in Bali', 'bali', '', '', NULL, '', '', '', NULL, 'bali', '', 0, 0, 0, 1, 19, 1486184401, 1486184401, 0, NULL, NULL),
(19, 3, '', '', '', '', '', '', '', NULL, '', '', '', NULL, 'bali', '', 0, 0, 0, 1, 19, 1486184401, 1486184401, 0, NULL, NULL),
(19, 4, 'Bali', 'Find hotel in Bali', '', 'Find hotel in Bali', 'bali', '', '', NULL, '', '', '', NULL, 'bali', '', 0, 0, 0, 1, 19, 1486184401, 1486184401, 0, NULL, NULL),
(20, 1, '', '', '', '', '', '', 'index,follow', NULL, '', '', '', NULL, 'yogya', '', 0, 0, 0, 1, 20, 1486397756, 1486398483, 0, NULL, NULL),
(20, 2, 'Yogyakarta', 'Find place to stay in Jogja', 'Find place to stay in Jogja', 'Find place to stay in Jogja', 'yogya', '', 'index,follow', NULL, '', '', '', NULL, 'yogya', '', 0, 0, 0, 1, 20, 1486397756, 1486398483, 0, NULL, NULL),
(20, 3, '', '', '', '', '', '', 'index,follow', NULL, '', '', '', NULL, 'yogya', '', 0, 0, 0, 1, 20, 1486397756, 1486398483, 0, NULL, NULL),
(20, 4, 'Yogyakarta', 'Find place to stay in Jogja', 'Find place to stay in Jogja', 'Find place to stay in Jogja', 'yogya', '', 'index,follow', NULL, '', '', '', NULL, 'yogya', '', 0, 0, 0, 1, 20, 1486397756, 1486398483, 0, NULL, NULL),
(21, 1, '', '', '', '', '', '', 'index,follow', NULL, '', '', '', NULL, 'bogor', '', 0, 0, 0, 1, 21, 1486397828, 1486397828, 0, NULL, NULL),
(21, 2, 'Bogor', 'Find place to stay in Bogor', 'Find place to stay in Bogor', 'Find place to stay in Bogor', 'bogor', '', 'index,follow', NULL, '', '', '', NULL, 'bogor', '', 0, 0, 0, 1, 21, 1486397828, 1486397828, 0, NULL, NULL),
(21, 3, '', '', '', '', '', '', 'index,follow', NULL, '', '', '', NULL, 'bogor', '', 0, 0, 0, 1, 21, 1486397828, 1486397828, 0, NULL, NULL),
(21, 4, 'Bogor', 'Find place to stay in Bogor', 'Find place to stay in Bogor', 'Find place to stay in Bogor', 'bogor', '', 'index,follow', NULL, '', '', '', NULL, 'bogor', '', 0, 0, 0, 1, 21, 1486397828, 1486397828, 0, NULL, NULL),
(22, 1, '', '', '', '', '', '', 'index,follow', NULL, '', '', '', NULL, 'surabaya', '', 0, 0, 0, 1, 22, 1486397994, 1486397994, 0, NULL, NULL),
(22, 2, 'Surabaya', 'Find place to stay in Surabaya', 'Find place to stay in Surabaya', 'Find place to stay in Surabaya', 'surabaya', '', 'index,follow', NULL, '', '', '', NULL, 'surabaya', '', 0, 0, 0, 1, 22, 1486397994, 1486397994, 0, NULL, NULL),
(22, 3, '', '', '', '', '', '', 'index,follow', NULL, '', '', '', NULL, 'surabaya', '', 0, 0, 0, 1, 22, 1486397994, 1486397994, 0, NULL, NULL),
(22, 4, 'Surabaya', 'Find place to stay in Surabaya', 'Find place to stay in Surabaya', 'Find place to stay in Surabaya', 'surabaya', '', 'index,follow', NULL, '', '', '', NULL, 'surabaya', '', 0, 0, 0, 1, 22, 1486397994, 1486397994, 0, NULL, NULL),
(23, 1, '', '', '', '', '', '', 'index,follow', NULL, '', '', '', NULL, 'makassar', '', 0, 0, 0, 1, 23, 1486398081, 1486398081, 0, NULL, NULL),
(23, 2, 'Makassar', 'Find place to stay in Makassar', 'Find place to stay in Makassar', 'Find place to stay in Makassar', 'makassar', '', 'index,follow', NULL, '', '', '', NULL, 'makassar', '', 0, 0, 0, 1, 23, 1486398081, 1486398081, 0, NULL, NULL),
(23, 3, '', '', '', '', '', '', 'index,follow', NULL, '', '', '', NULL, 'makassar', '', 0, 0, 0, 1, 23, 1486398081, 1486398081, 0, NULL, NULL),
(23, 4, 'Makassar', 'Find place to stay in Makassar', 'Find place to stay in Makassar', 'Find place to stay in Makassar', 'makassar', '', 'index,follow', NULL, '', '', '', NULL, 'makassar', '', 0, 0, 0, 1, 23, 1486398081, 1486398081, 0, NULL, NULL),
(24, 1, '', '', '', '', '', '', 'index,follow', NULL, '', '', '', NULL, 'solo', '', 0, 0, 0, 1, 24, 1486398145, 1486398145, 0, NULL, NULL),
(24, 2, 'Solo', 'Find place to stay in Solo', 'Find place to stay in Solo', 'Find place to stay in Solo', 'solo', '', 'index,follow', NULL, '', '', '', NULL, 'solo', '', 0, 0, 0, 1, 24, 1486398145, 1486398145, 0, NULL, NULL),
(24, 3, '', '', '', '', '', '', 'index,follow', NULL, '', '', '', NULL, 'solo', '', 0, 0, 0, 1, 24, 1486398145, 1486398145, 0, NULL, NULL),
(24, 4, 'Solo', 'Find place to stay in Solo', 'Find place to stay in Solo', 'Find place to stay in Solo', 'solo', '', 'index,follow', NULL, '', '', '', NULL, 'solo', '', 0, 0, 0, 1, 24, 1486398145, 1486398145, 0, NULL, NULL),
(25, 1, '', '', '', '', '', '', '', NULL, '', '', '', NULL, 'semarang', '', 0, 0, 0, 1, 25, 1486398189, 1486398189, 0, NULL, NULL),
(25, 2, 'Semarang', 'Find place to stay in Semarang', 'Find place to stay in Semarang', 'Find place to stay in Semarang', 'semarang', '', '', NULL, '', '', '', NULL, 'semarang', '', 0, 0, 0, 1, 25, 1486398189, 1486398189, 0, NULL, NULL),
(25, 3, '', '', '', '', '', '', '', NULL, '', '', '', NULL, 'semarang', '', 0, 0, 0, 1, 25, 1486398189, 1486398189, 0, NULL, NULL),
(25, 4, 'Semarang', 'Find place to stay in Semarang', 'Find place to stay in Semarang', 'Find place to stay in Semarang', 'semarang', '', '', NULL, '', '', '', NULL, 'semarang', '', 0, 0, 0, 1, 25, 1486398189, 1486398189, 0, NULL, NULL),
(26, 1, '', '', '', '', '', '', '', NULL, '', '', '', NULL, 'medan', '', 0, 0, 0, 1, 26, 1486398229, 1486398229, 0, NULL, NULL),
(26, 2, 'Medan', 'Find place to stay in Medan', 'Find place to stay in Medan', 'Find place to stay in Medan', 'medan', '', '', NULL, '', '', '', NULL, 'medan', '', 0, 0, 0, 1, 26, 1486398229, 1486398229, 0, NULL, NULL),
(26, 3, '', '', '', '', '', '', '', NULL, '', '', '', NULL, 'medan', '', 0, 0, 0, 1, 26, 1486398229, 1486398229, 0, NULL, NULL),
(26, 4, 'Medan', 'Find place to stay in Medan', 'Find place to stay in Medan', 'Find place to stay in Medan', 'medan', '', '', NULL, '', '', '', NULL, 'medan', '', 0, 0, 0, 1, 26, 1486398229, 1486398229, 0, NULL, NULL),
(27, 1, '', '', '', '', '', '', '', NULL, '', '', '', NULL, 'page', 'article', 1, 0, 0, 1, 27, 1486401224, 1487261905, 1, NULL, NULL),
(27, 2, 'Blog', 'blog', '', 'blog', 'artikel', '', '', NULL, '', '', '', NULL, 'page', 'article', 1, 0, 0, 1, 27, 1486401224, 1487261905, 1, NULL, NULL),
(27, 3, '', '', '', '', '', '', '', NULL, '', '', '', NULL, 'page', 'article', 1, 0, 0, 1, 27, 1486401224, 1487261905, 1, NULL, NULL),
(27, 4, 'Blog', 'blog', '', 'blog', 'artikel', '', '', NULL, '', '', '', NULL, 'page', 'article', 1, 0, 0, 1, 27, 1486401224, 1487261905, 1, NULL, NULL),
(28, 1, '', '', '', '', '', '', '', NULL, '', '', '', NULL, 'hotel-origins', '', 0, 0, 0, 1, 28, 1487267145, 1487268305, 0, NULL, NULL),
(28, 2, 'Our Partner', 'Our Partner Hotel', '', 'ourpartner', 'partner-hotel', '', '', NULL, '', '', '', NULL, 'hotel-origins', '', 0, 0, 0, 1, 28, 1487267145, 1487268305, 0, NULL, NULL),
(28, 3, '', '', '', '', '', '', '', NULL, '', '', '', NULL, 'hotel-origins', '', 0, 0, 0, 1, 28, 1487267145, 1487268305, 0, NULL, NULL),
(28, 4, 'Our Partner', 'Our Partner Hotel', '', 'ourpartner', 'partner-hotel', '', '', NULL, '', '', '', NULL, 'hotel-origins', '', 0, 0, 0, 1, 28, 1487267145, 1487268305, 0, NULL, NULL),
(29, 1, '', '', '', '', '', '', '', NULL, '', '', '', NULL, 'page', '', 0, 0, 0, 1, 29, 1495179907, 1495180505, 0, NULL, NULL),
(29, 2, 'add-shop', 'add-shop', '', 'add-shop', 'add-shop', '', '', NULL, '', '<!--?php  \r\n// echo "<pre-->\r\n<div id="home-slider" style="background: url(/images/shop/bg-shop.png) 0 100% repeat-x;\r\n    position: relative;">\r\n<div class="container">\r\n<div class="row">\r\n<div class="main-slider">\r\n<div class="slide-text">\r\n<h1>Gabung di Pasarwarga</h1>\r\n\r\n<p>Situs marketplace online terbesar dengan jutaan user yang mengakses dan belanja setiap hari di Pasarwarga. Buka lebar kesempatan kamu dengan membuka kios online disini.</p>\r\n<a class="btn btn-common" href="<?php if($this->data[''loginCheck''] !='''' || $seller_id != ''''){ echo site_url(''shop/sell''); } else { echo site_url(''login''); }  ?>"><!--?php if( $seller_id !=''''){ ?--> TOKO SAYA <!--?php }else{ ?--> BUKA TOKO <!--?php }  ?--></a></div>\r\n<img alt="slider image" class="slider-hill" src="images/shop/city.png" /> <img alt="slider image" class="slider-house" src="images/shop/store.png" /> <img alt="slider image" class="slider-sun" src="images/shop/balloon.png" /> <img alt="slider image" class="slider-birds1" src="images/shop/cloud.png" /> <img alt="slider image" class="slider-birds2" src="images/shop/sun.gif" /></div>\r\n</div>\r\n</div>\r\n\r\n<div class="preloader"> </div>\r\n</div>\r\n<!--/#home-slider-->\r\n\r\n<div id="services">\r\n<div class="container">\r\n<div class="row">\r\n<div class="col-md-12 text-center join-shop">\r\n<h1 class="title">Kenapa Berjualan di Pasarwarga?</h1>\r\n\r\n<p>Keuntungan membuka kios online di Pasarwarga</p>\r\n</div>\r\n\r\n<div class="col-sm-4 text-center join-shop wow fadeIn" data-wow-delay="300ms" data-wow-duration="1000ms">\r\n<div class="single-service">\r\n<div class="wow scaleIn" data-wow-delay="300ms" data-wow-duration="500ms"><img alt="" src="images/aman.png" /></div>\r\n\r\n<h2>Transaksi Aman</h2>\r\n\r\n<p>Dijamin untuk tiap transaksi yang ada di Pasarwarga.</p>\r\n</div>\r\n</div>\r\n\r\n<div class="col-sm-4 text-center join-shop wow fadeIn" data-wow-delay="600ms" data-wow-duration="1000ms">\r\n<div class="single-service">\r\n<div class="wow scaleIn" data-wow-delay="600ms" data-wow-duration="500ms"><img alt="" src="images/layanan-konsumen.png" /></div>\r\n\r\n<h2>Layanan Konsumen</h2>\r\n\r\n<p>Penjual tidak perlu repot untuk memasukkan produknya karena team kami siap membantu.</p>\r\n</div>\r\n</div>\r\n\r\n<div class="col-sm-4 text-center join-shop wow fadeIn" data-wow-delay="900ms" data-wow-duration="1000ms">\r\n<div class="single-service">\r\n<div class="wow scaleIn" data-wow-delay="900ms" data-wow-duration="500ms"><img alt="" src="images/mudah-berjualan.png" /></div>\r\n\r\n<h2>Mudah Berjualan</h2>\r\n\r\n<p>Jutaan user yang mengunjungi setiap harinya maka semakin besar produk Anda terjual.</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<!--/#services-->\r\n\r\n<div class="responsive" id="action">\r\n<div class="vertical-center">\r\n<div class="container">\r\n<div class="row">\r\n<div class="take-service">\r\n<div class="col-sm-7 wow fadeInLeft" data-wow-delay="300ms" data-wow-duration="500ms">\r\n<h1 class="title">Siap Untuk Berjualan?</h1>\r\n\r\n<p>Daftarkan segera kios Anda dan kami akan siap membantu Anda.</p>\r\n</div>\r\n\r\n<div class="col-sm-5 text-center wow fadeInRight" data-wow-delay="300ms" data-wow-duration="500ms">\r\n<div class="service-inner"><a class="btn btn-common" href="#">MULAI JUALAN</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<!--/#action-->\r\n\r\n<div id="features">\r\n<div class="container">\r\n<div class="row">\r\n<div class="single-features">\r\n<div class="col-sm-5 wow fadeInLeft" data-wow-delay="300ms" data-wow-duration="500ms"><img alt="" class="img-responsive" src="images/shop/image1.png" /></div>\r\n\r\n<div class="col-sm-6 wow fadeInRight" data-wow-delay="300ms" data-wow-duration="500ms">\r\n<h3>Dimanapun lokasi toko Anda tetap bisa berjualan kepada seluruh user Pasar Warga di seluruh Indonesia</h3>\r\n</div>\r\n</div>\r\n\r\n<div class="single-features">\r\n<div class="col-sm-6 col-sm-offset-1 align-right wow fadeInLeft" data-wow-delay="300ms" data-wow-duration="500ms">\r\n<h3>Team SBA kami selalu siap membantu dalam setiap proses seperti input barang dan update harga serta transaksi yang terjadi.</h3>\r\n</div>\r\n\r\n<div class="col-sm-5 wow fadeInRight" data-wow-delay="300ms" data-wow-duration="500ms"><img alt="" class="img-responsive" src="images/shop/image1.png" /></div>\r\n</div>\r\n\r\n<div class="single-features">\r\n<div class="col-sm-5 wow fadeInLeft" data-wow-delay="300ms" data-wow-duration="500ms"><img alt="" class="img-responsive" src="images/shop/image1.png" /></div>\r\n\r\n<div class="col-sm-6 wow fadeInRight" data-wow-delay="300ms" data-wow-duration="500ms">\r\n<h3>Perkuat brand online shop Anda dengan tampilan toko yang keren dan profesional seperti ribuan toko / online shop yang telah bergabung dengan kami.</h3>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<!--/#features-->\r\n\r\n<div id="clients">\r\n<div class="container">\r\n<div class="row">\r\n<div class="col-sm-12">\r\n<div class="clients text-center wow fadeInUp" data-wow-delay="300ms" data-wow-duration="500ms">\r\n<p><img alt="" class="img-responsive" src="images/shop/clients.png" /></p>\r\n\r\n<h1 class="title">Partner Pasarwarga</h1>\r\n\r\n<p>Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<br />\r\nUt enim ad minim veniam, quis nostrud</p>\r\n</div>\r\n\r\n<div class="clients-logo wow fadeIn" data-wow-delay="600ms" data-wow-duration="1000ms">\r\n<div class="col-xs-3 col-sm-2"><a href="#"><img alt="" class="img-responsive" src="images/shop/client1.png" /></a></div>\r\n\r\n<div class="col-xs-3 col-sm-2"><a href="#"><img alt="" class="img-responsive" src="images/shop/client1.png" /></a></div>\r\n\r\n<div class="col-xs-3 col-sm-2"><a href="#"><img alt="" class="img-responsive" src="images/shop/client1.png" /></a></div>\r\n\r\n<div class="col-xs-3 col-sm-2"><a href="#"><img alt="" class="img-responsive" src="images/shop/client1.png" /></a></div>\r\n\r\n<div class="col-xs-3 col-sm-2"><a href="#"><img alt="" class="img-responsive" src="images/shop/client1.png" /></a></div>\r\n\r\n<div class="col-xs-3 col-sm-2"><a href="#"><img alt="" class="img-responsive" src="images/shop/client1.png" /></a></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<script type="text/javascript" src="js/jquery.js"></script><script type="text/javascript" src="js/bootstrap.min.js"></script><script type="text/javascript" src="js/wow.min.js"></script><script type="text/javascript" src="js/main.js"></script>', '', NULL, 'page', '', 0, 0, 0, 1, 29, 1495179907, 1495180505, 0, NULL, NULL),
(29, 3, '', '', '', '', '', '', '', NULL, '', '', '', NULL, 'page', '', 0, 0, 0, 1, 29, 1495179907, 1495180505, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pm_page_file`
--

DROP TABLE IF EXISTS `pm_page_file`;
CREATE TABLE IF NOT EXISTS `pm_page_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `home` int(11) DEFAULT '0',
  `checked` int(11) DEFAULT '1',
  `rank` int(11) DEFAULT '0',
  `file` varchar(250) DEFAULT NULL,
  `label` varchar(250) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  KEY `page_file_fkey` (`id_item`,`lang`),
  KEY `page_file_lang_fkey` (`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pm_page_file`
--

INSERT INTO `pm_page_file` (`id`, `lang`, `id_item`, `home`, `checked`, `rank`, `file`, `label`, `type`) VALUES
(1, 1, 17, NULL, 1, 1, 'original.jpg', NULL, 'image'),
(1, 2, 17, NULL, 1, 1, 'original.jpg', NULL, 'image'),
(1, 3, 17, NULL, 1, 1, 'original.jpg', NULL, 'image'),
(1, 4, 17, NULL, 1, 1, 'original.jpg', NULL, 'image');

-- --------------------------------------------------------

--
-- Table structure for table `pm_rate`
--

DROP TABLE IF EXISTS `pm_rate`;
CREATE TABLE IF NOT EXISTS `pm_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_room` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `start_date` int(11) DEFAULT NULL,
  `end_date` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `price` double DEFAULT '0',
  `child_price` double DEFAULT '0',
  `discount` double DEFAULT '0',
  `people` int(11) DEFAULT NULL,
  `price_sup` double DEFAULT NULL,
  `fixed_sup` double DEFAULT NULL,
  `min_stay` int(11) DEFAULT NULL,
  `vat_rate` double DEFAULT NULL,
  `day_start` int(11) DEFAULT NULL,
  `day_end` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rate_room_fkey` (`id_room`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `pm_rate`
--

INSERT INTO `pm_rate` (`id`, `id_room`, `id_user`, `start_date`, `end_date`, `type`, `price`, `child_price`, `discount`, `people`, `price_sup`, `fixed_sup`, `min_stay`, `vat_rate`, `day_start`, `day_end`) VALUES
(1, 5, 5, 1488301200, 1514653200, 'night', 720000, 150000, 10, 2, 150000, 0, 1, 0, NULL, NULL),
(2, 4, 5, 1488301200, 1514566800, 'night', 230000, 100000, 5, 2, 100000, 0, 1, 0, NULL, NULL),
(3, 3, 3, 1488301200, 1511974800, 'night', 400000, 150000, 0, 2, 150000, 0, 1, 0, NULL, NULL),
(4, 6, 5, 1488301200, 1514653200, 'night', 131500, 0, 0, 2, 0, 0, 1, 0, 0, NULL),
(5, 7, 5, 1487091600, 1514566800, 'night', 99000, 0, 0, 2, 99000, 0, 1, 0, 0, NULL),
(6, 8, 5, 1488301200, 1514566800, 'night', 290000, 0, 0, 1, 0, 0, 1, 0, 0, NULL),
(7, 8, 5, 1489597200, 1514566800, 'night', 200000, 0, 0, 1, 0, 0, 1, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pm_room`
--

DROP TABLE IF EXISTS `pm_room`;
CREATE TABLE IF NOT EXISTS `pm_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `id_hotel` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `max_children` int(11) DEFAULT '1',
  `max_adults` int(11) DEFAULT '1',
  `max_people` int(11) DEFAULT NULL,
  `min_people` int(11) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `subtitle` varchar(250) DEFAULT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `descr` longtext,
  `facilities` text,
  `stock` int(11) DEFAULT '1',
  `price` double DEFAULT '0',
  `home` int(11) DEFAULT '0',
  `checked` int(11) DEFAULT '0',
  `rank` int(11) DEFAULT '0',
  `start_lock` int(11) DEFAULT NULL,
  `end_lock` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  KEY `room_lang_fkey` (`lang`),
  KEY `room_hotel_fkey` (`id_hotel`,`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `pm_room`
--

INSERT INTO `pm_room` (`id`, `lang`, `id_hotel`, `id_user`, `max_children`, `max_adults`, `max_people`, `min_people`, `title`, `subtitle`, `alias`, `descr`, `facilities`, `stock`, `price`, `home`, `checked`, `rank`, `start_lock`, `end_lock`) VALUES
(2, 1, 4, 5, 0, 2, 3, 1, '', '', '', '', '', 5, 330000, 1, 1, 1, NULL, NULL),
(2, 2, 4, 5, 0, 2, 3, 1, 'Standart Twin Room', 'Free Wifi available', 'twin-room-standart', '<h2 style="text-align: center;"><strong>Standard Twin Room</strong></h2>\r\n\r\n<p>This twin room features air conditioning, a flat-screen cable TV and views of the city. It is fitted with a desk and a radio. Bathroom facilities include a shower. Towels, linens and toiletries are provided.</p>\r\n\r\n<p data-nr-of-facilities="14"><strong>Room Facilities: </strong> City view, Radio, Cable channels, Flat-screen TV, Air conditioning, Desk, Hardwood/Parquet floors, Shower, Free toiletries, Toilet, Bathroom, Wake-up service, Towels, Linens</p>\r\n\r\n<p>Free WiFi is available in all rooms.</p>\r\n', '', 5, 330000, 1, 1, 1, NULL, NULL),
(2, 3, 4, 5, 0, 2, 3, 1, '', '', '', '', '', 5, 330000, 1, 1, 1, NULL, NULL),
(2, 4, 4, 5, 0, 2, 3, 1, 'Standart Twin Room', 'Free Wifi available', 'twin-room-standart', '<h2 style="text-align: center;"><strong>Standard Twin Room</strong></h2>\r\n\r\n<p>This twin room features air conditioning, a flat-screen cable TV and views of the city. It is fitted with a desk and a radio. Bathroom facilities include a shower. Towels, linens and toiletries are provided.</p>\r\n\r\n<p data-nr-of-facilities="14"><strong>Room Facilities: </strong> City view, Radio, Cable channels, Flat-screen TV, Air conditioning, Desk, Hardwood/Parquet floors, Shower, Free toiletries, Toilet, Bathroom, Wake-up service, Towels, Linens</p>\r\n\r\n<p>Free WiFi is available in all rooms.</p>\r\n', '', 5, 330000, 1, 1, 1, NULL, NULL),
(3, 1, 3, 5, 0, 3, 3, 1, '', '', '', '', '1,14,38,25,27,28,32', 5, 460000, 1, 1, 2, NULL, NULL),
(3, 2, 3, 5, 0, 3, 3, 1, 'Standart Room', 'Free Wifi available', 'standart-room', '<h2 style="text-align: center;"><strong>Standard Twin Room</strong></h2>\r\n\r\n<p>This twin room features air conditioning, a flat-screen cable TV and views of the city. It is fitted with a desk and a radio. Bathroom facilities include a shower. Towels, linens and toiletries are provided.</p>\r\n\r\n<p data-nr-of-facilities="14"><strong>Room Facilities: </strong> City view, Radio, Cable channels, Flat-screen TV, Air conditioning, Desk, Hardwood/Parquet floors, Shower, Free toiletries, Toilet, Bathroom, Wake-up service, Towels, Linens</p>\r\n\r\n<p>Free WiFi is available in all rooms.</p>\r\n', '1,14,38,25,27,28,32', 5, 460000, 1, 1, 2, NULL, NULL),
(3, 3, 3, 5, 0, 3, 3, 1, '', '', '', '', '1,14,38,25,27,28,32', 5, 460000, 1, 1, 2, NULL, NULL),
(3, 4, 3, 5, 0, 3, 3, 1, 'Standart Room', 'Free Wifi available', 'standart-room', '<h2 style="text-align: center;"><strong>Standard Twin Room</strong></h2>\r\n\r\n<p>This twin room features air conditioning, a flat-screen cable TV and views of the city. It is fitted with a desk and a radio. Bathroom facilities include a shower. Towels, linens and toiletries are provided.</p>\r\n\r\n<p data-nr-of-facilities="14"><strong>Room Facilities: </strong> City view, Radio, Cable channels, Flat-screen TV, Air conditioning, Desk, Hardwood/Parquet floors, Shower, Free toiletries, Toilet, Bathroom, Wake-up service, Towels, Linens</p>\r\n\r\n<p>Free WiFi is available in all rooms.</p>\r\n', '1,14,38,25,27,28,32', 5, 460000, 1, 1, 2, NULL, NULL),
(4, 1, 4, 5, 0, 2, 3, 1, '', '', '', '', '1,14,38,25,27,28,32', 5, 290000, 1, 1, 3, NULL, NULL),
(4, 2, 4, 5, 0, 2, 3, 1, 'Double Bed', 'Free Wifi available', 'double-bed', '<h2 style="text-align: center;"><strong>Double Bed</strong></h2>\r\n\r\n<p>This  room features air conditioning, a flat-screen cable TV and views of the city. It is fitted with a desk and a radio. Bathroom facilities include a shower. Towels, linens and toiletries are provided.</p>\r\n\r\n<p data-nr-of-facilities="14"><strong>Room Facilities: </strong> City view, Radio, Cable channels, Flat-screen TV, Air conditioning, Desk, Hardwood/Parquet floors, Shower, Free toiletries, Toilet, Bathroom, Wake-up service, Towels, Linens</p>\r\n\r\n<p>Free WiFi is available in all rooms.</p>\r\n', '1,14,38,25,27,28,32', 5, 290000, 1, 1, 3, NULL, NULL),
(4, 3, 4, 5, 0, 2, 3, 1, '', '', '', '', '1,14,38,25,27,28,32', 5, 290000, 1, 1, 3, NULL, NULL),
(4, 4, 4, 5, 0, 2, 3, 1, 'Double Bed', 'Free Wifi available', 'double-bed', '<h2 style="text-align: center;"><strong>Double Bed</strong></h2>\r\n\r\n<p>This  room features air conditioning, a flat-screen cable TV and views of the city. It is fitted with a desk and a radio. Bathroom facilities include a shower. Towels, linens and toiletries are provided.</p>\r\n\r\n<p data-nr-of-facilities="14"><strong>Room Facilities: </strong> City view, Radio, Cable channels, Flat-screen TV, Air conditioning, Desk, Hardwood/Parquet floors, Shower, Free toiletries, Toilet, Bathroom, Wake-up service, Towels, Linens</p>\r\n\r\n<p>Free WiFi is available in all rooms.</p>\r\n', '1,14,38,25,27,28,32', 5, 290000, 1, 1, 3, NULL, NULL),
(5, 1, 2, 5, 1, 2, 3, 1, '', '', '', '', '1,14,36,38,24,25,26,27,28,32', 5, 870000, 1, 1, 4, NULL, NULL),
(5, 2, 2, 5, 1, 2, 3, 1, 'Deluxe Room', 'Best choice for guest', 'deluxe-room', '<h2 style="text-align: center;"><strong>Deluxe Room</strong></h2>\r\n\r\n<p>Deluxe room features air conditioning, a flat-screen cable TV and views of the city. It is fitted with a desk and a radio. Bathroom facilities include a shower. Towels, linens and toiletries are provided.</p>\r\n\r\n<p data-nr-of-facilities="14"><strong>Room Facilities: </strong> City view, Radio, Cable channels, Flat-screen TV, Air conditioning, Desk, Hardwood/Parquet floors, Shower, Free toiletries, Toilet, Bathroom, Wake-up service, Towels, Linens</p>\r\n\r\n<p>Free WiFi is available in all rooms.</p>\r\n', '1,14,36,38,24,25,26,27,28,32', 5, 870000, 1, 1, 4, NULL, NULL),
(5, 3, 2, 5, 1, 2, 3, 1, '', '', '', '', '1,14,36,38,24,25,26,27,28,32', 5, 870000, 1, 1, 4, NULL, NULL),
(5, 4, 2, 5, 1, 2, 3, 1, 'Deluxe Room', 'Best choice for guest', 'deluxe-room', '<h2 style="text-align: center;"><strong>Deluxe Room</strong></h2>\r\n\r\n<p>Deluxe room features air conditioning, a flat-screen cable TV and views of the city. It is fitted with a desk and a radio. Bathroom facilities include a shower. Towels, linens and toiletries are provided.</p>\r\n\r\n<p data-nr-of-facilities="14"><strong>Room Facilities: </strong> City view, Radio, Cable channels, Flat-screen TV, Air conditioning, Desk, Hardwood/Parquet floors, Shower, Free toiletries, Toilet, Bathroom, Wake-up service, Towels, Linens</p>\r\n\r\n<p>Free WiFi is available in all rooms.</p>\r\n', '1,14,36,38,24,25,26,27,28,32', 5, 870000, 1, 1, 4, NULL, NULL),
(6, 1, 9, 5, 0, 2, 3, 1, '', '', '', '', '1,5,8,27,28,32', 5, 134667, 1, 1, 5, NULL, NULL),
(6, 2, 9, 5, 0, 2, 3, 1, 'Guest Standart', 'Kenyamanan jaminan kami', 'guest-standart', '<p>Kamar dirancang demi kenyamanan anda selama menginap. Dilengkapi fasilitas seperti TV, tempat tidur yang nyaman dan lain-lain. <span data-cke-marker="1"> </p>\r\n', '1,5,8,27,28,32', 5, 134667, 1, 1, 5, NULL, NULL),
(6, 3, 9, 5, 0, 2, 3, 1, '', '', '', '', '1,5,8,27,28,32', 5, 134667, 1, 1, 5, NULL, NULL),
(6, 4, 9, 5, 0, 2, 3, 1, 'Guest Standart', '', 'guest-standart', '<p>Kamar dirancang demi kenyamanan anda selama menginap. Dilengkapi fasilitas seperti TV, tempat tidur yang nyaman dan lain-lain. <span data-cke-marker="1"> </p>\r\n', '1,5,8,27,28,32', 5, 134667, 1, 1, 5, NULL, NULL),
(7, 1, 9, 5, 0, 2, 2, 1, '', '', '', '', '', 5, 151513, 1, 1, 6, NULL, NULL),
(7, 2, 9, 5, 0, 2, 2, 1, 'Guest Double Room', '', 'guest-double', '<p>Deskripsi Kamar</p>\r\n\r\n<div class="subContent">Kamar dirancang demi kenyamanan anda selama menginap. Dilengkapi fasilitas seperti TV, tempat tidur yang nyaman dan lain-lain.</div>\r\n\r\n<p><span data-cke-marker="1">Fasilitas</p>\r\n\r\n<div class="contentLeft">\r\n<ul>\r\n	<li>AC</li>\r\n	<li>TV</li>\r\n	<li>Kamar mandi</li>\r\n	<li>Tempat tidur Ukuran Queen</li>\r\n	<li>Perabotan berkualitas</li>\r\n	<li>Air Panas</li>\r\n</ul>\r\n \r\n\r\n<div class="subTitle">Informasi Tambahan</div>\r\n\r\n<div class="subContent">Regular Plan</div>\r\n</div>\r\n\r\n<p><span data-cke-marker="1"> </p>\r\n', '', 5, 151513, 1, 1, 6, NULL, NULL),
(7, 3, 9, 5, 0, 2, 2, 1, '', '', '', '', '', 5, 151513, 1, 1, 6, NULL, NULL),
(7, 4, 9, 5, 0, 2, 2, 1, 'Guest Double Room', '', 'guest-double', '<p>Deskripsi Kamar</p>\r\n\r\n<div class="subContent">Kamar dirancang demi kenyamanan anda selama menginap. Dilengkapi fasilitas seperti TV, tempat tidur yang nyaman dan lain-lain.</div>\r\n\r\n<p><span data-cke-marker="1">Fasilitas</p>\r\n\r\n<div class="contentLeft">\r\n<ul>\r\n	<li>AC</li>\r\n	<li>TV</li>\r\n	<li>Kamar mandi</li>\r\n	<li>Tempat tidur Ukuran Queen</li>\r\n	<li>Perabotan berkualitas</li>\r\n	<li>Air Panas</li>\r\n</ul>\r\n \r\n\r\n<div class="subTitle">Informasi Tambahan</div>\r\n\r\n<div class="subContent">Regular Plan</div>\r\n</div>\r\n\r\n<p><span data-cke-marker="1"> </p>\r\n', '', 5, 151513, 1, 1, 6, NULL, NULL),
(8, 1, 5, 5, 0, 2, 3, 1, '', '', '', '', '1,5,38,25,27,28,32', 10, 300000, 1, 1, 7, NULL, NULL),
(8, 2, 5, 5, 0, 2, 3, 1, 'Superior Room', 'Standart for luxury night', 'superior-room', '<p> </span>A comfortable 24 sqm room, Our Superior Room are relaxing spaces designed with modern amenities and offer the vibrant city views to create refreshing environments for rest and comfort mind. <span data-cke-marker="1"> </p>\r\n\r\n<p><strong>Fasilitas</strong></p>\r\n\r\n<ul>\r\n	<li>Twin beds</li>\r\n	<li>Executive writing table and stationery set</li>\r\n	<li>Slippers</li>\r\n	<li>Hairdryer</li>\r\n	<li>Wireless high-speed internet access</li>\r\n	<li>Telephone</li>\r\n	<li>Secure key-card access</li>\r\n	<li>Safe deposit box</li>\r\n	<li>24-hour in-room dining</li>\r\n	<li>42” LCD television with local and cable channels</li>\r\n	<li>Complimentary bottled water</li>\r\n</ul>\r\n\r\n<p> </p>\r\n\r\n<p><strong>Informasi Tambahan</strong></p>\r\n\r\n<p>Tarif kamar tidak termasuk sarapan</p>\r\n', '1,5,38,25,27,28,32', 10, 300000, 1, 1, 7, NULL, NULL),
(8, 3, 5, 5, 0, 2, 3, 1, '', '', '', '', '1,5,38,25,27,28,32', 10, 300000, 1, 1, 7, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pm_room_file`
--

DROP TABLE IF EXISTS `pm_room_file`;
CREATE TABLE IF NOT EXISTS `pm_room_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `home` int(11) DEFAULT '0',
  `checked` int(11) DEFAULT '1',
  `rank` int(11) DEFAULT '0',
  `file` varchar(250) DEFAULT NULL,
  `label` varchar(250) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  KEY `room_file_fkey` (`id_item`,`lang`),
  KEY `room_file_lang_fkey` (`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `pm_room_file`
--

INSERT INTO `pm_room_file` (`id`, `lang`, `id_item`, `home`, `checked`, `rank`, `file`, `label`, `type`) VALUES
(2, 1, 2, NULL, 1, 1, 'standart-twinroom.jpg', NULL, 'image'),
(2, 2, 2, NULL, 1, 1, 'standart-twinroom.jpg', NULL, 'image'),
(2, 3, 2, NULL, 1, 1, 'standart-twinroom.jpg', NULL, 'image'),
(2, 4, 2, NULL, 1, 1, 'standart-twinroom.jpg', NULL, 'image'),
(3, 1, 2, NULL, 1, 2, 'standart-twinroom-3.jpg', NULL, 'image'),
(3, 2, 2, NULL, 1, 2, 'standart-twinroom-3.jpg', NULL, 'image'),
(3, 3, 2, NULL, 1, 2, 'standart-twinroom-3.jpg', NULL, 'image'),
(3, 4, 2, NULL, 1, 2, 'standart-twinroom-3.jpg', NULL, 'image'),
(4, 1, 2, NULL, 1, 3, '45308342.jpg', NULL, 'image'),
(4, 2, 2, NULL, 1, 3, '45308342.jpg', NULL, 'image'),
(4, 3, 2, NULL, 1, 3, '45308342.jpg', NULL, 'image'),
(4, 4, 2, NULL, 1, 3, '45308342.jpg', NULL, 'image'),
(5, 1, 2, NULL, 1, 4, 'standart-twinroom-2.jpg', NULL, 'image'),
(5, 2, 2, NULL, 1, 4, 'standart-twinroom-2.jpg', NULL, 'image'),
(5, 3, 2, NULL, 1, 4, 'standart-twinroom-2.jpg', NULL, 'image'),
(5, 4, 2, NULL, 1, 4, 'standart-twinroom-2.jpg', NULL, 'image'),
(7, 1, 3, NULL, 1, 2, '87596889.jpg', '', 'image'),
(7, 2, 3, NULL, 1, 2, '87596889.jpg', '', 'image'),
(7, 3, 3, NULL, 1, 2, '87596889.jpg', '', 'image'),
(7, 4, 3, NULL, 1, 2, '87596889.jpg', '', 'image'),
(8, 1, 3, NULL, 1, 3, '70454994.jpg', '', 'image'),
(8, 2, 3, NULL, 1, 3, '70454994.jpg', '', 'image'),
(8, 3, 3, NULL, 1, 3, '70454994.jpg', '', 'image'),
(8, 4, 3, NULL, 1, 3, '70454994.jpg', '', 'image'),
(9, 1, 4, NULL, 1, 2, '87596889.jpg', '', 'image'),
(9, 2, 4, NULL, 1, 2, '87596889.jpg', '', 'image'),
(9, 3, 4, NULL, 1, 2, '87596889.jpg', '', 'image'),
(9, 4, 4, NULL, 1, 2, '87596889.jpg', '', 'image'),
(10, 1, 4, NULL, 1, 1, '12568577.jpg', '', 'image'),
(10, 2, 4, NULL, 1, 1, '12568577.jpg', '', 'image'),
(10, 3, 4, NULL, 1, 1, '12568577.jpg', '', 'image'),
(10, 4, 4, NULL, 1, 1, '12568577.jpg', '', 'image'),
(11, 1, 4, NULL, 1, 3, '19394335.jpg', '', 'image'),
(11, 2, 4, NULL, 1, 3, '19394335.jpg', '', 'image'),
(11, 3, 4, NULL, 1, 3, '19394335.jpg', '', 'image'),
(11, 4, 4, NULL, 1, 3, '19394335.jpg', '', 'image'),
(12, 1, 5, NULL, 1, 8, '23718017.jpg', NULL, 'image'),
(12, 2, 5, NULL, 1, 8, '23718017.jpg', NULL, 'image'),
(12, 3, 5, NULL, 1, 8, '23718017.jpg', NULL, 'image'),
(12, 4, 5, NULL, 1, 8, '23718017.jpg', NULL, 'image'),
(13, 1, 5, NULL, 1, 9, '12568576.jpg', NULL, 'image'),
(13, 2, 5, NULL, 1, 9, '12568576.jpg', NULL, 'image'),
(13, 3, 5, NULL, 1, 9, '12568576.jpg', NULL, 'image'),
(13, 4, 5, NULL, 1, 9, '12568576.jpg', NULL, 'image'),
(14, 1, 5, NULL, 1, 10, '23718003.jpg', NULL, 'image'),
(14, 2, 5, NULL, 1, 10, '23718003.jpg', NULL, 'image'),
(14, 3, 5, NULL, 1, 10, '23718003.jpg', NULL, 'image'),
(14, 4, 5, NULL, 1, 10, '23718003.jpg', NULL, 'image'),
(16, 1, 6, NULL, 1, 2, 'y955840010.jpg', '', 'image'),
(16, 2, 6, NULL, 1, 2, 'y955840010.jpg', '', 'image'),
(16, 3, 6, NULL, 1, 2, 'y955840010.jpg', '', 'image'),
(16, 4, 6, NULL, 1, 2, 'y955840010.jpg', '', 'image'),
(17, 1, 6, NULL, 1, 3, 'y955840013.jpg', '', 'image'),
(17, 2, 6, NULL, 1, 3, 'y955840013.jpg', '', 'image'),
(17, 3, 6, NULL, 1, 3, 'y955840013.jpg', '', 'image'),
(17, 4, 6, NULL, 1, 3, 'y955840013.jpg', '', 'image'),
(18, 1, 7, NULL, 1, 11, 'y955840012.jpg', NULL, 'image'),
(18, 2, 7, NULL, 1, 11, 'y955840012.jpg', NULL, 'image'),
(18, 3, 7, NULL, 1, 11, 'y955840012.jpg', NULL, 'image'),
(18, 4, 7, NULL, 1, 11, 'y955840012.jpg', NULL, 'image'),
(19, 1, 7, NULL, 1, 12, 'y955840004.jpg', NULL, 'image'),
(19, 2, 7, NULL, 1, 12, 'y955840004.jpg', NULL, 'image'),
(19, 3, 7, NULL, 1, 12, 'y955840004.jpg', NULL, 'image'),
(19, 4, 7, NULL, 1, 12, 'y955840004.jpg', NULL, 'image'),
(20, 1, 8, NULL, 1, 13, 'y986301007.jpg', '', 'image'),
(20, 2, 8, NULL, 1, 13, 'y986301007.jpg', '', 'image'),
(20, 3, 8, NULL, 1, 13, 'y986301007.jpg', '', 'image');

-- --------------------------------------------------------

--
-- Table structure for table `pm_service`
--

DROP TABLE IF EXISTS `pm_service`;
CREATE TABLE IF NOT EXISTS `pm_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `descr` text,
  `long_descr` text,
  `type` varchar(50) DEFAULT NULL,
  `rooms` varchar(250) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `vat_rate` double DEFAULT NULL,
  `checked` int(11) DEFAULT '0',
  `rank` int(11) DEFAULT '0',
  PRIMARY KEY (`id`,`lang`),
  KEY `service_lang_fkey` (`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `pm_service`
--

INSERT INTO `pm_service` (`id`, `lang`, `id_user`, `title`, `descr`, `long_descr`, `type`, `rooms`, `price`, `vat_rate`, `checked`, `rank`) VALUES
(1, 1, 1, 'Set de toilette', '1 serviette de toilette, 1 drap de douche, 1 tapis', '', 'qty-night', '4,1,3,2', 7, 10, 1, 1),
(1, 2, 1, 'Rent of towel (kit)', '1 hand towel, 1 bath towel, 1 bath mat', '', 'qty-night', '4,1,3,2', 7, 10, 1, 1),
(1, 3, 1, 'Rent of towel (kit)', '1 hand towel, 1 bath towel, 1 bath mat', '', 'qty-night', '4,1,3,2', 7, 10, 1, 1),
(1, 4, 1, 'Rent of towel (kit)', '1 hand towel, 1 bath towel, 1 bath mat', '', 'qty-night', '4,1,3,2', 7, 10, 1, 1),
(2, 1, 1, 'Ménage', '', '', 'package', '1,3,2', 50, 10, 1, 2),
(2, 2, 1, 'Housework', '', '', 'package', '1,3,2', 50, 10, 1, 2),
(2, 3, 1, 'Housework', '', '', 'package', '1,3,2', 50, 10, 1, 2),
(2, 4, 1, 'Housework', '', '', 'package', '1,3,2', 50, 10, 1, 2),
(3, 1, 1, 'Chauffage', '', '', 'night', '1,3,2', 8, 10, 1, 3),
(3, 2, 1, 'Heating', '', '', 'night', '1,3,2', 8, 10, 1, 3),
(3, 3, 1, 'Heating', '', '', 'night', '1,3,2', 8, 10, 1, 3),
(3, 4, 1, 'Heating', '', '', 'night', '1,3,2', 8, 10, 1, 3),
(4, 1, 1, 'Animal domestique', 'Précisez la race ci-dessous', '', 'qty-night', '4,1,3,2', 5, 10, 1, 4),
(4, 2, 1, 'Pet', 'Specify the breed below', '', 'qty-night', '4,1,3,2', 5, 10, 1, 4),
(4, 3, 1, 'Pet', 'Specify the breed below', '', 'qty-night', '4,1,3,2', 5, 10, 1, 4),
(4, 4, 1, 'Pet', 'Specify the breed below', '', 'qty-night', '4,1,3,2', 5, 10, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `pm_slide`
--

DROP TABLE IF EXISTS `pm_slide`;
CREATE TABLE IF NOT EXISTS `pm_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `legend` text,
  `url` varchar(250) DEFAULT NULL,
  `id_page` int(11) DEFAULT NULL,
  `checked` int(11) DEFAULT '0',
  `rank` int(11) DEFAULT '0',
  PRIMARY KEY (`id`,`lang`),
  KEY `slide_lang_fkey` (`lang`),
  KEY `slide_page_fkey` (`id_page`,`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `pm_slide`
--

INSERT INTO `pm_slide` (`id`, `lang`, `legend`, `url`, `id_page`, `checked`, `rank`) VALUES
(1, 1, '', '', 1, 2, 2),
(1, 2, '<h1>Pesan kamar sekarang lebih mudah</h1>\r\n\r\n<h2 style="text-align: center;"> </h2>\r\n', '', 1, 2, 2),
(1, 3, '', '', 1, 2, 2),
(1, 4, '<h1>Pesan kamar sekarang lebih mudah</h1>\r\n\r\n<h2 style="text-align: center;"> </h2>\r\n', '', 1, 2, 2),
(2, 1, '', '', 1, 1, 3),
(2, 2, '', '', 1, 1, 3),
(2, 3, '', '', 1, 1, 3),
(2, 4, '', '', 1, 1, 3),
(3, 1, '', '', 1, 2, 1),
(3, 2, '', '', 1, 2, 1),
(3, 3, '', '', 1, 2, 1),
(3, 4, '', '', 1, 2, 1),
(4, 1, '', '', 1, 1, 4),
(4, 2, '', '', 1, 1, 4),
(4, 3, '', '', 1, 1, 4),
(4, 4, '', '', 1, 1, 4),
(6, 1, '', '', 1, 1, 5),
(6, 2, '', '', 1, 1, 5),
(6, 3, '', '', 1, 1, 5),
(6, 4, '', '', 1, 1, 5),
(9, 1, '', '', 1, 1, 6),
(9, 2, '', '', 1, 1, 6),
(9, 3, '', '', 1, 1, 6),
(9, 4, '', '', 1, 1, 6),
(10, 1, '', '', 1, 2, 7),
(10, 2, '', '', 1, 2, 7),
(10, 3, '', '', 1, 2, 7),
(10, 4, '', '', 1, 2, 7);

-- --------------------------------------------------------

--
-- Table structure for table `pm_slide_file`
--

DROP TABLE IF EXISTS `pm_slide_file`;
CREATE TABLE IF NOT EXISTS `pm_slide_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `home` int(11) DEFAULT '0',
  `checked` int(11) DEFAULT '1',
  `rank` int(11) DEFAULT '0',
  `file` varchar(250) DEFAULT NULL,
  `label` varchar(250) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  KEY `slide_file_fkey` (`id_item`,`lang`),
  KEY `slide_file_lang_fkey` (`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `pm_slide_file`
--

INSERT INTO `pm_slide_file` (`id`, `lang`, `id_item`, `home`, `checked`, `rank`, `file`, `label`, `type`) VALUES
(4, 1, 2, 0, 1, 3, 'slide2.jpg', '', 'image'),
(4, 2, 2, 0, 1, 3, 'slide2.jpg', '', 'image'),
(4, 3, 2, 0, 1, 3, 'slide2.jpg', '', 'image'),
(4, 4, 2, 0, 1, 3, 'slide2.jpg', '', 'image'),
(6, 1, 3, 0, 1, 4, 'slide3.jpg', '', 'image'),
(6, 2, 3, 0, 1, 4, 'slide3.jpg', '', 'image'),
(6, 3, 3, 0, 1, 4, 'slide3.jpg', '', 'image'),
(6, 4, 3, 0, 1, 4, 'slide3.jpg', '', 'image'),
(8, 1, 1, NULL, 1, 5, 'pashotel-main.jpg', NULL, 'image'),
(8, 2, 1, NULL, 1, 5, 'pashotel-main.jpg', NULL, 'image'),
(8, 3, 1, NULL, 1, 5, 'pashotel-main.jpg', NULL, 'image'),
(8, 4, 1, NULL, 1, 5, 'pashotel-main.jpg', NULL, 'image'),
(9, 1, 4, NULL, 1, 6, 'shutterstock-560490589.jpg', '', 'image'),
(9, 2, 4, NULL, 1, 6, 'shutterstock-560490589.jpg', '', 'image'),
(9, 3, 4, NULL, 1, 6, 'shutterstock-560490589.jpg', '', 'image'),
(9, 4, 4, NULL, 1, 6, 'shutterstock-560490589.jpg', '', 'image'),
(10, 1, 6, NULL, 1, 7, 'shutterstock-569484184.jpg', '', 'image'),
(10, 2, 6, NULL, 1, 7, 'shutterstock-569484184.jpg', '', 'image'),
(10, 3, 6, NULL, 1, 7, 'shutterstock-569484184.jpg', '', 'image'),
(10, 4, 6, NULL, 1, 7, 'shutterstock-569484184.jpg', '', 'image'),
(13, 1, 9, NULL, 1, 9, 'banner-pashotel-1.png', NULL, 'image'),
(13, 2, 9, NULL, 1, 9, 'banner-pashotel-1.png', NULL, 'image'),
(13, 3, 9, NULL, 1, 9, 'banner-pashotel-1.png', NULL, 'image'),
(13, 4, 9, NULL, 1, 9, 'banner-pashotel-1.png', NULL, 'image'),
(14, 1, 10, NULL, 1, 1, 'banner-pashotel-1-1.png', NULL, 'image'),
(14, 2, 10, NULL, 1, 1, 'banner-pashotel-1-1.png', NULL, 'image'),
(14, 3, 10, NULL, 1, 1, 'banner-pashotel-1-1.png', NULL, 'image'),
(14, 4, 10, NULL, 1, 1, 'banner-pashotel-1-1.png', NULL, 'image');

-- --------------------------------------------------------

--
-- Table structure for table `pm_tag`
--

DROP TABLE IF EXISTS `pm_tag`;
CREATE TABLE IF NOT EXISTS `pm_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `value` varchar(250) DEFAULT NULL,
  `pages` varchar(250) DEFAULT NULL,
  `checked` int(11) DEFAULT '0',
  `rank` int(11) DEFAULT '0',
  PRIMARY KEY (`id`,`lang`),
  KEY `tag_lang_fkey` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pm_text`
--

DROP TABLE IF EXISTS `pm_text`;
CREATE TABLE IF NOT EXISTS `pm_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`,`lang`),
  KEY `text_lang_fkey` (`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=138 ;

--
-- Dumping data for table `pm_text`
--

INSERT INTO `pm_text` (`id`, `lang`, `name`, `value`) VALUES
(1, 1, 'CREATION', 'Création'),
(1, 2, 'CREATION', 'Creation'),
(1, 3, 'CREATION', 'إنشاء'),
(1, 4, 'CREATION', 'Creation'),
(2, 1, 'MESSAGE', 'Message'),
(2, 2, 'MESSAGE', 'Message'),
(2, 3, 'MESSAGE', 'رسالة'),
(2, 4, 'MESSAGE', 'Message'),
(3, 1, 'EMAIL', 'E-mail'),
(3, 2, 'EMAIL', 'E-mail'),
(3, 3, 'EMAIL', 'بَرِيدٌ إلِكْترونيّ'),
(3, 4, 'EMAIL', 'E-mail'),
(4, 1, 'PHONE', 'Tél.'),
(4, 2, 'PHONE', 'Phone'),
(4, 3, 'PHONE', 'رقم هاتف'),
(4, 4, 'PHONE', 'Phone'),
(5, 1, 'FAX', 'Fax'),
(5, 2, 'FAX', 'Fax'),
(5, 3, 'FAX', 'فاكس'),
(5, 4, 'FAX', 'Fax'),
(6, 1, 'COMPANY', 'Société'),
(6, 2, 'COMPANY', 'Company'),
(6, 3, 'COMPANY', 'مشروع'),
(6, 4, 'COMPANY', 'Company'),
(7, 1, 'COPY_CODE', 'Recopiez le code'),
(7, 2, 'COPY_CODE', 'Copy the code'),
(7, 3, 'COPY_CODE', 'رمز الأمان'),
(7, 4, 'COPY_CODE', 'Copy the code'),
(8, 1, 'SUBJECT', 'Sujet'),
(8, 2, 'SUBJECT', 'Subject'),
(8, 3, 'SUBJECT', 'موضوع'),
(8, 4, 'SUBJECT', 'Subject'),
(9, 1, 'REQUIRED_FIELD', 'Champ requis'),
(9, 2, 'REQUIRED_FIELD', 'Required field'),
(9, 3, 'REQUIRED_FIELD', 'الحقل المطلوب'),
(9, 4, 'REQUIRED_FIELD', 'Required field'),
(10, 1, 'INVALID_CAPTCHA_CODE', 'Le code de sécurité saisi est incorrect'),
(10, 2, 'INVALID_CAPTCHA_CODE', 'Invalid security code'),
(10, 3, 'INVALID_CAPTCHA_CODE', 'رمز الحماية أدخلته غير صحيح'),
(10, 4, 'INVALID_CAPTCHA_CODE', 'Invalid security code'),
(11, 1, 'INVALID_EMAIL', 'Adresse e-mail invalide'),
(11, 2, 'INVALID_EMAIL', 'Invalid email address'),
(11, 3, 'INVALID_EMAIL', 'بريد إلكتروني خاطئ'),
(11, 4, 'INVALID_EMAIL', 'Invalid email address'),
(12, 1, 'FIRSTNAME', 'Prénom'),
(12, 2, 'FIRSTNAME', 'Firstname'),
(12, 3, 'FIRSTNAME', 'الاسم الأول'),
(12, 4, 'FIRSTNAME', 'Firstname'),
(13, 1, 'LASTNAME', 'Nom'),
(13, 2, 'LASTNAME', 'Lastname'),
(13, 3, 'LASTNAME', 'اسم العائلة'),
(13, 4, 'LASTNAME', 'Lastname'),
(14, 1, 'ADDRESS', 'Adresse'),
(14, 2, 'ADDRESS', 'Address'),
(14, 3, 'ADDRESS', 'عنوان الشارع'),
(14, 4, 'ADDRESS', 'Address'),
(15, 1, 'POSTCODE', 'Code postal'),
(15, 2, 'POSTCODE', 'Post code'),
(15, 3, 'POSTCODE', 'الرمز البريدي'),
(15, 4, 'POSTCODE', 'Post code'),
(16, 1, 'CITY', 'Ville'),
(16, 2, 'CITY', 'City'),
(16, 3, 'CITY', 'مدينة'),
(16, 4, 'CITY', 'City'),
(17, 1, 'MOBILE', 'Portable'),
(17, 2, 'MOBILE', 'Mobile'),
(17, 3, 'MOBILE', 'هاتف'),
(17, 4, 'MOBILE', 'Mobile'),
(18, 1, 'ADD', 'Ajouter'),
(18, 2, 'ADD', 'Add'),
(18, 3, 'ADD', 'إضافة على'),
(18, 4, 'ADD', 'Add'),
(19, 1, 'EDIT', 'Modifier'),
(19, 2, 'EDIT', 'Edit'),
(19, 3, 'EDIT', 'تغيير'),
(19, 4, 'EDIT', 'Edit'),
(20, 1, 'INVALID_INPUT', 'Saisie invalide'),
(20, 2, 'INVALID_INPUT', 'Invalid input'),
(20, 3, 'INVALID_INPUT', 'إدخال غير صالح'),
(20, 4, 'INVALID_INPUT', 'Invalid input'),
(21, 1, 'MAIL_DELIVERY_FAILURE', 'Echec lors de l''envoi du message.'),
(21, 2, 'MAIL_DELIVERY_FAILURE', 'A failure occurred during the delivery of this message.'),
(21, 3, 'MAIL_DELIVERY_FAILURE', 'حدث فشل أثناء تسليم هذه الرسالة.'),
(21, 4, 'MAIL_DELIVERY_FAILURE', 'A failure occurred during the delivery of this message.'),
(22, 1, 'MAIL_DELIVERY_SUCCESS', 'Merci de votre intérêt, votre message a bien été envoyé.\nNous vous contacterons dans les plus brefs délais.'),
(22, 2, 'MAIL_DELIVERY_SUCCESS', 'Thank you for your interest, your message has been sent.\nWe will contact you as soon as possible.'),
(22, 3, 'MAIL_DELIVERY_SUCCESS', 'خزان لاهتمامك ، تم إرسال رسالتك . سوف نتصل بك في أقرب وقت ممكن .'),
(22, 4, 'MAIL_DELIVERY_SUCCESS', 'Thank you for your interest, your message has been sent.\nWe will contact you as soon as possible.'),
(23, 1, 'SEND', 'Envoyer'),
(23, 2, 'SEND', 'Send'),
(23, 3, 'SEND', 'ارسل انت'),
(23, 4, 'SEND', 'Send'),
(24, 1, 'FORM_ERRORS', 'Le formulaire comporte des erreurs.'),
(24, 2, 'FORM_ERRORS', 'The following form contains some errors.'),
(24, 3, 'FORM_ERRORS', 'النموذج التالي يحتوي على بعض الأخطاء.'),
(24, 4, 'FORM_ERRORS', 'The following form contains some errors.'),
(25, 1, 'FROM_DATE', 'Du'),
(25, 2, 'FROM_DATE', 'From'),
(25, 3, 'FROM_DATE', 'من'),
(25, 4, 'FROM_DATE', 'From'),
(26, 1, 'TO_DATE', 'au'),
(26, 2, 'TO_DATE', 'till'),
(26, 3, 'TO_DATE', 'حتى'),
(26, 4, 'TO_DATE', 'till'),
(27, 1, 'FROM', 'De'),
(27, 2, 'FROM', 'From'),
(27, 3, 'FROM', 'من'),
(27, 4, 'FROM', 'From'),
(28, 1, 'TO', 'à'),
(28, 2, 'TO', 'to'),
(28, 3, 'TO', 'إلى'),
(28, 4, 'TO', 'to'),
(29, 1, 'BOOK', 'Réserver'),
(29, 2, 'BOOK', 'Book'),
(29, 3, 'BOOK', 'للحجز'),
(29, 4, 'BOOK', 'Book'),
(30, 1, 'READMORE', 'Lire la suite'),
(30, 2, 'READMORE', 'Read more'),
(30, 3, 'READMORE', 'اقرأ المزيد'),
(30, 4, 'READMORE', 'Read more'),
(31, 1, 'BACK', 'Retour'),
(31, 2, 'BACK', 'Back'),
(31, 3, 'BACK', 'عودة'),
(31, 4, 'BACK', 'Back'),
(32, 1, 'DISCOVER', 'Découvrir'),
(32, 2, 'DISCOVER', 'Discover'),
(32, 3, 'DISCOVER', 'اكتشف'),
(32, 4, 'DISCOVER', 'Discover'),
(33, 1, 'ALL', 'Tous'),
(33, 2, 'ALL', 'All'),
(33, 3, 'ALL', 'كل'),
(33, 4, 'ALL', 'All'),
(34, 1, 'ALL_RIGHTS_RESERVED', 'Tous droits réservés'),
(34, 2, 'ALL_RIGHTS_RESERVED', 'All rights reserved'),
(34, 3, 'ALL_RIGHTS_RESERVED', 'جميع الحقوق محفوظه'),
(34, 4, 'ALL_RIGHTS_RESERVED', 'All rights reserved'),
(35, 1, 'FORGOTTEN_PASSWORD', 'Mot de passe oublié ?'),
(35, 2, 'FORGOTTEN_PASSWORD', 'Forgotten password?'),
(35, 3, 'FORGOTTEN_PASSWORD', 'هل نسيت كلمة المرور؟'),
(35, 4, 'FORGOTTEN_PASSWORD', 'Forgotten password?'),
(36, 1, 'LOG_IN', 'Connexion'),
(36, 2, 'LOG_IN', 'Log in'),
(36, 3, 'LOG_IN', 'تسجيل الدخول'),
(36, 4, 'LOG_IN', 'Log in'),
(37, 1, 'SIGN_UP', 'Inscription'),
(37, 2, 'SIGN_UP', 'Sign up'),
(37, 3, 'SIGN_UP', 'تسجيل'),
(37, 4, 'SIGN_UP', 'Sign up'),
(38, 1, 'LOG_OUT', 'Déconnexion'),
(38, 2, 'LOG_OUT', 'Log out'),
(38, 3, 'LOG_OUT', 'تسجيل الخروج'),
(38, 4, 'LOG_OUT', 'Log out'),
(39, 1, 'SEARCH', 'Rechercher'),
(39, 2, 'SEARCH', 'Search'),
(39, 3, 'SEARCH', 'ابحث عن'),
(39, 4, 'SEARCH', 'Search'),
(40, 1, 'RESET_PASS_SUCCESS', 'Votre nouveau mot de passe vous a été envoyé sur votre adresse e-mail.'),
(40, 2, 'RESET_PASS_SUCCESS', 'Your new password was sent to you on your e-mail.'),
(40, 3, 'RESET_PASS_SUCCESS', 'تم إرسال كلمة المرور الجديدة إلى عنوان البريد الإلكتروني الخاص بك'),
(40, 4, 'RESET_PASS_SUCCESS', 'Your new password was sent to you on your e-mail.'),
(41, 1, 'PASS_TOO_SHORT', 'Le mot de passe doit contenir 6 caractères au minimum'),
(41, 2, 'PASS_TOO_SHORT', 'The password must contain 6 characters at least'),
(41, 3, 'PASS_TOO_SHORT', 'يجب أن يحتوي على كلمة المرور ستة أحرف على الأقل'),
(41, 4, 'PASS_TOO_SHORT', 'The password must contain 6 characters at least'),
(42, 1, 'PASS_DONT_MATCH', 'Les mots de passe doivent correspondre'),
(42, 2, 'PASS_DONT_MATCH', 'The passwords don''t match'),
(42, 3, 'PASS_DONT_MATCH', 'يجب أن تتطابق كلمات المرور'),
(42, 4, 'PASS_DONT_MATCH', 'The passwords don''t match'),
(43, 1, 'ACCOUNT_EXISTS', 'Un compte existe déjà avec cette adresse e-mail'),
(43, 2, 'ACCOUNT_EXISTS', 'An account already exists with this e-mail'),
(43, 3, 'ACCOUNT_EXISTS', 'حساب موجود بالفعل مع هذا عنوان البريد الإلكتروني'),
(43, 4, 'ACCOUNT_EXISTS', 'An account already exists with this e-mail'),
(44, 1, 'ACCOUNT_CREATED', 'Votre compte a bien été créé. Vous allez recevoir un email pour valider votre compte.'),
(44, 2, 'ACCOUNT_CREATED', 'Your account has been created. You will receive an email to confirm your account.'),
(44, 3, 'ACCOUNT_CREATED', 'لقد تم إنشاء حسابك. سوف تتلقى رسالة بريد إلكتروني لتأكيد حسابك.'),
(44, 4, 'ACCOUNT_CREATED', 'Your account has been created. You will receive an email to confirm your account.'),
(45, 1, 'INCORRECT_LOGIN', 'Les informations de connexion sont incorrectes.'),
(45, 2, 'INCORRECT_LOGIN', 'Incorrect login information.'),
(45, 3, 'INCORRECT_LOGIN', 'معلومات تسجيل الدخول غير صحيحة.'),
(45, 4, 'INCORRECT_LOGIN', 'Incorrect login information.'),
(46, 1, 'I_SIGN_UP', 'Je m''inscris'),
(46, 2, 'I_SIGN_UP', 'I sign up'),
(46, 3, 'I_SIGN_UP', 'يمكنني الاشتراك'),
(46, 4, 'I_SIGN_UP', 'I sign up'),
(47, 1, 'ALREADY_HAVE_ACCOUNT', 'J''ai déjà un compte'),
(47, 2, 'ALREADY_HAVE_ACCOUNT', 'I already have an account'),
(47, 3, 'ALREADY_HAVE_ACCOUNT', 'لدي بالفعل حساب'),
(47, 4, 'ALREADY_HAVE_ACCOUNT', 'I already have an account'),
(48, 1, 'MY_ACCOUNT', 'Mon compte'),
(48, 2, 'MY_ACCOUNT', 'My account'),
(48, 3, 'MY_ACCOUNT', 'حسابي'),
(48, 4, 'MY_ACCOUNT', 'My account'),
(49, 1, 'COMMENTS', 'Commentaires'),
(49, 2, 'COMMENTS', 'Comments'),
(49, 3, 'COMMENTS', 'تعليقات'),
(49, 4, 'COMMENTS', 'Comments'),
(50, 1, 'LET_US_KNOW', 'Faîtes-nous savoir ce que vous pensez'),
(50, 2, 'LET_US_KNOW', 'Let us know what you think'),
(50, 3, 'LET_US_KNOW', 'ماذا عن رايك؟'),
(50, 4, 'LET_US_KNOW', 'Let us know what you think'),
(51, 1, 'COMMENT_SUCCESS', 'Merci de votre intérêt, votre commentaire va être soumis à validation.'),
(51, 2, 'COMMENT_SUCCESS', 'Thank you for your interest, your comment will be checked.'),
(51, 3, 'COMMENT_SUCCESS', 'شكرا ل اهتمامك، و سيتم التحقق من صحة للتعليق.'),
(51, 4, 'COMMENT_SUCCESS', 'Thank you for your interest, your comment will be checked.'),
(52, 1, 'NO_SEARCH_RESULT', 'Aucun résultat. Vérifiez l''orthographe des termes de recherche (> 3 caractères) ou essayez d''autres mots.'),
(52, 2, 'NO_SEARCH_RESULT', 'No result. Check the spelling terms of search (> 3 characters) or try other words.'),
(52, 3, 'NO_SEARCH_RESULT', 'لا نتيجة. التدقيق الإملائي للكلمات (أكثر من ثلاثة أحرف ) أو محاولة بعبارة أخرى .'),
(52, 4, 'NO_SEARCH_RESULT', 'No result. Check the spelling terms of search (> 3 characters) or try other words.'),
(53, 1, 'SEARCH_EXCEEDED', 'Nombre de recherches dépassé.'),
(53, 2, 'SEARCH_EXCEEDED', 'Number of researches exceeded.'),
(53, 3, 'SEARCH_EXCEEDED', 'عدد من الأبحاث السابقة .'),
(53, 4, 'SEARCH_EXCEEDED', 'Number of researches exceeded.'),
(54, 1, 'SECONDS', 'secondes'),
(54, 2, 'SECONDS', 'seconds'),
(54, 3, 'SECONDS', 'ثواني'),
(54, 4, 'SECONDS', 'seconds'),
(55, 1, 'FOR_A_TOTAL_OF', 'sur un total de'),
(55, 2, 'FOR_A_TOTAL_OF', 'for a total of'),
(55, 3, 'FOR_A_TOTAL_OF', 'من الكل'),
(55, 4, 'FOR_A_TOTAL_OF', 'for a total of'),
(56, 1, 'COMMENT', 'Commentaire'),
(56, 2, 'COMMENT', 'Comment'),
(56, 3, 'COMMENT', 'تعقيب'),
(56, 4, 'COMMENT', 'Comment'),
(57, 1, 'VIEW', 'Visionner'),
(57, 2, 'VIEW', 'View'),
(57, 3, 'VIEW', 'ل عرض'),
(57, 4, 'VIEW', 'View'),
(58, 1, 'RECENT_ARTICLES', 'Articles récents'),
(58, 2, 'RECENT_ARTICLES', 'Recent articles'),
(58, 3, 'RECENT_ARTICLES', 'المقالات الأخيرة'),
(58, 4, 'RECENT_ARTICLES', 'Recent articles'),
(59, 1, 'RSS_FEED', 'Flux RSS'),
(59, 2, 'RSS_FEED', 'RSS feed'),
(59, 3, 'RSS_FEED', 'تغذية RSS'),
(59, 4, 'RSS_FEED', 'RSS feed'),
(60, 1, 'COUNTRY', 'Pays'),
(60, 2, 'COUNTRY', 'Country'),
(60, 3, 'COUNTRY', 'Country'),
(60, 4, 'COUNTRY', 'Country'),
(61, 1, 'ROOM', 'Chambre'),
(61, 2, 'ROOM', 'Room'),
(61, 3, 'ROOM', 'Room'),
(61, 4, 'ROOM', 'Room'),
(62, 1, 'INCL_VAT', 'TTC'),
(62, 2, 'INCL_VAT', 'incl. VAT'),
(62, 3, 'INCL_VAT', 'incl. VAT'),
(62, 4, 'INCL_VAT', 'incl. VAT'),
(63, 1, 'NIGHTS', 'nuit(s)'),
(63, 2, 'NIGHTS', 'night(s)'),
(63, 3, 'NIGHTS', 'night(s)'),
(63, 4, 'NIGHTS', 'night(s)'),
(64, 1, 'ADULTS', 'Adultes'),
(64, 2, 'ADULTS', 'Adults'),
(64, 3, 'ADULTS', 'Adults'),
(64, 4, 'ADULTS', 'Adults'),
(65, 1, 'CHILDREN', 'Enfants'),
(65, 2, 'CHILDREN', 'Children'),
(65, 3, 'CHILDREN', 'Children'),
(65, 4, 'CHILDREN', 'Children'),
(66, 1, 'PERSONS', 'personne(s)'),
(66, 2, 'PERSONS', 'person(s)'),
(66, 3, 'PERSONS', 'person(s)'),
(66, 4, 'PERSONS', 'person(s)'),
(67, 1, 'CONTACT_DETAILS', 'Coordonnées'),
(67, 2, 'CONTACT_DETAILS', 'Contact details'),
(67, 3, 'CONTACT_DETAILS', 'Contact details'),
(67, 4, 'CONTACT_DETAILS', 'Contact details'),
(68, 1, 'NO_AVAILABILITY', 'Aucune disponibilité'),
(68, 2, 'NO_AVAILABILITY', 'No availability'),
(68, 3, 'NO_AVAILABILITY', 'No availability'),
(68, 4, 'NO_AVAILABILITY', 'No availability'),
(69, 1, 'AVAILABILITIES', 'Disponibilités'),
(69, 2, 'AVAILABILITIES', 'Availabilities'),
(69, 3, 'AVAILABILITIES', 'Availabilities'),
(69, 4, 'AVAILABILITIES', 'Availabilities'),
(70, 1, 'CHECK', 'Vérifier'),
(70, 2, 'CHECK', 'Check'),
(70, 3, 'CHECK', 'Check'),
(70, 4, 'CHECK', 'Check'),
(71, 1, 'BOOKING_DETAILS', 'Détails de la réservation'),
(71, 2, 'BOOKING_DETAILS', 'Booking details'),
(71, 3, 'BOOKING_DETAILS', 'Booking details'),
(71, 4, 'BOOKING_DETAILS', 'Booking details'),
(72, 1, 'SPECIAL_REQUESTS', 'Demandes spéciales'),
(72, 2, 'SPECIAL_REQUESTS', 'Special requests'),
(72, 3, 'SPECIAL_REQUESTS', 'Special requests'),
(72, 4, 'SPECIAL_REQUESTS', 'Special requests'),
(73, 1, 'PREVIOUS_STEP', 'Étape précédente'),
(73, 2, 'PREVIOUS_STEP', 'Previous step'),
(73, 3, 'PREVIOUS_STEP', 'Previous step'),
(73, 4, 'PREVIOUS_STEP', 'Previous step'),
(74, 1, 'CONFIRM_BOOKING', 'Confirmer la réservation'),
(74, 2, 'CONFIRM_BOOKING', 'Confirm the booking'),
(74, 3, 'CONFIRM_BOOKING', 'Confirm the booking'),
(74, 4, 'CONFIRM_BOOKING', 'Confirm the booking'),
(75, 1, 'ALSO_DISCOVER', 'Découvrez aussi'),
(75, 2, 'ALSO_DISCOVER', 'Also discover'),
(75, 3, 'ALSO_DISCOVER', 'Also discover'),
(75, 4, 'ALSO_DISCOVER', 'Also discover'),
(76, 1, 'CHECK_PEOPLE', 'Merci de vérifier le nombre de personnes pour l''hébergement choisi.'),
(76, 2, 'CHECK_PEOPLE', 'Please verify the number of people for the chosen accommodation'),
(76, 3, 'CHECK_PEOPLE', 'Please verify the number of people for the chosen accommodation'),
(76, 4, 'CHECK_PEOPLE', 'Please verify the number of people for the chosen accommodation'),
(77, 1, 'BOOKING', 'Réservation'),
(77, 2, 'BOOKING', 'Booking'),
(77, 3, 'BOOKING', 'Booking'),
(77, 4, 'BOOKING', 'Booking'),
(78, 1, 'NIGHT', 'nuit'),
(78, 2, 'NIGHT', 'night'),
(78, 3, 'NIGHT', 'night'),
(78, 4, 'NIGHT', 'night'),
(79, 1, 'WEEK', 'semaine'),
(79, 2, 'WEEK', 'week'),
(79, 3, 'WEEK', 'week'),
(79, 4, 'WEEK', 'week'),
(80, 1, 'EXTRA_SERVICES', 'Services supplémentaires'),
(80, 2, 'EXTRA_SERVICES', 'Extra services'),
(80, 3, 'EXTRA_SERVICES', 'Extra services'),
(80, 4, 'EXTRA_SERVICES', 'Extra services'),
(81, 1, 'BOOKING_TERMS', ''),
(81, 2, 'BOOKING_TERMS', ''),
(81, 3, 'BOOKING_TERMS', ''),
(81, 4, 'BOOKING_TERMS', ''),
(82, 1, 'NEXT_STEP', 'Étape suivante'),
(82, 2, 'NEXT_STEP', 'Next step'),
(82, 3, 'NEXT_STEP', 'Next step'),
(82, 4, 'NEXT_STEP', 'Next step'),
(83, 1, 'TOURIST_TAX', 'Taxe de séjour'),
(83, 2, 'TOURIST_TAX', 'Tourist tax'),
(83, 3, 'TOURIST_TAX', 'Tourist tax'),
(83, 4, 'TOURIST_TAX', 'Tourist tax'),
(84, 1, 'CHECK_IN', 'Arrivée'),
(84, 2, 'CHECK_IN', 'Check in'),
(84, 3, 'CHECK_IN', 'Check in'),
(84, 4, 'CHECK_IN', 'Check in'),
(85, 1, 'CHECK_OUT', 'Départ'),
(85, 2, 'CHECK_OUT', 'Check out'),
(85, 3, 'CHECK_OUT', 'Check out'),
(85, 4, 'CHECK_OUT', 'Check out'),
(86, 1, 'TOTAL', 'Total'),
(86, 2, 'TOTAL', 'Total'),
(86, 3, 'TOTAL', 'Total'),
(86, 4, 'TOTAL', 'Total'),
(87, 1, 'CAPACITY', 'Capacité'),
(87, 2, 'CAPACITY', 'Capacity'),
(87, 3, 'CAPACITY', 'Capacity'),
(87, 4, 'CAPACITY', 'Capacity'),
(88, 1, 'FACILITIES', 'Équipements'),
(88, 2, 'FACILITIES', 'Facilities'),
(88, 3, 'FACILITIES', 'Facilities'),
(88, 4, 'FACILITIES', 'Facilities'),
(89, 1, 'PRICE', 'Prix'),
(89, 2, 'PRICE', 'Price'),
(89, 3, 'PRICE', 'Price'),
(89, 4, 'PRICE', 'Price'),
(90, 1, 'MORE_DETAILS', 'Plus d''infos'),
(90, 2, 'MORE_DETAILS', 'Room Info'),
(90, 3, 'MORE_DETAILS', 'More details'),
(90, 4, 'MORE_DETAILS', 'More details'),
(91, 1, 'FROM_PRICE', 'À partir de'),
(91, 2, 'FROM_PRICE', 'From'),
(91, 3, 'FROM_PRICE', 'From'),
(91, 4, 'FROM_PRICE', 'From'),
(92, 1, 'AMOUNT', 'Montant'),
(92, 2, 'AMOUNT', 'Amount'),
(92, 3, 'AMOUNT', 'Amount'),
(92, 4, 'AMOUNT', 'Amount'),
(93, 1, 'PAY', 'Payer'),
(93, 2, 'PAY', 'Check out'),
(93, 3, 'PAY', 'Check out'),
(93, 4, 'PAY', 'Check out'),
(94, 1, 'PAYMENT_PAYPAL_NOTICE', 'Cliquez sur "Payer" ci-dessous, vous allez être redirigé vers le site sécurisé de PayPal'),
(94, 2, 'PAYMENT_PAYPAL_NOTICE', 'Click on "Check Out" below, you will be redirected towards the secure site of PayPal'),
(94, 3, 'PAYMENT_PAYPAL_NOTICE', 'Click on "Check Out" below, you will be redirected towards the secure site of PayPal'),
(94, 4, 'PAYMENT_PAYPAL_NOTICE', 'Click on "Check Out" below, you will be redirected towards the secure site of PayPal'),
(95, 1, 'PAYMENT_CANCEL_NOTICE', 'Le paiement a été annulé.<br>Merci de votre visite et à bientôt.'),
(95, 2, 'PAYMENT_CANCEL_NOTICE', 'The payment has been cancelled.<br>Thank you for your visit and see you soon.'),
(95, 3, 'PAYMENT_CANCEL_NOTICE', 'The payment has been cancelled.<br>Thank you for your visit and see you soon.'),
(95, 4, 'PAYMENT_CANCEL_NOTICE', 'The payment has been cancelled.<br>Thank you for your visit and see you soon.'),
(96, 1, 'PAYMENT_SUCCESS_NOTICE', 'Le paiement a été réalisé avec succès.<br>Merci de votre visite et à bientôt !'),
(96, 2, 'PAYMENT_SUCCESS_NOTICE', 'Your payment has been successfully processed.<br>Thank you for your visit and see you soon!'),
(96, 3, 'PAYMENT_SUCCESS_NOTICE', 'Your payment has been successfully processed.<br>Thank you for your visit and see you soon!'),
(96, 4, 'PAYMENT_SUCCESS_NOTICE', 'Your payment has been successfully processed.<br>Thank you for your visit and see you soon!'),
(97, 1, 'BILLING_ADDRESS', 'Adresse de facturation'),
(97, 2, 'BILLING_ADDRESS', 'Billing address'),
(97, 3, 'BILLING_ADDRESS', 'Billing address'),
(97, 4, 'BILLING_ADDRESS', 'Billing address'),
(98, 1, 'DOWN_PAYMENT', 'Acompte'),
(98, 2, 'DOWN_PAYMENT', 'Down payment'),
(98, 3, 'DOWN_PAYMENT', 'Down payment'),
(98, 4, 'DOWN_PAYMENT', 'Down payment'),
(99, 1, 'PAYMENT_CHECK_NOTICE', 'Merci d''envoyer un chèque à "Panda Multi Resorts, Neeloafaru Magu, Maldives" d''un montant de {amount}.<br>Votre réservation sera validée à réception du paiement.<br>Merci de votre visite et à bientôt !'),
(99, 2, 'PAYMENT_CHECK_NOTICE', 'Thank you for sending a check of {amount} to "Panda Multi Resorts, Neeloafaru Magu, Maldives".<br>Your reservation will be confirmed upon receipt of the payment.<br>Thank you for your visit and see you soon!'),
(99, 3, 'PAYMENT_CHECK_NOTICE', 'Thank you for sending a check of {amount} to "Panda Multi Resorts, Neeloafaru Magu, Maldives".<br>Your reservation will be confirmed upon receipt of the payment.<br>Thank you for your visit and see you soon!'),
(99, 4, 'PAYMENT_CHECK_NOTICE', 'Thank you for sending a check of {amount} to "Panda Multi Resorts, Neeloafaru Magu, Maldives".<br>Your reservation will be confirmed upon receipt of the payment.<br>Thank you for your visit and see you soon!'),
(100, 1, 'PAYMENT_ARRIVAL_NOTICE', 'Veuillez régler le solde de votre réservation d''un montant de {amount} à votre arrivée.<br>Merci de votre visite et à bientôt !'),
(100, 2, 'PAYMENT_ARRIVAL_NOTICE', 'Thank you for paying the balance of {amount} for your booking on your arrival.<br>Thank you for your visit and see you soon!'),
(100, 3, 'PAYMENT_ARRIVAL_NOTICE', 'Thank you for paying the balance of {amount} for your booking on your arrival.<br>Thank you for your visit and see you soon!'),
(100, 4, 'PAYMENT_ARRIVAL_NOTICE', 'Thank you for paying the balance of {amount} for your booking on your arrival.<br>Thank you for your visit and see you soon!'),
(101, 1, 'MAX_PEOPLE', 'Pers. max'),
(101, 2, 'MAX_PEOPLE', 'Max people'),
(101, 3, 'MAX_PEOPLE', 'Max people'),
(101, 4, 'MAX_PEOPLE', 'Max people'),
(102, 1, 'VAT_AMOUNT', 'Dont TVA'),
(102, 2, 'VAT_AMOUNT', 'VAT amount'),
(102, 3, 'VAT_AMOUNT', 'VAT amount'),
(102, 4, 'VAT_AMOUNT', 'VAT amount'),
(103, 1, 'MIN_NIGHTS', 'Nuits min'),
(103, 2, 'MIN_NIGHTS', 'Min nights'),
(103, 3, 'MIN_NIGHTS', 'Min nights'),
(103, 4, 'MIN_NIGHTS', 'Min nights'),
(104, 1, 'ROOMS', 'Chambres'),
(104, 2, 'ROOMS', 'Rooms'),
(104, 3, 'ROOMS', 'Rooms'),
(104, 4, 'ROOMS', 'Rooms'),
(105, 1, 'RATINGS', 'Note(s)'),
(105, 2, 'RATINGS', 'Rating(s)'),
(105, 3, 'RATINGS', 'Rating(s)'),
(105, 4, 'RATINGS', 'Rating(s)'),
(106, 1, 'MIN_PEOPLE', 'Pers. min'),
(106, 2, 'MIN_PEOPLE', 'Min people'),
(106, 3, 'MIN_PEOPLE', 'Min people'),
(106, 4, 'MIN_PEOPLE', 'Min people'),
(107, 1, 'HOTEL', 'Hôtel'),
(107, 2, 'HOTEL', 'Hotel'),
(107, 3, 'HOTEL', 'Hotel'),
(107, 4, 'HOTEL', 'Hotel'),
(108, 1, 'MAKE_A_REQUEST', 'Faire une demande'),
(108, 2, 'MAKE_A_REQUEST', 'Make a request'),
(108, 3, 'MAKE_A_REQUEST', 'Make a request'),
(108, 4, 'MAKE_A_REQUEST', 'Make a request'),
(109, 1, 'FULLNAME', 'Nom complet'),
(109, 2, 'FULLNAME', 'Full Name'),
(109, 3, 'FULLNAME', 'Full Name'),
(109, 4, 'FULLNAME', 'Full Name'),
(110, 1, 'PASSWORD', 'Mot de passe'),
(110, 2, 'PASSWORD', 'Password'),
(110, 3, 'PASSWORD', 'Password'),
(110, 4, 'PASSWORD', 'Password'),
(111, 1, 'LOG_IN_WITH_FACEBOOK', 'Enregistrez-vous avec Facebook'),
(111, 2, 'LOG_IN_WITH_FACEBOOK', 'Log in with Facebook'),
(111, 3, 'LOG_IN_WITH_FACEBOOK', 'Log in with Facebook'),
(111, 4, 'LOG_IN_WITH_FACEBOOK', 'Log in with Facebook'),
(112, 1, 'OR', 'Ou'),
(112, 2, 'OR', 'Or'),
(112, 3, 'OR', 'Or'),
(112, 4, 'OR', 'Or'),
(113, 1, 'NEW_PASSWORD', 'Nouveau mot de passe'),
(113, 2, 'NEW_PASSWORD', 'New password'),
(113, 3, 'NEW_PASSWORD', 'New password'),
(113, 4, 'NEW_PASSWORD', 'New password'),
(114, 1, 'NEW_PASSWORD_NOTICE', 'Merci d''entrer l''adresse e-mail correspondant à votre compte. Un nouveau mot de passe vous sera envoyé par e-mail.'),
(114, 2, 'NEW_PASSWORD_NOTICE', 'Please enter your e-mail address corresponding to your account. A new password will be sent to you by e-mail.'),
(114, 3, 'NEW_PASSWORD_NOTICE', 'Please enter your e-mail address corresponding to your account. A new password will be sent to you by e-mail.'),
(114, 4, 'NEW_PASSWORD_NOTICE', 'Please enter your e-mail address corresponding to your account. A new password will be sent to you by e-mail.'),
(115, 1, 'USERNAME', 'Utilisateur'),
(115, 2, 'USERNAME', 'Username'),
(115, 3, 'USERNAME', 'Username'),
(115, 4, 'USERNAME', 'Username'),
(116, 1, 'PASSWORD_CONFIRM', 'Confirmer mot de passe'),
(116, 2, 'PASSWORD_CONFIRM', 'Confirm password'),
(116, 3, 'PASSWORD_CONFIRM', 'Confirm password'),
(116, 4, 'PASSWORD_CONFIRM', 'Confirm password'),
(117, 1, 'USERNAME_EXISTS', 'Un compte existe déjà avec ce nom d''utilisateur'),
(117, 2, 'USERNAME_EXISTS', 'An account already exists with this username'),
(117, 3, 'USERNAME_EXISTS', 'An account already exists with this username'),
(117, 4, 'USERNAME_EXISTS', 'An account already exists with this username'),
(118, 1, 'ACCOUNT_EDIT_SUCCESS', 'Les informations de votre compte ont bien été modifiées.'),
(118, 2, 'ACCOUNT_EDIT_SUCCESS', 'Your account information have been changed.'),
(118, 3, 'ACCOUNT_EDIT_SUCCESS', 'Your account information have been changed.'),
(118, 4, 'ACCOUNT_EDIT_SUCCESS', 'Your account information have been changed.'),
(119, 1, 'ACCOUNT_EDIT_FAILURE', 'Echec de la modification des informations de compte.'),
(119, 2, 'ACCOUNT_EDIT_FAILURE', 'An error occured during the modification of the account information.'),
(119, 3, 'ACCOUNT_EDIT_FAILURE', 'An error occured during the modification of the account information.'),
(119, 4, 'ACCOUNT_EDIT_FAILURE', 'An error occured during the modification of the account information.'),
(120, 1, 'ACCOUNT_CREATE_FAILURE', 'Echec de la création du compte.'),
(120, 2, 'ACCOUNT_CREATE_FAILURE', 'Failed to create account.'),
(120, 3, 'ACCOUNT_CREATE_FAILURE', 'Failed to create account.'),
(120, 4, 'ACCOUNT_CREATE_FAILURE', 'Failed to create account.'),
(121, 1, 'PAYMENT_CHECK', 'Par chèque'),
(121, 2, 'PAYMENT_CHECK', 'By check'),
(121, 3, 'PAYMENT_CHECK', 'By check'),
(121, 4, 'PAYMENT_CHECK', 'By check'),
(122, 1, 'PAYMENT_ARRIVAL', 'A l''arrivée'),
(122, 2, 'PAYMENT_ARRIVAL', 'On arrival'),
(122, 3, 'PAYMENT_ARRIVAL', 'On arrival'),
(122, 4, 'PAYMENT_ARRIVAL', 'On arrival'),
(123, 1, 'CHOOSE_PAYMENT', 'Choisissez un moyen de paiement'),
(123, 2, 'CHOOSE_PAYMENT', 'Choose a method of payment'),
(123, 3, 'CHOOSE_PAYMENT', 'Choose a method of payment'),
(123, 4, 'CHOOSE_PAYMENT', 'Choose a method of payment'),
(124, 1, 'PAYMENT_CREDIT_CARDS', 'Cartes de credit'),
(124, 2, 'PAYMENT_CREDIT_CARDS', 'Credit cards'),
(124, 3, 'PAYMENT_CREDIT_CARDS', 'Credit cards'),
(124, 4, 'PAYMENT_CREDIT_CARDS', 'Credit cards'),
(125, 1, 'MAX_ADULTS', 'Adultes max'),
(125, 2, 'MAX_ADULTS', 'Max adults'),
(125, 3, 'MAX_ADULTS', 'Max adults'),
(125, 4, 'MAX_ADULTS', 'Max adults'),
(126, 1, 'MAX_CHILDREN', 'Enfants max'),
(126, 2, 'MAX_CHILDREN', 'Max children'),
(126, 3, 'MAX_CHILDREN', 'Max children'),
(126, 4, 'MAX_CHILDREN', 'Max children'),
(127, 1, 'PAYMENT_CARDS_NOTICE', 'Cliquez sur "Payer" ci-dessous, vous allez être redirigé vers le site sécurisé de 2Checkout.com'),
(127, 2, 'PAYMENT_CARDS_NOTICE', 'Click on "Check Out" below, you will be redirected towards the secure site of 2Checkout.com'),
(127, 3, 'PAYMENT_CARDS_NOTICE', 'Click on "Check Out" below, you will be redirected towards the secure site of 2Checkout.com'),
(127, 4, 'PAYMENT_CARDS_NOTICE', 'Click on "Check Out" below, you will be redirected towards the secure site of 2Checkout.com'),
(128, 1, 'COOKIES_NOTICE', 'Les cookies nous aident à fournir une meilleure expérience utilisateur. En utilisant notre site, vous acceptez l''utilisation de cookies.'),
(128, 2, 'COOKIES_NOTICE', 'Cookies help us provide better user experience. By using our website, you agree to the use of cookies.'),
(128, 3, 'COOKIES_NOTICE', 'Cookies help us provide better user experience. By using our website, you agree to the use of cookies.'),
(128, 4, 'COOKIES_NOTICE', 'Cookies help us provide better user experience. By using our website, you agree to the use of cookies.'),
(129, 1, 'DURATION', 'Durée'),
(129, 2, 'DURATION', 'Duration'),
(129, 3, 'DURATION', 'Duration'),
(129, 4, 'DURATION', 'Duration'),
(130, 1, 'PERSON', 'Personne'),
(130, 2, 'PERSON', 'Person'),
(130, 3, 'PERSON', 'Person'),
(130, 4, 'PERSON', 'Person'),
(131, 1, 'CHOOSE_A_DATE', 'Choisissez une date'),
(131, 2, 'CHOOSE_A_DATE', 'Choose a date'),
(131, 3, 'CHOOSE_A_DATE', 'Choose a date'),
(131, 4, 'CHOOSE_A_DATE', 'Choose a date'),
(132, 1, 'TIMESLOT', 'Horaire'),
(132, 2, 'TIMESLOT', 'Time slot'),
(132, 3, 'TIMESLOT', 'Time slot'),
(132, 4, 'TIMESLOT', 'Time slot'),
(133, 1, 'ACTIVITIES', 'Activités'),
(133, 2, 'ACTIVITIES', 'Activities'),
(133, 3, 'ACTIVITIES', 'Activities'),
(133, 4, 'ACTIVITIES', 'Activities'),
(134, 1, 'DESTINATION', 'Destination'),
(134, 2, 'DESTINATION', 'Destination'),
(134, 3, 'DESTINATION', 'Destination'),
(134, 4, 'DESTINATION', 'Destination'),
(135, 1, 'NO_HOTEL_FOUND', 'Aucun hotel trouvé'),
(135, 2, 'NO_HOTEL_FOUND', 'No hotel found'),
(135, 3, 'NO_HOTEL_FOUND', 'No hotel found'),
(135, 4, 'NO_HOTEL_FOUND', 'No hotel found'),
(136, 1, 'FOR', 'pour'),
(136, 2, 'FOR', 'for'),
(136, 3, 'FOR', 'for'),
(136, 4, 'FOR', 'for'),
(137, 1, 'FIND_ACTIVITIES_AND_TOURS', 'Découvrez nos activités et excursions'),
(137, 2, 'FIND_ACTIVITIES_AND_TOURS', 'Find out our activities and tours'),
(137, 3, 'FIND_ACTIVITIES_AND_TOURS', 'Find out our activities and tours'),
(137, 4, 'FIND_ACTIVITIES_AND_TOURS', 'Find out our activities and tours');

-- --------------------------------------------------------

--
-- Table structure for table `pm_user`
--

DROP TABLE IF EXISTS `pm_user`;
CREATE TABLE IF NOT EXISTS `pm_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `add_date` int(11) DEFAULT NULL,
  `edit_date` int(11) DEFAULT NULL,
  `checked` int(11) DEFAULT '0',
  `fb_id` varchar(50) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `token` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `pm_user`
--

INSERT INTO `pm_user` (`id`, `name`, `email`, `login`, `pass`, `type`, `add_date`, `edit_date`, `checked`, `fb_id`, `address`, `postcode`, `city`, `company`, `country`, `mobile`, `phone`, `token`) VALUES
(1, 'Administrator', 'info@pashotel.com', 'pashotel', 'efffbe2ef86b8dfd24672827dc46c724', 'administrator', 1486145284, 1486145284, 1, '', '', '', '', '', '', '', '', ''),
(3, 'Novan Santoso', 'novan@ahloo.com', 'neovaan', 'efffbe2ef86b8dfd24672827dc46c724', 'manager', 1486184749, 1486649873, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(4, 'Hotel Admin', 'hotel@pashotel.com', 'aditya', 'efffbe2ef86b8dfd24672827dc46c724', 'manager', 1486527169, 1489112751, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Hotel Manager', 'manager@pashotel.com', 'manager', 'efffbe2ef86b8dfd24672827dc46c724', 'hotel', 1486527208, 1489112829, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Hotel Staff', 'staff@hotel.com', 'hotel', 'efffbe2ef86b8dfd24672827dc46c724', 'hotel', 1486527272, 1486527272, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'Nur', 'nurchoi@yahoo.co.id', 'nchoi', 'e10adc3949ba59abbe56e057f20f883e', 'registered', 1487263731, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '592203221797046d66fe7da899735531'),
(8, 'Nur', 'nurchoir6@gmail.com', 'nchoir', 'e10adc3949ba59abbe56e057f20f883e', 'registered', 1487263838, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(9, 'nasyith majidi', 'nasyith@gmail.com', 'nasyith', 'efffbe2ef86b8dfd24672827dc46c724', 'registered', 1487953573, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'f56c8c3ed189481fe6443229d6a81b4d'),
(10, 'Novan', 'santoso.novan@gmail.com', 'Santoso', '34c3a8998accb7807394c274bdf8a335', 'registered', 1488190142, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `pm_widget`
--

DROP TABLE IF EXISTS `pm_widget`;
CREATE TABLE IF NOT EXISTS `pm_widget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `showtitle` int(11) DEFAULT NULL,
  `pos` varchar(20) DEFAULT NULL,
  `allpages` int(11) DEFAULT NULL,
  `pages` varchar(250) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `content` longtext,
  `class` varchar(200) DEFAULT NULL,
  `checked` int(11) DEFAULT '0',
  `rank` int(11) DEFAULT '0',
  PRIMARY KEY (`id`,`lang`),
  KEY `widget_lang_fkey` (`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `pm_widget`
--

INSERT INTO `pm_widget` (`id`, `lang`, `title`, `showtitle`, `pos`, `allpages`, `pages`, `type`, `content`, `class`, `checked`, `rank`) VALUES
(1, 1, 'Qui sommes-nous ?', 1, 'footer', 1, '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eget auctor ipsum. Mauris pharetra neque a mauris commodo, at aliquam leo malesuada. Maecenas eget elit eu ligula rhoncus dapibus at non erat. In sed velit eget eros gravida consectetur varius imperdiet lectus.</p>\r\n', '', 2, 1),
(1, 2, 'Tentang Kami', 1, 'footer', 1, '', '', '<p>Pashotel adalah situs penyedia layanan pemesanan kamar dan tempat tinggal yang tersebar diseluruh kota-kota besar di Indonesia dengan harga murah. Temukan kemudahan dan layanan serta fasilitas yang lengkap disetiap tempat yang Anda singgahi.</p>\r\n', '', 2, 1),
(1, 3, 'عنا', 1, 'footer', 1, '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eget auctor ipsum. Mauris pharetra neque a mauris commodo, at aliquam leo malesuada. Maecenas eget elit eu ligula rhoncus dapibus at non erat. In sed velit eget eros gravida consectetur varius imperdiet lectus.</p>\r\n', '', 2, 1),
(1, 4, 'Tentang Kami', 1, 'footer', 1, '', '', '<p>Pashotel adalah situs penyedia layanan pemesanan kamar dan tempat tinggal yang tersebar diseluruh kota-kota besar di Indonesia dengan harga murah. Temukan kemudahan dan layanan serta fasilitas yang lengkap disetiap tempat yang Anda singgahi.</p>\r\n', '', 2, 1),
(3, 1, 'Derniers articles', 1, 'footer', 1, '', 'latest_articles', '', '', 2, 2),
(3, 2, 'Latest articles', 1, 'footer', 1, '', 'latest_articles', '', '', 2, 2),
(3, 3, 'المقالات الأخيرة', 1, 'footer', 1, '', 'latest_articles', '', '', 2, 2),
(3, 4, 'Latest articles', 1, 'footer', 1, '', 'latest_articles', '', '', 2, 2),
(4, 1, 'Contactez-nous', 0, 'footer', 1, '', 'contact_informations', '', '', 2, 3),
(4, 2, 'Contact us', 0, 'footer', 1, '', 'contact_informations', '', '', 2, 3),
(4, 3, 'اتصل بنا', 0, 'footer', 1, '', 'contact_informations', '', '', 2, 3),
(4, 4, 'Contact us', 0, 'footer', 1, '', 'contact_informations', '', '', 2, 3),
(5, 1, 'Footer form', 0, 'footer', 1, '2,11,7,9,12', 'pages_list', '', 'footer-form mt10', 2, 4),
(5, 2, 'Service', 0, 'footer', 1, '2,11,7,9,12', 'pages_list', '', 'footer-form mt10', 2, 4),
(5, 3, 'Footer form', 0, 'footer', 1, '2,11,7,9,12', 'pages_list', '', 'footer-form mt10', 2, 4),
(5, 4, 'Service', 0, 'footer', 1, '2,11,7,9,12', 'pages_list', '', 'footer-form mt10', 2, 4),
(6, 1, '', 1, 'left', 0, '1', 'pages_list', '', '', 2, 5),
(6, 2, 'pashotel', 1, 'left', 0, '1', 'pages_list', '', '', 2, 5),
(6, 3, '', 1, 'left', 0, '1', 'pages_list', '', '', 2, 5),
(6, 4, 'pashotel', 1, 'left', 0, '1', 'pages_list', '', '', 2, 5),
(7, 1, '', 1, 'footer', 1, '5,14,15,10,11,7,9', 'service-1', '', '', 1, 7),
(7, 2, 'Support', 1, 'footer', 1, '5,14,15,10,11,7,9', 'service-1', '', '', 1, 7),
(7, 3, '', 1, 'footer', 1, '5,14,15,10,11,7,9', 'service-1', '', '', 1, 7),
(7, 4, 'Support', 1, 'footer', 1, '5,14,15,10,11,7,9', 'service-1', '', '', 1, 7),
(8, 1, '', 1, 'footer', 1, '', 'sosmed', '', 'widget-1', 1, 9),
(8, 2, 'Follow Us', 1, 'footer', 1, '', 'sosmed', '<div class="widget-footer">\r\n<div class="widget" id="widget-1">\r\n<div class="widget-content">\r\n<h1><span style="font-size:14px;">Follow us</span></h1>\r\n\r\n<h1><span style="font-size:26px;"><span style="font-size:28px;"><a href="https://www.facebook.com/TravelAlive"><i class="fa" red="" style="font-size:30px; color"></i></a><i class="fa" red="" style="font-size:30px; color">  </i><a href="www.google.com"><i class="fa" style="font-size:30px"></i></a><i class="fa" style="font-size:30px">  </i><a href="https://www.google.com.mx/#q=Travel+Alive+Mexico"><i class="fa" style="font-size:30px"></i></a></span></span></h1>\r\n</div>\r\n</div>\r\n</div>\r\n', 'widget-1', 1, 9),
(8, 3, '', 1, 'footer', 1, '', 'sosmed', '', 'widget-1', 1, 9),
(8, 4, 'Follow Us', 1, 'footer', 1, '', 'sosmed', '<div class="widget-footer">\r\n<div class="widget" id="widget-1">\r\n<div class="widget-content">\r\n<h1><span style="font-size:14px;">Follow us</span></h1>\r\n\r\n<h1><span style="font-size:26px;"><span style="font-size:28px;"><a href="https://www.facebook.com/TravelAlive"><i class="fa" red="" style="font-size:30px; color"></i></a><i class="fa" red="" style="font-size:30px; color">  </i><a href="www.google.com"><i class="fa" style="font-size:30px"></i></a><i class="fa" style="font-size:30px">  </i><a href="https://www.google.com.mx/#q=Travel+Alive+Mexico"><i class="fa" style="font-size:30px"></i></a></span></span></h1>\r\n</div>\r\n</div>\r\n</div>\r\n', 'widget-1', 1, 9),
(9, 1, '', 1, 'footer', 1, '', 'payment', '', '', 1, 8),
(9, 2, 'Payment', 1, 'footer', 1, '', 'payment', '', '', 1, 8),
(9, 3, '', 1, 'footer', 1, '', 'payment', '', '', 1, 8),
(9, 4, 'Payment', 1, 'footer', 1, '', 'payment', '', '', 1, 8),
(10, 1, '', 1, 'footer', 1, '', 'service-2', '', '', 1, 6),
(10, 2, 'About Pashotel', 1, 'footer', 1, '', 'service-2', '<p> </p>\r\n\r\n<ul>\r\n	<li><a href="">About us</a></li>\r\n	<br />\r\n	<li>                    </li>\r\n	<li><a href="">Blog</a></li>\r\n	<br />\r\n	<li>                    </li>\r\n	<li><a href="">Contact Us</a></li>\r\n	<br />\r\n	<li>                    </li>\r\n	<li><a href="">Partnership</a></li>\r\n	<br />\r\n	<li>                    </li>\r\n	<li><a href="partner-hotel">Our Partner</a></li>\r\n</ul>\r\n\r\n<p> </p>\r\n', '', 1, 6),
(10, 3, '', 1, 'footer', 1, '', 'service-2', '', '', 1, 6),
(10, 4, 'About Pashotel', 1, 'footer', 1, '', 'service-2', '<p> </p>\r\n\r\n<ul>\r\n	<li><a href="">About us</a></li>\r\n	<br />\r\n	<li>                    </li>\r\n	<li><a href="">Blog</a></li>\r\n	<br />\r\n	<li>                    </li>\r\n	<li><a href="">Contact Us</a></li>\r\n	<br />\r\n	<li>                    </li>\r\n	<li><a href="">Partnership</a></li>\r\n	<br />\r\n	<li>                    </li>\r\n	<li><a href="partner-hotel">Our Partner</a></li>\r\n</ul>\r\n\r\n<p> </p>\r\n', '', 1, 6);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pm_activity`
--
ALTER TABLE `pm_activity`
  ADD CONSTRAINT `activity_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_activity_file`
--
ALTER TABLE `pm_activity_file`
  ADD CONSTRAINT `activity_file_fkey` FOREIGN KEY (`id_item`, `lang`) REFERENCES `pm_activity` (`id`, `lang`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `activity_file_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_activity_session`
--
ALTER TABLE `pm_activity_session`
  ADD CONSTRAINT `activity_session_fkey` FOREIGN KEY (`id_activity`) REFERENCES `pm_activity` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_activity_session_hour`
--
ALTER TABLE `pm_activity_session_hour`
  ADD CONSTRAINT `activity_session_hour_fkey` FOREIGN KEY (`id_activity_session`) REFERENCES `pm_activity_session` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_article`
--
ALTER TABLE `pm_article`
  ADD CONSTRAINT `article_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `article_page_fkey` FOREIGN KEY (`id_page`, `lang`) REFERENCES `pm_page` (`id`, `lang`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_article_file`
--
ALTER TABLE `pm_article_file`
  ADD CONSTRAINT `article_file_fkey` FOREIGN KEY (`id_item`, `lang`) REFERENCES `pm_article` (`id`, `lang`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `article_file_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_booking_activity`
--
ALTER TABLE `pm_booking_activity`
  ADD CONSTRAINT `booking_activity_fkey` FOREIGN KEY (`id_booking`) REFERENCES `pm_booking` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_facility`
--
ALTER TABLE `pm_facility`
  ADD CONSTRAINT `facility_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_facility_file`
--
ALTER TABLE `pm_facility_file`
  ADD CONSTRAINT `facility_file_fkey` FOREIGN KEY (`id_item`, `lang`) REFERENCES `pm_facility` (`id`, `lang`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `facility_file_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_hotel`
--
ALTER TABLE `pm_hotel`
  ADD CONSTRAINT `hotel_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_hotel_file`
--
ALTER TABLE `pm_hotel_file`
  ADD CONSTRAINT `hotel_file_fkey` FOREIGN KEY (`id_item`, `lang`) REFERENCES `pm_hotel` (`id`, `lang`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `hotel_file_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_lang_file`
--
ALTER TABLE `pm_lang_file`
  ADD CONSTRAINT `lang_file_fkey` FOREIGN KEY (`id_item`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_media_file`
--
ALTER TABLE `pm_media_file`
  ADD CONSTRAINT `media_file_fkey` FOREIGN KEY (`id_item`) REFERENCES `pm_media` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_page`
--
ALTER TABLE `pm_page`
  ADD CONSTRAINT `page_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_page_file`
--
ALTER TABLE `pm_page_file`
  ADD CONSTRAINT `page_file_fkey` FOREIGN KEY (`id_item`, `lang`) REFERENCES `pm_page` (`id`, `lang`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `page_file_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_rate`
--
ALTER TABLE `pm_rate`
  ADD CONSTRAINT `rate_room_fkey` FOREIGN KEY (`id_room`) REFERENCES `pm_room` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_room`
--
ALTER TABLE `pm_room`
  ADD CONSTRAINT `room_hotel_fkey` FOREIGN KEY (`id_hotel`, `lang`) REFERENCES `pm_hotel` (`id`, `lang`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `room_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_room_file`
--
ALTER TABLE `pm_room_file`
  ADD CONSTRAINT `room_file_fkey` FOREIGN KEY (`id_item`, `lang`) REFERENCES `pm_room` (`id`, `lang`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `room_file_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_service`
--
ALTER TABLE `pm_service`
  ADD CONSTRAINT `service_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_slide`
--
ALTER TABLE `pm_slide`
  ADD CONSTRAINT `slide_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `slide_page_fkey` FOREIGN KEY (`id_page`, `lang`) REFERENCES `pm_page` (`id`, `lang`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_slide_file`
--
ALTER TABLE `pm_slide_file`
  ADD CONSTRAINT `slide_file_fkey` FOREIGN KEY (`id_item`, `lang`) REFERENCES `pm_slide` (`id`, `lang`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `slide_file_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_tag`
--
ALTER TABLE `pm_tag`
  ADD CONSTRAINT `tag_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_text`
--
ALTER TABLE `pm_text`
  ADD CONSTRAINT `text_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_widget`
--
ALTER TABLE `pm_widget`
  ADD CONSTRAINT `widget_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
