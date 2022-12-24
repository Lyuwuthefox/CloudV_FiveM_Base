KIDU.WhitelistOpen = false
KIDU.Admins = {}
KIDU.Adutys = {}

MySQL.Async.execute('ALTER TABLE `users` ADD COLUMN IF NOT EXISTS whitelisted VARCHAR(1) NOT NULL DEFAULT(0);', {}) 

TriggerEvent('esx:getSharedObject', function(sharedObject)
    ESX = sharedObject
end)

RegisterServerEvent('well-einreise:playerConnected')
AddEventHandler('well-einreise:playerConnected', function()
    local source = source

    local xPlayers = ESX.GetPlayers()
    local xPlayer  = ESX.GetPlayerFromId(source)

    MySQL.Async.fetchAll('SELECT whitelisted FROM users WHERE identifier = @identifier', {
        ['@identifier'] = xPlayer.identifier
    }, function(result)
        if result[1] then
            local isWhitelisted = result[1].whitelisted

            print(GetPlayerName(source) .. result[1].whitelisted)

            if isWhitelisted == "0" then 
                TriggerClientEvent('well-einreise:blacklistPlayer', source)
                
                if #KIDU.Admins == 0 then
                    TriggerClientEvent('b_notify', source, "success", "EINREISEAMT", "Derzeit ist kein Einreisebeamter im Dienst! Bitte erstelle ein Ticket!",  8500)
                else
                    TriggerClientEvent('b_notify', source, "success", "EINREISEAMT", "Die Einreise von Star Roleplay ist aktuell geschlossen!",  8500)
                end

                for i=1, #xPlayers, 1 do
                    local adminPlayer = ESX.GetPlayerFromId(xPlayers[i])

                    if adminPlayer.getGroup() == "mod" or adminPlayer.getGroup() == "guide" or adminPlayer.getGroup() == "supporter" or adminPlayer.getGroup() == "admin" then
                        TriggerClientEvent('b_notify', adminPlayer.source, "warning", "EINREISEAMT", 'Neuer Spieler in der Einreise! Name:' .. xPlayer.getName() .. ' ', 8500)
                    end
                end
            else
                TriggerClientEvent('well-einreise:whitelistPlayer', source)
            end
        end
    end)
end)

RegisterServerEvent('well-einreise:triedToSpawnVehicle')
AddEventHandler('well-einreise:triedToSpawnVehicle', function(vehicleName)
    local source = source
    local sourceIdentifiers = KIDU.Functions.GetIdentifiers(source)
    
    KIDU.Functions.SendWebhook('blue', 'Fahrzeug Spawn (Einreise)', 'Der Spieler ``' .. GetPlayerName(source) .. '`` hat versucht ein **Fahrzeug** (``' .. vehicleName .. '``) in der **Einreise** zu **spawnen**!\n\n' .. sourceIdentifiers)
end)

RegisterServerEvent('well-einreise:triedToGlitchOut')
AddEventHandler('well-einreise:triedToGlitchOut', function(vehicleName)
    local source = source
    local sourceIdentifiers = KIDU.Functions.GetIdentifiers(source)
    
    KIDU.Functions.SendWebhook('blue', 'Bugabuse (Einreise)', 'Der Spieler ``' .. GetPlayerName(source) .. '`` hat versucht sich aus der **Einreise** zu buggen!\n\n' .. sourceIdentifiers)
end)

AddEventHandler('playerDropped', function()
    local source = source

    if KIDU.Admins[source] then
        KIDU.Admins[source] = nil
    end
end)

