B_SERVICE = {}

B_SERVICE.SharedObject = {
    ["Client"] = "esx:getSharedObject",
    ["Server"] = "esx:getSharedObject",
}

B_SERVICE.DeathEvent = "esx:onPlayerDeath"
B_SERVICE.ReviveTrigger = "playerSpawned"

B_SERVICE.SyncDelay = 10 * 1000 -- Anti Sync Spam (10s Wartezeit)

B_SERVICE.BleedOutTimer = 600 -- Zeit in Sekunden bis man ausbluten
B_SERVICE.EarlyRespawn = 300 -- Zeit in Sekunden bis man vorher respawnen kann

B_SERVICE.SendDispatch = function()
    TriggerServerEvent('esx_ambulancejob:onPlayerDistress')

    ESX.ShowNotification("Dispatch erfolgreich gesendet.")
end

B_SERVICE.BloodOut = function()
    TriggerEvent("b_deathscreen:removeItemsAfterRPDeath")
end

B_SERVICE.CanTriggerDeathEvent = function() -- Hier kann man z.B. exports von FFA hinzufügen um das Triggern des Death Events zu verhindern.
    return true
end