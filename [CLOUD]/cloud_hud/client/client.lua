ESX = nil

CreateThread(function()
	while ESX == nil do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) Wait(0) end
	while ESX.GetPlayerData().job == nil do Wait(100) end
	ESX.PlayerData = ESX.GetPlayerData()
end)

-- Locals nicht ändern

local enableField = false
local food = 0
local water = 0
local playerLoaded = false

-- Events

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  ESX.PlayerData = xPlayer
  PlayerLoaded = true
end)

Citizen.CreateThread(function()
    while not PlayerLoaded do
        Citizen.Wait(2000)
        local player = PlayerPedId()
        local playerPos = GetEntityCoords(player, true)
        local zone = GetNameOfZone(playerPos.x, playerPos.y, playerPos.z)
        local id = GetPlayerServerId(PlayerId())

        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
            ESX.PlayerData = ESX.GetPlayerData()
        end)
        
        if isInGreenzone() then
            SendNUIMessage({action = "greenzone", data = true})
        else
            SendNUIMessage({action = "greenzone", data = false})
        end

        jobGrade = ESX.PlayerData.job.grade_label
        jobLabel = ESX.PlayerData.job.label
        SendNUIMessage({action = 'update', id = id, location = GetLabelText(zone), job = jobLabel, grade = jobGrade,})
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        local player = PlayerPedId()

        if IsPedArmed(player, 6) then
            local weapon = GetSelectedPedWeapon(player)
            local ammoTotal = GetAmmoInPedWeapon(player,weapon)
            local bool,ammoClip = GetAmmoInClip(player,weapon)
            local ammoRemaining = math.floor(ammoTotal - ammoClip)
            
            SendNUIMessage({action = 'wArmed',type = 'waffe', ammoClip = ammoClip,ammoRemaining = ammoRemaining})
        else
            SendNUIMessage({action = 'wArmed'})
        end
    end
end)

Citizen.CreateThread(function()
    while not PlayerLoaded do 
        Citizen.Wait(0)
    end
    while PlayerLoaded do
        Citizen.Wait(2000)
        local player = PlayerPedId()
        local playerPos = GetEntityCoords(player, true)
        local zone = GetNameOfZone(playerPos.x, playerPos.y, playerPos.z)
        local id = GetPlayerServerId(PlayerId())

        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
            ESX.PlayerData = ESX.GetPlayerData()
        end)

        if IsPedArmed(player, 6) then
            local weapon = GetSelectedPedWeapon(player)
            local ammoTotal = GetAmmoInPedWeapon(player,weapon)
            local bool,ammoClip = GetAmmoInClip(player,weapon)
            local ammoRemaining = math.floor(ammoTotal - ammoClip)
            
            SendNUIMessage({action = 'wArmed',type = 'waffe', ammoClip = ammoClip,ammoRemaining = ammoRemaining})
        else
            SendNUIMessage({action = 'wArmed'})
        end
        
        if isInGreenzone() then
            SendNUIMessage({action = "greenzone", data = true})
        else
            SendNUIMessage({action = "greenzone", data = false})
        end

        jobGrade = ESX.PlayerData.job.grade_label
        jobLabel = ESX.PlayerData.job.label
        SendNUIMessage({action = 'update', id = id, location = GetLabelText(zone), job = jobLabel, grade = jobGrade,})
        SendNUIMessage({action = "setVoiceLevel", level = 1})
    end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  ESX.PlayerData.job = job
end)

-- Locals kannst du ändern

local greenzone = {
	{ x = -1104.751953125, y = -2826.4130859375, z = 27.708744049072},
    {x = 194.4851, y =  -933.9938, z = 30.6868}
}

-- Versteckt hud
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(300)
		if IsPauseMenuActive() then -- ESC Key
            toggleField(false)
		else
            toggleField(true)
			HideHudComponentThisFrame(1)  -- Wanted Stars
			HideHudComponentThisFrame(2)  -- Weapon Icon
			HideHudComponentThisFrame(3)  -- Cash
			HideHudComponentThisFrame(4)  -- MP Cash
			HideHudComponentThisFrame(6)  -- Vehicle Name
			HideHudComponentThisFrame(7)  -- Area Name
			HideHudComponentThisFrame(8)  -- Vehicle Class
			HideHudComponentThisFrame(9)  -- Street Name
			HideHudComponentThisFrame(13) -- Cash Change
			HideHudComponentThisFrame(17) -- Save Game
			HideHudComponentThisFrame(20) -- Weapon Stats
		end
	end
