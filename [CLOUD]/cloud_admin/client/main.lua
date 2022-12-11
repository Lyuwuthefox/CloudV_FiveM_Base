
ESX = nil

local playerLoaded = false

local In_Admin_Duty = false

local year, month, day, hour, minute, second = GetLocalTime()

local Shit_Day = string.format('%02d.%02d.%04d', day, month, year)

local rockstarID = nil

local PlayerHealth = GetEntityHealth(PlayerPedId())

local PlayerVest = GetPedArmour(PlayerPedId())

local x, y, z = 0, 0, 0

local ESXGroup = 'user'

local ThemeIndex = 1

local is_in_car = false

local reason = '_'

local amount = '_'

local what = '_'

local GodMode_Checked = false

local NoClip_Locked = false

local NoClip_Style = DefaultCheckbox

local DefaultButton = {isDisabled=false}

local DefaultCheckbox = {isDisabled=false,Style=1}

local Nametags_Checked = false

local NoClip_Thread = false

local is_guide = false

local Bypass = false

local NoClip_Checked = false

local NoClip_Active = false

local Dev_Mode = false

local Dev_Mode_Colour = ThemeIndex

local NoClip_Speed = 1.0

local NoClipSlider_Start = 1.0

local NoClipSlider_Max = 10.0

local NoClipSlider_Curr = 1.0

local NoClipSlider_Steps = 0.5

local PlayersInSync = GetActivePlayers()

local Selected_PlayerPed = '_'

local Selected_PlayerId = '_'

local Selected_PlayerServerID = 0

local PlayerString = '_'

local TargetCoords = 0

local OldAdminCoords = nil

local Freeze_Checked = false

local Spectate_Checked = false

local Spectate_Target = nil

local PlayerMoney = 0

local PlayerBankMoney = 0

local PlayerBlackMoney = 0

local PlayerJobName = 'unemployed'

local PlayerJobGrade = 0

local PlayerJobLabel = 'Arbeitslos'

local MainMenyo = RageUI.CreateMenu('_', Menu.SmallTitle or '')

MainMenyo.X = Menu.X or 75

MainMenyo.Y = Menu.Y or 75

local SelfMenu = RageUI.CreateSubMenu(MainMenyo, '_', 'Self Einstellungen')

local CarMenu = RageUI.CreateSubMenu(MainMenyo, '_', 'Fahrzeug Einstellungen')

local ManagmentMenu = RageUI.CreateSubMenu(MainMenyo, '_', 'Server Verwaltung')

local PlayerSettingsMenu = RageUI.CreateSubMenu(MainMenyo, '_', 'Spieler Verwaltung')

local PlayerInfoMenu = RageUI.CreateSubMenu(PlayerSettingsMenu, '_', '                      Spieler Info')

local EasyAdminMenu = RageUI.CreateSubMenu(PlayerInfoMenu, '_', '                 EasyAdmin Actions')

local SettingsMenu = RageUI.CreateSubMenu(MainMenyo, '_', 'Einstellungen')



--Update v1.1

local update_1_1 = false

local GuideMenu = RageUI.CreateSubMenu(SelfMenu, '_', 'Guide Optionen')

local BypassMenu = RageUI.CreateSubMenu(SelfMenu, '_', 'Admin Bypass Optionen')

local superjump_checked = false

local superjump_active = false

local superspeed_checked = false

local superspeed_active = false

local clone_checked = false

local clone_target = nil



--Update v1.2

local update_1_2 = false

local canTicket = true

local OpenTickets = {}

local UserTicketMenu = RageUI.CreateMenu('_', '                     Support Ticket')

UserTicketMenu.X = Menu.X or 75

UserTicketMenu.Y = Menu.Y or 75

local TicketMenu = RageUI.CreateSubMenu(MainMenyo, '_', 'Tickets')

local TicketInfo = RageUI.CreateSubMenu(TicketMenu, '_', 'Ticket Information')

local selected_TicketID = nil

local selected_Ticket = nil



--Update v1.3

local update_1_3 = false

local el_webhook_storage = ''

local el_webhook = ''

local has_ticket_perms = false

local use_tickets = false



if not Menu.UseHeader then

    MainMenyo.Display.Header = false

    SelfMenu.Display.Header = false

    CarMenu.Display.Header = false

    ManagmentMenu.Display.Header = false

    PlayerSettingsMenu.Display.Header = false

    SettingsMenu.Display.Header = false

    GuideMenu.Display.Header = false

    BypassMenu.Display.Header = false

    TicketMenu.Display.Header = false

else

    MainMenyo.Display.Header = true

    SelfMenu.Display.Header = true

    CarMenu.Display.Header = true

    ManagmentMenu.Display.Header = true

    PlayerSettingsMenu.Display.Header = true

    SettingsMenu.Display.Header = true

    GuideMenu.Display.Header = true

    BypassMenu.Display.Header = true

    TicketMenu.Display.Header = true

end

local SettingsSliderStyle = {

    Background = { X = 250, Y = 14.5, Width = 150, Height = 9 },

    Slider = { X = 250, Y = 14.5, Width = 75, Height = 9 },

    Divider = { X = 323.5, Y = 9, Width = 2.5, Height = 20 },

    LeftArrow = { Dictionary = 'commonmenutu', Texture = 'arrowleft', X = 235, Y = 11.5, Width = 15, Height = 15 },

    RightArrow = { Dictionary = 'commonmenutu', Texture = 'arrowright', X = 400, Y = 11.5, Width = 15, Height = 15 },

    LeftBadge = 'None',

    RightBadge = 'None'

}

local NameTagsColourIndex = ThemeIndex

local NameTags_DrawDistance = 10

local NameTagsSlider_Start = 0

local NameTagsSlider_Max = 100

local NameTagsSlider_Curr = 10

local NameTagsSlider_Steps = 10

local SpeedSlider_Start = 0

local SpeedSlider_Max = 100

local SpeedSlider_Curr = 0

local SpeedSlider_Steps = 5



Citizen.CreateThread(function()

    while ESX == nil do

        TriggerEvent(CS.getSharedObject, function(obj) ESX = obj end)

        Citizen.Wait(10)

    end

    local CheckKVP = GetResourceKvpInt('cs-admin:Theme')

    if CheckKVP == 0 then

        ThemeIndex = 1

        NameTagsColourIndex = 1

        Dev_Mode_Colour = 1

    elseif CheckKVP == 1 then

        ThemeIndex = 1

        NameTagsColourIndex = 1

        Dev_Mode_Colour = 1

    elseif CheckKVP == 2 then

        ThemeIndex = 2

        NameTagsColourIndex = 2

        Dev_Mode_Colour = 2

    elseif CheckKVP == 3 then

        ThemeIndex = 3

        NameTagsColourIndex = 3

        Dev_Mode_Colour = 3

    elseif CheckKVP == 4 then

        ThemeIndex = 4

        NameTagsColourIndex = 4

        Dev_Mode_Colour = 4

    elseif CheckKVP == 5 then

        ThemeIndex = 5

        NameTagsColourIndex = 5

        Dev_Mode_Colour = 5

    elseif CheckKVP == 6 then

        ThemeIndex = 6

        NameTagsColourIndex = 6

        Dev_Mode_Colour = 6

    elseif CheckKVP == 7 then

        ThemeIndex = 7

        NameTagsColourIndex = 7

        Dev_Mode_Colour = 7

    elseif CheckKVP == 8 then

        ThemeIndex = 8

        NameTagsColourIndex = 8

        Dev_Mode_Colour = 8

    elseif CheckKVP == 9 then

        ThemeIndex = 9

        NameTagsColourIndex = 9

        Dev_Mode_Colour = 9

    end

    ForceTheme(CheckKVP)

    while not GetEntityModel(PlayerPedId()) == GetHashKey('mp_m_freemode_01') or not GetEntityModel(PlayerPedId()) == GetHashKey('mp_f_freemode_01') do

        Citizen.Wait(10)

    end

    Citizen.Wait(2500)

    if CS.CustomNotify ~= nil then

        update_1_3 = true

        if CS.UseTicketSystem ~= nil then

            if CS.UseTicketSystem then

                use_tickets = true

            else

                use_tickets = false

            end

        else

            Notify('[~r~ERROR~s~]', 'Update v1.3 Missing! Check Customer Info')

            print('[ADMIN-MENU] ERROR Update v1.3 Missing! Check Customer Info')

        end

        ESX.TriggerServerCallback('cs-admin:clientWebhook', function(hook)

            if hook ~= nil then

                el_webhook_storage = hook

            end

        end)

    else

    end

    if not playerLoaded then

        ESX.TriggerServerCallback('cs-admin:getESXGroup', function(group)

            if group ~= nil then

                ESXGroup = group

            end

        end)

    end

    playerLoaded = true

    Wait(1000)

    if checkESXPerms('NoClip') or AdminBypass() then

        NoClip_Thread = true

    else

        NoClip_Thread = false

    end

    if checkESXPerms('GuideStuff') or AdminBypass() then

        is_guide = true

    else

        is_guide = false

    end

    if AdminBypass() then

        Bypass = true

    else

        Bypass = false

    end

    --Update v1.2

    if CS.Perms.Tickets == nil then

        Notify('[~r~ERROR~s~]', 'Update v1.2 Missing! Check Customer Info')

        print('[ADMIN-MENU] ERROR Update v1.2 Missing! Check Customer Info')

    else

        update_1_2 = true

        if checkESXPerms('Tickets') then

            has_ticket_perms = true

        else

            has_ticket_perms = false

        end

    end

    --Update v1.2

    if CS.CustomNotify == nil then

        Notify('[~r~ERROR~s~]', 'Update v1.3 Missing! Check Customer Info')

        print('[ADMIN-MENU] ERROR Update v1.3 Missing! Check Customer Info')

    end

end)



--Update v1.3

RegisterNetEvent('cs-admin:screenShotPlayer', function(name, target)

    exports['screenshot-basic']:requestScreenshotUpload(el_webhook_storage, 'files', function(data)

        local sent_to_server = json.decode(data)

        TriggerServerEvent('cs-admin:clientSentScreen', sent_to_server, name, GetPlayerServerId(PlayerId()))

    end)

end)



RegisterNetEvent('cs-adminmenu:client', function(what, p1, p2, p3)

    if what ~= nil then

        if what == 'freeze' then

            FreezeEntityPosition(PlayerPedId(), true)

            SetGamePaused(true)

        elseif what == 'unfreeze' then

            FreezeEntityPosition(PlayerPedId(), false)

            SetGamePaused(false)

        elseif what == 'heal' then

            SetEntityHealth(PlayerPedId(), 200)

        end

    end

end)



