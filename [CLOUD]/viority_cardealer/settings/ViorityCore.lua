ViorityCore = {}
ViorityCore['config'] = {
    
    -- All Variables for the Viority-API
    ['auth'] = {
        ['Viority_License'] = "Viority_FiveM_GZZmCZ8miDg0ukTT0HlE8qzswp59rG", -- <-- Put your License here
        ['Viority_Version'] = "1.0.3", -- DO NOT CHANGE IF YOU DO NOT KNOW WHAT YOU ARE DOING!
        ['Viority_Product'] = "viority_cardealer" -- DO NOT CHANGE IF YOU DO NOT KNOW WHAT YOU ARE DOING! (ONLY FOR THE VERSION CHECK)
    },

    -- SQL Tables
    ['SQL_Tables'] = {
        ['users'] = {
            ['table'] = "users",
            ['identifier'] = "identifier",
            ['firstname'] = "firstname",
            ['lastname'] = "lastname",
            ['dob'] = "dateofbirth",
            ['height'] = 'height',
            ['sex'] = {
                ['column'] = 'sex',
                ['male'] = 'male',
                ['female'] = 'female'
            },
        },
        ['bills'] = {
            ['table'] = "billing",
            ['identifier'] = "identifier"
        },
        ['owned_vehicles_table'] = "owned_vehicles",
        ['owned_vehicles_stored'] = true, -- Insert with stored column? true or false?
    },

    -- ESX  
    ['ESX_Version'] = "legacy", -- 1.1, 1.2 or legacy
    ['esxgetSharedObject'] = "esx:getSharedObject",
    ['esxplayerLoaded'] = "esx:playerLoaded",
    ['esxprefix'] = "viority_cardealer:",

    -- Activate Debug Modus
    ['debug_mode'] = false, -- Activate the Debug modus to identify a bug in the code.

    -- Use Steam Identifier
    ['steamidentifier'] = false, -- If your Server use the Steam as identifier instead of the Rockstar License

    -- Use Boolean Values 
    ['useBooleanMode'] = true, -- If you have problems with the UPDATE or SELECT Queries turn it false

    -- Nui Color 
    ['MainColorCode'] = '#0b9af5', -- Enter a valid Hexcode! 
    ['SecondColorCode'] = '#000000', -- Enter a valid Hexcode! 

    ['ChartMainColorCode'] = 'rgba(11,154,245, 0.05)', -- Enter a valid RGB or RGBA Code! 
    ['ChartSecondColorCode'] = 'rgb(11,154,245)', -- Enter a valid RGB or RGBA Code! 

    -- Discord Webhook
    ['DiscordWebhook'] = {
        ['WebhookTestDrive'] = "https://discord.com/api/webhooks/XXX", -- <-- Put your desired webhook link here
        ['WebhookPurchase'] = "https://discord.com/api/webhooks/XXX", -- <-- Put your desired webhook link here

        ['WebhookColor'] = "3054334", -- <-- Put your desired embed color (decimal)
        ['WebhookAuthorTitle'] = "Viority Development", -- <-- Put your desired embed author title 
        ['WebhookIconURL'] = "https://i.ibb.co/0Mnp3Ch/Logo-with-background.jpg", -- <-- Put your desired embed icon url

        ['WebhookWithIdentifiers'] = true -- If you want all identifiers that were found to be appended with
    },

    -- Menu V2 Integration 
    ['UseMenuV2Integration'] = false, -- Make it true if you have the Viority Menu V2!

    -- Interaction 
    ['ESXInteraction'] = true, -- If you want to use the ESX.ShowHelpNotification instead of our Interaction. Attention this will increase the client-performance!

    -- Calculate Prices Interval
    ['UseDateDiagram'] = true, -- Show the Date or the Hour in the Diagram? | true -> Show the Date, false -> Show the Hour
    ['CheckPrices'] = 45 * 60000, -- Adjust the Interval which the server check the prices! In ms!
    ['CalculatePrices'] = 24 * 3600, -- Adjust the refresh Interval in Seconds! 

    -- Installment and Leasing Interval
    ['CheckInstallments'] = 60 * 60000, -- Adjust the Interval which the server check the Installments! In ms!
    ['CheckLeasing'] = 60 * 60000, -- Adjust the Interval which the server check the Leasing! In ms!

    -- Currency Settings
    ['PriceCurrency'] = 'USD', -- Currency Code | Dollar = USD, EURO = EUR
    ['PriceCurrencyIcon'] = '$', -- Currency Icon
    ['PriceCurrencyIconBack'] = false, -- Currency Icon at start or at end? | true -> at end (1.000.000$), false -> at start ($1.000.000)

    -- Custom Plate Settings 
    ['UseCustomPlate'] = true, -- NEW!!! Use the Custom Plate Feature in the NUI
    ['minPlateChar'] = 3, -- Adjust the minimum character of the Plate (max is 6)
    ['PlateBlacklist'] = {"Nigger", "Hitler"}, -- Add Plates that are not allowed to use (Not Case-Insensitive)

    -- Test Drive 
    ['TestdrivePrice'] = 650, -- Adjust the Testdrive Price

    -- Bill Settings
    ['PaintingFees'] = { -- Use Fees for the Custom Painting
        ['Usage'] = true, -- Use it yes or no?
        ['Amount'] = 2500 -- Amount
    },

    ['PlateFees'] = { -- Use Fees for the Custom Plate
        ['Usage'] = true, -- Use it yes or no?
        ['Amount'] = 1500 -- Amount
    },

    ['InstallmentFees'] = { -- Use Fees for the Installment
        ['Usage'] = true, -- Use it yes or no?
        ['Amount'] = 1500 -- Amount
    },

    ['LeasingFees'] = { -- Use Fees for the Leasing
        ['Usage'] = true, -- Use it yes or no?
        ['Amount'] = 250 -- Amount !!Attention This is the Amount for each Day!
    },

    ['GeneralFees'] = { -- Use general Fees (Service-Fees)
        ['Usage'] = true, -- Use it yes or no?
        ['Amount'] = 5000 -- Amount
    },

    ['InstallmentOptions'] = { 
        [1] = {
            name = "2 Days",
            days = 2
        },

        [2] = {
            name = "3 Days",
            days = 3
        },

        [3] = {
            name = "7 Days",
            days = 7
        }
    },

    ['LeasingOptions'] = { 
        [1] = {
            name = "7 Days",
            days = 7
        },

        [2] = {
            name = "14 Days",
            days = 14
        },

        [3] = {
            name = "28 Days",
            days = 28
        }
    },

    -- Adjust the Notify here
    ['notify'] = function(msg)
        TriggerEvent("sanity:notify", "Autohaus", msg, 5000, "info")
    end,

    -- The Raw Top Speed Multiplier
    ['RawTopSpeedMultiplier'] = 2.6, -- !IMPORTANT! This is just for the Vehicle Stats field! It will not change the vehicle!

    -- Default Vehicle Color
    ['DefaultVehicleColor'] = { -- Use the RGB Format below
        ["r"] = 255,
        ["g"] = 221,
        ["b"] = 0
    },

    -- Vehicle Stats Max Values
    ['VehicleStatsMax'] = {
        ['TopSpeed'] = 500,
        ['PetrolVolume'] = 120,
        ['TrunkSpace'] = 1000,
        ['PassengerSeats'] = 10
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

    -- Vehicle Petrol Volume 
    ['PetrolVolume'] = { -- !IMPORTANT! This is just for the Vehicle Stats field! It will not change the settings in your Fuel System!
        [0] = 100, --Compact
        [1] = 100, --Sedan
        [2] = 100, --SUV
        [3] = 100, --Coupes
        [4] = 100, --Muscle
        [5] = 100, --Sports Classics
        [6] = 100, --Sports
        [7] = 100, --Super
        [8] = 100, --Motorcycles
        [9] = 100, --Off-road
        [10] = 100, --Industrial
        [11] = 100, --Utility
        [12] = 100, --Vans
        [13] = 100, --Cycles
        [14] = 100, --Boats
        [15] = 100, --Helicopters
        [16] = 100, --Planes
        [17] = 100, --Service
        [18] = 100, --Emergency
        [19] = 100, --Military
        [20] = 100, --Commercial
        [21] = 100 --Trains    
    },

    -- Cardealer
    ['cardealer'] = {
        -- Ped Models: https://docs.fivem.net/docs/game-references/ped-models/
        -- Coordinates: X - Y - Z
        -- Heading: Specific Direction (0° - 360°)

        {
            id = "classic_cars", -- unique id
            type = "car", -- [car, boat, aircraft] !!Attention this is the value which will inserted into owned_vehicles
            name = "Klassischer Händler",
            pos = vector3(-32.7024, -1103.5098, 25.4224), -- Blip Location
            cam = {
                pos = vector3(-49.89, -1096.05, 27.0),
                rotate = -105.0
            },
            ped = {
                model = "s_m_y_devinsec_01",
                pos = vector3(-32.7024, -1103.5098, 25.4224),
                heading = 70.7069,
                radius = 2.0 -- NEW!!! Adjust the Interaction radius
            },
            vehicle = {
                spawn = vector3(-44.62, -1097.35, 25.42),
                heading = 122.74
            },
            testdrive = {
                spawn = vector3(-30.65, -1090.2, 25.0),
                heading = 339.13
            },
            checkout = {
                AnimCam1 = {
                    pos = vector3(-28.42, -1103.49, 27.6),
                    rotate = 150.0
                },
                AnimCam2 = {
                    pos = vector3(-30.59, -1103.2, 27.6),
                    rotate = 170.0
                },
                AnimPlayer = {
                    pos = vector3(-31.46917, -1104.683, 25.5),
                    heading = 201.96
                },
                vehiclespawn = {
                    spawn = vector3(-30.65, -1090.2, 25.42),
                    heading = 339.13
                }
            },
            MLO = { -- NEW!!! Prevent MLO Issues (If you have problems with your MLO play with this values)
                distance = 50.0, -- Distance distance starting the teleport instead of the long camera transition
                wait = 50 -- Wait some Ticks to load the MLO
            },
            blip = {
                name = "Klassischer Händler",
                sprite = 745,
                color = 60,
                scale = 0.7
            }
        },

        {
            id = "transporter_cars", -- unique id
            type = "car", -- [car, boat, aircraft] !!Attention this is the value which will inserted into owned_vehicles
            name = "Transporter Händler",
            pos = vector3(809.61, -924.36, 25.21), -- Blip Location
            cam = {
                pos = vector3(876.5, -911.0, 28.0),
                rotate = 90.0
            },
            ped = {
                model = "s_m_y_clubbar_01",
                pos = vector3(809.61, -924.36, 25.21),
                heading = 2.24,
                radius = 2.0
            },
            vehicle = {
                spawn = vector3(864.89, -910.08, 24.75),
                heading = 222.25
            },
            testdrive = {
                spawn = vector3(888.05, -909.36, 25.46),
                heading = 270.21
            },
            checkout = {
                AnimCam1 = {
                    pos = vector3(811.07, -921.18, 26.9),
                    rotate = 150.0
                },
                AnimCam2 = {
                    pos = vector3(808.89, -921.33, 26.9),
                    rotate = 180.0
                },
                AnimPlayer = {
                    pos = vector3(808.82, -923.47, 25.16),
                    heading = 220.75
                },
                vehiclespawn = {
                    spawn = vector3(888.05, -909.36, 25.46),
                    heading = 270.21
                }
            },
            MLO = {
                distance = 150.0, 
                wait = 50 
            },
            blip = {
                name = "Transporter Händler",
                sprite = 734,
                color = 60,
                scale = 0.7
            }
        },

        {
            id = "boat_shop", -- unique id
            type = "boat", -- [car, boat, aircraft] !!Attention this is the value which will inserted into owned_vehicles
            name = "Boot Händler",
            pos = vector3(-715.94, -1298.21, 4.1), -- Blip Location
            cam = {
                pos = vector3(-742.63, -1375.73, 3.5),
                rotate = 325.50            
            },
            ped = {
                model = "s_m_y_devinsec_01",
                pos = vector3(-715.94, -1298.21, 4.1),
                heading = 5.6,
                radius = 2.0
            },
            vehicle = {
                spawn = vector3(-730.16, -1358.34, -0.5),
                heading = 143.0
            },
            testdrive = {
                spawn = vector3(-794.54, -1432.78, 0.0),
                heading = 145.49
            },
            checkout = {
                AnimCam1 = {
                    pos = vector3(-716.94, -1295.8, 5.8),
                    rotate = 200.0
                },
                AnimCam2 = {
                    pos = vector3(-717.94, -1296.8, 5.8),
                    rotate = 240.0
                },
                AnimPlayer = {
                    pos = vector3(-716.58, -1297.89, 4.1),
                    heading = 263.07
                },
                vehiclespawn = {
                    spawn = vector3(-794.54, -1432.78, 0.0),
                    heading = 145.49
                }
            },
            MLO = {
                distance = 150.0, 
                wait = 50 
            },
            blip = {
                name = "Boot Händler",
                sprite = 427,
                color = 60,
                scale = 0.7
            }
        },

        {
            id = "aircraft_shop", -- unique id
            type = "aircraft", -- [car, boat, aircraft] !!Attention this is the value which will inserted into owned_vehicles
            name = "Luftfahrt Händler",
            pos = vector3(-940.65, -2960.58, 12.95), -- Blip Location
            cam = {
                pos = vector3(-997.37, -2985.74, 16.53),
                rotate = 242.00
            },
            ped = {
                model = "s_m_y_devinsec_01",
                pos = vector3(-938.72, -2957.04, 12.95),
                heading = 84.91,
                radius = 2.0
            },
            vehicle = {
                spawn = vector3(-982.5, -2993.86, 12.95),
                heading = 61.22
            },
            testdrive = {
                spawn = vector3(-965.83, -3162.88, 13.59),
                heading = 60.15
            },
            checkout = {
                AnimCam1 = {
                    pos = vector3(-945.06, -2958.13, 15.19),
                    rotate = 240.0
                },
                AnimCam2 = {
                    pos = vector3(-944.99, -2960.86, 15.19),
                    rotate = 260.0
                },
                AnimPlayer = {
                    pos = vector3(-942.0, -2961.08, 12.95),
                    heading = 291.09
                },
                vehiclespawn = {
                    spawn = vector3(-1005.03, -2988.58, 13.59),
                    heading = 59.64
                }
            },
            MLO = {
                distance = 150.0, 
                wait = 50 
            },
            blip = {
                name = "Luftfahrt Händler",
                sprite = 307,
                color = 60,
                scale = 0.7
            }
        }

    },

}


ViorityCore['locales'] = {
  -- ENG

  -- DE
  ['Nui_Header'] = "AUTOHAUS",

  -- -- Sub Headers
  ['Nui_Vehicle_Header'] = "Fahrzeug",
  ['Nui_Color_Header'] = "Farbe",
  ['Nui_Plate_Header'] = "Nummer",
  ['Nui_Technical_Header'] = "Technisch",
  ['Nui_PriceChange_Header'] = "Preiskurve",
  ['Nui_Testdrive_Header'] = "Testfahrt",
  ['Nui_Purchase_Header'] = "Kaufen",

  -- -- Nui Technical
  ['Nui_Technical_Speed'] = "Höchstgeschwindigkeit",
  ['Nui_Technical_Petrol'] = "Tank Volumen",
  ['Nui_Technical_Trunk'] = "Kofferraum Volumen",
  ['Nui_Technical_Passenger'] = "Sitzanzahl",

  -- -- Price Change
  ['Nui_PriceChange_Value'] = "Wert",

  -- -- Nui Testdrive
  ['Nui_Testdrive_Button'] = "TESTFAHRT STARTEN",

  -- -- Nui Purchase
  ['Nui_Purchase_Info'] = "Das Fahrzeug ist von der örtlichen Behörde zugelassen. Es ist ein fabrikneues Auto und hat keine Mängel.",
  ['Nui_Purchase_Button'] = "ZUM CHECKOUT",

  -- -- Nui Contract
  ['Nui_Contract_Header'] = "Fahrzeug Vertrag",
  ['Nui_Contract_Payment_Header'] = "Zahlungsmodell",

  -- -- Player Passport
  ['Nui_Passport_Name'] = "Dein Vor/Nachname",
  ['Nui_Passport_Dob'] = "Ihr Geburtsdatum",
  ['Nui_Passport_Height'] = "Deine Größe",
  ['Nui_Passport_Sex'] = "Dein Geschlecht",
  ['Nui_Passport_ID'] = "Deine aktuelle ID",
  ['Nui_Passport_Money'] = "Dein Bargeld",
  ['Nui_Passport_Bank'] = "Dein Bankguthaben",
  ['Nui_Passport_Bills'] = "Deine Rechnungen",
  ['Nui_Passport_Signature'] = "Unterschrift",
  ['Nui_Passport_Sex_Male'] = "Männlich",
  ['Nui_Passport_Sex_Female'] = "Weiblich",

  -- -- Vehicle Passport
  ['Nui_Passport_Model'] = "Fahrzeug Modell",
  ['Nui_Passport_Speed'] = "Höchstgeschwindigkeit",
  ['Nui_Passport_Petrol'] = "Tank Volumen",
  ['Nui_Passport_Trunk'] = "Kofferraum",
  ['Nui_Passport_Price'] = "Aktueller Preis",
  ['Nui_Passport_Passenger'] = "Sitzanzahl",
  ['Nui_Passport_PassengerMinimal'] = "Sitze",
  ['Nui_Passport_Status'] = "Neuwagen",
  ['Nui_Passport_Status_Underline'] = "Aktueller Status",
  ['Nui_Passport_Approvement'] = "Verfügbar",
  ['Nui_Passport_Approvement_Underline'] = "Zulassung",

  -- -- Money/Bank Wallet
  ['Nui_Bank_Wallet'] = "BANKGUTHABEN",
  ['Nui_Money_Wallet'] = "BARGELD",

  -- -- Direct Buy
  ['Nui_DirectBuy_Header'] = "Direkt Kauf",
  ['Nui_DirectBuy_Desc'] = "Du zahlst den vollen Betrag direkt und hast keine täglichen Kosten.",

  -- -- Installment
  ['Nui_Installment_Header'] = "Ratenzahlung",
  ['Nui_Installment_Desc'] = "Du zahlst deine Rechnung in Raten ab.",
  
  -- -- Leasing
  ['Nui_Leasing_Header'] = "VIP Leasing",
  ['Nui_Leasing_Desc'] = "Nur für spezielle Personen.",

  -- -- Dropdown Menu
  ['Nui_Dropdown_Placeholder'] = "Wählen",

  -- -- Bill Table
  ['Nui_Bill_Package'] = "PAKET",
  ['Nui_Bill_Quantity'] = "ANZAHL",
  ['Nui_Bill_Price'] = "PREIS",
  ['Nui_Bill_Total'] = "GESAMT",

  ['Nui_Bill_Times'] = "Raten", -- 2 Times (Installment)
  ['Nui_Bill_For'] = "Für %s Tage", -- For 28 Days (Leasing)

  -- -- Payment Footer
  ['Nui_Footer_Date'] = "Datum",
  ['Nui_Footer_Signature'] = "Unterschrift",

  -- -- Endorse Button
  ['Nui_Endorse_Button'] = "UNTERSCHREIBEN",

  -- -- Interaction
  ['Nui_Interaction_Press'] = "",
  ['Nui_Interaction_Open'] = "UM auf das Autohaus zuzugreifen",

  -- -- Keybind
  ['open_cardealer_keybind'] = 'Open Cardealer', -- NEW!!!


  -- -- Cardealer Notifys

  -- -- Client
  ['Cardealer_NoVehicles'] = "Leider haben wir zur Zeit keine Fahrzeuge in unserem Sortiment!",
  ['Cardealer_Testdrive'] = "Willkommen in deiner Virtuellen Welt! <br> Hier kannst du dein Fahrzeug testen. <br> Verlasse das Fahrzeug um die Simulation zu stoppen!",
  ['Cardealer_NotEnoughMoney'] = "Ich fürchte, du kannst es dir nicht leisten!",
  ['Cardealer_EmptyPlate'] = "Das Nummernschild darf nicht leer sein!",
  ['Cardealer_PlateMinChars'] = "Das Nummernschild muss mindestens %s Zeichen enthalten!",
  ['Cardealer_PlateBlacklisted'] = "Das Nummerschild %s ist nicht erlaubt!",
  ['Cardealer_PlateExist'] = "Das Nummernschild ist bereits in Gebrauch! Bitte wähle ein anderes...",
  ['Cardealer_Purchase'] = "Vielen dank für den Einkauf! <br> Viel Spaß mit deiner neuen Schönheit.",

  -- -- Server
  ['Cardealer_PayInstallment'] = "Du hast eine Ratenzahlung von %s bezahlt!",
  ['Cardealer_NotPayInstallment'] = "Du konntest deine Ratenzahlung von %s nicht bezahlen! Gegen dich wurde eine Strafe erhoben...",
  ['Cardealer_CompleteInstallment'] = "Deine Ratenzahlung für das %s-Kennzeichen wurde nun erfolgreich abgeschlossen!",
  ['Cardealer_EndOfLeasing'] = "Das Leasing für das Nummernschild %s ist abgelaufen! Das Fahrzeug wurde zurückgegeben!",

  -- -- Webhook
  ['Webhook_Testdrive'] = "**ID:** `%s`\n**Name:** `%s`\n**Typ:** `%s`\n**Modell:** `%s` (_%s_)\n**Kennzeichen:** `%s`\n**Zeit:**",
  ['Webhook_Purchase'] = "**ID:** `%s`\n**Name:** `%s`\n**Type:** `%s`\n**Modell:** `%s` (_%s_)\n**Kennzeichen:** `%s`\n**Zahlung:** `%s`\n**Wallet:** `%s`\n**Preis:** `%s`\n**Zeit:**",

  ['Webhook_Types'] = {
       ['testdrive'] = '🚗 Testfahrt',
       ['purchase'] = '🛒 Einkauf',
   },

  -- -- Viority Menu V2 Integration (You can use the {b1} {b2} Highlight Formating and all HTML p tag Syntax)
   ['MenuV2_Header'] = "AUTOHAUS",

  -- -- Week Day Names
   ['WeekDayNames'] = {
       [0] = "Sonntag",
       [1] = "Montag",
       [2] = "Dienstag",
       [3] = "Mittwoch",
       [4] = "Donnerstag",
       [5] = "Freitag",
      [6] = "Samstag"
  }

}