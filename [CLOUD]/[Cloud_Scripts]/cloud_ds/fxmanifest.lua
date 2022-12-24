fx_version 'adamant'
game 'gta5'

author 'btwlouis <info@b-service.xyz>'
version '1.0.0'
description 'ESX based deathscreen with Custom UI'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'config/clientconfig.lua',
	'config/serverconfig.lua',
	'server/main.lua'
}

client_scripts {
	'config/clientconfig.lua',
	'client/main.lua'
}

ui_page 'html/ui.html'

files {
	'html/ui.html',
	'html/*.*',
}

lua54 'yes'

escrow_ignore {
	'config/clientconfig.lua',
	'config/serverconfig.lua',
}
dependency '/assetpacks'