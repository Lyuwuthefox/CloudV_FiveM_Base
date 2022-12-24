if Config.qbSettings.enabled then
    if Config.qbSettings.useNewQBExport then
        QBCore = exports['qb-core']:GetCoreObject()
    end

    local deadPlayers = {}

    local deadInfo = {}

    Citizen.CreateThread(function()
        Citizen.Wait(1000)
        while true do
            RefreshDeadPlayers()
            Citizen.Wait(Config.qbSettings.deadPlayerRefreshTime)
        end
    end)

    function RefreshDeadPlayers()
        local players = GetPlayers()
        local newDead = {}
        for k, player in pairs(players) do
            local Player = QBCore.Functions.GetPlayer(tonumber(player))

            if Player and Player.PlayerData and Player.PlayerData.metadata then
                if Player.PlayerData.metadata["isdead"] or Player.PlayerData.metadata["inlaststand"] then
                    table.insert(newDead, tonumber(player))
                end
            end
        end

        deadPlayers = newDead
        TriggerClientEvent('kq_detective:syncDeadPlayers', -1, deadPlayers)
    end

    RegisterServerEvent('kq_detective:savePlayerInfo')
    AddEventHandler('kq_detective:savePlayerInfo', function(sourceOfDeath, cause, bone)
        deadInfo[source] = {
            timeOfDeath = GetGameTimer(),
            source = sourceOfDeath,
            cause = cause,
            bone = bone,
        }

        RefreshDeadPlayers()
    end)

    AddEventHandler('txAdmin:events:healedPlayer', function()
        RefreshDeadPlayers()
    end)

    AddEventHandler('hospital:server:RevivePlayer', function()
        RefreshDeadPlayers()
    end)

    RegisterServerEvent('kq_detective:getPlayerInfo')
    AddEventHandler('kq_detective:getPlayerInfo', function(playerId, ped)
        if deadInfo[playerId] then
            deadInfo[playerId].sinceDeath =  GetGameTimer() - deadInfo[playerId].timeOfDeath
            TriggerClientEvent('kq_detective:investigatePlayer', source, deadInfo[playerId], ped)
        end
    end)
end

