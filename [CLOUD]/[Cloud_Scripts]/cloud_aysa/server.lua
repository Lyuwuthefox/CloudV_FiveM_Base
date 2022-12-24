-- Notify Trigger

    -- TriggerEvent("sanity:notify", "ERROR", "error Test Nachricht", 5000, "error")
    -- TriggerEvent("sanity:notify", "SUCCESS", "success Test Nachricht", 5000"success")
   -- TriggerEvent("sanity:notify", "WARNING", "Warning Test Nachricht", 5000, "warning")
    -- TriggerEvent("sanity:notify", "INFO", "Info Test Nachricht", 5000, "info") 

    local ESX = nil
    local playersHealing = {}



    TriggerEvent('esx:getSharedObject', function(obj) 
        ESX = obj 
    end)
    
    ESX.RegisterCommand('repair', 'admin', function(xPlayer, args, showError)
        TriggerClientEvent('fixv', xPlayer.source)
    end, false)
    
    
    RegisterCommand("clean", function(source, args, rawCommand)
        if source > 0 then
            if checkAllowed(source) == "admin" then
                TriggerClientEvent('clearv', xPlayer.source)
            end
        else
            print("This is console!")
        end
    end, false)
    
    
    ESX.RegisterUsableItem('wuerfel', function(source)
        local zahl = math.random(1, 6)
        TriggerClientEvent("sanity:notify",source,"Würfel", "Du hast eine " ..zahl.. " gewürfelt", 5000, "info") 
        end)
    
    
        ESX.RegisterUsableItem('maggros', function(source)
            local xPlayer = ESX.GetPlayerFromId(source)
            TriggerClientEvent('esx_extraitems:checkammo', source, 'maggros')
        end)
        
        ESX.RegisterUsableItem('magsmall', function(source)
            local xPlayer = ESX.GetPlayerFromId(source)
            TriggerClientEvent('esx_extraitems:checkammo', source, 'magsmall')
        end)
        
        RegisterNetEvent('esx_extraitems:removebox')
        AddEventHandler('esx_extraitems:removebox', function(hash, ammo, type)
            local xPlayer = ESX.GetPlayerFromId(source)
            local weaponName = ESX.GetWeaponFromHash(hash)
            if type == 'maggros' then
                xPlayer.addWeaponAmmo(weaponName.name, 100)
        
                    xPlayer.removeInventoryItem('maggros', 1)
                    TriggerClientEvent("sanity:notify",source,"System", "Du hast ein Großes Magazin verwendet", 5000, "success") 
                
            elseif type == 'magsmall' then
                xPlayer.addWeaponAmmo(weaponName.name, 50)
        
                    xPlayer.removeInventoryItem('magsmall', 1)
                    TriggerClientEvent("sanity:notify",source,"System", "Du hast ein kleines Magazin verwendet", 5000, "success") 
                end
        end)
    
    
        -- Weapon Deleter
    
    local Cops = {
        "steam:100000000000",
    }
    
    RegisterServerEvent("PoliceVehicleWeaponDeleter:askDropWeapon")
    AddEventHandler("PoliceVehicleWeaponDeleter:askDropWeapon", function(wea)
        local isCop = false
    
        for _,k in pairs(Cops) do
            if(k == getPlayerID(source)) then
                isCop = true
                break;
            end
        end
    
        if(not isCop) then
            TriggerClientEvent("PoliceVehicleWeaponDeleter:drop", source, wea)
        end
    
    end)
    
    
    function getPlayerID(source)
        local identifiers = GetPlayerIdentifiers(source)
        local player = getIdentifiant(identifiers)
        return player
    end
    
    -- gets the actual player id unique to the player,
    -- independent of whether the player changes their screen name
    function getIdentifiant(id)
        for _, v in ipairs(id) do
            return v
        end
    end
    


    ESX.RegisterUsableItem('medikit', function(source)
        local src = source
            local xPlayer = ESX.GetPlayerFromId(source)
            if not playersHealing[src] then
                xPlayer.removeInventoryItem('medikit', 1)
                playersHealing[src] = true
                TriggerClientEvent('aysa_healing:useItem', src)
                Citizen.Wait(10000)
                playersHealing[src] = nil
                end
            
        end)
    

    ESX.RegisterUsableItem('bandage', function(source)
        local src = source
            local xPlayer = ESX.GetPlayerFromId(source)
            if not playersHealing[src] then
                xPlayer.removeInventoryItem('bandage', 1)
                playersHealing[src] = true
                TriggerClientEvent('aysa_healing:useItem2', src)
                Citizen.Wait(10000)
                playersHealing[src] = nil
                end
            
        end)
    
    RegisterNetEvent("aysa_base:paycheck")
    AddEventHandler("aysa_base:paycheck", function()
        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)
        if xPlayer ~= nil then
            TriggerClientEvent("sanity:notify",source, "FRAKTION", "Du hast den "..xPlayer.getJob().name.. " Job und bekommst einen Paycheck von "..xPlayer.getJob().grade_salary.. "$ ", 5000, "info") 
        end
    end)
    
    -- Take Hostage

    local takingHostage = {}
