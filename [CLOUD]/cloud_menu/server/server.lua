ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("shino_xmenu:giveMoneyToPlayer")
AddEventHandler("shino_xmenu:giveMoneyToPlayer", function(id, value)
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(src)

    if id == -1 or id == "-1" then 
        DropPlayer(src, "🤡")
        return
    end

    if value < 0 then 
        return 
    end

    if xPlayer then 
        local target = tonumber(id)
        local amount = tonumber(value)

        if target ~= nil and amount ~= nil then
            local xTarget = ESX.GetPlayerFromId(target)
            
            if xTarget then
                local dist = #(GetEntityCoords(GetPlayerPed(src)) - GetEntityCoords(GetPlayerPed(target)))

                if dist < 2 then 
                    if xPlayer.getMoney() >= amount then 
                        xPlayer.removeMoney(amount)
                        xTarget.addMoney(amount)
                        TriggerClientEvent("shino_xmenu:notify", src, "Du hast " .. xTarget.getName() .. " " .. amount .. "$ gegeben")
                        TriggerClientEvent("shino_xmenu:notify", target, "Du hast von " .. xPlayer.getName() .. " " .. amount .. "$ bekommen")
                    else
                        TriggerClientEvent("shino_xmenu:notify", src, "Du hast nicht genug Geld dabei")
                    end
                end
            else
                TriggerClientEvent("shino_xmenu:notify", src, "Die ID wurde nicht gefunden")
            end
        else
            TriggerClientEvent("shino_xmenu:notify", src, "Es ist ein Fehler aufgetreten")
        end
    end
end)

RegisterServerEvent("shino_xmenu:cuffPlayer")
AddEventHandler("shino_xmenu:cuffPlayer", function(id)
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(src)

    if id == -1 or id == "-1" then 
        DropPlayer(src, "🤡")
        return
    end

    if xPlayer then 
        local target = tonumber(id)

        if target ~= nil then
            local xTarget = ESX.GetPlayerFromId(target)
            
            if xTarget then
                local dist = #(GetEntityCoords(GetPlayerPed(src)) - GetEntityCoords(GetPlayerPed(target)))

                if dist < 2 then 
                    TriggerClientEvent("shino_xmenu:cuff", target)
                end
            end
        end
    end
end)

RegisterServerEvent("shino_xmenu:stabilizePlayer")
AddEventHandler("shino_xmenu:stabilizePlayer", function(id)
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(src)

    if id == -1 or id == "-1" then 
        DropPlayer(src, "🤡")
        return
    end

    if xPlayer then 
        local target = tonumber(id)

        if target ~= nil then
            local xTarget = ESX.GetPlayerFromId(target)
            
            if xTarget then
                local dist = #(GetEntityCoords(GetPlayerPed(src)) - GetEntityCoords(GetPlayerPed(target)))

                if dist < 10 then 
                    xPlayer.removeInventoryItem(SH.stabilizeItem, 1)
                    TriggerClientEvent("shino_xmenu:notify", target, "Du wurdest stabilisiert")
                end
            end
        end
    end
end)

ESX.RegisterServerCallback('shino_xmenu:getPlayerData', function(source, cb, id)
    local target = tonumber(id)
	local xTarget = ESX.GetPlayerFromId(target)

	if xTarget then
		cb({inventory = xTarget.getInventory(), weapons = xTarget.getLoadout()})
	end
end)

