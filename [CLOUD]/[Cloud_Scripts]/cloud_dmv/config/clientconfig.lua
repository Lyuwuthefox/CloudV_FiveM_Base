B_SERVICE = {}

B_SERVICE.DrawDistance = 30.0
B_SERVICE.MaxErrors = 5

B_SERVICE.Title = "FAHR <span>SCHULE</span>"
B_SERVICE.Subtitle = "CLOUD V"
B_SERVICE.Currency = "€"

B_SERVICE.SharedObject = {
	["Client"] = "esx:getSharedObject",
	["Server"] = "esx:getSharedObject",
}

B_SERVICE.Blip = {
	enabled = true, 
	sprite = 408,
	display = 4,
	scale = 0.7,
	color = 57,
	shortrange = true,
	text = "Fahrschule"
}

B_SERVICE.LicenseTrigger = {
	["getLicenses"] = "esx_license:getLicenses",
	["addLicense"] = "esx_license:addLicense"
}

B_SERVICE.SendNotify = function(color, title, message, time)
    TriggerEvent("sanity:notify", "FAHRSCHULE", message, 5000, "info")
end

B_SERVICE.Locales = {
	["title"] = "Fahrschule",
	["passed"] = "Test bestanden",
	["not_passed"] = "Test nicht bestanden",
	["finished"] = "Fahrprüfung abgeschlossen",
	["a_class"] = 'A Klasse | Praktische Prüfung | <span style="color:green;">%s€</span>',
	["b_class"] = 'B Klasse | Praktische Prüfung | <span style="color:green;">%s€</span>',
	["c_class"] = 'C Klasse | Praktische Prüfung | <span style="color:green;">%s€</span>',
	["theory"] = 'Theorie Prüfung | <span style="color:green;">%s€</span>',
	["not_enough_money"] = "Nicht genügend Geld",
	["press_e"] = "um auf die Fahrschule zuzugreifen",
	["too_fast"] = "Du fährst zu schnell, die Höchstgeschwindigkeit beträgt %s km/h!",
	["error_count"] = "Fehlerpunkte %s/%s",
	["damaged_vehicle"] = "Fahrzeug beschädigt!",
	["spawnpoint_not_free"] = "Spawnpunkt ist belegt. Bitte warte kurz!",
	["vehicle_plate"] = "DMV",
	["payed"] = "Du hast %s€ bezahlt.",
}

B_SERVICE.Prices = {
	dmv = 500,
	drive = 2000,
	drive_bike = 1000,
	drive_truck = 5000
}

B_SERVICE.VehicleModels = {
	drive = 'futo',
	drive_bike = 'sanchez',
	drive_truck = 'mule3'
}

B_SERVICE.SpeedLimits = {
	residence = 30,
	town = 100,
}

B_SERVICE.Zones = {
	DMVSchool = {
		Pos   = vector3(-810.49, -1351.93, 5.15),
		Size  = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 11, g = 154, b = 245},
		Type  = 32
	},

	VehicleSpawnPoint = {
		Pos   = {x = -815.43, y = -1319.06, z = 4.82, h = 168.66},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = -1
	}
}

B_SERVICE.CheckPoint = {
	Size  = {x = 1.0, y = 1.0, z = 1.0},
	Color = {r = 255, g = 0, b = 0, a = 100},
	Type  = 0
}