function RageUI.PoolMenus:El_Main_Menu()

    MainMenyo:IsVisible(function(Items)

        Items:AddButton('Self Einstellungen', '['..GetPlayerName(PlayerId())..']', DefaultButton, function(onSelected)

            if onSelected then

                PlayerHealth = GetEntityHealth(PlayerPedId())

                PlayerVest = GetPedArmour(PlayerPedId())

            end

        end, SelfMenu)

        Items:AddButton('Fahrzeug Einstellungen', '['..GetPlayerName(PlayerId())..']', DefaultButton, function(onSelected)

            if onSelected then

                is_in_car = false

                if IsPedInAnyVehicle(PlayerPedId(), false) then

                    is_in_car = true

                else

                    is_in_car = false

                end

            end

        end, CarMenu)

        Items:AddButton('Server Einstellungen', '['..GetPlayerName(PlayerId())..']', DefaultButton, function(onSelected)

            if onSelected then

                PlayersInSync = GetActivePlayers()

            end

        end, ManagmentMenu)

        if update_1_2 and has_ticket_perms and use_tickets or update_1_2 and Bypass and use_tickets then

            Items:AddButton('Ticket Menu', 'Check open Support Tickets', DefaultButton, function(onSelected)

                if onSelected then

                    ESX.TriggerServerCallback('cs-admin:getTickets', function(tickets)

                        if tickets ~= nil then

                            OpenTickets = tickets

                        end

                    end)

                    Wait(500)

                    return

                end

            end, TicketMenu)

        end

        Items:AddButton('Einstellungen', '['..GetPlayerName(PlayerId())..']', DefaultButton, function(onSelected)

            if onSelected then

                return

            end

        end, SettingsMenu)

        Items:AddSeparator('['..Shit_Day..']')

        Items:CheckBox('Admin Mode', nil, In_Admin_Duty, DefaultCheckbox, function(onSelected, IsChecked)

            if onSelected then

                In_Admin_Duty = IsChecked

                if IsChecked then

                    TriggerServerEvent('cs-adminmenu:usedFeature', 'duty_in')

                    In_Admin_Duty = true

                    GodMode_Checked = true

                    SetEntityOnlyDamagedByRelationshipGroup(PlayerPedId(), true, 69420)

                    TriggerEvent('el_duty_ye')

                    TriggerEvent("b_notify", "success", "ADMIN SYSTEM", "Du befindest dich nun im Admin Dienst!", 5000)

                else

                    TriggerServerEvent('cs-adminmenu:usedFeature', 'duty_out')

                    In_Admin_Duty = false

                    GodMode_Checked = false

                    SetEntityOnlyDamagedByRelationshipGroup(PlayerPedId(), false, 69420)

                    TriggerEvent('el_duty_out')

                    Wait(250)

                    TriggerEvent("b_notify", "error", "ADMIN SYSTEM", "Du hast den Admin Dienst deaktiviert! - Viel Spaß im Roleplay", 5000)

                end

            end

        end)

    end, function(Panels)

    end)

    SelfMenu:IsVisible(function(Items)

        Items:CheckBox('GodMode', nil, GodMode_Checked, DefaultCheckbox, function(onSelected, IsChecked)

            if onSelected then

                if checkESXPerms('GodMode') and In_Admin_Duty or AdminBypass() then

                    GodMode_Checked = IsChecked

                    if IsChecked then

                        TriggerServerEvent('cs-adminmenu:usedFeature', 'godmode_on')

                        SetEntityOnlyDamagedByRelationshipGroup(PlayerPedId(), true, 69420)

                        TriggerEvent("b_notify", "success", "GODMODE", "Du bist nun Unsterblich", 5000)

                    else

                        TriggerServerEvent('cs-adminmenu:usedFeature', 'godmode_off')

                        SetEntityOnlyDamagedByRelationshipGroup(PlayerPedId(), false, 69420)

                        TriggerEvent("b_notify", "error", "GODMODE", "Du bist nun wieder Verwundbar", 5000)

                    end

                end

            end

        end)

        Items:CheckBox('Nametags', nil, Nametags_Checked, DefaultCheckbox, function(onSelected, IsChecked)

            if onSelected then

                if checkESXPerms('Nametags') and In_Admin_Duty or AdminBypass() then

                    Nametags_Checked = IsChecked

                    if IsChecked then

                        TriggerServerEvent('cs-adminmenu:usedFeature', 'nametags_on')

                        if GetCurrentServerEndpoint() == '193.42.11.164:30120' then

                            TriggerEvent("b_notify", "success", "NAMETAGS", "Du siehst nun die Nametags der Spieler!", 5000)
                            
                            TriggerEvent("b_notify", "warning", "NAMETAGS", "Solltest du dies zu deinem Vorteilnutzen so kann dies zu einem Teamkick o. Derank führen!", 5000)

                        else

                            Notify('Nametags', 'Aktiviert.')

                        end

                    else

                        TriggerServerEvent('cs-adminmenu:usedFeature', 'nametags_off')

                        TriggerEvent("b_notify", "error", "NAMETAGS", "Du hast alle Nametags deaktiviert!", 5000)

                    end

                end

            end

        end)

        Items:AddSlider('Nametags Range', NameTagsSlider_Start, NameTagsSlider_Max, NameTagsSlider_Curr, NameTagsSlider_Steps, '['..NameTags_DrawDistance..']', 0, SettingsSliderStyle, false, function(Selected, Index)

            if Selected then

                if checkESXPerms('Nametags') and In_Admin_Duty or AdminBypass() then

                    if Index ~= nil then

                        NameTagsSlider_Curr = Index

                        NameTags_DrawDistance = NameTagsSlider_Curr

                    end

                end

            end

        end)

        if NoClip_Locked then

            NoClip_Style = { IsDisabled = true, Style = 1 }

        else

            NoClip_Style = DefaultCheckbox

        end

        Items:CheckBox('NoClip', nil, NoClip_Checked, NoClip_Style, function(onSelected, IsChecked)

            if onSelected then

                if checkESXPerms('NoClip') and In_Admin_Duty or AdminBypass() and not NoClip_Locked then

                    NoClip_Checked = IsChecked

                    if IsChecked then

                        NoClip_Active = true

                    else

                        NoClip_Active = false

                    end

                end

            end

        end)

        Items:AddSlider('NoClip Speed', NoClipSlider_Start, NoClipSlider_Max, NoClipSlider_Curr, NoClipSlider_Steps, '['..NoClip_Speed..']', 0, SettingsSliderStyle, false, function(Selected, Index)

            if Selected then

                if checkESXPerms('NoClip') and In_Admin_Duty or AdminBypass() then

                    if Index ~= nil then

                        NoClipSlider_Curr = Index

                        NoClip_Speed = NoClipSlider_Curr

                    end

                end

            end

        end)

        Items:AddButton('Full Heal', '[~g~'..PlayerHealth..'~s~ | ~b~'..PlayerVest..'~s~]', DefaultButton, function(onSelected)

            if onSelected then

                if checkESXPerms('FullHeal') and In_Admin_Duty or AdminBypass() then

                    TriggerServerEvent('cs-adminmenu:usedFeature', 'self_healall')

                    SetEntityHealth(PlayerPedId(), 200)

                    SetPedArmour(PlayerPedId(), 100)

                    TriggerEvent('b-notify:notify', 'success', 'Admin System', 'Du hast dich erfolgreich geheilt!')

                    

                end

            end

        end)

        if is_guide and update_1_1 then

            Items:AddButton('Guide Menu', nil, DefaultButton, function(onSelected)

                if onSelected then

                    return

                end

            end, GuideMenu)

        end

        if Bypass and update_1_1 then

            Items:AddButton('Bypass Menu', nil, DefaultButton, function(onSelected)

                if onSelected then

                    return

                end

            end, BypassMenu)

        end

    end, function(Panels)

    end)

    CarMenu:IsVisible(function(Items)

        Items:AddButton('Auto Spawnen', nil, DefaultButton, function(onSelected)

            if onSelected then

                if checkESXPerms('CarSpawn') and In_Admin_Duty or AdminBypass() then

                    local car = KeyboardInput('Test', 'Welches Auto soll gespawnt werden?', '', 25)

                    if car ~= nil then

                        if IsModelValid(GetHashKey(car)) then

                            while not HasModelLoaded(GetHashKey(car)) do

                                RequestModel(GetHashKey(car))

                                Wait(10)

                            end

                            local el_car = CreateVehicle(GetHashKey(car), GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), true, false)

                            TaskWarpPedIntoVehicle(PlayerPedId(), el_car, -1)

                            SetVehicleNumberPlateText(el_car, RndmStr(3)..'  '..math.random(100, 999))

                            local el_plate = GetVehicleNumberPlateText(el_car)

                            TriggerServerEvent('cs-adminmenu:usedFeature', 'spawned_car', car, el_plate)

                            TriggerEvent('b-notify:notify', 'success', 'Admin Menu', 'Das Fahrzeug wurde erfolgreich gespawnt! Bitte beachte das Fahrzeug ist ein Temporäres')


                            

                        end 

                    end

                end

            end

        end)

        if is_in_car then

            Items:AddButton('Auto Reparieren', nil, DefaultButton, function(onSelected)

                if onSelected then

                    if checkESXPerms('CarFix') and In_Admin_Duty or AdminBypass() then

                        TriggerServerEvent('cs-adminmenu:usedFeature', 'fixxed_car', GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false)))

                        SetVehicleEngineHealth(GetVehiclePedIsIn(PlayerPedId(), false), 1000.0)

                        SetVehicleFixed(GetVehiclePedIsIn(PlayerPedId(), false))

                        SetVehicleDeformationFixed(GetVehiclePedIsIn(PlayerPedId(), false))

                        SetVehicleUndriveable(GetVehiclePedIsIn(PlayerPedId(), false), false)

                        TriggerEvent('b-notify:notify', 'success', 'Admin Menu', 'Fahrzeug erfolgreich repariert!')


                    end

                end

            end)

            Items:AddButton('Auto Deleten', nil, DefaultButton, function(onSelected)

                if onSelected then

                    if checkESXPerms('CarDel') and In_Admin_Duty or AdminBypass() then

                        TriggerServerEvent('cs-adminmenu:usedFeature', 'deleted_car', GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false)))

                        DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))

                        DeleteEntity(GetClosestVehicle(GetEntityCoords(PlayerPedId()), 3.0, 0, 0), false)

                        TriggerEvent('b-notify:notify', 'success', 'Admin Menu', 'Fahrzeug erfolgreich gelöscht!')

                        

                    end

                end

            end)

            Items:AddSlider('Speed Boost', SpeedSlider_Start, SpeedSlider_Max, SpeedSlider_Curr, SpeedSlider_Steps, 'Shift to Activate', 0, SettingsSliderStyle, false, function(Selected, Index)

                if Selected then

                    if checkESXPerms('CarBoost') and In_Admin_Duty or AdminBypass() then

                        if Index ~= nil then

                            SpeedSlider_Curr = Index

                        end

                    end

                end

            end)

        else

            Items:AddSeparator('['..GetTheme()..'Kein Fahrzeug gefunden~s~]')

            Items:AddButton('Auto Deleten', nil, DefaultButton, function(onSelected)

                if onSelected then

                    if checkESXPerms('CarDel') and In_Admin_Duty or AdminBypass() then

                        DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))

                        DeleteEntity(GetClosestVehicle(GetEntityCoords(PlayerPedId()), 3.0, 0, 0), false)

                        TriggerEvent('b-notify:notify', 'success', 'Admin Menu', 'Fahrzeug erfolgreich gelöscht!')
                        

                    end

                end

            end)

        end

    end, function(Panels)

    end)

    ManagmentMenu:IsVisible(function(Items)

        Items:AddSeparator('[Rueckerstattung]')

        Items:AddButton('[Geld Geben]', nil, DefaultButton, function(onSelected)

            if onSelected then

                if checkESXPerms('GiveMoney') and In_Admin_Duty or AdminBypass() then

                    reason = KeyboardInput('TakTak', 'Grund?', '', 128)

                    amount = KeyboardInput('TakTak', 'Wie Viel?', '', 8)

                    if reason ~= nil then

                        if amount ~= nil then

                            TriggerServerEvent('cs-adminmenu:managment', 'money', reason, amount)

                            Notify('Geld Gesetzt!', amount)

                        end

                    end

                end

            end

        end)

        Items:AddButton('[Item Geben]', nil, DefaultButton, function(onSelected)

            if onSelected then

                if checkESXPerms('GiveMoney') and In_Admin_Duty or AdminBypass() then

                    reason = KeyboardInput('TakTak', 'Grund?', '', 128)

                    what = KeyboardInput('TakTak', 'Item?', '', 16)

                    amount = KeyboardInput('TakTak', 'Wie Viel?', '', 5)

                    if reason ~= nil then

                        if what ~= nil then

                            if amount ~= nil then

                                TriggerServerEvent('cs-adminmenu:managment', 'item', reason, what, amount)

                                Notify('Item Erhalten', what..' '..amount..'x')

                            end

                        end

                    end

                end

            end

        end)

        Items:AddButton('[Waffe Geben]', nil, DefaultButton, function(onSelected)

            if onSelected then

                if checkESXPerms('GiveWeapon') and In_Admin_Duty or AdminBypass() then

                    reason = KeyboardInput('TakTak', 'Grund?', '', 128)

                    what = KeyboardInput('TakTak', 'Waffe?', 'weapon_', 128)

                    if reason ~= nil then

                        if what ~= nil then

                            TriggerServerEvent('cs-adminmenu:managment', 'weapon', reason, what)

                            Wait(250)

                            if IsWeaponValid(GetHashKey(what)) then

                                Notify('Waffe Erhalten', what)

                            end

                        end

                    end

                end

            end

        end)

        if use_tickets then

            Items:AddSeparator('Ticket')

            Items:AddButton('Delete All Tickets', nil, DefaultButton, function(onSelected)

                if onSelected then

                    if checkESXPerms('AllTickets') and In_Admin_Duty or AdminBypass() then

                        TriggerServerEvent('cs-admin:deleteTicket', 'all')

                        TriggerServerEvent('cs-adminmenu:usedFeature', 'ticket_deleteall')

                    end

                end

            end)

        end

        Items:AddSeparator('[Spieler in Sync]')

        for _, player in pairs(PlayersInSync) do

            if NetworkIsPlayerActive(player) then

                PlayerString = GetPlayerName(player)

                if IsEntityDead(GetPlayerPed(player)) then

                    PlayerString = PlayerString..' | ~r~Dead~s~'

                end

                Items:AddButton(PlayerString, 'Distance : '..Round(#(GetEntityCoords(PlayerPedId()) - GetEntityCoords(GetPlayerPed(player))), 1)..' | Health : ~g~'..GetEntityHealth(GetPlayerPed(player))..'~s~ | Armour : ~b~'..GetPedArmour(GetPlayerPed(player))..'~s~', DefaultButton, function(onSelected)

                    if onSelected then

                        Selected_PlayerPed = GetPlayerPed(player)

                        Selected_PlayerId = GetPlayerFromServerId(GetPlayerServerId(player))

                        Selected_PlayerServerID = GetPlayerServerId(player)

                    end

                end, PlayerSettingsMenu)

            end

        end

    end, function(Panels)

    end)

    PlayerSettingsMenu:IsVisible(function(Items)

    Items:AddSeparator(GetPlayerName(Selected_PlayerId))

    Items:AddButton('Go To', nil, DefaultButton, function(onSelected)

        if onSelected then

            if checkESXPerms('PlayerList_Goto') and In_Admin_Duty or AdminBypass() then

                TargetCoords = GetEntityCoords(Selected_PlayerPed)

                OldAdminCoords = GetEntityCoords(PlayerPedId())

                x, y, z = table.unpack(TargetCoords)

                if x == 0 and y == 0 and z == 0 then

                    Notify('Spieler : '..GetPlayerName(Selected_PlayerId), 'Ist aus dem Sync!')

                else

                    SetEntityCoords(PlayerPedId(), x, y, z + 1, 0.0, 0.0, 0.0, false)

                    TriggerServerEvent('cs-adminmenu:usedFeature', 'goto', Selected_PlayerServerID)

                end

            end

        end

    end)

    Items:AddButton('Go Back', nil, DefaultButton, function(onSelected)

        if onSelected then

            if checkESXPerms('PlayerList_Goto') and In_Admin_Duty or AdminBypass() then

                if OldAdminCoords ~= nil then

                    SetEntityCoords(PlayerPedId(), OldAdminCoords, 0.0, 0.0, 0.0, false)

                    TriggerServerEvent('cs-adminmenu:usedFeature', 'goback')

                end

            end

        end

    end)

    Items:AddButton('Bring', nil, DefaultButton, function(onSelected)

        if onSelected then

            if checkESXPerms('PlayerList_Bring') and In_Admin_Duty or AdminBypass() then

                TriggerServerEvent('cs-adminmenu:PlayerList_S', 'bring', Selected_PlayerServerID)

            end

        end

    end)

    Items:AddButton('Bring Back', nil, DefaultButton, function(onSelected)

        if onSelected then

            if checkESXPerms('PlayerList_Bring') and In_Admin_Duty or AdminBypass() then

                TriggerServerEvent('cs-adminmenu:PlayerList_S', 'bring_back', Selected_PlayerServerID)

            end

        end

    end)

    Items:AddButton('Heal', 'Health : ~g~'..GetEntityHealth(Selected_PlayerPed)..'~s~ | Armour : ~b~'..GetPedArmour(Selected_PlayerPed)..'', DefaultButton, function(onSelected)

        if onSelected then

            if checkESXPerms('PlayerList_Heal') and In_Admin_Duty or AdminBypass() then

                TriggerServerEvent('cs-adminmenu:PlayerList_S', 'heal', Selected_PlayerServerID)

            end

        end

    end)

    Items:CheckBox('Freeze', nil, Freeze_Checked, DefaultCheckbox, function(onSelected, IsChecked)

        if onSelected then

            if checkESXPerms('PlayerList_Freeze') and In_Admin_Duty or AdminBypass() then

                Freeze_Checked = IsChecked

                if IsChecked then

                    TriggerServerEvent('cs-adminmenu:PlayerList_S', 'freeze', Selected_PlayerServerID)

                else

                    TriggerServerEvent('cs-adminmenu:PlayerList_S', 'unfreeze', Selected_PlayerServerID)

                end

            end

        end

    end)

    Items:CheckBox('Spectate', nil, Spectate_Checked, DefaultCheckbox, function(onSelected, IsChecked)

        if onSelected then

            if checkESXPerms('PlayerList_Spectate') and In_Admin_Duty or AdminBypass() and not IsPedInAnyVehicle(PlayerPedId(), false) then

                Spectate_Checked = IsChecked

                if IsChecked then

                    TriggerServerEvent('cs-adminmenu:usedFeature', 'start_spec', Selected_PlayerServerID)

                    OldAdminCoords = GetEntityCoords(PlayerPedId())

                    if Selected_PlayerPed ~= PlayerPedId() then

                        Spectate_Target = Selected_PlayerPed

                        Wait(100)

                        NoClip_Locked = true

                        NoClip_Active = true

                        NoClip_Checked = true

                    end

                else

                    if Selected_PlayerPed ~= PlayerPedId() then

                        TriggerServerEvent('cs-adminmenu:usedFeature', 'stopped_spec', Selected_PlayerServerID)

                        SetEntityCoords(PlayerPedId(), OldAdminCoords)

                        Spectate_Target = nil

                        Wait(100)

                        NoClip_Locked = false

                        NoClip_Active = false

                        NoClip_Checked = false

                        OldAdminCoords = nil

                    end

                end

            end

        end

    end)

    Items:AddSeparator('Advanced Player Options')

    Items:AddButton('Advanced Options', nil, DefaultButton, function(onSelected)

        if onSelected then

            PlayerMoney = 0

            PlayerBankMoney = 0

            PlayerBlackMoney = 0

            PlayerJobName = 'unemployed'

            PlayerJobGrade = 0

            PlayerJobLabel = 'Arbeitslos'

            ESX.TriggerServerCallback('cs-admin:getPlayerInfo', function(cock)

                if cock ~= nil then

                    PlayerMoney = cock[1]

                    PlayerBankMoney = cock[2]

                    PlayerBlackMoney = cock[3]

                    PlayerJobName = cock[4]

                    PlayerJobGrade = cock[5]

                    PlayerJobLabel = cock[6]

                end

            end, Selected_PlayerServerID)

            Wait(250)

        end

    end, PlayerInfoMenu)

    end, function(Panels)

    end)

    PlayerInfoMenu:IsVisible(function(Items)

        Items:AddSeparator('Job: '..PlayerJobLabel..' Rang: '..PlayerJobGrade)

        Items:AddSeparator('Geld: '..GetTheme()..PlayerMoney..'~s~$')

        Items:AddSeparator('Schwarzgeld: '..'~r~'..PlayerBlackMoney..'~s~$')

        Items:AddSeparator('Bank: '..GetTheme()..PlayerBankMoney..'~s~$')

        Items:AddButton('Give Account Money', 'Gives the Player Account Money', DefaultButton, function(onSelected)

            if onSelected then

                if checkESXPerms('PlayerList_GiveAccountMoney') and In_Admin_Duty or AdminBypass() then

                    reason = KeyboardInput('TakTak', 'Account? [money | bank | black_money]', '', 16)

                    what = KeyboardInput('TakTak', 'Menge?', '', 8)

                    if reason ~= nil then

                        if what ~= nil then

                            TriggerServerEvent('cs-adminmenu:PlayerList_S', 'addAccountMoney', Selected_PlayerServerID, reason, what)

                            

                        end

                    end

                end

            end

        end)

        if update_1_1 then

            Items:AddButton('Set Account Money', 'Gives/Removes Account Money', DefaultButton, function(onSelected)

                if onSelected then

                    if checkESXPerms('PlayerList_SetAccountMoney') and In_Admin_Duty or AdminBypass() then

                        reason = KeyboardInput('TakTak', 'Account? [money | bank | black_money]', '', 16)

                        what = KeyboardInput('TakTak', 'Menge?', '', 8)

                        if reason ~= nil then

                            if what ~= nil then

                                TriggerServerEvent('cs-adminmenu:PlayerList_S', 'setAccountMoney', Selected_PlayerServerID, reason, what)

                                

                            end

                        end

                    end

                end

            end)

        end

        Items:AddButton('Open Skin Menu', 'Opens the Skin Menu for the Player', DefaultButton, function(onSelected)

            if onSelected then

                if checkESXPerms('PlayerList_ResetSkin') and In_Admin_Duty or AdminBypass() then

                    TriggerServerEvent('cs-adminmenu:PlayerList_S', 'skinmenu', Selected_PlayerServerID)

                    

                end

            end

        end)

        Items:AddButton('Set Job', 'Set the Player Job', DefaultButton, function(onSelected)

            if onSelected then

                if checkESXPerms('PlayerList_SetJob') and In_Admin_Duty or AdminBypass() then

                    reason = KeyboardInput('TakTak', 'Job?', '', 16)

                    what = KeyboardInput('TakTak', 'Grade?', '', 2)

                    if reason ~= nil then

                        if what ~= nil then

                            TriggerServerEvent('cs-adminmenu:PlayerList_S', 'setjob', Selected_PlayerServerID, reason, what)

                            

                        end

                    end

                end

            end

        end)

        Items:AddButton('ScreenShot', nil, DefaultButton, function(onSelected)

            if onSelected then

                if checkESXPerms('PlayerList_ScreenPlayer') and In_Admin_Duty or AdminBypass() then

                    TriggerServerEvent('cs-admin:requestClientScreen', Selected_PlayerServerID)

                end

            end

        end)

        Items:AddButton('EasyAdmin Actions', 'Ban and Kicking', DefaultButton, function(onSelected)

            if onSelected then

                return

            end

        end, EasyAdminMenu)

        if IsEntityVisible(Selected_PlayerPed) then

            Items:AddSeparator('[Player '..GetTheme()..'is~s~ Visible]')

        else

            Items:AddSeparator('[Player ~r~is not~s~ Visible]')

        end

    end, function(Panels)

    end)

    EasyAdminMenu:IsVisible(function(Items)

        Items:AddButton('Kick Player', nil, DefaultButton, function(onSelected)

            if onSelected then

                if checkESXPerms('PlayerList_Kick') or AdminBypass() then

                    reason = KeyboardInput('TakTak', 'Grund?', '', 128)

                    if reason ~= nil then

                        TriggerServerEvent('cs-adminmenu:PlayerList_S', 'kick', Selected_PlayerServerID, reason)

                    end

                end

            end

        end)

        Items:AddButton('Ban Player [Permanent Ban!]', '[Permanent Ban!]', DefaultButton, function(onSelected)

            if onSelected then

                if checkESXPerms('PlayerList_Ban') or AdminBypass() then

                    reason = KeyboardInput('TakTak', 'Grund?', '', 128)

                    if reason ~= nil then

                        TriggerServerEvent('cs-adminmenu:PlayerList_S', 'ban', Selected_PlayerServerID, reason)

                    end

                end

            end

        end)

    end, function(Panels)

    end)

    SettingsMenu:IsVisible(function(Items)

        Items:AddList('Menu Theme', { 'Default', '~r~Rot~s~', '~b~Blau~s~', '~s~Weiss~s~', '~p~Lila~s~', '~o~Orange~s~', '~y~Gelb~s~', '~g~Gruen~s~', '~r~R~y~G~b~B~s~' }, ThemeIndex, 'Menu Theme', DefaultButton, function(Index, onSelected)

            if Index then

                ThemeIndex = Index

            end

            if onSelected then

                NameTagsColourIndex = ThemeIndex

                if ThemeIndex == 1 then

                    ForceTheme(1)

                    Notify('Theme Gespeichert!', 'Folgendes Theme ist nun Aktiv: Default')

                    Dev_Mode_Colour = 1

                elseif ThemeIndex == 2 then

                    ForceTheme(2)

                    Notify('Theme Gespeichert!', 'Folgendes Theme ist nun Aktiv: Rot')

                    Dev_Mode_Colour = 2

                elseif ThemeIndex == 3 then

                    ForceTheme(3)

                    Notify('Theme Gespeichert!', 'Folgendes Theme ist nun Aktiv: Blau')

                    Dev_Mode_Colour = 3

                elseif ThemeIndex == 4 then

                    ForceTheme(4)

                    Notify('Theme Gespeichert!', 'Folgendes Theme ist nun Aktiv: Weiss')

                    Dev_Mode_Colour = 4

                elseif ThemeIndex == 5 then

                    ForceTheme(5)

                    Notify('Theme Gespeichert!', 'Folgendes Theme ist nun Aktiv: Lila')

                    Dev_Mode_Colour = 5

                elseif ThemeIndex == 6 then

                    ForceTheme(6)

                    Notify('Theme Gespeichert!', 'Folgendes Theme ist nun Aktiv: Orange')

                    Dev_Mode_Colour = 6

                elseif ThemeIndex == 7 then

                    ForceTheme(7)

                    Notify('Theme Gespeichert!', 'Folgendes Theme ist nun Aktiv: Gelb')

                    Dev_Mode_Colour = 7

                elseif ThemeIndex == 8 then

                    ForceTheme(8)

                    Notify('Theme Gespeichert!', 'Folgendes Theme ist nun Aktiv: Gruen')

                    Dev_Mode_Colour = 8

                elseif ThemeIndex == 9 then

                    ForceTheme(9)

                    Notify('Theme Gespeichert!', 'Folgendes Theme ist nun Aktiv: RGB')
                    Notify('RGB MODE', 'Dein PC hat nun 200% Mehr FPS HART COCK 8===D')

                    Dev_Mode_Colour = 9

                end

            end

        end)

        Items:CheckBox('Developer Mode', nil, Dev_Mode, DefaultCheckbox, function(onSelected, IsChecked)

            if onSelected then

                Dev_Mode = IsChecked

                if IsChecked then

                    Dev_Mode = true

                    Dev_Mode_Colour = ThemeIndex

                else

                    Dev_Mode = false

                    Dev_Mode_Colour = ThemeIndex

                end

            end

        end)

        if Bypass then

            Items:AddSeparator('Adminmenu - Aysacore')

            Items:AddSeparator('(c) Copyright 2022 - Cloud-V RPG')

        end

    end, function(Panels)

    end)



    --Update v1.1

    GuideMenu:IsVisible(function(Items)

        Items:AddButton('Go In', '[Go to Spawn]', DefaultButton, function(onSelected)

            if onSelected then

                local status, error = pcall(function()

                    if checkESXPerms('GuideStuff') or AdminBypass() then

                        if CS.GuideStuff.UsePremadeOutfit then

                            TriggerEvent('skinchanger:getSkin', function(skin)

                                if skin ~= nil then

                                    if skin.sex == 0 then

                                        TriggerEvent('skinchanger:loadClothes', skin, CS.GuideStuff.GuideOutfit.male)

                                    else

                                        TriggerEvent('skinchanger:loadClothes', skin, CS.GuideStuff.GuideOutfit.female)

                                    end

                                end

                            end)

                        end

                        TriggerServerEvent('cs-adminmenu:usedFeature', 'guide_in')

                        SetEntityCoords(PlayerPedId(), CS.GuideStuff.ReinCoords.x, CS.GuideStuff.ReinCoords.y, CS.GuideStuff.ReinCoords.z, false)

                    end

                end)



                if not stauts then

                    print('[CS] Error:', error)

                end

            end

        end)

        Items:AddButton('Go Out', '[Go out of Spawn]', DefaultButton, function(onSelected)

            if onSelected then

                if checkESXPerms('GuideStuff') or AdminBypass() then

                    if CS.GuideStuff.UsePremadeOutfit then

                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

                            if skin ~= nil then

                                TriggerEvent('skinchanger:loadSkin', skin)

                            end

                        end)

                    end

                    TriggerServerEvent('cs-adminmenu:usedFeature', 'guide_out')

                    SetEntityCoords(PlayerPedId(), CS.GuideStuff.RausCoords.x, CS.GuideStuff.RausCoords.y, CS.GuideStuff.RausCoords.z, false)

                end

            end

        end)

    end, function(Panels)

    end)



    BypassMenu:IsVisible(function(Items)

        Items:CheckBox('Super Jump', nil, superjump_checked, DefaultCheckbox, function(onSelected, IsChecked)

            if onSelected then

                if Bypass then

                    superjump_checked = IsChecked

                    if IsChecked then

                        superjump_active = true

                    else

                        superjump_active = false

                    end

                end

            end

        end)

        Items:CheckBox('Super Speed', nil, superspeed_checked, DefaultCheckbox, function(onSelected, IsChecked)

            if onSelected then

                if Bypass then

                    superspeed_checked = IsChecked

                    if IsChecked then

                        superspeed_active = true

                    else

                        superspeed_active = false

                    end

                end

            end

        end)

        Items:CheckBox('Clone Player', nil, clone_checked, DefaultCheckbox, function(onSelected, IsChecked)

            if onSelected then

                if Bypass then

                    clone_checked = IsChecked

                    if IsChecked then

                        local cloneTargetID = KeyboardInput('Test', 'Player ID? [Needs to be In Sync]', '', 4)

                        if cloneTargetID ~= nil then

                            clonePlayer(GetPlayerPed(tonumber(GetPlayerPed(cloneTargetID))))

                        end

                    else

                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

                            if skin ~= nil then

                                TriggerEvent('skinchanger:loadSkin', skin)

                            end

                        end)

                    end

                end

            end

        end)

    end, function(Panels)

    end)



    --Update v1.2

    if use_tickets and has_ticket_perms then

        TicketMenu:IsVisible(function(Items)

            Items:AddSeparator('Enter for Ticket Info!')

            for _, data in pairs(OpenTickets) do

                Items:AddButton(data['ticketOwner']..' Created : '..data['createTime'], nil, DefaultButton, function(onSelected)

                    if onSelected then

                        selected_TicketID = nil

                        selected_Ticket = nil

                        Wait(100)

                        selected_TicketID = data['ticketID']

                        selected_Ticket = data

                    end

                end, TicketInfo)

            end

        end, function(Panels)

        end)

    end



    if update_1_2 and use_tickets then

        UserTicketMenu:IsVisible(function(Items)

            Items:AddButton('Ticket Erstellen', '5 Minuten Cooldown', DefaultButton, function(onSelected)

                if onSelected and canTicket then

                    local ticketReason = KeyboardInput('ticket', 'Ticket Grund?', '', 225)

                    if ticketReason ~= nil then

                        if GetPlayerServerId(PlayerId()) ~= nil then

                            ticketReason = 'User ID : '..GetPlayerServerId(PlayerId())..' '..ticketReason

                            TriggerServerEvent('cs-admin:writeTicket', ticketReason)

                            TriggerServerEvent('cs-adminmenu:usedFeature', 'ticket_create', ticketReason)

                            canTicket = false

                        end

                    end

                end

            end)

        end, function(Panels)

        end)

    end



    if use_tickets and has_ticket_perms then

        TicketInfo:IsVisible(function(Items)

            Items:AddButton('Ticket Reason', 'Press Enter to Read!', DefaultButton, function(onSelected)

                if onSelected then

                    if selected_TicketID ~= nil then

                        if selected_Ticket['ticketContent'] ~= nil then

                            KeyboardInput('ticket', 'Ticket : '..selected_TicketID, selected_Ticket['ticketContent'], 255)

                        end

                    end

                end

            end)

            Items:AddButton('Delete Ticket', '[Ticket ID : '..selected_TicketID..']', DefaultButton, function(onSelected)

                if onSelected then

                    TriggerServerEvent('cs-admin:deleteTicket', selected_TicketID)

                    TriggerServerEvent('cs-adminmenu:usedFeature', 'ticket_delete', selected_TicketID)

                    RageUI.Visible(MainMenyo, true)

                end

            end)

        end, function(Panels)

        end)

    end



