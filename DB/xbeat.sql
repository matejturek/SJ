-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hostiteľ: 127.0.0.1
-- Čas generovania: Út 05.Dec 2023, 20:52
-- Verzia serveru: 10.4.27-MariaDB
-- Verzia PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáza: `xbeat`
--

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `products` longtext DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `products`, `price`, `date`, `status`) VALUES
(6, 1, '[{\"id\":\"3\",\"tag\":\"hero-product\",\"tagline\":\"Featherweight for comfort all-day.\",\"heroImage\":\"/images/products/boat131-3.png\",\"images\":\"[\"/images/products/boat131-1.png\",\"/images/products/boat131-2.png\",\"/images/products/boat131-3.png\",\"/images/products/boat131-4.png\"]\",\"brand\":\"boAt\",\"title\":\"boAt Airdopes 131\",\"info\":\"Wireless In-Ear Earbuds\",\"category\":\"Earbuds\",\"type\":\"In Ear\",\"connectivity\":\"Wireless\",\"finalPrice\":\"1099\",\"originalPrice\":\"2990\",\"quantity\":\"1\",\"ratings\":\"1244\",\"rateCount\":\"5\",\"path\":\"/product-details/\"}]', '1099.00', '2023-11-29 16:26:20', 0),
(7, 1, '[{\"id\":\"3\",\"tag\":\"hero-product\",\"tagline\":\"Featherweight for comfort all-day.\",\"heroImage\":\"/images/products/boat131-3.png\",\"images\":\"[\"/images/products/boat131-1.png\",\"/images/products/boat131-2.png\",\"/images/products/boat131-3.png\",\"/images/products/boat131-4.png\"]\",\"brand\":\"boAt\",\"title\":\"boAt Airdopes 131\",\"info\":\"Wireless In-Ear Earbuds\",\"category\":\"Earbuds\",\"type\":\"In Ear\",\"connectivity\":\"Wireless\",\"finalPrice\":\"1099\",\"originalPrice\":\"2990\",\"quantity\":\"1\",\"ratings\":\"1244\",\"rateCount\":\"5\",\"path\":\"/product-details/\"}]', '1099.00', '2023-11-29 16:32:01', 0),
(8, 1, '[{\"id\":\"2\",\"tag\":\"featured-product\",\"tagline\":null,\"heroImage\":null,\"images\":\"[\"/images/products/boat518-1.png\",\"/images/products/boat518-2.png\",\"/images/products/boat518-3.png\",\"/images/products/boat518-4.png\"]\",\"brand\":\"boAt\",\"title\":\"boAt Rockerz 518\",\"info\":\"On-Ear Wireless Headphones\",\"category\":\"Headphones\",\"type\":\"On Ear\",\"connectivity\":\"Wireless\",\"finalPrice\":\"1299\",\"originalPrice\":\"3990\",\"quantity\":\"1\",\"ratings\":\"1321\",\"rateCount\":\"5\",\"path\":\"/product-details/\"}]', '1299.00', '2023-12-05 19:51:59', 0);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `tagline` varchar(255) DEFAULT NULL,
  `heroImage` varchar(255) DEFAULT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `brand` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `connectivity` varchar(255) DEFAULT NULL,
  `finalPrice` int(11) DEFAULT NULL,
  `originalPrice` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `ratings` int(11) DEFAULT NULL,
  `rateCount` int(11) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `products`
--