B_SERVICE.CheckPoints = {
	{
		Pos = {x = -814.81, y = -1329.13, z = 4.47},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			setCurrentZoneType('residence')
			DrawMissionText("Fahre weiter! ~r~Maximale Geschwindigkeit: ~s~" .. B_SERVICE.SpeedLimits['residence'] .. " km/h", 5000)
		end
	},

	{
		Pos = {x = -705.15, y = -1247.49, z = 9.67},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			setCurrentZoneType('town')

			Citizen.CreateThread(function()
				DrawMissionText("Stop Schild", 5000)
				PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
				FreezeEntityPosition(vehicle, true)
				Citizen.Wait(4000)

				FreezeEntityPosition(vehicle, false)
				DrawMissionText("Fahre weiter. ~r~Maximale Geschwindigkeit: ~s~" .. B_SERVICE.SpeedLimits['town'] .. " km/h", 5000)
			end)
		end
	},

	{
		Pos = {x = -725.25, y = -1561.57, z = 13.51},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText("Fahre weiter! ~r~Maximale Geschwindigkeit: ~s~" .. B_SERVICE.SpeedLimits['town'] .. " km/h", 5000)
		end
	},

	{
		Pos = {x = -970.54, y = -2148.38, z = 8.25},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText("Fahre weiter! ~r~Maximale Geschwindigkeit: ~s~" .. B_SERVICE.SpeedLimits['town'] .. " km/h", 5000)
			PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
			FreezeEntityPosition(vehicle, true)
			Citizen.Wait(3000)
			FreezeEntityPosition(vehicle, false)
		end
	},

	{
		Pos = {x = -941.98, y = -2122.63, z = 8.82},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			setCurrentZoneType('residence')

			DrawMissionText("Fahre weiter! ~r~Maximale Geschwindigkeit: ~s~" .. B_SERVICE.SpeedLimits['residence'] .. " km/h", 5000)
			PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
			FreezeEntityPosition(vehicle, true)
			Citizen.Wait(3000)
			FreezeEntityPosition(vehicle, false)
		end
	},

	{
		Pos = {x = -946.9, y = -2093.38, z = 8.77},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText("Parke nun das Fahrzeug rückwärts in die Box! ~r~Maximale Geschwindigkeit: ~s~" .. B_SERVICE.SpeedLimits['residence'] .. " km/h", 5000)
			PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
			FreezeEntityPosition(vehicle, true)
			Citizen.Wait(3000)
			FreezeEntityPosition(vehicle, false)
		end
	},

	{
		Pos = {x = -954.03, y = -2090.07, z = 8.78},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText("Fahre weiter! ~r~Maximale Geschwindigkeit: ~s~" .. B_SERVICE.SpeedLimits['residence'] .. " km/h", 5000)
			PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
			FreezeEntityPosition(vehicle, true)
			Citizen.Wait(3000)
			FreezeEntityPosition(vehicle, false)
		end
	},

	{
		Pos = {x = -945.7, y = -2122.06, z = 8.78},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			setCurrentZoneType('town')
			DrawMissionText("Fahre weiter! ~r~Maximale Geschwindigkeit: ~s~" .. B_SERVICE.SpeedLimits['town'] .. " km/h", 5000)
			PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
			FreezeEntityPosition(vehicle, true)
			Citizen.Wait(3000)
			FreezeEntityPosition(vehicle, false)
		end
	},

	{
		Pos = {x = -950.72, y = -2139.32, z = 8.47},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText("Vorsicht! Fußgänger! ~r~Maximale Geschwindigkeit: ~s~" .. B_SERVICE.SpeedLimits['town'] .. " km/h", 5000)
			PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
			FreezeEntityPosition(vehicle, true)
			Citizen.Wait(5000)
			FreezeEntityPosition(vehicle, false)
			DrawMissionText("Fahre weiter! ~r~Maximale Geschwindigkeit: ~s~" .. B_SERVICE.SpeedLimits['town'] .. " km/h", 5000)
		end
	},

	{
		Pos = {x = -675.9, y = -1471.97, z = 10.04},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText("Fahre weiter! ~r~Maximale Geschwindigkeit: ~s~" .. B_SERVICE.SpeedLimits['town'] .. " km/h", 5000)
		end
	},

	{
		Pos = {x = -637.21, y = -1278.23, z = 10.04},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText("Fahre weiter! ~r~Maximale Geschwindigkeit: ~s~" .. B_SERVICE.SpeedLimits['town'] .. " km/h", 5000)
		end
	},

	{
		Pos = {x = -682.99, y = -1228.08, z = 10.04},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText("Fahre weiter! ~r~Maximale Geschwindigkeit: ~s~" .. B_SERVICE.SpeedLimits['town'] .. " km/h", 5000)
		end
	},

	{
		Pos = {x = -702.48, y = -1236.37, z = 10.06},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			setCurrentZoneType('residence')
			DrawMissionText("Fahre weiter! ~r~Maximale Geschwindigkeit: ~s~" .. B_SERVICE.SpeedLimits['residence'] .. " km/h", 5000)
			PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
			FreezeEntityPosition(vehicle, true)
			Citizen.Wait(3000)
			FreezeEntityPosition(vehicle, false)
		end
	},

	{
		Pos = {x = -765.84, y = -1290.88, z = 4.48},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText("Fahre weiter! ~r~Maximale Geschwindigkeit: ~s~" .. B_SERVICE.SpeedLimits['residence'] .. " km/h", 5000)
		end
	},

	{
		Pos = {x = -802.19, y = -1325.47, z = 4.48},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText("Fahre weiter! ~r~Maximale Geschwindigkeit: ~s~" .. B_SERVICE.SpeedLimits['residence'] .. " km/h", 5000)
		end
	},

	{
		Pos = {x = -815.11, y = -1318.31, z = 4.48},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			ESX.Game.DeleteVehicle(vehicle)
		end
	}
}