end



Keys.Register('F4', 'F4', 'CS Admin Menu', function()

    if ESXGroup ~= 'user' and playerLoaded then

        RageUI.Visible(MainMenyo, true)

    end

end)



--Update v1.2

Citizen.CreateThread(function()

    while true do

        Citizen.Wait(1750)

        if not canTicket then

            Citizen.Wait(300000)

            canTicket = true

        end

    end

end)





RegisterCommand('cs-adminmenu:NoClip', function()

    if checkESXPerms('NoClip') and In_Admin_Duty or AdminBypass() then

        if NoClip_Checked then

            NoClip_Checked = false

            NoClip_Active = false

        else

            NoClip_Checked = true

            NoClip_Active = true

        end

    end

end)



--Update v1.1

RegisterCommand('cs-adminmenu:StopSpectate', function()

    if checkESXPerms('PlayerList_Spectate') and In_Admin_Duty or AdminBypass() and not IsPedInAnyVehicle(PlayerPedId(), false) then

        if Spectate_Checked then

            Spectate_Target = nil

            Spectate_Checked = false

            SetEntityCoords(PlayerPedId(), OldAdminCoords)

            NoClip_Locked = false

            NoClip_Active = false

            NoClip_Checked = false

        end

    end

end)



--Update v1.1

RegisterCommand('cs-adminmenu:adminMode', function()

    if ESXGroup ~= 'user' and playerLoaded then

        if In_Admin_Duty then

            In_Admin_Duty = false

            GodMode_Checked = false

            SetEntityOnlyDamagedByRelationshipGroup(PlayerPedId(), false, 69420)

            NoClip_Locked = false

            NoClip_Active = false

            NoClip_Checked = false

            Nametags_Checked = false

            TriggerEvent('el_duty_out')

            Wait(255)

            TriggerEvent("sanity:notify", "ADMINMENU", "Du hast den Admin Mode Verlassen", 5000, "error")


        else

            In_Admin_Duty = true

            GodMode_Checked = true

            SetEntityOnlyDamagedByRelationshipGroup(PlayerPedId(), true, 69420)

            TriggerEvent('el_duty_ye')

            Wait(255)

            TriggerEvent("sanity:notify", "ADMINMENU", "Du hast den Admin Mode Betreten", 5000, "success")

        end

    end

end)



