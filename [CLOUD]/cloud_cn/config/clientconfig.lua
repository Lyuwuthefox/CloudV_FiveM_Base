B_SERVICE = {}

B_SERVICE.SharedObject = {
    ["Client"] = "esx:getSharedObject",
    ["Server"] = "esx:getSharedObject",
}

B_SERVICE.DrawDistance = 30.0 

B_SERVICE.Blip = {
	enabled = true, 
	sprite = 525,
	display = 4,
	scale = 0.7,
	color = 0,
	shortrange = true,
	text = "Bürgeramt"
}

B_SERVICE.Title = "NAMENS<span>ÄNDERUNG</span>"
B_SERVICE.Subtitle = "STADTHALLE"

B_SERVICE.Price = 500000
B_SERVICE.HTMLPRICE = B_SERVICE.Price .. "€"

B_SERVICE.Position = vector3(-551.47, -201.57, 37.23)
B_SERVICE.MarkerType = 1
B_SERVICE.Scale = { x = 1.0, y = 1.0, z = 1.0 }
B_SERVICE.Color = { r = 11, g = 154, b = 245, a = 100 }

B_SERVICE.SendNotify = function(color, title, message, time)
    TriggerEvent("sanity:notify", "BÜRGERAMT", message, 5000, color)
end