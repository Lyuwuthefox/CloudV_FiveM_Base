TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('switch', function(source) 
    TriggerClientEvent('stg_switch:use', source)
end)