RegisterKeyMapping('cs-adminmenu:NoClip', 'NoClip', 'keyboard', 'F10')

--Update v1.1

RegisterKeyMapping('cs-adminmenu:StopSpectate', 'Stop Spectate', 'keyboard', 'DELETE')

--Update v1.1

RegisterKeyMapping('cs-adminmenu:adminMode', 'Admin Mode', 'keyboard', 'HOME')



local AllTags = {}

Citizen.CreateThread(function()

    AllTags = {}

    local icons = {

        GamerName = 0,

        AudioIcon = 4

    }

    local playerStr = ''

    while true do

        Citizen.Wait(0)

        if not Nametags_Checked then

            Citizen.Wait(500)

            for _, v in pairs(AllTags) do

                if IsMpGamerTagActive(v.GamerTag) then

                    RemoveMpGamerTag(v.GamerTag)

                end

            end

            AllTags = {}

        else

            if Nametags_Checked then

                for _, player in ipairs(GetActivePlayers()) do

                    local targetPed = GetPlayerPed(player)

                    if GetPlayerPed(-1) ~= targetPed then

                        playerStr = '['..GetPlayerName(player)..']'..'  [ '.. GetPlayerServerId(player)..' ]'

                        if not AllTags[player] or not IsMpGamerTagActive(AllTags[player].GamerTag) then

                            AllTags[player] = {

                                GamerTag = CreateFakeMpGamerTag(targetPed, playerStr, false, false, 0),

                                ped = targetPed

                            }

                        end

                        local TargetTag = AllTags[player].GamerTag

                        local CheckColour = NameTagsColourIndex

                        if CheckColour == 1 then

                            SetMpGamerTagColour(TargetTag, 0, 0)

                        elseif CheckColour == 2 then

                            SetMpGamerTagColour(TargetTag, 0, 6)

                        elseif CheckColour == 3 then

                            SetMpGamerTagColour(TargetTag, 0, 116)

                        elseif CheckColour == 4 then

                            SetMpGamerTagColour(TargetTag, 0, 0)

                        elseif CheckColour == 5 then

                            SetMpGamerTagColour(TargetTag, 0, 96)

                        elseif CheckColour == 6 then

                            SetMpGamerTagColour(TargetTag, 0, 39)

                        elseif CheckColour == 7 then

                            SetMpGamerTagColour(TargetTag, 0, 12)

                        elseif CheckColour == 8 then

                            SetMpGamerTagColour(TargetTag, 0, 18)

                        elseif CheckColour == 9 then

                            SetMpGamerTagColour(TargetTag, 0, 0)

                        end

                        if #(GetEntityCoords(targetPed) - GetEntityCoords(PlayerPedId())) < NameTags_DrawDistance then

                            SetMpGamerTagVisibility(TargetTag, icons.GamerName, 1)

                            SetMpGamerTagAlpha(TargetTag, icons.AudioIcon, 255)

                            SetMpGamerTagVisibility(TargetTag, icons.AudioIcon, NetworkIsPlayerTalking(player))

                        else

                            SetMpGamerTagVisibility(TargetTag, icons.GamerName, 0)

                            SetMpGamerTagVisibility(TargetTag, icons.AudioIcon, 0)

                        end

                    end

                end

            end

        end

    end

end)



