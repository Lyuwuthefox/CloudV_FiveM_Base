-- Leaked By: Leaking Hub | J. Snow | leakinghub.com

ESX = nil
local PlayerData = {}
local cam            = nil
local isCameraActive = false
local zoomOffset     = 0.0
local camOffset      = 0.0
local heading        = 90.0

local LastSkin = nil

local isNearShop = false
local isInShop = false
local isPedLoaded = false
local npc = nil
local hasBought = false
local wasInMenu = false

local bannerstyle = 'shopui_title_barber'

if Config.useESX then
	Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	PlayerData = ESX.GetPlayerData()
	
	end)
end
_menuPool = NativeUI.CreatePool()


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(300)

		local playerPed = PlayerPedId()
        local playerloc = GetEntityCoords(playerPed, 0)

		isNearShop = false
		isInShop = false

		for k, loc in pairs(Config.Shops) do
			local distance = Vdist(playerloc, loc.x, loc.y, loc.z)

			if distance < 30 then
				isNearShop = true
				if not isPedLoaded then
				
					RequestModel(GetHashKey("s_f_m_fembarber"))
					while not HasModelLoaded(GetHashKey("s_f_m_fembarber")) do
						Wait(1)
					end
					FreezeEntityPosition(npc, true)	
					SetEntityHeading(npc, loc.rot)
					SetEntityInvincible(npc, true)
					SetBlockingOfNonTemporaryEvents(npc, true)                    
					isPedLoaded = true
					
					TriggerEvent('skinchanger:getSkin', function(skin)
						LastSkin = skin
					end)
				end
			end

			if distance < 2.0 then
				isInShop = true
				bannerstyle = loc.type
			end

		end

		if (isPedLoaded and not isNearShop) then
            DeleteEntity(npc)
			SetModelAsNoLongerNeeded(GetHashKey("s_f_m_fembarber"))
			isPedLoaded = false
		end
		
		if (wasInMenu and not isInShop) then
			if not hasBought then
				TriggerEvent('skinchanger:loadSkin', LastSkin)
			end
			wasInMenu = false
		end


	end

end)

Citizen.CreateThread(function()


	while true do
		Citizen.Wait(1)

		if isInShop then
			_menuPool:ProcessMenus()
			TriggerEvent("sanity:helpnotify", "um deine Haare zu ändern")
			if IsControlJustReleased(1, 38) then
				hasBought = false
				wasInMenu = true
				generateMenu(mainMenu)
				
			end
		end

		if isCameraActive then
			if IsControlJustReleased(1, 202) then
				DeleteSkinCam()
			end
		end
	
	end


end)

Citizen.CreateThread(function()
	
	for i=1, #Config.Shops, 1 do
		
		local blip = AddBlipForCoord(Config.Shops[i].x, Config.Shops[i].y, Config.Shops[i].z)

		SetBlipSprite (blip, 71)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 1.0)
		SetBlipColour (blip, 4)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(Config.BlipName)
		EndTextCommandSetBlipName(blip)
	end

end)

function ShowNotification(text)
	SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
	DrawNotification(false, true)
end



