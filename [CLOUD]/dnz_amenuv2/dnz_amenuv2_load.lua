local a = false
local b = false
local c = false
local d = false
local e = false
local f = false
local g = Config.Lang
local h = false
local i = false
local j = "user"
ESX = nil
Citizen.CreateThread(
    function()
        while ESX == nil do
            TriggerEvent(
                "" .. dnz_system.getSharedObject .. "",
                function(k)
                    ESX = k
                end
            )
            Citizen.Wait(0)
            SetLang()
        end
    end
)
function SetLang()
    SendNUIMessage({type = "setlang", table = Config.Language, current = Config.Lang})
end
Lang = function(l)
    local m = Config.Language[Config.Lang]
    if m and m[l] then
        return m[l]
    end
    return l
end
RegisterNetEvent("dnz_amenuv2:notify")
AddEventHandler(
    "dnz_amenuv2:notify",
    function(source, n, o)
        if Config.builtinnotify ~= nil then
            if Config.builtinnotify then
                SendNUIMessage({type = "notify", title = n, message = o})
                PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
            else
                Config.ownnotify(n, o)
            end
        else
            SendNUIMessage({type = "notify", title = n, message = o})
            PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
        end
    end
)
function xx(p)
    display = p
    SetNuiFocus(p, p)
    if display == true then
        StartScreenEffect(blur, 1, 0)
        SendNUIMessage({type = "open"})
    else
        Citizen.Wait(500)
        StopScreenEffect(blur)
    end
end
RegisterCommand(
    "" .. Config.Amenu.openmenucommand .. "",
    function()
        if not IsPauseMenuActive() then
            ESX.TriggerServerCallback(
                "dnz_amenuv2:getCurrentInfo",
                function(q)
                    j = q.admingroup
                    for r, s in pairs(Config.Permissions.openmenu) do
                        if s == q.admingroup then
                            SetLang()
                            local t = q.admingroup
                            checkmf()
                            Citizen.Wait(100)
                            groupnames(t)
                            SendNUIMessage(
                                {
                                    action = "infos",
                                    name = GetPlayerName(PlayerId()),
                                    money = q.money,
                                    bankmoney = q.bankmoney,
                                    job = string.upper(q.myjob)
                                }
                            )
                            xx(true)
                            return true
                        end
                    end
                    return false
                end
            )
        end
    end
)
RegisterNetEvent("sendgroups")
AddEventHandler(
    "sendgroups",
    function(u)
        SendNUIMessage({action = "infos", group = u})
    end
)
function checkmf()
    if Config.Permissions.aduty ~= nil then
        for r, s in ipairs(Config.Permissions.aduty) do
            if s == j then
                SendNUIMessage({action = "aduty"})
            end
        end
    end
    if Config.Permissions.deleteallcars ~= nil then
        for r, s in ipairs(Config.Permissions.deleteallcars) do
            if s == j then
                SendNUIMessage({action = "delcars"})
            end
        end
    end
    if Config.Permissions.tpm ~= nil then
        for r, s in ipairs(Config.Permissions.tpm) do
            if s == j then
                SendNUIMessage({action = "tpm"})
            end
        end
    end
    if Config.Permissions.spawnvehicle ~= nil then
        for r, s in ipairs(Config.Permissions.spawnvehicle) do
            if s == j then
                SendNUIMessage({action = "spawnvehiclecheck"})
            end
        end
    end
    if Config.Permissions.fulltunevehicle ~= nil then
        for r, s in ipairs(Config.Permissions.fulltunevehicle) do
            if s == j then
                SendNUIMessage({action = "fullvehiclecheck"})
            end
        end
    end
    if Config.Permissions.godmodevehicle ~= nil then
        for r, s in ipairs(Config.Permissions.godmodevehicle) do
            if s == j then
                SendNUIMessage({action = "godvehiclecheck"})
            end
        end
    end
    if Config.Permissions.noclip ~= nil then
        for r, s in ipairs(Config.Permissions.noclip) do
            if s == j then
                SendNUIMessage({action = "noclipcheck"})
            end
        end
    end
    if Config.Permissions.revivesomeone ~= nil then
        for r, s in ipairs(Config.Permissions.revivesomeone) do
            if s == j then
                SendNUIMessage({action = "revivecheck2"})
            end
        end
    end
    if Config.Permissions.gotosomeone ~= nil then
        for r, s in ipairs(Config.Permissions.gotosomeone) do
            if s == j then
                SendNUIMessage({action = "gotocheck"})
            end
        end
    end
    if Config.Permissions.bring ~= nil then
        for r, s in ipairs(Config.Permissions.bring) do
            if s == j then
                SendNUIMessage({action = "bringcheck"})
            end
        end
    end
    if Config.Permissions.screenshot ~= nil then
        for r, s in ipairs(Config.Permissions.screenshot) do
            if s == j then
                SendNUIMessage({action = "screenshotcheck"})
            end
        end
    end
    if Config.Permissions.spectate ~= nil then
        for r, s in ipairs(Config.Permissions.spectate) do
            if s == j then
                SendNUIMessage({action = "spectatecheck"})
            end
        end
    end
    if Config.Permissions.kick ~= nil then
        for r, s in ipairs(Config.Permissions.kick) do
            if s == j then
                SendNUIMessage({action = "kickcheck"})
            end
        end
    end
    if Config.Permissions.warn ~= nil then
        for r, s in ipairs(Config.Permissions.warn) do
            if s == j then
                SendNUIMessage({action = "warncheck"})
            end
        end
    end
    if Config.Permissions.ban.ban ~= nil then
        for r, s in ipairs(Config.Permissions.ban.ban) do
            if s == j then
                SendNUIMessage({action = "bancheck"})
            end
        end
    end
    if Config.Permissions.suicide ~= nil then
        for r, s in ipairs(Config.Permissions.suicide) do
            if s == j then
                SendNUIMessage({action = "suicidecheck"})
            end
        end
    end
    if Config.Permissions.reviveself ~= nil then
        for r, s in ipairs(Config.Permissions.reviveself) do
            if s == j then
                SendNUIMessage({action = "revivecheck"})
            end
        end
    end
    if Config.Permissions.invisible ~= nil then
        for r, s in ipairs(Config.Permissions.invisible) do
            if s == j then
                SendNUIMessage({action = "invisiblecheck"})
            end
        end
    end
    if Config.Permissions.armourself ~= nil then
        for r, s in ipairs(Config.Permissions.armourself) do
            if s == j then
                SendNUIMessage({action = "armourcheck"})
            end
        end
    end
    if Config.Permissions.godmode ~= nil then
        for r, s in ipairs(Config.Permissions.godmode) do
            if s == j then
                SendNUIMessage({action = "godmodecheck"})
            end
        end
    end
    if Config.Permissions.allweapons ~= nil then
        for r, s in ipairs(Config.Permissions.allweapons) do
            if s == j then
                SendNUIMessage({action = "allweaponscheck"})
            end
        end
    end
    if Config.Permissions.removeallweapons ~= nil then
        for r, s in ipairs(Config.Permissions.removeallweapons) do
            if s == j then
                SendNUIMessage({action = "remweaponscheck"})
            end
        end
    end
    if Config.Permissions.healself ~= nil then
        for r, s in ipairs(Config.Permissions.healself) do
            if s == j then
                SendNUIMessage({action = "healcheck"})
            end
        end
    end
    if Config.Permissions.espall ~= nil then
        for r, s in ipairs(Config.Permissions.espall) do
            if s == j then
                SendNUIMessage({action = "espall"})
            end
        end
    end
    if Config.Permissions.espnames ~= nil then
        for r, s in ipairs(Config.Permissions.espnames) do
            if s == j then
                SendNUIMessage({action = "espnames"})
            end
        end
    end
    if Config.Permissions.espinfo ~= nil then
        for r, s in ipairs(Config.Permissions.espinfo) do
            if s == j then
                SendNUIMessage({action = "espinfo"})
            end
        end
    end
    if Config.Permissions.espbox ~= nil then
        for r, s in ipairs(Config.Permissions.espbox) do
            if s == j then
                SendNUIMessage({action = "espbox"})
            end
        end
    end
    if Config.Permissions.esplines ~= nil then
        for r, s in ipairs(Config.Permissions.esplines) do
            if s == j then
                SendNUIMessage({action = "esplines"})
            end
        end
    end
    if Config.Permissions.espdebug ~= nil then
        for r, s in ipairs(Config.Permissions.espdebug) do
            if s == j then
                SendNUIMessage({action = "espdebug"})
            end
        end
    end
    if Config.Permissions.flipvehicle ~= nil then
        for r, s in ipairs(Config.Permissions.flipvehicle) do
            if s == j then
                SendNUIMessage({action = "flipvehiclecheck"})
            end
        end
    end
    if Config.Permissions.deleteallobjects ~= nil then
        for r, s in ipairs(Config.Permissions.deleteallobjects) do
            if s == j then
                SendNUIMessage({action = "delobj"})
            end
        end
    end
    if Config.Permissions.tpc ~= nil then
        for r, s in ipairs(Config.Permissions.tpc) do
            if s == j then
                SendNUIMessage({action = "tpc"})
            end
        end
    end
    if Config.Permissions.deleteallpeds ~= nil then
        for r, s in ipairs(Config.Permissions.deleteallpeds) do
            if s == j then
                SendNUIMessage({action = "delpeds"})
            end
        end
    end
    if Config.Permissions.reviveall ~= nil then
        for r, s in ipairs(Config.Permissions.reviveall) do
            if s == j then
                SendNUIMessage({action = "reviveall"})
            end
        end
    end
    if Config.Permissions.kickall ~= nil then
        for r, v in ipairs(Config.Permissions.kickall) do
            if j == v then
                SendNUIMessage({action = "dno"})
            end
        end
    end
    if Config.Permissions.giveitem ~= nil then
        for r, s in ipairs(Config.Permissions.giveitem) do
            if s == j then
                SendNUIMessage({action = "giveitem"})
            end
        end
    end
    if Config.Permissions.giveweapon ~= nil then
        for r, s in ipairs(Config.Permissions.giveweapon) do
            if s == j then
                SendNUIMessage({action = "giveweapon"})
            end
        end
    end
    if Config.Permissions.givemoney ~= nil then
        for r, s in ipairs(Config.Permissions.givemoney) do
            if s == j then
                SendNUIMessage({action = "givemoney"})
            end
        end
    end
    if Config.Permissions.deletevehicle ~= nil then
        for r, s in ipairs(Config.Permissions.deletevehicle) do
            if s == j then
                SendNUIMessage({action = "deletevehiclecheck"})
            end
        end
    end
    if Config.Permissions.freeze ~= nil then
        for r, s in ipairs(Config.Permissions.freeze) do
            if s == j then
                SendNUIMessage({action = "freezecheck"})
            end
        end
    end
    if Config.Permissions.repairvehicle ~= nil then
        for r, s in ipairs(Config.Permissions.repairvehicle) do
            if s == j then
                SendNUIMessage({action = "repvehiclecheck"})
            end
        end
    end