RegisterCommand('einreise', function(source, args, rawCommand)
    local source = source 
    local xPlayerGroup = ESX.GetPlayerFromId(source).getGroup()

    if not KIDU.Functions.IsInArray(KIDU.AuthorizedGroups, xPlayerGroup) then
        return TriggerClientEvent('b_notify', source,"error","SYSTEM", "Keine Befugnis!",  8500)
    end

    if args[1] ~= nil then
        if string.lower(args[1]) == "rein" then
            KIDU.Admins[source] = true
            return TriggerClientEvent('well-einreise:teleportIntoAirport', source)
        end
        
        if string.lower(args[1]) == "raus" then
            KIDU.Admins[source] = nil
            return TriggerClientEvent('well-einreise:teleportOutOfAirport', source)
        end

        if string.lower(args[1]) == "check" then
            if tonumber(args[2]) then
                local targetPlayer = ESX.GetPlayerFromId(args[2])

                if not targetPlayer then
                    return TriggerClientEvent('b_notify', source,"error","SYSTEM", "Spieler ist nicht Online!",  8500)
                end

                return MySQL.Async.fetchAll('SELECT whitelisted FROM users WHERE identifier = @identifier', {
                    ['@identifier'] = targetPlayer.identifier
                }, function(result)
                    if result[1] then
                        local isWhitelisted = tonumber(result[1].whitelisted)
            
                        if isWhitelisted == 0 then
                            TriggerClientEvent('b_notify', source, "error", "EINREISEAMT", 'Der Spieler ' .. targetPlayer.getName() .. " ist nicht gewhitelisted.", 8500)
                        else
                            TriggerClientEvent('b_notify', source, "success", "EINREISEAMT", 'Der Spieler ' .. targetPlayer.getName() .. " ist gewhitelisted.",8500)
                        end
                    end
                end)
            else
                return TriggerClientEvent('cs_notify', source, "EINREISEAMT", "ID ist ungültig!", 'error',  8500)
            end
        end
        
        if string.lower(args[1]) == "reload" then
            if tonumber(args[2]) then
                TriggerClientEvent('esx_identity:showRegisterIdentity', args[2])
                TriggerClientEvent('cs_notify', source, "EINREISEAMT", 'Du hast ' .. GetPlayerName(args[2]) .. ' in den Behandlungsraum der Schönheits OP\'s geschickt!', 'success', 8500)
            else
                TriggerClientEvent('cs_notify', source, "EINREISEAMT", "ID ist ungültig!", 'error',  8500)
            end
            
            return
        end
        
        if string.lower(args[1]) == "aduty" then
            if KIDU.Adutys[source] then
                TriggerClientEvent('b_notify', source,"succes", "GUIDE", "Einreisebeamten Modus erfolgreich Verlassen!",   8500)
                KIDU.Adutys[source] = false
            else
                TriggerClientEvent('b_notify', source,"succes", "GUIDE", "Einreisebeamten Modus erfolgreich Betreten",  8500)
                KIDU.Adutys[source] = true
            end

            return TriggerClientEvent('well-einreise:toggleAduty', source)
        end

        if string.lower(args[1]) == "reset" then
            if tonumber(args[2]) then
                local targetPlayer = ESX.GetPlayerFromId(args[2])

                if not targetPlayer then
                    return TriggerClientEvent('cs_notify', source, "EINREISEAMT", "Der Spieler ist nicht Online!", 'error',  8500)
                end

                MySQL.Async.execute('UPDATE `users` SET whitelisted = 0 WHERE identifier = "' .. targetPlayer.identifier .. '"', {})

                TriggerClientEvent('well-einreise:blacklistPlayer', targetPlayer.source)
                TriggerClientEvent('cs_notify', source, "EINREISEAMT", 'Du hast ' .. GetPlayerName(args[2]) .. '\'s Einreise resetted!', 'success', 8500)
            else
                TriggerClientEvent('cs_notify', source, "EINREISEAMT", "ID ist ungültig!", 'error',  8500)
            end
            
            return
        end

        if tonumber(args[1]) then
            local targetPlayer = ESX.GetPlayerFromId(args[1])
            
            if targetPlayer then
                TriggerClientEvent('well-einreise:whitelistPlayer', targetPlayer.source)
                --TriggerClientEvent('well-einreise:teleportOutOfAirport', targetPlayer.source)

                TriggerClientEvent('cs_notify-right', source, "EINREISEAMT", 'Du hast ' .. GetPlayerName(targetPlayer.source) .. ' ein Visum erstattet!', 8500)
                -- TriggerClientEvent('cs_notify', targetPlayer.source, "EINREISEAMT", 'Du hast dein Visum von ' .. GetPlayerName(source) .. ' erstattet bekommen!', 'success', 8500)
                TriggerClientEvent('b_notify', targetPlayer.source, "success", "EINREISEAMT", 'Du hast dein Visum von ' .. GetPlayerName(source) .. ' erstattet bekommen!', 8500)
                
                MySQL.Async.execute('UPDATE `users` SET whitelisted = 1 WHERE identifier = "' .. targetPlayer.identifier .. '"', {}) 
            else
                TriggerClientEvent('summerv-notify:notifyUser', source, '', 'Einreiseamt', 'Die Person mit der Identifikationsnummer ' .. args[1] .. ' ist uns leider unbekannt!')
            end

            return
        else
            return TriggerClientEvent('cs_notify', source, "EINREISEAMT", "ID ist ungültig!", 'error',  8500)
        end
    else
        printMessage('Commands:')
        print('')
        printMessage('/einreise id - User whitelisten')
        print('')
        printMessage('/einreise rein - Einreiseamt betreten')
        printMessage('/einreise raus - Einreiseamt verlassen')
        printMessage('/einreise aduty - Anzug eines Einreisebeamten')
        print('')
        printMessage('/einreise check id - Whitelist Status überprüfen')
        printMessage('/einreise reload id - Charakter zurücksetzen')
        printMessage('/einreise reset id - Whitelist eines Spielers resetten')
    end
end, false)

function printMessage(text)
    print('^Aysa^7-^5Einreise^7: ' .. text)
end
