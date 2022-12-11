CREATE TABLE `ws_clotheshop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(200) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `outfit` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`outfit`)),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;