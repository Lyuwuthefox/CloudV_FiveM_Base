fx_version 'adamant'
game 'gta5'

author 'Viority Development'
description 'https://discord.gg/323HfHyGW4/'
version '1.0.0'
lua54 'yes'

ui_page 'nui/index.html'

client_scripts {
    'client/functions.lua',
    'client/main.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'settings/ViorityCore.lua',
    'server/functions.lua',
    'server/auth.lua',
    'server/main.lua'
}

exports {
	'GetFuel',
	'SetFuel'
}

files {
    'nui/*.**',
    'nui/**/*.**'
}