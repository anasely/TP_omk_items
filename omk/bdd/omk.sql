-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 04 nov. 2023 à 22:09
-- Version du serveur :  5.7.31
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `omk_thyp_24`
--

-- --------------------------------------------------------

--
-- Structure de la table `api_key`
--

DROP TABLE IF EXISTS `api_key`;
CREATE TABLE IF NOT EXISTS `api_key` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credential_hash` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_ip` varbinary(16) DEFAULT NULL COMMENT '(DC2Type:ip_address)',
  `last_accessed` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C912ED9D7E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `api_key`
--

INSERT INTO `api_key` (`id`, `owner_id`, `label`, `credential_hash`, `last_ip`, `last_accessed`, `created`) VALUES
('zCDoVczqJaPXxE2U8WAr0UFYILC0KrNk', 1, 'displaying', '$2y$10$YWrWlpZwuR44v1BZiY1tiuZishq/ekyjmBxWdFvSN3t6d0jMK6LwG', NULL, NULL, '2023-11-04 15:38:18');

-- --------------------------------------------------------

--
-- Structure de la table `asset`
--

DROP TABLE IF EXISTS `asset`;
CREATE TABLE IF NOT EXISTS `asset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_text` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2AF5A5C5CC5DB90` (`storage_id`),
  KEY `IDX_2AF5A5C7E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fulltext_search`
--

DROP TABLE IF EXISTS `fulltext_search`;
CREATE TABLE IF NOT EXISTS `fulltext_search` (
  `id` int(11) NOT NULL,
  `resource` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci,
  `text` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`,`resource`),
  KEY `IDX_AA31FE4A7E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fulltext_search`
--

