-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Час створення: Сер 17 2016 р., 12:15
-- Версія сервера: 5.6.30
-- Версія PHP: 5.5.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `myshop`
--

-- --------------------------------------------------------

--
-- Структура таблиці `Lot`
--

CREATE TABLE IF NOT EXISTS `Lot` (
  `lot_id` bigint(20) NOT NULL,
  `lot_name` varchar(100) NOT NULL,
  `lot_type` varchar(100) NOT NULL,
  `lot_price` double NOT NULL,
  `lot_country` varchar(100) NOT NULL,
  `lot_image` varchar(100) NOT NULL,
  `lot_imageBig` varchar(100) NOT NULL,
  `lot_description` text NOT NULL,
  `lot_descriptionBig` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `Lot`
--

INSERT INTO `Lot` (`lot_id`, `lot_name`, `lot_type`, `lot_price`, `lot_country`, `lot_image`, `lot_imageBig`, `lot_description`, `lot_descriptionBig`) VALUES
(1, 'Samsung Galaxy S6', 'smartphone', 127, 'South Korea', '/resources/images/phones/galaxy6.jpg', '/resources/images/phones/bigImg/galaxy6.jpg', 'Samsung Galaxy S6, Samsung Galaxy S6 Edge, and Samsung Galaxy S6 Edge+ are Android smartphones manufactured and marketed by Samsung Electronics. ', 'The Galaxy S6, S6 Edge and S6 Edge+ received mostly positive reviews from critics, who praised the devices'' upgraded build quality over prior models, along with improvements to their displays, performance, camera, and other changes. However, Samsung''s decision to remove the ability to expand their storage or remove the battery was panned as being potentially alienating to power users, and the S6 Edge was also panned for not making enough use of its curved display to justify its increased cost over the standard Samsung Galaxy S6 which resulted into the release of the bigger S6 Edge+ later on.'),
(2, 'Samsung Galaxy S7', 'smartphone', 199.99, 'South Korea', '/resources/images/phones/galaxy7.jpg', '/resources/images/phones/bigImg/galaxy7.jpg', 'Samsung Galaxy S7 and Samsung Galaxy S7 Edge are Android smartphones manufactured and marketed by Samsung Electronics. The S7 series is a successor to the 2015 ', 'Samsung Galaxy S7 and Samsung Galaxy S7 Edge are Android smartphones manufactured and marketed by Samsung Electronics. The S7 series is a successor to the 2015 Galaxy S6, S6 Edge and S6 Edge+, and was officially unveiled on 21 February 2016 during a Samsung press conference at Mobile World Congress, with a European and North American release scheduled for 11 March 2016. As with the S6, the S7 is produced in a standard model with a display size of 5.1 inches, as well as an Edge variant whose 5.5-inch display is curved along the wide sides of the screen.\r\n\r\nThe Galaxy S7 is an evolution of the prior year''s model, restoring features from the Galaxy S5 such as IP certification for water and dust resistance, as well as expandable storage.'),
(3, 'iPhone 5', 'smartphone', 112.39, 'USA', '/resources/images/phones/iphone5.jpg', '/resources/images/phones/bigImg/iphone5.jpg', 'The iPhone 5 is a smartphone that was designed and marketed by Apple Inc. It is the sixth generation of the iPhone, succeeding the iPhone 4S and preceding the iPhone 5S and iPhone 5C.', 'The iPhone 5 is a smartphone that was designed and marketed by Apple Inc. It is the sixth generation of the iPhone, succeeding the iPhone 4S and preceding the iPhone 5S and iPhone 5C. Formally unveiled as part of a press event on September 12, 2012, it was released on September 21, 2012. It was the first iPhone to be completely developed under the guidance of Tim Cook.\r\n\r\nThe iPhone 5 featured major design changes in comparison to its predecessor. These included an aluminum-based body which was thinner and lighter than previous models, a taller screen with a nearly 16:9 aspect ratio, the Apple A6 system-on-chip, LTE support, and Lightning, a new compact dock connector which replaced the 30-pin design used by previous iPhone models. This was the second Apple phone to include its new Sony made 8MP Camera, first introduced on the iPhone 4S.'),
(4, 'iPhone 6', 'smartphone', 169.99, 'USA', '/resources/images/phones/iphone6.jpg', '/resources/images/phones/bigImg/iphone6.jpg', 'The iPhone 6 and iPhone 6 Plus are smartphones designed and marketed by Apple Inc. The devices are part of the iPhone series and were announced on September 9, 2014, and released on September 19, 2014.', 'Big descriptionThe iPhone 6 and iPhone 6 Plus include a number of changes over their predecessor, including models with larger 4.7 and 5.5 inches (120 and 140 mm) displays, a faster processor, upgraded cameras, improved LTE and Wi-Fi connectivity and support for a near field communications-based mobile payments offering.\r\n\r\nPre-orders of the iPhone 6 and iPhone 6 Plus exceeded four million within its first 24 hours of availabilityâan Apple record. More than ten million iPhone 6 and iPhone 6 Plus devices were sold in the first three days, another Apple record.'),
(5, 'iPhone 6S', 'smartphone', 200.99, 'USA', '/resources/images/phones/iphone6s.jpg', '/resources/images/phones/bigImg/iphone6s.jpg', 'The iPhone 6S and iPhone 6S Plus (stylized as iPhone 6s and iPhone 6s Plus) are smartphones designed by Apple Inc. ', 'The iPhone 6S and iPhone 6S Plus are the performance versions over their respective predecessors, featuring improved hardware specifications, including 3D Touch, a force-sensitive touchscreen; upgraded rear-facing and front-facing cameras; a faster processor; a new chassis made of a stronger 7000 series aluminum alloy; second-generation fingerprint recognition Touch ID; improved LTE and Wi-Fi connectivity; and a new rose gold finish in addition to the space gray, silver, and gold finishes found on the previous models, while maintaining an identical design. The devices ship with iOS 9 preinstalled.');

-- --------------------------------------------------------

--
-- Структура таблиці `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
  `users_id` bigint(20) NOT NULL,
  `users_name` varchar(100) NOT NULL,
  `users_email` varchar(100) NOT NULL,
  `users_country` varchar(60) NOT NULL,
  `users_city` varchar(100) NOT NULL,
  `users_password` varchar(255) NOT NULL,
  `users_role` varchar(20) NOT NULL DEFAULT 'ROLE_USER',
  `enabled` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `Users`
--

INSERT INTO `Users` (`users_id`, `users_name`, `users_email`, `users_country`, `users_city`, `users_password`, `users_role`, `enabled`) VALUES
(1, 'Yuriy', 'yura@gmail.com', 'Ukraine', 'i', 'bc759e17ff6499e8537e1f34eac176f5', 'ROLE_ADMIN', 1);

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `Lot`
--
ALTER TABLE `Lot`
  ADD PRIMARY KEY (`lot_id`);

--
-- Індекси таблиці `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`users_id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `Lot`
--
ALTER TABLE `Lot`
  MODIFY `lot_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблиці `Users`
--
ALTER TABLE `Users`
  MODIFY `users_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
