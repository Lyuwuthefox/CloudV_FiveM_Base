ViorityCore = {}
ViorityCore['config'] = {
    
    -- All Variables for the Viority-API
    ['auth'] = {
        ['Viority_License'] = "Viority_FiveM_OaN4PafsWEaXC3P8zasFj94gySV4AQ", -- <-- Put your License here
        ['Viority_CFG'] = "C:/Users/Administrator/Desktop/CloudV/server.cfg", -- <-- Put your direct CFG Path here !!! IMPORTANT USE "/"" INSTEAD OF "\""
        ['Viority_Version'] = "1.0.5", -- DO NOT CHANGE IF YOU DO NOT KNOW WHAT YOU ARE DOING!
        ['Viority_Product'] = "Menu" -- DO NOT CHANGE IF YOU DO NOT KNOW WHAT YOU ARE DOING! (ONLY FOR THE VERSION CHECK)
    },

    -- SQL Tables
    ['SQL_Tables'] = {
        ['users'] = {
            ['table'] = "users",
            ['identifier'] = "identifier",
            ['firstname'] = "firstname",
            ['lastname'] = "lastname",
            ['dob'] = "dateofbirth"
        },
        ['bills'] = {
            ['table'] = "billing",
            ['identifier'] = "identifier",
            ['amount_column'] = "amount",
            ['label_column'] = "label"
        },
        ['owned_vehicles'] = {
            ['table'] = "owned_vehicles",
            ['identifier'] = "owner"
        },
    },

    -- Delays
    ['Script_Delays'] = {

        ['firstloading'] = 2500,
        ['esxplayerLoaded'] = 1500,

    },

    -- ESX  
    ['ESX_Version'] = "legacy", -- 1.1, 1.2 or legacy
    ['esxgetSharedObject'] = "esx:getSharedObject",
    ['esxplayerLoaded'] = "esx:playerLoaded",
    ['esxsetJob'] = "esx:setJob",
    ['esxprefix'] = "viority_menu:",

    -- Activate Debug Modus
    ['debug_mode'] = false, -- Activate the Debug modus to identify a bug in the code.

    -- Use Steam Identifier
    ['steamidentifier'] = false, -- If your Server use the Steam as identifier instead of the Rockstar License

    -- Use currency decimal values
    ['currencydecimal'] = true, -- if true the money will display for 100$ -> $100,00 | if false it will display for 100$ -> $100

    -- Event Menu Command
    ['eventonlyconsole'] = true, -- Should only the Console (via TxAdmin) can add, delete or show events. When false admins who ingame can use this menu.

    -- Leave Message
    ['leavemessage'] = "☁️ | Vielen Dank fürs Spielen auf Cloud V RPG",

    -- Open Inventory
    ['open_inventory'] = function()

        TriggerEvent('inventory:open')

    end,

    -- Notify
    ['notify'] = function(message)

        TriggerEvent("sanity:notify", "MENU", message, 5000, "info")


    end,

    -- Invite Rewards
    ['RewardsAccount'] = "bank", -- [bank, money, black_money]
    ['invite_rewards'] = {

        [1] = { -- Reward at 1 Uses
            cash = 20000, -- Cash amount (0 is nothing)
            item_amount = 1, -- Amount of the Item (0 is nothing)
            item = "bread" -- Name of the Item
        },

        [2] = { 
            cash = 22500, 
            item_amount = 0,
            item = "" 
        },

        [3] = { 
            cash = 25000, 
            item_amount = 0,
            item = "" 
        }

   

    },

    -- Career Jobs Settings
    ['career_jobs'] = {

        police = { -- The Job name (not the label, the name column)
            logo = "https://i.ibb.co/YfgGDgT/output-onlinepngtools-2.png" -- IMPORTANT [210px x 210px]
        },

        ambulance = { 
            logo = "https://i.ibb.co/RQY90zt/output-onlinepngtools-3.png"
        },

    }



}


ViorityCore['locales'] = {

    -- ENG
    -- Invite System
    ['unknown_reward'] = "Unknown Reward!",
    ['success_invite_cash'] = "You Invited the Player %s<br><br> Your Reward is $%s",
    ['success_invite_item'] = "You Invited the Player %s<br><br> Your Reward is %sx %s",
    ['success_invite_cash_item'] = "You Invited the Player %s<br><br> Your Reward is $%s and %sx %s",
    ['success_invite_not_carry'] = "You Invited the Player %s<br><br> You can not carry your Reward! We will try it after the next login.",
    ['failed_reward'] = "You Invited the Player %s<br><br>You do not get a reward.",
    ['invite_highest_level'] = "You Invited the Player %s<br><br>You reached the highest reward level.",

    -- NUI


    -- DE
    -- -- Invite System
    ['unknown_reward'] = "Unbekannte Belohnung!",
    ['success_invite_cash'] = "Du hast den Spieler %s eingeladen<br><br> Deine Belohnung ist $%s",
    ['success_invite_item'] = "Du hast den Spieler %s eingeladen<br><br> Deine Belohnung ist %sx %s",
    ['success_invite_cash_item'] = "Du hast den Spieler %s eingeladen<br><br> Deine Belohnung ist $%s und %sx %s",
    ['success_invite_not_carry'] = "Du hast den Spieler %s eingeladen<br><br> Du kannst die Belohnung nicht halten! Wir werden es beim nächsten Login erneut versuchen.",
    ['failed_reward'] = "Du hast den Spieler %s eingeladen<br><br>Du bekommst keine Belohnung.",
    ['invite_highest_level'] = "Du hast den Spieler %s eingeladen<br><br>Du hast die höchstmögliche Belohnung erhalten.",

    -- -- NUI
    ['nui_events'] = "Events",
    ['nui_map'] = "Karte",

    ['nui_bills'] = "Rechnungen",
    ['nui_bills_not_found'] = "Nicht Gefunden",
    ['nui_bills_not_payed'] = "Unbezahlt",
    ['nui_bills_other'] = "Und %s andere Rechnungen...",

    ['nui_inventory'] = "Inventar",
    ['nui_inventory_underline'] = "Klicke um das Inventar zu öffnen",

    ['nui_settings'] = "Settings",
    ['nui_settings_underline'] = "Öffne die Settings",

    ['nui_career'] = "Meine Karriere",
    ['nui_career_underline'] = "Dein aktueller Beruf",
    ['nui_career_underline_2'] = "Du bist derzeit",
    ['nui_career_employed'] = "Eingestellt",
    ['nui_career_unemployed'] = "Arbeitslos",
    ['nui_career_since'] = "Seit ",

    ['nui_calculator'] = "Rechner",
    ['nui_calculator_underline'] = "Das schnellste Gehirn",
    ['nui_calculator_underline_2'] = "Was ist 100 x 10?",

    ['nui_invite'] = "Freunde Einladen",
    ['nui_invite_underline'] = "Und Belohnungen erhalten",
    ['nui_invite_underline_2'] = "Hol dir deinen Einladungscode!",
    ['nui_invite_your_code'] = "Dein Code:",
    ['nui_invite_last_reedem'] = "Letzte Person:",
    ['nui_invite_next_reedem'] = "Deine nächste Belohnung:",

    ['nui_welcome_back'] = "Welcome Back,",
    ['nui_character_button'] = "Charakter Statistiken",
    ['nui_character_underline'] = "Alle Angaben basieren auf Schätzungen!",

}