SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `nova_phone_bank_logs`;
CREATE TABLE `nova_phone_bank_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` text NOT NULL,
  `receiver` text NOT NULL,
  `amount` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `nova_phone_calllogs`;
CREATE TABLE `nova_phone_calllogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caller` text NOT NULL,
  `target` text NOT NULL,
  `accepted` tinyint(4) NOT NULL DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `nova_phone_contacts`;
CREATE TABLE `nova_phone_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` text NOT NULL,
  `name` text NOT NULL,
  `image` text NOT NULL,
  `notice` text NOT NULL,
  `number` text NOT NULL,
  `favorite` tinyint(4) NOT NULL DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `nova_phone_factionmotd`;
CREATE TABLE `nova_phone_factionmotd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `faction` text NOT NULL,
  `motd` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `nova_phone_frakbank`;
CREATE TABLE `nova_phone_frakbank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` int(11) NOT NULL,
  `faction` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `nova_phone_messages`;
CREATE TABLE `nova_phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` text NOT NULL,
  `number` text NOT NULL,
  `message` text NOT NULL,
  `isGPS` tinyint(4) NOT NULL DEFAULT 0,
  `isImage` tinyint(4) NOT NULL DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2074 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `nova_phone_snake`;
CREATE TABLE `nova_phone_snake` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player` text NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;