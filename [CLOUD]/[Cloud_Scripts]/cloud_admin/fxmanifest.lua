fx_version 'cerulean'

author 'C-Scripts | discord.gg/c-scripts'

game 'gta5'

client_scripts {
    'client/RageUI.lua',
    'client/main.lua'
}

shared_script 'configs/config.lua'

server_scripts {
    --'@oxmysql/lib/MySQL.lua', --If you use oxMySQL
    '@mysql-async/lib/MySQL.lua',
    'configs/server_config.lua',
    'server/main.lua'
}