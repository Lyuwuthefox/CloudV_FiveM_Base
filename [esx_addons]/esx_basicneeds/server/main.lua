ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('bread', function(source)

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('bread', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 250000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent("sanity:notify",source, "SYSTEM", "Du hast ein Brot gegessen!", 5000,"success")

end)

ESX.RegisterUsableItem('burger', function(source)

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('burger', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 250000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent("sanity:notify",source, "SYSTEM", "Du hast einen Bürger gegessen!", 5000,"success")

end)

ESX.RegisterUsableItem('chips', function(source)

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('chips', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 150000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent("sanity:notify",source, "SYSTEM", "Du hast eine Tüte Chips gegessen!", 5000,"success")

end)

ESX.RegisterUsableItem('apple', function(source)

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('apple', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 150000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent("sanity:notify",source, "SYSTEM", "Du hast einen Apfel gegessen!", 5000,"success")

end)

ESX.RegisterUsableItem('donut1', function(source)

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('donut1', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 150000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent("sanity:notify",source, "SYSTEM", "Du hast einen Donut gegessen!", 5000,"success")

end)

ESX.RegisterUsableItem('donut2', function(source)

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('donut2', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 150000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent("sanity:notify",source, "SYSTEM", "Du hast einen Donut gegessen!", 5000,"success")

end)

ESX.RegisterUsableItem('water', function(source)

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('water', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent("sanity:notify",source, "SYSTEM", "Du hast eine Flasche Wasser getrunken!", 5000,"success")

end)

ESX.RegisterUsableItem('choco', function(source)

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('water', 1)

	TriggerClientEvent('esx_status:add', source, 'choco', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent("sanity:notify",source, "SYSTEM", "Du hast eine Tasse Kakao getrunken!", 5000,"success")

end)

ESX.RegisterUsableItem('soda', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('soda', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 250000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent("sanity:notify",source, "SYSTEM", "Du hast eine Dose Limonade getrunken!", 5000,"success")

end)

ESX.RegisterUsableItem('kaffee', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('kaffee', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 250000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent("sanity:notify",source, "SYSTEM", "Du hast einen Becher Kaffee getrunken!", 5000,"success")

end)

ESX.RegisterUsableItem('cocacola', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cocacola', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent("sanity:notify",source, "SYSTEM", "Du hast eine Dose Cola getrunken!", 5000,"success")

end)

