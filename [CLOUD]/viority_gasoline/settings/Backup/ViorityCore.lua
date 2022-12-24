ViorityCore = {}
ViorityCore['config'] = {
    
    -- All Variables for the Viority-API
    ['auth'] = {
        ['Viority_License'] = "Viority_FiveM_XXX", -- <-- Put your License here
        ['Viority_Version'] = "1.0.0", -- DO NOT CHANGE IF YOU DO NOT KNOW WHAT YOU ARE DOING!
        ['Viority_Product'] = "viority_gasoline" -- DO NOT CHANGE IF YOU DO NOT KNOW WHAT YOU ARE DOING! (ONLY FOR THE VERSION CHECK)
    },

    -- ESX  
    ['ESX_Version'] = "legacy", -- 1.1, 1.2 or legacy
    ['esxgetSharedObject'] = "esx:getSharedObject",
    ['esxplayerLoaded'] = "esx:playerLoaded",
    ['esxprefix'] = "viority_gasoline:",

    -- Activate Debug Modus
    ['debug_mode'] = false, -- Activate the Debug modus to identify a bug in the code.

    -- Use Steam Identifier
    ['steamidentifier'] = false, -- If your Server use the Steam as identifier instead of the Rockstar License

    -- Nui Color 
    ['MainColorCode'] = '#ffe600', -- Enter a valid Hexcode! 
    ['SecondColorCode'] = '#000000', -- Enter a valid Hexcode! 

    ['ChartMainColorCode'] = 'rgba(226, 208, 42, 0.05)', -- Enter a valid RGB or RGBA Code! 
    ['ChartSecondColorCode'] = 'rgb(226, 208, 42)', -- Enter a valid RGB or RGBA Code! 

    -- Discord Webhook
    ['DiscordWebhook'] = {
        ['WebhookRefuelling'] = "https://discord.com/api/webhooks/XXX", -- <-- Put your desired webhook link here
        ['WebhookBusiness'] = {
            ['Management'] = "https://discord.com/api/webhooks/XXX", -- Buy and Sell
            ['Liquidity'] = "https://discord.com/api/webhooks/XXX",
            ['PromotionCode'] = "https://discord.com/api/webhooks/XXX",
        },

        ['WebhookColor'] = "3054334", -- <-- Put your desired embed color (decimal)
        ['WebhookAuthorTitle'] = "Viority Development", -- <-- Put your desired embed author title 
        ['WebhookIconURL'] = "https://i.ibb.co/0Mnp3Ch/Logo-with-background.jpg", -- <-- Put your desired embed icon url

        ['WebhookWithIdentifiers'] = true -- If you want all identifiers that were found to be appended with
    },

    -- Interaction 
    ['ESXInteraction'] = false, -- If you want to use the ESX.ShowHelpNotification instead of our Interaction. Attention this will increase the client-performance!

    -- Currency Settings
    ['PriceCurrency'] = 'USD', -- Currency Code | Dollar = USD, EURO = EUR
    ['PriceCurrencyIcon'] = '$', -- Currency Icon
    ['PriceCurrencyIconBack'] = false, -- Currency Icon at start or at end? | true -> at end (1.000.000$), false -> at start ($1.000.000)
    ['PricesWithoutDecimal'] = true, -- If you have the price $45.67 for example it will be $45

    -- Calculate Prices Interval
    ['UseDateDiagram'] = false, -- Show the Date or the Hour in the Diagram? | true -> Show the Date, false -> Show the Hour
    ['CheckPrices'] = 45 * 60000, -- Adjust the Interval which the server check the prices! In ms!
    ['CalculatePrices'] = 2 * 3600, -- Adjust the refresh Interval in Seconds! 

    -- Only show nearest gasstation
    ['ShowNearestGasStation'] = true, -- true -> you only see the nearest gasstation | false -> you will see all gasstations

    -- The Raw Top Speed Multiplier
    ['RawTopSpeedMultiplier'] = 2.6, -- !IMPORTANT! This is just for the Vehicle Stats field! It will not change the vehicle!

    -- Vehicle Stats Max Values
    ['VehicleStatsMax'] = {
        ['TopSpeed'] = 500,
        ['PetrolVolume'] = 500,
        ['TrunkSpace'] = 1000,
    },

    -- Use Fees
    ['ServiceFees'] = 2.50, -- Amount
    ['CertificateFees'] = 850, -- Amount

    -- Fuel Price
    ['FuelTypePrices'] = {
        ['SuperPlus'] = {
            min = 1.60,
            max = 2.20
        },
        ['Petrol'] = {
            min = 1.20,
            max = 1.70
        },
        ['Diesel'] = {
            min = 1.40,
            max = 1.80
        },
        ['Kerosene'] = {
            min = 5.00,
            max = 9.90
        }
    },

    -- Fuel Stock Refill
    ['FuelStockRefill'] = {
        ['CheckRefill'] = 45 * 60000, -- Adjust the Interval which the server check the fuelstock! In ms!
        ['RefillInterval'] = 2 * 3600, -- Adjust the refill Interval in Seconds! 
        ['SuperPlus'] = {
            percent = 20.0 -- How much percent should be added?
        },
        ['Petrol'] = {
            percent = 50.0
        },
        ['Diesel'] = {
            percent = 50.0
        },
        ['Kerosene'] = {
            percent = 100.0
        },
    },

    -- All Variables for the Blip
    ['blip'] = {
        ['blip_name'] = "Gasoline",
        ['blip_sprite'] = 361,
        ['blip_scale'] = 0.9,
        ['blip_color'] = 4,
        ['blip_display'] = 4
    },

    -- Adjust the Notify here
    ['notify'] = function(msg)
        TriggerEvent("viority_hud:client:Notify", 1, 17, "Gasoline", msg)
    end,

    -- Fuel Stock Consumption
    ['FuelStockConsumption'] = {
        ['SuperPlus'] = 0.06,
        ['Petrol'] = 0.02,
        ['Diesel'] = 0.02,
        ['Kerosene'] = 0.02
    },

    -- Vehicle Class Information
    ['FuelVehicleInformation'] = {
        
        [0] = { -- Compacts
            MaxFuel = 60.0,
            fInitialDriveForce = 60, -- Super Plus Handling Boost (Percent) | 60% = approx 20kp/h more | WARNING: Use this value with caution. Too high values will disturb the physics of the vehicle!
        },

        [1] = { -- Sedans
            MaxFuel = 80.0,
            fInitialDriveForce = 60,
        },

        [2] = { -- SUVs
            MaxFuel = 120.0,
            fInitialDriveForce = 60,
        },
        
        [3] = { -- Coupes
            MaxFuel = 150.0,
            fInitialDriveForce = 60,
        },

        [4] = { -- Muscle
            MaxFuel = 110.0,
            fInitialDriveForce = 60,
        },

        [5] = { -- Sports Classics
            MaxFuel = 90.0,
            fInitialDriveForce = 60,
        },

        [6] = { -- Sports
            MaxFuel = 105.0,
            fInitialDriveForce = 60,
        },

        [7] = { -- Super
            MaxFuel = 125.0,
            fInitialDriveForce = 60,
        },

        [8] = { -- Motorcycles
            MaxFuel = 60.0,
            fInitialDriveForce = 60,
        },

        [9] = { -- Off-road
            MaxFuel = 80.0,
            fInitialDriveForce = 60,
        },

        [10] = { -- Industrial
            MaxFuel = 200.0,
            fInitialDriveForce = 60,
        },

        [11] = { -- Utility
            MaxFuel = 190.0,
            fInitialDriveForce = 60,
        },

        [12] = { -- Vans
            MaxFuel = 155.0,
            fInitialDriveForce = 60,
        },

        [13] = { -- Cycles
            MaxFuel = 0.0,
            fInitialDriveForce = 60,
        },

        [14] = { -- Boats
            MaxFuel = 220.0,
            fInitialDriveForce = 60,
        },

        [15] = { -- Helicopters
            MaxFuel = 360.0,
            fInitialDriveForce = 60,
        },

        [16] = { -- Planes
            MaxFuel = 440.0,
            fInitialDriveForce = 60,
        },

        [17] = { -- Service
            MaxFuel = 130.0,
            fInitialDriveForce = 60,
        },

        [18] = { -- Emergency
            MaxFuel = 120.0,
            fInitialDriveForce = 60,
        },

        [19] = { -- Military
            MaxFuel = 150.0,
            fInitialDriveForce = 0.2,
        },

        [20] = { -- Commercial
            MaxFuel = 160.0, 
            fInitialDriveForce = 60,
        },

        [21] = { -- Trains
            MaxFuel = 200.0,
            fInitialDriveForce = 60,
        }
    },

    -- Vehicle Class Consumption
    ['FuelVehicleConsumption'] = {
        ['SuperPlus'] = {
            [1.0] = 0.85,
            [0.9] = 0.75,
            [0.8] = 0.65,
            [0.7] = 0.55,
            [0.6] = 0.45,
            [0.5] = 0.45,
            [0.4] = 0.35,
            [0.3] = 0.25,
            [0.2] = 0.15,
            [0.1] = 0.15,
            [0.0] = 0.0,
        },
        ['Petrol'] = {
            [1.0] = 1.3,
            [0.9] = 1.1,
            [0.8] = 1.0,
            [0.7] = 1.0,
            [0.6] = 0.8,
            [0.5] = 0.7,
            [0.4] = 0.6,
            [0.3] = 0.6,
            [0.2] = 0.5,
            [0.1] = 0.3,
            [0.0] = 0.0,
        },
        ['Diesel'] = {
            [1.0] = 0.7,
            [0.9] = 0.6,
            [0.8] = 0.6,
            [0.7] = 0.6,
            [0.6] = 0.5,
            [0.5] = 0.5,
            [0.4] = 0.4,
            [0.3] = 0.3,
            [0.2] = 0.2,
            [0.1] = 0.1,
            [0.0] = 0.0,
        },
        ['Kerosene'] = {
            [1.0] = 0.7,
            [0.9] = 0.6,
            [0.8] = 0.6,
            [0.7] = 0.6,
            [0.6] = 0.5,
            [0.5] = 0.5,
            [0.4] = 0.4,
            [0.3] = 0.3,
            [0.2] = 0.2,
            [0.1] = 0.1,
            [0.0] = 0.0,
        }
    },

    -- Vehicle Pictures
    ['VehiclePictures'] = {
        ['DefaultPicture'] = './assets/img/cars/Logo.png',

        -- ['WEAPON_PETROLCAN'] = './assets/img/cars/FuelCan.png',
    },

    -- Fuel Pump Models
    ['FuelPumpModels'] = {
        [-2007231801] = true,
        [1339433404] = true,
        [1694452750] = true,
        [1933174915] = true,
        [-462817101] = true,
        [-469694731] = true,
        [-164877493] = true    
    },
    
    -- Business Rental Days
    ['BusinessRentalDays'] = {
        {
            days = 3,
            price = 5000
        },
        {
            days = 6,
            price = 10000
        },
        {
            days = 9,
            price = 12500
        }
    },

    -- Vehicle Class Trunk Space 
    ['TrunkSpace'] = { -- !IMPORTANT! This is just for the Vehicle Stats field! It will not change the settings in your inventory!
        [0] = 200, --Compact
        [1] = 250, --Sedan
        [2] = 350, --SUV
        [3] = 250, --Coupes
        [4] = 300, --Muscle
        [5] = 250, --Sports Classics
        [6] = 250, --Sports
        [7] = 150, --Super
        [8] = 0, --Motorcycles
        [9] = 350, --Off-road
        [10] = 1000, --Industrial
        [11] = 500, --Utility
        [12] = 500, --Vans
        [13] = 0, --Cycles
        [14] = 300, --Boats
        [15] = 100, --Helicopters
        [16] = 100, --Planes
        [17] = 300, --Service
        [18] = 300, --Emergency
        [19] = 500, --Military
        [20] = 1000, --Commercial
        [21] = 0 --Trains    
    },

    -- Gas Stations
    ['GasStations'] = {
    
        -- CAR STATIONS

        {
            type = "car", -- [car, boat, plane]
            id = "route_68", -- Unique ID
            name = "ROUTE 68",
            pos = vector3(49.4187, 2778.793, 58.043),
            zone = {
                pos = vector3(49.4187, 2778.793, 58.043),
                size = 15.0
            }
        },

        {
            type = "car", -- [car, boat, plane]
            id = "senora_rd", -- Unique ID
            name = "SENORA RD",
            pos = vector3(263.894, 2606.463, 44.983),
            zone = {
                pos = vector3(263.894, 2606.463, 44.983),
                size = 10.0
            }
        },

        {
            type = "car", -- [car, boat, plane]
            id = "route_68_store", -- Unique ID
            name = "ROUTE 68 STORE",
            pos = vector3(1207.260, 2660.175, 37.899),
            zone = {
                pos = vector3(1207.260, 2660.175, 37.899),
                size = 10.0
            }
        },

        {
            type = "car", -- [car, boat, plane]
            id = "ron_windpark", -- Unique ID
            name = "WINDPARK",
            pos = vector3(2539.685, 2594.192, 37.944),
            zone = {
                pos = vector3(2539.685, 2594.192, 37.944),
                size = 10.0
            }
        },

        {
            type = "car", -- [car, boat, plane]
            id = "senora_freeway", -- Unique ID
            name = "SENORA FREEWAY",
            pos = vector3(2679.858, 3263.946, 55.240),
            zone = {
                pos = vector3(2679.858, 3263.946, 55.240),
                size = 10.0
            }
        },

        {
            type = "car", -- [car, boat, plane]
            id = "sandy_shores", -- Unique ID
            name = "SANDY SHORES",
            pos = vector3(2005.055, 3773.887, 32.403),
            zone = {
                pos = vector3(2005.055, 3773.887, 32.403),
                size = 10.0
            }
        },

        {
            type = "car", -- [car, boat, plane]
            id = "grapeseed", -- Unique ID
            name = "GRAPESEED",
            pos = vector3(1687.156, 4929.392, 42.078),
            zone = {
                pos = vector3(1687.156, 4929.392, 42.078),
                size = 10.0
            }
        },

        {
            type = "car", -- [car, boat, plane]
            id = "pacific_bay_freeway", -- Unique ID
            name = "PACIFIC BAY FREEWAY",
            pos = vector3(1701.314, 6416.028, 32.763),
            zone = {
                pos = vector3(1701.314, 6416.028, 32.763),
                size = 10.0
            }
        },

        {
            type = "car", -- [car, boat, plane]
            id = "pacific_bay", -- Unique ID
            name = "PACIFIC BAY",
            pos = vector3(179.857, 6602.839, 31.868),
            zone = {
                pos = vector3(179.857, 6602.839, 31.868),
                size = 15.0
            }
        },

        {
            type = "car", -- [car, boat, plane]
            id = "pacific_bay_xhero", -- Unique ID
            name = "PACIFIC BAY XHERO",
            pos = vector3(-94.4619, 6419.594, 31.489),
            zone = {
                pos = vector3(-94.4619, 6419.594, 31.489),
                size = 10.0
            }
        },

        {
            type = "car", -- [car, boat, plane]
            id = "zancudo_freeway", -- Unique ID
            name = "ZANCUDO FREEWAY",
            pos = vector3(-2554.996, 2334.40, 33.078),
            zone = {
                pos = vector3(-2554.996, 2334.40, 33.078),
                size = 15.0
            }
        },

        {
            type = "car", -- [car, boat, plane]
            id = "north_rockford", -- Unique ID
            name = "NORTH ROCKFORD",
            pos = vector3(-1800.375, 803.661, 138.651),
            zone = {
                pos = vector3(-1800.375, 803.661, 138.651),
                size = 15.0
            }
        },

        {
            type = "car", -- [car, boat, plane]
            id = "south_rockford", -- Unique ID
            name = "SOUTH ROCKFORD",
            pos = vector3(-1437.622, -276.747, 46.207),
            zone = {
                pos = vector3(-1437.622, -276.747, 46.207),
                size = 15.0
            }
        },

        {
            type = "car", -- [car, boat, plane]
            id = "del_perro_freeway", -- Unique ID
            name = "DEL PERRO FREEWAY",
            pos = vector3(-724.619, -935.1631, 19.213),
            zone = {
                pos = vector3(-724.619, -935.1631, 19.213),
                size = 15.0
            }
        },        

        {
            type = "car", -- [car, boat, plane]
            id = "grove_street", -- Unique ID
            name = "GROVE STREET",
            pos = vector3(-70.2148, -1761.792, 29.534),
            zone = {
                pos = vector3(-70.2148, -1761.792, 29.534),
                size = 15.0
            }
        },     

        {
            type = "car", -- [car, boat, plane]
            id = "capital_boulevard", -- Unique ID
            name = "CAPITAL BOULEVARD",
            pos = vector3(265.648, -1261.309, 29.292),
            zone = {
                pos = vector3(265.648, -1261.309, 29.292),
                size = 15.0
            }
        },   
        
        {
            type = "car", -- [car, boat, plane]
            id = "popular_street", -- Unique ID
            name = "POPULAR STREET",
            pos = vector3(819.653, -1028.846, 26.403),
            zone = {
                pos = vector3(819.653, -1028.846, 26.403),
                size = 15.0
            }
        },    
        
        {
            type = "car", -- [car, boat, plane]
            id = "el_rancho_boulevard", -- Unique ID
            name = "EL RANCHO BOULEVARD",
            pos = vector3(1208.951, -1402.567,35.224),
            zone = {
                pos = vector3(1208.951, -1402.567,35.224),
                size = 15.0
            }
        },    

        {
            type = "car", -- [car, boat, plane]
            id = "west_mirror_drive", -- Unique ID
            name = "WEST MIRROR DRIVE",
            pos = vector3(1181.381, -330.847, 69.316),
            zone = {
                pos = vector3(1181.381, -330.847, 69.316),
                size = 15.0
            }
        },   

        {
            type = "car", -- [car, boat, plane]
            id = "clinton_ave", -- Unique ID
            name = "CLINTON AVE",
            pos = vector3(620.843, 269.100, 103.089),
            zone = {
                pos = vector3(620.843, 269.100, 103.089),
                size = 15.0
            }
        },

        {
            type = "car", -- [car, boat, plane]
            id = "palomino_freeway", -- Unique ID
            name = "PALOMINO FREEWAY",
            pos = vector3(2581.321, 362.039, 108.468),
            zone = {
                pos = vector3(2581.321, 362.039, 108.468),
                size = 15.0
            }
        },

        {
            type = "car", -- [car, boat, plane]
            id = "davis_avenue", -- Unique ID
            name = "DAVIS AVENUE",
            pos = vector3(176.631, -1562.025, 29.263),
            zone = {
                pos = vector3(176.631, -1562.025, 29.263),
                size = 15.0
            }
        },

        {
            type = "car", -- [car, boat, plane]
            id = "alta_street", -- Unique ID
            name = "ALTA STREET",
            pos = vector3(-319.292, -1471.715, 30.549),
            zone = {
                pos = vector3(-319.292, -1471.715, 30.549),
                size = 15.0
            }
        },

        {
            type = "car", -- [car, boat, plane]
            id = "sandy_shores_airfield", -- Unique ID
            name = "SANDY SHORES AIRFIELD",
            pos = vector3(1784.324, 3330.55, 41.253),
            zone = {
                pos = vector3(1784.324, 3330.55, 41.253),
                size = 15.0
            }
        },


        -- Boat Stations

        {
            type = "boat", -- [car, boat, plane]
            id = "la_puerta", -- Unique ID
            name = "LA PUERTA",
            pos = vector3(-800.79, -1503.65, 0.0),
            zone = {
                pos = vector3(-800.79, -1503.65, 0.0),
                size = 15.0
            }
        },

        -- KEROSIN STATIONS (Plane)
        
        {
            type = "plane", -- [car, boat, plane]
            id = "lsia_international", -- Unique ID
            name = "LSIA INTERNATIONAL",
            pos = vector3(-974.89, -3073.96, 13.94),
            zone = {
                pos = vector3(-974.89, -3073.96, 13.94),
                size = 15.0
            }
        },

    }
    
}

