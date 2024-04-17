-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Ápr 17. 12:15
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `utazas`
--
CREATE DATABASE IF NOT EXISTS `utazas` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `utazas`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jarmu`
--

DROP TABLE IF EXISTS `jarmu`;
CREATE TABLE IF NOT EXISTS `jarmu` (
  `jarmuAzon` int(32) NOT NULL AUTO_INCREMENT,
  `tipus` varchar(20) NOT NULL,
  `varosAzon` int(32) NOT NULL,
  PRIMARY KEY (`jarmuAzon`),
  UNIQUE KEY `varosAzon` (`varosAzon`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `jarmu`
--

INSERT INTO `jarmu` (`jarmuAzon`, `tipus`, `varosAzon`) VALUES
(3, 'Audi', 1),
(4, 'Mercedes', 2),
(5, 'Skoda', 3),
(6, 'Mazda', 4);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sofor`
--

DROP TABLE IF EXISTS `sofor`;
CREATE TABLE IF NOT EXISTS `sofor` (
  `soforAzon` int(32) NOT NULL AUTO_INCREMENT,
  `vezetekNev` varchar(30) NOT NULL,
  `keresztNev` varchar(30) NOT NULL,
  `jarmuAzon` int(32) NOT NULL,
  PRIMARY KEY (`soforAzon`),
  UNIQUE KEY `jarmuAzon_2` (`jarmuAzon`),
  KEY `jarmuAzon` (`jarmuAzon`),
  KEY `jarmuAzon_3` (`jarmuAzon`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `sofor`
--

INSERT INTO `sofor` (`soforAzon`, `vezetekNev`, `keresztNev`, `jarmuAzon`) VALUES
(3, 'Nagy', 'Levente', 3),
(4, 'Kis', 'Márton', 4),
(5, 'Késmárki', 'Gábor', 5),
(6, 'Vastag', 'Máté', 6);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `varos`
--

DROP TABLE IF EXISTS `varos`;
CREATE TABLE IF NOT EXISTS `varos` (
  `varosAzon` int(32) NOT NULL AUTO_INCREMENT,
  `nev` varchar(150) NOT NULL,
  PRIMARY KEY (`varosAzon`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `varos`
--

INSERT INTO `varos` (`varosAzon`, `nev`) VALUES
(1, 'Budapest'),
(2, 'Győr'),
(3, 'Pécs'),
(4, 'Szeged');

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `jarmu`
--
ALTER TABLE `jarmu`
  ADD CONSTRAINT `jarmu_ibfk_1` FOREIGN KEY (`varosAzon`) REFERENCES `varos` (`varosAzon`);

--
-- Megkötések a táblához `sofor`
--
ALTER TABLE `sofor`
  ADD CONSTRAINT `sofor_ibfk_1` FOREIGN KEY (`jarmuAzon`) REFERENCES `jarmu` (`jarmuAzon`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
