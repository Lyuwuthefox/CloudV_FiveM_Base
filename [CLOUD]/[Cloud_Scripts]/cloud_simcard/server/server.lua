function changeNumber(identifier, newnumber, cb)

    MySQL.update("UPDATE " .. Config.UserTable .. ' SET phone_number = ? WHERE ' .. Config.IdentifierTable ..
                           ' = ?', {newnumber, identifier}, function(affectedRows)

        if affectedRows then
            cb(true)
        end

    end)

end

function checkNumberExists(number)

    local number2 = MySQL.scalar.await("SELECT phone_number FROM " .. Config.UserTable .. ' WHERE phone_number = ?',
        {number})

        if number2 == nil then
            return false
        else
            return true
        end

    return nil
end

if Config.useESX then

    ESX.RegisterUsableItem(Config.SimCardItem, function(source)
        TriggerClientEvent('roadphonesim:opensimcardmenu', source)
    end)

    RegisterServerEvent("roadphonesim:changenumber")
    AddEventHandler("roadphonesim:changenumber", function(number)

        local _source = source

        local xPlayer = ESX.GetPlayerFromId(_source)

        if xPlayer then

            if tonumber(number) then
                if number >= Config.minnumber then
                    if number < Config.maxnumber then

                        if checkNumberExists(number) == false then

                            changeNumber(xPlayer.identifier, number, function(cb)

                                if cb then
                                    TriggerEvent("roadphone:playerLoad", _source)
                                    xPlayer.removeInventoryItem(Config.SimCardItem, 1)
                                    TriggerClientEvent('esx:showNotification', _source, Config.Locales.number_changed)
                                    return
                                end
                            end)
                        else
                            TriggerClientEvent('esx:showNotification', _source, Config.Locales.number_exists)
                            return
                        end
                    else
                        TriggerClientEvent('esx:showNotification', _source, Config.Locales.number_must_between)
                        return
                    end
                else
                    TriggerClientEvent('esx:showNotification', _source, Config.Locales.number_must_between)
                    return
                end
            else
                TriggerClientEvent('esx:showNotification', _source, Config.Locales.number_consist_numers)
                return
            end

        end

    end)
elseif Config.useQBCore then

    QBCore.Functions.CreateUseableItem(Config.SimCardItem, function(source)
        TriggerClientEvent('roadphonesim:opensimcardmenu', source)
    end)

    RegisterServerEvent("roadphonesim:changenumber")
    AddEventHandler("roadphonesim:changenumber", function(number)

        local _source = source

        local xPlayer = QBCore.Functions.GetPlayer(_source)

        if xPlayer then

            if tonumber(number) then
                if number >= Config.minnumber then
                    if number < Config.maxnumber then

                        if checkNumberExists(number) == false then

                            changeNumber(xPlayer.PlayerData.citizenid, number, function(cb)

                                if cb then
                                    TriggerEvent("roadphone:playerLoad", _source)
                                    xPlayer.Functions.RemoveItem(Config.SimCardItem, 1)
                                    TriggerClientEvent('QBCore:Notify', _source, Config.Locales.number_changed, 'success')
                                    return
                                end
                            end)
                        else
                            TriggerClientEvent('QBCore:Notify', _source, Config.Locales.number_exists, 'error')
                            return
                        end
                    else
                        TriggerClientEvent('QBCore:Notify', _source, Config.Locales.number_must_between, 'error')
                        return
                    end
                else
                    TriggerClientEvent('QBCore:Notify', _source, Config.Locales.number_must_between, 'error')
                    return
                end
            else
                TriggerClientEvent('QBCore:Notify', _source, Config.Locales.number_consist_numers, 'error')
                return
            end

        end

    end)
end
    
