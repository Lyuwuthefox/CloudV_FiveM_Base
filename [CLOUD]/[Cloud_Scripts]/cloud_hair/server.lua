-- Leaked By: Leaking Hub | J. Snow | leakinghub.com

if Config.useESX then
    ESX = nil
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
end

RegisterServerEvent('lils_barber:buyHair')
AddEventHandler('lils_barber:buyHair', function()

    local xPlayer = ESX.GetPlayerFromId(source)


    if xPlayer.getMoney() >= Config.Price then

        TriggerClientEvent('lils_barber:confirmHair', source, true)
        xPlayer.removeMoney(Config.Price)

    else
        TriggerClientEvent('lils_barber:confirmHair', source, false)
    end

end)