INSERT INTO `fulltext_search` (`id`, `resource`, `owner_id`, `is_public`, `title`, `text`) VALUES
(1, 'item_sets', 1, 1, NULL, 'rrrrr\nreerrer\nrerer'),
(3, 'items', 1, 1, 'Usain Bolt', 'Usain Bolt\nPortrait de l\'athlète jamaïcain Usain Bolt, le sprinter le plus rapide du monde.\nSprint\n40'),
(4, 'items', 1, 1, 'Serena Williams', ' Serena Williams\nPortrait de la championne de tennis américaine Serena Williams, l\'une des meilleures joueuses de tous les temps.\nTennis\n42'),
(5, 'items', 1, 1, 'Michael Phelps', 'Michael Phelps\n Portrait du nageur américain Michael Phelps, l\'athlète le plus médaillé de \nNatation\n38');

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `id` int(11) NOT NULL,
  `primary_media_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1F1B251ECBE0B084` (`primary_media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item`
--

INSERT INTO `item` (`id`, `primary_media_id`) VALUES
(3, NULL),
(4, NULL),
(5, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `item_item_set`
--

DROP TABLE IF EXISTS `item_item_set`;
CREATE TABLE IF NOT EXISTS `item_item_set` (
  `item_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL,
  PRIMARY KEY (`item_id`,`item_set_id`),
  KEY `IDX_6D0C9625126F525E` (`item_id`),
  KEY `IDX_6D0C9625960278D7` (`item_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item_item_set`
--

INSERT INTO `item_item_set` (`item_id`, `item_set_id`) VALUES
(3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `item_set`
--

DROP TABLE IF EXISTS `item_set`;
CREATE TABLE IF NOT EXISTS `item_set` (
  `id` int(11) NOT NULL,
  `is_open` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item_set`
--

INSERT INTO `item_set` (`id`, `is_open`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `item_site`
--

DROP TABLE IF EXISTS `item_site`;
CREATE TABLE IF NOT EXISTS `item_site` (
  `item_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`item_id`,`site_id`),
  KEY `IDX_A1734D1F126F525E` (`item_id`),
  KEY `IDX_A1734D1FF6BD1646` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item_site`
--

INSERT INTO `item_site` (`item_id`, `site_id`) VALUES
(3, 1),
(4, 1),
(5, 1);

-- --------------------------------------------------------

--
-- Structure de la table `job`
--

DROP TABLE IF EXISTS `job`;
CREATE TABLE IF NOT EXISTS `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `pid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `args` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `log` longtext COLLATE utf8mb4_unicode_ci,
  `started` datetime NOT NULL,
  `ended` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FBD8E0F87E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `ingester` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `renderer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `source` longtext COLLATE utf8mb4_unicode_ci,
  `media_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storage_id` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sha256` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `has_original` tinyint(1) NOT NULL,
  `has_thumbnails` tinyint(1) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `lang` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_text` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6A2CA10C5CC5DB90` (`storage_id`),
  KEY `IDX_6A2CA10C126F525E` (`item_id`),
  KEY `item_position` (`item_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migration`
--

DROP TABLE IF EXISTS `migration`;
CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration`
--

INSERT INTO `migration` (`version`) VALUES
('20171128053327'),
('20180412035023'),
('20180919072656'),
('20180924033501'),
('20181002015551'),
('20181004043735'),
('20181106060421'),
('20190307043537'),
('20190319020708'),
('20190412090532'),
('20190423040354'),
('20190423071228'),
('20190514061351'),
('20190515055359'),
('20190729023728'),
('20190809092609'),
('20190815062003'),
('20200224022356'),
('20200226064602'),
('20200325091157'),
('20200326091310'),
('20200803000000'),
('20200831000000'),
('20210205101827'),
('20210225095734'),
('20210810083804'),
('20220718090449'),
('20220824103916'),
('20230601060113'),
('20230713101012');

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

DROP TABLE IF EXISTS `module`;
CREATE TABLE IF NOT EXISTS `module` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `password_creation`
--

DROP TABLE IF EXISTS `password_creation`;
CREATE TABLE IF NOT EXISTS `password_creation` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `activate` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C77917B4A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `property`
--

DROP TABLE IF EXISTS `property`;
CREATE TABLE IF NOT EXISTS `property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8BF21CDEAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  KEY `IDX_8BF21CDE7E3C61F9` (`owner_id`),
  KEY `IDX_8BF21CDEAD0E05F6` (`vocabulary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `property`
--

INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'title', 'Title', 'A name given to the resource.'),
(2, NULL, 1, 'creator', 'Creator', 'An entity primarily responsible for making the resource.'),
(3, NULL, 1, 'subject', 'Subject', 'The topic of the resource.'),
(4, NULL, 1, 'description', 'Description', 'An account of the resource.'),
(5, NULL, 1, 'publisher', 'Publisher', 'An entity responsible for making the resource available.'),
(6, NULL, 1, 'contributor', 'Contributor', 'An entity responsible for making contributions to the resource.'),
(7, NULL, 1, 'date', 'Date', 'A point or period of time associated with an event in the lifecycle of the resource.'),
(8, NULL, 1, 'type', 'Type', 'The nature or genre of the resource.'),
(9, NULL, 1, 'format', 'Format', 'The file format, physical medium, or dimensions of the resource.'),
(10, NULL, 1, 'identifier', 'Identifier', 'An unambiguous reference to the resource within a given context.'),
(11, NULL, 1, 'source', 'Source', 'A related resource from which the described resource is derived.'),
(12, NULL, 1, 'language', 'Language', 'A language of the resource.'),
(13, NULL, 1, 'relation', 'Relation', 'A related resource.'),
(14, NULL, 1, 'coverage', 'Coverage', 'The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant.'),
(15, NULL, 1, 'rights', 'Rights', 'Information about rights held in and over the resource.'),
(16, NULL, 1, 'audience', 'Audience', 'A class of entity for whom the resource is intended or useful.'),
(17, NULL, 1, 'alternative', 'Alternative Title', 'An alternative name for the resource.'),
(18, NULL, 1, 'tableOfContents', 'Table Of Contents', 'A list of subunits of the resource.'),
(19, NULL, 1, 'abstract', 'Abstract', 'A summary of the resource.'),
(20, NULL, 1, 'created', 'Date Created', 'Date of creation of the resource.'),
(21, NULL, 1, 'valid', 'Date Valid', 'Date (often a range) of validity of a resource.'),
(22, NULL, 1, 'available', 'Date Available', 'Date (often a range) that the resource became or will become available.'),
(23, NULL, 1, 'issued', 'Date Issued', 'Date of formal issuance (e.g., publication) of the resource.'),
(24, NULL, 1, 'modified', 'Date Modified', 'Date on which the resource was changed.'),
(25, NULL, 1, 'extent', 'Extent', 'The size or duration of the resource.'),
(26, NULL, 1, 'medium', 'Medium', 'The material or physical carrier of the resource.'),
(27, NULL, 1, 'isVersionOf', 'Is Version Of', 'A related resource of which the described resource is a version, edition, or adaptation.'),
(28, NULL, 1, 'hasVersion', 'Has Version', 'A related resource that is a version, edition, or adaptation of the described resource.'),
(29, NULL, 1, 'isReplacedBy', 'Is Replaced By', 'A related resource that supplants, displaces, or supersedes the described resource.'),
(30, NULL, 1, 'replaces', 'Replaces', 'A related resource that is supplanted, displaced, or superseded by the described resource.'),
(31, NULL, 1, 'isRequiredBy', 'Is Required By', 'A related resource that requires the described resource to support its function, delivery, or coherence.'),
(32, NULL, 1, 'requires', 'Requires', 'A related resource that is required by the described resource to support its function, delivery, or coherence.'),
(33, NULL, 1, 'isPartOf', 'Is Part Of', 'A related resource in which the described resource is physically or logically included.'),
(34, NULL, 1, 'hasPart', 'Has Part', 'A related resource that is included either physically or logically in the described resource.'),
(35, NULL, 1, 'isReferencedBy', 'Is Referenced By', 'A related resource that references, cites, or otherwise points to the described resource.'),
(36, NULL, 1, 'references', 'References', 'A related resource that is referenced, cited, or otherwise pointed to by the described resource.'),
(37, NULL, 1, 'isFormatOf', 'Is Format Of', 'A related resource that is substantially the same as the described resource, but in another format.'),
(38, NULL, 1, 'hasFormat', 'Has Format', 'A related resource that is substantially the same as the pre-existing described resource, but in another format.'),
(39, NULL, 1, 'conformsTo', 'Conforms To', 'An established standard to which the described resource conforms.'),
(40, NULL, 1, 'spatial', 'Spatial Coverage', 'Spatial characteristics of the resource.'),
(41, NULL, 1, 'temporal', 'Temporal Coverage', 'Temporal characteristics of the resource.'),
(42, NULL, 1, 'mediator', 'Mediator', 'An entity that mediates access to the resource and for whom the resource is intended or useful.'),
(43, NULL, 1, 'dateAccepted', 'Date Accepted', 'Date of acceptance of the resource.'),
(44, NULL, 1, 'dateCopyrighted', 'Date Copyrighted', 'Date of copyright.'),
(45, NULL, 1, 'dateSubmitted', 'Date Submitted', 'Date of submission of the resource.'),
(46, NULL, 1, 'educationLevel', 'Audience Education Level', 'A class of entity, defined in terms of progression through an educational or training context, for which the described resource is intended.'),
(47, NULL, 1, 'accessRights', 'Access Rights', 'Information about who can access the resource or an indication of its security status.'),
(48, NULL, 1, 'bibliographicCitation', 'Bibliographic Citation', 'A bibliographic reference for the resource.'),
(49, NULL, 1, 'license', 'License', 'A legal document giving official permission to do something with the resource.'),
(50, NULL, 1, 'rightsHolder', 'Rights Holder', 'A person or organization owning or managing rights over the resource.'),
(51, NULL, 1, 'provenance', 'Provenance', 'A statement of any changes in ownership and custody of the resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(52, NULL, 1, 'instructionalMethod', 'Instructional Method', 'A process, used to engender knowledge, attitudes and skills, that the described resource is designed to support.'),
(53, NULL, 1, 'accrualMethod', 'Accrual Method', 'The method by which items are added to a collection.'),
(54, NULL, 1, 'accrualPeriodicity', 'Accrual Periodicity', 'The frequency with which items are added to a collection.'),
(55, NULL, 1, 'accrualPolicy', 'Accrual Policy', 'The policy governing the addition of items to a collection.'),
(56, NULL, 3, 'affirmedBy', 'affirmedBy', 'A legal decision that affirms a ruling.'),
(57, NULL, 3, 'annotates', 'annotates', 'Critical or explanatory note for a Document.'),
(58, NULL, 3, 'authorList', 'list of authors', 'An ordered list of authors. Normally, this list is seen as a priority list that order authors by importance.'),
(59, NULL, 3, 'citedBy', 'cited by', 'Relates a document to another document that cites the\nfirst document.'),
(60, NULL, 3, 'cites', 'cites', 'Relates a document to another document that is cited\nby the first document as reference, comment, review, quotation or for\nanother purpose.'),
(61, NULL, 3, 'contributorList', 'list of contributors', 'An ordered list of contributors. Normally, this list is seen as a priority list that order contributors by importance.'),
(62, NULL, 3, 'court', 'court', 'A court associated with a legal document; for example, that which issues a decision.'),
(63, NULL, 3, 'degree', 'degree', 'The thesis degree.'),
(64, NULL, 3, 'director', 'director', 'A Film director.'),
(65, NULL, 3, 'distributor', 'distributor', 'Distributor of a document or a collection of documents.'),
(66, NULL, 3, 'editor', 'editor', 'A person having managerial and sometimes policy-making responsibility for the editorial part of a publishing firm or of a newspaper, magazine, or other publication.'),
(67, NULL, 3, 'editorList', 'list of editors', 'An ordered list of editors. Normally, this list is seen as a priority list that order editors by importance.'),
(68, NULL, 3, 'interviewee', 'interviewee', 'An agent that is interviewed by another agent.'),
(69, NULL, 3, 'interviewer', 'interviewer', 'An agent that interview another agent.'),
(70, NULL, 3, 'issuer', 'issuer', 'An entity responsible for issuing often informally published documents such as press releases, reports, etc.'),
(71, NULL, 3, 'organizer', 'organizer', 'The organizer of an event; includes conference organizers, but also government agencies or other bodies that are responsible for conducting hearings.'),
(72, NULL, 3, 'owner', 'owner', 'Owner of a document or a collection of documents.'),
(73, NULL, 3, 'performer', 'performer', NULL),
(74, NULL, 3, 'presentedAt', 'presented at', 'Relates a document to an event; for example, a paper to a conference.'),
(75, NULL, 3, 'presents', 'presents', 'Relates an event to associated documents; for example, conference to a paper.'),
(76, NULL, 3, 'producer', 'producer', 'Producer of a document or a collection of documents.'),
(77, NULL, 3, 'recipient', 'recipient', 'An agent that receives a communication document.'),
(78, NULL, 3, 'reproducedIn', 'reproducedIn', 'The resource in which another resource is reproduced.'),
(79, NULL, 3, 'reversedBy', 'reversedBy', 'A legal decision that reverses a ruling.'),
(80, NULL, 3, 'reviewOf', 'review of', 'Relates a review document to a reviewed thing (resource, item, etc.).'),
(81, NULL, 3, 'status', 'status', 'The publication status of (typically academic) content.'),
(82, NULL, 3, 'subsequentLegalDecision', 'subsequentLegalDecision', 'A legal decision on appeal that takes action on a case (affirming it, reversing it, etc.).'),
(83, NULL, 3, 'transcriptOf', 'transcript of', 'Relates a document to some transcribed original.'),
(84, NULL, 3, 'translationOf', 'translation of', 'Relates a translated document to the original document.'),
(85, NULL, 3, 'translator', 'translator', 'A person who translates written document from one language to another.'),
(86, NULL, 3, 'abstract', 'abstract', 'A summary of the resource.'),
(87, NULL, 3, 'argued', 'date argued', 'The date on which a legal case is argued before a court. Date is of format xsd:date'),
(88, NULL, 3, 'asin', 'asin', NULL),
(89, NULL, 3, 'chapter', 'chapter', 'An chapter number'),
(90, NULL, 3, 'coden', 'coden', NULL),
(91, NULL, 3, 'content', 'content', 'This property is for a plain-text rendering of the content of a Document. While the plain-text content of an entire document could be described by this property.'),
(92, NULL, 3, 'doi', 'doi', NULL),
(93, NULL, 3, 'eanucc13', 'eanucc13', NULL),
(94, NULL, 3, 'edition', 'edition', 'The name defining a special edition of a document. Normally its a literal value composed of a version number and words.'),
(95, NULL, 3, 'eissn', 'eissn', NULL),
(96, NULL, 3, 'gtin14', 'gtin14', NULL),
(97, NULL, 3, 'handle', 'handle', NULL),
(98, NULL, 3, 'identifier', 'identifier', NULL),
(99, NULL, 3, 'isbn', 'isbn', NULL),
(100, NULL, 3, 'isbn10', 'isbn10', NULL),
(101, NULL, 3, 'isbn13', 'isbn13', NULL),
(102, NULL, 3, 'issn', 'issn', NULL),
(103, NULL, 3, 'issue', 'issue', 'An issue number'),
(104, NULL, 3, 'lccn', 'lccn', NULL),
(105, NULL, 3, 'locator', 'locator', 'A description (often numeric) that locates an item within a containing document or collection.'),
(106, NULL, 3, 'numPages', 'number of pages', 'The number of pages contained in a document'),
(107, NULL, 3, 'numVolumes', 'number of volumes', 'The number of volumes contained in a collection of documents (usually a series, periodical, etc.).'),
(108, NULL, 3, 'number', 'number', 'A generic item or document number. Not to be confused with issue number.'),
(109, NULL, 3, 'oclcnum', 'oclcnum', NULL),
(110, NULL, 3, 'pageEnd', 'page end', 'Ending page number within a continuous page range.'),
(111, NULL, 3, 'pageStart', 'page start', 'Starting page number within a continuous page range.'),
(112, NULL, 3, 'pages', 'pages', 'A string of non-contiguous page spans that locate a Document within a Collection. Example: 23-25, 34, 54-56. For continuous page ranges, use the pageStart and pageEnd properties.'),
(113, NULL, 3, 'pmid', 'pmid', NULL),
(114, NULL, 3, 'prefixName', 'prefix name', 'The prefix of a name'),
(115, NULL, 3, 'section', 'section', 'A section number'),
(116, NULL, 3, 'shortDescription', 'shortDescription', NULL),
(117, NULL, 3, 'shortTitle', 'short title', 'The abbreviation of a title.'),
(118, NULL, 3, 'sici', 'sici', NULL),
(119, NULL, 3, 'suffixName', 'suffix name', 'The suffix of a name'),
(120, NULL, 3, 'upc', 'upc', NULL),
(121, NULL, 3, 'uri', 'uri', 'Universal Resource Identifier of a document'),
(122, NULL, 3, 'volume', 'volume', 'A volume number'),
(123, NULL, 4, 'mbox', 'personal mailbox', 'A  personal mailbox, ie. an Internet mailbox associated with exactly one owner, the first owner of this mailbox. This is a \'static inverse functional property\', in that  there is (across time and change) at most one individual that ever has any particular value for foaf:mbox.'),
(124, NULL, 4, 'mbox_sha1sum', 'sha1sum of a personal mailbox URI name', 'The sha1sum of the URI of an Internet mailbox associated with exactly one owner, the  first owner of the mailbox.'),
(125, NULL, 4, 'gender', 'gender', 'The gender of this Agent (typically but not necessarily \'male\' or \'female\').'),
(126, NULL, 4, 'geekcode', 'geekcode', 'A textual geekcode for this person, see http://www.geekcode.com/geek.html'),
(127, NULL, 4, 'dnaChecksum', 'DNA checksum', 'A checksum for the DNA of some thing. Joke.'),
(128, NULL, 4, 'sha1', 'sha1sum (hex)', 'A sha1sum hash, in hex.'),
(129, NULL, 4, 'based_near', 'based near', 'A location that something is based near, for some broadly human notion of near.'),
(130, NULL, 4, 'title', 'title', 'Title (Mr, Mrs, Ms, Dr. etc)'),
(131, NULL, 4, 'nick', 'nickname', 'A short informal nickname characterising an agent (includes login identifiers, IRC and other chat nicknames).'),
(132, NULL, 4, 'jabberID', 'jabber ID', 'A jabber ID for something.'),
(133, NULL, 4, 'aimChatID', 'AIM chat ID', 'An AIM chat ID'),
(134, NULL, 4, 'skypeID', 'Skype ID', 'A Skype ID'),
(135, NULL, 4, 'icqChatID', 'ICQ chat ID', 'An ICQ chat ID'),
(136, NULL, 4, 'yahooChatID', 'Yahoo chat ID', 'A Yahoo chat ID'),
(137, NULL, 4, 'msnChatID', 'MSN chat ID', 'An MSN chat ID'),
(138, NULL, 4, 'name', 'name', 'A name for some thing.'),
(139, NULL, 4, 'firstName', 'firstName', 'The first name of a person.'),
(140, NULL, 4, 'lastName', 'lastName', 'The last name of a person.'),
(141, NULL, 4, 'givenName', 'Given name', 'The given name of some person.'),
(142, NULL, 4, 'givenname', 'Given name', 'The given name of some person.'),
(143, NULL, 4, 'surname', 'Surname', 'The surname of some person.'),
(144, NULL, 4, 'family_name', 'family_name', 'The family name of some person.'),
(145, NULL, 4, 'familyName', 'familyName', 'The family name of some person.'),
(146, NULL, 4, 'phone', 'phone', 'A phone,  specified using fully qualified tel: URI scheme (refs: http://www.w3.org/Addressing/schemes.html#tel).'),
(147, NULL, 4, 'homepage', 'homepage', 'A homepage for some thing.'),
(148, NULL, 4, 'weblog', 'weblog', 'A weblog of some thing (whether person, group, company etc.).'),
(149, NULL, 4, 'openid', 'openid', 'An OpenID for an Agent.'),
(150, NULL, 4, 'tipjar', 'tipjar', 'A tipjar document for this agent, describing means for payment and reward.'),
(151, NULL, 4, 'plan', 'plan', 'A .plan comment, in the tradition of finger and \'.plan\' files.'),
(152, NULL, 4, 'made', 'made', 'Something that was made by this agent.'),
(153, NULL, 4, 'maker', 'maker', 'An agent that  made this thing.'),
(154, NULL, 4, 'img', 'image', 'An image that can be used to represent some thing (ie. those depictions which are particularly representative of something, eg. one\'s photo on a homepage).'),
(155, NULL, 4, 'depiction', 'depiction', 'A depiction of some thing.'),
(156, NULL, 4, 'depicts', 'depicts', 'A thing depicted in this representation.'),
(157, NULL, 4, 'thumbnail', 'thumbnail', 'A derived thumbnail image.'),
(158, NULL, 4, 'myersBriggs', 'myersBriggs', 'A Myers Briggs (MBTI) personality classification.'),
(159, NULL, 4, 'workplaceHomepage', 'workplace homepage', 'A workplace homepage of some person; the homepage of an organization they work for.'),
(160, NULL, 4, 'workInfoHomepage', 'work info homepage', 'A work info homepage of some person; a page about their work for some organization.'),
(161, NULL, 4, 'schoolHomepage', 'schoolHomepage', 'A homepage of a school attended by the person.'),
(162, NULL, 4, 'knows', 'knows', 'A person known by this person (indicating some level of reciprocated interaction between the parties).'),
(163, NULL, 4, 'interest', 'interest', 'A page about a topic of interest to this person.'),
(164, NULL, 4, 'topic_interest', 'topic_interest', 'A thing of interest to this person.'),
(165, NULL, 4, 'publications', 'publications', 'A link to the publications of this person.'),
(166, NULL, 4, 'currentProject', 'current project', 'A current project this person works on.'),
(167, NULL, 4, 'pastProject', 'past project', 'A project this person has previously worked on.'),
(168, NULL, 4, 'fundedBy', 'funded by', 'An organization funding a project or person.'),
(169, NULL, 4, 'logo', 'logo', 'A logo representing some thing.'),
(170, NULL, 4, 'topic', 'topic', 'A topic of some page or document.'),
(171, NULL, 4, 'primaryTopic', 'primary topic', 'The primary topic of some page or document.'),
(172, NULL, 4, 'focus', 'focus', 'The underlying or \'focal\' entity associated with some SKOS-described concept.'),
(173, NULL, 4, 'isPrimaryTopicOf', 'is primary topic of', 'A document that this thing is the primary topic of.'),
(174, NULL, 4, 'page', 'page', 'A page or document about this thing.'),
(175, NULL, 4, 'theme', 'theme', 'A theme.'),
(176, NULL, 4, 'account', 'account', 'Indicates an account held by this agent.'),
(177, NULL, 4, 'holdsAccount', 'account', 'Indicates an account held by this agent.'),
(178, NULL, 4, 'accountServiceHomepage', 'account service homepage', 'Indicates a homepage of the service provide for this online account.'),
(179, NULL, 4, 'accountName', 'account name', 'Indicates the name (identifier) associated with this online account.'),
(180, NULL, 4, 'member', 'member', 'Indicates a member of a Group'),
(181, NULL, 4, 'membershipClass', 'membershipClass', 'Indicates the class of individuals that are a member of a Group'),
(182, NULL, 4, 'birthday', 'birthday', 'The birthday of this Agent, represented in mm-dd string form, eg. \'12-31\'.'),
(183, NULL, 4, 'age', 'age', 'The age in years of some agent.'),
(184, NULL, 4, 'status', 'status', 'A string expressing what the user is happy for the general public (normally) to know about their current activity.');

-- --------------------------------------------------------

--
-- Structure de la table `resource`
--

DROP TABLE IF EXISTS `resource`;
CREATE TABLE IF NOT EXISTS `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `resource_template_id` int(11) DEFAULT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `resource_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BC91F4167E3C61F9` (`owner_id`),
  KEY `IDX_BC91F416448CC1BD` (`resource_class_id`),
  KEY `IDX_BC91F41616131EA` (`resource_template_id`),
  KEY `IDX_BC91F416FDFF2E92` (`thumbnail_id`),
  KEY `title` (`title`(190))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(1, 1, 23, NULL, NULL, NULL, 1, '2023-10-28 23:21:54', '2023-11-04 20:59:29', 'Omeka\\Entity\\ItemSet'),
(3, 1, 94, NULL, NULL, 'Usain Bolt', 1, '2023-11-04 20:41:29', '2023-11-04 21:00:58', 'Omeka\\Entity\\Item'),
(4, 1, 94, 2, NULL, 'Serena Williams', 1, '2023-11-04 20:45:06', '2023-11-04 21:50:31', 'Omeka\\Entity\\Item'),
(5, 1, 94, 2, NULL, 'Michael Phelps', 1, '2023-11-04 20:48:19', '2023-11-04 21:30:09', 'Omeka\\Entity\\Item');

-- --------------------------------------------------------

--
-- Structure de la table `resource_class`
--

DROP TABLE IF EXISTS `resource_class`;
CREATE TABLE IF NOT EXISTS `resource_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C6F063ADAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  KEY `IDX_C6F063AD7E3C61F9` (`owner_id`),
  KEY `IDX_C6F063ADAD0E05F6` (`vocabulary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_class`
--

INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'Agent', 'Agent', 'A resource that acts or has the power to act.'),
(2, NULL, 1, 'AgentClass', 'Agent Class', 'A group of agents.'),
(3, NULL, 1, 'BibliographicResource', 'Bibliographic Resource', 'A book, article, or other documentary resource.'),
(4, NULL, 1, 'FileFormat', 'File Format', 'A digital resource format.'),
(5, NULL, 1, 'Frequency', 'Frequency', 'A rate at which something recurs.'),
(6, NULL, 1, 'Jurisdiction', 'Jurisdiction', 'The extent or range of judicial, law enforcement, or other authority.'),
(7, NULL, 1, 'LicenseDocument', 'License Document', 'A legal document giving official permission to do something with a Resource.'),
(8, NULL, 1, 'LinguisticSystem', 'Linguistic System', 'A system of signs, symbols, sounds, gestures, or rules used in communication.'),
(9, NULL, 1, 'Location', 'Location', 'A spatial region or named place.'),
(10, NULL, 1, 'LocationPeriodOrJurisdiction', 'Location, Period, or Jurisdiction', 'A location, period of time, or jurisdiction.'),
(11, NULL, 1, 'MediaType', 'Media Type', 'A file format or physical medium.'),
(12, NULL, 1, 'MediaTypeOrExtent', 'Media Type or Extent', 'A media type or extent.'),
(13, NULL, 1, 'MethodOfInstruction', 'Method of Instruction', 'A process that is used to engender knowledge, attitudes, and skills.'),
(14, NULL, 1, 'MethodOfAccrual', 'Method of Accrual', 'A method by which resources are added to a collection.'),
(15, NULL, 1, 'PeriodOfTime', 'Period of Time', 'An interval of time that is named or defined by its start and end dates.'),
(16, NULL, 1, 'PhysicalMedium', 'Physical Medium', 'A physical material or carrier.'),
(17, NULL, 1, 'PhysicalResource', 'Physical Resource', 'A material thing.'),
(18, NULL, 1, 'Policy', 'Policy', 'A plan or course of action by an authority, intended to influence and determine decisions, actions, and other matters.'),
(19, NULL, 1, 'ProvenanceStatement', 'Provenance Statement', 'A statement of any changes in ownership and custody of a resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(20, NULL, 1, 'RightsStatement', 'Rights Statement', 'A statement about the intellectual property rights (IPR) held in or over a Resource, a legal document giving official permission to do something with a resource, or a statement about access rights.'),
(21, NULL, 1, 'SizeOrDuration', 'Size or Duration', 'A dimension or extent, or a time taken to play or execute.'),
(22, NULL, 1, 'Standard', 'Standard', 'A basis for comparison; a reference point against which other things can be evaluated.'),
(23, NULL, 2, 'Collection', 'Collection', 'An aggregation of resources.'),
(24, NULL, 2, 'Dataset', 'Dataset', 'Data encoded in a defined structure.'),
(25, NULL, 2, 'Event', 'Event', 'A non-persistent, time-based occurrence.'),
(26, NULL, 2, 'Image', 'Image', 'A visual representation other than text.'),
(27, NULL, 2, 'InteractiveResource', 'Interactive Resource', 'A resource requiring interaction from the user to be understood, executed, or experienced.'),
(28, NULL, 2, 'Service', 'Service', 'A system that provides one or more functions.'),
(29, NULL, 2, 'Software', 'Software', 'A computer program in source or compiled form.'),
(30, NULL, 2, 'Sound', 'Sound', 'A resource primarily intended to be heard.'),
(31, NULL, 2, 'Text', 'Text', 'A resource consisting primarily of words for reading.'),
(32, NULL, 2, 'PhysicalObject', 'Physical Object', 'An inanimate, three-dimensional object or substance.'),
(33, NULL, 2, 'StillImage', 'Still Image', 'A static visual representation.'),
(34, NULL, 2, 'MovingImage', 'Moving Image', 'A series of visual representations imparting an impression of motion when shown in succession.'),
(35, NULL, 3, 'AcademicArticle', 'Academic Article', 'A scholarly academic article, typically published in a journal.'),
(36, NULL, 3, 'Article', 'Article', 'A written composition in prose, usually nonfiction, on a specific topic, forming an independent part of a book or other publication, as a newspaper or magazine.'),
(37, NULL, 3, 'AudioDocument', 'audio document', 'An audio document; aka record.'),
(38, NULL, 3, 'AudioVisualDocument', 'audio-visual document', 'An audio-visual document; film, video, and so forth.'),
(39, NULL, 3, 'Bill', 'Bill', 'Draft legislation presented for discussion to a legal body.'),
(40, NULL, 3, 'Book', 'Book', 'A written or printed work of fiction or nonfiction, usually on sheets of paper fastened or bound together within covers.'),
(41, NULL, 3, 'BookSection', 'Book Section', 'A section of a book.'),
(42, NULL, 3, 'Brief', 'Brief', 'A written argument submitted to a court.'),
(43, NULL, 3, 'Chapter', 'Chapter', 'A chapter of a book.'),
(44, NULL, 3, 'Code', 'Code', 'A collection of statutes.'),
(45, NULL, 3, 'CollectedDocument', 'Collected Document', 'A document that simultaneously contains other documents.'),
(46, NULL, 3, 'Collection', 'Collection', 'A collection of Documents or Collections'),
(47, NULL, 3, 'Conference', 'Conference', 'A meeting for consultation or discussion.'),
(48, NULL, 3, 'CourtReporter', 'Court Reporter', 'A collection of legal cases.'),
(49, NULL, 3, 'Document', 'Document', 'A document (noun) is a bounded physical representation of body of information designed with the capacity (and usually intent) to communicate. A document may manifest symbolic, diagrammatic or sensory-representational information.'),
(50, NULL, 3, 'DocumentPart', 'document part', 'a distinct part of a larger document or collected document.'),
(51, NULL, 3, 'DocumentStatus', 'Document Status', 'The status of the publication of a document.'),
(52, NULL, 3, 'EditedBook', 'Edited Book', 'An edited book.'),
(53, NULL, 3, 'Email', 'EMail', 'A written communication addressed to a person or organization and transmitted electronically.'),
(54, NULL, 3, 'Event', 'Event', NULL),
(55, NULL, 3, 'Excerpt', 'Excerpt', 'A passage selected from a larger work.'),
(56, NULL, 3, 'Film', 'Film', 'aka movie.'),
(57, NULL, 3, 'Hearing', 'Hearing', 'An instance or a session in which testimony and arguments are presented, esp. before an official, as a judge in a lawsuit.'),
(58, NULL, 3, 'Image', 'Image', 'A document that presents visual or diagrammatic information.'),
(59, NULL, 3, 'Interview', 'Interview', 'A formalized discussion between two or more people.'),
(60, NULL, 3, 'Issue', 'Issue', 'something that is printed or published and distributed, esp. a given number of a periodical'),
(61, NULL, 3, 'Journal', 'Journal', 'A periodical of scholarly journal Articles.'),
(62, NULL, 3, 'LegalCaseDocument', 'Legal Case Document', 'A document accompanying a legal case.'),
(63, NULL, 3, 'LegalDecision', 'Decision', 'A document containing an authoritative determination (as a decree or judgment) made after consideration of facts or law.'),
(64, NULL, 3, 'LegalDocument', 'Legal Document', 'A legal document; for example, a court decision, a brief, and so forth.'),
(65, NULL, 3, 'Legislation', 'Legislation', 'A legal document proposing or enacting a law or a group of laws.'),
(66, NULL, 3, 'Letter', 'Letter', 'A written or printed communication addressed to a person or organization and usually transmitted by mail.'),
(67, NULL, 3, 'Magazine', 'Magazine', 'A periodical of magazine Articles. A magazine is a publication that is issued periodically, usually bound in a paper cover, and typically contains essays, stories, poems, etc., by many writers, and often photographs and drawings, frequently specializing in a particular subject or area, as hobbies, news, or sports.'),
(68, NULL, 3, 'Manual', 'Manual', 'A small reference book, especially one giving instructions.'),
(69, NULL, 3, 'Manuscript', 'Manuscript', 'An unpublished Document, which may also be submitted to a publisher for publication.'),
(70, NULL, 3, 'Map', 'Map', 'A graphical depiction of geographic features.'),
(71, NULL, 3, 'MultiVolumeBook', 'Multivolume Book', 'A loose, thematic, collection of Documents, often Books.'),
(72, NULL, 3, 'Newspaper', 'Newspaper', 'A periodical of documents, usually issued daily or weekly, containing current news, editorials, feature articles, and usually advertising.'),
(73, NULL, 3, 'Note', 'Note', 'Notes or annotations about a resource.'),
(74, NULL, 3, 'Patent', 'Patent', 'A document describing the exclusive right granted by a government to an inventor to manufacture, use, or sell an invention for a certain number of years.'),
(75, NULL, 3, 'Performance', 'Performance', 'A public performance.'),
(76, NULL, 3, 'Periodical', 'Periodical', 'A group of related documents issued at regular intervals.'),
(77, NULL, 3, 'PersonalCommunication', 'Personal Communication', 'A communication between an agent and one or more specific recipients.'),
(78, NULL, 3, 'PersonalCommunicationDocument', 'Personal Communication Document', 'A personal communication manifested in some document.'),
(79, NULL, 3, 'Proceedings', 'Proceedings', 'A compilation of documents published from an event, such as a conference.'),
(80, NULL, 3, 'Quote', 'Quote', 'An excerpted collection of words.'),
(81, NULL, 3, 'ReferenceSource', 'Reference Source', 'A document that presents authoritative reference information, such as a dictionary or encylopedia .'),
(82, NULL, 3, 'Report', 'Report', 'A document describing an account or statement describing in detail an event, situation, or the like, usually as the result of observation, inquiry, etc..'),
(83, NULL, 3, 'Series', 'Series', 'A loose, thematic, collection of Documents, often Books.'),
(84, NULL, 3, 'Slide', 'Slide', 'A slide in a slideshow'),
(85, NULL, 3, 'Slideshow', 'Slideshow', 'A presentation of a series of slides, usually presented in front of an audience with written text and images.'),
(86, NULL, 3, 'Standard', 'Standard', 'A document describing a standard'),
(87, NULL, 3, 'Statute', 'Statute', 'A bill enacted into law.'),
(88, NULL, 3, 'Thesis', 'Thesis', 'A document created to summarize research findings associated with the completion of an academic degree.'),
(89, NULL, 3, 'ThesisDegree', 'Thesis degree', 'The academic degree of a Thesis'),
(90, NULL, 3, 'Webpage', 'Webpage', 'A web page is an online document available (at least initially) on the world wide web. A web page is written first and foremost to appear on the web, as distinct from other online resources such as books, manuscripts or audio documents which use the web primarily as a distribution mechanism alongside other more traditional methods such as print.'),
(91, NULL, 3, 'Website', 'Website', 'A group of Webpages accessible on the Web.'),
(92, NULL, 3, 'Workshop', 'Workshop', 'A seminar, discussion group, or the like, that emphasizes zxchange of ideas and the demonstration and application of techniques, skills, etc.'),
(93, NULL, 4, 'LabelProperty', 'Label Property', 'A foaf:LabelProperty is any RDF property with texual values that serve as labels.'),
(94, NULL, 4, 'Person', 'Person', 'A person.'),
(95, NULL, 4, 'Document', 'Document', 'A document.'),
(96, NULL, 4, 'Organization', 'Organization', 'An organization.'),
(97, NULL, 4, 'Group', 'Group', 'A class of Agents.'),
(98, NULL, 4, 'Agent', 'Agent', 'An agent (eg. person, group, software or physical artifact).'),
(99, NULL, 4, 'Project', 'Project', 'A project (a collective endeavour of some kind).'),
(100, NULL, 4, 'Image', 'Image', 'An image.'),
(101, NULL, 4, 'PersonalProfileDocument', 'PersonalProfileDocument', 'A personal profile RDF document.'),
(102, NULL, 4, 'OnlineAccount', 'Online Account', 'An online account.'),
(103, NULL, 4, 'OnlineGamingAccount', 'Online Gaming Account', 'An online gaming account.'),
(104, NULL, 4, 'OnlineEcommerceAccount', 'Online E-commerce Account', 'An online e-commerce account.'),
(105, NULL, 4, 'OnlineChatAccount', 'Online Chat Account', 'An online chat account.');

-- --------------------------------------------------------

--
-- Structure de la table `resource_template`
--

DROP TABLE IF EXISTS `resource_template`;
CREATE TABLE IF NOT EXISTS `resource_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `title_property_id` int(11) DEFAULT NULL,
  `description_property_id` int(11) DEFAULT NULL,
  `label` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_39ECD52EEA750E8` (`label`),
  KEY `IDX_39ECD52E7E3C61F9` (`owner_id`),
  KEY `IDX_39ECD52E448CC1BD` (`resource_class_id`),
  KEY `IDX_39ECD52E724734A3` (`title_property_id`),
  KEY `IDX_39ECD52EB84E0D1D` (`description_property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template`
--

INSERT INTO `resource_template` (`id`, `owner_id`, `resource_class_id`, `title_property_id`, `description_property_id`, `label`) VALUES
(1, NULL, NULL, NULL, NULL, 'Base Resource'),
(2, 1, NULL, NULL, NULL, 'Athlétes ');

-- --------------------------------------------------------

--
-- Structure de la table `resource_template_property`
--

DROP TABLE IF EXISTS `resource_template_property`;
CREATE TABLE IF NOT EXISTS `resource_template_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_template_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `alternate_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_comment` longtext COLLATE utf8mb4_unicode_ci,
  `position` int(11) DEFAULT NULL,
  `data_type` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `is_required` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `default_lang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4689E2F116131EA549213EC` (`resource_template_id`,`property_id`),
  KEY `IDX_4689E2F116131EA` (`resource_template_id`),
  KEY `IDX_4689E2F1549213EC` (`property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template_property`
--

INSERT INTO `resource_template_property` (`id`, `resource_template_id`, `property_id`, `alternate_label`, `alternate_comment`, `position`, `data_type`, `is_required`, `is_private`, `default_lang`) VALUES
(1, 1, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(2, 1, 15, NULL, NULL, 2, NULL, 0, 0, NULL),
(3, 1, 8, NULL, NULL, 3, NULL, 0, 0, NULL),
(4, 1, 2, NULL, NULL, 4, NULL, 0, 0, NULL),
(5, 1, 7, NULL, NULL, 5, NULL, 0, 0, NULL),
(6, 1, 4, NULL, NULL, 6, NULL, 0, 0, NULL),
(7, 1, 9, NULL, NULL, 7, NULL, 0, 0, NULL),
(8, 1, 12, NULL, NULL, 8, NULL, 0, 0, NULL),
(9, 1, 40, 'Place', NULL, 9, NULL, 0, 0, NULL),
(10, 1, 5, NULL, NULL, 10, NULL, 0, 0, NULL),
(11, 1, 17, NULL, NULL, 11, NULL, 0, 0, NULL),
(12, 1, 6, NULL, NULL, 12, NULL, 0, 0, NULL),
(13, 1, 25, NULL, NULL, 13, NULL, 0, 0, NULL),
(14, 1, 10, NULL, NULL, 14, NULL, 0, 0, NULL),
(15, 1, 13, NULL, NULL, 15, NULL, 0, 0, NULL),
(16, 1, 29, NULL, NULL, 16, NULL, 0, 0, NULL),
(17, 1, 30, NULL, NULL, 17, NULL, 0, 0, NULL),
(18, 1, 50, NULL, NULL, 18, NULL, 0, 0, NULL),
(19, 1, 3, NULL, NULL, 19, NULL, 0, 0, NULL),
(20, 1, 41, NULL, NULL, 20, NULL, 0, 0, NULL),
(21, 2, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(22, 2, 4, NULL, NULL, 2, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longblob NOT NULL,
  `modified` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('0g6bk45nsurk061a3j3bp7m75h', 0x5f5f4c616d696e61737c613a383a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313639383533353333362e3630333631343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22736665716b6167363631656a316d6f326169766d6f6e38376231223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639383533313531383b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639383533383838373b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313639383533383933363b7d733a35393a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639383533333836393b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639383533383932393b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639383533383836383b7d7d72656469726563745f75726c7c733a34323a22687474703a2f2f6c6f63616c686f73742f6f6d6b5f746879705f32342f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223265656564616537313436336430383838363134653036613232343066643533223b733a33323a226137396333343638633138323237616462386332626161313330316138656232223b733a33323a223062653365373861373465336131623331623336343363323933636536663239223b733a33323a226566356662613432653131333632316632633637313930653135666432303061223b733a33323a223339323136643236656531613161323035613261313362356230313637616166223b733a33323a223065643963356133333961633635643862306162386565393939613638346536223b7d733a343a2268617368223b733a36353a2230656439633561333339616336356438623061623865653939396136383465362d3339323136643236656531613161323035613261313362356230313637616166223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a35313a7b733a33323a226538386438643365653064363166306231613634633935326366623439646536223b733a33323a223232343135326238633239333765393662343733633435303861323739383937223b733a33323a223438323361643538356135666235323135656232643065653836373036383461223b733a33323a226431373639316236353266333862393736386162643737346464396431636230223b733a33323a223166356231386161373065336363663036623732396635623861353239376436223b733a33323a226136316464316131316536613662326538316135353536623464616264366133223b733a33323a223164333434383835653531306466366565643466396164373663363539663232223b733a33323a223833373363393464316530326262633734336438636633643162306261653332223b733a33323a226435616636376437393637303866666337656464323865613463626663633435223b733a33323a223663373662653333333136303563396238613535343434623538303231616536223b733a33323a226639356536663166373839393766353036356439373430336134646461373432223b733a33323a226566613236636261393938313365396233333966626139333266613038336564223b733a33323a223336356166346433343539646338633165383463616265663736623864303261223b733a33323a223262393761316462303839633363323464303566353831316339343836333235223b733a33323a226530623134656130646331636562383236653833313366303230373337653435223b733a33323a226430343063346434656165633461656636356132373833306464323239393334223b733a33323a223038373536633138656438333838313838343630343132633462653661343566223b733a33323a223639613062323463663662613335323032356331336237663837326532663465223b733a33323a223763393933323936373132656663353732376662313830346334313133633135223b733a33323a223961633031396366346665636339366436613563663132626133326434663433223b733a33323a223539616530303431306166393736363365346233353064343237653837313934223b733a33323a226464333337333137363238313166326264333366633236666232633764646237223b733a33323a226530613333656639386263323732343465613065303733323361303538323437223b733a33323a223535633138373438356562653964363839353332393834323765303235353638223b733a33323a223732366165633862623739663939393861356436663137336130386565353565223b733a33323a226135643435623739643066353233613662616436363038396239643034393565223b733a33323a223161313465633739313734626162653534346139386363396166353566346439223b733a33323a223932646137613338323236616530653233326332303136346164326331316438223b733a33323a226433373839626330303730306164303338653837386234613863613066303363223b733a33323a223164306335616431386530393835396438653838626332386465366539646466223b733a33323a223864333066636232346263373762656335313332616365303761643664613731223b733a33323a226633313338333438623662366566343937333336386161656632633539393261223b733a33323a223362663635326336643330376238333162616331623665613032393362623533223b733a33323a226231383536313837636338353138306235376632653834633535316332316536223b733a33323a223139333931616163303937633939383364383234646134663536373939366230223b733a33323a223264363932393633393764643035346662353766386363383330323639323136223b733a33323a226134383863353466306364316435636364373835343735633635633732646663223b733a33323a223535666232393763623834373762366462623864653034346637633135643538223b733a33323a226230393633326131313033326238303937366234643461366137653137633437223b733a33323a223866383135353034343333623434303835326134303338346233353563313766223b733a33323a226366346534376638363764326530376264633837316530383236396664616663223b733a33323a226466343735333366646235353135646361346238366237633839656639356536223b733a33323a223930306635373039383137306162336431323032646632326230663832366564223b733a33323a223039323664323236356664663365393061313261393031663732336364626535223b733a33323a223165336431386362656665383337653466643831353933663638653465336562223b733a33323a223837323939613636656335366639313432613837343634323331613161376535223b733a33323a226439616561383863613337663133316531363138306330623663653531366536223b733a33323a223865353863373535353965383432653239353531616464306234663739633763223b733a33323a226638333533613232393532333761653339663461313063663538343039663837223b733a33323a223731633530373961646435353666633834646632353536376538323065306661223b733a33323a226232376664353437356531623431633936313761346436343039303762656232223b733a33323a226465356630353363323262663931376137613531616530623233653737656331223b733a33323a226432373462363133646235613335623536613636313666376437643962653263223b733a33323a226134653432353165633063396333303934353766346164663538653065616261223b733a33323a223438653835656537336564326530336437313961346238616261336439663864223b733a33323a223534393139633030363761383463333134393331643861653263653962306662223b733a33323a226564633232636137643034393437316563623338396336343862373962303937223b733a33323a223639303631623962653933666665363462386362303031363136313062623531223b733a33323a223930363361656335326337303832353537373462306235386661636364313136223b733a33323a226462336266353534626166303635623634356563356462316438313938316432223b733a33323a226530613234313761656430313238626131313531366430353036343933636664223b733a33323a226138353138373839633839326531333665663965653936616363346535336333223b733a33323a223936303233326234343165373035383532313263346534373934633432323862223b733a33323a226435616230323432393663323764636237656637303537363963383938666266223b733a33323a223533333632323436353631323732623439343332363430653735396233653332223b733a33323a223330633936653836313562306432643263623562626664633438656137346231223b733a33323a226262333939333037386130613962313563623833646634666162353265636638223b733a33323a223762633066306362373233643435376264376264626338623437643733393735223b733a33323a223338643331383032623364623836313131653636623134643237396534386333223b733a33323a223838363039303239663933363539333132643433363361623361393064613335223b733a33323a226164653332366462656336396337626233613431653735343835373534636664223b733a33323a223137336165353436316538366637343565373661383764326134646236343134223b733a33323a223330646332656265396161643861383132656237383964393939346436333130223b733a33323a223134313239353862346263666233643637333339306135653733313766306337223b733a33323a223862366330646636316164303132303164653832633935653461613436396661223b733a33323a223965616638643935356632376632316363316135626565313038333534613337223b733a33323a223964383463653835623730326130373332336338303931363934373533633734223b733a33323a223338326461363736646233613933343438333035663137353966396632336661223b733a33323a226330396264653838626261386430616536666339373664633235356265386337223b733a33323a223337316266313930313036353262303832323132303931393732616462313362223b733a33323a226230333037356430633132363565643633323031633161396433626436643630223b733a33323a226265393666643461396662353739663766313234623334343662656463373164223b733a33323a223138383265653932663439353032646564666337666637393561316166633237223b733a33323a223038633064313632663239316131326538333230636534613634356364396336223b733a33323a223330633731653765303435396431396437636161376138383538346335623832223b733a33323a226136356239326464393833313362633038316330353138306234626661343938223b733a33323a223231363864316665626530666562373035363466363761346334646232613836223b733a33323a223331636536666433303537323838363063666339323431393335643637646538223b733a33323a226430616538653362633333373432366230303734613031363830383530643466223b733a33323a223965393637396230653538396634663561336435666330306333323261373938223b733a33323a223838373462616335653036623836393533663461366439396133653563313833223b733a33323a223338346431663431666434393461343836383765353263393839336232613233223b733a33323a223334396235306564323063376463346130643565323131383838656264636637223b733a33323a226266303036343535373265613665373264653738333430313730333562343939223b733a33323a223364316637346562303237666530343337626532383230336636393563386139223b733a33323a226335643162633635653732643866343631396234653464303937666332323264223b733a33323a223239323331313436303866616565396266303066633264373534346363326630223b733a33323a223765393666333765336264653864323639663737643631326464663138393333223b733a33323a223136373636633666343639393337623661396663373362643330666531663636223b733a33323a223734366366653636336630323061303834666662396634346233643835383339223b733a33323a226131303366323439613265353465376630336438623730303535626564316666223b733a33323a226432326233356635373030323233663431393361323038386637343034303036223b7d733a343a2268617368223b733a36353a2264323262333566353730303232336634313933613230383866373430343030362d6131303366323439613265353465376630336438623730303535626564316666223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31353a7b733a33323a223332653963636230666466333734643166653936653166316136346237393438223b733a33323a226661393465343834353032653732653732343762343461326237393535383935223b733a33323a223063306232326164383337356264636336313161626634346337616263333064223b733a33323a226230636266323131333638373439393237376336656238386237666136623032223b733a33323a226564643538616238616138323132323532626639623739383435386363643232223b733a33323a223638626662333235323432316262663161346632333433616161393765626535223b733a33323a223535653336353035663639633739333238643438333066303364613064316662223b733a33323a223139313438616566663632363064663364336634313263316630333236336434223b733a33323a223032393363333364646630623235396363316337643432356162386363633633223b733a33323a223232333966653339666433633832613636653465643235346630303738653563223b733a33323a226135303531386661313436643337666535653933386338326666393331336431223b733a33323a226337373132313366663234343033633338303834323861376433333631653633223b733a33323a223633323437663538613163366362633531393861653532303535313731653231223b733a33323a226631356266616165616161616266633736613835393835383032393366393736223b733a33323a226136633531613734333862323532333762663564323432396133396536623532223b733a33323a223231326364613162336233363132396664303333373636356234353266373833223b733a33323a223039306235393962363035343862663964643466313630306232656265313161223b733a33323a226135343036633435313162383539323264343031313938336266646432386137223b733a33323a223732663730383162326166363439383635336530616562383538663334643439223b733a33323a223535316263383239316463333966393236303065643864313834366463646536223b733a33323a223732656465613133653763656164613265393462646630346135376239623536223b733a33323a223535633536366139303162306232666234363064303331343661636336313866223b733a33323a226131613138343530336361346234306233656531646563353964643933383663223b733a33323a226238633037393661333733663862336164646138366430393838326365623231223b733a33323a226162613539663239626535353062346138633464306532666136396462353930223b733a33323a223362313066313063613633653930656464353532363933396134643630346230223b733a33323a223265353639356137353032363331393833626633646633663137646133643831223b733a33323a226435393866363634636463666565303430663037623662663235326565366239223b733a33323a223566336338633137353831663865653239363731333536613934613531613932223b733a33323a223134656365633237356165333239333038303363356439633137633530633363223b7d733a343a2268617368223b733a36353a2231346563656332373561653332393330383033633564396331376335306333632d3566336338633137353831663865653239363731333536613934613531613932223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223537363031343765363464653863666237653633623538663761616230393239223b733a33323a226530623532356234306137323263373363643064666436393231643763363665223b733a33323a223661666133656630303761313563393361376634663466373138313530333237223b733a33323a223036393061316261386466316336643633333565633936393434363239306133223b733a33323a223966626437663665656339363233626161353831373331666231306166613633223b733a33323a223231313830633532643861613462643039336636383632363966376135616364223b7d733a343a2268617368223b733a36353a2232313138306335326438616134626430393366363836323639663761356163642d3966626437663665656339363233626161353831373331666231306166613633223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a33333a7b733a33323a226266303937353138323832383165636563626138613962613830643632633834223b733a33323a226136663137326433306133336562393761653039393830393964363739636231223b733a33323a223033633133356165326332363661616634623531643436356137333031306239223b733a33323a223739636364333330303830666361353731626665393736343933633432316435223b733a33323a223364363864313561303163393934383231323032303262653661376666636266223b733a33323a223531383566313364633730396535383062373061366536626430666162633366223b733a33323a223537336332303231343462663332386463666231623164333761353530626233223b733a33323a223862376631346131393235616633346261666631626335316230633133383364223b733a33323a226633613036373131343463333533383036396538366462616466306464363230223b733a33323a223830393162663235666265613062356636636638393034393431623966393966223b733a33323a226434636637323730353861306233653333663465343431306538376135366632223b733a33323a223336363531353130343238633230393538396136636162323135383364366536223b733a33323a226134333163613836356534303664623564363862316339653537323562666630223b733a33323a223739336434653831663332396464363932646261373064333265633533316239223b733a33323a223264343463373731353635343837393263636437666365636333643136333934223b733a33323a226539326636313464666233653638643861303237366663343866613535663161223b733a33323a223464643964316533623366366663623239313865663163643639313934636339223b733a33323a223139323466383239376630663362393736663366333864656163373931383833223b733a33323a226336333466663666616139306463616137643837366330636233386131323666223b733a33323a226635316237663132393462323261626264663931356164626434393032366265223b733a33323a226134663137333437333664623061663836353465336165666261393639663761223b733a33323a223033373237353764643234396530393539303465333634343561643834656134223b733a33323a226131633238663737353562613136373563356636643230363766666163623834223b733a33323a226133633034313033393733353531306234616465326265326464653532646562223b733a33323a223961646361643337346339623635643731376139643433363134613730633662223b733a33323a223962653131643732653930306531313235376666383464653230616437396263223b733a33323a223137616632643032356565623333623333663831333164646434303539666335223b733a33323a226239646539353662666264373933353831333464633264663966643631653363223b733a33323a226161633934663533336331636466613439316439373263636131333136333763223b733a33323a226235363865366165633934663934376334616462363433323032336665393038223b733a33323a226434333562356461363364396666366133376666386235633361383530316138223b733a33323a223161376539373437643561616631313137616531653238646430343963316536223b733a33323a223131386662363030616432306263386132653739383065656162656631356163223b733a33323a223162626238306534386432323834333232663762323536626132663031623563223b733a33323a223031643235356337396437613662323036643162646331646263663636373263223b733a33323a226239633030326633653666376632386130643832303733383566303639323931223b733a33323a226538646265373566646236656432366631623863663161363536313031316636223b733a33323a226338633636663433646538366262623962653632306436313564353065626535223b733a33323a223438323935633135383465373436336364396431626162626564333834356165223b733a33323a223334323933383235656366373039626263623766313931396232373036363661223b733a33323a226637663865353437666431613936666366643566363830623534653232313766223b733a33323a223663333539336432643065373130336237336639663339363035646434616139223b733a33323a223266323066373466666632393337366237383461333532386662636565363531223b733a33323a223663633232356165346565363261663635623966633962346365383561373234223b733a33323a226265313337333561643636336637373539306237313239616233663763346136223b733a33323a226665616363363533303139393162313630323236313362343733383634393733223b733a33323a226263303235646438323338616633663033613861646231363362383938646530223b733a33323a223635356266333731656661376366383661636131666263306663383839346631223b733a33323a223832663163613135633031633036323535326634393233393430393233373062223b733a33323a223164376631336665353732663464333134323664343963643463366262393865223b733a33323a226234363735383462303365306635656430643939383166383637333066646133223b733a33323a223965663332373731633839333561353930643739323365626433636436613131223b733a33323a223936643464653833613433626535356132663630663737383661666533323365223b733a33323a223464353365393962383634313362343266373462376462393336613630383037223b733a33323a226636313830313365346462323237656534306433313936653063646437663161223b733a33323a223861396662643137636438643266633466336330376532376263366166336636223b733a33323a223332623133373862663964666334656332643330336362633832653733623361223b733a33323a226165326532653539393531343334383833376564376162346161643039396565223b733a33323a223233613439313331653835303537626235656236666536393434636237333866223b733a33323a223530343664626333356336396532336631376639306637303638393431383436223b733a33323a223166383238363766376564393864373032323363643331646562393830386236223b733a33323a226165393032343133373337393865376236333465616133396263336430393562223b733a33323a226437366364363636313439363336653365613731363761353730373663326130223b733a33323a223164613065343165383266326338393339333632616634616132303261656432223b733a33323a223162633432333865616237393233396238663236666162646162383863663938223b733a33323a223136346639303836626233646661323335323766636537666366656535376463223b7d733a343a2268617368223b733a36353a2231363466393038366262336466613233353237666365376663666565353764632d3162633432333865616237393233396238663236666162646162383863663938223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31323a7b733a33323a223939386531383938356431623533633933323561616135376434313333393331223b733a33323a223164326637626232376633663465323836383137353532373334336465653562223b733a33323a223438396335373037353364626332363565383039663833333662376539353432223b733a33323a226630623966373365383364643630653331623338313165636165633630393736223b733a33323a223530313561663330313038393733633730373663626161376164383964313938223b733a33323a223535653261313137313235333536646636313331616331323733343632383036223b733a33323a223938633839626534663063373666633066356231356338383332343835353733223b733a33323a223464376134353731643166346438363064633639343431396532636261656461223b733a33323a226334393638653862613637383264363130636365616666396132336532656233223b733a33323a223066626638633539383930663438656337663630663832343230343734373936223b733a33323a226132643764346662303936363334313233323864346531643533643064356438223b733a33323a223364316134393437643336353131326566343935663866363031336630633236223b733a33323a223764363466643565623165333839666430613161353436663337653237363936223b733a33323a223362306266336637303538383031646330323666633961313662363738366165223b733a33323a223236373764653831326335633964316230353332613530316332643639346431223b733a33323a226239393730663564623863386537303336373837336537663265623164343736223b733a33323a223161613131613439663432376261393337616364343061663331383035363833223b733a33323a226163326439373763373838656136643033346636376462356533653936313336223b733a33323a226233356165653166623430343465316162643031323264373334613665626461223b733a33323a226162373564663333653839373566623163656163643936373634633839383964223b733a33323a226430366639616237636663363338643532356134366131313933616164653035223b733a33323a223561613331353162386132616237653066656163333663646638366463313966223b733a33323a223636356165663634366566323761613138363836613030626362383139396362223b733a33323a223233656664303761643666393237616162353561333265633662613532333339223b7d733a343a2268617368223b733a36353a2232336566643037616436663932376161623535613332656336626135323333392d3636356165663634366566323761613138363836613030626362383139396362223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1698535337),
('6a9k9r9u239dpdj24leghqe1rg', 0x5f5f4c616d696e61737c613a393a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313639393034373631362e3830313239333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22303534336434376937736b6f68763132666f666b337438307137223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639393033323539323b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639393033333037333b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313639393035313230393b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639393035303134333b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639393034393339323b7d733a35303a224c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639393035303935363b7d733a33373a224c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639393035303938373b7d7d72656469726563745f75726c7c733a34323a22687474703a2f2f6c6f63616c686f73742f6f6d6b5f746879705f32342f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223339643530326430623036626334656635646666373633333838353661396464223b733a33323a226533316638653731373831613964636563313230666435333161363532313136223b733a33323a226564363964623631626631663062643336346539356162383762373332303238223b733a33323a223064393331306166363863396430396438383031363236336431613863626432223b733a33323a223862363832373839326538643762393964303730306330343737353264613939223b733a33323a226162623138346136396133633436616131303364323166643836356432303436223b7d733a343a2268617368223b733a36353a2261626231383461363961336334366161313033643231666438363564323034362d3862363832373839326538643762393964303730306330343737353264613939223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a393a7b733a33323a226139383661396430373533313234653835333731306135336266643061356164223b733a33323a223636343530656234666437643166353030313531396161663238393234623330223b733a33323a223839363334633732363666366432373532363061303565643031663362366437223b733a33323a223761663330346664396266313862653966376162396332366137653832343032223b733a33323a223437383331316230376163613738333831343331663562323861316631636532223b733a33323a226666306238636336326565373163353435366533303633363464663736643561223b733a33323a226461623937336263623166303065316134333666326130643162663763333637223b733a33323a226538613264616661383466626663383430343131613734393632616433613164223b733a33323a223234373034353238383836313632323039366439383438656539333631396564223b733a33323a226263623463376663316163366638353466366331616634393263303638636263223b733a33323a226463303333653062366165326238353164633766383965623865333539313536223b733a33323a226362373464653930626435636139356262383139653731623362343962663737223b733a33323a223162363135373563313435626335343261373431386162333133656431386235223b733a33323a223439633635633137643031373737313633613538383332366138373466613964223b733a33323a223033333061633539633263653266616635383032363966666530306136646464223b733a33323a223934623033313161373035633837343838333137666362376430383832643835223b733a33323a226663656362313037613366623337303564643833396134663239353837366331223b733a33323a226534633262346232383431306463373835643866353466616262363266666538223b7d733a343a2268617368223b733a36353a2265346332623462323834313064633738356438663534666162623632666665382d6663656362313037613366623337303564643833396134663239353837366331223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a223434356230336432656138363230383834346362656164633237313431346661223b733a33323a226163356434376534396633313530396663636334663131613365326435653965223b733a33323a223737313431323630363666643661653931343930323762313339343563376339223b733a33323a223961613936653065393562306663623536623463373536613262323265333763223b733a33323a226536663338376635336238366436323531303332323962306334383465316439223b733a33323a226437336463363165326463353739353763626630313564333032653038643563223b733a33323a223063366232633330326132653039333662663234313232663235373562636464223b733a33323a223963643365653263363437616435383934323033376137643237623566663439223b733a33323a223734666230663932343935326434356364363039393235353931643164623662223b733a33323a223734613566666633616663303638303036653234666466306235353934316362223b733a33323a223935313832656633366138383633353431336137633464353737393837653034223b733a33323a223065313530626434316138663266623039333564303739663731393363326166223b7d733a343a2268617368223b733a36353a2230653135306264343161386632666230393335643037396637313933633261662d3935313832656633366138383633353431336137633464353737393837653034223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31353a7b733a33323a223530626361363835643733363233383065373466663662363462656666363564223b733a33323a223035336436326137363732663133396433363937343535353861653335653463223b733a33323a226533363463646562306236333437616664613139386339653739393430653334223b733a33323a226566363562313532306532626337663662373333643361363030623132633061223b733a33323a223230393761306634643031353834616265376430363862326262393437323438223b733a33323a226465626132336362323866626437396264336262313339333839656338343936223b733a33323a226535333638363164393530336535363935393566653664313837313433363832223b733a33323a223161366539643562396463656164626632366239386237373238313063356235223b733a33323a223935663736646161643538383364386338626662656435396538343461626263223b733a33323a226630383336373432333166393632626332653637643637316166366530616132223b733a33323a226363316664626336323539346534363565313063613166633962613030626462223b733a33323a226266646138633933666564633034626130333435343631333464356662376233223b733a33323a226331626232353334313434343131313165616563636332343435383563323066223b733a33323a223632383166343165326364316137613366363061613865323239333138353162223b733a33323a226233353436383933363962626334646161373863623331326663623835356438223b733a33323a223137653031353135623165366633376239386432383361343733663039313830223b733a33323a223831653766386464326135313639626238623661326130396638643838373536223b733a33323a223637333438633931613236666638333764663761616437383735336538383239223b733a33323a223364663566323039323437333837353263616438363333326165373430386631223b733a33323a223562613035626236343233336161656331323762383232363838366533346631223b733a33323a223932666230336336663830326134393431363466343737666131316332313363223b733a33323a226161393130393930386132393534363866353734346361383739343132666130223b733a33323a223437383632623131326438333231396662303761376434356632356534353261223b733a33323a223630366238366364326337636130303332306337613162303835353763323034223b733a33323a223237383833613564623538663938633033373333653039656365323636656463223b733a33323a226633613237303666336262306638346239656465366265633832663164363637223b733a33323a223630636532333664366230356631313732363232333732383730653536333132223b733a33323a223231613861313566376336383762353461353066626136323831376165393032223b733a33323a223264643639363262613237323137353237333635653830393664323064333365223b733a33323a223663303866393464306634666339326162653162336165356136336633623733223b7d733a343a2268617368223b733a36353a2236633038663934643066346663393261626531623361653561363366336237332d3264643639363262613237323137353237333635653830393664323064333365223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a223962366432326565363030313963323438643732376630303464336530393765223b733a33323a226430313330353462303765393135363666383131353334306531353739343363223b733a33323a223864373238336565623465623762303234363634666232663233386633623564223b733a33323a223435626339663266396435326663613732613533323533663964343966313361223b733a33323a223137356630383139373632396639363364353632386661336537356530363339223b733a33323a223563373162616666323531666531656265633130646566343937363161393162223b733a33323a223037376230333365366233623266356464663264383265633437363137326332223b733a33323a226137386262373063363861333964303037316338643461633064393038653365223b733a33323a226338356666373336396430316634616232333834626436643537643637663362223b733a33323a223133343763373364663963623735366165653865383262376439653665326239223b733a33323a226566636236356330653438666533363237666236343565316235306137383265223b733a33323a223039396631396437643065393630306666633565383062646632353938613331223b7d733a343a2268617368223b733a36353a2230393966313964376430653936303066666335653830626466323539386133312d6566636236356330653438666533363237666236343565316235306137383265223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a223764633234623739636361633333636361396436366266393561313862346138223b733a33323a223337343664326630656334303562316335656236373964333065333366646564223b733a33323a226539373236646639313539623663643230396331613437396636393866326536223b733a33323a226166636230336230663233336636623930333837386632613361343962313062223b733a33323a223638313735376264363765643633336339616135336563663539613232363263223b733a33323a223465393531366562346634306566646266646237393062363333623637393838223b733a33323a223034323565623365363235383636343738623066336365303364356362343134223b733a33323a226431393838383238333834633966363234346466623836633461373338663631223b733a33323a226530663839333062663830633338383365663362316539626335366161393561223b733a33323a226531323161393664646565626463376561616161666431623965363566663436223b733a33323a226566303930393564323835656261373834303930623938333131613861643836223b733a33323a226362666262623066316437393164303666616265353063346336343662316139223b7d733a343a2268617368223b733a36353a2263626662626230663164373931643036666162653530633463363436623161392d6566303930393564323835656261373834303930623938333131613861643836223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a393a7b733a33323a223934623632386630616238626337636436316466306238353939313330346533223b733a33323a226464623835326164373638303461616136393761386334333135366433386263223b733a33323a223138636664333433333461313663366532333330393962613037626364366337223b733a33323a223666633735303332616237383630613738626531633533643539663238333333223b733a33323a223363313066303666623332303437333066623236633666656130333862383566223b733a33323a223063363738343330363337646234623665663033333562623635343766343066223b733a33323a223737663663653263323335643838336462643763376334303063303137316133223b733a33323a223563326132306462646438393637613966336438343463636531313431343430223b733a33323a226263313466613336323265326263393534653766343665396564356533306163223b733a33323a223034613232353838313835346166613233666131656432363763313062313734223b733a33323a226264303166663064636134616531373839613163343433353339323364653930223b733a33323a223538633534613232393632363638666235383466656465323335623965616534223b733a33323a223235653162356334366364623764303866326534636634626462303738396263223b733a33323a223866393863383839616663663738623161653730313031316262353136613561223b733a33323a223135663733303566643331363336396532626632663436333466623131653831223b733a33323a226666643534393138663835613432346635383537613663656337636631323563223b733a33323a223835323836623936663430373234643666376337383765623366333933323661223b733a33323a223133633064343163646663323737333738303761303933616666653635313433223b7d733a343a2268617368223b733a36353a2231336330643431636466633237373337383037613039336166666536353134332d3835323836623936663430373234643666376337383765623366333933323661223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1699047616);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('op8ps7slb70v04bg2hblhem42k', 0x5f5f4c616d696e61737c613a31303a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313639393133343635312e3633383035313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223061726c697134353333397069656136766f746a6f3269706d75223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639393131333931343b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639393133383235323b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313639393133383235313b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639393131343631323b7d733a35303a224c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639393131373937333b7d733a33373a224c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639393131373939373b7d733a34353a224c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639393131373939303b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639393133363934343b7d7d72656469726563745f75726c7c733a34323a22687474703a2f2f6c6f63616c686f73742f6f6d6b5f746879705f32342f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226135613966336131336334376236333864356565343134316230333362386131223b733a33323a226264383835616134653732376533666639313262393134346533336362313732223b7d733a343a2268617368223b733a36353a2262643838356161346537323765336666393132623931343465333363623137322d6135613966336131336334376236333864356565343134316230333362386131223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31363a7b733a33323a223330383664333837373930633561626539353230383862363464386666383962223b733a33323a223162663934373636303165383062653961323338636336653138376364353235223b733a33323a223037393930626131623864323862333966626437356634346436333739303330223b733a33323a223432623039376237656630333532613762376136306261363238613736653034223b733a33323a223465313632333136353736363136323363306332366439396334326166363530223b733a33323a223836646532656333396536633139313134326235613733376138656261636335223b733a33323a223034346366643566323461326363326637636430376130313139646266366336223b733a33323a226661336637386466326134633232663766653639663434396531383365643161223b733a33323a223237663939626162393436373837386566643335623538653063373631303235223b733a33323a226265616333393966623433636565343661373039316633303635376661353566223b733a33323a223635383238626266313637363334373433383061643763343266376633333030223b733a33323a223635316437643830336462353231303963303561373433656232303666633835223b733a33323a223636646239353130613463656137326563353735613334383538346635643561223b733a33323a223562653561663130623563656661626362623962333236343734313634663939223b733a33323a223132356134303463353235633635373664636361323736303266633163636635223b733a33323a223066333862626333353262386564623039626136383237613261663135303738223b733a33323a223334653738633731643636376539343161336161373932373535633230313538223b733a33323a223231333666333831356335356333613234653366376134336432626165313232223b733a33323a226331353139656438333964613036646463383861663065333864643436666165223b733a33323a223736396131313239316463363866326165646266303536623139616366653962223b733a33323a226130316534643239323466356464353336616161626335633835663766623761223b733a33323a226536383531353737663931666237316564636135353261626162623735663061223b733a33323a223733396561373031376161333439656665623730306364353663383862653631223b733a33323a223731346133346366623263616534613731373331333831663865343661333133223b733a33323a223431343063306332333934633639373361613538396564386165366666353031223b733a33323a223836363737653466383230393232303335663939396637303664366630306564223b733a33323a226133663061643662643835333138396139633665346530623135613961336465223b733a33323a223330376230373935643931626366383638383431306639613263663762373430223b733a33323a223861613639343131666630383861353233363733386434326638303432363135223b733a33323a223765373436373166396535623966323239373135663838383734666139353462223b733a33323a223761663130643631366466363962623538626239623561383531326639613934223b733a33323a223039666338653063343430643336303665633132363031623364383763663166223b7d733a343a2268617368223b733a36353a2230396663386530633434306433363036656331323630316233643837636631662d3761663130643631366466363962623538626239623561383531326639613934223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a226139646631333863333632383365643839656465343461353339316635373335223b733a33323a223736343839633864346535333236653630626637383165663338613038653861223b733a33323a223130326333396533323166623537646130623934366666666235623565623333223b733a33323a223162363137613634363839343464613639356234303933646531313965383930223b733a33323a226433376364666566396635396631313639353031306438303866643666613837223b733a33323a226431383135356339633464636635353630316263396239346239613965333537223b733a33323a223763303064396635646466373939386630646365393232333036353838333066223b733a33323a223332666532336566303063316163616536633163326434353736663463653932223b7d733a343a2268617368223b733a36353a2233326665323365663030633161636165366331633264343537366634636539322d3763303064396635646466373939386630646365393232333036353838333066223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223465343533323762666638366536333130376366353066323932333566353235223b733a33323a223033343235383835613162373330383938613464366665646236656538616233223b733a33323a223965666162356363303536386139653136633666643838333032346164653262223b733a33323a223539373130386336396630373463383765633266373330643431363033633630223b7d733a343a2268617368223b733a36353a2235393731303863363966303734633837656332663733306434313630336336302d3965666162356363303536386139653136633666643838333032346164653262223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a223930663839366536356131393432613730633533363635663639336238343734223b733a33323a223862313638333939313165353831323462646533396164356234386133363534223b733a33323a226535356330306234346161383730343434623533663262373130343962656137223b733a33323a226133643064313930326336376164343133396130356564626334653361313739223b733a33323a223764396233396438356238336362653564363736343765303434616330313864223b733a33323a223333363633343664643235316361386132663261306661366462353164613533223b733a33323a223534373338663337653534303635346265633035626136313661646461333338223b733a33323a223463653331363033373533656363323933383533393436663536363537346466223b733a33323a226262616433616230303738623736366132306462656135626336373361663330223b733a33323a226232353236393138356135343364643036663730613238616630633231653962223b733a33323a223361336561396661633561316337613838366566656536343164313539313361223b733a33323a223866303339326164663865653262616238623835373032643761373631616136223b7d733a343a2268617368223b733a36353a2238663033393261646638656532626162386238353730326437613736316161362d3361336561396661633561316337613838366566656536343164313539313361223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a226461306461343438353039396532623662333736626230646535366139663430223b733a33323a223533373231363235623637373261343639383530323862336236333764326635223b733a33323a223765326265633434363139386636303939383839366164363964393039393439223b733a33323a226132353431333034303734373639333831383736356239303834616532386630223b733a33323a223365393765666438383262306161363066323266336636323430353861303930223b733a33323a226133303036396432346465666264633465376561653734333931303534306665223b733a33323a223464646237653061623262313138626633383337663565366561616364396562223b733a33323a223966383139333265373062326634383663393938393162323736326438643936223b733a33323a226534623437303834303935303633326164663432616137343433643538653732223b733a33323a223738626666623364346339343961646663613934633166666136336235663833223b733a33323a226330353431613732363666353238383237326433663966346330623362613932223b733a33323a223962383761333134393039316363343835336436613633653439366439343861223b7d733a343a2268617368223b733a36353a2239623837613331343930393163633438353364366136336534393664393438612d6330353431613732363666353238383237326433663966346330623362613932223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226563313135663233326431646630363736653639353431613432366164663837223b733a33323a223530643163333734613633646665626233666466353332646238353639303562223b7d733a343a2268617368223b733a36353a2235306431633337346136336466656262336664663533326462383536393035622d6563313135663233326431646630363736653639353431613432366164663837223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226534326364386463653230623831613930613231343465346263313736626138223b733a33323a223838666230643736666466646638336239646138653562623866646239613265223b7d733a343a2268617368223b733a36353a2238386662306437366664666466383362396461386535626238666462396132652d6534326364386463653230623831613930613231343465346263313736626138223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1699134652);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('qrgdtef3930rmh73dh9t91j4si', 0x5f5f4c616d696e61737c613a383a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313639393133323638342e3234343235353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22613171756a616b6d326e343068736f73716d726a686e36337568223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639393133333732353b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313639393133353235313b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639393133353331313b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639393133343534383b7d733a35303a224c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639393133353231303b7d733a33373a224c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639393133353232363b7d7d72656469726563745f75726c7c733a34323a22687474703a2f2f6c6f63616c686f73742f6f6d6b5f746879705f32342f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223630663264653133613034663663653332636434643835616563376632373366223b733a33323a226234323931363837646562333036613133633166653338383561613239306337223b733a33323a226363366664303439623135376235656635386161633835353638333130396332223b733a33323a223866636133343431633331393036656561626333656565333139306633323635223b733a33323a223435653734666263386263623764373332633038313130353930383061333438223b733a33323a226166643239326234626239313035353562633336653732356165653036316531223b7d733a343a2268617368223b733a36353a2261666432393262346262393130353535626333366537323561656530363165312d3435653734666263386263623764373332633038313130353930383061333438223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a35383a7b733a33323a223633316430306163623664653334373530643537313365613665623062396231223b733a33323a223762356561643131383662323035303263653637386264643364613535323765223b733a33323a226466333739396637653433376265323335613536336563616633313661346465223b733a33323a226536623935333236656161653566383131363366633530383064623537666637223b733a33323a223932346630623537316562323663333639333466336437646530316236643631223b733a33323a223830363936646238613666636636346338626431623438383935623134316162223b733a33323a223061653539383166363164353532653438353333656162383133323234613762223b733a33323a226639323933616561616361396661346262353632643062613163346439343232223b733a33323a223037626235326262323663643935383637383764616565303039383236346261223b733a33323a226530336437663137343231623264633436633261623339666338336334323861223b733a33323a223836376565653465623033373462653333313037626238353734666463333861223b733a33323a223538353634656364323939616234366363646438346531383465636264373563223b733a33323a226465333463663962366365616665303362343339656564313861643034396433223b733a33323a223832613633656535343430653733306338366663313563383535356666663165223b733a33323a223132636533303634366562386365373161643031386539386636663330306565223b733a33323a223762653639346461373263346339363461393766363936626634383633326430223b733a33323a226661643466616465323734666232353736376236636162396431383839643361223b733a33323a223964646638393136376538663566633761633238623461663762343137363930223b733a33323a223764323938663062633037306230663064393339363266613565663030643632223b733a33323a223339353030346332363831626138656336316432323732363564393266386131223b733a33323a223135343433643134393937303935613531666631646339626533626236646464223b733a33323a223031386662346162663136383035356265336433643832393138636233323964223b733a33323a223835613633376535643130366338363835363765666165316538666136666337223b733a33323a223866343131363730613532393762623961633466306237343932373939633364223b733a33323a223134333166663736326538633031323065633837353464366535393661633066223b733a33323a226635386535373731396539643038313434656336636239333031326337386539223b733a33323a223066643539393764646437316465656235323962613864396364376463376465223b733a33323a223763656666663736373566653365356261353366386432663863643832393436223b733a33323a223634323134326238653535653963623637376165313833383635333563303539223b733a33323a223433646236626531383961323634333930633536616362306233363133613533223b733a33323a223636313564363365353830323863393963643161383130363163313537313837223b733a33323a223031386638616161366265333131616136646638326364316564663632386366223b733a33323a226336313064393331633963646561313964333064633166646530353963623634223b733a33323a223230336266323130343139623466656535353564306138616534663530636364223b733a33323a223930366639383961373265653164393433326664373730353939643135663364223b733a33323a226631333033353962356537613264376436333933623665623437646538323361223b733a33323a223864303439316535383630363862386662666166383732356133316235366163223b733a33323a226635393361313331363837356532306161313964313431636465633865346537223b733a33323a223961663865396137653938333336623734656232336563656232393037343435223b733a33323a223839653139386439626537393133336161623735393166323334626139326437223b733a33323a226535623531343537333630373037316436623761343766656438666335303363223b733a33323a223534656138333031393930633737633435633665383532353832343666656131223b733a33323a223863666139333162393461376135336662313233386239303066663862633737223b733a33323a226139653230343963636634356265616564333733363733393664643465386638223b733a33323a223738303633356362623038303930343661383363656564653366643636633464223b733a33323a223039383266346131383363306166353062366136613565653461353738636361223b733a33323a223465663634383062643034326262333162313562326562393237653664333436223b733a33323a223364666264623061313566613734653533363634626634646330356132366533223b733a33323a223930383530613330656436396136646261353233323433303963313135663535223b733a33323a226666316435376639646566633439393366623432366365653031666265366136223b733a33323a223436303930326535646334373030356533353035326534623036366532623764223b733a33323a223235353330646662333265656439313466356463633738636636356236356630223b733a33323a226438623833326164323032333039336633313963383763393962633531656231223b733a33323a226530353365626662313038643163316464616136356239363538313763343730223b733a33323a223338643831396233366339366232383461323132663965373633386364326464223b733a33323a226237636162626336623162323238343137646165613561376561383563316634223b733a33323a226430303762333731633133353665323862626664616437356562313235323630223b733a33323a223737623433336366336235356238663262623136346464633333316137363963223b733a33323a223130636566313461613035613431323330666138376432373433616438653938223b733a33323a223764353635333261653663353361373830366433623861336631653238323865223b733a33323a223635346338386432393534643632643464613064373365303566643136386433223b733a33323a223336336631376664373262636364653063383066616236343032393333383135223b733a33323a226237313034643936633566386236616466393639346334626534393864663563223b733a33323a223236663932383737646439663939653035613532343334613134666430336130223b733a33323a223139633839356131356564636532383866386364356363373631383663306436223b733a33323a223362373262633062333064633639386261636163353362326339326633366233223b733a33323a223137663463666230366661323062333939303137653638353361633061643966223b733a33323a223566316533383661323661636330396236373666393962346534653530313062223b733a33323a223062336539346239626365326631663834356233383031306234336339363837223b733a33323a226433306564636237363938376437636431366332356539353133313365306363223b733a33323a223461343665353231336662323039643132376363616530666465653834623166223b733a33323a223330333061653430393231313736636637343366353265313431666330393366223b733a33323a226630663635633866383863346531663363363434633336383266626465333537223b733a33323a223761653231643761373964373938396165363766663235343735343061396131223b733a33323a223635633938336264326431643137653362303232353664346337666665323439223b733a33323a223834313230396130663835626134376230303862303033303531653063646161223b733a33323a223132373165383439386430643361326331336139363463333166656639396261223b733a33323a226331343365623537353932636237303234363235383334653832656539646434223b733a33323a223430343636633563393239653239363066643930663939366131666631383964223b733a33323a223236653538316133323130303433343138663930333637366166343134636436223b733a33323a223566353733633138373337346639373730653437373031613064303061326563223b733a33323a226130643537623164306261373935306465666265643430336561376538333430223b733a33323a226266643166366235316338313231616163343936383430356631643634316635223b733a33323a223434333830383935316537623436376466366337613230356534666162326262223b733a33323a223836373663343062633736613038376261363566613136333962663932303137223b733a33323a226139643539306662616164333331613465623737656365643966336232613462223b733a33323a223363343465663461363162653139316635376438666561336337633934316430223b733a33323a226530323733336235343564393838653030636333343731376434623930343431223b733a33323a223764373839393732313030663234633962383861326665363835323564383235223b733a33323a226261346132366261353334326431363332366139393165316133383866623133223b733a33323a223466376237316436386431396238613434313137666564636232346265636562223b733a33323a226333353436333263306638653439356462633535386661373730353538376131223b733a33323a226630343366326561363733363064646661316563323932363562356335346137223b733a33323a223034316664643930363764313538343933616133633464656435366530336162223b733a33323a223764313439343165303831653764373265383362306661666330383830303364223b733a33323a223634623930303030323536366662373937373362306331656539636166663437223b733a33323a226438653962343631333531636237656464306433616531656330376262636162223b733a33323a223933326231396262666266373138366335613539653437343861383066343733223b733a33323a223932313366636235313064643830646539613131623639383532656631653064223b733a33323a223135663936303037393361363037383162316135633566343436326661373035223b733a33323a223139376130333538613032373265613739653032623666393432303433373436223b733a33323a223537623337623038653764333636333366323363653535643438313664663834223b733a33323a223734303531623434306638303763396239303561306531636135373265333339223b733a33323a223136383661396232306633316637373535646564616238656236396239663732223b733a33323a223032623439643031616163656566343638303732333033646265346330363336223b733a33323a223065346363363738333661613933616131643131363831303430613966666234223b733a33323a223532373338313339643332616530363862613939303239313037333930303234223b733a33323a223361373831636461373461656237646436616135303131646134366236613763223b733a33323a223661643064323532306439656465313564363061376633383939343932613566223b733a33323a223866393665336365313033663563373330653439303066633833333262336239223b733a33323a223734303539353337363639376432306234356536613230326131346632356136223b733a33323a226362643730626436613935313632326661313865323562643632383332383538223b733a33323a223435653162373631613736346338383663653830303033616235373634386232223b733a33323a223565633961653331366135333961613530353562626565363135353439646239223b733a33323a223765363364646266336630383064343863326232343735623932313032383535223b733a33323a223839316634386332323261633763646665373535633835396236396664303233223b7d733a343a2268617368223b733a36353a2238393166343863323232616337636466653735356338353962363966643032332d3765363364646266336630383064343863326232343735623932313032383535223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a3136333a7b733a33323a223033303862666635643363396138616438313761303761323761316634653038223b733a33323a226134373564663739663166666330383035626264383031346434646432656438223b733a33323a226637643331616330623933313565346363643061343733643137396433343131223b733a33323a223038333030353438336632323163663930373661613237386138376263613364223b733a33323a223065316330363836316139643533393838346164313232393665326562346162223b733a33323a226665333130663466306630613436326139396465346566626537633839313639223b733a33323a226134383532353563316331346130636635623734323261383731376163393065223b733a33323a226330316535356634633232656630376333656239663432653263343633306462223b733a33323a226363366265653939303435373739613834303762393135636466383632396437223b733a33323a223137373563636563393366306438373031333939626265613535336430616339223b733a33323a223430303162616539323439643736623762353230636462663131306235663734223b733a33323a223365373931373631366162333937636331613834626138373038373230373666223b733a33323a223835393131393361363438666235613432653639373061356438363063353932223b733a33323a226133353939313138393431363338373532383263363438613633633463623636223b733a33323a223762333630616437336665313339666339636565366564633835356138323032223b733a33323a223833353765656139363432653062613030616663656163303665623031333530223b733a33323a226330643837376361333934333737643037663539376234666638343061326334223b733a33323a223336653737393738343134366638613534626466333963616435373334303561223b733a33323a223866373962653934346264616433333062376334633663613665623331343034223b733a33323a223439653166663336353638643033653233346264316466396263623734316431223b733a33323a223639616232303761326133306566346165616132306433383466323137633763223b733a33323a226462663338396365623764396236623163363631356332613661333431613165223b733a33323a226663316335343063633436303434383562333461373133303730386433343164223b733a33323a223065623832333364363162666137643139363764363233613664306433656635223b733a33323a226130366238623038303066363861343562626462333530303132376238333539223b733a33323a223533616439613030623934366231336338636362363333323764363161373439223b733a33323a223061383135393430383339353761653436316334636563396463616165633736223b733a33323a226166636363333663626135356634613438633161646130383031346563636238223b733a33323a226366343238646631393861633036373032623137313839613465343163393037223b733a33323a226236663530646164643936663731616465646464626661633664366366343466223b733a33323a223137373863623538626431353335663436353330626432656531363331386263223b733a33323a223763376631396431633937343539313864333031616138303838316532393730223b733a33323a223131623137623637303031653139323038306330386365383837643234653635223b733a33323a223664623234353335373064653731396533343538383664393239303934363133223b733a33323a223036393066386466616363653133336564346531336466353239306438656334223b733a33323a223739643037323532636639646565393130333532643762373934303135653130223b733a33323a223363616330626232643864353032626165616137636635386630356532366134223b733a33323a226364383535643137303936656137613934353564366665306333626334346634223b733a33323a226337613834623363613165616536353232343930663965616533616439636134223b733a33323a226336643230343438303261643535663139336138383661333532353437376263223b733a33323a223465663762366166353361616130666131336463393134333937316365323363223b733a33323a223061353935316666383338633235323639313232646238353661656161313938223b733a33323a226136393266343832633531383530306132343664363061666634316366356238223b733a33323a223538383863633265343230656235316666373661613963356265353262373762223b733a33323a223262323062316233633531633534303366323665623136633563386136333564223b733a33323a223564616464383065393736643937393237643530663964383232306163396430223b733a33323a223138616335356534316530313064643433306635623636353338623835346266223b733a33323a226136643731646339303938643638366435366464613630656532396633663432223b733a33323a226366386162643431373864343032663261626639376265666230353238396130223b733a33323a223633323431363438326261623036366165393561336166663433383630366537223b733a33323a226130343330363439356431643330643930353635363833623639326132366533223b733a33323a226439623937646535646464623835653931663163616236376634336136333263223b733a33323a223264376261656539616363366130323663613366363339666433626537366136223b733a33323a223232363163306336373961636639363734376338623465326439323437343438223b733a33323a223264323764353936346632303265333830383337326436393138366365333433223b733a33323a223864343830343333376437646162323864383966643535613536346337346364223b733a33323a223566323865363734356636363134643063653732333962316434316635333636223b733a33323a226439383536313730346238653062313538666532353836613733323737623432223b733a33323a226134633039666133363037313334393437663536646566363665373938653366223b733a33323a223636643638666166373761343665663266303562633236353164396166383632223b733a33323a223662616531326433613163663832666235353637326165306363653165623866223b733a33323a226231393661323932306235666632653139383766646364366130376563333635223b733a33323a223735386666386162613537656535636132303566373161373633356235646266223b733a33323a226239396166373236353966626565633737363638623462353661623363646266223b733a33323a226362616664666666616165353932346536343238646634386634643064663662223b733a33323a223638376131306433633630386565386466643634653238363064383935356530223b733a33323a226433636630323434643564356131396661663130396633303064356233326634223b733a33323a223631323462653862613262616262613031323963663462613235313235353632223b733a33323a223736613630633830363930313965643935336462306666656264363234386531223b733a33323a226330356436653036373437303436336265323661653535613761303735333765223b733a33323a223431313534343937326465643930653138383739316362653536663834306237223b733a33323a226237616364306437333235646264396566343965396162636433663366663565223b733a33323a223037623066383466383034623864336537663363366538333565356231366631223b733a33323a226631333331653035383236333563663237666164313061383539636663316635223b733a33323a223038613134373662616662656134643165663939666535366266343638643562223b733a33323a223761306637383864616232336662383037386235396334326437666634363130223b733a33323a226530646163633235336432356538636165303530376364636433373364343835223b733a33323a223765343238343765313538313838663164373933633436663665333139393932223b733a33323a223937643161653431393435636365333633333363343538323934353530373138223b733a33323a226366396332643062633134633663343037383530353339616162383630303435223b733a33323a223038373134663463396431356630663430373063343866393734633666633361223b733a33323a226237623531303632333934393939653432393033353661623261343230643532223b733a33323a223233303536356433373035393938666437306235356435343336616535666139223b733a33323a223438666430653830343938343731386435383737343264323863616332376665223b733a33323a226436343337623138376631663931633039326433653637326162303464663635223b733a33323a223430346566383264653662366531353430333835316238636336616566633530223b733a33323a223863396538346336303266376539363166353639666565666665343837333563223b733a33323a223538343637386134643164636536646439623262366536313361393461616332223b733a33323a223633323836653536396638636630626164333863366230656335383632333364223b733a33323a226532613062303232323338383836386163333261633436353263646565663735223b733a33323a223039653765303666666464303939353433333166306530353831303466343432223b733a33323a223763653361333731666330363361313334396235303338383135326238386464223b733a33323a226165616661336132623264383031613765646464336663313038666337343035223b733a33323a223065316561313564376664346661623831323437633332343366663536353435223b733a33323a223031613263363936393562393934386364356366386261626235383061623233223b733a33323a226337353963376264383163636264653631323134616666313438343761633062223b733a33323a223038393166376332396338376532636534363738383933656263373338376131223b733a33323a226533666236373430366636386566643930346562633131626566663839346666223b733a33323a223931343539626537373966313039626666633635376337363334633036323638223b733a33323a223938306339663139386435363965386262303861343665613935333733323330223b733a33323a223163646636376663656435396366373865306637666139316236303461303236223b733a33323a223962663431646236643166326139353262643633386465613361323130323035223b733a33323a223334343566613162303431393963373563373930633338326563343166633035223b733a33323a223061353461373531613064663936393536346533316136383265633932316635223b733a33323a226164363863656238613738306139326662646663623865326531353734313932223b733a33323a226162376436323438333566303432633033653534323033343730326634653761223b733a33323a223134393031316335666161636333663364313032356533393235383165616232223b733a33323a223762333364383433346135346536373431333333333739616664636665343761223b733a33323a223030313430323632663434636261623032643933663834373961323933643038223b733a33323a223764643931353234386531383839613231336136326661636438636261393566223b733a33323a226431633237393366633365393135346237656237303662626165666463646438223b733a33323a223865626434383333636131353534313533326361643231396565316464343631223b733a33323a226539323065333436353762663464656534646531303435333165666438393864223b733a33323a223937616531316439353030666631373533616661333665366231656262666439223b733a33323a223634626366393535613065393034613636323839633565326362303763303934223b733a33323a223239616135363431613430363633363964326638326665616239666162643766223b733a33323a223439623665646238353237623531363434323237646331646636306464383261223b733a33323a223937623830373039643938633564333165393039326366306463343938393263223b733a33323a223731303363366636623762316461316532383937616131623231646162323465223b733a33323a223936323138613339376132373037336132323632626532303664313138383533223b733a33323a226634366163306337363736353836663966353062333963313031613337356230223b733a33323a223037306234656565383062306435336564386638363462313065306432663333223b733a33323a223033363334613361303536363139323730626437376364333531326433653334223b733a33323a223965366161383837656333333439643163653036363062643764646139333065223b733a33323a223966356531316233303133366232393337383562303536306565626437633639223b733a33323a223163663035353838303136323836393232333861326531386237313833613638223b733a33323a226163613138356231396237333535303164396365316666303964623132626565223b733a33323a223431323866306665313366336266653633336132643633663235653265396339223b733a33323a223233396366323832386165613234623134643137653934343164616366333066223b733a33323a226464616135363265393564306663313132643636623138623561386363373737223b733a33323a226230623865666236363433626461313138306331306437333432303865303763223b733a33323a223961613233363638623533316137616563663533346463326564353032373431223b733a33323a226265633134363133663935383866343362373233393236363031386363316235223b733a33323a223133366438366664663263343663333538623030383463633834663932373632223b733a33323a223434343836623232653738326236623362323432646234323131303965393431223b733a33323a226431373766636432353937646138643238633665396233343761396536366361223b733a33323a223562633136666338303064643762306330353031366130326566623663363632223b733a33323a226630653936313638653163333539643032616238373335633764623336363538223b733a33323a226434633066326437623435303030623764343038303334666266393031376237223b733a33323a226163633561336665353964386365643930613731633932393964373061623863223b733a33323a226434653538393434623936303962636164616464646334303631316261386664223b733a33323a226434303135393732626539393365373365343832383335666663356266616239223b733a33323a223161616363303731323437666266393962656131653962653533386564383830223b733a33323a226430643362323035363636376161326461393466663333303136343164613237223b733a33323a223461313336613134613837653433383431666165343832383339303133366538223b733a33323a226137336461366634643464323532323934643865666535366464613630326437223b733a33323a226362616339616537333738336230306163353233306535326163643637653135223b733a33323a226233636637346633393963373465333539313937616633336564366565303432223b733a33323a226363313432333731626130613034316266346639336637303036626562316331223b733a33323a223061343235653033663062656466366566616666623639383734326661353964223b733a33323a223962396139613261393433663165306434633366393531373436396263666363223b733a33323a223266306232613863343239393464656564393966313961613264613564653562223b733a33323a226239623261376236373936366238643638383830376533663937303030636233223b733a33323a226535663166613336336634386432353362663234343634643033316161366666223b733a33323a223133663536336538383639353834376662616535323733613134616266346666223b733a33323a223863656263303538383764346639633733636538613364363666323332616639223b733a33323a223163633864623962623934333039613764623061313539343138396439633033223b733a33323a226163356238343265393033333563323564336163613332626137396337303466223b733a33323a226666643434653039333861306335386261626663636237633563303932666161223b733a33323a226235613864663030633437343131373634643162383730386437613063316637223b733a33323a223630376431356138303333333364306366343964343234323032663364613764223b733a33323a223666323665663061333839656462633335363563356664616333336533373261223b733a33323a226535633335366130333763626262353430666662343736333466363135663939223b733a33323a223239343261373839353534363639613234323637613031643232336165343265223b733a33323a223632363538376163313835653435373561383231383735396231306136623531223b733a33323a223536376466343934643338663165623331376235663732313930393633343334223b733a33323a223433613135656533346431376161656138316239613938626262343531383837223b733a33323a226138656135363733383236386363653761633861333865613732303839386462223b733a33323a223563373432633364363131313033626562353130316462373234633362343637223b733a33323a223030316665336633313636376263646336333262626466643736656161326233223b733a33323a223436653333343536393366393734633961653438306638386331346162363032223b733a33323a226132366331356231393436323436373864623036346138663632396334363761223b733a33323a223034663838373630333239313966306462636562623236366334303730636161223b733a33323a226135643839626531343230633535383432653036366362626165333663663261223b733a33323a223061323337623034343137316335623761653063346238366664653530653730223b733a33323a226530656431336461373130646634656331363939646363616233393164303366223b733a33323a226661663163666430643136363335646432363139383965393231346561313834223b733a33323a223035633265653462663332623931343932363865643133643539623434386266223b733a33323a223430663661353536653232393662346135366463643739653631373263353966223b733a33323a226130343335353033646533393766343432633765386533613831303234666166223b733a33323a223933616539343866393731656161633162326161316662363362613531633530223b733a33323a223330366230326338313961393964646131346437626132363938316332383066223b733a33323a223466343133393636663064363464353437366361316538666636636234346339223b733a33323a223334343063323330616666336365386535613132393831333763306339633763223b733a33323a223130343939303839353639663635393134346431663966353930623765633465223b733a33323a223466383637653330373061326234323966393236366333623631633866323161223b733a33323a226461616363373662306336393231356466316339356666306533386362356431223b733a33323a223661303039623438333230316362373836663862653832613830373033366631223b733a33323a223764663439623437633430663835393963326438636664663535363833326535223b733a33323a226665326662306265396432636634656133356263353861383831643961336535223b733a33323a223564396139333831356564376638363939633536313438386139363565303965223b733a33323a223639343834663032316236353563633364643630376532343431316262333134223b733a33323a223636333464306231666165613730643638623832643661653830393939626463223b733a33323a223162366239333437396236623733316533366361313463396264313066316563223b733a33323a223534646565333961396132626536663030366666366330393064333630343964223b733a33323a223362626136336666623362636665626237353839656461343638363033626365223b733a33323a223734616331366135316235343566326162616133633034653937616535373066223b733a33323a226137376637326136393563643635306466643633646434386361666636353837223b733a33323a223361336363373562663030316464623838373561363439663639643561326631223b733a33323a226463356230363834643134373039363165623735393834383638653261326334223b733a33323a226133356236613134306531313335353037313961613365613432646139663661223b733a33323a223663643233376332633365623363356563373330663263666436333933623231223b733a33323a223066333030393137646639313331306239323633363166636664643665346134223b733a33323a223233336636383536343833373135306564356665613537613031653863663463223b733a33323a223538353835306263643733336363663430656565363938356235386331613430223b733a33323a223562363963343639366635373038356438366136653937616431663938356133223b733a33323a223336623066613235353836303666356663323066373861653836373938333535223b733a33323a226466326133616663336662623165353234373838346337613937316531343861223b733a33323a226434313561353638616336366533346637353363393631303833396633353762223b733a33323a223331373966636164323434376264343766663831393762666463383537376166223b733a33323a226535663434313234316431366566653738643461366534396335626132653637223b733a33323a223232346139633265393831636463653338383237303934386166373966373238223b733a33323a223733393033663137363234386233316537336466396166623136326462656237223b733a33323a223435303162393031326665333565313561393137306535393462323762373463223b733a33323a223034646565376461313366333663323638643934303633366438646131356636223b733a33323a226435643734636630643564663934363435353464303333366533366564366635223b733a33323a226161353061663638303164306133373433323563666130613764653730303963223b733a33323a223565643831613836343830353062363731363261616465373566633537636632223b733a33323a226565653766386165323262643231363465363765323434353762333536346539223b733a33323a226138666265326461333139346531316632316530363466643336313232346632223b733a33323a226431663431376566656162653163313065613132336138343137326430366634223b733a33323a223835633036636535623165323433376236303965376131333739643237396663223b733a33323a223566316337323166313865376466306361666333363337653636353265343862223b733a33323a223030363037356531663732333763303836616436396130666332303565623561223b733a33323a223766333638653465663731316666613464663331616335623633663234326132223b733a33323a226530393731306339333035663437633864626432653163626366306237626163223b733a33323a223234626164613363336433383661613939633334656365353739373135646238223b733a33323a226561396565666431666436626361306462616631313631373133623466353164223b733a33323a223138366538303136613666326638653263663161333964323939626563646165223b733a33323a226561666533333763323163363330303632623964303731616265623765366262223b733a33323a223165303534363136653934303066653233333434663166333461653663393638223b733a33323a223265363235616637323331663136623334623264663965336531323531306466223b733a33323a226238323437616534316531363261646431656166393430356265336335623963223b733a33323a223563613435333664626235383733346666643131383637656661616536663138223b733a33323a223338386266326332653961353331323561616130326330333233383132346430223b733a33323a223664343563626562656536323534663431643930353430613563633665333265223b733a33323a223637653539373337616637633063363465366264333939666262303265303631223b733a33323a223934393965653865356437393439336436323637343263363763386366313930223b733a33323a226136643236663064303437656265343531343335653939343335303265636363223b733a33323a223534653763306234643766663864366364386433323634313162383437346663223b733a33323a226339316638643263383030396564663531333664623165616238336366643763223b733a33323a223330623362653431343931636430623137303166333231643064653732653137223b733a33323a223735376138316331393661323664633236353861343966663864636461646366223b733a33323a226365643865613764336436646564366139346333326131643863393535653966223b733a33323a223338636663393630376635646630623037623339303732326330313530393433223b733a33323a226339326531666136646365623831383238323264373438363735316631653862223b733a33323a226664643735373131313666373961373732376434343264613330343766386130223b733a33323a223936653961326133373134393735636435333166623164383436383935663035223b733a33323a223462393166326561373431636164643038313937663730386335656339313366223b733a33323a223432666666356434633036393463353335313830663735643438643837663230223b733a33323a223031343362653331343664353337626539303134313230306238633463633764223b733a33323a223964306437316635303831303965383263363461353461636138663732383731223b733a33323a226165373738356239663464343861386665383639326339373237363439346666223b733a33323a226630326261313438363531326165386262613862373430363761613938316235223b733a33323a226630656630623437633761363939383739366162363733616237313463323166223b733a33323a223863623261613039616438323065333266626231336462633863313834346137223b733a33323a223935666365636264353966663535663563363539366330383938616333316331223b733a33323a223135633930656462313535343761316438646465313539666234336639613865223b733a33323a226663326363396139666665623636303936363437663036366665346435353662223b733a33323a226133633233663337313239616338366438336538633237323862303034393636223b733a33323a223030656431363733633934613836613132366335613331303461346138316630223b733a33323a226665643863396363613363656163383464623933363738336534656366616562223b733a33323a223731383739376665306230383538326566363931323562396164313235363363223b733a33323a223837383535353135633431376663353933616136663836333539626434373731223b733a33323a226165643863363161333636343538663531346461643764313033313862633430223b733a33323a223632303864316430633331323131376431353239396233326635383031376361223b733a33323a223539366430653330323335363735386536366335336636343065613934633564223b733a33323a223961376138353736343531663862373236623633643332343434623835626461223b733a33323a226432616531303266313535623362343732396435613935656534316562333363223b733a33323a226662306662656435393566373537316136613965373130653039363433666664223b733a33323a226630633038663334383530636264306439386530336361663039666435666665223b733a33323a226630646131383562366466633765613434633931623932323635333030373436223b733a33323a223563623334393365623263623637373164643935323537303631626337643634223b733a33323a223831356432366637643963323862613065663435336661383561366165353834223b733a33323a223839383339363865653037326335323239333837383736313963306136663763223b733a33323a223630336431356234643136396637306661396539636434383432643162613430223b733a33323a226531643432373130663762356632643133666237333365383861666566623061223b733a33323a223831366463663466323836623864326562373066333663646638643061313538223b733a33323a223066393330633933376539376565393132373764333035386635373837316139223b733a33323a223966313662616662366565316466353061383834336463343431303063313038223b733a33323a226163626561623134343231623739366162353636313932353231333539386531223b733a33323a223736626639633766663936333861363132383733346530346638343431353630223b733a33323a223935616435623631633566366665366465646332613566633962633033373634223b733a33323a226163323633663761386661663132343639353263636235303532653734626162223b733a33323a226536363561313936386238303463626531616163643033303461343330363836223b733a33323a226434313931383665646536323733663733386134333066323630366237623533223b733a33323a223536363964643662353833346432346532333462636435636566303835353038223b733a33323a226533336431366361373761383566643337346161333231363037663539613733223b733a33323a223065383462646562666636366464613663393430313065306438333562356438223b733a33323a223433386331633766363235653536623530303337626132386137353730653532223b733a33323a223639646134396565306235323636323366346164383431396534333834383937223b733a33323a223263613031396632366266303961373632366437326235353731643631666330223b733a33323a223335383534316132386137303236343239356530653837323664653638653337223b733a33323a226534646532376339353136316336376136663234343264653133343262396330223b733a33323a223964326630663430646561323563643035626434333163383662323266616132223b733a33323a223032323838353136303831333462303763656364633630663234636231313464223b733a33323a223061313031663331376237663431386437373564616361346431643363323335223b733a33323a223832386139383662656161326435643161356630306638666464666538626133223b733a33323a223531396465653634303030633036616164646265653066383237386231623137223b733a33323a223365643036633136663239316431373061313931663832383165663435323937223b733a33323a223838316435636232363034336263666532306466663239363762393132663735223b733a33323a226537666439313139363831363533613834323435333662343364373763613034223b733a33323a226236636132633936383937653737636430333832376565333930613062613134223b733a33323a226534353133653666376330633634303861306562666430366634306231356334223b733a33323a226534323462636261616237313665633966646336323963396263386331303838223b733a33323a223866663932383039633465313633663865666665333230623739353133376666223b733a33323a226533316536393163393338306261663531386132643038666264613938383934223b733a33323a226331363164643436623335616230646536306539383531373939343566386631223b733a33323a226561396265323531376137613934613138323835636134616235396534303962223b733a33323a226439396561393439393131633462623733356230383636636137353962396431223b733a33323a223337626464346233353135636533303965383766643839316635656362663961223b733a33323a226434313336353566653336313964336634396235353030343566343233396362223b733a33323a223861313163376562396638626261323431333035623339363230613133383035223b733a33323a223963353632333565656166386431373461653764613132343237663039303764223b733a33323a223864323862396662343039323339646231663737353630396535623139616163223b733a33323a223836323539383039656639313036306263636130303030646562316236633065223b733a33323a223161303939623434613036613035393138356361393032316431636330663033223b733a33323a223461643439373132303539666536613536316666643364623363656462326365223b733a33323a223838343439353862333531363763303035383065656431396230396365356435223b733a33323a223333653764333233323839353038613832613338333765366333323837653764223b733a33323a223064363538383239333538376431666239376166643966323538623330383265223b733a33323a223062646534633430376631613838366236613633633766326437663564653437223b733a33323a226534623433653862313162396133643366306133613634306432333232326161223b733a33323a223834616261366539643635666632313536333736616239326138636234643833223b733a33323a226233653163326134323533633535396164346334313237646532333936346132223b733a33323a223362323530393639633432373635313362323835656666333736633236396664223b7d733a343a2268617368223b733a36353a2233623235303936396334323736353133623238356566663337366332363966642d6233653163326134323533633535396164346334313237646532333936346132223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a226363643638373836343534306235636139303536373137383161386238343138223b733a33323a223032343963653465303335663664393237383734323664656134316131636361223b733a33323a223332643830316136663831343739323536666236383663376264303530646139223b733a33323a223236623966626536666561356364323330396166626662303138353961653266223b733a33323a226232333162383365396434303539326535306461376463643766363330313864223b733a33323a223635656137663538326135633836303837316234303138303533316463626366223b7d733a343a2268617368223b733a36353a2236356561376635383261356338363038373162343031383035333164636263662d6232333162383365396434303539326535306461376463643766363330313864223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a226366623134353535616131623664313564393634646164656539633832346637223b733a33323a223036653832323937653433326562303362343064333761373237633861613937223b733a33323a226132656662616531653063303133323532653139623064343237323866373333223b733a33323a226264333430376636346661303334393533346538653966336630366363353336223b733a33323a226139343465666435313338383565363135383131633931333966396436663137223b733a33323a223134623038633039656537663034363834376133393462666563363566303065223b733a33323a223530363638353666663235363532646163373661323333313061376466613530223b733a33323a223036633062616562313831633733336334313165336539643935393561383261223b733a33323a223763396564626635626135376430323964306632353366306164613735353237223b733a33323a226231363765633435393362353038663532666364656534636262626338313130223b733a33323a223039303036393833653232623264333132633433643832636233303065363638223b733a33323a226431633731333937653965396536663931326133393535336231333433613732223b7d733a343a2268617368223b733a36353a2264316337313339376539653965366639313261333935353362313334336137322d3039303036393833653232623264333132633433643832636233303065363638223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31353a7b733a33323a223835386635643439653761353164613761333734353239313434623265396132223b733a33323a223030383931353432363161313732346665316664383438353162323832376564223b733a33323a223231396566303065326666373034326436356661366436623061376436326335223b733a33323a226532396337396364306330626131303537303565363761303262316134373533223b733a33323a226436656537323139313663386235363637333337306366343861323265646337223b733a33323a226464653537363235643962323330366163346331663566353066343538366138223b733a33323a223331363936313635313263616235666633636664373563346638346464653236223b733a33323a226565373733653963376665303234653766346264376131623635633535636662223b733a33323a223930303462663730373239313439666437316466656265306362386335653263223b733a33323a223436343763633564393866396463333161643564613262393430663036353464223b733a33323a223161396366346138323762353563386335653032643735323963393239303463223b733a33323a223566353065663765333335303232346362656134663137343262333463613363223b733a33323a223634663562373238306435343434336164656231386530316164393266623734223b733a33323a223238316461306434653866393533393366316433626561376164393638323232223b733a33323a223739633739363661633038343837323965643633643062373437383662363038223b733a33323a223537383637653038623036363936343964353831363838623464613466666239223b733a33323a223461333064643361653934643534373333376639386434363262316365323666223b733a33323a223637363037646435656132663361616231353564653534643539356264613430223b733a33323a226466316566616233323837343630316662303930666238333938663839396234223b733a33323a226562323666616234353433316530663765643038643931353939643162356431223b733a33323a226466363861386638313533396266366436623463393237623138366562643339223b733a33323a223438343839373166363833643237656630643234333534343630313638343334223b733a33323a223739376262656230626635333239303762376637653639663331643539376135223b733a33323a223565383563366565656261313632333835386535303432656533326139356362223b733a33323a226464363561623138383433656637353162616564623837363731666633396138223b733a33323a226137393339643262356134366563323531646536383066393939626132313935223b733a33323a226337633432343035386461376636316237666664353663623465626162376131223b733a33323a223963643639626232613033666663343538316430353436626536303938363266223b733a33323a223238323265633364373739616630343663323361363332643464386366333636223b733a33323a223933613264636664363236653038323265353435373664623735306664653762223b7d733a343a2268617368223b733a36353a2239336132646366643632366530383232653534353736646237353066646537622d3238323265633364373739616630343663323361363332643464386366333636223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1699132684);

-- --------------------------------------------------------

--
-- Structure de la table `setting`
--

DROP TABLE IF EXISTS `setting`;
CREATE TABLE IF NOT EXISTS `setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `setting`
--

INSERT INTO `setting` (`id`, `value`) VALUES
('administrator_email', '\"anaselyassai@gmail.com\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('installation_title', '\"thyp\"'),
('locale', '\"\"'),
('media_type_whitelist', '[\"application\\/msword\",\"application\\/ogg\",\"application\\/pdf\",\"application\\/rtf\",\"application\\/vnd.ms-access\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-write\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/x-gzip\",\"application\\/x-ms-wmp\",\"application\\/x-msdownload\",\"application\\/x-shockwave-flash\",\"application\\/x-tar\",\"application\\/zip\",\"audio\\/midi\",\"audio\\/mp4\",\"audio\\/mpeg\",\"audio\\/ogg\",\"audio\\/x-aac\",\"audio\\/x-aiff\",\"audio\\/x-ms-wma\",\"audio\\/x-ms-wax\",\"audio\\/x-realaudio\",\"audio\\/x-wav\",\"image\\/bmp\",\"image\\/gif\",\"image\\/jp2\",\"image\\/jpeg\",\"image\\/pjpeg\",\"image\\/png\",\"image\\/tiff\",\"image\\/x-icon\",\"text\\/css\",\"text\\/plain\",\"text\\/richtext\",\"video\\/divx\",\"video\\/mp4\",\"video\\/mpeg\",\"video\\/ogg\",\"video\\/quicktime\",\"video\\/webm\",\"video\\/x-ms-asf,\",\"video\\/x-msvideo\",\"video\\/x-ms-wmv\"]'),
('pagination_per_page', '25'),
('time_zone', '\"UTC\"'),
('use_htmlpurifier', '\"1\"'),
('version', '\"4.0.4\"'),
('version_notifications', '\"1\"');

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

DROP TABLE IF EXISTS `site`;
CREATE TABLE IF NOT EXISTS `site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thumbnail_id` int(11) DEFAULT NULL,
  `homepage_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `slug` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` longtext COLLATE utf8mb4_unicode_ci,
  `navigation` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `item_pool` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `assign_new_items` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_694309E4989D9B62` (`slug`),
  UNIQUE KEY `UNIQ_694309E4571EDDA` (`homepage_id`),
  KEY `IDX_694309E4FDFF2E92` (`thumbnail_id`),
  KEY `IDX_694309E47E3C61F9` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site`
--

INSERT INTO `site` (`id`, `thumbnail_id`, `homepage_id`, `owner_id`, `slug`, `theme`, `title`, `summary`, `navigation`, `item_pool`, `created`, `modified`, `is_public`, `assign_new_items`) VALUES
(1, NULL, NULL, 1, 'test', 'default', 'test', NULL, '[{\"type\":\"browse\",\"data\":{\"label\":\"Browse\",\"query\":\"\"},\"links\":[]}]', '[]', '2023-11-03 16:30:33', '2023-11-04 16:12:39', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `site_block_attachment`
--

DROP TABLE IF EXISTS `site_block_attachment`;
CREATE TABLE IF NOT EXISTS `site_block_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `block_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `caption` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_236473FEE9ED820C` (`block_id`),
  KEY `IDX_236473FE126F525E` (`item_id`),
  KEY `IDX_236473FEEA9FDD75` (`media_id`),
  KEY `block_position` (`block_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_item_set`
--

DROP TABLE IF EXISTS `site_item_set`;
CREATE TABLE IF NOT EXISTS `site_item_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D4CE134F6BD1646960278D7` (`site_id`,`item_set_id`),
  KEY `IDX_D4CE134F6BD1646` (`site_id`),
  KEY `IDX_D4CE134960278D7` (`item_set_id`),
  KEY `position` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site_item_set`
--

INSERT INTO `site_item_set` (`id`, `site_id`, `item_set_id`, `position`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `site_page`
--

DROP TABLE IF EXISTS `site_page`;
CREATE TABLE IF NOT EXISTS `site_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `slug` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2F900BD9F6BD1646989D9B62` (`site_id`,`slug`),
  KEY `IDX_2F900BD9F6BD1646` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site_page`
--

INSERT INTO `site_page` (`id`, `site_id`, `slug`, `title`, `is_public`, `created`, `modified`) VALUES
(1, 1, 'welcome', 'Welcome', 1, '2023-11-03 16:30:33', '2023-11-03 16:30:33');

-- --------------------------------------------------------

--
-- Structure de la table `site_page_block`
--

DROP TABLE IF EXISTS `site_page_block`;
CREATE TABLE IF NOT EXISTS `site_page_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `layout` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C593E731C4663E4` (`page_id`),
  KEY `page_position` (`page_id`,`position`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site_page_block`
--

INSERT INTO `site_page_block` (`id`, `page_id`, `layout`, `data`, `position`) VALUES
(1, 1, 'html', '{\"html\":\"    <p>Welcome to your new site. This is an example page.<\\/p>\\r\\n    <ul>\\r\\n        <li>This is a bullet list.<\\/li>\\r\\n        <li>Second entry.<\\/li>\\r\\n    <\\/ul>\\r\\n    <p>Back to normal again.<\\/p>\\r\\n    <ol>\\r\\n        <li>This is an ordered list.<\\/li>\\r\\n        <li>Second entry.<\\/li>\\r\\n    <\\/ol>\\r\\n    <p>Back to normal again.<\\/p>\\r\\n    <blockquote>This is a blockquote.<\\/blockquote>\\r\\n    <p>Back to normal again.<\\/p>\\r\\n    <div><a href=\\\"#\\\">This text is a link, which currently points to nothing.<\\/a><\\/div>\\r\\n    <p><strong>This text is bold, in a &lt;strong&gt; tag.<\\/strong><\\/p>\\r\\n    <p><em>This text is italicized, in an &lt;em&gt; tag.<\\/em><\\/p>\\r\\n    <p><u>This text is underlined, in a &lt;u&gt; tag.<\\/u><\\/p>\\r\\n    <p><s>This text has a strikethrough, in a &lt;s&gt; tag.<\\/s><\\/p>\\r\\n    <p>This text is <sub>subscript<\\/sub> and <sup>superscript<\\/sup> using &lt;sub&gt; and &lt;sup&gt;, which can be used for adding notes and citations.<\\/p>\\r\\n    <hr \\/>\\r\\n    <h1>This is an H1 title. It is bigger than the Page Title, which is rendered in H2.<\\/h1>\\r\\n    <h2>This is an H2 header, the same size as the Page Title.<\\/h2>\\r\\n    <h3>This is an H3 subheader.<\\/h3>\\r\\n    <h4>This is an H4 subheader.<\\/h4>\\r\\n    <h5>This is an H5 subheader.<\\/h5>\\r\\n    <h6>This is an H6 subheader.<\\/h6>\"}', 1),
(2, 1, 'lineBreak', '{\"break_type\":\"opaque\"}', 2),
(3, 1, 'html', '{\"html\":\"    <h2 style=\\\"font-style:italic;\\\">This is the \\\"Italic Title\\\" block style.<\\/h2>\\r\\n    <h3 style=\\\"color:#aaaaaa;font-style:italic;\\\">This is the \\\"Subtitle\\\" block style.<\\/h3>\\r\\n    <div style=\\\"background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;\\\">This is the \\\"Special Container\\\" block style.<\\/div>\\r\\n    <p><span class=\\\"marker\\\">This is the \\\"Marker\\\" inline style. <\\/span><\\/p>\\r\\n    <p><big>This is the \\\"Big\\\" inline style.<\\/big> This is normal text.<\\/p>\\r\\n    <p><small>This text is inside a \\\"small\\\" inline style.<\\/small> This is normal text.<\\/p>\\r\\n    <p><code>This is the \\\"Computer Code\\\" inline style.<\\/code><\\/p>\\r\\n    <p><span dir=\\\"rtl\\\">\\u0644\\u0643\\u0646 \\u0644\\u0627 \\u0628\\u062f \\u0623\\u0646 \\u0623\\u0648\\u0636\\u062d \\u0644\\u0643 \\u0623\\u0646 \\u0643\\u0644 \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0623\\u0641\\u0643\\u0627\\u0631 \\u0627\\u0644\\u0645\\u063a\\u0644\\u0648\\u0637\\u0629 \\u062d\\u0648\\u0644 \\u0627\\u0633\\u062a\\u0646\\u0643\\u0627\\u0631 \\u0627\\u0644\\u0646\\u0634\\u0648\\u0629 \\u0648\\u062a\\u0645\\u062c\\u064a\\u062f \\u0627\\u0644\\u0623\\u0644\\u0645 \\u064a\\u0639\\u0631\\u0636 \\u0647\\u0630\\u0627 \\u0627\\u0644\\u0646\\u0635 \\u0645\\u0646 \\u0627\\u0644\\u064a\\u0645\\u064a\\u0646 \\u0625\\u0644\\u0649 \\u0627\\u0644\\u064a\\u0633\\u0627\\u0631.<\\/span><\\/p>\"}', 3);

-- --------------------------------------------------------

--
-- Structure de la table `site_permission`
--

DROP TABLE IF EXISTS `site_permission`;
CREATE TABLE IF NOT EXISTS `site_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C0401D6FF6BD1646A76ED395` (`site_id`,`user_id`),
  KEY `IDX_C0401D6FF6BD1646` (`site_id`),
  KEY `IDX_C0401D6FA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site_permission`
--

INSERT INTO `site_permission` (`id`, `site_id`, `user_id`, `role`) VALUES
(1, 1, 1, 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `site_setting`
--

DROP TABLE IF EXISTS `site_setting`;
CREATE TABLE IF NOT EXISTS `site_setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int(11) NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`,`site_id`),
  KEY `IDX_64D05A53F6BD1646` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `password_hash` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `created`, `modified`, `password_hash`, `role`, `is_active`) VALUES
(1, 'anaselyassai@gmail.com', 'anas', '2023-10-16 14:53:16', '2023-10-16 14:53:16', '$2y$10$BaRYekpzMq49s3ct7oT2UuI/Ch9jC/oCZ4q5gOtCfjH/B1Tfa67QO', 'global_admin', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user_setting`
--

DROP TABLE IF EXISTS `user_setting`;
CREATE TABLE IF NOT EXISTS `user_setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`,`user_id`),
  KEY `IDX_C779A692A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_setting`
--

INSERT INTO `user_setting` (`id`, `user_id`, `value`) VALUES
('browse_defaults_admin_item_sets', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_items', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_media', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_sites', 1, '{\"sort_by\":\"title\",\"sort_order\":\"asc\"}'),
('columns_admin_item_sets', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_items', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_media', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_sites', 1, '[{\"type\":\"slug\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('default_resource_template', 1, '\"\"'),
('locale', 1, '\"\"');

-- --------------------------------------------------------

--
-- Structure de la table `value`
--

DROP TABLE IF EXISTS `value`;
CREATE TABLE IF NOT EXISTS `value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value_resource_id` int(11) DEFAULT NULL,
  `value_annotation_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `uri` longtext COLLATE utf8mb4_unicode_ci,
  `is_public` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1D7758349B66727E` (`value_annotation_id`),
  KEY `IDX_1D77583489329D25` (`resource_id`),
  KEY `IDX_1D775834549213EC` (`property_id`),
  KEY `IDX_1D7758344BC72506` (`value_resource_id`),
  KEY `value` (`value`(190)),
  KEY `uri` (`uri`(190))
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `value`
--

INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `value_annotation_id`, `type`, `lang`, `value`, `uri`, `is_public`) VALUES
(1, 1, 19, NULL, NULL, 'literal', '', 'rrrrr', NULL, 1),
(2, 1, 17, NULL, NULL, 'literal', '', 'reerrer', NULL, 1),
(3, 1, 178, NULL, NULL, 'literal', '', 'rerer', NULL, 1),
(8, 3, 1, NULL, NULL, 'literal', '', 'Usain Bolt', NULL, 1),
(9, 3, 4, NULL, NULL, 'literal', '', 'Portrait de l\'athlète jamaïcain Usain Bolt, le sprinter le plus rapide du monde.', NULL, 1),
(10, 3, 8, NULL, NULL, 'literal', '', 'Sprint', NULL, 1),
(11, 3, 183, NULL, NULL, 'literal', '', '40', NULL, 1),
(12, 4, 1, NULL, NULL, 'literal', '', ' Serena Williams', NULL, 1),
(13, 4, 4, NULL, NULL, 'literal', '', 'Portrait de la championne de tennis américaine Serena Williams, l\'une des meilleures joueuses de tous les temps.', NULL, 1),
(14, 4, 8, NULL, NULL, 'literal', '', 'Tennis', NULL, 1),
(15, 5, 1, NULL, NULL, 'literal', '', 'Michael Phelps', NULL, 1),
(16, 5, 4, NULL, NULL, 'literal', '', ' Portrait du nageur américain Michael Phelps, l\'athlète le plus médaillé de ', NULL, 1),
(17, 5, 8, NULL, NULL, 'literal', '', 'Natation', NULL, 1),
(18, 5, 183, NULL, NULL, 'literal', '', '38', NULL, 1),
(19, 4, 183, NULL, NULL, 'literal', '', '42', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `value_annotation`
--

DROP TABLE IF EXISTS `value_annotation`;
CREATE TABLE IF NOT EXISTS `value_annotation` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vocabulary`
--

DROP TABLE IF EXISTS `vocabulary`;
CREATE TABLE IF NOT EXISTS `vocabulary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `namespace_uri` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9099C97B9B267FDF` (`namespace_uri`),
  UNIQUE KEY `UNIQ_9099C97B93B1868E` (`prefix`),
  KEY `IDX_9099C97B7E3C61F9` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `owner_id`, `namespace_uri`, `prefix`, `label`, `comment`) VALUES
(1, NULL, 'http://purl.org/dc/terms/', 'dcterms', 'Dublin Core', 'Basic resource metadata (DCMI Metadata Terms)'),
(2, NULL, 'http://purl.org/dc/dcmitype/', 'dctype', 'Dublin Core Type', 'Basic resource types (DCMI Type Vocabulary)'),
(3, NULL, 'http://purl.org/ontology/bibo/', 'bibo', 'Bibliographic Ontology', 'Bibliographic metadata (BIBO)'),
(4, NULL, 'http://xmlns.com/foaf/0.1/', 'foaf', 'Friend of a Friend', 'Relationships between people and organizations (FOAF)');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search` ADD FULLTEXT KEY `IDX_AA31FE4A2B36786B3B8BA7C7` (`title`,`text`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `api_key`
--
ALTER TABLE `api_key`
  ADD CONSTRAINT `FK_C912ED9D7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `asset`
--
ALTER TABLE `asset`
  ADD CONSTRAINT `FK_2AF5A5C7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD CONSTRAINT `FK_AA31FE4A7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_1F1B251EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1F1B251ECBE0B084` FOREIGN KEY (`primary_media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD CONSTRAINT `FK_6D0C9625126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6D0C9625960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_set`
--
ALTER TABLE `item_set`
  ADD CONSTRAINT `FK_1015EEEBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_site`
--
ALTER TABLE `item_site`
  ADD CONSTRAINT `FK_A1734D1F126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A1734D1FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK_FBD8E0F87E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10C126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `FK_6A2CA10CBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `password_creation`
--
ALTER TABLE `password_creation`
  ADD CONSTRAINT `FK_C77917B4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `FK_8BF21CDE7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_8BF21CDEAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `FK_BC91F41616131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F4167E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_class`
--
ALTER TABLE `resource_class`
  ADD CONSTRAINT `FK_C6F063AD7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_C6F063ADAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource_template`
--
ALTER TABLE `resource_template`
  ADD CONSTRAINT `FK_39ECD52E448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E724734A3` FOREIGN KEY (`title_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52EB84E0D1D` FOREIGN KEY (`description_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD CONSTRAINT `FK_4689E2F116131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`),
  ADD CONSTRAINT `FK_4689E2F1549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `FK_694309E4571EDDA` FOREIGN KEY (`homepage_id`) REFERENCES `site_page` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E47E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E4FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD CONSTRAINT `FK_236473FE126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_236473FEE9ED820C` FOREIGN KEY (`block_id`) REFERENCES `site_page_block` (`id`),
  ADD CONSTRAINT `FK_236473FEEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD CONSTRAINT `FK_D4CE134960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D4CE134F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_page`
--
ALTER TABLE `site_page`
  ADD CONSTRAINT `FK_2F900BD9F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Contraintes pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD CONSTRAINT `FK_C593E731C4663E4` FOREIGN KEY (`page_id`) REFERENCES `site_page` (`id`);

--
-- Contraintes pour la table `site_permission`
--
ALTER TABLE `site_permission`
  ADD CONSTRAINT `FK_C0401D6FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C0401D6FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_setting`
--
ALTER TABLE `site_setting`
  ADD CONSTRAINT `FK_64D05A53F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_setting`
--
ALTER TABLE `user_setting`
  ADD CONSTRAINT `FK_C779A692A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `value`
--
ALTER TABLE `value`
  ADD CONSTRAINT `FK_1D7758344BC72506` FOREIGN KEY (`value_resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D775834549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D77583489329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  ADD CONSTRAINT `FK_1D7758349B66727E` FOREIGN KEY (`value_annotation_id`) REFERENCES `value_annotation` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD CONSTRAINT `FK_C03BA4EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD CONSTRAINT `FK_9099C97B7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

