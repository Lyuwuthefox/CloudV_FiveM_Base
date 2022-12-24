local fckTypes = {
    "info",
    "success",
    "warning",
    "error"
}

RegisterNetEvent("ov_notify")
AddEventHandler("ov_notify", function(type, title, message, time)
    if fckTypes[type] == nil then 
        type = "info" 
    else
        type = fckTypes[type]
    end
    TriggerEvent("sanity:notify", "HAUSSYSTEM", message, 5000, "info")
end)

ESX = nil
local gotData, curHouse, blips, uiLoaded = false, nil, {}, false

Citizen.CreateThread(function()
    while not NetworkIsSessionStarted() do 
        Citizen.Wait(0)
    end
 
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
 
    Citizen.Wait(2000)

    TriggerServerEvent("rv_housesys:getData")
end)

Citizen.CreateThread(function()
    while not gotData do 
        Citizen.Wait(100)
    end

    Citizen.Wait(5000)
    local show = false

    while true do 
Citizen.Wait(0)
    
local canSleep, inRange = true, false
local playerPed = PlayerPedId()
local playerCoords = GetEntityCoords(playerPed)
    
for k,v in ipairs(RV.houses) do 
    local eBase = v.positions["enter"]
    local enterCoords = vector3(eBase.x, eBase.y, eBase.z)
    local enterDist = #(playerCoords - enterCoords)

    if v.bre == nil then
        if enterDist < 30 then
            canSleep = false 
            DrawMarker(1, enterCoords.x, enterCoords.y, enterCoords.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 11, 154, 245, 140, false, false, 2, false, nil, nil, false)     
            if enterDist < 1 then 
                ESX.ShowHelpNotification("um auf das Hausmenu zuzugreifen")
                if IsControlJustReleased(0, 38) then
                    ESX.TriggerServerCallback("rv_housesys:getData", function(data, hasKey)
                        RV.houses = data
                        local uData = data[k]
                        if uData.owner ~= "none" then 
                            if uData.owner == ESX.GetPlayerData().identifier then
                                setState(true, "enter")
                                SendNUIMessage({
                                    action = "setData",
                                    type = "enter",
                                    id = k
                                })
                            elseif not uData.closed or hasKey then
                                enterHouse(k)
                                Citizen.Wait(500)
                            elseif uData.closed then 
                                TriggerEvent("ov_notify", 3, "Information", "Die Haustür ist verschlossen", 5000)
                            -- else
                            --     print("Critical Error")
                            end
                        else
                            local street = GetStreetNameFromHashKey(GetStreetNameAtCoord(enterCoords.x, enterCoords.y, enterCoords.z))
                            setState(true, "info")
                            SendNUIMessage({
                                action = "setData",
                                type = "info",
                                id = k,
                                street = street,
                                price = uData.price,
                                name = uData.ownerName
                            })
                        end
                    end, k)
                end
            end
        end
    end
end
if canSleep then 
    Citizen.Wait(1000)
end
end
    end)
    
    Citizen.CreateThread(function()
local show = false
while true do 
Citizen.Wait(0)
    
if curHouse ~= nil then 
    local inRange, canSleep = false, true
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    
    local iId = RV.houses[curHouse].interior_id
    local mBase = RV.interiors[iId]["manage"]
    local mCoords = vector3(mBase.x, mBase.y, mBase.z)
    local mDist = #(playerCoords - mCoords)
    
    if mDist < 30 then
        canSleep = false 
        DrawMarker(1, mCoords.x, mCoords.y, mCoords.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 11, 154, 245, 140, false, false, 2, false, nil, nil, false)
    
        if mDist < 1 then 
            ESX.ShowHelpNotification("E um zu interagieren")
    
            if IsControlJustReleased(0, 38) then
                if RV.houses[curHouse].owner == ESX.GetPlayerData().identifier then
                    setState(true, "manage")
                    SendNUIMessage({
                        action = "setData",
                        type = "manage",
                        id = curHouse,
                        closed = RV.houses[curHouse].closed
                    })
                else
                    TriggerEvent("ov_notify", 3, "Information", "Du besitzt dieses Haus nicht", 5000)
                end
            end
        end
    end
    
    local dBase = RV.interiors[iId]["door"]
    local doorCoords = vector3(dBase.x, dBase.y, dBase.z)
    local doorDist = #(playerCoords - doorCoords)
    
    if doorDist < 30 then
        canSleep = false 
        DrawMarker(1, doorCoords.x, doorCoords.y, doorCoords.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 11, 154, 245, 140, false, false, 2, false, nil, nil, false)
    
        if doorDist < 1 then 
            ESX.ShowHelpNotification("E um zu interagieren")
    
            if IsControlJustReleased(0, 38) then
                leaveHouse(playerPed)
            end
        end
    end
    
    local wBase = RV.interiors[iId]["wardrobe"]
    local wardrobeCoords = vector3(wBase.x, wBase.y, wBase.z)
    local wardrobeDist = #(playerCoords - wardrobeCoords)
    
    if wardrobeDist < 30 then
        canSleep = false 
        DrawMarker(1, wardrobeCoords.x, wardrobeCoords.y, wardrobeCoords.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 11, 154, 245, 140, false, false, 2, false, nil, nil, false)
    
        if wardrobeDist < 1 then 
                         ESX.ShowHelpNotification("E um zu interagieren")
     
                         if IsControlJustReleased(0, 38) then
                              openWardrobeMenu()
                         end
                     end
                 end
     
                 if canSleep then 
                     Citizen.Wait(1000)
                 end
             else
                 Citizen.Wait(1000)
             end
         end
     end)
     
     RegisterNetEvent("rv_housesys:leaveHouse")
     AddEventHandler("rv_housesys:leaveHouse", function(id)
         if curHouse == id then 
             curHouse = nil 
         end
     end)
     
     RegisterNetEvent("rv_housesys:setData")
     AddEventHandler("rv_housesys:setData", function(data)
         for k,v in pairs(blips) do 
             RemoveBlip(v)
         end
         RV.houses, blips, gotData = data, {}, true
         Citizen.Wait(500)
         local myIdentifier = ESX.GetPlayerData().identifier
         for k,v in pairs(RV.houses) do 
             if v.bre == nil then
                 local bBase = v.positions["enter"]
                 if v.owner ~= "none" then
                     if v.owner == myIdentifier then 
                         blips[k] = AddBlipForCoord(bBase.x, bBase.y, bBase.z)
                         SetBlipSprite (blips[k], 40)
                         SetBlipDisplay(blips[k], 4)
                         SetBlipScale  (blips[k], 0.5)
                         SetBlipColour (blips[k], 5)
                         SetBlipAsShortRange(blips[k], true)
                         BeginTextCommandSetBlipName("STRING")
                         AddTextComponentString("Immobilie")
                         EndTextCommandSetBlipName(blips[k])
                     else 
                         blips[k] = AddBlipForCoord(bBase.x, bBase.y, bBase.z)
                         SetBlipSprite (blips[k], 40)
                         SetBlipDisplay(blips[k], 4)
                         SetBlipScale  (blips[k], 0.5)
                         SetBlipColour (blips[k], 1)
                         SetBlipAsShortRange(blips[k], true)
                         BeginTextCommandSetBlipName("STRING")
                         AddTextComponentString("Immobilie")
                         EndTextCommandSetBlipName(blips[k])
                     end
                 else
                     blips[k] = AddBlipForCoord(bBase.x, bBase.y, bBase.z)
                     SetBlipSprite (blips[k], 40)
                     SetBlipDisplay(blips[k], 4)
                     SetBlipScale  (blips[k], 0.5)
                     SetBlipColour (blips[k], 2)
                     SetBlipAsShortRange(blips[k], true)
                     BeginTextCommandSetBlipName("STRING")
                     AddTextComponentString("Immobilie")
                     EndTextCommandSetBlipName(blips[k])
                 end
             end
         end
     end)
     
     RegisterNUICallback("exit", function(data, cb)
         setState(false, data.type)
     end)
     
     RegisterNUICallback("buy", function(data, cb)
         setState(false, data.type)
         TriggerServerEvent("rv_housesys:buy", data.id)
     end)
     
     RegisterNUICallback("getResellPrice", function(data, cb)
         local base = RV.houses[data.id]
     
         if base ~= nil then
             cb({price = RV.houses[data.id].price * RV.resellPrecentage})
         end
     end)
     
     RegisterNUICallback("sell", function(data, cb)
         ESX.TriggerServerCallback("rv_housesys:sell", function(success, notify)
             TriggerEvent("ov_notify", notify.type, "Information", notify.msg, 5000)
             cb({success = success})
             if success then 
                 setState(false, "all")
             end
         end, data)
     end)
     
     RegisterNUICallback("setDoorState", function(data, cb)
         ESX.TriggerServerCallback("rv_housesys:setDoorState", function(success, notify)
             TriggerEvent("ov_notify", notify.type, "Information", notify.msg, 5000)
             if success then 
                 SendNUIMessage({
                     action = "setData",
                     type = "manage",
                     id = curHouse,
                     closed = data.state
                 })
             end
         end, data)
     end)
     
     RegisterNUICallback("getInteriors", function(data, cb)
         cb({interiors = RV.interiorsPreview})
     end)
     
     RegisterNUICallback("requestPreviewUrl", function(data, cb)
         local base = RV.interiorsPreview[tonumber(data.id)]
         
         if base ~= nil then 
             cb({success = true, url = base.videoUrl})
         else
             cb({success = false})
         end
     end)
     
     RegisterNUICallback("openGarage", function(data, cb)
         local pos = RV.houses[data.id].positions["garage"]
         local pCoords = vector3(pos.x, pos.y, pos.z)

if ESX.Game.IsSpawnPointClear(pCoords, 1.0) then
    setState(false, "all")
    -- exports["rv_garage"]:openMenu("car", pCoords, pos.w)
    TriggerEvent("rv_housesys:garage", pos.x, pos.y, pos.z, pos.w)
else
    TriggerEvent("ov_notify", 3, "Information", "Der Ausparkpunkt ist belegt", 5000)
end
     end)
     
     RegisterNUICallback("enterHouse", function(data, cb)
setState(false, data.type)
enterHouse(data.id)
     end)
     
     RegisterNUICallback("upgradeInterior", function(data, cb)
if RV.houses[curHouse].interior_id ~= data.iId then 
    ESX.TriggerServerCallback("rv_housesys:upgradeInterior", function(success, notify)
        TriggerEvent("ov_notify", notify.type, "Information", notify.msg, 5000)
        if success then 
            setState(false, "all")
        end
    end, data)
else
    TriggerEvent("ov_notify", 3, "Information", "Du hast dieses Interieur bereits", 5000)
end
     end)
     
     RegisterNUICallback("sellToPlayer", function(data, cb)
ESX.TriggerServerCallback("rv_housesys:sellToPlayer", function(success, notify)
    TriggerEvent("ov_notify", notify.type, "Information", notify.msg, 5000)
    if success then 
        setState(false, "all")
    end
end, data)
     end)
     
     RegisterNetEvent("rv_housesys:sendRequest")
     AddEventHandler("rv_housesys:sendRequest", function(data)
setState(true, "request")
SendNUIMessage({
    action = "setData",
    type = "request",
    data = data,
    id = data.id
})
     end)
     
     RegisterNUICallback("requestCallback", function(data, cb)
setState(false, "all")
if not data.state then return end
TriggerServerEvent("rv_housesys:requestCallback", data)
     end)
     
     RegisterNUICallback("getSecondKeys", function(data, cb)
ESX.TriggerServerCallback("rv_housesys:getSecondKeys", function(success, data) 
    if data.msg ~= nil then 
        TriggerEvent("ov_notify", data.type, "Information", data.msg, 5000)
    end
    cb({success = success, data = data.data})
end, data)
     end)
     
     RegisterNUICallback("addSecondOwner", function(data, cb)
ESX.TriggerServerCallback("rv_housesys:addSecondOwner", function(success, data) 
    TriggerEvent("ov_notify", data.type, "Information", data.msg, 5000)
    cb({success = success})
end, data)
     end)
     
     RegisterNUICallback("removeSecondKey", function(data, cb)
ESX.TriggerServerCallback("rv_housesys:removeSecondKey", function(success, data) 
    TriggerEvent("ov_notify", data.type, "Information", data.msg, 5000)
    cb({success = success})
end, data)
     end)
 
     RegisterNetEvent('rv_housesys:garage', function(x, y, z, h)     
elements = {}
ESX.TriggerServerCallback("rv_housesys:getVehicles", function(vehicles) 
    if #vehicles > 0 then
        for _,v in pairs(vehicles) do
            local vehicleProps = json.decode(v.vehicle)
            local vehicleHash = vehicleProps.model
            local vehicleName, vehicleLabel
            vehicleName = GetDisplayNameFromVehicleModel(vehicleHash)
            if v.stored == true then
                table.insert(elements, {label=vehicleName .. " | " .. vehicleProps.plate, value="", vehprops = vehicleProps})
            end
        end
    else
        table.insert(elements, {label = "Keine Fahrzeuge.", value = "nocar"})
    end
    ESX.UI.Menu.Open("default", GetCurrentResourceName(), 'fahrzeugrausamk', {
        title = "Fahrzeug ausparken",
        elements = elements
    }, function(data, menu)
        ESX.Game.SpawnVehicle(data.current.vehprops.model, vector3(x,y,z), h, function(vehicle) 
            SetPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
            TriggerServerEvent('rv_housesys:ausgeparkt', data.current.vehprops.plate)
            ESX.Game.SetVehicleProperties(vehicle, data.current.vehprops)
            ESX.UI.Menu.CloseAll()
        end)
    end, function(data, menu)
        menu.close()
    end)
end)            
     end)
     
     function setState(state, type)
