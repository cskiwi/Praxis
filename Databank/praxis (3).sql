-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Machine: localhost
-- Genereertijd: 30 apr 2013 om 18:42
-- Serverversie: 5.5.24-log
-- PHP-versie: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databank: `praxis`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `companies`
--

CREATE TABLE IF NOT EXISTS `companies` (
  `idCompany` int(11) NOT NULL AUTO_INCREMENT,
  `NameCompany` varchar(45) NOT NULL,
  `Login` varchar(45) NOT NULL,
  `Pass` varchar(45) NOT NULL,
  `website` varchar(45) DEFAULT NULL,
  `logo URL` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCompany`),
  UNIQUE KEY `idBedrijven_UNIQUE` (`idCompany`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Gegevens worden uitgevoerd voor tabel `companies`
--

INSERT INTO `companies` (`idCompany`, `NameCompany`, `Login`, `Pass`, `website`, `logo URL`) VALUES
(1, 'Lotus Backeries', 'Lotus', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'www.lotus.be', '..Images/lotusBakeries.jpg'),
(2, 'Siderurgie Maritime', 'Sidmar', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'www.sidmar.be', '..Images/SiderurgieMaritime.jpg');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `facilities`
--

CREATE TABLE IF NOT EXISTS `facilities` (
  `idFacility` int(11) NOT NULL AUTO_INCREMENT,
  `idCompany` int(11) NOT NULL,
  `NameFacility` varchar(45) NOT NULL,
  `Street` varchar(45) DEFAULT NULL,
  `House nr` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `Coutry` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Fax` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `BannerURL` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idFacility`,`idCompany`),
  UNIQUE KEY `ID_UNIQUE` (`idFacility`),
  KEY `fk_Facileties_Companies_idx` (`idCompany`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Gegevens worden uitgevoerd voor tabel `facilities`
--

INSERT INTO `facilities` (`idFacility`, `idCompany`, `NameFacility`, `Street`, `House nr`, `City`, `Coutry`, `Phone`, `Fax`, `Email`, `BannerURL`) VALUES
(1, 1, 'Hoofdkantoor', 'Gentstraat', '52', 'Lembeke', 'Belgium', '+32 (0)9/376 26 11', '\n    +32(B) 09/3762626', 'jobs@lotusbakeries.com', '../Images/lotusBakeries.jpg'),
(2, 1, 'Factory', 'Hollenaarstraat', '91', 'Oostakker ', 'Belgium', '+32(0)9 376 26 11', '\n    +32(B) 09/3762626', 'jobs@lotusbakeries.com', '../Images/lotusBakeries.jpg'),
(3, 2, 'ArcelorMittal Gent', 'John Kennedylaan', '51', 'Gent', 'Belgium', '+32 (0)9 347 31 11', '+32 (0)9 347 49 07', 'info.sidmar@arcelormittal.com', '../Images/SiderurgieMaritime.jpg');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `internship`
--

CREATE TABLE IF NOT EXISTS `internship` (
  `idInternship` int(11) NOT NULL AUTO_INCREMENT,
  `idInternshipTemplate` int(11) NOT NULL,
  `Start` date DEFAULT NULL,
  `End` date DEFAULT NULL,
  PRIMARY KEY (`idInternship`,`idInternshipTemplate`),
  UNIQUE KEY `idIntership_UNIQUE` (`idInternship`),
  KEY `fk_Intership_InternshipTemplate1_idx` (`idInternshipTemplate`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Gegevens worden uitgevoerd voor tabel `internship`
--

INSERT INTO `internship` (`idInternship`, `idInternshipTemplate`, `Start`, `End`) VALUES
(1, 1, '2013-02-12', '2013-06-11'),
(2, 2, '2013-02-20', '2013-06-18'),
(3, 3, '2013-03-12', '2013-06-10'),
(4, 4, '2013-01-17', NULL),
(5, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `internshiptemplate`
--

CREATE TABLE IF NOT EXISTS `internshiptemplate` (
  `idIntershipTemplate` int(11) NOT NULL AUTO_INCREMENT,
  `idFacility` int(11) NOT NULL,
  `Title` varchar(45) DEFAULT NULL,
  `Description` text,
  `Required_Knowledge` text,
  PRIMARY KEY (`idIntershipTemplate`,`idFacility`),
  UNIQUE KEY `ID_UNIQUE` (`idIntershipTemplate`),
  KEY `fk_table1_Facileties1_idx` (`idFacility`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Gegevens worden uitgevoerd voor tabel `internshiptemplate`
--

INSERT INTO `internshiptemplate` (`idIntershipTemplate`, `idFacility`, `Title`, `Description`, `Required_Knowledge`) VALUES
(1, 2, 'skjdnbsdjlf', 'gvbhnjk,;lmk,njbhvgcfgvbhnjk,l;bhgvfcgvbhjnk,l', 'gvhbjnkl'),
(2, 1, 'smdnf', 'gyhujnk,l;kjhgfccgvhbjnk,l;m', 'hbjnk,l'),
(3, 2, 'ksdnfm', 'hbjnk,jhgcfhjklmknjbhui', 'hbjnk,l'),
(4, 1, 's,dnf', 'ubsniojfpkljbhvygduhsoijfkd', '$bhnjk,l;µ'),
(5, 2, 'mksndf', 'sbdjknflmd;sv ,njzheijokfls', 'bnj,k');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `internshiptemplate_has_sector`
--

CREATE TABLE IF NOT EXISTS `internshiptemplate_has_sector` (
  `idInternshipTemplate` int(11) NOT NULL,
  `idSector` int(11) NOT NULL,
  PRIMARY KEY (`idInternshipTemplate`,`idSector`),
  KEY `fk_InternshipTemplate_has_Sector_Sector1_idx` (`idSector`),
  KEY `fk_InternshipTemplate_has_Sector_InternshipTemplate1_idx` (`idInternshipTemplate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden uitgevoerd voor tabel `internshiptemplate_has_sector`
--

INSERT INTO `internshiptemplate_has_sector` (`idInternshipTemplate`, `idSector`) VALUES
(1, 1),
(2, 1),
(4, 1),
(1, 2),
(3, 2),
(4, 2),
(1, 3),
(3, 3),
(5, 3),
(2, 4),
(3, 4);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sector`
--

CREATE TABLE IF NOT EXISTS `sector` (
  `idSector` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idSector`),
  UNIQUE KEY `idSector_UNIQUE` (`idSector`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Gegevens worden uitgevoerd voor tabel `sector`
--

INSERT INTO `sector` (`idSector`, `Name`) VALUES
(1, 'ICT'),
(2, 'Onderhoud'),
(3, 'dingen doen'),
(4, 'other');

--
-- Beperkingen voor gedumpte tabellen
--

--
-- Beperkingen voor tabel `facilities`
--
ALTER TABLE `facilities`
  ADD CONSTRAINT `fk_Facileties_Companies` FOREIGN KEY (`idCompany`) REFERENCES `companies` (`idCompany`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Beperkingen voor tabel `internship`
--
ALTER TABLE `internship`
  ADD CONSTRAINT `fk_Intership_InternshipTemplate1` FOREIGN KEY (`idInternshipTemplate`) REFERENCES `internshiptemplate` (`idIntershipTemplate`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Beperkingen voor tabel `internshiptemplate`
--
ALTER TABLE `internshiptemplate`
  ADD CONSTRAINT `fk_table1_Facileties1` FOREIGN KEY (`idFacility`) REFERENCES `facilities` (`idFacility`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Beperkingen voor tabel `internshiptemplate_has_sector`
--
ALTER TABLE `internshiptemplate_has_sector`
  ADD CONSTRAINT `fk_InternshipTemplate_has_Sector_InternshipTemplate1` FOREIGN KEY (`idInternshipTemplate`) REFERENCES `internshiptemplate` (`idIntershipTemplate`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_InternshipTemplate_has_Sector_Sector1` FOREIGN KEY (`idSector`) REFERENCES `sector` (`idSector`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
