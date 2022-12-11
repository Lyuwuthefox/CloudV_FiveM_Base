ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('bc_shops:buyLicense', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getMoney() >= Config.WeaponLicensePrice then
		xPlayer.removeMoney(Config.WeaponLicensePrice)

		TriggerEvent('esx_license:addLicense', source, 'weapon', function()
			cb(true)
		end)
	else
        TriggerEvent("sanity:notify", "SHOPSYSTEM", "Du besitzt nicht genügend Geld!", 5000, "error")
		cb(false)
	end
end)

RegisterNetEvent("bc_shops:buyItem", function(shopType, item, category, amount, itemType, payment)
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer then 
        local price = CaculatePrice(item, amount, shopType, category)

        if price == 0 then 
            return
        end

        if shopType == "blackmarket" then 
            if xPlayer.getAccount('black_money').money >= price then 
                if itemType == "item" then 
                    xPlayer.removeAccountMoney('black_money', price)

                    xPlayer.addInventoryItem(item, amount)
                elseif itemType == "weapon" then 
                    local weapon_assaultrifle = GetResourceKvpInt('weapon_assaultrifle')
                    local weapon_advancedrifle = GetResourceKvpInt('weapon_advancedrifle')

                    if item == "weapon_assaultrifle" then 
                        if not xPlayer.hasWeapon("weapon_assaultrifle") then 
                            if weapon_assaultrifle >= 1 then 
                                xPlayer.removeAccountMoney('black_money', price)

                                SetResourceKvpInt('weapon_assaultrifle', (weapon_assaultrifle - 1))
    
                                xPlayer.addWeapon("weapon_assaultrifle")
                            else
                                TriggerEvent("sanity:notify", "SHOPSYSTEM", "Es sind nicht genügend Waffen auf Lager!", 5000, "error")
                                return
                            end
                        else
                            return
                        end
                    elseif item == "weapon_advancedrifle" then
                        if not xPlayer.hasWeapon("weapon_advancedrifle") then 
                            if weapon_advancedrifle >= 1 then 
                                xPlayer.removeAccountMoney('black_money', price)

                                SetResourceKvpInt('weapon_advancedrifle', (weapon_advancedrifle - 1))
        
                                xPlayer.addWeapon("weapon_advancedrifle")
                            else
                                TriggerEvent("sanity:notify", "SHOPSYSTEM", "Es sind nicht genügend Waffen auf Lager!", 5000, "error")
                                return
                            end
                            
                        else
                            return
                        end
                    else
                        if not xPlayer.hasWeapon(item) then 
                            xPlayer.removeAccountMoney('black_money', price)
    
                            xPlayer.addWeapon(item)
                        else
                            return
                        end
                    end

                    
                end

                TriggerEvent("sanity:notify", "SHOPSYSTEM", 'Erfolgreich', '+' .. amount .. " " .. item, 5000, "success")

                TriggerEvent("sanity:notify", "SHOPSYSTEM", "Du besitzt nicht genügend Geld!", 5000, "error")
            end 
            
            return 
        end

        if payment == "money" then 
            if xPlayer.getMoney() >= price then 
                if itemType == "item" then 
                    xPlayer.addInventoryItem(item, amount)
                    xPlayer.removeMoney(price)
                elseif itemType == "weapon" then 
                    if not xPlayer.hasWeapon(item) then 
                        xPlayer.addWeapon(item)
                        xPlayer.removeMoney(price)
                    end
                end

                
                TriggerEvent("sanity:notify", "SHOPSYSTEM", 'Erfolgreich', '+' .. amount .. " " .. item, 5000, "success")
            else
                TriggerEvent("sanity:notify", "SHOPSYSTEM", "Du besitzt nicht genügend Geld!", 5000, "error")
            end
        elseif payment == "bank" then 
            if xPlayer.getAccount('bank').money >= price then 
                if itemType == "item" then 
                    xPlayer.addInventoryItem(item, amount)
                    xPlayer.removeAccountMoney('bank', price)

                elseif itemType == "weapon" then 
                    if not xPlayer.hasWeapon(item) then 
                        xPlayer.addWeapon(item)
                        xPlayer.removeAccountMoney('bank', price)
                    end
                end


                TriggerEvent("sanity:notify", "SHOPSYSTEM", 'Erfolgreich', '+' .. amount .. " " .. item, 5000, "success")
            else
                TriggerEvent("sanity:notify", "SHOPSYSTEM", "Du besitzt nicht genügend Geld!", 5000, "error")
            end
        end
    end
end)

function CaculatePrice(name, amount, shopType, category)
    local price = 0

    for k,v in pairs(Config.Items[shopType][category]) do 
        if name == v.name then 
            price = price + (amount * v.price)
        end
    end

    return price
end

function CronTask(d, h, m)
    if d == 7 then
        SetResourceKvpInt('weapon_assaultrifle', 7)
        SetResourceKvpInt('weapon_advancedrifle', 7)
    end
end

TriggerEvent('cron:runAt', 0, 0, CronTask)