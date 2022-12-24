Config = {}

-- Choose your Framework ONLY ONE CAN TRUE!
Config.useESX = true
Config.useQBCore = false

Config.minnumber = 100000
Config.maxnumber = 999999

Config.SimCardItem = "simcard"

if Config.useESX then

    ESX = exports['es_extended']:getSharedObject()

    -- Run the code below if ESX nil is displayed in your console and delete the code above--.

    -- ESX = nil
    -- TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

    Config.UserTable = "users"
    Config.IdentifierTable = "identifier"

elseif Config.useQBCore then

    Config.NewQBVersion = true

    if Config.NewQBVersion then
        QBCore = exports['qb-core']:GetCoreObject()
    else
        TriggerEvent("QBCore:GetObject", function(obj)
            QBCore = obj
        end)
    end

    Config.UserTable = "players"
    Config.IdentifierTable = "citizenid"

end

Config.RemoveItemAfterNumberChange = true

Config.Locales = {

    simcardmenu = "Neue Nummer",
    invalid_amount = "Deine Nummer kann nicht 0 sein",
    enter_newnumber = "Die neue Nummer muss zwischen ".. Config.minnumber .. " und " .. Config.maxnumber .." sein!",
    number_exists = "Diese Nummer Existiert bereits!",
    number_must_between = "Die neue Nummer muss zwischen ".. Config.minnumber .. " und " .. Config.maxnumber .." sein!",
    number_consist_numers = "Deine Nummer muss Nummern behalten",
    number_changed = "Nummer wird nach der Sonnenwende geändert!"

}
