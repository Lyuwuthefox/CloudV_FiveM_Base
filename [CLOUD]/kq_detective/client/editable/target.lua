function AddPedToTargetting(ped)
    if (Config.target.enabled and Config.target.system) then

        local system = Config.target.system

        exports[system]:AddTargetEntity(ped, {
            options = {
                {
                    type = "client",
                    event = "kq_detective:investigate",
                    icon = "fas fa-user-injured",
                    label = L('Untersuchen'),
                    canInteract = function(entity)
                        return IsDead(entity)
                    end,
                },
            },
            distance = 1.75
        })
    end
end
