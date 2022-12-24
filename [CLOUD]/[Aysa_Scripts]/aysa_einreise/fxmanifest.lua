fx_version 'cerulean'
game 'gta5'

shared_script 'config.lua'

client_scripts {
    '@aysa_poly/polyzones/client.lua',
    '@aysa_poly/polyzones/BoxZone.lua',
    '@aysa_poly/polyzones/EntityZone.lua',
    '@aysa_poly/polyzones/CircleZone.lua',
    '@aysa_poly/polyzones/ComboZone.lua',
    'client/client.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
    'server/server.lua'
}