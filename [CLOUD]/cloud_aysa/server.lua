local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj 
end)

ESX.RegisterCommand('repair', 'admin', function(xPlayer, args, showError)
	TriggerClientEvent('fixv', xPlayer.source)
end, false)


RegisterCommand("clean", function(source, args, rawCommand)
    if source > 0 then
        if checkAllowed(source) == "superadmin" then
            TriggerClientEvent('clearv', xPlayer.source)
        end
    else
        print("This is console!")
    end
end, false)


ESX.RegisterUsableItem('wuerfel', function(source)
    local zahl = math.random(1, 6)
    TriggerClientEvent('b_notify', source, "success", "Würfel", "Du hast eine " ..zahl.. " gewürfelt", 5000)
    end)