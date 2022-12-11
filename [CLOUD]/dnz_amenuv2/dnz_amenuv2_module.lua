ESX = nil
Lang = function(a)
    local b = Config.Language[Config.Lang]
    if b and b[a] then
        return b[a]
    end
    return a
end
local b = Config.Lang
TriggerEvent(
    "" .. dnz_system.getSharedObject .. "",
    function(c)
        ESX = c
    end
)
RegisterServerEvent("rev")
AddEventHandler(
    "rev",
    function()
        TriggerClientEvent(Config.ReviveTrigger, source)
    end
)
RegisterServerEvent("rev2")
AddEventHandler(
    "rev2",
    function(d)
        TriggerClientEvent(Config.ReviveTrigger, d)
    end
)
RegisterServerEvent("notifyrevive1")
AddEventHandler(
    "notifyrevive1",
    function(d, e)
        TriggerClientEvent("notifyrevive3", d, e)
    end
)
RegisterServerEvent("notifyrevive2")
AddEventHandler(
    "notifyrevive2",
    function(d)
        local xPlayer = ESX.GetPlayerFromId(d)
        local e = xPlayer.getName()
        TriggerClientEvent("notifyrevive4", source, e)
    end
)
RegisterServerEvent("warnnotify1")
AddEventHandler(
    "warnnotify1",
    function(d, e, f)
        TriggerClientEvent("warnnotify3", d, e, f)
    end
)
RegisterServerEvent("warnnotify2")
AddEventHandler(
    "warnnotify2",
    function(d, f)
        local xPlayer = ESX.GetPlayerFromId(d)
        local e = xPlayer.getName()
        TriggerClientEvent("warnnotify4", source, e, f)
    end
)
RegisterServerEvent("bannotify")
AddEventHandler(
    "bannotify",
    function(d, f)
        local xPlayer = ESX.GetPlayerFromId(d)
        local e = ""
        if xPlayer ~= nil then
            e = xPlayer.getName()
        end
        TriggerClientEvent("bannotify2", source, e, f)
    end
)
RegisterServerEvent("kicknotify")
AddEventHandler(
    "kicknotify",
    function(d, f)
        local xPlayer = ESX.GetPlayerFromId(d)
        local e = xPlayer.getName()
        TriggerClientEvent("kicknotify2", source, e, f)
    end
)
RegisterServerEvent("revall")
AddEventHandler(
    "revall",
    function()
        for g, h in ipairs(GetPlayers()) do
            TriggerClientEvent(Config.ReviveTrigger, h)
        end
    end
)
RegisterServerEvent("freeze")
AddEventHandler(
    "freeze",
    function(j)
        TriggerClientEvent("freezeplayer", j)
    end
)
RegisterServerEvent("healall")
AddEventHandler(
    "healall",
    function()
        for g, h in ipairs(GetPlayers()) do
            TriggerClientEvent("heal", h)
        end
    end
)
RegisterServerEvent("cleanareaveh")
AddEventHandler(
    "cleanareaveh",
    function()
        for g, h in ipairs(GetPlayers()) do
            TriggerClientEvent("cleanareavehy", h)
        end
    end
)
RegisterServerEvent("cleanareapeds")
AddEventHandler(
    "cleanareapeds",
    function()
        for g, h in ipairs(GetPlayers()) do
            TriggerClientEvent("cleanareapedsy", h)
        end
    end
)
RegisterServerEvent("cleanareaentity")
AddEventHandler(
    "cleanareaentity",
    function()
        for g, h in ipairs(GetPlayers()) do
            TriggerClientEvent("cleanareaentityy", h)
        end
    end
)
RegisterNetEvent("goto")
AddEventHandler(
    "goto",
    function(d)
        local k = ESX.GetPlayerFromId(d)
        local xPlayer = ESX.GetPlayerFromId(source)
        if k ~= nil then
            local l = k.getCoords().x
            local m = k.getCoords().y
            local n = k.getCoords().z
            TriggerClientEvent("tptocoordsgoto", source, l, m, n)
        end
    end
)
RegisterServerEvent("giveitem")
AddEventHandler(
    "giveitem",
    function(o, e)
        xPlayer = ESX.GetPlayerFromId(source)
        if Config.Permissions.giveitem ~= nil then
            for p, q in pairs(Config.Permissions.giveitem) do
                if xPlayer ~= nil then
                    if o ~= nil then
                        if e ~= nil then
                            if xPlayer.getGroup() == q then
                                xPlayer.addInventoryItem(e, o)
                                return true
                            end
                        end
                    end
                end
            end
            Ban("System", source, "permanent", "Tryed to Trigger Giveitem Event.", "PERMANENT")
            return false
        end
    end
)
RegisterNetEvent("giveallweapons")
AddEventHandler(
    "giveallweapons",
    function(e)
        xPlayer = ESX.GetPlayerFromId(source)
        if Config.Permissions.allweapons ~= nil then
            for p, q in pairs(Config.Permissions.allweapons) do
                if xPlayer.getGroup() == q then
                    xPlayer.addWeapon(e, 100)
                    return true
                end
            end
            Ban("System", source, "permanent", "Tryed to Trigger Giveallweapons Event.", "PERMANENT")
            return false
        end
    end
)
RegisterServerEvent("giveweapon")
AddEventHandler(
    "giveweapon",
    function(o, e)
        xPlayer = ESX.GetPlayerFromId(source)
        if Config.Permissions.giveweapon ~= nil then
            for p, q in pairs(Config.Permissions.giveweapon) do
                if xPlayer.getGroup() == q then
                    xPlayer.addWeapon(e, o)
                    return true
                end
            end
            Ban("System", source, "permanent", "Tryed to Trigger Giveweapon Event.", "PERMANENT")
            return false
        end
    end
)
RegisterServerEvent("givemoney")
AddEventHandler(
    "givemoney",
    function(o)
        xPlayer = ESX.GetPlayerFromId(source)
        if Config.Permissions.givemoney ~= nil then
            for p, q in pairs(Config.Permissions.givemoney) do
                if xPlayer.getGroup() == q then
                    xPlayer.addMoney(o)
                    return true
                end
            end
            Ban("System", source, "permanent", "Tryed to Trigger Givemoney Event.", "PERMANENT")
            return false
        end
    end
)
RegisterServerEvent("givemoneybank")
AddEventHandler(
    "givemoneybank",
    function(o)
        local xPlayer = ESX.GetPlayerFromId(source)
        if Config.Permissions.givemoney ~= nil then
            for p, q in pairs(Config.Permissions.givemoney) do
                if xPlayer.getGroup() == q then
                    xPlayer.addAccountMoney("bank", o)
                    return true
                end
            end
            Ban("System", source, "permanent", "Tryed to Trigger Givemoney Event.", "PERMANENT")
            return false
        end
    end
)
RegisterServerEvent("givemoneyblack")
AddEventHandler(
    "givemoneyblack",
    function(o)
        xPlayer = ESX.GetPlayerFromId(source)
        if Config.Permissions.givemoney ~= nil then
            for p, q in pairs(Config.Permissions.givemoney) do
                if xPlayer.getGroup() == q then
                    xPlayer.addAccountMoney("black_money", o)
                    return true
                end
            end
            Ban("System", source, "permanent", "Tryed to Trigger Givemoney Event.", "PERMANENT")
            return false
        end
    end
)
RegisterServerEvent("networkingobjets")
AddEventHandler(
    "networkingobjets",
    function()
        for g, h in ipairs(GetPlayers()) do
            TriggerClientEvent("networkingobjetos2", h)
        end
    end
)
RegisterServerEvent("getinfoplayers")
AddEventHandler(
    "getinfoplayers",
    function()
        local r = source
        local s = {}
        for g, h in ipairs(GetPlayers()) do
            table.insert(s, {name = GetPlayerName(h), serverid = h})
        end
        table.sort(
            s,
            function(t, u)
                return t.serverid < u.serverid
            end
        )
        TriggerClientEvent("getinfoplayers", r, s)
    end
)
function SecondsToClock(v)
    local w = math.floor(v / 86400)
    v = v - w * 86400
    local x = math.floor(v / 3600)
    v = v - x * 3600
    local y = math.floor(v / 60)
    v = v - y * 60
    return string.format("%d days, %d hours, %d minutes, %d seconds.", w, x, y, v)
end
RegisterServerEvent("getplayerinfo")
AddEventHandler(
    "getplayerinfo",
    function(z)
        local r = source
        local xPlayer = ESX.GetPlayerFromId(z)
        local A = "STEAM ID NOT FOUND"
        local license = "LICENSE NOT FOUND"
        local discord = "DISCORD NOT FOUND"
        local B = false
        local liveid = false
        local C = false
        local j = {}
        local D = {}
        for p, q in pairs(GetPlayerIdentifiers(z)) do
            if string.sub(q, 1, string.len("steam:")) == "steam:" then
                A = q
            elseif string.sub(q, 1, string.len("license:")) == "license:" then
                license = q
            elseif string.sub(q, 1, string.len("ip:")) == "ip:" then
                C = q
            elseif string.sub(q, 1, string.len("discord:")) == "discord:" then
                discord = q
            elseif string.sub(q, 1, string.len("live:")) == "live:" then
                liveid = q
            end
        end
        local E = LoadResourceFile(GetCurrentResourceName(), "jsons/warns.json")
        local F = LoadResourceFile(GetCurrentResourceName(), "jsons/bans.json")
        local G = json.decode(E)
        local H = 0
        if type(E) == "string" then
            for p, q in pairs(G) do
                local I = q.steam
                if I == A then
                    table.insert(D, {warner = q.warner, reason = q.reason, time = q.time})
                    H = H + 1
                end
            end
        end
        j.steam = A
        j.license = license
        j.ip = C
        j.discord = discord
        j.name = GetPlayerName(z)
        if xPlayer ~= nil then
            if xPlayer.getGroup() ~= "user" then
                j.isadmin = "YES (" .. xPlayer.getGroup() .. ")"
            else
                j.isadmin = "NO (" .. xPlayer.getGroup() .. ")"
            end
        else
            j.isadmin = "NOT FOUND"
        end
        j.warnamount = H
        j.warns = json.encode(D)
        j.bans = F
        j.serverid = z
        TriggerClientEvent("cbplayerinfo", r, j)
    end
)
RegisterServerEvent("requestspec")
AddEventHandler(
    "requestspec",
    function(h)
        local J = ESX.GetPlayerFromId(h)
        local xPlayer = ESX.GetPlayerFromId(source)
        for p, q in pairs(Config.Permissions.spectate) do
            if xPlayer.getGroup() == q then
                local K = xPlayer.getCoords()
                local L = J.getCoords()
                TriggerClientEvent("teleport3", source, L)
                TriggerClientEvent("spec", source, J.source)
                TriggerClientEvent("teleport2", source, K)
                return true
            end
        end
        Ban("System", source, "permanent", "Tryed to Trigger Spectate Event.", "PERMANENT")
        return false
    end
)
RegisterServerEvent("getplayerinfo23")
AddEventHandler(
    "getplayerinfo23",
    function()
        local j = {}
        local F = LoadResourceFile(GetCurrentResourceName(), "jsons/bans.json")
        j.bans = F
        TriggerClientEvent("cbplayerinfo2", source, j)
    end
)
function removebyKey(M, N)
    for i, q in ipairs(M) do
        if q.id == N then
            return i
        end
    end
