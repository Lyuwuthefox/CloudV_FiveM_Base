Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    Citizen.Wait(500)

    ESX.PlayerData = ESX.GetPlayerData()
    
    Citizen.Wait(500)
    ESX.TriggerServerCallback("cv_einreise:check", function(cb) 
        if not cb then
            startEinreise()
        end
    end)
end)

local inEinreise = false
local coordsBefore = nil



function startEinreise()
    inEinreise = true
    einreiseZone = PolyZone:Create(Config.Points, {name="Einreise", debugGrid = Config.Debug})
    einreiseZone:onPlayerInOut(function(isPointInside, point)
        inEinreiseZone = isPointInside
        if not isPointInside and inEinreise then
            local ec = einreiseZone:getBoundingBoxCenter()
            local coords = GetEntityCoords(PlayerPedId())
            local retval, groundcoord, normal = GetGroundZAndNormalFor_3dCoord(ec.x, ec.y, coords.z)
            SetEntityCoords(PlayerPedId(), ec.x, ec.y, groundcoord)
            Config.Notify(Config.Locales["inEinreiseCantLeave"])
        end
    end)
end


RegisterNetEvent('cv_einreise:changeStatus', function(state)
    ESX.TriggerServerCallback("cv_einreise:checkState", function(cb) 
        inEinreise = false
        if not cb then
            startEinreise()
        elseif einreiseZone ~= nil then
            einreiseZone:destroy()
        end
    end, state)
end)


function einreiseDialog(title, einreise)
    ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "einreiseDialog", {title=title}, function(data, menu)
        local id = tonumber(data.value)
        if id ~= nil then
            menu.close()
            TriggerServerEvent("cv_einreise:einreisen", id, einreise)
        else
            Config.Notify(Config.Locales["invalidId"])
        end
    end, function(data, menu) 
        menu.close() 
    end)
end

RegisterCommand("einreise", function(source, args, rawCmd)
    ESX.TriggerServerCallback("cv_einreise:checkPerms", function(cb) 
        if cb == true then
            ESX.UI.Menu.Open("default", GetCurrentResourceName(), "einreiseMenu", {
                title = "Einreisemenü", 
                align = "top-left",
                elements = {
                    {label="Zu Einreise teleportieren", value="startEinreiseDienst"},
                    {label="Aus Einreise rausteleportieren", value="leaveEinreiseDienst"},
                    {label="Spieler einreisen", value="jmdEinreisen"},
                    {label="Spieler zurück zur Einreise", value="jmdAusreisen"}
                }
            }, function(data, menu)
                if data.current.value == "startEinreiseDienst" then
                    coordsBefore = GetEntityCoords(PlayerPedId())
                    SetEntityCoords(PlayerPedId(), Config.EinreisePosition)
                elseif data.current.value == "leaveEinreiseDienst" then
                    -- TriggerServerEvent('cv_einreise:eDuty', false) das event gibt es nicht
                    if coordsBefore ~= nil then SetEntityCoords(coordsBefore) end
                elseif data.current.value == "jmdEinreisen" then
                    einreiseDialog("Eine Person einreisen (ID)", true)
                elseif data.current.value == "jmdAusreisen" then
                    einreiseDialog("Eine Person zurück in die Einreise senden (ID)", false)
                end
            end, function(data, menu)
                menu.close()
            end)
        end
    end)
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if inEinreise then
            DisablePlayerFiring(PlayerPedId(), true)
        else
            Wait(1000)
        end
    end
end)