-- phpMyAdmin SQL Dump
-- version 4.0.10.10
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 14 2017 г., 15:43
-- Версия сервера: 5.5.45
-- Версия PHP: 5.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `forum_project`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Categories`
--

CREATE TABLE IF NOT EXISTS `Categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(64) DEFAULT NULL,
  `color1` double DEFAULT NULL,
  `color2` double DEFAULT NULL,
  `color3` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `Categories`
--

INSERT INTO `Categories` (`id`, `category`, `color1`, `color2`, `color3`) VALUES
(1, 'Рестораны', NULL, NULL, NULL),
(2, 'Кинотеатры', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `Images`
--

CREATE TABLE IF NOT EXISTS `Images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `placeid` int(11) NOT NULL,
  `imagepath` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `placeid` (`placeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `Messages`
--

CREATE TABLE IF NOT EXISTS `Messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `comment` varchar(2048) DEFAULT NULL,
  `stamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `Messages`
--

INSERT INTO `Messages` (`id`, `userid`, `comment`, `stamp`) VALUES
(1, 1, 'First message', '2017-01-12 09:12:11'),
(2, 2, 'Second message', '2017-01-10 02:13:43'),
(3, 2, 'Third message', '2017-01-14 12:42:20');

-- --------------------------------------------------------

--
-- Структура таблицы `Places`
--

CREATE TABLE IF NOT EXISTS `Places` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `catid` int(11) NOT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `info` varchar(1024) DEFAULT NULL,
  `ulike` int(11) DEFAULT NULL,
  `udislike` int(11) DEFAULT NULL,
  `statusid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `stamp` int(11) DEFAULT NULL,
  `link` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `statusid` (`statusid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `Places`
--

INSERT INTO `Places` (`id`, `title`, `catid`, `lat`, `lng`, `info`, `ulike`, `udislike`, `statusid`, `userid`, `stamp`, `link`) VALUES
(5, 'Порт Рояль', 1, 47.846823, 35.123796, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vitae, nostrum!', NULL, NULL, 1, 1, NULL, NULL),
(6, 'Интурист', 1, 47.839232, 35.137176, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vitae, nostrum!', NULL, NULL, 1, 1, NULL, NULL),
(7, 'Веселый Роджер', 1, 47.837906, 35.098992, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vitae, nostrum!', NULL, NULL, 1, 1, NULL, NULL),
(8, 'Кинотеатр Довженка', 2, 47.841783, 35.132994, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vitae, nostrum!', NULL, NULL, 1, 1, NULL, NULL),
(9, 'Кинотеатр Байда', 2, 47.838723, 35.141615, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vitae, nostrum!', NULL, NULL, 1, 1, NULL, NULL),
(10, 'Кинотеатр Маяковского', 2, 47.851412, 35.115534, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vitae, nostrum!', NULL, NULL, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `Posts`
--

CREATE TABLE IF NOT EXISTS `Posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `themeid` int(11) NOT NULL,
  `statusid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `content` varchar(2048) DEFAULT NULL,
  `stamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `themeid` (`themeid`),
  KEY `statusid` (`statusid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `Roles`
--

CREATE TABLE IF NOT EXISTS `Roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `Roles`
--

INSERT INTO `Roles` (`id`, `role`) VALUES
(1, 'admin'),
(2, 'moder'),
(3, 'user');

-- --------------------------------------------------------

--
-- Структура таблицы `Statuses`
--

CREATE TABLE IF NOT EXISTS `Statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `Statuses`
--

INSERT INTO `Statuses` (`id`, `status`) VALUES
(1, 'new'),
(2, 'ok'),
(3, 'no'),
(4, 'closed');

-- --------------------------------------------------------

--
-- Структура таблицы `Themes`
--

CREATE TABLE IF NOT EXISTS `Themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `catid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `stamp` int(11) DEFAULT NULL,
  `statusid` int(11) NOT NULL,
  `content` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `userid` (`userid`),
  KEY `statusid` (`statusid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(64) DEFAULT NULL,
  `pass` varchar(256) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `roleid` int(11) NOT NULL,
  `stamp` int(11) DEFAULT NULL,
  `posts` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roleid` (`roleid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `Users`
--

INSERT INTO `Users` (`id`, `login`, `pass`, `email`, `roleid`, `stamp`, `posts`) VALUES
(1, 'admin', '123456', 'mail@mail.com', 1, NULL, NULL),
(2, 'moder', '123456', 'mail@mail.com', 2, NULL, NULL),
(3, 'user', '123456', 'mail@mail.com', 3, NULL, NULL);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Images`
--
ALTER TABLE `Images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`placeid`) REFERENCES `Places` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Messages`
--
ALTER TABLE `Messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `Users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Places`
--
ALTER TABLE `Places`
  ADD CONSTRAINT `places_ibfk_1` FOREIGN KEY (`catid`) REFERENCES `Categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `places_ibfk_2` FOREIGN KEY (`statusid`) REFERENCES `Statuses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `places_ibfk_3` FOREIGN KEY (`userid`) REFERENCES `Users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Posts`
--
ALTER TABLE `Posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`themeid`) REFERENCES `Themes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`statusid`) REFERENCES `Statuses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_ibfk_3` FOREIGN KEY (`userid`) REFERENCES `Users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Themes`
--
ALTER TABLE `Themes`
  ADD CONSTRAINT `themes_ibfk_1` FOREIGN KEY (`catid`) REFERENCES `Categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `themes_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `Users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `themes_ibfk_3` FOREIGN KEY (`statusid`) REFERENCES `Statuses` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Users`
--
ALTER TABLE `Users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `Roles` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
