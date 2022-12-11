fx_version 'adamant'
game 'gta5'

author 'Viority Development'
description 'https://discord.gg/323HfHyGW4/'
version '1.0.5'

client_scripts {
    'settings/ViorityCore.lua',
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

ui_page 'nui/index.html'

files {
    'nui/*.html',
    'nui/*.css',
    'nui/*.js',
    'nui/assets/fonts/*.ttf',
    'nui/assets/img/*.png',
    'nui/assets/img/icons/*.png',
    'nui/assets/img/glow/*.png',
    'nui/assets/sounds/*.mp3'
}
