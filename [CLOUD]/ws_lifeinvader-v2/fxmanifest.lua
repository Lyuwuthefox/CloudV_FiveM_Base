fx_version 'adamant'
game 'gta5'

client_scripts {
    'config/cl_config.lua',
    'client/client.lua'
}

server_scripts {
    'config/cl_config.lua',
    'config/sv_config.lua',
    'server/server.lua',
}

ui_page "html/index.html"
files {
    'html/index.html',
    'html/assets/**/*.*',
    'html/assets/**/**/*.*'
}

server_export 'getEntrys'
server_export 'getCooldown'