
# Callback to get Lifeinvader Ads

ESX.TriggerServerCallback("ws_lifeinvader:getData", function(data)
    for _, ad in pairs(data) do 
        print("name => ", ad.name)
        print("text => ", ad.text)
    end
end)



# Get Lifeinvader Ads (ServerSide)

local entrys = exports["ws_lifeinvader-v2"]:getEntrys()

for _, ad in pairs(entrys) do 
    print("name => ", ad.name)
    print("text => ", ad.text)
end



# Create a Lifeinvader Entry

TriggerServerEvent("ws_lifeinvader:sendAd", anonym, text)

> anonym
true / false

> text
string



# Refresh Lifeinvader UI Entrys (automatic on ad creation / open)

TriggerEvent("ws_lifeinvader:refreshLifeinvaderMessage")
TriggerClientEvent("ws_lifeinvader:refreshLifeinvaderMessage", source)



# Get Cooldown State (ServerSide)

exports["ws_lifeinvader-v2"]:getCooldown(source)

> true / false