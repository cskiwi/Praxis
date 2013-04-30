-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 30, 2013 at 03:44 PM
-- Server version: 5.5.24-log
-- PHP Version: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `praxis`
--

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE IF NOT EXISTS `companies` (
  `idCompany` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Login` varchar(45) NOT NULL,
  `Pass` varchar(45) NOT NULL,
  `website` varchar(45) DEFAULT NULL,
  `logo URL` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCompany`),
  UNIQUE KEY `idBedrijven_UNIQUE` (`idCompany`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`idCompany`, `Name`, `Login`, `Pass`, `website`, `logo URL`) VALUES
(1, 'Lotus Backeries', 'Lotus', 'test', 'www.lotus.be', NULL),
(2, 'Sidérurgie Maritime', 'Sidmar', 'test', 'www.sidmar.be', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

CREATE TABLE IF NOT EXISTS `facilities` (
  `idFacility` int(11) NOT NULL AUTO_INCREMENT,
  `idCompany` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
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
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`idFacility`, `idCompany`, `Name`, `Street`, `House nr`, `City`, `Coutry`, `Phone`, `Fax`, `Email`, `BannerURL`) VALUES
(1, 1, 'Home Depot', 'Koekjesstraat', '2', 'Lembeke', 'Belgium', '0123456789', '0123456789', 'koejes@lotus.be', NULL),
(2, 1, 'Factory', 'Koekjesstraat', '7', 'Lembeke', 'Belgium', '1234567890', '1234567890', 'factory@lotus.be', NULL),
(3, 2, 'Smelter', 'Ironstreet', '3', 'Eeklo', 'Belgium', '67393040', '6789230', 'smelter@sidmar.be', NULL),
(4, 2, 'Recylcer', 'IRonstreet', '90', 'Eeklo', 'Belgium', '87974938704', '38973487', 'recycler@sidmar.be', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `internship`
--

CREATE TABLE IF NOT EXISTS `internship` (
  `idIntership` int(11) NOT NULL AUTO_INCREMENT,
  `idInternshipTemplate` int(11) NOT NULL,
  `Start` date DEFAULT NULL,
  `End` date DEFAULT NULL,
  PRIMARY KEY (`idIntership`,`idInternshipTemplate`),
  UNIQUE KEY `idIntership_UNIQUE` (`idIntership`),
  KEY `fk_Intership_InternshipTemplate1_idx` (`idInternshipTemplate`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `internship`
--

INSERT INTO `internship` (`idIntership`, `idInternshipTemplate`, `Start`, `End`) VALUES
(1, 1, NULL, NULL),
(2, 2, NULL, NULL),
(3, 3, NULL, NULL),
(4, 4, NULL, NULL),
(5, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `internshiptemplate`
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
-- Dumping data for table `internshiptemplate`
--

INSERT INTO `internshiptemplate` (`idIntershipTemplate`, `idFacility`, `Title`, `Description`, `Required_Knowledge`) VALUES
(1, 2, 'skjdnbsdjlf', 'gvbhnjk,;lmk,njbhvgcfgvbhnjk,l;bhgvfcgvbhjnk,l', 'gvhbjnkl'),
(2, 1, 'smdnf', 'gyhujnk,l;kjhgfccgvhbjnk,l;m', 'hbjnk,l'),
(3, 2, 'ksdnfm', 'hbjnk,jhgcfhjklmknjbhui', 'hbjnk,l'),
(4, 1, 's,dnf', 'ubsniojfpkljbhvygduhsoijfkd', '$bhnjk,l;µ'),
(5, 2, 'mksndf', 'sbdjknflmd;sv ,njzheijokfls', 'bnj,k');

-- --------------------------------------------------------

--
-- Table structure for table `internshiptemplate_has_sector`
--

CREATE TABLE IF NOT EXISTS `internshiptemplate_has_sector` (
  `idInternshipTemplate` int(11) NOT NULL,
  `idSector` int(11) NOT NULL,
  PRIMARY KEY (`idInternshipTemplate`,`idSector`),
  KEY `fk_InternshipTemplate_has_Sector_Sector1_idx` (`idSector`),
  KEY `fk_InternshipTemplate_has_Sector_InternshipTemplate1_idx` (`idInternshipTemplate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `internshiptemplate_has_sector`
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
-- Table structure for table `sector`
--

CREATE TABLE IF NOT EXISTS `sector` (
  `idSector` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idSector`),
  UNIQUE KEY `idSector_UNIQUE` (`idSector`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `sector`
--

INSERT INTO `sector` (`idSector`, `Name`) VALUES
(1, 'ICT'),
(2, 'Onderhoud'),
(3, 'dingen doen'),
(4, 'other');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `facilities`
--
ALTER TABLE `facilities`
  ADD CONSTRAINT `fk_Facileties_Companies` FOREIGN KEY (`idCompany`) REFERENCES `companies` (`idCompany`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `internship`
--
ALTER TABLE `internship`
  ADD CONSTRAINT `fk_Intership_InternshipTemplate1` FOREIGN KEY (`idInternshipTemplate`) REFERENCES `internshiptemplate` (`idIntershipTemplate`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `internshiptemplate`
--
ALTER TABLE `internshiptemplate`
  ADD CONSTRAINT `fk_table1_Facileties1` FOREIGN KEY (`idFacility`) REFERENCES `facilities` (`idFacility`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `internshiptemplate_has_sector`
--
ALTER TABLE `internshiptemplate_has_sector`
  ADD CONSTRAINT `fk_InternshipTemplate_has_Sector_InternshipTemplate1` FOREIGN KEY (`idInternshipTemplate`) REFERENCES `internshiptemplate` (`idIntershipTemplate`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_InternshipTemplate_has_Sector_Sector1` FOREIGN KEY (`idSector`) REFERENCES `sector` (`idSector`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