ViorityCore['locales'] = {

    -- ENG
    
    -- Headers
    ['Nui_FuelStock_Header'] = "FUEL STOCK",
    ['Nui_PriceChange_Header'] = "PRICE CHANGE",
    ['Nui_Refuelling_Header'] = "REFUELLING",

    -- Fuel Tutorial
    ['Nui_Tutorial_Choose'] = "CHOOSE YOUR FUEL",
    ['Nui_Tutorial_Refuel'] = "REFUEL YOUR VEHICLE",
    ['Nui_Tutorial_Pay'] = "PAY YOUR PAYMENT",

    -- Fuel Statistic
    ['Nui_Statistic_Top_Speed'] = "Top Speed",
    ['Nui_Statistic_Petrol_Volume'] = "Petrol Volume",
    ['Nui_Statistic_Trunk_Space'] = "Trunk Space",

    -- Fuel Information
    ['Nui_Refuel_SuperPlus_Header'] = "Super Plus",
    ['Nui_Refuel_SuperPlus_desc_1'] = '<span style="color: rgba(115, 237, 6, 0.35)">+</span> Improves the motor performance',
    ['Nui_Refuel_SuperPlus_desc_2'] = '<span style="color: rgba(255, 50, 0, 0.35)">-</span> High Consumption',
    ['Nui_Refuel_SuperPlus_desc_3'] = '<span style="color: rgba(255, 50, 0, 0.35)">-</span> Low availability',

    ['Nui_Refuel_Petrol_Header'] = "Petrol",
    ['Nui_Refuel_Petrol_desc_1'] = '<span style="color: rgba(115, 237, 6, 0.35)">+</span> Low Price',
    ['Nui_Refuel_Petrol_desc_2'] = '<span style="color: rgba(255, 50, 0, 0.35)">-</span> High Consumption',

    ['Nui_Refuel_Diesel_Header'] = "Diesel",
    ['Nui_Refuel_Diesel_desc_1'] = '<span style="color: rgba(115, 237, 6, 0.35)">+</span> High Price',
    ['Nui_Refuel_Diesel_desc_2'] = '<span style="color: rgba(255, 50, 0, 0.35)">-</span> Low Consumption',

    -- Fuel Addon
    ['Nui_Gasoline_Kerosene'] = "Kerosene",
    ['Nui_Refuel_Kerosene_desc_1'] = '<span style="color: rgba(255, 50, 0, 0.35)">-</span> High Price',
    ['Nui_Refuel_Kerosene_desc_2'] = '<span style="color: rgba(255, 50, 0, 0.35)">-</span> High Consumption',

    -- Refuel Buttons
    ['Nui_Refuel_Button'] = "REFUEL",
    ['Nui_Refuel_Button_Cancel'] = "STOP",

    -- Financial
    ['Nui_Financial_Header'] = "FINANCIAL",
    ['Nui_Financial_Service_Fees'] = "Service Fees",
    ['Nui_Financial_Fuel_Desc'] = "How much you fueled in your car",
    ['Nui_Financial_Service_Desc'] = "Service fees for each refuelling",
    ['Nui_Financial_Subtotal'] = "Subtotal",
    ['Nui_Financial_Promotion_Code'] = "Enter Promotion-Code",
    ['Nui_Financial_Total'] = "Total",
    ['Nui_Financial_Pay'] = "PAYING",

    -- Price Change
    ['Nui_Price_Change_Value'] = "Value",
    ['Nui_Price_Change_SuperPlus'] = "Super Plus",
    ['Nui_Price_Change_Petrol'] = "Petrol",
    ['Nui_Price_Change_Diesel'] = "Diesel",
    ['Nui_Price_Change_Underline'] = "* Prices may fluctuate and show a different price at other gas stations.",

    -- Fuel Stock
    ['Nui_Fuel_Stock_SuperPlus'] = "Super Plus",
    ['Nui_Fuel_Stock_Petrol'] = "Petrol",
    ['Nui_Fuel_Stock_Diesel'] = "Diesel",

    -- Business Buy
    ['Nui_Business_Tutorial_Choose'] = "CHOOSE YOUR PERIOD",
    ['Nui_Business_Tutorial_Pay'] = "PAY THE RENTAL",
    ['Nui_Business_Tutorial_Manage'] = "MANAGE YOUR BUSINESS",
    ['Nui_Business_Choose_Days'] = "Day/s",
    ['Nui_Business_Choose_Desc'] = "Rent the gasoline station for {y1}%s{y2}. Build your business and achieve prosperity, but keep an eye on your expenses!",
    ['Nui_Business_Choose_Button'] = "CHOOSE",
    ['Nui_Business_Financial_Header'] = "FINANCIAL",
    ['Nui_Business_Financial_Rental'] = "Rental costs for the specified period",
    ['Nui_Business_Financial_Certificate_Header'] = "Certificate Fees",
    ['Nui_Business_Financial_Certificate_Desc'] = "Certificate fees for the law entry",
    ['Nui_Business_Financial_Total'] = "Total",
    ['Nui_Business_Financial_Pay'] = "PAYING",
    ['Nui_Business_Financial_Unavailable'] = "NOT AVAILABLE",

    -- Business Bill
    ['Nui_Business_Bill_Gasoline'] = "Day/s Gasoline",

    -- Business Financial Overview
    ['Nui_Business_Financial_Overview_Header'] = "FINANCIAL OVERVIEW",

    -- Business Information
    ['Nui_Business_Information_Header'] = "INFORMATION",
    ['Nui_Business_Information_All_Customer'] = "All Customer",
    ['Nui_Business_Information_Total_Income'] = "Total Income",
    ['Nui_Business_Information_Remaining_Time'] = "Remaining Time",
    ['Nui_Business_Information_Total_Outcome'] = "Total Outcome",
    ['Nui_Business_Information_Close_Business'] = "CLOSE BUSINESS",

    -- Business Income
    ['Nui_Business_Income_Header'] = "LAST INCOME",
    ['Nui_Business_Income_Unknown_User'] = "Unknown",
    ['Nui_Business_Income_Message'] = "Refuelled {y1}%s{y2} of {y1}%s{y2} and payed {y1}$%s{y2}",
    
    -- Business Outcome
    ['Nui_Business_Outcome_Header'] = "LAST OUTCOME",
    ['Nui_Business_Outcome_Company'] = "Fuel Ltd.",
    ['Nui_Business_Outcome_Message'] = "Refuelled the Fuel Stock and cost {y1}$%s{y2}.",

    -- Business Promotion Code
    ['Nui_Business_Promotion_Code_Header'] = "PROMOTION CODES",
    ['Nui_Business_Promotion_Code_Create'] = "CREATE",
    ['Nui_Business_Promotion_Code_Input_Placeholder'] = "Enter Promotion Code",
    ['Nui_Business_Promotion_Code_Discount'] = "Discount:",
    ['Nui_Business_Promotion_Code_Discount_Input_Placeholder'] = "Enter Discount",

    -- Notify
    ['Refuel_Complete'] = "Thank you for your visit! <br>You refuelled %s of %s",
    ['Refuel_Not_Enough'] = "You can't afford to refuel!",
    ['Refuel_With_Can'] = "You refilled %s of %s via a can!",
    ['Business_Not_Enough'] = "You can't afford to buy this business!",

    -- Interaction
    ['Nui_Interaction_Press'] = "PRESS",
    ['Nui_Interaction_Open'] = "TO INTERACT",
    ['Nui_Interaction_CanFill'] = "TO REFILL VIA CAN",

    -- Webhook    
    ['Webhook_Types'] = {
        ['refuelling'] = '⛽ Refuelling',
        ['business_management'] = '💼 Business Management',
        ['business_promotioncode'] = '🎀 Business Promotion Code',
        ['business_liquidity'] = '🪙 Business Liquidity',
    },



    -- DE

    -- -- Headers
    -- ['Nui_FuelStock_Header'] = "KRAFTSTOFFLAGER",
    -- ['Nui_PriceChange_Header'] = "PREISVERÄNDERUNG",
    -- ['Nui_Refuelling_Header'] = "TANKEN",

    -- -- Fuel Tutorial
    -- ['Nui_Tutorial_Choose'] = "WÄHLE DEIN KRAFTSTOFF",
    -- ['Nui_Tutorial_Refuel'] = "TANKE DEIN FAHRZEUG",
    -- ['Nui_Tutorial_Pay'] = "BEZAHLE DEINE RECHNUNG",

    -- -- Fuel Statistic
    -- ['Nui_Statistic_Top_Speed'] = "Höchstgeschwindigkeit",
    -- ['Nui_Statistic_Petrol_Volume'] = "Treibstoffvolumen",
    -- ['Nui_Statistic_Trunk_Space'] = "Kofferraumplatz",

    -- -- Fuel Information
    -- ['Nui_Refuel_SuperPlus_Header'] = "Super Plus",
    -- ['Nui_Refuel_SuperPlus_desc_1'] = '<span style="color: rgba(115, 237, 6, 0.35)">+</span> Verbessert die Motor Leistung',
    -- ['Nui_Refuel_SuperPlus_desc_2'] = '<span style="color: rgba(255, 50, 0, 0.35)">-</span> Hoher Verbrauch',
    -- ['Nui_Refuel_SuperPlus_desc_3'] = '<span style="color: rgba(255, 50, 0, 0.35)">-</span> Geringe Verfügbarkeit',

    -- ['Nui_Refuel_Petrol_Header'] = "Benzin",
    -- ['Nui_Refuel_Petrol_desc_1'] = '<span style="color: rgba(115, 237, 6, 0.35)">+</span> Niedriger Preis',
    -- ['Nui_Refuel_Petrol_desc_2'] = '<span style="color: rgba(255, 50, 0, 0.35)">-</span> Hoher Verbrauch',

    -- ['Nui_Refuel_Diesel_Header'] = "Diesel",
    -- ['Nui_Refuel_Diesel_desc_1'] = '<span style="color: rgba(115, 237, 6, 0.35)">+</span> Hoher Preis',
    -- ['Nui_Refuel_Diesel_desc_2'] = '<span style="color: rgba(255, 50, 0, 0.35)">-</span> Niedriger Verbrauch',

    -- -- Fuel Addon
    -- ['Nui_Gasoline_Kerosene'] = "Kerosin",

    -- -- Refuel Buttons
    -- ['Nui_Refuel_Button'] = "TANKEN",
    -- ['Nui_Refuel_Button_Cancel'] = "STOP",

    -- -- Financial
    -- ['Nui_Financial_Header'] = "RECHNUNG",
    -- ['Nui_Financial_Service_Fees'] = "Service Gebühr",
    -- ['Nui_Financial_Fuel_Desc'] = "Wie viel du in dein Fahrzeug getankt hast",
    -- ['Nui_Financial_Service_Desc'] = "Servicegebühren für jede Betankung",
    -- ['Nui_Financial_Subtotal'] = "Zwischensumme",
    -- ['Nui_Financial_Promotion_Code'] = "Promotion-Code Eingeben",
    -- ['Nui_Financial_Total'] = "Summe",
    -- ['Nui_Financial_Pay'] = "BEZAHLEN",

    -- -- Price Change
    -- ['Nui_Price_Change_Value'] = "Wert",
    -- ['Nui_Price_Change_SuperPlus'] = "Super Plus",
    -- ['Nui_Price_Change_Petrol'] = "Benzin",
    -- ['Nui_Price_Change_Diesel'] = "Diesel",
    -- ['Nui_Price_Change_Underline'] = "* Die Preise können schwanken und an anderen Tankstellen einen anderen Preis anzeigen.",

    -- -- Fuel Stock
    -- ['Nui_Fuel_Stock_SuperPlus'] = "Super Plus",
    -- ['Nui_Fuel_Stock_Petrol'] = "Benzin",
    -- ['Nui_Fuel_Stock_Diesel'] = "Diesel",

    -- -- Business Buy
    -- ['Nui_Business_Tutorial_Choose'] = "WÄHLE DEINE DAUER",
    -- ['Nui_Business_Tutorial_Pay'] = "ZAHLE DEINE MIETE",
    -- ['Nui_Business_Tutorial_Manage'] = "VERWALTE DEIN BUSINESS",
    -- ['Nui_Business_Choose_Days'] = "Tag/e",
    -- ['Nui_Business_Choose_Desc'] = "Miete die Tankstelle für {y1}%s{y2}. Baue dein Unternehmen auf und komme zum Wohlstand, aber behalte deine Ausgaben im Auge!",
    -- ['Nui_Business_Choose_Button'] = "WÄHLEN",
    -- ['Nui_Business_Financial_Header'] = "RECHNUNG",
    -- ['Nui_Business_Financial_Rental'] = "Mietkosten für den angegebenen Zeitraum",
    -- ['Nui_Business_Financial_Certificate_Header'] = "Zertifikat Gebühren",
    -- ['Nui_Business_Financial_Certificate_Desc'] = "Zertifikatgebühren für die Eintragung",
    -- ['Nui_Business_Financial_Total'] = "Summe",
    -- ['Nui_Business_Financial_Pay'] = "BEZAHLEN",
    -- ['Nui_Business_Financial_Unavailable'] = "AUSVERKAUFT",

    -- -- Business Bill
    -- ['Nui_Business_Bill_Gasoline'] = "Tag/e Business",

    -- -- Business Financial Overview
    -- ['Nui_Business_Financial_Overview_Header'] = "FINANZIELLE ÜBERSICHT",

    -- -- Business Information
    -- ['Nui_Business_Information_Header'] = "INFORMATION",
    -- ['Nui_Business_Information_All_Customer'] = "Alle Kunden",
    -- ['Nui_Business_Information_Total_Income'] = "Gesamtumsatz",
    -- ['Nui_Business_Information_Remaining_Time'] = "Verbleibende Zeit",
    -- ['Nui_Business_Information_Total_Outcome'] = "Gesamtausgaben",
    -- ['Nui_Business_Information_Close_Business'] = "BUSINESS SCHLIEßEN",

    -- -- Business Income
    -- ['Nui_Business_Income_Header'] = "LETZTES EINKOMMEN",
    -- ['Nui_Business_Income_Unknown_User'] = "Unbekannt",
    -- ['Nui_Business_Income_Message'] = "Tankte {y1}%s{y2} von {y1}%s{y2} und hat {y1}$%s{y2} bezahlt",
    
    -- -- Business Outcome
    -- ['Nui_Business_Outcome_Header'] = "LETZTE AUSGABEN",
    -- ['Nui_Business_Outcome_Company'] = "Fuel GmbH",
    -- ['Nui_Business_Outcome_Message'] = "Der Vorrat wurde aufgefüllt und kostete {y1}$%s{y2}",

    -- -- Business Promotion Code
    -- ['Nui_Business_Promotion_Code_Header'] = "PROMOTION CODES",
    -- ['Nui_Business_Promotion_Code_Create'] = "ERSTELLEN",
    -- ['Nui_Business_Promotion_Code_Input_Placeholder'] = "Code eingeben",
    -- ['Nui_Business_Promotion_Code_Discount'] = "Rabatt:",
    -- ['Nui_Business_Promotion_Code_Discount_Input_Placeholder'] = "Rabatt eingeben",

    -- -- Notify
    -- ['Refuel_Complete'] = "Vielen Dank für Ihren Besuch! <br>Du hast %s von %s getankt",
    -- ['Refuel_Not_Enough'] = "Du kannst es dir nicht leisten, zu tanken!",
    -- ['Refuel_With_Can'] = "Du hast %s von %s via Kanister getankt!",
    -- ['Business_Not_Enough'] = "Du kannst es dir nicht leisten, dieses Unternehmen zu kaufen!",

    -- -- Interaction
    -- ['Nui_Interaction_Press'] = "DRÜCKE",
    -- ['Nui_Interaction_Open'] = "UM ZU INTERAGIEREN",
    -- ['Nui_Interaction_CanFill'] = "ZUM NACHFÜLLEN VIA KANISTER",

    -- -- Webhook    
    -- ['Webhook_Types'] = {
    --     ['refuelling'] = '⛽ Refuelling',
    --     ['business_management'] = '💼 Business Management',
    --     ['business_promotioncode'] = '🎀 Business Promotion Code',
    --     ['business_liquidity'] = '🪙 Business Liquidity',
    -- },


}