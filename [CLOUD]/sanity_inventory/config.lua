Config = {}

Config.getSharedObject = 'esx:getSharedObject'

Config.OpenKey = 289 -- null = komplett aus

Config.notificationClient = function(message)
    TriggerEvent("sanity:notify", "INVENTARSYSTEM", message, 5000, "success")

    
end

Config.notificationServer = function(message, source)
    TriggerClientEvent("sanity:notify",source, "INVENTARSYSTEM", message, 5000, "success")

    
end

Config.nearbyTrunkRadius = 5.0

Config.animations = {
    ItemMovedToTrunk = true,
    ThrowItem = true,
    GiveItem = true
}

Config.Vehicles = {
    ["T20"] = {
        weight = 25,
        slots = 10
    }
}

Config.NotFound = {
    weight = 5,
    slots = 25
}