-- Required SQL --

-- Create the Menu Player Table
CREATE TABLE IF NOT EXISTS `viority_menu_player` (
  `identifier` varchar(100) NOT NULL,
  `playtime_all` FLOAT DEFAULT 0.0,
  `playtime_walk` FLOAT DEFAULT 0.0,
  `playtime_drive` FLOAT DEFAULT 0.0,
  `playtime_swim` FLOAT DEFAULT 0.0,
  `player_shoots` FLOAT DEFAULT 0,
  `player_deaths` FLOAT DEFAULT 0,
  `job_since` varchar(100) DEFAULT "01.01.1990"
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create the Menu Events Table
CREATE TABLE IF NOT EXISTS `viority_menu_events` (
  `id` varchar(100) NOT NULL,
  `event_start` varchar(100) NOT NULL,
  `event_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create the Menu Invite Table
CREATE TABLE IF NOT EXISTS `viority_menu_invite` (
  `invite_code` varchar(100) NOT NULL,
  `owner` varchar(100) NOT NULL,
  `current_redeem_code` varchar(100) DEFAULT NULL,
  `current_redeemed` INT DEFAULT 0,
  `last_redeem_user` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Add the Key to Table Menu Player
ALTER TABLE `viority_menu_player`
  ADD PRIMARY KEY (`identifier`);

-- Add the Key to Events Table
ALTER TABLE `viority_menu_events`
  ADD PRIMARY KEY (`id`);

-- Add the Key to Invite Table
ALTER TABLE `viority_menu_invite`
  ADD PRIMARY KEY (`invite_code`);

-- © Copyright Viority Development 2022
-- No commercial use permitted
-- Copyright infringement can be punished by up to five years in prison and a $250,000 fine. Repeat offenders can be sentenced to up to ten years in prison.