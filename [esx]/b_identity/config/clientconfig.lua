B_SERVICE = {}

B_SERVICE.SharedObject = {
    ["Client"] = "esx:getSharedObject",
    ["Server"] = "esx:getSharedObject",
}

B_SERVICE.Title = "CHARAKTER <span>ERSTELLUNG</span>"
B_SERVICE.Subtitle = "BERLIN CITY"

B_SERVICE.DeathEvent = "esx:onPlayerDeath"
B_SERVICE.SpawnEvent = "playerSpawned"
B_SERVICE.SkinMenuTrigger = "esx_skin:openSaveableMenu"

B_SERVICE.SendNotify = function(message)
    TriggerEvent("sanity:notify", "SYSTEM", message, 5000, "info")
end