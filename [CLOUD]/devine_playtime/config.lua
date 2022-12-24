Devine = {}

Devine.ESX = true -- If not using ESX, Steam name will be used instead of character name. You can also disable this if you only want Steam names but you use esx
Devine.newESX = true -- ESX 1.2 or higher

Devine.RequireESX = function()
    if Devine.newESX then
        ESX = exports["es_extended"]:getSharedObject()
    else
        ESX = nil
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    end
end

Devine.Notify = function(src, type, msg)
    -- Your Notify Trigger Here
    TriggerClientEvent("sanity:notify", src, "PLAYTIME", msg, 5000, "info")
end

Devine.Cooldown = 2500 -- 2.5 Seconds
Devine.Fetch = 5 -- Fetch top 10 Players
Devine.playtimeCmd = 'playtime'

Devine.Webhook = {
    Username = 'Top 5 Aktivste Spieler',
    Title = 'Cloud V',
    Color = 760565, -- https://www.mathsisfun.com/hexadecimal-decimal-colors.html
    Logo = 'https://media.discordapp.net/attachments/1043987240856064101/1052832711552802826/Aysa.gif',
    Footer = 'Cloud V | Playtime',

    MsgLayout = '**#%s** | %s | %s',

    Settings = {
        Enabled = true,
        Webhook = 'https://discord.com/api/webhooks/1053734459549171822/kP8skQozvoodooqLNwrggRsy-7kFWSgcA1PhB5_so_dyIccAA56Ew0DACoRQc_eGd9dr',
        frequency = 900 * 60000 -- 50 Minutes
    }

}

Devine.Lang = 'DE'
Devine.Language = {
    ['DE'] = {
        cooldown_msg = 'Bitte Warte!',
        playtime_msg = 'Deine Spielzeit: ',
        days = 'Tag',
        hours = 'Stunde',
        minutes = 'Minute',
        multipledays = 'Tage',
        multiplehours = 'Stunden',
        multipleminutes = 'Minuten',
    },
    ['EN'] = {
        cooldown_msg = 'Please wait!',
        playtime_msg = 'Your Playtime: ',
        days = 'Day',
        hours = 'Hour',
        minutes = 'Minute',
        multipledays = 'Days',
        multiplehours = 'Hours',
        multipleminutes = 'Minutes',
    }
}

--[[
    Do you want to implement this script into your own resource?

    Exports:

    exports['devine_playtime']:getPlayTime(source) -- Returns the playtime of the player in Minutes
    exports['devine_playtime']:insertOrUpdatePlayTime(source, time) -- Update Playtime or Insert if not exists
    exports['devine_playtime']:getLastUpdate(source) -- Returns the last update of the player
]]