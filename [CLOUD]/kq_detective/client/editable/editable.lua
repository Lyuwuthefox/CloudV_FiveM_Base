-- This function is responsible for drawing all the 3d texts ('Press [E] to prepare for an engine swap' e.g)
function Draw3DText(x, y, z, textInput, fontId, scaleX, scaleY)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, true)
    local scale = (1 / dist) * 20
    local fov = (1 / GetGameplayCamFov()) * 100
    scale = scale * fov
    SetTextScale(scaleX * scale, scaleY * scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextDropshadow(1, 1, 1, 1, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end


function IsDead(ped)
    if IsEntityDead(ped, 1) or Entity(ped).state.dead then
        return true
    end
    
    if Config.deadAnimations.enabled then
        for k, anim in pairs(Config.deadAnimations.animations) do
            if IsEntityPlayingAnim(ped, anim.dict, anim.anim, 3) then
                return true
            end
        end
    end
    
    if IsPedAPlayer(ped) then
        if Config.qbSettings.enabled then
            local players = GetActivePlayers()
            for k, player in pairs(players) do
                local playerPed = GetPlayerPed(player)
                
                if ped == playerPed then
                    local networkPlayer = GetPlayerServerId(player)
                    return Contains(deadPlayers, networkPlayer)
                end
            end
        end
    end
    
    return false
end
