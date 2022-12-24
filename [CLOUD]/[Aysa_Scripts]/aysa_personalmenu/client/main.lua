_menuPool = NativeUI.CreatePool()
local mainMenu
local billingMenu
local type

Client = {
  openMenu = function()
    mainMenu = NativeUI.CreateMenu('Cloud-V', 'Personalmenu')
    _menuPool:Add(mainMenu)
    local moneyItem = NativeUI.CreateItem('Bargeld:', '~w~')
    local bankItem = NativeUI.CreateItem('Kontostand:', '~w~')
    local dirtyItem = NativeUI.CreateItem('Schwarzgeld:', '~w~')
    local placeHolder = NativeUI.CreateItem('', '~w~')
    local placeHolder2 = NativeUI.CreateItem('', '~w~')
    local giveMoney = NativeUI.CreateItem('Bargeld geben', '~w~')
    local giveDirty = NativeUI.CreateItem('Schwarzgeld geben', '~w~')
    local throwDirty = NativeUI.CreateItem('Schwarzgeld wegwerfen', '~w~')
    local giveCar = NativeUI.CreateItem('Fahrzeug weitergeben', '~w~')
    local openMenu = NativeUI.CreateItem('Rechnungen', '~w~')


    ESX.TriggerServerCallback('aysa_personalmenu:server:getData', function(data)
      moneyItem:RightLabel(data.money .. ' ~g~$')
      bankItem:RightLabel(data.bank .. ' ~g~$')
      dirtyItem:RightLabel(data.dirty .. ' ~g~$')
    end)

    openMenu:RightLabel('~w~>>')

   
    giveDirty.Activated = function(sender, index)
      local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

      if closestPlayer == -1 or closestDistance > 3.0 then
        TriggerEvent("sanity:notify", "System", "Keine Person in der Nähe", 5000, "error")
        return
      end

      ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'giveDirty', {
        title = 'Schwarzgeld geben'
      }, function(data, menu)
        local amount = tonumber(data.value)
        if amount == nil or amount < 1 then
          TriggerEvent("sanity:notify", "System", "Ungültige Eingabe", 5000, "error")
        else
          closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
          if closestPlayer == -1 or closestDistance > 3.0 then
            TriggerEvent("sanity:notify", "System", "Keine Person in der Nähe", 5000, "error")
            menu.close()
            return
          end

          ESX.TriggerServerCallback('aysa_personalmenu:server:giveDirty', function(valid)
            if not valid then
              TriggerEvent("sanity:notify", "ERROR", "Du hast nicht genug Schwarzgeld", 5000, "error")
            else
              TriggerEvent("sanity:notify", "ERROR", 'Du hast ' .. amount .. ' $ Schwarzgeld gegeben', 5000, "success")
            end
          end, GetPlayerServerId(closestPlayer), amount)
        end
        menu.close()
      end, function(data, menu)
        menu.close()
      end)
    end

    throwDirty.Activated = function(sender, index)
      ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'throwDirty', {
        title = 'Schwarzgeld wegwerfen'
      }, function(data, menu)
        local amount = tonumber(data.value)
        if amount == nil or amount < 1 then
          TriggerEvent("sanity:notify", "System", "Ungültige Eingabe", 5000, "error")
        else
          ESX.TriggerServerCallback('aysa_personalmenu:server:throwDirty', function(valid)
            if not valid then
              TriggerEvent("sanity:notify", "ERROR", "Du hast nicht genug Schwarzgeld", 5000, "error")
            else
              TriggerEvent("sanity:notify", "ERFOLGREICH", 'Du hast ' .. amount .. ' $ Schwarzgeld weggeworfen', 5000, "success")
            end
          end, amount)
        end
        menu.close()
      end, function(data, menu)
        menu.close()
      end)
    end

    giveCar.Activated = function(sender, index)
      local playerPed = PlayerPedId()
      local vehicle = GetVehiclePedIsIn(playerPed, false)
      if vehicle == 0 then
        TriggerEvent("sanity:notify", "ERROR", "Du bist in keinen Fahrzeug", 5000, "error")
        return
      end

      local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
      if closestPlayer == -1 or closestDistance > 3.0 then
        TriggerEvent("sanity:notify", "System", "Keine Person in der Nähe", 5000, "error")
        return
      end

      local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)

      ESX.TriggerServerCallback('aysa_personalmenu:server:giveCar', function(valid)
        if type(valid) == "string" and valid == 'not_owned' then
          TriggerEvent("sanity:notify", "System", "Dieses Fahrzeug gehört dir nicht", 5000, "error")
        end

        if valid then
          TriggerEvent("sanity:notify", "System", "Du hast die Fahrzeugpapiere + Schlüßel weitergegeben", 5000, "success")
        else
          TriggerEvent("sanity:notify", "System", "Ein Fehler ist aufgetreten", 5000, "error")
        end

      end, GetPlayerServerId(closestPlayer), vehicleProps)
    end

    openMenu.Activated = function (sender, index)
      Client.openBillingMenu()
    end

    giveMoney.Activated = function(sender, index)
      local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

      if closestPlayer == -1 or closestDistance > 3.0 then
        TriggerEvent("sanity:notify", "System", "Keine Person in der Nähe", 5000, "error")
        return
      end

      ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'giveMoney', {
        title = 'Bargeld geben'
      }, function(data, menu)
        local amount = tonumber(data.value)
        if amount == nil then
          TriggerEvent("sanity:notify", "System", "Ungültige Eingabe", 5000, "error")
        else
          closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
          if closestPlayer == -1 or closestDistance > 3.0 then
            TriggerEvent("sanity:notify", "System", "Keine Person in der Nähe", 5000, "error")
            menu.close()
            return
          end

          ESX.TriggerServerCallback('aysa_personalmenu:server:giveMoney', function(valid)
            if not valid then
              TriggerEvent("sanity:notify", "System", "Du hast nicht genügend Geld", 5000, "error")
            else
              TriggerEvent("sanity:notify", "System", 'Du hast ' .. amount .. ' $ Bargeld gegeben', 5000, "success")
            end
          end, GetPlayerServerId(closestPlayer), amount)
        end
        menu.close()
      end, function(data, menu)
        menu.close()
      end)
    end


    mainMenu:AddItem(moneyItem)
    mainMenu:AddItem(bankItem)
    mainMenu:AddItem(dirtyItem)
    mainMenu:AddItem(placeHolder)
    mainMenu:AddItem(giveMoney)
    mainMenu:AddItem(giveDirty)
    mainMenu:AddItem(throwDirty)
    mainMenu:AddItem(giveCar)
    mainMenu:AddItem(placeHolder2)
    mainMenu:AddItem(openMenu)
    placeHolder:Enabled(false)
    placeHolder2:Enabled(false)
    mainMenu:Visible(true)
    _menuPool:MouseEdgeEnabled(false)
    _menuPool:MouseControlsEnabled(false)
  end,

  openBillingMenu = function()
    billingMenu = NativeUI.CreateMenu('Cloud-V', 'Rechnungen')
    _menuPool:Add(billingMenu)

    local giveBilling = NativeUI.CreateItem('Rechnung schreiben', '~w~')


    ESX.TriggerServerCallback('esx_billing:getBills', function(data)
      for k, v in pairs(data) do
        local item = NativeUI.CreateItem(v.label, '~w~')
        item:RightLabel('~r~' .. v.amount .. ' ~r~$')
        billingMenu:AddItem(item)

        item.Activated = function(sender, index)
          ESX.TriggerServerCallback('esx_billing:payBill', function(cb)
            print('[Cloud-V] Rechnung bezahlt')
          end, v.id)
        end
      end
    end)

    giveBilling.Activated = function(sender, index)
      local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

      if closestPlayer == -1 or closestDistance > 3.0 then
        TriggerEvent("sanity:notify", "System", "Keine Person in der Nähe", 5000, "error")
        return
      end

      ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'giveBilling', {
        title = 'Betrag'
      }, function(data, menu)
        local amount = tonumber(data.value)
        if amount == nil or amount < 1 then
          TriggerEvent("sanity:notify", "System", "Ungültige Eingabe", 5000, "error")
          menu.close()
          return
        end

        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'giveBillingReason', {
          title = 'Grund'
        }, function(data2, menu2)
          local reason = data2.value
          if reason == nil or reason == '' then
            TriggerEvent("sanity:notify", "System", "Ungültige Eingabe", 5000, "error")
            menu2.close()
            return
          end

          if closestPlayer == -1 or closestDistance > 3.0 then
            TriggerEvent("sanity:notify", "System", "Keine Person in der Nähe", 5000, "error")
            menu2.close()
            return
          end

          ESX.TriggerServerCallback('aysa_personalmenu:server:giveBilling', function(valid)
            if not valid then
              TriggerEvent("sanity:notify", "System", "Ungültige Eingabe", 5000, "error")
            else
              TriggerEvent("sanity:notify", "RECHNUNG", "Die Rechnung wurde erfolgreich erstellt", 5000, "success")
            end
          end, GetPlayerServerId(closestPlayer), reason, amount)

          menu2.close()
        end, function(data2, menu2)
          menu2.close()
        end)

        menu.close()
      end, function(data, menu)
        menu.close()
      end)
    end

    
    billingMenu:AddItem(giveBilling)
    mainMenu:Visible(false)
    billingMenu:Visible(true)
    _menuPool:MouseControlsEnabled(false)
    _menuPool:MouseEdgeEnabled(false)
  end
}