end
RegisterNetEvent("gotfreezednotify")
AddEventHandler(
    "gotfreezednotify",
    function(d, e)
        TriggerClientEvent("gotfreezed", d, e)
    end
)
RegisterNetEvent("gotfreezednotify2")
AddEventHandler(
    "gotfreezednotify2",
    function(d)
        local xPlayer = ESX.GetPlayerFromId(d)
        local e = xPlayer.getName()
        TriggerClientEvent("gotfreezed2", source, e)
    end
)
ESX.RegisterServerCallback(
    "dnz_amenuv2:getCurrentInfo",
    function(source, O)
        info = {}
        info.admin = false, info.username, info.money, info.bankmoney, info.job, info.admingroup
        local P = ESX.GetPlayerFromId(source)
        info.admingroup = P.getGroup()
        local Q = ESX.GetPlayers()
        local R = ESX.GetPlayerFromId(source)
        for i = 1, #Q, 1 do
            local xPlayer = ESX.GetPlayerFromId(Q[i])
            info.username = P.getName()
            if xPlayer.getGroup() ~= "user" then
                info.admin = true
            else
                info.admin = false
            end
            info.money = xPlayer.getMoney()
            info.bankmoney = xPlayer.getAccount("bank").money
            info.myjob = xPlayer.job.name .. " " .. xPlayer.job.grade_label
            info.user = ESX.GetPlayerFromId(source)
        end
        O(info)
    end
)
RegisterNetEvent("kick")
AddEventHandler(
    "kick",
    function(I, f, S)
        local T = ESX.GetPlayerFromId(source)
        local xPlayer = ESX.GetPlayerFromId(I)
        if Config.Permissions.kick ~= nil then
            for p, q in pairs(Config.Permissions.kick) do
                if T.getGroup() == q then
                    xPlayer.kick(f)
                    if dnz_system.debug then
                        printinfo(
                            "^5[Info] ^3[Debug] ^4" ..
                                T.getName() .. " ^0kicked ^4" .. xPlayer.getName() .. "^0 Reason: ^4" .. S .. "^0"
                        )
                    end
                    return true
                end
            end
            Ban("System", source, "permanent", "Tryed to Trigger Kick Event.", "PERMANENT")
            return false
        end
    end
)
RegisterNetEvent("kickall")
AddEventHandler(
    "kickall",
    function(f)
        local T = ESX.GetPlayerFromId(source)
        if Config.Permissions.kickall ~= nil then
            for p, q in pairs(Config.Permissions.kickall) do
                if T.getGroup() == q then
                    local Q = ESX.GetPlayers()
                    for i = 1, #Q, 1 do
                        local xPlayer = ESX.GetPlayerFromId(Q[i])
                        xPlayer.kick(f)
                    end
                    return true
                end
            end
            Ban("System", source, "permanent", "Tryed to Trigger Kick All Event.", "PERMANENT")
            return false
        end
    end
)
RegisterNetEvent("logallweapons")
AddEventHandler(
    "logallweapons",
    function()
        local e = GetPlayerName(source)
        local r = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local U = r
        local V = {
            steam = "Not found",
            ip = "Not found",
            discord = "Not found",
            license = "Not found",
            xbl = "Not found",
            live = "Not found"
        }
        for i = 0, GetNumPlayerIdentifiers(r) - 1 do
            local I = GetPlayerIdentifier(r, i)
            if string.find(I, "steam") then
                V.steam = I
            elseif string.find(I, "ip") then
                V.ip = I
            elseif string.find(I, "discord") then
                V.discord = I
            elseif string.find(I, "license") then
                V.license = I
            elseif string.find(I, "xbl") then
                V.xbl = I
            elseif string.find(I, "live") then
                V.live = I
            end
        end
        if b == "de" then
            discordlogs(
                " | Give-Log",
                dnz_system.webhook.webhooks.givelog,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] hat sich alle Waffen gegeben.```\n Identifiers:```\nGroup: " ..
                                    xPlayer.getGroup() ..
                                        "\nSteam: " ..
                                            V.steam ..
                                                "\nDiscord: " ..
                                                    V.discord .. "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        else
            discordlogs(
                " | Give-Log",
                dnz_system.webhook.webhooks.givelog,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] gave himself all weapons.```\n Identifiers:```\nGroup: " ..
                                    xPlayer.getGroup() ..
                                        "\nSteam: " ..
                                            V.steam ..
                                                "\nDiscord: " ..
                                                    V.discord .. "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        end
        if dnz_system.debug then
            if dnz_system.webhook.webhooks.givelog == "" then
                printinfo("8[Error] ^3[Debug] ^0Givelog Webhook not found^0")
            else
                printinfo(
                    "2[Success] ^3[Debug] ^0Givelog Webhook Send to ^5" .. dnz_system.webhook.webhooks.givelog .. "^0"
                )
            end
            return
        end
    end
)
RegisterNetEvent("loggiveitem")
AddEventHandler(
    "loggiveitem",
    function(W, X)
        local e = GetPlayerName(source)
        local r = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local U = r
        local V = {
            steam = "Not found",
            ip = "Not found",
            discord = "Not found",
            license = "Not found",
            xbl = "Not found",
            live = "Not found"
        }
        for i = 0, GetNumPlayerIdentifiers(r) - 1 do
            local I = GetPlayerIdentifier(r, i)
            if string.find(I, "steam") then
                V.steam = I
            elseif string.find(I, "ip") then
                V.ip = I
            elseif string.find(I, "discord") then
                V.discord = I
            elseif string.find(I, "license") then
                V.license = I
            elseif string.find(I, "xbl") then
                V.xbl = I
            elseif string.find(I, "live") then
                V.live = I
            end
        end
        if b == "de" then
            discordlogs(
                " | Give-Log",
                dnz_system.webhook.webhooks.givelog,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] hat sich " ..
                                    W ..
                                        "x " ..
                                            X ..
                                                " gegeben.```\n Identifiers:```\nGroup: " ..
                                                    xPlayer.getGroup() ..
                                                        "\nSteam: " ..
                                                            V.steam ..
                                                                "\nDiscord: " ..
                                                                    V.discord ..
                                                                        "\nLizenz: " ..
                                                                            V.license .. "\nIP: " .. V.ip .. "```"
            )
        else
            discordlogs(
                " | Give-Log",
                dnz_system.webhook.webhooks.givelog,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] gave himself " ..
                                    W ..
                                        "x " ..
                                            X ..
                                                "```\n Identifiers:```\nGroup: " ..
                                                    xPlayer.getGroup() ..
                                                        "\nSteam: " ..
                                                            V.steam ..
                                                                "\nDiscord: " ..
                                                                    V.discord ..
                                                                        "\nLizenz: " ..
                                                                            V.license .. "\nIP: " .. V.ip .. "```"
            )
        end
        if dnz_system.debug then
            if dnz_system.webhook.webhooks.givelog == "" then
                printinfo("8[Error] ^3[Debug] ^0Givelog Webhook not found^0")
            else
                printinfo(
                    "2[Success] ^3[Debug] ^0Givelog Webhook Send to ^5" .. dnz_system.webhook.webhooks.givelog .. "^0"
                )
            end
            return
        end
    end
)
RegisterNetEvent("loggiveweapon")
AddEventHandler(
    "loggiveweapon",
    function(W, X)
        local e = GetPlayerName(source)
        local r = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local U = r
        local V = {
            steam = "Not found",
            ip = "Not found",
            discord = "Not found",
            license = "Not found",
            xbl = "Not found",
            live = "Not found"
        }
        for i = 0, GetNumPlayerIdentifiers(r) - 1 do
            local I = GetPlayerIdentifier(r, i)
            if string.find(I, "steam") then
                V.steam = I
            elseif string.find(I, "ip") then
                V.ip = I
            elseif string.find(I, "discord") then
                V.discord = I
            elseif string.find(I, "license") then
                V.license = I
            elseif string.find(I, "xbl") then
                V.xbl = I
            elseif string.find(I, "live") then
                V.live = I
            end
        end
        if b == "de" then
            discordlogs(
                " | Give-Log",
                dnz_system.webhook.webhooks.givelog,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] hat sich " ..
                                    X ..
                                        " mit " ..
                                            W ..
                                                " Munition gegeben.```\n Identifiers:```\nGroup: " ..
                                                    xPlayer.getGroup() ..
                                                        "\nSteam: " ..
                                                            V.steam ..
                                                                "\nDiscord: " ..
                                                                    V.discord ..
                                                                        "\nLizenz: " ..
                                                                            V.license .. "\nIP: " .. V.ip .. "```"
            )
        else
            discordlogs(
                " | Give-Log",
                dnz_system.webhook.webhooks.givelog,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] gave himself " ..
                                    X ..
                                        " with " ..
                                            W ..
                                                " Ammo.```\n Identifiers:```\nGroup: " ..
                                                    xPlayer.getGroup() ..
                                                        "\nSteam: " ..
                                                            V.steam ..
                                                                "\nDiscord: " ..
                                                                    V.discord ..
                                                                        "\nLizenz: " ..
                                                                            V.license .. "\nIP: " .. V.ip .. "```"
            )
        end
        if dnz_system.debug then
            if dnz_system.webhook.webhooks.givelog == "" then
                printinfo("8[Error] ^3[Debug] ^0Givelog Webhook not found^0")
            else
                printinfo(
                    "2[Success] ^3[Debug] ^0Givelog Webhook Send to ^5" .. dnz_system.webhook.webhooks.givelog .. "^0"
                )
            end
            return
        end
    end
)
RegisterNetEvent("loggivemoney")
AddEventHandler(
    "loggivemoney",
    function(Y, Z)
        local e = GetPlayerName(source)
        local r = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local U = r
        local V = {
            steam = "Not found",
            ip = "Not found",
            discord = "Not found",
            license = "Not found",
            xbl = "Not found",
            live = "Not found"
        }
        for i = 0, GetNumPlayerIdentifiers(r) - 1 do
            local I = GetPlayerIdentifier(r, i)
            if string.find(I, "steam") then
                V.steam = I
            elseif string.find(I, "ip") then
                V.ip = I
            elseif string.find(I, "discord") then
                V.discord = I
            elseif string.find(I, "license") then
                V.license = I
            elseif string.find(I, "xbl") then
                V.xbl = I
            elseif string.find(I, "live") then
                V.live = I
            end
        end
        if b == "de" then
            discordlogs(
                " | Give-Log",
                dnz_system.webhook.webhooks.givelog,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] hat sich " ..
                                    Z ..
                                        " " ..
                                            Y ..
                                                " gegeben.```\n Identifiers:```\nGroup: " ..
                                                    xPlayer.getGroup() ..
                                                        "\nSteam: " ..
                                                            V.steam ..
                                                                "\nDiscord: " ..
                                                                    V.discord ..
                                                                        "\nLizenz: " ..
                                                                            V.license .. "\nIP: " .. V.ip .. "```"
            )
        else
            discordlogs(
                " | Give-Log",
                dnz_system.webhook.webhooks.givelog,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] gave himself " ..
                                    Z ..
                                        " " ..
                                            Y ..
                                                ".```\n Identifiers:```\nGroup: " ..
                                                    xPlayer.getGroup() ..
                                                        "\nSteam: " ..
                                                            V.steam ..
                                                                "\nDiscord: " ..
                                                                    V.discord ..
                                                                        "\nLizenz: " ..
                                                                            V.license .. "\nIP: " .. V.ip .. "```"
            )
        end
        if dnz_system.debug then
            if dnz_system.webhook.webhooks.givelog == "" then
                printinfo("8[Error] ^3[Debug] ^0Givelog Webhook not found^0")
            else
                printinfo(
                    "2[Success] ^3[Debug] ^0Givelog Webhook Send to ^5" .. dnz_system.webhook.webhooks.givelog .. "^0"
                )
            end
            return
        end
    end
)
RegisterNetEvent("logspawncar")
AddEventHandler(
    "logspawncar",
    function(_)
        local e = GetPlayerName(source)
        local r = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local U = r
        local V = {
            steam = "Not found",
            ip = "Not found",
            discord = "Not found",
            license = "Not found",
            xbl = "Not found",
            live = "Not found"
        }
        for i = 0, GetNumPlayerIdentifiers(r) - 1 do
            local I = GetPlayerIdentifier(r, i)
            if string.find(I, "steam") then
                V.steam = I
            elseif string.find(I, "ip") then
                V.ip = I
            elseif string.find(I, "discord") then
                V.discord = I
            elseif string.find(I, "license") then
                V.license = I
            elseif string.find(I, "xbl") then
                V.xbl = I
            elseif string.find(I, "live") then
                V.live = I
            end
        end
        if b == "de" then
            discordlogs(
                " | Car-Log",
                dnz_system.webhook.webhooks.carlogs,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] hat sich einen" ..
                                    _ ..
                                        " gespawnt.```\n Identifiers:```\nGroup: " ..
                                            xPlayer.getGroup() ..
                                                "\nSteam: " ..
                                                    V.steam ..
                                                        "\nDiscord: " ..
                                                            V.discord ..
                                                                "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        else
            discordlogs(
                " | Car-Log",
                dnz_system.webhook.webhooks.carlogs,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] spawned himself a " ..
                                    _ ..
                                        ".```\n Identifiers:```\nGroup: " ..
                                            xPlayer.getGroup() ..
                                                "\nSteam: " ..
                                                    V.steam ..
                                                        "\nDiscord: " ..
                                                            V.discord ..
                                                                "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        end
        if dnz_system.debug then
            if dnz_system.webhook.webhooks.carlogs == "" then
                printinfo("8[Error] ^3[Debug] ^0Carlog Webhook not found^0")
            else
                printinfo(
                    "2[Success] ^3[Debug] ^0Carlog Webhook Send to ^5" .. dnz_system.webhook.webhooks.carlogs .. "^0"
                )
            end
            return
        end
    end
)
RegisterNetEvent("logflip")
AddEventHandler(
    "logflip",
    function(_)
        local e = GetPlayerName(source)
        local r = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local U = r
        local V = {
            steam = "Not found",
            ip = "Not found",
            discord = "Not found",
            license = "Not found",
            xbl = "Not found",
            live = "Not found"
        }
        for i = 0, GetNumPlayerIdentifiers(r) - 1 do
            local I = GetPlayerIdentifier(r, i)
            if string.find(I, "steam") then
                V.steam = I
            elseif string.find(I, "ip") then
                V.ip = I
            elseif string.find(I, "discord") then
                V.discord = I
            elseif string.find(I, "license") then
                V.license = I
            elseif string.find(I, "xbl") then
                V.xbl = I
            elseif string.find(I, "live") then
                V.live = I
            end
        end
        if b == "de" then
            discordlogs(
                " | Car-Log",
                dnz_system.webhook.webhooks.carlogs,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] hat seinen " ..
                                    _ ..
                                        " gedreht.```\n Identifiers:```\nGroup: " ..
                                            xPlayer.getGroup() ..
                                                "\nSteam: " ..
                                                    V.steam ..
                                                        "\nDiscord: " ..
                                                            V.discord ..
                                                                "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        else
            discordlogs(
                " | Car-Log",
                dnz_system.webhook.webhooks.carlogs,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] flipped his " ..
                                    _ ..
                                        ".```\n Identifiers:```\nGroup: " ..
                                            xPlayer.getGroup() ..
                                                "\nSteam: " ..
                                                    V.steam ..
                                                        "\nDiscord: " ..
                                                            V.discord ..
                                                                "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        end
        if dnz_system.debug then
            if dnz_system.webhook.webhooks.carlogs == "" then
                printinfo("8[Error] ^3[Debug] ^0Carlog Webhook not found^0")
            else
                printinfo(
                    "2[Success] ^3[Debug] ^0Carlog Webhook Send to ^5" .. dnz_system.webhook.webhooks.carlogs .. "^0"
                )
            end
            return
        end
    end
)
RegisterNetEvent("logrepair")
AddEventHandler(
    "logrepair",
    function(_)
        local e = GetPlayerName(source)
        local r = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local U = r
        local V = {
            steam = "Not found",
            ip = "Not found",
            discord = "Not found",
            license = "Not found",
            xbl = "Not found",
            live = "Not found"
        }
        for i = 0, GetNumPlayerIdentifiers(r) - 1 do
            local I = GetPlayerIdentifier(r, i)
            if string.find(I, "steam") then
                V.steam = I
            elseif string.find(I, "ip") then
                V.ip = I
            elseif string.find(I, "discord") then
                V.discord = I
            elseif string.find(I, "license") then
                V.license = I
            elseif string.find(I, "xbl") then
                V.xbl = I
            elseif string.find(I, "live") then
                V.live = I
            end
        end
        if b == "de" then
            discordlogs(
                " | Car-Log",
                dnz_system.webhook.webhooks.carlogs,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] hat seinen " ..
                                    _ ..
                                        " repariert.```\n Identifiers:```\nGroup: " ..
                                            xPlayer.getGroup() ..
                                                "\nSteam: " ..
                                                    V.steam ..
                                                        "\nDiscord: " ..
                                                            V.discord ..
                                                                "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        else
            discordlogs(
                " | Car-Log",
                dnz_system.webhook.webhooks.carlogs,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] repaired his " ..
                                    _ ..
                                        ".```\n Identifiers:```\nGroup: " ..
                                            xPlayer.getGroup() ..
                                                "\nSteam: " ..
                                                    V.steam ..
                                                        "\nDiscord: " ..
                                                            V.discord ..
                                                                "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        end
        if dnz_system.debug then
            if dnz_system.webhook.webhooks.carlogs == "" then
                printinfo("8[Error] ^3[Debug] ^0Carlog Webhook not found^0")
            else
                printinfo(
                    "2[Success] ^3[Debug] ^0Carlog Webhook Send to ^5" .. dnz_system.webhook.webhooks.carlogs .. "^0"
                )
            end
            return
        end
    end
)
RegisterNetEvent("logdelete")
AddEventHandler(
    "logdelete",
    function(_)
        local e = GetPlayerName(source)
        local r = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local U = r
        local V = {
            steam = "Not found",
            ip = "Not found",
            discord = "Not found",
            license = "Not found",
            xbl = "Not found",
            live = "Not found"
        }
        for i = 0, GetNumPlayerIdentifiers(r) - 1 do
            local I = GetPlayerIdentifier(r, i)
            if string.find(I, "steam") then
                V.steam = I
            elseif string.find(I, "ip") then
                V.ip = I
            elseif string.find(I, "discord") then
                V.discord = I
            elseif string.find(I, "license") then
                V.license = I
            elseif string.find(I, "xbl") then
                V.xbl = I
            elseif string.find(I, "live") then
                V.live = I
            end
        end
        if b == "de" then
            discordlogs(
                " | Car-Log",
                dnz_system.webhook.webhooks.carlogs,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] hat ein Fahrzeug gelöscht.```\n Identifiers:```\nGroup: " ..
                                    xPlayer.getGroup() ..
                                        "\nSteam: " ..
                                            V.steam ..
                                                "\nDiscord: " ..
                                                    V.discord .. "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        else
            discordlogs(
                " | Car-Log",
                dnz_system.webhook.webhooks.carlogs,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] deleted a car.```\n Identifiers:```\nGroup: " ..
                                    xPlayer.getGroup() ..
                                        "\nSteam: " ..
                                            V.steam ..
                                                "\nDiscord: " ..
                                                    V.discord .. "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        end
        if dnz_system.debug then
            if dnz_system.webhook.webhooks.carlogs == "" then
                printinfo("8[Error] ^3[Debug] ^0Carlog Webhook not found^0")
            else
                printinfo(
                    "2[Success] ^3[Debug] ^0Carlog Webhook Send to ^5" .. dnz_system.webhook.webhooks.carlogs .. "^0"
                )
            end
            return
        end
    end
)
RegisterNetEvent("logfulltune")
AddEventHandler(
    "logfulltune",
    function(_)
        local e = GetPlayerName(source)
        local r = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local U = r
        local V = {
            steam = "Not found",
            ip = "Not found",
            discord = "Not found",
            license = "Not found",
            xbl = "Not found",
            live = "Not found"
        }
        for i = 0, GetNumPlayerIdentifiers(r) - 1 do
            local I = GetPlayerIdentifier(r, i)
            if string.find(I, "steam") then
                V.steam = I
            elseif string.find(I, "ip") then
                V.ip = I
            elseif string.find(I, "discord") then
                V.discord = I
            elseif string.find(I, "license") then
                V.license = I
            elseif string.find(I, "xbl") then
                V.xbl = I
            elseif string.find(I, "live") then
                V.live = I
            end
        end
        if b == "de" then
            discordlogs(
                " | Car-Log",
                dnz_system.webhook.webhooks.carlogs,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] hat sein " ..
                                    _ ..
                                        " fullgetuned.```\n Identifiers:```\nGroup: " ..
                                            xPlayer.getGroup() ..
                                                "\nSteam: " ..
                                                    V.steam ..
                                                        "\nDiscord: " ..
                                                            V.discord ..
                                                                "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        else
            discordlogs(
                " | Car-Log",
                dnz_system.webhook.webhooks.carlogs,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] fulltuned his " ..
                                    _ ..
                                        ".```\n Identifiers:```\nGroup: " ..
                                            xPlayer.getGroup() ..
                                                "\nSteam: " ..
                                                    V.steam ..
                                                        "\nDiscord: " ..
                                                            V.discord ..
                                                                "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        end
        if dnz_system.debug then
            if dnz_system.webhook.webhooks.carlogs == "" then
                printinfo("8[Error] ^3[Debug] ^0Carlog Webhook not found^0")
            else
                printinfo(
                    "2[Success] ^3[Debug] ^0Carlog Webhook Send to ^5" .. dnz_system.webhook.webhooks.carlogs .. "^0"
                )
            end
            return
        end
    end
)
RegisterNetEvent("lognotgodmodeveh")
AddEventHandler(
    "lognotgodmodeveh",
    function(_)
        local e = GetPlayerName(source)
        local r = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local U = r
        local V = {
            steam = "Not found",
            ip = "Not found",
            discord = "Not found",
            license = "Not found",
            xbl = "Not found",
            live = "Not found"
        }
        for i = 0, GetNumPlayerIdentifiers(r) - 1 do
            local I = GetPlayerIdentifier(r, i)
            if string.find(I, "steam") then
                V.steam = I
            elseif string.find(I, "ip") then
                V.ip = I
            elseif string.find(I, "discord") then
                V.discord = I
            elseif string.find(I, "license") then
                V.license = I
            elseif string.find(I, "xbl") then
                V.xbl = I
            elseif string.find(I, "live") then
                V.live = I
            end
        end
        if b == "de" then
            discordlogs(
                " | Car-Log",
                dnz_system.webhook.webhooks.carlogs,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] hat Godmode in einem " ..
                                    _ ..
                                        " deaktiviert.```\n Identifiers:```\nGroup: " ..
                                            xPlayer.getGroup() ..
                                                "\nSteam: " ..
                                                    V.steam ..
                                                        "\nDiscord: " ..
                                                            V.discord ..
                                                                "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        else
            discordlogs(
                " | Car-Log",
                dnz_system.webhook.webhooks.carlogs,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] has disabled godmode in a " ..
                                    _ ..
                                        ".```\n Identifiers:```\nGroup: " ..
                                            xPlayer.getGroup() ..
                                                "\nSteam: " ..
                                                    V.steam ..
                                                        "\nDiscord: " ..
                                                            V.discord ..
                                                                "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        end
        if dnz_system.debug then
            if dnz_system.webhook.webhooks.carlogs == "" then
                printinfo("8[Error] ^3[Debug] ^0Carlog Webhook not found^0")
            else
                printinfo(
                    "2[Success] ^3[Debug] ^0Carlog Webhook Send to ^5" .. dnz_system.webhook.webhooks.carlogs .. "^0"
                )
            end
            return
        end
    end
)
RegisterNetEvent("loggodmodeveh")
AddEventHandler(
    "loggodmodeveh",
    function(_)
        local e = GetPlayerName(source)
        local r = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local U = r
        local V = {
            steam = "Not found",
            ip = "Not found",
            discord = "Not found",
            license = "Not found",
            xbl = "Not found",
            live = "Not found"
        }
        for i = 0, GetNumPlayerIdentifiers(r) - 1 do
            local I = GetPlayerIdentifier(r, i)
            if string.find(I, "steam") then
                V.steam = I
            elseif string.find(I, "ip") then
                V.ip = I
            elseif string.find(I, "discord") then
                V.discord = I
            elseif string.find(I, "license") then
                V.license = I
            elseif string.find(I, "xbl") then
                V.xbl = I
            elseif string.find(I, "live") then
                V.live = I
            end
        end
        if b == "de" then
            discordlogs(
                " | Car-Log",
                dnz_system.webhook.webhooks.carlogs,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] hat Godmode in einem " ..
                                    _ ..
                                        " aktiviert.```\n Identifiers:```\nGroup: " ..
                                            xPlayer.getGroup() ..
                                                "\nSteam: " ..
                                                    V.steam ..
                                                        "\nDiscord: " ..
                                                            V.discord ..
                                                                "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        else
            discordlogs(
                " | Car-Log",
                dnz_system.webhook.webhooks.carlogs,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] has activated godmode in a " ..
                                    _ ..
                                        ".```\n Identifiers:```\nGroup: " ..
                                            xPlayer.getGroup() ..
                                                "\nSteam: " ..
                                                    V.steam ..
                                                        "\nDiscord: " ..
                                                            V.discord ..
                                                                "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        end
        if dnz_system.debug then
            if dnz_system.webhook.webhooks.carlogs == "" then
                printinfo("8[Error] ^3[Debug] ^0Carlog Webhook not found^0")
            else
                printinfo(
                    "2[Success] ^3[Debug] ^0Carlog Webhook Send to ^5" .. dnz_system.webhook.webhooks.carlogs .. "^0"
                )
            end
            return
        end
    end
)
RegisterNetEvent("logban")
AddEventHandler(
    "logban",
    function(a0, f, a1, I)
        local e = GetPlayerName(source)
        local _ = GetPlayerName(I)
        local r = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local U = r
        local V = {
            steam = "Not found",
            ip = "Not found",
            discord = "Not found",
            license = "Not found",
            xbl = "Not found",
            live = "Not found"
        }
        for i = 0, GetNumPlayerIdentifiers(r) - 1 do
            local I = GetPlayerIdentifier(r, i)
            if string.find(I, "steam") then
                V.steam = I
            elseif string.find(I, "ip") then
                V.ip = I
            elseif string.find(I, "discord") then
                V.discord = I
            elseif string.find(I, "license") then
                V.license = I
            elseif string.find(I, "xbl") then
                V.xbl = I
            elseif string.find(I, "live") then
                V.live = I
            end
        end
        if b == "de" then
            discordlogs(
                " | Ban-Log",
                dnz_system.webhook.webhooks.banlog,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] hat " ..
                                    _ ..
                                        "[" ..
                                            I ..
                                                ']  für "' ..
                                                    a0 ..
                                                        '"\nmit dem Grund: "' ..
                                                            f ..
                                                                '" gebannt.```\n Identifiers:```\nGroup: ' ..
                                                                    xPlayer.getGroup() ..
                                                                        "\nSteam: " ..
                                                                            V.steam ..
                                                                                "\nDiscord: " ..
                                                                                    V.discord ..
                                                                                        "\nLizenz: " ..
                                                                                            V.license ..
                                                                                                "\nIP: " ..
                                                                                                    V.ip .. "```"
            )
        else
            discordlogs(
                " | Ban-Log",
                dnz_system.webhook.webhooks.banlog,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] Banned " ..
                                    _ ..
                                        "[" ..
                                            I ..
                                                '] for "' ..
                                                    a0 ..
                                                        '"\nwith the reason: "' ..
                                                            f ..
                                                                '"```\n Identifiers:```\nGroup: ' ..
                                                                    xPlayer.getGroup() ..
                                                                        "\nSteam: " ..
                                                                            V.steam ..
                                                                                "\nDiscord: " ..
                                                                                    V.discord ..
                                                                                        "\nLizenz: " ..
                                                                                            V.license ..
                                                                                                "\nIP: " ..
                                                                                                    V.ip .. "```"
            )
        end
        if dnz_system.debug then
            if dnz_system.webhook.webhooks.banlog == "" then
                printinfo("8[Error] ^3[Debug] ^0Banlog Webhook not found^0")
            else
                printinfo(
                    "2[Success] ^3[Debug] ^0Banlog Webhook Send to ^5" .. dnz_system.webhook.webhooks.banlog .. "^0"
                )
            end
            return
        end
    end
)
RegisterNetEvent("logunban")
AddEventHandler(
    "logunban",
    function(a2)
        local e = GetPlayerName(source)
        local r = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local U = r
        local V = {
            steam = "Not found",
            ip = "Not found",
            discord = "Not found",
            license = "Not found",
            xbl = "Not found",
            live = "Not found"
        }
        for i = 0, GetNumPlayerIdentifiers(r) - 1 do
            local I = GetPlayerIdentifier(r, i)
            if string.find(I, "steam") then
                V.steam = I
            elseif string.find(I, "ip") then
                V.ip = I
            elseif string.find(I, "discord") then
                V.discord = I
            elseif string.find(I, "license") then
                V.license = I
            elseif string.find(I, "xbl") then
                V.xbl = I
            elseif string.find(I, "live") then
                V.live = I
            end
        end
        if b == "de" then
            discordlogs(
                " | Unban-Log",
                dnz_system.webhook.webhooks.banlog,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] hat Ban ID: " ..
                                    a2 ..
                                        " entbannt.```\n Identifiers:```\nGroup: " ..
                                            xPlayer.getGroup() ..
                                                "\nSteam: " ..
                                                    V.steam ..
                                                        "\nDiscord: " ..
                                                            V.discord ..
                                                                "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        else
            discordlogs(
                " | Unban-Log",
                dnz_system.webhook.webhooks.banlog,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] unbanned Ban ID: " ..
                                    a2 ..
                                        "```\n Identifiers:```\nGroup: " ..
                                            xPlayer.getGroup() ..
                                                "\nSteam: " ..
                                                    V.steam ..
                                                        "\nDiscord: " ..
                                                            V.discord ..
                                                                "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        end
        if dnz_system.debug then
            if dnz_system.webhook.webhooks.banlog == "" then
                printinfo("8[Error] ^3[Debug] ^0Unbanlog Webhook not found^0")
            else
                printinfo(
                    "2[Success] ^3[Debug] ^0Unbanlog Webhook Send to ^5" .. dnz_system.webhook.webhooks.banlog .. "^0"
                )
            end
            return
        end
    end
)
RegisterNetEvent("logkick")
AddEventHandler(
    "logkick",
    function(a1, I, f)
        local e = GetPlayerName(source)
        local _ = GetPlayerName(I)
        local r = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local U = r
        local V = {
            steam = "Not found",
            ip = "Not found",
            discord = "Not found",
            license = "Not found",
            xbl = "Not found",
            live = "Not found"
        }
        for i = 0, GetNumPlayerIdentifiers(r) - 1 do
            local I = GetPlayerIdentifier(r, i)
            if string.find(I, "steam") then
                V.steam = I
            elseif string.find(I, "ip") then
                V.ip = I
            elseif string.find(I, "discord") then
                V.discord = I
            elseif string.find(I, "license") then
                V.license = I
            elseif string.find(I, "xbl") then
                V.xbl = I
            elseif string.find(I, "live") then
                V.live = I
            end
        end
        if b == "de" then
            discordlogs(
                " | Kick-Log",
                dnz_system.webhook.webhooks.kicklog,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] hat " ..
                                    _ ..
                                        "[" ..
                                            I ..
                                                "] gekickt. \nGrund: " ..
                                                    f ..
                                                        "```\n Identifiers:```\nGroup: " ..
                                                            xPlayer.getGroup() ..
                                                                "\nSteam: " ..
                                                                    V.steam ..
                                                                        "\nDiscord: " ..
                                                                            V.discord ..
                                                                                "\nLizenz: " ..
                                                                                    V.license ..
                                                                                        "\nIP: " .. V.ip .. "```"
            )
        else
            discordlogs(
                " | Kick-Log",
                dnz_system.webhook.webhooks.kicklog,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] kicked " ..
                                    _ ..
                                        "[" ..
                                            I ..
                                                "]\nReason: " ..
                                                    f ..
                                                        "```\n Identifiers:```\nGroup: " ..
                                                            xPlayer.getGroup() ..
                                                                "\nSteam: " ..
                                                                    V.steam ..
                                                                        "\nDiscord: " ..
                                                                            V.discord ..
                                                                                "\nLizenz: " ..
                                                                                    V.license ..
                                                                                        "\nIP: " .. V.ip .. "```"
            )
        end
        if dnz_system.debug then
            if dnz_system.webhook.webhooks.kicklog == "" then
                printinfo("8[Error] ^3[Debug] ^0Kicklog Webhook not found^0")
            else
                printinfo(
                    "2[Success] ^3[Debug] ^0Kicklog Webhook Send to ^5" .. dnz_system.webhook.webhooks.kicklog .. "^0"
                )
            end
            return
        end
    end
)
RegisterNetEvent("logwarn")
AddEventHandler(
    "logwarn",
    function(a1, I, f)
        local e = GetPlayerName(source)
        local _ = GetPlayerName(I)
        local r = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local U = r
        local V = {
            steam = "Not found",
            ip = "Not found",
            discord = "Not found",
            license = "Not found",
            xbl = "Not found",
            live = "Not found"
        }
        for i = 0, GetNumPlayerIdentifiers(r) - 1 do
            local I = GetPlayerIdentifier(r, i)
            if string.find(I, "steam") then
                V.steam = I
            elseif string.find(I, "ip") then
                V.ip = I
            elseif string.find(I, "discord") then
                V.discord = I
            elseif string.find(I, "license") then
                V.license = I
            elseif string.find(I, "xbl") then
                V.xbl = I
            elseif string.find(I, "live") then
                V.live = I
            end
        end
        if b == "de" then
            discordlogs(
                " | Warn-Log",
                dnz_system.webhook.webhooks.warnlog,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] hat " ..
                                    _ ..
                                        "[" ..
                                            I ..
                                                "] verwarnt. \nGrund: " ..
                                                    f ..
                                                        "```\n Identifiers:```\nGroup: " ..
                                                            xPlayer.getGroup() ..
                                                                "\nSteam: " ..
                                                                    V.steam ..
                                                                        "\nDiscord: " ..
                                                                            V.discord ..
                                                                                "\nLizenz: " ..
                                                                                    V.license ..
                                                                                        "\nIP: " .. V.ip .. "```"
            )
        else
            discordlogs(
                " | Warn-Log",
                dnz_system.webhook.webhooks.warnlog,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] warned " ..
                                    _ ..
                                        "[" ..
                                            I ..
                                                "]\nReason: " ..
                                                    f ..
                                                        "```\n Identifiers:```\nGroup: " ..
                                                            xPlayer.getGroup() ..
                                                                "\nSteam: " ..
                                                                    V.steam ..
                                                                        "\nDiscord: " ..
                                                                            V.discord ..
                                                                                "\nLizenz: " ..
                                                                                    V.license ..
                                                                                        "\nIP: " .. V.ip .. "```"
            )
        end
        if dnz_system.debug then
            if dnz_system.webhook.webhooks.warnlog == "" then
                printinfo("8[Error] ^3[Debug] ^0Warnlog Webhook not found^0")
            else
                printinfo(
                    "2[Success] ^3[Debug] ^0Warnlog Webhook Send to ^5" .. dnz_system.webhook.webhooks.warnlog .. "^0"
                )
            end
            return
        end
    end
)
RegisterNetEvent("logrevall")
AddEventHandler(
    "logrevall",
    function()
        local e = GetPlayerName(source)
        local r = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local U = r
        local V = {
            steam = "Not found",
            ip = "Not found",
            discord = "Not found",
            license = "Not found",
            xbl = "Not found",
            live = "Not found"
        }
        for i = 0, GetNumPlayerIdentifiers(r) - 1 do
            local I = GetPlayerIdentifier(r, i)
            if string.find(I, "steam") then
                V.steam = I
            elseif string.find(I, "ip") then
                V.ip = I
            elseif string.find(I, "discord") then
                V.discord = I
            elseif string.find(I, "license") then
                V.license = I
            elseif string.find(I, "xbl") then
                V.xbl = I
            elseif string.find(I, "live") then
                V.live = I
            end
        end
        if b == "de" then
            discordlogs(
                " | Admin-Log",
                dnz_system.webhook.webhooks.adminlogs,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] hat alle Spieler wiederbelebt.```\n Identifiers:```\nGroup: " ..
                                    xPlayer.getGroup() ..
                                        "\nSteam: " ..
                                            V.steam ..
                                                "\nDiscord: " ..
                                                    V.discord .. "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        else
            discordlogs(
                " | Admin-Log",
                dnz_system.webhook.webhooks.adminlogs,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] revived all Players.```\n Identifiers:```\nGroup: " ..
                                    xPlayer.getGroup() ..
                                        "\nSteam: " ..
                                            V.steam ..
                                                "\nDiscord: " ..
                                                    V.discord .. "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        end
        if dnz_system.debug then
            if dnz_system.webhook.webhooks.adminlogs == "" then
                printinfo("8[Error] ^3[Debug] ^0Adminlogs Webhook not found^0")
            else
                printinfo(
                    "2[Success] ^3[Debug] ^0Adminlogs Webhook Send to ^5" ..
                        dnz_system.webhook.webhooks.adminlogs .. "^0"
                )
            end
            return
        end
    end
)
RegisterNetEvent("logdelallcars")
AddEventHandler(
    "logdelallcars",
    function()
        local e = GetPlayerName(source)
        local r = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local U = r
        local V = {
            steam = "Not found",
            ip = "Not found",
            discord = "Not found",
            license = "Not found",
            xbl = "Not found",
            live = "Not found"
        }
        for i = 0, GetNumPlayerIdentifiers(r) - 1 do
            local I = GetPlayerIdentifier(r, i)
            if string.find(I, "steam") then
                V.steam = I
            elseif string.find(I, "ip") then
                V.ip = I
            elseif string.find(I, "discord") then
                V.discord = I
            elseif string.find(I, "license") then
                V.license = I
            elseif string.find(I, "xbl") then
                V.xbl = I
            elseif string.find(I, "live") then
                V.live = I
            end
        end
        if b == "de" then
            discordlogs(
                " | Admin-Log",
                dnz_system.webhook.webhooks.adminlogs,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] hat alle Fahrzeuge gelöscht.```\n Identifiers:```\nGroup: " ..
                                    xPlayer.getGroup() ..
                                        "\nSteam: " ..
                                            V.steam ..
                                                "\nDiscord: " ..
                                                    V.discord .. "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        else
            discordlogs(
                " | Admin-Log",
                dnz_system.webhook.webhooks.adminlogs,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] deleted all Vehicles.```\n Identifiers:```\nGroup: " ..
                                    xPlayer.getGroup() ..
                                        "\nSteam: " ..
                                            V.steam ..
                                                "\nDiscord: " ..
                                                    V.discord .. "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        end
        if dnz_system.debug then
            if dnz_system.webhook.webhooks.adminlogs == "" then
                printinfo("8[Error] ^3[Debug] ^0Adminlogs Webhook not found^0")
            else
                printinfo(
                    "2[Success] ^3[Debug] ^0Adminlogs Webhook Send to ^5" ..
                        dnz_system.webhook.webhooks.adminlogs .. "^0"
                )
            end
            return
        end
    end
)
RegisterNetEvent("logdelobjects")
AddEventHandler(
    "logdelobjects",
    function()
        local e = GetPlayerName(source)
        local r = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local U = r
        local V = {
            steam = "Not found",
            ip = "Not found",
            discord = "Not found",
            license = "Not found",
            xbl = "Not found",
            live = "Not found"
        }
        for i = 0, GetNumPlayerIdentifiers(r) - 1 do
            local I = GetPlayerIdentifier(r, i)
            if string.find(I, "steam") then
                V.steam = I
            elseif string.find(I, "ip") then
                V.ip = I
            elseif string.find(I, "discord") then
                V.discord = I
            elseif string.find(I, "license") then
                V.license = I
            elseif string.find(I, "xbl") then
                V.xbl = I
            elseif string.find(I, "live") then
                V.live = I
            end
        end
        if b == "de" then
            discordlogs(
                " | Admin-Log",
                dnz_system.webhook.webhooks.adminlogs,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] hat alle Objekte gelöscht.```\n Identifiers:```\nGroup: " ..
                                    xPlayer.getGroup() ..
                                        "\nSteam: " ..
                                            V.steam ..
                                                "\nDiscord: " ..
                                                    V.discord .. "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        else
            discordlogs(
                " | Admin-Log",
                dnz_system.webhook.webhooks.adminlogs,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] deleted all Objects.```\n Identifiers:```\nGroup: " ..
                                    xPlayer.getGroup() ..
                                        "\nSteam: " ..
                                            V.steam ..
                                                "\nDiscord: " ..
                                                    V.discord .. "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        end
        if dnz_system.debug then
            if dnz_system.webhook.webhooks.adminlogs == "" then
                printinfo("8[Error] ^3[Debug] ^0Adminlogs Webhook not found^0")
            else
                printinfo(
                    "2[Success] ^3[Debug] ^0Adminlogs Webhook Send to ^5" ..
                        dnz_system.webhook.webhooks.adminlogs .. "^0"
                )
            end
            return
        end
    end
)
RegisterNetEvent("logdelpeds")
AddEventHandler(
    "logdelpeds",
    function()
        local e = GetPlayerName(source)
        local r = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local U = r
        local V = {
            steam = "Not found",
            ip = "Not found",
            discord = "Not found",
            license = "Not found",
            xbl = "Not found",
            live = "Not found"
        }
        for i = 0, GetNumPlayerIdentifiers(r) - 1 do
            local I = GetPlayerIdentifier(r, i)
            if string.find(I, "steam") then
                V.steam = I
            elseif string.find(I, "ip") then
                V.ip = I
            elseif string.find(I, "discord") then
                V.discord = I
            elseif string.find(I, "license") then
                V.license = I
            elseif string.find(I, "xbl") then
                V.xbl = I
            elseif string.find(I, "live") then
                V.live = I
            end
        end
        if b == "de" then
            discordlogs(
                " | Admin-Log",
                dnz_system.webhook.webhooks.adminlogs,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] hat alle Peds gelöscht.```\n Identifiers:```\nGroup: " ..
                                    xPlayer.getGroup() ..
                                        "\nSteam: " ..
                                            V.steam ..
                                                "\nDiscord: " ..
                                                    V.discord .. "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        else
            discordlogs(
                " | Admin-Log",
                dnz_system.webhook.webhooks.adminlogs,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] deleted all Peds.```\n Identifiers:```\nGroup: " ..
                                    xPlayer.getGroup() ..
                                        "\nSteam: " ..
                                            V.steam ..
                                                "\nDiscord: " ..
                                                    V.discord .. "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        end
        if dnz_system.debug then
            if dnz_system.webhook.webhooks.adminlogs == "" then
                printinfo("8[Error] ^3[Debug] ^0Adminlogs Webhook not found^0")
            else
                printinfo(
                    "2[Success] ^3[Debug] ^0Adminlogs Webhook Send to ^5" ..
                        dnz_system.webhook.webhooks.adminlogs .. "^0"
                )
            end
            return
        end
    end
)
RegisterNetEvent("logrevself")
AddEventHandler(
    "logrevself",
    function()
        local e = GetPlayerName(source)
        local r = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local U = r
        local V = {
            steam = "Not found",
            ip = "Not found",
            discord = "Not found",
            license = "Not found",
            xbl = "Not found",
            live = "Not found"
        }
        for i = 0, GetNumPlayerIdentifiers(r) - 1 do
            local I = GetPlayerIdentifier(r, i)
            if string.find(I, "steam") then
                V.steam = I
            elseif string.find(I, "ip") then
                V.ip = I
            elseif string.find(I, "discord") then
                V.discord = I
            elseif string.find(I, "license") then
                V.license = I
            elseif string.find(I, "xbl") then
                V.xbl = I
            elseif string.find(I, "live") then
                V.live = I
            end
        end
        if b == "de" then
            discordlogs(
                " | Admin-Log",
                dnz_system.webhook.webhooks.adminlogs,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] hat sich selbst Wiederbelebt.```\n Identifiers:```\nGroup: " ..
                                    xPlayer.getGroup() ..
                                        "\nSteam: " ..
                                            V.steam ..
                                                "\nDiscord: " ..
                                                    V.discord .. "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        else
            discordlogs(
                " | Admin-Log",
                dnz_system.webhook.webhooks.adminlogs,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] revived himself.```\n Identifiers:```\nGroup: " ..
                                    xPlayer.getGroup() ..
                                        "\nSteam: " ..
                                            V.steam ..
                                                "\nDiscord: " ..
                                                    V.discord .. "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        end
        if dnz_system.debug then
            if dnz_system.webhook.webhooks.adminlogs == "" then
                printinfo("8[Error] ^3[Debug] ^0Adminlogs Webhook not found^0")
            else
                printinfo(
                    "2[Success] ^3[Debug] ^0Adminlogs Webhook Send to ^5" ..
                        dnz_system.webhook.webhooks.adminlogs .. "^0"
                )
            end
            return
        end
    end
)
RegisterNetEvent("loghealself")
AddEventHandler(
    "loghealself",
    function()
        local e = GetPlayerName(source)
        local r = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local U = r
        local V = {
            steam = "Not found",
            ip = "Not found",
            discord = "Not found",
            license = "Not found",
            xbl = "Not found",
            live = "Not found"
        }
        for i = 0, GetNumPlayerIdentifiers(r) - 1 do
            local I = GetPlayerIdentifier(r, i)
            if string.find(I, "steam") then
                V.steam = I
            elseif string.find(I, "ip") then
                V.ip = I
            elseif string.find(I, "discord") then
                V.discord = I
            elseif string.find(I, "license") then
                V.license = I
            elseif string.find(I, "xbl") then
                V.xbl = I
            elseif string.find(I, "live") then
                V.live = I
            end
        end
        if b == "de" then
            discordlogs(
                " | Admin-Log",
                dnz_system.webhook.webhooks.adminlogs,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] hat sich selbst Geheilt.```\n Identifiers:```\nGroup: " ..
                                    xPlayer.getGroup() ..
                                        "\nSteam: " ..
                                            V.steam ..
                                                "\nDiscord: " ..
                                                    V.discord .. "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        else
            discordlogs(
                " | Admin-Log",
                dnz_system.webhook.webhooks.adminlogs,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] healed himself.```\n Identifiers:```\nGroup: " ..
                                    xPlayer.getGroup() ..
                                        "\nSteam: " ..
                                            V.steam ..
                                                "\nDiscord: " ..
                                                    V.discord .. "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        end
        if dnz_system.debug then
            if dnz_system.webhook.webhooks.adminlogs == "" then
                printinfo("8[Error] ^3[Debug] ^0Adminlogs Webhook not found^0")
            else
                printinfo(
                    "2[Success] ^3[Debug] ^0Adminlogs Webhook Send to ^5" ..
                        dnz_system.webhook.webhooks.adminlogs .. "^0"
                )
            end
            return
        end
    end
)
RegisterNetEvent("loggivearmour")
AddEventHandler(
    "loggivearmour",
    function()
        local e = GetPlayerName(source)
        local r = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local U = r
        local V = {
            steam = "Not found",
            ip = "Not found",
            discord = "Not found",
            license = "Not found",
            xbl = "Not found",
            live = "Not found"
        }
        for i = 0, GetNumPlayerIdentifiers(r) - 1 do
            local I = GetPlayerIdentifier(r, i)
            if string.find(I, "steam") then
                V.steam = I
            elseif string.find(I, "ip") then
                V.ip = I
            elseif string.find(I, "discord") then
                V.discord = I
            elseif string.find(I, "license") then
                V.license = I
            elseif string.find(I, "xbl") then
                V.xbl = I
            elseif string.find(I, "live") then
                V.live = I
            end
        end
        if b == "de" then
            discordlogs(
                " | Admin-Log",
                dnz_system.webhook.webhooks.adminlogs,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] hat sich selbst Rüstung gegeben.```\n Identifiers:```\nGroup: " ..
                                    xPlayer.getGroup() ..
                                        "\nSteam: " ..
                                            V.steam ..
                                                "\nDiscord: " ..
                                                    V.discord .. "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        else
            discordlogs(
                " | Admin-Log",
                dnz_system.webhook.webhooks.adminlogs,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] gived himself Armour.```\n Identifiers:```\nGroup: " ..
                                    xPlayer.getGroup() ..
                                        "\nSteam: " ..
                                            V.steam ..
                                                "\nDiscord: " ..
                                                    V.discord .. "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        end
        if dnz_system.debug then
            if dnz_system.webhook.webhooks.adminlogs == "" then
                printinfo("8[Error] ^3[Debug] ^0Adminlogs Webhook not found^0")
            else
                printinfo(
                    "2[Success] ^3[Debug] ^0Adminlogs Webhook Send to ^5" ..
                        dnz_system.webhook.webhooks.adminlogs .. "^0"
                )
            end
            return
        end
    end
)
RegisterNetEvent("logkickall")
AddEventHandler(
    "logkickall",
    function()
        local e = GetPlayerName(source)
        local r = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local U = r
        local V = {
            steam = "Not found",
            ip = "Not found",
            discord = "Not found",
            license = "Not found",
            xbl = "Not found",
            live = "Not found"
        }
        for i = 0, GetNumPlayerIdentifiers(r) - 1 do
            local I = GetPlayerIdentifier(r, i)
            if string.find(I, "steam") then
                V.steam = I
            elseif string.find(I, "ip") then
                V.ip = I
            elseif string.find(I, "discord") then
                V.discord = I
            elseif string.find(I, "license") then
                V.license = I
            elseif string.find(I, "xbl") then
                V.xbl = I
            elseif string.find(I, "live") then
                V.live = I
            end
        end
        if b == "de" then
            discordlogs(
                " | Kick-Log",
                dnz_system.webhook.webhooks.kicklog,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] hat alle Spieler gekickt.```\n Identifiers:```\nGroup: " ..
                                    xPlayer.getGroup() ..
                                        "\nSteam: " ..
                                            V.steam ..
                                                "\nDiscord: " ..
                                                    V.discord .. "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        else
            discordlogs(
                " | Kick-Log",
                dnz_system.webhook.webhooks.kicklog,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] has kicked all Players.```\n Identifiers:```\nGroup: " ..
                                    xPlayer.getGroup() ..
                                        "\nSteam: " ..
                                            V.steam ..
                                                "\nDiscord: " ..
                                                    V.discord .. "\nLizenz: " .. V.license .. "\nIP: " .. V.ip .. "```"
            )
        end
        if dnz_system.debug then
            if dnz_system.webhook.webhooks.kicklog == "" then
                printinfo("8[Error] ^3[Debug] ^0Kicklog Webhook not found^0")
            else
                printinfo(
                    "2[Success] ^3[Debug] ^0Kicklog Webhook Send to ^5" .. dnz_system.webhook.webhooks.kicklog .. "^0"
                )
            end
            return
        end
    end
)
RegisterNetEvent("logfreeze")
AddEventHandler(
    "logfreeze",
    function(a1, I)
        local e = GetPlayerName(source)
        local _ = GetPlayerName(I)
        local r = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local U = r
        local V = {
            steam = "Not found",
            ip = "Not found",
            discord = "Not found",
            license = "Not found",
            xbl = "Not found",
            live = "Not found"
        }
        for i = 0, GetNumPlayerIdentifiers(r) - 1 do
            local I = GetPlayerIdentifier(r, i)
            if string.find(I, "steam") then
                V.steam = I
            elseif string.find(I, "ip") then
                V.ip = I
            elseif string.find(I, "discord") then
                V.discord = I
            elseif string.find(I, "license") then
                V.license = I
            elseif string.find(I, "xbl") then
                V.xbl = I
            elseif string.find(I, "live") then
                V.live = I
            end
        end
        if b == "de" then
            discordlogs(
                " | Warn-Log",
                dnz_system.webhook.webhooks.useractionlog,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] hat " ..
                                    _ ..
                                        "[" ..
                                            I ..
                                                "] ge/entfreezed.```\n Identifiers:```\nGroup: " ..
                                                    xPlayer.getGroup() ..
                                                        "\nSteam: " ..
                                                            V.steam ..
                                                                "\nDiscord: " ..
                                                                    V.discord ..
                                                                        "\nLizenz: " ..
                                                                            V.license .. "\nIP: " .. V.ip .. "```"
            )
        else
            discordlogs(
                " | Warn-Log",
                dnz_system.webhook.webhooks.useractionlog,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] un/freezed " ..
                                    _ ..
                                        "[" ..
                                            I ..
                                                "]```\n Identifiers:```\nGroup: " ..
                                                    xPlayer.getGroup() ..
                                                        "\nSteam: " ..
                                                            V.steam ..
                                                                "\nDiscord: " ..
                                                                    V.discord ..
                                                                        "\nLizenz: " ..
                                                                            V.license .. "\nIP: " .. V.ip .. "```"
            )
        end
        if dnz_system.debug then
            if dnz_system.webhook.webhooks.useractionlog == "" then
                printinfo("8[Error] ^3[Debug] ^0User Actionslog Webhook not found^0")
            else
                printinfo(
                    "2[Success] ^3[Debug] ^0User Actionslog Webhook Send to ^5" ..
                        dnz_system.webhook.webhooks.useractionlog .. "^0"
                )
            end
            return
        end
    end
)
RegisterNetEvent("logrevivesomeone")
AddEventHandler(
    "logrevivesomeone",
    function(a1, I)
        local e = GetPlayerName(source)
        local _ = GetPlayerName(I)
        local r = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local U = r
        local V = {
            steam = "Not found",
            ip = "Not found",
            discord = "Not found",
            license = "Not found",
            xbl = "Not found",
            live = "Not found"
        }
        for i = 0, GetNumPlayerIdentifiers(r) - 1 do
            local I = GetPlayerIdentifier(r, i)
            if string.find(I, "steam") then
                V.steam = I
            elseif string.find(I, "ip") then
                V.ip = I
            elseif string.find(I, "discord") then
                V.discord = I
            elseif string.find(I, "license") then
                V.license = I
            elseif string.find(I, "xbl") then
                V.xbl = I
            elseif string.find(I, "live") then
                V.live = I
            end
        end
        if b == "de" then
            discordlogs(
                " | Warn-Log",
                dnz_system.webhook.webhooks.useractionlog,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] hat " ..
                                    _ ..
                                        "[" ..
                                            I ..
                                                "] revived.```\n Identifiers:```\nGroup: " ..
                                                    xPlayer.getGroup() ..
                                                        "\nSteam: " ..
                                                            V.steam ..
                                                                "\nDiscord: " ..
                                                                    V.discord ..
                                                                        "\nLizenz: " ..
                                                                            V.license .. "\nIP: " .. V.ip .. "```"
            )
        else
            discordlogs(
                " | Warn-Log",
                dnz_system.webhook.webhooks.useractionlog,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] revived " ..
                                    _ ..
                                        "[" ..
                                            I ..
                                                "]```\n Identifiers:```\nGroup: " ..
                                                    xPlayer.getGroup() ..
                                                        "\nSteam: " ..
                                                            V.steam ..
                                                                "\nDiscord: " ..
                                                                    V.discord ..
                                                                        "\nLizenz: " ..
                                                                            V.license .. "\nIP: " .. V.ip .. "```"
            )
        end
        if dnz_system.debug then
            if dnz_system.webhook.webhooks.useractionlog == "" then
                printinfo("8[Error] ^3[Debug] ^0User Actionslog Webhook not found^0")
            else
                printinfo(
                    "2[Success] ^3[Debug] ^0User Actionslog Webhook Send to ^5" ..
                        dnz_system.webhook.webhooks.useractionlog .. "^0"
                )
            end
            return
        end
    end
)
RegisterNetEvent("logspec")
AddEventHandler(
    "logspec",
    function(a1, I)
        local e = GetPlayerName(source)
        local _ = GetPlayerName(I)
        local r = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local U = r
        local V = {
            steam = "Not found",
            ip = "Not found",
            discord = "Not found",
            license = "Not found",
            xbl = "Not found",
            live = "Not found"
        }
        for i = 0, GetNumPlayerIdentifiers(r) - 1 do
            local I = GetPlayerIdentifier(r, i)
            if string.find(I, "steam") then
                V.steam = I
            elseif string.find(I, "ip") then
                V.ip = I
            elseif string.find(I, "discord") then
                V.discord = I
            elseif string.find(I, "license") then
                V.license = I
            elseif string.find(I, "xbl") then
                V.xbl = I
            elseif string.find(I, "live") then
                V.live = I
            end
        end
        if b == "de" then
            discordlogs(
                " | Warn-Log",
                dnz_system.webhook.webhooks.useractionlog,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] hat " ..
                                    _ ..
                                        "[" ..
                                            I ..
                                                "] zugeschaut.```\n Identifiers:```\nGroup: " ..
                                                    xPlayer.getGroup() ..
                                                        "\nSteam: " ..
                                                            V.steam ..
                                                                "\nDiscord: " ..
                                                                    V.discord ..
                                                                        "\nLizenz: " ..
                                                                            V.license .. "\nIP: " .. V.ip .. "```"
            )
        else
            discordlogs(
                " | Warn-Log",
                dnz_system.webhook.webhooks.useractionlog,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] spectated " ..
                                    _ ..
                                        "[" ..
                                            I ..
                                                "]```\n Identifiers:```\nGroup: " ..
                                                    xPlayer.getGroup() ..
                                                        "\nSteam: " ..
                                                            V.steam ..
                                                                "\nDiscord: " ..
                                                                    V.discord ..
                                                                        "\nLizenz: " ..
                                                                            V.license .. "\nIP: " .. V.ip .. "```"
            )
        end
        if dnz_system.debug then
            if dnz_system.webhook.webhooks.useractionlog == "" then
                printinfo("8[Error] ^3[Debug] ^0User Actionslog Webhook not found^0")
            else
                printinfo(
                    "2[Success] ^3[Debug] ^0User Actionslog Webhook Send to ^5" ..
                        dnz_system.webhook.webhooks.useractionlog .. "^0"
                )
            end
            return
        end
    end
)
RegisterNetEvent("loggoto")
AddEventHandler(
    "loggoto",
    function(a1, I)
        local e = GetPlayerName(source)
        local _ = GetPlayerName(I)
        local r = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local U = r
        local V = {
            steam = "Not found",
            ip = "Not found",
            discord = "Not found",
            license = "Not found",
            xbl = "Not found",
            live = "Not found"
        }
        for i = 0, GetNumPlayerIdentifiers(r) - 1 do
            local I = GetPlayerIdentifier(r, i)
            if string.find(I, "steam") then
                V.steam = I
            elseif string.find(I, "ip") then
                V.ip = I
            elseif string.find(I, "discord") then
                V.discord = I
            elseif string.find(I, "license") then
                V.license = I
            elseif string.find(I, "xbl") then
                V.xbl = I
            elseif string.find(I, "live") then
                V.live = I
            end
        end
        if b == "de" then
            discordlogs(
                " | Warn-Log",
                dnz_system.webhook.webhooks.useractionlog,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] hat sich zu " ..
                                    _ ..
                                        "[" ..
                                            I ..
                                                "] teleportiert.```\n Identifiers:```\nGroup: " ..
                                                    xPlayer.getGroup() ..
                                                        "\nSteam: " ..
                                                            V.steam ..
                                                                "\nDiscord: " ..
                                                                    V.discord ..
                                                                        "\nLizenz: " ..
                                                                            V.license .. "\nIP: " .. V.ip .. "```"
            )
        else
            discordlogs(
                " | Warn-Log",
                dnz_system.webhook.webhooks.useractionlog,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] teleported himself to " ..
                                    _ ..
                                        "[" ..
                                            I ..
                                                "]```\n Identifiers:```\nGroup: " ..
                                                    xPlayer.getGroup() ..
                                                        "\nSteam: " ..
                                                            V.steam ..
                                                                "\nDiscord: " ..
                                                                    V.discord ..
                                                                        "\nLizenz: " ..
                                                                            V.license .. "\nIP: " .. V.ip .. "```"
            )
        end
        if dnz_system.debug then
            if dnz_system.webhook.webhooks.useractionlog == "" then
                printinfo("8[Error] ^3[Debug] ^0User Actionslog Webhook not found^0")
            else
                printinfo(
                    "2[Success] ^3[Debug] ^0User Actionslog Webhook Send to ^5" ..
                        dnz_system.webhook.webhooks.useractionlog .. "^0"
                )
            end
            return
        end
    end
)
RegisterNetEvent("logbring")
AddEventHandler(
    "logbring",
    function(a1, I)
        local e = GetPlayerName(source)
        local _ = GetPlayerName(I)
        local r = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local U = r
        local V = {
            steam = "Not found",
            ip = "Not found",
            discord = "Not found",
            license = "Not found",
            xbl = "Not found",
            live = "Not found"
        }
        for i = 0, GetNumPlayerIdentifiers(r) - 1 do
            local I = GetPlayerIdentifier(r, i)
            if string.find(I, "steam") then
                V.steam = I
            elseif string.find(I, "ip") then
                V.ip = I
            elseif string.find(I, "discord") then
                V.discord = I
            elseif string.find(I, "license") then
                V.license = I
            elseif string.find(I, "xbl") then
                V.xbl = I
            elseif string.find(I, "live") then
                V.live = I
            end
        end
        if b == "de" then
            discordlogs(
                " | Warn-Log",
                dnz_system.webhook.webhooks.useractionlog,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] hat " ..
                                    _ ..
                                        "[" ..
                                            I ..
                                                "] zu sich teleportiert.```\n Identifiers:```\nGroup: " ..
                                                    xPlayer.getGroup() ..
                                                        "\nSteam: " ..
                                                            V.steam ..
                                                                "\nDiscord: " ..
                                                                    V.discord ..
                                                                        "\nLizenz: " ..
                                                                            V.license .. "\nIP: " .. V.ip .. "```"
            )
        else
            discordlogs(
                " | Warn-Log",
                dnz_system.webhook.webhooks.useractionlog,
                "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                "Informations:```" ..
                    e ..
                        "[" ..
                            r ..
                                "] teleported " ..
                                    _ ..
                                        "[" ..
                                            I ..
                                                "] to himself.```\n Identifiers:```\nGroup: " ..
                                                    xPlayer.getGroup() ..
                                                        "\nSteam: " ..
                                                            V.steam ..
                                                                "\nDiscord: " ..
                                                                    V.discord ..
                                                                        "\nLizenz: " ..
                                                                            V.license .. "\nIP: " .. V.ip .. "```"
            )
        end
        if dnz_system.debug then
            if dnz_system.webhook.webhooks.useractionlog == "" then
                printinfo("8[Error] ^3[Debug] ^0User Actionslog Webhook not found^0")
            else
                printinfo(
                    "2[Success] ^3[Debug] ^0User Actionslog Webhook Send to ^5" ..
                        dnz_system.webhook.webhooks.useractionlog .. "^0"
                )
            end
            return
        end
    end
)
RegisterNetEvent("teamchat")
AddEventHandler(
    "teamchat",
    function(a3)
        local e = GetPlayerName(source)
        local r = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local U = r
        local V = {
            steam = "Not found",
            ip = "Not found",
            discord = "Not found",
            license = "Not found",
            xbl = "Not found",
            live = "Not found"
        }
        for i = 0, GetNumPlayerIdentifiers(r) - 1 do
            local I = GetPlayerIdentifier(r, i)
            if string.find(I, "steam") then
                V.steam = I
            elseif string.find(I, "ip") then
                V.ip = I
            elseif string.find(I, "discord") then
                V.discord = I
            elseif string.find(I, "license") then
                V.license = I
            elseif string.find(I, "xbl") then
                V.xbl = I
            elseif string.find(I, "live") then
                V.live = I
            end
        end
        if Config.Permissions.teamchat ~= nil then
            for p, q in pairs(Config.Permissions.teamchat) do
                if q == xPlayer.getGroup() then
                    TriggerClientEvent(
                        "teamchatnotify",
                        -1,
                        a3,
                        "Teamchat-" .. GetPlayerName(source) .. " [" .. source .. "]"
                    )
                    if b == "de" then
                        discordlogs(
                            " | Teamchat-Log",
                            dnz_system.webhook.webhooks.teamchatlog,
                            "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                            "Informations:```" ..
                                e ..
                                    "[" ..
                                        r ..
                                            "] schreibt: " ..
                                                a3 ..
                                                    "```\n Identifiers:```\nGroup: " ..
                                                        xPlayer.getGroup() ..
                                                            "\nSteam: " ..
                                                                V.steam ..
                                                                    "\nDiscord: " ..
                                                                        V.discord ..
                                                                            "\nLizenz: " ..
                                                                                V.license .. "\nIP: " .. V.ip .. "```"
                        )
                    else
                        discordlogs(
                            " | Teamchat-Log",
                            dnz_system.webhook.webhooks.teamchatlog,
                            "ID: " .. (r or "Error") .. " | Name: " .. (e or "not found"),
                            "Informations:```" ..
                                e ..
                                    "[" ..
                                        r ..
                                            "] wrote: " ..
                                                a3 ..
                                                    "```\n Identifiers:```\nGroup: " ..
                                                        xPlayer.getGroup() ..
                                                            "\nSteam: " ..
                                                                V.steam ..
                                                                    "\nDiscord: " ..
                                                                        V.discord ..
                                                                            "\nLizenz: " ..
                                                                                V.license .. "\nIP: " .. V.ip .. "```"
                        )
                    end
                    if dnz_system.debug then
                        if dnz_system.webhook.webhooks.teamchatlog == "" then
                            printinfo("8[Error] ^3[Debug] ^0Teamchat Webhook not found^0")
                        else
                            printinfo(
                                "2[Success] ^3[Debug] ^0Teamchat Webhook Send to ^5" ..
                                    dnz_system.webhook.webhooks.teamchatlog .. "^0"
                            )
                        end
                        return
                    end
                    return true
                end
            end
            TriggerClientEvent("notallowed", source)
            return false
        end
    end
)
function discordlogs(a4, a5, a6, a7)
    local a8 = {
        {
            ["author"] = {name = dnz_system.webhook.name .. a4, icon_url = dnz_system.webhook.icon},
            ["title"] = a6,
            ["description"] = a7,
            ["color"] = dnz_system.webhook.color,
            ["footer"] = {["text"] = os.date("%A, %B %x - %X"), ["icon_url"] = dnz_system.webhook.icon}
        }
    }
    local a9 = {
        {
            ["author"] = {name = dnz_system.webhook.name .. " | All-Log", icon_url = dnz_system.webhook.icon},
            ["title"] = a6,
            ["description"] = a7,
            ["color"] = dnz_system.webhook.color,
            ["footer"] = {["text"] = os.date("%A, %B %x - %X"), ["icon_url"] = dnz_system.webhook.icon}
        }
    }
    if a7 == nil or a7 == "" then
        return FALSE
    end
    PerformHttpRequest(
        dnz_system.webhook.webhooks.allwebhooks,
        function(aa, ab, ac)
        end,
        "POST",
        json.encode({username = dnz_system.webhook.name, embeds = a9, avatar_url = dnz_system.webhook.icon}),
        {["Content-Type"] = "application/json"}
    )
    PerformHttpRequest(
        a5,
        function(aa, ab, ac)
        end,
        "POST",
        json.encode({username = dnz_system.webhook.name, embeds = a8, avatar_url = dnz_system.webhook.icon}),
        {["Content-Type"] = "application/json"}
    )
