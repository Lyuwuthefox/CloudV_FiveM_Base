B_SERVICE = {}

B_SERVICE.SharedObject = {
    ["Server"] = "esx:getSharedObject",
    ["Client"] = "esx:getSharedObject",
}

B_SERVICE.Title = "BERLIN <span>SHOP</span>"
B_SERVICE.Subtitle = 'BerlinCity'

B_SERVICE.SendNotify = function(color, title, message, time)
    TriggerEvent("sanity:notify", "SHOPSYSTEM", message, 5000, color)
end

B_SERVICE.EnableWeaponLicense = true 
B_SERVICE.CheckLicenseCallbackTrigger = "esx_license:checkLicense"
B_SERVICE.WeaponLicensePrice = 50000
B_SERVICE.WeaponLicenseShops = {
    "weaponshop"
}

B_SERVICE.MarkerType = 29
B_SERVICE.Scale = { x = 1.0, y = 1.0, z = 1.0 }
B_SERVICE.Color = { r = 11, g = 154, b = 245, a = 100 }

B_SERVICE.HelpNotify = function(msg)
    TriggerEvent("sanity:helpnotify", "um auf den Shop zuzugreifen")
end

B_SERVICE.Blips = {
    ["supermarket"] = { 
        enabled = true,
        sprite = 52,
        display = 4,
        scale = 0.9,
        color = 67,
        shortrange = true,
        text = "Supermarkt"
    },
    ["weaponshop"] = {
        enabled = true,
        sprite = 110,
        display = 4,
        scale = 0.9,
        color = 67,
        shortrange = true,
        text = "Waffenladen"
    },
    ["blackmarket"] = {
        enabled = false,
        sprite = 110,
        display = 4,
        scale = 1.0,
        color = 67,
        shortrange = true,
        text = "Schwarzmarkt"
    },
    ["airportphone"] = {
        enabled = false,
        sprite = 110,
        display = 4,
        scale = 1.0,
        color = 75,
        shortrange = true,
        text = "Handyladen Flughafen"
    },
    ["donut"] = {
        enabled = false,
        sprite = 110,
        display = 4,
        scale = 1.0,
        color = 75,
        shortrange = true,
        text = "Handyladen Flughafen"
    },
    ["cafe"] = {
        enabled = false,
        sprite = 110,
        display = 4,
        scale = 1.0,
        color = 75,
        shortrange = true,
        text = "Handyladen Flughafen"
    },
    ["subway"] = {
        enabled = false,
        sprite = 110,
        display = 4,
        scale = 1.0,
        color = 75,
        shortrange = true,
        text = "Handyladen Flughafen"
    },
    ["handy"] = {
        enabled = true,
        sprite = 459,
        display = 4,
        scale = 1.0,
        color = 57,
        shortrange = true,
        text = "Handy Laden"
    },

    
}

B_SERVICE.Positions = {
    {coords = vector3(373.875, 325.896, 103.566), type = "supermarket"},
    {coords = vector3(2557.458, 382.282, 108.622), type = "supermarket"},
    {coords = vector3(-3038.939, 585.954, 7.908), type = "supermarket"},
    {coords = vector3(-3241.927, 1001.462, 12.830), type = "supermarket"},
    {coords = vector3(1961.464, 3740.672, 32.343), type = "supermarket"},
    {coords = vector3(2678.916, 3280.671, 55.241), type = "supermarket"},
    {coords = vector3(1729.216, 6414.131, 35.037), type = "supermarket"},
    {coords = vector3(1135.808, -982.281, 46.415), type = "supermarket"},
    {coords = vector3(-1222.915, -906.983, 12.326), type = "supermarket"},
    {coords = vector3(-1487.553, -379.107, 40.163), type = "supermarket"},
    {coords = vector3(-2968.243, 390.910, 15.043), type = "supermarket"},
    {coords = vector3(1166.024, 2708.930, 38.157), type = "supermarket"},
    {coords = vector3(1392.562, 3604.684, 34.980), type = "supermarket"},
    {coords = vector3(-48.519, -1757.514, 29.421), type = "supermarket"},
    {coords = vector3(1163.373, -323.801, 69.205), type = "supermarket"},
    {coords = vector3(-707.501, -914.260, 19.215), type = "supermarket"},
    {coords = vector3(-1820.523, 792.518, 138.118), type = "supermarket"},
    {coords = vector3(1698.388, 4924.404, 42.063), type = "supermarket"},
    {coords = vector3(26.16, -1346.84, 29.48), type = "supermarket"},
    {coords = vector3(-1031.19, -2760.65, 21.34), type = "supermarket"},
    {coords = vector3(4493.92, -4525.67, 4.41), type = "supermarket"},
    {coords = vector3(383.86, -1018.31, 29.49), type = "supermarket"},
    

    {coords = vector3(814.83, -2152.98, 29.62), type = "weaponshop"},
    {coords = vector3(1696.27, 3756.2, 34.71), type = "weaponshop"},
    {coords = vector3(-327.88, 6080.0, 31.45), type = "weaponshop"},
    {coords = vector3(247.83, -49.62, 69.94), type = "weaponshop"},
    {coords = vector3(16.28, -1109.39, 29.8), type = "weaponshop"},
    {coords = vector3(2566.85, 298.49, 108.73), type = "weaponshop"},
    {coords = vector3(-1114.27, 2696.14, 18.55), type = "weaponshop"},
    {coords = vector3(843.06, -1029.2, 28.19), type = "weaponshop"},
    {coords = vector3(-661.09, -939.48, 21.83), type = "weaponshop"},
    {coords = vector3(-3168.18, 1085.31, 20.84), type = "weaponshop"},
    {coords = vector3(-1309.96, -392.47, 36.7), type = "weaponshop"},


    {coords = vector3(3426.13, 5174.66, 7.38), type = "blackmarket"},

        -- Flughafensmartphone
    {coords =vector3(-1073.77, -2803.18, 21.33), type = "airportphone"},
    {coords =vector3(353.51, -1024.16, 29.34), type = "donut"},
    {coords =vector3(369.89, -1022.6, 29.35), type = "cafe"},
    {coords =vector3(381.27, -1011.28, 29.43), type = "subway"},
    {coords =vector3(377.53, -1003.96, 29.44), type = "handy"},
    
    
}

