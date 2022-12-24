CREATE TABLE `rv_housesys` (
    `id` int(11) NOT NULL,
    `owner` varchar(255) NOT NULL DEFAULT 'none',
    `ownerName` varchar(255) NOT NULL DEFAULT 'none',
    `interior_id` varchar(255) DEFAULT 'default',
    `closed` tinyint(1) NOT NULL DEFAULT '1',
    `customName` varchar(255) DEFAULT 'none',
    PRIMARY KEY(`id`)
);

CREATE TABLE `rv_housesys_keys` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `identifier` varchar(255) NOT NULL,
    `name` varchar(255) NOT NULL,
    `houseId` int(11) NOT NULL,
    PRIMARY KEY(`id`)
);