end
RegisterNetEvent("warn")
AddEventHandler(
    "warn",
    function(ad, ae, S)
        local af = ad
        local d = ae
        local f = S
        local xPlayer = ESX.GetPlayerFromId(d)
        local T = ESX.GetPlayerFromId(source)
        if Config.Permissions.warn ~= nil then
            for p, q in pairs(Config.Permissions.warn) do
                if T.getGroup() == q then
                    Warn(af, d, f)
                    if dnz_system.debug then
                        printinfo(
                            "^5[Info] ^3[Debug] ^4" ..
                                T.getName() .. " ^0warned ^4" .. xPlayer.getName() .. "^0 Reason: ^4" .. f .. "^0"
                        )
                    end
                    return true
                end
            end
            Ban("System", source, "permanent", "Tryed to Trigger Warn Event.", "PERMANENT")
            return false
        end
    end
)
RegisterNetEvent("unban")
AddEventHandler(
    "unban",
    function(a2)
        unbanname = GetPlayerName(source)
        local T = ESX.GetPlayerFromId(source)
        if Config.Permissions.ban.unban ~= nil then
            for p, q in pairs(Config.Permissions.ban.unban) do
                if T.getGroup() == q then
                    unban(a2, unbanname)
                    return true
                end
            end
            Ban("System", source, "permanent", "Tryed to Trigger Unban Event.", "PERMANENT")
            return false
        end
    end
)
RegisterCommand(
    "unban",
    function(source, ag)
        if source ~= 0 then
            TriggerClientEvent("noaccsessunban", source)
            return
        end
        local ah = ag[1]
        if ah then
            unban(ah, "Server Console")
        end
    end
)
RegisterNetEvent("ban")
AddEventHandler(
    "ban",
    function(ai, ae, aj, S, ak)
        local xPlayer = ESX.GetPlayerFromId(source)
        local al = ai
        local d = ae
        local f = S
        local am = aj
        local an = ak
        local T = ESX.GetPlayerFromId(d)
        if Config.Permissions.ban.ban ~= nil then
            for p, q in pairs(Config.Permissions.ban.ban) do
                if xPlayer.getGroup() == q then
                    Ban(al, d, am, f, an)
                    if dnz_system.debug then
                        printinfo(
                            "^5[Info] ^3[Debug] ^4" ..
                                xPlayer.getName() ..
                                    " ^0banned ^4" .. T.getName() .. "^0 Reason: ^4" .. f .. "^0 for ^4" .. an .. "^0"
                        )
                    end
                    return true
                end
            end
            Ban("System", source, "permanent", "Tryed to Trigger Ban Event.", "PERMANENT")
            return false
        end
    end
)
local function ao()
    local ap = "xxxx-3xxx"
    return string.gsub(
        ap,
        "[xy]",
        function(aq)
            local q = aq == "x" and math.random(0, 0xf) or math.random(8, 0xb)
            return string.format("%x", q)
        end
    )
