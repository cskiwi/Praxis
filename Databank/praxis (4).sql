-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Machine: localhost
-- Genereertijd: 30 apr 2013 om 20:10
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Gegevens worden uitgevoerd voor tabel `companies`
--

INSERT INTO `companies` (`idCompany`, `NameCompany`, `Login`, `Pass`, `website`, `logo URL`) VALUES
(1, 'Lotus Backeries', 'Lotus', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'www.lotus.be', '../Images/lotusBakeries.jpg'),
(2, 'Siderurgie Maritime', 'Sidmar', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'www.sidmar.be', '../Images/SiderurgieMaritime.jpg'),
(3, 'Mercedes-Benz', 'mercedesBenz', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'www.mercedes-benz.be', '../Images/mercedezBenz.jpg');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `facilities`
--

CREATE TABLE IF NOT EXISTS `facilities` (
  `idFacility` int(11) NOT NULL AUTO_INCREMENT,
  `idCompany` int(11) NOT NULL,
  `NameFacility` varchar(45) NOT NULL,
  `Street` varchar(45) DEFAULT NULL,
  `HouseNr` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Fax` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `BannerURL` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idFacility`,`idCompany`),
  UNIQUE KEY `ID_UNIQUE` (`idFacility`),
  KEY `fk_Facileties_Companies_idx` (`idCompany`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Gegevens worden uitgevoerd voor tabel `facilities`
--

INSERT INTO `facilities` (`idFacility`, `idCompany`, `NameFacility`, `Street`, `HouseNr`, `City`, `Country`, `Phone`, `Fax`, `Email`, `BannerURL`) VALUES
(1, 1, 'Hoofdkantoor', 'Gentstraat', '52', 'Lembeke', 'Belgium', '+32 (0)9/376 26 11', '\n    +32(B) 09/3762626', 'jobs@lotusbakeries.com', '../Images/lotusBakeries.jpg'),
(2, 1, 'Factory', 'Hollenaarstraat', '91', 'Oostakker ', 'Belgium', '+32(0)9 376 26 11', '\n    +32(B) 09/3762626', 'jobs@lotusbakeries.com', '../Images/lotusBakeries.jpg'),
(3, 2, 'ArcelorMittal Gent', 'John Kennedylaan', '51', 'Gent', 'Belgium', '+32 (0)9 347 31 11', '+32 (0)9 347 49 07', 'info.sidmar@arcelormittal.com', '../Images/SiderurgieMaritime.jpg'),
(4, 3, 'Mercedez-Benz Sint-Martens-Latem', 'Kortrijksesteenweg', '108', 'Sint-Martens-Latem', 'Belgium', '+32 (0)9 242 41 11', NULL, 'jobs@mercedez-benz.be', '../Images/mercedezBenz.jpg'),
(5, 3, 'Mercedez-Benz Gent', 'Afrikalaan', '208', 'Gent', 'Belgium', '+32 (09) 250 05 11', NULL, 'jobs@mercedez-benz.be', '../Images/mercedezBenz.jpg');

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
(4, 4, '2013-01-17', '2013-04-19'),
(5, 5, '2013-04-01', '2013-06-24');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Gegevens worden uitgevoerd voor tabel `internshiptemplate`
--

INSERT INTO `internshiptemplate` (`idIntershipTemplate`, `idFacility`, `Title`, `Description`, `Required_Knowledge`) VALUES
(1, 2, 'Netwerkbeheerder', 'Beheren en onderhouden van het dagelijkse te gebruiken netwerk in ons bedrijf.', 'CCNA 1 tot 3 minimum'),
(2, 1, 'Onderhoud', 'Je zal moeten plaatsnemen in de onderhoudsgroep voor de werkende machines in de fabriek. Je moet bereid zijn om de nacht te doen.', 'Elektrische motoren'),
(3, 2, 'Bedrijfsmanagement', 'Je moet in staat zijn om zelfstandig te kunnen helpen met het bedrijf te leiden.', 'Bedrijfskunde en kennis van boekhouding'),
(4, 1, 'Netwerkbeheerder', 'Beheren en onderhouden van het dagelijkse te gebruiken netwerk in ons bedrijf.', 'CCNA 1 tot 2 minimum'),
(5, 2, 'Onderhoud', 'Je zal moeten plaatsnemen in de onderhoudsgroep voor de werkende machines in de fabriek. Je moet bereid zijn om de nacht te doen. Ook zal je moeten helpen om onze fabriek van nieuwe elektriciteitskabels te voorzien.', 'Elektrische motoren en installatietechnieken'),
(6, 4, 'Verkoper', 'Je zal in de toonzaal moeten staan samen met andere verkopers. Daar tracht je onze wagens te promoten en deze zo te verkopen aan de klant.', 'Kennis van wagens en marketing'),
(7, 5, 'Boekhouding', 'Je zal moeten facturen inboeken in het aankoopdagboek en verkoopdagboek. Ook zal je de volledige boekhouding moeten meester zijn. Je zal tevens bank en kas moeten inboeken, de balans opmaken, de resultatenrekening en de jaarlijkse neerlegging van je balans in de balanscentrale.', 'Boekhouding, basis van computer en fiscaliteit'),
(8, 4, 'Mechanicien', 'Reparatie van mechanische onderdelen. Je moet tevens ook onderhoud aan de wagens kunnen geven. Je moet een diagnose kunnen vaststellen van een defect voertuig en de reparaties kunnen toepassen.', 'Kennis van mechanische onderdelen in de wagen. Basis kennis elektronica om de boordcomputer te kunnen uitlezen.'),
(9, 5, 'Verkoper', 'Je zal in de toonzaal moeten staan samen met andere verkopers. Daar tracht je onze wagens te promoten en deze zo te verkopen aan de klant.', 'Kennis van wagens en marketing'),
(10, 5, 'Mecanicien', 'Reparatie van mechanische onderdelen. Je moet tevens ook onderhoud aan de wagens kunnen geven. Je moet een diagnose kunnen vaststellen van een defect voertuig en de reparaties kunnen toepassen.', 'Kennis van mechanische onderdelen in de wagen. Basis kennis elektronica om de boordcomputer te kunnen uitlezen.');

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
(4, 1),
(2, 2),
(5, 2),
(8, 2),
(10, 2),
(3, 3),
(7, 3),
(1, 4),
(4, 4),
(8, 5),
(10, 5),
(2, 6),
(5, 6),
(6, 7),
(9, 7);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sector`
--

CREATE TABLE IF NOT EXISTS `sector` (
  `idSector` int(11) NOT NULL AUTO_INCREMENT,
  `NameSector` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idSector`),
  UNIQUE KEY `idSector_UNIQUE` (`idSector`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Gegevens worden uitgevoerd voor tabel `sector`
--

INSERT INTO `sector` (`idSector`, `NameSector`) VALUES
(1, 'ICT'),
(2, 'Onderhoud'),
(3, 'Fiscaliteit'),
(4, 'Netwerkbeheerder'),
(5, 'Garage'),
(6, 'Elektriciteit'),
(7, 'Verkoop');

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
