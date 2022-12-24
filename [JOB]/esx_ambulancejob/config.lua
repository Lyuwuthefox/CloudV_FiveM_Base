Config = {}

Config.Locale = 'de'

Config.DrawDistance = 20.0 -- How close do you need to be in order for the markers to be drawn (in GTA units).

Config.Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}

Config.ReviveReward = 50  -- Revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog = true -- Enable anti-combat logging? (Removes Items when a player logs back after intentionally logging out while dead.)
Config.LoadIpl = true -- Disable if you're using fivem-ipl or other IPL loaders

Config.EarlyRespawnTimer = 60000 * 1  -- time til respawn is available
Config.BleedoutTimer = 60000 * 10 -- time til the player bleeds out

Config.EnablePlayerManagement = false -- Enable society managing (If you are using esx_society).

Config.RemoveWeaponsAfterRPDeath = true
Config.RemoveCashAfterRPDeath = true
Config.RemoveItemsAfterRPDeath = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine = false
Config.EarlyRespawnFineAmount = 5000

Config.RespawnPoint = {
	coords = vector3(341.0, -1397.3, 32.5),
	heading = 48.5
}

Config.Hospitals = {
	CentralLosSantos = {
		Blip = {
			coords = vector3(307.7, -1433.4, 28.9),
			sprite = 61,
			scale = 1.0,
			color = 2
		},
		AmbulanceActions = {
			vector3(270.5, -1363.0, 23.5)
		},
		Pharmacies = {
			vector3(230.1, -1366.1, 38.5)
		},
		Vehicles = {
			{
				Spawner = vector3(307.7, -1433.4, 30.0),
				InsideShop = vector3(446.7, -1355.6, 43.5),
				Marker = {type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(297.2, -1429.5, 29.8), heading = 227.6, radius = 4.0},
					{coords = vector3(294.0, -1433.1, 29.8), heading = 227.6, radius = 4.0},
					{coords = vector3(309.4, -1442.5, 29.8), heading = 227.6, radius = 6.0}
				}
			}
		},
		Helicopters = {
			{
				Spawner = vector3(317.5, -1449.5, 46.5),
				InsideShop = vector3(305.6, -1419.7, 41.5),
				Marker = {type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(313.5, -1465.1, 46.5), heading = 142.7, radius = 10.0},
					{coords = vector3(299.5, -1453.2, 46.5), heading = 142.7, radius = 10.0}
				}
			}
		},
		FastTravels = {
		},
		FastTravelsPrompt = {
		}
	}
}

Config.AuthorizedVehicles = {
	car = {
		ambulance = {
			{model = 'ambulance', price = 5000}
		},
		doctor = {
			{model = 'ambulance', price = 4500}
		},
		chief_doctor = {
			{model = 'ambulance', price = 3000}
		},
		boss = {
			{model = 'ambulance', price = 2000}
		}
	},
	helicopter = {
		ambulance = {},
		doctor = {
			{model = 'buzzard2', price = 150000}
		},
		chief_doctor = {
			{model = 'buzzard2', price = 150000},
			{model = 'seasparrow', price = 300000}
		},
		boss = {
			{model = 'buzzard2', price = 10000},
			{model = 'seasparrow', price = 250000}
		}
	}
}
