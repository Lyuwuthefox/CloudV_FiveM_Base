ALTER TABLE `users` ADD COLUMN `inventory_slots` longtext NOT NULL DEFAULT '[]';
ALTER TABLE `owned_vehicles` ADD COLUMN `trunk` longtext NOT NULL DEFAULT '[]';