end
RegisterNetEvent("noreason")
AddEventHandler(
    "noreason",
    function(source)
        if Config.builtinnotify ~= nil then
            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("noreason"))
        else
            if Config.ownnotify.notifycolor ~= nil and not false then
                TriggerEvent(
                    Config.ownnotify.trigger,
                    source,
                    Config.ownnotify.color,
                    Config.ownnotify.title,
                    Lang("noreason")
                )
            else
                TriggerEvent(Config.ownnotify.trigger, source, Config.ownnotify.title, Lang("noreason"))
            end
        end
    end
)
RegisterNUICallback(
    "close",
    function(w)
        xx(not display)
    end
)
RegisterNUICallback(
    "chetos",
    function(w)
        if w.type == "all" then
            if Config.Amenu.needtobeinaduty ~= nil then
                if Config.Amenu.needtobeinaduty then
                    if b then
                        esp = not esp
                    else
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            end
                        end
                    end
                else
                    esp = not esp
                end
            end
        elseif w.type == "names" then
            if Config.Amenu.needtobeinaduty ~= nil then
                if Config.Amenu.needtobeinaduty then
                    if b then
                        nameabove = not nameabove
                    else
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            end
                        end
                    end
                else
                    nameabove = not nameabove
                end
            end
        elseif w.type == "info" then
            if Config.Amenu.needtobeinaduty ~= nil then
                if Config.Amenu.needtobeinaduty then
                    if b then
                        espinfo = not espinfo
                    else
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            end
                        end
                    end
                else
                    espinfo = not espinfo
                end
            end
        elseif w.type == "box" then
            if Config.Amenu.needtobeinaduty ~= nil then
                if Config.Amenu.needtobeinaduty then
                    if b then
                        espbox = not espbox
                    else
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            end
                        end
                    end
                else
                    espbox = not espbox
                end
            end
        elseif w.type == "lines" then
            if Config.Amenu.needtobeinaduty ~= nil then
                if Config.Amenu.needtobeinaduty then
                    if b then
                        esplines = not esplines
                    else
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            end
                        end
                    end
                else
                    esplines = not esplines
                end
            end
        elseif w.type == "debug" then
            if Config.Amenu.needtobeinaduty ~= nil then
                if Config.Amenu.needtobeinaduty then
                    if b then
                        a = not a
                    else
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            end
                        end
                    end
                else
                    a = not a
                end
            end
        end
    end
)
RegisterCommand(
    "" .. Config.Amenu.vanishcommand .. "",
    function(source, x)
        ESX.TriggerServerCallback(
            "dnz_amenuv2:getCurrentInfo",
            function(q)
                for r, v in pairs(Config.Permissions.invisible) do
                    if v == q.admingroup then
                        f = not f
                        if f then
                            SetEntityVisible(PlayerPedId(), false, false)
                        end
                        if not f then
                            SetEntityVisible(PlayerPedId(), true, false)
                        end
                        return true
                    end
                end
                return false
            end
        )
    end
)
local y = {
    "dagger",
    "bat",
    "bottle",
    "crowbar",
    "flashlight",
    "golfclub",
    "hammer",
    "hatchet",
    "knuckle",
    "knife",
    "machete",
    "switchblade",
    "nightstick",
    "wrench",
    "battleaxe",
    "poolcue",
    "stone_hatchet",
    "pistol",
    "pistol_mk2",
    "combatpistol",
    "appistol",
    "stungun",
    "pistol50",
    "snspistol",
    "snspistol_mk2",
    "heavypistol",
    "vintagepistol",
    "flaregun",
    "marksmanpistol",
    "revolver",
    "revolver_mk2",
    "doubleaction",
    "raypistol",
    "ceramicpistol",
    "navyrevolver",
    "microsmg",
    "smg",
    "smg_mk2",
    "assaultsmg",
    "combatpdw",
    "machinepistol",
    "minismg",
    "raycarbine",
    "pumpshotgun",
    "pumpshotgun_mk2",
    "sawnoffshotgun",
    "assaultshotgun",
    "bullpupshotgun",
    "musket",
    "heavyshotgun",
    "dbshotgun",
    "autoshotgun",
    "assaultrifle",
    "assaultrifle_mk2",
    "carbinerifle",
    "carbinerifle_mk2",
    "advancedrifle",
    "specialcarbine",
    "specialcarbine_mk2",
    "bullpuprifle",
    "bullpuprifle_mk2",
    "compactrifle",
    "mg",
    "combatmg",
    "combatmg_mk2",
    "gusenberg",
    "sniperrifle",
    "heavysniper",
    "heavysniper_mk2",
    "marksmanrifle",
    "marksmanrifle_mk2",
    "rpg",
    "grenadelauncher",
    "grenadelauncher_smoke",
    "minigun",
    "firework",
    "railgun",
    "hominglauncher",
    "compactlauncher",
    "rayminigun",
    "grenade",
    "bzgas",
    "smokegrenade",
    "flare",
    "molotov",
    "stickybomb",
    "proxmine",
    "snowball",
    "pipebomb",
    "ball",
    "petrolcan",
    "fireextinguisher",
    "hazardcan"
}
RegisterNUICallback(
    "cheetosbtn",
    function(w)
        if w.type == "noclip" then
            if Config.Amenu.needtobeinaduty ~= nil then
                if Config.Amenu.needtobeinaduty then
                    if b then
                        TriggerEvent("noclipped")
                    else
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            end
                        end
                    end
                else
                    TriggerEvent("noclipped")
                end
            end
        elseif w.type == "suicide" then
            if Config.Amenu.needtobeinaduty ~= nil then
                if Config.Amenu.needtobeinaduty then
                    if b then
                        SetEntityHealth(PlayerPedId(), 0)
                    else
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            end
                        end
                    end
                else
                    SetEntityHealth(PlayerPedId(), 0)
                end
            end
        elseif w.type == "revive" then
            if Config.Amenu.needtobeinaduty ~= nil then
                if Config.Amenu.needtobeinaduty then
                    if b then
                        TriggerServerEvent("rev")
                        TriggerServerEvent("logrevself")
                    else
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            end
                        end
                    end
                else
                    TriggerServerEvent("rev")
                    TriggerServerEvent("logrevself")
                end
            end
        elseif w.type == "invisible" then
            if Config.Amenu.needtobeinaduty ~= nil then
                if Config.Amenu.needtobeinaduty then
                    if b then
                        f = not f
                        if f then
                            SetEntityVisible(PlayerPedId(), false, 0)
                        end
                        if not f then
                            SetEntityVisible(PlayerPedId(), true, 0)
                        end
                    else
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            end
                        end
                    end
                else
                    f = not f
                    if f then
                        SetEntityVisible(PlayerPedId(), false, 0)
                    end
                    if not f then
                        SetEntityVisible(PlayerPedId(), true, 0)
                    end
                end
            end
        elseif w.type == "heal" then
            if Config.Amenu.needtobeinaduty ~= nil then
                if Config.Amenu.needtobeinaduty then
                    if b then
                        TriggerServerEvent("loghealself")
                        if IsPedMale(PlayerPedId()) then
                            SetEntityHealth(PlayerPedId(), 200)
                        else
                            SetEntityHealth(PlayerPedId(), 100)
                        end
                    else
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            end
                        end
                    end
                else
                    TriggerServerEvent("loghealself")
                    if IsPedMale(PlayerPedId()) then
                        SetEntityHealth(PlayerPedId(), 200)
                    else
                        SetEntityHealth(PlayerPedId(), 100)
                    end
                end
            end
        elseif w.type == "armour" then
            if Config.Amenu.needtobeinaduty ~= nil then
                if Config.Amenu.needtobeinaduty then
                    if b then
                        SetPedArmour(PlayerPedId(), 100)
                        TriggerServerEvent("loggivearmour")
                    else
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            end
                        end
                    end
                else
                    SetPedArmour(PlayerPedId(), 100)
                    TriggerServerEvent("loggivearmour")
                end
            end
        elseif w.type == "godmode" then
            if Config.Amenu.needtobeinaduty ~= nil then
                if Config.Amenu.needtobeinaduty then
                    if b then
                        if GodModes then
                            if Config.builtinnotify ~= nil then
                                TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notgodmode"))
                            else
                                if Config.ownnotify.notifycolor ~= nil and not false then
                                    TriggerEvent(
                                        Config.ownnotify.trigger,
                                        source,
                                        Config.ownnotify.color,
                                        Config.ownnotify.title,
                                        Lang("notgodmode")
                                    )
                                else
                                    TriggerEvent(
                                        Config.ownnotify.trigger,
                                        source,
                                        Config.ownnotify.title,
                                        Lang("notgodmode")
                                    )
                                end
                            end
                            GodModes = false
                        elseif GodModes == nil or GodModes == false then
                            GodModes = true
                            if Config.builtinnotify ~= nil then
                                TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("godmode"))
                            else
                                if Config.ownnotify.notifycolor ~= nil and not false then
                                    TriggerEvent(
                                        Config.ownnotify.trigger,
                                        source,
                                        Config.ownnotify.color,
                                        Config.ownnotify.title,
                                        Lang("godmode")
                                    )
                                else
                                    TriggerEvent(
                                        Config.ownnotify.trigger,
                                        source,
                                        Config.ownnotify.title,
                                        Lang("godmode")
                                    )
                                end
                            end
                        end
                    else
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            end
                        end
                    end
                else
                    if GodModes then
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notgodmode"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("notgodmode")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("notgodmode")
                                )
                            end
                        end
                        GodModes = false
                    elseif GodModes == nil or GodModes == false then
                        GodModes = true
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("godmode"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("godmode")
                                )
                            else
                                TriggerEvent(Config.ownnotify.trigger, source, Config.ownnotify.title, Lang("godmode"))
                            end
                        end
                    end
                end
            end
        elseif w.type == "allweap" then
            if Config.Amenu.needtobeinaduty ~= nil then
                if Config.Amenu.needtobeinaduty then
                    if b then
                        for r, v in ipairs(y) do
                            local z = "weapon_" .. v
                            TriggerServerEvent("giveallweapons", z:upper(), 100)
                        end
                        TriggerServerEvent("logallweapons")
                    else
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            end
                        end
                    end
                else
                    for r, v in ipairs(y) do
                        local z = "weapon_" .. v
                        TriggerServerEvent("giveallweapons", z:upper(), 100)
                    end
                    TriggerServerEvent("logallweapons")
                end
            end
        elseif w.type == "rmvweap" then
            if Config.Amenu.needtobeinaduty ~= nil then
                if Config.Amenu.needtobeinaduty then
                    if b then
                        RemoveAllPedWeapons(PlayerPedId(), true)
                    else
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            end
                        end
                    end
                else
                    RemoveAllPedWeapons(PlayerPedId(), true)
                end
            end
        end
    end
)
RegisterNUICallback(
    "giveitem",
    function(w)
        local A = w.itemcount
        local B = w.itemname
        if string.len(A) < 1 then
            if Config.builtinnotify ~= nil then
                TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("noinput"))
            else
                if Config.ownnotify.notifycolor ~= nil and not false then
                    TriggerEvent(
                        Config.ownnotify.trigger,
                        source,
                        Config.ownnotify.color,
                        Config.ownnotify.title,
                        Lang("noinput")
                    )
                else
                    TriggerEvent(Config.ownnotify.trigger, source, Config.ownnotify.title, Lang("noinput"))
                end
            end
        elseif string.len(B) < 1 then
            if Config.builtinnotify ~= nil then
                TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("noinput"))
            else
                if Config.ownnotify.notifycolor ~= nil and not false then
                    TriggerEvent(
                        Config.ownnotify.trigger,
                        source,
                        Config.ownnotify.color,
                        Config.ownnotify.title,
                        Lang("noinput")
                    )
                else
                    TriggerEvent(Config.ownnotify.trigger, source, Config.ownnotify.title, Lang("noinput"))
                end
            end
        else
            if Config.Amenu.needtobeinaduty ~= nil then
                if Config.Amenu.needtobeinaduty then
                    if b then
                        TriggerServerEvent("loggiveitem", A, B)
                        TriggerServerEvent("giveitem", A, B)
                    else
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            end
                        end
                    end
                else
                    TriggerServerEvent("loggiveitem", A, B)
                    TriggerServerEvent("giveitem", A, B)
                end
            end
        end
    end
)
RegisterNUICallback(
    "giveweapon",
    function(w)
        local C = tonumber(w.weaponammo)
        local D = w.weaponname
        if string.len(w.weaponammo) < 1 then
            if Config.builtinnotify ~= nil then
                TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("noinput"))
            else
                if Config.ownnotify.notifycolor ~= nil and not false then
                    TriggerEvent(
                        Config.ownnotify.trigger,
                        source,
                        Config.ownnotify.color,
                        Config.ownnotify.title,
                        Lang("noinput")
                    )
                else
                    TriggerEvent(Config.ownnotify.trigger, source, Config.ownnotify.title, Lang("noinput"))
                end
            end
        elseif string.len(D) < 1 then
            if Config.builtinnotify ~= nil then
                TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("noinput"))
            else
                if Config.ownnotify.notifycolor ~= nil and not false then
                    TriggerEvent(
                        Config.ownnotify.trigger,
                        source,
                        Config.ownnotify.color,
                        Config.ownnotify.title,
                        Lang("noinput")
                    )
                else
                    TriggerEvent(Config.ownnotify.trigger, source, Config.ownnotify.title, Lang("noinput"))
                end
            end
        else
            if Config.Amenu.needtobeinaduty ~= nil then
                if Config.Amenu.needtobeinaduty then
                    if b then
                        TriggerServerEvent("giveweapon", C, D)
                        Citizen.Wait(100)
                        SetCurrentPedWeapon(GetPlayerPed(), GetHashKey(D))
                        Citizen.Wait(100)
                        SetPedAmmo(playerPed, D, C)
                    else
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            end
                        end
                    end
                else
                    TriggerServerEvent("giveweapon", C, D)
                    Citizen.Wait(100)
                    SetCurrentPedWeapon(GetPlayerPed(), GetHashKey(D))
                    Citizen.Wait(100)
                    SetPedAmmo(playerPed, D, C)
                end
            end
        end
    end
)
RegisterNetEvent("tptocoordsgoto")
AddEventHandler(
    "tptocoordsgoto",
    function(E, F, G)
        SetEntityCoords(PlayerPedId(), E, F, G)
    end
)
RegisterNUICallback(
    "givemoney",
    function(w)
        local H = tonumber(w.moneyamount)
        local I = w.typ
        if string.len(w.moneyamount) < 1 then
            if Config.builtinnotify ~= nil then
                TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("noinput"))
            else
                if Config.ownnotify.notifycolor ~= nil and not false then
                    TriggerEvent(
                        Config.ownnotify.trigger,
                        source,
                        Config.ownnotify.color,
                        Config.ownnotify.title,
                        Lang("noinput")
                    )
                else
                    TriggerEvent(Config.ownnotify.trigger, source, Config.ownnotify.title, Lang("noinput"))
                end
            end
        else
            if Config.Amenu.needtobeinaduty ~= nil then
                if Config.Amenu.needtobeinaduty then
                    if b then
                        TriggerServerEvent("loggivemoney", I, H)
                        if I == "cash" then
                            TriggerServerEvent("givemoney", H)
                        elseif I == "bank" then
                            TriggerServerEvent("givemoneybank", H)
                        elseif I == "black" then
                            TriggerServerEvent("givemoneyblack", H)
                        end
                    else
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            end
                        end
                    end
                else
                    TriggerServerEvent("loggivemoney", I, H)
                    if I == "cash" then
                        TriggerServerEvent("givemoney", H)
                    elseif I == "bank" then
                        TriggerServerEvent("givemoneybank", H)
                    elseif I == "black" then
                        TriggerServerEvent("givemoneyblack", H)
                    end
                end
            end
        end
    end
)
RegisterNUICallback(
    "adminbtn",
    function(w)
        if w.type == "aduty" then
            TriggerEvent("aduty")
        elseif w.type == "delcars" then
            if Config.Amenu.needtobeinaduty ~= nil then
                if Config.Amenu.needtobeinaduty then
                    if b then
                        TriggerServerEvent("cleanareaveh")
                        TriggerServerEvent("logdelallcars")
                    else
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            end
                        end
                    end
                else
                    TriggerServerEvent("cleanareaveh")
                    TriggerServerEvent("logdelallcars")
                end
            end
        elseif w.type == "delobj" then
            if Config.Amenu.needtobeinaduty ~= nil then
                if Config.Amenu.needtobeinaduty then
                    if b then
                        TriggerServerEvent("cleanareaentity")
                        TriggerServerEvent("logdelobjects")
                    else
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            end
                        end
                    end
                else
                    TriggerServerEvent("cleanareaentity")
                    TriggerServerEvent("logdelobjects")
                end
            end
        elseif w.type == "tpc" then
            if Config.Amenu.needtobeinaduty ~= nil then
                if Config.Amenu.needtobeinaduty then
                    if b then
                        local E = tonumber(w.x .. ".0")
                        local F = tonumber(w.y .. ".0")
                        local G = tonumber(w.z .. ".0")
                        local ped = PlayerPedId()
                        if w.x == "" then
                            if Config.builtinnotify ~= nil then
                                TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("noinput"))
                            else
                                if Config.ownnotify.notifycolor ~= nil and not false then
                                    TriggerEvent(
                                        Config.ownnotify.trigger,
                                        source,
                                        Config.ownnotify.color,
                                        Config.ownnotify.title,
                                        Lang("noinput")
                                    )
                                else
                                    TriggerEvent(
                                        Config.ownnotify.trigger,
                                        source,
                                        Config.ownnotify.title,
                                        Lang("noinput")
                                    )
                                end
                            end
                        elseif w.y == "" then
                            if Config.builtinnotify ~= nil then
                                TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("noinput"))
                            else
                                if Config.ownnotify.notifycolor ~= nil and not false then
                                    TriggerEvent(
                                        Config.ownnotify.trigger,
                                        source,
                                        Config.ownnotify.color,
                                        Config.ownnotify.title,
                                        Lang("noinput")
                                    )
                                else
                                    TriggerEvent(
                                        Config.ownnotify.trigger,
                                        source,
                                        Config.ownnotify.title,
                                        Lang("noinput")
                                    )
                                end
                            end
                        elseif w.z == "" then
                            if Config.builtinnotify ~= nil then
                                TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("noinput"))
                            else
                                if Config.ownnotify.notifycolor ~= nil and not false then
                                    TriggerEvent(
                                        Config.ownnotify.trigger,
                                        source,
                                        Config.ownnotify.color,
                                        Config.ownnotify.title,
                                        Lang("noinput")
                                    )
                                else
                                    TriggerEvent(
                                        Config.ownnotify.trigger,
                                        source,
                                        Config.ownnotify.title,
                                        Lang("noinput")
                                    )
                                end
                            end
                        else
                            SetEntityCoords(ped, E, F, G, false, false, false, true)
                        end
                    else
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            end
                        end
                    end
                else
                    local E = tonumber(w.x .. ".0")
                    local F = tonumber(w.y .. ".0")
                    local G = tonumber(w.z .. ".0")
                    local ped = PlayerPedId()
                    if w.x == "" then
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("noinput"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("noinput")
                                )
                            else
                                TriggerEvent(Config.ownnotify.trigger, source, Config.ownnotify.title, Lang("noinput"))
                            end
                        end
                    elseif w.y == "" then
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("noinput"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("noinput")
                                )
                            else
                                TriggerEvent(Config.ownnotify.trigger, source, Config.ownnotify.title, Lang("noinput"))
                            end
                        end
                    elseif w.z == "" then
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("noinput"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("noinput")
                                )
                            else
                                TriggerEvent(Config.ownnotify.trigger, source, Config.ownnotify.title, Lang("noinput"))
                            end
                        end
                    else
                        SetEntityCoords(ped, E, F, G, false, false, false, true)
                    end
                end
            end
        elseif w.type == "tpm" then
            if Config.Amenu.needtobeinaduty ~= nil then
                if Config.Amenu.needtobeinaduty then
                    if b then
                        TeleportToWaypoint()
                    else
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            end
                        end
                    end
                else
                    TeleportToWaypoint()
                end
            end
        elseif w.type == "delpeds" then
            if Config.Amenu.needtobeinaduty ~= nil then
                if Config.Amenu.needtobeinaduty then
                    if b then
                        TriggerServerEvent("cleanareapeds")
                        TriggerServerEvent("logdelpeds")
                    else
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            end
                        end
                    end
                else
                    TriggerServerEvent("cleanareapeds")
                    TriggerServerEvent("logdelpeds")
                end
            end
        elseif w.type == "revall" then
            if Config.Amenu.needtobeinaduty ~= nil then
                if Config.Amenu.needtobeinaduty then
                    if b then
                        TriggerServerEvent("revall")
                        TriggerServerEvent("logrevall")
                    else
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            end
                        end
                    end
                else
                    TriggerServerEvent("revall")
                    TriggerServerEvent("logrevall")
                end
            end
        elseif w.type == "kickall" then
            if Config.Amenu.needtobeinaduty ~= nil then
                if Config.Amenu.needtobeinaduty then
                    if b then
                        TriggerServerEvent("logkickall")
                        if g == "de" then
                            TriggerServerEvent(
                                "kickall",
                                "Du wurdest von " ..
                                    GetPlayerName(PlayerId()) .. " gekickt\n Grund: Alle Spieler wurden gekickt."
                            )
                        elseif g == "en" then
                            TriggerServerEvent(
                                "kickall",
                                "You got kicked by " ..
                                    GetPlayerName(PlayerId()) .. " \n Reason: All Players got kicked."
                            )
                        end
                    else
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            end
                        end
                    end
                else
                    TriggerServerEvent("logkickall")
                    if g == "de" then
                        TriggerServerEvent(
                            "kickall",
                            "Du wurdest von " ..
                                GetPlayerName(PlayerId()) .. " gekickt\n Grund: Alle Spieler wurden gekickt."
                        )
                    elseif g == "en" then
                        TriggerServerEvent(
                            "kickall",
                            "You got kicked by " .. GetPlayerName(PlayerId()) .. " \n Reason: All Players got kicked."
                        )
                    end
                end
            end
        end
    end
)
function setUniform(t)
    local playerPed = PlayerPedId()
    TriggerEvent(
        "skinchanger:getSkin",
        function(J)
            if J.sex == 0 then
                if t == Config.extragroupsuits.GroupName1 then
                    if GetPlayerName(PlayerId()) == Config.specialsuit.Name1 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name2 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit2.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name3 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit3.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name4 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit4.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name5 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit5.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name6 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit6.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name7 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit7.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name8 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit8.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name9 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit9.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name10 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit10.male)
                    else
                        TriggerEvent("skinchanger:loadClothes", J, Config.extragroupsuits.Suit1.male)
                    end
                elseif t == Config.extragroupsuits.GroupName2 then
                    if GetPlayerName(PlayerId()) == Config.specialsuit.Name1 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit1.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name2 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit2.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name3 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit3.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name4 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit4.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name5 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit5.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name6 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit6.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name7 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit7.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name8 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit8.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name9 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit9.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name10 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit10.male)
                    else
                        TriggerEvent("skinchanger:loadClothes", J, Config.extragroupsuits.Suit2.male)
                    end
                elseif t == Config.extragroupsuits.GroupName3 then
                    if GetPlayerName(PlayerId()) == Config.specialsuit.Name1 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit1.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name2 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit2.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name3 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit3.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name4 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit4.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name5 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit5.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name6 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit6.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name7 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit7.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name8 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit8.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name9 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit9.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name10 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit10.male)
                    else
                        TriggerEvent("skinchanger:loadClothes", J, Config.extragroupsuits.Suit3.male)
                    end
                elseif t == Config.extragroupsuits.GroupName4 then
                    if GetPlayerName(PlayerId()) == Config.specialsuit.Name1 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit1.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name2 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit2.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name3 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit3.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name4 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit4.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name5 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit5.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name6 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit6.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name7 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit7.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name8 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit8.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name9 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit9.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name10 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit10.male)
                    else
                        TriggerEvent("skinchanger:loadClothes", J, Config.extragroupsuits.Suit4.male)
                    end
                elseif t == Config.extragroupsuits.GroupName5 then
                    if GetPlayerName(PlayerId()) == Config.specialsuit.Name1 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit1.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name2 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit2.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name3 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit3.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name4 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit4.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name5 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit5.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name6 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit6.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name7 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit7.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name8 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit8.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name9 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit9.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name10 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit10.male)
                    else
                        TriggerEvent("skinchanger:loadClothes", J, Config.extragroupsuits.Suit5.male)
                    end
                elseif t == Config.extragroupsuits.GroupName6 then
                    if GetPlayerName(PlayerId()) == Config.specialsuit.Name1 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit1.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name2 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit2.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name3 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit3.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name4 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit4.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name5 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit5.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name6 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit6.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name7 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit7.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name8 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit8.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name9 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit9.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name10 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit10.male)
                    else
                        TriggerEvent("skinchanger:loadClothes", J, Config.extragroupsuits.Suit6.male)
                    end
                elseif t == Config.extragroupsuits.GroupName7 then
                    if GetPlayerName(PlayerId()) == Config.specialsuit.Name1 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit1.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name2 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit2.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name3 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit3.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name4 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit4.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name5 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit5.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name6 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit6.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name7 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit7.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name8 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit8.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name9 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit9.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name10 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit10.male)
                    else
                        TriggerEvent("skinchanger:loadClothes", J, Config.extragroupsuits.Suit7.male)
                    end
                elseif t == Config.extragroupsuits.GroupName8 then
                    if GetPlayerName(PlayerId()) == Config.specialsuit.Name1 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit1.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name2 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit2.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name3 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit3.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name4 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit4.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name5 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit5.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name6 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit6.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name7 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit7.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name8 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit8.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name9 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit9.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name10 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit10.male)
                    else
                        TriggerEvent("skinchanger:loadClothes", J, Config.extragroupsuits.Suit8.male)
                    end
                elseif t == Config.extragroupsuits.GroupName9 then
                    if GetPlayerName(PlayerId()) == Config.specialsuit.Name1 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit1.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name2 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit2.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name3 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit3.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name4 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit4.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name5 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit5.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name6 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit6.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name7 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit7.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name8 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit8.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name9 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit9.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name10 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit10.male)
                    else
                        TriggerEvent("skinchanger:loadClothes", J, Config.extragroupsuits.Suit9.male)
                    end
                elseif t == Config.extragroupsuits.GroupName10 then
                    if GetPlayerName(PlayerId()) == Config.specialsuit.Name1 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit1.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name2 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit2.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name3 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit3.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name4 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit4.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name5 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit5.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name6 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit6.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name7 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit7.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name8 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit8.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name9 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit9.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name10 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit10.male)
                    else
                        TriggerEvent("skinchanger:loadClothes", J, Config.extragroupsuits.Suit10.male)
                    end
                elseif t == "superadmin" then
                    if GetPlayerName(PlayerId()) == Config.specialsuit.Name1 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit1.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name2 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit2.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name3 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit3.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name4 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit4.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name5 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit5.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name6 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit6.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name7 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit7.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name8 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit8.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name9 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit9.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name10 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit10.male)
                    else
                        TriggerEvent("skinchanger:loadClothes", J, Config.Suits.male.superadmin)
                    end
                elseif t == "admin" then
                    if GetPlayerName(PlayerId()) == Config.specialsuit.Name1 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit1.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name2 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit2.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name3 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit3.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name4 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit4.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name5 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit5.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name6 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit6.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name7 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit7.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name8 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit8.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name9 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit9.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name10 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit10.male)
                    else
                        TriggerEvent("skinchanger:loadClothes", J, Config.Suits.male.admin)
                    end
                elseif t == "mod" then
                    if GetPlayerName(PlayerId()) == Config.specialsuit.Name1 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit1.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name2 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit2.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name3 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit3.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name4 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit4.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name5 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit5.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name6 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit6.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name7 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit7.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name8 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit8.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name9 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit9.male)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name10 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit10.male)
                    else
                        TriggerEvent("skinchanger:loadClothes", J, Config.Suits.male.mod)
                    end
                end
            else
                if t == Config.extragroupsuits.GroupName1 then
                    if GetPlayerName(PlayerId()) == Config.specialsuit.Name1 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit1.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name2 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit2.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name3 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit3.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name4 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit4.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name5 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit5.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name6 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit6.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name7 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit7.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name8 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit8.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name9 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit9.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name10 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit10.female)
                    else
                        TriggerEvent("skinchanger:loadClothes", J, Config.extragroupsuits.Suit1.female)
                    end
                elseif t == Config.extragroupsuits.GroupName2 then
                    if GetPlayerName(PlayerId()) == Config.specialsuit.Name1 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit1.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name2 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit2.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name3 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit3.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name4 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit4.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name5 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit5.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name6 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit6.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name7 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit7.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name8 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit8.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name9 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit9.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name10 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit10.female)
                    else
                        TriggerEvent("skinchanger:loadClothes", J, Config.extragroupsuits.Suit2.female)
                    end
                elseif t == Config.extragroupsuits.GroupName3 then
                    if GetPlayerName(PlayerId()) == Config.specialsuit.Name1 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit1.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name2 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit2.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name3 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit3.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name4 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit4.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name5 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit5.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name6 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit6.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name7 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit7.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name8 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit8.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name9 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit9.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name10 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit10.female)
                    else
                        TriggerEvent("skinchanger:loadClothes", J, Config.extragroupsuits.Suit3.female)
                    end
                elseif t == Config.extragroupsuits.GroupName4 then
                    if GetPlayerName(PlayerId()) == Config.specialsuit.Name1 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit1.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name2 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit2.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name3 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit3.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name4 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit4.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name5 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit5.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name6 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit6.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name7 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit7.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name8 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit8.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name9 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit9.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name10 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit10.female)
                    else
                        TriggerEvent("skinchanger:loadClothes", J, Config.extragroupsuits.Suit4.female)
                    end
                elseif t == Config.extragroupsuits.GroupName5 then
                    if GetPlayerName(PlayerId()) == Config.specialsuit.Name1 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit1.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name2 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit2.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name3 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit3.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name4 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit4.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name5 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit5.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name6 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit6.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name7 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit7.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name8 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit8.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name9 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit9.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name10 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit10.female)
                    else
                        TriggerEvent("skinchanger:loadClothes", J, Config.extragroupsuits.Suit5.female)
                    end
                elseif t == Config.extragroupsuits.GroupName6 then
                    if GetPlayerName(PlayerId()) == Config.specialsuit.Name1 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit1.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name2 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit2.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name3 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit3.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name4 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit4.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name5 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit5.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name6 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit6.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name7 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit7.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name8 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit8.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name9 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit9.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name10 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit10.female)
                    else
                        TriggerEvent("skinchanger:loadClothes", J, Config.extragroupsuits.Suit6.female)
                    end
                elseif t == Config.extragroupsuits.GroupName7 then
                    if GetPlayerName(PlayerId()) == Config.specialsuit.Name1 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit1.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name2 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit2.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name3 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit3.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name4 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit4.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name5 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit5.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name6 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit6.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name7 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit7.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name8 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit8.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name9 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit9.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name10 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit10.female)
                    else
                        TriggerEvent("skinchanger:loadClothes", J, Config.extragroupsuits.Suit7.female)
                    end
                elseif t == Config.extragroupsuits.GroupName8 then
                    if GetPlayerName(PlayerId()) == Config.specialsuit.Name1 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit1.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name2 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit2.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name3 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit3.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name4 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit4.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name5 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit5.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name6 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit6.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name7 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit7.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name8 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit8.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name9 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit9.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name10 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit10.female)
                    else
                        TriggerEvent("skinchanger:loadClothes", J, Config.extragroupsuits.Suit8.female)
                    end
                elseif t == Config.extragroupsuits.GroupName9 then
                    if GetPlayerName(PlayerId()) == Config.specialsuit.Name1 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit1.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name2 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit2.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name3 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit3.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name4 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit4.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name5 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit5.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name6 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit6.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name7 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit7.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name8 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit8.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name9 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit9.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name10 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit10.female)
                    else
                        TriggerEvent("skinchanger:loadClothes", J, Config.extragroupsuits.Suit9.female)
                    end
                elseif t == Config.extragroupsuits.GroupName10 then
                    if GetPlayerName(PlayerId()) == Config.specialsuit.Name1 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit1.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name2 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit2.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name3 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit3.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name4 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit4.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name5 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit5.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name6 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit6.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name7 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit7.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name8 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit8.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name9 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit9.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name10 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit10.female)
                    else
                        TriggerEvent("skinchanger:loadClothes", J, Config.extragroupsuits.Suit10.female)
                    end
                elseif t == "superadmin" then
                    if GetPlayerName(PlayerId()) == Config.specialsuit.Name1 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit1.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name2 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit2.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name3 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit3.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name4 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit4.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name5 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit5.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name6 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit6.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name7 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit7.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name8 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit8.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name9 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit9.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name10 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit10.female)
                    else
                        TriggerEvent("skinchanger:loadClothes", J, Config.Suits.female.superadmin)
                    end
                elseif t == "admin" then
                    if GetPlayerName(PlayerId()) == Config.specialsuit.Name1 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit1.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name2 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit2.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name3 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit3.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name4 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit4.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name5 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit5.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name6 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit6.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name7 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit7.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name8 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit8.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name9 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit9.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name10 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit10.female)
                    else
                        TriggerEvent("skinchanger:loadClothes", J, Config.Suits.female.admin)
                    end
                elseif t == "mod" then
                    if GetPlayerName(PlayerId()) == Config.specialsuit.Name1 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit1.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name2 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit2.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name3 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit3.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name4 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit4.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name5 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit5.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name6 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit6.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name7 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit7.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name8 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit8.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name9 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit9.female)
                    elseif GetPlayerName(PlayerId()) == Config.specialsuit.Name10 then
                        TriggerEvent("skinchanger:loadClothes", J, Config.specialsuit.Suit10.female)
                    else
                        TriggerEvent("skinchanger:loadClothes", J, Config.Suits.female.mod)
                    end
                end
            end
        end
    )