end)

-- Player status
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
    --Money 
        local data = ESX.GetPlayerData()
        local accounts = data.accounts
        local ply = PlayerPedId()
            
        if (accounts ~= nil) then -- condition
            for k, v in pairs(accounts) do
                if v.name == "money" then
                    SendNUIMessage({action = "setMoney", money = v.money})
                end
            end
        end
    end
end)

-- Vehicle status
Citizen.CreateThread(function()
    local sleep = 1000

	while true do
		Citizen.Wait(sleep)
        --Money 
        local ply = PlayerPedId()
        if IsPedInAnyVehicle(ply) then
            sleep = 0
            local veh = GetVehiclePedIsUsing(ply)
            local fuel = GetVehicleFuelLevel(veh)
            local carSpeed = math.ceil(GetEntitySpeed(veh) * 3.6)
            local vehicleIsOn = GetIsVehicleEngineRunning(veh)
            local _, lightsOne, lightsTwo = GetVehicleLightsState(veh)
            local lockStatus = GetVehicleDoorLockStatus(veh)

            if lockStatus == 1 or lockStatus == 0 then -- unlocked    
                SendNUIMessage({action = 'vehicle',type = 'doors',isOn = false})
            elseif lockStatus == 2 then -- locked
                SendNUIMessage({action = 'vehicle',type = 'doors',isOn = true})
            end


            if (lightsOne == 1 and lightsTwo == 0) then
                SendNUIMessage({ action = 'vehicle',  type = 'lights', isOn = true})
            elseif (lightsOne == 1 and lightsTwo == 1) or (lightsOne == 0 and lightsTwo == 1) then
                SendNUIMessage({   action = 'vehicle', type = 'lights',  isOn = true })
            else
                SendNUIMessage({   action = 'vehicle',   type = 'lights', isOn = false})
            end

            SendNUIMessage({   action = 'vehicle',   type = 'inside',   fuelLevel = fuel,  speedLevel = carSpeed })
            if vehicleIsOn then
                SendNUIMessage({  action = 'vehicle',  type = 'engine', isOn = true })
            else
                SendNUIMessage({  action = 'vehicle',  type = 'engine', isOn = false})
            end
        else
            sleep = 1000
            SendNUIMessage({action = 'vehicle'})
        end
    end
end)

-- Player food Status
Citizen.CreateThread(function()
    while true do
        if food >= 0 and food <= 5 then
            SendNUIMessage({action = 'food',data = 0})
        elseif food >= 6 and food <= 25 then
            SendNUIMessage({action = 'food',data = 1})
        elseif food >= 26 and food <= 50 then
            SendNUIMessage({action = 'food',data = 2})
        elseif food >= 51 and food <= 75 then
            SendNUIMessage({action = 'food',data = 3})
        elseif food >= 76 and food <= 100 then
            SendNUIMessage({action = 'food',data = 4})
        end

        if water >= 0 and water <= 5 then
            SendNUIMessage({action = 'water',data = 0})
        elseif water >= 6 and water <= 25 then
            SendNUIMessage({action = 'water',data = 1})
        elseif water >= 26 and water <= 50 then
            SendNUIMessage({action = 'water',data = 2})
        elseif water >= 51 and water <= 75 then
            SendNUIMessage({action = 'water',data = 3})
        elseif water >= 76 and water <= 100 then
            SendNUIMessage({action = 'water',data = 4})
        end

        TriggerEvent('esx_status:getStatus', 'hunger', function(hunger)
            TriggerEvent('esx_status:getStatus', 'thirst', function(thirst)
              food = hunger.getPercent()
              water = thirst.getPercent()
            end)
        end)
        Citizen.Wait(10000)
    end
end)

-- Funktionen

