DEVINE = {}

DEVINE.Settings = {
  coords = vector3(-779.98, -0.63, 40.56),
  heading = 207.9,
  item = "ring",
}

-- Notify Trigger
function ShowNotification(message)
  TriggerEvent("b_notify", "success", "Heiraten", message, 5000)
end

-- Announce Trigger
function announce(message)
  TriggerClientEvent("b_announce", -1, message)
end