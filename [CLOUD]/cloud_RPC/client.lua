local WaitTime = 5 -- How often do you want to update the status (In MS)
local appid = '904890459162304613' -- Make an application @ https://discordapp.com/developers/applications/ ID can be found there.
local asset = 'logo' -- Go to https://discordapp.com/developers/applications/APPID/rich-presence/assets

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(WaitTime)

        local id = GetPlayerServerId(PlayerId())
        local name = GetPlayerName(PlayerId())
        local playerCount = #GetActivePlayers()

        SetDiscordAppId(appid)
        SetDiscordRichPresenceAsset(asset)
        SetDiscordRichPresenceAssetText('Cloud-V RPG')
        SetDiscordRichPresenceAssetSmall(logo_small)
        SetDiscordRichPresenceAssetSmallText('CloudV.cc')

        SetDiscordRichPresenceAction(0, "Discord", "https://discord.gg/CloudRPG")
        SetDiscordRichPresenceAction(1, "Verbinden", "fivem://connect/soon")

        SetRichPresence(playerCount.."/128 - ID: "..id.." | Name: "..name)
        
    end
end)