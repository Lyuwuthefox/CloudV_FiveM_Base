local ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) 
            ESX = obj 
        end)

        Citizen.Wait(0)
    end
end)


RegisterNetEvent('fixv')
AddEventHandler('fixv', function()
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed, false) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		SetVehicleEngineHealth(vehicle, 1000)
		SetVehicleEngineOn( vehicle, true, true )
		SetVehicleFixed(vehicle)
		TriggerEvent('b-notify:notify', 'success', 'Fahrzeug A-Repair', 'Das Fahrzeug in dem du dich befindest wurde vollständig Repariert!')
	else
        TriggerEvent('b-notify:notify', 'error', 'Fahrzeug A-Repair', 'Du sitzt in keinem Fahrzeug!')
	end
end)

RegisterNetEvent('clearv')
AddEventHandler('clearv', function()
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed, false) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		SetVehicleDirtLevel(vehicle, 0)
        TriggerEvent("cs_notify", "ADMIN DIENST", "Fahrzeug gesäubert", 'success', '5000')
	else
        TriggerEvent("cs_notify", "ADMIN DIENST", "Du sitzt in keinen Fahrzeug!", 'error', '5000')
	end
end)


--Anti Waffenschlag
Citizen.CreateThread(function()
    Citizen.Wait(0)
    if IsPedArmed(GetPlayerPed(-1), 6) then
        DisableControlAction(1, 140, true)
        DisableControlAction(1, 141, true)
        DisableControlAction(1, 142, true)
    end
end)



Citizen.CreateThread(function()
    while true 
    	do
		
		SetWeatherTypePersist("XMAS")
        SetWeatherTypeNowPersist("XMAS")
        SetWeatherTypeNow("XMAS")
        SetOverrideWeather("XMAS")
    	
		Citizen.Wait(1)
	end

end)



