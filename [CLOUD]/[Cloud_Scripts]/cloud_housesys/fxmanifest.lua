fx_version 'adamant'
game 'gta5'

client_scripts {
    'config/config.lua',
    'client/client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'config/config.lua',
    'server/*.lua'
}

ui_page 'html/index.html'
files {
    'html/index.html',
    'html/assets/css/*.*',
    'html/assets/fonts/montserrat/*.*',
    'html/assets/images/*.*',
    'html/assets/js/script.js',
}