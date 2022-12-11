WS_S = {}

WS_S.blacklistedString = true -- we recommend to keep this true
WS_S.blacklistedStringKick = false 
WS_S.blacklistedStrings = {
    "<", -- Anti XSS Injection
    ">", -- Anti XSS Injection
    -- u can also add blacklisted words under here
}

WS_S.discord = {
    servername = "Cloud V RPG",
    url = "https://cloudv.cc",
    icon = "https://tobias.isfucking.pro/4zzE5A.png",
    color = "3447003",
    username = "Cloud × Lifeinvader",
    webhooks = { 
        public = "https://discord.com/api/webhooks/1039968583297536050/_qtHbU67MmJ0AEQA4RiZkVQnR9x8MZ_FbJfdm0W_NHRx0CG_hwkFulzMC3kj2glNdxtR",
        adminLogs = "https://discord.com/api/webhooks/1039969313597177888/m9IdYQGNxzMpcXAXpviSLaDUVxwMJcAqdy_RdlFWN2jhcGeEcooIIHnacPXXtMxQ_LWd"
    }
}

function GetPlayerData(source, xPlayer, cb)
    Query('SELECT firstname, lastname, phone_number FROM users WHERE identifier = @identifier', { 
        ['@identifier'] = xPlayer.identifier 
    }, function(result)
        if result and result[1] then 
            cb({ 
                name = result[1].firstname .. " " .. result[1].lastname, 
                phone = result[1].phone_number 
            })
        end
    end)
end