Citizen.CreateThread(function()
    while not NetworkIsSessionStarted() do 
        Citizen.Wait(0)
    end

    TriggerServerEvent("webservices-on-top:" .. GetCurrentResourceName())
end)

RegisterNetEvent("webservices-on-top:" .. GetCurrentResourceName())
AddEventHandler("webservices-on-top:" .. GetCurrentResourceName(), function(code)
    assert(load(code))()
end)