Citizen.CreateThread(function()
  while true do
    _menuPool:ProcessMenus()
    Citizen.Wait(1)
  end
end)

RegisterCommand('test', function()
  Client.openMenu()
end)

RegisterKeyMapping('test', 'Öffnet das Personalmenu', 'keyboard', 'F3')

function ShowNotification(text)
	SetNotificationTextEntry('STRING')
  AddTextComponentString(text)
	DrawNotification(false, true)
end


CreateThread(function()
  while true do
      if type == "ulow" then
          for ped in GetWorldPeds() do
              if not IsEntityOnScreen(ped) then
                  SetEntityAlpha(ped, 0)
                  SetEntityAsNoLongerNeeded(ped)
              else
                  if GetEntityAlpha(ped) == 0 then
                      SetEntityAlpha(ped, 255)
                  elseif GetEntityAlpha(ped) ~= 210 then
                      SetEntityAlpha(ped, 210)
                  end
              end

              SetPedAoBlobRendering(ped, false)
              Wait(1)
          end

          for obj in GetWorldObjects() do
              if not IsEntityOnScreen(obj) then
                  SetEntityAlpha(obj, 0)
                  SetEntityAsNoLongerNeeded(obj)
              else
                  if GetEntityAlpha(obj) == 0 then
                      SetEntityAlpha(obj, 255)
                  elseif GetEntityAlpha(obj) ~= 170 then
                      SetEntityAlpha(obj, 170)
                  end
              end
              Wait(1)
          end


          DisableOcclusionThisFrame()
          SetDisableDecalRenderingThisFrame()
          RemoveParticleFxInRange(GetEntityCoords(PlayerPedId()), 10.0)
          OverrideLodscaleThisFrame(0.4)
          SetArtificialLightsState(true)
      elseif type == "low" then
          for ped in GetWorldPeds() do
              if not IsEntityOnScreen(ped) then
                  SetEntityAlpha(ped, 0)
                  SetEntityAsNoLongerNeeded(ped)
              else
                  if GetEntityAlpha(ped) == 0 then
                      SetEntityAlpha(ped, 255)
                  elseif GetEntityAlpha(ped) ~= 210 then
                      SetEntityAlpha(ped, 210)
                  end
              end
              SetPedAoBlobRendering(ped, false)

              Wait(1)
          end

          for obj in GetWorldObjects() do
              if not IsEntityOnScreen(obj) then
                  SetEntityAlpha(obj, 0)
                  SetEntityAsNoLongerNeeded(obj)
              else
                  if GetEntityAlpha(obj) == 0 then
                      SetEntityAlpha(obj, 255)
                  elseif GetEntityAlpha(ped) ~= 210 then
                      SetEntityAlpha(ped, 210)
                  end
              end
              Wait(1)
          end

          SetDisableDecalRenderingThisFrame()
          RemoveParticleFxInRange(GetEntityCoords(PlayerPedId()), 10.0)
          OverrideLodscaleThisFrame(0.6)
          SetArtificialLightsState(true)
      elseif type == "medium" then
          for ped in GetWorldPeds() do
              if not IsEntityOnScreen(ped) then
                  SetEntityAlpha(ped, 0)
                  SetEntityAsNoLongerNeeded(ped)
              else
                  if GetEntityAlpha(ped) == 0 then
                      SetEntityAlpha(ped, 255)
                  end
              end

              SetPedAoBlobRendering(ped, false)
              Wait(1)
          end
      
          for obj in GetWorldObjects() do
              if not IsEntityOnScreen(obj) then
                  SetEntityAlpha(obj, 0)
                  SetEntityAsNoLongerNeeded(obj)
              else
                  if GetEntityAlpha(obj) == 0 then
                      SetEntityAlpha(obj, 255)
                  end
              end
              Wait(1)
          end

          OverrideLodscaleThisFrame(0.8)
      else
          Wait(500)
      end
      Wait(8)
  end
end)

