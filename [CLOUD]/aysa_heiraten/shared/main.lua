ZERO = {}

ZERO.Settings = {
  coords = vector3(-779.98, -0.51, 40.56),
  heading = 214.18,
  item = "ring",
}

function ShowNotification(message)
  TriggerEvent("b_notify", "success", "Marriage", message, 5000)
end

function announce(message)
  TriggerClientEvent("b_announce", -1, message)
end