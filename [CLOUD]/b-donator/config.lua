BDEV = {
    Currency = "coins", -- can be: coins (tebex coins), bank, money, black_money
    esxSharedObject = "esx:getSharedObject",
    AdminGroups = {"projektleitung", "admin"}, -- groups who can use /addcoins {amount}
    Container = {
        Pos = vector3(55.18, -1739.06, 29.59),
        Heading = 46.88,
        Ped = `a_m_y_smartcaspat_01`,
        CarSpawn = {
            coords = vector3(827.77, -2988.28, 5.9),
            heading = 187.9
        }
    },
    Case = {
        Pos = vector3(46.27, -1749.8, 29.64),
        Heading = 53.23,
        Ped = `a_m_y_smartcaspat_01`,
        CarSpawn = {
            coords = vector3(827.77, -2988.28, 5.9),
            heading = 187.9
        }
    },
    Locales = {
        PressToContainer = "Drücke ~INPUT_CONTEXT~ um auf den Containershop zuzugreifen.",
        PressToCase = "Drücke ~INPUT_CONTEXT~ um auf den Caseshop zuzugreifen.",
        AlreadyUsed = "Dieser Code wurde bereits verwendet.",
        CoinsReceived = "Du hast insgesamt %s Coins erhalten. Danke für deinen Einkauf",
        InvalidTransid = "Du hast eine ungültige Transaktions-ID eingegeben.",
        NotEnough = "Du hast nicht genügend Coins",
        Error = "Ein unbekannter Fehler ist aufgetreten.",
        BestDropTodayDefault = "Noch nichts...",
        ItemWin = "Du hast %sx %s gewonnen.",
        ItemWinBig = "%s hat %sx %s gewonnen. Was ein Glück...",
        VehicleWin = "Du hast einen %s gewonnen.",
        VehicleWinBig = "%s hat einen %s gewonnen.",
        AccountWin = "Du hast %s$ %s gewonnen.",
        AccountWinBig = "%s hat %s$ %s gewonnen. Stonks",
        UI_containerHeader = "CONTAINER",
        UI_casesHeader = "Cases",
        UI_currentBalance = "Dein Guthaben",
        UI_casesOpenedAllTime = "Insgesamt geöffnet",
        UI_bestDrop = "Bester Gewinn heute",
        UI_my = "Meine",
        UI_all = "Alle",
        UI_caseSwitch = "Kisten",
        UI_containerSwitch = "Containers",
        UI_buy = "Kaufen",
        UI_open = "Öffnen",
        UI_whatsInside = "Kisteninhalt",
        UI_yourReward ="Dein Gewinn",
        UI_close = "Schließen",
        UI_currency = "☁️ "
    },
    Cases = {
        ["fly"] = {
            title = "Fly Case",
            price = 1,
            icon = "fly",
            items = {
                {
                    name = "mrbeanmini", -- item name & icon name
                    rewardType = "vehicle", -- reward type (item, account, vehicle)
                    title = "MrBean Mini Car", -- for displaying
                    rarity = 99 -- will not affect any winning chance, but display as Best drop today
                },
                {
                    name = "bulletproof", -- item name & icon name
                    count = 2, -- item count
                    rewardType = "item", -- reward type (item, account, vehicle)
                    title = "Schutzweste", -- for displaying
                    rarity = 0 -- will not affect any winning chance, but display as Best drop today
                },
                {
                    name = "medikit", -- item name & icon name
                    count = 1, -- item count
                    rewardType = "item", -- reward type (item, account, vehicle)
                    title = "Medikit", -- for displaying
                    rarity = 0 -- will not affect any winning chance, but display as Best drop today
                },
                {
                    name = "fixkit", -- item name & icon name
                    count = 1, -- item count
                    rewardType = "item", -- reward type (item, account, vehicle)
                    title = "Repairkit", -- for displaying
                    rarity = 0 -- will not affect any winning chance, but display as Best drop today
                },
                {
                    name = "bank", -- item name & icon name
                    count = 5000, -- item count
                    rewardType = "account", -- reward type (item, account, vehicle)
                    title = "5000$ Check", -- for displaying
                    rarity = 0 -- will not affect any winning chance, but display as Best drop today
                },
                {
                    name = "black_money", -- item name & icon name
                    count = 5000, -- item count
                    rewardType = "account", -- reward type (item, account, vehicle)
                    title = "25.000 Schwarzgeld", -- for displaying
                    rarity = 0 -- will not affect any winning chance, but display as Best drop today
                },
            }
        },
        ["helpfull"] = {
            title = "Season I Case",
            price = 5,
            icon = "helpfull",
            items = {
                {
                    name = "rmodm4gts", -- item name & icon name
                    rewardType = "vehicle", -- reward type (item, account, vehicle)
                    title = "BMW M4 GTS", -- for displaying
                    rarity = 99 -- will not affect any winning chance, but display as Best drop today
                },
                {
                    name = "bulletproof", -- item name & icon name
                    count = 2, -- item count
                    rewardType = "item", -- reward type (item, account, vehicle)
                    title = "Schutzweste", -- for displaying
                    rarity = 0 -- will not affect any winning chance, but display as Best drop today
                },
                -- {
                --     name = "black_money", -- account name & icon name
                --     count = 169000, -- money amount
                --     rewardType = "account", -- reward type (item, account, vehicle)
                --     title = "Schwarzgeld", -- for displaying
                --     rarity = 2 -- will not affect any winning chance, but display as Best drop today
                -- },
                -- {
                --     name = "black_money", -- account name & icon name
                --     count = 169000, -- money amount
                --     rewardType = "account", -- reward type (item, account, vehicle)
                --     title = "Schwarzgeld", -- for displaying
                --     rarity = 2 -- will not affect any winning chance, but display as Best drop today
                -- },
                --               {
                --     name = "black_money", -- account name & icon name
                --     count = 169000, -- money amount
                --     rewardType = "account", -- reward type (item, account, vehicle)
                --     title = "Schwarzgeld", -- for displaying
                --     rarity = 2 -- will not affect any winning chance, but display as Best drop today
                -- },
                -- {
                --     name = "money", -- account name & icon name
                --     count = 187187, -- money amount
                --     rewardType = "account", -- reward type (item, account, vehicle)
                --     title = "Bargeld", -- for displaying
                --     rarity = 10 -- will not affect any winning chance, but display as Best drop today
                -- },
                -- {
                --     name = "bank", -- account name & icon name
                --     count = 11313, -- money amount
                --     rewardType = "account", -- reward type (item, account, vehicle)
                --     title = "Kontostand", -- for displaying
                --     rarity = 15 -- will not affect any winning chance, but display as Best drop today
                -- }
            }
        },
        ["Items"] = {
            title = "MrBean Case",
            price = 10,
            icon = "Items",
            items = {
                {
                    name = "mrbeanmini", -- item name & icon name
                    rewardType = "vehicle", -- reward type (item, account, vehicle)
                    title = "MrBean Mini Car", -- for displaying
                    rarity = 99 -- will not affect any winning chance, but display as Best drop today
                },
                {
                    name = "bulletproof", -- item name & icon name
                    count = 2, -- item count
                    rewardType = "item", -- reward type (item, account, vehicle)
                    title = "Schutzweste", -- for displaying
                    rarity = 0 -- will not affect any winning chance, but display as Best drop today
                },
                {
                    name = "medikit", -- item name & icon name
                    count = 1, -- item count
                    rewardType = "item", -- reward type (item, account, vehicle)
                    title = "Medikit", -- for displaying
                    rarity = 0 -- will not affect any winning chance, but display as Best drop today
                },
                {
                    name = "fixkit", -- item name & icon name
                    count = 1, -- item count
                    rewardType = "item", -- reward type (item, account, vehicle)
                    title = "Repairkit", -- for displaying
                    rarity = 0 -- will not affect any winning chance, but display as Best drop today
                },
                {
                    name = "bank", -- item name & icon name
                    count = 5000, -- item count
                    rewardType = "account", -- reward type (item, account, vehicle)
                    title = "5000$ Check", -- for displaying
                    rarity = 0 -- will not affect any winning chance, but display as Best drop today
                },
                {
                    name = "black_money", -- item name & icon name
                    count = 5000, -- item count
                    rewardType = "account", -- reward type (item, account, vehicle)
                    title = "25.000 Schwarzgeld", -- for displaying
                    rarity = 0 -- will not affect any winning chance, but display as Best drop today
                },
                {
                    name = "clip", -- item name & icon name
                    count = 1, -- item count
                    rewardType = "item", -- reward type (item, account, vehicle)
                    title = "Munitionsbox", -- for displaying
                    rarity = 0 -- will not affect any winning chance, but display as Best drop today
                },
                {
                    name = "machete", -- item name & icon name
                    count = 1, -- item count
                    rewardType = "item", -- reward type (item, account, vehicle)
                    title = "Machete", -- for displaying
                    rarity = 0 -- will not affect any winning chance, but display as Best drop today
                },
                {
                    name = "pistole", -- item name & icon name
                    count = 1, -- item count
                    rewardType = "item", -- reward type (item, account, vehicle)
                    title = "Pistole", -- for displaying
                    rarity = 0 -- will not affect any winning chance, but display as Best drop today
                },
                {
                    name = "switchblade", -- item name & icon name
                    count = 1, -- item count
                    rewardType = "item", -- reward type (item, account, vehicle)
                    title = "Butterfly Knife", -- for displaying
                    rarity = 0 -- will not affect any winning chance, but display as Best drop today
                },
                {
                    name = "meth2", -- item name & icon name
                    count = 1, -- item count
                    rewardType = "item", -- reward type (item, account, vehicle)
                    title = "Methtüte", -- for displaying
                    rarity = 0 -- will not affect any winning chance, but display as Best drop today
                },
                {
                    name = "bandage", -- item name & icon name
                    count = 1, -- item count
                    rewardType = "item", -- reward type (item, account, vehicle)
                    title = "Verband", -- for displaying
                    rarity = 0 -- will not affect any winning chance, but display as Best drop today
                },
            }
        },
        ["PVP"] = {
            title = "PVP Case",
            price = 5,
            icon = "PVP",
            items = {
                {
                    name = "rmodm4gts", -- item name & icon name
                    rewardType = "vehicle", -- reward type (item, account, vehicle)
                    title = "BMW M4 GTS", -- for displaying
                    rarity = 99 -- will not affect any winning chance, but display as Best drop today
                },
                {
                    name = "bulletproof", -- item name & icon name
                    count = 2, -- item count
                    rewardType = "item", -- reward type (item, account, vehicle)
                    title = "Schutzweste", -- for displaying
                    rarity = 0 -- will not affect any winning chance, but display as Best drop today
                },
                -- {
                --     name = "black_money", -- account name & icon name
                --     count = 169000, -- money amount
                --     rewardType = "account", -- reward type (item, account, vehicle)
                --     title = "Schwarzgeld", -- for displaying
                --     rarity = 2 -- will not affect any winning chance, but display as Best drop today
                -- },
                -- {
                --     name = "black_money", -- account name & icon name
                --     count = 169000, -- money amount
                --     rewardType = "account", -- reward type (item, account, vehicle)
                --     title = "Schwarzgeld", -- for displaying
                --     rarity = 2 -- will not affect any winning chance, but display as Best drop today
                -- },
                --               {
                --     name = "black_money", -- account name & icon name
                --     count = 169000, -- money amount
                --     rewardType = "account", -- reward type (item, account, vehicle)
                --     title = "Schwarzgeld", -- for displaying
                --     rarity = 2 -- will not affect any winning chance, but display as Best drop today
                -- },
                -- {
                --     name = "money", -- account name & icon name
                --     count = 187187, -- money amount
                --     rewardType = "account", -- reward type (item, account, vehicle)
                --     title = "Bargeld", -- for displaying
                --     rarity = 10 -- will not affect any winning chance, but display as Best drop today
                -- },
                -- {
                --     name = "bank", -- account name & icon name
                --     count = 11313, -- money amount
                --     rewardType = "account", -- reward type (item, account, vehicle)
                --     title = "Kontostand", -- for displaying
                --     rarity = 15 -- will not affect any winning chance, but display as Best drop today
                -- }
            }
        },
        
    },
    Containers = {
        ["blau"] = {
            title = "Container: Ani",
            price = 500,
            icon = "blau",
            items = {
                {
                    name = "18performante", -- item name & icon name
                    rewardType = "vehicle", -- reward type (item, account, vehicle)
                    title = "Lamborghini Performante", -- for displaying
                    rarity = 99 -- will not affect any winning chance, but display as Best drop today
                },
            }
        },
        ["black"] = {
            title = "Container: Nova",
            price = 1000,
            icon = "black",
            items = {
                {
                    name = "18performante", -- item name & icon name
                    rewardType = "vehicle", -- reward type (item, account, vehicle)
                    title = "Lamborghini Performante", -- for displaying
                    rarity = 99 -- will not affect any winning chance, but display as Best drop today
                },
            }
        },
        ["rot"] = {
            title = "Container: Flare",
            price = 150,
            icon = "rot",
            items = {
                {
                    name = "18performante", -- item name & icon name
                    rewardType = "vehicle", -- reward type (item, account, vehicle)
                    title = "Lamborghini Performante", -- for displaying
                    rarity = 99 -- will not affect any winning chance, but display as Best drop today
                },
            }
        },
        ["green"] = {
            title = "Container: Vegie",
            price = 50,
            icon = "green",
            items = {
                {
                    name = "18performante", -- item name & icon name
                    rewardType = "vehicle", -- reward type (item, account, vehicle)
                    title = "Lamborghini Performante", -- for displaying
                    rarity = 99 -- will not affect any winning chance, but display as Best drop today
                },
            }
        },
    },
    TebexPackages = { -- Package ID -> how much coins
       ["5431108"] = 10,
       ["5431591"] = 25,
       ["5431592"] = 50,
       ["5431596"] = 500,
       ["5431597"] = 2500,
       ["5431619"] = 75,
       ["5431621"] = 150,

    },
    -- redeem (tbx-id)
    Notify = function(msg) -- msg: notification message  <---- this is executed clientsided
        TriggerEvent("sanity:notify", "Tebex Store", msg, 5000, "success")
    end,
    BigWinAnnounce = function(src, msg) -- src: player who won, in case you wanna do something with it. | msg: global msg that gets broadcast <---- this is executed serversided
        TriggerClientEvent("sanity:announce", -1, msg, 4000)
    end
}

--[[

    BigWinAnnounce: Gets triggered when a player wins an item with rarity 50+ and should be a global message.

]]