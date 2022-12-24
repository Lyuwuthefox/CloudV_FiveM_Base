fx_version 'cerulean'
game 'gta5'

files {
    'html/*.*',
    'html/**/*.*',
    'html/**/**/*.*'
}

ui_page 'html/index.html'

shared_script 'config.lua'
server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'ss_config.lua',
    'server/server.lua'
}
client_script 'client/client.lua'

lua54 'yes'
escrow_ignore {
    'config.lua',
    'ss_config.lua'
}
dependency '/assetpacks'