end
RegisterNetEvent("vanish")
AddEventHandler(
    "vanish",
    function()
        f = not f
        if f then
            SetEntityVisible(PlayerPedId(), false, false)
        end
        if not f then
            SetEntityVisible(PlayerPedId(), true, false)
        end
    end
)
RegisterNetEvent("aduty")
AddEventHandler(
    "aduty",
    function(t)
        ESX.TriggerServerCallback(
            "dnz_amenuv2:getCurrentInfo",
            function(q)
                local t = q.admingroup
                local playerPed = PlayerPedId()
                if b then
                    b = false
                    GodModes = not GodModes
                    GodModes = false
                    if Config.Aduty.fastwalk ~= nil then
                        if Config.Aduty.fastwalk then
                            Citizen.CreateThread(
                                function()
                                    while true do
                                        Citizen.Wait(0)
                                        SetPedMoveRateOverride(PlayerId(), 0.0)
                                        SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
                                    end
                                end
                            )
                        end
                    end
                    if Config.builtinnotify ~= nil then
                        TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("noaduty"))
                    else
                        if Config.ownnotify.notifycolor ~= nil and not false then
                            TriggerEvent(
                                Config.ownnotify.trigger,
                                source,
                                Config.ownnotify.color,
                                Config.ownnotify.title,
                                Lang("noaduty")
                            )
                        else
                            TriggerEvent(Config.ownnotify.trigger, source, Config.ownnotify.title, Lang("noaduty"))
                        end
                    end
                    if Config.Amenu.needtobeinaduty ~= nil then
                        if Config.Amenu.needtobeinaduty then
                            a = false
                            nameabove = false
                            esp = false
                            espinfo = false
                            espbox = false
                            esplines = false
                        end
                    end
                    ESX.TriggerServerCallback(
                        "esx_skin:getPlayerSkin",
                        function(J)
                            TriggerEvent("skinchanger:loadSkin", J)
                        end
                    )
                    return
                else
                    b = true
                    if Config.builtinnotify ~= nil then
                        TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("aduty"))
                    else
                        if Config.ownnotify.notifycolor ~= nil and not false then
                            TriggerEvent(
                                Config.ownnotify.trigger,
                                source,
                                Config.ownnotify.color,
                                Config.ownnotify.title,
                                Lang("aduty")
                            )
                        else
                            TriggerEvent(Config.ownnotify.trigger, source, Config.ownnotify.title, Lang("aduty"))
                        end
                    end
                    setUniform(t)
                    if Config.Aduty.godmode ~= nil then
                        if Config.Aduty.godmode then
                            GodModes = not GodModes
                            GodModes = true
                        end
                    end
                    if Config.Aduty.superjump ~= nil then
                        if Config.Aduty.superjump then
                            Citizen.CreateThread(
                                function()
                                    while true do
                                        Citizen.Wait(0)
                                        if b then
                                            SetSuperJumpThisFrame(PlayerId())
                                        end
                                    end
                                end
                            )
                        end
                    end
                    if Config.Aduty.fastwalk ~= nil then
                        if Config.Aduty.fastwalk then
                            Citizen.CreateThread(
                                function()
                                    while true do
                                        Citizen.Wait(0)
                                        SetPedMoveRateOverride(PlayerId(), 10.0)
                                        SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
                                    end
                                end
                            )
                        end
                    end
                end
            end
        )
    end
)
RegisterNUICallback(
    "veh",
    function(w)
        if w.type == "spawn" then
            if string.len(w.model) < 1 then
                if Config.builtinnotify ~= nil then
                    TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("noinputveh"))
                else
                    if Config.ownnotify.notifycolor ~= nil and not false then
                        TriggerEvent(
                            Config.ownnotify.trigger,
                            source,
                            Config.ownnotify.color,
                            Config.ownnotify.title,
                            Lang("noinputveh")
                        )
                    else
                        TriggerEvent(Config.ownnotify.trigger, source, Config.ownnotify.title, Lang("noinputveh"))
                    end
                end
            else
                if Config.Amenu.needtobeinaduty ~= nil then
                    if Config.Amenu.needtobeinaduty then
                        if b then
                            TriggerServerEvent("logspawncar", w.model)
                            spawnvehicle(w.model)
                        else
                            if Config.builtinnotify ~= nil then
                                TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                            else
                                if Config.ownnotify.notifycolor ~= nil and not false then
                                    TriggerEvent(
                                        Config.ownnotify.trigger,
                                        source,
                                        Config.ownnotify.color,
                                        Config.ownnotify.title,
                                        Lang("notinduty")
                                    )
                                else
                                    TriggerEvent(
                                        Config.ownnotify.trigger,
                                        source,
                                        Config.ownnotify.title,
                                        Lang("notinduty")
                                    )
                                end
                            end
                        end
                    else
                        TriggerServerEvent("logspawncar", w.model)
                        spawnvehicle(w.model)
                    end
                end
            end
        elseif w.type == "repair" then
            if Config.Amenu.needtobeinaduty ~= nil then
                if Config.Amenu.needtobeinaduty then
                    if b then
                        local playerPed = PlayerPedId(-1)
                        if IsPedInAnyVehicle(playerPed, false) then
                            repairvehicle()
                            TriggerServerEvent(
                                "logrepair",
                                GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(PlayerPedId())))
                            )
                        end
                    else
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            end
                        end
                    end
                else
                    local playerPed = PlayerPedId(-1)
                    if IsPedInAnyVehicle(playerPed, false) then
                        repairvehicle()
                        TriggerServerEvent(
                            "logrepair",
                            GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(PlayerPedId())))
                        )
                    end
                end
            end
        elseif w.type == "delete" then
            if Config.Amenu.needtobeinaduty ~= nil then
                if Config.Amenu.needtobeinaduty then
                    if b then
                        local playerPed = PlayerPedId(-1)
                        if IsPedInAnyVehicle(playerPed, false) then
                            delvehicle()
                            TriggerServerEvent(
                                "logdelete",
                                GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(PlayerPedId())))
                            )
                        end
                    else
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            end
                        end
                    end
                else
                    local playerPed = PlayerPedId(-1)
                    if IsPedInAnyVehicle(playerPed, false) then
                        delvehicle()
                        TriggerServerEvent(
                            "logdelete",
                            GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(PlayerPedId())))
                        )
                    end
                end
            end
        elseif w.type == "gmode" then
            if Config.Amenu.needtobeinaduty ~= nil then
                if Config.Amenu.needtobeinaduty then
                    if b then
                        h = not h
                        if h then
                            if Config.builtinnotify ~= nil then
                                TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("vehiclegodmode"))
                            else
                                if Config.ownnotify.notifycolor ~= nil and not false then
                                    TriggerEvent(
                                        Config.ownnotify.trigger,
                                        source,
                                        Config.ownnotify.color,
                                        Config.ownnotify.title,
                                        Lang("vehiclegodmode")
                                    )
                                else
                                    TriggerEvent(
                                        Config.ownnotify.trigger,
                                        source,
                                        Config.ownnotify.title,
                                        Lang("vehiclegodmode")
                                    )
                                end
                            end
                            TriggerServerEvent(
                                "loggodmodeveh",
                                GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(PlayerPedId())))
                            )
                            SetEntityInvincible(GetVehiclePedIsUsing(PlayerPedId()), true)
                        end
                        if not h then
                            if Config.builtinnotify ~= nil then
                                TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notvehiclegodmode"))
                            else
                                if Config.ownnotify.notifycolor ~= nil and not false then
                                    TriggerEvent(
                                        Config.ownnotify.trigger,
                                        source,
                                        Config.ownnotify.color,
                                        Config.ownnotify.title,
                                        Lang("notvehiclegodmode")
                                    )
                                else
                                    TriggerEvent(
                                        Config.ownnotify.trigger,
                                        source,
                                        Config.ownnotify.title,
                                        Lang("notvehiclegodmode")
                                    )
                                end
                            end
                            TriggerServerEvent(
                                "lognotgodmodeveh",
                                GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(PlayerPedId())))
                            )
                            SetEntityInvincible(GetVehiclePedIsUsing(PlayerPedId()), false)
                        end
                    else
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            end
                        end
                    end
                else
                    h = not h
                    if h then
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("vehiclegodmode"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("vehiclegodmode")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("vehiclegodmode")
                                )
                            end
                        end
                        TriggerServerEvent(
                            "loggodmodeveh",
                            GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(PlayerPedId())))
                        )
                        SetEntityInvincible(GetVehiclePedIsUsing(PlayerPedId()), true)
                    end
                    if not h then
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notvehiclegodmode"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("notvehiclegodmode")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("notvehiclegodmode")
                                )
                            end
                        end
                        TriggerServerEvent(
                            "lognotgodmodeveh",
                            GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(PlayerPedId())))
                        )
                        SetEntityInvincible(GetVehiclePedIsUsing(PlayerPedId()), false)
                    end
                end
            end
        elseif w.type == "full" then
            if Config.Amenu.needtobeinaduty ~= nil then
                if Config.Amenu.needtobeinaduty then
                    if b then
                        local playerPed = PlayerPedId(-1)
                        if IsPedInAnyVehicle(playerPed, false) then
                            TriggerServerEvent(
                                "logfulltune",
                                GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(PlayerPedId())))
                            )
                            MaxOutEngine(vehicle, true)
                        end
                    else
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            end
                        end
                    end
                else
                    local playerPed = PlayerPedId(-1)
                    if IsPedInAnyVehicle(playerPed, false) then
                        TriggerServerEvent(
                            "logfulltune",
                            GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(PlayerPedId())))
                        )
                        MaxOutEngine(vehicle, true)
                    end
                end
            end
        elseif w.type == "flip" then
            if Config.Amenu.needtobeinaduty ~= nil then
                if Config.Amenu.needtobeinaduty then
                    if b then
                        local playerPed = PlayerPedId(-1)
                        if IsPedInAnyVehicle(playerPed, false) then
                            TriggerServerEvent(
                                "logflip",
                                GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(PlayerPedId())))
                            )
                            VehicleData = ESX.Game.GetClosestVehicle()
                            local K = GetEntityRotation(VehicleData, 2)
                            SetEntityRotation(VehicleData, K[1], 0, K[3], 2, true)
                            SetVehicleOnGroundProperly(VehicleData)
                        end
                    else
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("notinduty")
                                )
                            end
                        end
                    end
                else
                    local playerPed = PlayerPedId(-1)
                    if IsPedInAnyVehicle(playerPed, false) then
                        TriggerServerEvent(
                            "logflip",
                            GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(PlayerPedId())))
                        )
                        VehicleData = ESX.Game.GetClosestVehicle()
                        local K = GetEntityRotation(VehicleData, 2)
                        SetEntityRotation(VehicleData, K[1], 0, K[3], 2, true)
                        SetVehicleOnGroundProperly(VehicleData)
                    end
                end
            end
        end
    end
)
function MaxOutEngine(L, M)
    ToggleVehicleMod(L, 2, M)
    SetVehicleMod(
        GetVehiclePedIsIn(PlayerPedId(-1), false),
        12,
        GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(-1), false), 11) - 1,
        M
    )
    SetVehicleMod(
        GetVehiclePedIsIn(PlayerPedId(-1), false),
        13,
        GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(-1), false), 13) - 1,
        M
    )
    SetVehicleMod(
        GetVehiclePedIsIn(PlayerPedId(-1), false),
        14,
        GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(-1), false), 14) - 1,
        M
    )
    SetVehicleMod(
        GetVehiclePedIsIn(PlayerPedId(-1), false),
        16,
        GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(-1), false), 16) - 1,
        M
    )
    SetVehicleMod(
        GetVehiclePedIsIn(PlayerPedId(-1), false),
        17,
        GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(-1), false), 17) - 1,
        M
    )
    SetVehicleModKit(GetVehiclePedIsIn(PlayerPedId(-1), false), 0)
    SetVehicleWheelType(GetVehiclePedIsIn(PlayerPedId(-1), false), 7)
    SetVehicleMod(
        GetVehiclePedIsIn(PlayerPedId(-1), false),
        0,
        GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(-1), false), 0) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(PlayerPedId(-1), false),
        1,
        GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(-1), false), 1) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(PlayerPedId(-1), false),
        2,
        GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(-1), false), 2) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(PlayerPedId(-1), false),
        3,
        GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(-1), false), 3) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(PlayerPedId(-1), false),
        4,
        GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(-1), false), 4) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(PlayerPedId(-1), false),
        5,
        GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(-1), false), 5) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(PlayerPedId(-1), false),
        6,
        GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(-1), false), 6) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(PlayerPedId(-1), false),
        7,
        GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(-1), false), 7) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(PlayerPedId(-1), false),
        8,
        GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(-1), false), 8) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(PlayerPedId(-1), false),
        9,
        GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(-1), false), 9) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(PlayerPedId(-1), false),
        10,
        GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(-1), false), 10) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(PlayerPedId(-1), false),
        11,
        GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(-1), false), 11) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(PlayerPedId(-1), false),
        12,
        GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(-1), false), 12) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(PlayerPedId(-1), false),
        13,
        GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(-1), false), 13) - 1,
        false
    )
    SetVehicleMod(GetVehiclePedIsIn(PlayerPedId(-1), false), 14, 0, false)
    SetVehicleMod(
        GetVehiclePedIsIn(PlayerPedId(-1), false),
        15,
        GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(-1), false), 15) - 2,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(PlayerPedId(-1), false),
        16,
        GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(-1), false), 16) - 1,
        false
    )
    ToggleVehicleMod(GetVehiclePedIsIn(PlayerPedId(-1), false), 17, true)
    ToggleVehicleMod(GetVehiclePedIsIn(PlayerPedId(-1), false), 18, true)
    ToggleVehicleMod(GetVehiclePedIsIn(PlayerPedId(-1), false), 19, true)
    ToggleVehicleMod(GetVehiclePedIsIn(PlayerPedId(-1), false), 20, true)
    ToggleVehicleMod(GetVehiclePedIsIn(PlayerPedId(-1), false), 21, true)
    ToggleVehicleMod(GetVehiclePedIsIn(PlayerPedId(-1), false), 22, true)
    SetVehicleMod(GetVehiclePedIsIn(PlayerPedId(-1), false), 24, 1, false)
    SetVehicleMod(
        GetVehiclePedIsIn(PlayerPedId(-1), false),
        25,
        GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(-1), false), 25) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(PlayerPedId(-1), false),
        27,
        GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(-1), false), 27) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(PlayerPedId(-1), false),
        28,
        GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(-1), false), 28) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(PlayerPedId(-1), false),
        30,
        GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(-1), false), 30) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(PlayerPedId(-1), false),
        33,
        GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(-1), false), 33) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(PlayerPedId(-1), false),
        34,
        GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(-1), false), 34) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(PlayerPedId(-1), false),
        35,
        GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(-1), false), 35) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(PlayerPedId(-1), false),
        38,
        GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(-1), false), 38) - 1,
        true
    )
    SetVehicleWindowTint(GetVehiclePedIsIn(PlayerPedId(-1), false), 1)
    SetVehicleTyresCanBurst(GetVehiclePedIsIn(PlayerPedId(-1), false), false)
    SetVehicleNumberPlateTextIndex(GetVehiclePedIsIn(PlayerPedId(-1), false), 1)