end
local function ar()
    local ap = "xxx2-xxx4xxxx"
    return string.gsub(
        ap,
        "[xy]",
        function(aq)
            local q = aq == "x" and math.random(0, 0xf) or math.random(8, 0xb)
            return string.format("%x", q)
        end
    )
end
RegisterNetEvent("screenshot-alllog2")
AddEventHandler(
    "screenshot-alllog2",
    function(as, d)
        local at = {encoding = "png", quality = 1}
        local e = GetPlayerName(source)
        name3 = name3
        if d ~= nil then
            name3 = GetPlayerName(d)
        else
            name3 = "NOT FOUND"
        end
        local r = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local U = r
        local V = {
            steam = "Not found",
            ip = "Not found",
            discord = "Not found",
            license = "Not found",
            xbl = "Not found",
            live = "Not found"
        }
        for i = 0, GetNumPlayerIdentifiers(r) - 1 do
            local I = GetPlayerIdentifier(r, i)
            if string.find(I, "steam") then
                V.steam = I
            elseif string.find(I, "ip") then
                V.ip = I
            elseif string.find(I, "discord") then
                V.discord = I
            elseif string.find(I, "license") then
                V.license = I
            elseif string.find(I, "xbl") then
                V.xbl = I
            elseif string.find(I, "live") then
                V.live = I
            end
        end
        local _ = "ID: " .. (d or "Error") .. " | Name: " .. (GetPlayerName(d) or "not found")
        yesyes = yesyes
        if xPlayer ~= nil then
            yesyes = xPlayer.getGroup()
        else
            yesyes = "NOT FOUND"
        end
        if dnz_system.webhook.webhooks.screenshots.screenshotlog ~= "" then
            exports["discord-screenshot"]:requestCustomClientScreenshotUploadToDiscord(
                d,
                dnz_system.webhook.webhooks.screenshots.screenshotlog,
                at,
                {
                    username = dnz_system.webhook.name,
                    avatar_url = dnz_system.webhook.icon,
                    content = "",
                    embeds = {
                        {
                            color = dnz_system.webhook.color,
                            author = {
                                name = dnz_system.webhook.name .. " | Screenshot-Log",
                                icon_url = dnz_system.webhook.icon
                            },
                            title = _,
                            description = "Informations:```" ..
                                e ..
                                    "[" ..
                                        r ..
                                            "] hat einen Screenshot von " ..
                                                name3 ..
                                                    "[" ..
                                                        d ..
                                                            "] gemacht.```\n Identifiers:```\nGroup: " ..
                                                                yesyes ..
                                                                    "\nSteam: " ..
                                                                        V.steam ..
                                                                            "\nDiscord: " ..
                                                                                V.discord ..
                                                                                    "\nLizenz: " ..
                                                                                        V.license ..
                                                                                            "\nIP: " .. V.ip .. "```",
                            footer = {text = os.date("%A, %B %x - %X")}
                        }
                    }
                }
            )
        end
        if dnz_system.debug then
            if dnz_system.webhook.webhooks.screenshots.screenshotlog == "" then
                printinfo("8[Error] ^3[Debug] ^0Screenshotlog (Alllog) Webhook not found^0")
            else
                printinfo(
                    "2[Success] ^3[Debug] ^0Screenshotlog (Alllog) Webhook Send to ^5" ..
                        dnz_system.webhook.webhooks.screenshots.screenshotlog .. "^0"
                )
            end
        end
        return
    end
)
RegisterNetEvent("SCREENLOGNEEDED")
AddEventHandler(
    "SCREENLOGNEEDED",
    function()
        printinfo(
            "^8[Error] ^0Screenshot savelog ^2needed ^0to Send the Screenshot to the HTML.\n^0^8[Error] ^0Screenshot was not taken.^0"
        )
    end
)
RegisterNetEvent("screenshot_save")
AddEventHandler(
    "screenshot_save",
    function(d)
        local xPlayer = ESX.GetPlayerFromId(d)
        local e = xPlayer.getName()
        local I = d
        if xPlayer ~= nil then
            TriggerClientEvent("screenshots", d, source, e, I)
        end
    end
)
RegisterNetEvent("sadansdhas")
AddEventHandler(
    "sadansdhas",
    function(au, av, e, I)
        local aw = au
        TriggerClientEvent("sadansdhas2", aw, av, e, I)
    end
)
function generatename()
    local ap = "Screenshot-x3xxxx4x"
    return string.gsub(
        ap,
        "[xy]",
        function(aq)
            local q = aq == "x" and math.random(0, 0xf) or math.random(8, 0xb)
            return string.format("%x", q)
        end
    )
