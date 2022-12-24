ALTER TABLE `users` ADD `bdev_donatorcoins` INT(255) NOT NULL DEFAULT '0';
ALTER TABLE `users` ADD `cases` VARCHAR(2555) NOT NULL DEFAULT '[]';
ALTER TABLE `users` ADD `containers` VARCHAR(2555) NOT NULL DEFAULT '[]';

CREATE TABLE `bdev_used_payments` (
  `id` int(11) NOT NULL,
  `usedby` varchar(2555) DEFAULT NULL,
  `transid` varchar(2555) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `bdev_used_payments`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `bdev_used_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;