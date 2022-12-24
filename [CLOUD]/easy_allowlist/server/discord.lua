local DISCORD_API_URL = "https://discord.com/api/v9/%s"

local isDiscordBotAvailable = false
local lastDiscordBotStatus = nil

local headers = {}

local baseAvatarURL = "https://cdn.discordapp.com/avatars/%s/%s.png"

local discordCalls = {}

local function newDiscordCall(name)
    discordCalls[name] = discordCalls[name] or 0

    discordCalls[name] = discordCalls[name] + 1
end

RegisterCommand("discordCalls", function(playerId)
    if(playerId > 0) then return end
 
    print("Discord calls:")
    print(DumpTable(discordCalls))
end, false)

local isRateLimitAlmostExceeded = false
local isThereAnyPendingRequest = false
local function waitForRateLimitReady()
    while isRateLimitAlmostExceeded or isThereAnyPendingRequest do
        Citizen.Wait(100)
    end
end

-- Updates rate limit and waits if needed
local function updateRateLimit(remainingRequests, rateResetAfter)
    if(not rateResetAfter or not remainingRequests) then
        Citizen.Wait(2000)
        return
    end
    
    rateResetAfter = tonumber(rateResetAfter)
    remainingRequests = tonumber(remainingRequests)

    if(remainingRequests <= 2) then
        isRateLimitAlmostExceeded = true
        Citizen.Wait(rateResetAfter * 1200)
        isRateLimitAlmostExceeded = false
    else
        isRateLimitAlmostExceeded = false
    end
end

local function checkIfBotIsLogged()
    local promise = promise.new()

    newDiscordCall("checkIfBotIsLogged")

    PerformHttpRequest(string.format(DISCORD_API_URL, "users/@me"), function(errorCode, rawResultData, resultHeaders)
        if(errorCode == 200) then
            local resultData = json.decode(rawResultData) or {}

            promise:resolve(true)
        elseif(errorCode == 429) then -- Rate limited
            print("The bot has been rate limited by Discord for the next " .. tostring(resultHeaders["Retry-After"]) .. " seconds")

            promise:resolve(false)
        else
            print("^1Error connecting discord bot: ", errorCode, "Discord error codes https://discord.com/developers/docs/topics/opcodes-and-status-codes^7")
            
            promise:resolve(false)
        end
    end, "GET", nil, headers)

    return Citizen.Await(promise)
end

local function hasPlayerDiscordAllowlist(playerId)
    local externalData = EasyAllowlist.getPlayerExternalData(playerId)

    if(not externalData) then
        return false
    end

    local discordData = externalData.discordData

    if(not discordData) then
        return false
    end

    local roles = discordData.roles

    if(roles) then
        for _, roleId in pairs(roles) do
            if(roleId == config.discordAllowlistRole) then
                return true
            end
        end
    end

    return false
end
EasyAllowlist.hasPlayerDiscordAllowlist = hasPlayerDiscordAllowlist

function EasyAllowlist.getDiscordDataFromDiscordId(userId)
    if(not isDiscordBotAvailable) then return end

    local promise = promise.new()

    waitForRateLimitReady()

    isThereAnyPendingRequest = true

    newDiscordCall("getDiscordDataFromDiscordId")

    PerformHttpRequest(string.format(DISCORD_API_URL, "guilds/" .. config.discordServerID .. "/members/" .. userId), function(errorCode, rawResultData, resultHeaders)
        local discordData = nil

        if(errorCode == 200) then
            local profileData = json.decode(rawResultData) or {}

            discordData = {
                name = profileData.user.username .. "#" .. profileData.user.discriminator,
                image = string.format(baseAvatarURL, userId, profileData.user.avatar),
                roles = profileData.roles,
                discordId = profileData.user.id
            }

            updateRateLimit(resultHeaders["x-ratelimit-remaining"], resultHeaders["x-ratelimit-reset-after"])
        end

        isThereAnyPendingRequest = false
        
        promise:resolve(discordData)
    end, "GET", nil, headers)

    return Citizen.Await(promise)
end

