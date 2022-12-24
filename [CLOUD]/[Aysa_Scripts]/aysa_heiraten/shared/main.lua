ZERO = {}

ZERO.Settings = {
  coords = vector3(-779.98, -0.51, 40.56),
  heading = 214.18,
  item = "ring",
}

function ShowNotification(message)
  TriggerEvent("sanity:notify", "Heiraten", message, 5000, "info")
end

function announce(message)
  TriggerClientEvent("sanity:announce", -1, message, 6000)
end