end
RegisterNetEvent("teleport")
AddEventHandler(
    "teleport",
    function(E, F, G)
        SetEntityCoords(PlayerPedId(), E, F, G, 0, 0, 0, false)
    end
)
RegisterNetEvent("teleport2")
AddEventHandler(
    "teleport2",
    function(N)
        Citizen.Wait(1500)
        local ped = PlayerPedId()
        SetEntityVisible(ped, true, 0)
        SetEntityCoords(PlayerPedId(), N.x, N.y, N.z, 0, 0, 0, false)
    end
)
RegisterNetEvent("teleport3")
AddEventHandler(
    "teleport3",
    function(N)
        local ped = PlayerPedId()
        Citizen.Wait(200)
        SetEntityVisible(ped, false, 0)
        SetEntityCoords(PlayerPedId(), N.x, N.y, N.z - 10.0, 0, 0, 0, false)
    end
)
function SpectatePlayer(O)
    e = not e
    if e then
        DoScreenFadeOut(500)
        while IsScreenFadingOut() do
            Citizen.Wait(500)
        end
        NetworkSetInSpectatorMode(false, 0)
        Citizen.Wait(100)
        NetworkSetInSpectatorMode(true, O)
        DoScreenFadeIn(500)
    elseif not e then
        DoScreenFadeOut(500)
        while IsScreenFadingOut() do
            Citizen.Wait(500)
        end
        NetworkSetInSpectatorMode(false, 0)
        DoScreenFadeIn(500)
    end
