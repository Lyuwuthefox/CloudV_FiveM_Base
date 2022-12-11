WS = {}

WS.settings = {
    getSharedObject = "esx:getSharedObject",
    price = 250, -- price for each change --
    saveprice = 250,
    useESXLegacy = true, -- or 1.2 --
    useOxMysql = false, -- change also in fxmanifest
}

WS.blip = {
    label = 'Kleidungsshop',
    sprite = 73,
    colour = 57,
    scale = 0.9,
    display = 4,
}

WS.cam = {
    offset = {0.0, 1.5, 0.8}, -- x, y, z offset coords of the camera: https://docs.fivem.net/natives/?_0x1899F328B0E12848
    fov = 75.0,
}

WS.marker = {
    typ = 21,
    move = false,
    rotate = true,
    enabled = true,
    drawDistance = 10.0,
    color = {
        r = 11,
        g = 154,
        b = 245,
        t = 100
    },
    size = {
        x = 1.0,
        y = 1.0,
        z = 1.0
    },
    offsetz = 1.0
}

WS.positions = {
    vector3(72.3, -1399.1, 28.4),
    vector3(-703.8, -152.3, 36.4),
    vector3(-167.9, -299, 38.7),
    vector3(428.7, -800.1, 28.5),
    vector3(-829.4, -1073.7, 10.3),
    vector3(-1447.8, -242.5, 48.8),
    vector3(11.6, 6514.2, 30.9),
    vector3(123.6, -219.4, 53.6),
    vector3(1696.3, 4829.3, 41.1),
    vector3(618.1, 2759.6, 41.1),
    vector3(1190.6, 2713.4, 37.2),
    vector3(-1193.4, -772.3, 16.3),
    vector3(-3172.5, 1048.1, 19.9),
    vector3(-1108.4, 2708.9, 18.1),
    vector3(-1044.23, -2825.93, 26.69),
    vector3(4959.61, -5785.29, 20.84), --CAYO
}

WS.clothes = {
    "mask_1",
    "helmet_1",
    "chain_1",
    "glasses_1", 
    "torso_1",
    "tshirt_1",
    "bags_1",
    "bproof_1",
    "arms",
    "pants_1", 
    "decals_1", 
    "shoes_1",
}
-- current available skinchanger components (+ the _2 version this means the color variation): 
-- mask_1, helmet_1, chain_1, glasses_1, torso_1, tshirt_1, bags_1, bproof_1, arms, pants_1, decals_1, shoes_1

WS.blacklist = {
    --["mask_1"] = {23, 25}, -- example how to blacklist specific ids
    ["mask_1"] = {},
    ["helmet_1"] = {},
    ["chain_1"] = {},
    ["glasses_1"] = {}, 
    ["torso_1"] = {},
    ["tshirt_1"] = {},
    ["bags_1"] = {},
    ["bproof_1"] = {},
    ["arms"] = {},
    ["pants_1"] = {}, 
    ["decals_1"] = {}, 
    ["shoes_1"] = {},
    
}

WS.blacklistedNameComponents = {"<", ">"}

