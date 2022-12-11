ESX, ped = nil, nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)


AddEventHandler("onResourceStop", function(resource)
  if resource == GetCurrentResourceName() then
    DeleteEntity(ped)
  end
end)


Citizen.CreateThread(function()
  local hash = GetHashKey("ig_priest")
  while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
  end
  ped = CreatePed(4, hash, DEVINE.Settings.coords, DEVINE.Settings.heading, false, true)
  SetBlockingOfNonTemporaryEvents(ped, true)
  SetPedDiesWhenInjured(ped, false)
  SetPedCanPlayAmbientAnims(ped, true)
  SetPedCanRagdollFromPlayerImpact(ped, false)
  SetEntityInvincible(ped, true)
  FreezeEntityPosition(ped, true)
  TaskStartScenarioInPlace(ped, "WORLD_HUMAN_GUARD_STAND", 0, true)
end)


Citizen.CreateThread(function()
  local blip = AddBlipForCoord(DEVINE.Settings.coords)
  SetBlipSprite(blip,  621)
  SetBlipColour(blip, 75 )
  SetBlipScale(blip, 0.8)
  SetBlipAsShortRange(blip, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("Heiraten")
  EndTextCommandSetBlipName(blip)
end)

function HelpNotify(text)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1000)
    playerPed = PlayerPedId()
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local playerCoords = GetEntityCoords(playerPed)
    local npcCoords = GetEntityCoords(ped)
    local distance = #(playerCoords - npcCoords)
    if distance < 4.0 then
      ESX.ShowHelpNotification("um dein Liebsten zu heiraten!")
      if IsControlJustReleased(0, 38) then
        local player = ESX.Game.GetClosestPlayer(playerCoords)  
        local serverID = GetPlayerServerId(player)
        TriggerServerEvent("DEVINE-marry:server:sendRequest", serverID)
      end
    else
      Citizen.Wait(500)
    end
  end
end)



RegisterNetEvent("DEVINE:marry:client:sendNotification", function(id, index)
  ShowNotification("Du hat eine Anfrage zur Verlobung erhalten Drücke Y (Akzeptieren) oder N (Ablehnen)")
  local timeStamp = GetGameTimer()
  local timesUp = false
  Citizen.CreateThread(function()
    while timesUp == false do
      Citizen.Wait(0)
      if IsControlJustPressed(0, 20) then 
        TriggerServerEvent("DEVINE:server:acceptMarry", id, index)
        print("Accepted")
        ShowNotification("Du hast die Verlobung angenommen!")
      end
      if IsControlJustPressed(0, 249) then
        local player = ESX.Game.GetClosestPlayer(playerCoords)  
        local serverID = GetPlayerServerId(player)
        TriggerServerEvent("DEVINE:server:declineMarry", id, index)
        ShowNotification("Du hast die Verlobung abgelehnt!")
      end
    end
    print("Vorbei")
  end)
  Citizen.SetTimeout(5000, function()
    timesUp = true
  end)
end)