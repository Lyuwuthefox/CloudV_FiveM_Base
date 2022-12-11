local ESX = exports['es_extended']:getSharedObject()

function getLicense(source)
  local license = false

  for k,v in pairs(GetPlayerIdentifiers(source))do
      if string.sub(v, 1, string.len("license:")) == "license:" then
        license = string.gsub(v, "license:", "")
      end
  end

  return license
end

function formatTime(days, hours, minutes) 
    local locales = {
        ['days'] = 'Tag',
        ['hours'] = 'Stunde',
        ['minutes'] = 'Minute',
    }

    if days > 1 then
        locales['days'] = 'Tage'
    end

    if hours > 1 then
        locales['hours'] = 'Stunden'
    end

    if minutes > 1 or minutes == 0 then
        locales['minutes'] = 'Minuten'
    end


    if days > 0 then
        return string.format('%s %s %s %s %s %s', days, locales['days'], hours, locales['hours'], minutes, locales['minutes'])
    elseif hours > 0 then
        return string.format('%s %s %s %s', hours, locales['hours'], minutes, locales['minutes'])
    else
        return string.format('%s %s', minutes, locales['minutes'])
    end
end

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

function convertMinutes(min)
    local days = math.floor(min / 1440)
    local hours = math.floor((min - (days * 1440)) / 60)
    local minutes = math.floor(min - (days * 1440) - (hours * 60))
    return days, hours, minutes 
end

AddEventHandler('playerConnecting', function(_, _, deferrals)
  local source = source;
  local player = getLicense(source)

  if not player then
    return deferrals.done('You are not connected to Steam.');
  end

  local playTime = exports['devine_playtime']:getPlayTime(tonumber(source))
  local formattedPlaytime = formatTime(convertMinutes(playTime))
  local user = MySQL.prepare.await('SELECT * FROM users WHERE identifier = ?', { player });

  if not user then
    return deferrals.handover({
      display = false
    }); 
  end

  if user.accounts and user.accounts ~= '' then
    user.accounts = json.decode(user.accounts)
  end

  local job = ESX.Jobs[user.job];

  deferrals.handover({
    name = user.firstname .. ' ' .. user.lastname,
    job = firstToUpper(user.job) or 'Nicht gefunden',
    group = firstToUpper(user.group),
    money = formatMoney(user.accounts['money']),
    bank = formatMoney(user.accounts['bank']),
    playtime = formattedPlaytime,
    playercount = GetNumPlayerIndices() + 1,
  });
end);

function formatMoney(amount)
  local formatted = amount;
  while true do  
    formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1.%2');
    if (k==0) then
      break;
    end
  end
  return formatted .. '$';
end

function string.split(str, sep)
  local fields = {}
  local pattern = string.format("([^%s]+)", sep)
  str:gsub(pattern, function(c) fields[#fields+1] = c end)
  return fields
end