AddEventHandler('esx:getSharedObject', function(cb)
  local Invoke = GetInvokingResource()
  cb(ESX)
end)

exports('getSharedObject', function()
	return ESX
end)

if GetResourceState('ox_inventory') ~= 'missing' then
	Config.OxInventory = true
end