end
RegisterNetEvent("noaccsessunban")
AddEventHandler(
    "noaccsessunban",
    function(source)
        if Config.builtinnotify ~= nil then
            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("consoleaccses"))
        else
            if Config.ownnotify.notifycolor ~= nil and not false then
                TriggerEvent(
                    Config.ownnotify.trigger,
                    source,
                    Config.ownnotify.color,
                    Config.ownnotify.title,
                    Lang("consoleaccses")
                )
            else
                TriggerEvent(Config.ownnotify.trigger, source, Config.ownnotify.title, Lang("consoleaccses"))
            end
        end
    end
)
RegisterNetEvent("noclipsoundclient")
AddEventHandler(
    "noclipsoundclient",
    function()
        SendNUIMessage({action = "noclipsound"})
    end
)
RegisterNetEvent("noclipped")
AddEventHandler(
    "noclipped",
    function()
        ESX.TriggerServerCallback(
            "dnz_amenuv2:getCurrentInfo",
            function(q)
                for r, v in pairs(Config.Permissions.noclip) do
                    if v == q.admingroup then
                        i = not i
                        if i then
                            if Config.Aduty.invisiblenoclip then
                                local ped = PlayerPedId()
                                SetEntityVisible(ped, false, 0)
                            end
                            if Config.builtinnotify ~= nil then
                                TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("noclip"))
                            else
                                if Config.ownnotify.notifycolor ~= nil and not false then
                                    TriggerEvent(
                                        Config.ownnotify.trigger,
                                        source,
                                        Config.ownnotify.color,
                                        Config.ownnotify.title,
                                        Lang("noclip")
                                    )
                                else
                                    TriggerEvent(
                                        Config.ownnotify.trigger,
                                        source,
                                        Config.ownnotify.title,
                                        Lang("noclip")
                                    )
                                end
                            end
                            if Config.Aduty.noclipsound ~= nil then
                                if Config.Aduty.noclipsound then
                                    local P, Q = ESX.Game.GetClosestPlayer()
                                    if P ~= -1 and Q <= 10.0 then
                                        TriggerServerEvent("noclipsound", GetPlayerServerId(P))
                                    end
                                    TriggerServerEvent("noclipsound2")
                                end
                            end
                            return true
                        elseif not i then
                            SetEntityVisible(PlayerPedId(), true, 0)
                            if Config.builtinnotify ~= nil then
                                TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("noclip2"))
                            else
                                if Config.ownnotify.notifycolor ~= nil and not false then
                                    TriggerEvent(
                                        Config.ownnotify.trigger,
                                        source,
                                        Config.ownnotify.color,
                                        Config.ownnotify.title,
                                        Lang("noclip2")
                                    )
                                else
                                    TriggerEvent(
                                        Config.ownnotify.trigger,
                                        source,
                                        Config.ownnotify.title,
                                        Lang("noclip2")
                                    )
                                end
                            end
                            if Config.Aduty.noclipsound ~= nil then
                                if Config.Aduty.noclipsound then
                                    local P, Q = ESX.Game.GetClosestPlayer()
                                    if P ~= -1 and Q <= 10.0 then
                                        TriggerServerEvent("noclipsound", GetPlayerServerId(P))
                                    end
                                    TriggerServerEvent("noclipsound2")
                                end
                            end
                            return true
                        end
                    end
                end
                if Config.builtinnotify ~= nil then
                    TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notallowed"))
                else
                    if Config.ownnotify.notifycolor ~= nil and not false then
                        TriggerEvent(
                            Config.ownnotify.trigger,
                            source,
                            Config.ownnotify.color,
                            Config.ownnotify.title,
                            Lang("notallowed")
                        )
                    else
                        TriggerEvent(Config.ownnotify.trigger, source, Config.ownnotify.title, Lang("notallowed"))
                    end
                end
                return false
            end
        )
    end
)
RegisterCommand(
    "" .. Config.Amenu.adutycommand .. "",
    function(source, x)
        ESX.TriggerServerCallback(
            "dnz_amenuv2:getCurrentInfo",
            function(q)
                for r, v in pairs(Config.Permissions.aduty) do
                    if v == q.admingroup then
                        TriggerEvent("aduty")
                    end
                end
            end
        )
    end
)
RegisterNetEvent("teamchatnotify")
AddEventHandler(
    "teamchatnotify",
    function(R, n)
        ESX.TriggerServerCallback(
            "dnz_amenuv2:getCurrentInfo",
            function(q)
                for r, v in pairs(Config.Permissions.teamchat) do
                    if v == q.admingroup then
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, n, R)
                        elseif Config.ownnotify.notifycolor ~= nil and not false then
                            TriggerEvent(Config.ownnotify.trigger, source, Config.ownnotify.color, n, R)
                        else
                            TriggerEvent(Config.ownnotify.trigger, source, n, R)
                        end
                    end
                end
            end
        )
    end
)
RegisterNetEvent("notallowed")
AddEventHandler(
    "notallowed",
    function()
        if Config.builtinnotify ~= nil then
            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notallowed"))
        else
            if Config.ownnotify.notifycolor ~= nil and not false then
                TriggerEvent(
                    Config.ownnotify.trigger,
                    source,
                    Config.ownnotify.color,
                    Config.ownnotify.title,
                    Lang("notallowed")
                )
            else
                TriggerEvent(Config.ownnotify.trigger, source, Config.ownnotify.title, Lang("notallowed"))
            end
        end
    end
)
RegisterCommand(
    "" .. Config.Amenu.teamchatcommand .. "",
    function(source, x)
        if Config.Amenu.teamchatenabled ~= nil and not false then
            TriggerServerEvent("teamchat", table.concat(x, " "))
        end
    end
)
RegisterCommand(
    "" .. Config.Amenu.noclipcommand .. "",
    function(source, x)
        ESX.TriggerServerCallback(
            "dnz_amenuv2:getCurrentInfo",
            function(q)
                for r, v in pairs(Config.Permissions.noclip) do
                    if v == q.admingroup then
                        if b then
                            i = not i
                            if i then
                                if Config.Aduty.invisiblenoclip ~= nil and not false then
                                    local ped = PlayerPedId()
                                    SetEntityVisible(ped, false, 0)
                                end
                                if Config.builtinnotify ~= nil then
                                    TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("noclip"))
                                else
                                    if Config.ownnotify.notifycolor ~= nil and not false then
                                        TriggerEvent(
                                            Config.ownnotify.trigger,
                                            source,
                                            Config.ownnotify.color,
                                            Config.ownnotify.title,
                                            Lang("noclip")
                                        )
                                    else
                                        TriggerEvent(
                                            Config.ownnotify.trigger,
                                            source,
                                            Config.ownnotify.title,
                                            Lang("noclip")
                                        )
                                    end
                                end
                                if Config.Aduty.noclipsound ~= nil then
                                    if Config.Aduty.noclipsound then
                                        local P, Q = ESX.Game.GetClosestPlayer()
                                        if P ~= -1 and Q <= 10.0 then
                                            TriggerServerEvent("noclipsound", GetPlayerServerId(P))
                                        end
                                        TriggerServerEvent("noclipsound2")
                                    end
                                end
                                return true
                            elseif not i then
                                if Config.Aduty.invisiblenoclip ~= nil and not false then
                                    local ped = PlayerPedId()
                                    SetEntityVisible(ped, true, 0)
                                end
                                if Config.builtinnotify ~= nil then
                                    TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("noclip2"))
                                else
                                    if Config.ownnotify.notifycolor ~= nil and not false then
                                        TriggerEvent(
                                            Config.ownnotify.trigger,
                                            source,
                                            Config.ownnotify.color,
                                            Config.ownnotify.title,
                                            Lang("noclip2")
                                        )
                                    else
                                        TriggerEvent(
                                            Config.ownnotify.trigger,
                                            source,
                                            Config.ownnotify.title,
                                            Lang("noclip2")
                                        )
                                    end
                                end
                                if Config.Aduty.noclipsound ~= nil then
                                    if Config.Aduty.noclipsound then
                                        local P, Q = ESX.Game.GetClosestPlayer()
                                        if P ~= -1 and Q <= 10.0 then
                                            TriggerServerEvent("noclipsound", GetPlayerServerId(P))
                                        end
                                        TriggerServerEvent("noclipsound2")
                                    end
                                end
                                return true
                            end
                        else
                            if Config.builtinnotify ~= nil then
                                TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                            else
                                if Config.ownnotify.notifycolor ~= nil and not false then
                                    TriggerEvent(
                                        Config.ownnotify.trigger,
                                        source,
                                        Config.ownnotify.color,
                                        Config.ownnotify.title,
                                        Lang("notinduty")
                                    )
                                else
                                    TriggerEvent(
                                        Config.ownnotify.trigger,
                                        source,
                                        Config.ownnotify.title,
                                        Lang("notinduty")
                                    )
                                end
                            end
                            return true
                        end
                    end
                end
                if Config.builtinnotify ~= nil then
                    TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notallowed"))
                else
                    if Config.ownnotify.notifycolor ~= nil and not false then
                        TriggerEvent(
                            Config.ownnotify.trigger,
                            source,
                            Config.ownnotify.color,
                            Config.ownnotify.title,
                            Lang("notallowed")
                        )
                    else
                        TriggerEvent(Config.ownnotify.trigger, source, Config.ownnotify.title, Lang("notallowed"))
                    end
                end
                return false
            end
        )
    end
)
RegisterNetEvent("gotfreezed")
AddEventHandler(
    "gotfreezed",
    function(S)
        if Config.builtinnotify ~= nil then
            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("gotfreezed") .. S)
        else
            if Config.ownnotify.notifycolor ~= nil and not false then
                TriggerEvent(
                    Config.ownnotify.trigger,
                    source,
                    Config.ownnotify.color,
                    Config.ownnotify.title,
                    Lang("gotfreezed") .. S
                )
            else
                TriggerEvent(Config.ownnotify.trigger, source, Config.ownnotify.title, Lang("gotfreezed") .. S)
            end
        end
    end
)
RegisterNetEvent("gotfreezed2")
AddEventHandler(
    "gotfreezed2",
    function(S)
        if Config.builtinnotify ~= nil then
            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("freezed") .. S)
        else
            if Config.ownnotify.notifycolor ~= nil and not false then
                TriggerEvent(
                    Config.ownnotify.trigger,
                    source,
                    Config.ownnotify.color,
                    Config.ownnotify.title,
                    Lang("freezed") .. S
                )
            else
                TriggerEvent(Config.ownnotify.trigger, source, Config.ownnotify.title, Lang("freezed") .. S)
            end
        end
    end
)
RegisterNetEvent("notifyrevive3")
AddEventHandler(
    "notifyrevive3",
    function(S)
        if Config.builtinnotify ~= nil then
            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("gotrevived") .. S)
        else
            if Config.ownnotify.notifycolor ~= nil and not false then
                TriggerEvent(
                    Config.ownnotify.trigger,
                    source,
                    Config.ownnotify.color,
                    Config.ownnotify.title,
                    Lang("gotrevived") .. S
                )
            else
                TriggerEvent(Config.ownnotify.trigger, source, Config.ownnotify.title, Lang("gotrevived") .. S)
            end
        end
    end
)
RegisterNetEvent("notifyrevive4")
AddEventHandler(
    "notifyrevive4",
    function(S)
        if Config.builtinnotify ~= nil then
            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("revive") .. S)
        else
            if Config.ownnotify.notifycolor ~= nil and not false then
                TriggerEvent(
                    Config.ownnotify.trigger,
                    source,
                    Config.ownnotify.color,
                    Config.ownnotify.title,
                    Lang("revive") .. S
                )
            else
                TriggerEvent(Config.ownnotify.trigger, source, Config.ownnotify.title, Lang("revive") .. S)
            end
        end
    end
)
RegisterNetEvent("warnnotify3")
AddEventHandler(
    "warnnotify3",
    function(S, T)
        if Config.builtinnotify ~= nil then
            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("warn") .. S .. Lang("warn2") .. T)
        else
            if Config.ownnotify.notifycolor ~= nil and not false then
                TriggerEvent(
                    Config.ownnotify.trigger,
                    source,
                    Config.ownnotify.color,
                    Config.ownnotify.title,
                    Lang("warn") .. S .. Lang("warn2") .. T
                )
            else
                TriggerEvent(
                    Config.ownnotify.trigger,
                    source,
                    Config.ownnotify.title,
                    Lang("warn") .. S .. Lang("warn2") .. T
                )
            end
        end
    end
)
RegisterNetEvent("warnnotify4")
AddEventHandler(
    "warnnotify4",
    function(S, T)
        if Config.builtinnotify ~= nil then
            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("warn3") .. S .. Lang("warn4") .. T)
        else
            if Config.ownnotify.notifycolor ~= nil and not false then
                TriggerEvent(
                    Config.ownnotify.trigger,
                    source,
                    Config.ownnotify.color,
                    Config.ownnotify.title,
                    Lang("warn3") .. S .. Lang("warn4") .. T
                )
            else
                TriggerEvent(
                    Config.ownnotify.trigger,
                    source,
                    Config.ownnotify.title,
                    Lang("warn3") .. S .. Lang("warn4") .. T
                )
            end
        end
    end
)
RegisterNetEvent("spec")
AddEventHandler(
    "spec",
    function(U)
        Citizen.Wait(500)
        SpectatePlayer(GetPlayerPed(GetPlayerFromServerId(U)))
    end
)
RegisterNetEvent("kicknotify2")
AddEventHandler(
    "kicknotify2",
    function(S, T)
        if Config.builtinnotify ~= nil then
            TriggerEvent(
                "dnz_amenuv2:notify",
                source,
                "Adminmenu",
                Lang("youkicked") .. S .. Lang("youkickedreason") .. T
            )
        else
            if Config.ownnotify.notifycolor ~= nil and not false then
                TriggerEvent(
                    Config.ownnotify.trigger,
                    source,
                    Config.ownnotify.color,
                    Config.ownnotify.title,
                    Lang("youkicked") .. S .. Lang("youkickedreason") .. T
                )
            else
                TriggerEvent(
                    Config.ownnotify.trigger,
                    source,
                    Config.ownnotify.title,
                    Lang("youkicked") .. S .. Lang("youkickedreason") .. T
                )
            end
        end
    end
)
RegisterNetEvent("bannotify2")
AddEventHandler(
    "bannotify2",
    function(S, T)
        if Config.builtinnotify ~= nil then
            TriggerEvent(
                "dnz_amenuv2:notify",
                source,
                "Adminmenu",
                Lang("youbanned") .. S .. Lang("youbannedreason") .. T
            )
        else
            if Config.ownnotify.notifycolor ~= nil and not false then
                TriggerEvent(
                    Config.ownnotify.trigger,
                    source,
                    Config.ownnotify.color,
                    Config.ownnotify.title,
                    Lang("youbanned") .. S .. Lang("youbannedreason") .. T
                )
            else
                TriggerEvent(
                    Config.ownnotify.trigger,
                    source,
                    Config.ownnotify.title,
                    Lang("youbanned") .. S .. Lang("youbannedreason") .. T
                )
            end
        end
    end
)
RegisterNUICallback(
    "playeraction",
    function(w)
        ESX.TriggerServerCallback(
            "dnz_amenuv2:getCurrentInfo",
            function(q)
                if w.type == "freeze" then
                    if w.id == nil then
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("nooneselected"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("nooneselected")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("nooneselected")
                                )
                            end
                        end
                    else
                        if Config.Amenu.needtobeinaduty ~= nil then
                            if Config.Amenu.needtobeinaduty then
                                if b then
                                    TriggerServerEvent("gotfreezednotify", w.id, q.username)
                                    TriggerServerEvent("gotfreezednotify2", w.id)
                                    TriggerServerEvent("logfreeze", q.username, w.id)
                                    TriggerServerEvent("freeze", w.id)
                                else
                                    if Config.builtinnotify ~= nil then
                                        TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                                    else
                                        if Config.ownnotify.notifycolor ~= nil and not false then
                                            TriggerEvent(
                                                Config.ownnotify.trigger,
                                                source,
                                                Config.ownnotify.color,
                                                Config.ownnotify.title,
                                                Lang("notinduty")
                                            )
                                        else
                                            TriggerEvent(
                                                Config.ownnotify.trigger,
                                                source,
                                                Config.ownnotify.title,
                                                Lang("notinduty")
                                            )
                                        end
                                    end
                                end
                            else
                                TriggerServerEvent("gotfreezednotify", w.id, q.username)
                                TriggerServerEvent("gotfreezednotify2", w.id)
                                TriggerServerEvent("logfreeze", q.username, w.id)
                                TriggerServerEvent("freeze", w.id)
                            end
                        end
                    end
                elseif w.type == "revive" then
                    if w.id == nil then
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("nooneselected"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("nooneselected")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("nooneselected")
                                )
                            end
                        end
                    else
                        if Config.Amenu.needtobeinaduty ~= nil then
                            if Config.Amenu.needtobeinaduty then
                                if b then
                                    TriggerServerEvent("notifyrevive1", w.id, q.username)
                                    TriggerServerEvent("notifyrevive2", w.id)
                                    TriggerServerEvent("logrevivesomeone", q.username, w.id)
                                    TriggerServerEvent("rev2", w.id)
                                else
                                    if Config.builtinnotify ~= nil then
                                        TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                                    else
                                        if Config.ownnotify.notifycolor ~= nil and not false then
                                            TriggerEvent(
                                                Config.ownnotify.trigger,
                                                source,
                                                Config.ownnotify.color,
                                                Config.ownnotify.title,
                                                Lang("notinduty")
                                            )
                                        else
                                            TriggerEvent(
                                                Config.ownnotify.trigger,
                                                source,
                                                Config.ownnotify.title,
                                                Lang("notinduty")
                                            )
                                        end
                                    end
                                end
                            else
                                TriggerServerEvent("notifyrevive1", w.id, q.username)
                                TriggerServerEvent("notifyrevive2", w.id)
                                TriggerServerEvent("logrevivesomeone", q.username, w.id)
                                TriggerServerEvent("rev2", w.id)
                            end
                        end
                    end
                elseif w.type == "spectate" then
                    if w.id == nil then
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("nooneselected"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("nooneselected")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("nooneselected")
                                )
                            end
                        end
                    else
                        if Config.Amenu.needtobeinaduty ~= nil then
                            if Config.Amenu.needtobeinaduty then
                                if b then
                                    TriggerServerEvent("logspec", q.username, w.id)
                                    TriggerServerEvent("requestspec", w.id)
                                else
                                    if Config.builtinnotify ~= nil then
                                        TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                                    else
                                        if Config.ownnotify.notifycolor ~= nil and not false then
                                            TriggerEvent(
                                                Config.ownnotify.trigger,
                                                source,
                                                Config.ownnotify.color,
                                                Config.ownnotify.title,
                                                Lang("notinduty")
                                            )
                                        else
                                            TriggerEvent(
                                                Config.ownnotify.trigger,
                                                source,
                                                Config.ownnotify.title,
                                                Lang("notinduty")
                                            )
                                        end
                                    end
                                end
                            else
                                TriggerServerEvent("logspec", q.username, w.id)
                                TriggerServerEvent("requestspec", w.id)
                            end
                        end
                    end
                elseif w.type == "goto" then
                    if w.id == nil then
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("nooneselected"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("nooneselected")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("nooneselected")
                                )
                            end
                        end
                    else
                        if Config.Amenu.needtobeinaduty ~= nil then
                            if Config.Amenu.needtobeinaduty then
                                if b then
                                    TriggerServerEvent("loggoto", q.username, w.id)
                                    TriggerServerEvent("goto", w.id)
                                else
                                    if Config.builtinnotify ~= nil then
                                        TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                                    else
                                        if Config.ownnotify.notifycolor ~= nil and not false then
                                            TriggerEvent(
                                                Config.ownnotify.trigger,
                                                source,
                                                Config.ownnotify.color,
                                                Config.ownnotify.title,
                                                Lang("notinduty")
                                            )
                                        else
                                            TriggerEvent(
                                                Config.ownnotify.trigger,
                                                source,
                                                Config.ownnotify.title,
                                                Lang("notinduty")
                                            )
                                        end
                                    end
                                end
                            else
                                TriggerServerEvent("loggoto", q.username, w.id)
                                TriggerServerEvent("goto", w.id)
                            end
                        end
                    end
                elseif w.type == "screenshot" then
                    if w.id == nil then
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("nooneselected"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("nooneselected")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("nooneselected")
                                )
                            end
                        end
                    else
                        if Config.Amenu.needtobeinaduty ~= nil then
                            if Config.Amenu.needtobeinaduty then
                                if b then
                                    if dnz_system.webhook.webhooks.screenshots.savelog ~= "" then
                                        TriggerServerEvent("screenshot_save", w.id)
                                        if Config.builtinnotify ~= nil then
                                            TriggerEvent(
                                                "dnz_amenuv2:notify",
                                                source,
                                                "Adminmenu",
                                                Lang("screenshotwaiting")
                                            )
                                        else
                                            if Config.ownnotify.notifycolor ~= nil and not false then
                                                TriggerEvent(
                                                    Config.ownnotify.trigger,
                                                    source,
                                                    Config.ownnotify.color,
                                                    Config.ownnotify.title,
                                                    Lang("screenshotwaiting")
                                                )
                                            else
                                                TriggerEvent(
                                                    Config.ownnotify.trigger,
                                                    source,
                                                    Config.ownnotify.title,
                                                    Lang("screenshotwaiting")
                                                )
                                            end
                                        end
                                    else
                                        TriggerServerEvent("SCREENLOGNEEDED")
                                    end
                                    Citizen.Wait(250)
                                    TriggerServerEvent("screenshot-alllog", source, w.id)
                                    Citizen.Wait(250)
                                    TriggerServerEvent("screenshot-alllog2", source, w.id)
                                else
                                    if Config.builtinnotify ~= nil then
                                        TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                                    else
                                        if Config.ownnotify.notifycolor ~= nil and not false then
                                            TriggerEvent(
                                                Config.ownnotify.trigger,
                                                source,
                                                Config.ownnotify.color,
                                                Config.ownnotify.title,
                                                Lang("notinduty")
                                            )
                                        else
                                            TriggerEvent(
                                                Config.ownnotify.trigger,
                                                source,
                                                Config.ownnotify.title,
                                                Lang("notinduty")
                                            )
                                        end
                                    end
                                end
                            else
                                if dnz_system.webhook.webhooks.screenshots.savelog ~= "" then
                                    TriggerServerEvent("screenshot_save", w.id)
                                    if Config.builtinnotify ~= nil then
                                        TriggerEvent(
                                            "dnz_amenuv2:notify",
                                            source,
                                            "Adminmenu",
                                            Lang("screenshotwaiting")
                                        )
                                    else
                                        if Config.ownnotify.notifycolor ~= nil and not false then
                                            TriggerEvent(
                                                Config.ownnotify.trigger,
                                                source,
                                                Config.ownnotify.color,
                                                Config.ownnotify.title,
                                                Lang("screenshotwaiting")
                                            )
                                        else
                                            TriggerEvent(
                                                Config.ownnotify.trigger,
                                                source,
                                                Config.ownnotify.title,
                                                Lang("screenshotwaiting")
                                            )
                                        end
                                    end
                                else
                                    TriggerServerEvent("SCREENLOGNEEDED")
                                end
                                Citizen.Wait(250)
                                TriggerServerEvent("screenshot-alllog", source, w.id)
                                Citizen.Wait(250)
                                TriggerServerEvent("screenshot-alllog2", source, w.id)
                            end
                        end
                    end
                elseif w.type == "bring" then
                    if w.id == nil then
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("nooneselected"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("nooneselected")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("nooneselected")
                                )
                            end
                        end
                    else
                        if Config.Amenu.needtobeinaduty ~= nil then
                            if Config.Amenu.needtobeinaduty then
                                if b then
                                    TriggerServerEvent("logbring", q.username, w.id)
                                    local V = GetActivePlayers()
                                    for W = 1, #V do
                                        local X = V[W]
                                        local ped = PlayerPedId(X)
                                        if w.id then
                                            TriggerServerEvent(
                                                "bringplayertome",
                                                w.id,
                                                GetEntityCoords(PlayerPedId()).x,
                                                GetEntityCoords(PlayerPedId()).y,
                                                GetEntityCoords(PlayerPedId()).z
                                            )
                                        end
                                    end
                                else
                                    if Config.builtinnotify ~= nil then
                                        TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                                    else
                                        if Config.ownnotify.notifycolor ~= nil and not false then
                                            TriggerEvent(
                                                Config.ownnotify.trigger,
                                                source,
                                                Config.ownnotify.color,
                                                Config.ownnotify.title,
                                                Lang("notinduty")
                                            )
                                        else
                                            TriggerEvent(
                                                Config.ownnotify.trigger,
                                                source,
                                                Config.ownnotify.title,
                                                Lang("notinduty")
                                            )
                                        end
                                    end
                                end
                            else
                                TriggerServerEvent("logbring", q.username, w.id)
                                local V = GetActivePlayers()
                                for W = 1, #V do
                                    local X = V[W]
                                    local ped = PlayerPedId(X)
                                    if w.id then
                                        TriggerServerEvent(
                                            "bringplayertome",
                                            w.id,
                                            GetEntityCoords(PlayerPedId()).x,
                                            GetEntityCoords(PlayerPedId()).y,
                                            GetEntityCoords(PlayerPedId()).z
                                        )
                                    end
                                end
                            end
                        end
                    end
                elseif w.type == "kick" then
                    if w.id == nil then
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("nooneselected"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("nooneselected")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("nooneselected")
                                )
                            end
                        end
                    else
                        if Config.Amenu.needtobeinaduty ~= nil then
                            if Config.Amenu.needtobeinaduty then
                                if b then
                                    if string.len(w.reason) < 1 then
                                        TriggerEvent("noreason", source)
                                        return
                                    else
                                        TriggerServerEvent("kicknotify", w.id, w.reason)
                                        TriggerServerEvent("logkick", GetPlayerName(PlayerId()), w.id, w.reason)
                                        if g == "de" then
                                            TriggerServerEvent(
                                                "kick",
                                                w.id,
                                                "Du wurdest von " ..
                                                    GetPlayerName(PlayerId()) .. " gekickt\n Grund: " .. w.reason,
                                                w.reason
                                            )
                                        elseif g == "en" then
                                            TriggerServerEvent(
                                                "kick",
                                                w.id,
                                                "You got kicked by " ..
                                                    GetPlayerName(PlayerId()) .. " \n Reason: " .. w.reason,
                                                w.reason
                                            )
                                        end
                                    end
                                else
                                    if Config.builtinnotify ~= nil then
                                        TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                                    else
                                        if Config.ownnotify.notifycolor ~= nil and not false then
                                            TriggerEvent(
                                                Config.ownnotify.trigger,
                                                source,
                                                Config.ownnotify.color,
                                                Config.ownnotify.title,
                                                Lang("notinduty")
                                            )
                                        else
                                            TriggerEvent(
                                                Config.ownnotify.trigger,
                                                source,
                                                Config.ownnotify.title,
                                                Lang("notinduty")
                                            )
                                        end
                                    end
                                end
                            else
                                if string.len(w.reason) < 1 then
                                    TriggerEvent("noreason", source)
                                    return
                                else
                                    TriggerServerEvent("kicknotify", w.id, w.reason)
                                    TriggerServerEvent("logkick", GetPlayerName(PlayerId()), w.id, w.reason)
                                    if g == "de" then
                                        TriggerServerEvent(
                                            "kick",
                                            w.id,
                                            "Du wurdest von " ..
                                                GetPlayerName(PlayerId()) .. " gekickt\n Grund: " .. w.reason,
                                            w.reason
                                        )
                                    elseif g == "en" then
                                        TriggerServerEvent(
                                            "kick",
                                            w.id,
                                            "You got kicked by " ..
                                                GetPlayerName(PlayerId()) .. " \n Reason: " .. w.reason,
                                            w.reason
                                        )
                                    end
                                end
                            end
                        end
                    end
                elseif w.type == "warn" then
                    if w.id == nil then
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("nooneselected"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("nooneselected")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("nooneselected")
                                )
                            end
                        end
                    else
                        if Config.Amenu.needtobeinaduty ~= nil then
                            if Config.Amenu.needtobeinaduty then
                                if b then
                                    if string.len(w.reason) < 1 then
                                        TriggerEvent("noreason", source)
                                        return
                                    else
                                        TriggerServerEvent("logwarn", q.username, w.id, w.reason)
                                        TriggerServerEvent("warnnotify1", w.id, q.username, w.reason)
                                        TriggerServerEvent("warnnotify2", w.id, w.reason)
                                        TriggerServerEvent("warn", q.username, w.id, w.reason)
                                    end
                                else
                                    if Config.builtinnotify ~= nil then
                                        TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                                    else
                                        if Config.ownnotify.notifycolor ~= nil and not false then
                                            TriggerEvent(
                                                Config.ownnotify.trigger,
                                                source,
                                                Config.ownnotify.color,
                                                Config.ownnotify.title,
                                                Lang("notinduty")
                                            )
                                        else
                                            TriggerEvent(
                                                Config.ownnotify.trigger,
                                                source,
                                                Config.ownnotify.title,
                                                Lang("notinduty")
                                            )
                                        end
                                    end
                                end
                            else
                                if string.len(w.reason) < 1 then
                                    TriggerEvent("noreason", source)
                                    return
                                else
                                    TriggerServerEvent("logwarn", q.username, w.id, w.reason)
                                    TriggerServerEvent("warnnotify1", w.id, q.username, w.reason)
                                    TriggerServerEvent("warnnotify2", w.id, w.reason)
                                    TriggerServerEvent("warn", q.username, w.id, w.reason)
                                end
                            end
                        end
                    end
                elseif w.type == "ban" then
                    if w.id == nil then
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("nooneselected"))
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("nooneselected")
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("nooneselected")
                                )
                            end
                        end
                    else
                        if Config.Amenu.needtobeinaduty ~= nil then
                            if Config.Amenu.needtobeinaduty then
                                if b then
                                    ESX.TriggerServerCallback(
                                        "dnz_amenuv2:getCurrentInfo",
                                        function(q)
                                            if string.len(w.reason) < 1 then
                                                TriggerEvent("noreason", source)
                                                return
                                            else
                                                if g == "de" then
                                                    if w.banlength == "1day" then
                                                        banlengthtranslate = "1 Tag"
                                                    elseif w.banlength == "3day" then
                                                        banlengthtranslate = "3 Tage"
                                                    elseif w.banlength == "1week" then
                                                        banlengthtranslate = "1 Woche"
                                                    elseif w.banlength == "2weeks" then
                                                        banlengthtranslate = "2 Wochen"
                                                    elseif w.banlength == "3weeks" then
                                                        banlengthtranslate = "3 Wochen"
                                                    elseif w.banlength == "1month" then
                                                        banlengthtranslate = "1 Monat"
                                                    elseif w.banlength == "3months" then
                                                        banlengthtranslate = "3 Monate"
                                                    elseif w.banlength == "6months" then
                                                        banlengthtranslate = "6 Monate"
                                                    elseif w.banlength == "perma" then
                                                        banlengthtranslate = "Permanent"
                                                    end
                                                elseif g == "en" then
                                                    if w.banlength == "1day" then
                                                        banlengthtranslate = "1 day"
                                                    elseif w.banlength == "3day" then
                                                        banlengthtranslate = "3 days"
                                                    elseif w.banlength == "1weeks" then
                                                        banlengthtranslate = "1 week"
                                                    elseif w.banlength == "2weeks" then
                                                        banlengthtranslate = "2 weeks"
                                                    elseif w.banlength == "3weeks" then
                                                        banlengthtranslate = "3 weeks"
                                                    elseif w.banlength == "1month" then
                                                        banlengthtranslate = "1 month"
                                                    elseif w.banlength == "3months" then
                                                        banlengthtranslate = "3 months"
                                                    elseif w.banlength == "6months" then
                                                        banlengthtranslate = "6 months"
                                                    elseif w.banlength == "perma" then
                                                        banlengthtranslate = "Permanent"
                                                    end
                                                end
                                                if w.banlength == "1day" then
                                                    for r, s in pairs(Config.Permissions.ban.one_day) do
                                                        if s == q.admingroup then
                                                            TriggerServerEvent(
                                                                "logban",
                                                                banlengthtranslate,
                                                                w.reason,
                                                                q.username,
                                                                w.id
                                                            )
                                                            TriggerServerEvent(
                                                                "ban",
                                                                q.username,
                                                                w.id,
                                                                1,
                                                                w.reason,
                                                                banlengthtranslate
                                                            )
                                                            TriggerServerEvent("bannotify", w.id, w.reason)
                                                            return true
                                                        end
                                                    end
                                                    if Config.builtinnotify ~= nil then
                                                        TriggerEvent(
                                                            "dnz_amenuv2:notify",
                                                            source,
                                                            "Adminmenu",
                                                            Lang("lengthnotallowed")
                                                        )
                                                    else
                                                        if Config.ownnotify.notifycolor ~= nil and not false then
                                                            TriggerEvent(
                                                                Config.ownnotify.trigger,
                                                                source,
                                                                Config.ownnotify.color,
                                                                Config.ownnotify.title,
                                                                Lang("lengthnotallowed")
                                                            )
                                                        else
                                                            TriggerEvent(
                                                                Config.ownnotify.trigger,
                                                                source,
                                                                Config.ownnotify.title,
                                                                Lang("lengthnotallowed")
                                                            )
                                                        end
                                                    end
                                                    return false
                                                elseif w.banlength == "3day" then
                                                    for r, s in pairs(Config.Permissions.ban.three_days) do
                                                        if s == q.admingroup then
                                                            TriggerServerEvent(
                                                                "logban",
                                                                banlengthtranslate,
                                                                w.reason,
                                                                q.username,
                                                                w.id
                                                            )
                                                            TriggerServerEvent(
                                                                "ban",
                                                                q.username,
                                                                w.id,
                                                                3,
                                                                w.reason,
                                                                banlengthtranslate
                                                            )
                                                            TriggerServerEvent("bannotify", w.id, w.reason)
                                                            return true
                                                        end
                                                    end
                                                    if Config.builtinnotify ~= nil then
                                                        TriggerEvent(
                                                            "dnz_amenuv2:notify",
                                                            source,
                                                            "Adminmenu",
                                                            Lang("lengthnotallowed")
                                                        )
                                                    else
                                                        if Config.ownnotify.notifycolor ~= nil and not false then
                                                            TriggerEvent(
                                                                Config.ownnotify.trigger,
                                                                source,
                                                                Config.ownnotify.color,
                                                                Config.ownnotify.title,
                                                                Lang("lengthnotallowed")
                                                            )
                                                        else
                                                            TriggerEvent(
                                                                Config.ownnotify.trigger,
                                                                source,
                                                                Config.ownnotify.title,
                                                                Lang("lengthnotallowed")
                                                            )
                                                        end
                                                    end
                                                    return false
                                                elseif w.banlength == "1weeks" then
                                                    for r, s in pairs(Config.Permissions.ban.one_week) do
                                                        if s == q.admingroup then
                                                            TriggerServerEvent(
                                                                "logban",
                                                                banlengthtranslate,
                                                                w.reason,
                                                                q.username,
                                                                w.id
                                                            )
                                                            TriggerServerEvent(
                                                                "ban",
                                                                q.username,
                                                                w.id,
                                                                7,
                                                                w.reason,
                                                                banlengthtranslate
                                                            )
                                                            TriggerServerEvent("bannotify", w.id, w.reason)
                                                            return true
                                                        end
                                                    end
                                                    if Config.builtinnotify ~= nil then
                                                        TriggerEvent(
                                                            "dnz_amenuv2:notify",
                                                            source,
                                                            "Adminmenu",
                                                            Lang("lengthnotallowed")
                                                        )
                                                    else
                                                        if Config.ownnotify.notifycolor ~= nil and not false then
                                                            TriggerEvent(
                                                                Config.ownnotify.trigger,
                                                                source,
                                                                Config.ownnotify.color,
                                                                Config.ownnotify.title,
                                                                Lang("lengthnotallowed")
                                                            )
                                                        else
                                                            TriggerEvent(
                                                                Config.ownnotify.trigger,
                                                                source,
                                                                Config.ownnotify.title,
                                                                Lang("lengthnotallowed")
                                                            )
                                                        end
                                                    end
                                                    return false
                                                elseif w.banlength == "2weeks" then
                                                    for r, s in pairs(Config.Permissions.ban.two_weeks) do
                                                        if s == q.admingroup then
                                                            TriggerServerEvent(
                                                                "logban",
                                                                banlengthtranslate,
                                                                w.reason,
                                                                q.username,
                                                                w.id
                                                            )
                                                            TriggerServerEvent(
                                                                "ban",
                                                                q.username,
                                                                w.id,
                                                                14,
                                                                w.reason,
                                                                banlengthtranslate
                                                            )
                                                            TriggerServerEvent("bannotify", w.id, w.reason)
                                                            return true
                                                        end
                                                    end
                                                    if Config.builtinnotify ~= nil then
                                                        TriggerEvent(
                                                            "dnz_amenuv2:notify",
                                                            source,
                                                            "Adminmenu",
                                                            Lang("lengthnotallowed")
                                                        )
                                                    else
                                                        if Config.ownnotify.notifycolor ~= nil and not false then
                                                            TriggerEvent(
                                                                Config.ownnotify.trigger,
                                                                source,
                                                                Config.ownnotify.color,
                                                                Config.ownnotify.title,
                                                                Lang("lengthnotallowed")
                                                            )
                                                        else
                                                            TriggerEvent(
                                                                Config.ownnotify.trigger,
                                                                source,
                                                                Config.ownnotify.title,
                                                                Lang("lengthnotallowed")
                                                            )
                                                        end
                                                    end
                                                    return false
                                                elseif w.banlength == "3weeks" then
                                                    for r, s in pairs(Config.Permissions.ban.three_weeks) do
                                                        if s == q.admingroup then
                                                            TriggerServerEvent(
                                                                "logban",
                                                                banlengthtranslate,
                                                                w.reason,
                                                                q.username,
                                                                w.id
                                                            )
                                                            TriggerServerEvent(
                                                                "ban",
                                                                q.username,
                                                                w.id,
                                                                21,
                                                                w.reason,
                                                                banlengthtranslate
                                                            )
                                                            TriggerServerEvent("bannotify", w.id, w.reason)
                                                            return true
                                                        end
                                                    end
                                                    if Config.builtinnotify ~= nil then
                                                        TriggerEvent(
                                                            "dnz_amenuv2:notify",
                                                            source,
                                                            "Adminmenu",
                                                            Lang("lengthnotallowed")
                                                        )
                                                    else
                                                        if Config.ownnotify.notifycolor ~= nil and not false then
                                                            TriggerEvent(
                                                                Config.ownnotify.trigger,
                                                                source,
                                                                Config.ownnotify.color,
                                                                Config.ownnotify.title,
                                                                Lang("lengthnotallowed")
                                                            )
                                                        else
                                                            TriggerEvent(
                                                                Config.ownnotify.trigger,
                                                                source,
                                                                Config.ownnotify.title,
                                                                Lang("lengthnotallowed")
                                                            )
                                                        end
                                                    end
                                                    return false
                                                elseif w.banlength == "1month" then
                                                    for r, s in pairs(Config.Permissions.ban.one_month) do
                                                        if s == q.admingroup then
                                                            TriggerServerEvent(
                                                                "logban",
                                                                banlengthtranslate,
                                                                w.reason,
                                                                q.username,
                                                                w.id
                                                            )
                                                            TriggerServerEvent(
                                                                "ban",
                                                                q.username,
                                                                w.id,
                                                                28,
                                                                w.reason,
                                                                banlengthtranslate
                                                            )
                                                            iTriggerServerEvent("bannotify", w.id, w.reason)
                                                            return true
                                                        end
                                                    end
                                                    if Config.builtinnotify ~= nil then
                                                        TriggerEvent(
                                                            "dnz_amenuv2:notify",
                                                            source,
                                                            "Adminmenu",
                                                            Lang("lengthnotallowed")
                                                        )
                                                    else
                                                        if Config.ownnotify.notifycolor ~= nil and not false then
                                                            TriggerEvent(
                                                                Config.ownnotify.trigger,
                                                                source,
                                                                Config.ownnotify.color,
                                                                Config.ownnotify.title,
                                                                Lang("lengthnotallowed")
                                                            )
                                                        else
                                                            TriggerEvent(
                                                                Config.ownnotify.trigger,
                                                                source,
                                                                Config.ownnotify.title,
                                                                Lang("lengthnotallowed")
                                                            )
                                                        end
                                                    end
                                                    return false
                                                elseif w.banlength == "3months" then
                                                    for r, s in pairs(Config.Permissions.ban.three_months) do
                                                        if s == q.admingroup then
                                                            TriggerServerEvent(
                                                                "logban",
                                                                banlengthtranslate,
                                                                w.reason,
                                                                q.username,
                                                                w.id
                                                            )
                                                            TriggerServerEvent(
                                                                "ban",
                                                                q.username,
                                                                w.id,
                                                                84,
                                                                w.reason,
                                                                banlengthtranslate
                                                            )
                                                            TriggerServerEvent("bannotify", w.id, w.reason)
                                                            return true
                                                        end
                                                    end
                                                    if Config.builtinnotify ~= nil then
                                                        TriggerEvent(
                                                            "dnz_amenuv2:notify",
                                                            source,
                                                            "Adminmenu",
                                                            Lang("lengthnotallowed")
                                                        )
                                                    else
                                                        if Config.ownnotify.notifycolor ~= nil and not false then
                                                            TriggerEvent(
                                                                Config.ownnotify.trigger,
                                                                source,
                                                                Config.ownnotify.color,
                                                                Config.ownnotify.title,
                                                                Lang("lengthnotallowed")
                                                            )
                                                        else
                                                            TriggerEvent(
                                                                Config.ownnotify.trigger,
                                                                source,
                                                                Config.ownnotify.title,
                                                                Lang("lengthnotallowed")
                                                            )
                                                        end
                                                    end
                                                    return false
                                                elseif w.banlength == "6months" then
                                                    for r, s in pairs(Config.Permissions.ban.six_months) do
                                                        if s == q.admingroup then
                                                            TriggerServerEvent(
                                                                "logban",
                                                                banlengthtranslate,
                                                                w.reason,
                                                                q.username,
                                                                w.id
                                                            )
                                                            TriggerServerEvent(
                                                                "ban",
                                                                q.username,
                                                                w.id,
                                                                168,
                                                                w.reason,
                                                                banlengthtranslate
                                                            )
                                                            TriggerServerEvent("bannotify", w.id, w.reason)
                                                            return true
                                                        end
                                                    end
                                                    if Config.builtinnotify ~= nil then
                                                        TriggerEvent(
                                                            "dnz_amenuv2:notify",
                                                            source,
                                                            "Adminmenu",
                                                            Lang("lengthnotallowed")
                                                        )
                                                    else
                                                        if Config.ownnotify.notifycolor ~= nil and not false then
                                                            TriggerEvent(
                                                                Config.ownnotify.trigger,
                                                                source,
                                                                Config.ownnotify.color,
                                                                Config.ownnotify.title,
                                                                Lang("lengthnotallowed")
                                                            )
                                                        else
                                                            TriggerEvent(
                                                                Config.ownnotify.trigger,
                                                                source,
                                                                Config.ownnotify.title,
                                                                Lang("lengthnotallowed")
                                                            )
                                                        end
                                                    end
                                                    return false
                                                elseif w.banlength == "perma" then
                                                    for r, s in pairs(Config.Permissions.ban.permanent) do
                                                        if s == q.admingroup then
                                                            TriggerServerEvent(
                                                                "logban",
                                                                banlengthtranslate,
                                                                w.reason,
                                                                q.username,
                                                                w.id
                                                            )
                                                            TriggerServerEvent(
                                                                "ban",
                                                                q.username,
                                                                w.id,
                                                                "permanent",
                                                                w.reason,
                                                                banlengthtranslate
                                                            )
                                                            TriggerServerEvent("bannotify", w.id, w.reason)
                                                            return true
                                                        end
                                                    end
                                                    if Config.builtinnotify ~= nil then
                                                        TriggerEvent(
                                                            "dnz_amenuv2:notify",
                                                            source,
                                                            "Adminmenu",
                                                            Lang("lengthnotallowed")
                                                        )
                                                    else
                                                        if Config.ownnotify.notifycolor ~= nil and not false then
                                                            TriggerEvent(
                                                                Config.ownnotify.trigger,
                                                                source,
                                                                Config.ownnotify.color,
                                                                Config.ownnotify.title,
                                                                Lang("lengthnotallowed")
                                                            )
                                                        else
                                                            TriggerEvent(
                                                                Config.ownnotify.trigger,
                                                                source,
                                                                Config.ownnotify.title,
                                                                Lang("lengthnotallowed")
                                                            )
                                                        end
                                                    end
                                                    return false
                                                end
                                            end
                                        end
                                    )
                                else
                                    if Config.builtinnotify ~= nil then
                                        TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notinduty"))
                                    else
                                        if Config.ownnotify.notifycolor ~= nil and not false then
                                            TriggerEvent(
                                                Config.ownnotify.trigger,
                                                source,
                                                Config.ownnotify.color,
                                                Config.ownnotify.title,
                                                Lang("notinduty")
                                            )
                                        else
                                            TriggerEvent(
                                                Config.ownnotify.trigger,
                                                source,
                                                Config.ownnotify.title,
                                                Lang("notinduty")
                                            )
                                        end
                                    end
                                end
                            else
                                ESX.TriggerServerCallback(
                                    "dnz_amenuv2:getCurrentInfo",
                                    function(q)
                                        if string.len(w.reason) < 1 then
                                            TriggerEvent("noreason", source)
                                            return
                                        else
                                            if g == "de" then
                                                if w.banlength == "1day" then
                                                    banlengthtranslate = "1 Tag"
                                                elseif w.banlength == "3day" then
                                                    banlengthtranslate = "3 Tage"
                                                elseif w.banlength == "1week" then
                                                    banlengthtranslate = "1 Woche"
                                                elseif w.banlength == "2weeks" then
                                                    banlengthtranslate = "2 Wochen"
                                                elseif w.banlength == "3weeks" then
                                                    banlengthtranslate = "3 Wochen"
                                                elseif w.banlength == "1month" then
                                                    banlengthtranslate = "1 Monat"
                                                elseif w.banlength == "3months" then
                                                    banlengthtranslate = "3 Monate"
                                                elseif w.banlength == "6months" then
                                                    banlengthtranslate = "6 Monate"
                                                elseif w.banlength == "perma" then
                                                    banlengthtranslate = "Permanent"
                                                end
                                            elseif g == "en" then
                                                if w.banlength == "1day" then
                                                    banlengthtranslate = "1 day"
                                                elseif w.banlength == "3day" then
                                                    banlengthtranslate = "3 days"
                                                elseif w.banlength == "1weeks" then
                                                    banlengthtranslate = "1 week"
                                                elseif w.banlength == "2weeks" then
                                                    banlengthtranslate = "2 weeks"
                                                elseif w.banlength == "3weeks" then
                                                    banlengthtranslate = "3 weeks"
                                                elseif w.banlength == "1month" then
                                                    banlengthtranslate = "1 month"
                                                elseif w.banlength == "3months" then
                                                    banlengthtranslate = "3 months"
                                                elseif w.banlength == "6months" then
                                                    banlengthtranslate = "6 months"
                                                elseif w.banlength == "perma" then
                                                    banlengthtranslate = "Permanent"
                                                end
                                            end
                                            if w.banlength == "1day" then
                                                for r, s in pairs(Config.Permissions.ban.one_day) do
                                                    if s == q.admingroup then
                                                        TriggerServerEvent(
                                                            "logban",
                                                            banlengthtranslate,
                                                            w.reason,
                                                            q.username,
                                                            w.id
                                                        )
                                                        TriggerServerEvent(
                                                            "ban",
                                                            q.username,
                                                            w.id,
                                                            1,
                                                            w.reason,
                                                            banlengthtranslate
                                                        )
                                                        TriggerServerEvent("bannotify", w.id, w.reason)
                                                        return true
                                                    end
                                                end
                                                if Config.builtinnotify ~= nil then
                                                    TriggerEvent(
                                                        "dnz_amenuv2:notify",
                                                        source,
                                                        "Adminmenu",
                                                        Lang("lengthnotallowed")
                                                    )
                                                else
                                                    if Config.ownnotify.notifycolor ~= nil and not false then
                                                        TriggerEvent(
                                                            Config.ownnotify.trigger,
                                                            source,
                                                            Config.ownnotify.color,
                                                            Config.ownnotify.title,
                                                            Lang("lengthnotallowed")
                                                        )
                                                    else
                                                        TriggerEvent(
                                                            Config.ownnotify.trigger,
                                                            source,
                                                            Config.ownnotify.title,
                                                            Lang("lengthnotallowed")
                                                        )
                                                    end
                                                end
                                                return false
                                            elseif w.banlength == "3day" then
                                                for r, s in pairs(Config.Permissions.ban.three_days) do
                                                    if s == q.admingroup then
                                                        TriggerServerEvent(
                                                            "logban",
                                                            banlengthtranslate,
                                                            w.reason,
                                                            q.username,
                                                            w.id
                                                        )
                                                        TriggerServerEvent(
                                                            "ban",
                                                            q.username,
                                                            w.id,
                                                            3,
                                                            w.reason,
                                                            banlengthtranslate
                                                        )
                                                        TriggerServerEvent("bannotify", w.id, w.reason)
                                                        return true
                                                    end
                                                end
                                                if Config.builtinnotify ~= nil then
                                                    TriggerEvent(
                                                        "dnz_amenuv2:notify",
                                                        source,
                                                        "Adminmenu",
                                                        Lang("lengthnotallowed")
                                                    )
                                                else
                                                    if Config.ownnotify.notifycolor ~= nil and not false then
                                                        TriggerEvent(
                                                            Config.ownnotify.trigger,
                                                            source,
                                                            Config.ownnotify.color,
                                                            Config.ownnotify.title,
                                                            Lang("lengthnotallowed")
                                                        )
                                                    else
                                                        TriggerEvent(
                                                            Config.ownnotify.trigger,
                                                            source,
                                                            Config.ownnotify.title,
                                                            Lang("lengthnotallowed")
                                                        )
                                                    end
                                                end
                                                return false
                                            elseif w.banlength == "1weeks" then
                                                for r, s in pairs(Config.Permissions.ban.one_week) do
                                                    if s == q.admingroup then
                                                        TriggerServerEvent(
                                                            "logban",
                                                            banlengthtranslate,
                                                            w.reason,
                                                            q.username,
                                                            w.id
                                                        )
                                                        TriggerServerEvent(
                                                            "ban",
                                                            q.username,
                                                            w.id,
                                                            7,
                                                            w.reason,
                                                            banlengthtranslate
                                                        )
                                                        TriggerServerEvent("bannotify", w.id, w.reason)
                                                        return true
                                                    end
                                                end
                                                if Config.builtinnotify ~= nil then
                                                    TriggerEvent(
                                                        "dnz_amenuv2:notify",
                                                        source,
                                                        "Adminmenu",
                                                        Lang("lengthnotallowed")
                                                    )
                                                else
                                                    if Config.ownnotify.notifycolor ~= nil and not false then
                                                        TriggerEvent(
                                                            Config.ownnotify.trigger,
                                                            source,
                                                            Config.ownnotify.color,
                                                            Config.ownnotify.title,
                                                            Lang("lengthnotallowed")
                                                        )
                                                    else
                                                        TriggerEvent(
                                                            Config.ownnotify.trigger,
                                                            source,
                                                            Config.ownnotify.title,
                                                            Lang("lengthnotallowed")
                                                        )
                                                    end
                                                end
                                                return false
                                            elseif w.banlength == "2weeks" then
                                                for r, s in pairs(Config.Permissions.ban.two_weeks) do
                                                    if s == q.admingroup then
                                                        TriggerServerEvent(
                                                            "logban",
                                                            banlengthtranslate,
                                                            w.reason,
                                                            q.username,
                                                            w.id
                                                        )
                                                        TriggerServerEvent(
                                                            "ban",
                                                            q.username,
                                                            w.id,
                                                            14,
                                                            w.reason,
                                                            banlengthtranslate
                                                        )
                                                        TriggerServerEvent("bannotify", w.id, w.reason)
                                                        return true
                                                    end
                                                end
                                                if Config.builtinnotify ~= nil then
                                                    TriggerEvent(
                                                        "dnz_amenuv2:notify",
                                                        source,
                                                        "Adminmenu",
                                                        Lang("lengthnotallowed")
                                                    )
                                                else
                                                    if Config.ownnotify.notifycolor ~= nil and not false then
                                                        TriggerEvent(
                                                            Config.ownnotify.trigger,
                                                            source,
                                                            Config.ownnotify.color,
                                                            Config.ownnotify.title,
                                                            Lang("lengthnotallowed")
                                                        )
                                                    else
                                                        TriggerEvent(
                                                            Config.ownnotify.trigger,
                                                            source,
                                                            Config.ownnotify.title,
                                                            Lang("lengthnotallowed")
                                                        )
                                                    end
                                                end
                                                return false
                                            elseif w.banlength == "3weeks" then
                                                for r, s in pairs(Config.Permissions.ban.three_weeks) do
                                                    if s == q.admingroup then
                                                        TriggerServerEvent(
                                                            "logban",
                                                            banlengthtranslate,
                                                            w.reason,
                                                            q.username,
                                                            w.id
                                                        )
                                                        TriggerServerEvent(
                                                            "ban",
                                                            q.username,
                                                            w.id,
                                                            21,
                                                            w.reason,
                                                            banlengthtranslate
                                                        )
                                                        TriggerServerEvent("bannotify", w.id, w.reason)
                                                        return true
                                                    end
                                                end
                                                if Config.builtinnotify ~= nil then
                                                    TriggerEvent(
                                                        "dnz_amenuv2:notify",
                                                        source,
                                                        "Adminmenu",
                                                        Lang("lengthnotallowed")
                                                    )
                                                else
                                                    if Config.ownnotify.notifycolor ~= nil and not false then
                                                        TriggerEvent(
                                                            Config.ownnotify.trigger,
                                                            source,
                                                            Config.ownnotify.color,
                                                            Config.ownnotify.title,
                                                            Lang("lengthnotallowed")
                                                        )
                                                    else
                                                        TriggerEvent(
                                                            Config.ownnotify.trigger,
                                                            source,
                                                            Config.ownnotify.title,
                                                            Lang("lengthnotallowed")
                                                        )
                                                    end
                                                end
                                                return false
                                            elseif w.banlength == "1month" then
                                                for r, s in pairs(Config.Permissions.ban.one_month) do
                                                    if s == q.admingroup then
                                                        TriggerServerEvent(
                                                            "logban",
                                                            banlengthtranslate,
                                                            w.reason,
                                                            q.username,
                                                            w.id
                                                        )
                                                        TriggerServerEvent(
                                                            "ban",
                                                            q.username,
                                                            w.id,
                                                            28,
                                                            w.reason,
                                                            banlengthtranslate
                                                        )
                                                        iTriggerServerEvent("bannotify", w.id, w.reason)
                                                        return true
                                                    end
                                                end
                                                if Config.builtinnotify ~= nil then
                                                    TriggerEvent(
                                                        "dnz_amenuv2:notify",
                                                        source,
                                                        "Adminmenu",
                                                        Lang("lengthnotallowed")
                                                    )
                                                else
                                                    if Config.ownnotify.notifycolor ~= nil and not false then
                                                        TriggerEvent(
                                                            Config.ownnotify.trigger,
                                                            source,
                                                            Config.ownnotify.color,
                                                            Config.ownnotify.title,
                                                            Lang("lengthnotallowed")
                                                        )
                                                    else
                                                        TriggerEvent(
                                                            Config.ownnotify.trigger,
                                                            source,
                                                            Config.ownnotify.title,
                                                            Lang("lengthnotallowed")
                                                        )
                                                    end
                                                end
                                                return false
                                            elseif w.banlength == "3months" then
                                                for r, s in pairs(Config.Permissions.ban.three_months) do
                                                    if s == q.admingroup then
                                                        TriggerServerEvent(
                                                            "logban",
                                                            banlengthtranslate,
                                                            w.reason,
                                                            q.username,
                                                            w.id
                                                        )
                                                        TriggerServerEvent(
                                                            "ban",
                                                            q.username,
                                                            w.id,
                                                            84,
                                                            w.reason,
                                                            banlengthtranslate
                                                        )
                                                        TriggerServerEvent("bannotify", w.id, w.reason)
                                                        return true
                                                    end
                                                end
                                                if Config.builtinnotify ~= nil then
                                                    TriggerEvent(
                                                        "dnz_amenuv2:notify",
                                                        source,
                                                        "Adminmenu",
                                                        Lang("lengthnotallowed")
                                                    )
                                                else
                                                    if Config.ownnotify.notifycolor ~= nil and not false then
                                                        TriggerEvent(
                                                            Config.ownnotify.trigger,
                                                            source,
                                                            Config.ownnotify.color,
                                                            Config.ownnotify.title,
                                                            Lang("lengthnotallowed")
                                                        )
                                                    else
                                                        TriggerEvent(
                                                            Config.ownnotify.trigger,
                                                            source,
                                                            Config.ownnotify.title,
                                                            Lang("lengthnotallowed")
                                                        )
                                                    end
                                                end
                                                return false
                                            elseif w.banlength == "6months" then
                                                for r, s in pairs(Config.Permissions.ban.six_months) do
                                                    if s == q.admingroup then
                                                        TriggerServerEvent(
                                                            "logban",
                                                            banlengthtranslate,
                                                            w.reason,
                                                            q.username,
                                                            w.id
                                                        )
                                                        TriggerServerEvent(
                                                            "ban",
                                                            q.username,
                                                            w.id,
                                                            168,
                                                            w.reason,
                                                            banlengthtranslate
                                                        )
                                                        TriggerServerEvent("bannotify", w.id, w.reason)
                                                        return true
                                                    end
                                                end
                                                if Config.builtinnotify ~= nil then
                                                    TriggerEvent(
                                                        "dnz_amenuv2:notify",
                                                        source,
                                                        "Adminmenu",
                                                        Lang("lengthnotallowed")
                                                    )
                                                else
                                                    if Config.ownnotify.notifycolor ~= nil and not false then
                                                        TriggerEvent(
                                                            Config.ownnotify.trigger,
                                                            source,
                                                            Config.ownnotify.color,
                                                            Config.ownnotify.title,
                                                            Lang("lengthnotallowed")
                                                        )
                                                    else
                                                        TriggerEvent(
                                                            Config.ownnotify.trigger,
                                                            source,
                                                            Config.ownnotify.title,
                                                            Lang("lengthnotallowed")
                                                        )
                                                    end
                                                end
                                                return false
                                            elseif w.banlength == "perma" then
                                                for r, s in pairs(Config.Permissions.ban.permanent) do
                                                    if s == q.admingroup then
                                                        TriggerServerEvent(
                                                            "logban",
                                                            banlengthtranslate,
                                                            w.reason,
                                                            q.username,
                                                            w.id
                                                        )
                                                        TriggerServerEvent(
                                                            "ban",
                                                            q.username,
                                                            w.id,
                                                            "permanent",
                                                            w.reason,
                                                            banlengthtranslate
                                                        )
                                                        TriggerServerEvent("bannotify", w.id, w.reason)
                                                        return true
                                                    end
                                                end
                                                if Config.builtinnotify ~= nil then
                                                    TriggerEvent(
                                                        "dnz_amenuv2:notify",
                                                        source,
                                                        "Adminmenu",
                                                        Lang("lengthnotallowed")
                                                    )
                                                else
                                                    if Config.ownnotify.notifycolor ~= nil and not false then
                                                        TriggerEvent(
                                                            Config.ownnotify.trigger,
                                                            source,
                                                            Config.ownnotify.color,
                                                            Config.ownnotify.title,
                                                            Lang("lengthnotallowed")
                                                        )
                                                    else
                                                        TriggerEvent(
                                                            Config.ownnotify.trigger,
                                                            source,
                                                            Config.ownnotify.title,
                                                            Lang("lengthnotallowed")
                                                        )
                                                    end
                                                end
                                                return false
                                            end
                                        end
                                    end
                                )
                            end
                        end
                    end
                end
            end
        )
    end
)
RegisterNUICallback(
    "getinfoplayers",
    function(w)
        TriggerServerEvent("getinfoplayers")
        local V = GetActivePlayers()
        for W = 1, #V do
            local X = V[W]
            local ped = PlayerPedId(X)
        end
    end
)
RegisterNUICallback(
    "clearscreenshot",
    function(w)
        SendNUIMessage(
            {
                type = "screenshotadmin",
                url = "https://cdn.discordapp.com/attachments/918942868431851573/948744393148465162/unknown.png"
            }
        )
    end
)
RegisterNUICallback(
    "getplayerinfo",
    function(w)
        TriggerServerEvent("getplayerinfo", w.id)
    end
)
RegisterNUICallback(
    "getplayerinfo23",
    function()
        Citizen.Wait(500)
        TriggerServerEvent("getplayerinfo23")
    end
)
RegisterNUICallback(
    "getplayeraction",
    function(w)
        TriggerServerEvent("getplayeraction", w.id)
    end
)
RegisterNetEvent("cbplayerinfo")
AddEventHandler(
    "cbplayerinfo",
    function(Y)
        SendNUIMessage({type = "playerinfo", pd = Y})
    end
)
RegisterNetEvent("cbplayerinfo2")
AddEventHandler(
    "cbplayerinfo2",
    function(Y)
        SendNUIMessage({type = "playerinfo2", pd = Y})
    end
)
RegisterNetEvent("freezeplayer")
AddEventHandler(
    "freezeplayer",
    function(Z)
        local O = GetPlayerPed(Z)
        freeze = not freeze
        if freeze then
            FreezeEntityPosition(PlayerPedId(O), true)
        else
            FreezeEntityPosition(PlayerPedId(O), false)
        end
    end
)
RegisterNUICallback(
    "deleteban",
    function(w)
        ESX.TriggerServerCallback(
            "dnz_amenuv2:getCurrentInfo",
            function(q)
                for r, v in pairs(Config.Permissions.ban.unban) do
                    if v == q.admingroup then
                        TriggerServerEvent("logunban", w.id)
                        TriggerServerEvent("unban", w.id)
                        if Config.builtinnotify ~= nil then
                            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("youunbanned") .. w.id)
                        else
                            if Config.ownnotify.notifycolor ~= nil and not false then
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.color,
                                    Config.ownnotify.title,
                                    Lang("youunbanned") .. w.id
                                )
                            else
                                TriggerEvent(
                                    Config.ownnotify.trigger,
                                    source,
                                    Config.ownnotify.title,
                                    Lang("youunbanned") .. w.id
                                )
                            end
                        end
                        return true
                    end
                end
                if Config.builtinnotify ~= nil then
                    TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("notallowed"))
                else
                    if Config.ownnotify.notifycolor ~= nil and not false then
                        TriggerEvent(
                            Config.ownnotify.trigger,
                            source,
                            Config.ownnotify.color,
                            Config.ownnotify.title,
                            Lang("notallowed")
                        )
                    else
                        TriggerEvent(Config.ownnotify.trigger, source, Config.ownnotify.title, Lang("notallowed"))
                    end
                end
                return false
            end
        )
    end
)
RegisterNetEvent("getinfoplayers")
AddEventHandler(
    "getinfoplayers",
    function(_)
        SendNUIMessage({type = "clearinfoplayer"})
        SendNUIMessage({type = "clearinfoplayers"})
        for r, v in pairs(_) do
            SendNUIMessage({type = "addinfoplayer", pd = v})
            SendNUIMessage({type = "addactionplayer", pd = v})
        end
    end
)
RegisterNetEvent("nocliped")
AddEventHandler(
    "nocliped",
    function()
        local ped = PlayerPedId()
        if i then
            SetEntityInvincible(ped, true)
            if Config.Aduty.invisiblenoclip then
                SetEntityVisible(ped, false, false)
            end
        elseif not i then
            SetEntityInvincible(ped, false)
            SetEntityVisible(ped, true, false)
        end
    end
)
local a0 = function()
    local a1 = GetGameplayCamRelativeHeading() + GetEntityHeading(PlayerPedId())
    local a2 = GetGameplayCamRelativePitch()
    local E = -math.sin(a1 * math.pi / 180.0)
    local F = math.cos(a1 * math.pi / 180.0)
    local G = math.sin(a2 * math.pi / 180.0)
    local a3 = math.sqrt(E * E + F * F + G * G)
    if a3 ~= 0 then
        E = E / a3
        F = F / a3
        G = G / a3
    end
    return E, F, G