function generateMenu()

	if mainMenu ~= nil and mainMenu:Visible() then
		mainMenu:Visible(false)
		--_menuPool:CloseAllMenus()
	end

	_menuPool:Remove()
	collectgarbage()

	mainMenu = NativeUI.CreateMenu(nil, nil, nil)
	local background = Sprite.New(bannerstyle, bannerstyle, 0, 0, 431, 38)
	mainMenu:SetBannerSprite(background, true)
	_menuPool:Add(mainMenu)
	
	-- Haare1
	local hair1 = GetNumberOfPedDrawableVariations(PlayerPedId(-1), 2)
	-- Haarfarbe
	local hairColorsAmount = GetNumHairColors()-1
	
	local beard1 = GetNumHeadOverlayValues(1)-1
	local beardColorsAmount = GetNumHairColors()-1

	local eyebrows1 = GetNumHeadOverlayValues(2)-1
	local eyebrowColorsAmount = GetNumHairColors()-1

	local makeup1 = GetNumHeadOverlayValues(4)-1
	local makeupColorsAmount = GetNumHairColors()-1

	local lipstick1 = GetNumHeadOverlayValues(8)-1
	local lipstickColorAmount = GetNumHairColors()-1
	--Menus
	local hairs = _menuPool:AddSubMenu(mainMenu, 'Haare')
	mainMenu.Items[1]:RightLabel(LastSkin['hair_1']-1 .. ' / ' .. hair1)
	local hairColor = _menuPool:AddSubMenu(mainMenu, 'Haarfarbe')
	mainMenu.Items[2]:RightLabel(LastSkin['hair_color_1']-1 .. ' / ' .. hairColorsAmount)
	local beard = _menuPool:AddSubMenu(mainMenu, 'Bart')
	mainMenu.Items[3]:RightLabel(LastSkin['beard_1']-1 .. ' / ' .. beard1)
	local beardColor = _menuPool:AddSubMenu(mainMenu, 'Bartfarbe')
	mainMenu.Items[4]:RightLabel(LastSkin['beard_3']-1 .. ' / ' .. beardColorsAmount)

	local cosmetic = _menuPool:AddSubMenu(mainMenu, 'Kosmetik')
	mainMenu.Items[5]:RightLabel('~y~→→→')
	local eyebrows = _menuPool:AddSubMenu(cosmetic, 'Augenbraun')
	cosmetic.Items[1]:RightLabel(LastSkin['eyebrows_1']-1 .. ' / ' .. eyebrows1)
	local eyebrowsColor = _menuPool:AddSubMenu(cosmetic, 'Augenbraun Farbe')
	cosmetic.Items[2]:RightLabel(LastSkin['eyebrows_3']-1 .. ' / ' .. eyebrowColorsAmount)
	local makeup = _menuPool:AddSubMenu(cosmetic, 'Make-Up')
	cosmetic.Items[3]:RightLabel(LastSkin['makeup_1']-1 .. ' / ' .. makeup1)
	local makeupColor = _menuPool:AddSubMenu(cosmetic, 'Make-Up Farbe')
	cosmetic.Items[4]:RightLabel(LastSkin['makeup_3']-1 .. ' / ' .. makeupColorsAmount)
	local lipstick = _menuPool:AddSubMenu(cosmetic, 'Lippenstift')
	cosmetic.Items[5]:RightLabel(LastSkin['lipstick_1']-1 .. ' / ' .. lipstick1)
	local lipstickColor = _menuPool:AddSubMenu(cosmetic, 'Lippenstift Farbe')
	cosmetic.Items[6]:RightLabel(LastSkin['lipstick_3']-1 .. ' / ' .. lipstickColorAmount)

	cosmetic:SetBannerSprite(background, true)
	hairs:SetBannerSprite(background, true)
	hairColor:SetBannerSprite(background, true)
	beard:SetBannerSprite(background, true)
	beardColor:SetBannerSprite(background, true)
	eyebrows:SetBannerSprite(background, true)
	eyebrowsColor:SetBannerSprite(background, true)
	makeup:SetBannerSprite(background, true)
	makeupColor:SetBannerSprite(background, true)
	lipstick:SetBannerSprite(background, true)
	lipstickColor:SetBannerSprite(background, true)
	--beard1 beard2 = Bart + Bartdichte



	local spacer = NativeUI.CreateItem('~b~', '~b~')
	local confirm = NativeUI.CreateItem('~g~Bestätigen', 'Verändere dein Aussehen')
	if Config.useESX then
		confirm:RightLabel('~g~' .. Config.Price .. '$')
	end

	mainMenu:AddItem(spacer)
	mainMenu:AddItem(confirm)

	--Haare1

	for i=0, hair1-1, 1 do
		
		local values = {}
		local amountOfVariations = GetNumberOfPedTextureVariations(PlayerPedId(-1), 2, i)
		if amountOfVariations > 1 then
			for i=0, amountOfVariations-1, 1 do
				table.insert(values, i)
			end
			
			if LastSkin['hair_1']-1 == i then
				local variation = NativeUI.CreateListItem('~y~Haar (#' .. i .. ')', values, LastSkin['hair_2'])
				hairs:AddItem(variation)
			else
				local variation = NativeUI.CreateListItem('Haar (#' .. i .. ')', values, 1)
				hairs:AddItem(variation)
			end

			hairs.OnListChange = function(sender, item, index)

				--SetPedComponentVariation(PlayerPedId(-1), 2, selectedHair1, index, 2)
				TriggerEvent('skinchanger:change', 'hair_2', index-1)
				
			end
		else
			if LastSkin['hair_1']-1 == i then
				local variation = NativeUI.CreateItem('~y~Haar (#' .. i .. ')', '~b~')
				hairs:AddItem(variation)
			else
				local variation = NativeUI.CreateItem('Haar (#' .. i .. ')', '~b~')
				hairs:AddItem(variation)
			end
		end
	end
		
	hairs.OnIndexChange = function(sender, index)
		--SetPedComponentVariation(PlayerPedId(-1), 2, index, 1, 1)
		
		TriggerEvent('skinchanger:change', 'hair_2', 0)
		TriggerEvent('skinchanger:change', 'hair_1', index)
		CreateSkinCam()
		zoomOffset = 0.6
		camOffset = 0.65
		--selectedHair1 = index
	end


	for i=0, hairColorsAmount, 1 do
		
		local values = {}
		local amountOfVariations = hairColorsAmount
		if amountOfVariations > 0 then
			for i=1, amountOfVariations, 1 do
				table.insert(values, i)
			end
			if LastSkin['hair_color_1']-1 == i then
				local variation = NativeUI.CreateListItem('~y~Haarfarbe (#' .. i .. ')', values, LastSkin['hair_color_2'])
				hairColor:AddItem(variation)
			else
				local variation = NativeUI.CreateListItem('Haarfarbe (#' .. i .. ')', values, 1)
				hairColor:AddItem(variation)
			end

			hairColor.OnListChange = function(sender, item, index)

				--SetPedHairColor(PlayerPedId(), selectedHairColor, index)
				TriggerEvent('skinchanger:change', 'hair_color_2', index-1)

			end
		end
	end
		
	hairColor.OnIndexChange = function(sender, index)
		--SetPedHairColor(PlayerPedId(), index, 1)
		--selectedHairColor = index
		
		TriggerEvent('skinchanger:change', 'hair_color_1', index)
		CreateSkinCam()
		zoomOffset = 0.6
		camOffset = 0.65
	end
	

	for i=0, beard1, 1 do
		
		local values = {}
		local amountOfVariations = 10
		if amountOfVariations > 0 then
			for i=1, amountOfVariations, 1 do
				table.insert(values, i)
			end
			if LastSkin['beard_1']-1 == i then
				local variation = NativeUI.CreateListItem('~y~Bart (#' .. i .. ')', values, LastSkin['beard_2'])
				beard:AddItem(variation)
			else
				local variation = NativeUI.CreateListItem('Bart (#' .. i .. ')', values, 1)
				beard:AddItem(variation)
			end

			beard.OnListChange = function(sender, item, index)
				
				--SetPedHairColor(PlayerPedId(), selectedHairColor, index)
				TriggerEvent('skinchanger:change', 'beard_2', index-1)

			end
		end
	end
		
	beard.OnIndexChange = function(sender, index)
		--SetPedHairColor(PlayerPedId(), index, 1)
		--selectedHairColor = index
		
		TriggerEvent('skinchanger:change', 'beard_1', index)
		CreateSkinCam()
		zoomOffset = 0.4
		camOffset = 0.65
	end

	for i=0, beardColorsAmount, 1 do
		
		local values = {}
		local amountOfVariations = GetNumHairColors()-1
		if amountOfVariations > 0 then
			for i=1, amountOfVariations, 1 do
				table.insert(values, i)
			end
			
			if LastSkin['beard_3']-1 == i then
				local variation = NativeUI.CreateListItem('~y~Bartfarbe (#' .. i .. ')', values, LastSkin['beard_4'])
				beardColor:AddItem(variation)
			else
				local variation = NativeUI.CreateListItem('Bartfarbe (#' .. i .. ')', values, 1)
				beardColor:AddItem(variation)
			end
			
			beardColor.OnListChange = function(sender, item, index)
				
				--SetPedHairColor(PlayerPedId(), selectedHairColor, index)
				TriggerEvent('skinchanger:change', 'beard_4', index-1)

			end
		end
	end
		
	beardColor.OnIndexChange = function(sender, index)
		--SetPedHairColor(PlayerPedId(), index, 1)
		--selectedHairColor = index
		
		TriggerEvent('skinchanger:change', 'beard_3', index)
		CreateSkinCam()
		zoomOffset = 0.4
		camOffset = 0.65
	end

	for i=0, eyebrows1, 1 do
		
		local values = {}
		local amountOfVariations = 10
		if amountOfVariations > 0 then
			for i=1, amountOfVariations, 1 do
				table.insert(values, i)
			end
			
			if LastSkin['eyebrows_1']-1 == i then
				local variation = NativeUI.CreateListItem('~y~Augenbraun (#' .. i .. ')', values, LastSkin['eyebrows_2'])
				eyebrows:AddItem(variation)
			else
				local variation = NativeUI.CreateListItem('Augenbraun (#' .. i .. ')', values, 1)
				eyebrows:AddItem(variation)
			end

			eyebrows.OnListChange = function(sender, item, index)
				
				--SetPedHairColor(PlayerPedId(), selectedHairColor, index)
				TriggerEvent('skinchanger:change', 'eyebrows_2', index-1)

			end
		end
	end
		
	eyebrows.OnIndexChange = function(sender, index)
		--SetPedHairColor(PlayerPedId(), index, 1)
		--selectedHairColor = index
		
		TriggerEvent('skinchanger:change', 'eyebrows_1', index)
		CreateSkinCam()
		zoomOffset = 0.4
		camOffset = 0.65
	end

	for i=0, eyebrowColorsAmount, 1 do
		
		local values = {}
		local amountOfVariations = GetNumHairColors()-1
		if amountOfVariations > 0 then
			for i=1, amountOfVariations, 1 do
				table.insert(values, i)
			end
			
			if LastSkin['eyebrows_3']-1 == i then
				local variation = NativeUI.CreateListItem('~y~Augenbraun Farbe (#' .. i .. ')', values, LastSkin['eyebrows_4'])
				eyebrowsColor:AddItem(variation)
			else
				local variation = NativeUI.CreateListItem('Augenbraun Farbe (#' .. i .. ')', values, 1)
				eyebrowsColor:AddItem(variation)
			end


			eyebrowsColor.OnListChange = function(sender, item, index)
				
				--SetPedHairColor(PlayerPedId(), selectedHairColor, index)
				TriggerEvent('skinchanger:change', 'eyebrows_4', index-1)


			end
		end
	end
		
	eyebrowsColor.OnIndexChange = function(sender, index)
		--SetPedHairColor(PlayerPedId(), index, 1)
		--selectedHairColor = index
		
		TriggerEvent('skinchanger:change', 'eyebrows_3', index)
		CreateSkinCam()
		zoomOffset = 0.4
		camOffset = 0.65
	end

	for i=0, makeup1, 1 do
		
		local values = {}
		local amountOfVariations = 10
		if amountOfVariations > 0 then
			for i=1, amountOfVariations, 1 do
				table.insert(values, i)
			end
			
			if LastSkin['makeup_1']-1 == i then
				local variation = NativeUI.CreateListItem('~y~Make-Up (#' .. i .. ')', values, LastSkin['makeup_2'])
				makeup:AddItem(variation)
			else
				local variation = NativeUI.CreateListItem('Make-Up (#' .. i .. ')', values, 1)
				makeup:AddItem(variation)
			end


			makeup.OnListChange = function(sender, item, index)
				
				--SetPedHairColor(PlayerPedId(), selectedHairColor, index)
				TriggerEvent('skinchanger:change', 'makeup_2', index-1)


			end
		end
	end
		
	makeup.OnIndexChange = function(sender, index)
		--SetPedHairColor(PlayerPedId(), index, 1)
		--selectedHairColor = index
		
		TriggerEvent('skinchanger:change', 'makeup_1', index)
		CreateSkinCam()
		zoomOffset = 0.4
		camOffset = 0.65
	end

	for i=0, makeupColorsAmount, 1 do
		
		local values = {}
		local amountOfVariations = GetNumHairColors()-1
		if amountOfVariations > 0 then
			for i=1, amountOfVariations, 1 do
				table.insert(values, i)
			end
			
			if LastSkin['makeup_3']-1 == i then
				local variation = NativeUI.CreateListItem('~y~Make-Up Farbe (#' .. i .. ')', values, LastSkin['makeup_4'])
				makeupColor:AddItem(variation)
			else
				local variation = NativeUI.CreateListItem('Make-Up Farbe (#' .. i .. ')', values, 1)
				makeupColor:AddItem(variation)
			end


			makeupColor.OnListChange = function(sender, item, index)

				--SetPedHairColor(PlayerPedId(), selectedHairColor, index)
				TriggerEvent('skinchanger:change', 'makeup_4', index-1)


			end
		end
	end
		
	makeupColor.OnIndexChange = function(sender, index)
		--SetPedHairColor(PlayerPedId(), index, 1)
		--selectedHairColor = index
		
		TriggerEvent('skinchanger:change', 'makeup_3', index)
		CreateSkinCam()
		zoomOffset = 0.4
		camOffset = 0.65
	end

	for i=0, lipstick1, 1 do
		
		local values = {}
		local amountOfVariations = 10
		if amountOfVariations > 0 then
			for i=1, amountOfVariations, 1 do
				table.insert(values, i)
			end

			if LastSkin['lipstick_1']-1 == i then
				local variation = NativeUI.CreateListItem('~y~Lippenstift (#' .. i .. ')', values, LastSkin['lipstick_2'])
				lipstick:AddItem(variation)
			else
				local variation = NativeUI.CreateListItem('Lippenstift (#' .. i .. ')', values, 1)
				lipstick:AddItem(variation)
			end


			lipstick.OnListChange = function(sender, item, index)

				--SetPedHairColor(PlayerPedId(), selectedHairColor, index)
				TriggerEvent('skinchanger:change', 'lipstick_2', index-1)


			end
		end
	end
		
	lipstick.OnIndexChange = function(sender, index)
		--SetPedHairColor(PlayerPedId(), index, 1)
		--selectedHairColor = index
		
		TriggerEvent('skinchanger:change', 'lipstick_1', index)
		CreateSkinCam()
		zoomOffset = 0.4
		camOffset = 0.65
	end

	for i=0, lipstickColorAmount, 1 do
		
		local values = {}
		local amountOfVariations = GetNumHairColors()-1
		if amountOfVariations > 0 then
			for i=1, amountOfVariations, 1 do
				table.insert(values, i)
			end
			
			if LastSkin['lipstick_3']-1 == i then
				local variation = NativeUI.CreateListItem('~y~Lippenstift Farbe (#' .. i .. ')', values, LastSkin['lipstick_4'])
				lipstickColor:AddItem(variation)
			else
				local variation = NativeUI.CreateListItem('Lippenstift Farbe (#' .. i .. ')', values, 1)
				lipstickColor:AddItem(variation)
			end

			lipstickColor.OnListChange = function(sender, item, index)
				
				--SetPedHairColor(PlayerPedId(), selectedHairColor, index)
				TriggerEvent('skinchanger:change', 'lipstick_4', index-1)


			end
		end
	end
		
	lipstickColor.OnIndexChange = function(sender, index)
		--SetPedHairColor(PlayerPedId(), index, 1)
		--selectedHairColor = index
		
		TriggerEvent('skinchanger:change', 'lipstick_3', index)
		CreateSkinCam()
		zoomOffset = 0.4
		camOffset = 0.65
	end

	mainMenu.OnItemSelect = function(sender, item, index)

		if item == confirm then
			if Config.useESX then
				TriggerServerEvent('lils_barber:buyHair')
			else
				TriggerEvent('lils_barber:confirmHair', true)
			end
			DeleteSkinCam()
		end

	end

	mainMenu:Visible(true)
	_menuPool:MouseControlsEnabled (false)
	_menuPool:MouseEdgeEnabled (false)
	_menuPool:ControlDisablingEnabled(false)
	