--Spectate Thread

Citizen.CreateThread(function()

    local el_spectate_target

    local spec_x, spec_y, spec_z = 0, 0, 0

    while true do

        Citizen.Wait(0)

        if Spectate_Target ~= nil then

            DisableControlAction(1, 32, true)

            DisableControlAction(1, 34, true)

            DisableControlAction(1, 33, true)

            DisableControlAction(1, 35, true)

            DisableControlAction(1, 22, true)

            DisableControlAction(0, 36, true)

            el_spectate_target = Selected_PlayerPed

            spec_x, spec_y, spec_z = table.unpack(GetEntityCoords(el_spectate_target))

            SetEntityCoords(PlayerPedId(), spec_x, spec_y, spec_z +0.5)

        else

            Citizen.Wait(1000)

        end

    end

end)



--NoClip Thread

Citizen.CreateThread(function()

    local el_table = GetEntityCoords(PlayerPedId())

    local el_x, el_y, el_z = table.unpack(GetEntityCoords(PlayerPedId()))

    function getCamDirection()

        local heading = GetGameplayCamRelativeHeading() + GetEntityHeading(PlayerPedId())

        local pitch = GetGameplayCamRelativePitch()

        local coords = vector3(-math.sin(heading * math.pi / 180.0), math.cos(heading * math.pi / 180.0), math.sin(pitch * math.pi / 180.0))

        local len = math.sqrt((coords.x * coords.x) + (coords.y * coords.y) + (coords.z * coords.z))

        if len ~= 0 then

            coords = coords / len

        end

        return coords

    end

    while true do

        Citizen.Wait(0)

        if not NoClip_Thread then

            Citizen.Wait(750)

        end

        if NoClip_Active then

            if IsPedInAnyVehicle(PlayerPedId(), false) then

                FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId(), false), true)

                SetEntityVisible(GetVehiclePedIsIn(PlayerPedId(), false), false, false)

                SetEntityInvincible(PlayerPedId(), true)

                local VehicleCoordsTakTak = GetEntityCoords(GetVehiclePedIsIn(PlayerPedId(), false))

                SetEntityVelocity(GetVehiclePedIsIn(PlayerPedId(), false), 0.01, 0.01, 0.01)

                if IsControlPressed(0, 32) and Spectate_Target == nil then

                    VehicleCoordsTakTak = GetEntityCoords(PlayerPedId()) + (NoClip_Speed * getCamDirection())

                end

                if IsControlPressed(0, 269) and Spectate_Target == nil then

                    VehicleCoordsTakTak = GetEntityCoords(PlayerPedId()) - (NoClip_Speed * getCamDirection())

                end

                if HoldingCTRL(0, 22)  and Spectate_Target == nil then

                    el_table = GetEntityCoords(GetVehiclePedIsIn(PlayerPedId(), false), false)

                    el_x, el_y, el_z = table.unpack(el_table)

                    VehicleCoordsTakTak = vector3(el_x, el_y, el_z + 1.5)

                end

                if HoldingCTRL(0, 36) and Spectate_Target == nil then

                    el_table = GetEntityCoords(GetVehiclePedIsIn(PlayerPedId(), false), false)

                    el_x, el_y, el_z = table.unpack(el_table)

                    VehicleCoordsTakTak = vector3(el_x, el_y, el_z -1.5)

                end

                if HoldingCTRL(0, 21) and Spectate_Target == nil then

                    NoClip_Speed = 15

                else

                    NoClip_Speed = NoClipSlider_Curr

                end

                SetEntityCoordsNoOffset(GetVehiclePedIsIn(PlayerPedId(), false), VehicleCoordsTakTak, true, true, true)

            else

                FreezeEntityPosition(PlayerPedId(), true)

                SetEntityVisible(PlayerPedId(), false, false)

                SetEveryoneIgnorePlayer(PlayerId(), true)

                SetEntityInvincible(PlayerPedId(), true)

                local PlayerCoordsTakTak = GetEntityCoords(PlayerPedId(), false)

                SetEntityVelocity(PlayerPedId(), 0.01, 0.01, 0.01)

                if IsControlPressed(0, 32) and Spectate_Target == nil then

                    PlayerCoordsTakTak = GetEntityCoords(PlayerPedId()) + (NoClip_Speed * getCamDirection())

                end

                if IsControlPressed(0, 269) and Spectate_Target == nil then

                    PlayerCoordsTakTak = GetEntityCoords(PlayerPedId()) - (NoClip_Speed * getCamDirection())

                end

                if HoldingCTRL(0, 22) and Spectate_Target == nil then

                    el_table = GetEntityCoords(PlayerPedId(), false)

                    el_x, el_y, el_z = table.unpack(el_table)

                    PlayerCoordsTakTak = vector3(el_x, el_y, el_z + 1.5)

                end

                if HoldingCTRL(0, 36) and Spectate_Target == nil then

                    el_table = GetEntityCoords(PlayerPedId(), false)

                    el_x, el_y, el_z = table.unpack(el_table)

                    PlayerCoordsTakTak = vector3(el_x, el_y, el_z - 1.5)

                end

                if HoldingCTRL(0, 21) and Spectate_Target == nil then

                    NoClip_Speed = 15

                else

                    NoClip_Speed = NoClipSlider_Curr

                end

                SetEntityCoordsNoOffset(PlayerPedId(), PlayerCoordsTakTak, true, true, true)

            end

        else

            Citizen.Wait(125)

            if IsPedInAnyVehicle(PlayerPedId(), false) then

                FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId(), false), false)

                SetEntityVisible(GetVehiclePedIsIn(PlayerPedId(), false), true, false)

            end

            if not IsEntityVisible(PlayerPedId()) then

                SetEntityVisible(PlayerPedId(), true, false)

            end

            FreezeEntityPosition(PlayerPedId(), false)

            SetEntityInvincible(PlayerPedId(), false)

            SetEveryoneIgnorePlayer(PlayerId(), false)

        end

    end

