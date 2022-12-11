Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60000)
        TriggerServerEvent('devine_playtime:add')
    end
end)

