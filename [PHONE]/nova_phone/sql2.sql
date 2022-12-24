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

ALTER TABLE `nova_phone_contacts` ADD `image` text NOT NULL AFTER `name`;
ALTER TABLE `nova_phone_contacts` ADD `notice` text NOT NULL AFTER `image`;

ALTER TABLE `nova_phone_messages` ADD `isImage` tinyint(4) NOT NULL DEFAULT 0 AFTER `isGPS`;