end)



Citizen.CreateThread(function()

    while true do

        Citizen.Wait(0)

        if SpeedSlider_Curr == 0 then

            Citizen.Wait(2500)

        else

            if HoldingCTRL(0, 21) and IsPedInAnyVehicle(PlayerPedId(), false) then

                if SpeedSlider_Curr ~= 0 then

                    SetVehicleForwardSpeed(GetVehiclePedIsIn(PlayerPedId(), false), GetEntitySpeed(PlayerPedId()) + SpeedSlider_Curr / 100)

                end

            end

        end

    end

end)



Citizen.CreateThread(function()

    local colour_tak_tak = '~s~'

    while true do

        Citizen.Wait(0)

        if Dev_Mode then

            if Dev_Mode_Colour == 1 then

                colour_tak_tak = '~s~'

            elseif Dev_Mode_Colour == 2 then

                colour_tak_tak = '~r~'

            elseif Dev_Mode_Colour == 3 then

                colour_tak_tak = '~b~'

            elseif Dev_Mode_Colour == 4 then

                colour_tak_tak = '~s~'

            elseif Dev_Mode_Colour == 5 then

                colour_tak_tak = '~p~'

            elseif Dev_Mode_Colour == 6 then

                colour_tak_tak = '~s~'

            elseif Dev_Mode_Colour == 7 then

                colour_tak_tak = '~y~'

            elseif Dev_Mode_Colour == 8 then

                colour_tak_tak = '~g~'

            elseif Dev_Mode_Colour == 9 then

                local randomCock = math.random(1, 9)

                if randomCock == 1 then

                    colour_tak_tak = '~r~'

                elseif randomCock == 2 then

                    colour_tak_tak = '~b~'

                elseif randomCock == 3 then

                    colour_tak_tak = '~p~'

                elseif randomCock == 4 then

                    colour_tak_tak = '~o~'

                elseif randomCock == 5 then

                    colour_tak_tak = '~y~'

                elseif randomCock == 6 then

                    colour_tak_tak = '~g~'

                end

            end

            if IsPedInAnyVehicle(PlayerPedId(), false) then

                dev_veh = GetEntityModel(GetVehiclePedIsIn(PlayerPedId(), false))

                dev_ent_owner = NetworkGetEntityOwner(GetVehiclePedIsIn(PlayerPedId(), false))

            else

                dev_veh = 0

                dev_ent_owner = 0

            end

            local entity = IsPedInAnyVehicle(PlayerPedId()) and GetVehiclePedIsIn(PlayerPedId(), false) or PlayerPedId()

            x_x, y_y, z_z = table.unpack(GetEntityCoords(entity, true))

            roundx = tonumber(string.format('%.2f', x_x))

            roundy = tonumber(string.format('%.2f', y_y))

            roundz = tonumber(string.format('%.2f', z_z))

            DrawTxt(colour_tak_tak..'X~s~: '..roundx, 0.32, 0.00)

            DrawTxt(colour_tak_tak..'Y~s~: '..roundy, 0.38, 0.00)

            DrawTxt(colour_tak_tak..'Z~s~: '..roundz, 0.445, 0.00)

            heading = GetEntityHeading(entity)

            roundh = tonumber(string.format('%.2f', heading))

            dev_gun = GetSelectedPedWeapon(PlayerPedId())

            DrawTxt(colour_tak_tak..'H~s~: '..roundh, 0.50, 0.00)

            DrawTxt(colour_tak_tak..'Vehicle Hash~s~: '..dev_veh, 0.35, 0.02)

            DrawTxt(colour_tak_tak..'Vehicle Network Owner~s~: '..dev_ent_owner, 0.35, 0.04)

            DrawTxt(colour_tak_tak..'Weapon Hash~s~: '..dev_gun, 0.35, 0.06)

        else

            Citizen.Wait(1500)

        end

    end

end)



--Update v1.1 Thread

Citizen.CreateThread(function()

    while true do

        Citizen.Wait(0)

        if Bypass then

            if superjump_active then

                SetSuperJumpThisFrame(PlayerId())

            end

        else

            Citizen.Wait(2000)

        end

    end

end)

Citizen.CreateThread(function()

    local superspeed_set = false

    while true do

        Citizen.Wait(0)

        if Bypass then

            if superspeed_active then

                RestorePlayerStamina(PlayerId(), 1.0)

                if not superspeed_set then

                    SetPedMoveRateOverride(PlayerId(), 10.0)

                    SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)

                    superspeed_set = true

                end

            else

                superspeed_set = false

                SetPedMoveRateOverride(PlayerId(), 1.0)

                SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)

                Citizen.Wait(1250)

            end

        else

            Citizen.Wait(1750)

        end

    end

end)



--Duty Shit

RegisterNetEvent('el_duty_ye')

AddEventHandler('el_duty_ye', function(group)

    TriggerEvent('skinchanger:getSkin', function(skin)

        if skin ~= nil then

            for k, v in pairs(AdminDutys) do

                if k == ESXGroup then

                    if skin.sex == 0 then

                        TriggerEvent('skinchanger:loadClothes', skin, v.male)

                    else

                        TriggerEvent('skinchanger:loadClothes', skin, v.female)

                    end

                end

            end

        end

    end)

end)



RegisterNetEvent('el_duty_out')

AddEventHandler('el_duty_out', function()

    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

        if skin ~= nil then

            TriggerEvent('skinchanger:loadSkin', skin)                 

        end

    end)

end)



function AdminBypass()

    local group = ESXGroup

    for _, access_group in pairs(CS.Perms.AdminBypass) do

        if group == access_group then

            return true 

        end

    end

end

