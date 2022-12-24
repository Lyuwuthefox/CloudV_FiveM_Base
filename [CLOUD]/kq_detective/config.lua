Config = {}

Config.debug = false


--- SETTINGS FOR ESX
Config.esxSettings = {
    enabled = true,
    -- Whether or not to use the new ESX export method
    useNewESXExport = true
}

--- SETTINGS FOR QBCORE
Config.qbSettings = {
    enabled = false,
    useNewQBExport = true, -- Make sure to uncomment the old export inside fxmanifest.lua if you're still using it
    -- Time between each refresh of dead players (in ms)
    deadPlayerRefreshTime = 15000,
}


-- Set a whitelist to only allow specific jobs to use the detective tools
Config.whitelist = {
    enabled = true,
    jobs = {
        'police',
        'ambulance',
    }
}

Config.target = {
    enabled = false,
    system = 'qtarget' -- 'qtarget' or 'qb-target'  (Other systems might work as well)
}

-- Keybinds
Config.keybinds = {
    investigate = 'E'
}


-- Animations used while investigating
Config.animation = {
    enabled = true,
    dict = 'amb@medic@standing@tendtodead@idle_a',
    anim = 'idle_a',
}

-- System to detect dead players based on their animation (for scripts such as qb-ambulance)
Config.deadAnimations = {
    enabled = true,
    animations = {
        {
            dict = 'misslamar1dead_body',
            anim = 'dead_idle',
        },
        {
            dict = 'veh@low@front_ps@idle_duck',
            anim = 'sit',
        },
        {
            dict = 'dead',
            anim = 'dead_a',
        },
    }
}
