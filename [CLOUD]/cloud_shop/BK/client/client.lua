ESX = nil

local currentShop 

function OpenBuyLicenseMenu(v)
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_license', {
		title ='Waffenlizenz kaufen?',
		align = 'top-left',
		elements = {
			{label = 'Nein', value = 'nein'},
			{label = 'Kaufen für <span style="color: green;"> $' ..  ESX.Math.GroupDigits(Config.WeaponLicensePrice) .. '</span>?', value = 'yes'},
		}
	}, function(data, menu)
    menu.close()

    if data.current.value == 'yes' then

			ESX.TriggerServerCallback('bc_shops:buyLicense', function(bought)
				if bought then
          OpenShop(v)
				end
			end)
		end
	end, function(data, menu)
		menu.close()
	end)
end

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
    
  while ESX.GetPlayerData().job == nil do
    Wait(0)
  end
    
  ESX.PlayerData = ESX.GetPlayerData()
end)

Citizen.CreateThread(function()
  for k,v in pairs(Config.Positions) do 
    if Config.Blips[v.type].enabled then 
      local blip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)

      SetBlipSprite(blip, Config.Blips[v.type].sprite)
      SetBlipDisplay(blip, Config.Blips[v.type].display)
      SetBlipScale(blip, Config.Blips[v.type].scale)
      SetBlipColour(blip, Config.Blips[v.type].color)
      SetBlipAsShortRange(blip, Config.Blips[v.type].shortrange)
  
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(Config.Blips[v.type].text)
      EndTextCommandSetBlipName(blip)
    end
  end
end)

Citizen.CreateThread(function()
  while true do 
    Wait(0)

    local coords = GetEntityCoords(PlayerPedId())
    local canSleep = true

    for k,v in pairs(Config.Positions) do 
      local distance = #(coords - v.coords)

      if distance <= 10.0 then 
        canSleep = false 
        
        DrawMarker(29, v.coords.x, v.coords.y, v.coords.z, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 255, 0, 0, 100, false, false, false, true, 0, 0, 0)

        if distance <= 1.5 then 
          ESX.ShowHelpNotification("Drücke E zum interagieren")

          if IsControlJustPressed(0, 38) then
            CheckType(v)
          end
        end
      end
    end

    if canSleep then 
      Wait(1500)
    end
  end
end)

function CheckType(v)
  currentShop = v.type 

  if currentShop == "weaponshop" then 
    ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
      if hasWeaponLicense then
        OpenShop(v)
      else
        OpenBuyLicenseMenu(v)
      end
    end, GetPlayerServerId(PlayerId()), 'weapon')
  else
    OpenShop(v)
  end

end

function OpenShop(shopData)
  SetNuiFocus(true, true)

  SendNUIMessage({
    clear = true
  })

  for k1,v1 in pairs(Config.Items[shopData.type]) do 
    for k, v in pairs(v1) do 
      SendNUIMessage({
        category = k1,
        name = v.name,
        label = v.label,
        price = v.price,
        type = v.type,
      })
    end
  end

  for k1,v1 in pairs(Config.Items[shopData.type]) do 
    SendNUIMessage({
      categoryName = k1,
    })
  end

  SendNUIMessage({
    display = true
  })
end

RegisterNUICallback('exit', function()
  SendNUIMessage({
    display = false
  })
  SetNuiFocus(false, false)
end)

RegisterNUICallback('buyItem', function(data)
  TriggerServerEvent("bc_shops:buyItem", currentShop, data.item, data.category, data.amount, data.type, data.payment)

  SendNUIMessage({
    display = false
  })
  SetNuiFocus(false, false)
end)