WS.locales = {
    ["locale"] = {
        ['server_name'] = '',
        ['cloth_shop'] = {
            ['shop_title'] = {
                ['shop_title'] = 'Kleidungsladen',
                ['left_top'] = '',
                ['left_middle'] = 'Kleidungsshop',
                ['left_bottom'] = 'Willkommen im Kleidungsladen',
            },
            ['texts'] = {
                ['rotate'] = 'Drehe deinen Spieler um 360°',
                ['choice'] = 'Kleidungsvariaton wählen',
            },
            ['change_cloth'] = {
                ['title'] = 'Kleidungsvariaton',
                ['view'] = 'Schauen',
                ['color'] = 'Farbe',
                ['buy'] = 'Kaufen',
            },
            ['components'] = {
                ['title'] = 'Kategorie'
            }
        },
        ['outfit_selection'] = {
            ['selection'] = {
                ['title'] = 'Warnung',
                ['sub_title'] = 'Betrete den Kleidungsladen oder verwalte deine Outfits',
                ['cloth_shop'] = 'Kleidungsshop',
                ['outfits'] = 'Kleiderschrank',
            },
            ['change_name'] = {
                ['input_text'] = 'Namen wechseln',
                ['confirm'] = 'Bestätigen'
            },
            ['save'] = {
                ['title'] = 'Warnung',
                ['sub_title'] = 'Möchtest du das Outfit speichern? (+'..WS.settings.saveprice..'€)',
                ['save'] = 'Speichern.',
                ['remove'] = "Nicht speichern.",
            },
        },
        ['wardrobe'] = {
            ['wardrobe_title'] = {
                ['top'] = 'Deine',
                ['middle'] = 'Garderobe',
                ['bottom'] = 'Deine Kleidung wird hier aufbewahrt, du kannst sie jederzeit wechseln oder wegwerfen.',
            }
        },
    },
    ['game'] = {
        ['press_e'] = 'Drücke E um den Kleidungsshop zu öffnen',
        ['has_enough_money'] = 'Du hast %s€ für das Outfit bezahlt!', -- %s is the money value
        ['has_not_enough_money_outfit'] = "Du hast nicht genug Geld um das Outfit zu bezahlen.",
        ['has_not_enough_money_outfitsave'] = "Du hast nicht genug Geld um das Outfit zu speichern.",
    },
    ["clothes"] = {
        ['mask_1'] = {
            ["color"] = 'mask_2',
            ["svg"] = 'mask',
            ["label"] = 'Maske'
        },
        ['helmet_1'] = {
            ["color"] = 'helmet_2',
            ["svg"] = 'cap',
            ["label"] = 'Hut'
        },
        ['chain_1'] = {
            ["color"] = 'chain_2',
            ["svg"] = 'chain',
            ["label"] = 'Kette'
        },
        ['glasses_1'] = {
            ["color"] = 'glasses_2',
            ["svg"] = 'glasses',
            ["label"] = 'Brille'
        },
        ['torso_1'] = {
            ["color"] = 'torso_2',
            ["svg"] = 'torso',
            ["label"] = 'Torso'
        },
        ['tshirt_1'] = {
            ["color"] = 'tshirt_2',
            ["svg"] = 'tshirt',
            ["label"] = 'TShirt'
        },
        ['bags_1'] = {
            ["color"] = 'bags_2',
            ["svg"] = 'backpack',
            ["label"] = 'Tasche'
        },
        ['bproof_1'] = {
            ["color"] = 'bproof_2',
            ["svg"] = 'vest',
            ["label"] = 'Weste'
        },
        ['arms'] = {
            ["color"] = nil, -- there is no available color component
            ["svg"] = 'arms',
            ["label"] = 'Arme'
        },
        ['pants_1'] = {
            ["color"] = 'pants_2',
            ["svg"] = 'trousers',
            ["label"] = 'Hose'
        },
        ['decals_1'] = {
            ["color"] = 'decals_2',
            ["svg"] = 'watch',
            ["label"] = 'Uhr'
        },
        ['shoes_1'] = {
            ["color"] = 'shoes_2',
            ["svg"] = 'shoes',
            ["label"] = 'Schuhe'
        },
    }
}

-- SERVER FUNCTIONS  --
function isBlacklistedName(name)
    for k, v in ipairs(WS.blacklistedNameComponents) do
        if string.find(name, v) then
            return true
        end
    end
    return false
end

function getPlayerMoney(xPlayer)
    if WS.settings.useESXLegacy then
        return xPlayer.getAccount('money').money -- both work in legacy --
    else
        return xPlayer.getMoney() -- esx 1.1 --
    end
end

function removePlayerMoney(xPlayer, amount)
    if WS.settings.useESXLegacy then
        xPlayer.removeAccountMoney('money', amount)
    else
        xPlayer.removeMoney(amount)
    end
end

-- CLIENT FUNTIONS --

-- if you want to use your own skinchanger, call the cb with the specific data skin --
-- this gets the player skin (table) --
function getSkin(cb)
    TriggerEvent('skinchanger:getSkin', function(skin)
        cb(skin)
    end)
end

-- this gets the min & max values of all available skin-components --
function getMaxValues(cb)
    TriggerEvent('skinchanger:getData', function(components, maxVals)
        cb(components, maxVals)
    end)
end

-- change the specific component --
function changeSkin(comp, index)
    TriggerEvent('skinchanger:change', comp, index)
end

function saveSkin(skin)
    TriggerServerEvent('esx_skin:save', skin)
end

-- load skin --
function loadSkin(skin)
    TriggerEvent('skinchanger:loadSkin', skin)
end

function loadClothes(clothes)
    getSkin(function(skin)
        TriggerEvent('skinchanger:loadClothes', skin, clothes)
    end)
end

function Notify(msg)
    TriggerEvent("sanity:notify", "KLEIDUNGSLADEN", msg, 5000, "info")
end

SetTextComponentFormat =    function(ftype)
    --print(ftype)
end

function HelpNotify(msg)
    TriggerEvent("sanity:helpnotify", "um auf den Kleidungsladen zuzugreifen")
end

DisplayHelpTextFromStringLabel = function(one, two, three, four)
    --print(one, two, three, four)
end