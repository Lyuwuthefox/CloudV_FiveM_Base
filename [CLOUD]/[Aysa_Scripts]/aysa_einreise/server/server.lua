TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback("cv_einreise:check", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchScalar("SELECT eingereist FROM users WHERE identifier = @identifier", {['identifier'] = xPlayer.getIdentifier()}, function(result)
        if result then
            cb(toBool(result))
        end
    end)
end)

function toBool(int)
    if type(int) == "boolean" then
        return int
    else
        if int == 1 then
            return true
        end
        return false
    end
end

function hasPerms(group)
    for i=1, #Config.EinreiseGroups, 1 do
        if Config.EinreiseGroups[i] == group then
            return true
        end
    end
    return false
end

ESX.RegisterServerCallback("cv_einreise:checkPerms", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    cb(hasPerms(xPlayer.getGroup()))
end)

ESX.RegisterServerCallback("cv_einreise:checkState", function(source, cb, clientState)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchScalar("SELECT eingereist FROM users WHERE identifier = @identifier", {['identifier'] = xPlayer.getIdentifier()}, function(result)
        if toBool(result) ~= clientState then
            TriggerEvent('cv_matthias:ban', xPlayer.source, "Modding (versucht die Einreise zu umgehen)", "perma")
        end
        if result then
            cb(toBool(result))
        end
    end)
end)


RegisterServerEvent('cv_einreise:einreisen', function(id, state)
    local xPlayer = ESX.GetPlayerFromId(source)
    if hasPerms(xPlayer.getGroup()) then
        local tPlayer = ESX.GetPlayerFromId(id)
        if tPlayer ~= nil then
            MySQL.Async.fetchScalar("SELECT eingereist FROM users WHERE identifier = @identifier", {['identifier'] = tPlayer.getIdentifier()}, function(result)
                if toBool(result) == state then
                    TriggerClientEvent("sanity:notify", "EINREISE", xPlayer.source,  "Dieser Spieler ist bereits in diesem Zustand.", 5000, "warning")
                    return
                end
                MySQL.Async.execute("UPDATE users SET eingereist = @eingereist WHERE identifier = @identifier", {['eingereist'] = state, ['identifier'] = tPlayer.getIdentifier()})
                TriggerClientEvent('cv_einreise:changeStatus', tPlayer.source, state)
                TriggerClientEvent("sanity:notify",tPlayer.source, "VISUM", "Du hast dein Visum erhalten du kannst nun den Flughafen verlassen", 5000,"success")
            end)
        else
            TriggerClientEvent("cv_einreise:notify", xPlayer.source, Config.Locales["invalidId"])
        end
    else
        TriggerEvent('cv_matthias:ban', xPlayer.source, "Modding (versucht die Einreise zu umgehen)", "perma")
    end
end)