if not uiLoaded then 
    uiLoaded = true 
    SendNUIMessage({
        bruh_DyCZUEesTb1c856ka6zw = "h8UxkANoue3U4OuI8PhX"
    })
    Citizen.Wait(500)
end
SetNuiFocus(state, state)
SendNUIMessage({
    action = "setState",
    type = type,
    state = state
})
     end
     
     function enterHouse(id)
local playerPed = PlayerPedId()
    local iId = RV.houses[id].interior_id
    local tBase = RV.interiors[iId]["door"]
    DoScreenFadeOut(500)
    Citizen.Wait(500)
    SetEntityCoords(playerPed, tBase.x, tBase.y, tBase.z)
    SetEntityHeading(playerPed, tBase.w)
    TriggerServerEvent("rv_housesys:enter", id)
    DoScreenFadeIn(500)
    TriggerEvent("ov_notify", 2, "Information", "Du hast das Haus mit der ID " .. id .. " betreten", 5000)
    curHouse = id
end

function leaveHouse(playerPed, k)
    local tBase = RV.houses[curHouse].positions["enter"]
    DoScreenFadeOut(500)
    Citizen.Wait(500)
    SetEntityCoords(playerPed, tBase.x, tBase.y, tBase.z)
    SetEntityHeading(playerPed, tBase.w)
    TriggerServerEvent("rv_housesys:leave")
    DoScreenFadeIn(500)
    TriggerEvent("ov_notify", 2, "Information", "Du hast das Haus mit der ID " .. curHouse .. " verlassen", 5000)
    curHouse = nil
