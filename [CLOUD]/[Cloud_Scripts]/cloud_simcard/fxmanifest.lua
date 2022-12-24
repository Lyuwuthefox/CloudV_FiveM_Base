fx_version 'cerulean'
game 'gta5'

author 'RoadToSix'
description 'RoadPhone SimCard DLC'
version '1.0.0'

lua54 'yes'

client_scripts {
    'config.lua',
    'client/client.lua'
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'config.lua',
    'server/server.lua'
}

escrow_ignore {
    'config.lua',
    'server/server.lua',
    'client/client.lua'
}


dependency '/assetpacks'