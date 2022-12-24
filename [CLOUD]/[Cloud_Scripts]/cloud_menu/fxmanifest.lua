fx_version 'adamant'
game 'gta5'

client_scripts {
    'config/config.lua',
    'client/client.lua'
}

server_scripts {
    'config/config.lua',
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua'
}

ui_page 'html/index.html'
files {
    'html/index.html',
    'html/**/*.*'
}