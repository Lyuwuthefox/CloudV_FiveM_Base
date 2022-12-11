if Devine.ESX then
    Devine.RequireESX()
end

local playTimeJson = LoadResourceFile(GetCurrentResourceName(), "playtime.json")
local playTime = json.decode(playTimeJson)
local cooldown = {}

function sendWebhook(msg)
    if msg == nil or msg == '' then
        return
    end

    local embed = {
          {
            color = Devine.Webhook.Color,
            title = Devine.Webhook.Title,
            description = msg,
            thumbnail = {
                url = Devine.Webhook.Logo
            },
            footer = {
                text = Devine.Webhook.Footer,
                icon_url = Devine.Webhook.Logo
            },
          }
      }
  
    PerformHttpRequest(Devine.Webhook.Settings.Webhook, function(err, text, headers) end, 'POST', json.encode({username = Devine.Webhook.Username, embeds = embed, avatar_url = Devine.Webhook.Logo}), { ['Content-Type'] = 'application/json' })
end

function getTopTen()
    local topTen = {}

    for k, v in pairs(playTime) do
        if #topTen < Devine.Fetch then
            table.insert(topTen, {k, v.name, v.playtime})
        else
            for i = 1, #topTen do
                if v > topTen[i][2] then
                    table.remove(topTen, i)
                    table.insert(topTen, {k, v.name, v.playtime})
                    break
                end
            end
        end
    end

    table.sort(topTen, function(a, b)
        return a[2] > b[2]
    end)

    return topTen
end

Citizen.CreateThread(function()
    if Devine.Webhook.Settings.Enabled then
        while true do
            local topTen = getTopTen()
            local msg = ''
            print(json.encode(topTen))

            for k, v in pairs(topTen) do
                local days, hours, minutes = convertMinutes(v[3])
                local finalTime = getMsg(days, hours, minutes, 'discord')
                msg = string.format(Devine.Webhook.MsgLayout, k, v[2], finalTime)
            end

            sendWebhook(msg)
            Citizen.Wait(Devine.Webhook.Settings.frequency)
        end
    end
end)

function getLicense(src)
    for k, v in pairs(GetPlayerIdentifiers(src)) do
        if string.sub(v, 1, string.len("license:")) == "license:" then
            return v
        end
    end
end

function getLastUpdate(identifier)
    local lastTime = 0

    if playTime[identifier] then
        lastTime = playTime[identifier].lastUpdate
    else
        return nil
    end

    return lastTime
end

function getPlayTime(src)
    local license = getLicense(src)
    if playTime[license] then
        return playTime[license].playtime
    else
        return 0
    end
end

function insertOrUpdatePlayTime(src, time)
    local playerName = ''

    if Devine.ESX then
        local xPlayer = ESX.GetPlayerFromId(src)
        playerName = xPlayer.getName()
    else
        playerName = GetPlayerName(src)
    end

    playTime[getLicense(src)] = {
        playtime = time,
        name = playerName,
        lastUpdate = os.time()
    }
    SaveResourceFile(GetCurrentResourceName(), "playtime.json", json.encode(playTime, { indent = true }), -1)
end

function convertMinutes(min)
    local days = math.floor(min / 1440)
    local hours = math.floor((min - (days * 1440)) / 60)
    local minutes = math.floor(min - (days * 1440) - (hours * 60))
    return days, hours, minutes 
end

function getMsg(days, hours, minutes, type) 
    local locales = {
        ['days'] = Devine.Language[Devine.Lang].days,
        ['hours'] = Devine.Language[Devine.Lang].hours,
        ['minutes'] = Devine.Language[Devine.Lang].minutes,
    }

    if days > 1 then
        locales['days'] = Devine.Language[Devine.Lang].multipledays
    end

    if hours > 1 then
        locales['hours'] = Devine.Language[Devine.Lang].multiplehours
    end

    if minutes > 1 or minutes == 0 then
        locales['minutes'] = Devine.Language[Devine.Lang].multipleminutes
    end

    if type == 'discord' then
        if days > 0 then
            return string.format('%s %s %s %s %s %s', days, locales['days'], hours, locales['hours'], minutes, locales['minutes'])
        elseif hours > 0 then
            return string.format('%s %s %s %s', hours, locales['hours'], minutes, locales['minutes'])
        else
            return string.format('%s %s', minutes, locales['minutes'])
        end
    else
        if days > 0 then
            return string.format(Devine.Language[Devine.Lang].playtime_msg .. ' %s %s %s %s %s %s', days, locales['days'], hours, locales['hours'], minutes, locales['minutes'])
        elseif hours > 0 then
            return string.format(Devine.Language[Devine.Lang].playtime_msg ..  ' %s %s %s %s', hours, locales['hours'], minutes, locales['minutes'])
        else
            return string.format(Devine.Language[Devine.Lang].playtime_msg ..' %s %s', minutes, locales['minutes'])
        end
    end
end

RegisterNetEvent('devine_playtime:add', function()
    insertOrUpdatePlayTime(source, getPlayTime(source) + 1)
end)

RegisterCommand(Devine.playtimeCmd, function(source, args)
    if cooldown[source] then
        Devine.Notify(source, 'error', Devine.Language[Devine.Lang].cooldown_msg)
        return
    end
    local days, hours, minutes = convertMinutes(getPlayTime(source))
    local msg = getMsg(days,hours,minutes)
    Devine.Notify(source, 'info', msg)
    cooldown[source] = true
    Citizen.SetTimeout(Devine.Cooldown, function()
        cooldown[source] = false
    end)
end)