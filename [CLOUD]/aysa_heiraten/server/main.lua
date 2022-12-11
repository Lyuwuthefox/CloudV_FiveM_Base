ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local currentRequests = {}
local currentlyRequesting = {}
RegisterNetEvent('zero-marry:server:sendRequest', function(id)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local index = #currentRequests + 1
    if id == 0 then
      TriggerClientEvent('b_notify', src, "error", "Heiraten", "Du kannst dich nicht selber heiraten!")
      return
    end
    if currentlyRequesting[source] then
      return
    end
    if hasPlayerItem(src, ZERO.Settings.item) == false then
      TriggerClientEvent("b_notify", src, "error", "Heiraten", "Du besitzt keinen Ehering kauf einen du Geringverdiener!", 5000)
      print("no ring")
      return
    end
    xPlayer.removeInventoryItem(ZERO.Settings.item, 1)
    table.insert(currentRequests, {sender = source, receiver = id})
    currentlyRequesting[source] = true
    TriggerClientEvent('zero:marry:client:sendNotification', id, source, index)
    print(json.encode(currentRequests))
    Citizen.SetTimeout(5000, function()
      table.remove(currentRequests, index)
      currentlyRequesting[src] = false
    end)
end)

function hasPlayerItem(player, item)
    local xPlayer = ESX.GetPlayerFromId(player)
    local item = xPlayer.getInventoryItem(item)
    if item == nil then
      return false
    end
    if item.count > 0 then
        return true
    else
        return false
    end
end

function isRequestingYou(receiver, id)
    for k, v in pairs(currentRequests) do
        if v.receiver == receiver and v.sender == id then
            return true
        end
    end
    return false
end

function Marry(id, receiver)
    local player = ESX.GetPlayerFromId(id)
    local receiver = ESX.GetPlayerFromId(receiver)
    local playerIdentifier = player.identifier
    local receiverIdentifier = receiver.identifier
    local playerNameReq = MySQL.query.await("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = playerIdentifier})[1]
    local playerName = playerNameReq.firstname .. " " .. playerNameReq.lastname
    local receiverNameReq = MySQL.query.await("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = receiverIdentifier})[1]
    local receiverName = receiverNameReq.firstname .. " " .. receiverNameReq.lastname
    MySQL.query('UPDATE users SET lastname = @lastname WHERE identifier = @identifier', {
        ['@lastname'] = playerNameReq.lastname,
        ['@identifier'] = receiverIdentifier
    })
    announce("Glückwunsch! " .. receiverName .. " und " .. playerName .. " sind nun Verheiratet!")
end

RegisterNetEvent('zero:server:acceptMarry', function(id, index)
  if isRequestingYou(source, id) then
    table.remove(currentRequests, index)
    Marry(id, source)
  end
end)

RegisterNetEvent('zero:server:declineMarry', function(id, index)
  if isRequestingYou(source, id) then
    table.remove(currentRequests, index)
  end
end)