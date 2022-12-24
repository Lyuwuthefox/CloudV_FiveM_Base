if Config.useESX then
   
    
    RegisterNetEvent("roadphonesim:opensimcardmenu")
    AddEventHandler("roadphonesim:opensimcardmenu", function()


        openSimCardMenu()
        
    end)

    function openSimCardMenu()

        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'simcard_number', {
            title = Config.Locales.enter_newnumber
        }, function(data, menu)
        
            local number = tonumber(data.value)
            
            if number == nil then
                ESX.ShowNotification(Config.Locales.invalid_amount)
            else
                menu.close()
                TriggerServerEvent('roadphonesim:changenumber', number)
            end
        end, function(data, menu)
            menu.close()
        end)
    end
elseif Config.useQBCore then

    

    RegisterNetEvent("roadphonesim:opensimcardmenu")
    AddEventHandler("roadphonesim:opensimcardmenu", function()


        openSimCardMenu()
        
    end)


    function openSimCardMenu()

        local simcard = exports['qb-input']:ShowInput({
            header = "SimCard",
            submitText = "Change Number",
            inputs = {
                {
                    text = "Number", -- text you want to be displayed as a place holder
                    name = "number", -- name of the input should be unique otherwise it might override
                    type = "number", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
                    isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
                    -- default = 1, -- Default number option, this is optional
                },
            },
        })

        if simcard ~= nil then
            TriggerServerEvent('roadphonesim:changenumber', tonumber(simcard.number))
        end
    end

end
    