INSERT INTO `products` (`id`, `tag`, `tagline`, `heroImage`, `images`, `brand`, `title`, `info`, `category`, `type`, `connectivity`, `finalPrice`, `originalPrice`, `quantity`, `ratings`, `rateCount`, `path`) VALUES
(1, 'hero-product', 'Keep the noise out, or in. You choose.', '/images/products/jbl660nc-1.png', '[\"/images/products/jbl660nc-1.png\",\"/images/products/jbl660nc-2.png\",\"/images/products/jbl660nc-3.png\",\"/images/products/jbl660nc-4.png\"]', 'JBL', 'JBL Live 660NC', 'Wireless Over-Ear NC Headphones', 'Headphones', 'Over Ear', 'Wireless', 9999, 14999, 1, 1234, 5, '/product-details/'),
(2, 'featured-product', NULL, NULL, '[\"/images/products/boat518-1.png\",\"/images/products/boat518-2.png\",\"/images/products/boat518-3.png\",\"/images/products/boat518-4.png\"]', 'boAt', 'boAt Rockerz 518', 'On-Ear Wireless Headphones', 'Headphones', 'On Ear', 'Wireless', 1299, 3990, 1, 1321, 5, '/product-details/'),
(3, 'hero-product', 'Featherweight for comfort all-day.', '/images/products/boat131-3.png', '[\"/images/products/boat131-1.png\",\"/images/products/boat131-2.png\",\"/images/products/boat131-3.png\",\"/images/products/boat131-4.png\"]', 'boAt', 'boAt Airdopes 131', 'Wireless In-Ear Earbuds', 'Earbuds', 'In Ear', 'Wireless', 1099, 2990, 1, 1244, 5, '/product-details/'),
(4, NULL, NULL, NULL, '[\"/images/products/boat110-1.png\",\"/images/products/boat110-2.png\",\"/images/products/boat110-3.png\",\"/images/products/boat110-4.png\"]', 'boAt', 'boAt BassHeads 110', 'In-Ear Wired Earphones', 'Earphones', 'In Ear', 'Wired', 449, 999, 1, 556, 4, '/product-details/'),
(5, NULL, NULL, NULL, '[\"/images/products/boat410-1.png\",\"/images/products/boat410-2.png\",\"/images/products/boat410-3.png\",\"/images/products/boat410-4.png\"]', 'boAt', 'boAt Rockerz 410', 'Bluetooth & Wired On-Ear Headphones', 'Headphones', 'On Ear', 'Bluetooth & Wired', 1599, 2990, 1, 1563, 5, '/product-details/'),
(6, NULL, NULL, NULL, '[\"/images/products/jbl200bt-1.png\",\"/images/products/jbl200bt-2.png\",\"/images/products/jbl200bt-3.png\",\"/images/products/jbl200bt-4.png\"]', 'JBL', 'JBL Live 200BT', 'In-Ear Wireless Neckbands', 'Neckbands', 'In Ear', 'Wireless', 3699, 5299, 1, 836, 4, '/product-details/'),
(7, 'hero-product', 'Give your favourite music a boost.', '/images/products/sonyxb910n-1.png', '[\"/images/products/sonyxb910n-1.png\",\"/images/products/sonyxb910n-2.png\",\"/images/products/sonyxb910n-3.png\",\"/images/products/sonyxb910n-4.png\"]', 'Sony', 'Sony WH-XB910N', 'Wireless Over-Ear Headphones', 'Headphones', 'Over Ear', 'Wireless', 13489, 19990, 1, 679, 4, '/product-details/'),
(8, 'featured-product', NULL, NULL, '[\"/images/products/jbl760nc-1.png\",\"/images/products/jbl760nc-2.png\",\"/images/products/jbl760nc-3.png\",\"/images/products/jbl760nc-4.png\"]', 'JBL', 'JBL Tune 760NC', 'Wireless Over-Ear NC Headphones', 'Headphones', 'Over Ear', 'Wireless', 5999, 7999, 1, 755, 4, '/product-details/'),
(9, 'featured-product', NULL, NULL, '[\"/images/products/boat255r-1.png\",\"/images/products/boat255r-2.png\",\"/images/products/boat255r-3.png\",\"/images/products/boat255r-4.png\"]', 'boAt', 'boAt Rockerz 255', 'In-Ear Wireless Neckbands', 'Neckbands', 'In Ear', 'Wireless', 899, 2990, 1, 1464, 5, '/product-details/'),
(10, NULL, NULL, NULL, '[\"/images/products/jbl100-1.png\",\"/images/products/jbl100-2.png\",\"/images/products/jbl100-3.png\",\"/images/products/jbl100-4.png\"]', 'JBL', 'JBL Wave 100', 'In-Ear Truly Wireless Earbuds', 'Earbuds', 'In Ear', 'Wireless', 2999, 6999, 1, 801, 4, '/product-details/'),
(11, NULL, NULL, NULL, '[\"/images/products/sony1000xm4-1.png\",\"/images/products/sony1000xm4-2.png\",\"/images/products/sony1000xm4-3.png\",\"/images/products/sony1000xm4-4.png\"]', 'Sony', 'Sony WF-1000XM4', 'Wireless In-Ear NC Headphones', 'Earbuds', 'In Ear', 'Wireless', 19990, 24990, 1, 382, 3, '/product-details/'),
(12, NULL, NULL, NULL, '[\"/images/products/boat228-1.png\",\"/images/products/boat228-2.png\",\"/images/products/boat228-3.png\",\"/images/products/boat228-4.png\"]', 'boAt', 'boAt BassHeads 228', 'In-Ear Wired Earphones', 'Earphones', 'In Ear', 'Wired', 649, 1190, 1, 1178, 5, '/product-details/'),
(13, 'featured-product', NULL, NULL, '[\"/images/products/jbl-endu-1.png\",\"/images/products/jbl-endu-2.png\",\"/images/products/jbl-endu-3.png\",\"/images/products/jbl-endu-4.png\"]', 'JBL', 'JBL Endurance Run Sports', 'In-Ear Wired Earphones', 'Earphones', 'In Ear', 'Wired', 999, 1599, 1, 1144, 5, '/product-details/'),
(14, 'featured-product', NULL, NULL, '[\"/images/products/boat203-1.png\",\"/images/products/boat203-2.png\",\"/images/products/boat203-3.png\",\"/images/products/boat203-4.png\"]', 'boAt', 'boAt Airdopes 203', 'In-Ear Truly Wireless Earbuds', 'Earbuds', 'In Ear', 'Wireless', 1074, 3999, 1, 1340, 5, '/product-details/'),
(15, NULL, NULL, NULL, '[\"/images/products/sonych710n-1.png\",\"/images/products/sonych710n-2.png\",\"/images/products/sonych710n-3.png\",\"/images/products/sonych710n-4.png\"]', 'Sony', 'Sony WH-CH710N', 'Wireless Over-Ear NC Headphones', 'Headphones', 'Over Ear', 'Wireless', 8520, 14990, 1, 853, 4, '/product-details/'),
(16, NULL, NULL, NULL, '[\"/images/products/jbl500bt-1.png\",\"/images/products/jbl500bt-2.png\",\"/images/products/jbl500bt-3.png\",\"/images/products/jbl500bt-4.png\"]', 'JBL', 'JBL Tune 500BT', 'On-Ear Wireless Headphones', 'Headphones', 'On Ear', 'Wireless', 3282, 3999, 1, 364, 4, '/product-details/'),
(17, NULL, NULL, NULL, '[\"/images/products/boat381-1.png\",\"/images/products/boat381-2.png\",\"/images/products/boat381-3.png\",\"/images/products/boat381-4.png\"]', 'boAt', 'boAt Airdopes 381', 'In-Ear Wireless Earbuds', 'Earbuds', 'In Ear', 'Wireless', 1699, 4990, 1, 1011, 5, '/product-details/'),
(18, NULL, NULL, NULL, '[\"/images/products/sony-ex14ap-1.png\",\"/images/products/sony-ex14ap-2.png\",\"/images/products/sony-ex14ap-3.png\",\"/images/products/sony-ex14ap-4.png\"]', 'Sony', 'Sony MDR-EX14AP', 'In-Ear Wired Earphones', 'Earphones', 'In Ear', 'Wired', 549, 1290, 1, 530, 4, '/product-details/'),
(19, NULL, NULL, NULL, '[\"/images/products/sonyxb400-1.png\",\"/images/products/sonyxb400-2.png\",\"/images/products/sonyxb400-3.png\",\"/images/products/sonyxb400-4.png\"]', 'Sony', 'Sony WI-XB400', 'Wireless Extra Bass In-Ear Neckbands', 'Neckbands', 'In Ear', 'Wireless', 2690, 4990, 1, 474, 4, '/product-details/');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `review` text DEFAULT NULL,
  `rateCount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `reviews`
--

INSERT INTO `reviews` (`id`, `name`, `date`, `review`, `rateCount`) VALUES
(1, 'Atharva Kumar', '2022-08-04', 'Sound is awesome and as I expected, love it.', 5),
(2, 'Ritika Sen', '2022-07-15', 'Very good and awesome product', 5),
(3, 'Bhavesh Joshi', '2022-06-10', 'Super amazing product !!!', 4),
(4, 'Anandi Gupta', '2022-05-06', 'Great NC, sound is a bit flat', 4),
(5, 'Arif Khan', '2022-04-27', 'Very good but still has flaws!', 3);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`) VALUES
(1, 'admin', 'admin2', 'admin@gmail.com');

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexy pre tabuľku `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pre tabuľku `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pre tabuľku `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Obmedzenie pre exportované tabuľky
--

--
-- Obmedzenie pre tabuľku `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
