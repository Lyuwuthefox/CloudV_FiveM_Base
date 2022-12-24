fx_version 'bodacious'
game 'gta5'

description '#1 Phone on FiveM'
author 'Nova'

server_script 'server/index.js'
client_scripts {
    'client/config.lua',
    'client/client.lua'
}

ui_page 'html/index.html'
files {
    'html/index.html',
    'html/favicon.ico',
    'html/fonts/*.ttf',
    'html/img/*.png',
    'html/img/*.svg',
    'html/js/*.js',
    'html/media/*.ogg',
    'html/media/*.mp3',
}