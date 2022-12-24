

ESX = nil

TriggerEvent(CS.getSharedObject, function(obj) ESX = obj end)



--Update v1.3

Webhooks.ScreenStorage = 'https://discord.com/api/webhooks/' --Make a Channel where the Screens can be Uploaded [Not the Main Webhook]



function DevPrint(what)

    local dev = true

    if dev then

        print(type(what), what)

    end

end



ESX.RegisterServerCallback('cs-admin:getESXGroup', function(source, cb)

    local xPlayer = ESX.GetPlayerFromId(source)

    local group = xPlayer.getGroup()

    if group ~= nil then

        cb(group)

    else

        cb('user')

    end

end)    

        --Update v1.3

        function getidentifiers(player)

            local steamid = 'Not Linked'

            local license = 'Not Linked'

            local discord = 'Not Linked'

            local xbl = 'Not Linked'

            local liveid = 'Not Linked'

            local ip = 'Not Linked'

            for k, v in pairs(GetPlayerIdentifiers(player)) do

                if string.sub(v, 1, string.len('steam:')) == 'steam:' then

                    steamid = v

                elseif string.sub(v, 1, string.len('license:')) == 'license:' then

                    license = v

                elseif string.sub(v, 1, string.len('xbl:')) == 'xbl:' then

                    xbl = v

                elseif string.sub(v, 1, string.len('ip:')) == 'ip:' then

                    ip = string.sub(v, 4)

                elseif string.sub(v, 1, string.len('discord:')) == 'discord:' then

                    discordid = string.sub(v, 9)

                    discord = '<@' .. discordid .. '>'

                elseif string.sub(v, 1, string.len('live:')) == 'live:' then

                    liveid = v

                end

            end

            return steamid, license, xbl, ip, discord, liveid

        end

        if Webhooks.ScreenStorage ~= nil and CS.UseTicketSystem ~= nil then

            ESX.RegisterServerCallback('cs-admin:clientWebhook', function(source, cb)

                local xPlayer = ESX.GetPlayerFromId(source)

                if Webhooks.ScreenStorage ~= nil then

                    cb(Webhooks.ScreenStorage)

                end

            end)

            RegisterNetEvent('cs-admin:requestClientScreen', function(client)

                if client ~= nil then

                    if checkESXPerms_S(source, 'PlayerList_Screen') or AdminBypass_S() then

                        TriggerClientEvent('cs-admin:screenShotPlayer', client, GetPlayerName(source), client)

                    end

                end

            end)

            RegisterNetEvent('cs-admin:clientSentScreen', function(data, name, target)

                local playerId = source

                local admin_name = name

                --GayCode Start

                local screenshot_cock_gaycode = 'https://gayCode.com'

                for _, cock in pairs(data) do

                    if type(cock) == 'table' then

                        for __, cock2 in pairs(cock) do

                            if type(cock2) == 'table' then

                                for ___, cock3 in pairs(cock2) do

                                    if ___ == 'url' then

                                        screenshot_cock_gaycode = cock3

                                        break

                                    end

                                end

                            end

                        end

                    end

                end

                --GayCode End

                local targetName = GetPlayerName(target)

                local steamid, license, xbl, ip, discord, liveid = getidentifiers(target)

                local log = {

                    ['color'] = 0x1b42a6,

                    ['type'] = 'rich',

                    ['title'] = 'CS Screenshot',

                    ['description'] = '**PlayerID:** ' .. playerId .. '\n **Name:** ' .. targetName .. '\n **License:** ' .. license .. '\n **SteamID:** ' .. steamid .. '\n **Discord:** ' .. discord .. '\n **Live:** ' .. liveid .. '\n **Xbox:** ' .. xbl .. '\n **IP:** ' .. ip .. '\n \n **Angefragt von** \n **Name:** ' .. admin_name,

                    ['image'] = {

                        ['url'] = screenshot_cock_gaycode

                    },

                    ['footer'] = {

                        ['text'] = 'CS-Screenshot - ' .. os.date('%c') .. ''

                    }

                }

                PerformHttpRequest(Webhooks.Screens, function(err, text, headers) end, 'POST', json.encode({username = nil, avatar_url = nil, embeds = { log }}), {['Content-Type'] = 'application/json'})    

            end)

        else

            print('[ADMIN-MENU] ERROR Update v1.3 Missing!')

        end

        

        ESX.RegisterServerCallback('cs-admin:getPlayerInfo', function(source, cb, cock)

            if source ~= nil then

                local return_table = {}

                local xTarget = ESX.GetPlayerFromId(cock)

                local xTargetMoney = xTarget.getMoney()

                local xTargetBankMoney = xTarget.getAccount('bank').money

                local xTargetBlackMoney = 0

                if xTarget.getAccount('black_money') ~= nil then

                    xTargetBlackMoney = xTarget.getAccount('black_money').money

                end

                local xTargetJobName = xTarget.getJob().name

                local xTargetJobGrade = xTarget.getJob().grade

                local xTargetJobLabel = xTarget.getJob().label

                if xTargetMoney ~= nil and xTargetBankMoney ~= nil and xTargetBlackMoney ~= nil and xTargetJobName ~= nil and xTargetJobGrade ~= nil and xTargetJobLabel ~= nil then

                    table.insert(return_table, xTargetMoney)

                    Wait(10)

                    table.insert(return_table, xTargetBankMoney)

                    Wait(10)

                    table.insert(return_table, xTargetBlackMoney)

                    Wait(10)

                    table.insert(return_table, xTargetJobName)

                    Wait(10)

                    table.insert(return_table, xTargetJobGrade)

                    Wait(10)

                    table.insert(return_table, xTargetJobLabel)

                    Wait(10)

                    cb(return_table)

                else

                    table.insert(return_table, 0)

                    Wait(10)

                    table.insert(return_table, 0)

                    Wait(10)

                    table.insert(return_table, 0)

                    Wait(10)

                    table.insert(return_table, '~r~Error Loading Stats~s~')

                    Wait(10)

                    table.insert(return_table, 0)

                    Wait(10)

                    table.insert(return_table, '~r~Error Loading Stats~s~')

                    cb(return_table)

                end

            end

        end)

        

        Teleport = {}

        

        Teleport.OldCoords = {}

        

        RegisterNetEvent('cs-adminmenu:PlayerList_S', function(what, p1, p2, p3)

            if what ~= nil then

                local kick_reason = ''

                local ban_reason = ''

                local _source = source

                local _cock = p1

                if what == 'bring' then

                    if checkESXPerms_S(source, 'PlayerList_Bring') or AdminBypass_S() then

                        local xPlayer = ESX.GetPlayerFromId(source)

                        local xTarget = ESX.GetPlayerFromId(p1)

                        Teleport.OldCoords.p1 = xTarget.getCoords(false)

                        Wait(125)

                        xTarget.setCoords(xPlayer.getCoords(false))

                        DiscordLog('players', GetPlayerName(_source)..' Used Bring on : '..GetPlayerName(_cock))

                    end

                elseif what == 'bring_back' then

                    if Teleport.OldCoords.p1 ~= nil then

                        if checkESXPerms_S(source, 'PlayerList_Bring') or AdminBypass_S() then

                            local xPlayer = ESX.GetPlayerFromId(source)

                            local xTarget = ESX.GetPlayerFromId(p1)

                            xTarget.setCoords(Teleport.OldCoords.p1)

                            Wait(125)

                            Teleport.OldCoords.p1 = nil

                            DiscordLog('players', GetPlayerName(_source)..' Used Bring Back on : '..GetPlayerName(_cock))

                        end

                    end

                elseif what == 'freeze' then

                    if checkESXPerms_S(source, 'PlayerList_Freeze') or AdminBypass_S() then

                        if p1 ~= nil then

                            TriggerClientEvent('cs-adminmenu:client', p1, 'freeze')

                            DiscordLog('players', GetPlayerName(_source)..' Used Freeze on : '..GetPlayerName(_cock))

                        end

                    end

                elseif what == 'unfreeze' then

                    if checkESXPerms_S(source, 'PlayerList_Freeze') or AdminBypass_S() then

                        if p1 ~= nil then

                            TriggerClientEvent('cs-adminmenu:client', p1, 'unfreeze')

                            DiscordLog('players', GetPlayerName(_source)..' Used Unfreeze on : '..GetPlayerName(_cock))

                        end

                    end

                elseif what == 'heal' then

                    if checkESXPerms_S(source, 'PlayerList_Heal') or AdminBypass_S() then

                        if p1 ~= nil then

                            TriggerClientEvent('cs-adminmenu:client', p1, 'heal')

                            DiscordLog('players', GetPlayerName(_source)..' Used Heal on : '..GetPlayerName(_cock))

                        end

                    end

                elseif what == 'addAccountMoney' then

                    if checkESXPerms_S(source, 'PlayerList_GiveAccountMoney') or AdminBypass_S() then

                        if p1 ~= nil and p2 == 'money' or p2 == 'bank' or p2 == 'black_money' then

                            local xTarget = ESX.GetPlayerFromId(p1)

                            xTarget.addAccountMoney(p2, tonumber(p3))

                            DiscordLog('players', GetPlayerName(_source)..' Add Account Money : '..p2.. ' '..p3..'$  on : '..GetPlayerName(_cock))

                        end

                    end

                elseif what == 'skinmenu' then

                    if checkESXPerms_S(source, 'PlayerList_ResetSkin') or AdminBypass_S() then

                        TriggerClientEvent(CS.skinMenuTrigger, p1)

                        DiscordLog('players', GetPlayerName(_source)..' Used Open Skin Menu on : '..GetPlayerName(_cock))

                    end

                elseif what == 'setjob' then

                    if checkESXPerms_S(source, 'PlayerList_SetJob') or AdminBypass_S() then

                        if p1 ~= nil then

                            if ESX.DoesJobExist(p2, p3) then

                                local xTarget = ESX.GetPlayerFromId(p1)

                                xTarget.setJob(p2, p3)

                                DiscordLog('players', GetPlayerName(_source)..' Set Job : '..p2.. ' '..p3..'  on : '..GetPlayerName(_cock))

                            end

                        end

                    end

                elseif what == 'kick' then

                    if checkESXPerms_S(source, 'PlayerList_Kick') or AdminBypass_S() then

                        if p1 ~= nil then

                            local xPlayer = ESX.GetPlayerFromId(source)

                            local xTarget = ESX.GetPlayerFromId(p1)

                            DiscordLog('players', GetPlayerName(_source)..' Kicked : '..GetPlayerName(_cock).. ' Reason : '..p2)

                            kick_reason = p2..' Kicked by : '..GetPlayerName(_source)..' ['..string.upper(xPlayer.getGroup())..']'

                            Wait(500)

                            xTarget.kick(kick_reason)

                        end

                    end

                elseif what == 'ban' then

                    if checkESXPerms_S(source, 'PlayerList_Ban') or AdminBypass_S() then

                        if p1 ~= nil then

                            local xPlayer = ESX.GetPlayerFromId(source)

                            local xTarget = ESX.GetPlayerFromId(p1)

                            DiscordLog('players', GetPlayerName(_source)..' Banned : '..GetPlayerName(_cock).. ' Reason : '..p2)

                            ban_reason = p2..' Banned by : '..GetPlayerName(_source)..' ['..string.upper(xPlayer.getGroup())..']'

                            Wait(500)

                            TriggerEvent(CS.EasyAdminBanTrigger, p1, ban_reason, false)

                        end

                    end

                elseif what == 'ban' then

                    if checkESXPerms_S(source, 'PlayerList_Ban') or AdminBypass_S() then

                        if p1 ~= nil then

                            local xPlayer = ESX.GetPlayerFromId(source)

                            local xTarget = ESX.GetPlayerFromId(p1)

                            DiscordLog('players', GetPlayerName(_source)..' Banned : '..GetPlayerName(_cock).. ' Reason : '..p2)

                            ban_reason = p2..' Banned by : '..GetPlayerName(_source)..' ['..string.upper(xPlayer.getGroup())..']'

                            Wait(500)

                            TriggerEvent(CS.EasyAdminBanTrigger, p1, ban_reason, false)

                        end

                    end

                --Update v1.1

                elseif what == 'setAccountMoney' then

                    if checkESXPerms_S(source, 'PlayerList_SetAccountMoney') or AdminBypass_S() then

                        if p1 ~= nil and p2 == 'money' or p2 == 'bank' or p2 == 'black_money' then

                            local xTarget = ESX.GetPlayerFromId(p1)

                            if xTarget.getAccount(p2) ~= nil then

                                xTarget.setAccountMoney(p2, tonumber(p3))

                                DiscordLog('players', GetPlayerName(_source)..' Set Account Money : '..p2.. ' '..p3..'$  on : '..GetPlayerName(_cock))

                            end

                        end

                    end

                end

            end

        end)

        

        RegisterNetEvent('cs-adminmenu:managment', function(which, p1, p2, p3)

            local playerId = source

            if which ~= nil and p1 ~= nil and p2 ~= nil then

                if which == 'money' then

                    if checkESXPerms_S(playerId, 'GiveMoney') then

                        local xPlayer = ESX.GetPlayerFromId(playerId)

                        if tonumber(p2) > 0 then

                            xPlayer.addMoney(tonumber(p2), GetCurrentResourceName())

                            DiscordLog('oth', GetPlayerName(playerId)..' Used Give Money : '..p2..' ['..p1..']')

                        end

                    end

                elseif which == 'item' then

                    if checkESXPerms_S(playerId, 'GiveItem') then

                        local xPlayer = ESX.GetPlayerFromId(playerId)

                        if tostring(p2) ~= '' and tonumber(p3) > 0 then

                            local item = xPlayer.getInventoryItem(tostring(p2))

                            if item ~= nil then

                                xPlayer.addInventoryItem(tostring(p2), tonumber(p3))

                            end

                        else

                            return

                        end

                        DiscordLog('oth', GetPlayerName(playerId)..' Used Give Item : '..p2..' '..p3..'x'..' ['..p1..']')

                    end

                elseif which == 'weapon' then

                    if checkESXPerms_S(playerId, 'GiveWeapon') then

                        local xPlayer = ESX.GetPlayerFromId(playerId)

                        xPlayer.addWeapon(p2, 250)

                        DiscordLog('oth', GetPlayerName(playerId)..' Used Give Weapon : '..p2..' ['..p1..']')

                    end

                end

            end

        end)

        

        RegisterNetEvent('cs-adminmenu:usedFeature', function(which, p1, p2, p3)

            if which == 'godmode_on' then

                DiscordLog('self', GetPlayerName(source)..' enabled GodMode!')

            elseif which == 'godmode_off' then

                DiscordLog('self', GetPlayerName(source)..' disabled GodMode!')

            elseif which == 'nametags_on' then

                DiscordLog('self', GetPlayerName(source)..' enabled Nametags!')

            elseif which == 'nametags_off' then

                DiscordLog('self', GetPlayerName(source)..' disabled Nametags!')

            elseif which == 'self_healall' then

                DiscordLog('self', GetPlayerName(source)..' used Heal!')

            elseif which == 'duty_in' then

                DiscordLog('self', GetPlayerName(source)..' in Duty')

            elseif which == 'duty_out' then

                DiscordLog('self', GetPlayerName(source)..' out Duty')

            elseif which == 'spawned_car' then

                if p1 ~= nil and p2 ~= nil then

                    DiscordLog('car', GetPlayerName(source)..' Spawned : '..p1..' | '..p2)

                end

            elseif which == 'fixxed_car' then

                if p1 ~= nil then

                    DiscordLog('car', GetPlayerName(source)..' Fixxed Car : '..p1)

                end

            elseif which == 'deleted_car' then

                if p1 ~= nil then

                    DiscordLog('car', GetPlayerName(source)..' Deleted Car : '..p1)

                end

            elseif which == 'goto' then

                DiscordLog('players', GetPlayerName(source)..' used Go To : '..GetPlayerName(p1))

            elseif which == 'goback' then

                DiscordLog('players', GetPlayerName(source)..' used Go Back')

            elseif which == 'start_spec' then

                DiscordLog('players', GetPlayerName(source)..' started Spectating : '..GetPlayerName(p1))

            elseif which == 'stopped_spec' then

                DiscordLog('players', GetPlayerName(source)..' stopped Spectating : '..GetPlayerName(p1))

            --Update v1.1

            elseif which == 'guide_in' then

                DiscordLog('self', GetPlayerName(source)..' go to Spawn')

            elseif which == 'guide_out' then

                DiscordLog('self', GetPlayerName(source)..' go out of Spawn')

            --Update v1.2

            elseif which == 'ticket_create' then 

                DiscordLog('ticket', GetPlayerName(source)..' Create Ticket : '..p1)

            elseif which == 'ticket_delete' then 

                DiscordLog('ticket', GetPlayerName(source)..' Deleted Ticket : '..p1)

            elseif which == 'ticket_deleteall' then 

                DiscordLog('ticket', GetPlayerName(source)..' Deleted All Tickets')

            end

        end)

        

        function DiscordLog(which, message)

            local webhook

            if which == 'self' then

                webhook = Webhooks.SelfHook

                local connect = {

                    {

                        ['color'] = 0,

                        ['title'] = '**'.. 'Admin Log' ..'**',

                        ['description'] = message,

                        ['footer'] = {

                            ['text'] = '[Self Action]', 

                        },

                    }

                }

            PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = 'Admin-Menu', embeds = connect, avatar_url = Webhooks.ProfilePicture}), { ['Content-Type'] = 'application/json' })

            elseif which == 'car' then

                webhook = Webhooks.CarHook

                local connect = {

                    {

                        ['color'] = 0,

                        ['title'] = '**'.. 'Admin Log' ..'**',

                        ['description'] = message,

                        ['footer'] = {

                            ['text'] = '[Car Action]', 

                        },

                    }

                }

            PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = 'Admin-Menu', embeds = connect, avatar_url = Webhooks.ProfilePicture}), { ['Content-Type'] = 'application/json' })

            elseif which == 'oth' then

                webhook = Webhooks.ManagmentHook

                local connect = {

                    {

                        ['color'] = 0,

                        ['title'] = '**'.. 'Admin Log' ..'**',

                        ['description'] = message,

                        ['footer'] = {

                            ['text'] = '[Server Action]', 

                        },

                    }

                }

            PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = 'Admin-Menu', embeds = connect, avatar_url = Webhooks.ProfilePicture}), { ['Content-Type'] = 'application/json' })

            elseif which == 'players' then

                webhook = Webhooks.PlayersHook

                local connect = {

                    {

                        ['color'] = 0,

                        ['title'] = '**'.. 'Admin Log' ..'**',

                        ['description'] = message,

                        ['footer'] = {

                            ['text'] = '[Player Action]', 

                        },

                    }

                }

            PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = 'Admin-Menu', embeds = connect, avatar_url = Webhooks.ProfilePicture}), { ['Content-Type'] = 'application/json' })

        elseif which == 'ticket' then

            webhook = Webhooks.TicketHook

            local connect = {

                {

                    ['color'] = 0,

                    ['title'] = '**'.. 'Admin Log' ..'**',

                    ['description'] = message,

                    ['footer'] = {

                        ['text'] = '[Ticket Action]', 

                    },

                }

            }

        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = 'Admin-Menu', embeds = connect, avatar_url = Webhooks.ProfilePicture}), { ['Content-Type'] = 'application/json' })

            end

        end

        

        --Update v1.2

        local installed_1_2 = false

        if CS.UseNotify ~= nil and Webhooks.TicketHook ~= nil then

            local OpenTickets = {}

            Citizen.CreateThread(function()

                while true do

                    Citizen.Wait(300000)

                    OpenTickets = {}

                end

            end)

            installed_1_2 = true

            if CS.ClearTicketsOnRestart then

                --MySQL.ready(function()

                    Citizen.CreateThread(function()

                        Citizen.Wait(10000)

                        MySQL.Sync.execute('DELETE FROM cs_admin_tickets', {})

                    end)

                --end)

            end

            RegisterNetEvent('cs-admin:writeTicket', function(content)

                if string.find(tostring(content), 'DROP') or string.find(tostring(content), 'UPDATE') or string.find(tostring(content), 'SET') then

                    DropPlayer(source, 'Stop it Skid. Like do you think fucking SQL Injection would work...')

                end

                if source ~= nil and content ~= nil then

                    if OpenTickets[source] == nil then

                        OpenTickets[source] = 'SuckCockCheaterFaggot'

                        local xPlayer = ESX.GetPlayerFromId(source)

                        local time = os.date('%d.%m %H:%M')

                        if CS.DataBaseType == 'oxMySQL' then

                            MySQL.Async.insert('INSERT INTO cs_admin_tickets (ticketOwner, ticketContent, createTime) VALUES (@owner, @content, @created)', {

                                ['@owner'] = GetPlayerName(source),

                                ['@content'] = tostring(content),

                                ['@created'] = time

                            }, function(rowsChanged)

                            end)

                        else

                            MySQL.Async.execute('INSERT INTO cs_admin_tickets (ticketOwner, ticketContent, createTime) VALUES (@owner, @content, @created)', {

                                ['@owner'] = GetPlayerName(source),

                                ['@content'] = tostring(content),

                                ['@created'] = time

                            }, function(rowsChanged)

                            end)

                        end

                    end

                end

            end)

            RegisterNetEvent('cs-admin:deleteTicket', function(ticketID)

                if source ~= nil and ticketID ~= nil then

                    if checkESXPerms_S(source, 'Tickets') or AdminBypass_S() then

                        if ticketID == 'all' then

                            MySQL.Async.execute('DELETE FROM cs_admin_tickets', {

                            }, function(rowsChanged)

                            end)

                        else

                            MySQL.Async.execute('DELETE FROM cs_admin_tickets WHERE ticketID = @ticketID', {

                                ['@ticketID'] = ticketID

                            }, function(rowsChanged)

                            end)

                        end

                    end

                end

            end)

            ESX.RegisterServerCallback('cs-admin:getTickets', function(source, cb)

                if source ~= nil then

                    if checkESXPerms_S(source, 'Tickets') or AdminBypass_S() then

                        MySQL.Async.fetchAll('SELECT * FROM cs_admin_tickets', {

                        }, function(result)

                            if result ~= nil then

                                cb(result)

                            end

                        end)

                    end

                end

            end)

        else

            installed_1_2 = false

            print('[ADMIN-MENU] ERROR Update v1.2 Missing!')

        end

        

        function AdminBypass_S()

            local xPlayer = ESX.GetPlayerFromId(source)

            local group = xPlayer.getGroup()

            for _, access_group in pairs(CS.Perms.AdminBypass) do

                if group == access_group then

                    return true 

                end

            end

        end

        function checkESXPerms_S(source, which)

            local xPlayer = ESX.GetPlayerFromId(source)

            local group = xPlayer.getGroup()

            if which == 'GiveMoney' then

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