function checkESXPerms(which)

    local group = ESXGroup

    if which == 'GodMode' then

        for _, access_group in pairs(CS.Perms.Godmoderatore) do

            if group == access_group then

                return true

            end

        end

    elseif which == 'Nametags' then

        for _, access_group in pairs(CS.Perms.NameTags) do

            if group == access_group then

                return true

            end

        end

    elseif which == 'NoClip' then

        for _, access_group in pairs(CS.Perms.NoClip) do

            if group == access_group then

                return true

            end

        end

    elseif which == 'FullHeal' then

        for _, access_group in pairs(CS.Perms.FullHeal) do

            if group == access_group then

                return true

            end

        end

    elseif which == 'CarSpawn' then

        for _, access_group in pairs(CS.Perms.CarSpawn) do

            if group == access_group then

                return true

            end

        end

    elseif which == 'CarFix' then

        for _, access_group in pairs(CS.Perms.CarFix) do

            if group == access_group then

                return true

            end

        end

    elseif which == 'CarDel' then

        for _, access_group in pairs(CS.Perms.CarDel) do

            if group == access_group then

                return true

            end

        end

    elseif which == 'CarBoost' then

        for _, access_group in pairs(CS.Perms.CarBoost) do

            if group == access_group then

                return true

            end

        end

    elseif which == 'GiveMoney' then

        for _, access_group in pairs(CS.Perms.GiveMoney) do

            if group == access_group then

                return true

            end

        end

    elseif which == 'GiveItem' then

        for _, access_group in pairs(CS.Perms.GiveItem) do

            if group == access_group then

                return true

            end

        end

    elseif which == 'GiveWeapon' then

        for _, access_group in pairs(CS.Perms.GiveWeapon) do

            if group == access_group then

                return true

            end

        end

    elseif which == 'PlayerList_Goto' then

        for _, access_group in pairs(CS.Perms.PlayerList.Goto) do

            if group == access_group then

                return true

            end

        end

    elseif which == 'PlayerList_Bring' then

        for _, access_group in pairs(CS.Perms.PlayerList.Bring) do

            if group == access_group then

                return true

            end

        end

    elseif which == 'PlayerList_Freeze' then

        for _, access_group in pairs(CS.Perms.PlayerList.Freeze) do

            if group == access_group then

                return true

            end

        end

    elseif which == 'PlayerList_Spectate' then

        for _, access_group in pairs(CS.Perms.PlayerList.Spectate) do

            if group == access_group then

                return true

            end

        end

    elseif which == 'PlayerList_Heal' then

        for _, access_group in pairs(CS.Perms.PlayerList.Heal) do

            if group == access_group then

                return true

            end

        end

    elseif which == 'PlayerList_ResetSkin' then

        for _, access_group in pairs(CS.Perms.PlayerList.ResetSkin) do

            if group == access_group then

                return true

            end

        end

    elseif which == 'PlayerList_SetJob' then

        for _, access_group in pairs(CS.Perms.PlayerList.SetJob) do

            if group == access_group then

                return true

            end

        end

    elseif which == 'PlayerList_GiveAccountMoney' then

        for _, access_group in pairs(CS.Perms.PlayerList.GiveAccountMoney) do

            if group == access_group then

                return true

            end

        end

    --Update v1.1

    elseif which == 'PlayerList_Kick' then

        for _, access_group in pairs(CS.Perms.PlayerList.KickPlayer) do

            if group == access_group then

                return true

            end

        end

    elseif which == 'PlayerList_Ban' then

        for _, access_group in pairs(CS.Perms.PlayerList.BanPlayer) do

            if group == access_group then

                return true

            end

        end

    elseif which == 'GuideStuff' then

        if CS.Perms.Guide ~= nil then

            update_1_1 = true

            for _, access_group in pairs(CS.Perms.Guide) do

                if group == access_group then

                    return true

                end

            end

        else

            update_1_1 = false

            Notify('[ERROR]', 'Update v1.1 Missing! Check Customer Info')

            print('[ADMIN-MENU] ERROR Update v1.1 Missing! Check Customer Info')

        end

    elseif which == 'Tickets' then

        if CS.Perms.Tickets ~= nil then

            update_1_2 = true

            for _, access_group in pairs(CS.Perms.Tickets) do

                if group == access_group then

                    return true

                end

            end

        else

            update_1_2 = false

            Notify('[ERROR]', 'Update v1.2 Missing! Check Customer Info')

            print('[ADMIN-MENU] ERROR Update v1.2 Missing! Check Customer Info')

        end

    elseif which == 'AllTickets' then

        if CS.Perms.ClearAllTickets ~= nil then

            for _, access_group in pairs(CS.Perms.ClearAllTickets) do

                if group == access_group then

                    return true

                end

            end

        end

        --Update v1.3

    elseif which == 'PlayerList_ScreenPlayer' then

        if CS.Perms.PlayerList.ScreenShot ~= nil then

            for _, access_group in pairs(CS.Perms.PlayerList.ScreenShot) do

                if group == access_group then

                    return true

                end

            end

        end

    end

end

function Round(value, numDecimalPlaces)

    if numDecimalPlaces then

        local power = 10^numDecimalPlaces

        return math.floor((value * power) + 0.5) / (power)

    else

        return math.floor(value + 0.5)

    end

end

function RndmStr(length)

    local res = ''

    for i = 1, length do

        res = res .. string.char(math.random(97, 122))

    end

    return res

end

function GetTheme()

    local checkTheme = Dev_Mode_Colour

    if checkTheme == 0 then

        return '~s~'

    elseif checkTheme == 1 then

        return '~s~'

    elseif checkTheme == 2 then

        return '~r~'

    elseif checkTheme == 3 then

        return '~b~'

    elseif checkTheme == 4 then

        return '~s~'

    elseif checkTheme == 5 then

        return '~p~'

    elseif checkTheme == 6 then

        return '~o~'

    elseif checkTheme == 7 then

        return '~y~'

    elseif checkTheme == 8 then

        return '~g~'

    elseif checkTheme == 9 then

        local random_dick_kego = math.random(1, 7)

        if random_dick_kego == 1 then

            return '~s~'

        elseif random_dick_kego == 2 then

            return '~r~'

        elseif random_dick_kego == 3 then

            return '~b~'

        elseif random_dick_kego == 4 then

            return '~g~'

        elseif random_dick_kego == 5 then

            return '~y~'

        elseif random_dick_kego == 6 then

            return '~p~'

        elseif random_dick_kego == 7 then

            return '~o~'

        end

    end

end

function DrawTxt(text, x, y)

    SetTextFont(0)

    SetTextProportional(1)

    SetTextScale(0.0, 0.4)

    SetTextDropshadow(1, 0, 0, 0, 255)

    SetTextEdge(1, 0, 0, 0, 255)

    SetTextDropShadow()

    SetTextOutline()

    SetTextEntry('STRING')

    AddTextComponentString(text)

    DrawText(x, y)

end

function GetPedMugshot(ped, transparent)

    if DoesEntityExist(ped) then

        local mugshot

        if transparent then

            mugshot = RegisterPedheadshotTransparent(ped)

        else

            mugshot = RegisterPedheadshot(ped)

        end

        while not IsPedheadshotReady(mugshot) do

            Wait(0)

        end

        return mugshot, GetPedheadshotTxdString(mugshot)

    else

        return

    end

end

function Notify(sub, message)

    if CS.UseNotify ~= nil then

        if CS.CustomNotify ~= nil then

            if CS.UseNotify then

                if CS.CustomNotify then

                    CustomNotify(sub, message)

                else

                    local mugshot, mugshotStr = GetPedMugshot(PlayerPedId(), false)

                    AddTextEntry('cs-lua-notify', message)

                    BeginTextCommandThefeedPost('cs-lua-notify')

                    EndTextCommandThefeedPostMessagetext(mugshotStr, mugshotStr, false, 7, sub)

                    EndTextCommandThefeedPostTicker(false, false)

                    UnregisterPedheadshot(mugshot)

                end

            else

                return

            end

        else

            print('[ADMIN-MENU] ERROR Update v1.3 Missing! Check Customer Info')

        end

    else

        print('[ADMIN-MENU] ERROR Update v1.2 Missing! Check Customer Info')

    end

end

function HoldingCTRL(p1, p2)

    local c_s = IsDisabledControlPressed(p1, p2)

    if c_s then

        return true

    else

        return false

    end

end

function KeyboardInput(entryTitle, textEntry, inputText, maxLength)

    AddTextEntry(entryTitle, textEntry)

    DisplayOnscreenKeyboard(1, entryTitle, '', inputText, '', '', '', maxLength)

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do

        Citizen.Wait(0)

    end

    if UpdateOnscreenKeyboard() ~= 2 then

        local result = GetOnscreenKeyboardResult()

        Citizen.Wait(500)

        return result

    else

        Citizen.Wait(500)

        return nil

    end

end

--Update v1.1

function clonePlayer(player)

    if IsPedAPlayer(player) then

        RequestModel(player)

        while not HasModelLoaded(player) do

            Wait(10)

        end

        SetPlayerModel(PlayerId(), GetEntityModel(player))

        ClonePedToTarget(player, PlayerPedId())

    end

end

AddEventHandler('onResourceStop', function(resourceName)

    for _, v in pairs(AllTags) do

        if IsMpGamerTagActive(v.GamerTag) then

            RemoveMpGamerTag(v.GamerTag)

        end

    end

    AllTags = {}

end)



--RAGEUI SLIDERS

--El Sliders

function RageUI.IsMouseInBounds(X, Y, Width, Height)

    local MX, MY = math.round(GetControlNormal(0, 239) * 1920) / 1920, math.round(GetControlNormal(0, 240) * 1080) / 1080

    X, Y = X / 1920, Y / 1080

    Width, Height = Width / 1920, Height / 1080

    return (MX >= X and MX <= X + Width) and (MY > Y and MY < Y + Height)

end

--

local SettingsButton = {

    Rectangle = { Y = 0, Width = 431, Height = 38 },

    Text = { X = 8, Y = 3, Scale = 0.33 },

    LeftBadge = { Y = -2, Width = 40, Height = 40 },

    RightBadge = { X = 385, Y = -2, Width = 40, Height = 40 },

    RightText = { X = 420, Y = 4, Scale = 0.35 },

    SelectedSprite = { Dictionary = 'commonmenu', Texture = 'gradient_nav', Y = 0, Width = 431, Height = 38 },

}

local SettingsSlider = {

    Background = { X = 250, Y = 14.5, Width = 150, Height = 9 },

    Slider = { X = 250, Y = 14.5, Width = 75, Height = 9 },

    Divider = { X = 323.5, Y = 9, Width = 2.5, Height = 20 },

    LeftArrow = { Dictionary = 'commonmenutu', Texture = 'arrowleft', X = 235, Y = 11.5, Width = 15, Height = 15 },

    RightArrow = { Dictionary = 'commonmenutu', Texture = 'arrowright', X = 400, Y = 11.5, Width = 15, Height = 15 },

}

local RightOffset = 0

