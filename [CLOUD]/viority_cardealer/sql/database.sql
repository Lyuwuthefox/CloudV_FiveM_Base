-- Required SQL --

-- Create the cardealer_prices Table
CREATE TABLE IF NOT EXISTS `cardealer_prices` (
  `id` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` varchar(60) NOT NULL,
  `time` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create the cardealer_categories Table
CREATE TABLE IF NOT EXISTS `cardealer_categories` (
  `id` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create the cardealer_vehicles Table
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop` varchar(60) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  `model` varchar(60) NOT NULL,
  `min_price` int(11) NOT NULL,
  `max_price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create the cardealer_billing Table
CREATE TABLE IF NOT EXISTS `cardealer_billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(60) NOT NULL,
  `plate` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `type` varchar(60) NOT NULL,
  `data` LONGTEXT NOT NULL,
  `status` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert Categories
INSERT INTO `cardealer_categories` (id, label) VALUES
  ('classic_cars', 'Classic Cars'),
  ('motorcycle', 'Motorcycle'),
  ('transport', 'Pick-Ups'),
  ('boat', 'Boats'),
  ('plane', 'Planes'),
  ('helicopter', 'Helicopter')
;

-- Insert Vehicles
INSERT INTO `cardealer_vehicles` (shop, category, model, min_price, max_price) VALUES
    
   -- Classic Cars
  ('classic_cars', 'classic_cars', 'blade', 15000, 25000),
  ('classic_cars', 'classic_cars', 'buccaneer2', 25000, 45000),
  ('classic_cars', 'classic_cars', 'chino', 15000, 35000),
  ('classic_cars', 'classic_cars', 'chino2', 25000, 45000),
  ('classic_cars', 'classic_cars', 'coquette3', 55000, 85000),
  ('classic_cars', 'classic_cars', 'dominator', 25000, 45000),
  ('classic_cars', 'classic_cars', 'gauntlet', 25000, 55000),
  ('classic_cars', 'classic_cars', 'phoenix', 12500, 25000),
  ('classic_cars', 'classic_cars', 'picador', 12500, 25000),
  ('classic_cars', 'classic_cars', 'slamvan3', 12500, 25000),
  ('classic_cars', 'classic_cars', 'tampa', 16500, 35000),
  ('classic_cars', 'classic_cars', 'vigero', 12500, 25000),
  ('classic_cars', 'classic_cars', 'voodoo', 7500, 15000),
  ('classic_cars', 'classic_cars', 'blista', 9500, 20000),
  ('classic_cars', 'classic_cars', 'brioso', 12500, 35000),
  ('classic_cars', 'classic_cars', 'issi2', 12500, 25000),
  ('classic_cars', 'classic_cars', 'panto', 12500, 25000),
  ('classic_cars', 'classic_cars', 'prairie', 12500, 30000),
  ('classic_cars', 'classic_cars', 'minivan', 12500, 30000),
  ('classic_cars', 'classic_cars', 'cognoscenti', 35500, 50000),
  ('classic_cars', 'classic_cars', 'fugitive', 12500, 25000),
  ('classic_cars', 'classic_cars', 'dubsta2', 42500, 65000),
  ('classic_cars', 'classic_cars', 'fq2', 12500, 25000),
  ('classic_cars', 'classic_cars', 'granger', 42500, 75000),
  ('classic_cars', 'classic_cars', 'huntley', 42500, 75000),
  ('classic_cars', 'classic_cars', 'landstalker', 32500, 65000),
  ('classic_cars', 'classic_cars', 'rocoto', 42500, 75000),
  ('classic_cars', 'classic_cars', 'brawler', 32500, 75000),
  ('classic_cars', 'classic_cars', 'dubsta3', 52500, 95000),
  ('classic_cars', 'classic_cars', 'sandking', 32500, 75000),
  ('classic_cars', 'classic_cars', 'bestiagts', 55000, 125000),
  ('classic_cars', 'classic_cars', 'buffalo2', 35000, 80000),
  ('classic_cars', 'classic_cars', 'carbonizzare', 85000, 150000),
  ('classic_cars', 'classic_cars', 'coquette', 65000, 100000),
  ('classic_cars', 'classic_cars', 'elegy2', 45000, 100000),
  ('classic_cars', 'classic_cars', 'feltzer2', 55000, 100000),
  ('classic_cars', 'classic_cars', 'furoregt', 45000, 100000),
  ('classic_cars', 'classic_cars', 'fusilade', 55000, 100000),
  ('classic_cars', 'classic_cars', 'jester', 85000, 150000),
  ('classic_cars', 'classic_cars', 'khamelion', 55000, 150000),
  ('classic_cars', 'classic_cars', 'lynx', 65000, 125000),
  ('classic_cars', 'classic_cars', 'massacro', 65000, 125000),
  ('classic_cars', 'classic_cars', 'adder', 125000, 225000),
  ('classic_cars', 'classic_cars', 'fmj', 125000, 225000),
  ('classic_cars', 'classic_cars', 'osiris', 125000, 225000),
  ('classic_cars', 'classic_cars', 'pfister811', 125000, 225000),
  ('classic_cars', 'classic_cars', 'reaper', 150000, 225000),
  ('classic_cars', 'classic_cars', 't20', 150000, 225000),
  ('classic_cars', 'classic_cars', 'turismor', 150000, 225000),
  ('classic_cars', 'classic_cars', 'voltic', 150000, 225000),
  ('classic_cars', 'classic_cars', 'zentorno', 150000, 225000),
  ('classic_cars', 'classic_cars', 'visione', 150000, 225000),
  ('classic_cars', 'classic_cars', 'raiden', 150000, 225000),
  ('classic_cars', 'classic_cars', 'pariah', 150000, 225000),
  ('classic_cars', 'classic_cars', 'neon', 150000, 225000),

   -- Motorcycles
  ('classic_cars', 'motorcycle', 'akuma', 7500, 10000),
  ('classic_cars', 'motorcycle', 'avarus', 15000, 20000),
  ('classic_cars', 'motorcycle', 'bagger', 12500, 15000),
  ('classic_cars', 'motorcycle', 'bati', 12500, 20000),
  ('classic_cars', 'motorcycle', 'bati2', 15000, 45000),
  ('classic_cars', 'motorcycle', 'bf400', 6500, 10000),
  ('classic_cars', 'motorcycle', 'carbonrs', 12500, 18500),
  ('classic_cars', 'motorcycle', 'cliffhanger', 8500, 18500),
  ('classic_cars', 'motorcycle', 'daemon', 11500, 17500),
  ('classic_cars', 'motorcycle', 'defiler', 12500, 21500),
  ('classic_cars', 'motorcycle', 'double', 15000, 25000),
  ('classic_cars', 'motorcycle', 'faggio2', 2500, 5000),
  ('classic_cars', 'motorcycle', 'gargoyle', 15000, 25000),
  ('classic_cars', 'motorcycle', 'hakuchou', 25000, 35000),
  ('classic_cars', 'motorcycle', 'manchez', 5000, 8500),
  ('classic_cars', 'motorcycle', 'nemesis', 5000, 9500),
  ('classic_cars', 'motorcycle', 'sanchez2', 5000, 11500),
  ('classic_cars', 'motorcycle', 'sanctus', 17500, 30000),
  ('classic_cars', 'motorcycle', 'thrust', 15000, 30000),
  ('classic_cars', 'motorcycle', 'vader', 7500, 15000),
  ('classic_cars', 'motorcycle', 'zombieb', 9500, 15000),

  -- Transporter
  ('transporter_cars', 'transport', 'bison', 45000, 60000),
  ('transporter_cars', 'transport', 'bobcatxl', 35000, 60000),
  ('transporter_cars', 'transport', 'gburrito2', 35000, 60000),
  ('transporter_cars', 'transport', 'moonbeam', 25000, 60000),
  ('transporter_cars', 'transport', 'rumpo3', 25000, 60000),
  ('transporter_cars', 'transport', 'youga', 25000, 60000),
  ('transporter_cars', 'transport', 'benson', 15000, 60000),
  ('transporter_cars', 'transport', 'guardian', 35000, 60000),

  -- Boats
  ('boat_shop', 'boat', 'dinghy4', 25000, 50000),
  ('boat_shop', 'boat', 'jetmax', 30000, 65000),
  ('boat_shop', 'boat', 'marquis', 60000, 120000),
  ('boat_shop', 'boat', 'seashark3', 15000, 30000),
  ('boat_shop', 'boat', 'speeder', 30000, 65000),
  ('boat_shop', 'boat', 'toro2', 30000, 65000),

  -- Planes
  ('aircraft_shop', 'plane', 'cuban800', 250000, 500000),
  ('aircraft_shop', 'plane', 'dodo', 350000, 600000),
  ('aircraft_shop', 'plane', 'howard', 600000, 900000),
  ('aircraft_shop', 'plane', 'luxor', 950000, 1500000),
  ('aircraft_shop', 'plane', 'luxor2', 3500000, 6500000),
  ('aircraft_shop', 'plane', 'mammatus', 350000, 600000),
  ('aircraft_shop', 'plane', 'nimbus', 950000, 1500000),
  ('aircraft_shop', 'plane', 'velum2', 350000, 600000),
  ('aircraft_shop', 'plane', 'vestra', 600000, 900000),

  -- Helicopter
  ('aircraft_shop', 'helicopter', 'frogger', 600000, 900000),
  ('aircraft_shop', 'helicopter', 'maverick', 600000, 900000),
  ('aircraft_shop', 'helicopter', 'supervolito', 950000, 1500000),
  ('aircraft_shop', 'helicopter', 'swift', 950000, 1500000),
  ('aircraft_shop', 'helicopter', 'swift2', 3500000, 6500000),
  ('aircraft_shop', 'helicopter', 'volatus', 1500000, 3500000)
;

-- Alter the user Table
ALTER TABLE `users` ADD COLUMN `VIPLeasing` tinyint(4) NOT NULL DEFAULT 0;

-- © Copyright Viority Development 2022
-- No commercial use permitted
-- Copyright infringement can be punished by up to five years in prison and a $250,000 fine. Repeat offenders can be sentenced to up to ten years in prison.