end
local a4 = {
    ["ESC"] = 322,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["1"] = 157,
    ["2"] = 158,
    ["3"] = 160,
    ["4"] = 164,
    ["5"] = 165,
    ["6"] = 159,
    ["7"] = 161,
    ["8"] = 162,
    ["9"] = 163,
    ["-"] = 84,
    ["="] = 83,
    ["BACKSPACE"] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["INSERT"] = 121,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["LEFTCTRL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["TOP"] = 27,
    ["UP"] = 172,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N8"] = 61,
    ["N9"] = 118,
    ["MOUSE1"] = 24
}
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
            if esp then
                local a5 = GetActivePlayers()
                for W = 1, #a5 do
                    local X = a5[W]
                    local a6 = GetEntityCoords(GetPlayerPed(X))
                    local a7 = {r = 255, g = 0, b = 0, a = 200}
                    local a8 = GetPlayerPed(X)
                    local a9 = PlayerPedId(X)
                    local aa, ab, ac = table.unpack(GetEntityCoords(PlayerPedId()))
                    local E, F, G = table.unpack(a6)
                    local ad = Config.Aduty.namesdistance
                    local ae = Config.Aduty.infodistance
                    distance = math.floor(#(vector3(aa, ab, ac) - vector3(E, F, G)))
                    if nameabove then
                        if distance < ad then
                            if NetworkIsPlayerTalking(X) then
                                DrawText3D(
                                    E,
                                    F,
                                    G + 1.0,
                                    GetPlayerServerId(X) .. "&#8211;" .. GetPlayerName(X),
                                    255,
                                    0,
                                    0
                                )
                            else
                                DrawText3D(
                                    E,
                                    F,
                                    G + 1.0,
                                    GetPlayerServerId(X) .. "&#8211;" .. GetPlayerName(X),
                                    255,
                                    255,
                                    255
                                )
                            end
                        end
                    end
                    local o = "\nServer ID: " .. GetPlayerServerId(X) .. "\nDistance: " .. distance .. " m"
                    if IsPedInAnyVehicle(a8, true) then
                        local af =
                            GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(a8))))
                        o = o .. "\nCar: " .. af
                    end
                    if distance < ae then
                        if espinfo and esp then
                            DrawText3D(E, F, G - 1.0, o, 255, 255, 255)
                        end
                        if espbox and esp then
                            LineOneBegin = GetOffsetFromEntityInWorldCoords(a8, -0.3, -0.3, -0.9)
                            LineOneEnd = GetOffsetFromEntityInWorldCoords(a8, 0.3, -0.3, -0.9)
                            LineTwoBegin = GetOffsetFromEntityInWorldCoords(a8, 0.3, -0.3, -0.9)
                            LineTwoEnd = GetOffsetFromEntityInWorldCoords(a8, 0.3, 0.3, -0.9)
                            LineThreeBegin = GetOffsetFromEntityInWorldCoords(a8, 0.3, 0.3, -0.9)
                            LineThreeEnd = GetOffsetFromEntityInWorldCoords(a8, -0.3, 0.3, -0.9)
                            LineFourBegin = GetOffsetFromEntityInWorldCoords(a8, -0.3, -0.3, -0.9)
                            TLineOneBegin = GetOffsetFromEntityInWorldCoords(a8, -0.3, -0.3, 0.8)
                            TLineOneEnd = GetOffsetFromEntityInWorldCoords(a8, 0.3, -0.3, 0.8)
                            TLineTwoBegin = GetOffsetFromEntityInWorldCoords(a8, 0.3, -0.3, 0.8)
                            TLineTwoEnd = GetOffsetFromEntityInWorldCoords(a8, 0.3, 0.3, 0.8)
                            TLineThreeBegin = GetOffsetFromEntityInWorldCoords(a8, 0.3, 0.3, 0.8)
                            TLineThreeEnd = GetOffsetFromEntityInWorldCoords(a8, -0.3, 0.3, 0.8)
                            TLineFourBegin = GetOffsetFromEntityInWorldCoords(a8, -0.3, -0.3, 0.8)
                            ConnectorOneBegin = GetOffsetFromEntityInWorldCoords(a8, -0.3, 0.3, 0.8)
                            ConnectorOneEnd = GetOffsetFromEntityInWorldCoords(a8, -0.3, 0.3, -0.9)
                            ConnectorTwoBegin = GetOffsetFromEntityInWorldCoords(a8, 0.3, 0.3, 0.8)
                            ConnectorTwoEnd = GetOffsetFromEntityInWorldCoords(a8, 0.3, 0.3, -0.9)
                            ConnectorThreeBegin = GetOffsetFromEntityInWorldCoords(a8, -0.3, -0.3, 0.8)
                            ConnectorThreeEnd = GetOffsetFromEntityInWorldCoords(a8, -0.3, -0.3, -0.9)
                            ConnectorFourBegin = GetOffsetFromEntityInWorldCoords(a8, 0.3, -0.3, 0.8)
                            ConnectorFourEnd = GetOffsetFromEntityInWorldCoords(a8, 0.3, -0.3, -0.9)
                            DrawLine(
                                LineOneBegin.x,
                                LineOneBegin.y,
                                LineOneBegin.z,
                                LineOneEnd.x,
                                LineOneEnd.y,
                                LineOneEnd.z,
                                255,
                                10,
                                10,
                                255
                            )
                            DrawLine(
                                LineTwoBegin.x,
                                LineTwoBegin.y,
                                LineTwoBegin.z,
                                LineTwoEnd.x,
                                LineTwoEnd.y,
                                LineTwoEnd.z,
                                255,
                                10,
                                10,
                                255
                            )
                            DrawLine(
                                LineThreeBegin.x,
                                LineThreeBegin.y,
                                LineThreeBegin.z,
                                LineThreeEnd.x,
                                LineThreeEnd.y,
                                LineThreeEnd.z,
                                255,
                                10,
                                10,
                                255
                            )
                            DrawLine(
                                LineThreeEnd.x,
                                LineThreeEnd.y,
                                LineThreeEnd.z,
                                LineFourBegin.x,
                                LineFourBegin.y,
                                LineFourBegin.z,
                                255,
                                10,
                                10,
                                255
                            )
                            DrawLine(
                                TLineOneBegin.x,
                                TLineOneBegin.y,
                                TLineOneBegin.z,
                                TLineOneEnd.x,
                                TLineOneEnd.y,
                                TLineOneEnd.z,
                                255,
                                10,
                                10,
                                255
                            )
                            DrawLine(
                                TLineTwoBegin.x,
                                TLineTwoBegin.y,
                                TLineTwoBegin.z,
                                TLineTwoEnd.x,
                                TLineTwoEnd.y,
                                TLineTwoEnd.z,
                                255,
                                10,
                                10,
                                255
                            )
                            DrawLine(
                                TLineThreeBegin.x,
                                TLineThreeBegin.y,
                                TLineThreeBegin.z,
                                TLineThreeEnd.x,
                                TLineThreeEnd.y,
                                TLineThreeEnd.z,
                                255,
                                10,
                                10,
                                255
                            )
                            DrawLine(
                                TLineThreeEnd.x,
                                TLineThreeEnd.y,
                                TLineThreeEnd.z,
                                TLineFourBegin.x,
                                TLineFourBegin.y,
                                TLineFourBegin.z,
                                255,
                                10,
                                10,
                                255
                            )
                            DrawLine(
                                ConnectorOneBegin.x,
                                ConnectorOneBegin.y,
                                ConnectorOneBegin.z,
                                ConnectorOneEnd.x,
                                ConnectorOneEnd.y,
                                ConnectorOneEnd.z,
                                255,
                                10,
                                10,
                                255
                            )
                            DrawLine(
                                ConnectorTwoBegin.x,
                                ConnectorTwoBegin.y,
                                ConnectorTwoBegin.z,
                                ConnectorTwoEnd.x,
                                ConnectorTwoEnd.y,
                                ConnectorTwoEnd.z,
                                255,
                                10,
                                10,
                                255
                            )
                            DrawLine(
                                ConnectorThreeBegin.x,
                                ConnectorThreeBegin.y,
                                ConnectorThreeBegin.z,
                                ConnectorThreeEnd.x,
                                ConnectorThreeEnd.y,
                                ConnectorThreeEnd.z,
                                255,
                                10,
                                10,
                                255
                            )
                            DrawLine(
                                ConnectorFourBegin.x,
                                ConnectorFourBegin.y,
                                ConnectorFourBegin.z,
                                ConnectorFourEnd.x,
                                ConnectorFourEnd.y,
                                ConnectorFourEnd.z,
                                255,
                                10,
                                10,
                                255
                            )
                        end
                        if esplines and esp then
                            DrawLine(aa, ab, ac, E, F, G, 255, 10, 10, 255)
                        end
                    end
                end
            end
            if a and esp then
                local ag = {r = 240, g = 15, b = 15, a = 255}
                local ah = GetEntityCoords(PlayerPedId(-1))
                local ai, N, aj = RayCastGamePlayCamera(1000.0)
                if ai and (IsEntityAVehicle(aj) or IsEntityAPed(aj) or IsEntityAnObject(aj)) then
                    local ak = GetEntityCoords(aj)
                    local al, am = GetModelDimensions(GetEntityModel(aj))
                    if IsEntityAVehicle(aj) then
                        DrawEntityBoundingBox(aj, ag)
                        DrawLine(ah.x, ah.y, ah.z, N.x, N.y, N.z, ag.r, ag.g, ag.b, ag.a)
                        DrawText3D(ak.x, ak.y, ak.z + 0.3, "~w~To delete Vehicle press ~w~[~g~E~s~]", 255, 255, 255)
                        DrawText3D(ak.x, ak.y, ak.z + 0.5, "~w~Hash: ~r~" .. GetHashKey(aj), 255, 255, 255)
                        if string.len(GetDisplayNameFromVehicleModel(GetEntityModel(aj))) > 7 then
                            DrawText3D(
                                ak.x,
                                ak.y,
                                ak.z + 0.7,
                                "~w~Model: ~g~" .. GetDisplayNameFromVehicleModel(GetEntityModel(aj)) .. "~w~...",
                                255,
                                255,
                                255
                            )
                        else
                            DrawText3D(
                                ak.x,
                                ak.y,
                                ak.z + 0.7,
                                "~w~Model: ~g~" .. GetDisplayNameFromVehicleModel(GetEntityModel(aj)),
                                255,
                                255,
                                255
                            )
                        end
                    elseif IsEntityAPed(aj) then
                        DrawEntityBoundingBox(aj, ag)
                        DrawLine(ah.x, ah.y, ah.z, N.x, N.y, N.z, ag.r, ag.g, ag.b, ag.a)
                        DrawText3D(ak.x, ak.y, ak.z + 0.3, "~w~To delete Ped press ~w~[~g~E~s~]", 255, 255, 255)
                        DrawText3D(ak.x, ak.y, ak.z + 0.5, "~w~Hash: ~r~" .. GetHashKey(aj), 255, 255, 255)
                    else
                        DrawEntityBoundingBox(aj, ag)
                        DrawLine(ah.x, ah.y, ah.z, N.x, N.y, N.z, ag.r, ag.g, ag.b, ag.a)
                        DrawText3D(ak.x, ak.y, ak.z + 0.3, "~w~To delete Object press ~w~[~g~E~s~]", 255, 255, 255)
                        DrawText3D(ak.x, ak.y, ak.z + 0.5, "~w~Hash: ~r~" .. GetHashKey(aj), 255, 255, 255)
                    end
                    if IsControlJustReleased(0, 38) then
                        SetEntityAsMissionEntity(aj, true, true)
                        if IsEntityAVehicle(aj) then
                            TriggerEvent("persistent-vehicles/forget-vehicle", aj)
                        end
                        DeleteEntity(aj)
                    end
                elseif N.x ~= 0.0 and N.y ~= 0.0 then
                    DrawLine(ah.x, ah.y, ah.z, N.x, N.y, N.z, ag.r, ag.g, ag.b, ag.a)
                    DrawMarker(
                        28,
                        N.x,
                        N.y,
                        N.z,
                        0.0,
                        0.0,
                        0.0,
                        0.0,
                        180.0,
                        0.0,
                        0.1,
                        0.1,
                        0.1,
                        ag.r,
                        ag.g,
                        ag.b,
                        ag.a,
                        false,
                        true,
                        2,
                        nil,
                        nil,
                        false
                    )
                end
            end
            if i then
                local an = IsPedInAnyVehicle(PlayerPedId(), 0)
                local r = nil
                local E, F, G = nil
                if not an then
                    r = PlayerPedId()
                    E, F, G = table.unpack(GetEntityCoords(PlayerPedId(), 2))
                else
                    r = GetVehiclePedIsIn(PlayerPedId(), 0)
                    E, F, G = table.unpack(GetEntityCoords(PlayerPedId(), 1))
                end
                local ao, ap, aq = a0()
                SetEntityVelocity(r, 0.0001, 0.0001, 0.0001)
                if IsDisabledControlJustPressed(0, a4["LEFTSHIFT"]) then
                    oldSpeed = Config.Aduty.noclipspeed
                    Config.Aduty.noclipspeed = Config.Aduty.noclipspeed * 3
                end
                if IsDisabledControlJustReleased(0, a4["LEFTSHIFT"]) then
                    Config.Aduty.noclipspeed = oldSpeed
                end
                if Config.Aduty.noclipspeed == nil then
                    Config.Aduty.noclipspeed = 1
                end
                if IsDisabledControlPressed(0, 32) then
                    E = E + Config.Aduty.noclipspeed * ao
                    F = F + Config.Aduty.noclipspeed * ap
                    G = G + Config.Aduty.noclipspeed * aq
                end
                if IsDisabledControlPressed(0, 269) then
                    E = E - Config.Aduty.noclipspeed * ao
                    F = F - Config.Aduty.noclipspeed * ap
                    G = G - Config.Aduty.noclipspeed * aq
                end
                if IsDisabledControlPressed(0, a4["SPACE"]) then
                    G = G + Config.Aduty.noclipspeed
                end
                if IsDisabledControlPressed(0, a4["LEFTCTRL"]) then
                    G = G - Config.Aduty.noclipspeed
                end
                SetEntityCoordsNoOffset(r, E, F, G, true, true, true)
            end
            if Vanish then
                SetEntityVisible(PlayerPedId(), false, false)
                SetEntityInvincible(PlayerPedId(), true)
                SetEntityVisible(ped, false)
            end
            if VehGod and IsPedInAnyVehicle(PlayerPedId(), true) then
                local Z = PlayerPedId()
                SetVehicleFixed(GetVehiclePedIsIn(Z, false))
                SetVehicleDirtLevel(GetVehiclePedIsIn(Z, false), 0.0)
                SetVehicleLights(GetVehiclePedIsIn(Z, false), 0)
                SetVehicleBurnout(GetVehiclePedIsIn(Z, false), false)
                Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(Z, false), 0)
                SetVehicleUndriveable(vehicle, false)
                SetEntityInvincible(GetVehiclePedIsUsing(PlayerPedId()), true)
            end
            if GodModes then
                local Z = PlayerPedId()
                SetEntityInvincible(Z, true)
                SetPlayerInvincible(PlayerId(), true)
                SetPedCanRagdoll(Z, false)
                ClearPedBloodDamage(Z)
                ResetPedVisibleDamage(Z)
                ClearPedLastWeaponDamage(Z)
                SetEntityProofs(Z, true, true, true, true, true, true, true, true)
                SetEntityOnlyDamagedByPlayer(Z, false)
                SetEntityCanBeDamaged(Z, false)
            else
                local Z = PlayerPedId()
                SetEntityInvincible(Z, false)
                SetPlayerInvincible(PlayerId(), false)
                SetPedCanRagdoll(Z, true)
                ClearPedBloodDamage(Z)
                ResetPedVisibleDamage(Z)
                ClearPedLastWeaponDamage(Z)
                SetEntityProofs(Z, false, false, false, false, false, false, false, false)
                SetEntityOnlyDamagedByPlayer(Z, false)
                SetEntityCanBeDamaged(Z, true)
            end
        end
    end
)
RegisterNetEvent("heal")
AddEventHandler(
    "heal",
    function()
        if IsPedMale(PlayerPedId()) then
            SetEntityHealth(PlayerPedId(), 200)
        else
            SetEntityHealth(PlayerPedId(), 100)
        end
    end
)
RegisterNetEvent("cleanareavehy")
AddEventHandler(
    "cleanareavehy",
    function()
        local ar = GetGamePool("CVehicle")
        for as, vehicle in ipairs(ar) do
            if not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1)) then
                if NetworkGetEntityIsNetworked(vehicle) then
                    NetWorkDelete(vehicle)
                else
                    SetVehicleHasBeenOwnedByPlayer(vehicle, false)
                    SetEntityAsMissionEntity(vehicle, true, true)
                    DeleteEntity(vehicle)
                end
            end
        end
    end
)
RegisterNetEvent("cleanareapedsy")
AddEventHandler(
    "cleanareapedsy",
    function()
        local at = GetGamePool("CPed")
        for as, ped in ipairs(at) do
            if not IsPedAPlayer(ped) then
                RemoveAllPedWeapons(ped, true)
                if NetworkGetEntityIsNetworked(ped) then
                    NetWorkDelete(ped)
                else
                    DeleteEntity(ped)
                end
            end
        end
    end
)
RegisterNetEvent("networkingobjetos2")
AddEventHandler(
    "networkingobjetos2",
    function()
        local au = GetGamePool("CObject")
        for as, k in ipairs(au) do
            NetWorkDelete(k)
        end
    end
)
RegisterNetEvent("sadansdhas2")
AddEventHandler(
    "sadansdhas2",
    function(av, S, aw)
        SendNUIMessage({type = "screenshotadmin", url = av})
        SendNUIMessage({type = "screenshotadmintop", name = S, id = aw})
        if Config.builtinnotify ~= nil then
            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("screenshotdone"))
        else
            if Config.ownnotify.notifycolor ~= nil and not false then
                TriggerEvent(
                    Config.ownnotify.trigger,
                    source,
                    Config.ownnotify.color,
                    Config.ownnotify.title,
                    Lang("screenshotdone")
                )
            else
                TriggerEvent(Config.ownnotify.trigger, source, Config.ownnotify.title, Lang("screenshotdone"))
            end
        end
    end
)
RegisterNetEvent("screenshots")
AddEventHandler(
    "screenshots",
    function(ax, ay, az)
        local aA = ax
        exports["screenshot-basic"]:requestScreenshotUpload(
            dnz_system.webhook.webhooks.screenshots.savelog,
            "files[]",
            function(w)
                local aB = json.decode(w)
                local aC = json.encode(aB.attachments[1].proxy_url)
                local aD = string.gsub(aC, '["]', "")
                local aE = string.gsub(aD, '["]', "")
                TriggerServerEvent("sadansdhas", aA, aE, ay, az)
            end
        )
    end
)
RegisterNetEvent("cleanareaentityy")
AddEventHandler(
    "cleanareaentityy",
    function()
        local au = GetGamePool("CObject")
        for as, k in ipairs(au) do
            if NetworkGetEntityIsNetworked(k) then
                NetWorkDelete(k)
            else
                DeleteEntity(k)
            end
        end
    end
)
function spawnvehicle(L)
    local Z = PlayerPedId()
    local aF = L
    if aF and IsModelValid(aF) and IsModelAVehicle(aF) then
        RequestModel(aF)
        while not HasModelLoaded(aF) do
            Citizen.Wait(500)
        end
        local L = CreateVehicle(GetHashKey(aF), GetEntityCoords(Z), GetEntityHeading(Z), true, true)
        SetPedIntoVehicle(Z, L, -1)
    end