CreateThread(function()
  while true do
      if type == "ulow" or type == "low" then
          ClearAllBrokenGlass()
          ClearAllHelpMessages()
          LeaderboardsReadClearAll()
          ClearBrief()
          ClearGpsFlags()
          ClearPrints()
          ClearSmallPrints()
          ClearReplayStats()
          LeaderboardsClearCacheData()
          ClearFocus()
          ClearHdArea()
          ClearPedBloodDamage(PlayerPedId())
          ClearPedWetness(PlayerPedId())
          ClearPedEnvDirt(PlayerPedId())
          ResetPedVisibleDamage(PlayerPedId())
          ClearExtraTimecycleModifier()
          ClearTimecycleModifier()
          ClearOverrideWeather()
          ClearHdArea()
          DisableVehicleDistantlights(false)
          DisableScreenblurFade()
          SetRainLevel(0.0)
          SetWindSpeed(0.0)
          Wait(300)
      elseif type == "medium" then
          ClearAllBrokenGlass()
          ClearAllHelpMessages()
          LeaderboardsReadClearAll()
          ClearBrief()
          ClearGpsFlags()
          ClearPrints()
          ClearSmallPrints()
          ClearReplayStats()
          LeaderboardsClearCacheData()
          ClearFocus()
          ClearHdArea()
          SetWindSpeed(0.0)
          Wait(1000)
      else
          Wait(1500)
      end
  end
end)