local function getRolesForDiscordGuild()
    if not isDiscordBotAvailable then return end

    local promise = promise.new()

    newDiscordCall("getRolesForDiscordGuild")

    PerformHttpRequest(string.format(DISCORD_API_URL, "guilds/" .. config.discordServerID .. "/roles"), function(errorCode, rawResultData, resultHeaders)
        local roles = {}

        if(errorCode == 200) then
            local resultData = json.decode(rawResultData) or {}

            for _, roleData in pairs(resultData) do
                if(config.discordServerID ~= roleData.id) then
                    table.insert(roles, {
                        id = roleData.id,
                        name = roleData.name,
                        color = roleData.color,
                        position = roleData.position
                    })
                end
            end
        end

        promise:resolve(roles)
    end, "GET", nil, headers)

    return Citizen.Await(promise)
end

function EasyAllowlist.getDiscordRolesForUser(userId)
    if not isDiscordBotAvailable then return end

    local promise = promise.new()

    waitForRateLimitReady()

    isThereAnyPendingRequest = true

    newDiscordCall("getDiscordRolesForUser")

    PerformHttpRequest(string.format(DISCORD_API_URL, "guilds/" .. config.discordServerID .. "/members/" .. userId), function(errorCode, rawResultData, resultHeaders)
        local roles = {}

        if(errorCode == 200) then
            local profileData = json.decode(rawResultData) or {}

            for _, role in pairs(profileData.roles) do
                if(config.discordServerID ~= role) then
                    table.insert(roles, role)
                end
            end
        end

        updateRateLimit(resultHeaders["x-ratelimit-remaining"], resultHeaders["x-ratelimit-reset-after"])

        isThereAnyPendingRequest = false

        promise:resolve(roles)
    end, "GET", nil, headers)

    return Citizen.Await(promise)
end

function EasyAllowlist.getDiscordRoleData(roleId)
    if(not roleId) then return end
    
    local allRoles = getRolesForDiscordGuild()

    for _, role in pairs(allRoles) do
        if(role.id == roleId) then
            return role
        end
    end
end

function EasyAllowlist.addDiscordRoleToUser(userId, roleId)
    if(not isDiscordBotAvailable) then return end

    local promise = promise.new()

    local requestURL = string.format(DISCORD_API_URL, "guilds/" .. config.discordServerID .. "/members/" .. userId .. "/roles/" .. roleId)

    waitForRateLimitReady()

    isThereAnyPendingRequest = true

    newDiscordCall("addDiscordRoleToUser")

    PerformHttpRequest(requestURL, function(errorCode, rawResultData, resultHeaders)
        updateRateLimit(resultHeaders["x-ratelimit-remaining"], resultHeaders["x-ratelimit-reset-after"])

        isThereAnyPendingRequest = false

        if(errorCode == 204) then
            promise:resolve(true)
        else
            promise:resolve(false)
        end
    end, "PUT", nil, headers)

    return Citizen.Await(promise)
end

function EasyAllowlist.removeDiscordRoleFromUser(userId, roleId)
    if(not isDiscordBotAvailable) then return end

    local promise = promise.new()

    waitForRateLimitReady()

    isThereAnyPendingRequest = true

    newDiscordCall("removeDiscordRoleFromUser")

    PerformHttpRequest(string.format(DISCORD_API_URL, "guilds/" .. config.discordServerID .. "/members/" .. userId .. "/roles/" .. roleId), function(errorCode, rawResultData, resultHeaders)
        updateRateLimit(resultHeaders["x-ratelimit-remaining"], resultHeaders["x-ratelimit-reset-after"])

        isThereAnyPendingRequest = false

        if(errorCode == 204) then
            promise:resolve(true)
        else
            promise:resolve(false)
        end
    end, "DELETE", nil, headers)

    return Citizen.Await(promise)
end

RegisterServerCallback("easy_allowlist:getAllDiscordRoles", function(playerId, cb)
    if(EasyAllowlist.isAllowed(playerId)) then
        local roles = getRolesForDiscordGuild()

        cb( roles )
    end
end)

local isTryingToConnectDiscordBot = false

