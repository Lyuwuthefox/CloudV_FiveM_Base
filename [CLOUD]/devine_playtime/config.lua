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
Devine.Fetch = 10 -- Fetch top 10 Players
Devine.playtimeCmd = 'playtime'

Devine.Webhook = {
    Username = 'PLAYTIME',
    Title = 'Devine | Playtime',
    Color = 3092790, -- https://www.mathsisfun.com/hexadecimal-decimal-colors.html
    Logo = 'https://cdn.discordapp.com/attachments/967536716401475616/1043916550589141133/Group_23.png',
    Footer = 'Devine | Playtime',

    MsgLayout = '**#%s** | %s | %s',

    Settings = {
        Enabled = true,
        Webhook = 'WEBHOOK HERE',
        frequency = 50 * 60000 -- 50 Minutes
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