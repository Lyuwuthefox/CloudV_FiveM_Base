WS = {}

WS.wsHelpNotify = false

WS.esx = {
    prefix = "esx",
    sharedObject = {
        event = "esx:getSharedObject",
        export = { 
            use = true,
            get = function()
                return exports["es_extended"]:getSharedObject()
            end
        }
    }
}

WS.position = vector3(-1081.75, -248.05, 37.76)
WS.cooldown = 5 -- in min
WS.maxLetterCount = 100
WS.pricePerLetter = 5
WS.moneySymbol = "$"

WS.server = { -- edit the ui logo and headlines
    title = "LifeInvader",
    subTitle = "Werbung",
    logoUrl = "assets/images/logo.png"
}

WS.language = {
    helpNotify = "~INPUT_CONTEXT~ um zu interagieren",
    noTextProvided = "Du hast keine Nachricht angegeben",
    blacklistedStringMsg = "Deine Nachricht enthält unerlaubte Zeichen",
    cooldownActive = "Derzeit ist ein Cooldown aktiv",
    notEnaughMoney = "Du hast nicht genug Geld (%s)",
    paid = "Du bezahlst %s$",
    paidLetters = "Du bezahlst %s$ für %s Zeichen",
    messageToLong = "Deine Nachricht ist zu lang (max. %s Zeichen)",
    globalMessageTitle = "Lifeinvader",
    globalMessageSubtitle = "neue Werbung von %s",
    numberCopyed = "Die Telefonnummer wurde in deine Zwischenablage kopiert"
}

WS.marker = {
    typ = 21,
    move = false,
    rotate = true,
    enabled = true,
    drawDistance = 50,
    color = {
        r = 9,
        g = 164,
        b = 241,
        t = 140
    },
    size = {
        x = 1.0,
        y = 1.0,
        z = 1.0
    }
}

WS.blip = {
    enabled = true,
    sprite = 77,
    display = 4,
    scale = 1.0,
    color = 75,
    shortrange = true,
    text = "Lifeinvader"
}

function Notify(msg)
    TriggerEvent("b_notify", "info", "Information", msg, 5000)
end

function HelpNotify(msg)
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end