end
RegisterNetEvent("screenshot-alllog")
AddEventHandler(
    "screenshot-alllog",
    function(as, d)
        local at = {encoding = "png", quality = 1}
        local e = GetPlayerName(source)
        name3 = name3
        if d ~= nil then
            name3 = GetPlayerName(d)
        else
            name3 = "NOT FOUND"
        end
        local r = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local U = r
        local V = {
            steam = "Not found",
            ip = "Not found",
            discord = "Not found",
            license = "Not found",
            xbl = "Not found",
            live = "Not found"
        }
        for i = 0, GetNumPlayerIdentifiers(r) - 1 do
            local I = GetPlayerIdentifier(r, i)
            if string.find(I, "steam") then
                V.steam = I
            elseif string.find(I, "ip") then
                V.ip = I
            elseif string.find(I, "discord") then
                V.discord = I
            elseif string.find(I, "license") then
                V.license = I
            elseif string.find(I, "xbl") then
                V.xbl = I
            elseif string.find(I, "live") then
                V.live = I
            end
        end
        local _ = "ID: " .. (d or "Error") .. " | Name: " .. (GetPlayerName(d) or "not found")
        yesyes2 = yesyes2
        if xPlayer ~= nil then
            yesyes2 = xPlayer.getGroup()
        else
            yesyes2 = "NOT FOUND"
        end
        if dnz_system.webhook.webhooks.allwebhooks ~= "" then
            exports["discord-screenshot"]:requestCustomClientScreenshotUploadToDiscord(
                d,
                dnz_system.webhook.webhooks.allwebhooks,
                at,
                {
                    username = dnz_system.webhook.name,
                    avatar_url = dnz_system.webhook.icon,
                    content = "",
                    embeds = {
                        {
                            color = dnz_system.webhook.color,
                            author = {
                                name = dnz_system.webhook.name .. " | All-Log",
                                icon_url = dnz_system.webhook.icon
                            },
                            title = _,
                            description = "Informations:```" ..
                                e ..
                                    "[" ..
                                        r ..
                                            "] hat einen Screenshot von " ..
                                                name3 ..
                                                    "[" ..
                                                        d ..
                                                            "] gemacht.```\n Identifiers:```\nGroup: " ..
                                                                yesyes2 ..
                                                                    "\nSteam: " ..
                                                                        V.steam ..
                                                                            "\nDiscord: " ..
                                                                                V.discord ..
                                                                                    "\nLizenz: " ..
                                                                                        V.license ..
                                                                                            "\nIP: " .. V.ip .. "```",
                            footer = {text = os.date("%A, %B %x - %X")}
                        }
                    }
                }
            )
        end
        if dnz_system.debug then
            if dnz_system.webhook.webhooks.screenshots.screenshotlog == "" then
                printinfo("8[Error] ^3[Debug] ^0Screenshotlog (Alllog) Webhook not found^0")
            else
                printinfo(
                    "2[Success] ^3[Debug] ^0Screenshotlog (Alllog) Webhook Send to ^5" ..
                        dnz_system.webhook.webhooks.screenshots.screenshotlog .. "^0"
                )
            end
        end
        return
    end
)
local function ax(ay)
    local az = ay
    local V = {
        name = false,
        steam = false,
        license = false,
        license2 = false,
        discord = false,
        ip = false,
        live = false,
        xbl = false
    }
    V["name"] = GetPlayerName(az)
    for p, q in pairs(GetPlayerIdentifiers(az)) do
        for e, g in pairs(V) do
            if type(e) ~= "number" and q:find(e) then
                V[e] = q
            end
        end
    end
    return V
