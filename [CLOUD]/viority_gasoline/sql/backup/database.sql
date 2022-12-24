-- Required SQL --

-- Create the gasoline_vehicles Table
CREATE TABLE IF NOT EXISTS `gasoline_vehicles` (
  `plate` varchar(60) NOT NULL,
  `type` varchar(60) NOT NULL,
  `fuel` varchar(60) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create the gasoline_vehicles Table
CREATE TABLE IF NOT EXISTS `gasoline_stations` (
  `id` varchar(60) NOT NULL,
  `FuelPrices` LONGTEXT DEFAULT '{"last_change":0,"SuperPlus":{"1":{"value":null,"change":null},"2":{"value":null,"change":null},"3":{"value":null,"change":null},"4":{"value":null,"change":null},"5":{"value":null,"change":null}},"Petrol":{"1":{"value":null,"change":null},"2":{"value":null,"change":null},"3":{"value":null,"change":null},"4":{"value":null,"change":null},"5":{"value":null,"change":null}},"Diesel":{"1":{"value":null,"change":null},"2":{"value":null,"change":null},"3":{"value":null,"change":null},"4":{"value":null,"change":null},"5":{"value":null,"change":null}}}',
  `FuelStock` LONGTEXT DEFAULT '{"last_change":0,"SuperPlus":{"value":100},"Petrol":{"value":100},"Diesel":{"value":100}}',
  `PromotionCode` LONGTEXT DEFAULT '{}',
  `BusinessData` LONGTEXT DEFAULT '{"IsAvailable":true,"Owner":null,"Statistics":{"AllCustomer":0,"RemainingTime":null,"TotalIncome":0,"TotalOutcome":0,"Chart":{"1":{"value":null,"change":null}}},"LastIncome":{},"LastOutcome":{}}',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- © Copyright Viority Development 2022
-- No commercial use permitted
-- Copyright infringement can be punished by up to five years in prison and a $250,000 fine. Repeat offenders can be sentenced to up to ten years in prison.