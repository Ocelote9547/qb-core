-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: delta.optiklink.com
-- Generation Time: Mar 13, 2024 at 05:15 PM
-- Server version: 10.3.39-MariaDB-0ubuntu0.20.04.2
-- PHP Version: 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------

--
-- Table structure for table `apartments`
--

CREATE TABLE `apartments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `apartments`
--

INSERT INTO `apartments` (`id`, `name`, `type`, `label`, `citizenid`) VALUES
(1, 'apartment56300', 'apartment5', 'Fantastic Plaza 6300', 'HPO40986'),
(2, 'apartment28', 'apartment2', 'Morningwood Blvd 8', 'HPO40986');

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  `account_name` varchar(50) DEFAULT NULL,
  `account_balance` int(11) NOT NULL DEFAULT 0,
  `account_type` enum('shared','job','gang') NOT NULL,
  `users` longtext DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_statements`
--

CREATE TABLE `bank_statements` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  `account_name` varchar(50) DEFAULT 'checking',
  `amount` int(11) DEFAULT NULL,
  `reason` varchar(50) DEFAULT NULL,
  `statement_type` enum('deposit','withdraw') DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bans`
--

CREATE TABLE `bans` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crypto`
--

CREATE TABLE `crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `crypto`
--

INSERT INTO `crypto` (`crypto`, `worth`, `history`) VALUES
('qbit', 989, '[{\"NewWorth\":989,\"PreviousWorth\":981},{\"NewWorth\":989,\"PreviousWorth\":981},{\"NewWorth\":989,\"PreviousWorth\":981},{\"NewWorth\":989,\"PreviousWorth\":989}]');

-- --------------------------------------------------------

--
-- Table structure for table `crypto_transactions`
--

CREATE TABLE `crypto_transactions` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dealers`
--

CREATE TABLE `dealers` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext DEFAULT NULL,
  `time` longtext DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gloveboxitems`
--

CREATE TABLE `gloveboxitems` (
  `id` int(11) NOT NULL,
  `plate` varchar(8) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `houselocations`
--

CREATE TABLE `houselocations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(1) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` tinyint(4) DEFAULT NULL,
  `garage` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `house_plants`
--

CREATE TABLE `house_plants` (
  `id` int(11) NOT NULL,
  `building` varchar(50) DEFAULT NULL,
  `stage` int(11) DEFAULT 1,
  `sort` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `food` int(11) DEFAULT 100,
  `health` int(11) DEFAULT 100,
  `progress` int(11) DEFAULT 0,
  `coords` text DEFAULT NULL,
  `plantid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lapraces`
--

CREATE TABLE `lapraces` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `occasion_vehicles`
--

CREATE TABLE `occasion_vehicles` (
  `id` int(11) NOT NULL,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_gallery`
--