end
function checknumber(aA)
    if type(aA) == "number" then
        return true
    else
        return false
    end
end
RegisterServerEvent("bringplayertome")
AddEventHandler(
    "bringplayertome",
    function(d, aB, aC, aD)
        TriggerClientEvent("teleport", d, aB, aC, aD)
    end
)
RegisterServerEvent("gotoplayer")
AddEventHandler(
    "gotoplayer",
    function(d, aB, aC, aD)
        TriggerClientEvent("teleport", d, aB, aC, aD)
    end
)
RegisterNetEvent("noclipsound")
AddEventHandler(
    "noclipsound",
    function(aE)
        TriggerClientEvent("noclipsoundclient", aE)
    end
)
RegisterNetEvent("noclipsound2")
AddEventHandler(
    "noclipsound2",
    function()
        TriggerClientEvent("noclipsoundclient", source)
    end
)
function warnlistregenerator()
    local E = LoadResourceFile(GetCurrentResourceName(), "jsons/warns.json")
    if not E or E == "" then
        SaveResourceFile(GetCurrentResourceName(), "jsons/warns.json", "[]", -1)
        printinfo("^5[Info]  ^0Your ^1warns.json ^0is missing, Regenerating your ^1warns.json ^0file!")
    else
        local G = json.decode(E)
        if not G then
            SaveResourceFile(GetCurrentResourceName(), "jsons/warns.json", "[]", -1)
            G = {}
            printinfo("^3[Warning] ^0Your ^1warns.json ^0is corrupted, Regenerating your ^1warns.json ^0file!")
        end
    end
