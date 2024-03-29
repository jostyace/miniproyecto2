-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-03-2024 a las 14:56:46
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empresa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `correo_electronico` varchar(255) DEFAULT NULL,
  `dni` varchar(20) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombres`, `apellidos`, `direccion`, `correo_electronico`, `dni`, `edad`, `fecha_creacion`, `telefono`) VALUES
(2, 'Leshia', 'MacKeogh', '7 Melby Road', 'lmackeogh1@google.com.au', '72587416385', 51, '0000-00-00', '753-244-6440'),
(3, 'Shantee', 'Ayling', '7 Merry Terrace', 'sayling2@gizmodo.com', '22912003417', 31, '0000-00-00', '437-686-2885'),
(4, 'Darnall', 'Benkin', '87 Mariners Cove Place', 'dbenkin3@adobe.com', '13213485120', 55, '0000-00-00', '313-177-4947'),
(5, 'Virgilio', 'Larn', '25379 Namekagon Hill', 'vlarn4@tuttocitta.it', '17799700976', 31, '0000-00-00', '929-664-2969'),
(6, 'Caitlin', 'Nimmo', '58836 Esch Circle', 'cnimmo5@multiply.com', '82539890682', 56, '0000-00-00', '972-333-9807'),
(7, 'Elias', 'Wreiford', '1412 Erie Road', 'ewreiford6@jalbum.net', '69544722900', 55, '0000-00-00', '238-997-7271'),
(8, 'Cynthie', 'Gantzman', '3401 Melby Terrace', 'cgantzman7@newyorker.com', '24333860733', 45, '0000-00-00', '562-185-0073'),
(9, 'Abbe', 'Cain', '384 Redwing Terrace', 'acain8@addtoany.com', '47304992000', 37, '0000-00-00', '888-673-7645'),
(10, 'Yank', 'Toller', '5322 Montana Junction', 'ytoller9@walmart.com', '50424900238', 36, '0000-00-00', '580-541-7288'),
(11, 'Rosemarie', 'Melbourne', '0586 Crowley Point', 'rmelbournea@google.cn', '33453359636', 52, '0000-00-00', '328-724-2427'),
(12, 'Trenna', 'Laurens', '2 Tony Avenue', 'tlaurensb@usda.gov', '6906824307', 44, '0000-00-00', '165-322-6567'),
(13, 'Waylan', 'Maior', '2594 Northview Trail', 'wmaiorc@nydailynews.com', '71715538340', 44, '0000-00-00', '184-614-8902'),
(14, 'Avrit', 'Canet', '7 Stoughton Court', 'acanetd@webeden.co.uk', '94158069023', 32, '0000-00-00', '150-643-7667'),
(15, 'Zilvia', 'Daintith', '830 Dorton Avenue', 'zdaintithe@ovh.net', '74574211201', 60, '0000-00-00', '240-874-8780'),
(16, 'Deina', 'Flacknoe', '0483 Warbler Court', 'dflacknoef@acquirethisname.com', '65133481129', 39, '0000-00-00', '455-842-9193'),
(17, 'Aileen', 'Kienlein', '523 Ronald Regan Center', 'akienleing@storify.com', '8676102146', 52, '0000-00-00', '154-978-8517'),
(18, 'Deana', 'Aulds', '1389 Green Crossing', 'dauldsh@1688.com', '68610501355', 19, '0000-00-00', '366-960-7937'),
(19, 'Bartholomeo', 'Ibbotson', '214 Bultman Circle', 'bibbotsoni@artisteer.com', '87428903219', 44, '0000-00-00', '525-568-6194'),
(20, 'Price', 'Matoshin', '9 Crescent Oaks Hill', 'pmatoshinj@networkadvertising.org', '89524807553', 54, '0000-00-00', '837-513-3719'),
(21, 'Delcine', 'Borham', '055 Tennessee Crossing', 'dborhamk@ifeng.com', '55348296329', 32, '0000-00-00', '397-113-2299'),
(22, 'Mikol', 'O\'Doherty', '7954 Killdeer Alley', 'modohertyl@ftc.gov', '27222133051', 51, '0000-00-00', '696-946-3511'),
(23, 'Godfry', 'Chillcot', '60 Judy Pass', 'gchillcotm@tumblr.com', '55500239633', 49, '0000-00-00', '874-648-2890'),
(24, 'Percy', 'Konertz', '174 Oriole Crossing', 'pkonertzn@stanford.edu', '60407491798', 38, '0000-00-00', '475-481-6616'),
(25, 'Annaliese', 'Dudderidge', '512 Butterfield Terrace', 'adudderidgeo@mac.com', '78195385122', 43, '0000-00-00', '527-445-2185'),
(26, 'Fredericka', 'Growcock', '3 Jackson Street', 'fgrowcockp@ebay.com', '86435498188', 24, '0000-00-00', '313-676-1896'),
(27, 'Hayley', 'Naisbet', '228 Oak Avenue', 'hnaisbetq@ycombinator.com', '38108720716', 35, '0000-00-00', '838-446-0149'),
(28, 'Brandon', 'de Almeida', '46904 Porter Parkway', 'bdealmeidar@archive.org', '77427866506', 47, '0000-00-00', '602-412-2499'),
(29, 'Antony', 'Laurenzi', '7782 Grim Alley', 'alaurenzis@barnesandnoble.com', '50669991938', 39, '0000-00-00', '853-717-4791'),
(30, 'Timmy', 'Draisey', '657 Green Ridge Place', 'tdraiseyt@google.ca', '2424820560', 28, '0000-00-00', '116-241-9725'),
(31, 'Brandy', 'Langton', '73 La Follette Trail', 'blangtonu@digg.com', '42202978266', 25, '0000-00-00', '527-264-7753'),
(32, 'Brande', 'Murtagh', '7 Sullivan Hill', 'bmurtaghv@hugedomains.com', '75400831346', 27, '0000-00-00', '979-706-7455'),
(33, 'Natalya', 'Frere', '0 Prairie Rose Drive', 'nfrerew@pbs.org', '10638174358', 21, '0000-00-00', '117-446-4367'),
(34, 'Meggi', 'Clampe', '04 Swallow Parkway', 'mclampex@usa.gov', '36793536199', 36, '0000-00-00', '523-906-6084'),
(35, 'Ivette', 'Aggott', '0 Bowman Parkway', 'iaggotty@sitemeter.com', '5077476812', 50, '0000-00-00', '186-738-6776'),
(36, 'Puff', 'Enright', '29 Tony Street', 'penrightz@ox.ac.uk', '3943295600', 30, '0000-00-00', '541-773-5863'),
(37, 'Kristin', 'Fost', '98633 Elmside Trail', 'kfost10@jigsy.com', '86787569147', 53, '0000-00-00', '565-274-1803'),
(38, 'Emelda', 'Klampk', '50 Mandrake Avenue', 'eklampk11@yellowbook.com', '86830493588', 44, '0000-00-00', '212-989-1238'),
(39, 'Faustine', 'Truin', '6 Jackson Circle', 'ftruin12@163.com', '30473722015', 22, '0000-00-00', '183-105-2193'),
(40, 'Rahel', 'Sparrow', '01377 Elka Park', 'rsparrow13@addthis.com', '5171267386', 49, '0000-00-00', '210-846-2422'),
(41, 'Stoddard', 'Sabin', '9 Cottonwood Court', 'ssabin14@printfriendly.com', '4448468341', 20, '0000-00-00', '266-780-0006'),
(42, 'Emilie', 'Giamuzzo', '84795 Lawn Alley', 'egiamuzzo15@surveymonkey.com', '83497779124', 46, '0000-00-00', '396-773-2923'),
(43, 'Beilul', 'Rudolph', '702 Dahle Junction', 'brudolph16@dagondesign.com', '3639032754', 41, '0000-00-00', '895-195-7671'),
(44, 'Delinda', 'Wesley', '9357 Sycamore Junction', 'dwesley17@wiley.com', '82429959042', 24, '0000-00-00', '240-877-5658'),
(45, 'Jase', 'Purcell', '3 Hudson Hill', 'jpurcell18@sitemeter.com', '95515289796', 48, '0000-00-00', '979-653-5358'),
(46, 'Saree', 'Loosmore', '7967 Rockefeller Park', 'sloosmore19@goo.gl', '8454095970', 44, '0000-00-00', '738-313-2895'),
(47, 'Marena', 'O\'Loinn', '65 Clove Parkway', 'moloinn1a@a8.net', '38440767165', 26, '0000-00-00', '199-282-5540'),
(48, 'Chantalle', 'Thomann', '627 Waubesa Street', 'cthomann1b@dion.ne.jp', '6544474611', 52, '0000-00-00', '644-302-1406'),
(49, 'Christos', 'Biasioli', '813 Hagan Avenue', 'cbiasioli1c@princeton.edu', '38625226711', 29, '0000-00-00', '649-200-5492'),
(50, 'Feliks', 'Farrall', '36557 Lake View Drive', 'ffarrall1d@macromedia.com', '29748740271', 51, '0000-00-00', '132-430-0540'),
(51, 'Joseph', 'Yagual', 'Av. 10 y Luis R', 'jostyace@gmail.com', '2400011595', 32, '0000-00-00', '098-245-1264');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