function Items:AddSlider(Label, ProgressStart, ProgressMax, ProgressCur, Steps, Description, Divider, Style, Enabled, Callback)

    local CurrentMenu = RageUI.CurrentMenu;

    local Audio = RageUI.Settings.Audio

    local Changed = false

    local Pressed = false

    if CurrentMenu ~= nil then

        if CurrentMenu() then

            local Items = {}

            for i = 1, ProgressMax do

                table.insert(Items, i)

            end

            local Option = RageUI.Options + 1

            if CurrentMenu.Pagination.Minimum <= Option and CurrentMenu.Pagination.Maximum >= Option then

                local Selected = CurrentMenu.Index == Option

                local LeftArrowHovered, RightArrowHovered = false, false

                RageUI.ItemsSafeZone(CurrentMenu)

                local Hovered = false;

                local LeftBadgeOffset = ((Style.LeftBadge == RageUI.BadgeStyle.None or tonumber(Style.LeftBadge) == nil) and 0 or 27)

                local RightBadgeOffset = ((Style.RightBadge == RageUI.BadgeStyle.None or tonumber(Style.RightBadge) == nil) and 0 or 32)

                if Selected then

                    LeftArrowHovered = RageUI.IsMouseInBounds(CurrentMenu.X + SettingsSlider.LeftArrow.X + CurrentMenu.SafeZoneSize.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsSlider.LeftArrow.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.LeftArrow.Width, SettingsSlider.LeftArrow.Height)

                    RightArrowHovered = RageUI.IsMouseInBounds(CurrentMenu.X + SettingsSlider.RightArrow.X + CurrentMenu.SafeZoneSize.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsSlider.RightArrow.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.RightArrow.Width, SettingsSlider.RightArrow.Height)

                end

                if Enabled == true or Enabled == nil then

                    if Selected then

                        if Style.RightLabel ~= nil and Style.RightLabel ~= '' then

                            Graphics.Text(Style.RightLabel, CurrentMenu.X + SettingsButton.RightText.X - RightBadgeOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightText.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.RightText.Scale, 255, 255, 255, 255, 2)

                            RightOffset = Graphics.MeasureStringWidth(Style.RightLabel, 0, 0.35)

                        end

                    else

                        if Style.RightLabel ~= nil and Style.RightLabel ~= '' then

                            RightOffset = Graphics.MeasureStringWidth(Style.RightLabel, 0, 0.35)

                            Graphics.Text(Style.RightLabel, CurrentMenu.X + SettingsButton.RightText.X - RightBadgeOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightText.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.RightText.Scale, 255, 255, 255, 255, 2)

                        end

                    end

                end

                RightOffset = RightOffset + RightBadgeOffset

                if Enabled == true or Enabled == nil then

                    if Selected then

                        Graphics.Text(Label, CurrentMenu.X + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 0, 0, 0, 255)

                        Graphics.Sprite(SettingsSlider.LeftArrow.Dictionary, SettingsSlider.LeftArrow.Texture, CurrentMenu.X + SettingsSlider.LeftArrow.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.LeftArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.LeftArrow.Width, SettingsSlider.LeftArrow.Height, 0, 0, 0, 0, 255)

                        Graphics.Sprite(SettingsSlider.RightArrow.Dictionary, SettingsSlider.RightArrow.Texture, CurrentMenu.X + SettingsSlider.RightArrow.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.RightArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.RightArrow.Width, SettingsSlider.RightArrow.Height, 0, 0, 0, 0, 255)

                    else

                        Graphics.Text(Label, CurrentMenu.X + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 245, 245, 245, 255)

                    end

                else

                    Graphics.Text(Label, CurrentMenu.X + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 255, 255, 255, 200)

                    if Selected then

                        Graphics.Sprite(SettingsSlider.LeftArrow.Dictionary, SettingsSlider.LeftArrow.Texture, CurrentMenu.X + SettingsSlider.LeftArrow.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.LeftArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.LeftArrow.Width, SettingsSlider.LeftArrow.Height, 0, 255, 255, 255)

                        Graphics.Sprite(SettingsSlider.RightArrow.Dictionary, SettingsSlider.RightArrow.Texture, CurrentMenu.X + SettingsSlider.RightArrow.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.RightArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.RightArrow.Width, SettingsSlider.RightArrow.Height, 0, 255, 255, 255)

                    end

                end

                    if type(Style) == 'table' then

                        if Style.Enabled == true or Style.Enabled == nil then

                            if Style.LeftBadge ~= nil then

                                if Style.LeftBadge ~= RageUI.BadgeStyle.None and tonumber(Style.LeftBadge) ~= nil then

                                    Graphics.Sprite(RageUI.GetBadgeDictionary(Style.LeftBadge, Selected), RageUI.GetBadgeTexture(Style.LeftBadge, Selected), CurrentMenu.X, CurrentMenu.Y + SettingsButton.LeftBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.LeftBadge.Width, SettingsButton.LeftBadge.Height, RageUI.GetBadgeColour(Style.LeftBadge, Selected))

                                end

                            end

                            if Style.RightBadge ~= nil then

                                if Style.RightBadge ~= RageUI.BadgeStyle.None and tonumber(Style.RightBadge) ~= nil then

                                    Graphics.Sprite(RageUI.GetBadgeDictionary(Style.RightBadge, Selected), RageUI.GetBadgeTexture(Style.RightBadge, Selected), CurrentMenu.X + SettingsButton.RightBadge.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.RightBadge.Width, SettingsButton.RightBadge.Height, 0, 255, 255, 255, 125)

                                end

                            end

                        else

                            local LeftBadge = RageUI.BadgeStyle.Lock

                            local LeftBadgeOffset = ((LeftBadge == RageUI.BadgeStyle.None or tonumber(LeftBadge) == nil) and 0 or 27)

                            if LeftBadge ~= RageUI.BadgeStyle.None and tonumber(LeftBadge) ~= nil then

                                Graphics.Sprite(RageUI.GetBadgeDictionary(LeftBadge, Selected), RageUI.GetBadgeTexture(LeftBadge, Selected), CurrentMenu.X, CurrentMenu.Y + SettingsButton.LeftBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.LeftBadge.Width, SettingsButton.LeftBadge.Height, nil, CheckBoxLockBadgeColor(Selected))

                            end

                        end

                    else

                        error('UICheckBox Style is not a table')

                    end

                    -- Dark Blue Background

                    Graphics.Rectangle(CurrentMenu.X + SettingsSlider.Background.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.Background.Width, SettingsSlider.Background.Height, 0, 0, 0, 125)

                    -- hellblaues element         

                    -- (SettingsSlider.Background.Width - SettingsSlider.Slider.Width)    

                    local blau_width = (CurrentMenu.X + SettingsSlider.Slider.X + (((SettingsSlider.Background.Width) / (ProgressMax - 1)) * ((ProgressStart + ProgressCur) - 1)) + CurrentMenu.WidthOffset - RightOffset) - (CurrentMenu.X + SettingsSlider.Background.X + CurrentMenu.WidthOffset - RightOffset)

                    local blau_y_c = CurrentMenu.Y + SettingsSlider.Slider.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset

                    local blau_x_c = (CurrentMenu.X + SettingsSlider.Slider.X + (((SettingsSlider.Background.Width) / (ProgressMax - 1)) * ((ProgressStart + ProgressCur) - 1)) + CurrentMenu.WidthOffset - RightOffset) - blau_width

                    --local blau_x_c = blau_width + (CurrentMenu.X + SettingsSlider.Background.X + CurrentMenu.WidthOffset - RightOffset)

                    --local blau_x_c = (CurrentMenu.X + SettingsSlider.Slider.X + (((SettingsSlider.Background.Width - SettingsSlider.Slider.Width) / (ProgressMax - 1)) * ((ProgressStart + ProgressCur) - 1)) - CurrentMenu.WidthOffset - RightOffset) - (CurrentMenu.X + SettingsSlider.Background.X + CurrentMenu.WidthOffset - RightOffset) + (CurrentMenu.X + SettingsSlider.Slider.X + (((SettingsSlider.Background.Width) / (ProgressMax - 1)) * ((ProgressStart + ProgressCur) - 1)) + CurrentMenu.WidthOffset - RightOffset)/2

                                                                        -- ANFANG BACKGROUND --                                                                                     -- RELATIVE KOORDINATEN DES STRICHS --

                    Graphics.Rectangle(blau_x_c, blau_y_c, blau_width, SettingsSlider.Slider.Height, CS_UI.Colours.R, CS_UI.Colours.G, CS_UI.Colours.B, 255)



                if Divider then

                    -- Weisster Strich -- CurrentMenu.X + (SettingsSlider.Divider.X + ProgressCur) + CurrentMenu.WidthOffset

                    Graphics.Rectangle(CurrentMenu.X + SettingsSlider.Slider.X + (((SettingsSlider.Background.Width) / (ProgressMax - 1)) * ((ProgressStart + ProgressCur) - 1)) + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.Divider.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.Divider.Width, SettingsSlider.Divider.Height, 255, 255, 255, 255)

                end

                RageUI.ItemOffset = RageUI.ItemOffset + SettingsButton.Rectangle.Height

                local Active = CurrentMenu.Index == Option;

                if Active then

                    RageUI.ItemsDescription(Description);

                end

                if Selected and (CurrentMenu.Controls.Left.Active or (CurrentMenu.Controls.Click.Active and LeftArrowHovered)) and not (CurrentMenu.Controls.Right.Active or (CurrentMenu.Controls.Click.Active and RightArrowHovered)) then

                    ProgressCur = ProgressCur - Steps or 1

                    if ProgressCur < ProgressStart then

                        ProgressCur = ProgressStart

                    end

                    Changed = true

                elseif Selected and (CurrentMenu.Controls.Right.Active or (CurrentMenu.Controls.Select.Active and RightArrowHovered)) and not (CurrentMenu.Controls.Left.Active or (CurrentMenu.Controls.Select.Active and LeftArrowHovered)) then

                    ProgressCur = ProgressCur + Steps or 1

                    if ProgressCur > ProgressMax then

                        ProgressCur = ProgressMax

                    end

                    Changed = true

                end

                if Selected and (CurrentMenu.Controls.Select.Active or ((Hovered and CurrentMenu.Controls.Select.Active) and (not LeftArrowHovered and not RightArrowHovered))) then

                    Pressed = true

                end

                if Changed or Pressed then

                    Callback(Selected, ProgressCur)

                end

            end

            RageUI.Options = RageUI.Options + 1

        end

    end

end