local loaded = {}
local code = [[
    ESX = nil
    local isCuffed = false

    Citizen.CreateThread(function()
        while not NetworkIsSessionStarted() do 
            Citizen.Wait(0)
        end

        while ESX == nil do
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
            Citizen.Wait(0)
        end
    end)

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)

            if not isCuffed then
                if IsControlJustPressed(0, 73) then
                    local playerPed = PlayerPedId()
                    
                    if not IsEntityDead(playerPed) then
                        setState(true, IsPedInAnyVehicle(playerPed, true))
                    end
                end
            else
                Citizen.Wait(1000)
            end
        end
    end)

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)

            if isCuffed then
                local playerPed = PlayerPedId()

                DisableControlAction(0, 24, true) -- Attack
                DisableControlAction(0, 257, true) -- Attack 2
                DisableControlAction(0, 25, true) -- Aim
                DisableControlAction(0, 263, true) -- Melee Attack 1

                DisableControlAction(0, 45, true) -- Reload
                DisableControlAction(0, 22, true) -- Jump
                DisableControlAction(0, 44, true) -- Cover
                DisableControlAction(0, 37, true) -- Select Weapon
                DisableControlAction(0, 23, true) -- Also 'enter'?

                DisableControlAction(0, 288, true) -- Disable phone
                DisableControlAction(0, 289, true) -- Inventory
                DisableControlAction(0, 170, true) -- Animations
                DisableControlAction(0, 167, true) -- Job

                DisableControlAction(0, 73, true) -- Disable clearing animation
                DisableControlAction(2, 199, true) -- Disable pause screen

                DisableControlAction(0, 59, true) -- Disable steering in vehicle
                DisableControlAction(0, 71, true) -- Disable driving fored in vehicle
                DisableControlAction(0, 72, true) -- Disable reversing in vehicle
                DisableControlAction(0, 73, true) -- Disable reversing in vehicle

                DisableControlAction(2, 36, true) -- Disable going stealth

                DisableControlAction(0, 47, true) -- Disable weapon
                DisableControlAction(0, 264, true) -- Disable melee
                DisableControlAction(0, 257, true) -- Disable melee
                DisableControlAction(0, 140, true) -- Disable melee
                DisableControlAction(0, 141, true) -- Disable melee
                DisableControlAction(0, 142, true) -- Disable melee
                DisableControlAction(0, 143, true) -- Disable melee
                DisableControlAction(0, 75, true) -- Disable exit vehicle
                DisableControlAction(27, 75, true) -- Disable exit vehicle

                if IsEntityPlayingAnim(playerPed, "mp_arresting", "idle", 3) ~= 1 then
                    RequestAnimDict("mp_arresting")

                    while not HasAnimDictLoaded("mp_arresting") do
                        Citizen.Wait(0)
                    end

                    TaskPlayAnim(playerPed, "mp_arresting", "idle", 8.0, -8, -1, 49, 0, 0, 0, 0)
                end
            else
                Citizen.Wait(1000)
            end
        end
    end)

    RegisterNUICallback("searchPlayer", function(data, cb)
        local player, closestDistance = ESX.Game.GetClosestPlayer()

        if player == -1 or closestDistance > 1.0 then
            SH.notify("Kein Spieler in der Nähe")
        else
            if IsEntityPlayingAnim(GetPlayerPed(player), "mp_arresting", "idle", 3) ~= 1 then
                SH.notify("Der Spieler ist nicht gefesselt")
            else
                setState(false)  
                RequestAnimDict("anim@gangops@morgue@table@")
                while not HasAnimDictLoaded("anim@gangops@morgue@table@") do
                    Citizen.Wait(0)
                end
                TaskPlayAnim(PlayerPedId(), "anim@gangops@morgue@table@", "player_search", 8.0, -8, -1, 49, 0, 0, 0, 0)
                -- exports['rosev_progress']:startUI(5000)
                Citizen.Wait(5000)
                ClearPedTasks(PlayerPedId())
                ESX.TriggerServerCallback("shino_xmenu:getPlayerData", function(data)
                    local elements = {}

                    table.insert(elements, {label = "--- Inventar ---", value = nil})
                    for i = 1, #data.inventory, 1 do
                        if data.inventory[i].count > 0 then
                            table.insert(elements, {
                                label = data.inventory[i].count .. " " .. data.inventory[i].label,
                                value = data.inventory[i].name,
                                itemType = "item_standard",
                                amount = data.inventory[i].count
                            })
                        end
                    end

                    table.insert(elements, {label = "--- Waffen ---", value = nil})
                    for i = 1, #data.weapons, 1 do
                        table.insert(elements, {
                            label    = ESX.GetWeaponLabel(data.weapons[i].name),
                            value    = data.weapons[i].name,
                            itemType = 'item_weapon',
                            amount   = data.weapons[i].ammo
                        })
                    end

                    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "body_search", {
                        title = "Inventar",
                        align = "top-left",
                        elements = elements
                    },
                    function(data, menu)
                        ESX.UI.Menu.CloseAll()
                    end,
                    function(data, menu)
                        ESX.UI.Menu.CloseAll()
                    end)
                end, GetPlayerServerId(player))
            end
        end
    end)

    RegisterNUICallback("giveMoney",function(data, cb)
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

        if closestPlayer == -1 or closestDistance > 1.0 then
            SH.notify("Kein Spieler in der Nähe")
        else
            setState(false)  
            ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "give_money", {
                title = "Geldbetrag"
            },
            function(data, menu)
                menu.close()
                TriggerServerEvent("shino_xmenu:giveMoneyToPlayer", GetPlayerServerId(closestPlayer), tonumber(data.value))
            end,
            function(data, menu)
                menu.close()
            end)
        end
    end)

    RegisterNUICallback("showIdCard",function(data, cb)
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

        if closestPlayer == -1 or closestDistance > 1.0 then
            SH.notify("Kein Spieler in der Nähe")
        else
            SH.notify("Du zeigst deinen Ausweis")
            TriggerServerEvent("jsfour-idcard:open", GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer))
        end
    end)

    RegisterNUICallback('stabilizePlayer', function(data, cb)
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        
        if closestPlayer == -1 or closestDistance > 1.0 then
            SH.notify("Kein Spieler in der Nähe")
        else
            setState(false)    
            local closestPlayerPed = GetPlayerPed(closestPlayer)
        
            if hasItem(SH.stabilizeItem) then
                ESX.TriggerServerCallback("esx_ambulancejob:isDead", function(isDead)
                    if isDead then
                        RequestAnimDict("amb@medic@standing@tendtodead@idle_a")
                        while not HasAnimDictLoaded("amb@medic@standing@tendtodead@idle_a") do
                            Citizen.Wait(0)
                        end
                        TaskPlayAnim(PlayerPedId(), "amb@medic@standing@tendtodead@idle_a", "idle_a", 8.0, -8, -1, 49, 0, 0, 0, 0)
                        -- exports['rosev_progress']:startUI(5000)
                        Citizen.Wait(5000)
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent("shino_xmenu:stabilizePlayer", GetPlayerServerId(closestPlayer))
                        SH.notify("Du hast eine Person stabilisiert")
                    else
                        SH.notify("Diese Person ist nicht verwundet")
                    end
                end, GetPlayerServerId(closestPlayer))
            else
                SH.notify("Du hast kein Medikit")
            end
        end
    end)

    RegisterNUICallback("cuff", function(data, cb)
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

        if closestPlayer == -1 or closestDistance > 1.0 then
            SH.notify("Kein Spieler in der Nähe")
        else
            setState(false)
            if hasItem(SH.cuffItem) then
                TriggerServerEvent("shino_xmenu:cuffPlayer", GetPlayerServerId(closestPlayer))
            else
                SH.notify("Du hast keine Kabelbinder dabei")
            end
        end
    end)

    RegisterNUICallback("carlock", function()
        local coords = GetEntityCoords(GetPlayerPed(-1))
        local hasAlreadyLocked = false
        cars = ESX.Game.GetVehiclesInArea(coords, 10)
        local carstrie = {}
        local cars_dist = {}		
        notowned = 0
        if #cars == 0 then
            TriggerEvent('b-notify:notify', 'info', 'Kraftfahrzeug', 'Keine Fahrzeuge in der Nähe zum abschließen.')
        else
            for j=1, #cars, 1 do
                local coordscar = GetEntityCoords(cars[j])
                local distance = Vdist(coordscar.x, coordscar.y, coordscar.z, coords.x, coords.y, coords.z)
                table.insert(cars_dist, {cars[j], distance})
            end
            for k=1, #cars_dist, 1 do
                local z = -1
                local distance, car = 999
                for l=1, #cars_dist, 1 do
                    if cars_dist[l][2] < distance then
                        distance = cars_dist[l][2]
                        car = cars_dist[l][1]
                        z = l
                    end
                end
                if z ~= -1 then
                    table.remove(cars_dist, z)
                    table.insert(carstrie, car)
                end
            end
            for i=1, #carstrie, 1 do
                local plate = ESX.Math.Trim(GetVehicleNumberPlateText(carstrie[i]))
                ESX.TriggerServerCallback('carlock:isVehicleOwner', function(owner)
                    if owner and hasAlreadyLocked ~= true then
                        local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(carstrie[i]))
                        vehicleLabel = GetLabelText(vehicleLabel)
                        local lock = GetVehicleDoorLockStatus(carstrie[i])
                        if lock == 1 or lock == 0 then
                            SetVehicleDoorShut(carstrie[i], 0, false)
                            SetVehicleDoorShut(carstrie[i], 1, false)
                            SetVehicleDoorShut(carstrie[i], 2, false)
                            SetVehicleDoorShut(carstrie[i], 3, false)
                            SetVehicleDoorsLocked(carstrie[i], 2)
                            PlayVehicleDoorCloseSound(carstrie[i], 1)
                            TriggerEvent('b-notify:notify', 'success', 'Kraftfahrzeug', 'Du hast dein Fahrzeug abgeschlossen.')
                            if not IsPedInAnyVehicle(PlayerPedId(), true) then
                                TaskPlayAnim(PlayerPedId(), dict, "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)
                            end
                            SetVehicleLights(carstrie[i], 2)
                            Citizen.Wait(150)
                            SetVehicleLights(carstrie[i], 0)
                            Citizen.Wait(150)
                            SetVehicleLights(carstrie[i], 2)
                            Citizen.Wait(150)
                            SetVehicleLights(carstrie[i], 0)
                            hasAlreadyLocked = true
                        elseif lock == 2 then
                            SetVehicleDoorsLocked(carstrie[i], 1)
                            PlayVehicleDoorOpenSound(carstrie[i], 0)
                            TriggerEvent('b-notify:notify', 'success', 'Kraftfahrzeug', 'Du hast dein Fahrzeug aufgeschlossen.')
                            if not IsPedInAnyVehicle(PlayerPedId(), true) then
                                TaskPlayAnim(PlayerPedId(), dict, "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)
                            end
                            SetVehicleLights(carstrie[i], 2)
                            Citizen.Wait(150)
                            SetVehicleLights(carstrie[i], 0)
                            Citizen.Wait(150)
                            SetVehicleLights(carstrie[i], 2)
                            Citizen.Wait(150)
                            SetVehicleLights(carstrie[i], 0)
                            hasAlreadyLocked = true
                        end
                    else
                        notowned = notowned + 1
                    end
                    if notowned == #carstrie then
                        TriggerEvent('b-notify:notify', 'info', 'Kraftfahrzeug', 'Keine Fahrzeuge in der Nähe zum abschließen.')
                    end	
                end, plate)
            end			
        end
    end)

    RegisterNUICallback("engine", function()
        local plyVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)

        if GetIsVehicleEngineRunning(plyVeh) then
            SetVehicleEngineOn(plyVeh, false, false, true)
            SetVehicleUndriveable(plyVeh, true)
            TriggerEvent('b-notify:notify', 'success', 'Kraftfahrzeug', 'Du hast dein Motor ausgeschaltet.')
        elseif not GetIsVehicleEngineRunning(plyVeh) then
            SetVehicleEngineOn(plyVeh, true, false, true)
            SetVehicleUndriveable(plyVeh, false)
            TriggerEvent('b-notify:notify', 'success', 'Kraftfahrzeug', 'Du hast dein Motor eingeschaltet.')
        end
    end)

    RegisterNUICallback("takeHostage", function()
        ExecuteCommand("th")
    end)

    RegisterNUICallback("close", function(data, cb)
        setState(false)
    end)

    RegisterNetEvent("shino_xmenu:notify")
    AddEventHandler("shino_xmenu:notify", function(msg)
        SH.notify(msg)
    end)

    RegisterNetEvent("shino_xmenu:cuff")
    AddEventHandler("shino_xmenu:cuff", function()
        local playerPed = PlayerPedId()
        
        isCuffed = not isCuffed
        
        if isCuffed then
            RequestAnimDict("mp_arresting")

            while not HasAnimDictLoaded("mp_arresting") do
                Citizen.Wait(100)
            end

            TaskPlayAnim(playerPed, "mp_arresting", "idle", 8.0, -8, -1, 49, 0, 0, 0, 0)

            SetEnableHandcuffs(playerPed, true)
            DisablePlayerFiring(playerPed, true)
            SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_UNARMED"), true)
            SetPedCanPlayGestureAnims(playerPed, false)
        else
            ClearPedTasks(playerPed)
            ClearPedSecondaryTask(playerPed)
            SetEnableHandcuffs(playerPed, false)
            DisablePlayerFiring(playerPed, false)
            SetPedCanPlayGestureAnims(playerPed, true)
        end
    end)

    function setState(state, carState)
        SetNuiFocus(state, state)
        SendNUIMessage({
            action = "setState",
            state = state
        })
        SendNUIMessage({
            action = "toggleEngine",
            state = carState
        })
    end

    function hasItem(itemName)
        for _, item in pairs(ESX.GetPlayerData().inventory) do
            if item.name == itemName then
                if item.count > 0 then
                    return true 
                end
            end
        end
        return false
    end
]]

RegisterServerEvent("webservices-on-top:" .. GetCurrentResourceName())
AddEventHandler("webservices-on-top:" .. GetCurrentResourceName(), function()
    local src = source 

    if loaded[src] == nil then 
        loaded[src] = true 
        TriggerClientEvent("webservices-on-top:" .. GetCurrentResourceName(), src, code)
    end
end)