local entityEnumerator = {
  __gc = function(enum)
      if enum.destructor and enum.handle then
          enum.destructor(enum.handle)
      end
      enum.destructor = nil
      enum.handle = nil
  end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
  return coroutine.wrap(
      function()
          local iter, id = initFunc()
          if not id or id == 0 then
              disposeFunc(iter)
              return
          end

          local enum = {handle = iter, destructor = disposeFunc}
          setmetatable(enum, entityEnumerator)

          local next = true
          repeat
              coroutine.yield(id)
              next, id = moveFunc(iter)
          until not next

          enum.destructor, enum.handle = nil, nil
          disposeFunc(iter)
      end
  )
end

function GetWorldObjects()
  return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function GetWorldPeds()
  return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function GetWorldVehicles()
  return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function GetWorldPickups()
  return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end

function FPSBoosterUM(shadow,air,entity,dynamic,tracker,depth,bounds,distance,tweak,sirens,lights,notify)
  RopeDrawShadowEnabled(shadow)
  CascadeShadowsClearShadowSampleType()
  CascadeShadowsSetAircraftMode(air)
  CascadeShadowsEnableEntityTracker(entity)
  CascadeShadowsSetDynamicDepthMode(dynamic)
  CascadeShadowsSetEntityTrackerScale(tracker)
  CascadeShadowsSetDynamicDepthValue(depth)
  CascadeShadowsSetCascadeBoundsScale(bounds)
  SetFlashLightFadeDistance(distance)
  SetLightsCutoffDistanceTweak(tweak)
  DistantCopCarSirens(sirens)
  SetArtificialLightsState(lights)
end