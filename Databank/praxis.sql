-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 30, 2013 at 01:29 PM
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
-- Table structure for table `facileties`
--

CREATE TABLE IF NOT EXISTS `facileties` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CompaniesID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Street` varchar(45) DEFAULT NULL,
  `House nr` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `Coutry` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Fax` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `BannerURL` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`,`CompaniesID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `fk_Facileties_Companies_idx` (`CompaniesID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `facileties`
--

INSERT INTO `facileties` (`ID`, `CompaniesID`, `Name`, `Street`, `House nr`, `City`, `Coutry`, `Phone`, `Fax`, `Email`, `BannerURL`) VALUES
(1, 1, 'Home Depot', 'Koekjesstraat', '2', 'Lembeke', 'Belgium', '0123456789', '0123456789', 'koejes@lotus.be', NULL),
(2, 1, 'Factory', 'Koekjesstraat', '7', 'Lembeke', 'Belgium', '1234567890', '1234567890', 'factory@lotus.be', NULL),
(3, 2, 'Smelter', 'Ironstreet', '3', 'Eeklo', 'Belgium', '67393040', '6789230', 'smelter@sidmar.be', NULL),
(4, 2, 'Recylcer', 'IRonstreet', '90', 'Eeklo', 'Belgium', '87974938704', '38973487', 'recycler@sidmar.be', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `internship`
--

CREATE TABLE IF NOT EXISTS `internship` (
  `idInternship` int(11) NOT NULL AUTO_INCREMENT,
  `InternshipTemplate_ID` int(11) NOT NULL,
  `Start` date DEFAULT NULL,
  `End` date DEFAULT NULL,
  PRIMARY KEY (`idInternship`,`InternshipTemplate_ID`),
  UNIQUE KEY `idIntership_UNIQUE` (`idInternship`),
  KEY `fk_Intership_InternshipTemplate1_idx` (`InternshipTemplate_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `internship`
--

INSERT INTO `internship` (`idInternship`, `InternshipTemplate_ID`, `Start`, `End`) VALUES
(1, 1, '2008-06-13', '2008-06-15'),
(2, 2, '2008-06-14', '2008-06-18'),
(3, 3, '2008-06-12', '2008-06-10'),
(4, 4, '2008-06-17', '2008-06-20'),
(5, 5, '2013-05-08', '2013-05-29'),
(6, 6, '2008-06-17', '2008-06-18'),
(7, 6, '2008-06-05', '2008-06-19'),
(8, 2, '2008-06-12', '2008-06-18'),
(9, 3, '2008-06-18', '2008-06-18'),
(10, 4, '2008-06-10', '2008-06-20');

-- --------------------------------------------------------

--
-- Table structure for table `internshiptemplate`
--

CREATE TABLE IF NOT EXISTS `internshiptemplate` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Facileties_ID` int(11) NOT NULL,
  `Title` varchar(45) DEFAULT NULL,
  `Description` text,
  `Required_Knowledge` text,
  PRIMARY KEY (`ID`,`Facileties_ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `fk_table1_Facileties1_idx` (`Facileties_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `internshiptemplate`
--

INSERT INTO `internshiptemplate` (`ID`, `Facileties_ID`, `Title`, `Description`, `Required_Knowledge`) VALUES
(1, 2, 'skjdnbsdjlf', 'gvbhnjk,;lmk,njbhvgcfgvbhnjk,l;bhgvfcgvbhjnk,l', 'gvhbjnkl'),
(2, 1, 'smdnf', 'gyhujnk,l;kjhgfccgvhbjnk,l;m', 'hbjnk,l'),
(3, 2, 'ksdnfm', 'hbjnk,jhgcfhjklmknjbhui', 'hbjnk,l'),
(4, 1, 's,dnf', 'ubsniojfpkljbhvygduhsoijfkd', '$bhnjk,l;µ'),
(5, 2, 'mksndf', 'sbdjknflmd;sv ,njzheijokfls', 'bnj,k'),
(6, 3, 'bhnjk,l;m', 'yuhji,k;l:mkjuhygvhbjikopl', 'isndfi');

-- --------------------------------------------------------

--
-- Table structure for table `internshiptemplate_has_sector`
--

CREATE TABLE IF NOT EXISTS `internshiptemplate_has_sector` (
  `InternshipTemplate_ID` int(11) NOT NULL,
  `Sector_idSector` int(11) NOT NULL,
  PRIMARY KEY (`InternshipTemplate_ID`,`Sector_idSector`),
  KEY `fk_InternshipTemplate_has_Sector_Sector1_idx` (`Sector_idSector`),
  KEY `fk_InternshipTemplate_has_Sector_InternshipTemplate1_idx` (`InternshipTemplate_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `internshiptemplate_has_sector`
--

INSERT INTO `internshiptemplate_has_sector` (`InternshipTemplate_ID`, `Sector_idSector`) VALUES
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
-- Constraints for table `facileties`
--
ALTER TABLE `facileties`
  ADD CONSTRAINT `fk_Facileties_Companies` FOREIGN KEY (`CompaniesID`) REFERENCES `companies` (`idCompany`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `internship`
--
ALTER TABLE `internship`
  ADD CONSTRAINT `fk_Intership_InternshipTemplate1` FOREIGN KEY (`InternshipTemplate_ID`) REFERENCES `internshiptemplate` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `internshiptemplate`
--
ALTER TABLE `internshiptemplate`
  ADD CONSTRAINT `fk_table1_Facileties1` FOREIGN KEY (`Facileties_ID`) REFERENCES `facileties` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `internshiptemplate_has_sector`
--
ALTER TABLE `internshiptemplate_has_sector`
  ADD CONSTRAINT `fk_InternshipTemplate_has_Sector_InternshipTemplate1` FOREIGN KEY (`InternshipTemplate_ID`) REFERENCES `internshiptemplate` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_InternshipTemplate_has_Sector_Sector1` FOREIGN KEY (`Sector_idSector`) REFERENCES `sector` (`idSector`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