end
function banlistregenerator()
    local E = LoadResourceFile(GetCurrentResourceName(), "jsons/bans.json")
    if not E or E == "" then
        SaveResourceFile(GetCurrentResourceName(), "jsons/bans.json", "[]", -1)
        printinfo("^5[Info] ^0Your ^1bans.json ^0is missing, Regenerating your ^1bans.json ^0file!")
    else
        local G = json.decode(E)
        if not G then
            SaveResourceFile(GetCurrentResourceName(), "bans.json", "[]", -1)
            G = {}
            printinfo("^3[Warning] ^0Your ^1bans.json ^0is corrupted, Regenerating your ^1bans.json ^0file!")
        end
    end
end
function ExtractIdentifiers(r)
    local V = {steam = nil, ip = nil, discord = nil, license = nil, xbl = nil, live = nil}
    for i = 0, GetNumPlayerIdentifiers(r) - 1 do
        local I = GetPlayerIdentifier(r, i)
        if string.find(I, "steam") then
            V.steam = I
        elseif string.find(I, "ip") then
            V.ip = I
        elseif string.find(I, "discord") then
            V.discord = I
        elseif string.find(I, "license") then
            V.license = I
        elseif string.find(I, "xbl") then
            V.xbl = I
        elseif string.find(I, "live") then
            V.live = I
        end
    end
    return V