end
function delvehicle()
    local Z = PlayerPedId()
    local aj = GetVehiclePedIsIn(Z, false)
    if DoesEntityExist(aj) and NetworkHasControlOfEntity(aj) then
        SetEntityAsMissionEntity(aj, false, true)
        DeleteEntity(aj)
    end
end
function repairvehicle()
    local Z = PlayerPedId()
    SetVehicleFixed(GetVehiclePedIsIn(Z, false))
    SetVehicleDirtLevel(GetVehiclePedIsIn(Z, false), 0.0)
    SetVehicleLights(GetVehiclePedIsIn(Z, false), 0)
    SetVehicleBurnout(GetVehiclePedIsIn(Z, false), false)
    Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(Z, false), 0)
    SetVehicleUndriveable(vehicle, false)
end
function NetWorkDelete(aj)
    intento = 0
    while not NetworkHasControlOfEntity(aj) and intento < 50 and DoesEntityExist(aj) do
        NetworkRequestControlOfEntity(aj)
        intento = intento + 1
    end
    if DoesEntityExist(aj) and NetworkHasControlOfEntity(aj) then
        SetEntityAsMissionEntity(aj, false, true)
        DeleteEntity(aj)
    end
end
function RotationToDirection(aG)
    local aH = {x = math.pi / 180 * aG.x, y = math.pi / 180 * aG.y, z = math.pi / 180 * aG.z}
    local aI = {
        x = -math.sin(aH.z) * math.abs(math.cos(aH.x)),
        y = math.cos(aH.z) * math.abs(math.cos(aH.x)),
        z = math.sin(aH.x)
    }
    return aI
