RegisterCommand("announce", function(source, args)
    TriggerClientEvent("sanity:announce", -1, table.concat(args, " "))
end)