--takingHostage[source] = targetSource, source is takingHostage targetSource
local takenHostage = {}
--takenHostage[targetSource] = source, targetSource is being takenHostage by source

RegisterServerEvent("TakeHostage:sync")
AddEventHandler("TakeHostage:sync", function(targetSrc)
	local source = source

	TriggerClientEvent("TakeHostage:syncTarget", targetSrc, source)
	takingHostage[source] = targetSrc
	takenHostage[targetSrc] = source
end)

RegisterServerEvent("TakeHostage:releaseHostage")
AddEventHandler("TakeHostage:releaseHostage", function(targetSrc)
	local source = source
	if takenHostage[targetSrc] then 
		TriggerClientEvent("TakeHostage:releaseHostage", targetSrc, source)
		takingHostage[source] = nil
		takenHostage[targetSrc] = nil
	end
end)

RegisterServerEvent("TakeHostage:killHostage")
AddEventHandler("TakeHostage:killHostage", function(targetSrc)
	local source = source
	if takenHostage[targetSrc] then 
		TriggerClientEvent("TakeHostage:killHostage", targetSrc, source)
		takingHostage[source] = nil
		takenHostage[targetSrc] = nil
	end
end)

RegisterServerEvent("TakeHostage:stop")
AddEventHandler("TakeHostage:stop", function(targetSrc)
	local source = source

	if takingHostage[source] then
		TriggerClientEvent("TakeHostage:cl_stop", targetSrc)
		takingHostage[source] = nil
		takenHostage[targetSrc] = nil
	elseif takenHostage[source] then
		TriggerClientEvent("TakeHostage:cl_stop", targetSrc)
		takenHostage[source] = nil
		takingHostage[targetSrc] = nil
	end
end)

AddEventHandler('playerDropped', function(reason)
	local source = source
	
	if takingHostage[source] then
		TriggerClientEvent("TakeHostage:cl_stop", takingHostage[source])
		takenHostage[takingHostage[source]] = nil
		takingHostage[source] = nil
	end

	if takenHostage[source] then
		TriggerClientEvent("TakeHostage:cl_stop", takenHostage[source])
		takingHostage[takenHostage[source]] = nil
		takenHostage[source] = nil
	end
end)


--- uwu discord

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('aysa:UpdatePresence')
AddEventHandler('aysa:UpdatePresence', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	local result = MySQL.Sync.fetchAll('SELECT firstname, lastname, sex, dateofbirth, height FROM users WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	})
	
	local firstname = result[1].firstname
	local lastname  = result[1].lastname

	local data = {
		['PlayerName'] = GetPlayerName(_source),
		['firstname'] = firstname,
		['lastname'] = lastname,
		['IdentityName'] = xPlayer.getName(),
		['Job'] = {jobName = xPlayer.getJob().name, jobGrade = xPlayer.getJob().grade_label, jobLabel = xPlayer.getJob().label},
		['ActivePlayers'] = GetNumPlayerIndices()
	}

    TriggerClientEvent('aysa:SetPresence',_source,data)
end)

ESX.RegisterCommand('leasing', 'admin', function(xPlayer, args, showError)
    MySQL.scalar('SELECT VIPLeasing FROM users WHERE identifier = @identifier', {
        ['@identifier'] = args.playerId.identifier
    }, function(result)
        if result then
            -- update it in the database to the opposite of what it is, then give notification to both players based on what it is now
            MySQL.execute('UPDATE users SET VIPLeasing = @VIPLeasing WHERE identifier = @identifier', {
                ['@identifier'] = args.playerId.identifier,
                ['@VIPLeasing'] = result == 0 and 1 or 0
            })

            args.playerId.showNotification(('Dir wurde vom Administrator %s der Leasing Status auf %s gesetzt.'):format(xPlayer.getName(), result == 0 and 'aktiv' or 'inaktiv'))
            xPlayer.showNotification(('Der Leasing Status von %s wurde auf %s gesetzt.'):format(args.playerId.name, result == 0 and 'aktiv' or 'inaktiv'))
        else
            print(('^1[ERROR]^0 Es konnte kein korrekter Leasing Status bei User ^1%s^0 gefunden werden'):format(args.playerId.identifier))
        end
    end)
end, true, {help = 'Ändert den VIP Leasing Status eines Spielers', validate = true, arguments = {
    {name = 'playerId', help = 'Spieler ID', type = 'player'}
}})