end
function RayCastGamePlayCamera(distance)
    local aJ = GetGameplayCamRot()
    local aK = GetGameplayCamCoord()
    local aI = RotationToDirection(aJ)
    local aL = {x = aK.x + aI.x * distance, y = aK.y + aI.y * distance, z = aK.z + aI.z * distance}
    local aM, aN, aO, aP, aQ =
        GetShapeTestResult(StartShapeTestRay(aK.x, aK.y, aK.z, aL.x, aL.y, aL.z, -1, PlayerPedId(), 0))
    return aN, aO, aQ
end
function QMultiply(aM, aN)
    local aR = aM.x * 2.0
    local aS = aM.y * 2.0
    local aT = aM.z * 2.0
    local aU = aM.w * aR
    local aV = aM.w * aS
    local aW = aM.w * aT
    local aX = aM.x * aR
    local aY = aM.x * aS
    local aZ = aM.x * aT
    local a_ = aM.y * aS
    local b0 = aM.y * aT
    local b1 = aM.z * aT
    return {
        x = aN.X * (1.0 - a_ - b1) + aN.Y * (aY - aW) + aN.Z * (aZ + aV),
        y = aN.X * (aY + aW) + aN.Y * (1.0 - aX - b1) + aN.Z * (b0 - aU),
        z = aN.X * (aZ - aV) + aN.Y * (b0 + aU) + aN.Z * (1.0 - aX - a_)
    }
end
function DrawEntityBoundingBox(aj, ag)
    local b2 = GetEntityModel(aj)
    local b3, b4 = GetModelDimensions(b2)
    local b5, b6, b7, ah = GetEntityMatrix(aj)
    local b8 = {x = 0.5 * (b4.x - b3.x), y = 0.5 * (b4.y - b3.y), z = 0.5 * (b4.z - b3.z)}
    local b9 = {
        x = ah.x + b8.y * b5.x + b8.x * b6.x + b8.z * b7.x,
        y = ah.y + b8.y * b5.y + b8.x * b6.y + b8.z * b7.y,
        z = 0
    }
    local ba, bb = GetGroundZFor_3dCoord(b9.x, b9.y, 1000.0, 0)
    b9.z = bb
    b9.z = b9.z + 2 * b8.z
    local bc = {
        x = ah.x - b8.y * b5.x - b8.x * b6.x - b8.z * b7.x,
        y = ah.y - b8.y * b5.y - b8.x * b6.y - b8.z * b7.y,
        z = 0
    }
    local bd, be = GetGroundZFor_3dCoord(b9.x, b9.y, 1000.0, 0)
    bc.z = be
    local bf = bc
    local bg = b9
    local bh = {x = bf.x + 2 * b8.y * b5.x, y = bf.y + 2 * b8.y * b5.y, z = bf.z + 2 * b8.y * b5.z}
    local bi = {x = bh.x + 2 * b8.z * b7.x, y = bh.y + 2 * b8.z * b7.y, z = bh.z + 2 * b8.z * b7.z}
    local bj = {x = bf.x + 2 * b8.z * b7.x, y = bf.y + 2 * b8.z * b7.y, z = bf.z + 2 * b8.z * b7.z}
    local bk = {x = bg.x - 2 * b8.y * b5.x, y = bg.y - 2 * b8.y * b5.y, z = bg.z - 2 * b8.y * b5.z}
    local bl = {x = bk.x - 2 * b8.z * b7.x, y = bk.y - 2 * b8.z * b7.y, z = bk.z - 2 * b8.z * b7.z}
    local bm = {x = bg.x - 2 * b8.z * b7.x, y = bg.y - 2 * b8.z * b7.y, z = bg.z - 2 * b8.z * b7.z}
    DrawLine(bf.x, bf.y, bf.z, bh.x, bh.y, bh.z, ag.r, ag.g, ag.b, ag.a)
    DrawLine(bf.x, bf.y, bf.z, bj.x, bj.y, bj.z, ag.r, ag.g, ag.b, ag.a)
    DrawLine(bh.x, bh.y, bh.z, bi.x, bi.y, bi.z, ag.r, ag.g, ag.b, ag.a)
    DrawLine(bi.x, bi.y, bi.z, bj.x, bj.y, bj.z, ag.r, ag.g, ag.b, ag.a)
    DrawLine(bg.x, bg.y, bg.z, bk.x, bk.y, bk.z, ag.r, ag.g, ag.b, ag.a)
    DrawLine(bg.x, bg.y, bg.z, bm.x, bm.y, bm.z, ag.r, ag.g, ag.b, ag.a)
    DrawLine(bk.x, bk.y, bk.z, bl.x, bl.y, bl.z, ag.r, ag.g, ag.b, ag.a)
    DrawLine(bl.x, bl.y, bl.z, bm.x, bm.y, bm.z, ag.r, ag.g, ag.b, ag.a)
    DrawLine(bf.x, bf.y, bf.z, bl.x, bl.y, bl.z, ag.r, ag.g, ag.b, ag.a)
    DrawLine(bh.x, bh.y, bh.z, bm.x, bm.y, bm.z, ag.r, ag.g, ag.b, ag.a)
    DrawLine(bi.x, bi.y, bi.z, bg.x, bg.y, bg.z, ag.r, ag.g, ag.b, ag.a)
    DrawLine(bj.x, bj.y, bj.z, bk.x, bk.y, bk.z, ag.r, ag.g, ag.b, ag.a)
end
function DrawText3D(E, F, G, bn, bo, bp, aN)
    SetTextScale(0.4, 0.4)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(bo, bp, aN, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(bn)
    SetDrawOrigin(E, F, G, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end
function TeleportToWaypoint()
    local bq = GetFirstBlipInfoId(8)
    if DoesBlipExist(bq) then
        local br = GetBlipInfoIdCoord(bq)
        for bs = 1, 1000 do
            SetPedCoordsKeepVehicle(PlayerPedId(), br["x"], br["y"], bs + 0.0)
            local bt, bu = GetGroundZFor_3dCoord(br["x"], br["y"], bs + 0.0)
            if bt then
                SetPedCoordsKeepVehicle(PlayerPedId(), br["x"], br["y"], bs + 0.0)
                break
            end
            Citizen.Wait(5)
        end
    else
        if Config.builtinnotify ~= nil then
            TriggerEvent("dnz_amenuv2:notify", source, "Adminmenu", Lang("nomarker"))
        else
            if Config.ownnotify.notifycolor ~= nil and not false then
                TriggerEvent(
                    Config.ownnotify.trigger,
                    source,
                    Config.ownnotify.color,
                    Config.ownnotify.title,
                    Lang("nomarker")
                )
            else
                TriggerEvent(Config.ownnotify.trigger, source, Config.ownnotify.title, Lang("nomarker"))
            end
        end
    end
end
local bv = Citizen.Trace
function Citizen.Trace(...)
    if type(...) == "string" then
        local bw = false
        local x = string.lower(...)
        for as, bx in ipairs(
            {
                "failure",
                "error",
                "not",
                "failed",
                "MySQL",
                "ERROR",
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
                "failed:"
            }
        ) do
            if string.find(x, bx) then
                bw = true
            end
        end
        if not bw then
            bv(...)
        else
            TriggerServerEvent("" .. GetCurrentResourceName() .. ":error", ..., "Client")
        end
    end
end