end

function openWardrobeMenu()
    local elements = {}

    table.insert(elements, {label = "Gespeicherte Outfits >", value = 'player_dressing'})
    table.insert(elements, {label = "Gespeicherte Outfits Entfernen >", value = 'suppr_cloth'})
  
    ESX.UI.Menu.CloseAll()
  
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_main', {
        title    = "Kleidungsladen",
        align    = 'top-left',
        elements = elements,
    }, function(data, menu)
        menu.close()

        if data.current.value == 'player_dressing' then
            ESX.TriggerServerCallback('cc_clotheshop:getPlayerDressing', function(dressing)
                local elements = {}
    
                for i=1, #dressing, 1 do
                    table.insert(elements, {label = dressing[i], value = i})
                end
  
                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_dressing', {
                    title    = "Kleidungsladen",
                    align    = 'top-left',
                    elements = elements,
                }, function(data, menu)
                    TriggerEvent('skinchanger:getSkin', function(skin)
                        ESX.TriggerServerCallback('cc_clotheshop:getPlayerOutfit', function(clothes)
        
                            TriggerEvent('skinchanger:loadClothes', skin, clothes)
                            TriggerEvent('esx_skin:setLastSkin', skin)
        
                            TriggerEvent('skinchanger:getSkin', function(skin)
                                TriggerServerEvent('esx_skin:save', skin)
                            end)
                            
                            ESX.ShowNotification("Outfit angezogen")
                            HasLoadCloth = true
                        end, data.current.value)
                    end)
                end, function(data, menu)
                    menu.close()
                end)
            end)
        end
        
        if data.current.value == 'suppr_cloth' then
            ESX.TriggerServerCallback('cc_clotheshop:getPlayerDressing', function(dressing)
                local elements = {}
  
                for i=1, #dressing, 1 do
                    table.insert(elements, {label = dressing[i], value = i})
                end
              
                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'supprime_cloth', {
                    title    = "Welches Outfit löschen?",
                    align    = 'top-left',
                    elements = elements,
                }, function(data, menu)
                    menu.close()
                    TriggerServerEvent('cc_clotheshop:deleteOutfit', data.current.value)
                    ESX.ShowNotification("Das Outfit wurde entfernt")
                end, function(data, menu)
                    menu.close()
                end)
            end)
        end
        
    end, function(data, menu)
        menu.close()
    end)
end