B_SERVICE.Items = {
    ["supermarket"] = { -- shop type
    ["Essen"] = { -- Shop Category
        {
            name = "bread",
            label = "Brot",
            price = 10,
            type = "item" -- item / weapon
        },
        {
            name = "burger",
            label = "Burger",
            price = 10,
            type = "item"
        },
        {
            name = "chips",
            label = "Chips",
            price = 10,
            type = "item"
        },
        {
            name = "apple",
            label = "Apfel",
            price = 10,
            type = "item"
        },
    },
    ["Trinken"] = { -- Shop Category
        {
            name = "water",
            label = "Wasser",
            price = 10,
            type = "item"
        },
        {
            name = "cocacola",
            label = "Cola",
            price = 10,
            type = "item"
        },
        {
            name = "soda",
            label = "Soda",
            price = 10,
            type = "item"
        },
    },
    ["Items"] = { -- Shop Category
        {
            name = "ring",
            label = "Ehering",
            price = 150000,
            type = "item"
        },
        {
            name = "spray",
            label = "Grafitti",
            price = 100000,
            type = "item"
        },
        {
            name = "spray_remover",
            label = "Grafittientferner",
            price = 10000,
            type = "item"
        },
        {
            name = "fixtool",
            label = "Reparaturkasten",
            price = 15000,
            type = "item"
        },
        {
            name = "bandage",
            label = "Bandagen",
            price = 2500,
            type = "item"
        },
        {
            name = "wuerfel",
            label = "Würfel",
            price = 3000,
            type = "item"
        },
    },
},
["weaponshop"] = {
    ["Waffen"] = { -- Shop Category
        {
            name = "weapon_knife",
            label = "Messer",
            price = 10000,
            type = "weapon"
        },
        {
            name = "weapon_bat",
            label = "Baseball Schläger",
            price = 12500,
            type = "weapon"
        },
        {
            name = "weapon_ceramicpistol",
            label = "Keramik Pistole",
            price = 150000,
            type = "weapon"
        },
        {
            name = "weapon_crowbar",
            label = "Brechstange",
            price = 13200,
            type = "weapon"
        },
    },
    ["Weiteres"] = { -- Shop Category
        {
            name = "gadget_parachute",
            label = "Fallschirm",
            price = 7000,
            type = "weapon"
        },
        {
            name = "magsmall",
            label = "Munition",
            price = 3000,
            type = "item"
        },
    }
},
["blackmarket"] = { -- blackmarket = black_money will be used on both payment buttons
["Waffen"] = { -- Shop Category
    {
        name = "weapon_hatchet",
        label = "Axt",
        price = 100000,
        type = "weapon"
    },
    {
        name = "weapon_advancedrifle",
        label = "Advancedgewehr",
        price = 3500000,
        type = "weapon"
    },
    {
        name = "weapon_assaultrifle",
        label = "AK-47",
        price = 2000000,
        type = "weapon"
    },
    {
        name = "weapon_poolcue",
        label = "Billardqueue",
        price = 75000,
        type = "weapon"
    },
},
["Weiteres"] = { -- Shop Category
    {
        name = "maggros",
        label = "Munitionsbox",
        price = 55000,
        type = "item"
    },
}
},
["airportphone"] = { -- blackmarket = black_money will be used on both payment buttons
["Items"] = { -- Shop Category
    {
        name = "phone",
        label = "Smartphone",
        price = 15000,
        type = "item"
    },
}
},
["donut"] = { -- blackmarket = black_money will be used on both payment buttons
["Essen"] = { -- Shop Category
    {
        name = "donut1",
        label = "Erdbeer Donut",
        price = 20,
        type = "item"
    },
    {
        name = "donut2",
        label = "Schoko Donut",
        price = 20,
        type = "item"
    },
}
},
["cafe"] = { -- blackmarket = black_money will be used on both payment buttons
["Trinken"] = { -- Shop Category
    {
        name = "kaffee",
        label = "Kaffee",
        price = 20,
        type = "item"
    },
    {
        name = "choco",
        label = "Kakao",
        price = 20,
        type = "item"
    },
}
},
["subway"] = { -- blackmarket = black_money will be used on both payment buttons
["Essen"] = { -- Shop Category
    {
        name = "subway",
        label = "Sandwich",
        price = 20,
        type = "item"
    },
    {
        name = "toast",
        label = "Toast",
        price = 20,
        type = "item"
    },
}
},
["handy"] = { -- blackmarket = black_money will be used on both payment buttons
["Items"] = { -- Shop Category
    {
        name = "phone",
        label = "Handy",
        price = 5000,
        type = "item"
    },
    {
        name = "simcard",
        label = "Simcard",
        price = 750,
        type = "item"
    },
    {
        name = "switch",
        label = "Nintendo Switch",
        price = 25000,
        type = "item"
    },
}
}

}

