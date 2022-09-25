-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Creato il: Nov 19, 2018 alle 19:47
-- Versione del server: 10.1.13-MariaDB
-- Versione PHP: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `databasePW`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `administrator`
--

CREATE TABLE `administrator` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `administrator`
--

INSERT INTO `administrator` (`admin_id`, `email`, `password`) VALUES
(1, 'admin@admin.admin', 'admin');

-- --------------------------------------------------------

--
-- Struttura della tabella `category`
--

CREATE TABLE `category` (
  `category_id` int(255) UNSIGNED NOT NULL,
  `category_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(3, 'Accessori'),
(1, 'Fotocamere'),
(2, 'Videocamere');

-- --------------------------------------------------------

--
-- Struttura della tabella `images`
--

CREATE TABLE `images` (
  `image-id` int(10) UNSIGNED NOT NULL,
  `image-name` varchar(255) NOT NULL,
  `product-name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `images`
--

INSERT INTO `images` (`image-id`, `image-name`, `product-name`) VALUES
(1, 'images/fotocamere/1.jpg', 'Powershot G3'),
(2, 'images/fotocamere/2.jpg', 'Eos 80D'),
(3, 'images/fotocamere/3.jpg', 'Eos 7D Mark 2'),
(4, 'images/fotocamere/4.jpg', 'Ius 175'),
(5, 'images/fotocamere/5.jpg', 'SX 610 HS'),
(6, 'images/fotocamere/6.jpg', 'Coolpix L340'),
(7, 'images/fotocamere/7.jpg', 'D3200'),
(8, 'images/fotocamere/8.jpg', 'Coolpix L840'),
(9, 'images/fotocamere/9.jpg', 'D5200 Nikkor'),
(10, 'images/fotocamere/10.jpg', 'DSC-W830'),
(11, 'images/fotocamere/11.jpg', 'DSC-HX300'),
(12, 'images/fotocamere/12.jpg', 'Alpha 6000L'),
(13, 'images/fotocamere/13.jpg', 'DSC-RX 100 M2'),
(14, 'images/videocamere/14.jpg', 'HDR-CX405'),
(15, 'images/videocamere/15.jpg', 'HDR-AS200V'),
(16, 'images/videocamere/16.jpg', 'NEX-VG10E'),
(17, 'images/videocamere/17.jpg', 'HXR-MC2500'),
(18, 'images/videocamere/18.jpg', 'LEGRIA HF R606'),
(19, 'images/videocamere/19.jpg', 'XF100'),
(20, 'images/videocamere/20.jpg', 'Legria HF G40'),
(21, 'images/videocamere/21.jpg', 'XC10'),
(22, 'images/videocamere/22.jpg', 'LEGRIA MINI X'),
(23, 'images/videocamere/23.jpg', 'HC-V160EG-K'),
(24, 'images/videocamere/24.jpg', 'HDV-V7'),
(25, 'images/videocamere/25.jpg', 'SX900'),
(26, 'images/videocamere/26.jpg', 'AG-AC90'),
(27, 'images/accessori/27.jpg', 'Zoom Ottico EF-S'),
(28, 'images/accessori/28.jpg', 'Caricatore LC-E6E'),
(29, 'images/accessori/29.jpg', 'MicroSd 32GB MB'),
(30, 'images/accessori/30.jpg', 'Lampada Fotografica'),
(31, 'images/accessori/31.jpg', 'Treppiede Alpha 2500'),
(32, 'images/accessori/32.jpg', 'Supporto Videocamera'),
(33, 'images/accessori/33.jpg', 'Kit Accessori');

-- --------------------------------------------------------

--
-- Struttura della tabella `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(30) NOT NULL,
  `shippers_name` varchar(30) NOT NULL,
  `address` varchar(120) NOT NULL,
  `mobile_number` varchar(10) NOT NULL,
  `shippers_email` varchar(45) NOT NULL,
  `ordered_On` datetime NOT NULL,
  `total_order_price` double(10,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `order`
--

INSERT INTO `order` (`order_id`, `user_id`, `status`, `shippers_name`, `address`, `mobile_number`, `shippers_email`, `ordered_On`, `total_order_price`) VALUES
(1, 1, 'Spedito', 'gregorio', 'viale della rimembranza 37', '333344556', 'gregorio@gmail.com', '2016-07-13 15:25:21', 1284.00),
(2, 1, 'Spedito', 'gregorio', 'viale della rimembranza 37', '333344556', 'gregorio@gmail.com', '2016-07-13 16:19:42', 5365.00),
(3, 1, 'Spedito', '', '', '', 'gregorio@gmail.com', '2016-07-13 16:27:29', 1284.00),
(4, 1, 'Spedito', '', '', '', 'gregorio@gmail.com', '2016-07-13 16:34:16', 1284.00),
(5, 1, 'Spedito', '', '', '', 'gregorio@gmail.com', '2016-07-13 16:37:12', 1284.00),
(6, 1, 'Spedito', '', '', '', 'gregorio@gmail.com', '2016-07-13 16:37:20', 1284.00),
(7, 1, 'Spedito', '', '', '', 'gregorio@gmail.com', '2016-07-13 16:37:31', 1284.00),
(8, 1, 'Spedito', '', '', '', 'gregorio@gmail.com', '2016-07-13 16:38:28', 1284.00),
(9, 1, 'Spedito', '', '', '', 'gregorio@gmail.com', '2016-07-13 16:54:42', 1284.00),
(10, 1, 'Spedito', '', '', '', 'gregorio@gmail.com', '2016-07-13 16:54:56', 399.00),
(11, 1, 'Spedito', '', '', '', 'gregorio@gmail.com', '2016-07-13 16:58:18', 1284.00),
(12, 1, 'Spedito', 'gregorio', 'viale della rimembranza 37', '333344556', 'gregorio@gmail.com', '2016-07-13 17:04:49', 1284.00),
(13, 1, 'Spedito', 'gregorio', 'viale della rimembranza 37', '333344556', 'gregorio@gmail.com', '2016-07-13 17:05:16', 1284.00),
(14, 1, 'Spedito', 'gregorio', 'viale della rimembranza 37', '333344556', 'gregorio@gmail.com', '2016-07-13 17:07:37', 1284.00),
(15, 1, 'Spedito', 'gregorio', 'viale della rimembranza 37', '333344556', 'gregorio@gmail.com', '2016-07-13 17:18:02', 2568.00),
(16, 29, 'Spedito', 'qweqweqwe', '12312312312', '123123123', 'gregorio@gmail.com', '2016-07-13 18:53:06', 1284.00),
(17, 30, 'Spedito', 'weqweqwe', 'qweqweqwe', '123123123', 'saggese@gmail.com', '2016-07-13 18:55:37', 1284.00),
(18, 29, 'Spedito', 'gregorio', 'qeqweqwe', '222222222', 'gregorio@gmail.com', '2016-07-19 15:54:21', 199.50),
(19, 29, 'Spedito', 'gregorio', 'qeqweqwe', '222222222', 'gregorio@gmail.com', '2016-07-20 12:58:38', 1483.50),
(20, 29, 'Spedito', 'gregorio', 'qeqweqwe', '222222222', 'gregorio@gmail.com', '2016-07-20 13:38:32', 0.00),
(21, 29, 'Spedito', 'gregorio', 'qeqweqwe', '222222222', 'gregorio@gmail.com', '2016-07-20 13:39:00', 1198.00),
(22, 29, 'Spedito', 'gregorio', 'qeqweqwe', '222222222', 'gregorio@gmail.com', '2016-07-22 18:22:09', 1483.50),
(23, 35, 'Spedito', 'rita', 'aaaaaaa', '000000000', 'prova1@gmail.com', '2016-09-15 11:25:56', 1483.50),
(24, 29, 'Spedito', 'gregorio', 'qeqweqwe', '222222222', 'gregorio@gmail.com', '2016-09-28 11:43:53', 1284.00),
(25, 29, 'Spedito', 'gregorio', 'qeqweqwe', '222222222', 'gregorio@gmail.com', '2016-10-25 19:39:05', 212.34),
(26, 37, 'Spedito', 'Alessia', 'via pezza dell''abate', '339168999', 'violetta_ale@hotmail.it', '2016-11-15 16:22:53', 12.84),
(27, 29, 'Spedito', 'gregorio', 'wegwegwegwegweg', '222222222', 'gregorio@gmail.com', '2016-11-28 17:35:22', 12.84),
(28, 29, 'Spedito', 'gregorio', 'wegwegwegwegweg', '222222222', 'gregorio@gmail.com', '2018-07-16 12:08:29', 51.36);

-- --------------------------------------------------------

--
-- Struttura della tabella `product-company`
--

CREATE TABLE `product-company` (
  `company-id` int(10) UNSIGNED NOT NULL,
  `company-name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `product-company`
--

INSERT INTO `product-company` (`company-id`, `company-name`) VALUES
(9, 'Cablematic'),
(1, 'Canon'),
(8, 'LightFox'),
(2, 'Nikon'),
(5, 'Ordo'),
(4, 'Panasonic'),
(7, 'Samsung'),
(3, 'Sony'),
(6, 'Toshiba');

-- --------------------------------------------------------

--
-- Struttura della tabella `products`
--

CREATE TABLE `products` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `product-name` varchar(60) NOT NULL,
  `sub-category-name` varchar(40) NOT NULL,
  `category-name` varchar(40) NOT NULL,
  `company-name` varchar(40) NOT NULL,
  `price` double(10,2) UNSIGNED NOT NULL,
  `summary` text,
  `tags` varchar(255) NOT NULL,
  `product_qty` int(11) UNSIGNED NOT NULL,
  `lastUpdated` datetime NOT NULL,
  `hits` int(10) UNSIGNED NOT NULL,
  `isDiscount` double(10,2) NOT NULL,
  `discount` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `products`
--

INSERT INTO `products` (`product_id`, `product-name`, `sub-category-name`, `category-name`, `company-name`, `price`, `summary`, `tags`, `product_qty`, `lastUpdated`, `hits`, `isDiscount`, `discount`) VALUES
(1, 'Powershot G3', 'Reflex', 'Fotocamere', 'Canon', 223.00, '<div>Grazie alla combinazione tra la versatilità di un ...</div>', 'Powershot G3', 50, '2016-05-09 23:16:58', 0, 0.00, 0.00),
(2, 'Eos 80D', 'Reflex', 'Fotocamere', 'Canon', 1284.00, '<div>\n    Dotata di velocità straordinaria, controlli intuit...\n</div>', 'Eos 80D', 17, '2016-05-09 23:16:58', 100, 1.00, 99.00),
(3, 'Eos 7D Mark 2', 'Reflex', 'Fotocamere', 'Canon', 1396.00, '', 'Eos 7D Mark 2', 36, '2016-05-09 23:16:58', 0, 0.00, 0.00),
(4, 'Ius 175', 'Reflex', 'Fotocamere', 'Canon', 87.00, '<div>\n    Sottile ed elegante, questa IXUS inquadra e scatta...\n</div>', 'Ius 175', 20, '2016-05-09 23:16:58', 0, 1.00, 40.00),
(5, 'SX 610 HS', 'Reflex', 'Fotocamere', 'Canon', 162.00, '<div>\n    Cattura immagini dai dettagli nitidi di tutti i mo...\n</div>', 'SX 610 HS', 25, '2016-05-09 23:16:58', 0, 1.00, 12.00),
(6, 'Coolpix L340', 'Full HD', 'Fotocamere', 'Nikon', 159.00, '<div>\n    State cercando una fotocamera classica ma compatta...\n</div>', 'Coolpix L340', 18, '2016-05-09 23:16:58', 0, 0.00, 0.00),
(7, 'D3200', 'Full HD', 'Fotocamere', 'Nikon', 399.00, '<div>\n   Eccellente qualità dell''immagine con sensore CMOS ...\n</div>', 'D3200', 10, '2016-05-09 23:16:58', 100, 1.00, 50.00),
(8, 'Coolpix L840', 'Full HD', 'Fotocamere', 'Nikon', 223.00, '<div>\nEffettuate ingrandimenti dei momenti speciali dell...\n</div>', 'Coolpix L840', 20, '2016-05-09 23:16:58', 0, 1.00, 40.00),
(9, 'D5200 Nikkor', 'Full HD', 'Fotocamere', 'Nikon', 495.00, '<div>\n   Scoprite nuove prospettive con l''incredibile D5200...\n</div>', 'D5200 Nikkor', 30, '2016-05-09 23:16:58', 0, 0.00, 0.00),
(10, 'DSC-W830', 'Compact', 'Fotocamere', 'Sony', 96.00, '<div>\n   Se sei fuori con gli amici o a una riunione famili...\n</div>', 'DSC-W830', 23, '2016-05-09 23:16:58', 0, 1.00, 10.00),
(11, 'DSC-HX300', 'Compact', 'Fotocamere', 'Sony', 290.00, '<div>\n    DSCHX300 20.2 MP, Sensore CMOS Exmor R, Ottica Son...\n</div>', 'DSC-HX300', 25, '2016-05-09 23:16:58', 0, 0.00, 0.00),
(12, 'Alpha 6000L', 'Compact', 'Fotocamere', 'Sony', 645.00, '<div>\n    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n</div>\n<div>\n    Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. Nullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris. Integer in mauris eu nibh euismod gravida. Duis ac tellus et risus vulputate vehicula. Donec lobortis risus a elit. Etiam tempor. Ut ullamcorper, ligula eu tempor congue, eros est euismod turpis, id tincidunt sapien risus a quam. Maecenas fermentum consequat mi. Donec fermentum. Pellentesque malesuada nulla a mi. Duis sapien sem, aliquet nec, commodo eget, consequat quis, neque. Aliquam faucibus, elit ut dictum aliquet, felis nisl adipiscing sapien, sed malesuada diam lacus eget erat. Cras mollis scelerisque nunc. Nullam arcu. Aliquam consequat. Curabitur augue lorem, dapibus quis, laoreet et, pretium ac, nisi. Aenean magna nisl, mollis quis, molestie eu, feugiat in, orci. In hac habitasse platea dictumst.\n</div>\n<div>\n    Fusce convallis, mauris imperdiet gravida bibendum, nisl turpis suscipit mauris, sed placerat ipsum urna sed risus. In convallis tellus a mauris. Curabitur non elit ut libero tristique sodales. Mauris a lacus. Donec mattis semper leo. In hac habitasse platea dictumst. Vivamus facilisis diam at odio. Mauris dictum, nisi eget consequat elementum, lacus ligula molestie metus, non feugiat orci magna ac sem. Donec turpis. Donec vitae metus. Morbi tristique neque eu mauris. Quisque gravida ipsum non sapien. Proin turpis lacus, scelerisque vitae, elementum at, lobortis ac, quam. Aliquam dictum eleifend risus. In hac habitasse platea dictumst. Etiam sit amet diam. Suspendisse odio. Suspendisse nunc. In semper bibendum libero.\n</div>\n<div>\n    Proin nonummy, lacus eget pulvinar lacinia, pede felis dignissim leo, vitae tristique magna lacus sit amet eros. Nullam ornare. Praesent odio ligula, dapibus sed, tincidunt eget, dictum ac, nibh. Nam quis lacus. Nunc eleifend molestie velit. Morbi lobortis quam eu velit. Donec euismod vestibulum massa. Donec non lectus. Aliquam commodo lacus sit amet nulla. Cras dignissim elit et augue. Nullam non diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In hac habitasse platea dictumst. Aenean vestibulum. Sed lobortis elit quis lectus. Nunc sed lacus at augue bibendum dapibus.\n</div>\n<div>\n    Aliquam vehicula sem ut pede. Cras purus lectus, egestas eu, vehicula at, imperdiet sed, nibh. Morbi consectetuer luctus felis. Donec vitae nisi. Aliquam tincidunt feugiat elit. Duis sed elit ut turpis ullamcorper feugiat. Praesent pretium, mauris sed fermentum hendrerit, nulla lorem iaculis magna, pulvinar scelerisque urna tellus a justo. Suspendisse pulvinar massa in metus. Duis quis quam. Proin justo. Curabitur ac sapien. Nam erat. Praesent ut quam.\n</div>', 'Alpha 6000L', 19, '2016-05-09 23:16:58', 0, 1.00, 40.00),
(13, 'DSC-RX 100 M2', 'Compact', 'Fotocamere', 'Sony', 463.00, '<div>\n    Auto focusing (AF) modes: Contrast Detection Auto ...\n</div>', 'DSC-RX 100 M2', 23, '2016-05-09 23:16:58', 0, 1.00, 15.00),
(14, 'HDR-CX405', 'Digital', 'Videocamere', 'Sony', 229.00, '<div>\n    Fotocamera 20.2 MP, Sensore CMOS Exmo R da 1", Ott...\n</div>', 'HDR-CX405', 17, '2016-05-09 23:16:58', 100, 0.00, 0.00),
(15, 'HDR-AS200V', 'Digital', 'Videocamere', 'Sony', 232.00, '<div>\n   Riproduci fedelmente ogni aspetto della scena, anc...\n</div>', 'HDR-AS200V', 27, '2016-05-09 23:16:58', 0, 1.00, 20.00),
(16, 'NEX-VG10E', 'Digital', 'Videocamere', 'Sony', 799.00, '<div>\n    Video Full HD cinematografico con la flessibilità ...\n</div>', 'NEX-VG10E', 16, '2016-05-09 23:16:58', 100, 0.00, 0.00),
(17, 'HXR-MC2500', 'Digital', 'Videocamere', 'Sony', 1361.00, '                 <div>\n Sensore CMOS Exmor R da 4,6 mm retroilluminato, Ob...</div>', 'HXR-MC2500', 40, '2016-05-09 23:16:58', 0, 0.00, 0.00),
(18, 'LEGRIA HF R606', 'Video Full HD', 'Videocamere', 'Canon', 262.00, '                    <div>                       LDimensioni e/o peso: 5,3 x 5,8 x 11,6 cm ; 236 g\n                </div>\n', 'LEGRIA HF R606', 29, '2016-05-09 23:16:58', 0, 0.00, 0.00),
(19, 'XF100', 'Video Full HD', 'Videocamere', 'Canon', 1928.00, '<div>Dettagli:1 x batteria ricaricabile agli ioni di li...\n</div>', 'XF100', 45, '2016-05-09 23:16:58', 100, 0.00, 0.00),
(20, 'Legria HF G40', 'Video Full HD', 'Videocamere', 'Canon', 1200.00, '  \n                        <div>\n    La videocamera LEGRIA HF G40 offre qualità eccezio...             </div>', 'Legria HF G40', 13, '2016-05-09 23:16:58', 100, 1.00, 30.00),
(21, 'XC10', 'Video Full HD', 'Videocamere', 'Canon', 1950.00, '  \n                        <div>\n     Qualità d''immagine associata a videocamere profess...                </div>', 'XC10', 38, '2016-05-09 23:16:58', 0, 0.00, 0.00),
(22, 'LEGRIA MINI X', 'LightFlash', 'Videocamere', 'Canon', 386.00, '                    <div>\n  La videocamera LEGRIA mini X con Wi-Fi offre audio...            </div>', 'LEGRIA MINI X', 19, '2016-05-09 23:16:58', 0, 0.00, 0.00),
(23, 'HC-V160EG-K', 'LightFlash', 'Videocamere', 'Panasonic', 140.00, '  \n                        <div>\n       Videocamera Full HD/SD, intelligente zoom 75x (ott...              </div>', 'HC-V160EG-K', 50, '2016-05-09 23:16:58', 0, 0.00, 0.00),
(24, 'HDV-V7', 'LightFlash', 'Videocamere', 'Ordro', 84.00, '  \n                        <div>\n        Sensore: sensore CMOS da 5 megapixel, Max 24 mega ...             </div>', 'HDV-V7', 20, '2016-05-09 23:16:58', 0, 1.00, 10.00),
(25, 'SX900', 'LightFlash', 'Videocamere', 'Toshiba', 288.00, '  \n                        <div>\n      Risoluzione Full-Hd 1080P/30Fps-1080I/60Fps - 14 M...               </div>', 'SX900', 30, '2016-05-09 23:16:58', 0, 0.00, 0.00),
(26, 'AG-AC90', 'Digital', 'Videocamere', 'Panasonic', 1689.00, '<div>\n  Destinata ai professionsiti dell''immagine, la vide...              </div>', 'AG-AC90', 19, '2016-05-09 23:16:58', 0, 0.00, 0.00),
(27, 'Zoom Ottico EF-S', '', 'Accessori', 'Canon', 450.00, '        <div>\n   Obiettivo Grandangolare Con Ampia Escursione Focal...  </div>', 'Zoom Ottico EF-S', 34, '2016-05-09 23:16:58', 100, 0.00, 0.00),
(28, 'Caricatore LC-E6E', '', 'Accessori', 'Canon', 48.00, '<div>  Caricabatterie Lc-E6 Per Batterie Ricaricabili Agl...</div>', 'Caricatore LC-E6E', 20, '2016-05-09 23:16:58', 0, 0.00, 0.00),
(29, 'MicroSd 32GB MB', '', 'Accessori', 'Samsung', 14.00, 'Samsung MB-MP32D/EU Scheda Micro SD HC EVO, UHS-1,...', 'MicroSd 32GB MB', 18, '2016-05-09 23:16:58', 0, 0.00, 0.00),
(30, 'Lampada Fotografica', '', 'Accessori', 'Lightfox', 29.00, '        <div>\n  Grazie a questo kit di illuminazione per studio fo...\n        </div>', 'Lampada Fotografica', 30, '2016-05-09 23:16:58', 100, 0.00, 0.00),
(31, 'Treppiede Alpha 2500', '', 'Accessori', 'Cullmann', 30.00, '<div>Il treppiede ALPHA 2500 è stato concepito per i pr...</div>', 'Treppiede Alpha 2500', 18, '2016-05-09 23:16:58', 0, 0.00, 0.00),
(32, 'Supporto Videocamera', '', 'Accessori', 'Cablematic', 66.00, '<div>\n MagicRig di Aputure è una videocamera compatta o d...          </div>', 'Supporto Videocamera', 30, '2016-05-09 23:16:58', 0, 1.00, 12.00),
(33, 'Kit Accessori', '', 'Accessori', 'Canon', 92.00, '<div>\n  Kit di accessori per canon : EOS 700D 650D 600D 55...           </div>', 'Kit Accessori', 19, '2016-05-09 23:16:58', 0, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Struttura della tabella `sales`
--

CREATE TABLE `sales` (
  `sales_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` double(10,2) NOT NULL,
  `product_quantity` int(10) UNSIGNED NOT NULL,
  `sold_on` datetime NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `sales`
--

INSERT INTO `sales` (`sales_id`, `order_id`, `product_id`, `product_name`, `product_price`, `product_quantity`, `sold_on`, `user_id`) VALUES
(1, 1, 2, 'Eos 80D', 1284.00, 1, '2016-07-13 15:25:21', 1),
(2, 2, 2, 'Eos 80D', 1284.00, 4, '2016-07-13 16:19:42', 1),
(3, 2, 14, 'HDR-CX405', 229.00, 1, '2016-07-13 16:19:42', 1),
(4, 3, 2, 'Eos 80D', 1284.00, 1, '2016-07-13 16:27:29', 1),
(5, 4, 2, 'Eos 80D', 1284.00, 1, '2016-07-13 16:34:16', 1),
(6, 5, 2, 'Eos 80D', 1284.00, 1, '2016-07-13 16:37:12', 1),
(7, 6, 2, 'Eos 80D', 1284.00, 1, '2016-07-13 16:37:20', 1),
(8, 7, 2, 'Eos 80D', 1284.00, 1, '2016-07-13 16:37:31', 1),
(9, 8, 2, 'Eos 80D', 1284.00, 1, '2016-07-13 16:38:28', 1),
(10, 9, 2, 'Eos 80D', 1284.00, 1, '2016-07-13 16:54:42', 1),
(11, 10, 7, 'D3200', 399.00, 1, '2016-07-13 16:54:56', 1),
(12, 11, 2, 'Eos 80D', 1284.00, 1, '2016-07-13 16:58:18', 1),
(13, 12, 2, 'Eos 80D', 1284.00, 1, '2016-07-13 17:04:49', 1),
(14, 13, 2, 'Eos 80D', 1284.00, 1, '2016-07-13 17:05:16', 1),
(15, 14, 2, 'Eos 80D', 1284.00, 1, '2016-07-13 17:07:37', 1),
(16, 15, 2, 'Eos 80D', 1284.00, 2, '2016-07-13 17:18:02', 1),
(17, 16, 2, 'Eos 80D', 1284.00, 1, '2016-07-13 18:53:06', 29),
(18, 17, 2, 'Eos 80D', 1284.00, 1, '2016-07-13 18:55:37', 30),
(19, 18, 7, 'D3200', 199.50, 1, '2016-07-19 15:54:21', 29),
(20, 19, 2, 'Eos 80D', 1284.00, 1, '2016-07-20 12:58:38', 29),
(21, 19, 7, 'D3200', 199.50, 1, '2016-07-20 12:58:38', 29),
(22, 21, 7, 'D3200', 199.50, 2, '2016-07-20 13:39:00', 29),
(23, 21, 16, 'NEX-VG10E', 799.00, 1, '2016-07-20 13:39:00', 29),
(24, 22, 2, 'Eos 80D', 1284.00, 1, '2016-07-22 18:22:09', 29),
(25, 22, 7, 'D3200', 199.50, 1, '2016-07-22 18:22:09', 29),
(26, 23, 2, 'Eos 80D', 1284.00, 1, '2016-09-15 11:25:56', 35),
(27, 23, 7, 'D3200', 199.50, 1, '2016-09-15 11:25:56', 35),
(28, 24, 2, 'Eos 80D', 1284.00, 1, '2016-09-28 11:43:53', 29),
(29, 25, 2, 'Eos 80D', 12.84, 1, '2016-10-25 19:39:05', 29),
(30, 25, 7, 'D3200', 199.50, 1, '2016-10-25 19:39:05', 29),
(31, 26, 2, 'Eos 80D', 12.84, 1, '2016-11-15 16:22:53', 37),
(32, 27, 2, 'Eos 80D', 12.84, 1, '2016-11-28 17:35:22', 29),
(33, 28, 2, 'Eos 80D', 12.84, 4, '2018-07-16 12:08:29', 29);

-- --------------------------------------------------------

--
-- Struttura della tabella `sub-category`
--

CREATE TABLE `sub-category` (
  `subcategory_id` int(10) UNSIGNED NOT NULL,
  `sub-category_name` varchar(30) NOT NULL,
  `category_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `sub-category`
--

INSERT INTO `sub-category` (`subcategory_id`, `sub-category_name`, `category_name`) VALUES
(1, 'Reflex', 'Fotocamere'),
(2, 'Full HD', 'Fotocamere'),
(3, 'Compact', 'Fotocamere'),
(4, 'LightFlash', 'Videocamere'),
(5, 'Digital', 'Videocamere'),
(6, 'Video Full HD', 'Videocamere');

-- --------------------------------------------------------

--
-- Struttura della tabella `user`
--

CREATE TABLE `user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(50) NOT NULL,
  `pass` varchar(40) NOT NULL,
  `registeredOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `user`
--

INSERT INTO `user` (`user_id`, `email`, `pass`, `registeredOn`) VALUES
(29, 'gregorio@gmail.com', 'password', '2016-07-13 18:49:51'),
(30, 'saggese@gmail.com', 'password', '2016-07-13 18:53:47'),
(32, 'antonietta@gmail.com', 'password', '2016-07-19 17:11:54'),
(33, 'antonio@gmail.com', 'password', '2016-07-19 17:12:09'),
(35, 'prova1@gmail.com', '123456789', '2016-09-15 11:24:24'),
(36, 'ciro1@gmail.com', '123456789', '2016-09-26 15:48:40'),
(37, 'violetta_ale@hotmail.it', '123456789', '2016-11-15 16:19:13');

-- --------------------------------------------------------

--
-- Struttura della tabella `user-details`
--

CREATE TABLE `user-details` (
  `userDetail_Id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `mobile_no` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `citta` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `user-details`
--

INSERT INTO `user-details` (`userDetail_Id`, `user_id`, `username`, `mobile_no`, `address`, `gender`, `citta`) VALUES
(1, 29, 'gregorio', '222222222', 'wegwegwegwegweg', 'male', 'qweqwe'),
(2, 33, 'Antonio', '333123455', 'via ponte nuovo', 'male', 'Roma'),
(3, 32, 'Antonietta', '334567661', 'via lombardi 43', 'male', 'napoli'),
(4, 30, 'Saggese', '334566578', 'via pontare 45', 'male', 'san gregorio magn'),
(6, 36, 'ciro', '123456789', 'qweqweqweqwe', 'male', 'qweqweqweqwe');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indici per le tabelle `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indici per le tabelle `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`image-id`),
  ADD UNIQUE KEY `image-name` (`image-name`);

--
-- Indici per le tabelle `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indici per le tabelle `product-company`
--
ALTER TABLE `product-company`
  ADD PRIMARY KEY (`company-id`),
  ADD UNIQUE KEY `company-name` (`company-name`),
  ADD UNIQUE KEY `company-name_2` (`company-name`);

--
-- Indici per le tabelle `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `product-name` (`product-name`);

--
-- Indici per le tabelle `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sales_id`);

--
-- Indici per le tabelle `sub-category`
--
ALTER TABLE `sub-category`
  ADD PRIMARY KEY (`subcategory_id`),
  ADD UNIQUE KEY `sub-category_name` (`sub-category_name`);

--
-- Indici per le tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indici per le tabelle `user-details`
--
ALTER TABLE `user-details`
  ADD PRIMARY KEY (`userDetail_Id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `administrator`
--
ALTER TABLE `administrator`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT per la tabella `images`
--
ALTER TABLE `images`
  MODIFY `image-id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT per la tabella `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT per la tabella `product-company`
--
ALTER TABLE `product-company`
  MODIFY `company-id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT per la tabella `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT per la tabella `sales`
--
ALTER TABLE `sales`
  MODIFY `sales_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT per la tabella `sub-category`
--
ALTER TABLE `sub-category`
  MODIFY `subcategory_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT per la tabella `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT per la tabella `user-details`
--
ALTER TABLE `user-details`
  MODIFY `userDetail_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
