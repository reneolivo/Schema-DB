-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.1.41 - Source distribution
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2012-08-28 20:40:18
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping structure for table schemadb.article
DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `idCreativeWork` int(10) unsigned NOT NULL,
  `articleBody` text,
  `section` varchar(15) DEFAULT NULL,
  `wordCount` int(4) DEFAULT NULL,
  PRIMARY KEY (`idCreativeWork`),
  KEY `fk_Article_CreativeWork` (`idCreativeWork`),
  CONSTRAINT `fk_Article_CreativeWork` FOREIGN KEY (`idCreativeWork`) REFERENCES `creativework` (`idThing`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table schemadb.article: ~0 rows (approximately)
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
/*!40000 ALTER TABLE `article` ENABLE KEYS */;


-- Dumping structure for table schemadb.contactpoint
DROP TABLE IF EXISTS `contactpoint`;
CREATE TABLE IF NOT EXISTS `contactpoint` (
  `idThing` int(10) unsigned NOT NULL,
  `contactType` varchar(20) DEFAULT NULL,
  `email` varchar(120) NOT NULL COMMENT '		',
  `faxNumber` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idThing`),
  KEY `fk_ContactPoint_Thing` (`idThing`),
  CONSTRAINT `fk_ContactPoint_Thing` FOREIGN KEY (`idThing`) REFERENCES `thing` (`idThing`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table schemadb.contactpoint: ~0 rows (approximately)
/*!40000 ALTER TABLE `contactpoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `contactpoint` ENABLE KEYS */;


-- Dumping structure for table schemadb.country
DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `idThing` int(10) unsigned NOT NULL,
  `address` int(10) unsigned DEFAULT NULL,
  `containedIn` int(10) unsigned DEFAULT NULL,
  `geo` int(10) unsigned DEFAULT NULL,
  `maps` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idThing`),
  KEY `fk_Country_Thing` (`idThing`),
  KEY `fk_Country_ContainedIn` (`containedIn`),
  KEY `fk_Country_Geo` (`geo`),
  CONSTRAINT `fk_Country_ContainedIn` FOREIGN KEY (`containedIn`) REFERENCES `place` (`idThing`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Country_Geo` FOREIGN KEY (`geo`) REFERENCES `geo` (`idThing`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Country_Thing` FOREIGN KEY (`idThing`) REFERENCES `thing` (`idThing`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table schemadb.country: ~0 rows (approximately)
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
/*!40000 ALTER TABLE `country` ENABLE KEYS */;


-- Dumping structure for table schemadb.creativework
DROP TABLE IF EXISTS `creativework`;
CREATE TABLE IF NOT EXISTS `creativework` (
  `idThing` int(10) unsigned NOT NULL,
  `accountablePerson` int(10) unsigned DEFAULT NULL,
  `AlternativeHeadline` varchar(60) DEFAULT NULL,
  `awards` tinytext,
  `contentLocation` int(10) unsigned DEFAULT NULL,
  `contentRating` varchar(15) DEFAULT NULL,
  `copyrightHolder` int(10) unsigned DEFAULT NULL,
  `copyrightYear` int(4) unsigned DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `datePublished` datetime DEFAULT NULL,
  `discussionUrl` varchar(120) DEFAULT NULL,
  `editor` int(10) unsigned DEFAULT NULL,
  `genre` varchar(15) DEFAULT NULL,
  `headline` varchar(80) DEFAULT NULL,
  `inLanguage` varchar(15) DEFAULT NULL,
  `interactionCount` varchar(80) DEFAULT NULL,
  `isFamilyFriendly` tinyint(1) NOT NULL DEFAULT '1',
  `keywords` tinytext,
  `version` float DEFAULT NULL,
  PRIMARY KEY (`idThing`),
  KEY `fk_CreativeWork_Thing` (`idThing`),
  KEY `fk_CreativeWork_AccountablePerson` (`accountablePerson`),
  KEY `fk_CreativeWork_ContentLocation` (`contentLocation`),
  KEY `fk_CreativeWork_CopyrightHolder` (`copyrightHolder`),
  KEY `fk_CreativeWork_Editor` (`editor`),
  CONSTRAINT `fk_CreativeWork_AccountablePerson` FOREIGN KEY (`accountablePerson`) REFERENCES `person` (`idThing`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CreativeWork_ContentLocation` FOREIGN KEY (`contentLocation`) REFERENCES `place` (`idThing`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CreativeWork_CopyrightHolder` FOREIGN KEY (`copyrightHolder`) REFERENCES `person` (`idThing`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CreativeWork_Editor` FOREIGN KEY (`editor`) REFERENCES `person` (`idThing`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CreativeWork_Thing` FOREIGN KEY (`idThing`) REFERENCES `thing` (`idThing`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table schemadb.creativework: ~3 rows (approximately)
/*!40000 ALTER TABLE `creativework` DISABLE KEYS */;
INSERT INTO `creativework` (`idThing`, `accountablePerson`, `AlternativeHeadline`, `awards`, `contentLocation`, `contentRating`, `copyrightHolder`, `copyrightYear`, `dateCreated`, `dateModified`, `datePublished`, `discussionUrl`, `editor`, `genre`, `headline`, `inLanguage`, `interactionCount`, `isFamilyFriendly`, `keywords`, `version`) VALUES
	(1, NULL, '', NULL, NULL, NULL, NULL, NULL, '2012-04-14 21:34:55', '2012-04-14 21:34:59', '2012-04-14 21:35:03', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
	(3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-04-15 03:31:19', '2012-04-15 03:31:23', '2012-04-15 03:31:26', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
	(4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-04-15 03:31:19', '2012-04-15 03:31:19', '2012-04-15 03:31:19', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);
/*!40000 ALTER TABLE `creativework` ENABLE KEYS */;


-- Dumping structure for table schemadb.geo
DROP TABLE IF EXISTS `geo`;
CREATE TABLE IF NOT EXISTS `geo` (
  `idThing` int(10) unsigned NOT NULL,
  `elevation` float unsigned DEFAULT NULL,
  `latitude` float unsigned NOT NULL,
  `longitude` float unsigned NOT NULL,
  PRIMARY KEY (`idThing`),
  KEY `fk_Geo_Thing` (`idThing`),
  CONSTRAINT `fk_Geo_Thing` FOREIGN KEY (`idThing`) REFERENCES `thing` (`idThing`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table schemadb.geo: ~0 rows (approximately)
/*!40000 ALTER TABLE `geo` DISABLE KEYS */;
/*!40000 ALTER TABLE `geo` ENABLE KEYS */;


-- Dumping structure for table schemadb.imageobject
DROP TABLE IF EXISTS `imageobject`;
CREATE TABLE IF NOT EXISTS `imageobject` (
  `idMediaObject` int(10) unsigned NOT NULL DEFAULT '0',
  `caption` text,
  `representativeOfPage` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idMediaObject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table schemadb.imageobject: ~2 rows (approximately)
/*!40000 ALTER TABLE `imageobject` DISABLE KEYS */;
INSERT INTO `imageobject` (`idMediaObject`, `caption`, `representativeOfPage`) VALUES
	(1, 'This is just an image', 0),
	(2, 'another image', 0);
/*!40000 ALTER TABLE `imageobject` ENABLE KEYS */;


-- Dumping structure for table schemadb.mediaobject
DROP TABLE IF EXISTS `mediaobject`;
CREATE TABLE IF NOT EXISTS `mediaobject` (
  `idCreativeWork` int(10) unsigned NOT NULL,
  `bitrate` varchar(10) DEFAULT NULL,
  `contentSize` smallint(5) unsigned DEFAULT NULL,
  `duration` timestamp NULL DEFAULT NULL,
  `embedURL` varchar(60) DEFAULT NULL,
  `encodingFormat` varchar(8) DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `width` int(5) unsigned DEFAULT NULL,
  `height` int(5) DEFAULT NULL,
  `playerType` varchar(15) DEFAULT NULL,
  `requiresSubscription` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `uploadDate` datetime DEFAULT NULL,
  PRIMARY KEY (`idCreativeWork`),
  KEY `fk_MediaObject_CreativeWork` (`idCreativeWork`),
  CONSTRAINT `fk_MediaObject_CreativeWork` FOREIGN KEY (`idCreativeWork`) REFERENCES `thing` (`idThing`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table schemadb.mediaobject: ~2 rows (approximately)
/*!40000 ALTER TABLE `mediaobject` DISABLE KEYS */;
INSERT INTO `mediaobject` (`idCreativeWork`, `bitrate`, `contentSize`, `duration`, `embedURL`, `encodingFormat`, `expires`, `width`, `height`, `playerType`, `requiresSubscription`, `uploadDate`) VALUES
	(3, NULL, NULL, NULL, NULL, NULL, NULL, 320, 240, NULL, 0, NULL),
	(4, NULL, NULL, NULL, NULL, NULL, NULL, 320, 240, NULL, 0, NULL);
/*!40000 ALTER TABLE `mediaobject` ENABLE KEYS */;


-- Dumping structure for table schemadb.person
DROP TABLE IF EXISTS `person`;
CREATE TABLE IF NOT EXISTS `person` (
  `idThing` int(10) unsigned NOT NULL,
  `additionalName` varchar(15) NOT NULL DEFAULT '',
  `awards` varchar(120) DEFAULT NULL,
  `birthDate` datetime DEFAULT NULL,
  `deathDate` datetime DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `familyName` varchar(20) DEFAULT NULL,
  `faxNumber` varchar(15) DEFAULT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `givenName` varchar(20) DEFAULT NULL,
  `homeLocation` int(10) unsigned DEFAULT NULL,
  `honorificPrefix` varchar(10) DEFAULT NULL,
  `honorificSubfix` varchar(10) DEFAULT NULL,
  `interactionCount` varchar(80) DEFAULT NULL,
  `jobTitle` varchar(20) DEFAULT NULL,
  `nationality` int(10) unsigned DEFAULT NULL,
  `spouse` int(10) unsigned DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `workLocation` int(10) unsigned DEFAULT NULL,
  `worksFor` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`idThing`),
  KEY `fk_Person_Thing` (`idThing`),
  KEY `fk_Person_HomeLocation` (`homeLocation`),
  KEY `fk_Person_Nationality` (`nationality`),
  KEY `fk_Person_Spouse` (`spouse`),
  KEY `fk_Person_WorkLocation` (`workLocation`),
  CONSTRAINT `fk_Person_HomeLocation` FOREIGN KEY (`homeLocation`) REFERENCES `place` (`idThing`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Person_Nationality` FOREIGN KEY (`nationality`) REFERENCES `place` (`idThing`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Person_Spouse` FOREIGN KEY (`spouse`) REFERENCES `person` (`idThing`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Person_Thing` FOREIGN KEY (`idThing`) REFERENCES `thing` (`idThing`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Person_WorkLocation` FOREIGN KEY (`workLocation`) REFERENCES `place` (`idThing`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table schemadb.person: ~1 rows (approximately)
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` (`idThing`, `additionalName`, `awards`, `birthDate`, `deathDate`, `email`, `familyName`, `faxNumber`, `gender`, `givenName`, `homeLocation`, `honorificPrefix`, `honorificSubfix`, `interactionCount`, `jobTitle`, `nationality`, `spouse`, `telephone`, `workLocation`, `worksFor`) VALUES
	(2, '', NULL, '1980-04-13 21:40:54', NULL, 'johnsmith@schemadb.com', 'Smith', NULL, 'male', 'John', NULL, NULL, NULL, NULL, 'Administrator', NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;


-- Dumping structure for table schemadb.place
DROP TABLE IF EXISTS `place`;
CREATE TABLE IF NOT EXISTS `place` (
  `idThing` int(10) unsigned NOT NULL,
  `address` int(10) unsigned DEFAULT NULL,
  `containedIn` int(10) unsigned DEFAULT NULL,
  `faxNumber` varchar(20) DEFAULT NULL,
  `geo` int(10) unsigned DEFAULT NULL,
  `maps` varchar(255) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idThing`),
  KEY `fk_Place_Thing` (`idThing`),
  KEY `fk_Place_Address` (`address`),
  KEY `fk_Place_ContainedIn` (`containedIn`),
  KEY `fk_Place_Geo` (`geo`),
  CONSTRAINT `fk_Place_Address` FOREIGN KEY (`address`) REFERENCES `postaladdress` (`idThing`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Place_ContainedIn` FOREIGN KEY (`containedIn`) REFERENCES `place` (`idThing`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Place_Geo` FOREIGN KEY (`geo`) REFERENCES `geo` (`idThing`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Place_Thing` FOREIGN KEY (`idThing`) REFERENCES `thing` (`idThing`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table schemadb.place: ~0 rows (approximately)
/*!40000 ALTER TABLE `place` DISABLE KEYS */;
/*!40000 ALTER TABLE `place` ENABLE KEYS */;


-- Dumping structure for table schemadb.postaladdress
DROP TABLE IF EXISTS `postaladdress`;
CREATE TABLE IF NOT EXISTS `postaladdress` (
  `idThing` int(10) unsigned NOT NULL,
  `idContactPoint` int(10) unsigned DEFAULT NULL,
  `addressCountry` int(10) unsigned DEFAULT NULL,
  `addressLocality` varchar(80) DEFAULT NULL,
  `addressRegion` varchar(20) DEFAULT NULL,
  `postOfficeBoxNumber` varchar(15) DEFAULT NULL,
  `postalCode` varchar(10) DEFAULT NULL,
  `streetAddress` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`idThing`),
  KEY `fk_PostalAddress_Thing` (`idThing`),
  KEY `fk_PostalAddress_ContactPoint` (`idContactPoint`),
  KEY `fk_PostalAddress_AddressCountry` (`addressCountry`),
  CONSTRAINT `fk_PostalAddress_AddressCountry` FOREIGN KEY (`addressCountry`) REFERENCES `country` (`idThing`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PostalAddress_ContactPoint` FOREIGN KEY (`idContactPoint`) REFERENCES `contactpoint` (`idThing`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PostalAddress_Thing` FOREIGN KEY (`idThing`) REFERENCES `postaladdress` (`idThing`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table schemadb.postaladdress: ~0 rows (approximately)
/*!40000 ALTER TABLE `postaladdress` DISABLE KEYS */;
/*!40000 ALTER TABLE `postaladdress` ENABLE KEYS */;


-- Dumping structure for table schemadb.relationship
DROP TABLE IF EXISTS `relationship`;
CREATE TABLE IF NOT EXISTS `relationship` (
  `from` int(10) unsigned NOT NULL,
  `relationship` varchar(20) NOT NULL,
  `to` int(10) unsigned NOT NULL,
  PRIMARY KEY (`from`,`to`),
  KEY `fk_reltionship_from` (`from`),
  KEY `fk_relationship_to` (`to`),
  KEY `indx_relationship` (`relationship`),
  CONSTRAINT `fk_relationship_to` FOREIGN KEY (`to`) REFERENCES `thing` (`idThing`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reltionship_from` FOREIGN KEY (`from`) REFERENCES `thing` (`idThing`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table schemadb.relationship: ~0 rows (approximately)
/*!40000 ALTER TABLE `relationship` DISABLE KEYS */;
/*!40000 ALTER TABLE `relationship` ENABLE KEYS */;


-- Dumping structure for table schemadb.thing
DROP TABLE IF EXISTS `thing`;
CREATE TABLE IF NOT EXISTS `thing` (
  `idThing` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `description` varchar(120) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `url` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`idThing`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table schemadb.thing: ~4 rows (approximately)
/*!40000 ALTER TABLE `thing` DISABLE KEYS */;
INSERT INTO `thing` (`idThing`, `name`, `description`, `image`, `url`) VALUES
	(1, 'Article Sample', 'this should be a short description for the article', NULL, 'article/1'),
	(2, 'John Smith', 'John Smith is a lonely person', NULL, 'person/1'),
	(3, 'Picture #1', NULL, NULL, NULL),
	(4, 'Picture #2', NULL, NULL, NULL);
/*!40000 ALTER TABLE `thing` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
