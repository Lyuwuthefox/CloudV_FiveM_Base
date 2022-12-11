TriggerEvent('es:addGroupCommand', 'tp', 'admin', function(source, args, user)
	local x = tonumber(args[1])
	local y = tonumber(args[2])
	local z = tonumber(args[3])
	
	if x and y and z then
		TriggerClientEvent("esx:teleport", source, {
			x = x,
			y = y,
			z = z
		})
	else
		TriggerClientEvent("ws_notify", source, "ERROR", "System", "Falsche Koordinaten", 5000)

	end
end, function(source, args, user)
	TriggerClientEvent("ws_notify", source, "ERROR", "System", "Keine Rechte!", 5000)
end, {help = "Teleport to coordinates", params = {{name = "x", help = "X coords"}, {name = "y", help = "Y coords"}, {name = "z", help = "Z coords"}}})
