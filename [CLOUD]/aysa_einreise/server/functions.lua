KIDU.Functions.SendWebhook = function(color, title, message)
    if color == "red" then color = 16711680 end
    if color == "green" then color = 16711680 end
    if color == "orange" then color = 16766464 end
    if color == "white" then color = 16448250 end
    
    if not tonumber(color) then
        color = 16777215
    end
    
    PerformHttpRequest('https://discord.com/api/webhooks/1047615996304826389/5tU_9ruDe3TTGCihQv1w1BROJSwvbGWsc-LNGbGfU2dBV3nglHW9NxMbENWcNfvEA0pq', function(err, text, headers) end, 'POST', json.encode(
        {
            username = "AYSA-EINREISE",
            embeds = {
                {
                    ["color"] = color,
                    ["title"] = title,
                    ["description"] = message,
                    ["footer"] = {
                        ["text"] = "Made by AYSA",
                    }
                }
            }
        }
    ), {
        ['Content-Type'] = 'application/json'
    })
end

KIDU.Functions.GetIdentifiers = function(source)
    local source = source
    local identifiers = KIDU.Functions.ExtractIdentifiers(source)

    local identifiersToSend = ''

    identifiersToSend = identifiersToSend .. '``ID``: ' .. source

    if identifiers.steam ~= nil and identifiers.steam ~= '' then
        local steamId = '\n ``Steam ID``: ' .. identifiers.steam
        local steamUrl = "\n ``Steam Profil``: https://steamcommunity.com/profiles/" .. tonumber(identifiers.steam:gsub('steam:', ''), 16)

        identifiersToSend = identifiersToSend .. '' .. steamId .. '' .. steamUrl 
    end
    
    if identifiers.discord ~= nil and identifiers.discord ~= '' then
        local discord = "\n ``Discord ID``: " .. identifiers.discord
        local discordName = "\n ``Discord Profil``: <@" .. identifiers.discord:gsub('discord:', '') .. ">"
        identifiersToSend = identifiersToSend .. '' .. discord .. '' .. discordName 
    end

    return identifiersToSend
end

KIDU.Functions.ExtractIdentifiers = function(source)
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
        xbl = "",
        live = ""
    }

    for i = 0, GetNumPlayerIdentifiers(source) - 1 do
        local id = GetPlayerIdentifier(source, i)

        if string.find(id, "steam") then
            identifiers.steam = id
        elseif string.find(id, "ip") then
            identifiers.ip = id
        elseif string.find(id, "discord") then
            identifiers.discord = id
        elseif string.find(id, "license") then
            identifiers.license = id
        elseif string.find(id, "xbl") then
            identifiers.xbl = id
        elseif string.find(id, "live") then
            identifiers.live = id
        end
    end

    return identifiers
end

KIDU.Functions.IsInArray = function(array, value)
    local isInArray = false

    for i = 1, #array, 1 do
        if array[i] == value then
            isInArray = true
        end
    end

    return isInArray
end