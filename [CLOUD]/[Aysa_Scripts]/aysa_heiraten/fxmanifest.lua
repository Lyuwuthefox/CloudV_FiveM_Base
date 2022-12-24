fx_version 'cerulean'
game 'gta5'

name "zero-marry"
description "Marry Script"
author "Arif"
version "1.0.0"

shared_scripts {
	'shared/*.lua'
}

client_scripts {
	'client/*.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua',
}