local function tryToConnectDiscordBot()
    if(isTryingToConnectDiscordBot) then return end

    isTryingToConnectDiscordBot = true

    isDiscordBotAvailable = checkIfBotIsLogged()

    if(lastDiscordBotStatus ~= isDiscordBotAvailable) then
        lastDiscordBotStatus = isDiscordBotAvailable

        if(isDiscordBotAvailable) then
            print("^2Discord bot logged in^7")
        else
            print("^1Error checking Discord bot^7")
        end
    end

    if(not isDiscordBotAvailable) then
        print("^3Retrying to connect Discord bot in 10 seconds...")
        SetTimeout(10000, tryToConnectDiscordBot)
    end

    isTryingToConnectDiscordBot = false
end

local function getSelfBotID()
    local promise = promise.new()

    newDiscordCall("getSelfBotID")

    PerformHttpRequest(string.format(DISCORD_API_URL, "users/@me"), function(errorCode, rawResultData, resultHeaders)
        if(errorCode == 200) then
            local resultData = json.decode(rawResultData) or {}

            promise:resolve(resultData.id)
        else
            promise:resolve(false)
        end
    end, "GET", nil, headers)

    return Citizen.Await(promise)
end

local function isBotRoleAboveWhitelistRole()
    local botId = getSelfBotID()
    local botRoles = EasyAllowlist.getDiscordRolesForUser(botId)

    local maximumRolePosition = nil

    for _, roleId in pairs(botRoles) do
        local roleData = EasyAllowlist.getDiscordRoleData(roleId)

        if(maximumRolePosition == nil or maximumRolePosition < roleData.position) then
            maximumRolePosition = roleData.position
        end
    end

    local whitelistRoleData = EasyAllowlist.getDiscordRoleData(config.discordAllowlistRole)

    if(not whitelistRoleData) then
        print("^1Impossible to find the whitelist role you selected in the settings, you have to choose the correct one^7")
        return false
    end

    return maximumRolePosition >= whitelistRoleData.position
end

local function getGuildName(guildId)
    local promise = promise.new()

    newDiscordCall("checkIfGuildExists")

    PerformHttpRequest(string.format(DISCORD_API_URL, "guilds/" .. guildId), function(errorCode, rawResultData, resultHeaders)
        if(errorCode == 200) then
            local resultData = json.decode(rawResultData) or {}

            promise:resolve(resultData.name)
        else
            promise:resolve(false)
        end
    end, "GET", nil, headers)

    return Citizen.Await(promise)
end

RegisterNetEvent("easy_allowlist:serverConfigLoaded", function()
    if(config.discordBotToken and config.discordServerID and config.enableDiscordRolesFeatures) then
        headers = {
            ["Authorization"] = "Bot " .. config.discordBotToken,
            ["Content-Type"] = "application/json",
            ["Content-Length"] = "0"
        }

        local guildName = getGuildName(config.discordServerID)

        if(guildName) then
            print("^2Discord bot connected to ^4" .. guildName .. "^7")
        else
            print("^1The Discord server you selected in the settings is NOT correct, you have to choose the correct one^7")
            print("^1If you are 100% sure your server is correct, then it means your bot is rate limited by Discord, to fix it you'll have to wait some time^7")
            return
        end

        tryToConnectDiscordBot()
        
        if(not isBotRoleAboveWhitelistRole()) then
            print("^1Easy Allowlist bot role ^3must be^1 above the whitelist role you choose, you have to change it in your Discord server roles settings^7")
        end
    else
        isDiscordBotAvailable = false
    end
end)

RegisterCommand("checkDiscordBot", function(playerId) 
    if(playerId > 0) then return end

    print("Is discord bot logged: ", tostring(checkIfBotIsLogged()))
end)

RegisterCommand("checkUserRoles", function(playerId, args)
    if(playerId > 0) then return end

    local userId = args[1]

    if(not userId) then
        print("^1Usage: checkUserRoles DiscordUserId^7")
        print("^3Example: checkUserRoles 24868243395051537^7")
        return
    end

    local roles = EasyAllowlist.getDiscordRolesForUser(userId)

    print("User roles:")
    for i=1, #roles do
        local roleData = EasyAllowlist.getDiscordRoleData(roles[i])

        print(roleData.name .. " - " .. roleData.id)
    end
end)