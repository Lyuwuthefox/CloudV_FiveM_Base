B_SERVICE = {}

B_SERVICE.InventoryKeybind = "F2"
B_SERVICE.TrunkKeybind = "G"

B_SERVICE.CheckIfVehicleIsClosed = true

B_SERVICE.SharedObject = {
    ["Client"] = "esx:getSharedObject",
    ["Server"] = "esx:getSharedObject",
}

B_SERVICE.SendNotify = function(color, title, message, time)
    TriggerEvent("sanity:notify","System",message, 5000, color)
end