CREATE TABLE `phone_gallery` (
  `citizenid` varchar(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_invoices`
--

CREATE TABLE `phone_invoices` (
  `id` int(10) NOT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_messages`
--

CREATE TABLE `phone_messages` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `messages` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_tweets`
--

CREATE TABLE `phone_tweets` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `url` text DEFAULT NULL,
  `picture` varchar(512) DEFAULT './img/default.png',
  `tweetId` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(11) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`) VALUES
(1, 'HPO40986', 1, 'license:8f68aada56ec3eefa1c55ca6adf1dcd33d76d2a2', 'daniuser64.ag2', '{\"bank\":19390,\"crypto\":0,\"cash\":400}', '{\"account\":\"US06QBCore1575462988\",\"firstname\":\"Noah\",\"backstory\":\"placeholder backstory\",\"gender\":0,\"phone\":\"9741337628\",\"nationality\":\"Spain\",\"cid\":1,\"birthdate\":\"1999-02-25\",\"lastname\":\"Holliday\"}', '{\"name\":\"mechanic\",\"type\":\"mechanic\",\"label\":\"LS Customs\",\"isboss\":false,\"payment\":30,\"onduty\":true,\"grade\":{\"name\":\"No Grades\",\"level\":0}}', '{\"isboss\":false,\"name\":\"none\",\"label\":\"No Gang Affiliaton\",\"grade\":{\"name\":\"none\",\"level\":0}}', '{\"x\":-212.55824279785157,\"y\":-1320.5670166015626,\"z\":30.10546875}', '{\"craftingrep\":0,\"phone\":[],\"bloodtype\":\"O-\",\"inside\":{\"apartment\":[]},\"jobrep\":{\"tow\":0,\"taxi\":0,\"hotdog\":0,\"trucker\":0},\"tracker\":false,\"phonedata\":{\"SerialNumber\":48597814,\"InstalledApps\":[]},\"ishandcuffed\":false,\"callsign\":\"NO CALLSIGN\",\"status\":[],\"armor\":0,\"fingerprint\":\"qF681v39ZYC0958\",\"fitbit\":[],\"currentapartment\":\"apartment28\",\"thirst\":0,\"attachmentcraftingrep\":0,\"injail\":0,\"inlaststand\":false,\"criminalrecord\":{\"hasRecord\":false},\"dealerrep\":0,\"walletid\":\"QB-84201284\",\"isdead\":true,\"licences\":{\"weapon\":false,\"driver\":true,\"business\":false},\"jailitems\":[],\"stress\":0,\"hunger\":0}', '[]', '2024-03-12 19:03:27');

-- --------------------------------------------------------

--
-- Table structure for table `playerskins`
--

CREATE TABLE `playerskins` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(11) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `playerskins`
--

INSERT INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
(1, 'HPO40986', '1885233650', '{\"jaw_bone_width\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"face\":{\"item\":4,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"chimp_bone_lowering\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"blush\":{\"item\":-1,\"defaultTexture\":1,\"defaultItem\":-1,\"texture\":1},\"lipstick\":{\"item\":-1,\"defaultTexture\":1,\"defaultItem\":-1,\"texture\":1},\"eyebrows\":{\"item\":5,\"defaultTexture\":1,\"defaultItem\":-1,\"texture\":1},\"chimp_bone_width\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"lips_thickness\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"ear\":{\"item\":-1,\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0},\"t-shirt\":{\"item\":122,\"defaultTexture\":0,\"defaultItem\":1,\"texture\":0},\"facemix\":{\"skinMix\":0.99,\"defaultShapeMix\":0.0,\"shapeMix\":0.99,\"defaultSkinMix\":0.0},\"eyebrown_high\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"nose_5\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"torso2\":{\"item\":348,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":7},\"beard\":{\"item\":4,\"defaultTexture\":1,\"defaultItem\":-1,\"texture\":10},\"eye_color\":{\"item\":-1,\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0},\"ageing\":{\"item\":-1,\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0},\"chimp_hole\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"face2\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"neck_thikness\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"chimp_bone_lenght\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"accessory\":{\"item\":-1,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"pants\":{\"item\":24,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"nose_0\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"eyebrown_forward\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"eye_opening\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"cheek_3\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"cheek_2\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"nose_3\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"cheek_1\":{\"item\":3,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"hat\":{\"item\":-1,\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0},\"hair\":{\"item\":3,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":3},\"nose_4\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"nose_1\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"vest\":{\"item\":-1,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"jaw_bone_back_lenght\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"bracelet\":{\"item\":-1,\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0},\"makeup\":{\"item\":-1,\"defaultTexture\":1,\"defaultItem\":-1,\"texture\":1},\"moles\":{\"item\":-1,\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0},\"watch\":{\"item\":-1,\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0},\"shoes\":{\"item\":10,\"defaultTexture\":0,\"defaultItem\":1,\"texture\":0},\"mask\":{\"item\":121,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"arms\":{\"item\":1,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"glass\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"nose_2\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"bag\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"decals\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0}}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `player_contacts`
--

CREATE TABLE `player_contacts` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `player_houses`
--

CREATE TABLE `player_houses` (
  `id` int(255) NOT NULL,
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `decorations` text DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `player_mails`
--

CREATE TABLE `player_mails` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_mails`
--

INSERT INTO `player_mails` (`id`, `citizenid`, `sender`, `subject`, `message`, `read`, `mailid`, `date`, `button`) VALUES
(1, 'HPO40986', 'Hospital Pillbox', 'Costos de hospital', 'Querido Dr. Holliday, <br /><br />Le adjuntamos la factura con los costos de su última estancia en el hospital.<br />El costo total es de: <strong>$2000</strong><br /><br />¡Le deseamos una pronta recuperación!', 0, 739904, '2024-03-09 15:25:16', '[]'),
(2, 'HPO40986', 'Hospital Pillbox', 'Costos de hospital', 'Querido Dr. Holliday, <br /><br />Le adjuntamos la factura con los costos de su última estancia en el hospital.<br />El costo total es de: <strong>$2000</strong><br /><br />¡Le deseamos una pronta recuperación!', 0, 878813, '2024-03-09 15:25:16', '[]'),
(3, 'HPO40986', 'Hospital Pillbox', 'Costos de hospital', 'Querido Dr. Holliday, <br /><br />Le adjuntamos la factura con los costos de su última estancia en el hospital.<br />El costo total es de: <strong>$2000</strong><br /><br />¡Le deseamos una pronta recuperación!', 0, 310473, '2024-03-09 15:25:39', '[]');

-- --------------------------------------------------------

--
-- Table structure for table `player_outfits`
--

CREATE TABLE `player_outfits` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `skin` text DEFAULT NULL,
  `outfitId` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_outfits`
--

INSERT INTO `player_outfits` (`id`, `citizenid`, `outfitname`, `model`, `skin`, `outfitId`) VALUES
(1, 'HPO40986', 'Dia 1', '1885233650', '{\"shoes\":{\"defaultItem\":1,\"item\":10,\"defaultTexture\":0,\"texture\":0},\"face\":{\"defaultItem\":0,\"item\":4,\"defaultTexture\":0,\"texture\":0},\"makeup\":{\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":1,\"texture\":1},\"glass\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"cheek_1\":{\"defaultItem\":0,\"item\":3,\"defaultTexture\":0,\"texture\":0},\"nose_0\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"neck_thikness\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"ageing\":{\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0,\"texture\":0},\"cheek_3\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"eye_color\":{\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0,\"texture\":0},\"hair\":{\"defaultItem\":0,\"item\":3,\"defaultTexture\":0,\"texture\":3},\"nose_5\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"lipstick\":{\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":1,\"texture\":1},\"decals\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"bracelet\":{\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0,\"texture\":0},\"facemix\":{\"defaultShapeMix\":0.0,\"skinMix\":0.99,\"shapeMix\":0.99,\"defaultSkinMix\":0.0},\"arms\":{\"defaultItem\":0,\"item\":1,\"defaultTexture\":0,\"texture\":0},\"blush\":{\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":1,\"texture\":1},\"bag\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"nose_1\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"cheek_2\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"mask\":{\"defaultItem\":0,\"item\":121,\"defaultTexture\":0,\"texture\":0},\"jaw_bone_back_lenght\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"chimp_bone_width\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"watch\":{\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0,\"texture\":0},\"moles\":{\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0,\"texture\":0},\"torso2\":{\"defaultItem\":0,\"item\":348,\"defaultTexture\":0,\"texture\":7},\"lips_thickness\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"t-shirt\":{\"defaultItem\":1,\"item\":122,\"defaultTexture\":0,\"texture\":0},\"vest\":{\"defaultItem\":0,\"item\":-1,\"defaultTexture\":0,\"texture\":0},\"ear\":{\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0,\"texture\":0},\"eyebrown_high\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"nose_2\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"nose_4\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"hat\":{\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0,\"texture\":0},\"jaw_bone_width\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"accessory\":{\"defaultItem\":0,\"item\":-1,\"defaultTexture\":0,\"texture\":0},\"beard\":{\"defaultItem\":-1,\"item\":4,\"defaultTexture\":1,\"texture\":10},\"chimp_hole\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"face2\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"eyebrows\":{\"defaultItem\":-1,\"item\":5,\"defaultTexture\":1,\"texture\":1},\"pants\":{\"defaultItem\":0,\"item\":24,\"defaultTexture\":0,\"texture\":0},\"nose_3\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"eyebrown_forward\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"chimp_bone_lowering\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"chimp_bone_lenght\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"eye_opening\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0}}', 'outfit-5-2683');

-- --------------------------------------------------------

--
-- Table structure for table `player_vehicles`
--

CREATE TABLE `player_vehicles` (
  `id` int(11) NOT NULL,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(8) NOT NULL,
  `fakeplate` varchar(8) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `paymentamount` int(11) NOT NULL DEFAULT 0,
  `paymentsleft` int(11) NOT NULL DEFAULT 0,
  `financetime` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_vehicles`
--

INSERT INTO `player_vehicles` (`id`, `license`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `fakeplate`, `garage`, `fuel`, `engine`, `body`, `state`, `depotprice`, `drivingdistance`, `status`, `balance`, `paymentamount`, `paymentsleft`, `financetime`) VALUES
(1, 'license:8f68aada56ec3eefa1c55ca6adf1dcd33d76d2a2', 'HPO40986', 'dominator', '80636076', '{\"interiorColor\":0,\"liveryRoof\":-1,\"windowStatus\":{\"1\":true,\"2\":true,\"3\":true,\"4\":false,\"5\":false,\"6\":true,\"7\":true,\"0\":true},\"modKit47\":-1,\"modHydrolic\":-1,\"modTank\":-1,\"modTrimB\":-1,\"modAirFilter\":-1,\"xenonColor\":255,\"modFrontBumper\":-1,\"oilLevel\":4.76596940834568,\"modGrille\":-1,\"plate\":\"64KRO556\",\"tyreSmokeColor\":[255,255,255],\"model\":80636076,\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"wheelWidth\":0.0,\"dirtLevel\":7.94328234724281,\"modTransmission\":-1,\"windowTint\":-1,\"pearlescentColor\":130,\"modArchCover\":-1,\"modBrakes\":-1,\"modSideSkirt\":-1,\"modCustomTiresR\":false,\"modKit21\":-1,\"modTrunk\":-1,\"modDoorSpeaker\":-1,\"plateIndex\":0,\"wheelSize\":0.0,\"modStruts\":-1,\"modKit49\":-1,\"modOrnaments\":-1,\"modDashboard\":-1,\"modAPlate\":-1,\"modWindows\":-1,\"modPlateHolder\":-1,\"modVanityPlate\":-1,\"modEngine\":-1,\"modCustomTiresF\":false,\"modDial\":-1,\"modSpeakers\":-1,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modHood\":-1,\"modAerials\":-1,\"modSmokeEnabled\":false,\"wheels\":1,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modXenon\":false,\"dashboardColor\":0,\"modRightFender\":-1,\"bodyHealth\":991.3216369359033,\"modFrame\":-1,\"modRoof\":-1,\"modEngineBlock\":-1,\"modFrontWheels\":-1,\"fuelLevel\":70.69521289046105,\"modBackWheels\":-1,\"modLivery\":-1,\"modHorns\":-1,\"modSuspension\":-1,\"tireHealth\":{\"1\":1000.0,\"2\":1000.0,\"3\":1000.0,\"0\":991.4430541992188},\"modExhaust\":-1,\"modSeats\":-1,\"modKit19\":-1,\"color2\":84,\"modKit17\":-1,\"modTrimA\":-1,\"modSpoilers\":-1,\"modSteeringWheel\":-1,\"modRearBumper\":-1,\"neonColor\":[255,0,255],\"neonEnabled\":[false,false,false,false],\"modArmor\":-1,\"extras\":{\"11\":false,\"10\":false,\"12\":true},\"modTurbo\":false,\"modShifterLeavers\":-1,\"wheelColor\":156,\"color1\":130,\"modFender\":-1,\"engineHealth\":987.3499957622819,\"tankHealth\":998.4705910484217}', '64KRO556', NULL, NULL, 100, 1000, 1000, 1, 0, NULL, '{\"clutch\":100,\"fuel\":100,\"radiator\":100,\"axle\":100,\"brakes\":100}', 0, 0, 0, 0),
(2, 'license:8f68aada56ec3eefa1c55ca6adf1dcd33d76d2a2', 'HPO40986', 'zion2', '-1193103848', '{\"interiorColor\":0,\"modStruts\":-1,\"modAerials\":-1,\"neonEnabled\":[false,false,false,false],\"modTurbo\":false,\"modTrunk\":-1,\"modSmokeEnabled\":false,\"modTank\":-1,\"pearlescentColor\":5,\"windowTint\":-1,\"modAPlate\":-1,\"wheelWidth\":0.0,\"modBrakes\":-1,\"color1\":2,\"modKit19\":-1,\"modCustomTiresR\":false,\"modKit17\":-1,\"tyreSmokeColor\":[255,255,255],\"oilLevel\":4.76596940834568,\"modPlateHolder\":-1,\"modKit49\":-1,\"engineHealth\":1000.0592475178704,\"tankHealth\":1000.0592475178704,\"bodyHealth\":998.4705910484217,\"neonColor\":[255,0,255],\"extras\":{\"11\":false,\"12\":true,\"10\":false},\"model\":-1193103848,\"modSpoilers\":-1,\"modWindows\":-1,\"modDashboard\":-1,\"modRoof\":-1,\"dirtLevel\":7.94328234724281,\"liveryRoof\":-1,\"plate\":\"05HPI893\",\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modXenon\":false,\"modRightFender\":-1,\"dashboardColor\":0,\"modFrontWheels\":-1,\"modVanityPlate\":-1,\"wheelSize\":0.0,\"modTrimA\":-1,\"modSeats\":-1,\"modSideSkirt\":-1,\"windowStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"6\":false,\"7\":true,\"0\":false},\"modAirFilter\":-1,\"modRearBumper\":-1,\"plateIndex\":0,\"modSpeakers\":-1,\"modEngine\":-1,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modFrontBumper\":-1,\"modBackWheels\":-1,\"modTrimB\":-1,\"modHydrolic\":-1,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modFender\":-1,\"modCustomTiresF\":false,\"modDoorSpeaker\":-1,\"modFrame\":-1,\"modHood\":-1,\"modArchCover\":-1,\"modArmor\":-1,\"modTransmission\":-1,\"fuelLevel\":69.90088465573678,\"wheels\":0,\"modEngineBlock\":-1,\"tireHealth\":{\"1\":1000.0,\"2\":1000.0,\"3\":1000.0,\"0\":1000.0},\"modLivery\":-1,\"modSteeringWheel\":-1,\"modSuspension\":-1,\"wheelColor\":156,\"modKit21\":-1,\"modExhaust\":-1,\"modShifterLeavers\":-1,\"modHorns\":-1,\"color2\":2,\"modKit47\":-1,\"modDial\":-1,\"xenonColor\":255,\"modOrnaments\":-1,\"modGrille\":-1}', '05HPI893', NULL, 'pillboxgarage', 70, 1000, 999, 1, 0, NULL, '{\"clutch\":100,\"fuel\":100,\"radiator\":100,\"axle\":100,\"brakes\":100}', 0, 0, 0, 0),
(3, 'license:8f68aada56ec3eefa1c55ca6adf1dcd33d76d2a2', 'HPO40986', 'jester', '-1297672541', '{\"dashboardColor\":0,\"modVanityPlate\":-1,\"modTransmission\":-1,\"modTank\":-1,\"model\":-1297672541,\"modSpoilers\":-1,\"modKit19\":-1,\"neonEnabled\":[false,false,false,false],\"modHood\":-1,\"fuelLevel\":26.21283174590128,\"modRoof\":-1,\"modArchCover\":-1,\"modSpeakers\":-1,\"wheelColor\":156,\"modKit21\":-1,\"modPlateHolder\":-1,\"tireHealth\":{\"1\":1000.0,\"2\":1000.0,\"3\":1000.0,\"0\":1000.0},\"tankHealth\":1000.0592475178704,\"modShifterLeavers\":-1,\"xenonColor\":255,\"plate\":\"00OZP769\",\"modKit49\":-1,\"modFrontWheels\":-1,\"pearlescentColor\":4,\"modEngine\":-1,\"modFrame\":-1,\"modKit17\":-1,\"modWindows\":-1,\"tyreSmokeColor\":[255,255,255],\"modBrakes\":-1,\"modTrimA\":-1,\"modHorns\":-1,\"modSeats\":-1,\"neonColor\":[255,0,255],\"windowStatus\":{\"1\":true,\"2\":true,\"3\":true,\"4\":false,\"5\":false,\"6\":true,\"7\":true,\"0\":false},\"modDial\":-1,\"modDoorSpeaker\":-1,\"oilLevel\":4.76596940834568,\"modRightFender\":-1,\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modCustomTiresR\":false,\"modExhaust\":-1,\"plateIndex\":0,\"modKit47\":-1,\"interiorColor\":0,\"modTrimB\":-1,\"modTurbo\":false,\"color2\":0,\"modCustomTiresF\":false,\"wheelSize\":0.0,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modEngineBlock\":-1,\"modAirFilter\":-1,\"liveryRoof\":-1,\"modSmokeEnabled\":false,\"modLivery\":-1,\"bodyHealth\":1000.0592475178704,\"modTrunk\":-1,\"modGrille\":-1,\"modArmor\":-1,\"modSuspension\":-1,\"wheelWidth\":0.0,\"modAerials\":-1,\"modAPlate\":-1,\"modHydrolic\":-1,\"wheels\":7,\"modBackWheels\":-1,\"modStruts\":-1,\"modDashboard\":-1,\"modFrontBumper\":-1,\"modXenon\":false,\"modSideSkirt\":-1,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"extras\":[],\"windowTint\":-1,\"modRearBumper\":-1,\"modOrnaments\":-1,\"color1\":1,\"modFender\":-1,\"engineHealth\":1000.0592475178704,\"modSteeringWheel\":-1,\"dirtLevel\":0.0}', '00OZP769', NULL, 'pillboxgarage', 26, 1000, 1000, 1, 0, NULL, '{\"fuel\":100,\"clutch\":100,\"radiator\":100,\"brakes\":100,\"axle\":100}', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `player_warns`
--

CREATE TABLE `player_warns` (
  `id` int(11) NOT NULL,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stashitems`
--

CREATE TABLE `stashitems` (
  `id` int(11) NOT NULL,
  `stash` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trunkitems`
--

CREATE TABLE `trunkitems` (
  `id` int(11) NOT NULL,
  `plate` varchar(8) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apartments`
--
ALTER TABLE `apartments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `account_name` (`account_name`);

--
-- Indexes for table `bank_statements`
--
ALTER TABLE `bank_statements`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `license` (`license`),
  ADD KEY `discord` (`discord`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `crypto`
--
ALTER TABLE `crypto`
  ADD PRIMARY KEY (`crypto`);

--
-- Indexes for table `crypto_transactions`
--
ALTER TABLE `crypto_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `dealers`
--
ALTER TABLE `dealers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gloveboxitems`
--
ALTER TABLE `gloveboxitems`
  ADD PRIMARY KEY (`plate`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `houselocations`
--
ALTER TABLE `houselocations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `house_plants`
--
ALTER TABLE `house_plants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `building` (`building`),
  ADD KEY `plantid` (`plantid`);

--
-- Indexes for table `lapraces`
--
ALTER TABLE `lapraces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `raceid` (`raceid`);

--
-- Indexes for table `occasion_vehicles`
--
ALTER TABLE `occasion_vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `occasionId` (`occasionid`);

--
-- Indexes for table `phone_invoices`
--
ALTER TABLE `phone_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `phone_messages`
--
ALTER TABLE `phone_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `number` (`number`);

--
-- Indexes for table `phone_tweets`
--
ALTER TABLE `phone_tweets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`citizenid`),
  ADD KEY `id` (`id`),
  ADD KEY `last_updated` (`last_updated`),
  ADD KEY `license` (`license`);

--
-- Indexes for table `playerskins`
--
ALTER TABLE `playerskins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `player_contacts`
--
ALTER TABLE `player_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `player_houses`
--
ALTER TABLE `player_houses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `house` (`house`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `identifier` (`identifier`);

--
-- Indexes for table `player_mails`
--
ALTER TABLE `player_mails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `player_outfits`
--
ALTER TABLE `player_outfits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `outfitId` (`outfitId`);

--
-- Indexes for table `player_vehicles`
--
ALTER TABLE `player_vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plate` (`plate`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `license` (`license`);

--
-- Indexes for table `player_warns`
--
ALTER TABLE `player_warns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stashitems`
--
ALTER TABLE `stashitems`
  ADD PRIMARY KEY (`stash`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `trunkitems`
--
ALTER TABLE `trunkitems`
  ADD PRIMARY KEY (`plate`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apartments`
--
ALTER TABLE `apartments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_statements`
--
ALTER TABLE `bank_statements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bans`
--
ALTER TABLE `bans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crypto_transactions`
--
ALTER TABLE `crypto_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dealers`
--
ALTER TABLE `dealers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gloveboxitems`
--
ALTER TABLE `gloveboxitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `houselocations`
--
ALTER TABLE `houselocations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `house_plants`
--
ALTER TABLE `house_plants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lapraces`
--
ALTER TABLE `lapraces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `occasion_vehicles`
--
ALTER TABLE `occasion_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_invoices`
--
ALTER TABLE `phone_invoices`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_messages`
--
ALTER TABLE `phone_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_tweets`
--
ALTER TABLE `phone_tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `playerskins`
--
ALTER TABLE `playerskins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `player_contacts`
--
ALTER TABLE `player_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_houses`
--
ALTER TABLE `player_houses`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_mails`
--
ALTER TABLE `player_mails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `player_outfits`
--
ALTER TABLE `player_outfits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `player_vehicles`
--
ALTER TABLE `player_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `player_warns`
--
ALTER TABLE `player_warns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stashitems`
--
ALTER TABLE `stashitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trunkitems`
--
ALTER TABLE `trunkitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
