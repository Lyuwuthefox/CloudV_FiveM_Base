B_SERVICE.ParkInAfterRestart = true 

B_SERVICE.ImpoundMoney = true
B_SERVICE.ImpoundMoneyAmount = 5000

B_SERVICE.Notify = function(source, color, title, message)
    if color == "red" then 
        color = "error"
    end

    if color == "green" then 
        color = "success"
    end
    
    TriggerClientEvent("sanity:notify",source, "GARAGE", message, 5000, color)
end