function isInGreenzone() 
    local pos = GetEntityCoords(PlayerPedId())
    for _, search in pairs(greenzone) do
        local dist = GetDistanceBetweenCoords(search.x, search.y, search.z, pos.x, pos.y, pos.z, true)

        if dist <= 101.0 then
            return true
        end
    end
end

function toggleField(enable)
    enableField = enable
    if enable then
        SendNUIMessage({
            action = 'open',
        })
    else
        SendNUIMessage({
            type= "ui",
            action = 'close',
        })
    end
end

-- Brauchbare Events und Commands

RegisterCommand("announce", function(source, args)
    SendNUIMessage({
        action = 'announce',
        text = table.concat( args, " "),
        time = 14500,
    })
end)

RegisterNetEvent("sanity:loadingbar")
AddEventHandler("sanity:loadingbar", function(duartion,message)
    SendNUIMessage({action = 'loadingbar',loadingTime = duration,text = message})
end)

RegisterCommand("notify", function(source, args)
    --print(1)
    TriggerEvent("sanity:notify", "ERROR", "error Test Nachricht", 1500, "error")
    TriggerEvent("sanity:notify", "SUCCESS", "success Test Nachricht", 2500, "success")
    TriggerEvent("sanity:notify", "WARNING", "Warning Test Nachricht", 3500, "warning")
    TriggerEvent("sanity:notify", "INFO", "Info Test Nachricht", 4500, "info")
end)

RegisterNetEvent("sanity:notify")
AddEventHandler("sanity:notify", function(title, message, duration, typee)
    if typee == 'info' then
        SendNUIMessage({
            action = 'notify',
            title = title,
            message = message,
            duration = duration,
            img = 'info.png',
            color = "rgba(16, 137, 238, 0.15)",
            bgcolor = "linear-gradient(90deg, #001F33 0%, rgba(0, 31, 51, 0) 100%)",
            notivalueDuration = "progres "..duration + 400 .."ms infinite linear"
        })
    elseif typee == 'error' then
        SendNUIMessage({
            action = 'notify',
            title = title,
            message = message,
            duration = duration,
            img = 'cancel.png',
            color = "rgba(238, 16, 16, 0.15)",
            bgcolor = "linear-gradient(90deg, #330000 0%, rgba(51, 0, 0, 0) 100%)",
            notivalueDuration = "progres "..duration + 400 .."ms infinite linear"
        })
    elseif typee == 'warning' then
        SendNUIMessage({
            action = 'notify',
            title = title,
            message = message,
            duration = duration,
            img = 'warning.png',
            color = "rgba(255, 197, 0, 0.15)",
            bgcolor = "	linear-gradient(90deg, #302500 0%, rgba(48, 37, 0, 0) 100%)",
            notivalueDuration = "progres "..duration + 400 .."ms infinite linear"
        })
    elseif typee == 'success' then
        SendNUIMessage({
            action = 'notify',
            title = title,
            message = message,
            duration = duration,
            img = 'success.png',
            color = "rgba(11, 245, 77, 0.15)",
            bgcolor = "linear-gradient(90deg, #002E0D 0%, rgba(0, 33, 9, 0) 100%)",
            notivalueDuration = "progres "..duration + 400 .."ms infinite linear"
        })
    end
end)

RegisterNetEvent("sanity:helpnotify")
AddEventHandler("sanity:helpnotify", function(message)
    SendNUIMessage({action = "helpnotify", text = message})
end)

RegisterNetEvent('SaltyChat_SetVoiceRange')
AddEventHandler('SaltyChat_SetVoiceRange', function(voiceRange)
	if micmuted == false then
        if voiceRange == 3 then
			SendNUIMessage({action = "setVoiceLevel", level = 1})
			voicelevel = 1
		end
        if voiceRange == 8 then
			SendNUIMessage({action = "setVoiceLevel", level = 2})
			voicelevel = 2
		end
        if voiceRange == 15 then
			SendNUIMessage({action = "setVoiceLevel", level = 3})
			voicelevel = 3
		end
        if voiceRange == 32 then
			SendNUIMessage({action = "setVoiceLevel", level = 4})
			voicelevel = 4
		end
    end
end)