---leaked by o2



                --Update v1.1

            elseif which == 'PlayerList_SetAccountMoney' then

                if CS.Perms.PlayerList.SetAccountMoney ~= nil then

                    for _, access_group in pairs(CS.Perms.PlayerList.SetAccountMoney) do

                        if group == access_group then

                            return true

                        end

                    end

                else

                    print('[ADMIN-MENU] ERROR Update v1.1 Missing!')

                end

                --Update v1.2

            elseif which == 'Tickets' then

                if CS.Perms.Tickets ~= nil then

                    for _, access_group in pairs(CS.Perms.Tickets) do

                        if group == access_group then

                            return true

                        end

                    end

                else

                    print('[ADMIN-MENU] ERROR Update v1.2 Missing!')

                end

                --Update v1.3

            elseif which == 'PlayerList_Screen' then

                if CS.Perms.PlayerList.ScreenShot ~= nil then

                    for _, access_group in pairs(CS.Perms.PlayerList.ScreenShot) do

                        if group == access_group then

                            return true

                        end

                    end

                else

                    print('[ADMIN-MENU] ERROR Update v1.3 Missing!')

                end

            end

        end

        

        RegisterCommand('extended', function(source, args)

            for _, data in pairs(ESX.GetPlayerAccounts(GetPlayerJob)) do

                print(_, data)

            end

            if ESX.GetGroup(source) ~= 'user' then

                print('Admin Men here tak tak', ESX.GetGroup(source))

            else

                print('Average Faggot here Men', ESX.GetGroup(source))

            end

        end)