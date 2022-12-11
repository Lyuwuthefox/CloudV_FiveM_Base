**Sanity Inventory**

Jeglicher versuch dieses Skript zu leaken, führt zum entzug dieses scriptes!

Trigger zum öffnen des Inventars
Server: TriggerClientEvent('inventory:open', source)
Client: TriggerEvent('inventory:open')

Bilder koennen unter html/img/items eingefuegt werden
Wichtig zu beachten ist das dieses Bild eine .png datei ist, zudem muss der name der Datei identisch mit dem namen des Items sein und in kleinbuchstaben geschrieben sein (WICHTIG nicht der label!!).

Richtige Beispiele:

gold.png
iron.png
bread.png

Falsche Beipsiele:

Gold.png (nur kleinbuchstaben)
eisen.png (label anstatt name)
bread.webm (Keine .png datei)


In es_extended/client/main.lua

Von:

RegisterNetEvent('esx:addInventoryItem')
AddEventHandler('esx:addInventoryItem', function(item, count, showNotification)
	for k,v in ipairs(ESX.PlayerData.inventory) do
		if v.name == item then
			ESX.UI.ShowInventoryItemNotification(true, v.label, count - v.count)
			ESX.PlayerData.inventory[k].count = count
			break
		end
	end

	if showNotification then
		ESX.UI.ShowInventoryItemNotification(true, item, count)
	end

	if ESX.UI.Menu.IsOpen('default', 'es_extended', 'inventory') then
		ESX.ShowInventory()
	end
end)

Zu:

RegisterNetEvent('esx:addInventoryItem')
AddEventHandler('esx:addInventoryItem', function(item, count, ignore)
	for k,v in ipairs(ESX.PlayerData.inventory) do
		if v.name == item then
			ESX.UI.ShowInventoryItemNotification(true, v.label, count - v.count)
			ESX.PlayerData.inventory[k].count = count
			break
		end
	end

	if ESX.UI.Menu.IsOpen('default', 'es_extended', 'inventory') then
		ESX.ShowInventory()
	end
end)


In es_extended/server/classes/player.lua

Von:

self.addInventoryItem = function(name, count
	local item = self.getInventoryItem(name)

	if item then
		count = ESX.Math.Round(count)

		local newCount = item.count + count
		item.count = newCount

		TriggerEvent('esx:onAddInventoryItem', self.source, item.name, item.count)
		self.triggerEvent('esx:addInventoryItem', item.name, item.count)
	end
end

Zu:

self.addInventoryItem = function(name, count, ignore)
	local item = self.getInventoryItem(name)

	if item then
		count = ESX.Math.Round(count)

		local newCount = item.count + count
		item.count = newCount

		TriggerEvent('esx:onAddInventoryItem', self.source, item.name, item.count, ignore)
		self.triggerEvent('esx:addInventoryItem', item.name, item.count, ignore)
	end
end
