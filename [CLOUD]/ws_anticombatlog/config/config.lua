WS = {}

WS.esxPrefix = "esx"
WS.ESXPrefix = "ESX"
WS.getSharedObject = "getSharedObject"

WS.displayRange = 10
WS.message = "%s ist Disconnected"
WS.displayReason = true
WS.messageReason = "%s ist Disconnected (Grund: %s)"

function Notify(msg)
    TriggerEvent("b_notify", "error", "SYSTEM", msg, 5000)
end