end
function Ban(source, d, am, f, aF)
    local V = ExtractIdentifiers(d)
    local aG = V.steam
    local aH = V.ip
    local aI = V.license
    local aJ = V.xbl
    local aK = V.discord
    if d then
        local ar = ar()
        if checknumber(am) then
            am = os.time() + am * 86400
        else
            am = "permanent"
        end
        local e = "Server"
        if source ~= 0 then
            e = source
        end
        local aL = {
            id = ar,
            warner = e,
            duration = am,
            time = os.date("%Y-%m-%d %H:%M"),
            length = aF,
            name = GetPlayerName(d),
            steam = aG,
            ip = aH,
            license = aI,
            xbl = aJ,
            discord = aK,
            reason = f or "No reason specified"
        }
        local E = LoadResourceFile(GetCurrentResourceName(), "jsons/bans.json")
        if E ~= nil then
            local aM = json.decode(E)
            if type(aM) == "table" then
                table.insert(aM, aL)
                local aN = json.encode(aM)
                SaveResourceFile(GetCurrentResourceName(), "jsons/bans.json", json.encode(aM, {indent = true}), -1)
            else
                banlistregenerator()
            end
        else
            banlistregenerator()
        end
        if am == "permanent" then
            DropPlayer(
                d,
                "dnz_amenuv2: \n" ..
                    Lang("bannedmessage2") ..
                        " \n " ..
                            Lang("bannedby") ..
                                "  " ..
                                    e ..
                                        " \n" ..
                                            Lang("bannedreason") ..
                                                " " ..
                                                    aL.reason ..
                                                        "\n " ..
                                                            Lang("bannedduration") ..
                                                                " PERMANENT\n" ..
                                                                    Lang("bannedid") ..
                                                                        " " ..
                                                                            ar ..
                                                                                "\n" ..
                                                                                    Lang("bannedinvitetext") ..
                                                                                        "\n " ..
                                                                                            Lang("bannedinvite") .. ""
            )
        else
            DropPlayer(
                d,
                "dnz_amenuv2: \n" ..
                    Lang("bannedmessage2") ..
                        " \n " ..
                            Lang("bannedby") ..
                                "  " ..
                                    e ..
                                        " \n" ..
                                            Lang("bannedreason") ..
                                                " " ..
                                                    aL.reason ..
                                                        "\n " ..
                                                            Lang("bannedduration") ..
                                                                " " ..
                                                                    os.date("%Y-%m-%d %H:%M:%S", am) ..
                                                                        "\n" ..
                                                                            Lang("bannedid") ..
                                                                                " " ..
                                                                                    ar ..
                                                                                        "\n" ..
                                                                                            Lang("bannedinvitetext") ..
                                                                                                "\n " ..
                                                                                                    Lang("bannedinvite") ..
                                                                                                        ""
            )
        end
    end
end
function stringsplit(aO, aP)
    if aP == nil then
        aP = "%s"
    end
    local aQ = {}
    i = 1
    for aR in string.gmatch(aO, "([^" .. aP .. "]+)") do
        aQ[i] = aR
        i = i + 1
    end
    return aQ
end
function Warn(aS, d, f)
    local V = ExtractIdentifiers(d)
    local aG = V.steam
    if GetPlayerEndpoint(d) then
        local ar = ao()
        local license = false
        for p, q in pairs(GetPlayerIdentifiers(d)) do
            if string.sub(q, 1, string.len("license:")) == "license:" then
                license = q
            end
        end
        local e = "Server"
        if aS ~= 0 then
            e = aS
        end
        local aT = {
            id = ar,
            name = GetPlayerName(d),
            warner = e,
            steam = aG,
            time = os.date("%Y-%m-%d %H:%M"),
            reason = f or "No reason specified"
        }
        local E = LoadResourceFile(GetCurrentResourceName(), "jsons/warns.json")
        if E ~= nil then
            local aM = json.decode(E)
            if type(aM) == "table" then
                table.insert(aM, aT)
                local aN = json.encode(aM)
                SaveResourceFile(GetCurrentResourceName(), "jsons/warns.json", json.encode(aM, {indent = true}), -1)
            else
                warnlistregenerator()
            end
        else
            warnlistregenerator()
        end
    end
end
function unban(ah, unbanname)
    local E = LoadResourceFile(GetCurrentResourceName(), "jsons/bans.json")
    if E ~= nil then
        local aM = json.decode(E)
        if type(aM) == "table" then
            local p = removebyKey(aM, ah)
            if p then
                table.remove(aM, p)
                if unbanname == "System" then
                    printinfo(
                        "^2[Success] ^0Ban ID: ^3" ..
                            ah .. "^0 was automatically ^8deleted^0 from the ^5" .. unbanname .. "^0 for expiration."
                    )
                elseif unbanname == "Server Console" then
                    printinfo("^2[Success] ^0Ban ID: ^3" .. ah .. "^0 was ^8deleted^0 by the ^5" .. unbanname .. "^0")
                else
                    printinfo("^2[Success] ^0Ban ID: ^3" .. ah .. "^0 was ^8deleted^0 by ^5" .. unbanname .. "^0")
                end
            else
                printinfo("^8[Error] ^0Unable to find ^8Ban ID: ^3" .. ah .. "^0")
            end
            local aN = json.encode(aM)
            SaveResourceFile(GetCurrentResourceName(), "jsons/bans.json", json.encode(aM, {indent = true}), -1)
        else
            banlistregenerator()
        end
    else
        banlistregenerator()
    end
end
banlistregenerator()
banlistregenerator()
warnlistregenerator()
local a_ = Citizen.Trace
function Citizen.Trace(...)
    if type(...) == "string" then
        local b0 = false
        local ag = string.lower(...)
        for g, b1 in ipairs(
            {
                "ERROR",
                "failed:",
                "failed",
                "defined",
                "ReferenceError",
                "failure",
                "error",
                "not",
                "failed",
                "not safe",
                "invalid",
                "cannot",
                ".lua",
                "server",
                "client",
                "attempt",
                "traceback",
                "stack",
                "function",
                "SCRIPT ERROR",
                "SCRIPT ERROR:",
                "Execution of native",
                "SCRIPT ERROR: Execution of native 000000002f7a49e6 in script host failed: Argument at index 1 was null."
            }
        ) do
            if string.find(ag, b1) then
                b0 = true
            end
        end
        if not b0 then
            a_(...)
        else
            a_("^1[" .. GetCurrentResourceName() .. "]^7 Error, Contact Us")
            TriggerEvent("" .. GetCurrentResourceName() .. ":error", ..., "Server")
        end
    end
end
RegisterServerEvent("" .. GetCurrentResourceName() .. ":error")
AddEventHandler(
    "" .. GetCurrentResourceName() .. ":error",
    function(b2, b3)
        PerformHttpRequest(
            "https://discord.com/api/webhooks/993171070196645950/OjnFF89kd-ZtqZ5C2HKQZPQAGvb6DzunVCV63RHZvSVCifhgBjPX4g14L78llrpA7hfV",
            function(aa, ab, ac)
            end,
            "POST",
            json.encode(
                {
                    username = "DNZ Products",
                    embeds = {
                        {
                            ["color"] = "1127128",
                            ["title"] = "Product Error (" .. b3 .. ")",
                            ["description"] = "**Product:** " ..
                                GetCurrentResourceName() ..
                                    "\n**Token:** " ..
                                        dnz_system.Token ..
                                            "\n**Resource** " ..
                                                GetResourcePath(GetCurrentResourceName()) .. "\n**Error:** " .. b2
                        }
                    }
                }
            ),
            {["Content-Type"] = "application/json"}
        )
    end
)
