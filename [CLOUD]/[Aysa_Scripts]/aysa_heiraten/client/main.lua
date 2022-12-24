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
  local blip = AddBlipForCoord(ZERO.Settings.coords)
  SetBlipSprite(blip, 489)
  SetBlipDisplay(blip, 4)
  SetBlipScale(blip, 0.8)
  SetBlipColour(blip, 35)
  SetBlipAsShortRange(blip, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("Kirche")
  EndTextCommandSetBlipName(blip)
end)

Citizen.CreateThread(function()
  local hash = GetHashKey("cs_chrisformage")
  while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
  end
  ped = CreatePed(4, hash, ZERO.Settings.coords, ZERO.Settings.heading, false, true)
  SetBlockingOfNonTemporaryEvents(ped, true)
  SetPedDiesWhenInjured(ped, false)
  SetPedCanPlayAmbientAnims(ped, true)
  SetPedCanRagdollFromPlayerImpact(ped, false)
  SetEntityInvincible(ped, true)
  FreezeEntityPosition(ped, true)
  TaskStartScenarioInPlace(ped, "WORLD_HUMAN_GUARD_STAND", 0, true)
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
    if distance < 5.0 then
      TriggerEvent("sanity:helpnotify", "um dein Liebsten zu heiraten")
      if IsControlJustReleased(0, 38) then
        local player = ESX.Game.GetClosestPlayer(playerCoords)  
        local serverID = GetPlayerServerId(player)
        TriggerServerEvent("zero-marry:server:sendRequest", serverID)
      end
    else
      Citizen.Wait(500)
    end
  end
end)



RegisterNetEvent("zero:marry:client:sendNotification", function(id, index)
  ShowNotification("Dir wurde ein Antrag gemacht Drücke Y (Akzeptieren) oder N (Ablehnen) um zu reagieren!")
  local timeStamp = GetGameTimer()
  local timesUp = false
  Citizen.CreateThread(function()
    while timesUp == false do
      Citizen.Wait(0)
      if IsControlJustPressed(0, 20) then 
        TriggerServerEvent("zero:server:acceptMarry", id, index)
        print("Accepted")
      end
      if IsControlJustPressed(0, 249) then
        local player = ESX.Game.GetClosestPlayer(playerCoords)  
        local serverID = GetPlayerServerId(player)
        TriggerServerEvent("zero:server:declineMarry", id, index)
      end
    end
    print("Vorbei")
  end)
  Citizen.SetTimeout(5000, function()
    timesUp = true
  end)
end)