end


RegisterNetEvent('lils_barber:confirmHair')
AddEventHandler('lils_barber:confirmHair', function(enoughMoney)

	_menuPool:CloseAllMenus()

	if enoughMoney then
		TriggerEvent('skinchanger:getSkin', function(skin)
			TriggerServerEvent('esx_skin:save', skin)
			LastSkin = skin
		end)

		hasBought = true

	else
		ShowNotification('~r~Du hast nicht genügend Geld.')
		TriggerEvent('skinchanger:loadSkin', LastSkin)

	end

end)


function CreateSkinCam()
	local playerPed = GetPlayerPed(-1)

	if not isCameraActive then
		if not DoesCamExist(cam) then
			cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
		end
		SetCamActive(cam, true)
		RenderScriptCams(true, true, 500, true, true)
		isCameraActive = true
		SetCamRot(cam, 0.0, 0.0, 270.0, true)
		SetEntityHeading(playerPed, 90.0)
	end
end
	
function DeleteSkinCam()
	isCameraActive = false
	SetCamActive(cam, false)
	RenderScriptCams(false, true, 500, true, true)
	cam = nil
end
	
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if isCameraActive then
		DisableControlAction(2, 30, true)
		DisableControlAction(2, 31, true)
		DisableControlAction(2, 32, true)
		DisableControlAction(2, 33, true)
		DisableControlAction(2, 34, true)
		DisableControlAction(2, 35, true)
	
		DisableControlAction(0, 25,   true) -- Input Aim
			DisableControlAction(0, 24,   true) -- Input Attack
	
		local playerPed = GetPlayerPed(-1)
		local coords    = GetEntityCoords(playerPed)
	
		local angle = heading * math.pi / 180.0
		local theta = {
			x = math.cos(angle),
			y = math.sin(angle)
		}
		local pos = {
			x = coords.x + (zoomOffset * theta.x),
			y = coords.y + (zoomOffset * theta.y),
		}
	
		local angleToLook = heading - 140.0
		if angleToLook > 360 then
			angleToLook = angleToLook - 360
		elseif angleToLook < 0 then
			angleToLook = angleToLook + 360
		end
		angleToLook = angleToLook * math.pi / 180.0
		local thetaToLook = {
			x = math.cos(angleToLook),
			y = math.sin(angleToLook)
		}
		local posToLook = {
			x = coords.x + (zoomOffset * thetaToLook.x),
			y = coords.y + (zoomOffset * thetaToLook.y),
		}
	
		SetCamCoord(cam, pos.x, pos.y, coords.z + camOffset)
		PointCamAtCoord(cam, posToLook.x, posToLook.y, coords.z + camOffset)
	
		--SetTextComponentFormat("STRING")
		--AddTextComponentString(_U('use_rotate_view'))
		--DisplayHelpTextFromStringLabel(0, 0, 0, -1)
		end
	end
end)
	
Citizen.CreateThread(function()
	local angle = 90
	while true do
		Citizen.Wait(0)
		if isCameraActive then
		if IsControlPressed(0, 108) then
			angle = angle - 1
		elseif IsControlPressed(0, 109) then
			angle = angle + 1
		end
		if angle > 360 then
			angle = angle - 360
		elseif angle < 0 then
			angle = angle + 360
		end
		heading = angle + 0.0
		end
	end
end)

function showInfobar(msg)

	CurrentActionMsg  = msg
	SetTextComponentFormat('STRING')
	AddTextComponentString(CurrentActionMsg)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)

end