Config = {}


Config.WeaponLicensePrice = 50000

Config.Blips = {
    ["supermarket"] = { -- category name
        enabled = true,
        sprite = 52,
        display = 4,
        scale = 0.9,
        color = 57,
        shortrange = true,
        text = "Supermarkt"
    },
    ["weaponshop"] = {
        enabled = true,
        sprite = 110,
        display = 4,
        scale = 0.9,
        color = 57,
        shortrange = true,
        text = "Waffenladen"
    },
    ["blackmarket"] = {
        enabled = false,
        sprite = 110,
        display = 4,
        scale = 1.0,
        color = 75,
        shortrange = true,
        text = "Schwarzmarkt"
    }
}

Config.Positions = {
    -- Supermarket
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
    {coords = vector3(-1031.36, -2760.45, 21.34), type = "supermarket"},
    {coords = vector3(4493.92, -4525.67, 4.41), type = "supermarket"},
    -- Weaponshop
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

    -- Blackmarkets
    {coords = vector3(-43.45, -2684.95, 6.0), type = "blackmarket"},
}

Config.Items = {
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
                name = "kaffee",
                label = "Kaffee",
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
                name = "switch",
                label = "Nintendo Switch",
                price = 15000,
                type = "item"
            },
            {
                name = "phone",
                label = "Handy",
                price = 2500,
                type = "item"
            },
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
                name = "medikit",
                label = "Medikit",
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
                name = "clip",
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
                name = "clip",
                label = "Munition",
                price = 5500,
                type = "item"
            },
        }
    }
}
