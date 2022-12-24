function sendWebhook(webhook, msg)
  if msg == nil or msg == '' or not Config.WebhookSettings.Settings.Enabled then
    print('[Cloud-V] Webhook wurde nicht gesendet! (Da die Nachricht leer war oder die Webhook Einstellungen deaktiviert sind)')
    return
  end

  local embed = {
    {
      color = Config.WebhookSettings.Color,
      title = Config.WebhookSettings.Title,
      description = msg,
      thumbnail = {
        url = Config.WebhookSettings.Logo
      },
      footer = {
        text = Config.WebhookSettings.Footer,
        icon_url = Config.WebhookSettings.Logo
      },
    }
  }

  PerformHttpRequest(webhook, function(err, text, headers) end, 'POST',
    json.encode({ username = Config.WebhookSettings.Username, embeds = embed, avatar_url = Config.WebhookSettings.Logo })
    , { ['Content-Type'] = 'application/json' })
end

ESX.RegisterServerCallback('aysa_personalmenu:server:getData', function(src, cb)
  local xPlayer = ESX.GetPlayerFromId(src)
  local data = {
    money = xPlayer.getMoney() or 0,
    bank = xPlayer.getAccount('bank').money or 0,
    dirty = xPlayer.getAccount('black_money').money or 0,
  }

  cb(data)
end)

ESX.RegisterServerCallback('aysa_personalmenu:server:giveDirty', function(src, cb, player, amount)
  local xPlayer = ESX.GetPlayerFromId(src)
  local xPlayer2 = ESX.GetPlayerFromId(player)

  if xPlayer.getAccount('black_money').money >= amount then
    xPlayer.removeAccountMoney('black_money', amount)
    xPlayer2.addAccountMoney('black_money', amount)
    TriggerClientEvent('esx:showNotification', player,
      xPlayer.getName() .. ' hat dir ' .. amount .. ' ~g~$ Schwarzgeld gegeben')

    sendWebhook(Config.Webhooks.MoneyLogs,
      '**Money Transfer [Dirty Money]**\n' ..
      '**From:** ' ..
      xPlayer.getName() ..
      ' (' ..
      xPlayer.identifier ..
      ')\n' .. '**To:** ' .. xPlayer2.getName() .. ' (' .. xPlayer2.identifier .. ')\n' ..
      '**Amount:** ' .. amount .. '$'
    );

    cb(true)
  else
    print('not enough money')
    cb(false)
  end
end)

ESX.RegisterServerCallback('aysa_personalmenu:server:throwDirty', function(src, cb, amount)
  local xPlayer = ESX.GetPlayerFromId(src)

  if xPlayer.getAccount('black_money').money >= amount then
    xPlayer.removeAccountMoney('black_money', amount)

    sendWebhook(Config.Webhooks.MoneyLogs,
      '**Money dropped [Dirty Money]**\n' ..
      '**From:** ' ..
      xPlayer.getName() ..
      '\n**Amount:** ' .. amount .. '$'
    );


    cb(true)
  else
    print('not enough money')
    cb(false)
  end
end)

ESX.RegisterServerCallback('aysa_personalmenu:server:giveCar', function(src, cb, target, vehicleProps)
  local xPlayer = ESX.GetPlayerFromId(src)
  local xTarget = ESX.GetPlayerFromId(target)
  local result = MySQL.query.await('SELECT * FROM owned_vehicles WHERE owner = ? AND plate = ?',
    { xPlayer.identifier, vehicleProps.plate })

  if not result then
    cb('not_owned')
    return
  end

  local update = MySQL.query.await('UPDATE owned_vehicles SET owner = ? WHERE owner = ? AND plate = ?',
    { xTarget.identifier, xPlayer.identifier, vehicleProps.plate })

  if update then
    sendWebhook(Config.Webhooks.CarLogs,
      '**Car Transfer**\n' ..
      '**From:** ' ..
      xPlayer.getName() ..
      ' (' ..
      xPlayer.identifier ..
      ')\n' .. '**To:** ' .. xTarget.getName() .. ' (' .. xTarget.identifier .. ')\n' ..
      '**Plate:** ``' .. vehicleProps.plate .. '``' 
    );

    TriggerClientEvent('esx:showNotification', target, xPlayer.getName() .. ' hat dir ein Fahrzeug gegeben!')
    cb(true)
  else
    cb(false)
  end
end)

ESX.RegisterServerCallback('aysa_personalmenu:server:giveBilling', function(src, cb, target, reason, amount)
  local xPlayer = ESX.GetPlayerFromId(src)
  local xTarget = ESX.GetPlayerFromId(target)

  local query = MySQL.query.await('INSERT INTO billing (identifier, sender, target_type, target, label, amount) VALUES (?, ?, ?, ?, ?, ?)'
    , { xTarget.identifier, xPlayer.identifier, 'player', xPlayer.identifier, reason, amount })

  print(GetPlayerName(src) .. ' -> ' .. GetPlayerName(target))
  print(xPlayer.getName() ..
    ' has given ' .. xTarget.getName() .. ' a bill for ' .. amount .. ' with the reason: ' .. reason)

  if query then
    TriggerClientEvent('esx:showNotification', target,
      xPlayer.getName() .. ' hat dir eine Rechnung für ' .. amount .. '$ mit dem Grund: ' .. reason .. ' gegeben!')
    cb(true)
  else
    cb(false)
  end
end)

ESX.RegisterServerCallback('aysa_personalmenu:server:giveMoney', function(src, cb, target, amount)
  local xPlayer = ESX.GetPlayerFromId(src)
  local xTarget = ESX.GetPlayerFromId(target)

  if xPlayer.getMoney() >= amount then
    xPlayer.removeMoney(amount)
    xTarget.addMoney(amount)

    TriggerClientEvent('esx:showNotification', target, xPlayer.getName() .. ' hat dir ' .. amount .. '$ gegeben!')
    sendWebhook(Config.Webhooks.MoneyLogs,
      '**Money Transfer [Cash]**\n' ..
      '**From:** ' ..
      xPlayer.getName() ..
      ' (' ..
      xPlayer.identifier ..
      ')\n' .. '**To:** ' .. xTarget.getName() .. ' (' .. xTarget.identifier .. ')\n' .. '**Amount:** ' .. amount .. '$');
    cb(true)
  else
    print('not enough money')
    cb(false)
  end
end)

RegisterCommand('getip', function(source, args, raw)
  if args[1] ~= nil then
    print(GetPlayerEndpoint(tonumber(args[1])))
  end
end)
